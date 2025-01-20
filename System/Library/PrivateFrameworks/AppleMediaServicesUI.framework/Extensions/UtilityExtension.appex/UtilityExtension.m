uint64_t deviceIsRunningInternalBuild()
{
  return _os_variant_has_internal_content("com.apple.AppleMediaServicesUIDynamic");
}

uint64_t deviceIsRunningSeedBuild()
{
  return 0;
}

void sub_100003B34(id a1)
{
  v1 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v1 getActivePairedDevice];

  v2 = [v5 objectForKeyedSubscript:NRDevicePropertySystemVersion];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  v4 = (void *)qword_10005E558;
  qword_10005E558 = (uint64_t)v3;
}

id sub_100003E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  NSString v8 = a7;
  if (!a5)
  {
    NSString v10 = 0;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  NSString v10 = sub_100046110();
  if (v8) {
LABEL_3:
  }
    NSString v8 = sub_100046110();
LABEL_4:
  NSString v11 = sub_100046110();
  id v12 = objc_msgSend(v7, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v10, a3, v8, v11);

  return v12;
}

uint64_t sub_100003F08(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 isUndefined]) {
    return 0;
  }
  v4 = (void *)sub_1000462E0();
  uint64_t v5 = sub_1000462D0();
  uint64_t v7 = v6;

  if (!v7) {
    return 0;
  }
  NSString v8 = (void *)sub_1000462E0();
  int v9 = sub_1000462C0();

  if (v9 == 2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  BOOL v11 = v5 == 0x73656E755469 && v7 == 0xE600000000000000;
  if (v11
    || (sub_100004784() & 1) != 0
    || (v5 == 0x64756F6C4369 ? (BOOL v12 = v7 == 0xE600000000000000) : (BOOL v12 = 0),
        v12 || (sub_100004784() & 1) != 0 || (v5 == 1936548969 ? (BOOL v23 = v7 == 0xE400000000000000) : (BOOL v23 = 0), v23)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = sub_100004784();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      return 0;
    }
  }
  id v13 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  v14 = (void *)sub_1000462E0();
  sub_1000462D0();
  uint64_t v16 = v15;

  if (v16)
  {
    NSString v17 = sub_100046110();
    swift_bridgeObjectRelease();
    id v18 = [v13 numberFromString:v17];
  }
  else
  {
    id v18 = 0;
  }
  v19 = (void *)sub_1000462E0();
  sub_1000462D0();

  v20 = (void *)sub_1000462E0();
  sub_1000462D0();

  uint64_t v21 = sub_100004230();
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(a3 + 16))(v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

id sub_10000420C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_100003E3C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_100004230()
{
  return sub_100046140();
}

id variable initialization expression of AccountsWrapper.accessLock()
{
  id v0 = objc_allocWithZone((Class)NSLock);
  return [v0 init];
}

uint64_t sub_1000042B0()
{
  return sub_1000046E4(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000042E0()
{
  return sub_10000446C();
}

Swift::Int sub_1000042E8()
{
  return sub_10000960C();
}

uint64_t sub_1000042F0()
{
  return sub_1000046E4(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100004328@<X0>(void *a1@<X8>)
{
  NSString result = sub_1000046AC();
  *a1 = result;
  return result;
}

uint64_t sub_100004350()
{
  return sub_100009680();
}

uint64_t sub_10000435C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100046110();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000043A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000043D0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000043D4(uint64_t a1)
{
  uint64_t v2 = sub_10000453C((unint64_t *)&qword_10005C570);
  uint64_t v3 = sub_10000453C(&qword_10005C578);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000446C()
{
  sub_100046140();
  sub_1000461A0();
  return swift_bridgeObjectRelease();
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_1000044D4()
{
  return sub_10000453C(&qword_10005C558);
}

uint64_t sub_100004508()
{
  return sub_10000453C(&qword_10005C560);
}

uint64_t sub_10000453C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004580()
{
  return sub_10000453C(&qword_10005C568);
}

uint64_t sub_1000045B4(uint64_t a1, id *a2)
{
  uint64_t result = sub_100046120();
  *a2 = 0;
  return result;
}

uint64_t sub_10000462C(uint64_t a1, id *a2)
{
  char v3 = sub_100046130();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_1000046AC()
{
  sub_100046140();
  NSString v0 = sub_100046110();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000046E4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_100046140();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void type metadata accessor for AMSMediaTaskType(uint64_t a1)
{
}

void sub_100004738(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004784()
{
  return sub_1000465C0();
}

uint64_t _s16UtilityExtension20DynamicAccountsStoreC8_account33_DF41BC2C662334595DE06D536C7360A9LLSo9ACAccountCSgvpfi_0()
{
  return 0;
}

uint64_t sub_1000047A8()
{
  return sub_100004C28(v0, (SEL *)&selRef_username);
}

id sub_1000047CC()
{
  return objc_msgSend(v0, "ams_isiTunesAccount");
}

id sub_1000047F0()
{
  return objc_msgSend(v0, "ams_isiCloudAccount");
}

id sub_100004814()
{
  return objc_msgSend(v0, "ams_isIDMSAccount");
}

uint64_t sub_100004838()
{
  return sub_100004C28(v0, (SEL *)&selRef_ams_altDSID);
}

uint64_t sub_10000485C()
{
  return sub_100004C28(v0, (SEL *)&selRef_ams_creditsString);
}

id sub_100004880()
{
  id v1 = objc_msgSend(v0, "ams_DSID");
  return v1;
}

uint64_t sub_1000048B8()
{
  return sub_100004C28(v0, (SEL *)&selRef_ams_firstName);
}

uint64_t sub_1000048DC()
{
  return sub_100004C28(v0, (SEL *)&selRef_ams_lastName);
}

uint64_t sub_100004900()
{
  return sub_100004C28(v0, (SEL *)&selRef_ams_storefront);
}

uint64_t sub_100004924()
{
  id v1 = objc_msgSend(v0, "ams_isBundleOwner");
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 BOOLValue];

  return (uint64_t)v3;
}

id sub_100004980()
{
  return objc_msgSend(v0, "ams_isLocalAccount");
}

id sub_1000049A4()
{
  return objc_msgSend(v0, "ams_isSandboxAccount");
}

uint64_t sub_1000049C8()
{
  return sub_100004C88(v0);
}

unint64_t sub_1000049D0()
{
  return (unint64_t)sub_1000047CC() & 1;
}

unint64_t sub_1000049F8()
{
  return (unint64_t)sub_1000047F0() & 1;
}

unint64_t sub_100004A20()
{
  return (unint64_t)sub_100004814() & 1;
}

unint64_t sub_100004A48()
{
  return (unint64_t)sub_100004A70() & 1;
}

id sub_100004A70()
{
  return [v0 isActive];
}

uint64_t sub_100004A94()
{
  return sub_100004838();
}

uint64_t sub_100004AB8()
{
  return sub_10000485C();
}

id sub_100004ADC()
{
  return sub_100004880();
}

uint64_t sub_100004B00()
{
  return sub_1000048B8();
}

uint64_t sub_100004B24()
{
  return sub_1000048DC();
}

uint64_t sub_100004B48()
{
  return sub_100004900();
}

uint64_t sub_100004B6C()
{
  return sub_1000047A8();
}

uint64_t sub_100004B90()
{
  return sub_1000049C8();
}

uint64_t sub_100004BB4()
{
  return sub_100004924();
}

unint64_t sub_100004BD8()
{
  return (unint64_t)sub_100004980() & 1;
}

unint64_t sub_100004C00()
{
  return (unint64_t)sub_1000049A4() & 1;
}

uint64_t sub_100004C28(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_100046140();

  return v4;
}

uint64_t sub_100004C88(void *a1)
{
  id v1 = objc_msgSend(a1, "ams_privacyAcknowledgement");
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_100004CF8();
  uint64_t v3 = sub_1000460E0();

  return v3;
}

unint64_t sub_100004CF8()
{
  unint64_t result = qword_10005C588;
  if (!qword_10005C588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C588);
  }
  return result;
}

void *sub_100004D38(void *a1)
{
  id v2 = (void *)sub_1000462E0();
  uint64_t v3 = sub_1000056D0(v2);
  if (v3)
  {
    sub_100004DF8(v3);
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = (void *)sub_1000462E0();
  uint64_t v5 = sub_1000056D0(v4);
  if (v5)
  {
    uint64_t v6 = sub_100004F40(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void *sub_100004DF8(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  BOOL v12 = &_swiftEmptyArrayStorage;
  sub_100005204(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100005738(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100005204(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_100005204((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void *sub_100004F40(uint64_t a1)
{
  unint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1000464A0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_100005738(i, (uint64_t)v5);
    sub_100004CF8();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_100046480();
    sub_1000464B0();
    sub_1000464C0();
    sub_100046490();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void *sub_10000503C(uint64_t a1)
{
  return sub_10000507C(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_100005244, &qword_10005C5A0);
}

void *sub_10000505C(uint64_t a1)
{
  return sub_10000507C(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_100005274, &qword_10005C5B0);
}

void *sub_10000507C(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v14 = &_swiftEmptyArrayStorage;
  a2(0, v6, 0);
  uint64_t v7 = &_swiftEmptyArrayStorage;
  if (v6)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_100005738(i, (uint64_t)v13);
      sub_100005794(a3);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a2(0, v7[2] + 1, 1);
        uint64_t v7 = v14;
      }
      unint64_t v10 = v7[2];
      unint64_t v9 = v7[3];
      if (v10 >= v9 >> 1)
      {
        a2(v9 > 1, v10 + 1, 1);
        uint64_t v7 = v14;
      }
      v7[2] = v10 + 1;
      v7[v10 + 4] = v12;
      if (!--v6) {
        return v7;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

void *sub_1000051D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = sub_100004D38(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

char *sub_100005204(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000052A4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100005224(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000053A4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_100005244(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000054B4(a1, a2, a3, *v3, &qword_10005C5A8, &qword_10005C5A0);
  *uint64_t v3 = result;
  return result;
}

void *sub_100005274(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1000054B4(a1, a2, a3, *v3, &qword_10005C5B8, &qword_10005C5B0);
  *uint64_t v3 = result;
  return result;
}

char *sub_1000052A4(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005794(&qword_10005C590);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1000053A4(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005794(&qword_10005C598);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[24 * v8] <= v12) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1000054B4(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_100005794(a5);
    id v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 8);
  }
  else
  {
    id v13 = &_swiftEmptyArrayStorage;
  }
  if (v8)
  {
    if (v13 != a4 || &a4[v11 + 4] <= v13 + 4) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100005794(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_1000055D8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100005608(a1, a2, a3, (void (*)(void))&type metadata accessor for JSStack.Prerequisite);
}

uint64_t sub_1000055F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100005608(a1, a2, a3, (void (*)(void))type metadata accessor for JSSourceInfo);
}

uint64_t sub_100005608(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a3 < a1
    || (uint64_t result = ((uint64_t (*)(void))a4)(0), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_1000059B4();
    return _swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_1000059B4();
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  return result;
}

uint64_t sub_1000056D0(void *a1)
{
  id v2 = [a1 toArray];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1000461F0();

  return v3;
}

uint64_t sub_100005738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005794(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t destroy for AppQueryRequest()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16UtilityExtension15AppQueryRequestVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppQueryRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppQueryRequest(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for AppQueryRequest(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppQueryRequest(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppQueryRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppQueryRequest()
{
  return &type metadata for AppQueryRequest;
}

uint64_t sub_1000059B4()
{
  return v0;
}

id sub_1000059C8(void *a1, uint64_t a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_1000067B4(0, (unint64_t *)&unk_10005CD20);
    Class isa = sub_1000461E0().super.isa;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    size_t v14 = sub_100005C6C;
    uint64_t v15 = v7;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_1000060D8;
    id v13 = &unk_1000558F8;
    char v8 = _Block_copy(v12);
    swift_bridgeObjectRetain();
    swift_release();
    id v9 = [(objc_class *)isa ams_mapWithTransformIgnoresNil:v8];
    _Block_release(v8);

    uint64_t v10 = sub_1000461F0();
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    id v13 = (void *)sub_100005794(&qword_10005C5C8);
    v12[0] = v10;
    id v11 = a1;
    id result = sub_100026A70(v12, a1);
    if (result)
    {
      sub_1000462F0();
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100005B94(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_100005738(a1, (uint64_t)v5);
  sub_1000067B4(0, (unint64_t *)&unk_10005CD20);
  swift_dynamicCast();
  uint64_t v3 = sub_100005C74(v4);
  a2[3] = sub_100005794(&qword_10005C5A0);

  *a2 = v3;
}

uint64_t sub_100005C34()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005C6C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_100005C74(void *a1)
{
  sub_100005794(&qword_10005C5D0);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v33 - v5;
  sub_100005794(&qword_10005C5D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100047690;
  *(void *)(inited + 32) = 0x6449656C646E7562;
  *(void *)(inited + 40) = 0xE800000000000000;
  id v8 = [a1 bundleID];
  uint64_t v9 = sub_100046140();
  uint64_t v11 = v10;

  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v11;
  uint64_t v36 = sub_1000460F0();
  uint64_t v12 = sub_100004C28(a1, (SEL *)&selRef_bundleShortVersion);
  if (v13)
  {
    *((void *)&v35 + 1) = &type metadata for String;
    *(void *)&long long v34 = v12;
    *((void *)&v34 + 1) = v13;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_1000062F4((uint64_t)&v34, 0xD000000000000012, 0x8000000100049560);
  uint64_t v14 = sub_100004C28(a1, (SEL *)&selRef_bundleVersion);
  if (v15)
  {
    *((void *)&v35 + 1) = &type metadata for String;
    *(void *)&long long v34 = v14;
    *((void *)&v34 + 1) = v15;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_1000062F4((uint64_t)&v34, 0x6556656C646E7562, 0xED00006E6F697372);
  id v16 = [a1 installError];
  if (v16)
  {
    NSString v17 = v16;
    swift_getErrorValue();
    uint64_t v18 = sub_1000465F0();
    uint64_t v20 = v19;
    *((void *)&v35 + 1) = &type metadata for String;

    *(void *)&long long v34 = v18;
    *((void *)&v34 + 1) = v20;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_1000062F4((uint64_t)&v34, 0x456C6C6174736E69, 0xEC000000726F7272);
  id v21 = [a1 installID];
  if (v21)
  {
    uint64_t v22 = v21;
    sub_100045690();

    uint64_t v23 = sub_1000456B0();
    uint64_t v24 = (uint64_t)v4;
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v23 = sub_1000456B0();
    uint64_t v24 = (uint64_t)v4;
    uint64_t v25 = 1;
  }
  sub_1000066FC(v24, v25, 1, v23);
  sub_100006724((uint64_t)v4, (uint64_t)v6);
  sub_1000456B0();
  if (sub_10000678C((uint64_t)v6, 1, v23) == 1)
  {
    sub_1000067F0((uint64_t)v6, &qword_10005C5D0);
    long long v34 = 0u;
    long long v35 = 0u;
  }
  else
  {
    uint64_t v26 = sub_100045680();
    *((void *)&v35 + 1) = &type metadata for String;
    *(void *)&long long v34 = v26;
    *((void *)&v34 + 1) = v27;
    (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v6, v23);
  }
  sub_1000062F4((uint64_t)&v34, 0x496C6C6174736E69, 0xE900000000000044);
  unsigned __int8 v28 = [a1 isInstalled];
  *((void *)&v35 + 1) = &type metadata for Bool;
  LOBYTE(v34) = v28;
  sub_1000062F4((uint64_t)&v34, 0x6C6174736E497369, 0xEB0000000064656CLL);
  id v29 = [a1 storeItemID];
  *((void *)&v35 + 1) = &type metadata for Int64;
  *(void *)&long long v34 = v29;
  sub_1000062F4((uint64_t)&v34, 0x65744965726F7473, 0xEB0000000044496DLL);
  id v30 = [a1 storeFront];
  if (v30)
  {
    id v31 = v30;
    *((void *)&v35 + 1) = sub_1000067B4(0, (unint64_t *)&qword_10005C588);
    *(void *)&long long v34 = v31;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_1000062F4((uint64_t)&v34, 0x6F724665726F7473, 0xEA0000000000746ELL);
  return v36;
}

id sub_1000060D8(uint64_t a1, uint64_t a2)
{
  void (*v3)(void *__return_ptr, void *);
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void v11[3];
  uint64_t v12;
  void v13[4];
  uint64_t vars8;

  uint64_t v3 = *(void (**)(void *__return_ptr, void *))(a1 + 32);
  v13[3] = swift_getObjectType();
  v13[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v11, v13);
  swift_release();
  uint64_t v4 = v12;
  if (v12)
  {
    uint64_t v5 = sub_1000062B0(v11, v12);
    unint64_t v6 = *(void *)(v4 - 8);
    __chkstk_darwin(v5);
    id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    uint64_t v9 = (void *)sub_1000465B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v11);
  }
  else
  {
    uint64_t v9 = 0;
  }
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v13);
  return v9;
}

uint64_t sub_100006248(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006258()
{
  return swift_release();
}

uint64_t _s16UtilityExtension9JSAccountVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_1000062B0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000062F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000684C((_OWORD *)a1, v6);
    sub_1000064C0(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000067F0(a1, (uint64_t *)&unk_10005CCF0);
    sub_100006388(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1000067F0((uint64_t)v6, (uint64_t *)&unk_10005CCF0);
  }
}

double sub_100006388@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000091DC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100005794(&qword_10005C5E0);
    sub_1000464D0(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_10000684C((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_1000464E0();
    uint64_t *v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1000064C0(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_100006550(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_100006550(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000091DC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005794(&qword_10005C5E0);
  if (!sub_1000464D0(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000091DC(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_1000465E0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    id v21 = (_OWORD *)(v20[7] + 32 * v16);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v21);
    return sub_10000684C(a1, v21);
  }
  else
  {
    sub_100006690(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_100006690(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_10000684C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_1000066FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100006724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005C5D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000678C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_1000067B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000067F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005794(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_10000684C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000685C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  v24[0] = a1;
  uint64_t v11 = sub_100046350();
  sub_100006A9C();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  unint64_t v16 = (char *)v24 - v15;
  sub_100006A9C();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  id v21 = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a2, v11);
  if (sub_10000678C((uint64_t)v16, 1, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
    a6[3] = a3;
    a6[4] = a5;
    uint64_t v22 = sub_100006A38(a6);
    return (*(uint64_t (**)(uint64_t *, void, uint64_t))(*(void *)(a3 - 8) + 16))(v22, v24[1], a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, a4);
    sub_100045D50();
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, a4);
  }
}

uint64_t *sub_100006A38(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id sub_100006AB4()
{
  if (*v0)
  {
    id v1 = *v0;
    id result = [v1 accountStore];
    if (result)
    {
      sub_100046050();
      swift_allocObject();
      uint64_t v3 = sub_100046060();

      return (id)v3;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v4 = self;
    id v5 = objc_msgSend(v4, "ams_sharedAccountStoreForClient:", *(id *)((char *)v0 + *(int *)(type metadata accessor for BaseBootstrap() + 24)));
    sub_100046050();
    swift_allocObject();
    return (id)sub_100046060();
  }
  return result;
}

uint64_t sub_100006B90()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  uint64_t v3 = v2 - 8;
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v23 = *(void *)(v24 + 64);
  __chkstk_darwin(v2);
  uint64_t v22 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045C20();
  sub_100045C00();
  uint64_t v5 = v34;
  uint64_t v6 = v35;
  sub_1000062B0(v33, v34);
  uint64_t v7 = sub_1000067B4(0, (unint64_t *)&qword_10005C6E0);
  v31[0] = *v1;
  uint64_t v8 = (void *)v31[0];
  sub_10000685C(v7, (uint64_t)v31, v5, v7, v6, v32);
  sub_1000062B0(v32, v32[3]);
  sub_100046050();
  v30[0] = sub_100006AB4();
  sub_100045D50();
  swift_release();
  sub_1000062B0(v31, v31[3]);
  type metadata accessor for DynamicAccountsStore();
  id v9 = sub_100006AB4();
  swift_allocObject();
  id v10 = v8;
  v29[0] = DynamicAccountsStore.init(accountStore:account:)((uint64_t)v9, (uint64_t)v8);
  sub_100045D50();
  swift_release();
  sub_1000062B0(v30, v30[3]);
  sub_100045DD0();
  sub_100007EBC();
  sub_1000062B0(v29, v29[3]);
  sub_1000067B4(0, &qword_10005C6E8);
  v27[0] = *(void *)((char *)v1 + *(int *)(v3 + 32));
  uint64_t v11 = (void *)v27[0];
  sub_100007EBC();
  sub_1000062B0(v28, v28[3]);
  uint64_t v12 = (void *)((char *)v1 + *(int *)(v3 + 36));
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  v26[0] = v14;
  v26[1] = v13;
  sub_100045D50();
  sub_1000062B0(v27, v27[3]);
  sub_100045D60();
  sub_1000062B0(v26, v26[3]);
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  uint64_t v15 = v22;
  sub_100007590((uint64_t)v1, v22);
  unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  sub_10000770C(v15, v17 + v16);
  id v18 = v11;
  sub_100045D40();
  swift_release();
  sub_1000062B0(v25, v25[3]);
  uint64_t v19 = sub_100045D20();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v25);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v26);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v27);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v29);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v30);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v31);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v32);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v33);
  return v19;
}

uint64_t sub_100006FB0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v17 = a3;
  uint64_t v4 = sub_100045920();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100045DD0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  sub_100045C20();
  sub_100045DE0();
  uint64_t v12 = (void *)(a2 + *(int *)(type metadata accessor for BaseBootstrap() + 28));
  uint64_t v13 = v12[1];
  void *v7 = *v12;
  v7[1] = v13;
  v7[2] = 0;
  v7[3] = 0;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v4);
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100046230();
  (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *uint64_t v17 = v14;
  return result;
}

void *AccountsWrapper.account.getter()
{
  id v1 = *(void **)(v0 + 16);
  [v1 lock];
  uint64_t v2 = *(void **)(v0 + 24);
  id v3 = v2;
  [v1 unlock];
  return v2;
}

void AccountsWrapper.account.setter(void *a1)
{
  id v3 = *(void **)(v1 + 16);
  [v3 lock];
  uint64_t v4 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
  id v5 = a1;

  [v3 unlock];
}

void (*AccountsWrapper.account.modify(void **a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = AccountsWrapper.account.getter();
  return sub_1000072E0;
}

void sub_1000072E0(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    AccountsWrapper.account.setter(v2);
  }
  else
  {
    AccountsWrapper.account.setter(*a1);
  }
}

uint64_t DynamicAccountsStore.accountStore.getter()
{
  return swift_retain();
}

uint64_t DynamicAccountsStore.accountStore.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t (*DynamicAccountsStore.accountStore.modify())()
{
  return j__swift_endAccess;
}

uint64_t DynamicAccountsStore.__allocating_init(accountStore:account:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  DynamicAccountsStore.init(accountStore:account:)(a1, a2);
  return v4;
}

void *DynamicAccountsStore.init(accountStore:account:)(uint64_t a1, uint64_t a2)
{
  v2[2] = [objc_allocWithZone((Class)NSLock) init];
  v2[3] = a2;
  v2[4] = a1;
  return v2;
}

uint64_t DynamicAccountsStore.deinit()
{
  swift_release();
  return v0;
}

uint64_t DynamicAccountsStore.__deallocating_deinit()
{
  DynamicAccountsStore.deinit();
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for AccountsWrapper()
{
  return self;
}

uint64_t type metadata accessor for BaseBootstrap()
{
  uint64_t result = qword_10005C750;
  if (!qword_10005C750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100007590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000075F4()
{
  uint64_t v1 = (int *)(type metadata accessor for BaseBootstrap() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;

  uint64_t v6 = v0 + v3;
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10000770C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007770@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for BaseBootstrap() - 8);
  return sub_100006FB0(*(void *)(v1 + 16), v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

void **sub_1000077F0(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100045DD0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = *(void **)((char *)a2 + v14);
    *(void **)((char *)v7 + v14) = v16;
    uint64_t v17 = (void **)((char *)v7 + v15);
    id v18 = (void **)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    id v20 = v16;
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_100007908(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100045DD0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void **sub_1000079A4(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100045DD0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v15;
  uint64_t v16 = (void **)((char *)a1 + v14);
  uint64_t v17 = (void **)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  id v19 = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_100007A70(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100045DD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void **)((char *)a1 + v13) = v14;
  id v16 = v14;

  uint64_t v17 = a3[7];
  uint64_t v18 = (void **)((char *)a1 + v17);
  id v19 = (void **)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_100007B4C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100045DD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void **sub_100007BEC(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100045DD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)((char *)a1 + v11);
  *(void **)((char *)a1 + v11) = *(void **)((char *)a2 + v11);

  uint64_t v13 = a3[7];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100007CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007CC4);
}

uint64_t sub_100007CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100045DD0();
  sub_100007EA4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return sub_10000678C(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100007D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007D68);
}

void sub_100007D68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100045DD0();
  sub_100007EA4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    sub_1000066FC(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t sub_100007DF4()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100007EBC()
{
  return sub_100045D50();
}

void *DynamicAccountsStore.account.getter()
{
  sub_100045A20();
  __chkstk_darwin();
  sub_100008640();
  unint64_t v1 = *(void **)(v0 + 16);
  [v1 lock];
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v2 = sub_100045A70();
  sub_100008628(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047770;
  *((void *)&v19 + 1) = type metadata accessor for DynamicAccountsStore();
  *(void *)&long long v18 = v0;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100046140();
    uint64_t v7 = v6;

    sub_100045A10();
    sub_100008658();
    sub_1000062B0(&v18, *((uint64_t *)&v19 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v16[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v16);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_100045A00(v20);
    MetatypeMetadata = &type metadata for String;
    v16[0] = v5;
    v16[1] = v7;
    sub_1000459F0();
    sub_100008588((uint64_t)v16);
    v9._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    sub_100008658();
    sub_1000062B0(&v18, *((uint64_t *)&v19 + 1));
    uint64_t v10 = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v16[0] = v10;
    sub_1000459F0();
    sub_100008588((uint64_t)v16);
    v9._countAndFlagsBits = 58;
  }
  v9._object = (void *)0xE100000000000000;
  sub_100045A00(v9);
  sub_100045A30();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v18);
  *((void *)&v19 + 1) = &type metadata for UnsafeMutableRawPointer;
  *(void *)&long long v18 = v0;
  sub_100045A40();
  sub_100008588((uint64_t)&v18);
  sub_1000459D0();
  uint64_t v11 = *(void **)(v0 + 24);
  if (v11)
  {
    *((void *)&v19 + 1) = sub_1000085E8();
    *(void *)&long long v18 = v11;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  type metadata accessor for Log();
  id v12 = v11;
  sub_100045A40();
  sub_100008588((uint64_t)&v18);
  sub_100035610();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void **)(v0 + 24);
  id v14 = v13;
  [v1 unlock];
  return v13;
}

void DynamicAccountsStore.account.setter(void *a1)
{
  uint64_t v2 = v1;
  sub_100045A20();
  __chkstk_darwin();
  sub_100008640();
  uint64_t v4 = *(void **)(v1 + 16);
  [v4 lock];
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v5 = sub_100045A70();
  sub_100008628(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047770;
  *((void *)&v20 + 1) = type metadata accessor for DynamicAccountsStore();
  *(void *)&long long v19 = v1;
  swift_retain();
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100046140();
    uint64_t v10 = v9;

    sub_100045A10();
    sub_100008658();
    sub_1000062B0(&v19, *((uint64_t *)&v20 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v17);
    v21._countAndFlagsBits = 5972026;
    v21._object = (void *)0xE300000000000000;
    sub_100045A00(v21);
    MetatypeMetadata = &type metadata for String;
    v17[0] = v8;
    v17[1] = v10;
    sub_1000459F0();
    sub_100008588((uint64_t)v17);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    sub_100008658();
    sub_1000062B0(&v19, *((uint64_t *)&v20 + 1));
    uint64_t v13 = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = v13;
    sub_1000459F0();
    sub_100008588((uint64_t)v17);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_100045A00(v12);
  sub_100045A30();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v19);
  *((void *)&v20 + 1) = &type metadata for UnsafeMutableRawPointer;
  *(void *)&long long v19 = v1;
  sub_100045A40();
  sub_100008588((uint64_t)&v19);
  sub_1000459D0();
  if (a1)
  {
    *((void *)&v20 + 1) = sub_1000085E8();
    *(void *)&long long v19 = a1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  type metadata accessor for Log();
  id v14 = a1;
  sub_100045A40();
  sub_100008588((uint64_t)&v19);
  sub_100035610();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void **)(v1 + 24);
  *(void *)(v2 + 24) = a1;
  id v16 = v14;

  [v4 unlock];
}

void (*DynamicAccountsStore.account.modify(void **a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = DynamicAccountsStore.account.getter();
  return sub_1000084FC;
}

void sub_1000084FC(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    id v3 = v2;
    DynamicAccountsStore.account.setter(v2);
  }
  else
  {
    DynamicAccountsStore.account.setter(*a1);
  }
}

uint64_t type metadata accessor for DynamicAccountsStore()
{
  return self;
}

uint64_t sub_100008588(uint64_t a1)
{
  uint64_t v2 = sub_100005794((uint64_t *)&unk_10005CCF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000085E8()
{
  unint64_t result = qword_10005C6E0;
  if (!qword_10005C6E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C6E0);
  }
  return result;
}

uint64_t sub_100008628(uint64_t a1)
{
  return a1 - 8;
}

void sub_100008658()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_100045A00(v1);
}

id sub_100008670(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v5 = result;
  uint64_t v6 = sub_100008870(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    if (*(void *)(v6 + 16))
    {
      sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
      sub_100005794(&qword_10005C888);
      id v8 = a1;
      id result = sub_100008940((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v7);
      if (!result)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      sub_1000462F0();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v16 = sub_1000088D4(a2);
  if (!v16)
  {
LABEL_12:
    id v26 = [a2 request];
    if (!v26) {
      return v5;
    }
    uint64_t v27 = v26;
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    sub_1000067B4(0, &qword_10005E450);
    id v28 = a1;
    id v29 = v27;
    id result = sub_100008940((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v27);
    if (result)
    {
      sub_1000462F0();

      return v5;
    }
    goto LABEL_17;
  }
  uint64_t v17 = v16;
  if (!*(void *)(v16 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  sub_100005794(&qword_10005C5B0);
  id v18 = a1;
  id result = sub_100008940((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25, v17);
  if (result)
  {
    sub_1000462F0();
    goto LABEL_12;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_100008870(void *a1)
{
  id v1 = [a1 actions];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_100005794(&qword_10005C5B0);
  uint64_t v3 = sub_1000461F0();

  return v3;
}

uint64_t sub_1000088D4(void *a1)
{
  id v1 = [a1 data];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000460E0();

  return v3;
}

id sub_100008940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100026A70(&a9, v9);
}

uint64_t sub_10000895C(void *a1)
{
  uint64_t v2 = (void *)sub_100008B0C();
  uint64_t v3 = sub_100008A34(v2);
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = sub_100008B0C();
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E40();
    swift_willThrow();
  }

  return v4;
}

uint64_t sub_100008A08@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000895C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100008A34(void *a1)
{
  id v2 = [a1 toDictionary];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1000460E0();

  return v3;
}

unint64_t sub_100008AAC()
{
  unint64_t result = qword_10005CCE0;
  if (!qword_10005CCE0)
  {
    sub_100045E70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CCE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for EngagementEvent()
{
  return &type metadata for EngagementEvent;
}

uint64_t sub_100008B0C()
{
  return sub_1000462E0();
}

void sub_100008B3C(void *a1)
{
  id v2 = (void *)sub_100009BDC();
  uint64_t v3 = sub_1000056D0(v2);
  if (!v3 || (uint64_t v4 = sub_10000503C(v3), swift_bridgeObjectRelease(), !v4))
  {
    sub_100009BDC();
    sub_100045E70();
    sub_100008AAC();
    sub_100009B8C();
LABEL_17:
    sub_100045E40();
    swift_willThrow();

    return;
  }
  id v5 = (void *)sub_100009BAC();
  sub_1000462D0();
  uint64_t v7 = v6;

  if (!v7)
  {
    swift_bridgeObjectRelease();
    sub_100009BAC();
    sub_100045E70();
    sub_100008AAC();
    sub_100009B8C();
    goto LABEL_17;
  }
  int64_t v8 = v4[2];
  if (v8)
  {
    uint64_t v21 = a1;
    uint64_t v25 = (unint64_t *)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100005224(0, v8, 0);
    uint64_t v9 = 0;
    uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v11 = v4[v9 + 4];
      uint64_t v12 = *(void *)(v11 + 16);
      swift_bridgeObjectRetain();
      if (!v12
        || (unint64_t v13 = sub_1000091DC(0x6E656D6563616C70, 0xE900000000000074), (v14 & 1) == 0)
        || (sub_100005738(*(void *)(v11 + 56) + 32 * v13, (uint64_t)v24), !swift_dynamicCast()))
      {
        sub_100045E70();
        sub_100008AAC();
        sub_100009B8C();
        sub_100009C08();
        goto LABEL_22;
      }
      if (!*(void *)(v11 + 16)) {
        break;
      }
      unint64_t v15 = sub_1000091DC(0x747865746E6F63, 0xE700000000000000);
      if ((v16 & 1) == 0) {
        break;
      }
      sub_100005738(*(void *)(v11 + 56) + 32 * v15, (uint64_t)v24);
      sub_100005794(&qword_10005C5A0);
      if ((swift_dynamicCast() & 1) == 0) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = v10;
      unint64_t v18 = v10[2];
      unint64_t v17 = v10[3];
      uint64_t v19 = v10;
      if (v18 >= v17 >> 1)
      {
        sub_100005224((char *)(v17 > 1), v18 + 1, 1);
        uint64_t v19 = v25;
      }
      ++v9;
      v19[2] = v18 + 1;
      uint64_t v20 = &v19[3 * v18];
      v20[4] = v22;
      v20[5] = v22;
      v20[6] = v23;
      uint64_t v10 = v19;
      if (v8 == v9)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return;
      }
    }
    swift_bridgeObjectRelease();
    sub_100045E70();
    sub_100008AAC();
    sub_100009B8C();
    sub_100009C08();
LABEL_22:
    sub_100045E20();
    swift_willThrow();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id sub_100008EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_1000464A0();
    id v5 = (uint64_t *)(a3 + 48);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      v5 += 3;
      swift_bridgeObjectRetain_n();
      uint64_t v8 = swift_bridgeObjectRetain();
      sub_1000376E4(v8);
      uint64_t v10 = v9;
      id v11 = objc_allocWithZone((Class)AMSEngagementPlacementInfo);
      sub_100009074(v6, v7, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100046480();
      sub_1000464B0();
      sub_1000464C0();
      sub_100046490();
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  objc_allocWithZone((Class)AMSEngagementMessageEvent);
  swift_bridgeObjectRetain();
  return sub_100009114();
}

void sub_100009044(void *a1@<X0>, void *a2@<X8>)
{
  sub_100008B3C(a1);
  if (!v2)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
  }
}

id sub_100009074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v6.super.Class isa = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }
  id v7 = [v3 initWithPlacement:v5 context:v6.super.isa];

  return v7;
}

id sub_100009114()
{
  NSString v1 = sub_100046110();
  swift_bridgeObjectRelease();
  sub_1000097B8();
  Class isa = sub_1000461E0().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v0 initWithServiceType:v1 placementInfo:isa];

  return v3;
}

unint64_t sub_100009198(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000463F0(*(void *)(v2 + 40));
  return sub_1000092E8(a1, v4);
}

unint64_t sub_1000091DC(uint64_t a1, uint64_t a2)
{
  sub_100046650();
  sub_1000461A0();
  Swift::Int v4 = sub_100046670();
  return sub_1000093B0(a1, a2, v4);
}

unint64_t sub_100009254(uint64_t a1)
{
  sub_100046140();
  sub_100046650();
  sub_1000461A0();
  Swift::Int v2 = sub_100046670();
  swift_bridgeObjectRelease();
  return sub_100009494(a1, v2);
}

unint64_t sub_1000092E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100009708(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100046400();
      sub_100009764((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000093B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000465C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000465C0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100009494(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100046140();
    uint64_t v8 = v7;
    if (v6 == sub_100046140() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1000465C0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_100046140();
          uint64_t v15 = v14;
          if (v13 == sub_100046140() && v15 == v16) {
            break;
          }
          char v18 = sub_1000465C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

Swift::Int sub_10000960C()
{
  sub_100046140();
  sub_100046650();
  sub_1000461A0();
  Swift::Int v0 = sub_100046670();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009680()
{
  uint64_t v0 = sub_100046140();
  uint64_t v2 = v1;
  if (v0 == sub_100046140() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000465C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100009708(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009764(uint64_t a1)
{
  return a1;
}

unint64_t sub_1000097B8()
{
  unint64_t result = qword_10005C890;
  if (!qword_10005C890)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C890);
  }
  return result;
}

uint64_t destroy for EngagementMessagePlacementInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16UtilityExtension30EngagementMessagePlacementInfoVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EngagementMessagePlacementInfo(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EngagementMessagePlacementInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for EngagementMessagePlacementInfo(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementMessagePlacementInfo(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EngagementMessagePlacementInfo(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EngagementMessagePlacementInfo()
{
  return &type metadata for EngagementMessagePlacementInfo;
}

uint64_t destroy for EngagementMessageEvent()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16UtilityExtension22EngagementMessageEventVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EngagementMessageEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EngagementMessageEvent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementMessageEvent(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EngagementMessageEvent(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EngagementMessageEvent()
{
  return &type metadata for EngagementMessageEvent;
}

uint64_t sub_100009B8C()
{
  return swift_allocError();
}

uint64_t sub_100009BAC()
{
  return sub_1000462E0();
}

uint64_t sub_100009BDC()
{
  return sub_1000462E0();
}

void *sub_100009C1C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      __n128 result = (void *)sub_1000464A0();
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = 0;
      while (v4 != v6)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v7 = (id)sub_100046470();
        }
        else {
          id v7 = *(id *)(a1 + 8 * v6 + 32);
        }
        ++v6;
        id v8 = v7;
        sub_100009D78(a2, v8);

        sub_100046480();
        sub_1000464B0();
        sub_1000464C0();
        sub_100046490();
        if (v4 == v6) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_1000464F0();
      swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:

    return &_swiftEmptyArrayStorage;
  }
  return result;
}

id sub_100009D78(void *a1, void *a2)
{
  sub_100045A20();
  __chkstk_darwin();
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v5 = result;
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  id v6 = [a2 serviceType];
  uint64_t v7 = sub_100046140();
  uint64_t v9 = v8;

  ObjectType = (ValueMetadata *)&type metadata for String;
  v28[0] = v7;
  v28[1] = v9;
  id v26 = a1;
  id result = sub_100026A70(v28, a1);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1000462F0();
  id v10 = [a2 dictionaryRepresentation];
  sub_100005794(&qword_10005C8A0);
  uint64_t v11 = sub_1000460E0();

  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  ObjectType = &type metadata for EngagementMessageAction;
  v28[0] = a2;
  id v12 = a2;
  id v13 = (id)AMSLogKey();
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_100046140();
    uint64_t v17 = v16;

    sub_100045A10();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_100045A00(v30);
    sub_10000A3F0();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10000A428(MetatypeMetadata);
    sub_100008588((uint64_t)v27);
    v31._countAndFlagsBits = 5972026;
    v31._object = (void *)0xE300000000000000;
    sub_100045A00(v31);
    v27[3] = &type metadata for String;
    v27[0] = v15;
    v27[1] = v17;
    sub_1000459F0();
    sub_100008588((uint64_t)v27);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_100045A00(v32);
    sub_10000A3F0();
    uint64_t v20 = swift_getMetatypeMetadata();
    sub_10000A428(v20);
    sub_100008588((uint64_t)v27);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_100045A00(v19);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  sub_1000459D0();
  ObjectType = (ValueMetadata *)sub_100005794(&qword_10005C8A8);
  v28[0] = v11;
  swift_bridgeObjectRetain();
  sub_100045A40();
  sub_100008588((uint64_t)v28);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_10002F904(0xD000000000000011, 0x8000000100049630, v11);
  if (!v21) {
    goto LABEL_9;
  }
  uint64_t v22 = v21;
  ObjectType = (ValueMetadata *)swift_getObjectType();
  v28[0] = v22;
  id v23 = v26;
  swift_unknownObjectRetain();
  id result = sub_100026A70(v28, a1);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_1000462F0();
  swift_unknownObjectRelease();
LABEL_9:
  uint64_t v24 = sub_10002F904(0x6E656D6563616C70, 0xEA00000000007374, v11);
  swift_bridgeObjectRelease();
  if (!v24) {
    return v5;
  }
  ObjectType = (ValueMetadata *)swift_getObjectType();
  v28[0] = v24;
  id v25 = v26;
  swift_unknownObjectRetain();
  id result = sub_100026A70(v28, a1);
  if (result)
  {
    sub_1000462F0();
    swift_unknownObjectRelease();
    return v5;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_10000A22C()
{
  return sub_100045D70();
}

JSValue sub_10000A244(JSContext a1)
{
  return sub_100045D80(a1);
}

id sub_10000A25C(void *a1)
{
  return sub_100009D78(a1, *v1);
}

id sub_10000A264(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_10000A370(a2);
    if (!v6) {
      return v5;
    }
    unint64_t v7 = v6;
    id v8 = a1;
    uint64_t v9 = sub_100009C1C(v7, v8);
    swift_bridgeObjectRelease();
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    v11[3] = sub_100005794(&qword_10005C898);
    v11[0] = v9;
    id v10 = v8;
    id result = sub_100026A70(v11, a1);
    if (result)
    {
      sub_1000462F0();
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A370(void *a1)
{
  id v1 = [a1 messageActions];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_1000067B4(0, &qword_10005C8B0);
  uint64_t v3 = sub_1000461F0();

  return v3;
}

ValueMetadata *type metadata accessor for EngagementMessageAction()
{
  return &type metadata for EngagementMessageAction;
}

uint64_t sub_10000A3F0()
{
  sub_1000062B0((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_10000A428(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000459F0();
}

uint64_t sub_10000A448()
{
  uint64_t v1 = sub_100045620();
  sub_10000AD5C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100008640();
  sub_10000ACF8(v5, qword_10005C8B8);
  uint64_t v6 = sub_10000ACC0(v1, (uint64_t)qword_10005C8B8);
  id v7 = [self defaultManager];
  id v8 = [v7 temporaryDirectory];

  sub_1000455E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v0, v1);
}

uint64_t sub_10000A544()
{
  uint64_t v0 = sub_100045620();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000ACF8(v2, qword_10005C8D0);
  sub_10000ACC0(v0, (uint64_t)qword_10005C8D0);
  id v5 = [self defaultManager];
  id v6 = [v5 temporaryDirectory];

  sub_1000455E0();
  sub_1000455B0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

id sub_10000A68C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100045620();
  sub_10000AD5C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100008640();
  sub_10000A9A8();
  sub_10000AAC8();
  id v7 = [self defaultManager];
  sub_1000455A0(v8);
  id v10 = v9;
  v17[0] = 0;
  unsigned int v11 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:v17];

  id v15 = v17[0];
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, v1, v3);
    sub_1000066FC(a1, 0, 1, v3);
    return v15;
  }
  else
  {
    id v13 = v17[0];
    sub_100045550();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
    type metadata accessor for Log();
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    sub_1000459D0();
    swift_getErrorValue();
    void v17[3] = v16;
    uint64_t v14 = sub_100006A38((uint64_t *)v17);
    (*(void (**)(uint64_t *))(*((void *)v16 - 1) + 16))(v14);
    sub_100045A40();
    sub_100008588((uint64_t)v17);
    sub_100035680();
    swift_errorRelease();
    swift_bridgeObjectRelease();
    return (id)sub_1000066FC(a1, 1, 1, v3);
  }
}

id sub_10000A9A8()
{
  id v0 = [self defaultManager];
  if (qword_10005C458 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100045620();
  sub_10000ACC0(v1, (uint64_t)qword_10005C8D0);
  sub_1000455A0(v2);
  uint64_t v4 = v3;
  id v8 = 0;
  unsigned int v5 = [v0 removeItemAtURL:v3 error:&v8];

  id result = v8;
  if (!v5)
  {
    id v7 = result;
    sub_100045550();

    swift_willThrow();
    return (id)swift_errorRelease();
  }
  return result;
}

uint64_t sub_10000AAC8()
{
  uint64_t v0 = sub_100045620();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000456B0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000456A0();
  sub_100045680();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (qword_10005C458 != -1) {
    swift_once();
  }
  sub_10000ACC0(v0, (uint64_t)qword_10005C8D0);
  sub_1000455B0();
  swift_bridgeObjectRelease();
  sub_1000455C0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000ACC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000ACF8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000AD78()
{
  uint64_t v0 = sub_1000460F0();
  uint64_t v1 = sub_10000ADE4(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_10000ADE4(uint64_t a1)
{
  uint64_t v2 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100045620();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v40 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v38 = (char *)v36 - v9;
  v49 = &_swiftEmptyDictionarySingleton;
  sub_10002419C(v45, a1);
  uint64_t v43 = v45[0];
  int64_t v44 = v47;
  unint64_t v10 = v48;
  v36[1] = v46;
  uint64_t v41 = v45[1];
  int64_t v42 = (unint64_t)(v46 + 64) >> 6;
  uint64_t v37 = v6;
  v39 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  for (uint64_t result = swift_bridgeObjectRetain(); ; uint64_t result = swift_bridgeObjectRelease())
  {
    while (1)
    {
      if (v10)
      {
        unint64_t v12 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v13 = v12 | (v44 << 6);
      }
      else
      {
        int64_t v14 = v44 + 1;
        if (__OFADD__(v44, 1)) {
          goto LABEL_38;
        }
        if (v14 >= v42) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v41 + 8 * v14);
        int64_t v16 = v44 + 1;
        if (!v15)
        {
          int64_t v16 = v44 + 2;
          if (v44 + 2 >= v42) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v41 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v44 + 3;
            if (v44 + 3 >= v42) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v41 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v44 + 4;
              if (v44 + 4 >= v42) {
                goto LABEL_36;
              }
              unint64_t v15 = *(void *)(v41 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v44 + 5;
                if (v44 + 5 >= v42) {
                  goto LABEL_36;
                }
                unint64_t v15 = *(void *)(v41 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v44 + 6;
                  while (v17 < v42)
                  {
                    unint64_t v15 = *(void *)(v41 + 8 * v17++);
                    if (v15)
                    {
                      int64_t v16 = v17 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_36:
                  sub_10000B6B8();
                  return (uint64_t)v49;
                }
              }
            }
          }
        }
LABEL_19:
        unint64_t v10 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
        int64_t v44 = v16;
      }
      uint64_t v18 = *(void *)(*(void *)(v43 + 48) + 8 * v13);
      Swift::String v19 = self;
      swift_bridgeObjectRetain();
      id v20 = [v19 defaultManager];
      NSString v21 = sub_100046110();
      unsigned int v22 = [v20 fileExistsAtPath:v21];

      if (v22) {
        break;
      }
      sub_1000066FC((uint64_t)v4, 1, 1, v5);
LABEL_27:
      swift_bridgeObjectRelease();
      uint64_t result = sub_10000B658((uint64_t)v4);
    }
    sub_100045590();
    sub_1000066FC((uint64_t)v4, 0, 1, v5);
    if (sub_10000678C((uint64_t)v4, 1, v5) == 1) {
      goto LABEL_27;
    }
    id v23 = v38;
    uint64_t v24 = *v39;
    (*v39)(v38, v4, v5);
    v24(v40, v23, v5);
    id v25 = v49;
    unint64_t v26 = v49[2];
    if (v49[3] <= v26)
    {
      sub_10000B2B4(v26 + 1, 1);
      id v25 = v49;
    }
    uint64_t result = sub_100046640();
    uint64_t v27 = v25 + 8;
    uint64_t v28 = -1 << *((unsigned char *)v25 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~v25[(v29 >> 6) + 8]) == 0) {
      break;
    }
    unint64_t v31 = __clz(__rbit64((-1 << v29) & ~v25[(v29 >> 6) + 8])) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_35:
    *(void *)((char *)v27 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    *(void *)(v25[6] + 8 * v31) = v18;
    v24((char *)(v25[7] + *(void *)(v37 + 72) * v31), v40, v5);
    ++v25[2];
  }
  char v32 = 0;
  unint64_t v33 = (unint64_t)(63 - v28) >> 6;
  while (++v30 != v33 || (v32 & 1) == 0)
  {
    BOOL v34 = v30 == v33;
    if (v30 == v33) {
      unint64_t v30 = 0;
    }
    v32 |= v34;
    uint64_t v35 = v27[v30];
    if (v35 != -1)
    {
      unint64_t v31 = __clz(__rbit64(~v35)) + (v30 << 6);
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000B2B4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = sub_100045620();
  uint64_t v5 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100005794(&qword_10005C8F0);
  int v40 = a2;
  uint64_t result = sub_100046500();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v36 = v3;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    v38 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v37 = (unint64_t)(v13 + 63) >> 6;
    v39 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    int64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v17 = result + 64;
    if ((v14 & v12) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    for (unint64_t i = v18 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v11 << 6))
    {
      uint64_t v23 = *(void *)(*(void *)(v8 + 48) + 8 * i);
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 56) + v25 * i;
      if (v40) {
        (*v16)(v7, v26, v41);
      }
      else {
        (*v39)(v7, v26, v41);
      }
      uint64_t result = sub_100046640();
      uint64_t v27 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6))) == 0)
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v27) >> 6;
        while (++v29 != v32 || (v31 & 1) == 0)
        {
          BOOL v33 = v29 == v32;
          if (v29 == v32) {
            unint64_t v29 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v17 + 8 * v29);
          if (v34 != -1)
          {
            unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(void *)(v17 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
      *(void *)(*(void *)(v10 + 48) + 8 * v30) = v23;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v16)(*(void *)(v10 + 56) + v25 * v30, v7, v41);
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      if (v15) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v20 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_42;
      }
      if (v20 >= v37) {
        goto LABEL_33;
      }
      unint64_t v21 = v38[v20];
      ++v11;
      if (!v21)
      {
        int64_t v11 = v20 + 1;
        if (v20 + 1 >= v37) {
          goto LABEL_33;
        }
        unint64_t v21 = v38[v11];
        if (!v21)
        {
          int64_t v22 = v20 + 2;
          if (v22 >= v37)
          {
LABEL_33:
            if ((v40 & 1) == 0)
            {
              uint64_t result = swift_release();
              uint64_t v3 = v36;
              goto LABEL_40;
            }
            uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
            if (v35 >= 64) {
              sub_100024180(0, (unint64_t)(v35 + 63) >> 6, v38);
            }
            else {
              void *v38 = -1 << v35;
            }
            uint64_t v3 = v36;
            *(void *)(v8 + 16) = 0;
            break;
          }
          unint64_t v21 = v38[v22];
          if (!v21)
          {
            while (1)
            {
              int64_t v11 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_43;
              }
              if (v11 >= v37) {
                goto LABEL_33;
              }
              unint64_t v21 = v38[v11];
              ++v22;
              if (v21) {
                goto LABEL_18;
              }
            }
          }
          int64_t v11 = v22;
        }
      }
LABEL_18:
      unint64_t v15 = (v21 - 1) & v21;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_10000B658(uint64_t a1)
{
  uint64_t v2 = sub_100005794(&qword_10005C8E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B6B8()
{
  return swift_release();
}

BOOL sub_10000B6C0(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000B6D0(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000B6F8(unsigned __int8 a1)
{
  return sub_100046670();
}

BOOL sub_10000B740(char *a1, char *a2)
{
  return sub_10000B6C0(*a1, *a2);
}

Swift::Int sub_10000B74C()
{
  return sub_10000B6F8(*v0);
}

void sub_10000B754(uint64_t a1)
{
  sub_10000B6D0(a1, *v1);
}

Swift::Int sub_10000B75C()
{
  Swift::UInt v1 = *v0;
  sub_100046650();
  sub_100046660(v1);
  return sub_100046670();
}

uint64_t sub_10000B7B0()
{
  return [self devMode] ^ 1;
}

uint64_t sub_10000B7E0(uint64_t a1, void *a2, void *a3, void (*a4)(void))
{
  v138 = a4;
  id v119 = a3;
  id v118 = a2;
  uint64_t v139 = a1;
  sub_100005794(&qword_10005C9B8);
  sub_10000AD5C();
  uint64_t v132 = v6;
  uint64_t v133 = v5;
  __chkstk_darwin(v5);
  sub_10000D898();
  uint64_t v131 = v7;
  uint64_t v130 = sub_100045B10();
  sub_10000AD5C();
  uint64_t v127 = v8;
  __chkstk_darwin(v9);
  sub_10000D898();
  sub_10000D8AC(v10);
  uint64_t v137 = sub_100005794(&qword_10005C9C0);
  sub_10000AD5C();
  uint64_t v129 = v11;
  __chkstk_darwin(v12);
  sub_10000D898();
  sub_10000D8AC(v13);
  uint64_t v125 = sub_100005794(&qword_10005C9C8);
  sub_10000AD5C();
  uint64_t v124 = v14;
  __chkstk_darwin(v15);
  sub_10000D898();
  sub_10000D8AC(v16);
  uint64_t v122 = sub_100005794(&qword_10005C9D0);
  sub_10000AD5C();
  uint64_t v121 = v17;
  __chkstk_darwin(v18);
  sub_10000D898();
  sub_10000D8AC(v19);
  v117 = (void *)sub_100045810();
  sub_10000AD5C();
  uint64_t v116 = v20;
  __chkstk_darwin(v21);
  sub_10000D898();
  sub_10000D8AC(v22);
  uint64_t v135 = sub_100005794(&qword_10005C9D8);
  sub_10000AD5C();
  uint64_t v120 = v23;
  __chkstk_darwin(v24);
  sub_10000D898();
  sub_10000D8AC(v25);
  uint64_t v114 = sub_100005794(&qword_10005C9E0);
  sub_10000AD5C();
  uint64_t v113 = v26;
  __chkstk_darwin(v27);
  sub_10000D898();
  sub_10000D8AC(v28);
  uint64_t v29 = sub_100005794(&qword_10005C8E8);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  unint64_t v32 = (char *)v110 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)v110 - v33;
  uint64_t v35 = sub_100045620();
  sub_10000AD5C();
  uint64_t v142 = v36;
  uint64_t v38 = __chkstk_darwin(v37);
  v136 = (char *)v110 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v38);
  v140 = (char *)v110 - v41;
  uint64_t v123 = v42;
  __chkstk_darwin(v40);
  v141 = (char *)v110 - v43;
  uint64_t v44 = sub_100045A20();
  __chkstk_darwin(v44 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v45 = sub_100045A70();
  sub_100008628(v45);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v144 = type metadata accessor for JetpackLoader();
  v143 = (void *)v4;
  uint64_t v134 = v4;
  swift_retain();
  id v46 = (id)AMSLogKey();
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = sub_100046140();
    uint64_t v50 = v49;

    sub_100045A10();
    v148._countAndFlagsBits = 0;
    v148._object = (void *)0xE000000000000000;
    sub_100045A00(v148);
    uint64_t v51 = sub_10000D8FC();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v146[0] = v51;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v146, (uint64_t *)&unk_10005CCF0);
    v149._countAndFlagsBits = 5972026;
    v149._object = (void *)0xE300000000000000;
    sub_100045A00(v149);
    uint64_t MetatypeMetadata = &type metadata for String;
    v146[0] = v48;
    v146[1] = v50;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v146, (uint64_t *)&unk_10005CCF0);
    v52._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v150._countAndFlagsBits = 0;
    v150._object = (void *)0xE000000000000000;
    sub_100045A00(v150);
    uint64_t v53 = sub_10000D8FC();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v146[0] = v53;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v146, (uint64_t *)&unk_10005CCF0);
    v52._countAndFlagsBits = 58;
  }
  v52._object = (void *)0xE100000000000000;
  sub_100045A00(v52);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v143);
  sub_1000459D0();
  uint64_t v144 = v35;
  sub_100006A38((uint64_t *)&v143);
  uint64_t v54 = v142;
  v55 = *(void (**)(void))(v142 + 16);
  sub_10000D8C4();
  v55();
  sub_100045A40();
  sub_10000D5F8((uint64_t)&v143, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_1000067B4(0, &qword_10005C9E8);
  sub_100045C20();
  sub_100045DE0();
  v56 = v143;
  if (qword_10005C450 != -1) {
    swift_once();
  }
  sub_10000ACC0(v35, (uint64_t)qword_10005C8B8);
  sub_10000D8C4();
  v55();
  sub_1000066FC((uint64_t)v34, 0, 1, v35);
  int v57 = sub_10000678C((uint64_t)v34, 1, v35);
  v58 = v140;
  v59 = v141;
  if (v57 == 1)
  {
    sub_10000D5F8((uint64_t)v34, &qword_10005C8E8);
    sub_100005794(&qword_10005C9F0);
    sub_10000D1C4();
    swift_allocError();
    unsigned char *v60 = 0;
    uint64_t v61 = sub_100045F70();
  }
  else
  {
    v138 = v55;
    v62 = v34;
    v63 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
    v63(v141, v62, v35);
    sub_10000A68C((uint64_t)v32);
    if (sub_10000678C((uint64_t)v32, 1, v35) == 1)
    {
      sub_10000D5F8((uint64_t)v32, &qword_10005C8E8);
      sub_100005794(&qword_10005C9F0);
      sub_10000D1C4();
      swift_allocError();
      unsigned char *v64 = 1;
      uint64_t v61 = sub_100045F70();

      (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v35);
    }
    else
    {
      v112 = (void (*)(unint64_t, char *, uint64_t))v63;
      v63(v58, v32, v35);
      uint64_t v65 = (uint64_t)v118;
      uint64_t v66 = (uint64_t)v119;
      id v67 = sub_10002F5BC((uint64_t)v118, (uint64_t)v119);
      id v68 = sub_10002F52C(v65, v66);
      v111 = v56;
      uint64_t v69 = v139;
      sub_100046040();
      v110[1] = v54 + 32;
      id v119 = v67;
      id v118 = v68;
      sub_100045B70();
      sub_10000D49C(&qword_10005CA00, &qword_10005C9E0);
      uint64_t v70 = sub_100045AF0();
      v71 = *(void (**)(uint64_t))(v120 + 8);
      uint64_t v72 = sub_10000D934();
      v71(v72);
      sub_10000D8B8();
      v73();
      v146[0] = v70;
      ((void (*)(char *, uint64_t, uint64_t))v138)(v136, v69, v35);
      sub_10000D258();
      sub_100046410();
      uint64_t v74 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
      uint64_t v75 = v116;
      uint64_t v76 = v115;
      v77 = v117;
      (*(void (**)(uint64_t, void, void *))(v116 + 104))(v115, enum case for DispatchQoS.QoSClass.default(_:), v117);
      uint64_t v120 = v74;
      v78 = (void *)sub_1000462A0();
      (*(void (**)(uint64_t, void *))(v75 + 8))(v76, v77);
      sub_100045B90();

      sub_100009764((uint64_t)&v143);
      sub_100005794(&qword_10005CA18);
      sub_10000D49C(&qword_10005CA20, &qword_10005CA18);
      uint64_t v79 = sub_100045AF0();
      uint64_t v80 = sub_10000D934();
      v71(v80);
      swift_release();
      v143 = (void *)v79;
      sub_10000AD78();
      sub_10000B7B0();
      sub_100045B20();
      sub_100045B80();
      swift_bridgeObjectRelease();
      sub_10000D8D4();
      uint64_t v81 = sub_100045AF0();
      sub_10000D8B8();
      v82();
      swift_release();
      v143 = (void *)v81;
      sub_100045B30();
      sub_100005794(&qword_10005CA28);
      v117 = &protocol conformance descriptor for MapPipelineTask<A, B>;
      sub_10000D49C(&qword_10005CA30, &qword_10005CA28);
      sub_10000D8D4();
      uint64_t v83 = sub_100045AF0();
      sub_10000D8B8();
      v84();
      swift_release();
      v143 = (void *)v83;
      uint64_t v85 = v127;
      uint64_t v86 = v126;
      uint64_t v87 = v130;
      (*(void (**)(uint64_t, void, uint64_t))(v127 + 104))(v126, enum case for JetpackBundle.Resource.source(_:), v130);
      uint64_t v88 = v128;
      sub_100045B60();
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v86, v87);
      uint64_t v89 = sub_100005794(&qword_10005CA38);
      uint64_t v90 = sub_10000D49C(&qword_10005CA40, &qword_10005CA38);
      uint64_t v135 = v89;
      uint64_t v127 = v90;
      uint64_t v91 = sub_100045AF0();
      uint64_t v129 = *(void *)(v129 + 8);
      ((void (*)(uint64_t, uint64_t))v129)(v88, v137);
      v143 = (void *)v91;
      v92 = v136;
      sub_10000D8C4();
      v93();
      unint64_t v94 = (*(unsigned __int8 *)(v142 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
      unint64_t v95 = (v123 + v94 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v96 = swift_allocObject();
      v112(v96 + v94, v92, v35);
      v97 = v111;
      *(void *)(v96 + v95) = v111;
      v138 = v97;
      sub_100005794(&qword_10005CA48);
      sub_100005794(&qword_10005CA50);
      sub_10000D49C(&qword_10005CA58, &qword_10005CA48);
      v136 = (char *)sub_100045AE0();
      swift_release();
      swift_release();
      uint64_t v139 = v83;
      v143 = (void *)v83;
      if (qword_10005C460 != -1) {
        swift_once();
      }
      sub_10000ACC0(v87, (uint64_t)qword_10005C8F8);
      sub_100045B60();
      uint64_t v98 = sub_100045AF0();
      ((void (*)(uint64_t, uint64_t))v129)(v88, v137);
      v143 = (void *)v98;
      uint64_t v99 = sub_100045AD0();
      swift_release();
      v143 = (void *)v99;
      sub_100005794(&qword_10005CA60);
      sub_100005794(&qword_10005C5A0);
      sub_10000D49C(&qword_10005CA68, &qword_10005CA60);
      uint64_t v100 = sub_100045AE0();
      swift_release();
      v143 = (void *)v100;
      sub_100045B30();
      sub_100005794(&qword_10005CA70);
      sub_10000D49C(&qword_10005CA78, &qword_10005CA70);
      sub_100045AF0();
      sub_10000D8B8();
      v101();
      swift_release();
      sub_100045C70();
      sub_100045C70();
      uint64_t v102 = sub_1000460F0();
      v103 = (void *)sub_100046290();
      uint64_t v104 = swift_allocObject();
      *(void *)(v104 + 16) = v102;
      id v105 = v103;
      swift_bridgeObjectRetain();
      sub_10000FD34((uint64_t)sub_10000D494, v104, v105);
      swift_bridgeObjectRelease();
      swift_release();

      swift_release();
      sub_100005794(&qword_10005CA80);
      sub_10000D49C(&qword_10005CA88, &qword_10005CA80);
      sub_100045F50();
      uint64_t v106 = swift_allocObject();
      uint64_t v107 = v134;
      *(void *)(v106 + 16) = sub_10000D4E0;
      *(void *)(v106 + 24) = v107;
      uint64_t v144 = sub_100045CC0();
      v145 = &protocol witness table for SyncTaskScheduler;
      sub_100006A38((uint64_t *)&v143);
      swift_retain();
      sub_100045CB0();
      uint64_t v61 = sub_100045F40();

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v143);
      v108 = *(void (**)(char *, uint64_t))(v142 + 8);
      v108(v140, v35);
      v108(v141, v35);
    }
  }
  return v61;
}

uint64_t sub_10000C97C()
{
  return sub_100045D00();
}

void *sub_10000C9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  id v21 = a3;
  uint64_t v7 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045620();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15((char *)&v20 - v16, a1, v10);
  v15(v14, a2, v10);
  sub_1000066FC((uint64_t)v9, 1, 1, v10);
  a4[3] = sub_100045C90();
  a4[4] = (uint64_t)&protocol witness table for JSBytecodeSource;
  sub_100006A38(a4);
  id v17 = v21;
  uint64_t v18 = v22;
  uint64_t result = (void *)sub_100045C80();
  if (v18) {
    return sub_10000D644(a4);
  }
  return result;
}

uint64_t sub_10000CB88()
{
  uint64_t result = sub_100045630();
  if (!v0)
  {
    sub_100005794(&qword_10005CA98);
    return sub_100045F80();
  }
  return result;
}

uint64_t sub_10000CBF0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005794(&qword_10005CA90);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000459A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D5A0(*(void *)a1, *(void *)(a1 + 8));
  uint64_t result = sub_100045960();
  if (!v2)
  {
    sub_100045950();
    uint64_t v13 = sub_100045BD0();
    if (sub_10000678C((uint64_t)v7, 1, v13) == 1)
    {
      sub_10000D5F8((uint64_t)v7, &qword_10005CA90);
    }
    else
    {
      uint64_t v14 = sub_100045BC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v7, v13);
      if (v14)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        *a2 = v14;
        return result;
      }
    }
    sub_10000D1C4();
    swift_allocError();
    *uint64_t v15 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_10000CE2C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100045A20();
  __chkstk_darwin(v8 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v24 = type metadata accessor for JetpackLoader();
  v23[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100046140();
    uint64_t v13 = v12;

    sub_100045A10();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_100045A00(v25);
    sub_1000062B0(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = DynamicType;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v26._countAndFlagsBits = 5972026;
    v26._object = (void *)0xE300000000000000;
    sub_100045A00(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v21[0] = v11;
    v21[1] = v13;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_100045A00(v27);
    sub_1000062B0(v23, v24);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = v16;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_100045A00(v15);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v23);
  sub_1000459D0();
  uint64_t v17 = a1[3];
  uint64_t v18 = sub_1000062B0(a1, v17);
  uint64_t v24 = v17;
  uint64_t v19 = sub_100006A38(v23);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v19, v18, v17);
  sub_100045A40();
  sub_10000D5F8((uint64_t)v23, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_10000D53C((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000D16C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for JetpackLoader()
{
  return self;
}

uint64_t sub_10000D1A0(uint64_t a1, void *a2, void *a3, void (*a4)(void))
{
  return sub_10000B7E0(a1, a2, a3, a4);
}

unint64_t sub_10000D1C4()
{
  unint64_t result = qword_10005C9F8;
  if (!qword_10005C9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C9F8);
  }
  return result;
}

uint64_t sub_10000D210(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000D258()
{
  unint64_t result = qword_10005CA08;
  if (!qword_10005CA08)
  {
    sub_100045620();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CA08);
  }
  return result;
}

uint64_t sub_10000D2A8()
{
  sub_100045620();
  sub_10000D8E8();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_10000D8B8();
  v5();

  return _swift_deallocObject(v0, v4 + 8, v3);
}

void *sub_10000D33C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100045620();
  sub_100008628(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_10000C9B0(a1, v2 + v10, *(void **)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_10000D3C0()
{
  uint64_t v0 = sub_100045B10();
  sub_10000ACF8(v0, qword_10005C8F8);
  uint64_t v1 = (_OWORD *)sub_10000ACC0(v0, (uint64_t)qword_10005C8F8);
  _OWORD *v1 = xmmword_100047900;
  v1[1] = xmmword_100047910;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v2();
}

uint64_t sub_10000D45C()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D494@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000FCC8(a1);
}

uint64_t sub_10000D49C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D210(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D4E0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000CE2C(a1, a2, v3, a3);
}

uint64_t sub_10000D4E8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D520(uint64_t a1)
{
  return sub_10000E094(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

uint64_t sub_10000D53C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D5A0(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D5F8(uint64_t a1, uint64_t *a2)
{
  sub_100005794(a2);
  sub_10000D8E8();
  sub_10000D8B8();
  v3();
  return a1;
}

void *sub_10000D644(void *result)
{
  uint64_t v1 = *(void *)(result[3] - 8);
  if ((*(_DWORD *)(v1 + 80) & 0x20000) != 0) {
    return (void *)_swift_slowDealloc(*result, *(void *)(v1 + 64)+ ((*(_DWORD *)(v1 + 80) + 16) & ~(unint64_t)*(_DWORD *)(v1 + 80)), *(_DWORD *)(v1 + 80) | 7);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for JetpackLoader.LoadError(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JetpackLoader.LoadError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for JetpackLoader.LoadError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000D7FCLL);
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

uint64_t sub_10000D824(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000D830(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JetpackLoader.LoadError()
{
  return &type metadata for JetpackLoader.LoadError;
}

unint64_t sub_10000D84C()
{
  unint64_t result = qword_10005CAA0;
  if (!qword_10005CAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CAA0);
  }
  return result;
}

void sub_10000D8AC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_10000D8D4()
{
  return v0;
}

uint64_t sub_10000D8FC()
{
  sub_1000062B0((void *)(v0 - 160), *(void *)(v0 - 136));
  return swift_getDynamicType();
}

uint64_t sub_10000D934()
{
  return v0;
}

ValueMetadata *type metadata accessor for JetpackMetadata()
{
  return &type metadata for JetpackMetadata;
}

uint64_t sub_10000D958()
{
  return 1;
}

void sub_10000D960()
{
}

uint64_t sub_10000D988(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000465C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int sub_10000DA10()
{
  return sub_100046670();
}

uint64_t sub_10000DA54()
{
  return 0;
}

uint64_t sub_10000DA60()
{
  return 0x6E6F6973726576;
}

Swift::Int sub_10000DA84()
{
  return sub_100046670();
}

uint64_t sub_10000DAC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000D988(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000DAF4()
{
  return sub_10000DA54();
}

uint64_t sub_10000DB10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000D958();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000DB3C(uint64_t a1)
{
  unint64_t v2 = sub_10000DE28();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DB78(uint64_t a1)
{
  unint64_t v2 = sub_10000DE28();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DBB4(void *a1)
{
  uint64_t v2 = sub_100005794(&qword_10005CAB8);
  sub_10000AD5C();
  uint64_t v4 = v3;
  __chkstk_darwin();
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000062B0(a1, a1[3]);
  sub_10000DE28();
  sub_100046690();
  sub_100046590();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v2);
}

uint64_t sub_10000DCB8(void *a1)
{
  uint64_t v3 = sub_100005794(&qword_10005CAA8);
  sub_10000AD5C();
  uint64_t v5 = v4;
  __chkstk_darwin();
  BOOL v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t)sub_1000062B0(a1, a1[3]);
  sub_10000DE28();
  sub_100046680();
  if (!v1)
  {
    uint64_t v8 = sub_100046550();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
  return v8;
}

uint64_t sub_10000DDE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000DCB8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000DE0C(void *a1)
{
  return sub_10000DBB4(a1);
}

unint64_t sub_10000DE28()
{
  unint64_t result = qword_10005CAB0;
  if (!qword_10005CAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CAB0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JetpackMetadata.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for JetpackMetadata.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10000DF64);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000DF8C()
{
  return 0;
}

ValueMetadata *type metadata accessor for JetpackMetadata.CodingKeys()
{
  return &type metadata for JetpackMetadata.CodingKeys;
}

unint64_t sub_10000DFA8()
{
  unint64_t result = qword_10005CAC0;
  if (!qword_10005CAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CAC0);
  }
  return result;
}

unint64_t sub_10000DFF8()
{
  unint64_t result = qword_10005CAC8;
  if (!qword_10005CAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CAC8);
  }
  return result;
}

unint64_t sub_10000E048()
{
  unint64_t result = qword_10005CAD0;
  if (!qword_10005CAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CAD0);
  }
  return result;
}

uint64_t sub_10000E094(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000E0CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v157 = a4;
  uint64_t v135 = (void *)a3;
  uint64_t v126 = a2;
  uint64_t v158 = a1;
  sub_100005794(&qword_10005C9B8);
  sub_10000AD5C();
  uint64_t v151 = v6;
  uint64_t v152 = v5;
  __chkstk_darwin(v5);
  sub_10000D898();
  uint64_t v150 = v7;
  uint64_t v149 = sub_100045900();
  sub_10000AD5C();
  uint64_t v148 = v8;
  __chkstk_darwin(v9);
  sub_100010118();
  sub_10000D8AC(v10);
  uint64_t v143 = v11;
  __chkstk_darwin(v12);
  sub_10000D8AC((uint64_t)&v124 - v13);
  uint64_t v147 = sub_100005794(&qword_10005CB98);
  sub_10000AD5C();
  uint64_t v146 = v14;
  __chkstk_darwin(v15);
  sub_10000D898();
  sub_10000D8AC(v16);
  uint64_t v142 = sub_100005794(&qword_10005CBA0);
  sub_10000AD5C();
  uint64_t v141 = v17;
  __chkstk_darwin(v18);
  sub_10000D898();
  sub_10000D8AC(v19);
  uint64_t v140 = sub_100005794(&qword_10005CBA8);
  sub_10000AD5C();
  uint64_t v139 = v20;
  __chkstk_darwin(v21);
  sub_10000D898();
  sub_10000D8AC(v22);
  uint64_t v137 = sub_100005794(&qword_10005CBB0);
  sub_10000AD5C();
  uint64_t v136 = v23;
  __chkstk_darwin(v24);
  sub_10000D898();
  sub_10000D8AC(v25);
  uint64_t v132 = sub_100045810();
  sub_10000AD5C();
  uint64_t v131 = v26;
  __chkstk_darwin(v27);
  sub_10000D898();
  sub_10000D8AC(v28);
  uint64_t v156 = sub_100005794(&qword_10005C9D8);
  sub_10000AD5C();
  uint64_t v134 = v29;
  __chkstk_darwin(v30);
  sub_10000D898();
  sub_10000D8AC(v31);
  uint64_t v128 = sub_100005794(&qword_10005C9E0);
  sub_10000AD5C();
  uint64_t v127 = v32;
  __chkstk_darwin(v33);
  sub_10000D898();
  sub_10000D8AC(v34);
  uint64_t v35 = sub_100005794(&qword_10005C8E8);
  uint64_t v36 = __chkstk_darwin(v35 - 8);
  v154 = (char *)&v124 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v39 = (char *)&v124 - v38;
  uint64_t v40 = sub_100045620();
  sub_10000AD5C();
  uint64_t v160 = v41;
  __chkstk_darwin(v42);
  sub_100010118();
  id v155 = v43;
  uint64_t v45 = __chkstk_darwin(v44);
  v159 = (char *)&v124 - v46;
  uint64_t v129 = v47;
  __chkstk_darwin(v45);
  v161 = (char *)&v124 - v48;
  uint64_t v49 = sub_100045A20();
  __chkstk_darwin(v49 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v50 = sub_100045A70();
  sub_100008628(v50);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v163 = type metadata accessor for JetpackV2Loader();
  v162 = (void *)v4;
  uint64_t v153 = v4;
  swift_retain();
  id v51 = (id)AMSLogKey();
  if (v51)
  {
    Swift::String v52 = v51;
    uint64_t v53 = sub_100046140();
    uint64_t v55 = v54;

    sub_100045A10();
    v167._countAndFlagsBits = 0;
    v167._object = (void *)0xE000000000000000;
    sub_100045A00(v167);
    uint64_t v56 = sub_10000D8FC();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v165[0] = v56;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v165, (uint64_t *)&unk_10005CCF0);
    v168._countAndFlagsBits = 5972026;
    v168._object = (void *)0xE300000000000000;
    sub_100045A00(v168);
    uint64_t MetatypeMetadata = &type metadata for String;
    v165[0] = v53;
    v165[1] = v55;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v165, (uint64_t *)&unk_10005CCF0);
    v57._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v169._countAndFlagsBits = 0;
    v169._object = (void *)0xE000000000000000;
    sub_100045A00(v169);
    uint64_t v58 = sub_10000D8FC();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v165[0] = v58;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v165, (uint64_t *)&unk_10005CCF0);
    v57._countAndFlagsBits = 58;
  }
  v57._object = (void *)0xE100000000000000;
  sub_100045A00(v57);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v162);
  sub_1000459D0();
  uint64_t v163 = v40;
  sub_100006A38((uint64_t *)&v162);
  uint64_t v59 = v160;
  v60 = *(void (**)(void))(v160 + 16);
  sub_100010108();
  v60();
  sub_100045A40();
  sub_10000D5F8((uint64_t)&v162, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_1000067B4(0, &qword_10005C9E8);
  sub_100045C20();
  sub_100045DE0();
  uint64_t v61 = v162;
  if (qword_10005C450 != -1) {
    swift_once();
  }
  sub_10000ACC0(v40, (uint64_t)qword_10005C8B8);
  sub_100010108();
  v60();
  sub_1000066FC((uint64_t)v39, 0, 1, v40);
  BOOL v62 = sub_10000678C((uint64_t)v39, 1, v40) == 1;
  v63 = v159;
  if (v62)
  {
    sub_10000D5F8((uint64_t)v39, &qword_10005C8E8);
    sub_100005794(&qword_10005C9F0);
    sub_10000F930();
    swift_allocError();
    unsigned char *v64 = 0;
    uint64_t v65 = sub_100045F70();
  }
  else
  {
    uint64_t v66 = v59;
    id v68 = *(void (**)(unint64_t, id, uint64_t))(v59 + 32);
    uint64_t v67 = v59 + 32;
    uint64_t v69 = v39;
    uint64_t v70 = v68;
    v68((unint64_t)v161, v69, v40);
    uint64_t v71 = (uint64_t)v154;
    sub_10000A68C((uint64_t)v154);
    int v72 = sub_10000678C(v71, 1, v40);
    if (v72 == 1)
    {
      sub_10000D5F8(v71, &qword_10005C8E8);
      sub_100005794(&qword_10005C9F0);
      sub_10000F930();
      swift_allocError();
      unsigned char *v73 = 1;
      uint64_t v65 = sub_100045F70();

      (*(void (**)(char *, uint64_t))(v66 + 8))(v161, v40);
    }
    else
    {
      uint64_t v125 = v70;
      v70((unint64_t)v63, (id)v71, v40);
      uint64_t v74 = v126;
      uint64_t v75 = (uint64_t)v135;
      id v76 = sub_10002F5BC(v126, (uint64_t)v135);
      v77 = (char *)sub_10002F52C(v74, v75);
      uint64_t v126 = v67;
      v78 = v77;
      sub_100046040();
      uint64_t v79 = v133;
      id v157 = v76;
      v154 = v78;
      sub_100045B70();
      sub_10000D49C(&qword_10005CA00, &qword_10005C9E0);
      uint64_t v135 = v61;
      uint64_t v80 = sub_100045AF0();
      uint64_t v124 = (void (*)(uint64_t, uint64_t))v134[1];
      v124(v79, v156);
      sub_10000D8B8();
      v81();
      v165[0] = v80;
      sub_100010108();
      v60();
      sub_10000D258();
      sub_100046410();
      uint64_t v82 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
      uint64_t v83 = v131;
      uint64_t v84 = v130;
      uint64_t v85 = v132;
      (*(void (**)(uint64_t, void, uint64_t))(v131 + 104))(v130, enum case for DispatchQoS.QoSClass.default(_:), v132);
      uint64_t v158 = v82;
      uint64_t v86 = (void *)sub_1000462A0();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v84, v85);
      sub_100045B90();

      sub_100009764((uint64_t)&v162);
      sub_100005794(&qword_10005CA18);
      uint64_t v134 = &protocol conformance descriptor for MapPipelineTask<A, B>;
      sub_10000D49C(&qword_10005CA20, &qword_10005CA18);
      uint64_t v87 = sub_100045AF0();
      v124(v79, v156);
      swift_release();
      v162 = (void *)v87;
      LOBYTE(v87) = sub_10000B7B0();
      id v88 = v155;
      sub_100010108();
      v60();
      unint64_t v89 = (*(unsigned __int8 *)(v160 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80);
      uint64_t v90 = v89 + v129;
      uint64_t v91 = swift_allocObject();
      v125(v91 + v89, v88, v40);
      *(unsigned char *)(v91 + v90) = v87 & 1;
      sub_100045890();
      sub_100045B40();
      uint64_t v92 = sub_100045AF0();
      sub_10000D8B8();
      v93();
      swift_release();
      v162 = (void *)v92;
      sub_100045B30();
      sub_100005794(&qword_10005CBC0);
      sub_10000D49C(&qword_10005CBC8, &qword_10005CBC0);
      uint64_t v94 = sub_100045AF0();
      sub_10000D8B8();
      v95();
      swift_release();
      v162 = (void *)v94;
      uint64_t v96 = swift_allocObject();
      v97 = v135;
      *(void *)(v96 + 16) = v135;
      id v155 = v97;
      sub_100005794(&qword_10005CA50);
      sub_100045B50();
      uint64_t v98 = sub_100005794(&qword_10005CBD0);
      uint64_t v99 = sub_10000D49C(&qword_10005CBD8, &qword_10005CBD0);
      uint64_t v139 = v98;
      uint64_t v138 = v99;
      uint64_t v140 = sub_100045AF0();
      sub_10000D8B8();
      v100();
      uint64_t v156 = v94;
      v162 = (void *)v94;
      if (qword_10005C468 != -1) {
        swift_once();
      }
      uint64_t v101 = v149;
      uint64_t v102 = sub_10000ACC0(v149, (uint64_t)qword_10005CAD8);
      uint64_t v103 = v148;
      uint64_t v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16);
      uint64_t v105 = v145;
      v104(v145, v102, v101);
      sub_10000F930();
      uint64_t v106 = swift_allocError();
      *uint64_t v107 = 3;
      uint64_t v108 = v144;
      v104(v144, v105, v101);
      unint64_t v109 = (*(unsigned __int8 *)(v103 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
      unint64_t v110 = (v143 + v109 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v111 = swift_allocObject();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v103 + 32))(v111 + v109, v108, v101);
      *(void *)(v111 + v110) = v106;
      swift_errorRetain();
      sub_100045B50();
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v105, v101);
      swift_errorRelease();
      uint64_t v112 = sub_100045AF0();
      sub_10000D8B8();
      v113();
      v162 = (void *)v112;
      sub_100005794(&qword_10005CBE0);
      sub_100005794(&qword_10005C5A0);
      sub_10000D49C(&qword_10005CBE8, &qword_10005CBE0);
      uint64_t v114 = sub_100045AE0();
      swift_release();
      v162 = (void *)v114;
      sub_100045B30();
      sub_100005794(&qword_10005CA70);
      sub_10000D49C(&qword_10005CA78, &qword_10005CA70);
      sub_100045AF0();
      sub_10000D8B8();
      v115();
      swift_release();
      sub_100045C70();
      sub_100045C70();
      uint64_t v116 = sub_1000460F0();
      v117 = (void *)sub_100046290();
      uint64_t v118 = swift_allocObject();
      *(void *)(v118 + 16) = v116;
      id v119 = v117;
      swift_bridgeObjectRetain();
      sub_10000FD34((uint64_t)sub_10000D494, v118, v119);
      swift_bridgeObjectRelease();
      swift_release();

      swift_release();
      sub_100005794(&qword_10005CA80);
      sub_10000D49C(&qword_10005CA88, &qword_10005CA80);
      sub_100045F50();
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v153;
      *(void *)(v120 + 16) = sub_10000FE64;
      *(void *)(v120 + 24) = v121;
      uint64_t v163 = sub_100045CC0();
      v164 = &protocol witness table for SyncTaskScheduler;
      sub_100006A38((uint64_t *)&v162);
      swift_retain();
      sub_100045CB0();
      uint64_t v65 = sub_100045F40();

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v162);
      uint64_t v122 = *(void (**)(char *, uint64_t))(v160 + 8);
      v122(v159, v40);
      v122(v161, v40);
    }
  }
  return v65;
}

uint64_t sub_10000F36C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005794(&qword_10005CA90);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000459A0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D5A0(*(void *)a1, *(void *)(a1 + 8));
  uint64_t result = sub_100045960();
  if (!v2)
  {
    sub_100045950();
    uint64_t v13 = sub_100045BD0();
    if (sub_10000678C((uint64_t)v7, 1, v13) == 1)
    {
      sub_10000D5F8((uint64_t)v7, &qword_10005CA90);
    }
    else
    {
      uint64_t v14 = sub_100045BC0();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v7, v13);
      if (v14)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        *a2 = v14;
        return result;
      }
    }
    sub_10000F930();
    swift_allocError();
    *uint64_t v15 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_10000F5A8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100045A20();
  __chkstk_darwin(v8 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v24 = type metadata accessor for JetpackV2Loader();
  v23[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100046140();
    uint64_t v13 = v12;

    sub_100045A10();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_100045A00(v25);
    sub_1000062B0(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = DynamicType;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v26._countAndFlagsBits = 5972026;
    v26._object = (void *)0xE300000000000000;
    sub_100045A00(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v21[0] = v11;
    v21[1] = v13;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_100045A00(v27);
    sub_1000062B0(v23, v24);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = v16;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v21, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_100045A00(v15);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v23);
  sub_1000459D0();
  uint64_t v17 = a1[3];
  uint64_t v18 = sub_1000062B0(a1, v17);
  uint64_t v24 = v17;
  uint64_t v19 = sub_100006A38(v23);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v19, v18, v17);
  sub_100045A40();
  sub_10000D5F8((uint64_t)v23, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_10000D53C((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for JetpackV2Loader()
{
  return self;
}

uint64_t sub_10000F90C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_10000E0CC(a1, a2, a3, a4);
}

unint64_t sub_10000F930()
{
  unint64_t result = qword_10005CBB8;
  if (!qword_10005CBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CBB8);
  }
  return result;
}

uint64_t sub_10000F97C()
{
  uint64_t v0 = sub_100045900();
  sub_10000ACF8(v0, qword_10005CAD8);
  sub_10000ACC0(v0, (uint64_t)qword_10005CAD8);
  return sub_100045910();
}

uint64_t sub_10000F9E0()
{
  sub_100045620();
  sub_10000D8E8();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  uint64_t v4 = *(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 1;
  sub_10000D8B8();
  v5();
  return _swift_deallocObject(v0, v4, v3);
}

uint64_t sub_10000FA64(uint64_t a1)
{
  uint64_t v3 = sub_100045620();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  int v9 = *(unsigned __int8 *)(v1 + v8 + *(void *)(v7 + 64));
  return sub_1000391FC(a1, v1 + v8, v9);
}

uint64_t sub_10000FAD4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000FB0C()
{
  return sub_100039520();
}

uint64_t sub_10000FB28()
{
  sub_100045900();
  sub_10000D8E8();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_10000D8B8();
  v5();
  swift_errorRelease();
  return _swift_deallocObject(v0, v4, v3);
}

uint64_t sub_10000FBBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_100045900();
  sub_100008628(v2);
  return sub_1000394BC(a1);
}

uint64_t sub_10000FC40()
{
  return sub_100045FC0();
}

uint64_t sub_10000FC74(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  a3(&v4);
  sub_100045FC0();
  return swift_bridgeObjectRelease();
}

uint64_t MetricsContext.overlay.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000FCC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MetricsContext.overlay.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000FCF4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000FD2C()
{
  return sub_10000FC40();
}

uint64_t sub_10000FD34(uint64_t a1, uint64_t a2, void *a3)
{
  v10[3] = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
  v10[4] = &protocol witness table for OS_dispatch_queue;
  v10[0] = a3;
  id v6 = a3;
  uint64_t v7 = sub_100046000();
  unint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  swift_retain_n();
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v10);
  return v7;
}

uint64_t sub_10000FE64@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000F5A8(a1, a2, v3, a3);
}

uint64_t sub_10000FE6C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000FEA4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000FED8()
{
  return sub_10000FD2C();
}

uint64_t sub_10000FEE0()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000FF20(uint64_t a1)
{
  return sub_10000FC74(a1, *(void *)(v1 + 16), *(void (**)(uint64_t *__return_ptr))(v1 + 24));
}

uint64_t getEnumTagSinglePayload for JetpackV2Loader.LoadError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for JetpackV2Loader.LoadError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100010080);
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

ValueMetadata *type metadata accessor for JetpackV2Loader.LoadError()
{
  return &type metadata for JetpackV2Loader.LoadError;
}

unint64_t sub_1000100BC()
{
  unint64_t result = qword_10005CBF0;
  if (!qword_10005CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CBF0);
  }
  return result;
}

uint64_t sub_10001012C()
{
  sub_1000062B0(v0, v0[3]);
  uint64_t v1 = sub_100010B60();
  if (v2(v1)) {
    return 0x73656E755469;
  }
  sub_1000062B0(v0, v0[3]);
  uint64_t v4 = sub_100010B60();
  if (v5(v4)) {
    return 0x64756F6C4369;
  }
  sub_1000062B0(v0, v0[3]);
  uint64_t v6 = sub_100010B60();
  if (v7(v6)) {
    return 1936548969;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

id sub_10001021C(void *a1)
{
  int v2 = v1;
  uint64_t v4 = self;
  id result = [v4 valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_32;
  }
  id v6 = result;
  sub_100010AB4();
  uint64_t v7 = sub_100010AD8();
  id result = [v4 valueWithBool:v8(v7) & 1 inContext:a1];
  if (!result)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_1000462F0();
  sub_100010AB4();
  uint64_t v9 = sub_100010AD8();
  v10(v9);
  if (v11)
  {
    sub_100010B24();
    id v12 = sub_100010B08();
    id result = sub_100010AEC((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v104);
    if (!result)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    sub_1000462F0();
  }
  sub_100010AB4();
  uint64_t v20 = sub_100010AD8();
  v21(v20);
  if (v22)
  {
    sub_100010B24();
    id v23 = sub_100010B08();
    id result = sub_100010AEC((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30, v104);
    if (!result)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    sub_1000462F0();
  }
  sub_100010AB4();
  uint64_t v31 = sub_100010AD8();
  uint64_t v33 = (void *)v32(v31);
  if (v33)
  {
    uint64_t v34 = v33;
    id v35 = [v33 stringValue];

    uint64_t v36 = sub_100046140();
    uint64_t v38 = v37;

    sub_1000106A0();
    uint64_t v106 = &type metadata for String;
    uint64_t v104 = v36;
    uint64_t v105 = v38;
    id v39 = a1;
    id result = sub_100026A70(&v104, a1);
    if (!result)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    sub_1000462F0();
  }
  sub_100010AB4();
  uint64_t v40 = sub_100010AD8();
  v41(v40);
  if (v42)
  {
    sub_100010B24();
    id v43 = sub_100010B08();
    id result = sub_100010AEC((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50, v104);
    if (!result)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    sub_1000462F0();
  }
  sub_100010AB4();
  uint64_t v51 = sub_100010AD8();
  v52(v51);
  if (v53)
  {
    sub_100010B24();
    id v54 = sub_100010B08();
    id result = sub_100010AEC((uint64_t)v54, v55, v56, v57, v58, v59, v60, v61, v104);
    if (!result)
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    sub_1000462F0();
  }
  sub_100010AB4();
  uint64_t v62 = sub_100010AD8();
  v63(v62);
  if (v64)
  {
    sub_100010B24();
    id v65 = sub_100010B08();
    id result = sub_100010AEC((uint64_t)v65, v66, v67, v68, v69, v70, v71, v72, v104);
    if (!result)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    sub_1000462F0();
  }
  sub_1000106A0();
  uint64_t v73 = sub_10001012C();
  uint64_t v106 = &type metadata for String;
  uint64_t v104 = v73;
  uint64_t v105 = v74;
  id v75 = a1;
  id result = sub_100010AEC((uint64_t)v75, v76, v77, v78, v79, v80, v81, v82, v104);
  if (!result) {
    goto LABEL_33;
  }
  sub_1000462F0();
  uint64_t v83 = v2[3];
  uint64_t v84 = v2[4];
  sub_1000062B0(v2, v83);
  uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 88))(v83, v84);
  if (v86)
  {
    uint64_t v106 = &type metadata for String;
    uint64_t v104 = v85;
    uint64_t v105 = v86;
    id v87 = v75;
    id result = sub_100010AEC((uint64_t)v87, v88, v89, v90, v91, v92, v93, v94, v104);
    if (!result)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    sub_1000462F0();
  }
  sub_100010B88();
  uint64_t v95 = sub_100010B74();
  char v97 = v96(v95);
  if (v97 == 2)
  {
LABEL_28:
    sub_100010B88();
    uint64_t v98 = sub_100010B74();
    char v100 = v99(v98);
    id result = sub_100010B40(v100);
    if (result)
    {
      sub_1000462F0();
      sub_100010B88();
      uint64_t v101 = sub_100010B74();
      char v103 = v102(v101);
      id result = sub_100010B40(v103);
      if (result)
      {
        sub_1000462F0();
        return v6;
      }
      goto LABEL_35;
    }
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id result = sub_100010B40(v97);
  if (result)
  {
    sub_1000462F0();
    goto LABEL_28;
  }
LABEL_43:
  __break(1u);
  return result;
}

unint64_t sub_1000106A0()
{
  unint64_t result = qword_10005C5C0;
  if (!qword_10005C5C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C5C0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for JSAccount(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for JSAccount(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for JSAccount(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *sub_100010798(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
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
          *unint64_t result = *a2;
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
          *long long v3 = *a2;
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

__n128 initializeWithTake for JSAccount(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for JSAccount(uint64_t a1, uint64_t a2)
{
  _s16UtilityExtension9JSAccountVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSAccount(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSAccount(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSAccount()
{
  return &type metadata for JSAccount;
}

void *sub_100010AB4()
{
  return sub_1000062B0(v0, v0[3]);
}

uint64_t sub_100010AD8()
{
  return v0;
}

id sub_100010AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100026A70(&a9, v9);
}

id sub_100010B08()
{
  return v0;
}

unint64_t sub_100010B24()
{
  return sub_1000106A0();
}

id sub_100010B40(char a1)
{
  uint64_t v5 = *(const char **)(v3 + 3328);
  return objc_msgSend(v1, v5, a1 & 1, v2);
}

uint64_t sub_100010B60()
{
  return v0;
}

uint64_t sub_100010B74()
{
  return v0;
}

void *sub_100010B88()
{
  return sub_1000062B0(v0, v0[3]);
}

id sub_100010BAC(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16UtilityExtension15JSAccountObject_dynamicAccountsStore] = a1;
  *(void *)&v2[OBJC_IVAR____TtC16UtilityExtension15JSAccountObject_clientInfo] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t sub_100010C3C()
{
  uint64_t v0 = DynamicAccountsStore.account.getter();
  uint64_t v1 = sub_1000122F4();

  return v1;
}

uint64_t sub_100010CC0()
{
  uint64_t v1 = self;
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC16UtilityExtension15JSAccountObject_clientInfo), "accountMediaType"));
  id v3 = objc_msgSend(v1, "ams_sharedAccountStoreForMediaType:", v2);

  id v4 = objc_msgSend(v3, "ams_localiTunesAccount");
  uint64_t v5 = sub_1000122F4();

  return v5;
}

uint64_t sub_100010DAC()
{
  return sub_100010EDC((SEL *)&selRef_ams_activeiTunesAccount);
}

uint64_t sub_100010DFC()
{
  id v0 = sub_100010E30();
  uint64_t v1 = sub_1000122F4();

  return v1;
}

id sub_100010E30()
{
  return sub_100010FD0((SEL *)&selRef_ams_activeiTunesAccount);
}

uint64_t sub_100010E80()
{
  return sub_100010EDC((SEL *)&selRef_ams_activeiCloudAccount);
}

uint64_t sub_100010ED0()
{
  return sub_100010EDC((SEL *)&selRef_ams_localiTunesAccount);
}

uint64_t sub_100010EDC(SEL *a1)
{
  id v2 = objc_msgSend(self, "ams_sharedAccountStore");
  id v3 = [v2 *a1];

  uint64_t v4 = sub_1000122F4();
  return v4;
}

uint64_t sub_100010F90()
{
  id v0 = sub_100010FC4();
  uint64_t v1 = sub_1000122F4();

  return v1;
}

id sub_100010FC4()
{
  return sub_100010FD0((SEL *)&selRef_ams_localiTunesAccount);
}

id sub_100010FD0(SEL *a1)
{
  id v2 = objc_msgSend(self, "ams_sharedAccountStore");
  id v3 = [v2 *a1];

  return v3;
}

uint64_t sub_100011030()
{
  sub_1000067B4(0, &qword_10005CC30);
  id v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

void *sub_1000110BC(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v25 = a1;
  uint64_t v7 = sub_100046090();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_100045CE0();
  uint64_t v12 = sub_100045CD0();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v21 = v7;
    uint64_t v22 = a4;
    uint64_t v20 = v8;
    uint64_t v11 = sub_100010E30();
    id v14 = sub_100010FC4();
    id v15 = objc_msgSend(self, "ams_sharedAccountStore");
    __src[3] = sub_1000067B4(0, &qword_10005CC38);
    __src[4] = &off_100055770;
    __src[0] = v15;
    sub_10001139C(a3, v11, v14, __src, (uint64_t)v24);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)__src);
    if (v4)
    {
      swift_release();
    }
    else
    {

      sub_10001259C((uint64_t)v24, (uint64_t)__src);
      uint64_t v16 = (void *)swift_allocObject();
      memcpy(v16 + 2, __src, 0x42uLL);
      uint64_t v17 = v22;
      v16[11] = v22;
      v16[12] = v13;
      v25;
      id v18 = v17;
      swift_retain();
      sub_100046070();
      uint64_t v11 = (void *)sub_100046080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v21);
      sub_100012668((uint64_t)v24);
    }
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v11;
}

void sub_10001139C(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X3>, void *a4@<X4>, uint64_t a5@<X8>)
{
  sub_100045A20();
  __chkstk_darwin();
  uint64_t v10 = sub_1000462D0();
  uint64_t v54 = v11;
  if (!v11)
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    goto LABEL_5;
  }
  uint64_t v46 = a1;
  id v43 = a2;
  uint64_t v42 = a3;
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v45 = (void *)sub_100005794(&qword_10005CC48);
  uint64_t v49 = v45;
  v48[0] = &type metadata for AccountObjectHelper;
  id v12 = (id)AMSLogKey();
  uint64_t v44 = a5;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100046140();
    uint64_t v15 = v10;
    uint64_t v17 = v16;

    sub_100045A10();
    v55._countAndFlagsBits = 0;
    v55._object = (void *)0xE000000000000000;
    sub_100045A00(v55);
    sub_1000062B0(v48, (uint64_t)v49);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v56._countAndFlagsBits = 5972026;
    v56._object = (void *)0xE300000000000000;
    sub_100045A00(v56);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v51 = v14;
    uint64_t v52 = v17;
    uint64_t v10 = v15;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v57._countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    sub_100045A00(v57);
    sub_1000062B0(v48, (uint64_t)v49);
    uint64_t v20 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v20;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_100045A00(v19);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v48);
  sub_1000459D0();
  uint64_t v49 = &type metadata for String;
  v48[0] = v10;
  v48[1] = v54;
  swift_bridgeObjectRetain();
  sub_100045A40();
  sub_100008588((uint64_t)v48);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v21 = a4[3];
  uint64_t v22 = a4[4];
  sub_1000062B0(a4, v21);
  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 8))(v46, v21, v22);
  uint64_t v24 = (void *)v23;
  if (!v23)
  {
    uint64_t v26 = v43;
    if (v43 || (uint64_t v26 = v42) != 0)
    {
      id v25 = v26;
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
LABEL_5:
    sub_100045E20();
    swift_willThrow();
    return;
  }
  id v25 = (id)v23;
LABEL_12:
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v49 = v45;
  v48[0] = &type metadata for AccountObjectHelper;
  id v27 = v24;
  id v28 = (id)AMSLogKey();
  uint64_t v47 = v27;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = sub_100046140();
    uint64_t v31 = v10;
    uint64_t v33 = v32;

    sub_100045A10();
    v58._countAndFlagsBits = 0;
    v58._object = (void *)0xE000000000000000;
    sub_100045A00(v58);
    sub_1000062B0(v48, (uint64_t)v49);
    uint64_t v34 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v34;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v59._countAndFlagsBits = 5972026;
    v59._object = (void *)0xE300000000000000;
    sub_100045A00(v59);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v51 = v30;
    uint64_t v52 = v33;
    uint64_t v10 = v31;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v35._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    sub_100045A00(v60);
    sub_1000062B0(v48, (uint64_t)v49);
    uint64_t v36 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v36;
    sub_1000459F0();
    sub_100008588((uint64_t)&v51);
    v35._countAndFlagsBits = 58;
  }
  v35._object = (void *)0xE100000000000000;
  sub_100045A00(v35);
  sub_100045A30();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v48);
  sub_1000459D0();
  uint64_t v37 = (void *)sub_1000067B4(0, (unint64_t *)&qword_10005C6E0);
  uint64_t v49 = v37;
  v48[0] = v25;
  id v38 = v25;
  sub_100045A60();
  sub_100008588((uint64_t)v48);
  sub_100035648();
  swift_bridgeObjectRelease();
  id v39 = self;
  uint64_t v40 = v54;
  NSString v41 = sub_100046110();
  LOBYTE(v39) = [v39 acknowledgementNeededForPrivacyIdentifier:v41 account:v38];

  uint64_t v49 = v37;
  uint64_t v50 = &off_1000557D0;
  v48[0] = v38;
  sub_100012A40(v48, v10, v40, (char)v39, v44);
}

uint64_t sub_100011AC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v18 = a6;
  uint64_t v10 = sub_100045940();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin();
  sub_100005794(&qword_10005CC40);
  sub_10001259C(a4, (uint64_t)v19);
  sub_100045F80();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  *(void *)(v14 + ((v12 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  v19[3] = sub_100045CE0();
  v19[4] = &protocol witness table for RunLoopWorkerThread;
  v19[0] = v18;
  id v15 = a5;
  id v16 = a1;
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v19);
}

void sub_100011CB4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  sub_100045A20();
  __chkstk_darwin();
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v21 = (ValueMetadata *)type metadata accessor for JSAccountObject();
  v20[0] = a2;
  a2;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100046140();
    uint64_t v10 = v9;

    sub_100045A10();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_100045A00(v22);
    sub_1000062B0(v20, (uint64_t)v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v18);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_100045A00(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v8;
    v18[1] = v10;
    sub_1000459F0();
    sub_100008588((uint64_t)v18);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_100045A00(v24);
    sub_1000062B0(v20, (uint64_t)v21);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v13;
    sub_1000459F0();
    sub_100008588((uint64_t)v18);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_100045A00(v12);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
  sub_1000459D0();
  uint64_t v21 = &type metadata for JSAccountPrivacyAcknowledgementState;
  v20[0] = swift_allocObject();
  sub_10001259C(a1, v20[0] + 16);
  sub_100045A40();
  sub_100008588((uint64_t)v20);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_100047690;
  id v15 = sub_10001289C(a4);
  *(void *)(v14 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v14 + 32) = v15;
  id v16 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000122F4()
{
  sub_1000067B4(0, &qword_10005CC30);
  id v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

id sub_10001236C(void *a1, void *a2)
{
  if (a2)
  {
    v7[3] = sub_1000067B4(0, (unint64_t *)&qword_10005C6E0);
    v7[4] = &off_1000557D0;
    v7[0] = a2;
    id v4 = a2;
    id v5 = sub_10001021C(a1);
    sub_100012528((uint64_t)v7);
    return v5;
  }
  id result = [self valueWithUndefinedInContext:a1];
  id v5 = result;
  if (result) {
    return v5;
  }
  __break(1u);
  return result;
}

void sub_100012428()
{
}

id sub_100012468()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAccountObject()
{
  return self;
}

id sub_10001250C(void *a1)
{
  return sub_10001236C(a1, *(void **)(v1 + 16));
}

uint64_t sub_100012528(uint64_t a1)
{
  return a1;
}

void *sub_10001257C(void *a1)
{
  return sub_1000110BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_10001259C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000125F8()
{
  _s16UtilityExtension9JSAccountVwxx_0(v0 + 16);
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_100012648(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100011AC4(a1, a2, a3, v3 + 16, *(void **)(v3 + 88), *(void *)(v3 + 96));
}

uint64_t sub_100012668(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000126BC()
{
  uint64_t v1 = sub_100045940();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000127A4(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100045940() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void **)(v1 + 16);
  unint64_t v6 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_100011CB4(a1, v5, v1 + v4, v6);
}

uint64_t sub_100012844()
{
  _s16UtilityExtension9JSAccountVwxx_0(v0 + 16);
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 82, 7);
}

ValueMetadata *type metadata accessor for AccountObjectHelper()
{
  return &type metadata for AccountObjectHelper;
}

id sub_10001289C(void *a1)
{
  uint64_t v3 = self;
  id result = [v3 valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v5 = result;
  sub_10001021C(a1);
  sub_1000462F0();
  sub_1000106A0();
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v11 = &type metadata for String;
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  id v8 = a1;
  id result = sub_100026A70(&v9, a1);
  if (!result)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_1000462F0();
  if (*(unsigned char *)(v1 + 64)) {
    goto LABEL_6;
  }
  id result = objc_msgSend(v3, "valueWithDouble:inContext:", v8, (double)*(uint64_t *)(v1 + 56), v9, v10);
  if (result)
  {
    sub_1000462F0();
LABEL_6:
    id result = objc_msgSend(v3, "valueWithBool:inContext:", *(unsigned __int8 *)(v1 + 65), v8, v9, v10);
    if (result)
    {
      sub_1000462F0();
      return v5;
    }
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100012A40@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_1000062B0(a1, v10);
  id v12 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96))(v10, v11);
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10002F948(a2, a3, (uint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13)
    {
      id v12 = [v13 integerValue];

      char v14 = 0;
      goto LABEL_6;
    }
    id v12 = 0;
  }
  char v14 = 1;
LABEL_6:
  sub_10000D53C((uint64_t)a1, a5);
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = v12;
  *(unsigned char *)(a5 + 64) = v14;
  *(unsigned char *)(a5 + 65) = a4 & 1;
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
}

uint64_t destroy for JSAccountPrivacyAcknowledgementState(uint64_t a1)
{
  _s16UtilityExtension9JSAccountVwxx_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  sub_100010798((uint64_t *)a1, (uint64_t *)a2);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

void *initializeWithTake for JSAccountPrivacyAcknowledgementState(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x42uLL);
}

uint64_t assignWithTake for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  _s16UtilityExtension9JSAccountVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSAccountPrivacyAcknowledgementState(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 66))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSAccountPrivacyAcknowledgementState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 66) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 66) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSAccountPrivacyAcknowledgementState()
{
  return &type metadata for JSAccountPrivacyAcknowledgementState;
}

uint64_t sub_100012D78()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_100012DE0()
{
  sub_100045CE0();
  uint64_t v0 = sub_100045CD0();
  sub_100045E70();
  sub_100008AAC();
  swift_allocError();
  sub_100045E20();
  if (!v0) {
    return swift_willThrow();
  }
  swift_willThrow();
  return swift_release();
}

uint64_t sub_100012F34()
{
  return sub_10001398C();
}

uint64_t sub_100012F4C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100046090();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045A20();
  __chkstk_darwin();
  uint64_t v10 = sub_100045CE0();
  uint64_t v11 = sub_100045CD0();
  if (v11)
  {
    uint64_t v12 = v11;
    id v37 = a1;
    id v38 = v9;
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v41[0] = a2;
    id v13 = a2;
    id v14 = (id)AMSLogKey();
    id v36 = v13;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = sub_100046140();
      uint64_t v18 = v17;

      sub_100045A10();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_100045A00(v44);
      sub_1000062B0(v41, Object);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = DynamicType;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v45._countAndFlagsBits = 5972026;
      v45._object = (void *)0xE300000000000000;
      sub_100045A00(v45);
      uint64_t MetatypeMetadata = &type metadata for String;
      v39[0] = v16;
      v39[1] = v18;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v20._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_100045A00(v46);
      sub_1000062B0(v41, Object);
      uint64_t v21 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = v21;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v20._countAndFlagsBits = 58;
    }
    uint64_t v22 = v43;
    v20._object = (void *)0xE100000000000000;
    sub_100045A00(v20);
    sub_100045A30();
    uint64_t v10 = type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v41);
    sub_1000459D0();
    uint64_t Object = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    v41[0] = a3;
    id v23 = a3;
    sub_100045A40();
    sub_100008588((uint64_t)v41);
    sub_100035648();
    swift_bridgeObjectRelease();
    sub_100004D38(v23);
    if (!v22)
    {
      if (v24)
      {
        swift_bridgeObjectRelease();
        sub_1000067B4(0, &qword_10005CD00);
        id v26 = sub_1000134F4();
        id v27 = (void *)swift_allocObject();
        id v28 = v36;
        v27[2] = v26;
        v27[3] = v28;
        void v27[4] = v12;
        id v29 = v28;
        id v30 = v37;
        id v31 = v26;
        swift_retain();
        uint64_t v32 = v38;
        sub_100046070();
        uint64_t v10 = sub_100046080();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
        return v10;
      }
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100045E70();
      sub_100008AAC();
      swift_allocError();
      sub_100045E20();
      swift_willThrow();
    }
    swift_release();
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v10;
}

id sub_1000134F4()
{
  Class isa = sub_1000461E0().super.isa;
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() queryForBundleIDs:isa];

  return v1;
}

uint64_t sub_100013560(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v36 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a3;
  NSString v41 = a1;
  uint64_t v8 = sub_100045940();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin();
  uint64_t v31 = v10;
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005794(&qword_10005CD08);
  uint64_t v12 = sub_100046000();
  id v39 = sub_100014FE4;
  uint64_t v40 = v12;
  uint64_t v35 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013870;
  id v38 = &unk_100056060;
  id v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a4 executeQueryWithResultHandler:v13];
  _Block_release(v13);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v32(v11, a2, v8);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v33;
  uint64_t v17 = v41;
  *(void *)(v15 + 16) = v33;
  *(void *)(v15 + 24) = v17;
  uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  id v30 = v11;
  v18(v15 + ((v14 + 32) & ~v14), v11, v8);
  Swift::String v19 = v11;
  uint64_t v20 = v8;
  v32(v19, v34, v8);
  uint64_t v21 = (v14 + 24) & ~v14;
  unint64_t v22 = (v31 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v16;
  v18(v23 + v21, v30, v20);
  uint64_t v24 = v41;
  *(void *)(v23 + v22) = v41;
  id v38 = (void *)sub_100045CE0();
  id v39 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  aBlock[0] = v36;
  id v25 = v16;
  id v26 = v24;
  id v27 = v25;
  id v28 = v26;
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  swift_release();
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100013870(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1000067B4(0, (unint64_t *)&unk_10005CD20);
    uint64_t v4 = sub_1000461F0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100013974()
{
  return sub_10001398C();
}

uint64_t sub_10001398C()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_100013A04(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100046090();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045A20();
  __chkstk_darwin();
  uint64_t v10 = sub_100045CE0();
  uint64_t v11 = sub_100045CD0();
  if (v11)
  {
    uint64_t v12 = v11;
    id v37 = a1;
    id v38 = v9;
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v41[0] = a2;
    id v13 = a2;
    id v14 = (id)AMSLogKey();
    id v36 = v13;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = sub_100046140();
      uint64_t v18 = v17;

      sub_100045A10();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_100045A00(v44);
      sub_1000062B0(v41, Object);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = DynamicType;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v45._countAndFlagsBits = 5972026;
      v45._object = (void *)0xE300000000000000;
      sub_100045A00(v45);
      uint64_t MetatypeMetadata = &type metadata for String;
      v39[0] = v16;
      v39[1] = v18;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v20._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_100045A00(v46);
      sub_1000062B0(v41, Object);
      uint64_t v21 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = v21;
      sub_1000459F0();
      sub_100008588((uint64_t)v39);
      v20._countAndFlagsBits = 58;
    }
    uint64_t v22 = v43;
    v20._object = (void *)0xE100000000000000;
    sub_100045A00(v20);
    sub_100045A30();
    uint64_t v10 = type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v41);
    sub_1000459D0();
    uint64_t Object = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    v41[0] = a3;
    id v23 = a3;
    sub_100045A40();
    sub_100008588((uint64_t)v41);
    sub_100035648();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_100004D38(v23);
    if (!v22)
    {
      if (v24)
      {
        swift_bridgeObjectRelease();
        sub_1000067B4(0, &qword_10005CD00);
        id v26 = sub_100013FB4();
        id v27 = (void *)swift_allocObject();
        id v28 = v36;
        v27[2] = v26;
        v27[3] = v28;
        void v27[4] = v12;
        id v29 = v28;
        id v30 = v37;
        id v31 = v26;
        swift_retain();
        uint64_t v32 = v38;
        sub_100046070();
        uint64_t v10 = sub_100046080();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
        return v10;
      }
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100045E70();
      sub_100008AAC();
      swift_allocError();
      sub_100045E20();
      swift_willThrow();
    }
    swift_release();
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v10;
}

id sub_100013FB4()
{
  sub_1000067B4(0, (unint64_t *)&qword_10005C588);
  Class isa = sub_1000461E0().super.isa;
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() queryForStoreItemIDs:isa];

  return v1;
}

uint64_t sub_100014038(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v36 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a3;
  NSString v41 = a1;
  uint64_t v8 = sub_100045940();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin();
  uint64_t v31 = v10;
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005794(&qword_10005CD08);
  uint64_t v12 = sub_100046000();
  id v39 = sub_100014FE4;
  uint64_t v40 = v12;
  uint64_t v35 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013870;
  id v38 = &unk_100055FC0;
  id v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [a4 executeQueryWithResultHandler:v13];
  _Block_release(v13);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v32(v11, a2, v8);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v33;
  uint64_t v17 = v41;
  *(void *)(v15 + 16) = v33;
  *(void *)(v15 + 24) = v17;
  uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  id v30 = v11;
  v18(v15 + ((v14 + 32) & ~v14), v11, v8);
  Swift::String v19 = v11;
  uint64_t v20 = v8;
  v32(v19, v34, v8);
  uint64_t v21 = (v14 + 24) & ~v14;
  unint64_t v22 = (v31 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v16;
  v18(v23 + v21, v30, v20);
  uint64_t v24 = v41;
  *(void *)(v23 + v22) = v41;
  id v38 = (void *)sub_100045CE0();
  id v39 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  aBlock[0] = v36;
  id v25 = v16;
  id v26 = v24;
  id v27 = v25;
  id v28 = v26;
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  swift_release();
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)aBlock);
}

void sub_100014348(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    NSString v2 = sub_100046110();
    swift_getErrorValue();
    sub_1000465F0();
    NSString v3 = sub_100046110();
    swift_bridgeObjectRelease();
    id v4 = (id)AMSError();

    sub_100045FA0();
    swift_errorRelease();
  }
  else if (a1)
  {
    sub_100045FC0();
  }
  else
  {
    NSString v5 = sub_100046110();
    id v6 = (id)AMSError();

    sub_100045FA0();
  }
}

void sub_1000144B8(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045A20();
  __chkstk_darwin(v5 - 8);
  sub_1000153AC();
  uint64_t v6 = *a1;
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v7 = sub_100045A70();
  sub_100008628(v7);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t Object = type metadata accessor for JSAppQueryObject();
  v22[0] = a2;
  a2;
  id v8 = (id)AMSLogKey();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_100046140();
    uint64_t v12 = v11;

    sub_100015390();
    sub_10001533C();
    sub_1000152E4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10001531C(MetatypeMetadata);
    sub_100008588((uint64_t)v21);
    sub_100015358();
    void v21[3] = &type metadata for String;
    v21[0] = v10;
    v21[1] = v12;
    sub_1000459F0();
    sub_100008588((uint64_t)v21);
    v14._countAndFlagsBits = 93;
  }
  else
  {
    sub_100015374();
    sub_10001533C();
    sub_1000152E4();
    uint64_t v15 = swift_getMetatypeMetadata();
    sub_10001531C(v15);
    sub_100008588((uint64_t)v21);
    v14._countAndFlagsBits = 58;
  }
  sub_1000153DC(v14);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v22);
  sub_1000459D0();
  uint64_t Object = sub_100005794(&qword_10005CD18);
  v22[0] = v6;
  swift_bridgeObjectRetain();
  sub_100045A40();
  sub_100008588((uint64_t)v22);
  sub_100035648();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v16 = sub_1000059C8(a3, v6);
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100047690;
  *(void *)(v17 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v17 + 32) = v16;
  id v18 = v16;
  Swift::String v19 = (void *)sub_100045930();

  swift_bridgeObjectRelease();
}

void sub_100014940(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045E70();
  sub_10000AD5C();
  uint64_t v43 = v8;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100045A20();
  __chkstk_darwin(v12 - 8);
  sub_1000153AC();
  uint64_t v13 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v14 = sub_100045A70();
  sub_100008628(v14);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v42 = v13;
  uint64_t v40 = v19 + 3 * v16;
  uint64_t v39 = v18 | 7;
  uint64_t v20 = swift_allocObject();
  long long v38 = xmmword_100047880;
  *(_OWORD *)(v20 + 16) = xmmword_100047880;
  uint64_t v41 = v19;
  uint64_t Object = type metadata accessor for JSAppQueryObject();
  uint64_t v50 = Object;
  v49[0] = (uint64_t)a2;
  id v36 = a2;
  id v21 = (id)AMSLogKey();
  uint64_t v44 = v7;
  Swift::String v45 = a4;
  if (v21)
  {
    unint64_t v22 = v21;
    uint64_t v23 = sub_100046140();
    uint64_t v25 = v24;

    sub_100015390();
    sub_10001533C();
    sub_1000152E4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10001531C(MetatypeMetadata);
    sub_100008588((uint64_t)v48);
    sub_100015358();
    void v48[3] = &type metadata for String;
    v48[0] = v23;
    v48[1] = v25;
    sub_1000459F0();
    sub_100008588((uint64_t)v48);
    v27._countAndFlagsBits = 93;
  }
  else
  {
    sub_100015374();
    sub_10001533C();
    sub_1000152E4();
    uint64_t v28 = swift_getMetatypeMetadata();
    sub_10001531C(v28);
    sub_100008588((uint64_t)v48);
    v27._countAndFlagsBits = 58;
  }
  sub_1000153DC(v27);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v49);
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v29 = v46;
  uint64_t v30 = v47;
  uint64_t v50 = v47;
  uint64_t v31 = sub_100006A38(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v31, v29, v30);
  sub_100045A40();
  sub_100008588((uint64_t)v49);
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_100047690;
  swift_errorRetain();
  sub_10001AF30(a1);
  v33.super.Class isa = v45;
  Class isa = sub_100045E50(v33).super.isa;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  *(void *)(v32 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v32 + 32) = isa;
  uint64_t v35 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

id sub_100014EF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100014F4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAppQueryObject()
{
  return self;
}

uint64_t sub_100014FA4(void *a1)
{
  return sub_100013A04(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100014FC4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100014038(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

void sub_100014FE4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100015000(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015010()
{
  return swift_release();
}

uint64_t sub_100015028(void *a1)
{
  return sub_100012F4C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100015048()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100015090(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100013560(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_1000150B4()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_1000153C4();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

void sub_100015150(uint64_t *a1)
{
  sub_100045940();
  sub_1000144B8(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000151BC()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_1000153C4();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_10001526C(uint64_t a1)
{
  uint64_t v3 = sub_100045940();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100014940(a1, *(void **)(v1 + 16), v1 + v8, *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000152E4()
{
  sub_1000062B0((void *)(v0 - 120), *(void *)(v0 - 96));
  return swift_getDynamicType();
}

uint64_t sub_10001531C(uint64_t a1)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 152) = v1;
  return sub_1000459F0();
}

void sub_10001533C()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_100045A00(v1);
}

void sub_100015358()
{
  v1._countAndFlagsBits = 5972026;
  v1._object = (void *)0xE300000000000000;
  sub_100045A00(v1);
}

uint64_t sub_100015374()
{
  return sub_100045A10();
}

uint64_t sub_100015390()
{
  return sub_100045A10();
}

uint64_t sub_1000153C4()
{
  return v0 + v1;
}

void sub_1000153DC(Swift::String a1)
{
  a1._object = (void *)0xE100000000000000;
  sub_100045A00(a1);
}

id sub_1000153F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC16UtilityExtension14JSClientObject_clientInfo] = a1;
  uint64_t v6 = &v5[OBJC_IVAR____TtC16UtilityExtension14JSClientObject_mediaClient];
  *(void *)uint64_t v6 = a2;
  *((void *)v6 + 1) = a3;
  uint64_t v7 = &v5[OBJC_IVAR____TtC16UtilityExtension14JSClientObject_metricsContext];
  char *v7 = a4;
  *((void *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_100015480()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16UtilityExtension14JSClientObject_metricsContext);
}

uint64_t sub_1000154A8()
{
  return sub_100015668((SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_100015510()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16UtilityExtension14JSClientObject_mediaClient);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1000155C0()
{
  return swift_bridgeObjectRetain();
}

id sub_1000155EC(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10001565C()
{
  return sub_100015668((SEL *)&selRef_clientVersion);
}

uint64_t sub_100015668(SEL *a1)
{
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC16UtilityExtension14JSClientObject_clientInfo), *a1));
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_100046140();

  return v4;
}

void sub_1000156D8()
{
}

id sub_100015718()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSClientObject()
{
  return self;
}

const char *sub_1000157D4()
{
  return "AppleMediaServicesUI";
}

const char *sub_1000157E8()
{
  return "JetIntents";
}

uint64_t sub_1000157FC(uint64_t a1)
{
  uint64_t v2 = sub_100045F00();
  uint64_t v3 = sub_100018C3C(v2);
  __chkstk_darwin(v3);
  sub_10000D898();
  uint64_t v116 = v4;
  sub_100018CD4();
  uint64_t v142 = sub_100045EA0();
  uint64_t v125 = *(void *)(v142 - 8);
  uint64_t v5 = v125;
  __chkstk_darwin(v142);
  sub_10000D898();
  uint64_t v115 = v6;
  uint64_t v7 = sub_100005794(&qword_10005C8E8);
  uint64_t v8 = sub_100018C3C(v7);
  __chkstk_darwin(v8);
  sub_10000D898();
  uint64_t v123 = v9;
  sub_100018CD4();
  uint64_t v10 = sub_100045620();
  sub_10000AD5C();
  uint64_t v127 = v11;
  __chkstk_darwin(v12);
  sub_100018C78();
  uint64_t v126 = v14 - v13;
  uint64_t v15 = sub_100045DD0();
  sub_10000AD5C();
  uint64_t v129 = v16;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v124 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v134 = (char *)&v107 - v20;
  type metadata accessor for DynamicAccountsStore();
  sub_100045C20();
  sub_100045DE0();
  uint64_t v21 = v141[0];
  id v111 = DynamicAccountsStore.account.getter();
  uint64_t v135 = v15;
  sub_100045DE0();
  sub_1000067B4(0, &qword_10005C6E8);
  sub_100018B7C();
  id v121 = (id)v141[0];
  sub_100018B7C();
  sub_1000067B4(0, &qword_10005C9E8);
  sub_100018B7C();
  id v114 = v139;
  sub_100018B7C();
  uint64_t v131 = (uint64_t)v139;
  id v137 = v140;
  sub_100018B7C();
  LODWORD(v122) = v139;
  id v109 = v140;
  uint64_t v128 = v10;
  sub_100045DE0();
  type metadata accessor for URLSessionHandler();
  uint64_t v118 = a1;
  sub_100018B7C();
  id v110 = v139;
  sub_100005794(&qword_10005CEB0);
  uint64_t v22 = *(void *)(v5 + 72);
  uint64_t v23 = v125;
  unint64_t v24 = (*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80);
  uint64_t v25 = swift_allocObject();
  size_t v112 = v25;
  *(_OWORD *)(v25 + 16) = xmmword_100047D80;
  unint64_t v113 = v24;
  unint64_t v26 = v25 + v24;
  sub_10000D53C((uint64_t)v141, v25 + v24);
  uint64_t v130 = *(void (**)(void))(v23 + 104);
  uint64_t v27 = v142;
  sub_100018BDC();
  v28();
  uint64_t v29 = (void *)(v26 + v22);
  id v30 = objc_allocWithZone((Class)type metadata accessor for JSAccountObject());
  uint64_t v133 = v21;
  swift_retain();
  id v31 = v121;
  id v32 = sub_100010BAC(v21, (uint64_t)v31);
  *uint64_t v29 = 0x746E756F636361;
  v29[1] = 0xE700000000000000;
  v29[2] = v32;
  uint64_t v33 = enum case for JSStack.Prerequisite.globalObject(_:);
  uint64_t v34 = v27;
  uint64_t v35 = v130;
  uint64_t v136 = v23 + 104;
  sub_100018BDC();
  v35();
  id v36 = [objc_allocWithZone((Class)type metadata accessor for JSAppQueryObject()) init];
  id v37 = sub_100018BCC((uint64_t)v36, 0x7972657551707061);
  ((void (*)(void *, uint64_t, uint64_t))v35)(v37, v33, v34);
  long long v38 = (void *)(v26 + 3 * v22);
  unint64_t v39 = v26;
  id v40 = objc_allocWithZone((Class)type metadata accessor for JSClientObject());
  id v41 = v31;
  id v108 = v41;
  uint64_t v42 = (uint64_t)v137;
  swift_bridgeObjectRetain();
  id v43 = sub_1000153F4((uint64_t)v41, v131, v42, v122, (uint64_t)v109);
  void *v38 = 0x746E65696C63;
  v38[1] = 0xE600000000000000;
  v38[2] = v43;
  uint64_t v44 = v35;
  sub_100018BDC();
  v35();
  unint64_t v120 = v39;
  Swift::String v45 = (void *)(v39 + 4 * v22);
  id v46 = [objc_allocWithZone((Class)type metadata accessor for JSDeviceObject()) init];
  *Swift::String v45 = 0x656369766564;
  v45[1] = 0xE600000000000000;
  void v45[2] = v46;
  LODWORD(v41) = v33;
  sub_100018BDC();
  v35();
  uint64_t v47 = v141[5];
  uint64_t v48 = (objc_class *)type metadata accessor for JSLocalizationObject();
  uint64_t v49 = (char *)objc_allocWithZone(v48);
  *(void *)&v49[OBJC_IVAR____TtC16UtilityExtension20JSLocalizationObject_localizations] = v47;
  v138.receiver = v49;
  v138.super_class = v48;
  swift_bridgeObjectRetain();
  id v50 = objc_msgSendSuper2(&v138, "init");
  sub_100018BCC((uint64_t)v50, 0x617A696C61636F6CLL);
  LODWORD(v121) = v41;
  sub_100018BDC();
  v35();
  unint64_t v51 = v120;
  id v52 = [objc_allocWithZone((Class)type metadata accessor for JSLogObject()) init];
  sub_100018BCC((uint64_t)v52, 6778732);
  sub_100018BDC();
  v35();
  uint64_t v132 = v22;
  unint64_t v53 = v51;
  uint64_t v54 = v128;
  uint64_t v55 = (uint64_t)v123;
  (*(void (**)(void, uint64_t, uint64_t))(v127 + 16))(v123, v126, v128);
  sub_1000066FC(v55, 0, 1, v54);
  id v56 = objc_allocWithZone((Class)type metadata accessor for JSServiceObject());
  id v57 = sub_1000267DC(v55);
  sub_100018CC0((uint64_t)v57, 0x65636976726573);
  uint64_t v58 = v121;
  sub_100018BDC();
  v44();
  uint64_t v59 = v132;
  Swift::String v60 = (void *)(v53 + 8 * v132);
  uint64_t v61 = *(void (**)(void, void, void))(v129 + 16);
  uint64_t v122 = v129 + 16;
  uint64_t v123 = v61;
  uint64_t v62 = (uint64_t)v124;
  v61(v124, v134, v135);
  id v63 = objc_allocWithZone((Class)type metadata accessor for JSMarketingObject());
  uint64_t v64 = (uint64_t)v111;
  id v109 = v111;
  id v65 = v108;
  uint64_t v66 = (uint64_t)v137;
  swift_bridgeObjectRetain();
  uint64_t v67 = v64;
  uint64_t v68 = v131;
  id v69 = sub_10001B8D8(v67, v62, (uint64_t)v65, v131, v66);
  void *v60 = 0x6E6974656B72616DLL;
  v60[1] = 0xE900000000000067;
  v60[2] = v69;
  ((void (*)(void *, uint64_t, uint64_t))v130)(v60, v58, v142);
  uint64_t v70 = (void *)(v120 + 9 * v59);
  uint64_t v71 = v62;
  sub_100018C08();
  v72();
  id v73 = objc_allocWithZone((Class)type metadata accessor for JSMediaAPIObject());
  uint64_t v74 = v133;
  swift_retain();
  id v75 = v65;
  uint64_t v76 = (uint64_t)v137;
  swift_bridgeObjectRetain();
  id v77 = v110;
  id v78 = sub_10001DBF8(v74, v71, v75, v68, v76, v77);
  *uint64_t v70 = 0x495041616964656DLL;
  v70[1] = 0xE800000000000000;
  v70[2] = v78;
  uint64_t v79 = v121;
  uint64_t v80 = v142;
  uint64_t v81 = v130;
  ((void (*)(void *, void, uint64_t))v130)(v70, v121, v142);
  id v82 = [objc_allocWithZone((Class)type metadata accessor for JSEngagementObject()) init];
  uint64_t v83 = sub_100018BCC((uint64_t)v82, 0x656D656761676E65);
  ((void (*)(void *, uint64_t, uint64_t))v81)(v83, v79, v80);
  uint64_t v84 = (uint64_t)v124;
  sub_100018C08();
  v85();
  id v86 = objc_allocWithZone((Class)type metadata accessor for JSNetworkObject(0));
  uint64_t v87 = v133;
  swift_retain();
  uint64_t v88 = (char *)v75;
  id v89 = v77;
  uint64_t v90 = v115;
  size_t v91 = v112;
  uint64_t v124 = v88;
  uint64_t v92 = (uint64_t)v137;
  id v137 = v89;
  id v93 = sub_1000205B4(v87, v84, v88, v131, v92, v89);
  uint64_t v94 = sub_100018CC0((uint64_t)v93, 0x6B726F7774656ELL);
  uint64_t v95 = v142;
  ((void (*)(void *, uint64_t, uint64_t))v81)(v94, v79, v142);
  id v96 = [objc_allocWithZone((Class)type metadata accessor for JSSessionAuthenticatorObject()) init];
  *uint64_t v90 = 0xD000000000000014;
  v90[1] = 0x8000000100049F60;
  v90[2] = v96;
  ((void (*)(void *, uint64_t, uint64_t))v81)(v90, v79, v95);
  unint64_t v98 = *(void *)(v91 + 16);
  unint64_t v97 = *(void *)(v91 + 24);
  if (v98 >= v97 >> 1) {
    size_t v91 = sub_100018750(v97 > 1, v98 + 1, 1, v91, &qword_10005CEB0, (uint64_t (*)(void))&type metadata accessor for JSStack.Prerequisite, (void (*)(unint64_t, uint64_t, char *))sub_1000055D8);
  }
  *(void *)(v91 + 16) = v98 + 1;
  (*(void (**)(size_t, void *, uint64_t))(v125 + 32))(v91 + v113 + v98 * v132, v90, v95);
  sub_100045F30();
  swift_retain();
  id v99 = v114;
  sub_100045EF0();
  uint64_t v100 = v117;
  uint64_t v101 = sub_100045F10();
  if (v100)
  {
    swift_release();

    swift_release();
    sub_10000D8B8();
    v102();
    sub_1000186C0((uint64_t)v141);
    sub_10000D8B8();
    v103();
    type metadata accessor for JSDataProvider();
    uint64_t v104 = v119;
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v104 = v119;
    *(void *)(v119 + 16) = v101;
    swift_retain();
    swift_retain();
    sub_100045EC0();
    swift_release();
    swift_release();
    if (deviceIsRunningInternalBuild()) {
      sub_100045ED0();
    }

    swift_release();
    swift_release();

    sub_10000D8B8();
    v105();
    sub_1000186C0((uint64_t)v141);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v134, v135);
  }
  return v104;
}

void sub_100016468(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100045A20();
  __chkstk_darwin(v4 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v18 = type metadata accessor for JSDataProvider();
  v17[0] = a2;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100046140();
    uint64_t v9 = v8;

    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000459F0();
    sub_100018978((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_100045A00(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v7;
    v15[1] = v9;
    sub_1000459F0();
    sub_100018978((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_100045A00(v21);
    sub_1000062B0(v17, v18);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v12;
    sub_1000459F0();
    sub_100018978((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_100045A00(v11);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v17);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  id v13 = [a1 virtualMachine];
  if (v13)
  {
    uint64_t v14 = v13;
    [v13 shrinkFootprintWhenIdle];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100016740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[74] = a4;
  v4[73] = a3;
  v4[72] = a2;
  v4[71] = a1;
  uint64_t v5 = sub_100005794(&qword_10005CE88);
  sub_100018C3C(v5);
  v4[75] = sub_100018C24();
  uint64_t v6 = sub_100045E70();
  v4[76] = v6;
  sub_100008628(v6);
  v4[77] = v7;
  v4[78] = swift_task_alloc();
  v4[79] = swift_task_alloc();
  uint64_t v8 = sub_100005794(&qword_10005CA90);
  sub_100018C3C(v8);
  v4[80] = sub_100018C24();
  uint64_t v9 = sub_100045AC0();
  v4[81] = v9;
  sub_100008628(v9);
  v4[82] = v10;
  v4[83] = sub_100018C24();
  uint64_t v11 = sub_100005794(&qword_10005CE90);
  v4[84] = v11;
  sub_100008628(v11);
  v4[85] = v12;
  v4[86] = sub_100018C24();
  uint64_t v13 = sub_1000459A0();
  v4[87] = v13;
  sub_100008628(v13);
  v4[88] = v14;
  v4[89] = swift_task_alloc();
  v4[90] = swift_task_alloc();
  uint64_t v15 = sub_100045C50();
  v4[91] = v15;
  sub_100008628(v15);
  v4[92] = v16;
  v4[93] = sub_100018C24();
  uint64_t v17 = sub_100045BB0();
  v4[94] = v17;
  sub_100008628(v17);
  v4[95] = v18;
  v4[96] = sub_100018C24();
  return _swift_task_switch(sub_100016978, 0, 0);
}

uint64_t sub_100016978()
{
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[72];
  v0[51] = type metadata accessor for JSServiceRequest();
  v0[52] = sub_100018678(&qword_10005CE98, (void (*)(uint64_t))type metadata accessor for JSServiceRequest);
  uint64_t v3 = sub_1000188D0(v0 + 48);
  sub_100018614(v2, (uint64_t)v3);
  v0[97] = *(void *)(v1 + 16);
  uint64_t v4 = v0[51];
  uint64_t v5 = v0[52];
  sub_1000062B0(v0 + 48, v4);
  v0[45] = v4;
  v0[46] = *(void *)(v5 + 8);
  v0[47] = *(void *)(v5 + 16);
  sub_1000188D0(v0 + 42);
  sub_100018CB4();
  (*(void (**)(void))(v6 + 16))();
  sub_100045C60();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[98] = (uint64_t)v7;
  void *v7 = v0;
  v7[1] = sub_100016B4C;
  uint64_t v8 = v0[96];
  uint64_t v9 = v0[93];
  uint64_t v10 = v0[91];
  uint64_t v11 = v0[73];
  return JSStack.dispatch<A>(_:objectGraph:)(v8, v9, v11, v10, &protocol witness table for JSRequestIntent);
}

uint64_t sub_100016B4C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 792) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[92] + 8))(v2[93], v2[91]);
  if (v0) {
    uint64_t v3 = sub_1000174FC;
  }
  else {
    uint64_t v3 = sub_100016CE0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100016CE0()
{
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 704);
  uint64_t v66 = v0 + 384;
  uint64_t v67 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 688);
  uint64_t v5 = *(void *)(v0 + 680);
  uint64_t v6 = *(void *)(v0 + 672);
  uint64_t v7 = *(void *)(v0 + 640);
  sub_100045BA0();
  sub_100045B00();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v67);
  sub_100045AB0();
  sub_100045950();
  uint64_t v8 = sub_100045BD0();
  if (sub_10000678C(v7, 1, v8) == 1)
  {
    sub_100018978(*(void *)(v0 + 640), &qword_10005CA90);
LABEL_6:
    id v25 = [objc_allocWithZone((Class)NSError) init];
    goto LABEL_7;
  }
  uint64_t v9 = sub_100045BC0();
  sub_100018CB4();
  sub_10000D8B8();
  v10();
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v11 = self;
  Class isa = sub_1000460D0().super.isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 560) = 0;
  id v13 = [v11 dataWithJSONObject:isa options:0 error:v0 + 560];

  id v14 = *(id *)(v0 + 560);
  if (v13)
  {
    uint64_t v65 = *(void *)(v0 + 768);
    uint64_t v15 = *(void *)(v0 + 760);
    uint64_t v64 = *(void *)(v0 + 752);
    uint64_t v16 = *(void *)(v0 + 704);
    uint64_t v17 = *(void *)(v0 + 664);
    uint64_t v18 = *(void *)(v0 + 656);
    uint64_t v63 = *(void *)(v0 + 648);
    Swift::String v19 = *(uint64_t **)(v0 + 568);
    uint64_t v20 = sub_100045650();
    uint64_t v22 = v21;

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v63);
    uint64_t v23 = *(void (**)(void))(v16 + 8);
    sub_100018BBC();
    v23();
    uint64_t *v19 = v20;
    v19[1] = v22;
    sub_100018BBC();
    v23();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v65, v64);
    sub_100045EE0();
    _s16UtilityExtension9JSAccountVwxx_0(v66);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_23;
  }
  uint64_t v62 = v14;
  id v25 = (id)sub_100045550();

LABEL_7:
  swift_willThrow();
  uint64_t v26 = *(void *)(v0 + 768);
  uint64_t v27 = *(void *)(v0 + 760);
  uint64_t v28 = *(void *)(v0 + 752);
  uint64_t v29 = *(void *)(v0 + 704);
  (*(void (**)(void, void))(*(void *)(v0 + 656) + 8))(*(void *)(v0 + 664), *(void *)(v0 + 648));
  id v30 = *(void (**)(void))(v29 + 8);
  sub_100018BBC();
  v30();
  sub_100018BBC();
  v30();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  uint64_t v31 = *(void *)(v0 + 600);
  *(void *)(v0 + 552) = v25;
  swift_errorRetain();
  sub_100005794(&qword_10005CEA0);
  if (swift_dynamicCast())
  {
    uint64_t v32 = *(void *)(v0 + 632);
    uint64_t v33 = *(void *)(v0 + 624);
    uint64_t v34 = *(void *)(v0 + 616);
    uint64_t v35 = *(void *)(v0 + 608);
    uint64_t v36 = sub_100018CA0();
    sub_1000066FC(v36, v37, v38, v35);
    unint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
    v39(v32, v31, v35);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v33, v32, v35);
    sub_100018678((unint64_t *)&qword_10005CCE0, (void (*)(uint64_t))&type metadata accessor for JSError);
    uint64_t v40 = swift_allocError();
    v39(v41, v33, v35);
    uint64_t v42 = (void *)sub_100045540();
    sub_100005794(&qword_10005CEA8);
    uint64_t inited = swift_initStackObject();
    sub_100018BE8((__n128 *)inited, (__n128)xmmword_100047770);
    sub_100046410();
    uint64_t v44 = sub_100045E10();
    if (v45)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_100018C60();
      *(void *)(inited + 72) = v48;
      *(void *)(inited + 80) = v47;
    }
    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v44;
      sub_10000684C((_OWORD *)(v0 + 424), (_OWORD *)(inited + 72));
    }
    sub_100018C88();
    sub_100018CE0();
    sub_100046410();
    uint64_t v49 = sub_100045E00();
    if (v50)
    {
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v40;
      *(void *)(inited + 152) = 0xE700000000000000;
    }
    else
    {
      *(void *)(v0 + 480) = &type metadata for Int;
      *(void *)(v0 + 456) = v49;
      sub_10000684C((_OWORD *)(v0 + 456), (_OWORD *)(inited + 144));
    }
    uint64_t v51 = *(void *)(v0 + 632);
    uint64_t v52 = *(void *)(v0 + 616);
    uint64_t v53 = *(void *)(v0 + 608);
    sub_100018C48();
    *(void *)(v0 + 528) = 0xE700000000000000;
    sub_100046410();
    uint64_t v54 = sub_100045E30();
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v54;
    *(void *)(inited + 224) = v55;
    sub_100018B98();
    sub_100046410();
    uint64_t v56 = sub_100045E60();
    *(void *)(inited + 312) = &type metadata for String;
    if (v57) {
      uint64_t v58 = v56;
    }
    else {
      uint64_t v58 = v40;
    }
    if (v57) {
      unint64_t v59 = v57;
    }
    else {
      unint64_t v59 = 0xE700000000000000;
    }
    *(void *)(inited + 288) = v58;
    *(void *)(inited + 296) = v59;
    sub_1000460F0();
    Class v60 = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v42, "ams_errorByAddingUserInfo:", v60);

    swift_errorRelease();
    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
  }
  else
  {
    uint64_t v46 = *(void *)(v0 + 600);
    sub_1000066FC(v46, 1, 1, *(void *)(v0 + 608));
    sub_100018978(v46, &qword_10005CE88);
    swift_willThrow();
  }
  sub_100045EE0();
  _s16UtilityExtension9JSAccountVwxx_0(v66);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
LABEL_23:
  return v24();
}

uint64_t sub_1000174FC()
{
  uint64_t v1 = *(void *)(v0 + 608);
  *(void *)(v0 + 552) = *(void *)(v0 + 792);
  swift_errorRetain();
  sub_100005794(&qword_10005CEA0);
  if (swift_dynamicCast())
  {
    uint64_t v2 = *(void *)(v0 + 632);
    uint64_t v3 = *(void *)(v0 + 624);
    uint64_t v4 = *(void *)(v0 + 616);
    uint64_t v5 = *(void *)(v0 + 608);
    uint64_t v6 = sub_100018CA0();
    sub_1000066FC(v6, v7, v8, v5);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v9(v2, v1, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
    sub_100018678((unint64_t *)&qword_10005CCE0, (void (*)(uint64_t))&type metadata accessor for JSError);
    swift_allocError();
    v9(v10, v3, v5);
    uint64_t v11 = (void *)sub_100045540();
    sub_100005794(&qword_10005CEA8);
    uint64_t inited = swift_initStackObject();
    sub_100018BE8((__n128 *)inited, (__n128)xmmword_100047770);
    sub_100046410();
    uint64_t v13 = sub_100045E10();
    if (v14)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_100018C60();
      *(void *)(inited + 72) = v17;
      *(void *)(inited + 80) = v16;
    }
    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v13;
      sub_10000684C((_OWORD *)(v0 + 424), (_OWORD *)(inited + 72));
    }
    sub_100018C88();
    sub_100018CE0();
    sub_100046410();
    uint64_t v18 = sub_100045E00();
    if (v19)
    {
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v1;
      *(void *)(inited + 152) = 0xE700000000000000;
    }
    else
    {
      *(void *)(v0 + 480) = &type metadata for Int;
      *(void *)(v0 + 456) = v18;
      sub_10000684C((_OWORD *)(v0 + 456), (_OWORD *)(inited + 144));
    }
    uint64_t v20 = *(void *)(v0 + 632);
    uint64_t v21 = *(void *)(v0 + 616);
    uint64_t v22 = *(void *)(v0 + 608);
    sub_100018C48();
    *(void *)(v0 + 528) = 0xE700000000000000;
    sub_100046410();
    uint64_t v23 = sub_100045E30();
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v23;
    *(void *)(inited + 224) = v24;
    sub_100018B98();
    sub_100046410();
    uint64_t v25 = sub_100045E60();
    *(void *)(inited + 312) = &type metadata for String;
    if (v26) {
      uint64_t v27 = v25;
    }
    else {
      uint64_t v27 = v1;
    }
    if (v26) {
      unint64_t v28 = v26;
    }
    else {
      unint64_t v28 = 0xE700000000000000;
    }
    *(void *)(inited + 288) = v27;
    *(void *)(inited + 296) = v28;
    sub_1000460F0();
    Class isa = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v11, "ams_errorByAddingUserInfo:", isa);

    swift_errorRelease();
    swift_willThrow();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 600);
    sub_1000066FC(v15, 1, 1, *(void *)(v0 + 608));
    sub_100018978(v15, &qword_10005CE88);
    swift_willThrow();
  }
  sub_100045EE0();
  _s16UtilityExtension9JSAccountVwxx_0(v0 + 384);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_100017988(void *a1)
{
  uint64_t v3 = sub_100005794(&qword_10005C8E8);
  uint64_t v4 = sub_100018C3C(v3);
  __chkstk_darwin(v4);
  sub_10000D898();
  uint64_t v49 = v5;
  sub_100018CD4();
  v47[1] = sub_1000460C0();
  sub_10000AD5C();
  uint64_t v51 = v6;
  __chkstk_darwin(v7);
  sub_100018C78();
  uint64_t v50 = sub_100045E90();
  sub_10000AD5C();
  uint64_t v53 = v8;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v52 = (char *)v47 - v13;
  sub_100018CD4();
  uint64_t v14 = sub_100045A20();
  uint64_t v15 = sub_100018C3C(v14);
  __chkstk_darwin(v15);
  sub_100018C78();
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v16 = sub_100045A70();
  sub_100008628(v16);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  *((void *)&v55 + 1) = type metadata accessor for JSDataProvider();
  *(void *)&long long v54 = v1;
  uint64_t v48 = v1;
  swift_retain();
  id v17 = (id)AMSLogKey();
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_100046140();
    uint64_t v20 = v12;
    uint64_t v21 = a1;
    uint64_t v23 = v22;

    sub_100045A10();
    v59._countAndFlagsBits = 0;
    v59._object = (void *)0xE000000000000000;
    sub_100045A00(v59);
    uint64_t v24 = sub_100018CF4();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = v24;
    sub_1000459F0();
    sub_100018978((uint64_t)v57, (uint64_t *)&unk_10005CCF0);
    v60._countAndFlagsBits = 5972026;
    v60._object = (void *)0xE300000000000000;
    sub_100045A00(v60);
    uint64_t MetatypeMetadata = &type metadata for String;
    v57[0] = v19;
    v57[1] = v23;
    a1 = v21;
    uint64_t v12 = v20;
    sub_1000459F0();
    sub_100018978((uint64_t)v57, (uint64_t *)&unk_10005CCF0);
    v25._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    sub_100045A00(v61);
    uint64_t v26 = sub_100018CF4();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = v26;
    sub_1000459F0();
    sub_100018978((uint64_t)v57, (uint64_t *)&unk_10005CCF0);
    v25._countAndFlagsBits = 58;
  }
  v25._object = (void *)0xE100000000000000;
  sub_100045A00(v25);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v54);
  sub_1000459D0();
  uint64_t v27 = type metadata accessor for JSServiceRequest();
  *((void *)&v55 + 1) = v27;
  unint64_t v28 = sub_1000188D0((uint64_t *)&v54);
  sub_100018614((uint64_t)a1, (uint64_t)v28);
  sub_100045A60();
  sub_100018978((uint64_t)&v54, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v29 = v52;
  sub_100045E80();
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v12, v29, v50);
  sub_1000460A0();
  uint64_t v30 = a1[1];
  if (v30)
  {
    uint64_t v31 = *a1;
    *((void *)&v55 + 1) = &type metadata for String;
    *(void *)&long long v54 = v31;
    *((void *)&v54 + 1) = v30;
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  uint64_t v32 = v49;
  swift_bridgeObjectRetain();
  sub_1000460B0();
  sub_100018978((uint64_t)&v54, (uint64_t *)&unk_10005CCF0);
  uint64_t v33 = a1[2];
  if (v33)
  {
    *((void *)&v55 + 1) = sub_100005794(&qword_10005C5B0);
    *(void *)&long long v54 = v33;
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_1000460B0();
  sub_100018978((uint64_t)&v54, (uint64_t *)&unk_10005CCF0);
  sub_100018910((uint64_t)a1 + *(int *)(v27 + 24), v32);
  uint64_t v34 = sub_100045620();
  if (sub_10000678C(v32, 1, v34) == 1)
  {
    sub_100018978(v32, &qword_10005C8E8);
    long long v54 = 0u;
    long long v55 = 0u;
  }
  else
  {
    uint64_t v35 = sub_100045580();
    *((void *)&v55 + 1) = &type metadata for String;
    *(void *)&long long v54 = v35;
    *((void *)&v54 + 1) = v36;
    sub_100018CB4();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v32, v34);
  }
  uint64_t v38 = v48;
  sub_1000460B0();
  sub_100018978((uint64_t)&v54, (uint64_t *)&unk_10005CCF0);
  sub_100005794(&qword_10005CEC0);
  uint64_t v39 = sub_100046000();
  sub_100045EB0();
  uint64_t v40 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
  swift_retain_n();
  uint64_t v41 = sub_100046290();
  *((void *)&v55 + 1) = v40;
  uint64_t v56 = &protocol witness table for OS_dispatch_queue;
  *(void *)&long long v54 = v41;
  sub_100045F60();
  swift_release();
  swift_release_n();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v54);
  *((void *)&v55 + 1) = sub_100045CC0();
  uint64_t v56 = &protocol witness table for SyncTaskScheduler;
  sub_1000188D0((uint64_t *)&v54);
  sub_100045CB0();
  uint64_t v42 = swift_allocObject();
  swift_weakInit();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v38;
  *(void *)(v43 + 24) = v42;
  swift_retain();
  sub_100045F90();
  swift_release();
  sub_10000D8B8();
  v44();
  sub_10000D8B8();
  v45();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v54);
  return v39;
}

uint64_t sub_1000180B4(uint64_t a1)
{
  uint64_t v2 = sub_100005794(&qword_10005CE88);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100045E70();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v14 - v10;
  v14[1] = a1;
  swift_errorRetain();
  sub_100005794(&qword_10005CEA0);
  if (swift_dynamicCast())
  {
    sub_1000066FC((uint64_t)v4, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    sub_1000067B4(0, &qword_10005CEC8);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v12 = sub_100038C4C((uint64_t)v9);
    sub_100045FA0();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  else
  {
    sub_1000066FC((uint64_t)v4, 1, 1, v5);
    sub_100018978((uint64_t)v4, &qword_10005CE88);
    return sub_100045FA0();
  }
}

uint64_t sub_1000182E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100045A20();
  __chkstk_darwin(v3 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v16 = type metadata accessor for JSDataProvider();
  v15[0] = a2;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_100046140();
    uint64_t v8 = v7;

    sub_100045A10();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_100045A00(v17);
    sub_1000062B0(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000459F0();
    sub_100018978((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_100045A00(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v6;
    v13[1] = v8;
    sub_1000459F0();
    sub_100018978((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v10._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v15, v16);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v11;
    sub_1000459F0();
    sub_100018978((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v10._countAndFlagsBits = 58;
  }
  v10._object = (void *)0xE100000000000000;
  sub_100045A00(v10);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v15);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100045EE0();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000185B8()
{
  swift_release();
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for JSDataProvider()
{
  return self;
}

uint64_t sub_100018614(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSServiceRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018678(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000186C0(uint64_t a1)
{
  return a1;
}

void sub_100018714(void *a1)
{
  sub_100016468(a1, v1);
}

size_t sub_10001871C(size_t a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_100018750(a1, a2, a3, a4, &qword_10005CEB8, (uint64_t (*)(void))type metadata accessor for JSSourceInfo, (void (*)(unint64_t, uint64_t, char *))sub_1000055F0);
}

size_t sub_100018750(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), void (*a7)(unint64_t, uint64_t, char *))
{
  char v10 = result;
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    int64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v12 = a2;
      }
    }
  }
  else
  {
    int64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v20 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005794(a5);
  uint64_t v15 = a6(0);
  sub_100008628(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v20);
  if (!v17)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v19 == 0x8000000000000000 && v17 == -1) {
    goto LABEL_24;
  }
  v20[2] = v13;
  void v20[3] = 2 * ((uint64_t)(result - v19) / v17);
LABEL_19:
  a6(0);
  sub_100007EA4();
  if (v10)
  {
    unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    a7(a4 + v23, v13, (char *)v20 + v23);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v20;
}

uint64_t *sub_1000188D0(uint64_t *a1)
{
  sub_100007EA4();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

uint64_t sub_100018910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005C8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018978(uint64_t a1, uint64_t *a2)
{
  sub_100005794(a2);
  sub_100018CB4();
  sub_10000D8B8();
  v3();
  return a1;
}

uint64_t sub_1000189D0(uint64_t a1)
{
  return sub_1000180B4(a1);
}

uint64_t sub_1000189D8()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018A10()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100018A50(uint64_t a1)
{
  return sub_1000182E0(a1, *(void *)(v1 + 16));
}

unsigned char *storeEnumTagSinglePayload for DynamicUIFeatureFlags(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100018AF4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicUIFeatureFlags()
{
  return &type metadata for DynamicUIFeatureFlags;
}

unint64_t sub_100018B30()
{
  unint64_t result = qword_10005CED0;
  if (!qword_10005CED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CED0);
  }
  return result;
}

uint64_t sub_100018B7C()
{
  return sub_100045DE0();
}

void sub_100018B98()
{
  *(void *)(v0 + 536) = 0x5255656372756F73;
  *(void *)(v0 + 544) = 0xE90000000000004CLL;
}

void *sub_100018BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *int v3 = a2;
  v3[1] = v2;
  v3[2] = a1;
  return v3;
}

__n128 *sub_100018BE8(__n128 *result, __n128 a2)
{
  result[1] = a2;
  *(void *)(v2 + 488) = 0x6E6D756C6F63;
  *(void *)(v2 + 496) = 0xE600000000000000;
  return result;
}

uint64_t sub_100018C24()
{
  return swift_task_alloc();
}

uint64_t sub_100018C3C(uint64_t a1)
{
  return a1 - 8;
}

void sub_100018C48()
{
  *(void *)(v0 + 520) = 0x6567617373656DLL;
}

uint64_t sub_100018CA0()
{
  return *(void *)(v0 + 600);
}

void *sub_100018CC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v2 = a2;
  v2[1] = 0xE700000000000000;
  v2[2] = a1;
  return v2;
}

uint64_t sub_100018CD4()
{
  return 0;
}

void sub_100018CE0()
{
  *(void *)(v0 + 504) = 1701734764;
  *(void *)(v0 + 512) = 0xE400000000000000;
}

uint64_t sub_100018CF4()
{
  sub_1000062B0((void *)(v0 - 160), *(void *)(v0 - 136));
  return swift_getDynamicType();
}

uint64_t sub_100018D44()
{
  if (deviceIsRunningInternalBuild()) {
    return 0x6C616E7265746E69;
  }
  if (deviceIsRunningSeedBuild()) {
    return 1684366707;
  }
  return 0x72656D6F74737563;
}

id sub_100018DC8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100018E38()
{
  uint64_t v0 = self;
  uint64_t v1 = sub_1000190EC(v0);
  if (!v1) {
    return 0;
  }
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100018EC8()
{
  return sub_100018F70((SEL *)&selRef_deviceGUID);
}

uint64_t sub_100018EEC()
{
  return sub_100018F70((SEL *)&selRef_language);
}

uint64_t sub_100018F10()
{
  uint64_t v0 = self;
  uint64_t result = sub_100004C28(v0, (SEL *)&selRef_modelPartNumber);
  if (!v2) {
    return 0;
  }
  return result;
}

uint64_t sub_100018F64()
{
  return sub_100018F70((SEL *)&selRef_productType);
}

uint64_t sub_100018F70(SEL *a1)
{
  id v1 = [self *a1];
  uint64_t v2 = sub_100046140();

  return v2;
}

uint64_t sub_100018FE8()
{
  uint64_t v0 = self;
  uint64_t result = sub_100004C28(v0, (SEL *)&selRef_serialNumber);
  if (!v2) {
    return 0x6E776F6E6B6E75;
  }
  return result;
}

id sub_10001903C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100019094()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSDeviceObject()
{
  return self;
}

uint64_t sub_1000190EC(void *a1)
{
  id v1 = [a1 carrierNames];
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_1000461F0();

  return v3;
}

uint64_t sub_100019144()
{
  return sub_100019998();
}

uint64_t sub_10001915C(void *a1, void *a2, void *a3)
{
  id v38 = a1;
  uint64_t v6 = sub_100046090();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100045CE0();
  uint64_t v12 = sub_100045CD0();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_10000895C(a2);
    if (v3)
    {
      swift_release();
    }
    else
    {
      uint64_t v33 = v14;
      uint64_t v30 = v7;
      sub_100005794((uint64_t *)&unk_10005E050);
      uint64_t v32 = *(void *)(*(void *)(sub_100045A70() - 8) + 72);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
      uint64_t v37 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v36[0] = a3;
      id v31 = a3;
      id v15 = (id)AMSLogKey();
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = sub_100046140();
        uint64_t v29 = v18;

        sub_100045A10();
        v39._countAndFlagsBits = 0;
        v39._object = (void *)0xE000000000000000;
        sub_100045A00(v39);
        sub_1000062B0(v36, (uint64_t)v37);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v34[0] = DynamicType;
        sub_1000459F0();
        sub_100008588((uint64_t)v34);
        v40._countAndFlagsBits = 5972026;
        v40._object = (void *)0xE300000000000000;
        sub_100045A00(v40);
        uint64_t MetatypeMetadata = &type metadata for String;
        v34[0] = v17;
        v34[1] = v29;
        sub_1000459F0();
        sub_100008588((uint64_t)v34);
        v20._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v41._countAndFlagsBits = 0;
        v41._object = (void *)0xE000000000000000;
        sub_100045A00(v41);
        sub_1000062B0(v36, (uint64_t)v37);
        uint64_t v21 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v34[0] = v21;
        sub_1000459F0();
        sub_100008588((uint64_t)v34);
        v20._countAndFlagsBits = 58;
      }
      v20._object = (void *)0xE100000000000000;
      sub_100045A00(v20);
      sub_100045A30();
      type metadata accessor for Log();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v36);
      sub_1000459D0();
      uint64_t v37 = &type metadata for EngagementEvent;
      uint64_t v22 = v33;
      v36[0] = v33;
      swift_bridgeObjectRetain();
      sub_100045A40();
      sub_100008588((uint64_t)v36);
      sub_100035648();
      swift_bridgeObjectRelease();
      unint64_t v23 = (void *)swift_allocObject();
      uint64_t v24 = v31;
      v23[2] = v22;
      uint64_t v23[3] = v24;
      v23[4] = v13;
      id v25 = v24;
      id v26 = v38;
      swift_retain();
      sub_100046070();
      uint64_t v11 = sub_100046080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v6);
    }
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v11;
}

uint64_t sub_100019624(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v37 = a6;
  uint64_t v32 = a5;
  uint64_t v34 = a3;
  Swift::String v40 = a1;
  uint64_t v7 = sub_100045940();
  uint64_t v38 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v30 = v9;
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [objc_allocWithZone((Class)AMSEngagement) init];
  id v36 = v11;
  Class isa = sub_1000460D0().super.isa;
  id v13 = [v11 enqueueData:isa];

  sub_100005794(&qword_10005CF30);
  id v35 = v13;
  uint64_t v33 = sub_100045FF0();
  id v31 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v31(v10, a2, v7);
  uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v32;
  uint64_t v17 = v40;
  *(void *)(v15 + 16) = v32;
  *(void *)(v15 + 24) = v17;
  uint64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v19 = v38;
  v18(v15 + ((v14 + 32) & ~v14), v10, v38);
  v31(v10, v34, v19);
  uint64_t v20 = (v14 + 24) & ~v14;
  unint64_t v21 = (v30 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v16;
  v18(v22 + v20, v10, v38);
  unint64_t v23 = v40;
  *(void *)(v22 + v21) = v40;
  void v39[3] = sub_100045CE0();
  v39[4] = &protocol witness table for RunLoopWorkerThread;
  v39[0] = v37;
  id v24 = v16;
  id v25 = v23;
  id v26 = v24;
  id v27 = v25;
  swift_retain();
  sub_100045F60();

  swift_release();
  swift_release();
  swift_release();

  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v39);
}

uint64_t sub_100019980()
{
  return sub_100019998();
}

uint64_t sub_100019998()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_100019A10(void *a1, void *a2, void *a3)
{
  id v44 = a1;
  uint64_t v6 = sub_100046090();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100045CE0();
  uint64_t v12 = sub_100045CD0();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_100008B3C(a2);
    if (v3)
    {
      swift_release();
    }
    else
    {
      uint64_t v37 = v16;
      uint64_t v38 = v15;
      uint64_t v39 = v14;
      uint64_t v34 = v7;
      sub_100005794((uint64_t *)&unk_10005E050);
      uint64_t v35 = *(void *)(*(void *)(sub_100045A70() - 8) + 72);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
      uint64_t v43 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v42[0] = a3;
      id v36 = a3;
      id v17 = (id)AMSLogKey();
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = sub_100046140();
        uint64_t v33 = v20;

        sub_100045A10();
        v45._countAndFlagsBits = 0;
        v45._object = (void *)0xE000000000000000;
        sub_100045A00(v45);
        sub_1000062B0(v42, (uint64_t)v43);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v40[0] = DynamicType;
        sub_1000459F0();
        sub_100008588((uint64_t)v40);
        v46._countAndFlagsBits = 5972026;
        v46._object = (void *)0xE300000000000000;
        sub_100045A00(v46);
        uint64_t MetatypeMetadata = &type metadata for String;
        v40[0] = v19;
        v40[1] = v33;
        sub_1000459F0();
        sub_100008588((uint64_t)v40);
        v22._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v47._countAndFlagsBits = 0;
        v47._object = (void *)0xE000000000000000;
        sub_100045A00(v47);
        sub_1000062B0(v42, (uint64_t)v43);
        uint64_t v23 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v40[0] = v23;
        sub_1000459F0();
        sub_100008588((uint64_t)v40);
        v22._countAndFlagsBits = 58;
      }
      v22._object = (void *)0xE100000000000000;
      sub_100045A00(v22);
      sub_100045A30();
      type metadata accessor for Log();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v42);
      sub_1000459D0();
      uint64_t v25 = v38;
      uint64_t v24 = v39;
      v42[0] = v39;
      v42[1] = v38;
      uint64_t v26 = v37;
      v42[2] = v37;
      uint64_t v43 = &type metadata for EngagementMessageEvent;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100045A40();
      sub_100008588((uint64_t)v42);
      sub_100035648();
      swift_bridgeObjectRelease();
      id v27 = (void *)swift_allocObject();
      v27[2] = v24;
      v27[3] = v25;
      uint64_t v28 = v36;
      void v27[4] = v26;
      void v27[5] = v28;
      v27[6] = v13;
      id v29 = v28;
      id v30 = v44;
      swift_retain();
      sub_100046070();
      uint64_t v11 = sub_100046080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v6);
    }
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v11;
}

uint64_t sub_100019EEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v41 = a8;
  uint64_t v35 = a2;
  id v36 = a7;
  uint64_t v38 = a3;
  id v44 = a1;
  uint64_t v11 = sub_100045940();
  uint64_t v42 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v33 = v13;
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)AMSEngagement) init];
  id v40 = v15;
  id v16 = sub_100008EF8(a4, a5, a6);
  id v17 = [v15 enqueueMessageEvent:v16];

  sub_100005794(&qword_10005CF28);
  id v39 = v17;
  uint64_t v37 = sub_100045FF0();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v34(v14, v35, v11);
  uint64_t v18 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v36;
  unint64_t v21 = v44;
  *(void *)(v19 + 16) = v36;
  *(void *)(v19 + 24) = v21;
  Swift::String v22 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
  uint64_t v23 = v42;
  v22(v19 + ((v18 + 32) & ~v18), v14, v42);
  v34(v14, v38, v23);
  uint64_t v24 = (v18 + 24) & ~v18;
  unint64_t v25 = (v33 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v20;
  v22(v26 + v24, v14, v42);
  id v27 = v44;
  *(void *)(v26 + v25) = v44;
  v43[3] = sub_100045CE0();
  v43[4] = &protocol witness table for RunLoopWorkerThread;
  v43[0] = v41;
  id v28 = v20;
  id v29 = v27;
  id v30 = v28;
  id v31 = v29;
  swift_retain();
  sub_100045F60();

  swift_release();
  swift_release();
  swift_release();

  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v43);
}

void sub_10001A1D8(void **a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, id))
{
  uint64_t v9 = sub_100045A20();
  __chkstk_darwin(v9 - 8);
  sub_1000153AC();
  unint64_t v25 = *a1;
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v10 = sub_100045A70();
  sub_100008628(v10);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  void v28[3] = type metadata accessor for JSEngagementObject();
  v28[0] = a2;
  a2;
  id v11 = (id)AMSLogKey();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100046140();
    uint64_t v15 = v14;

    sub_100015390();
    sub_10001533C();
    sub_1000152E4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10001531C(MetatypeMetadata);
    sub_100008588((uint64_t)v27);
    sub_100015358();
    v27[3] = &type metadata for String;
    v27[0] = v13;
    v27[1] = v15;
    sub_1000459F0();
    sub_100008588((uint64_t)v27);
    v17._countAndFlagsBits = 93;
  }
  else
  {
    sub_100015374();
    sub_10001533C();
    sub_1000152E4();
    uint64_t v18 = swift_getMetatypeMetadata();
    sub_10001531C(v18);
    sub_100008588((uint64_t)v27);
    v17._countAndFlagsBits = 58;
  }
  sub_1000153DC(v17);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  id v19 = v25;
  uint64_t v20 = (void *)a7(a3, v19);
  sub_100005794(&qword_10005CD10);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_100047690;
  *(void *)(v21 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v21 + 32) = v20;
  id v22 = v20;
  uint64_t v23 = (void *)sub_100045930();

  swift_bridgeObjectRelease();
}

void sub_10001A61C(uint64_t a1, void *a2, uint64_t a3, objc_class *a4, uint64_t a5)
{
  uint64_t v44 = a5;
  uint64_t v8 = sub_100045E70();
  sub_10000AD5C();
  uint64_t v45 = v9;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045A20();
  __chkstk_darwin(v13 - 8);
  sub_1000153AC();
  uint64_t v14 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v15 = sub_100045A70();
  sub_100008628(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v19 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v43 = v14;
  uint64_t v41 = v20 + 3 * v17;
  uint64_t v40 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  long long v39 = xmmword_100047880;
  *(_OWORD *)(v21 + 16) = xmmword_100047880;
  uint64_t v42 = v20;
  uint64_t v38 = type metadata accessor for JSEngagementObject();
  uint64_t v52 = v38;
  v51[0] = (uint64_t)a2;
  id v37 = a2;
  id v22 = (id)AMSLogKey();
  uint64_t v46 = v8;
  Swift::String v47 = a4;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = sub_100046140();
    uint64_t v26 = v25;

    sub_100015390();
    sub_10001533C();
    sub_1000152E4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10001531C(MetatypeMetadata);
    sub_100008588((uint64_t)v50);
    sub_100015358();
    v50[3] = &type metadata for String;
    v50[0] = v24;
    v50[1] = v26;
    sub_1000459F0();
    sub_100008588((uint64_t)v50);
    v28._countAndFlagsBits = 93;
  }
  else
  {
    sub_100015374();
    sub_10001533C();
    sub_1000152E4();
    uint64_t v29 = swift_getMetatypeMetadata();
    sub_10001531C(v29);
    sub_100008588((uint64_t)v50);
    v28._countAndFlagsBits = 58;
  }
  sub_1000153DC(v28);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v51);
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v30 = v48;
  uint64_t v31 = v49;
  uint64_t v52 = v49;
  uint64_t v32 = sub_100006A38(v51);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v32, v30, v31);
  sub_100045A40();
  sub_100008588((uint64_t)v51);
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_100047690;
  swift_errorRetain();
  sub_10001AF30(a1);
  v34.super.Class isa = v47;
  Class isa = sub_100045E50(v34).super.isa;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v46);
  *(void *)(v33 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v33 + 32) = isa;
  id v36 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

id sub_10001ABC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001AC20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSEngagementObject()
{
  return self;
}

uint64_t sub_10001AC78(void *a1)
{
  return sub_100019A10(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001AC94()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001ACE4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100019EEC(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void **)(v3 + 40), *(void *)(v3 + 48));
}

void sub_10001AD0C(void **a1)
{
}

void sub_10001AD3C(uint64_t a1)
{
}

uint64_t sub_10001AD48(void *a1)
{
  return sub_10001915C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001AD64()
{
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001ADAC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100019624(a1, a2, a3, *(void *)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

void sub_10001ADD0(void **a1)
{
}

void sub_10001ADFC(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
  uint64_t v9 = *(void *)(sub_100045940() - 8);
  sub_10001A1D8(a1, *(void **)(v4 + 16), *(void *)(v4 + 24), v4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a2, a3, a4);
}

void sub_10001AE90(uint64_t a1)
{
}

void sub_10001AE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100045940();
  sub_100008628(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_10001A61C(a1, *(void **)(v2 + 16), v2 + v10, *(objc_class **)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

void sub_10001AF1C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_10001AF28(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
}

uint64_t sub_10001AF30(uint64_t a1)
{
  uint64_t v2 = sub_100005794(&qword_10005CE88);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100045E70();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[7] = a1;
  swift_errorRetain();
  sub_100005794(&qword_10005CEA0);
  if (swift_dynamicCast())
  {
    sub_1000066FC((uint64_t)v4, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v9 = sub_100045E30();
    v12[1] = v10;
    v12[2] = v9;
    v12[0] = sub_100045E00();
    sub_100045E10();
    sub_100045E60();
    sub_100045DF0();
    sub_100045E20();
    swift_errorRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    sub_1000066FC((uint64_t)v4, 1, 1, v5);
    sub_10001B18C((uint64_t)v4);
    swift_getErrorValue();
    sub_1000465F0();
    sub_100045E20();
    return swift_errorRelease();
  }
}

uint64_t sub_10001B18C(uint64_t a1)
{
  uint64_t v2 = sub_100005794(&qword_10005CE88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001B254()
{
  return swift_bridgeObjectRetain();
}

void sub_10001B264()
{
}

id sub_10001B2A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLocalizationObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLocalizationObject()
{
  return self;
}

uint64_t sub_10001B30C(uint64_t a1)
{
  return sub_10001B524(a1, (void (*)(uint64_t))sub_100035610);
}

uint64_t sub_10001B38C(uint64_t a1)
{
  return sub_10001B524(a1, (void (*)(uint64_t))sub_100035648);
}

uint64_t sub_10001B40C(uint64_t a1)
{
  return sub_10001B524(a1, (void (*)(uint64_t))sub_100035680);
}

uint64_t sub_10001B48C(uint64_t a1)
{
  return sub_10001B524(a1, (void (*)(uint64_t))sub_1000356B8);
}

uint64_t sub_10001B50C(uint64_t a1)
{
  return sub_10001B524(a1, (void (*)(uint64_t))sub_1000356F0);
}

uint64_t sub_10001B524(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = sub_100045A20();
  __chkstk_darwin(v4 - 8);
  uint64_t result = sub_1000462D0();
  if (v6)
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1000478F0;
    uint64_t v21 = (void *)type metadata accessor for JSLogObject();
    v20[0] = v2;
    id v10 = v2;
    id v11 = (id)AMSLogKey();
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_100046140();
      uint64_t v15 = v14;

      sub_100045A10();
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      sub_100045A00(v22);
      sub_10000A3F0();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10001B8B8(MetatypeMetadata);
      sub_100008588((uint64_t)v19);
      v23._countAndFlagsBits = 5972026;
      v23._object = (void *)0xE300000000000000;
      sub_100045A00(v23);
      v19[3] = &type metadata for String;
      v19[0] = v13;
      v19[1] = v15;
      sub_1000459F0();
      sub_100008588((uint64_t)v19);
      v17._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v24._countAndFlagsBits = 0;
      v24._object = (void *)0xE000000000000000;
      sub_100045A00(v24);
      sub_10000A3F0();
      uint64_t v18 = swift_getMetatypeMetadata();
      sub_10001B8B8(v18);
      sub_100008588((uint64_t)v19);
      v17._countAndFlagsBits = 58;
    }
    v17._object = (void *)0xE100000000000000;
    sub_100045A00(v17);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
    uint64_t v21 = &type metadata for String;
    v20[0] = v7;
    v20[1] = v8;
    sub_100045A40();
    sub_100008588((uint64_t)v20);
    a2(v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_10001B808()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001B860()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLogObject()
{
  return self;
}

uint64_t sub_10001B8B8(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000459F0();
}

id sub_10001B8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_account] = a1;
  id v10 = &v5[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_bag];
  uint64_t v11 = sub_100045DD0();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a2, v11);
  *(void *)&v5[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_clientInfo] = a3;
  uint64_t v13 = &v5[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_mediaClient];
  *(void *)uint64_t v13 = a4;
  *((void *)v13 + 1) = a5;
  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for JSMarketingObject();
  id v14 = objc_msgSendSuper2(&v16, "init");
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
  return v14;
}

uint64_t sub_10001B9EC()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

char *sub_10001BA70(void *a1, void *a2, void *a3)
{
  uint64_t v68 = sub_100045DD0();
  uint64_t v60 = *(void *)(v68 - 8);
  uint64_t v7 = *(void *)(v60 + 64);
  __chkstk_darwin(v68);
  uint64_t v62 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100046090();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v61 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100045A20();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045CE0();
  uint64_t v14 = sub_100045CD0();
  if (v14)
  {
    uint64_t v15 = v14;
    sub_100035968(a2, __src);
    if (v3) {
      goto LABEL_9;
    }
    uint64_t v57 = v15;
    sub_100005794((uint64_t *)&unk_10005E050);
    uint64_t v16 = *(void *)(sub_100045A70() - 8);
    unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v56 = *(void **)(v16 + 72);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100047880;
    long long v55 = (void *)(v18 + v17);
    uint64_t v66 = (ValueMetadata *)type metadata accessor for JSMarketingObject();
    v65[0] = a3;
    uint64_t v19 = a3;
    id v20 = (id)AMSLogKey();
    uint64_t v51 = v8;
    uint64_t v50 = v9;
    uint64_t v59 = 0;
    id v58 = a1;
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_100046140();
      uint64_t v24 = v23;

      sub_100045A10();
      v69._countAndFlagsBits = 0;
      v69._object = (void *)0xE000000000000000;
      sub_100045A00(v69);
      sub_1000062B0(v65, (uint64_t)v66);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v63[0] = DynamicType;
      sub_1000459F0();
      sub_100008588((uint64_t)v63);
      v70._countAndFlagsBits = 5972026;
      v70._object = (void *)0xE300000000000000;
      sub_100045A00(v70);
      uint64_t MetatypeMetadata = &type metadata for String;
      v63[0] = v22;
      v63[1] = v24;
      sub_1000459F0();
      sub_100008588((uint64_t)v63);
      v26._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v71._countAndFlagsBits = 0;
      v71._object = (void *)0xE000000000000000;
      sub_100045A00(v71);
      sub_1000062B0(v65, (uint64_t)v66);
      uint64_t v27 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v63[0] = v27;
      sub_1000459F0();
      sub_100008588((uint64_t)v63);
      v26._countAndFlagsBits = 58;
    }
    v26._object = (void *)0xE100000000000000;
    sub_100045A00(v26);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v65);
    sub_1000459D0();
    uint64_t v66 = &type metadata for MarketingItemRequest;
    v65[0] = swift_allocObject();
    memcpy((void *)(v65[0] + 16), __src, 0x48uLL);
    sub_10001D560((uint64_t)__src);
    sub_100045A40();
    sub_100008588((uint64_t)v65);
    sub_100035648();
    swift_bridgeObjectRelease();
    uint64_t v56 = *(void **)&v19[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_account];
    Swift::String v28 = &v19[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_bag];
    long long v55 = *(void **)&v19[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_clientInfo];
    uint64_t v29 = *(void *)&v19[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_mediaClient + 8];
    uint64_t v53 = *(void *)&v19[OBJC_IVAR____TtC16UtilityExtension17JSMarketingObject_mediaClient];
    uint64_t v52 = v29;
    long long v54 = v19;
    uint64_t v30 = v60;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v62, v28, v68);
    unint64_t v31 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    unint64_t v32 = (v7 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v33 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v34 = (v33 + 79) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v36 = (v35 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v37 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v37 + v31, v62, v68);
    uint64_t v38 = (void *)(v37 + v32);
    uint64_t v39 = v52;
    void *v38 = v53;
    v38[1] = v39;
    memcpy((void *)(v37 + v33), __src, 0x48uLL);
    uint64_t v40 = v56;
    *(void *)(v37 + v34) = v56;
    uint64_t v41 = v55;
    *(void *)(v37 + v35) = v55;
    uint64_t v13 = v54;
    *(void *)(v37 + v36) = v54;
    *(void *)(v37 + ((v36 + 15) & 0xFFFFFFFFFFFFFFF8)) = v57;
    id v42 = v40;
    id v43 = v41;
    swift_retain();
    uint64_t v44 = v13;
    id v45 = v58;
    swift_bridgeObjectRetain();
    uint64_t v46 = v61;
    uint64_t v47 = v59;
    sub_100046070();
    if (v47)
    {
LABEL_9:
      swift_release();
    }
    else
    {
      uint64_t v13 = (char *)sub_100046080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v46, v51);
    }
  }
  else
  {
    uint64_t v13 = (char *)sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v13;
}

uint64_t sub_10001C160(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11)
{
  uint64_t v48 = a1;
  uint64_t v41 = a8;
  id v42 = a2;
  id v45 = a3;
  uint64_t v39 = a5;
  uint64_t v40 = a9;
  uint64_t v12 = sub_100045940();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  __chkstk_darwin(v12);
  uint64_t v43 = v13;
  uint64_t v44 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100045D90();
  objc_allocWithZone((Class)AMSMarketingItemTask);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_10001D7D4(v14);
  [v15 setAccount:v41];
  [v15 setClientInfo:v40];
  sub_10001D8D4(a7, (uint64_t)v51, &qword_10005CFE8);
  sub_10001D8D4((uint64_t)v51, (uint64_t)&v53, &qword_10005CFE8);
  if (v53)
  {
    sub_100037A88(v53);
    sub_100005794(&qword_10005C8A0);
    v16.super.Class isa = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v16.super.Class isa = 0;
  }
  uint64_t v40 = a10;
  uint64_t v41 = a11;
  [v15 setContextInfo:v16.super.isa];

  sub_10001D8D4(a7 + 24, (uint64_t)v50, &qword_10005CFF0);
  sub_10001D8D4((uint64_t)v50, (uint64_t)v52, &qword_10005CFF0);
  if (v52[1]) {
    NSString v17 = sub_100046110();
  }
  else {
    NSString v17 = 0;
  }
  [v15 setOfferHints:v17];

  sub_100005794(&qword_10005CFF8);
  id v18 = [v15 perform];
  uint64_t v39 = sub_100045FF0();
  uint64_t v19 = v46;
  uint64_t v38 = *(void (**)(char *, id, uint64_t))(v46 + 16);
  id v20 = v44;
  uint64_t v21 = v47;
  v38(v44, v42, v47);
  uint64_t v22 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v23 = v43;
  id v42 = v15;
  uint64_t v37 = v22 | 7;
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v40;
  Swift::String v26 = v48;
  *(void *)(v24 + 16) = v40;
  *(void *)(v24 + 24) = v26;
  uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 32);
  v27(v24 + ((v22 + 32) & ~v22), v20, v21);
  v38(v20, v45, v21);
  uint64_t v28 = (v22 + 24) & ~v22;
  unint64_t v29 = (v23 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v25;
  v27(v30 + v28, v20, v21);
  unint64_t v31 = v48;
  *(void *)(v30 + v29) = v48;
  uint64_t v49[3] = sub_100045CE0();
  v49[4] = &protocol witness table for RunLoopWorkerThread;
  v49[0] = v41;
  id v32 = v25;
  id v33 = v31;
  id v34 = v32;
  id v35 = v33;
  swift_retain();
  sub_100045F60();

  swift_release();
  swift_release();
  swift_release();
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v49);
}

void sub_10001C5A4(void **a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045A20();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = *a1;
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  *((void *)&v26 + 1) = type metadata accessor for JSMarketingObject();
  *(void *)&long long v25 = a2;
  a2;
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_100045A00(v27);
    sub_1000062B0(&v25, *((uint64_t *)&v26 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v23);
    v28._countAndFlagsBits = 5972026;
    v28._object = (void *)0xE300000000000000;
    sub_100045A00(v28);
    uint64_t MetatypeMetadata = &type metadata for String;
    v23[0] = v9;
    v23[1] = v11;
    sub_1000459F0();
    sub_100008588((uint64_t)v23);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v29._countAndFlagsBits = 0;
    v29._object = (void *)0xE000000000000000;
    sub_100045A00(v29);
    sub_1000062B0(&v25, *((uint64_t *)&v26 + 1));
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = v14;
    sub_1000459F0();
    sub_100008588((uint64_t)v23);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v25);
  sub_1000459D0();
  uint64_t v15 = sub_10001DB64(v6);
  if (v16)
  {
    *((void *)&v26 + 1) = &type metadata for String;
    *(void *)&long long v25 = v15;
    *((void *)&v25 + 1) = v16;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
  }
  type metadata accessor for Log();
  sub_100045A40();
  sub_100008588((uint64_t)&v25);
  sub_100035648();
  swift_bridgeObjectRelease();
  id v17 = v6;
  id v18 = sub_100035ED0(a3, v17);
  sub_100005794(&qword_10005CD10);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_100047690;
  *(void *)(v19 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v19 + 32) = v18;
  id v20 = v18;
  uint64_t v21 = (void *)sub_100045930();

  swift_bridgeObjectRelease();
}

void sub_10001CB98(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045E70();
  uint64_t v39 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v12 = *(void *)(sub_100045A70() - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v38 = v11;
  uint64_t v36 = v15 + 3 * v13;
  uint64_t v35 = v14 | 7;
  uint64_t v16 = swift_allocObject();
  long long v34 = xmmword_100047880;
  *(_OWORD *)(v16 + 16) = xmmword_100047880;
  uint64_t v37 = v15;
  uint64_t v33 = type metadata accessor for JSMarketingObject();
  uint64_t v47 = v33;
  v46[0] = (uint64_t)a2;
  id v32 = a2;
  id v17 = (id)AMSLogKey();
  uint64_t v40 = v7;
  uint64_t v41 = a4;
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = sub_100046140();
    uint64_t v21 = v20;

    sub_100045A10();
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    sub_100045A00(v48);
    sub_1000062B0(v46, v47);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v44);
    v49._countAndFlagsBits = 5972026;
    v49._object = (void *)0xE300000000000000;
    sub_100045A00(v49);
    uint64_t MetatypeMetadata = &type metadata for String;
    v44[0] = v19;
    v44[1] = v21;
    sub_1000459F0();
    sub_100008588((uint64_t)v44);
    v23._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v50._countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    sub_100045A00(v50);
    sub_1000062B0(v46, v47);
    uint64_t v24 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = v24;
    sub_1000459F0();
    sub_100008588((uint64_t)v44);
    v23._countAndFlagsBits = 58;
  }
  v23._object = (void *)0xE100000000000000;
  sub_100045A00(v23);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v46);
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v25 = v42;
  uint64_t v26 = v43;
  uint64_t v47 = v43;
  Swift::String v27 = sub_100006A38(v46);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v27, v25, v26);
  sub_100045A40();
  sub_100008588((uint64_t)v46);
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_100047690;
  swift_errorRetain();
  sub_10001AF30(a1);
  v29.super.Class isa = v41;
  Class isa = sub_100045E50(v29).super.isa;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v40);
  *(void *)(v28 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v28 + 32) = isa;
  unint64_t v31 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

void sub_10001D2D4()
{
}

id sub_10001D314()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMarketingObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001D3E8()
{
  return type metadata accessor for JSMarketingObject();
}

uint64_t type metadata accessor for JSMarketingObject()
{
  uint64_t result = qword_10005CFD8;
  if (!qword_10005CFD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001D438()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_10001D4EC(void *a1)
{
  return sub_10001BA70(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001D508()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10001D560(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001D5CC()
{
  sub_100045DD0();
  sub_10001DBE8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return _swift_deallocObject(v0, ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v4);
}

uint64_t sub_10001D6F8(void *a1, void *a2, void *a3)
{
  uint64_t v7 = sub_100045DD0();
  sub_100008628(v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v14 + 79) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001C160(a1, a2, a3, v3 + v12, *(void *)(v3 + v13), *(void *)(v3 + v13 + 8), v3 + v14, *(void *)(v3 + v15), *(void **)(v3 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3 + ((((v15 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3+ ((((((v15 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

id sub_10001D7D4(uint64_t a1)
{
  NSString v3 = sub_100046110();
  swift_bridgeObjectRelease();
  NSString v4 = sub_100046110();
  swift_bridgeObjectRelease();
  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  NSString v6 = sub_100046110();
  swift_bridgeObjectRelease();
  id v7 = [v1 initWithBag:a1 clientIdentifier:v3 clientVersion:v4 placement:v5 serviceType:v6];

  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_10001D8D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100005794(a3);
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_10001D930()
{
  sub_100045940();
  sub_10001DBC8();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_1000153C4();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

void sub_10001D9C8(void **a1)
{
  sub_100045940();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 24);
  sub_10001C5A4(a1, v3, v4);
}

uint64_t sub_10001DA3C()
{
  sub_100045940();
  sub_10001DBC8();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_1000153C4();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_10001DAE8(uint64_t a1)
{
  uint64_t v3 = sub_100045940();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void **)(v1 + 16);
  uint64_t v10 = *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_10001CB98(a1, v9, v1 + v8, v10);
}

uint64_t sub_10001DB64(void *a1)
{
  id v1 = [a1 itemID];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100046140();

  return v3;
}

id sub_10001DBF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v41 = a2;
  uint64_t v42 = a6;
  uint64_t v43 = sub_100045920();
  sub_10000AD5C();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&v6[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_accountStore] = a1;
  uint64_t v44 = a1;
  id v17 = &v6[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_bag];
  uint64_t v45 = sub_100045DD0();
  sub_1000205A0();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v18 + 16))(v17, a2);
  *(void *)&v6[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_clientInfo] = a3;
  uint64_t v20 = (uint64_t *)&v6[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_mediaClient];
  uint64_t *v20 = a4;
  v20[1] = a5;
  swift_retain();
  id v21 = a3;
  swift_bridgeObjectRetain_n();
  uint64_t v22 = v6;
  uint64_t v23 = sub_100045D90();
  id v24 = objc_allocWithZone((Class)AMSMediaTokenService);
  id v25 = sub_10001FDEC(a4, a5, v23);
  *(void *)&v22[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_tokenService] = v25;
  id v26 = v25;
  id v27 = [objc_allocWithZone((Class)AMSMediaRequestEncoder) initWithTokenService:v26 bag:sub_100045D90()];

  swift_unknownObjectRelease();
  *(void *)&v22[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_encoder] = v27;
  uint64_t v28 = v27;
  JSContext v29 = v21;
  [v28 setClientInfo:v21];
  uint64_t v30 = v42;
  *(void *)&v22[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_urlSessionHandler] = v42;
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  *uint64_t v16 = a4;
  v16[1] = a5;
  v16[2] = 0;
  void v16[3] = 0;
  uint64_t v31 = v43;
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v16, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v43);
  id v32 = v30;
  uint64_t v33 = v41;
  long long v34 = (void *)sub_100046230();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v31);
  *(void *)&v22[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_urlSession] = v34;
  id v35 = v32;
  id v36 = v34;
  [v36 setDelegate:v35];

  uint64_t v37 = (objc_class *)type metadata accessor for JSMediaAPIObject();
  v46.receiver = v22;
  v46.super_class = v37;
  id v38 = objc_msgSendSuper2(&v46, "init");
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v33, v45);
  return v38;
}

uint64_t sub_10001DEF8()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_10001DF7C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v59 = a3;
  uint64_t v5 = sub_100046090();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MediaAPIRequest();
  uint64_t v55 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v55 + 64);
  uint64_t v11 = __chkstk_darwin(v9 - 8);
  uint64_t v56 = (uint64_t)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v48 - v12;
  uint64_t v14 = sub_100045A20();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_100045CE0();
  uint64_t v16 = sub_100045CD0();
  if (v16)
  {
    uint64_t v57 = v16;
    id v58 = v13;
    id v52 = a1;
    uint64_t v53 = v8;
    uint64_t v50 = v6;
    uint64_t v51 = v5;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    uint64_t v63 = type metadata accessor for JSMediaAPIObject();
    v62[0] = a2;
    long long v54 = a2;
    id v17 = (id)AMSLogKey();
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_100046140();
      uint64_t v21 = v20;

      sub_100045A10();
      v65._countAndFlagsBits = 0;
      v65._object = (void *)0xE000000000000000;
      sub_100045A00(v65);
      sub_1000062B0(v62, v63);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v60[0] = DynamicType;
      sub_1000459F0();
      sub_1000202D0((uint64_t)v60, (uint64_t *)&unk_10005CCF0);
      v66._countAndFlagsBits = 5972026;
      v66._object = (void *)0xE300000000000000;
      sub_100045A00(v66);
      uint64_t MetatypeMetadata = &type metadata for String;
      v60[0] = v19;
      v60[1] = v21;
      sub_1000459F0();
      sub_1000202D0((uint64_t)v60, (uint64_t *)&unk_10005CCF0);
      v23._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v67._countAndFlagsBits = 0;
      v67._object = (void *)0xE000000000000000;
      sub_100045A00(v67);
      sub_1000062B0(v62, v63);
      uint64_t v24 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v60[0] = v24;
      sub_1000459F0();
      sub_1000202D0((uint64_t)v60, (uint64_t *)&unk_10005CCF0);
      v23._countAndFlagsBits = 58;
    }
    v23._object = (void *)0xE100000000000000;
    sub_100045A00(v23);
    sub_100045A30();
    uint64_t v15 = type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
    sub_1000459D0();
    uint64_t v63 = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    v62[0] = v59;
    id v25 = (id)v59;
    sub_100045A40();
    sub_1000202D0((uint64_t)v62, (uint64_t *)&unk_10005CCF0);
    sub_100035648();
    swift_bridgeObjectRelease();
    id v26 = v25;
    uint64_t v27 = (uint64_t)v58;
    unint64_t v28 = v64;
    sub_100035FF0(v26, (uint64_t)v58);
    if (v28)
    {
      swift_release();
    }
    else
    {
      uint64_t v29 = *(void *)&v54[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_mediaClient + 8];
      uint64_t v49 = *(void *)&v54[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_mediaClient];
      uint64_t v30 = *(void **)&v54[OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_clientInfo];
      swift_bridgeObjectRetain();
      id v31 = [v30 clientVersion];
      if (v31)
      {
        id v32 = v31;
        uint64_t v59 = sub_100046140();
        unint64_t v64 = v33;
      }
      else
      {
        unint64_t v64 = 0xE100000000000000;
        uint64_t v59 = 49;
      }
      uint64_t v34 = v56;
      sub_10001FF80(v27, v56);
      unint64_t v35 = (*(unsigned __int8 *)(v55 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
      unint64_t v36 = (v10 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v39 = swift_allocObject();
      sub_10002014C(v34, v39 + v35);
      uint64_t v40 = v54;
      *(void *)(v39 + v36) = v54;
      uint64_t v41 = (void *)(v39 + v37);
      *uint64_t v41 = v49;
      v41[1] = v29;
      uint64_t v42 = (uint64_t *)(v39 + v38);
      unint64_t v43 = v64;
      *uint64_t v42 = v59;
      v42[1] = v43;
      *(void *)(v39 + ((v38 + 23) & 0xFFFFFFFFFFFFFFF8)) = v57;
      id v44 = v40;
      id v45 = v52;
      swift_retain();
      objc_super v46 = v53;
      sub_100046070();
      uint64_t v15 = sub_100046080();
      swift_release();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v46, v51);
      sub_100020274((uint64_t)v58);
    }
  }
  else
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
  }
  return v15;
}

uint64_t sub_10001E5FC(void *a1, void (*a2)(void, void, void), uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v51 = a7;
  uint64_t v52 = a8;
  uint64_t v60 = a5;
  uint64_t v53 = a2;
  id v58 = a1;
  uint64_t v56 = a3;
  uint64_t v57 = a10;
  uint64_t v12 = sub_100045940();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  long long v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v14;
  uint64_t v15 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100045620();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for MediaAPIRequest();
  sub_100018910(a4 + *(int *)(v22 + 32), (uint64_t)v17);
  if (sub_10000678C((uint64_t)v17, 1, v18) == 1)
  {
    uint64_t v23 = a6;
    uint64_t v24 = v51;
    uint64_t v25 = v52;
    sub_1000202D0((uint64_t)v17, &qword_10005C8E8);
    if ((*(unsigned char *)(a4 + 32) & 1) != 0 || (uint64_t v26 = *(void *)(a4 + 16)) == 0)
    {
      sub_100005794(&qword_10005D078);
      NSString v32 = sub_100046110();
      id v33 = (id)AMSError();

      uint64_t v27 = sub_100045F70();
    }
    else
    {
      uint64_t v27 = sub_10001FA1C(*(void *)(a4 + 24), v23, v24, v25, a9, *(unsigned char *)(a4 + 8), v26, *(void *)a4);
    }
    uint64_t v52 = v27;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    uint64_t v52 = sub_10001F82C((uint64_t)v21, v28, v29, v30, v31, *(unsigned char *)(a4 + 8));
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  uint64_t v34 = v53;
  unint64_t v35 = v54;
  uint64_t v53 = *(void (**)(void, void, void))(v13 + 16);
  v53(v54, v34, v12);
  uint64_t v36 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v37 = v55;
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = v58;
  *(void *)(v38 + 16) = v60;
  *(void *)(v38 + 24) = v39;
  uint64_t v40 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v40(v38 + ((v36 + 32) & ~v36), v35, v12);
  v53(v35, v56, v12);
  uint64_t v41 = (v36 + 24) & ~v36;
  unint64_t v42 = (v37 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v43 = swift_allocObject();
  id v44 = v60;
  *(void *)(v43 + 16) = v60;
  v40(v43 + v41, v35, v12);
  id v45 = v58;
  *(void *)(v43 + v42) = v58;
  v59[3] = sub_100045CE0();
  v59[4] = &protocol witness table for RunLoopWorkerThread;
  v59[0] = v57;
  id v46 = v44;
  id v47 = v45;
  id v48 = v46;
  id v49 = v47;
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  swift_release();
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v59);
}

void sub_10001EA58(void **a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045A20();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = *a1;
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v25 = type metadata accessor for JSMediaAPIObject();
  v24[0] = a2;
  a2;
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_100045A00(v26);
    sub_1000062B0(v24, v25);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = DynamicType;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v22, (uint64_t *)&unk_10005CCF0);
    v27._countAndFlagsBits = 5972026;
    v27._object = (void *)0xE300000000000000;
    sub_100045A00(v27);
    uint64_t MetatypeMetadata = &type metadata for String;
    v22[0] = v9;
    v22[1] = v11;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v22, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_100045A00(v28);
    sub_1000062B0(v24, v25);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = v14;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v22, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v24);
  sub_1000459D0();
  uint64_t v25 = sub_1000067B4(0, &qword_10005D088);
  v24[0] = v6;
  id v15 = v6;
  sub_100045A40();
  sub_1000202D0((uint64_t)v24, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  id v16 = v15;
  id v17 = sub_100036C7C(a3, v16);
  sub_100005794(&qword_10005CD10);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100047690;
  *(void *)(v18 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v18 + 32) = v17;
  id v19 = v17;
  uint64_t v20 = (void *)sub_100045930();

  swift_bridgeObjectRelease();
}

void sub_10001F098(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045E70();
  uint64_t v40 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v12 = *(void *)(sub_100045A70() - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v39 = v11;
  uint64_t v37 = v15 + 3 * v13;
  uint64_t v36 = v14 | 7;
  uint64_t v16 = swift_allocObject();
  long long v35 = xmmword_100047880;
  *(_OWORD *)(v16 + 16) = xmmword_100047880;
  uint64_t v38 = v15;
  uint64_t v34 = type metadata accessor for JSMediaAPIObject();
  uint64_t v49 = v34;
  v48[0] = (uint64_t)a2;
  id v33 = a2;
  id v17 = (id)AMSLogKey();
  uint64_t v42 = v7;
  uint64_t v43 = a4;
  uint64_t v41 = a1;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_100046140();
    uint64_t v21 = v20;

    sub_100045A10();
    v50._countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    sub_100045A00(v50);
    sub_1000062B0(v48, v49);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v46[0] = DynamicType;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v46, (uint64_t *)&unk_10005CCF0);
    v51._countAndFlagsBits = 5972026;
    v51._object = (void *)0xE300000000000000;
    sub_100045A00(v51);
    uint64_t MetatypeMetadata = &type metadata for String;
    v46[0] = v19;
    v46[1] = v21;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v46, (uint64_t *)&unk_10005CCF0);
    v23._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v52._countAndFlagsBits = 0;
    v52._object = (void *)0xE000000000000000;
    sub_100045A00(v52);
    sub_1000062B0(v48, v49);
    uint64_t v24 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v46[0] = v24;
    sub_1000459F0();
    sub_1000202D0((uint64_t)v46, (uint64_t *)&unk_10005CCF0);
    v23._countAndFlagsBits = 58;
  }
  v23._object = (void *)0xE100000000000000;
  sub_100045A00(v23);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v48);
  sub_1000459D0();
  uint64_t v25 = v41;
  swift_getErrorValue();
  uint64_t v26 = v44;
  uint64_t v27 = v45;
  uint64_t v49 = v45;
  Swift::String v28 = sub_10002055C(v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v28, v26, v27);
  sub_100045A40();
  sub_1000202D0((uint64_t)v48, (uint64_t *)&unk_10005CCF0);
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_100047690;
  swift_errorRetain();
  sub_10001AF30(v25);
  v30.super.Class isa = v43;
  Class isa = sub_100045E50(v30).super.isa;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v42);
  *(void *)(v29 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v29 + 32) = isa;
  NSString v32 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

uint64_t sub_10001F82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  if (a6)
  {
    uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_encoder);
    uint64_t v9 = *(void **)(v6 + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_accountStore);
    if (v9) {
      uint64_t v9 = DynamicAccountsStore.account.getter();
    }
    [v8 setAccount:v9];
  }
  uint64_t v10 = *(void **)(v7 + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_encoder);
  sub_1000455A0((NSURL *)OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_encoder);
  uint64_t v12 = v11;
  id v13 = [v10 requestWithURL:v11];

  sub_100005794(&qword_10005D080);
  id v14 = [*(id *)(v7 + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_urlSession) dataTaskPromiseWithRequestPromise:v13];
  sub_100045FF0();
  void v17[3] = sub_100045CC0();
  id v17[4] = (uint64_t)&protocol witness table for SyncTaskScheduler;
  sub_10002055C(v17);
  sub_100045CB0();
  sub_1000067B4(0, &qword_10005D088);
  uint64_t v15 = sub_100045F40();

  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v17);
  return v15;
}

id sub_10001F998@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = v4;
    id result = v3;
  }
  else
  {
    id result = [objc_allocWithZone((Class)AMSMediaResult) initWithResult:v3];
    uint64_t v5 = (uint64_t)result;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_10001FA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100045D90();
  id v19 = objc_allocWithZone((Class)AMSMediaTask);
  id v20 = sub_10001FE54(a1, a2, a3, a4, a5, v18);
  if (a8) {
    v21.super.Class isa = sub_1000460D0().super.isa;
  }
  else {
    v21.super.Class isa = 0;
  }
  [v20 setAdditionalQueryParams:v21.super.isa];

  sub_10001FF04(a7, v20);
  if (a6)
  {
    uint64_t v22 = *(void **)(v9 + OBJC_IVAR____TtC16UtilityExtension16JSMediaAPIObject_accountStore);
    if (v22) {
      uint64_t v22 = DynamicAccountsStore.account.getter();
    }
    [v20 setAccount:v22];
  }
  sub_100005794(&qword_10005D078);
  id v23 = [v20 perform];
  uint64_t v24 = sub_100045FF0();

  return v24;
}

void sub_10001FB90()
{
}

id sub_10001FBD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMediaAPIObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001FCE0()
{
  return type metadata accessor for JSMediaAPIObject();
}

uint64_t type metadata accessor for JSMediaAPIObject()
{
  uint64_t result = qword_10005D068;
  if (!qword_10005D068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001FD30()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10001FDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithClientIdentifier:v5 bag:a3];

  swift_unknownObjectRelease();
  return v6;
}

id sub_10001FE54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v9 = sub_100046110();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100046110();
  swift_bridgeObjectRelease();
  id v11 = [v6 initWithType:a1 clientIdentifier:v9 clientVersion:v10 bag:a6];

  swift_unknownObjectRelease();
  return v11;
}

void sub_10001FF04(uint64_t a1, void *a2)
{
  Class isa = sub_1000461E0().super.isa;
  [a2 setItemIdentifiers:isa];
}

uint64_t sub_10001FF64(void *a1)
{
  return sub_10001DF7C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001FF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001FFE4()
{
  uint64_t v1 = (int *)(type metadata accessor for MediaAPIRequest() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[10];
  uint64_t v6 = sub_100045620();
  if (!sub_10000678C(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, v8 + 8, v2 | 7);
}

uint64_t sub_10002014C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000201B0(void *a1, void (*a2)(void, void, void), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for MediaAPIRequest();
  sub_100008628(v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001E5FC(a1, a2, a3, v3 + v12, *(void **)(v3 + v13), *(void *)(v3 + v14), *(void *)(v3 + v14 + 8), *(void *)(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(void *)(v3 + ((((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_100020274(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000202D0(uint64_t a1, uint64_t *a2)
{
  sub_100005794(a2);
  sub_10000D8E8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100020320()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_1000153C4();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

void sub_1000203BC(void **a1)
{
  sub_100045940();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 24);
  sub_10001EA58(a1, v3, v4);
}

uint64_t sub_100020430()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_1000153C4();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_1000204E0(uint64_t a1)
{
  uint64_t v3 = sub_100045940();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void **)(v1 + 16);
  uint64_t v10 = *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_10001F098(a1, v9, v1 + v8, v10);
}

uint64_t *sub_10002055C(uint64_t *a1)
{
  sub_1000205A0();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

id sub_1000205B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v13 = sub_100045920();
  sub_10000AD5C();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100026760();
  id v17 = v6;
  uint64_t v32 = v13;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_1000464F0()) {
    sub_1000241D8((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v18 = &_swiftEmptySetSingleton;
  }
  *(void *)&v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_customSessions] = v18;
  *(void *)&v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_accountStore] = a1;
  id v19 = &v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_bag];
  uint64_t v30 = sub_100045DD0();
  sub_1000205A0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v20 + 16))(v19, a2);
  *(void *)&v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_clientInfo] = a3;
  uint64_t v22 = &v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_mediaClient];
  *(void *)uint64_t v22 = a4;
  *((void *)v22 + 1) = a5;
  *(void *)&v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_urlSessionHandler] = a6;
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  void *v7 = a4;
  v7[1] = a5;
  v7[2] = 0;
  v7[3] = 0;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v7, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v32);
  swift_retain();
  id v23 = a3;
  swift_bridgeObjectRetain();
  id v24 = a6;
  uint64_t v25 = (void *)sub_100046230();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v7, v32);
  *(void *)&v17[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_defaultSession] = v25;
  id v26 = v24;
  id v27 = v25;
  [v27 setDelegate:v26];

  v33.receiver = v17;
  v33.super_class = (Class)type metadata accessor for JSNetworkObject(0);
  id v28 = objc_msgSendSuper2(&v33, "init");
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a2, v30);
  return v28;
}

uint64_t sub_100020850()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_1000208D4(void *a1, void *a2, char *a3)
{
  uint64_t v106 = a3;
  id v99 = a1;
  uint64_t v5 = sub_100046090();
  uint64_t v90 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v100 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100046180();
  uint64_t v92 = *(void *)(v7 - 8);
  uint64_t v93 = v7;
  __chkstk_darwin(v7);
  size_t v91 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100045620();
  uint64_t v97 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  id v96 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = (int *)type metadata accessor for NetworkRequest(0);
  uint64_t v95 = *((void *)v11 - 1);
  uint64_t v12 = *(void *)(v95 + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v98 = (uint64_t)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v79 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v79 - v17;
  uint64_t v19 = sub_100045CE0();
  uint64_t v20 = sub_100045CD0();
  if (!v20)
  {
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100045E20();
    swift_willThrow();
    return v19;
  }
  uint64_t v19 = v20;
  sub_100021794(a2, v18);
  if (v3)
  {
    swift_release();
    return v19;
  }
  uint64_t v86 = v19;
  uint64_t v89 = 0;
  uint64_t v82 = v5;
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = *(void **)&v106[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_defaultSession];
  uint64_t v88 = v21;
  *(void *)(v21 + 16) = v22;
  char v23 = v18[v11[10]];
  sub_1000256D8((uint64_t)v18, (uint64_t)v16);
  if (v23)
  {
    id v26 = v22;
    sub_10002573C((uint64_t)v16);
    goto LABEL_9;
  }
  uint64_t v24 = *(void *)&v16[v11[13] + 8];
  id v25 = v22;
  sub_10002573C((uint64_t)v16);
  if (v24)
  {
LABEL_9:
    id v27 = self;
    id v28 = objc_msgSend(v27, "ams_configurationWithProcessInfo:bag:", *(void *)&v106[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_clientInfo], sub_100045D90());
    swift_unknownObjectRelease();
    if (v23)
    {
      uint64_t v85 = 0;
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v29 = &v18[v11[13]];
      uint64_t v30 = *((void *)v29 + 1);
      uint64_t v85 = *(void *)v29;
      uint64_t v31 = v30;
      swift_bridgeObjectRetain();
    }
    sub_100005794((uint64_t *)&unk_10005E050);
    id v87 = *(id *)(*(void *)(sub_100045A70() - 8) + 72);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    *((void *)&v105 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v104 = v106;
    uint64_t v83 = v106;
    id v32 = (id)AMSLogKey();
    id v84 = v28;
    if (v32)
    {
      objc_super v33 = v32;
      uint64_t v81 = sub_100046140();
      uint64_t v80 = v34;

      sub_100045A10();
      v107._countAndFlagsBits = 0;
      v107._object = (void *)0xE000000000000000;
      sub_100045A00(v107);
      sub_1000062B0(&v104, *((uint64_t *)&v105 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v101 = DynamicType;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
      v108._countAndFlagsBits = 5972026;
      v108._object = (void *)0xE300000000000000;
      sub_100045A00(v108);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v101 = v81;
      uint64_t v102 = v80;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
      v36._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v109._countAndFlagsBits = 0;
      v109._object = (void *)0xE000000000000000;
      sub_100045A00(v109);
      sub_1000062B0(&v104, *((uint64_t *)&v105 + 1));
      uint64_t v37 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v101 = v37;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
      v36._countAndFlagsBits = 58;
    }
    v36._object = (void *)0xE100000000000000;
    sub_100045A00(v36);
    sub_100045A30();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v104);
    sub_1000459D0();
    if (v31)
    {
      *((void *)&v105 + 1) = &type metadata for String;
      *(void *)&long long v104 = v85;
      *((void *)&v104 + 1) = v31;
    }
    else
    {
      long long v104 = 0u;
      long long v105 = 0u;
    }
    type metadata accessor for Log();
    swift_bridgeObjectRetain();
    sub_100045A40();
    sub_10000D5F8((uint64_t)&v104, (uint64_t *)&unk_10005CCF0);
    sub_100035648();
    swift_bridgeObjectRelease();
    if (v31)
    {
      NSString v38 = sub_100046110();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v38 = 0;
    }
    uint64_t v39 = v83;
    id v40 = v84;
    objc_msgSend(v84, "set_tlsTrustPinningPolicyName:", v38);

    id v41 = [objc_allocWithZone((Class)AMSURLSession) initWithConfiguration:v40];
    uint64_t v42 = *(void **)(v88 + 16);
    *(void *)(v88 + 16) = v41;

    [v41 setDelegate:*(void *)&v39[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_urlSessionHandler]];
    swift_beginAccess();
    sub_10002442C(&v101, v41);
    uint64_t v43 = (void *)v101;
    swift_endAccess();
  }
  id v44 = [objc_allocWithZone((Class)AMSURLRequestEncoder) initWithBag:sub_100045D90()];
  swift_unknownObjectRelease();
  if (v18[v11[12]] == 1)
  {
    uint64_t v45 = *(void **)&v106[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_accountStore];
    if (v45) {
      uint64_t v45 = DynamicAccountsStore.account.getter();
    }
    [v44 setAccount:v45];
  }
  if (*(void *)&v18[v11[11] + 8])
  {
    swift_bridgeObjectRetain();
    NSString v46 = sub_100046110();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v46 = 0;
  }
  uint64_t v47 = v94;
  [v44 setGsTokenIdentifier:v46];

  [v44 setClientInfo:*(void *)&v106[OBJC_IVAR____TtC16UtilityExtension15JSNetworkObject_clientInfo]];
  int v48 = v18[v11[14]];
  if (v48 != 2) {
    [v44 setUrlKnownToBeTrusted:v48 & 1];
  }
  sub_1000454D0();
  uint64_t v49 = swift_allocBox();
  (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v96, v18, v47);
  uint64_t v50 = sub_1000454A0();
  uint64_t v51 = *(void *)&v18[v11[6]];
  id v87 = v44;
  if (v51)
  {
    __chkstk_darwin(v50);
    uint64_t v52 = swift_bridgeObjectRetain();
    uint64_t v53 = v89;
    sub_100021C80(v52, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000259F4);
    uint64_t v89 = v53;
    swift_bridgeObjectRelease();
  }
  uint64_t v54 = *(void *)&v18[v11[9] + 8];
  uint64_t v94 = v49;
  if (v54)
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = v91;
    sub_100046170();
    sub_100046150();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v55, v93);
  }
  sub_1000454C0();
  swift_bridgeObjectRetain();
  sub_100045480();
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  *((void *)&v105 + 1) = type metadata accessor for JSNetworkObject(0);
  *(void *)&long long v104 = v106;
  uint64_t v56 = v106;
  id v57 = (id)AMSLogKey();
  uint64_t v106 = v56;
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = sub_100046140();
    id v96 = v60;
    uint64_t v97 = v59;

    sub_100045A10();
    v110._countAndFlagsBits = 0;
    v110._object = (void *)0xE000000000000000;
    sub_100045A00(v110);
    sub_1000062B0(&v104, *((uint64_t *)&v105 + 1));
    uint64_t v61 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v101 = v61;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
    v111._countAndFlagsBits = 5972026;
    v111._object = (void *)0xE300000000000000;
    sub_100045A00(v111);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v101 = v97;
    uint64_t v102 = v96;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
    v62._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v112._countAndFlagsBits = 0;
    v112._object = (void *)0xE000000000000000;
    sub_100045A00(v112);
    sub_1000062B0(&v104, *((uint64_t *)&v105 + 1));
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v101 = v63;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)&v101, (uint64_t *)&unk_10005CCF0);
    v62._countAndFlagsBits = 58;
  }
  uint64_t v64 = v95;
  v62._object = (void *)0xE100000000000000;
  sub_100045A00(v62);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v104);
  sub_1000459D0();
  *((void *)&v105 + 1) = v11;
  Swift::String v65 = sub_10002055C((uint64_t *)&v104);
  sub_1000256D8((uint64_t)v18, (uint64_t)v65);
  sub_100045A40();
  sub_10000D5F8((uint64_t)&v104, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v66 = v98;
  sub_1000256D8((uint64_t)v18, v98);
  unint64_t v67 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  unint64_t v68 = (v12 + v67 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v69 = (v68 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  Swift::String v70 = v87;
  uint64_t v97 = (uint64_t)v18;
  uint64_t v71 = v94;
  *(void *)(v19 + 16) = v87;
  *(void *)(v19 + 24) = v71;
  sub_1000258E4(v66, v19 + v67);
  uint64_t v72 = v106;
  *(void *)(v19 + v68) = v106;
  *(void *)(v19 + v69) = v88;
  *(void *)(v19 + ((v69 + 15) & 0xFFFFFFFFFFFFFFF8)) = v86;
  id v73 = v72;
  id v74 = v99;
  id v75 = v70;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v76 = v100;
  uint64_t v77 = v89;
  sub_100046070();
  if (v77)
  {
    sub_10002573C(v97);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v19 = sub_100046080();

    swift_release();
    (*(void (**)(char *, uint64_t))(v90 + 8))(v76, v82);
    sub_10002573C(v97);
    swift_release();
    swift_release();
  }
  return v19;
}

void sub_100021794(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v5 - 8);
  sub_100026760();
  uint64_t v6 = sub_100045620();
  sub_10000AD5C();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v60 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for NetworkRequest(0);
  uint64_t v59 = v11[10];
  a2[v59] = 2;
  uint64_t v12 = (void *)sub_1000267BC();
  sub_1000462D0();
  uint64_t v14 = v13;

  if (!v14)
  {
    sub_1000267BC();
    sub_100045E70();
    sub_100008AAC();
    sub_100026788();
    sub_100026710();
    goto LABEL_5;
  }
  sub_100045600();
  swift_bridgeObjectRelease();
  if (sub_10000678C(v2, 1, v6) == 1)
  {
    sub_10000D5F8(v2, &qword_10005C8E8);
    sub_100045E70();
    sub_100008AAC();
    sub_100026788();
    sub_100045E20();
LABEL_5:
    swift_willThrow();

    return;
  }
  uint64_t v15 = v60;
  id v58 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v56 = v8 + 32;
  v58(v60, v2, v6);
  uint64_t v16 = (void *)sub_10002673C();
  uint64_t v17 = sub_1000462D0();
  uint64_t v19 = v18;

  uint64_t v57 = v19;
  if (v19)
  {
    uint64_t v20 = (void *)sub_1000462E0();
    uint64_t v21 = sub_100008A34(v20);
    uint64_t v55 = v17;
    if (v21)
    {
      unint64_t v51 = sub_100023D88(v21);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v51 = 0;
    }
    uint64_t v22 = (void *)sub_1000462E0();
    uint64_t v23 = sub_1000462D0();
    uint64_t v53 = v24;
    uint64_t v54 = v23;

    id v25 = (void *)sub_1000462E0();
    uint64_t v52 = sub_1000462D0();
    uint64_t v27 = v26;

    id v28 = (void *)sub_1000266DC();
    int v50 = sub_1000462C0();

    uint64_t v29 = (void *)sub_1000462E0();
    int v46 = sub_1000462C0();

    uint64_t v30 = (void *)sub_1000266DC();
    uint64_t v31 = sub_1000462D0();
    uint64_t v48 = v32;
    uint64_t v49 = v31;

    objc_super v33 = (void *)sub_1000266DC();
    int v47 = sub_1000462C0();

    uint64_t v34 = (void *)sub_1000266DC();
    char v35 = sub_1000462C0();

    Swift::String v36 = (void *)sub_1000266DC();
    char v37 = sub_1000462C0();

    if (v27) {
      char v38 = 1;
    }
    else {
      char v38 = (v46 == 2) | v46;
    }
    v58(a2, (uint64_t)v60, v6);
    *(void *)&a2[v11[6]] = v51;
    uint64_t v39 = (uint64_t *)&a2[v11[5]];
    uint64_t v40 = v57;
    *uint64_t v39 = v55;
    v39[1] = v40;
    a2[v11[7]] = v35;
    a2[v11[8]] = v37;
    id v41 = (uint64_t *)&a2[v11[9]];
    uint64_t v42 = v53;
    *id v41 = v54;
    v41[1] = v42;
    uint64_t v43 = (uint64_t *)&a2[v11[11]];
    *uint64_t v43 = v52;
    v43[1] = v27;
    a2[v59] = v50;
    a2[v11[12]] = v38 & 1;
    id v44 = (uint64_t *)&a2[v11[13]];
    uint64_t v45 = v48;
    *id v44 = v49;
    v44[1] = v45;
    a2[v11[14]] = v47;
  }
  else
  {
    sub_10002673C();
    sub_100045E70();
    sub_100008AAC();
    swift_allocError();
    sub_100026710();
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v6);
  }
}

uint64_t sub_100021C80(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_1000241A0(a1, v20);
  uint64_t v3 = v20[0];
  uint64_t v21 = v20[1];
  int64_t v4 = v20[3];
  unint64_t v5 = v20[4];
  int64_t v6 = (unint64_t)(v20[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v9);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v15, v16, v18, v19);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v10 >= v6) {
      return swift_release();
    }
    unint64_t v11 = *(void *)(v21 + 8 * v10);
    int64_t v12 = v4 + 1;
    if (!v11)
    {
      int64_t v12 = v4 + 2;
      if (v4 + 2 >= v6) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v21 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v4 + 3;
        if (v4 + 3 >= v6) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v21 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 4;
          if (v4 + 4 >= v6) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v21 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 5;
            if (v4 + 5 >= v6) {
              return swift_release();
            }
            unint64_t v11 = *(void *)(v21 + 8 * v12);
            if (!v11)
            {
              int64_t v13 = v4 + 6;
              while (v13 < v6)
              {
                unint64_t v11 = *(void *)(v21 + 8 * v13++);
                if (v11)
                {
                  int64_t v12 = v13 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v4 = v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100021E34(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v60 = a8;
  Swift::String v65 = a7;
  uint64_t v56 = a3;
  uint64_t v54 = a2;
  uint64_t v61 = a1;
  uint64_t v59 = a9;
  uint64_t v11 = sub_100045940();
  uint64_t v57 = *(void *)(v11 - 8);
  uint64_t v58 = v11;
  __chkstk_darwin(v11);
  uint64_t v55 = v12;
  uint64_t v53 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NetworkRequest(0);
  uint64_t v14 = v13 - 8;
  uint64_t v52 = *(void **)(v13 - 8);
  uint64_t v15 = v52[8];
  __chkstk_darwin(v13);
  uint64_t v16 = sub_1000454D0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v20, v16);
  Class v21 = sub_100045490();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  id v22 = [a4 requestByEncodingRequest:v21 parameters:0];

  if (*(unsigned char *)(a6 + *(int *)(v14 + 36)))
  {
    sub_100005794(&qword_10005D118);
    id v23 = v22;
    sub_100045FF0();
    sub_1000256D8(a6, (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v24 = (*((unsigned __int8 *)v52 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v52 + 80);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    sub_1000258E4((uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
    uint64_t v26 = v65;
    *(void *)(v25 + ((v15 + v24 + 7) & 0xFFFFFFFFFFFFFFF8)) = v65;
    uint64_t v27 = sub_100045CC0();
    uint64_t v63 = v27;
    uint64_t v64 = &protocol witness table for SyncTaskScheduler;
    sub_10002055C(v62);
    id v28 = a4;
    id v29 = v26;
    sub_100045CB0();
    sub_1000067B4(0, &qword_10005D120);
    sub_100045F40();
    swift_release();
    swift_release();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
    uint64_t v63 = v27;
    uint64_t v64 = &protocol witness table for SyncTaskScheduler;
    sub_10002055C(v62);
    sub_100045CB0();
    id v22 = (id)sub_100045FE0();
    swift_release();

    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
  }
  uint64_t v52 = v22;
  uint64_t v30 = v60;
  sub_100005794(&qword_10005D080);
  swift_beginAccess();
  id v31 = [*(id *)(v30 + 16) dataTaskPromiseWithRequestPromise:v22];
  uint64_t v51 = sub_100045FF0();
  uint64_t v32 = v57;
  int v50 = *(void (**)(char *, void *, uint64_t))(v57 + 16);
  objc_super v33 = v53;
  uint64_t v34 = v58;
  v50(v53, v54, v58);
  uint64_t v35 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v36 = v55;
  char v37 = (void *)swift_allocObject();
  uint64_t v54 = v37;
  v37[2] = v65;
  v37[3] = v30;
  v37[4] = v61;
  char v38 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  v38((char *)v37 + ((v35 + 40) & ~v35), v33, v34);
  v50(v33, v56, v34);
  uint64_t v39 = (v35 + 32) & ~v35;
  uint64_t v40 = swift_allocObject();
  id v41 = v65;
  uint64_t v42 = v60;
  *(void *)(v40 + 16) = v65;
  *(void *)(v40 + 24) = v42;
  v38((char *)(v40 + v39), v33, v34);
  uint64_t v43 = v61;
  *(void *)(v40 + ((v36 + v39 + 7) & 0xFFFFFFFFFFFFFFF8)) = v61;
  uint64_t v63 = sub_100045CE0();
  uint64_t v64 = &protocol witness table for RunLoopWorkerThread;
  v62[0] = v59;
  id v44 = v41;
  swift_retain_n();
  id v45 = v43;
  id v46 = v44;
  id v47 = v45;
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  swift_release();

  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
}

void sub_1000223F4(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  uint64_t v9 = sub_100045A20();
  __chkstk_darwin(v9 - 8);
  id v10 = *a1;
  objc_msgSend(*a1, "ak_addAnisetteHeaders");
  id v11 = [a2 account];
  if (*(unsigned char *)(a3 + *(int *)(type metadata accessor for NetworkRequest(0) + 32)))
  {
    id v12 = [self defaultStore];
    if (!v12)
    {

      __break(1u);
      return;
    }
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v12, "ams_activeiCloudAccount");

    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    *((void *)&v41 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v40 = a4;
    id v15 = a4;
    id v11 = v14;
    id v16 = (id)AMSLogKey();
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = sub_100046140();
      uint64_t v33 = v19;
      uint64_t v35 = v18;

      sub_100045A10();
      v42._countAndFlagsBits = 0;
      v42._object = (void *)0xE000000000000000;
      sub_100045A00(v42);
      sub_1000062B0(&v40, *((uint64_t *)&v41 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = DynamicType;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v43._countAndFlagsBits = 5972026;
      v43._object = (void *)0xE300000000000000;
      sub_100045A00(v43);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v37 = v35;
      uint64_t v38 = v33;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v21._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_100045A00(v44);
      sub_1000062B0(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v22 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v22;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v21._countAndFlagsBits = 58;
    }
    v21._object = (void *)0xE100000000000000;
    sub_100045A00(v21);
    sub_100045A30();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v40);
    sub_1000459D0();
    if (v11)
    {
      *((void *)&v41 + 1) = sub_1000067B4(0, (unint64_t *)&qword_10005C6E0);
      *(void *)&long long v40 = v11;
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
    }
    type metadata accessor for Log();
    sub_100045A40();
    sub_10000D5F8((uint64_t)&v40, (uint64_t *)&unk_10005CCF0);
    sub_100035648();
    swift_bridgeObjectRelease();
  }
  if (v11)
  {
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    *((void *)&v41 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v40 = a4;
    id v23 = a4;
    id v24 = v11;
    id v25 = (id)AMSLogKey();
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v34 = sub_100046140();
      uint64_t v28 = v27;

      sub_100045A10();
      v45._countAndFlagsBits = 0;
      v45._object = (void *)0xE000000000000000;
      sub_100045A00(v45);
      sub_1000062B0(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v29 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v29;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v46._countAndFlagsBits = 5972026;
      v46._object = (void *)0xE300000000000000;
      sub_100045A00(v46);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v37 = v34;
      uint64_t v38 = v28;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v30._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v47._countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      sub_100045A00(v47);
      sub_1000062B0(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v31 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v31;
      sub_1000459F0();
      sub_10000D5F8((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
      v30._countAndFlagsBits = 58;
    }
    v30._object = (void *)0xE100000000000000;
    sub_100045A00(v30);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v40);
    sub_1000459D0();
    sub_100035648();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v24, 0);
  }
  objc_msgSend(v10, "ak_addClientInfoHeader");

  *a5 = v10;
  id v32 = v10;
}

void sub_100022A3C(void **a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100045A20();
  __chkstk_darwin(v8 - 8);
  uint64_t v27 = *a1;
  swift_beginAccess();
  uint64_t v9 = *(void **)(a3 + 16);
  swift_beginAccess();
  id v10 = v9;
  id v11 = (void *)sub_10002517C(v10);
  swift_endAccess();

  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v31 = type metadata accessor for JSNetworkObject(0);
  v30[0] = a2;
  a2;
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100046140();
    id v15 = a4;
    uint64_t v17 = v16;

    sub_100045A10();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_100045A00(v32);
    sub_1000062B0(v30, v31);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v28[0] = DynamicType;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v28, (uint64_t *)&unk_10005CCF0);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_100045A00(v33);
    uint64_t MetatypeMetadata = &type metadata for String;
    v28[0] = v14;
    v28[1] = v17;
    a4 = v15;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v28, (uint64_t *)&unk_10005CCF0);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_100045A00(v34);
    sub_1000062B0(v30, v31);
    uint64_t v20 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v28[0] = v20;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v28, (uint64_t *)&unk_10005CCF0);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_100045A00(v19);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v30);
  sub_1000459D0();
  uint64_t v31 = sub_1000067B4(0, &qword_10005D128);
  v30[0] = v27;
  id v21 = v27;
  sub_100045A40();
  sub_10000D5F8((uint64_t)v30, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  id v22 = v21;
  id v23 = sub_1000230F8(a4, v22);
  sub_100005794(&qword_10005CD10);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_100047690;
  *(void *)(v24 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v24 + 32) = v23;
  id v25 = v23;
  uint64_t v26 = (void *)sub_100045930();

  swift_bridgeObjectRelease();
}

id sub_1000230F8(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }
  id v5 = result;
  if (![a2 object]) {
    goto LABEL_5;
  }
  sub_100046370();
  swift_unknownObjectRelease();
  sub_10000684C(v16, &v17);
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  sub_100005738((uint64_t)&v17, (uint64_t)v16);
  id v6 = a1;
  id result = sub_100026A70(v16, a1);
  if (!result)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_1000462F0();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v17);
LABEL_5:
  id v7 = [a2 response];
  if (!v7) {
    return v5;
  }
  uint64_t v8 = v7;
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (!v9)
  {
LABEL_10:

    return v5;
  }
  id v10 = (void *)v9;
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  id v11 = [v10 statusCode];
  uint64_t v18 = &type metadata for Int;
  *(void *)&long long v17 = v11;
  id v12 = a1;
  id result = sub_100026A70(&v17, a1);
  if (!result) {
    goto LABEL_14;
  }
  sub_1000462F0();
  id v13 = [v10 allHeaderFields];
  uint64_t v14 = sub_1000460E0();

  uint64_t v18 = (void *)sub_100005794(&qword_10005C5B0);
  *(void *)&long long v17 = v14;
  id v15 = v12;
  id result = sub_100026A70(&v17, a1);
  if (result)
  {
    sub_1000462F0();
    goto LABEL_10;
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_100023358(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, objc_class *a5)
{
  uint64_t v46 = a4;
  uint64_t v9 = sub_100045E70();
  uint64_t v48 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v47 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100045A20();
  __chkstk_darwin(v11 - 8);
  swift_beginAccess();
  id v12 = *(void **)(a3 + 16);
  swift_beginAccess();
  id v13 = v12;
  uint64_t v14 = (void *)sub_10002517C(v13);
  swift_endAccess();

  uint64_t v15 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v16 = *(void *)(sub_100045A70() - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v42 = v18 + 3 * *(void *)(v16 + 72);
  uint64_t v41 = v17 | 7;
  uint64_t v19 = swift_allocObject();
  long long v40 = xmmword_100047880;
  *(_OWORD *)(v19 + 16) = xmmword_100047880;
  uint64_t v43 = v18;
  uint64_t v39 = type metadata accessor for JSNetworkObject(0);
  uint64_t v55 = v39;
  v54[0] = (uint64_t)a2;
  id v20 = a2;
  id v21 = (id)AMSLogKey();
  uint64_t v49 = a1;
  uint64_t v44 = v15;
  id v38 = v20;
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = sub_100046140();
    uint64_t v45 = v24;

    sub_100045A10();
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    sub_100045A00(v56);
    sub_1000062B0(v54, v55);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v52[0] = DynamicType;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v52, (uint64_t *)&unk_10005CCF0);
    v57._countAndFlagsBits = 5972026;
    v57._object = (void *)0xE300000000000000;
    sub_100045A00(v57);
    uint64_t MetatypeMetadata = &type metadata for String;
    v52[0] = v23;
    v52[1] = v45;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v52, (uint64_t *)&unk_10005CCF0);
    v26._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v58._countAndFlagsBits = 0;
    v58._object = (void *)0xE000000000000000;
    sub_100045A00(v58);
    sub_1000062B0(v54, v55);
    uint64_t v27 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v52[0] = v27;
    sub_1000459F0();
    sub_10000D5F8((uint64_t)v52, (uint64_t *)&unk_10005CCF0);
    v26._countAndFlagsBits = 58;
  }
  v26._object = (void *)0xE100000000000000;
  sub_100045A00(v26);
  sub_100045A30();
  uint64_t v28 = type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v54);
  sub_1000459D0();
  uint64_t v29 = v49;
  swift_getErrorValue();
  uint64_t v30 = v50;
  uint64_t v31 = v51;
  uint64_t v55 = v51;
  Swift::String v32 = sub_10002055C(v54);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v32, v30, v31);
  sub_100045A40();
  sub_10000D5F8((uint64_t)v54, (uint64_t *)&unk_10005CCF0);
  uint64_t v45 = v28;
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005CD10);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_100047690;
  swift_errorRetain();
  Swift::String v34 = v47;
  sub_10001AF30(v29);
  v35.super.Class isa = a5;
  Class isa = sub_100045E50(v35).super.isa;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v9);
  *(void *)(v33 + 56) = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v33 + 32) = isa;
  uint64_t v37 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
}

void sub_100023B60()
{
}

id sub_100023BA0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSNetworkObject(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100023C9C()
{
  return type metadata accessor for JSNetworkObject(0);
}

uint64_t type metadata accessor for JSNetworkObject(uint64_t a1)
{
  return sub_10002414C(a1, (uint64_t *)&unk_10005D0F0);
}

uint64_t sub_100023CC4()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100023D88(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005794(&qword_10005D100);
    objc_super v2 = (void *)sub_100046510();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  sub_1000241A0(a1, v47);
  int64_t v3 = v49;
  unint64_t v4 = v50;
  uint64_t v36 = v48;
  int64_t v38 = (unint64_t)(v48 + 64) >> 6;
  uint64_t v39 = v47[1];
  uint64_t v41 = v47[0];
  uint64_t v37 = (uint64_t)(v2 + 8);
  unint64_t result = swift_bridgeObjectRetain();
  long long v40 = (char *)&type metadata for Any + 8;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v13 = (v4 - 1) & v4;
  unint64_t v14 = __clz(__rbit64(v4)) | (v3 << 6);
  for (int64_t i = v3; ; v14 = __clz(__rbit64(v17)) + (i << 6))
  {
    sub_100009708(*(void *)(v41 + 48) + 40 * v14, (uint64_t)__src);
    sub_100005738(*(void *)(v41 + 56) + 32 * v14, (uint64_t)&__src[40]);
    memcpy(__dst, __src, sizeof(__dst));
    sub_100009708((uint64_t)__dst, (uint64_t)v44);
    if (!swift_dynamicCast())
    {
      sub_10000D5F8((uint64_t)__dst, &qword_10005D108);
LABEL_33:
      uint64_t v27 = swift_bridgeObjectRelease();
      sub_1000267A8(v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)v40, (uint64_t)&__dst[40], (uint64_t)&__src[40], v41);
      sub_10000B6B8();
      swift_release();
      return 0;
    }
    sub_100005738((uint64_t)&__dst[40], (uint64_t)v44);
    sub_10000D5F8((uint64_t)__dst, &qword_10005D108);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
    unint64_t result = sub_1000091DC(v42, v43);
    unint64_t v19 = result;
    if (v6)
    {
      id v20 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      uint64_t *v20 = v42;
      v20[1] = v43;
      id v21 = (uint64_t *)(v2[7] + 16 * v19);
      unint64_t result = swift_bridgeObjectRelease();
      *id v21 = v42;
      v21[1] = v43;
      goto LABEL_29;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)(v37 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v22 = (uint64_t *)(v2[6] + 16 * result);
    *id v22 = v42;
    v22[1] = v43;
    uint64_t v23 = (uint64_t *)(v2[7] + 16 * result);
    *uint64_t v23 = v42;
    v23[1] = v43;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_37;
    }
    v2[2] = v26;
LABEL_29:
    int64_t v3 = i;
    unint64_t v4 = v13;
    if (v13) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v16 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      goto LABEL_38;
    }
    if (v16 >= v38) {
      goto LABEL_34;
    }
    unint64_t v17 = *(void *)(v39 + 8 * v16);
    int64_t i = v3 + 1;
    if (!v17)
    {
      int64_t i = v3 + 2;
      if (v3 + 2 >= v38) {
        goto LABEL_34;
      }
      unint64_t v17 = *(void *)(v39 + 8 * i);
      if (!v17)
      {
        int64_t i = v3 + 3;
        if (v3 + 3 >= v38) {
          goto LABEL_34;
        }
        unint64_t v17 = *(void *)(v39 + 8 * i);
        if (!v17)
        {
          int64_t i = v3 + 4;
          if (v3 + 4 >= v38) {
            goto LABEL_34;
          }
          unint64_t v17 = *(void *)(v39 + 8 * i);
          if (!v17)
          {
            int64_t i = v3 + 5;
            if (v3 + 5 >= v38) {
              goto LABEL_34;
            }
            unint64_t v17 = *(void *)(v39 + 8 * i);
            if (!v17)
            {
              int64_t v18 = v3 + 6;
              while (v18 < v38)
              {
                unint64_t v17 = *(void *)(v39 + 8 * v18++);
                if (v17)
                {
                  int64_t i = v18 - 1;
                  goto LABEL_21;
                }
              }
LABEL_34:
              sub_1000267A8(result, v6, v7, v8, v9, v10, v11, v12, v35, v36, v37, v38, v39, (uint64_t)v40, (uint64_t)&__dst[40], (uint64_t)&__src[40], v41);
              sub_10000B6B8();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v13 = (v17 - 1) & v17;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_100024114(void *a1@<X0>, char *a2@<X8>)
{
}

uint64_t type metadata accessor for NetworkRequest(uint64_t a1)
{
  return sub_10002414C(a1, qword_10005D188);
}

uint64_t sub_10002414C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100024180(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1000241A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

void sub_1000241D8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000464F0();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = &_swiftEmptySetSingleton;
    goto LABEL_6;
  }
  if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_100005794(&qword_10005D110);
  uint64_t v3 = (void *)sub_100046450();
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000464F0();
    swift_bridgeObjectRelease();
    if (!v5)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      goto LABEL_26;
    }
  }
  unint64_t v6 = 0;
  uint64_t v7 = (char *)(v3 + 7);
  unint64_t v27 = a1 & 0xC000000000000001;
  unint64_t v24 = a1 + 32;
  uint64_t v25 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v26 = v5;
  while (1)
  {
    if (v27)
    {
      id v8 = (id)sub_100046470();
    }
    else
    {
      if (v6 >= *(void *)(v25 + 16)) {
        goto LABEL_29;
      }
      id v8 = *(id *)(v24 + 8 * v6);
    }
    uint64_t v9 = v8;
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10) {
      break;
    }
    Swift::Int v11 = sub_100046300(v3[5]);
    uint64_t v12 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
      id v17 = *(id *)(v3[6] + 8 * v13);
      char v18 = sub_100046310();

      if (v18)
      {
LABEL_21:

        uint64_t v5 = v26;
        goto LABEL_25;
      }
      uint64_t v19 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v19;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
        uint64_t v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0) {
          break;
        }
        id v20 = *(id *)(v3[6] + 8 * v13);
        char v21 = sub_100046310();

        if (v21) {
          goto LABEL_21;
        }
      }
      uint64_t v5 = v26;
    }
    *(void *)&v7[8 * v14] = v16 | v15;
    *(void *)(v3[6] + 8 * v13) = v9;
    uint64_t v22 = v3[2];
    BOOL v10 = __OFADD__(v22, 1);
    uint64_t v23 = v22 + 1;
    if (v10) {
      goto LABEL_28;
    }
    v3[2] = v23;
LABEL_25:
    if (v6 == v5) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
}

uint64_t sub_10002442C(void *a1, void *a2)
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
    id v8 = a2;
    uint64_t v9 = sub_1000463C0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000463B0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_1000246C8(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000248B0();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100024B4C((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v10 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v11 = sub_100046300(v10);
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_100046310();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v3 + 48) + 8 * v13);
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
        char v18 = sub_100046310();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100024BD0((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_1000246C8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  sub_100005794(&qword_10005D110);
  uint64_t v2 = sub_100046440();
  uint64_t v14 = v2;
  sub_1000463A0();
  if (!sub_1000463D0())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_1000248B0();
      uint64_t v2 = v14;
    }
    Swift::Int result = sub_100046300(*(void *)(v2 + 40));
    uint64_t v4 = v2 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = result & ~v5;
    unint64_t v7 = v6 >> 6;
    if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) == 0) {
      break;
    }
    unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
    ++*(void *)(v2 + 16);
    if (!sub_1000463D0()) {
      goto LABEL_16;
    }
  }
  char v9 = 0;
  unint64_t v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    BOOL v11 = v7 == v10;
    if (v7 == v10) {
      unint64_t v7 = 0;
    }
    v9 |= v11;
    uint64_t v12 = *(void *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000248B0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005794(&qword_10005D110);
  uint64_t v3 = sub_100046430();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      uint64_t result = sub_100046300(*(void *)(v4 + 40));
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          BOOL v25 = v21 == v24;
          if (v21 == v24) {
            unint64_t v21 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(void *)(*(void *)(v4 + 48) + 8 * v22) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              unint64_t v1 = v28;
              uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
              if (v27 > 63) {
                sub_100024180(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *unint64_t v6 = -1 << v27;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100024B4C(uint64_t a1, void *a2)
{
  sub_100046300(a2[5]);
  unint64_t result = sub_100046390();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100024BD0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000248B0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100024D58();
      goto LABEL_14;
    }
    sub_100024F04();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100046300(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100046310();

    if (v12)
    {
LABEL_13:
      sub_1000465D0();
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
        char v15 = sub_100046310();

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

id sub_100024D58()
{
  unint64_t v1 = v0;
  sub_100005794(&qword_10005D110);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100046420();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    unint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100024F04()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005794(&qword_10005D110);
  uint64_t v3 = sub_100046430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    Swift::Int v18 = *(void *)(v4 + 40);
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    uint64_t result = sub_100046300(v18);
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v4 + 48) + 8 * v23) = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    unint64_t v1 = v28;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002517C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) == 0)
  {
    Swift::Int v8 = *(void *)(v4 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v9 = sub_100046300(v8);
    uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v11 = v9 & ~v10;
    if ((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
    {
      sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
      id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v13 = sub_100046310();

      if (v13)
      {
LABEL_9:
        swift_bridgeObjectRelease();
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v18 = *v2;
        uint64_t v20 = *v2;
        uint64_t *v2 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_100024D58();
          uint64_t v18 = v20;
        }
        uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
        sub_1000254EC(v11);
        uint64_t *v2 = v20;
        goto LABEL_12;
      }
      uint64_t v14 = ~v10;
      while (1)
      {
        unint64_t v11 = (v11 + 1) & v14;
        if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
          break;
        }
        id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
        char v16 = sub_100046310();

        if (v16) {
          goto LABEL_9;
        }
      }
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  id v5 = a1;
  char v6 = sub_1000463E0();

  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = sub_100025350();
LABEL_12:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100025350()
{
  unint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1000463B0();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_1000246C8(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = sub_100046300(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = sub_100046310();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_1000254EC(v8);
      if (sub_100046310())
      {
        Swift::Int *v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = sub_100046310();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_1000254EC(unint64_t result)
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
    uint64_t v8 = sub_100046380();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = sub_100046300(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_15:
            uint64_t v16 = *(void *)(v3 + 48);
            int64_t v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            BOOL v19 = v2 != v6 || v17 >= v18 + 1;
            int64_t v2 = v6;
            if (v19)
            {
              *int64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_15;
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
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v22;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_100025684(void *a1)
{
  return sub_1000208D4(a1, *(void **)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1000256A0()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000256D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002573C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100025798()
{
  uint64_t v1 = *(void *)(type metadata accessor for NetworkRequest(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 32) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  sub_100045620();
  sub_10000D8E8();
  sub_10000D8B8();
  v5();
  sub_1000266F8();
  swift_bridgeObjectRelease();
  sub_1000266F8();
  sub_1000266F8();
  sub_1000266F8();

  swift_release();
  swift_release();
  return _swift_deallocObject(v0, ((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3);
}

uint64_t sub_1000258E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025948(void *a1, void *a2, void *a3)
{
  uint64_t v7 = type metadata accessor for NetworkRequest(0);
  sub_100008628(v7);
  sub_100026778();
  return sub_100021E34(a1, a2, a3, *(void **)(v3 + 16), *(void *)(v3 + 24), v3 + v8, *(void **)(v3 + v9), *(void *)(v3 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_1000259F4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6._countAndFlagsBits = a3;
  v6._object = a4;
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  sub_1000454B0(v6, v7);
}

uint64_t sub_100025A30()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 40) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_release();
  uint64_t v8 = sub_1000153C4();
  v9(v8);
  return _swift_deallocObject(v0, v6, v7);
}

void sub_100025AD4(void **a1)
{
  sub_100045940();
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (void *)v1[4];
  sub_100022A3C(a1, v3, v4, v5);
}

uint64_t sub_100025B4C()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 32) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  uint64_t v8 = sub_1000153C4();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_100025C04(uint64_t a1)
{
  uint64_t v3 = sub_100045940();
  sub_100008628(v3);
  sub_100026778();
  uint64_t v5 = *(void **)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v8 = *(objc_class **)(v1 + v7);
  sub_100023358(a1, v5, v6, v1 + v4, v8);
}

uint64_t sub_100025C78()
{
  uint64_t v1 = *(void *)(type metadata accessor for NetworkRequest(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;

  sub_100045620();
  sub_10000D8E8();
  sub_10000D8B8();
  v5();
  sub_1000266F8();
  swift_bridgeObjectRelease();
  sub_1000266F8();
  sub_1000266F8();
  sub_1000266F8();

  return _swift_deallocObject(v0, v4 + 8, v3);
}

void sub_100025D94(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for NetworkRequest(0);
  sub_100008628(v5);
  sub_100026778();
  sub_1000223F4(a1, *(void **)(v2 + 16), v2 + v6, *(void **)(v2 + v7), a2);
}

void *sub_100025E14(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *a1 = *a2;
    a1 = (void *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100045620();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    Swift::Int v10 = (void *)((char *)a1 + v8);
    id v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *Swift::Int v10 = *v11;
    v10[1] = v12;
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v13 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
    uint64_t v14 = a3[9];
    uint64_t v15 = a3[10];
    uint64_t v16 = (void *)((char *)a1 + v14);
    int64_t v17 = (void *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
    uint64_t v19 = a3[11];
    uint64_t v20 = a3[12];
    BOOL v21 = (void *)((char *)a1 + v19);
    uint64_t v22 = (void *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *BOOL v21 = *v22;
    v21[1] = v23;
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v24 = a3[13];
    uint64_t v25 = a3[14];
    BOOL v26 = (void *)((char *)a1 + v24);
    uint64_t v27 = (void *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *BOOL v26 = *v27;
    v26[1] = v28;
    *((unsigned char *)a1 + v25) = *((unsigned char *)a2 + v25);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100025F84(uint64_t a1)
{
  uint64_t v2 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100026038(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  Swift::Int v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = a3[10];
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v18 = a3[11];
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v18);
  BOOL v21 = (void *)(a2 + v18);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  uint64_t v23 = a3[13];
  uint64_t v24 = a3[14];
  uint64_t v25 = (void *)(a1 + v23);
  BOOL v26 = (void *)(a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100026158(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v13 = a3[11];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v16 = a3[13];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1000262D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  return a1;
}

uint64_t sub_1000263A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[9];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  void *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1000264C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000264DC);
}

uint64_t sub_1000264DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100045620();
  sub_1000205A0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_10000678C(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_100026570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026584);
}

void sub_100026584(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100045620();
  sub_1000205A0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_1000066FC(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_100026614()
{
  uint64_t result = sub_100045620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000266DC()
{
  return sub_1000462E0();
}

uint64_t sub_1000266F8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100026710()
{
  return sub_100045E40();
}

uint64_t sub_10002673C()
{
  return sub_1000462E0();
}

uint64_t sub_100026788()
{
  return swift_allocError();
}

uint64_t sub_1000267A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return a17;
}

uint64_t sub_1000267BC()
{
  return sub_1000462E0();
}

id sub_1000267DC(uint64_t a1)
{
  uint64_t v3 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v3 - 8);
  int v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100018910(a1, (uint64_t)v5);
  uint64_t v6 = sub_100045620();
  int v7 = sub_10000678C((uint64_t)v5, 1, v6);
  uint64_t v8 = v1;
  if (v7 == 1)
  {
    sub_10000B658((uint64_t)v5);
    unint64_t v9 = 0xE700000000000000;
    uint64_t v10 = 0x6E776F6E6B6E75;
  }
  else
  {
    uint64_t v10 = sub_100045580();
    unint64_t v9 = v11;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v12 = (uint64_t *)&v8[OBJC_IVAR____TtC16UtilityExtension15JSServiceObject_url];
  *uint64_t v12 = v10;
  v12[1] = v9;

  uint64_t v13 = (objc_class *)type metadata accessor for JSServiceObject();
  v16.receiver = v8;
  v16.super_class = v13;
  id v14 = objc_msgSendSuper2(&v16, "init");
  sub_10000B658(a1);
  return v14;
}

uint64_t sub_100026988()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16UtilityExtension15JSServiceObject_url);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1000269C4()
{
}

id sub_100026A04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSServiceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSServiceObject()
{
  return self;
}

id sub_100026A70(void *a1, void *a2)
{
  uint64_t v4 = a1[3];
  if (v4)
  {
    sub_1000062B0(a1, a1[3]);
    sub_100006A9C();
    uint64_t v7 = v6;
    __chkstk_darwin();
    sub_100028FA0();
    (*(void (**)(uint64_t))(v7 + 16))(v2);
    uint64_t v8 = sub_1000465B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v4);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [(id)swift_getObjCClassFromMetadata() valueWithObject:v8 inContext:a2];
  swift_unknownObjectRelease();

  return v9;
}

uint64_t JSServiceRequest.init(fragment:options:url:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  uint64_t v6 = (uint64_t)a5 + *(int *)(type metadata accessor for JSServiceRequest() + 24);
  return sub_100026C28(a4, v6);
}

uint64_t type metadata accessor for JSServiceRequest()
{
  uint64_t result = qword_10005D2C0;
  if (!qword_10005D2C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100026C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005C8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t JSServiceRequest.fragment.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t JSServiceRequest.options.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JSServiceRequest.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for JSServiceRequest() + 24);
  return sub_100018910(v3, a1);
}

uint64_t JSServiceRequest.init(deserializing:using:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = a1;
  uint64_t v2 = sub_100005794(&qword_10005C8E8);
  uint64_t v3 = sub_100018C3C(v2);
  __chkstk_darwin(v3);
  uint64_t v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005794(&qword_10005CA90);
  uint64_t v6 = sub_100018C3C(v5);
  __chkstk_darwin(v6);
  sub_100018C78();
  uint64_t v9 = v8 - v7;
  sub_1000459A0();
  sub_100006A9C();
  uint64_t v11 = v10;
  uint64_t v13 = __chkstk_darwin(v12);
  __chkstk_darwin(v13);
  sub_10002907C();
  sub_1000459B0();
  uint64_t v14 = sub_100045980();
  uint64_t v16 = v15;
  uint64_t v17 = *(void (**)(void))(v11 + 8);
  sub_10002900C();
  v17();
  uint64_t v18 = v28;
  *uint64_t v28 = v14;
  v18[1] = v16;
  uint64_t v19 = v18;
  sub_100029030();
  sub_1000459B0();
  sub_100045950();
  sub_10002900C();
  v17();
  uint64_t v20 = sub_100045BD0();
  if (sub_10000678C(v9, 1, v20) == 1)
  {
    sub_10000D5F8(v9, &qword_10005CA90);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = sub_100045BC0();
    sub_100018CB4();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v9, v20);
  }
  v19[2] = v21;
  sub_1000459B0();
  uint64_t v23 = (uint64_t)v30;
  sub_100045970();
  sub_100045AC0();
  sub_10000D8E8();
  sub_10000D8B8();
  v24();
  sub_10002900C();
  v17();
  sub_10002900C();
  v17();
  uint64_t v25 = type metadata accessor for JSServiceRequest();
  return sub_100026C28(v23, (uint64_t)v19 + *(int *)(v25 + 24));
}

uint64_t sub_100026FE4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  return JSServiceRequest.init(deserializing:using:)(a1, a2);
}

unint64_t JSServiceRequest.kind.getter()
{
  return 0xD000000000000016;
}

JSValue __swiftcall JSServiceRequest.makeValue(in:)(JSContext in)
{
  uint64_t v3 = sub_100005794(&qword_10005C8E8);
  uint64_t v4 = sub_100018C3C(v3);
  __chkstk_darwin(v4);
  sub_100018C78();
  uint64_t v7 = v6 - v5;
  result.super.Class isa = (Class)[self valueWithNewObjectInContext:in.super.isa];
  if (!result.super.isa)
  {
    __break(1u);
    goto LABEL_15;
  }
  Class isa = result.super.isa;
  sub_1000106A0();
  uint64_t v10 = in.super.isa;
  result.super.Class isa = (Class)sub_100028FB8();
  if (!result.super.isa)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_1000462F0();
  if (!*(void *)(v1 + 8)) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  result.super.Class isa = (Class)sub_100028FB8();
  if (!result.super.isa)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_1000462F0();
LABEL_6:
  uint64_t v12 = type metadata accessor for JSServiceRequest();
  sub_100018910(v1 + *(int *)(v12 + 24), v7);
  uint64_t v13 = sub_100045620();
  if (sub_10000678C(v7, 1, v13) == 1)
  {
    sub_10000D5F8(v7, &qword_10005C8E8);
LABEL_10:
    if (!*(void *)(v1 + 16)) {
      return (JSValue)isa;
    }
    sub_100005794(&qword_10005C5B0);
    uint64_t v18 = v10;
    swift_bridgeObjectRetain();
    result.super.Class isa = (Class)sub_100028FB8();
    if (result.super.isa)
    {
      sub_1000462F0();
      return (JSValue)isa;
    }
    goto LABEL_17;
  }
  sub_100045580();
  sub_100018CB4();
  sub_10000D8B8();
  v16(v14, v15);
  uint64_t v17 = v10;
  result.super.Class isa = (Class)sub_100028FB8();
  if (result.super.isa)
  {
    sub_1000462F0();
    goto LABEL_10;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_100027284()
{
}

unint64_t sub_100027298()
{
  return 0xD000000000000016;
}

void *Data.init(deserializing:using:)(void *a1)
{
  uint64_t v3 = sub_100005794(&qword_10005CA90);
  uint64_t v4 = sub_100018C3C(v3);
  __chkstk_darwin(v4);
  sub_100028FA0();
  uint64_t v5 = a1;
  sub_100045950();
  uint64_t v6 = sub_100045BD0();
  if (sub_10000678C(v1, 1, v6) == 1)
  {
    sub_10000D5F8(v1, &qword_10005CA90);
LABEL_6:
    [objc_allocWithZone((Class)NSError) init];
LABEL_7:
    swift_willThrow();
    sub_100045AC0();
    sub_10000D8E8();
    sub_10000D8B8();
    v14();
    sub_1000459A0();
    sub_10000D8E8();
    sub_10000D8B8();
    v15();
    return v5;
  }
  uint64_t v5 = (void *)sub_100045BC0();
  sub_100018CB4();
  sub_10000D8B8();
  v7();
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v8 = self;
  Class isa = sub_1000460D0().super.isa;
  swift_bridgeObjectRelease();
  id v17 = 0;
  id v10 = [v8 dataWithJSONObject:isa options:0 error:&v17];

  id v11 = v17;
  if (!v10)
  {
    uint64_t v5 = v11;
    sub_100045550();

    goto LABEL_7;
  }
  uint64_t v5 = (void *)sub_100045650();

  sub_100045AC0();
  sub_10000D8E8();
  sub_10000D8B8();
  v12();
  sub_1000459A0();
  sub_10000D8E8();
  sub_10000D8B8();
  v13();
  return v5;
}

uint64_t sub_100027578(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656D67617266 && a2 == 0xE800000000000000;
  if (v2 || (sub_10002907C(), (sub_100029048() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000;
    if (v6 || (sub_100029030(), (sub_100029048() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 7107189 && a2 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_100029048();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_100027674(char a1)
{
  if (!a1) {
    return 0x746E656D67617266;
  }
  if (a1 == 1) {
    return 0x736E6F6974706FLL;
  }
  return 7107189;
}

void *sub_1000276C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  JSValue result = Data.init(deserializing:using:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1000276F0()
{
  return sub_100027674(*v0);
}

uint64_t sub_1000276F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100027578(a1, a2);
  *a3 = result;
  return result;
}

void sub_100027720(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10002772C(uint64_t a1)
{
  unint64_t v2 = sub_100028200();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100027768(uint64_t a1)
{
  unint64_t v2 = sub_100028200();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t JSServiceRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100005794(&qword_10005C8E8);
  uint64_t v6 = sub_100018C3C(v5);
  __chkstk_darwin(v6);
  sub_100028FF0(v7, v24);
  sub_100005794(&qword_10005D218);
  sub_100006A9C();
  __chkstk_darwin(v8);
  sub_100029018();
  uint64_t v9 = type metadata accessor for JSServiceRequest();
  sub_100018CB4();
  __chkstk_darwin(v10);
  sub_100028FA0();
  sub_1000062B0(a1, a1[3]);
  sub_100028200();
  sub_100046680();
  if (v2) {
    return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
  }
  uint64_t v26 = v9;
  LOBYTE(v30[0]) = 0;
  *uint64_t v3 = sub_100046530();
  v3[1] = v12;
  LOBYTE(v29) = 1;
  sub_10002824C();
  sub_100046560();
  uint64_t v13 = self;
  id v14 = v30[0];
  id v25 = v30[1];
  Class isa = sub_100045640().super.isa;
  v30[0] = 0;
  id v16 = [v13 JSONObjectWithData:isa options:0 error:v30];

  if (v16)
  {
    id v17 = v30[0];
    sub_100046370();
    sub_1000282F4((uint64_t)v14, (unint64_t)v25);
    swift_unknownObjectRelease();
    sub_100005794(&qword_10005C5B0);
    int v18 = swift_dynamicCast();
    uint64_t v19 = v29;
    if (!v18) {
      uint64_t v19 = 0;
    }
    v3[2] = v19;
    LOBYTE(v30[0]) = 2;
    sub_100046530();
    sub_100045600();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_100029064();
    v21(v20);
    sub_100026C28(v28, (uint64_t)v3 + *(int *)(v26 + 24));
    sub_100018614((uint64_t)v3, a2);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
    return sub_100028298((uint64_t)v3);
  }
  else
  {
    id v22 = v30[0];
    sub_100045550();

    swift_willThrow();
    sub_1000282F4((uint64_t)v14, (unint64_t)v25);
    sub_10000D8B8();
    v23();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t JSServiceRequest.encode(to:)(void *a1)
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  uint64_t v7 = sub_100005794(&qword_10005C8E8);
  uint64_t v8 = sub_100018C3C(v7);
  __chkstk_darwin(v8);
  sub_100018C78();
  uint64_t v11 = v10 - v9;
  sub_100045620();
  sub_100006A9C();
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  __chkstk_darwin(v12);
  sub_100028FF0(v14, v31);
  uint64_t v15 = sub_100005794(&qword_10005D230);
  sub_100006A9C();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_100029018();
  sub_1000062B0(a1, a1[3]);
  sub_100028200();
  sub_100046690();
  if (*(void *)(v5 + 8))
  {
    LOBYTE(v35[0]) = 0;
    sub_100029094();
    uint64_t v4 = v2;
    if (v2) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
    }
  }
  if (*(void *)(v5 + 16))
  {
    uint64_t v19 = self;
    Class isa = sub_1000460D0().super.isa;
    v35[0] = 0;
    id v21 = [v19 dataWithJSONObject:isa options:0 error:v35];

    id v22 = v35[0];
    if (!v21)
    {
      uint64_t v28 = v22;
      sub_100045550();

      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
    }
    uint64_t v23 = (void *)sub_100045650();
    id v25 = v24;

    v35[0] = v23;
    v35[1] = v25;
    sub_10002834C();
    sub_1000465A0();
    if (v4)
    {
      sub_10002900C();
      v26();
      return sub_1000282F4((uint64_t)v23, (unint64_t)v25);
    }
    sub_1000282F4((uint64_t)v23, (unint64_t)v25);
  }
  uint64_t v29 = type metadata accessor for JSServiceRequest();
  sub_100018910(v5 + *(int *)(v29 + 24), v11);
  if (sub_10000678C(v11, 1, v34) == 1)
  {
    sub_10002900C();
    v30();
    return sub_10000D5F8(v11, &qword_10005C8E8);
  }
  (*(void (**)(void))(v33 + 32))();
  sub_100045580();
  LOBYTE(v35[0]) = 2;
  sub_100029094();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
}

uint64_t sub_100027F34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return JSServiceRequest.init(from:)(a1, a2);
}

uint64_t sub_100027F4C(void *a1)
{
  return JSServiceRequest.encode(to:)(a1);
}

uint64_t JSServiceRequest.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)0xE900000000000064;
  uint64_t v3 = 0x656E696665646E75;
  sub_100005794(&qword_10005C8E8);
  sub_100018CB4();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v20 - v8;
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_100046460(56);
  uint64_t v10 = type metadata accessor for JSServiceRequest();
  v20[0] = v10;
  sub_100005794(&qword_10005D240);
  v23._countAndFlagsBits = sub_100046190();
  object = v23._object;
  sub_1000461B0(v23);
  swift_bridgeObjectRelease();
  v24._object = (void *)0x800000010004AB60;
  v24._countAndFlagsBits = 0xD000000000000013;
  sub_1000461B0(v24);
  uint64_t v12 = v0[1];
  if (v12)
  {
    v20[0] = *v0;
    v20[1] = v12;
    swift_bridgeObjectRetain();
    sub_100005794(&qword_10005CFF0);
    v13._countAndFlagsBits = sub_100046190();
    object = v13._object;
  }
  else
  {
    v13._countAndFlagsBits = sub_100028FD4();
  }
  v13._object = object;
  sub_1000461B0(v13);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x706F202020200A29;
  v25._object = (void *)0xEF203A736E6F6974;
  sub_1000461B0(v25);
  if (v0[2])
  {
    v20[0] = v0[2];
    swift_bridgeObjectRetain();
    sub_100005794(&qword_10005D248);
    v14._countAndFlagsBits = sub_100046190();
    object = v14._object;
  }
  else
  {
    v14._countAndFlagsBits = sub_100028FD4();
  }
  v14._object = object;
  sub_1000461B0(v14);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 0x7275202020200A29;
  v26._object = (void *)0xEB00000000203A6CLL;
  sub_1000461B0(v26);
  uint64_t v15 = (uint64_t)v0 + *(int *)(v10 + 24);
  sub_100018910((uint64_t)v1 + *(int *)(v10 + 24), (uint64_t)v9);
  uint64_t v16 = sub_100045620();
  int v17 = sub_10000678C((uint64_t)v9, 1, v16);
  sub_10000D5F8((uint64_t)v9, &qword_10005C8E8);
  if (v17 != 1)
  {
    sub_100018910(v15, (uint64_t)v7);
    uint64_t v3 = sub_100046190();
    uint64_t v2 = v18;
  }
  v27._countAndFlagsBits = v3;
  v27._object = v2;
  sub_1000461B0(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 8194601;
  v28._object = (void *)0xE300000000000000;
  sub_1000461B0(v28);
  return v21;
}

unint64_t sub_100028200()
{
  unint64_t result = qword_10005D220;
  if (!qword_10005D220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D220);
  }
  return result;
}

unint64_t sub_10002824C()
{
  unint64_t result = qword_10005D228;
  if (!qword_10005D228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D228);
  }
  return result;
}

uint64_t sub_100028298(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSServiceRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000282F4(uint64_t a1, unint64_t a2)
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

unint64_t sub_10002834C()
{
  unint64_t result = qword_10005D238;
  if (!qword_10005D238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D238);
  }
  return result;
}

uint64_t sub_100028398()
{
  return sub_100028400(&qword_10005D250);
}

uint64_t sub_1000283CC()
{
  return sub_100028400(&qword_10005D258);
}

uint64_t sub_100028400(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for JSServiceRequest();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100028448()
{
  unint64_t result = qword_10005D260;
  if (!qword_10005D260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D260);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for JSServiceRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100045620();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_10000678C((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = sub_100005794(&qword_10005C8E8);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      sub_1000066FC((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for JSServiceRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100045620();
  uint64_t result = sub_10000678C(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100045620();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_10000678C((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100005794(&qword_10005C8E8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    sub_1000066FC((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithCopy for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100045620();
  int v10 = sub_10000678C((uint64_t)v7, 1, v9);
  int v11 = sub_10000678C((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_100005794(&qword_10005C8E8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  sub_1000066FC((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_100045620();
  if (sub_10000678C((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_100005794(&qword_10005C8E8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    sub_1000066FC((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

void *assignWithTake for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100045620();
  int v11 = sub_10000678C((uint64_t)v8, 1, v10);
  int v12 = sub_10000678C((uint64_t)v9, 1, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_100005794(&qword_10005C8E8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  sub_1000066FC((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100028B84);
}

uint64_t sub_100028B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
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
    uint64_t v9 = sub_100005794(&qword_10005C8E8);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return sub_10000678C(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028C30);
}

uint64_t sub_100028C30(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_100005794(&qword_10005C8E8);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_1000066FC(v8, a2, a2, v7);
  }
  return result;
}

void sub_100028CB4()
{
  sub_100028D54();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100028D54()
{
  if (!qword_10005D2D0)
  {
    sub_100045620();
    unint64_t v0 = sub_100046350();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005D2D0);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for JSServiceRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100028E78);
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

ValueMetadata *type metadata accessor for JSServiceRequest.CodingKeys()
{
  return &type metadata for JSServiceRequest.CodingKeys;
}

unint64_t sub_100028EB4()
{
  unint64_t result = qword_10005D308;
  if (!qword_10005D308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D308);
  }
  return result;
}

unint64_t sub_100028F04()
{
  unint64_t result = qword_10005D310;
  if (!qword_10005D310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D310);
  }
  return result;
}

unint64_t sub_100028F54()
{
  unint64_t result = qword_10005D318;
  if (!qword_10005D318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D318);
  }
  return result;
}

id sub_100028FB8()
{
  return sub_100026A70((void *)(v1 - 112), v0);
}

uint64_t sub_100028FD4()
{
  return 0x656E696665646E75;
}

void sub_100028FF0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100029030()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_100029048()
{
  return sub_1000465C0();
}

uint64_t sub_100029064()
{
  return v0;
}

uint64_t sub_10002907C()
{
  return 0x746E656D67617266;
}

uint64_t sub_100029094()
{
  return sub_100046570();
}

uint64_t sub_1000290B4()
{
  return sub_100029E80();
}

uint64_t sub_1000290CC(void *a1)
{
  return sub_10002AA4C(a1);
}

uint64_t sub_1000290F8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a3;
  Swift::String v27 = a1;
  uint64_t v4 = sub_100045940();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  Swift::String v25 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = sub_100005794(&qword_10005D348);
  __chkstk_darwin(v10 - 8);
  int v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100046220();
  sub_1000066FC((uint64_t)v12, 1, 1, v13);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v9, a2, v4);
  v14((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v4);
  uint64_t v15 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = (v15 + 32) & ~v15;
  unint64_t v17 = (v6 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (v15 + v17 + 8) & ~v15;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v20(v19 + v16, v9, v4);
  uint64_t v21 = v27;
  *(void *)(v19 + v17) = v27;
  v20(v19 + v18, v25, v4);
  id v22 = v21;
  sub_100029CDC((uint64_t)v12, (uint64_t)&unk_10005D370, v19);
  return swift_release();
}

uint64_t sub_100029328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  _OWORD v6[2] = a4;
  uint64_t v7 = sub_100045E70();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  type metadata accessor for SessionAuthenticatorBillingPlanResponse(0);
  v6[8] = swift_task_alloc();
  uint64_t v8 = sub_100045800();
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  uint64_t v9 = sub_100045730();
  v6[12] = v9;
  v6[13] = *(void *)(v9 - 8);
  v6[14] = swift_task_alloc();
  return _swift_task_switch(sub_1000294D0, 0, 0);
}

uint64_t sub_1000294D0()
{
  sub_1000457C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v1;
  void *v1 = v0;
  v1[1] = sub_100029574;
  uint64_t v2 = *(void *)(v0 + 112);
  return OpenAIAuthenticator.refreshBillingPlan()(v2);
}

uint64_t sub_100029574()
{
  sub_10002C0AC();
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v1[10] + 8))(v1[11], v1[9]);
  if (v0) {
    int v3 = sub_1000298FC;
  }
  else {
    int v3 = sub_1000296B8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000296B8()
{
  uint64_t v1 = v0[16];
  (*(void (**)(void, void, void))(v0[13] + 16))(v0[8], v0[14], v0[12]);
  sub_100005794(&qword_10005CD10);
  uint64_t v2 = sub_10002C168();
  *(_OWORD *)(v2 + 16) = xmmword_100047690;
  id v3 = sub_100029A60();
  uint64_t v4 = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 32) = v3;
  uint64_t v5 = (void *)sub_100045930();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_10002B6C4();
    uint64_t v6 = sub_10002C138();
    v7(v6);
    uint64_t v8 = (objc_class *)v0[3];
    sub_100005794(&qword_10005CD10);
    uint64_t v9 = (__n128 *)sub_10002C168();
    sub_10002C234(v9, (__n128)xmmword_100047690);
    sub_10002C1FC();
    v10.super.Class isa = v8;
    Class isa = sub_100045E50(v10).super.isa;
    uint64_t v12 = sub_10002C138();
    v13(v12);
    v9[3].n128_u64[1] = v4;
    v9[2].n128_u64[0] = (unint64_t)isa;
    uint64_t v14 = (void *)sub_100045930();
    swift_bridgeObjectRelease();

    swift_errorRelease();
  }
  else
  {

    sub_10002B6C4();
    uint64_t v15 = sub_10002C138();
    v16(v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10002C0D4();
  return v17();
}

uint64_t sub_1000298FC()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = (objc_class *)v0[3];
  sub_100005794(&qword_10005CD10);
  uint64_t v5 = (__n128 *)sub_10002C168();
  sub_10002C234(v5, (__n128)xmmword_100047690);
  sub_10002C1FC();
  v6.super.Class isa = v4;
  Class isa = sub_100045E50(v6).super.isa;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5[3].n128_u64[1] = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  v5[2].n128_u64[0] = (unint64_t)isa;
  uint64_t v8 = (void *)sub_100045930();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10002C0D4();
  return v9();
}

id sub_100029A60()
{
  sub_10002C180();
  uint64_t v1 = sub_100045700();
  sub_10000AD5C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100018C78();
  uint64_t v7 = v6 - v5;
  id result = [self valueWithNewObjectInContext:v0];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v9 = result;
  sub_100045710();
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v7, v1);
  if (v10 == enum case for OpenAIAuthenticator.BillingPlan.Category.free(_:))
  {
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    id v11 = v0;
    id v10 = sub_100028FB8();
    if (v10)
    {
LABEL_7:
      sub_10002C084();
      goto LABEL_10;
    }
    __break(1u);
  }
  int v12 = (int)v10;
  int v13 = enum case for OpenAIAuthenticator.BillingPlan.Category.paid(_:);
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  if (v12 == v13)
  {
    id v14 = v0;
    id result = sub_100028FB8();
    if (!result)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  id v15 = v0;
  id result = sub_100028FB8();
  if (result)
  {
    sub_10002C084();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
LABEL_10:
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    sub_100045720();
    id v16 = v0;
    id result = sub_100028FB8();
    if (result)
    {
      sub_10002C1DC();
      sub_1000456F0();
      id v17 = v16;
      id result = sub_100028FB8();
      if (result)
      {
        sub_1000462F0();
        return v9;
      }
      goto LABEL_15;
    }
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_100029CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100046220();
  if (sub_10000678C(a1, 1, v5) == 1)
  {
    sub_10002B670(a1, &qword_10005D348);
  }
  else
  {
    sub_100046210();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100046200();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100029E68()
{
  return sub_100029E80();
}

uint64_t sub_100029E80()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

id sub_100029EDC(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = type metadata accessor for SessionAuthenticatorCredentialsResponse(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100045780();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045800();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005794(&qword_10005D360);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  id v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&v20 - v16;
  sub_1000457C0();
  sub_100045790();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10002B608((uint64_t)v17, (uint64_t)v15);
  if (sub_10000678C((uint64_t)v15, 1, v4) != 1) {
    goto LABEL_4;
  }
  sub_10002B670((uint64_t)v15, &qword_10005D360);
  id v18 = [self valueWithUndefinedInContext:v21];
  if (!v18)
  {
    __break(1u);
LABEL_4:
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v15, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v3, v7, v4);
    id v18 = sub_10002A1EC();
    sub_10002B6C4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10002B670((uint64_t)v17, &qword_10005D360);
  return v18;
}

id sub_10002A1EC()
{
  uint64_t v1 = sub_10002C180();
  uint64_t v2 = type metadata accessor for SessionAuthenticatorBillingPlanResponse(v1);
  __chkstk_darwin(v2 - 8);
  sub_100018C78();
  id result = [self valueWithNewObjectInContext:v0];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = result;
  sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  uint64_t v12 = &type metadata for String;
  uint64_t v10 = sub_100045770();
  uint64_t v11 = v5;
  id v6 = v0;
  id result = sub_10002C1C0();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_10002C1DC();
  uint64_t v12 = &type metadata for String;
  uint64_t v10 = sub_100045760();
  uint64_t v11 = v7;
  id v8 = v6;
  id result = sub_10002C1C0();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_1000462F0();
  sub_100045740();
  sub_100029A60();
  sub_10002B6C4();
  sub_10002C084();
  uint64_t v12 = (void *)sub_100045670();
  sub_100006A38(&v10);
  sub_100045750();
  id v9 = v8;
  id result = sub_10002C1C0();
  if (result)
  {
    sub_1000462F0();
    return v4;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002A408()
{
  sub_1000067B4(0, &qword_10005CC30);
  uint64_t v0 = (void *)sub_100046320();
  uint64_t v1 = sub_100046330();

  return v1;
}

uint64_t sub_10002A480(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = type metadata accessor for SessionAuthenticatorSignInResponse(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100045800();
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  __chkstk_darwin(v4);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000457E0();
  uint64_t v23 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045620();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000462D0();
  if (v17)
  {
    sub_100045600();
    swift_bridgeObjectRelease();
    if (sub_10000678C((uint64_t)v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      sub_1000457C0();
      sub_1000457B0();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v22);
      uint64_t v19 = v23;
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v3, v9, v7);
      uint64_t v18 = (uint64_t)sub_10002A858();
      sub_10002B6C4();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v7);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      return v18;
    }
    sub_10002B670((uint64_t)v12, &qword_10005C8E8);
  }
  uint64_t v18 = sub_100045E70();
  sub_100008AAC();
  swift_allocError();
  sub_100045E20();
  swift_willThrow();
  return v18;
}

id sub_10002A858()
{
  sub_10002C180();
  uint64_t v1 = sub_100045620();
  sub_10000AD5C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100018C78();
  uint64_t v7 = v6 - v5;
  id result = [self valueWithNewObjectInContext:v0];
  if (result)
  {
    id v9 = result;
    sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    sub_1000457D0();
    uint64_t v10 = sub_100045580();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
    v14[3] = &type metadata for String;
    v14[0] = v10;
    v14[1] = v12;
    id v13 = v0;
    id result = sub_100026A70(v14, v0);
    if (result)
    {
      sub_1000462F0();
      return v9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10002AA08()
{
  return sub_100029E80();
}

uint64_t sub_10002AA20(void *a1)
{
  return sub_10002AA4C(a1);
}

uint64_t sub_10002AA4C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100046090();
  sub_10000AD5C();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100018C78();
  uint64_t v10 = v9 - v8;
  id v11 = a1;
  sub_100046070();
  if (!v1)
  {
    uint64_t v2 = sub_100046080();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
  return v2;
}

uint64_t sub_10002AB1C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a3;
  Swift::String v25 = a1;
  uint64_t v4 = sub_100045940();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_100005794(&qword_10005D348);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100046220();
  sub_1000066FC((uint64_t)v13, 1, 1, v14);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v10, a2, v4);
  v15(v8, v24, v4);
  uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v18 = (v6 + v16 + v17) & ~v16;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v20(v19 + v17, v10, v4);
  v20(v19 + v18, v8, v4);
  uint64_t v21 = v25;
  *(void *)(v19 + ((v6 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
  id v22 = v21;
  sub_100029CDC((uint64_t)v13, (uint64_t)&unk_10005D358, v19);
  return swift_release();
}

uint64_t sub_10002AD48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  _OWORD v6[2] = a4;
  uint64_t v7 = sub_100045E70();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  uint64_t v8 = sub_100045800();
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  return _swift_task_switch(sub_10002AE68, 0, 0);
}

uint64_t sub_10002AE68()
{
  sub_1000457C0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_10002AF04;
  return OpenAIAuthenticator.signOut()();
}

uint64_t sub_10002AF04()
{
  sub_10002C0AC();
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v1[9] + 8))(v1[10], v1[8]);
  if (v0) {
    uint64_t v3 = sub_10002B1C8;
  }
  else {
    uint64_t v3 = sub_10002B048;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002B048()
{
  uint64_t v1 = v0[12];
  sub_100005794(&qword_10005CD10);
  uint64_t v2 = sub_10002C168();
  *(_OWORD *)(v2 + 16) = xmmword_100047690;
  *(void *)(v2 + 56) = &type metadata for Bool;
  *(unsigned char *)(v2 + 32) = 1;
  uint64_t v3 = (void *)sub_100045930();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (objc_class *)v0[4];
    uint64_t v4 = v0[5];
    sub_100005794(&qword_10005CD10);
    uint64_t v6 = (__n128 *)sub_10002C168();
    sub_10002C234(v6, (__n128)xmmword_100047690);
    sub_10002C1FC();
    v7.super.Class isa = v5;
    sub_100045E50(v7);
    uint64_t v8 = sub_10002C14C();
    v9(v8);
    uint64_t v10 = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
    uint64_t v11 = (void *)sub_10002C19C(v10);
    swift_bridgeObjectRelease();
    if (v4)
    {
      swift_errorRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10002C0C4();
      goto LABEL_7;
    }

    swift_errorRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10002C0D4();
LABEL_7:
  return v12();
}

uint64_t sub_10002B1C8()
{
  uint64_t v2 = *(objc_class **)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  sub_100005794(&qword_10005CD10);
  uint64_t v3 = (__n128 *)sub_10002C168();
  sub_10002C234(v3, (__n128)xmmword_100047690);
  sub_10002C1FC();
  v4.super.Class isa = v2;
  sub_100045E50(v4);
  uint64_t v5 = sub_10002C14C();
  v6(v5);
  uint64_t v7 = sub_1000067B4(0, (unint64_t *)&qword_10005C5C0);
  uint64_t v8 = (void *)sub_10002C19C(v7);
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10002C0C4();
  }
  else
  {

    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10002C0D4();
  }
  return v9();
}

id sub_10002B330()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSSessionAuthenticatorObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10002B388()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSSessionAuthenticatorObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSSessionAuthenticatorObject()
{
  return self;
}

uint64_t sub_10002B3E0()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((*(void *)(v4 + 64) + v5 + ((v5 + 32) & ~v5)) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  uint64_t v8 = *(void (**)(void))(v2 + 8);
  sub_10002C0F8();
  v8();
  sub_10002C0F8();
  v8();

  return _swift_deallocObject(v0, v7 + 8, v6);
}

uint64_t sub_10002B4B0()
{
  uint64_t v1 = sub_100045940();
  sub_100008628(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  void *v2 = v0;
  v2[1] = sub_10002C06C;
  uint64_t v3 = sub_10002C108();
  return sub_10002AD48(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10002B5AC(uint64_t a1)
{
  return sub_10002A480(a1);
}

uint64_t type metadata accessor for SessionAuthenticatorSignInResponse(uint64_t a1)
{
  return sub_10002414C(a1, qword_10005D4F0);
}

uint64_t type metadata accessor for SessionAuthenticatorCredentialsResponse(uint64_t a1)
{
  return sub_10002414C(a1, qword_10005D460);
}

uint64_t sub_10002B608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005D360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002B670(uint64_t a1, uint64_t *a2)
{
  sub_100005794(a2);
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10002B6C4()
{
  uint64_t v1 = sub_10002C180();
  v2(v1);
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v3 + 8))(v0);
  return v0;
}

uint64_t type metadata accessor for SessionAuthenticatorBillingPlanResponse(uint64_t a1)
{
  return sub_10002414C(a1, qword_10005D3D0);
}

uint64_t sub_10002B738()
{
  sub_100045940();
  sub_10000AD5C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  unint64_t v8 = (v6 + ((v5 + 32) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = ((v5 + v8 + 8) & ~v5) + v6;
  swift_unknownObjectRelease();
  uint64_t v10 = *(void (**)(void))(v2 + 8);
  sub_10002C0F8();
  v10();

  sub_10002C0F8();
  v10();
  return _swift_deallocObject(v0, v9, v7);
}

uint64_t sub_10002B808()
{
  uint64_t v1 = sub_100045940();
  sub_100008628(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  void *v2 = v0;
  v2[1] = sub_10002B904;
  uint64_t v3 = sub_10002C108();
  return sub_100029328(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10002B904()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002B9F8()
{
  return sub_10002BCB0();
}

uint64_t sub_10002BA10()
{
  return sub_10002BD24();
}

uint64_t sub_10002BA28()
{
  return sub_10002BD98();
}

uint64_t sub_10002BA40()
{
  return sub_10002BDFC();
}

uint64_t sub_10002BA58()
{
  return sub_10002BE60();
}

uint64_t sub_10002BA70()
{
  return sub_10002BEC4();
}

uint64_t sub_10002BA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BA9C);
}

uint64_t sub_10002BA9C()
{
  sub_100045730();
  uint64_t v0 = sub_10002C18C();
  return sub_10000678C(v0, v1, v2);
}

uint64_t sub_10002BADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BAF0);
}

uint64_t sub_10002BAF0()
{
  sub_100045730();
  uint64_t v0 = sub_10002C0E4();
  return sub_1000066FC(v0, v1, v2, v3);
}

uint64_t sub_10002BB30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002BFD0(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.BillingPlan);
}

uint64_t sub_10002BB48()
{
  return sub_10002BCB0();
}

uint64_t sub_10002BB60()
{
  return sub_10002BD24();
}

uint64_t sub_10002BB78()
{
  return sub_10002BD98();
}

uint64_t sub_10002BB90()
{
  return sub_10002BDFC();
}

uint64_t sub_10002BBA8()
{
  return sub_10002BE60();
}

uint64_t sub_10002BBC0()
{
  return sub_10002BEC4();
}

uint64_t sub_10002BBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BBEC);
}

uint64_t sub_10002BBEC()
{
  sub_100045780();
  uint64_t v0 = sub_10002C18C();
  return sub_10000678C(v0, v1, v2);
}

uint64_t sub_10002BC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BC40);
}

uint64_t sub_10002BC40()
{
  sub_100045780();
  uint64_t v0 = sub_10002C0E4();
  return sub_1000066FC(v0, v1, v2, v3);
}

uint64_t sub_10002BC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002BFD0(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.Credentials);
}

uint64_t sub_10002BC98()
{
  return sub_10002BCB0();
}

uint64_t sub_10002BCB0()
{
  uint64_t v2 = sub_10002C070();
  v3(v2);
  sub_10001DBE8();
  uint64_t v6 = *v5;
  return v6(v1, v0, v4);
}

uint64_t sub_10002BD0C()
{
  return sub_10002BD24();
}

uint64_t sub_10002BD24()
{
  uint64_t v1 = sub_10002C180();
  v2(v1);
  sub_10001DBE8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  return v5(v0, v3);
}

uint64_t sub_10002BD80()
{
  return sub_10002BD98();
}

uint64_t sub_10002BD98()
{
  uint64_t v1 = sub_10002C070();
  v2(v1);
  sub_10001DBE8();
  uint64_t v3 = sub_10002C128();
  v4(v3);
  return v0;
}

uint64_t sub_10002BDE4()
{
  return sub_10002BDFC();
}

uint64_t sub_10002BDFC()
{
  uint64_t v1 = sub_10002C070();
  v2(v1);
  sub_10001DBE8();
  uint64_t v3 = sub_10002C128();
  v4(v3);
  return v0;
}

uint64_t sub_10002BE48()
{
  return sub_10002BE60();
}

uint64_t sub_10002BE60()
{
  uint64_t v1 = sub_10002C070();
  v2(v1);
  sub_10001DBE8();
  uint64_t v3 = sub_10002C128();
  v4(v3);
  return v0;
}

uint64_t sub_10002BEAC()
{
  return sub_10002BEC4();
}

uint64_t sub_10002BEC4()
{
  uint64_t v1 = sub_10002C070();
  v2(v1);
  sub_10001DBE8();
  uint64_t v3 = sub_10002C128();
  v4(v3);
  return v0;
}

uint64_t sub_10002BF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BF24);
}

uint64_t sub_10002BF24()
{
  sub_1000457E0();
  uint64_t v0 = sub_10002C18C();
  return sub_10000678C(v0, v1, v2);
}

uint64_t sub_10002BF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BF78);
}

uint64_t sub_10002BF78()
{
  sub_1000457E0();
  uint64_t v0 = sub_10002C0E4();
  return sub_1000066FC(v0, v1, v2, v3);
}

uint64_t sub_10002BFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002BFD0(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.Session);
}

uint64_t sub_10002BFD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10002C070()
{
  return 0;
}

uint64_t sub_10002C084()
{
  return sub_1000462F0();
}

uint64_t sub_10002C0C4()
{
  return v0 + 8;
}

uint64_t sub_10002C0D4()
{
  return v0 + 8;
}

uint64_t sub_10002C0E4()
{
  return v0;
}

uint64_t sub_10002C108()
{
  return v0;
}

uint64_t sub_10002C128()
{
  return v0;
}

uint64_t sub_10002C138()
{
  return v0;
}

uint64_t sub_10002C14C()
{
  return v0;
}

uint64_t sub_10002C168()
{
  return swift_allocObject();
}

uint64_t sub_10002C180()
{
  return 0;
}

uint64_t sub_10002C18C()
{
  return v0;
}

uint64_t sub_10002C19C(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_100045930();
}

id sub_10002C1C0()
{
  return sub_100026A70((void *)(v1 - 96), v0);
}

uint64_t sub_10002C1DC()
{
  return sub_1000462F0();
}

uint64_t sub_10002C1FC()
{
  return sub_10001AF30(v0);
}

uint64_t sub_10002C214()
{
  return swift_errorRelease();
}

uint64_t sub_10002C234(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return swift_errorRetain();
}

uint64_t *sub_10002C24C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_100045620();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_10002C318(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_100045620();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(v2, v3);
}

unsigned char *sub_10002C380(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100045620();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002C3FC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100045620();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002C478(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100045620();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002C4F4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_100045620();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_10002C570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002C584);
}

uint64_t sub_10002C584(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 250)
  {
    unsigned int v4 = *a1;
    if (v4 >= 6) {
      return v4 - 5;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_100045620();
    uint64_t v9 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return sub_10000678C(v9, a2, v8);
  }
}

uint64_t sub_10002C604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002C618);
}

unsigned char *sub_10002C618(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 250)
  {
    *uint64_t result = a2 + 5;
  }
  else
  {
    uint64_t v7 = sub_100045620();
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)sub_1000066FC(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for JSSourceFile()
{
  uint64_t result = qword_10005D580;
  if (!qword_10005D580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002C6DC()
{
  uint64_t result = sub_100045620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for JSSourceFile.Format(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for JSSourceFile.Format(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x10002C8C8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSSourceFile.Format()
{
  return &type metadata for JSSourceFile.Format;
}

unint64_t sub_10002C904()
{
  unint64_t result = qword_10005D5B8;
  if (!qword_10005D5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D5B8);
  }
  return result;
}

Swift::Int sub_10002C950(char a1)
{
  int v1 = a1 & 1;
  sub_100046650();
  sub_100046660((v1 + 1));
  return sub_100046670();
}

void sub_10002C998(uint64_t a1, char a2)
{
}

Swift::Int sub_10002C9C4(uint64_t a1, char a2)
{
  int v2 = a2 & 1;
  sub_100046650();
  sub_100046660((v2 + 1));
  return sub_100046670();
}

uint64_t sub_10002CA08(uint64_t a1)
{
  if (a1 == 2) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1 == 1) {
    return 0;
  }
  else {
    return v1;
  }
}

uint64_t sub_10002CA20(char a1)
{
  return (a1 & 1u) + 1;
}

BOOL sub_10002CA2C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10002FB5C(*a1, *a2);
}

Swift::Int sub_10002CA38()
{
  return sub_10002C950(*v0);
}

void sub_10002CA40(uint64_t a1)
{
  sub_10002C998(a1, *v1);
}

Swift::Int sub_10002CA48(uint64_t a1)
{
  return sub_10002C9C4(a1, *v1);
}

uint64_t sub_10002CA50@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002CA08(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10002CA7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002CA20(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_10002CAA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v2 - 8);
  sub_10002EC40();
  uint64_t v5 = v3 - v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = sub_100045620();
  sub_10000AD5C();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10002EC40();
  uint64_t v15 = v13 - v14;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = (int *)type metadata accessor for JSSourceInfo();
  sub_10001DBE8();
  __chkstk_darwin(v20);
  id v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = 25705;
  unint64_t v48 = 0xE200000000000000;
  sub_10002EC70();
  sub_10002EC04();
  sub_100009764((uint64_t)v49);
  if (!v51) {
    goto LABEL_10;
  }
  uint64_t v46 = v11;
  if ((sub_10002EBE4() & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  unint64_t v23 = v48;
  uint64_t v44 = v47;
  uint64_t v47 = 0x736E726574746170;
  unint64_t v48 = 0xE800000000000000;
  sub_10002EC70();
  sub_10002EC04();
  sub_100009764((uint64_t)v49);
  if (v51)
  {
    unint64_t v45 = v23;
    sub_100005794(&qword_10005D5E0);
    if ((sub_10002EBE4() & 1) == 0)
    {
LABEL_12:
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    uint64_t v43 = v47;
    v50[0] = 0xD000000000000012;
    v50[1] = 0x800000010004AC70;
    sub_100046410();
    sub_10002EC04();
    sub_100009764((uint64_t)v49);
    if (v51)
    {
      if (sub_10002EBE4()) {
        double v24 = *(double *)&v47;
      }
      else {
        double v24 = 86400.0;
      }
    }
    else
    {
      sub_10002B670((uint64_t)v50, (uint64_t *)&unk_10005CCF0);
      double v24 = 86400.0;
    }
    uint64_t v47 = 7107189;
    unint64_t v48 = 0xE300000000000000;
    sub_10002EC70();
    sub_10002EC04();
    sub_100009764((uint64_t)v49);
    if (v51)
    {
      if ((sub_10002EBE4() & 1) == 0) {
        goto LABEL_23;
      }
      sub_100045600();
      swift_bridgeObjectRelease();
      if (sub_10000678C((uint64_t)v8, 1, v9) != 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
        v32(v18, v8, v9);
        uint64_t v33 = &v22[v19[8]];
        v32(v33, v18, v9);
        *(double *)id v22 = v24;
        unint64_t v34 = v45;
        *((void *)v22 + 1) = v44;
        *((void *)v22 + 2) = v34;
        sub_10002EC50();
        sub_1000066FC(v35, v36, v37, v9);
        *(void *)&v22[v19[7]] = v43;
        uint64_t v38 = (uint64_t)v33;
        uint64_t v39 = 0;
        goto LABEL_31;
      }
      uint64_t v29 = &qword_10005C8E8;
      uint64_t v30 = v8;
    }
    else
    {
      uint64_t v29 = (uint64_t *)&unk_10005CCF0;
      uint64_t v30 = v50;
    }
    sub_10002B670((uint64_t)v30, v29);
LABEL_23:
    unint64_t v31 = v45;
    uint64_t v47 = 0x556B63617074656ALL;
    unint64_t v48 = 0xEA00000000004C52;
    sub_10002EC70();
    sub_10002EC04();
    swift_bridgeObjectRelease();
    sub_100009764((uint64_t)v49);
    if (v51)
    {
      if (sub_10002EBE4())
      {
        sub_100045600();
        swift_bridgeObjectRelease();
        if (sub_10000678C(v5, 1, v9) == 1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          Swift::String v25 = &qword_10005C8E8;
          uint64_t v26 = (void *)v5;
          goto LABEL_11;
        }
        long long v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
        v40(v15, v5, v9);
        uint64_t v41 = (uint64_t)&v22[v19[6]];
        v40(v41, v15, v9);
        *(double *)id v22 = v24;
        *((void *)v22 + 1) = v44;
        *((void *)v22 + 2) = v31;
        sub_1000066FC(v41, 0, 1, v9);
        *(void *)&v22[v19[7]] = v43;
        uint64_t v38 = (uint64_t)&v22[v19[8]];
        uint64_t v39 = 1;
LABEL_31:
        sub_1000066FC(v38, v39, 1, v9);
        sub_10002DBF8((uint64_t)v22, a1);
        uint64_t v27 = 0;
        return sub_1000066FC(a1, v27, 1, (uint64_t)v19);
      }
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  Swift::String v25 = (uint64_t *)&unk_10005CCF0;
  uint64_t v26 = v50;
LABEL_11:
  sub_10002B670((uint64_t)v26, v25);
LABEL_14:
  uint64_t v27 = 1;
  return sub_1000066FC(a1, v27, 1, (uint64_t)v19);
}

uint64_t sub_10002D038@<X0>(uint64_t a1@<X8>)
{
  uint64_t v113 = a1;
  uint64_t v1 = sub_100005794(&qword_10005D5C0);
  __chkstk_darwin(v1 - 8);
  sub_10000D898();
  uint64_t v103 = v2;
  sub_100045670();
  sub_10000AD5C();
  uint64_t v101 = v4;
  uint64_t v102 = v3;
  __chkstk_darwin(v3);
  sub_10000D898();
  uint64_t v100 = v5;
  sub_100045560();
  sub_10000AD5C();
  uint64_t v107 = v7;
  uint64_t v108 = v6;
  __chkstk_darwin(v6);
  sub_10000D898();
  uint64_t v106 = v8;
  uint64_t v9 = type metadata accessor for JSSourceInfo();
  sub_10001DBE8();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v13 - 8);
  sub_10002EC40();
  uint64_t v16 = v14 - v15;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)v98 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v23 = (char *)v98 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)v98 - v25;
  __chkstk_darwin(v24);
  Swift::String v28 = (char *)v98 - v27;
  uint64_t v29 = sub_100045620();
  sub_10000AD5C();
  uint64_t v31 = v30;
  __chkstk_darwin(v32);
  sub_10002EC40();
  uint64_t v105 = v33 - v34;
  sub_10002EC88();
  __chkstk_darwin(v35);
  long long v104 = (char *)v98 - v36;
  sub_10002EC88();
  __chkstk_darwin(v37);
  Swift::String v109 = (char *)v98 - v38;
  sub_10002EC88();
  __chkstk_darwin(v39);
  Swift::String v110 = (char *)v98 - v40;
  sub_10002EC88();
  __chkstk_darwin(v41);
  Swift::String v111 = (char *)v98 - v42;
  id v43 = objc_msgSend(self, "ams_cachesDirectory");
  if (v43)
  {
    uint64_t v44 = v43;
    sub_1000455E0();

    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = 1;
  }
  sub_1000066FC((uint64_t)v23, v45, 1, v29);
  sub_100026C28((uint64_t)v23, (uint64_t)v26);
  sub_10002EC20((uint64_t)v26);
  if (v51)
  {
    sub_10002B670((uint64_t)v26, &qword_10005C8E8);
    sub_10002EC50();
    sub_1000066FC(v46, v47, v48, v29);
LABEL_9:
    uint64_t v52 = &qword_10005C8E8;
    uint64_t v53 = (uint64_t)v28;
LABEL_10:
    sub_10002B670(v53, v52);
    goto LABEL_11;
  }
  sub_1000455B0();
  uint64_t v49 = v31;
  unint64_t v50 = *(void (**)(void))(v31 + 8);
  sub_10002EBC8();
  v50();
  sub_1000066FC((uint64_t)v28, 0, 1, v29);
  sub_10002EC20((uint64_t)v28);
  if (v51) {
    goto LABEL_9;
  }
  id v99 = v50;
  uint64_t v59 = v28;
  uint64_t v60 = *(void (**)(void))(v49 + 32);
  ((void (*)(char *, char *, uint64_t))v60)(v111, v59, v29);
  uint64_t v61 = (uint64_t)v112;
  sub_100018910((uint64_t)v112 + *(int *)(v9 + 24), v16);
  sub_10002DA50(v61, (uint64_t)v12);
  sub_10002EC20(v16);
  v98[1] = v49 + 32;
  if (v62)
  {
    sub_100018910((uint64_t)&v12[*(int *)(v9 + 32)], (uint64_t)v20);
    sub_10002DAB4((uint64_t)v12);
    sub_10002B670(v16, &qword_10005C8E8);
  }
  else
  {
    sub_10002DAB4((uint64_t)v12);
    ((void (*)(char *, uint64_t, uint64_t))v60)(v20, v16, v29);
    sub_1000066FC((uint64_t)v20, 0, 1, v29);
  }
  sub_10002EC20((uint64_t)v20);
  if (v51)
  {
    sub_10002EBD8();
    v63();
    uint64_t v52 = &qword_10005C8E8;
    uint64_t v53 = (uint64_t)v20;
    goto LABEL_10;
  }
  sub_10002EC5C();
  *(void *)(v64 - 256) = v60;
  v60();
  sub_1000455B0();
  sub_100045570();
  sub_1000455C0();
  swift_bridgeObjectRelease();
  Swift::String v65 = v99;
  sub_10002EBD8();
  v65();
  strcpy((char *)&v114, "metadata.plist");
  HIBYTE(v114) = -18;
  uint64_t v67 = v106;
  uint64_t v66 = v107;
  uint64_t v68 = v108;
  (*(void (**)(uint64_t, void, uint64_t))(v107 + 104))(v106, enum case for URL.DirectoryHint.inferFromPath(_:), v108);
  sub_10002DB10();
  sub_100045610();
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v67, v68);
  swift_bridgeObjectRelease();
  uint64_t v69 = sub_100045630();
  unint64_t v71 = v70;
  sub_100045530();
  swift_allocObject();
  sub_100045520();
  sub_10002DBAC();
  sub_100045510();
  sub_10002EBD8();
  v65();
  swift_release();
  sub_1000282F4(v69, v71);
  BOOL v97 = (void)v114 == 2;
  id v72 = [self defaultManager];
  sub_1000455F0();
  NSString v73 = sub_100046110();
  swift_bridgeObjectRelease();
  *(void *)&long long v114 = 0;
  id v74 = [v72 attributesOfItemAtPath:v73 error:&v114];

  id v75 = (void *)v114;
  if (!v74)
  {
    id v92 = (id)v114;
    sub_100045550();

    swift_willThrow();
    swift_errorRelease();
    sub_10002EBC8();
    v65();
    sub_10002EBC8();
    v65();
    sub_10002EBC8();
    v65();
    goto LABEL_11;
  }
  type metadata accessor for FileAttributeKey(0);
  sub_10002DB5C();
  uint64_t v76 = sub_1000460E0();
  id v77 = v75;

  id v78 = NSFileModificationDate;
  sub_10002F9F4((uint64_t)v78, v76, &v114);

  swift_bridgeObjectRelease();
  if (!v115)
  {
    sub_10002B670((uint64_t)&v114, (uint64_t *)&unk_10005CCF0);
    uint64_t v79 = v103;
    sub_10002EC50();
    sub_1000066FC(v93, v94, v95, v96);
    goto LABEL_26;
  }
  uint64_t v79 = v103;
  uint64_t v80 = v102;
  int v81 = swift_dynamicCast();
  sub_1000066FC(v79, v81 ^ 1u, 1, v80);
  if (sub_10000678C(v79, 1, v80) == 1)
  {
LABEL_26:
    sub_10002EBC8();
    v65();
    sub_10002EBC8();
    v65();
    sub_10002EBC8();
    v65();
    uint64_t v52 = &qword_10005D5C0;
    uint64_t v53 = v79;
    goto LABEL_10;
  }
  uint64_t v82 = v101;
  uint64_t v83 = v100;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v100, v79, v80);
  sub_100045660();
  double v85 = v84;
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v83, v80);
  sub_10002EBD8();
  v86();
  id v87 = v99;
  sub_10002EBC8();
  v87();
  if (*v112 > -v85)
  {
    uint64_t v88 = sub_100005794(&qword_10005D5C8);
    uint64_t v89 = *(int *)(v88 + 48);
    uint64_t v90 = v113;
    sub_10002EC5C();
    (*(void (**)(void))(v91 - 256))();
    *(unsigned char *)(v90 + v89) = v97;
    uint64_t v54 = v90;
    uint64_t v55 = 0;
    uint64_t v56 = 1;
    uint64_t v57 = v88;
    return sub_1000066FC(v54, v55, v56, v57);
  }
  sub_10002EBC8();
  v87();
LABEL_11:
  sub_100005794(&qword_10005D5C8);
  sub_10002EC50();
  return sub_1000066FC(v54, v55, v56, v57);
}

uint64_t type metadata accessor for JSSourceInfo()
{
  uint64_t result = qword_10005D640;
  if (!qword_10005D640) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002DA50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002DAB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002DB10()
{
  unint64_t result = qword_10005D5D0;
  if (!qword_10005D5D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D5D0);
  }
  return result;
}

unint64_t sub_10002DB5C()
{
  unint64_t result = qword_10005C570;
  if (!qword_10005C570)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C570);
  }
  return result;
}

unint64_t sub_10002DBAC()
{
  unint64_t result = qword_10005D5D8;
  if (!qword_10005D5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D5D8);
  }
  return result;
}

uint64_t sub_10002DBF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for JetpackKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for JetpackKind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10002DDB0);
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

unsigned char *sub_10002DDD8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JetpackKind()
{
  return &type metadata for JetpackKind;
}

uint64_t *sub_10002DDF4(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v4 = *a2;
    unsigned int v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = a2[2];
    uint64_t v7 = a3[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100045620();
    swift_bridgeObjectRetain();
    if (sub_10000678C((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_100005794(&qword_10005C8E8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      sub_1000066FC((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    if (sub_10000678C((uint64_t)v15, 1, v10))
    {
      uint64_t v16 = sub_100005794(&qword_10005C8E8);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v14, v15, v10);
      sub_1000066FC((uint64_t)v14, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t sub_10002DFE8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100045620();
  if (!sub_10000678C(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t result = sub_10000678C(v6, 1, v5);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v8(v6, v5);
  }
  return result;
}

uint64_t sub_10002E0E8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100045620();
  swift_bridgeObjectRetain();
  if (sub_10000678C((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_100005794(&qword_10005C8E8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    sub_1000066FC((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  swift_bridgeObjectRetain();
  if (sub_10000678C((uint64_t)v13, 1, v9))
  {
    uint64_t v14 = sub_100005794(&qword_10005C8E8);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v12, v13, v9);
    sub_1000066FC((uint64_t)v12, 0, 1, v9);
  }
  return a1;
}

void *sub_10002E28C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100045620();
  int v10 = sub_10000678C((uint64_t)v7, 1, v9);
  int v11 = sub_10000678C((uint64_t)v8, 1, v9);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      sub_1000066FC((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = sub_100005794(&qword_10005C8E8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  int v17 = sub_10000678C((uint64_t)a1 + v14, 1, v9);
  int v18 = sub_10000678C((uint64_t)v16, 1, v9);
  if (!v17)
  {
    uint64_t v19 = *(void *)(v9 - 8);
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v15, v16, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v15, v9);
    goto LABEL_12;
  }
  if (v18)
  {
LABEL_12:
    uint64_t v20 = sub_100005794(&qword_10005C8E8);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v15, v16, v9);
  sub_1000066FC((uint64_t)v15, 0, 1, v9);
  return a1;
}

uint64_t sub_10002E550(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100045620();
  if (sub_10000678C((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_100005794(&qword_10005C8E8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    sub_1000066FC((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  if (sub_10000678C((uint64_t)v13, 1, v9))
  {
    uint64_t v14 = sub_100005794(&qword_10005C8E8);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v12, v13, v9);
    sub_1000066FC((uint64_t)v12, 0, 1, v9);
  }
  return a1;
}

void *sub_10002E6E0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100045620();
  int v11 = sub_10000678C((uint64_t)v8, 1, v10);
  int v12 = sub_10000678C((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      sub_1000066FC((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_100005794(&qword_10005C8E8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  int v17 = (char *)a2 + v15;
  int v18 = sub_10000678C((uint64_t)a1 + v15, 1, v10);
  int v19 = sub_10000678C((uint64_t)v17, 1, v10);
  if (!v18)
  {
    uint64_t v20 = *(void *)(v10 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v16, v17, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v10);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    uint64_t v21 = sub_100005794(&qword_10005C8E8);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v16, v17, v10);
  sub_1000066FC((uint64_t)v16, 0, 1, v10);
  return a1;
}

uint64_t sub_10002E98C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002E9A0);
}

uint64_t sub_10002E9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005794(&qword_10005C8E8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return sub_10000678C(v9, a2, v8);
  }
}

uint64_t sub_10002EA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002EA40);
}

uint64_t sub_10002EA40(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005794(&qword_10005C8E8);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_1000066FC(v8, a2, a2, v7);
  }
  return result;
}

void sub_10002EAC4()
{
  sub_100028D54();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_10002EB7C()
{
  unint64_t result = qword_10005D688;
  if (!qword_10005D688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D688);
  }
  return result;
}

uint64_t sub_10002EBE4()
{
  return swift_dynamicCast();
}

double sub_10002EC04()
{
  return sub_10002F990(v1 - 168, v0, (_OWORD *)(v1 - 128));
}

uint64_t sub_10002EC20(uint64_t a1)
{
  return sub_10000678C(a1, 1, v1);
}

uint64_t sub_10002EC70()
{
  return sub_100046410();
}

uint64_t sub_10002EC94(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v34 = a2;
  v32[1] = a1;
  uint64_t v5 = sub_100045DD0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v33 = v7;
  uint64_t v35 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[0] = type metadata accessor for JSSourceUrlParser();
  __chkstk_darwin(v32[0]);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v11 = sub_100045A70();
  sub_100008628(v11);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v39 = type metadata accessor for JSSourceLoader();
  v38[0] = v4;
  swift_retain();
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100046140();
    uint64_t v16 = v15;

    sub_100045A10();
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_100045A00(v43);
    sub_1000062B0(v38, v39);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v41[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v41);
    v44._countAndFlagsBits = 5972026;
    v44._object = (void *)0xE300000000000000;
    sub_100045A00(v44);
    uint64_t MetatypeMetadata = &type metadata for String;
    v41[0] = v14;
    v41[1] = v16;
    sub_1000459F0();
    sub_100008588((uint64_t)v41);
    v18._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    sub_100045A00(v45);
    sub_1000062B0(v38, v39);
    uint64_t v19 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v41[0] = v19;
    sub_1000459F0();
    sub_100008588((uint64_t)v41);
    v18._countAndFlagsBits = 58;
  }
  v18._object = (void *)0xE100000000000000;
  sub_100045A00(v18);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v38);
  sub_1000459D0();
  uint64_t v20 = sub_100045620();
  uint64_t v39 = v20;
  sub_100006A38(v38);
  uint64_t v21 = *(void (**)(void))(*(void *)(v20 - 8) + 16);
  sub_10002F504();
  v21();
  sub_100045A40();
  sub_100008588((uint64_t)v38);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_10002F504();
  v21();
  uint64_t v22 = *(void (**)(void))(v6 + 16);
  sub_10002F518();
  v22();
  sub_100032290();
  sub_10002F314((uint64_t)v9);
  unint64_t v23 = v35;
  sub_10002F518();
  v22();
  unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v25 = (v33 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v26 + v24, v23, v5);
  Swift::String v28 = v36;
  uint64_t v27 = v37;
  *(void *)(v26 + v25) = v36;
  *(void *)(v26 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8)) = v27;
  uint64_t v39 = sub_100045CC0();
  uint64_t v40 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v38);
  id v29 = v28;
  swift_retain();
  sub_100045CB0();
  sub_100005794(&qword_10005C9F0);
  sub_10002F4B0();
  uint64_t v30 = sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v38);
  return v30;
}

uint64_t sub_10002F178(unsigned char *a1, void *a2, void *a3, void (*a4)(void))
{
  switch(*a1)
  {
    case 1:
    case 4:
      uint64_t v8 = type metadata accessor for JetpackLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100055A98;
      break;
    case 2:
    case 5:
      uint64_t v8 = type metadata accessor for JetpackV2Loader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100055C68;
      break;
    case 3:
      uint64_t v8 = type metadata accessor for RemoteJavaScriptLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100056C80;
      break;
    default:
      uint64_t v8 = type metadata accessor for LocalJavascriptLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100056918;
      break;
  }
  v14[3] = v8;
  void v14[4] = v10;
  v14[0] = v9;
  sub_1000062B0(v14, v8);
  uint64_t v11 = type metadata accessor for JSSourceFile();
  uint64_t v12 = ((uint64_t (*)(uint64_t, void *, void *, void (*)(void)))v10[1])((uint64_t)&a1[*(int *)(v11 + 20)], a2, a3, a4);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v14);
  return v12;
}

uint64_t type metadata accessor for JSSourceLoader()
{
  return self;
}

uint64_t sub_10002F314(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceUrlParser();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002F370()
{
  uint64_t v1 = sub_100045DD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();
  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_10002F42C(unsigned char *a1)
{
  uint64_t v3 = sub_100045DD0();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void **)(v1 + v9);
  uint64_t v11 = *(void (**)(void))(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_10002F178(a1, (void *)(v1 + v8), v10, v11);
}

unint64_t sub_10002F4B0()
{
  unint64_t result = qword_10005D730;
  if (!qword_10005D730)
  {
    sub_10000D210(&qword_10005C9F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D730);
  }
  return result;
}

id sub_10002F52C(uint64_t a1, uint64_t a2)
{
  id v3 = [objc_allocWithZone((Class)AMSURLRequestEncoder) initWithBag:sub_100045D90()];
  swift_unknownObjectRelease();
  [v3 setClientInfo:a2];
  if (deviceIsRunningInternalBuild()) {
    [v3 setUrlKnownToBeTrusted:1];
  }
  return v3;
}

id sub_10002F5BC(uint64_t a1, uint64_t a2)
{
  id v3 = [self sharedURLCache];
  [v3 setMemoryCapacity:0];

  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", a2, sub_100045D90());
  swift_unknownObjectRelease();
  sub_10002F680();
  return sub_10002F6C0(v5, 0, 0);
}

unint64_t sub_10002F680()
{
  unint64_t result = qword_10005C6F0;
  if (!qword_10005C6F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C6F0);
  }
  return result;
}

id sub_10002F6C0(void *a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithConfiguration:a1 delegate:a2 delegateQueue:a3];

  swift_unknownObjectRelease();
  return v5;
}

uint64_t destroy for JSSourcePackage(uint64_t a1)
{
  _s16UtilityExtension9JSAccountVwxx_0(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for JSSourcePackage(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  _s16UtilityExtension9JSAccountVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JSSourcePackage(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSSourcePackage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSSourcePackage()
{
  return &type metadata for JSSourcePackage;
}

uint64_t sub_10002F904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_1000091DC(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_10002F948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_1000091DC(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

double sub_10002F990@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100009198(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100005738(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_10002F9F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100009254(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100005738(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_10002FA58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1000091DC(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = sub_100045620();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, v10);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = sub_100045620();
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }
  return sub_1000066FC(v11, v12, 1, v13);
}

NSString sub_10002FB1C()
{
  NSString result = sub_100046110();
  qword_10005D738 = (uint64_t)result;
  return result;
}

BOOL sub_10002FB5C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10002FB6C(uint64_t a1, char a2)
{
}

Swift::Int sub_10002FB94(char a1)
{
  return sub_100046670();
}

Swift::Int sub_10002FBDC()
{
  return sub_10002FB94(*v0);
}

void sub_10002FBE4(uint64_t a1)
{
  sub_10002FB6C(a1, *v1);
}

uint64_t sub_10002FBEC()
{
  uint64_t v1 = v0;
  uint64_t v27 = sub_100045620();
  sub_10000AD5C();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v6);
  char v7 = (char *)&v28[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005794(&qword_10005D840);
  sub_10000AD5C();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v28[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100045DD0();
  sub_10000AD5C();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v28[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v1 + OBJC_IVAR____TtC16UtilityExtension20JSSourceUrlOverrider_bag, v14);
  if (qword_10005C470 != -1) {
    swift_once();
  }
  sub_100045DC0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v14);
  sub_100045DB0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  uint64_t v20 = sub_100045CC0();
  uint64_t v29 = v20;
  uint64_t v30 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v28);
  swift_retain();
  sub_100045CB0();
  sub_100005794(&qword_10005D848);
  sub_100031E50(&qword_10005D850, &qword_10005D848);
  sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  uint64_t v21 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v28[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1 + OBJC_IVAR____TtC16UtilityExtension20JSSourceUrlOverrider_url, v27);
  unint64_t v22 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v23 = (v5 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v24 + v22, v7, v21);
  *(void *)(v24 + v23) = v1;
  uint64_t v29 = v20;
  uint64_t v30 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v28);
  swift_retain();
  sub_100045CB0();
  sub_100005794(&qword_10005D858);
  sub_100031E50(&qword_10005D860, &qword_10005D858);
  uint64_t v25 = sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  return v25;
}

uint64_t sub_10002FF78(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005D870);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for JSSourceInfo();
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = sub_100045A20();
  __chkstk_darwin(v13 - 8);
  if (*a1 && (uint64_t v14 = sub_10000505C(*a1)) != 0)
  {
    uint64_t v15 = v14[2];
    if (v15)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = 0;
      uint64_t v17 = &_swiftEmptyArrayStorage;
      do
      {
        swift_bridgeObjectRetain();
        sub_10002CAA8((uint64_t)v6);
        if (sub_10000678C((uint64_t)v6, 1, v7) == 1)
        {
          sub_100031FC8((uint64_t)v6, &qword_10005D870);
        }
        else
        {
          sub_10002DBF8((uint64_t)v6, (uint64_t)v12);
          sub_10002DBF8((uint64_t)v12, (uint64_t)v10);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v17 = (void *)sub_10001871C(0, v17[2] + 1, 1, (uint64_t)v17);
          }
          unint64_t v19 = v17[2];
          unint64_t v18 = v17[3];
          if (v19 >= v18 >> 1) {
            uint64_t v17 = (void *)sub_10001871C(v18 > 1, v19 + 1, 1, (uint64_t)v17);
          }
          v17[2] = v19 + 1;
          sub_10002DBF8((uint64_t)v10, (uint64_t)v17+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v19);
        }
        ++v16;
      }
      while (v15 != v16);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v17 = &_swiftEmptyArrayStorage;
    }
    sub_100005794(&qword_10005D848);
    v34[0] = v17;
    return sub_100045F80();
  }
  else
  {
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    uint64_t v35 = type metadata accessor for JSSourceUrlOverrider();
    v34[0] = a2;
    swift_retain();
    id v20 = (id)AMSLogKey();
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_100046140();
      uint64_t v24 = v23;

      sub_100045A10();
      v36._countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      sub_100045A00(v36);
      sub_1000062B0(v34, v35);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v32[0] = DynamicType;
      sub_1000459F0();
      sub_100031FC8((uint64_t)v32, (uint64_t *)&unk_10005CCF0);
      v37._countAndFlagsBits = 5972026;
      v37._object = (void *)0xE300000000000000;
      sub_100045A00(v37);
      uint64_t MetatypeMetadata = &type metadata for String;
      v32[0] = v22;
      v32[1] = v24;
      sub_1000459F0();
      sub_100031FC8((uint64_t)v32, (uint64_t *)&unk_10005CCF0);
      v26._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v38._countAndFlagsBits = 0;
      v38._object = (void *)0xE000000000000000;
      sub_100045A00(v38);
      sub_1000062B0(v34, v35);
      uint64_t v27 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v32[0] = v27;
      sub_1000459F0();
      sub_100031FC8((uint64_t)v32, (uint64_t *)&unk_10005CCF0);
      v26._countAndFlagsBits = 58;
    }
    v26._object = (void *)0xE100000000000000;
    sub_100045A00(v26);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v34);
    sub_1000459D0();
    sub_100035680();
    swift_bridgeObjectRelease();
    sub_100005794(&qword_10005D848);
    sub_100031F7C();
    swift_allocError();
    *Swift::String v28 = 0;
    return sub_100045F70();
  }
}

uint64_t sub_10003049C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v162 = a3;
  uint64_t v4 = sub_100005794(&qword_10005D868);
  __chkstk_darwin(v4 - 8);
  uint64_t v150 = (uint64_t)&v144 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_100005794(&qword_10005D5C8);
  uint64_t v6 = __chkstk_darwin(v160);
  uint64_t v148 = (char *)&v144 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v149 = (char *)&v144 - v9;
  __chkstk_darwin(v8);
  uint64_t v156 = (char *)&v144 - v10;
  uint64_t v11 = sub_100005794(&qword_10005C8E8);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v144 = (uint64_t)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v147 = (uint64_t)&v144 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v155 = (uint64_t)&v144 - v17;
  __chkstk_darwin(v16);
  uint64_t v157 = (uint64_t)&v144 - v18;
  uint64_t v158 = sub_100045620();
  uint64_t v19 = *(void *)(v158 - 8);
  uint64_t v20 = __chkstk_darwin(v158);
  uint64_t v145 = (char *)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v146 = (char *)&v144 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v151 = (char *)&v144 - v25;
  __chkstk_darwin(v24);
  v159 = (char *)&v144 - v26;
  uint64_t v27 = sub_100045A20();
  __chkstk_darwin(v27 - 8);
  v161 = (char *)&v144 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100005794(&qword_10005D870);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v144 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = (int *)type metadata accessor for JSSourceInfo();
  uint64_t v33 = *((void *)v32 - 1);
  uint64_t v34 = __chkstk_darwin(v32);
  Swift::String v36 = (char *)&v144 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  uint64_t v163 = (char *)&v144 - v37;
  uint64_t v38 = *a1;
  uint64_t v39 = sub_100045580();
  unint64_t v41 = v40;
  uint64_t v168 = *(void *)(v38 + 16);
  if (v168)
  {
    uint64_t v153 = v31;
    uint64_t v154 = v19;
    uint64_t v42 = v38 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80));
    uint64_t v43 = HIBYTE(v40) & 0xF;
    if ((v40 & 0x2000000000000000) == 0) {
      uint64_t v43 = v39;
    }
    uint64_t v170 = (v43 << 16) | 7;
    uint64_t v171 = v39;
    uint64_t v44 = *(void *)(v33 + 72);
    uint64_t v152 = v38;
    swift_bridgeObjectRetain();
    uint64_t v45 = 0;
    v166 = v36;
    Swift::String v167 = v32;
    uint64_t v164 = v44;
    uint64_t v165 = v42;
    while (1)
    {
      sub_10002DA50(v42 + v44 * v45, (uint64_t)v36);
      uint64_t v46 = *(void *)&v36[v32[7]];
      uint64_t v47 = *(void *)(v46 + 16);
      if (v47) {
        break;
      }
LABEL_14:
      ++v45;
      sub_10002DAB4((uint64_t)v36);
      if (v45 == v168)
      {
        swift_bridgeObjectRelease();
        uint64_t v56 = 1;
        uint64_t v19 = v154;
        uint64_t v57 = (uint64_t)v163;
        uint64_t v31 = v153;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v169 = v46;
    uint64_t v48 = (uint64_t *)(v46 + 40);
    while (1)
    {
      uint64_t v49 = *(v48 - 1);
      uint64_t v50 = *v48;
      objc_allocWithZone((Class)NSRegularExpression);
      swift_bridgeObjectRetain_n();
      id v51 = sub_100031EA0(v49, v50, 0);
      if (v51)
      {
        Swift::Int v52 = (v41 & 0x1000000000000000) != 0 ? sub_1000461C0() : sub_1000461D0();
        Swift::Int v53 = v52;
        NSString v54 = sub_100046110();
        id v55 = objc_msgSend(v51, "firstMatchInString:options:range:", v54, 0, 0, v53);

        if (v55) {
          break;
        }
      }
      v48 += 2;
      swift_bridgeObjectRelease();
      if (!--v47)
      {
        swift_bridgeObjectRelease_n();
        Swift::String v36 = v166;
        uint64_t v32 = v167;
        uint64_t v44 = v164;
        uint64_t v42 = v165;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();

    uint64_t v31 = v153;
    sub_10002DBF8((uint64_t)v166, (uint64_t)v153);
    uint64_t v56 = 0;
    uint64_t v19 = v154;
    uint64_t v57 = (uint64_t)v163;
    uint64_t v32 = v167;
  }
  else
  {
    uint64_t v56 = 1;
    uint64_t v57 = (uint64_t)v163;
  }
LABEL_18:
  sub_1000066FC((uint64_t)v31, v56, 1, (uint64_t)v32);
  swift_bridgeObjectRelease();
  if (sub_10000678C((uint64_t)v31, 1, (uint64_t)v32) != 1)
  {
    sub_10002DBF8((uint64_t)v31, v57);
    type metadata accessor for JSSourceUrlOverrides();
    uint64_t v65 = sub_100032174();
    uint64_t v66 = v57;
    uint64_t v67 = *(void *)(v57 + 8);
    uint64_t v68 = *(void *)(v57 + 16);
    swift_bridgeObjectRetain();
    uint64_t v69 = v67;
    uint64_t v70 = v157;
    sub_10002FA58(v69, v68, v65, v157);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v71 = v158;
    if (sub_10000678C(v70, 1, v158) == 1)
    {
      sub_100031FC8(v70, &qword_10005C8E8);
      uint64_t v72 = sub_100032180();
      uint64_t v73 = *(void *)(v66 + 8);
      uint64_t v74 = *(void *)(v66 + 16);
      swift_bridgeObjectRetain();
      uint64_t v75 = v73;
      uint64_t v76 = v155;
      sub_10002FA58(v75, v74, v72, v155);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (sub_10000678C(v76, 1, v71) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v151, v76, v71);
        sub_100005794((uint64_t *)&unk_10005E050);
        sub_100045A70();
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
        uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
        uint64_t v175 = v162;
        swift_retain();
        id v94 = (id)AMSLogKey();
        if (v94)
        {
          uint64_t v95 = v94;
          uint64_t v96 = sub_100046140();
          uint64_t v97 = v19;
          uint64_t v99 = v98;

          sub_100045A10();
          v184._countAndFlagsBits = 0;
          v184._object = (void *)0xE000000000000000;
          sub_100045A00(v184);
          sub_1000062B0(&v175, v177);
          uint64_t DynamicType = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v172 = DynamicType;
          sub_1000459F0();
          sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
          v185._countAndFlagsBits = 5972026;
          v185._object = (void *)0xE300000000000000;
          sub_100045A00(v185);
          uint64_t MetatypeMetadata = &type metadata for String;
          uint64_t v172 = v96;
          uint64_t v173 = v99;
          uint64_t v19 = v97;
          sub_1000459F0();
          sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
          v101._countAndFlagsBits = 93;
        }
        else
        {
          sub_100045A10();
          v187._countAndFlagsBits = 0;
          v187._object = (void *)0xE000000000000000;
          sub_100045A00(v187);
          sub_1000062B0(&v175, v177);
          uint64_t v118 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v172 = v118;
          sub_1000459F0();
          sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
          v101._countAndFlagsBits = 58;
        }
        uint64_t v119 = v156;
        v101._object = (void *)0xE100000000000000;
        sub_100045A00(v101);
        sub_100045A30();
        type metadata accessor for Log();
        _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v175);
        sub_1000459D0();
        sub_100035648();
        swift_bridgeObjectRelease();
        sub_100005794(&qword_10005D858);
        uint64_t v120 = *(int *)(v160 + 48);
        uint64_t v108 = v151;
        (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v119, v151, v71);
        v119[v120] = 0;
        goto LABEL_39;
      }
      id v77 = (char *)v66;
      sub_100031FC8(v76, &qword_10005C8E8);
      uint64_t v78 = v150;
      sub_10002D038(v150);
      uint64_t v79 = v160;
      if (sub_10000678C(v78, 1, v160) != 1)
      {
        uint64_t v109 = *(int *)(v79 + 48);
        Swift::String v110 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 32);
        uint64_t v111 = (uint64_t)v149;
        v110(v149, v78, v71);
        uint64_t v112 = v19;
        char v113 = *(unsigned char *)(v78 + v109);
        *(unsigned char *)(v111 + v109) = v113;
        sub_100005794(&qword_10005D858);
        uint64_t v114 = *(int *)(v79 + 48);
        uint64_t v115 = v156;
        (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v156, v111, v71);
        v115[v114] = v113;
        uint64_t v116 = *(int *)(v79 + 48);
        uint64_t v117 = v148;
        v110(v148, (uint64_t)v115, v71);
        v117[v116] = v113;
        uint64_t v83 = sub_100045F80();
        sub_100031FC8(v111, &qword_10005D5C8);
LABEL_40:
        uint64_t v121 = (uint64_t)v163;
LABEL_41:
        sub_10002DAB4(v121);
        return v83;
      }
      sub_100031FC8(v78, &qword_10005D868);
      uint64_t v80 = v147;
      sub_100018910((uint64_t)&v77[v32[6]], v147);
      if (sub_10000678C(v80, 1, v71) == 1)
      {
        sub_100031FC8(v80, &qword_10005C8E8);
        uint64_t v81 = v144;
        sub_100018910((uint64_t)&v77[v32[8]], v144);
        if (sub_10000678C(v81, 1, v71) == 1)
        {
          sub_100031FC8(v81, &qword_10005C8E8);
          sub_100005794(&qword_10005D858);
          sub_100031F7C();
          swift_allocError();
          *uint64_t v82 = 0;
          uint64_t v83 = sub_100045F70();
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v145, v81, v71);
          sub_100005794((uint64_t *)&unk_10005E050);
          sub_100045A70();
          *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
          uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
          uint64_t v175 = v162;
          swift_retain();
          id v131 = (id)AMSLogKey();
          if (v131)
          {
            uint64_t v132 = v131;
            uint64_t v133 = sub_100046140();
            uint64_t v134 = v19;
            uint64_t v136 = v135;

            sub_100045A10();
            v190._countAndFlagsBits = 0;
            v190._object = (void *)0xE000000000000000;
            sub_100045A00(v190);
            sub_1000062B0(&v175, v177);
            uint64_t v137 = swift_getDynamicType();
            uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
            uint64_t v172 = v137;
            sub_1000459F0();
            sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
            v191._countAndFlagsBits = 5972026;
            v191._object = (void *)0xE300000000000000;
            sub_100045A00(v191);
            uint64_t MetatypeMetadata = &type metadata for String;
            uint64_t v172 = v133;
            uint64_t v173 = v136;
            id v77 = v163;
            uint64_t v19 = v134;
            sub_1000459F0();
            sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
            v138._countAndFlagsBits = 93;
          }
          else
          {
            sub_100045A10();
            v193._countAndFlagsBits = 0;
            v193._object = (void *)0xE000000000000000;
            sub_100045A00(v193);
            sub_1000062B0(&v175, v177);
            uint64_t v140 = swift_getDynamicType();
            uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
            uint64_t v172 = v140;
            sub_1000459F0();
            sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
            v138._countAndFlagsBits = 58;
          }
          v138._object = (void *)0xE100000000000000;
          sub_100045A00(v138);
          sub_100045A30();
          type metadata accessor for Log();
          _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v175);
          sub_1000459D0();
          sub_100035648();
          swift_bridgeObjectRelease();
          sub_100005794(&qword_10005D858);
          uint64_t v141 = *(int *)(v160 + 48);
          uint64_t v142 = v156;
          uint64_t v143 = v145;
          (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v156, v145, v71);
          v142[v141] = 0;
          uint64_t v83 = sub_100045F80();
          (*(void (**)(char *, uint64_t))(v19 + 8))(v143, v71);
        }
        uint64_t v121 = (uint64_t)v77;
        goto LABEL_41;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v146, v80, v71);
      sub_100005794((uint64_t *)&unk_10005E050);
      sub_100045A70();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
      uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
      uint64_t v175 = v162;
      swift_retain();
      id v123 = (id)AMSLogKey();
      if (v123)
      {
        uint64_t v124 = v123;
        uint64_t v125 = sub_100046140();
        uint64_t v126 = v19;
        uint64_t v128 = v127;

        sub_100045A10();
        v188._countAndFlagsBits = 0;
        v188._object = (void *)0xE000000000000000;
        sub_100045A00(v188);
        sub_1000062B0(&v175, v177);
        uint64_t v129 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v129;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v189._countAndFlagsBits = 5972026;
        v189._object = (void *)0xE300000000000000;
        sub_100045A00(v189);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v172 = v125;
        uint64_t v173 = v128;
        uint64_t v19 = v126;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v130._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v192._countAndFlagsBits = 0;
        v192._object = (void *)0xE000000000000000;
        sub_100045A00(v192);
        sub_1000062B0(&v175, v177);
        uint64_t v139 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v139;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v130._countAndFlagsBits = 58;
      }
      uint64_t v103 = v156;
      v130._object = (void *)0xE100000000000000;
      sub_100045A00(v130);
      sub_100045A30();
      type metadata accessor for Log();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v175);
      sub_1000459D0();
      sub_100035648();
      swift_bridgeObjectRelease();
      sub_100005794(&qword_10005D858);
      uint64_t v104 = *(int *)(v160 + 48);
      uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v106 = v103;
      uint64_t v107 = (uint64_t *)&v176;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v159, v70, v71);
      sub_100005794((uint64_t *)&unk_10005E050);
      sub_100045A70();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
      uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
      uint64_t v175 = v162;
      swift_retain();
      id v84 = (id)AMSLogKey();
      if (v84)
      {
        double v85 = v84;
        uint64_t v86 = sub_100046140();
        uint64_t v87 = v19;
        uint64_t v89 = v88;

        sub_100045A10();
        v181._countAndFlagsBits = 0;
        v181._object = (void *)0xE000000000000000;
        sub_100045A00(v181);
        sub_1000062B0(&v175, v177);
        uint64_t v90 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v90;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v182._countAndFlagsBits = 5972026;
        v182._object = (void *)0xE300000000000000;
        sub_100045A00(v182);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v172 = v86;
        uint64_t v173 = v89;
        uint64_t v19 = v87;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v91._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v186._countAndFlagsBits = 0;
        v186._object = (void *)0xE000000000000000;
        sub_100045A00(v186);
        sub_1000062B0(&v175, v177);
        uint64_t v102 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v102;
        sub_1000459F0();
        sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
        v91._countAndFlagsBits = 58;
      }
      uint64_t v103 = v156;
      v91._object = (void *)0xE100000000000000;
      sub_100045A00(v91);
      sub_100045A30();
      type metadata accessor for Log();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v175);
      sub_1000459D0();
      sub_100035648();
      swift_bridgeObjectRelease();
      sub_100005794(&qword_10005D858);
      uint64_t v104 = *(int *)(v160 + 48);
      uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v106 = v103;
      uint64_t v107 = &v178;
    }
    uint64_t v108 = (char *)*(v107 - 32);
    v105(v106, v108, v71);
    v103[v104] = 1;
LABEL_39:
    uint64_t v83 = sub_100045F80();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v108, v71);
    goto LABEL_40;
  }
  sub_100031FC8((uint64_t)v31, &qword_10005D870);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
  uint64_t v175 = v162;
  swift_retain();
  id v58 = (id)AMSLogKey();
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = sub_100046140();
    uint64_t v62 = v61;

    sub_100045A10();
    v179._countAndFlagsBits = 0;
    v179._object = (void *)0xE000000000000000;
    sub_100045A00(v179);
    sub_1000062B0(&v175, v177);
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v172 = v63;
    sub_1000459F0();
    sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
    v180._countAndFlagsBits = 5972026;
    v180._object = (void *)0xE300000000000000;
    sub_100045A00(v180);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v172 = v60;
    uint64_t v173 = v62;
    sub_1000459F0();
    sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
    v64._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v183._countAndFlagsBits = 0;
    v183._object = (void *)0xE000000000000000;
    sub_100045A00(v183);
    sub_1000062B0(&v175, v177);
    uint64_t v92 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v172 = v92;
    sub_1000459F0();
    sub_100031FC8((uint64_t)&v172, (uint64_t *)&unk_10005CCF0);
    v64._countAndFlagsBits = 58;
  }
  v64._object = (void *)0xE100000000000000;
  sub_100045A00(v64);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v175);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_100005794(&qword_10005D858);
  sub_100031F7C();
  swift_allocError();
  *uint64_t v93 = 1;
  return sub_100045F70();
}

uint64_t sub_100031B3C()
{
  sub_100045DD0();
  sub_10000D8E8();
  uint64_t v1 = sub_100032164();
  v2(v1);
  sub_100045620();
  sub_10000D8E8();
  uint64_t v3 = sub_100032164();
  v4(v3);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_100031BF8()
{
  return type metadata accessor for JSSourceUrlOverrider();
}

uint64_t type metadata accessor for JSSourceUrlOverrider()
{
  uint64_t result = qword_10005D778;
  if (!qword_10005D778) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100031C48()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100045620();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_updateClassMetadata2();
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100031D14(uint64_t *a1)
{
  return sub_10002FF78(a1, v1);
}

uint64_t sub_100031D1C()
{
  sub_100045620();
  sub_10000D8E8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();
  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_100031DB4(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_100045620() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_10003049C(a1, v1 + v4, v5);
}

uint64_t sub_100031E50(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D210(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100031EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100046110();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_100045550();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_100031F7C()
{
  unint64_t result = qword_10005D878;
  if (!qword_10005D878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D878);
  }
  return result;
}

uint64_t sub_100031FC8(uint64_t a1, uint64_t *a2)
{
  sub_100005794(a2);
  sub_10000D8E8();
  uint64_t v3 = sub_100032164();
  v4(v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for JSSourceUrlOverrider.OverrideURLError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000320DCLL);
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

ValueMetadata *type metadata accessor for JSSourceUrlOverrider.OverrideURLError()
{
  return &type metadata for JSSourceUrlOverrider.OverrideURLError;
}

unint64_t sub_100032118()
{
  unint64_t result = qword_10005D880;
  if (!qword_10005D880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D880);
  }
  return result;
}

uint64_t sub_100032164()
{
  return v0;
}

uint64_t sub_100032174()
{
  return sub_10003218C((SEL *)&selRef_jsSourceOverrides);
}

uint64_t sub_100032180()
{
  return sub_10003218C((SEL *)&selRef_sourceOverrides);
}

uint64_t sub_10003218C(SEL *a1)
{
  uint64_t v2 = self;
  uint64_t result = sub_100032224(v2, a1);
  if (!result)
  {
    sub_100045620();
    return sub_1000460F0();
  }
  return result;
}

uint64_t type metadata accessor for JSSourceUrlOverrides()
{
  return self;
}

uint64_t sub_100032224(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  sub_100045620();
  uint64_t v4 = sub_1000460E0();

  return v4;
}

uint64_t sub_100032290()
{
  uint64_t v1 = type metadata accessor for JSSourceUrlParser();
  sub_10000AD5C();
  v22[1] = v2;
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v5);
  v22[2] = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v24 = v1;
  sub_1000188D0(v23);
  sub_1000340C0();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_100045A00(v28);
    sub_1000062B0(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v26[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v26, (uint64_t *)&unk_10005CCF0);
    v29._countAndFlagsBits = 5972026;
    v29._object = (void *)0xE300000000000000;
    sub_100045A00(v29);
    uint64_t MetatypeMetadata = &type metadata for String;
    v26[0] = v9;
    v26[1] = v11;
    sub_1000459F0();
    sub_10002B670((uint64_t)v26, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_100045A00(v30);
    sub_1000062B0(v23, v24);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v26[0] = v14;
    sub_1000459F0();
    sub_10002B670((uint64_t)v26, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v23);
  sub_1000459D0();
  uint64_t v15 = v0 + *(int *)(v1 + 20);
  uint64_t v16 = sub_100045620();
  uint64_t v24 = v16;
  uint64_t v17 = sub_1000188D0(v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v17, v15, v16);
  sub_100045A40();
  sub_10002B670((uint64_t)v23, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_100032A6C();
  sub_1000340C0();
  uint64_t v18 = swift_allocObject();
  sub_10003406C();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1000339D4;
  *(void *)(v19 + 24) = v18;
  uint64_t v24 = sub_100045CC0();
  uint64_t v25 = &protocol witness table for SyncTaskScheduler;
  sub_1000188D0(v23);
  sub_100045CB0();
  sub_100005794(&qword_10005D928);
  sub_100033FCC();
  uint64_t v20 = sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v23);
  return v20;
}

uint64_t type metadata accessor for JSSourceUrlParser()
{
  uint64_t result = qword_10005D9B0;
  if (!qword_10005D9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003277C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, char *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v32 = a2;
  uint64_t v33 = sub_100005794(&qword_10005D950);
  uint64_t v4 = __chkstk_darwin(v33);
  uint64_t v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  id v8 = (uint64_t *)((char *)&v28 - v7);
  sub_10002419C(v34, a1);
  uint64_t v9 = v34[0];
  int64_t v35 = v34[3];
  unint64_t v10 = v34[4];
  uint64_t v30 = v34[1];
  int64_t v31 = (unint64_t)(v34[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v10) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  unint64_t v13 = v12 | (v35 << 6);
  while (1)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v13);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    type metadata accessor for JSSourceFile();
    uint64_t v21 = v33;
    sub_1000340C0();
    *id v8 = v20;
    v8[1] = v19;
    sub_1000345E8((uint64_t)v8, (uint64_t)v6);
    uint64_t v22 = *v6;
    uint64_t v23 = v6[1];
    uint64_t v24 = (char *)v6 + *(int *)(v21 + 48);
    swift_bridgeObjectRetain();
    if (v32(v22, v23, v24))
    {
      swift_release();
      uint64_t v25 = v29;
      sub_1000345E8((uint64_t)v6, v29);
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      return sub_1000066FC(v26, v27, 1, v33);
    }
    uint64_t result = sub_10002B670((uint64_t)v6, &qword_10005D950);
    if (v10) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v14 = v35 + 1;
    if (__OFADD__(v35, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v30 + 8 * v14);
    int64_t v16 = v35 + 1;
    if (!v15)
    {
      int64_t v16 = v35 + 2;
      if (v35 + 2 >= v31) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v30 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v35 + 3;
        if (v35 + 3 >= v31) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v30 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v35 + 4;
          if (v35 + 4 >= v31) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v30 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v35 + 5;
            if (v35 + 5 >= v31) {
              goto LABEL_23;
            }
            unint64_t v15 = *(void *)(v30 + 8 * v16);
            if (!v15)
            {
              int64_t v17 = v35 + 6;
              while (v17 < v31)
              {
                unint64_t v15 = *(void *)(v30 + 8 * v17++);
                if (v15)
                {
                  int64_t v16 = v17 - 1;
                  goto LABEL_18;
                }
              }
LABEL_23:
              swift_release();
              uint64_t v26 = v29;
              uint64_t v27 = 1;
              return sub_1000066FC(v26, v27, 1, v33);
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
    int64_t v35 = v16;
  }
  __break(1u);
  return result;
}

void sub_100032A58()
{
  qword_10005D920 = (uint64_t)&_swiftEmptyDictionarySingleton;
}

uint64_t sub_100032A6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100045DD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100045620();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v27 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = v1 + *(int *)(type metadata accessor for JSSourceUrlParser() + 20);
  uint64_t v24 = *(void (**)(char *))(v7 + 16);
  uint64_t v25 = v12;
  v24(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  type metadata accessor for JSSourceUrlOverrider();
  uint64_t v13 = swift_allocObject();
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v23(v13 + OBJC_IVAR____TtC16UtilityExtension20JSSourceUrlOverrider_url, v11, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v13 + OBJC_IVAR____TtC16UtilityExtension20JSSourceUrlOverrider_bag, v5, v2);
  uint64_t v26 = sub_10002FBEC();
  swift_release();
  sub_100005794(&qword_10005D858);
  uint64_t v14 = sub_100046000();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_100034650;
  *(void *)(v15 + 24) = v14;
  int64_t v16 = (void (*)(char *, char *, uint64_t))v24;
  ((void (*)(char *, uint64_t, uint64_t))v24)(v11, v25, v6);
  int64_t v17 = v27;
  v16(v27, v11, v6);
  unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  v23(v19 + v18, v17, v6);
  unint64_t v20 = sub_10003475C();
  swift_retain_n();
  uint64_t v21 = sub_100046290();
  uint64_t v28[3] = v20;
  v28[4] = &protocol witness table for OS_dispatch_queue;
  v28[0] = v21;
  sub_100045F60();
  swift_release();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v28);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  return v14;
}

uint64_t sub_100032DF4(uint64_t a1, int a2, char *a3)
{
  int v68 = a2;
  uint64_t v79 = a1;
  uint64_t v4 = sub_100005794(&qword_10005D938);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v69 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v78 = (uint64_t)&v66 - v7;
  uint64_t v8 = type metadata accessor for JSSourceFile();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v70 = (char *)&v66 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v66 - v14;
  uint64_t v16 = sub_100045A20();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v18 = *(void *)(sub_100045A70() - 8);
  uint64_t v19 = *(void *)(v18 + 72);
  uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v77 = v17;
  uint64_t v73 = v21 + 3 * v19;
  uint64_t v75 = v20 | 7;
  uint64_t v22 = swift_allocObject();
  long long v74 = xmmword_100047880;
  *(_OWORD *)(v22 + 16) = xmmword_100047880;
  uint64_t v76 = v21;
  uint64_t v72 = (void *)type metadata accessor for JSSourceUrlParser();
  uint64_t v86 = v72;
  sub_1000188D0(&v84);
  uint64_t v80 = a3;
  sub_1000340C0();
  id v23 = (id)AMSLogKey();
  uint64_t v71 = v11;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = sub_100046140();
    uint64_t v26 = v15;
    uint64_t v27 = v19;
    uint64_t v28 = v8;
    uint64_t v30 = v29;

    sub_100045A10();
    v87._countAndFlagsBits = 0;
    v87._object = (void *)0xE000000000000000;
    sub_100045A00(v87);
    sub_1000062B0(&v84, (uint64_t)v86);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v81 = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
    v88._countAndFlagsBits = 5972026;
    v88._object = (void *)0xE300000000000000;
    sub_100045A00(v88);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v81 = v25;
    uint64_t v82 = v30;
    uint64_t v8 = v28;
    uint64_t v19 = v27;
    uint64_t v15 = v26;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
    v32._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v89._countAndFlagsBits = 0;
    v89._object = (void *)0xE000000000000000;
    sub_100045A00(v89);
    sub_1000062B0(&v84, (uint64_t)v86);
    uint64_t v33 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v81 = v33;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
    v32._countAndFlagsBits = 58;
  }
  v32._object = (void *)0xE100000000000000;
  sub_100045A00(v32);
  sub_100045A30();
  uint64_t v34 = type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v84);
  sub_1000459D0();
  int64_t v35 = (void *)sub_100045620();
  uint64_t v86 = v35;
  Swift::String v36 = sub_1000188D0(&v84);
  uint64_t v37 = v79;
  (*(void (**)(uint64_t *, uint64_t, void *))(*((void *)v35 - 1) + 16))(v36, v79, v35);
  sub_100045A40();
  sub_10002B670((uint64_t)&v84, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v38 = v78;
  sub_100033A34(v37, v78);
  if (sub_10000678C(v38, 1, v8) != 1)
  {
    uint64_t v79 = 2 * v19;
    sub_10003406C();
    *(_OWORD *)(swift_allocObject() + 16) = v74;
    uint64_t v86 = v72;
    sub_1000188D0(&v84);
    sub_1000340C0();
    id v43 = (id)AMSLogKey();
    uint64_t v67 = v34;
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = sub_100046140();
      uint64_t v80 = v15;
      uint64_t v47 = v46;

      sub_100045A10();
      v90._countAndFlagsBits = 0;
      v90._object = (void *)0xE000000000000000;
      sub_100045A00(v90);
      sub_1000062B0(&v84, (uint64_t)v86);
      uint64_t v48 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v48;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v91._countAndFlagsBits = 5972026;
      v91._object = (void *)0xE300000000000000;
      sub_100045A00(v91);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v81 = v45;
      uint64_t v82 = v47;
      uint64_t v15 = v80;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v49._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v94._countAndFlagsBits = 0;
      v94._object = (void *)0xE000000000000000;
      sub_100045A00(v94);
      sub_1000062B0(&v84, (uint64_t)v86);
      uint64_t v57 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v57;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v49._countAndFlagsBits = 58;
    }
    v49._object = (void *)0xE100000000000000;
    sub_100045A00(v49);
    sub_100045A30();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v84);
    sub_1000459D0();
    uint64_t v58 = sub_100045580();
    uint64_t v86 = &type metadata for String;
    uint64_t v84 = v58;
    uint64_t v85 = v59;
    sub_100045A40();
    sub_10002B670((uint64_t)&v84, (uint64_t *)&unk_10005CCF0);
    sub_100035648();
    swift_bridgeObjectRelease();
    sub_100005794(&qword_10005D928);
    sub_1000340C0();
    uint64_t v42 = sub_100045F80();
    uint64_t v60 = (uint64_t)v15;
    goto LABEL_15;
  }
  char v39 = v68 & 1;
  sub_10002B670(v38, &qword_10005D938);
  uint64_t v40 = v37;
  unint64_t v41 = v69;
  sub_100033D7C(v40, v39, v69);
  if (sub_10000678C((uint64_t)v41, 1, v8) != 1)
  {
    uint64_t v79 = 2 * v19;
    uint64_t v67 = v34;
    sub_10003406C();
    *(_OWORD *)(swift_allocObject() + 16) = v74;
    uint64_t v86 = v72;
    sub_1000188D0(&v84);
    sub_1000340C0();
    id v50 = (id)AMSLogKey();
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = sub_100046140();
      uint64_t v54 = v53;

      sub_100045A10();
      v92._countAndFlagsBits = 0;
      v92._object = (void *)0xE000000000000000;
      sub_100045A00(v92);
      sub_1000062B0(&v84, (uint64_t)v86);
      uint64_t v55 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v55;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v93._countAndFlagsBits = 5972026;
      v93._object = (void *)0xE300000000000000;
      sub_100045A00(v93);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v81 = v52;
      uint64_t v82 = v54;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v56._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v95._countAndFlagsBits = 0;
      v95._object = (void *)0xE000000000000000;
      sub_100045A00(v95);
      sub_1000062B0(&v84, (uint64_t)v86);
      uint64_t v61 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v61;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v81, (uint64_t *)&unk_10005CCF0);
      v56._countAndFlagsBits = 58;
    }
    v56._object = (void *)0xE100000000000000;
    sub_100045A00(v56);
    sub_100045A30();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v84);
    sub_1000459D0();
    uint64_t v62 = v70;
    uint64_t v63 = sub_100045580();
    uint64_t v86 = &type metadata for String;
    uint64_t v84 = v63;
    uint64_t v85 = v64;
    sub_100045A40();
    sub_10002B670((uint64_t)&v84, (uint64_t *)&unk_10005CCF0);
    sub_100035648();
    swift_bridgeObjectRelease();
    sub_100005794(&qword_10005D928);
    sub_1000340C0();
    uint64_t v42 = sub_100045F80();
    uint64_t v60 = (uint64_t)v62;
LABEL_15:
    sub_100034114(v60);
    return v42;
  }
  sub_10002B670((uint64_t)v41, &qword_10005D938);
  sub_100005794(&qword_10005D928);
  sub_100034020();
  swift_allocError();
  return sub_100045F70();
}

uint64_t sub_1000338C0()
{
  uint64_t v1 = (int *)(type metadata accessor for JSSourceUrlParser() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_100045DD0();
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  uint64_t v8 = v6 + v1[7];
  sub_100045620();
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v9 + 8))(v8);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000339D4(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = type metadata accessor for JSSourceUrlParser();
  sub_100034F44(v5);
  uint64_t v7 = (char *)(v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));
  return sub_100032DF4(a1, v4, v7);
}

uint64_t sub_100033A34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v21 = a2;
  uint64_t v3 = sub_100005794(&qword_10005D948);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v20 = type metadata accessor for JSSourceFile();
  uint64_t v9 = __chkstk_darwin(v20);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v11 = __chkstk_darwin(v10);
  if (qword_10005C478 != -1) {
    uint64_t v11 = swift_once();
  }
  __chkstk_darwin(v11);
  *(&v19 - 2) = v2;
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_10003277C(v12, (uint64_t (*)(uint64_t, uint64_t, char *))sub_10003455C, (uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_100005794(&qword_10005D950);
  if (sub_10000678C((uint64_t)v8, 1, v13) != 1)
  {
    swift_bridgeObjectRelease();
    sub_10003406C();
LABEL_8:
    uint64_t v17 = v21;
    sub_10003406C();
    uint64_t v16 = 0;
    return sub_1000066FC(v17, v16, 1, v20);
  }
  uint64_t v14 = sub_10002B670((uint64_t)v8, &qword_10005D948);
  __chkstk_darwin(v14);
  *(&v19 - 2) = v19;
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_10003277C(v15, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1000345E0, (uint64_t)v6);
  swift_bridgeObjectRelease();
  if (sub_10000678C((uint64_t)v6, 1, v13) != 1)
  {
    swift_bridgeObjectRelease();
    sub_10003406C();
    sub_10003406C();
    goto LABEL_8;
  }
  sub_10002B670((uint64_t)v6, &qword_10005D948);
  uint64_t v16 = 1;
  uint64_t v17 = v21;
  return sub_1000066FC(v17, v16, 1, v20);
}

uint64_t sub_100033D7C@<X0>(uint64_t a1@<X0>, char a2@<W1>, char *a3@<X8>)
{
  uint64_t v6 = sub_100045570();
  BOOL v8 = v6 == 29546 && v7 == 0xE200000000000000;
  if (v8 || (v9 = v6, uint64_t v10 = v7, (sub_1000465C0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v11 = type metadata accessor for JSSourceFile();
    uint64_t v12 = &a3[*(int *)(v11 + 20)];
    uint64_t v13 = sub_100045620();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v12, a1, v13);
    char v14 = 3;
    goto LABEL_8;
  }
  if (v9 == 0x6B63617074656ALL && v10 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = sub_1000465C0();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      goto LABEL_7;
    }
  }
  char v14 = a2 & 1 | 4;
  uint64_t v11 = type metadata accessor for JSSourceFile();
  uint64_t v18 = &a3[*(int *)(v11 + 20)];
  uint64_t v19 = sub_100045620();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
LABEL_8:
  *a3 = v14;
  type metadata accessor for JSSourceFile();
  return sub_1000066FC((uint64_t)a3, 0, 1, v11);
}

uint64_t sub_100033F3C(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100005794(&qword_10005D5C8);
  return a2(a1, *(unsigned __int8 *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_100033F8C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033FC4(uint64_t a1)
{
  return sub_100033F3C(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

unint64_t sub_100033FCC()
{
  unint64_t result = qword_10005D930;
  if (!qword_10005D930)
  {
    sub_10000D210(&qword_10005D928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D930);
  }
  return result;
}

unint64_t sub_100034020()
{
  unint64_t result = qword_10005D940;
  if (!qword_10005D940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D940);
  }
  return result;
}

uint64_t sub_10003406C()
{
  uint64_t v2 = sub_100034F58();
  v3(v2);
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_1000340C0()
{
  uint64_t v2 = sub_100034F58();
  v3(v2);
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_100034114(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceFile();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100034170(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = sub_100005794(&qword_10005D5C8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(int *)(v5 + 56);
  uint64_t v9 = sub_100045620();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, a1, v9);
  v7[v8] = v3;
  sub_100045FC0();
  return sub_10002B670((uint64_t)v7, &qword_10005D5C8);
}

uint64_t sub_100034250(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100005794(&qword_10005D5C8);
  return a2(a1, *(unsigned __int8 *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_1000342A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_100005794(&qword_10005D5C8);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Log();
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  void v16[3] = v15;
  uint64_t v10 = sub_1000188D0(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v10, v8, v9);
  sub_100045A40();
  sub_10002B670((uint64_t)v16, (uint64_t *)&unk_10005CCF0);
  sub_100035680();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(v5 + 56);
  uint64_t v12 = sub_100045620();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v7, a3, v12);
  v7[v11] = 0;
  sub_100045FC0();
  return sub_10002B670((uint64_t)v7, &qword_10005D5C8);
}

uint64_t sub_1000344D0()
{
  type metadata accessor for JSSourceUrlParser();
  sub_100045580();
  sub_10002DB10();
  char v0 = sub_100046360();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_10003455C()
{
  return sub_1000344D0();
}

uint64_t sub_100034564()
{
  sub_100045580();
  sub_10002DB10();
  char v0 = sub_100046360();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_1000345E0()
{
  return sub_100034564();
}

uint64_t sub_1000345E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005D950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034650(uint64_t a1, char a2)
{
  return sub_100034170(a1, a2 & 1);
}

uint64_t sub_10003465C(uint64_t a1)
{
  return sub_100034250(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

uint64_t sub_100034664()
{
  uint64_t v1 = sub_100045620();
  sub_10000AD5C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 24) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_100034708(uint64_t a1)
{
  uint64_t v3 = sub_100045620();
  sub_100034F44(v3);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return sub_1000342A0(a1, v5, v6);
}

unint64_t sub_10003475C()
{
  unint64_t result = qword_10005CA10;
  if (!qword_10005CA10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005CA10);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for JSSourceUrlParser.ParseError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100034838);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for JSSourceUrlParser.ParseError()
{
  return &type metadata for JSSourceUrlParser.ParseError;
}

uint64_t *sub_100034870(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_100045DD0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100045620();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_100034978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_100045620();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_100034A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_100034AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100034B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100034C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100045DD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100034D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100034D14);
}

uint64_t sub_100034D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100045DD0();
  sub_100007EA4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_100045620();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }
  return sub_10000678C(v9, a2, v8);
}

uint64_t sub_100034D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100034DA4);
}

uint64_t sub_100034DA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_100045DD0();
  sub_100007EA4();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_100045620();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  return sub_1000066FC(v11, a2, a2, v10);
}

uint64_t sub_100034E28()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100045620();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_100034EF4()
{
  unint64_t result = qword_10005D9E8;
  if (!qword_10005D9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D9E8);
  }
  return result;
}

uint64_t sub_100034F44(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100034F58()
{
  return 0;
}

uint64_t sub_100034F6C(uint64_t a1)
{
  uint64_t v3 = sub_100046020();
  uint64_t v21 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v25 = type metadata accessor for LocalJavascriptLoader();
  v24[0] = v1;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_100045A00(v28);
    sub_1000062B0(v24, v25);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v22);
    v29._countAndFlagsBits = 5972026;
    v29._object = (void *)0xE300000000000000;
    sub_100045A00(v29);
    uint64_t MetatypeMetadata = &type metadata for String;
    v22[0] = v9;
    v22[1] = v11;
    sub_1000459F0();
    sub_100008588((uint64_t)v22);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_100045A00(v30);
    sub_1000062B0(v24, v25);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = v14;
    sub_1000459F0();
    sub_100008588((uint64_t)v22);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v24);
  sub_1000459D0();
  uint64_t v15 = sub_100045620();
  uint64_t v25 = v15;
  uint64_t v16 = sub_100006A38(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v16, a1, v15);
  sub_100045A40();
  sub_100008588((uint64_t)v24);
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_100046100();
  sub_100046030();
  uint64_t v25 = v3;
  uint64_t v26 = &protocol witness table for JSSource;
  char v17 = sub_100006A38(v24);
  uint64_t v18 = v21;
  (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 16))(v17, v5, v3);
  uint64_t v27 = sub_1000460F0();
  sub_100005794(&qword_10005C9F0);
  sub_100035490((uint64_t)v24, (uint64_t)v22);
  uint64_t v19 = sub_100045F80();
  sub_1000186C0((uint64_t)v24);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v3);
  return v19;
}

uint64_t type metadata accessor for LocalJavascriptLoader()
{
  return self;
}

uint64_t sub_100035420(uint64_t a1)
{
  return sub_100034F6C(a1);
}

unint64_t sub_100035444()
{
  unint64_t result = qword_10005DA90;
  if (!qword_10005DA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DA90);
  }
  return result;
}

uint64_t sub_100035490(uint64_t a1, uint64_t a2)
{
  return a2;
}

unsigned char *storeEnumTagSinglePayload for LocalJavascriptLoader.LoadError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100035588);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalJavascriptLoader.LoadError()
{
  return &type metadata for LocalJavascriptLoader.LoadError;
}

unint64_t sub_1000355C4()
{
  unint64_t result = qword_10005DA98;
  if (!qword_10005DA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DA98);
  }
  return result;
}

uint64_t sub_100035610()
{
  os_log_type_t v0 = sub_100046250();
  return sub_10003578C(v0);
}

uint64_t sub_100035648()
{
  os_log_type_t v0 = sub_100046280();
  return sub_10003578C(v0);
}

uint64_t sub_100035680()
{
  os_log_type_t v0 = sub_100046260();
  return sub_10003578C(v0);
}

uint64_t sub_1000356B8()
{
  os_log_type_t v0 = sub_100046270();
  return sub_10003578C(v0);
}

uint64_t sub_1000356F0()
{
  os_log_type_t v0 = sub_100046240();
  return sub_10003578C(v0);
}

uint64_t sub_100035728()
{
  sub_100035928();
  uint64_t result = sub_100046340();
  qword_10005DAA0 = result;
  return result;
}

uint64_t sub_10003578C(os_log_type_t a1)
{
  if (qword_10005C480 != -1) {
    swift_once();
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_10005DAA0, a1);
  if (result)
  {
    sub_1000459E0();
    uint64_t v3 = sub_100045A50();
    uint64_t v5 = v4;
    sub_100005794(&qword_10005DB40);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100047690;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_1000358DC();
    *(void *)(v6 + 32) = v3;
    *(void *)(v6 + 40) = v5;
    sub_1000456E0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for Log()
{
  return self;
}

unint64_t sub_1000358DC()
{
  unint64_t result = qword_10005DB48;
  if (!qword_10005DB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB48);
  }
  return result;
}

unint64_t sub_100035928()
{
  unint64_t result = qword_10005DB50;
  if (!qword_10005DB50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DB50);
  }
  return result;
}

void sub_100035968(void *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4 = (void *)sub_1000462E0();
  uint64_t v5 = sub_100008A34(v4);
  if (v5)
  {
    unint64_t v6 = sub_100023D88(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = (void *)sub_1000462E0();
  uint64_t v8 = sub_1000462D0();
  unint64_t v10 = v9;

  sub_100035EB4();
  uint64_t v11 = (void *)sub_1000462E0();
  uint64_t v12 = sub_1000462D0();
  unint64_t v14 = v13;

  if (v14)
  {
    uint64_t v24 = v8;
    sub_100035E94();
    uint64_t v15 = (void *)sub_1000462E0();
    uint64_t v23 = sub_1000462D0();
    unint64_t v17 = v16;

    if (v17)
    {
      unint64_t v22 = v6;
      sub_10000DA60();
      uint64_t v18 = (void *)sub_1000462E0();
      uint64_t v21 = sub_1000462D0();
      unint64_t v20 = v19;

      if (v20)
      {

        *a2 = v22;
        a2[1] = v12;
        a2[2] = v14;
        a2[3] = v24;
        a2[4] = v10;
        a2[5] = v23;
        a2[6] = v17;
        a2[7] = v21;
        a2[8] = v20;
        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10000DA60();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100035E94();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100035EB4();
  }
  sub_1000462E0();
  sub_100045E70();
  sub_100008AAC();
  swift_allocError();
  sub_100045E40();
  swift_willThrow();
}

void sub_100035B8C(void *a1@<X0>, void *a2@<X8>)
{
  sub_100035968(a1, __src);
  if (!v2) {
    memcpy(a2, __src, 0x48uLL);
  }
}

uint64_t destroy for MarketingItemRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for MarketingItemRequest(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MarketingItemRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
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
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for MarketingItemRequest(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

void *assignWithTake for MarketingItemRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingItemRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarketingItemRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MarketingItemRequest()
{
  return &type metadata for MarketingItemRequest;
}

uint64_t sub_100035E94()
{
  return 0x5465636976726573;
}

uint64_t sub_100035EB4()
{
  return 0x6E656D6563616C70;
}

id sub_100035ED0(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_1000106A0();
    id v6 = [a2 rawValues];
    sub_100005794(&qword_10005C8A0);
    uint64_t v7 = sub_1000460E0();

    v9[3] = sub_100005794(&qword_10005C8A8);
    v9[0] = v7;
    id v8 = a1;
    id result = sub_100026A70(v9, a1);
    if (result)
    {
      sub_1000462F0();
      return v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100035FF0(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100045620();
  uint64_t v28 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  uint64_t v10 = a2 + *(int *)(type metadata accessor for MediaAPIRequest() + 32);
  sub_1000066FC(v10, 1, 1, v7);
  uint64_t v11 = (void *)sub_1000462E0();
  uint64_t v12 = sub_100008A34(v11);
  if (v12)
  {
    unint64_t v13 = sub_100023D88(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = 0;
  }
  *(void *)a2 = v13;
  unint64_t v14 = (void *)sub_1000462E0();
  uint64_t v15 = sub_1000056D0(v14);
  if (v15)
  {
    unint64_t v16 = sub_100004DF8(v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = 0;
  }
  *(void *)(a2 + 16) = v16;
  unint64_t v17 = (void *)sub_1000462E0();
  char v18 = sub_1000462C0();

  *(unsigned char *)(a2 + 8) = v18 & 1;
  unint64_t v19 = (void *)sub_1000462E0();
  sub_1000462D0();
  uint64_t v21 = v20;

  if (v21)
  {
    sub_100045600();
    swift_bridgeObjectRelease();
    if (sub_10000678C((uint64_t)v6, 1, v7) == 1)
    {
      sub_10000B658((uint64_t)v6);
    }
    else
    {
      unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v22(v9, v6, v7);
      sub_10000B658(v10);
      v22((char *)v10, v9, v7);
      sub_1000066FC(v10, 0, 1, v7);
    }
  }
  uint64_t v23 = (void *)sub_1000462E0();
  uint64_t v24 = sub_1000462B0();
  char v26 = v25;

  if ((v26 & 1) == 0)
  {
    *(void *)(a2 + 24) = v24;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

void sub_1000362FC(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t type metadata accessor for MediaAPIRequest()
{
  uint64_t result = qword_10005DBB0;
  if (!qword_10005DBB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003635C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (void *)(a1 + v7);
    unint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100045620();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_10000678C((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_100005794(&qword_10005C8E8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      sub_1000066FC((uint64_t)v8, 0, 1, v10);
    }
  }
  return v5;
}

uint64_t sub_1000364B0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_100045620();
  uint64_t result = sub_10000678C(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_100036554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_100045620();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_10000678C((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100005794(&qword_10005C8E8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    sub_1000066FC((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_10003665C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100045620();
  int v11 = sub_10000678C((uint64_t)v8, 1, v10);
  int v12 = sub_10000678C((uint64_t)v9, 1, v10);
  if (!v11)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = sub_100005794(&qword_10005C8E8);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  sub_1000066FC((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t sub_100036804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = sub_100045620();
  if (sub_10000678C((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100005794(&qword_10005C8E8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
    sub_1000066FC((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_1000368F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_100045620();
  int v10 = sub_10000678C((uint64_t)v7, 1, v9);
  int v11 = sub_10000678C((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_100005794(&qword_10005C8E8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  sub_1000066FC((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_100036A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100036AA0);
}

uint64_t sub_100036AA0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = sub_100005794(&qword_10005C8E8);
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 32);
    return sub_10000678C(v10, a2, v9);
  }
}

uint64_t sub_100036B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100036B4C);
}

void *sub_100036B4C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100005794(&qword_10005C8E8);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 32);
    return (void *)sub_1000066FC(v8, a2, a2, v7);
  }
  return result;
}

void sub_100036BD0()
{
  sub_100028D54();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

id sub_100036C7C(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v5 = result;
  uint64_t v6 = sub_100036DC8(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_1000106A0();
    uint64_t v13 = sub_100005794(&qword_10005C5B0);
    v12[0] = v7;
    id v8 = a1;
    id result = sub_100026A70(v12, a1);
    if (result)
    {
      sub_1000462F0();
      goto LABEL_5;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v9 = sub_100036E34(a2);
  if (!v9) {
    return v5;
  }
  uint64_t v10 = v9;
  sub_1000106A0();
  uint64_t v13 = sub_100005794(&qword_10005C888);
  v12[0] = v10;
  id v11 = a1;
  id result = sub_100026A70(v12, a1);
  if (result)
  {
    sub_1000462F0();
    return v5;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100036DC8(void *a1)
{
  id v1 = [a1 responseDictionary];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_1000460E0();

  return v3;
}

uint64_t sub_100036E34(void *a1)
{
  id v1 = [a1 responseDataItems];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_100005794(&qword_10005C5B0);
  uint64_t v3 = sub_1000461F0();

  return v3;
}

void *initializeBufferWithCopyOfBuffer for MediaClient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for MediaClient()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for MediaClient(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for MediaClient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaClient(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaClient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaClient()
{
  return &type metadata for MediaClient;
}

uint64_t sub_100036FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1000465C0();
  }
}

uint64_t sub_100036FF0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000465C0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100037084()
{
  return 0x696669746E656469;
}

uint64_t sub_1000370A0(uint64_t *a1, uint64_t *a2)
{
  return sub_100036FD4(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_1000370B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100036FF0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000370E4(uint64_t a1)
{
  unint64_t v2 = sub_1000374D0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100037120(uint64_t a1)
{
  unint64_t v2 = sub_1000374D0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10003715C(void *a1)
{
  uint64_t v3 = sub_100005794(&qword_10005DBF8);
  sub_10000AD5C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)sub_1000062B0(a1, a1[3]);
  sub_1000374D0();
  sub_100046680();
  if (!v1)
  {
    uint64_t v9 = sub_100046530();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
  return v9;
}

uint64_t sub_10003728C(void *a1)
{
  uint64_t v2 = sub_100005794(&qword_10005DC08);
  sub_10000AD5C();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000062B0(a1, a1[3]);
  sub_1000374D0();
  sub_100046690();
  sub_100046570();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v2);
}

uint64_t sub_1000373A0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10003715C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1000373CC(void *a1)
{
  return sub_10003728C(a1);
}

uint64_t sub_1000373E8(uint64_t a1, void *a2)
{
  sub_100046460(27);
  sub_100005794(&qword_10005DC10);
  uint64_t v4 = sub_100046190();
  swift_bridgeObjectRelease();
  v6._object = (void *)0x800000010004B030;
  v6._countAndFlagsBits = 0xD000000000000015;
  sub_1000461B0(v6);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  sub_1000461B0(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 32010;
  v8._object = (void *)0xE200000000000000;
  sub_1000461B0(v8);
  return v4;
}

uint64_t sub_1000374C8()
{
  return sub_1000373E8(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_1000374D0()
{
  unint64_t result = qword_10005DC00;
  if (!qword_10005DC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC00);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MediaClient.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000375B8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaClient.CodingKeys()
{
  return &type metadata for MediaClient.CodingKeys;
}

unint64_t sub_1000375F4()
{
  unint64_t result = qword_10005DC18;
  if (!qword_10005DC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC18);
  }
  return result;
}

unint64_t sub_100037644()
{
  unint64_t result = qword_10005DC20;
  if (!qword_10005DC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC20);
  }
  return result;
}

unint64_t sub_100037694()
{
  unint64_t result = qword_10005DC28;
  if (!qword_10005DC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC28);
  }
  return result;
}

void sub_1000376E4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005794(&qword_10005DC80);
    uint64_t v2 = (void *)sub_100046510();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  Swift::String v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    char v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_100005738(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000684C(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_10000684C(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_10000684C(v40, v41);
    sub_10000684C(v41, &v37);
    Swift::Int v21 = sub_1000463F0(v2[5]);
    uint64_t v22 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)&v6[8 * (v23 >> 6)]) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)&v6[8 * v24];
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)&v6[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)&v6[(v25 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v25;
    uint64_t v30 = v2[6] + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_10000684C(&v37, (_OWORD *)(v2[7] + 32 * v25));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      sub_100038C34();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_100038C1C();
      if (!v11)
      {
        sub_100038C34();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_100038C1C();
        if (!v11)
        {
          sub_100038C34();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_100038C1C();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_10000B6B8();
    return;
  }
  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    sub_100038C34();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_100038C1C();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_100037A88(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005794(&qword_10005DC78);
    uint64_t v2 = (void *)sub_100046510();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v36 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v35 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  int64_t v7 = &type metadata for String;
  unint64_t v8 = &qword_10005C8A0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v9 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v10 = v9 | (v6 << 6);
      }
      else
      {
        int64_t v11 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_38;
        }
        if (v11 >= v35)
        {
LABEL_35:
          sub_10000B6B8();
          return;
        }
        unint64_t v12 = *(void *)(v36 + 8 * v11);
        int64_t v13 = v6 + 1;
        if (!v12)
        {
          sub_100038C28();
          if (v14 == v15) {
            goto LABEL_35;
          }
          sub_100038C40();
          if (!v12)
          {
            sub_100038C28();
            if (v14 == v15) {
              goto LABEL_35;
            }
            sub_100038C40();
            if (!v12)
            {
              sub_100038C28();
              if (v14 == v15) {
                goto LABEL_35;
              }
              sub_100038C40();
              if (!v12)
              {
                int64_t v17 = v16 + 4;
                if (v17 >= v35) {
                  goto LABEL_35;
                }
                unint64_t v12 = *(void *)(v36 + 8 * v17);
                if (!v12)
                {
                  while (!__OFADD__(v17, 1))
                  {
                    sub_100038C28();
                    if (v14 == v15) {
                      goto LABEL_35;
                    }
                    sub_100038C40();
                    int64_t v17 = v18 + 1;
                    if (v12) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v13 = v17;
              }
            }
          }
        }
LABEL_29:
        unint64_t v5 = (v12 - 1) & v12;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        int64_t v6 = v13;
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v10);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100005794(v8);
      swift_dynamicCast();
      unint64_t v22 = sub_1000091DC(v21, v20);
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      unint64_t v25 = v5;
      uint64_t v26 = v1;
      uint64_t v27 = v6;
      BOOL v28 = v8;
      uint64_t v29 = v7;
      uint64_t v30 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *uint64_t v30 = v21;
      v30[1] = v20;
      int64_t v7 = v29;
      unint64_t v8 = v28;
      int64_t v6 = v27;
      uint64_t v1 = v26;
      unint64_t v5 = v25;
      uint64_t v31 = v2[7];
      swift_unknownObjectRelease();
      *(void *)(v31 + 8 * v23) = v37;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    uint64_t v32 = (uint64_t *)(v2[6] + 16 * v22);
    *uint64_t v32 = v21;
    v32[1] = v20;
    *(void *)(v2[7] + 8 * v22) = v37;
    uint64_t v33 = v2[2];
    BOOL v15 = __OFADD__(v33, 1);
    uint64_t v34 = v33 + 1;
    if (v15) {
      goto LABEL_37;
    }
    v2[2] = v34;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t MetricsContext.isAnonymous.getter(char a1)
{
  return a1 & 1;
}

unint64_t static MetricsContext.== infix(_:_:)(int a1, uint64_t a2, int a3, uint64_t a4)
{
  if ((a1 ^ a3)) {
    return 0;
  }
  unint64_t v4 = (a2 | a4) == 0;
  if (a2 && a4)
  {
    sub_100037E44();
    sub_1000376E4(a2);
    id v7 = sub_100037FD4();
    sub_1000376E4(a4);
    Class isa = sub_1000460D0().super.isa;
    swift_bridgeObjectRelease();
    unint64_t v4 = (unint64_t)[v7 isEqualToDictionary:isa];
  }
  return v4;
}

unint64_t sub_100037E44()
{
  unint64_t result = qword_10005DC30;
  if (!qword_10005DC30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DC30);
  }
  return result;
}

uint64_t sub_100037E84(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D796E6F6E417369 && a2 == 0xEB0000000073756FLL;
  if (v2 || (sub_1000465C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79616C7265766FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1000465C0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100037F8C()
{
  return 2;
}

uint64_t sub_100037F94(char a1)
{
  if (a1) {
    return 0x79616C7265766FLL;
  }
  else {
    return 0x6D796E6F6E417369;
  }
}

id sub_100037FD4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_1000460D0().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithDictionary:isa];

  return v2;
}

unint64_t sub_10003805C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static MetricsContext.== infix(_:_:)(*a1, *((void *)a1 + 1), *a2, *((void *)a2 + 1));
}

uint64_t sub_100038078()
{
  return sub_100037F94(*v0);
}

uint64_t sub_100038080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100037E84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000380A8()
{
  return sub_10000DA54();
}

uint64_t sub_1000380C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100037F8C();
  *a1 = result;
  return result;
}

uint64_t sub_1000380F0(uint64_t a1)
{
  unint64_t v2 = sub_100038420();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003812C(uint64_t a1)
{
  unint64_t v2 = sub_100038420();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MetricsContext.init(from:)(void *a1)
{
  uint64_t v3 = sub_100005794(&qword_10005DC38);
  sub_10000AD5C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  sub_1000062B0(a1, v9);
  sub_100038420();
  sub_100046680();
  if (!v1)
  {
    LOBYTE(v22[0]) = 0;
    LOBYTE(v9) = sub_100046540();
    LOBYTE(v21) = 1;
    sub_10002824C();
    sub_100046560();
    id v11 = v22[0];
    id v12 = v22[1];
    int64_t v13 = self;
    uint64_t v20 = (uint64_t)v11;
    Class isa = sub_100045640().super.isa;
    v22[0] = 0;
    id v15 = [v13 JSONObjectWithData:isa options:0 error:v22];

    if (v15)
    {
      id v16 = v22[0];
      sub_100046370();
      sub_1000282F4(v20, (unint64_t)v12);
      swift_unknownObjectRelease();
      uint64_t v17 = sub_100038BF0();
      v18(v17);
      sub_100005794(&qword_10005C5A0);
      swift_dynamicCast();
    }
    else
    {
      uint64_t v9 = (uint64_t)v22[0];
      sub_100045550();

      swift_willThrow();
      sub_1000282F4(v20, (unint64_t)v12);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    }
  }
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)a1);
  return v9 & 1;
}

unint64_t sub_100038420()
{
  unint64_t result = qword_10005DC40;
  if (!qword_10005DC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC40);
  }
  return result;
}

uint64_t MetricsContext.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100005794(&qword_10005DC48);
  sub_10000AD5C();
  __chkstk_darwin(v6);
  sub_1000062B0(a1, a1[3]);
  sub_100038420();
  sub_100046690();
  LOBYTE(v20[0]) = 0;
  sub_100046580();
  if (v3 || !a3) {
    goto LABEL_2;
  }
  unint64_t v10 = self;
  Class isa = sub_1000460D0().super.isa;
  v20[0] = 0;
  id v12 = [v10 dataWithJSONObject:isa options:0 error:v20];

  id v13 = v20[0];
  if (!v12)
  {
    uint64_t v19 = v13;
    sub_100045550();

    swift_willThrow();
LABEL_2:
    uint64_t v7 = sub_100038C08();
    return v8(v7);
  }
  char v14 = (void *)sub_100045650();
  id v16 = v15;

  v20[0] = v14;
  v20[1] = v16;
  sub_10002834C();
  sub_1000465A0();
  uint64_t v17 = sub_100038C08();
  v18(v17);
  return sub_1000282F4((uint64_t)v14, (unint64_t)v16);
}

uint64_t sub_1000386A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = MetricsContext.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_1000386DC(void *a1)
{
  return MetricsContext.encode(to:)(a1, *v1, *((void *)v1 + 1));
}

uint64_t MetricsContext.description.getter(char a1, uint64_t a2)
{
  sub_100046460(45);
  sub_100005794(&qword_10005DC50);
  uint64_t v4 = sub_100046190();
  swift_bridgeObjectRelease();
  v10._object = (void *)0x800000010004B050;
  v10._countAndFlagsBits = 0xD000000000000016;
  sub_1000461B0(v10);
  if (a1) {
    v5._countAndFlagsBits = 1702195828;
  }
  else {
    v5._countAndFlagsBits = 0x65736C6166;
  }
  if (a1) {
    uint64_t v6 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v6 = (void *)0xE500000000000000;
  }
  v5._object = v6;
  sub_1000461B0(v5);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x65766F202020200ALL;
  v11._object = (void *)0xEE00203A79616C72;
  sub_1000461B0(v11);
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_100005794(&qword_10005DC58);
    v7._countAndFlagsBits = sub_100046190();
    object = v7._object;
  }
  else
  {
    object = (void *)0xE900000000000064;
    v7._countAndFlagsBits = 0x656E696665646E75;
  }
  v7._object = object;
  sub_1000461B0(v7);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 8194601;
  v12._object = (void *)0xE300000000000000;
  sub_1000461B0(v12);
  return v4;
}

uint64_t sub_100038880()
{
  return MetricsContext.description.getter(*(unsigned char *)v0, *(void *)(v0 + 8));
}

uint64_t initializeBufferWithCopyOfBuffer for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsContext(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricsContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricsContext()
{
  return &type metadata for MetricsContext;
}

unsigned char *storeEnumTagSinglePayload for MetricsContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100038AC4);
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

ValueMetadata *type metadata accessor for MetricsContext.CodingKeys()
{
  return &type metadata for MetricsContext.CodingKeys;
}

unint64_t sub_100038B00()
{
  unint64_t result = qword_10005DC60;
  if (!qword_10005DC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC60);
  }
  return result;
}

unint64_t sub_100038B50()
{
  unint64_t result = qword_10005DC68;
  if (!qword_10005DC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC68);
  }
  return result;
}

unint64_t sub_100038BA0()
{
  unint64_t result = qword_10005DC70;
  if (!qword_10005DC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC70);
  }
  return result;
}

uint64_t sub_100038BF0()
{
  return v0;
}

uint64_t sub_100038C08()
{
  return v0;
}

id sub_100038C4C(uint64_t a1)
{
  NSString v2 = sub_100046110();
  sub_100005794(&qword_10005C5D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100048DD0;
  *(void *)(inited + 32) = sub_100046140();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0x726F727245534ALL;
  *(void *)(inited + 56) = 0xE700000000000000;
  *(void *)(inited + 80) = sub_100046140();
  *(void *)(inited + 88) = v5;
  *(void *)(inited + 96) = sub_100045E30();
  *(void *)(inited + 104) = v6;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x6E6D756C6F43;
  *(void *)(inited + 136) = 0xE600000000000000;
  uint64_t v7 = sub_100045E10();
  if (v8)
  {
    *(void *)(inited + 168) = &type metadata for String;
    *(void *)(inited + 144) = 0x6E776F6E6B6E75;
    *(void *)(inited + 152) = 0xE700000000000000;
  }
  else
  {
    uint64_t v21 = &type metadata for Int;
    *(void *)&long long v20 = v7;
    sub_10000684C(&v20, (_OWORD *)(inited + 144));
  }
  *(void *)(inited + 176) = 1701734732;
  *(void *)(inited + 184) = 0xE400000000000000;
  uint64_t v9 = sub_100045E00();
  if (v10)
  {
    *(void *)(inited + 216) = &type metadata for String;
    *(void *)(inited + 192) = 0x6E776F6E6B6E75;
    *(void *)(inited + 200) = 0xE700000000000000;
  }
  else
  {
    uint64_t v21 = &type metadata for Int;
    *(void *)&long long v20 = v9;
    sub_10000684C(&v20, (_OWORD *)(inited + 192));
  }
  *(void *)(inited + 224) = 0x5520656372756F53;
  *(void *)(inited + 232) = 0xEA00000000004C52;
  uint64_t v11 = sub_100045E60();
  *(void *)(inited + 264) = &type metadata for String;
  if (v12) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0x6E776F6E6B6E75;
  }
  unint64_t v14 = 0xE700000000000000;
  if (v12) {
    unint64_t v14 = v12;
  }
  *(void *)(inited + 240) = v13;
  *(void *)(inited + 248) = v14;
  id v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v16 = sub_1000460F0();
  id v17 = sub_100038E84((uint64_t)v2, 0, v16, v15);

  uint64_t v18 = sub_100045E70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);
  return v17;
}

id sub_100038E84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  Class isa = sub_1000460D0().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [a4 initWithDomain:a1 code:a2 userInfo:isa];

  return v8;
}

uint64_t sub_100038F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100038F6C(a1, a2, a3);
}

uint64_t sub_100038F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100045CF0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  *(void *)(v3 + qword_10005DC88) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  uint64_t v8 = sub_100045BE0();
  sub_10002F680();
  swift_retain();
  sub_100045C10();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a3, v5);
  uint64_t v9 = *(void **)(v8 + qword_10005DC88);
  *(void *)(v8 + qword_10005DC88) = v11[1];

  return v8;
}

void sub_1000390C8()
{
}

uint64_t ObjectGraph.deinit()
{
  uint64_t v0 = sub_100045C30();

  return v0;
}

uint64_t ObjectGraph.__deallocating_deinit()
{
  uint64_t v0 = sub_100045C30();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ObjectGraph()
{
  uint64_t result = qword_10005DC90;
  if (!qword_10005DC90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000391A8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000391F4()
{
  return type metadata accessor for ObjectGraph();
}

uint64_t sub_1000391FC(uint64_t a1, uint64_t a2, int a3)
{
  int v28 = a3;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v4 = sub_1000458C0();
  sub_10000AD5C();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = sub_100045850();
  sub_10000AD5C();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100039654();
  uint64_t v13 = sub_1000458A0();
  sub_10000AD5C();
  uint64_t v15 = v14;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = &v27[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  uint64_t v21 = &v27[-v20];
  sub_100045860();
  unint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.required(_:);
  if ((v28 & 1) == 0) {
    unint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.ignore(_:);
  }
  (*(void (**)(unsigned char *, void, uint64_t))(v15 + 104))(v21, *v22, v13);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 16))(v19, v21, v13);
  uint64_t v34 = sub_1000458E0();
  int64_t v35 = &protocol witness table for JetPackManagedKeyProvider;
  sub_100006A38(v33);
  sub_1000458D0();
  sub_100045820();
  sub_1000455F0();
  sub_1000458B0();
  uint64_t v34 = v4;
  int64_t v35 = &protocol witness table for JetPackFileStreamSource;
  unint64_t v23 = sub_100006A38(v33);
  (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v6 + 16))(v23, v9, v4);
  uint64_t v24 = sub_100045830();
  void v32[3] = sub_10003475C();
  uint64_t v32[4] = &protocol witness table for OS_dispatch_queue;
  v32[0] = v24;
  uint64_t v25 = sub_100045840();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v32);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v31);
  (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v21, v13);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v33);
  return v25;
}

uint64_t sub_1000394BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100045880();
  if (!v1)
  {
    if (v4 >> 60 == 15)
    {
      swift_willThrow();
      return swift_errorRetain();
    }
    else
    {
      *a1 = result;
      a1[1] = v4;
    }
  }
  return result;
}

uint64_t sub_100039520()
{
  uint64_t v1 = sub_100045900();
  sub_10000AD5C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100039654();
  uint64_t v5 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045620();
  sub_1000066FC((uint64_t)v7, 1, 1, v8);
  sub_1000458F0();
  sub_100045870();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return sub_10000B658((uint64_t)v7);
}

id sub_10003966C()
{
  uint64_t v0 = (void *)sub_100045540();
  id v1 = objc_msgSend(v0, "ams_sanitizedForSecureCoding");

  return v1;
}

uint64_t sub_1000396B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v54 = a2;
  uint64_t v55 = (void *)a3;
  uint64_t v58 = a1;
  uint64_t v4 = sub_100045620();
  sub_10000AD5C();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v56 = v8;
  uint64_t v57 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045DD0();
  sub_10000AD5C();
  uint64_t v52 = v10;
  uint64_t v53 = v9;
  __chkstk_darwin(v9);
  uint64_t v51 = v11;
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045A20();
  __chkstk_darwin(v13 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v14 = sub_100045A70();
  sub_100008628(v14);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v60 = type metadata accessor for RemoteJavaScriptLoader();
  v59[0] = v3;
  swift_retain();
  id v15 = (id)AMSLogKey();
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_100046140();
    uint64_t v19 = v18;

    sub_100045A10();
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    sub_100045A00(v64);
    sub_1000062B0(v59, v60);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v62[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v62);
    v65._countAndFlagsBits = 5972026;
    v65._object = (void *)0xE300000000000000;
    sub_100045A00(v65);
    uint64_t MetatypeMetadata = &type metadata for String;
    v62[0] = v17;
    v62[1] = v19;
    sub_1000459F0();
    sub_100008588((uint64_t)v62);
    v21._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v66._countAndFlagsBits = 0;
    v66._object = (void *)0xE000000000000000;
    sub_100045A00(v66);
    sub_1000062B0(v59, v60);
    uint64_t v22 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v62[0] = v22;
    sub_1000459F0();
    sub_100008588((uint64_t)v62);
    v21._countAndFlagsBits = 58;
  }
  v21._object = (void *)0xE100000000000000;
  sub_100045A00(v21);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v59);
  sub_1000459D0();
  uint64_t v60 = v4;
  unint64_t v23 = sub_100006A38(v59);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = v4;
  Swift::String v49 = v24;
  v24((char *)v23, v58, v4);
  sub_100045A40();
  sub_100008588((uint64_t)v59);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v25 = v54;
  uint64_t v26 = v55;
  id v27 = sub_10002F52C(v54, (uint64_t)v55);
  id v50 = v27;
  sub_100005794(&qword_10005D118);
  sub_1000455A0(v28);
  uint64_t v30 = v29;
  id v31 = [v27 requestWithMethod:2 URL:v29 parameters:0];

  sub_100045FF0();
  uint64_t v32 = v52;
  uint64_t v33 = v12;
  uint64_t v34 = v12;
  uint64_t v35 = v53;
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v34, v25, v53);
  unint64_t v36 = (*(unsigned __int8 *)(v32 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  unint64_t v37 = (v51 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v38 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v38 + v36, v33, v35);
  *(void *)(v38 + v37) = v26;
  uint64_t v39 = sub_100045CC0();
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v59);
  id v40 = v26;
  sub_100045CB0();
  sub_100005794(&qword_10005D080);
  sub_100031E50(&qword_10005DD80, &qword_10005D080);
  sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v59);
  unint64_t v41 = v57;
  uint64_t v42 = v48;
  v49(v57, v58, v48);
  unint64_t v43 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v44 + v43, v41, v42);
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v59);
  sub_100045CB0();
  sub_100005794(&qword_10005DD88);
  sub_100031E50(&qword_10005DD90, &qword_10005DD88);
  sub_100045FB0();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v59);
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100006A38(v59);
  sub_100045CB0();
  uint64_t v45 = sub_100045F40();

  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v59);
  return v45;
}

uint64_t sub_100039CDC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  id v4 = sub_10002F5BC(a2, a3);
  sub_100005794(&qword_10005D080);
  id v5 = [v4 dataTaskPromiseWithRequest:v3];
  uint64_t v6 = sub_100045FF0();

  return v6;
}

uint64_t sub_100039D50(id *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005C8E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100046180();
  __chkstk_darwin(v7 - 8);
  id v8 = [*a1 data];
  uint64_t v9 = sub_100045650();
  unint64_t v11 = v10;

  sub_100046170();
  sub_100046160();
  uint64_t v13 = v12;
  sub_1000282F4(v9, v11);
  sub_100005794(&qword_10005DD88);
  if (v13)
  {
    uint64_t v14 = sub_100045620();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v6, a2, v14);
    sub_1000066FC((uint64_t)v6, 0, 1, v14);
    void v17[3] = sub_100046020();
    id v17[4] = (uint64_t)&protocol witness table for JSSource;
    sub_100006A38(v17);
    sub_100046010();
    return sub_100045F80();
  }
  else
  {
    sub_10003A1FC();
    swift_allocError();
    return sub_100045F70();
  }
}

uint64_t sub_100039F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1000460F0();
  uint64_t result = sub_10000D53C(a1, a2);
  *(void *)(a2 + 40) = v4;
  return result;
}

uint64_t type metadata accessor for RemoteJavaScriptLoader()
{
  return self;
}

uint64_t sub_100039FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000396B0(a1, a2, a3);
}

uint64_t sub_100039FF8()
{
  sub_100045DD0();
  sub_10000D8E8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_10003A090(uint64_t *a1)
{
  uint64_t v3 = sub_100045DD0();
  sub_100008628(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_100039CDC(a1, v1 + v8, v9);
}

uint64_t sub_10003A108()
{
  sub_100045620();
  sub_10000D8E8();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10003A18C(id *a1)
{
  uint64_t v3 = *(void *)(sub_100045620() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_100039D50(a1, v4);
}

unint64_t sub_10003A1FC()
{
  unint64_t result = qword_10005DD98;
  if (!qword_10005DD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD98);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RemoteJavaScriptLoader.LoadError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10003A2E4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteJavaScriptLoader.LoadError()
{
  return &type metadata for RemoteJavaScriptLoader.LoadError;
}

unint64_t sub_10003A320()
{
  unint64_t result = qword_10005DDA0;
  if (!qword_10005DDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DDA0);
  }
  return result;
}

uint64_t sub_10003A36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 16) = a1;
  uint64_t v16 = v8 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_bag;
  sub_100045DD0();
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v17 + 32))(v16, a2);
  *(void *)(v8 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_clientInfo) = a3;
  uint64_t v18 = (void *)(v8 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_mediaClient);
  *uint64_t v18 = a4;
  v18[1] = a5;
  uint64_t v19 = v8 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_metricsContext;
  *(unsigned char *)uint64_t v19 = a6;
  *(void *)(v19 + 8) = a7;
  uint64_t v20 = v8 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_url;
  sub_100045620();
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v20, a8);
  return v8;
}

uint64_t sub_10003A47C()
{
  sub_10003A618();
  sub_10003A810(v6);
  sub_10003A8B4(v5);
  sub_10003AA2C(v4, (uint64_t)v3);
  sub_1000062B0(v3, v3[3]);
  sub_100045D20();
  v2[3] = sub_100045CC0();
  v2[4] = (uint64_t)&protocol witness table for SyncTaskScheduler;
  sub_100006A38(v2);
  sub_100045CB0();
  sub_100045C20();
  uint64_t v0 = sub_100045F40();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v2);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v4);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v5);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v6);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v3);
  return v0;
}

uint64_t sub_10003A580()
{
  type metadata accessor for ObjectGraph();
  swift_retain();
  uint64_t v0 = sub_100045C40();
  swift_retain();
  sub_100045BF0();
  swift_release();
  return v0;
}

uint64_t sub_10003A5E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003A580();
  *a1 = result;
  return result;
}

uint64_t sub_10003A618()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  int v3 = (int *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)&v19[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v1 + 16);
  uint64_t v7 = v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_bag;
  uint64_t v8 = (char *)v5 + v3[7];
  sub_100045DD0();
  sub_10001DBE8();
  (*(void (**)(char *, uint64_t))(v9 + 16))(v8, v7);
  unint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_clientInfo);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_mediaClient);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_mediaClient + 8);
  *uint64_t v5 = v6;
  *(void *)((char *)v5 + v3[8]) = v10;
  uint64_t v13 = (void *)((char *)v5 + v3[9]);
  *uint64_t v13 = v11;
  v13[1] = v12;
  id v14 = v6;
  id v15 = v10;
  swift_bridgeObjectRetain();
  sub_100006B90();
  sub_10003B320((uint64_t)v5);
  sub_100045FD0();
  swift_release();
  sub_1000062B0(v21, v21[3]);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_metricsContext + 8);
  LOBYTE(v19[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_metricsContext);
  v19[1] = v16;
  sub_100045D50();
  sub_1000062B0(v20, v20[3]);
  sub_100045620();
  sub_100045D50();
  sub_10003B37C(v19);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v19);
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v21);
}

uint64_t sub_10003A810(void *a1)
{
  sub_1000062B0(a1, a1[3]);
  type metadata accessor for ServiceRequestHandler();
  swift_allocObject();
  sub_100045D50();
  swift_release();
  sub_10003B37C(v2);
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v2);
}

uint64_t sub_10003A8B4(void *a1)
{
  sub_1000062B0(a1, a1[3]);
  type metadata accessor for URLSessionHandler();
  sub_100045D40();
  sub_10003B37C(v2);
  return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v2);
}

void sub_10003A940(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (objc_class *)type metadata accessor for URLSessionHandler();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC16UtilityExtension17URLSessionHandler_objectGraph] = a1;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v9, "init");
  sub_1000067B4(0, (unint64_t *)&qword_10005C6F0);
  sub_100045C20();
  sub_100045DE0();
  uint64_t v7 = v10;
  id v8 = v6;
  objc_msgSend(v7, "setDelegate:", v8, v9.receiver, v9.super_class);

  *a2 = v8;
}

id sub_10003AA2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v30 = sub_100045DD0();
  sub_10000AD5C();
  uint64_t v28 = v4;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v7);
  uint64_t v29 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045620();
  sub_10000AD5C();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v13);
  id v14 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000062B0(a1, a1[3]);
  id result = [objc_allocWithZone((Class)JSVirtualMachine) init];
  if (result)
  {
    uint64_t v16 = result;
    sub_1000067B4(0, &qword_10005C9E8);
    v35[0] = v16;
    sub_100045D50();

    sub_1000062B0(v38, v38[3]);
    sub_10003B3B8();
    v27[2] = v36;
    v27[3] = v37;
    v27[1] = sub_1000062B0(v35, v36);
    uint64_t v17 = v2 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_bag;
    v27[0] = *(void *)(v2 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_clientInfo);
    uint64_t v18 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v2 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_url, v8);
    uint64_t v19 = v28;
    uint64_t v20 = v29;
    uint64_t v21 = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v29, v17, v30);
    unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    unint64_t v23 = (v12 + *(unsigned __int8 *)(v19 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    uint64_t v24 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v24 + v22, v14, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v24 + v23, v20, v21);
    uint64_t v25 = (void *)v27[0];
    *(void *)(v24 + ((v6 + v23 + 7) & 0xFFFFFFFFFFFFFFF8)) = v27[0];
    id v26 = v25;
    sub_100045D30();
    swift_release();
    sub_1000062B0(v34, v34[3]);
    sub_10003B3B8();
    sub_1000062B0(v33, v33[3]);
    type metadata accessor for JSDataProvider();
    sub_100045D40();
    sub_1000062B0(v32, v32[3]);
    sub_10003B3B8();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v32);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v33);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v34);
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v35);
    return (id)_s16UtilityExtension9JSAccountVwxx_0((uint64_t)v38);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003AE00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  type metadata accessor for JSSourceLoader();
  swift_allocObject();
  uint64_t v8 = sub_10002EC94(a2, a3, a4, a1);
  swift_release();
  return v8;
}

uint64_t sub_10003AE7C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for JSDataProvider();
  swift_allocObject();
  uint64_t v3 = swift_retain();
  uint64_t result = sub_1000157FC(v3);
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10003AEE0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_bag;
  sub_100045DD0();
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC16UtilityExtension16ServiceBootstrap_url;
  sub_100045620();
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  return v0;
}

uint64_t sub_10003AFB8()
{
  sub_10003AEE0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10003B010()
{
  return type metadata accessor for ServiceBootstrap();
}

uint64_t type metadata accessor for ServiceBootstrap()
{
  uint64_t result = qword_10005DDF8;
  if (!qword_10005DDF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003B060()
{
  uint64_t result = sub_100045DD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100045620();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10003B154()
{
  uint64_t v1 = sub_100045620();
  sub_10000AD5C();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_100045DD0();
  sub_10000AD5C();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v5 + v7 + v13) & ~v13;
  uint64_t v15 = v4 | v13 | 7;
  unint64_t v16 = (*(void *)(v12 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);

  return _swift_deallocObject(v0, v16 + 8, v15);
}

uint64_t sub_10003B268(uint64_t a1)
{
  uint64_t v3 = sub_100045620();
  sub_100008628(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_100045DD0();
  sub_100008628(v8);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  unint64_t v13 = (v5 + v7 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = *(void **)(v1 + ((*(void *)(v12 + 64) + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_10003AE00(a1, v1 + v5, v1 + v13, v14);
}

uint64_t sub_10003B320(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003B37C(void *a1)
{
  sub_1000062B0(a1, v1);
  return sub_100045D60();
}

uint64_t sub_10003B3B8()
{
  return sub_100045D60();
}

void *sub_10003B3D4()
{
  type metadata accessor for ServiceConnection();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10003C37C();
  qword_100061370 = v0;
  return result;
}

uint64_t sub_10003B410()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (!v1) {
    return 0;
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10003B83C;
  void aBlock[3] = &unk_100056E10;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = v1;
  swift_retain();
  swift_release();
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v2];
  _Block_release(v2);

  sub_100046370();
  swift_unknownObjectRelease();
  sub_100005794(&qword_10005E068);
  if (swift_dynamicCast()) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t sub_10003B544(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100045A20();
  __chkstk_darwin(v3 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v18 = type metadata accessor for ServiceConnection();
  v17[0] = a2;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = sub_100046140();
    uint64_t v8 = v7;

    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v15);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_100045A00(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v6;
    v15[1] = v8;
    sub_1000459F0();
    sub_100008588((uint64_t)v15);
    v10._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_100045A00(v21);
    sub_1000062B0(v17, v18);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v11;
    sub_1000459F0();
    sub_100008588((uint64_t)v15);
    v10._countAndFlagsBits = 58;
  }
  v10._object = (void *)0xE100000000000000;
  sub_100045A00(v10);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v17);
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v18 = v14;
  uint64_t v12 = sub_100006A38(v17);
  (*(void (**)(uint64_t *))(*(void *)(v14 - 8) + 16))(v12);
  sub_100045A40();
  sub_100008588((uint64_t)v17);
  sub_100035680();
  return swift_bridgeObjectRelease();
}

void sub_10003B83C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10003B8A4(void **a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100045A20();
  __chkstk_darwin(v4 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  id v26 = (void *)type metadata accessor for ServiceConnection();
  aBlock = (void **)v1;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100046140();
    uint64_t v9 = v8;

    sub_100045A10();
    v31._countAndFlagsBits = 0;
    v31._object = (void *)0xE000000000000000;
    sub_100045A00(v31);
    sub_1000062B0(&aBlock, (uint64_t)v26);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v29[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v29);
    v32._countAndFlagsBits = 5972026;
    v32._object = (void *)0xE300000000000000;
    sub_100045A00(v32);
    uint64_t MetatypeMetadata = &type metadata for String;
    v29[0] = v7;
    v29[1] = v9;
    sub_1000459F0();
    sub_100008588((uint64_t)v29);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    sub_100045A00(v33);
    sub_1000062B0(&aBlock, (uint64_t)v26);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v29[0] = v12;
    sub_1000459F0();
    sub_100008588((uint64_t)v29);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_100045A00(v11);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&aBlock);
  sub_1000459D0();
  id v26 = (void *)sub_10003C57C();
  aBlock = a1;
  unint64_t v13 = a1;
  sub_100045A40();
  sub_100008588((uint64_t)&aBlock);
  sub_100035648();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v13;
  uint64_t v15 = v13;

  unint64_t v16 = self;
  id v17 = [v16 interfaceWithProtocol:&OBJC_PROTOCOL____TtP16UtilityExtension24ClientConnectionProtocol_];
  [v15 setRemoteObjectInterface:v17];
  id v18 = [v16 interfaceWithProtocol:&OBJC_PROTOCOL____TtP16UtilityExtension25ServiceConnectionProtocol_];
  [v15 setExportedInterface:v18];
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  id v27 = sub_10003C5F4;
  uint64_t v28 = v19;
  aBlock = _NSConcreteStackBlock;
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_10003C028;
  id v26 = &unk_100056DC0;
  Swift::String v20 = _Block_copy(&aBlock);
  swift_release();
  [v15 setInvalidationHandler:v20];
  _Block_release(v20);
  id v27 = sub_10003C614;
  uint64_t v28 = v2;
  aBlock = _NSConcreteStackBlock;
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_10003C028;
  id v26 = &unk_100056DE8;
  Swift::String v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v15 setInterruptionHandler:v21];
  _Block_release(v21);
  [v15 setExportedObject:*(void *)(v2 + 16)];
  [v15 resume];

  return 1;
}

void sub_10003BD64()
{
  uint64_t v0 = sub_100045A20();
  __chkstk_darwin(v0 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    uint64_t v15 = type metadata accessor for ServiceConnection();
    v14[0] = v2;
    swift_retain();
    id v3 = (id)AMSLogKey();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_100046140();
      uint64_t v7 = v6;

      sub_100045A10();
      v16._countAndFlagsBits = 0;
      v16._object = (void *)0xE000000000000000;
      sub_100045A00(v16);
      sub_1000062B0(v14, v15);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v12[0] = DynamicType;
      sub_1000459F0();
      sub_100008588((uint64_t)v12);
      v17._countAndFlagsBits = 5972026;
      v17._object = (void *)0xE300000000000000;
      sub_100045A00(v17);
      uint64_t MetatypeMetadata = &type metadata for String;
      v12[0] = v5;
      v12[1] = v7;
      sub_1000459F0();
      sub_100008588((uint64_t)v12);
      v9._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v18._countAndFlagsBits = 0;
      v18._object = (void *)0xE000000000000000;
      sub_100045A00(v18);
      sub_1000062B0(v14, v15);
      uint64_t v10 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v12[0] = v10;
      sub_1000459F0();
      sub_100008588((uint64_t)v12);
      v9._countAndFlagsBits = 58;
    }
    v9._object = (void *)0xE100000000000000;
    sub_100045A00(v9);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v14);
    sub_1000459D0();
    sub_100035648();
    swift_bridgeObjectRelease();
    Swift::String v11 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;
    swift_release();
  }
}

uint64_t sub_10003C028(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_10003C06C(uint64_t a1)
{
  uint64_t v2 = sub_100045A20();
  __chkstk_darwin(v2 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v15 = type metadata accessor for ServiceConnection();
  v14[0] = a1;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100046140();
    uint64_t v7 = v6;

    sub_100045A10();
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_100045A00(v16);
    sub_1000062B0(v14, v15);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v12[0] = DynamicType;
    sub_1000459F0();
    sub_100008588((uint64_t)v12);
    v17._countAndFlagsBits = 5972026;
    v17._object = (void *)0xE300000000000000;
    sub_100045A00(v17);
    uint64_t MetatypeMetadata = &type metadata for String;
    v12[0] = v5;
    v12[1] = v7;
    sub_1000459F0();
    sub_100008588((uint64_t)v12);
    v9._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v18._countAndFlagsBits = 0;
    v18._object = (void *)0xE000000000000000;
    sub_100045A00(v18);
    sub_1000062B0(v14, v15);
    uint64_t v10 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v12[0] = v10;
    sub_1000459F0();
    sub_100008588((uint64_t)v12);
    v9._countAndFlagsBits = 58;
  }
  v9._object = (void *)0xE100000000000000;
  sub_100045A00(v9);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v14);
  sub_1000459D0();
  sub_100035648();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003C2F4()
{
  swift_release();
  swift_release();

  return v0;
}

uint64_t sub_10003C324()
{
  sub_10003C2F4();
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
}

void *sub_10003C37C()
{
  type metadata accessor for ServiceConnectionExportedObject();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = v1 + OBJC_IVAR____TtC16UtilityExtension31ServiceConnectionExportedObject_serviceOptions;
  uint64_t v3 = type metadata accessor for ServiceOptions();
  sub_1000066FC(v2, 1, 1, v3);
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v1;
  return v0;
}

id sub_10003C3F0()
{
  *(void *)&v0[OBJC_IVAR____TtC16UtilityExtension20XPCServiceConnection_connectionListener] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t sub_10003C454(uint64_t a1, void **a2)
{
  if (qword_10005C488 != -1) {
    swift_once();
  }
  sub_10003B8A4(a2);
  return 1;
}

id sub_10003C514()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for XPCServiceConnection()
{
  return self;
}

unint64_t sub_10003C57C()
{
  unint64_t result = qword_10005E060;
  if (!qword_10005E060)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005E060);
  }
  return result;
}

uint64_t sub_10003C5BC()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003C5F4()
{
}

uint64_t sub_10003C5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003C60C()
{
  return swift_release();
}

uint64_t sub_10003C614()
{
  return sub_10003C06C(v0);
}

uint64_t sub_10003C61C(uint64_t a1)
{
  return sub_10003B544(a1, v1);
}

uint64_t sub_10003C634()
{
  uint64_t v0 = sub_100045A20();
  __chkstk_darwin(v0 - 8);
  sub_100042B7C();
  sub_1000454E0();
  return v2;
}

uint64_t sub_10003CA40()
{
  uint64_t v0 = sub_100045A20();
  __chkstk_darwin(v0 - 8);
  sub_100042B30();
  sub_1000454E0();
  return v2;
}

uint64_t sub_10003CE4C()
{
  return sub_100045FC0();
}

uint64_t sub_10003CE80(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_100045FA0();
  return swift_errorRelease();
}

Swift::Int sub_10003CED8()
{
  return sub_10000B6F8(*v0);
}

uint64_t sub_10003CEF4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v57 = a3;
  uint64_t v58 = a2;
  uint64_t v3 = sub_100005794(&qword_10005D348);
  __chkstk_darwin(v3 - 8);
  sub_100018C78();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100045A20();
  __chkstk_darwin(v7 - 8);
  sub_100018C78();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100005794(&qword_10005E1B8);
  __chkstk_darwin(v11 - 8);
  sub_100018C78();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for JSServiceRequest();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v15);
  __chkstk_darwin(v18);
  Swift::String v20 = (char *)&v51 - v19;
  sub_100045500();
  swift_allocObject();
  sub_1000454F0();
  sub_100042BC8();
  sub_1000454E0();
  uint64_t v52 = v17;
  uint64_t v53 = v6;
  uint64_t v54 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v10;
  swift_release();
  sub_1000066FC(v14, 0, 1, v15);
  uint64_t v58 = v20;
  sub_100042C18();
  type metadata accessor for JSDataProvider();
  sub_100045C20();
  sub_100045DE0();
  uint64_t v21 = v62[0];
  uint64_t v63 = &type metadata for DynamicUIFeatureFlags;
  Swift::String v64 = (void *)sub_100042C6C();
  LOBYTE(v15) = sub_1000456C0();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
  if (v15)
  {
    sub_100005794(&qword_10005CA98);
    uint64_t v22 = sub_100046000();
    sub_100005794((uint64_t *)&unk_10005E050);
    uint64_t v23 = sub_100045A70();
    sub_100008628(v23);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    uint64_t v63 = (ValueMetadata *)type metadata accessor for ServiceConnectionExportedObject();
    v62[0] = v56;
    swift_retain();
    id v24 = (id)AMSLogKey();
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = v21;
      uint64_t v27 = sub_100046140();
      uint64_t v29 = v28;

      sub_1000433E8();
      sub_100008658();
      sub_1000433B0();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10004343C(MetatypeMetadata);
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      sub_100015358();
      uint64_t v61 = &type metadata for String;
      uint64_t v59 = v27;
      uint64_t v60 = v29;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      v31._countAndFlagsBits = 93;
    }
    else
    {
      uint64_t v26 = v21;
      sub_100043404();
      sub_100008658();
      sub_1000433B0();
      uint64_t v40 = swift_getMetatypeMetadata();
      sub_10004343C(v40);
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      v31._countAndFlagsBits = 58;
    }
    v31._object = (void *)0xE100000000000000;
    sub_100045A00(v31);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
    sub_100043464();
    sub_100035648();
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_100046220();
    uint64_t v42 = v53;
    sub_1000066FC(v53, 1, 1, v41);
    sub_100042D2C();
    unint64_t v43 = (v52 + ((*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v45 = (void *)swift_allocObject();
    void v45[2] = 0;
    v45[3] = 0;
    v45[4] = v26;
    sub_100042C18();
    uint64_t v46 = v56;
    *(void *)((char *)v45 + v43) = v57;
    *(void *)((char *)v45 + v44) = v46;
    *(void *)((char *)v45 + ((v44 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10003DE78(v42, (uint64_t)&unk_10005E1D8, (uint64_t)v45);
    swift_release();
    swift_release();
    uint64_t v47 = (uint64_t)v58;
  }
  else
  {
    sub_100005794((uint64_t *)&unk_10005E050);
    uint64_t v32 = sub_100045A70();
    sub_100008628(v32);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
    uint64_t v63 = (ValueMetadata *)type metadata accessor for ServiceConnectionExportedObject();
    v62[0] = v56;
    swift_retain();
    id v33 = (id)AMSLogKey();
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = sub_100046140();
      uint64_t v37 = v36;

      sub_1000433E8();
      sub_100008658();
      sub_1000062B0(v62, (uint64_t)v63);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t v61 = (void *)swift_getMetatypeMetadata();
      uint64_t v59 = DynamicType;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      sub_100015358();
      uint64_t v61 = &type metadata for String;
      uint64_t v59 = v35;
      uint64_t v60 = v37;
      sub_1000459F0();
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      v39._countAndFlagsBits = 93;
    }
    else
    {
      sub_100043404();
      sub_100008658();
      sub_1000433B0();
      uint64_t v48 = swift_getMetatypeMetadata();
      sub_10004343C(v48);
      sub_10002B670((uint64_t)&v59, (uint64_t *)&unk_10005CCF0);
      v39._countAndFlagsBits = 58;
    }
    Swift::String v49 = v58;
    v39._object = (void *)0xE100000000000000;
    sub_100045A00(v39);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
    sub_100043464();
    sub_100035648();
    swift_bridgeObjectRelease();
    sub_100017988(v49);
    uint64_t v63 = (ValueMetadata *)sub_100045CC0();
    Swift::String v64 = &protocol witness table for SyncTaskScheduler;
    sub_100006A38(v62);
    swift_retain();
    sub_100045CB0();
    uint64_t v22 = sub_100045F40();
    swift_release();
    swift_release();
    swift_release();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v62);
    uint64_t v47 = (uint64_t)v49;
  }
  sub_100042CD4(v47, (void (*)(void))type metadata accessor for JSServiceRequest);
  return v22;
}

uint64_t sub_10003D6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[46] = a7;
  v8[47] = a8;
  sub_100045A20();
  v8[48] = swift_task_alloc();
  uint64_t v14 = (char *)&dword_10005CE80 + dword_10005CE80;
  uint64_t v12 = (void *)swift_task_alloc();
  v8[49] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10003D7F4;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v14)(v8 + 43, a5, a6, a4);
}

uint64_t sub_10003D7F4()
{
  sub_100043458();
  sub_100043398();
  uint64_t v2 = *v1;
  sub_100043420();
  *uint64_t v3 = v2;
  *(void *)(v4 + 400) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_10003DB68;
  }
  else {
    uint64_t v5 = sub_10003D8D8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10003D8D8()
{
  uint64_t v1 = v0[46];
  unint64_t v15 = v0[44];
  uint64_t v16 = v0[43];
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v2 = sub_100045A70();
  sub_100008628(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  v0[37] = type metadata accessor for ServiceConnectionExportedObject();
  v0[34] = v1;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100046140();
    uint64_t v7 = v6;

    sub_1000433E8();
    sub_100008658();
    sub_1000062B0(v0 + 34, v0[37]);
    uint64_t DynamicType = swift_getDynamicType();
    v0[21] = swift_getMetatypeMetadata();
    v0[18] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)(v0 + 18), (uint64_t *)&unk_10005CCF0);
    sub_100015358();
    v0[26] = v5;
    uint64_t v9 = (uint64_t)(v0 + 26);
    v0[29] = &type metadata for String;
    v0[27] = v7;
    sub_1000459F0();
    uint64_t v10 = 93;
  }
  else
  {
    sub_100043404();
    sub_100008658();
    sub_1000062B0(v0 + 34, v0[37]);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v0[22] = v11;
    uint64_t v9 = (uint64_t)(v0 + 22);
    v0[25] = MetatypeMetadata;
    sub_1000459F0();
    uint64_t v10 = 58;
  }
  sub_10002B670(v9, (uint64_t *)&unk_10005CCF0);
  v18._countAndFlagsBits = v10;
  v18._object = (void *)0xE100000000000000;
  sub_100045A00(v18);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)(v0 + 34));
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  v0[41] = v16;
  v0[42] = v15;
  sub_100045FC0();
  sub_1000282F4(v16, v15);
  swift_task_dealloc();
  sub_100043430();
  return v13();
}

uint64_t sub_10003DB68()
{
  uint64_t v1 = v0[46];
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v2 = sub_100045A70();
  sub_100008628(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  uint64_t v3 = type metadata accessor for ServiceConnectionExportedObject();
  v0[6] = v1;
  v0[9] = v3;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_100046140();
    uint64_t v8 = v7;

    sub_1000433E8();
    sub_100008658();
    sub_1000062B0(v0 + 6, v0[9]);
    uint64_t DynamicType = swift_getDynamicType();
    v0[5] = swift_getMetatypeMetadata();
    v0[2] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)(v0 + 2), (uint64_t *)&unk_10005CCF0);
    sub_100015358();
    v0[30] = v6;
    uint64_t v10 = (uint64_t)(v0 + 30);
    v0[33] = &type metadata for String;
    v0[31] = v8;
    sub_1000459F0();
    uint64_t v11 = 93;
  }
  else
  {
    sub_100043404();
    sub_100008658();
    sub_1000062B0(v0 + 6, v0[9]);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v0[10] = v12;
    uint64_t v10 = (uint64_t)(v0 + 10);
    v0[13] = MetatypeMetadata;
    sub_1000459F0();
    uint64_t v11 = 58;
  }
  sub_10002B670(v10, (uint64_t *)&unk_10005CCF0);
  v21._countAndFlagsBits = v11;
  v21._object = (void *)0xE100000000000000;
  sub_100045A00(v21);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)(v0 + 6));
  sub_1000459D0();
  swift_getErrorValue();
  uint64_t v14 = v0[38];
  uint64_t v15 = v0[39];
  v0[17] = v15;
  uint64_t v16 = sub_100006A38(v0 + 14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v16, v14, v15);
  sub_100045A40();
  sub_10002B670((uint64_t)(v0 + 14), (uint64_t *)&unk_10005CCF0);
  sub_100035680();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_100045540();
  sub_100045FA0();

  swift_errorRelease();
  swift_task_dealloc();
  sub_100043430();
  return v18();
}

uint64_t sub_10003DE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100046220();
  if (sub_10000678C(a1, 1, v6) == 1)
  {
    sub_10002B670(a1, &qword_10005D348);
  }
  else
  {
    sub_100046210();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100046200();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10003DFE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  Swift::String v31 = a3;
  uint64_t v34 = a1;
  uint64_t v4 = sub_1000459A0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005794(&qword_10005CE90);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045A20();
  __chkstk_darwin(v10 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v40 = type metadata accessor for ServiceConnectionExportedObject();
  *(void *)&long long v39 = a2;
  swift_retain();
  id v11 = (id)AMSLogKey();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100046140();
    uint64_t v15 = v14;

    sub_100045A10();
    v41._countAndFlagsBits = 0;
    v41._object = (void *)0xE000000000000000;
    sub_100045A00(v41);
    sub_1000062B0(&v39, v40);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    *(void *)&long long v37 = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
    v42._countAndFlagsBits = 5972026;
    v42._object = (void *)0xE300000000000000;
    sub_100045A00(v42);
    uint64_t MetatypeMetadata = &type metadata for String;
    *(void *)&long long v37 = v13;
    *((void *)&v37 + 1) = v15;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
    v17._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_100045A00(v43);
    sub_1000062B0(&v39, v40);
    uint64_t v18 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    *(void *)&long long v37 = v18;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
    v17._countAndFlagsBits = 58;
  }
  v17._object = (void *)0xE100000000000000;
  sub_100045A00(v17);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v39);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_1000459C0();
  uint64_t v19 = v33;
  sub_100045B00();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v19);
  sub_100045990();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
  if (MetatypeMetadata)
  {
    sub_10000684C(&v37, &v39);
    uint64_t v20 = self;
    sub_1000062B0(&v39, v40);
    uint64_t v21 = sub_1000465B0();
    *(void *)&long long v37 = 0;
    id v22 = [v20 dataWithJSONObject:v21 options:0 error:&v37];
    swift_unknownObjectRelease();
    id v23 = (id)v37;
    if (v22)
    {
      uint64_t v24 = sub_100045650();
      uint64_t v26 = v25;

      uint64_t result = _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v39);
      uint64_t v28 = v31;
      *Swift::String v31 = v24;
      v28[1] = v26;
    }
    else
    {
      uint64_t v30 = v23;
      sub_100045550();

      swift_willThrow();
      return _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v39);
    }
  }
  else
  {
    sub_10002B670((uint64_t)&v37, (uint64_t *)&unk_10005CCF0);
    sub_100042474();
    swift_allocError();
    *uint64_t v29 = 2;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10003E524()
{
  swift_release();
  sub_10002B670(v0 + OBJC_IVAR____TtC16UtilityExtension31ServiceConnectionExportedObject_serviceOptions, &qword_10005E190);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10003E598()
{
  return type metadata accessor for ServiceConnectionExportedObject();
}

uint64_t type metadata accessor for ServiceConnectionExportedObject()
{
  uint64_t result = qword_10005E0A0;
  if (!qword_10005E0A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003E5E8()
{
  sub_10003E684();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10003E684()
{
  if (!qword_10005E0B0)
  {
    type metadata accessor for ServiceOptions();
    unint64_t v0 = sub_100046350();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005E0B0);
    }
  }
}

void sub_10003E6DC(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11)
{
  uint64_t v161 = a8;
  uint64_t v160 = a7;
  uint64_t v170 = a5;
  id v171 = a6;
  uint64_t v152 = (void *)a4;
  unint64_t v155 = a3;
  uint64_t v154 = a2;
  id v151 = a1;
  uint64_t v150 = sub_100045620();
  uint64_t v11 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v13 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100045DD0();
  __chkstk_darwin(v14 - 8);
  uint64_t v144 = (char *)&v140 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100005794(&qword_10005E188);
  __chkstk_darwin(v149);
  uint64_t v157 = (uint64_t)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005794(&qword_10005E190);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v147 = (char *)&v140 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v148 = (char *)&v140 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v146 = (id **)((char *)&v140 - v23);
  __chkstk_darwin(v22);
  uint64_t v153 = (uint64_t)&v140 - v24;
  uint64_t v156 = type metadata accessor for ServiceOptions();
  uint64_t v25 = __chkstk_darwin(v156);
  uint64_t v143 = (uint64_t *)((char *)&v140 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v25);
  uint64_t v159 = (uint64_t)&v140 - v27;
  uint64_t v28 = sub_100045A20();
  __chkstk_darwin(v28 - 8);
  uint64_t v168 = swift_allocObject();
  *(void *)(v168 + 16) = a11;
  uint64_t v29 = sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v30 = *(void *)(sub_100045A70() - 8);
  uint64_t v31 = *(unsigned __int8 *)(v30 + 80);
  uint64_t v32 = (v31 + 32) & ~v31;
  uint64_t v172 = *(void *)(v30 + 72);
  uint64_t v33 = v32 + 2 * v172;
  uint64_t v165 = v29;
  uint64_t v163 = v31 | 7;
  uint64_t v34 = swift_allocObject();
  long long v164 = xmmword_1000478F0;
  *(_OWORD *)(v34 + 16) = xmmword_1000478F0;
  uint64_t v167 = v32;
  uint64_t v166 = type metadata accessor for ServiceConnectionExportedObject();
  uint64_t v174 = v166;
  uint64_t v173 = a10;
  _Block_copy(a11);
  swift_retain();
  id v35 = (id)AMSLogKey();
  uint64_t v169 = (void (**)(void, void *))a11;
  uint64_t v145 = v13;
  uint64_t v158 = v11;
  uint64_t v162 = v33;
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = sub_100046140();
    uint64_t v39 = v38;

    sub_100045A10();
    v179._countAndFlagsBits = 0;
    v179._object = (void *)0xE000000000000000;
    sub_100045A00(v179);
    sub_1000062B0(&v173, v174);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v180._countAndFlagsBits = 5972026;
    v180._object = (void *)0xE300000000000000;
    sub_100045A00(v180);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v176 = v37;
    uint64_t v177 = v39;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v41._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v181._countAndFlagsBits = 0;
    v181._object = (void *)0xE000000000000000;
    sub_100045A00(v181);
    sub_1000062B0(&v173, v174);
    uint64_t v42 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v42;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v41._countAndFlagsBits = 58;
  }
  v41._object = (void *)0xE100000000000000;
  sub_100045A00(v41);
  sub_100045A30();
  uint64_t v43 = type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
  uint64_t v44 = v43;
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  sub_100045500();
  swift_allocObject();
  sub_1000454F0();
  uint64_t v45 = sub_10003C634();
  uint64_t v47 = v46;
  swift_release();
  if (v47)
  {
    swift_allocObject();
    sub_1000454F0();
    uint64_t v48 = sub_10003CA40();
    uint64_t v50 = v49;
    swift_release();
    if (v50 == 1)
    {
      swift_bridgeObjectRelease();
      *(_OWORD *)(swift_allocObject() + 16) = v164;
      uint64_t v174 = v166;
      uint64_t v173 = a10;
      swift_retain();
      id v51 = (id)AMSLogKey();
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = sub_100046140();
        uint64_t v55 = v54;

        sub_100045A10();
        v182._countAndFlagsBits = 0;
        v182._object = (void *)0xE000000000000000;
        sub_100045A00(v182);
        sub_1000062B0(&v173, v174);
        uint64_t v56 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v56;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v183._countAndFlagsBits = 5972026;
        v183._object = (void *)0xE300000000000000;
        sub_100045A00(v183);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v176 = v53;
        uint64_t v177 = v55;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v57._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v187._countAndFlagsBits = 0;
        v187._object = (void *)0xE000000000000000;
        sub_100045A00(v187);
        sub_1000062B0(&v173, v174);
        uint64_t v90 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v90;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v57._countAndFlagsBits = 58;
      }
      v57._object = (void *)0xE100000000000000;
      sub_100045A00(v57);
      sub_100045A30();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
      sub_1000459D0();
      sub_100035680();
      swift_bridgeObjectRelease();
      sub_1000428EC();
      swift_allocError();
      char v92 = 1;
LABEL_25:
      *Swift::String v91 = v92;
      uint64_t v106 = (void *)sub_100045540();
      uint64_t v107 = v169;
      v169[2](v169, v106);

      swift_errorRelease();
      swift_release();
      Swift::String v89 = v107;
      goto LABEL_38;
    }
    sub_1000067B4(0, &qword_10005E1A0);
    uint64_t v65 = v154;
    unint64_t v66 = v155;
    sub_10000D5A0(v154, v155);
    id v171 = sub_10003FCD4(v65, v66);
    if (!v171)
    {
      swift_bridgeObjectRelease();
      sub_100042938(v48, v50);
      *(_OWORD *)(swift_allocObject() + 16) = v164;
      uint64_t v174 = v166;
      uint64_t v173 = a10;
      swift_retain();
      id v93 = (id)AMSLogKey();
      if (v93)
      {
        Swift::String v94 = v93;
        uint64_t v95 = sub_100046140();
        uint64_t v97 = v96;

        sub_100045A10();
        v188._countAndFlagsBits = 0;
        v188._object = (void *)0xE000000000000000;
        sub_100045A00(v188);
        sub_1000062B0(&v173, v174);
        uint64_t v98 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v98;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v189._countAndFlagsBits = 5972026;
        v189._object = (void *)0xE300000000000000;
        sub_100045A00(v189);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v176 = v95;
        uint64_t v177 = v97;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v99._countAndFlagsBits = 93;
      }
      else
      {
        sub_100045A10();
        v190._countAndFlagsBits = 0;
        v190._object = (void *)0xE000000000000000;
        sub_100045A00(v190);
        sub_1000062B0(&v173, v174);
        uint64_t v105 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v105;
        sub_1000459F0();
        sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
        v99._countAndFlagsBits = 58;
      }
      v99._object = (void *)0xE100000000000000;
      sub_100045A00(v99);
      sub_100045A30();
      _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
      sub_1000459D0();
      sub_100035680();
      swift_bridgeObjectRelease();
      sub_1000428EC();
      swift_allocError();
      char v92 = 2;
      goto LABEL_25;
    }
    uint64_t v161 = v47;
    uint64_t v154 = v45;
    uint64_t v160 = v44;
    uint64_t v67 = v48 & 1;
    uint64_t v68 = v156;
    uint64_t v69 = v159;
    uint64_t v70 = v159 + *(int *)(v156 + 32);
    uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v158 + 16);
    uint64_t v141 = a9;
    v158 += 16;
    uint64_t v140 = v71;
    ((void (*)(uint64_t))v71)(v70);
    id v72 = v151;
    id v73 = v171;
    *(void *)uint64_t v69 = v151;
    *(void *)(v69 + 8) = v73;
    uint64_t v170 = v48;
    long long v74 = v152;
    *(void *)(v69 + 16) = v152;
    uint64_t v142 = v67;
    *(unsigned char *)(v69 + 24) = v67;
    *(void *)(v69 + 32) = v50;
    uint64_t v75 = v68;
    uint64_t v76 = v153;
    sub_100042D2C();
    sub_1000066FC(v76, 0, 1, v68);
    uint64_t v77 = a10 + OBJC_IVAR____TtC16UtilityExtension31ServiceConnectionExportedObject_serviceOptions;
    swift_beginAccess();
    uint64_t v78 = v157;
    uint64_t v79 = v157 + *(int *)(v149 + 48);
    sub_10004294C(v76, v157);
    unint64_t v155 = v77;
    sub_10004294C(v77, v79);
    if (sub_10000678C(v78, 1, v75) == 1)
    {
      id v80 = v72;
      id v81 = v171;
      id v82 = v74;
      uint64_t v83 = v170;
      sub_1000429B4(v170, v50);
      sub_10002B670(v76, &qword_10005E190);
      if (sub_10000678C(v79, 1, v75) == 1)
      {
        sub_10002B670(v157, &qword_10005E190);
        uint64_t v84 = v161;
LABEL_31:
        if (*(void *)(a10 + 16))
        {
          swift_bridgeObjectRelease();
          sub_100042938(v83, v50);
        }
        else
        {
          uint64_t v124 = (uint64_t)v151;
          id v125 = v151;
          id v126 = v171;
          uint64_t v127 = (uint64_t)v144;
          sub_100045DA0();
          uint64_t v128 = (uint64_t)v145;
          v140(v145, v141, v150);
          type metadata accessor for ServiceBootstrap();
          swift_allocObject();
          uint64_t v129 = v124;
          Swift::String v130 = v152;
          sub_10003A36C(v129, v127, (uint64_t)v152, v154, v84, v142, v50, v128);
          id v131 = v130;
          uint64_t v132 = sub_10003A47C();
          swift_release();
          *(void *)(a10 + 16) = v132;
          swift_release();
        }
        if (*(void *)(a10 + 16))
        {
          uint64_t v133 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
          swift_retain();
          uint64_t v134 = (void *)sub_100046290();
          sub_100042780((uint64_t)sub_10003966C, 0, v134);
          swift_release();

          uint64_t v135 = (void *)swift_allocObject();
          v135[2] = a10;
          v135[3] = sub_10004337C;
          uint64_t v136 = v168;
          v135[4] = v168;
          uint64_t v137 = swift_allocObject();
          swift_weakInit();
          Swift::String v138 = (void *)swift_allocObject();
          v138[2] = v137;
          v138[3] = sub_10004337C;
          v138[4] = v136;
          swift_retain_n();
          swift_retain();
          swift_retain();
          uint64_t v139 = sub_100046290();
          uint64_t v174 = v133;
          uint64_t v175 = &protocol witness table for OS_dispatch_queue;
          uint64_t v173 = v139;
          sub_100045F60();

          swift_release();
          swift_release();
          swift_release();
          _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
          sub_100042CD4(v159, (void (*)(void))type metadata accessor for ServiceOptions);
          swift_release();
          swift_release();
        }
        else
        {
          sub_100042CD4(v159, (void (*)(void))type metadata accessor for ServiceOptions);
          swift_release();
        }
        Swift::String v89 = v169;
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v100 = v74;
      uint64_t v83 = v170;
      Swift::String v101 = v146;
      sub_10004294C(v78, (uint64_t)v146);
      if (sub_10000678C(v79, 1, v75) != 1)
      {
        uint64_t v108 = v143;
        sub_100042C18();
        id v109 = v72;
        id v110 = v171;
        id v111 = v100;
        sub_1000429B4(v83, v50);
        char v112 = sub_100043B60(v101, v108);
        sub_100042CD4((uint64_t)v108, (void (*)(void))type metadata accessor for ServiceOptions);
        sub_10002B670(v153, &qword_10005E190);
        sub_100042CD4((uint64_t)v101, (void (*)(void))type metadata accessor for ServiceOptions);
        sub_10002B670(v78, &qword_10005E190);
        uint64_t v84 = v161;
        if (v112) {
          goto LABEL_31;
        }
LABEL_27:
        *(_OWORD *)(swift_allocObject() + 16) = v164;
        uint64_t v174 = v166;
        uint64_t v173 = a10;
        swift_retain();
        id v113 = (id)AMSLogKey();
        if (v113)
        {
          uint64_t v114 = v113;
          uint64_t v115 = v83;
          uint64_t v170 = sub_100046140();
          uint64_t v117 = v116;

          sub_100045A10();
          v191._countAndFlagsBits = 0;
          v191._object = (void *)0xE000000000000000;
          sub_100045A00(v191);
          sub_1000062B0(&v173, v174);
          uint64_t v118 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v176 = v118;
          sub_1000459F0();
          sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
          v192._countAndFlagsBits = 5972026;
          v192._object = (void *)0xE300000000000000;
          sub_100045A00(v192);
          uint64_t MetatypeMetadata = &type metadata for String;
          uint64_t v176 = v170;
          uint64_t v177 = v117;
          sub_1000459F0();
          sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
          v119._countAndFlagsBits = 93;
        }
        else
        {
          uint64_t v115 = v83;
          sub_100045A10();
          v193._countAndFlagsBits = 0;
          v193._object = (void *)0xE000000000000000;
          sub_100045A00(v193);
          sub_1000062B0(&v173, v174);
          uint64_t v120 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v176 = v120;
          sub_1000459F0();
          sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
          v119._countAndFlagsBits = 58;
        }
        uint64_t v121 = (uint64_t)v147;
        v119._object = (void *)0xE100000000000000;
        sub_100045A00(v119);
        sub_100045A30();
        _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
        sub_1000459D0();
        sub_100035648();
        swift_bridgeObjectRelease();
        uint64_t v122 = (uint64_t)v148;
        sub_100042D2C();
        sub_1000066FC(v122, 0, 1, v156);
        sub_1000429C8(v122, v121);
        uint64_t v123 = v155;
        swift_beginAccess();
        sub_100042A30(v121, v123);
        swift_endAccess();
        *(void *)(a10 + 16) = 0;
        swift_release();
        uint64_t v83 = v115;
        goto LABEL_31;
      }
      id v102 = v72;
      id v103 = v171;
      id v104 = v100;
      sub_1000429B4(v83, v50);
      sub_10002B670(v153, &qword_10005E190);
      sub_100042CD4((uint64_t)v101, (void (*)(void))type metadata accessor for ServiceOptions);
    }
    sub_10002B670(v157, &qword_10005E188);
    uint64_t v84 = v161;
    goto LABEL_27;
  }
  *(_OWORD *)(swift_allocObject() + 16) = v164;
  uint64_t v174 = v166;
  uint64_t v173 = a10;
  swift_retain();
  id v58 = (id)AMSLogKey();
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = sub_100046140();
    uint64_t v62 = v61;

    sub_100045A10();
    v184._countAndFlagsBits = 0;
    v184._object = (void *)0xE000000000000000;
    sub_100045A00(v184);
    sub_1000062B0(&v173, v174);
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v63;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v185._countAndFlagsBits = 5972026;
    v185._object = (void *)0xE300000000000000;
    sub_100045A00(v185);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v176 = v60;
    uint64_t v177 = v62;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v64._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v186._countAndFlagsBits = 0;
    v186._object = (void *)0xE000000000000000;
    sub_100045A00(v186);
    sub_1000062B0(&v173, v174);
    uint64_t v85 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v85;
    sub_1000459F0();
    sub_10002B670((uint64_t)&v176, (uint64_t *)&unk_10005CCF0);
    v64._countAndFlagsBits = 58;
  }
  uint64_t v86 = v169;
  v64._object = (void *)0xE100000000000000;
  sub_100045A00(v64);
  sub_100045A30();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)&v173);
  sub_1000459D0();
  sub_100035680();
  swift_bridgeObjectRelease();
  sub_1000428EC();
  swift_allocError();
  *Swift::String v87 = 0;
  Swift::String v88 = (void *)sub_100045540();
  v86[2](v86, v88);

  swift_errorRelease();
  swift_release();
  Swift::String v89 = v86;
LABEL_38:
  _Block_release(v89);
}

id sub_10003FCD4(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_100045640().super.isa;
  id v6 = [v4 initWithData:isa];
  sub_1000282F4(a1, a2);

  return v6;
}

uint64_t sub_10003FD4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_100045A20();
  __chkstk_darwin(v5 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v18 = type metadata accessor for ServiceConnectionExportedObject();
  v17[0] = a2;
  swift_retain();
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100046140();
    uint64_t v10 = v9;

    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_100045A00(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v8;
    v15[1] = v10;
    sub_1000459F0();
    sub_10002B670((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_100045A00(v21);
    sub_1000062B0(v17, v18);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v13;
    sub_1000459F0();
    sub_10002B670((uint64_t)v15, (uint64_t *)&unk_10005CCF0);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_100045A00(v12);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v17);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  return a3(0);
}

uint64_t sub_100040010(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = sub_100045A20();
  __chkstk_darwin(v5 - 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    sub_100005794((uint64_t *)&unk_10005E050);
    sub_100045A70();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
    uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
    v20[0] = v7;
    swift_retain();
    id v8 = (id)AMSLogKey();
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = sub_100046140();
      uint64_t v12 = v11;

      sub_100045A10();
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      sub_100045A00(v22);
      sub_1000062B0(v20, v21);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = DynamicType;
      sub_1000459F0();
      sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
      v23._countAndFlagsBits = 5972026;
      v23._object = (void *)0xE300000000000000;
      sub_100045A00(v23);
      uint64_t MetatypeMetadata = &type metadata for String;
      v18[0] = v10;
      v18[1] = v12;
      sub_1000459F0();
      sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
      v14._countAndFlagsBits = 93;
    }
    else
    {
      sub_100045A10();
      v24._countAndFlagsBits = 0;
      v24._object = (void *)0xE000000000000000;
      sub_100045A00(v24);
      sub_1000062B0(v20, v21);
      uint64_t v15 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = v15;
      sub_1000459F0();
      sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
      v14._countAndFlagsBits = 58;
    }
    v14._object = (void *)0xE100000000000000;
    sub_100045A00(v14);
    sub_100045A30();
    type metadata accessor for Log();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
    sub_1000459D0();
    swift_getErrorValue();
    uint64_t v21 = v17;
    uint64_t v16 = sub_100006A38(v20);
    (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v16);
    sub_100045A40();
    sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
    sub_100035680();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 16) = 0;
    swift_release();
    a3(a1);
    return swift_release();
  }
  return result;
}

void sub_100040598(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_100045540();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_1000405FC(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v7 = sub_100045A20();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v28 = type metadata accessor for ServiceConnectionExportedObject();
  v27[0] = a3;
  _Block_copy(a4);
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v25 = a1;
    uint64_t v11 = sub_100046140();
    uint64_t v13 = v12;

    sub_100045A10();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_100045A00(v32);
    sub_1000062B0(v27, v28);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v30, (uint64_t *)&unk_10005CCF0);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_100045A00(v33);
    uint64_t MetatypeMetadata = &type metadata for String;
    v30[0] = v11;
    v30[1] = v13;
    a1 = v25;
    sub_1000459F0();
    sub_10002B670((uint64_t)v30, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_100045A00(v34);
    sub_1000062B0(v27, v28);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = v16;
    sub_1000459F0();
    sub_10002B670((uint64_t)v30, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_100045A00(v15);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v27);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  if (*(void *)(a3 + 16))
  {
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = a3;
    void v17[3] = a1;
    id v17[4] = a2;
    uint64_t v28 = sub_100045CC0();
    uint64_t v29 = &protocol witness table for SyncTaskScheduler;
    sub_100006A38(v27);
    swift_retain();
    swift_retain();
    sub_10000D5A0(a1, a2);
    sub_100045CB0();
    sub_100005794(&qword_10005CA98);
    sub_10004271C();
    sub_100045FB0();
    swift_release();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v27);
    uint64_t v18 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
    Swift::String v19 = (void *)sub_100046290();
    sub_100042780((uint64_t)sub_10003966C, 0, v19);

    Swift::String v20 = (void *)swift_allocObject();
    id v20[2] = a3;
    uint64_t v20[3] = sub_1000426C8;
    void v20[4] = v8;
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = a3;
    void v21[3] = sub_1000426C8;
    void v21[4] = v8;
    swift_retain_n();
    swift_retain_n();
    uint64_t v22 = sub_100046290();
    uint64_t v28 = v18;
    uint64_t v29 = &protocol witness table for OS_dispatch_queue;
    v27[0] = v22;
    sub_100045F60();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v27);
  }
  else
  {
    sub_100042474();
    swift_allocError();
    *Swift::String v23 = 0;
    Swift::String v24 = (void *)sub_100045540();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v24);

    swift_errorRelease();
  }
  swift_release();
  _Block_release(a4);
}

uint64_t sub_100040B8C(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_10003CEF4(a3, a4, *a1);
}

uint64_t sub_100040BC0(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void, void, void))
{
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v22 = type metadata accessor for ServiceConnectionExportedObject();
  v21[0] = a2;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100046140();
    uint64_t v12 = a3;
    uint64_t v14 = v13;

    sub_100045A10();
    v23._countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    sub_100045A00(v23);
    sub_1000062B0(v21, v22);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v19[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v19, (uint64_t *)&unk_10005CCF0);
    v24._countAndFlagsBits = 5972026;
    v24._object = (void *)0xE300000000000000;
    sub_100045A00(v24);
    uint64_t MetatypeMetadata = &type metadata for String;
    v19[0] = v11;
    v19[1] = v14;
    a3 = v12;
    sub_1000459F0();
    sub_10002B670((uint64_t)v19, (uint64_t *)&unk_10005CCF0);
    v16._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_100045A00(v25);
    sub_1000062B0(v21, v22);
    uint64_t v17 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v19[0] = v17;
    sub_1000459F0();
    sub_10002B670((uint64_t)v19, (uint64_t *)&unk_10005CCF0);
    v16._countAndFlagsBits = 58;
  }
  v16._object = (void *)0xE100000000000000;
  sub_100045A00(v16);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v21);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  return a3(v7, v8, 0);
}

uint64_t sub_100040EBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, unint64_t, uint64_t))
{
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
  v20[0] = a2;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_100045A00(v22);
    sub_1000062B0(v20, v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_100045A00(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v9;
    v18[1] = v11;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_100045A00(v24);
    sub_1000062B0(v20, v21);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v14;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
  sub_100045A10();
  v25._object = (void *)0x800000010004B510;
  v25._countAndFlagsBits = 0xD000000000000015;
  sub_100045A00(v25);
  swift_getErrorValue();
  uint64_t v21 = v17;
  Swift::String v15 = sub_100006A38(v20);
  (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v15);
  sub_1000459F0();
  sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_100045A00(v26);
  sub_100045A30();
  sub_100035648();
  swift_bridgeObjectRelease();
  return a3(0, 0xF000000000000000, a1);
}

void sub_1000412C8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_100045540();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = sub_100045640().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_100041360(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100045A20();
  __chkstk_darwin(v4 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v16 = type metadata accessor for ServiceConnectionExportedObject();
  v15[0] = a1;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100046140();
    uint64_t v9 = v8;

    sub_100045A10();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_100045A00(v17);
    sub_1000062B0(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_100045A00(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v7;
    v13[1] = v9;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v15, v16);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v12;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_100045A00(v11);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v15);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  a2[2](a2, 0);
  _Block_release(a2);
}

void sub_100041644(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100045A20();
  __chkstk_darwin(v4 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v16 = type metadata accessor for ServiceConnectionExportedObject();
  v15[0] = a1;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100046140();
    uint64_t v9 = v8;

    sub_100045A10();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_100045A00(v17);
    sub_1000062B0(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_100045A00(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v7;
    v13[1] = v9;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100045A00(v19);
    sub_1000062B0(v15, v16);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v12;
    sub_1000459F0();
    sub_10002B670((uint64_t)v13, (uint64_t *)&unk_10005CCF0);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_100045A00(v11);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v15);
  sub_1000459D0();
  sub_100035648();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = 0;
  swift_release();
  a2[2](a2, 0);
  _Block_release(a2);
}

uint64_t sub_100041934(int a1, int a2, void *aBlock, void (*a4)(uint64_t, void *))
{
  id v5 = _Block_copy(aBlock);
  _Block_copy(v5);
  uint64_t v6 = swift_retain();
  a4(v6, v5);
  _Block_release(v5);
  return swift_release();
}

void sub_1000419A0(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  if (*(void *)(a2 + 16))
  {
    uint64_t v7 = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
    _Block_copy(a3);
    swift_retain();
    uint64_t v8 = (void *)sub_100046290();
    sub_100042780((uint64_t)sub_10003966C, 0, v8);

    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = a1;
    v9[3] = a2;
    void v9[4] = sub_10004246C;
    v9[5] = v6;
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a2;
    v10[3] = sub_10004246C;
    v10[4] = v6;
    id v11 = a1;
    swift_retain_n();
    swift_retain_n();
    void v14[3] = v7;
    void v14[4] = &protocol witness table for OS_dispatch_queue;
    v14[0] = sub_100046290();
    sub_100045F60();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v14);
    swift_release();
    _Block_release(a3);
  }
  else
  {
    sub_100042474();
    swift_allocError();
    *uint64_t v12 = 0;
    _Block_copy(a3);
    Swift::String v13 = (void *)sub_100045540();
    ((void (**)(void, void *))a3)[2](a3, v13);

    swift_errorRelease();
    swift_release();
    _Block_release(a3);
  }
}

void sub_100041C30(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  type metadata accessor for DynamicAccountsStore();
  sub_100045C20();
  sub_100045DE0();
  uint64_t v7 = DynamicAccountsStore.account.getter();
  id v8 = objc_msgSend(v7, "ams_DSID");

  id v18 = a2;
  DynamicAccountsStore.account.setter(a2);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047880;
  Swift::String v23 = (void *)type metadata accessor for ServiceConnectionExportedObject();
  v22[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100046140();
    uint64_t v13 = v12;

    sub_100045A10();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_100045A00(v24);
    sub_1000062B0(v22, (uint64_t)v23);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
    v25._countAndFlagsBits = 5972026;
    v25._object = (void *)0xE300000000000000;
    sub_100045A00(v25);
    uint64_t MetatypeMetadata = &type metadata for String;
    v20[0] = v11;
    v20[1] = v13;
    sub_1000459F0();
    sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_100045A00(v26);
    sub_1000062B0(v22, (uint64_t)v23);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = v16;
    sub_1000459F0();
    sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_100045A00(v15);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v22);
  sub_1000459D0();
  v22[0] = 0x203A646C6FLL;
  v22[1] = 0xE500000000000000;
  v20[0] = v8;
  id v17 = v8;
  sub_100005794(&qword_10005E178);
  v27._countAndFlagsBits = sub_100046190();
  sub_1000461B0(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0x203A77656E20;
  v28._object = (void *)0xE600000000000000;
  sub_1000461B0(v28);
  v20[0] = objc_msgSend(v18, "ams_DSID");
  v29._countAndFlagsBits = sub_100046190();
  sub_1000461B0(v29);
  swift_bridgeObjectRelease();
  Swift::String v23 = &type metadata for String;
  sub_100045A60();
  sub_10002B670((uint64_t)v22, (uint64_t *)&unk_10005CCF0);
  sub_100035648();
  swift_bridgeObjectRelease();
  a4(0);
  swift_release();
}

uint64_t sub_10004205C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = sub_100045A20();
  __chkstk_darwin(v6 - 8);
  sub_100005794((uint64_t *)&unk_10005E050);
  sub_100045A70();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000478F0;
  uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
  v20[0] = a2;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_100046140();
    uint64_t v11 = v10;

    sub_100045A10();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_100045A00(v22);
    sub_1000062B0(v20, v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_100045A00(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v9;
    v18[1] = v11;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_100045A10();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_100045A00(v24);
    sub_1000062B0(v20, v21);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v14;
    sub_1000459F0();
    sub_10002B670((uint64_t)v18, (uint64_t *)&unk_10005CCF0);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_100045A00(v13);
  sub_100045A30();
  type metadata accessor for Log();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v20);
  sub_100045A10();
  v25._object = (void *)0x800000010004B4B0;
  v25._countAndFlagsBits = 0xD000000000000017;
  sub_100045A00(v25);
  swift_getErrorValue();
  uint64_t v21 = v17;
  Swift::String v15 = sub_100006A38(v20);
  (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v15);
  sub_1000459F0();
  sub_10002B670((uint64_t)v20, (uint64_t *)&unk_10005CCF0);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_100045A00(v26);
  sub_100045A30();
  sub_100035648();
  swift_bridgeObjectRelease();
  return a3(a1);
}

uint64_t sub_100042434()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10004246C(uint64_t a1)
{
  sub_100040598(a1, *(void *)(v1 + 16));
}

unint64_t sub_100042474()
{
  unint64_t result = qword_10005E170;
  if (!qword_10005E170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E170);
  }
  return result;
}

uint64_t sub_1000424C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10004259C;
  return v6(a1);
}

uint64_t sub_10004259C()
{
  sub_100043458();
  sub_100043398();
  uint64_t v1 = *v0;
  sub_100043420();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100043430();
  return v3();
}

uint64_t sub_100042660()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000426A8(uint64_t a1)
{
  sub_100041C30(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32));
}

uint64_t sub_1000426B8(uint64_t a1)
{
  return sub_10004205C(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_1000426C8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1000412C8(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1000426D0()
{
  swift_release();
  sub_1000282F4(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100042710(uint64_t *a1)
{
  return sub_100040B8C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_10004271C()
{
  unint64_t result = qword_10005E180;
  if (!qword_10005E180)
  {
    sub_10000D210(&qword_10005CA98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E180);
  }
  return result;
}

uint64_t sub_100042770()
{
  return sub_10003CE4C();
}

uint64_t sub_100042780(uint64_t a1, uint64_t a2, void *a3)
{
  v10[3] = sub_1000067B4(0, (unint64_t *)&qword_10005CA10);
  v10[4] = &protocol witness table for OS_dispatch_queue;
  v10[0] = a3;
  id v6 = a3;
  uint64_t v7 = sub_100046000();
  id v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  swift_retain_n();
  swift_retain();
  sub_100045F60();
  swift_release();
  swift_release();
  _s16UtilityExtension9JSAccountVwxx_0((uint64_t)v10);
  return v7;
}

uint64_t sub_1000428A4(uint64_t *a1)
{
  return sub_100040BC0(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, void, void))(v1 + 24));
}

uint64_t sub_1000428B4(uint64_t a1)
{
  return sub_100040EBC(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, unint64_t, uint64_t))(v1 + 24));
}

uint64_t sub_1000428C0()
{
  return sub_100042770();
}

uint64_t sub_1000428CC(uint64_t a1)
{
  return sub_10003CE80(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

unint64_t sub_1000428EC()
{
  unint64_t result = qword_10005E198;
  if (!qword_10005E198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E198);
  }
  return result;
}

uint64_t sub_100042938(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10004294C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005E190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000429B4(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000429C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005E190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042A30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005794(&qword_10005E190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042A9C(uint64_t a1)
{
  return sub_10003FD4C(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t sub_100042AA8()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100042AE4()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100042B24(uint64_t a1)
{
  return sub_100040010(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

unint64_t sub_100042B30()
{
  unint64_t result = qword_10005E1A8;
  if (!qword_10005E1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1A8);
  }
  return result;
}

unint64_t sub_100042B7C()
{
  unint64_t result = qword_10005E1B0;
  if (!qword_10005E1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1B0);
  }
  return result;
}

unint64_t sub_100042BC8()
{
  unint64_t result = qword_10005E1C0;
  if (!qword_10005E1C0)
  {
    type metadata accessor for JSServiceRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1C0);
  }
  return result;
}

uint64_t sub_100042C18()
{
  uint64_t v2 = sub_100043484();
  v3(v2);
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

unint64_t sub_100042C6C()
{
  unint64_t result = qword_10005E1C8;
  if (!qword_10005E1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10005E1C8);
  }
  return result;
}

uint64_t sub_100042CB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003DFE8(a1, v2, a2);
}

uint64_t sub_100042CD4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10001DBE8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100042D2C()
{
  uint64_t v2 = sub_100043484();
  v3(v2);
  sub_10001DBE8();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_100042D80()
{
  uint64_t v1 = (int *)(type metadata accessor for JSServiceRequest() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[8];
  uint64_t v6 = sub_100045620();
  if (!sub_10000678C(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_release();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, ((((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100042ED8(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for JSServiceRequest();
  sub_100008628(v4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v10 = (*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v1[4];
  uint64_t v15 = (uint64_t)v1 + v9;
  uint64_t v16 = *(void *)((char *)v1 + v10);
  uint64_t v17 = *(void *)((char *)v1 + v11);
  uint64_t v18 = *(void *)((char *)v1 + ((v11 + 15) & 0xFFFFFFFFFFFFFFF8));
  Swift::String v19 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v19;
  void *v19 = v2;
  v19[1] = sub_100043008;
  return sub_10003D6F4(a1, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sub_100043008()
{
  sub_100043458();
  sub_100043398();
  uint64_t v1 = *v0;
  sub_100043420();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100043430();
  return v3();
}

uint64_t sub_1000430C8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100043100(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100043008;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005E1E0 + dword_10005E1E0);
  return v6(a1, v4);
}

ValueMetadata *type metadata accessor for ServiceConnectionExportedObject.BootstrapError()
{
  return &type metadata for ServiceConnectionExportedObject.BootstrapError;
}

unsigned char *_s16UtilityExtension31ServiceConnectionExportedObjectC14BootstrapErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10004329CLL);
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

ValueMetadata *type metadata accessor for ServiceConnectionExportedObject.PerformError()
{
  return &type metadata for ServiceConnectionExportedObject.PerformError;
}

unint64_t sub_1000432D8()
{
  unint64_t result = qword_10005E1F0;
  if (!qword_10005E1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1F0);
  }
  return result;
}

unint64_t sub_100043328()
{
  unint64_t result = qword_10005E1F8;
  if (!qword_10005E1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1F8);
  }
  return result;
}

uint64_t sub_1000433B0()
{
  sub_1000062B0((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t sub_1000433E8()
{
  return sub_100045A10();
}

uint64_t sub_100043404()
{
  return sub_100045A10();
}

uint64_t sub_100043430()
{
  return v0 + 8;
}

uint64_t sub_10004343C(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return sub_1000459F0();
}

uint64_t sub_100043464()
{
  return sub_1000459D0();
}

uint64_t sub_100043484()
{
  return 0;
}

char *sub_100043498(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unsigned int v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    unsigned int v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    a1[24] = *((unsigned char *)a2 + 24);
    *((void *)a1 + 4) = a2[4];
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_100045620();
    unint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    uint64_t v12 = v4;
    swift_unknownObjectRetain();
    uint64_t v13 = v6;
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_1000435AC(id *a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_100045620();
  unsigned int v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_10004363C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  unsigned int v6 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100045620();
  unint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v5;
  swift_unknownObjectRetain();
  id v13 = v6;
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_100043704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v9 = *(void **)(a2 + 16);
  uint64_t v10 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v9;
  id v11 = v9;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_1000437E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10004386C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRelease();
  uint64_t v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100045620();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100043930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100043944);
}

uint64_t sub_100043944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100045620();
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    return sub_10000678C(v9, a2, v8);
  }
}

uint64_t sub_1000439CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000439E0);
}

uint64_t sub_1000439E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100045620();
    uint64_t v8 = v5 + *(int *)(a4 + 32);
    return sub_1000066FC(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ServiceOptions()
{
  uint64_t result = qword_10005E258;
  if (!qword_10005E258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100043AA8()
{
  uint64_t result = sub_100045620();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100043B60(id **a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ServiceOptions();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (id *)((char *)&v57 - v9);
  uint64_t v11 = __chkstk_darwin(v8);
  __chkstk_darwin(v11);
  sub_1000441F8();
  uint64_t v62 = v12;
  sub_10002EC88();
  __chkstk_darwin(v13);
  sub_1000441F8();
  uint64_t v61 = v14;
  sub_10002EC88();
  __chkstk_darwin(v15);
  sub_1000441F8();
  uint64_t v60 = v16;
  sub_10002EC88();
  __chkstk_darwin(v17);
  sub_1000441F8();
  uint64_t v64 = v18;
  sub_10002EC88();
  uint64_t v20 = __chkstk_darwin(v19);
  Swift::String v22 = (id *)((char *)&v57 - v21);
  uint64_t v23 = __chkstk_darwin(v20);
  Swift::String v25 = (id *)((char *)&v57 - v24);
  uint64_t v26 = __chkstk_darwin(v23);
  Swift::String v28 = (id *)((char *)&v57 - v27);
  Swift::String v29 = *a1;
  uint64_t v30 = *a2;
  uint64_t v63 = v31;
  if (!v29)
  {
    if (!v30)
    {
      uint64_t v57 = v26;
      sub_1000440E4((uint64_t)a1, (uint64_t)&v57 - v27);
      sub_1000440E4((uint64_t)a2, (uint64_t)v25);
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (!v30)
  {
LABEL_6:
    sub_1000440E4((uint64_t)a1, (uint64_t)&v57 - v27);
    sub_1000440E4((uint64_t)a2, (uint64_t)v25);
    goto LABEL_7;
  }
  uint64_t v57 = v26;
  sub_1000067B4(0, (unint64_t *)&qword_10005C6E0);
  uint64_t v30 = (uint64_t)(id)v30;
  Swift::String v32 = v29;
  Swift::String v29 = v10;
  Swift::String v33 = v32;
  char v34 = sub_100046310();

  uint64_t v10 = v29;
  sub_1000440E4((uint64_t)a1, (uint64_t)v28);
  sub_1000440E4((uint64_t)a2, (uint64_t)v25);
  if ((v34 & 1) == 0)
  {
LABEL_7:
    sub_100044148((uint64_t)v28);
    sub_100044148((uint64_t)v25);
    sub_1000440E4((uint64_t)a1, (uint64_t)v22);
    sub_1000441A4();
    goto LABEL_8;
  }
LABEL_14:
  id v58 = v10;
  uint64_t v59 = v7;
  id v39 = [v28[1] profile];
  uint64_t v40 = sub_100046140();
  uint64_t v42 = v41;

  Swift::String v29 = (id *)[v25[1] profile];
  uint64_t v43 = sub_100046140();
  uint64_t v45 = v44;

  if (v40 == v43 && v42 == v45)
  {
    swift_bridgeObjectRelease_n();
    sub_100044148((uint64_t)v28);
    sub_100044148((uint64_t)v25);
    sub_1000440E4((uint64_t)a1, (uint64_t)v22);
    sub_1000441A4();
    uint64_t v10 = v58;
    uint64_t v7 = v59;
    goto LABEL_21;
  }
  uint64_t v30 = sub_1000465C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100044148((uint64_t)v28);
  sub_100044148((uint64_t)v25);
  sub_1000440E4((uint64_t)a1, (uint64_t)v22);
  sub_1000441A4();
  uint64_t v10 = v58;
  uint64_t v7 = v59;
  if ((v30 & 1) == 0)
  {
LABEL_8:
    sub_100044148((uint64_t)v22);
    sub_100044148((uint64_t)v29);
    sub_1000441DC();
    sub_1000441C0();
    goto LABEL_9;
  }
LABEL_21:
  id v47 = [v22[1] profileVersion];
  uint64_t v48 = sub_100046140();
  uint64_t v50 = v49;

  id v51 = [v29[1] profileVersion];
  uint64_t v30 = sub_100046140();
  Swift::String v28 = v52;

  if (v48 == v30 && v50 == v28)
  {
    swift_bridgeObjectRelease_n();
    sub_100044148((uint64_t)v22);
    sub_100044148(v64);
    sub_1000441DC();
    sub_1000441C0();
    goto LABEL_28;
  }
  char v54 = sub_1000465C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100044148((uint64_t)v22);
  sub_100044148(v64);
  sub_1000441DC();
  sub_1000441C0();
  if ((v54 & 1) == 0)
  {
LABEL_9:
    sub_100044148(v30);
    sub_100044148((uint64_t)v28);
    uint64_t v35 = v62;
    sub_1000440E4((uint64_t)a1, v62);
    uint64_t v36 = v63;
    sub_1000440E4((uint64_t)a2, v63);
LABEL_10:
    sub_100044148(v35);
    sub_100044148(v36);
    sub_1000440E4((uint64_t)a1, (uint64_t)v10);
    sub_1000440E4((uint64_t)a2, (uint64_t)v7);
    goto LABEL_11;
  }
LABEL_28:
  sub_1000067B4(0, &qword_10005E2A0);
  char v55 = sub_100046310();
  sub_100044148(v30);
  sub_100044148((uint64_t)v28);
  uint64_t v35 = v62;
  sub_1000440E4((uint64_t)a1, v62);
  uint64_t v36 = v63;
  sub_1000440E4((uint64_t)a2, v63);
  if ((v55 & 1) == 0) {
    goto LABEL_10;
  }
  char v56 = static MetricsContext.== infix(_:_:)(*(unsigned __int8 *)(v35 + 24), *(void *)(v35 + 32), *(unsigned __int8 *)(v36 + 24), *(void *)(v36 + 32));
  sub_100044148(v35);
  sub_100044148(v36);
  sub_1000440E4((uint64_t)a1, (uint64_t)v10);
  sub_1000440E4((uint64_t)a2, (uint64_t)v7);
  if (v56)
  {
    char v37 = sub_1000455D0();
    goto LABEL_12;
  }
LABEL_11:
  char v37 = 0;
LABEL_12:
  sub_100044148((uint64_t)v7);
  sub_100044148((uint64_t)v10);
  return v37 & 1;
}

uint64_t sub_1000440E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100044148(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ServiceOptions();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000441A4()
{
  uint64_t v3 = *(void *)(v1 - 88);
  return sub_1000440E4(v0, v3);
}

uint64_t sub_1000441C0()
{
  uint64_t v3 = *(void *)(v1 - 112);
  return sub_1000440E4(v0, v3);
}

uint64_t sub_1000441DC()
{
  uint64_t v3 = *(void *)(v1 - 120);
  return sub_1000440E4(v0, v3);
}

void sub_100044204()
{
  sub_1000445EC();
  if (qword_10005C488 != -1) {
    swift_once();
  }
  if (sub_10003B410())
  {
    sub_1000445C0();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_1000442F0;
    void v2[3] = &unk_100057200;
    _Block_copy(v2);
    sub_1000445A4();
    uint64_t v1 = swift_release();
    sub_1000445D0(v1, "handleWithAuthenticateRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_1000442F4()
{
  sub_1000445EC();
  if (qword_10005C488 != -1) {
    swift_once();
  }
  if (sub_10003B410())
  {
    sub_1000445C0();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_1000442F0;
    void v2[3] = &unk_1000571D8;
    _Block_copy(v2);
    sub_1000445A4();
    uint64_t v1 = swift_release();
    sub_1000445D0(v1, "handleWithDialogRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_1000443E0()
{
  sub_1000445EC();
  if (qword_10005C488 != -1) {
    swift_once();
  }
  if (sub_10003B410())
  {
    sub_1000445C0();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_1000442F0;
    void v2[3] = &unk_1000571B0;
    _Block_copy(v2);
    sub_1000445A4();
    uint64_t v1 = swift_release();
    sub_1000445D0(v1, "handleWithEngagementRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_1000444CC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t type metadata accessor for ServiceRequestHandler()
{
  return self;
}

uint64_t sub_10004457C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004458C()
{
  return swift_release();
}

uint64_t sub_1000445A4()
{
  return swift_retain();
}

id sub_1000445D0(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2, v4);
}

void sub_1000445FC()
{
  sub_1000450C8();
  uint64_t v2 = sub_100044F90();
  __chkstk_darwin(v2 - 8);
  sub_100008640();
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v3 = sub_100045A70();
  sub_100008628(v3);
  *(_OWORD *)(sub_100044F10() + 16) = xmmword_100047880;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100046140();
    sub_100044F68();
    sub_1000433E8();
    sub_100008658();
    sub_100044FB4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100045074(MetatypeMetadata);
    sub_100008588((uint64_t)v8);
    sub_100015358();
    sub_100044F3C((uint64_t)&type metadata for String);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_100043404();
    sub_100008658();
    sub_100045010();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100045090(v6);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_100045A00(v5);
  sub_100045A30();
  type metadata accessor for Log();
  sub_1000450E0();
  sub_1000459D0();
  uint64_t v10 = sub_1000067B4(0, (unint64_t *)&unk_10005E460);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_1000450AC();
  sub_100008588((uint64_t)&v9);
  sub_100035648();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045C20();
  sub_100044FEC();
  sub_100045048();
  sub_100044204();
  swift_release();
  sub_10004505C();
}

#error "100044834: call analysis failed (funcsize=17)"

void sub_100044844()
{
  sub_1000450C8();
  uint64_t v2 = sub_100044F90();
  __chkstk_darwin(v2 - 8);
  sub_100008640();
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v3 = sub_100045A70();
  sub_100008628(v3);
  *(_OWORD *)(sub_100044F10() + 16) = xmmword_100047880;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100046140();
    sub_100044F68();
    sub_1000433E8();
    sub_100008658();
    sub_100044FB4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100045074(MetatypeMetadata);
    sub_100008588((uint64_t)v8);
    sub_100015358();
    sub_100044F3C((uint64_t)&type metadata for String);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_100043404();
    sub_100008658();
    sub_100045010();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100045090(v6);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_100045A00(v5);
  sub_100045A30();
  type metadata accessor for Log();
  sub_1000450E0();
  sub_1000459D0();
  uint64_t v10 = sub_1000067B4(0, &qword_10005E458);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_1000450AC();
  sub_100008588((uint64_t)&v9);
  sub_100035648();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045C20();
  sub_100044FEC();
  sub_100045048();
  sub_1000442F4();
  swift_release();
  sub_10004505C();
}

#error "100044A7C: call analysis failed (funcsize=17)"

void sub_100044A8C()
{
  sub_1000450C8();
  uint64_t v2 = sub_100044F90();
  __chkstk_darwin(v2 - 8);
  sub_100008640();
  sub_100005794((uint64_t *)&unk_10005E050);
  uint64_t v3 = sub_100045A70();
  sub_100008628(v3);
  *(_OWORD *)(sub_100044F10() + 16) = xmmword_100047880;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100046140();
    sub_100044F68();
    sub_1000433E8();
    sub_100008658();
    sub_100044FB4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100045074(MetatypeMetadata);
    sub_100008588((uint64_t)v8);
    sub_100015358();
    sub_100044F3C((uint64_t)&type metadata for String);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_100043404();
    sub_100008658();
    sub_100045010();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100045090(v6);
    sub_100008588((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_100045A00(v5);
  sub_100045A30();
  type metadata accessor for Log();
  sub_1000450E0();
  sub_1000459D0();
  uint64_t v10 = sub_1000067B4(0, &qword_10005E450);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_1000450AC();
  sub_100008588((uint64_t)&v9);
  sub_100035648();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045C20();
  sub_100044FEC();
  sub_100045048();
  sub_1000443E0();
  swift_release();
  sub_10004505C();
}

#error "100044CC4: call analysis failed (funcsize=17)"

uint64_t sub_100044CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(void))
{
  sub_1000450C8();
  Swift::String v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  Swift::String v28 = v27;
  uint64_t v30 = _Block_copy(v29);
  *(void *)(swift_allocObject() + 16) = v30;
  id v31 = v26;
  id v32 = v24;
  id v33 = v22;
  id v34 = v28;
  a21();

  sub_10004505C();
  return swift_release();
}

void sub_100044D98()
{
}

void sub_100044DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100045540();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_100044E48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for URLSessionHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for URLSessionHandler()
{
  return self;
}

uint64_t sub_100044EB0()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100044EE8(uint64_t a1, uint64_t a2)
{
  sub_100044DC8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100044F10()
{
  return swift_allocObject();
}

uint64_t sub_100044F3C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 120) = a1;
  *(void *)(v3 - 144) = v1;
  *(void *)(v3 - 136) = v2;
  return sub_1000459F0();
}

void sub_100044F68()
{
  *(void *)(v2 - 152) = v0;
}

uint64_t sub_100044F90()
{
  return sub_100045A20();
}

uint64_t sub_100044FB4()
{
  sub_1000062B0((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_100044FEC()
{
  return sub_100045DE0();
}

uint64_t sub_100045010()
{
  sub_1000062B0((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_100045048()
{
  return v0;
}

uint64_t sub_100045074(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000459F0();
}

uint64_t sub_100045090(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000459F0();
}

uint64_t sub_1000450AC()
{
  return sub_100045A40();
}

uint64_t sub_1000450E0()
{
  return _s16UtilityExtension9JSAccountVwxx_0(v0 - 112);
}

uint64_t sub_100045100()
{
  uint64_t v0 = swift_allocObject();
  sub_100045138();
  return v0;
}

uint64_t sub_100045138()
{
  setenv("JSC_criticalGCMemoryThreshold", "0.25", 1);
  setenv("JavaScriptCoreUseJIT", "0", 1);
  return v0;
}

id sub_100045180@<X0>(void *a1@<X8>)
{
  id result = [objc_allocWithZone((Class)type metadata accessor for UtilityExtensionConfiguration()) init];
  *a1 = result;
  return result;
}

id sub_1000451B8@<X0>(void *a1@<X8>)
{
  return sub_100045180(a1);
}

uint64_t sub_1000451D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100045100();
  *a1 = result;
  return result;
}

uint64_t sub_1000451F8(void **a1)
{
  if (qword_10005C488 != -1) {
    swift_once();
  }
  return sub_10003B8A4(a1) & 1;
}

id sub_10004525C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UtilityExtensionConfiguration();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000452B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UtilityExtensionConfiguration();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000452E8(void **a1)
{
  return sub_1000451F8(a1) & 1;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for UtilityExtension()
{
  return self;
}

uint64_t type metadata accessor for UtilityExtensionConfiguration()
{
  return self;
}

uint64_t sub_1000453D8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100050620, 1);
}

uint64_t sub_1000453F4()
{
  return sub_10004543C((unint64_t *)&unk_10005E540, (void (*)(void))type metadata accessor for UtilityExtensionConfiguration);
}

uint64_t sub_10004543C(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100045480()
{
  return URLRequest.httpMethod.setter();
}

Class sub_100045490()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_1000454A0()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

void sub_1000454B0(Swift::String _, Swift::String forHTTPHeaderField)
{
}

uint64_t sub_1000454C0()
{
  return URLRequest.httpBody.setter();
}

uint64_t sub_1000454D0()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_1000454E0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000454F0()
{
  return JSONDecoder.init()();
}

uint64_t sub_100045500()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100045510()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100045520()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100045530()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100045540()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100045550()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100045560()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100045570()
{
  return URL.pathExtension.getter();
}

uint64_t sub_100045580()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100045590()
{
  return URL.init(fileURLWithPath:)();
}

void sub_1000455A0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000455B0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_1000455C0()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_1000455D0()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_1000455E0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000455F0()
{
  return URL.path.getter();
}

uint64_t sub_100045600()
{
  return URL.init(string:)();
}

uint64_t sub_100045610()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100045620()
{
  return type metadata accessor for URL();
}

uint64_t sub_100045630()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100045640()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100045650()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045660()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100045670()
{
  return type metadata accessor for Date();
}

uint64_t sub_100045680()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100045690()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000456A0()
{
  return UUID.init()();
}

uint64_t sub_1000456B0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000456C0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000456D0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000456E0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000456F0()
{
  return OpenAIAuthenticator.BillingPlan.workspaceID.getter();
}

uint64_t sub_100045700()
{
  return type metadata accessor for OpenAIAuthenticator.BillingPlan.Category();
}

uint64_t sub_100045710()
{
  return OpenAIAuthenticator.BillingPlan.category.getter();
}

uint64_t sub_100045720()
{
  return OpenAIAuthenticator.BillingPlan.planName.getter();
}

uint64_t sub_100045730()
{
  return type metadata accessor for OpenAIAuthenticator.BillingPlan();
}

uint64_t sub_100045740()
{
  return OpenAIAuthenticator.Credentials.billingPlan.getter();
}

uint64_t sub_100045750()
{
  return OpenAIAuthenticator.Credentials.expirationDate.getter();
}

uint64_t sub_100045760()
{
  return OpenAIAuthenticator.Credentials.email.getter();
}

uint64_t sub_100045770()
{
  return OpenAIAuthenticator.Credentials.userName.getter();
}

uint64_t sub_100045780()
{
  return type metadata accessor for OpenAIAuthenticator.Credentials();
}

uint64_t sub_100045790()
{
  return OpenAIAuthenticator.credentials.getter();
}

uint64_t sub_1000457B0()
{
  return OpenAIAuthenticator.startSignInSession(redirectURI:)();
}

uint64_t sub_1000457C0()
{
  return static OpenAIAuthenticator.shared.getter();
}

uint64_t sub_1000457D0()
{
  return OpenAIAuthenticator.Session.authorizationURL.getter();
}

uint64_t sub_1000457E0()
{
  return type metadata accessor for OpenAIAuthenticator.Session();
}

uint64_t sub_100045800()
{
  return type metadata accessor for OpenAIAuthenticator();
}

uint64_t sub_100045810()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_100045820()
{
  return DiskJetPackLoader.init(signingPolicy:keyProvider:)();
}

uint64_t sub_100045830()
{
  return static DiskJetPackLoader.sharedUnpackQueue.getter();
}

uint64_t sub_100045840()
{
  return DiskJetPackLoader.bundle(from:baseURL:automaticallyCleanUp:on:)();
}

uint64_t sub_100045850()
{
  return type metadata accessor for DiskJetPackLoader();
}

uint64_t sub_100045860()
{
  return static DiskJetPackResourceBundle.cleanUpOldSessions(baseURL:)();
}

uint64_t sub_100045870()
{
  return DiskJetPackResourceBundle.memoryMappedSource(atPath:virtualMachine:cacheURL:)();
}

uint64_t sub_100045880()
{
  return DiskJetPackResourceBundle.fileData(atPath:)();
}

uint64_t sub_100045890()
{
  return type metadata accessor for DiskJetPackResourceBundle();
}

uint64_t sub_1000458A0()
{
  return type metadata accessor for JetPackSigningPolicy();
}

uint64_t sub_1000458B0()
{
  return JetPackFileStreamSource.init(path:)();
}

uint64_t sub_1000458C0()
{
  return type metadata accessor for JetPackFileStreamSource();
}

uint64_t sub_1000458D0()
{
  return JetPackManagedKeyProvider.init()();
}

uint64_t sub_1000458E0()
{
  return type metadata accessor for JetPackManagedKeyProvider();
}

uint64_t sub_1000458F0()
{
  return static JetPackPath.sourcePath.getter();
}

uint64_t sub_100045900()
{
  return type metadata accessor for JetPackPath();
}

uint64_t sub_100045910()
{
  return JetPackPath.init(_:)();
}

uint64_t sub_100045920()
{
  return type metadata accessor for JetEngineBootstrap.URLProtocolHandler();
}

uint64_t sub_100045930()
{
  return JSCallable.call(_:)();
}

uint64_t sub_100045940()
{
  return type metadata accessor for JSCallable();
}

uint64_t sub_100045950()
{
  return JSONObject.dictionary.getter();
}

uint64_t sub_100045960()
{
  return JSONObject.init(deserializing:)();
}

uint64_t sub_100045970()
{
  return JSONObject.url.getter();
}

uint64_t sub_100045980()
{
  return JSONObject.string.getter();
}

uint64_t sub_100045990()
{
  return JSONObject.untyped.getter();
}

uint64_t sub_1000459A0()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_1000459B0()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_1000459C0()
{
  return JSResponse.body.getter();
}

uint64_t sub_1000459D0()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_1000459E0()
{
  return static LogMessage.isRedactionEnabled.getter();
}

uint64_t sub_1000459F0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

void sub_100045A00(Swift::String a1)
{
}

uint64_t sub_100045A10()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100045A20()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_100045A30()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_100045A40()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_100045A50()
{
  return static LogMessage.describe(contentsOf:withRedaction:separator:)();
}

uint64_t sub_100045A60()
{
  return static LogMessage.sensitive(_:)();
}

uint64_t sub_100045A70()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_100045A80()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_100045A90()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_100045AA0()
{
  return static IntentModel<>.kind.getter();
}

uint64_t sub_100045AB0()
{
  return JSONContext.init()();
}

uint64_t sub_100045AC0()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_100045AD0()
{
  return PipelineTask.mapTaskOutput<A>(_:)();
}

uint64_t sub_100045AE0()
{
  return PipelineTask.mapTaskOutput<A>(_:)();
}

uint64_t sub_100045AF0()
{
  return PipelineTask.andThen<A>(_:)();
}

uint64_t sub_100045B00()
{
  return CoarselyTimed.contained.getter();
}

uint64_t sub_100045B10()
{
  return type metadata accessor for JetpackBundle.Resource();
}

uint64_t sub_100045B20()
{
  return type metadata accessor for JetpackBundle();
}

uint64_t sub_100045B30()
{
  return static PipelinePhase.cacheValueIfSuccessful()();
}

uint64_t sub_100045B40()
{
  return PipelinePhase.init(mapOutput:)();
}

uint64_t sub_100045B50()
{
  return PipelinePhase.init(mapOutput:)();
}

uint64_t sub_100045B60()
{
  return static PipelinePhase<>.urlForResource(_:)();
}

uint64_t sub_100045B70()
{
  return static PipelinePhase<>.fetchJetpack(artifactStoreURL:urlSession:urlEncoder:)();
}

uint64_t sub_100045B80()
{
  return static PipelinePhase<>.unpackJetpack(keyURLs:bundleOutputURL:artifactStoreURL:verifySignature:)();
}

uint64_t sub_100045B90()
{
  return static PipelinePhase<>.rateLimitOnFailure(on:withID:using:)();
}

uint64_t sub_100045BA0()
{
  return JSIntentResult.jsonObject.getter();
}

uint64_t sub_100045BB0()
{
  return type metadata accessor for JSIntentResult();
}

uint64_t sub_100045BC0()
{
  return JSONDictionary.bridgedPrimitiveValues<A, B>()();
}

uint64_t sub_100045BD0()
{
  return type metadata accessor for JSONDictionary();
}

uint64_t sub_100045BE0()
{
  return BaseObjectGraph.init(name:dependencies:)();
}

uint64_t sub_100045BF0()
{
  return dispatch thunk of BaseObjectGraph.name.setter();
}

uint64_t sub_100045C00()
{
  return static BaseObjectGraph.build(withName:)();
}

uint64_t sub_100045C10()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_100045C20()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t sub_100045C30()
{
  return BaseObjectGraph.deinit();
}

uint64_t sub_100045C40()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_100045C50()
{
  return type metadata accessor for JSRequestIntent();
}

uint64_t sub_100045C60()
{
  return JSRequestIntent.init(_:timeout:)();
}

uint64_t sub_100045C70()
{
  return dispatch thunk of MapPipelineTask.run()();
}

uint64_t sub_100045C80()
{
  return JSBytecodeSource.init(fileURL:sourceURL:cacheURL:virtualMachine:)();
}

uint64_t sub_100045C90()
{
  return type metadata accessor for JSBytecodeSource();
}

uint64_t sub_100045CA0()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_100045CB0()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_100045CC0()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_100045CD0()
{
  return static RunLoopWorkerThread.current.getter();
}

uint64_t sub_100045CE0()
{
  return type metadata accessor for RunLoopWorkerThread();
}

uint64_t sub_100045CF0()
{
  return type metadata accessor for DependencyDictionary();
}

uint64_t sub_100045D00()
{
  return static JitterPipelineBackoff.forJavaScriptLoading.getter();
}

uint64_t sub_100045D10()
{
  return type metadata accessor for JitterPipelineBackoff();
}

uint64_t sub_100045D20()
{
  return dispatch thunk of AsyncObjectGraphBuilder.makeObjectGraph()();
}

uint64_t sub_100045D30()
{
  return dispatch thunk of AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045D40()
{
  return AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045D50()
{
  return AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045D60()
{
  return AsyncObjectGraphBuilder.withDependenciesSatisfied.getter();
}

uint64_t sub_100045D70()
{
  return CustomJSValueConvertible.jsRepresentation(in:)();
}

JSValue sub_100045D80(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

uint64_t sub_100045D90()
{
  return Bag.amsBag.getter();
}

uint64_t sub_100045DA0()
{
  return Bag.init(from:)();
}

uint64_t sub_100045DB0()
{
  return Bag.Value.promise()();
}

uint64_t sub_100045DC0()
{
  return Bag.subscript.getter();
}

uint64_t sub_100045DD0()
{
  return type metadata accessor for Bag();
}

uint64_t sub_100045DE0()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_100045DF0()
{
  return JSError.constructorName.getter();
}

uint64_t sub_100045E00()
{
  return JSError.line.getter();
}

uint64_t sub_100045E10()
{
  return JSError.column.getter();
}

uint64_t sub_100045E20()
{
  return JSError.init(message:line:column:sourceURL:constructorName:)();
}

uint64_t sub_100045E30()
{
  return JSError.message.getter();
}

uint64_t sub_100045E40()
{
  return JSError.init(badValue:expected:)();
}

JSValue sub_100045E50(JSContext in)
{
  return JSError.makeValue(in:)(in);
}

uint64_t sub_100045E60()
{
  return JSError.sourceURL.getter();
}

uint64_t sub_100045E70()
{
  return type metadata accessor for JSError();
}

uint64_t sub_100045E80()
{
  return JSRoute.init(service:function:)();
}

uint64_t sub_100045E90()
{
  return type metadata accessor for JSRoute();
}

uint64_t sub_100045EA0()
{
  return type metadata accessor for JSStack.Prerequisite();
}

uint64_t sub_100045EB0()
{
  return JSStack.performRequest(_:)();
}

uint64_t sub_100045EC0()
{
  return JSStack.withUnsafeContext(_:)();
}

void sub_100045ED0()
{
}

void sub_100045EE0()
{
}

uint64_t sub_100045EF0()
{
  return static JSStack.StandardGlobalConfiguration.default.getter();
}

uint64_t sub_100045F00()
{
  return type metadata accessor for JSStack.StandardGlobalConfiguration();
}

uint64_t sub_100045F10()
{
  return JSStack.__allocating_init(asPartOf:virtualMachine:configuration:customPrerequisites:)();
}

uint64_t sub_100045F30()
{
  return type metadata accessor for JSStack();
}

uint64_t sub_100045F40()
{
  return Promise.map<A>(on:_:)();
}

uint64_t sub_100045F50()
{
  return Promise.join<A>(with:)();
}

uint64_t sub_100045F60()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_100045F70()
{
  return Promise.__allocating_init(error:)();
}

uint64_t sub_100045F80()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_100045F90()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_100045FA0()
{
  return Promise.reject(_:)();
}

uint64_t sub_100045FB0()
{
  return Promise.flatMap<A>(on:_:)();
}

uint64_t sub_100045FC0()
{
  return Promise.resolve(_:)();
}

uint64_t sub_100045FD0()
{
  return Promise<A>.withDependenciesSatisfied.getter();
}

uint64_t sub_100045FE0()
{
  return Promise<A>.toAMSPromise(on:)();
}

uint64_t sub_100045FF0()
{
  return Promise<A>.init(_:)();
}

uint64_t sub_100046000()
{
  return Promise.__allocating_init()();
}

uint64_t sub_100046010()
{
  return JSSource.init(code:sourceURL:)();
}

uint64_t sub_100046020()
{
  return type metadata accessor for JSSource();
}

uint64_t sub_100046030()
{
  return JSSource.init(_:file:)();
}

uint64_t sub_100046040()
{
  return static Pipeline.start<A>(with:)();
}

uint64_t sub_100046050()
{
  return type metadata accessor for Unstable.Accounts();
}

uint64_t sub_100046060()
{
  return Unstable.Accounts.init(_:)();
}

uint64_t sub_100046070()
{
  return JSPromise.init(in:executor:)();
}

uint64_t sub_100046080()
{
  return JSPromise.value.getter();
}

uint64_t sub_100046090()
{
  return type metadata accessor for JSPromise();
}

uint64_t sub_1000460A0()
{
  return JSRequest.init(route:timeoutInterval:version:)();
}

uint64_t sub_1000460B0()
{
  return JSRequest.addOption(_:withName:)();
}

uint64_t sub_1000460C0()
{
  return type metadata accessor for JSRequest();
}

NSDictionary sub_1000460D0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000460E0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000460F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100046100()
{
  return String.init(contentsOf:)();
}

NSString sub_100046110()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100046120()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100046130()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100046140()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100046150()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100046160()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100046170()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100046180()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100046190()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000461A0()
{
  return String.hash(into:)();
}

void sub_1000461B0(Swift::String a1)
{
}

Swift::Int sub_1000461C0()
{
  return String.UTF16View._foreignCount()();
}

uint64_t sub_1000461D0()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

NSArray sub_1000461E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000461F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100046200()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100046210()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100046220()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100046230()
{
  return static AMSURLSession.forJetEngineStorefront(with:for:usingProtocol:)();
}

uint64_t sub_100046240()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100046250()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100046260()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100046270()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100046280()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100046290()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000462A0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_1000462B0()
{
  return JSValue.int.getter();
}

uint64_t sub_1000462C0()
{
  return JSValue.BOOL.getter();
}

uint64_t sub_1000462D0()
{
  return JSValue.string.getter();
}

uint64_t sub_1000462E0()
{
  return JSValue.subscript.getter();
}

uint64_t sub_1000462F0()
{
  return JSValue.subscript.setter();
}

Swift::Int sub_100046300(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100046310()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100046320()
{
  return static JSContext.requiredCurrent.getter();
}

uint64_t sub_100046330()
{
  return JSContext.propagateErrorsToExceptions(_:)();
}

uint64_t sub_100046340()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100046350()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100046360()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100046370()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100046380()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100046390()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000463A0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000463B0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000463C0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000463D0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_1000463E0()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_1000463F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100046400()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100046410()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100046420()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100046430()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100046440()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100046450()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100046460(Swift::Int a1)
{
}

uint64_t sub_100046470()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100046480()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100046490()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000464A0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000464B0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000464C0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_1000464D0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_1000464E0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_1000464F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100046500()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100046510()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100046530()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046540()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046550()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046560()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_100046570()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100046580()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100046590()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000465A0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000465B0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000465C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000465D0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000465E0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000465F0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100046600()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100046610()
{
  return Error._code.getter();
}

uint64_t sub_100046620()
{
  return Error._domain.getter();
}

uint64_t sub_100046630()
{
  return Error._userInfo.getter();
}

uint64_t sub_100046640()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100046650()
{
  return Hasher.init(_seed:)();
}

void sub_100046660(Swift::UInt a1)
{
}

Swift::Int sub_100046670()
{
  return Hasher._finalize()();
}

uint64_t sub_100046680()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100046690()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AMSError()
{
  return _AMSError();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}