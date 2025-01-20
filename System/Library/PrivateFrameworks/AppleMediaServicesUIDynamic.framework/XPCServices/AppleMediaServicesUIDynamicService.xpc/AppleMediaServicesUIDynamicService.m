uint64_t deviceIsRunningInternalBuild()
{
  return _os_variant_has_internal_content("com.apple.AppleMediaServicesUIDynamic");
}

uint64_t deviceIsRunningSeedBuild()
{
  return 0;
}

void sub_100002D88(id a1)
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

  v4 = (void *)qword_10005E588;
  qword_10005E588 = (uint64_t)v3;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

id variable initialization expression of AccountsWrapper.accessLock()
{
  id v0 = objc_allocWithZone((Class)NSLock);

  return [v0 init];
}

uint64_t sub_100003110()
{
  return sub_100003544(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003140()
{
  return sub_1000032CC();
}

Swift::Int sub_100003148()
{
  return sub_1000088A4();
}

uint64_t sub_100003150()
{
  return sub_100003544(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100003188@<X0>(void *a1@<X8>)
{
  NSString result = sub_10000350C();
  *a1 = result;
  return result;
}

uint64_t sub_1000031B0()
{
  return sub_100008918();
}

uint64_t sub_1000031BC@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100045C00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003204@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100003230(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003234(uint64_t a1)
{
  uint64_t v2 = sub_10000339C((unint64_t *)&qword_10005C4C0);
  uint64_t v3 = sub_10000339C(&qword_10005C4C8);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000032CC()
{
  sub_100045C30();
  sub_100045C90();

  return swift_bridgeObjectRelease();
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_100003334()
{
  return sub_10000339C(&qword_10005C4A8);
}

uint64_t sub_100003368()
{
  return sub_10000339C(&qword_10005C4B0);
}

uint64_t sub_10000339C(unint64_t *a1)
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

uint64_t sub_1000033E0()
{
  return sub_10000339C(&qword_10005C4B8);
}

uint64_t sub_100003414(uint64_t a1, id *a2)
{
  uint64_t result = sub_100045C10();
  *a2 = 0;
  return result;
}

uint64_t sub_10000348C(uint64_t a1, id *a2)
{
  char v3 = sub_100045C20();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_10000350C()
{
  sub_100045C30();
  NSString v0 = sub_100045C00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100003544(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_100045C30();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void type metadata accessor for AMSMediaTaskType(uint64_t a1)
{
}

void sub_100003598(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t _s34AppleMediaServicesUIDynamicService20DynamicAccountsStoreC8_account33_1170E4F383B7D8D94FF5572A95601FACLLSo9ACAccountCSgvpfi_0()
{
  return 0;
}

id sub_1000035EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
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
  NSString v10 = sub_100045C00();
  if (v8) {
LABEL_3:
  }
    NSString v8 = sub_100045C00();
LABEL_4:
  NSString v11 = sub_100045C00();
  id v12 = objc_msgSend(v7, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v10, a3, v8, v11);

  return v12;
}

uint64_t sub_1000036B8(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 isUndefined]) {
    return 0;
  }
  uint64_t v4 = (void *)sub_100045E00();
  uint64_t v5 = sub_100045DF0();
  uint64_t v7 = v6;

  if (!v7) {
    return 0;
  }
  NSString v8 = (void *)sub_100045E00();
  int v9 = sub_100045DE0();

  if (v9 == 2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  BOOL v11 = v5 == 0x73656E755469 && v7 == 0xE600000000000000;
  if (v11
    || (sub_100003A24() & 1) != 0
    || (v5 == 0x64756F6C4369 ? (BOOL v12 = v7 == 0xE600000000000000) : (BOOL v12 = 0),
        v12 || (sub_100003A24() & 1) != 0 || (v5 == 1936548969 ? (BOOL v23 = v7 == 0xE400000000000000) : (BOOL v23 = 0), v23)))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v24 = sub_100003A24();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      return 0;
    }
  }
  id v13 = [objc_allocWithZone((Class)NSNumberFormatter) init];
  v14 = (void *)sub_100045E00();
  sub_100045DF0();
  uint64_t v16 = v15;

  if (v16)
  {
    NSString v17 = sub_100045C00();
    swift_bridgeObjectRelease();
    id v18 = [v13 numberFromString:v17];
  }
  else
  {
    id v18 = 0;
  }
  v19 = (void *)sub_100045E00();
  sub_100045DF0();

  v20 = (void *)sub_100045E00();
  sub_100045DF0();

  uint64_t v21 = sub_1000039E0();
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(a3 + 16))(v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

id sub_1000039BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_1000035EC(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1000039E0()
{
  return sub_100045C30();
}

uint64_t sub_100003A24()
{
  return sub_1000460F0();
}

uint64_t sub_100003A40()
{
  return sub_100003EC0(v0, (SEL *)&selRef_username);
}

id sub_100003A64()
{
  return objc_msgSend(v0, "ams_isiTunesAccount");
}

id sub_100003A88()
{
  return objc_msgSend(v0, "ams_isiCloudAccount");
}

id sub_100003AAC()
{
  return objc_msgSend(v0, "ams_isIDMSAccount");
}

uint64_t sub_100003AD0()
{
  return sub_100003EC0(v0, (SEL *)&selRef_ams_altDSID);
}

uint64_t sub_100003AF4()
{
  return sub_100003EC0(v0, (SEL *)&selRef_ams_creditsString);
}

id sub_100003B18()
{
  id v1 = objc_msgSend(v0, "ams_DSID");

  return v1;
}

uint64_t sub_100003B50()
{
  return sub_100003EC0(v0, (SEL *)&selRef_ams_firstName);
}

uint64_t sub_100003B74()
{
  return sub_100003EC0(v0, (SEL *)&selRef_ams_lastName);
}

uint64_t sub_100003B98()
{
  return sub_100003EC0(v0, (SEL *)&selRef_ams_storefront);
}

uint64_t sub_100003BBC()
{
  id v1 = objc_msgSend(v0, "ams_isBundleOwner");
  if (!v1) {
    return 2;
  }
  uint64_t v2 = v1;
  id v3 = [v1 BOOLValue];

  return (uint64_t)v3;
}

id sub_100003C18()
{
  return objc_msgSend(v0, "ams_isLocalAccount");
}

id sub_100003C3C()
{
  return objc_msgSend(v0, "ams_isSandboxAccount");
}

uint64_t sub_100003C60()
{
  return sub_100003F20(v0);
}

unint64_t sub_100003C68()
{
  return (unint64_t)sub_100003A64() & 1;
}

unint64_t sub_100003C90()
{
  return (unint64_t)sub_100003A88() & 1;
}

unint64_t sub_100003CB8()
{
  return (unint64_t)sub_100003AAC() & 1;
}

unint64_t sub_100003CE0()
{
  return (unint64_t)sub_100003D08() & 1;
}

id sub_100003D08()
{
  return [v0 isActive];
}

uint64_t sub_100003D2C()
{
  return sub_100003AD0();
}

uint64_t sub_100003D50()
{
  return sub_100003AF4();
}

id sub_100003D74()
{
  return sub_100003B18();
}

uint64_t sub_100003D98()
{
  return sub_100003B50();
}

uint64_t sub_100003DBC()
{
  return sub_100003B74();
}

uint64_t sub_100003DE0()
{
  return sub_100003B98();
}

uint64_t sub_100003E04()
{
  return sub_100003A40();
}

uint64_t sub_100003E28()
{
  return sub_100003C60();
}

uint64_t sub_100003E4C()
{
  return sub_100003BBC();
}

unint64_t sub_100003E70()
{
  return (unint64_t)sub_100003C18() & 1;
}

unint64_t sub_100003E98()
{
  return (unint64_t)sub_100003C3C() & 1;
}

uint64_t sub_100003EC0(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_100045C30();

  return v4;
}

uint64_t sub_100003F20(void *a1)
{
  id v1 = objc_msgSend(a1, "ams_privacyAcknowledgement");
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_100003F90();
  uint64_t v3 = sub_100045BD0();

  return v3;
}

unint64_t sub_100003F90()
{
  unint64_t result = qword_10005C4D8;
  if (!qword_10005C4D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C4D8);
  }
  return result;
}

void *sub_100003FD0(void *a1)
{
  id v2 = (void *)sub_100045E00();
  uint64_t v3 = sub_100004968(v2);
  if (v3)
  {
    sub_100004090(v3);
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = (void *)sub_100045E00();
  uint64_t v5 = sub_100004968(v4);
  if (v5)
  {
    uint64_t v6 = sub_1000041D8(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void *sub_100004090(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  BOOL v12 = &_swiftEmptyArrayStorage;
  sub_10000449C(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_1000049D0(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000449C(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000449C((char *)(v5 > 1), v6 + 1, 1);
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

void *sub_1000041D8(uint64_t a1)
{
  unint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100045FD0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_1000049D0(i, (uint64_t)v5);
    sub_100003F90();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_100045FB0();
    sub_100045FE0();
    sub_100045FF0();
    sub_100045FC0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void *sub_1000042D4(uint64_t a1)
{
  return sub_100004314(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_1000044DC, &qword_10005C4F0);
}

void *sub_1000042F4(uint64_t a1)
{
  return sub_100004314(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_10000450C, &qword_10005C500);
}

void *sub_100004314(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v14 = &_swiftEmptyArrayStorage;
  a2(0, v6, 0);
  uint64_t v7 = &_swiftEmptyArrayStorage;
  if (v6)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_1000049D0(i, (uint64_t)v13);
      sub_100004A2C(a3);
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

void *sub_100004470@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = sub_100003FD0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

char *sub_10000449C(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000453C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1000044BC(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000463C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1000044DC(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000474C(a1, a2, a3, *v3, &qword_10005C4F8, &qword_10005C4F0);
  *uint64_t v3 = result;
  return result;
}

void *sub_10000450C(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000474C(a1, a2, a3, *v3, &qword_10005C508, &qword_10005C500);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000453C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004A2C(&qword_10005C4E0);
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

char *sub_10000463C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004A2C(&qword_10005C4E8);
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

void *sub_10000474C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
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
    sub_100004A2C(a5);
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
    sub_100004A2C(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

uint64_t sub_100004870(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000048A0(a1, a2, a3, (void (*)(void))&type metadata accessor for JSStack.Prerequisite);
}

uint64_t sub_100004888(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000048A0(a1, a2, a3, (void (*)(void))type metadata accessor for JSSourceInfo);
}

uint64_t sub_1000048A0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a3 < a1
    || (uint64_t result = ((uint64_t (*)(void))a4)(0), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    uint64_t v10 = sub_100004C4C();
    return _swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    uint64_t v9 = sub_100004C4C();
    return _swift_arrayInitWithTakeBackToFront(v9);
  }
  return result;
}

uint64_t sub_100004968(void *a1)
{
  id v2 = [a1 toArray];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100045CE0();

  return v3;
}

uint64_t sub_1000049D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004A2C(uint64_t *a1)
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

void *_s34AppleMediaServicesUIDynamicService15AppQueryRequestVwCP_0(void *a1, void *a2)
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

uint64_t sub_100004C4C()
{
  return v0;
}

id sub_100004C60(void *a1, uint64_t a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_100005A4C(0, (unint64_t *)&unk_10005CC70);
    Class isa = sub_100045CD0().super.isa;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = a2;
    size_t v14 = sub_100004F04;
    uint64_t v15 = v7;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_100005370;
    id v13 = &unk_100055950;
    char v8 = _Block_copy(v12);
    swift_bridgeObjectRetain();
    swift_release();
    id v9 = [(objc_class *)isa ams_mapWithTransformIgnoresNil:v8];
    _Block_release(v8);

    uint64_t v10 = sub_100045CE0();
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    id v13 = (void *)sub_100004A2C(&qword_10005C518);
    v12[0] = v10;
    id v11 = a1;
    id result = sub_100025D08(v12, a1);
    if (result)
    {
      sub_100045E10();
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

void sub_100004E2C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1000049D0(a1, (uint64_t)v5);
  sub_100005A4C(0, (unint64_t *)&unk_10005CC70);
  swift_dynamicCast();
  uint64_t v3 = sub_100004F0C(v4);
  a2[3] = sub_100004A2C(&qword_10005C4F0);

  *a2 = v3;
}

uint64_t sub_100004ECC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004F04(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_100004F0C(void *a1)
{
  sub_100004A2C(&qword_10005C520);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v33 - v5;
  sub_100004A2C(&qword_10005C528);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000471C0;
  *(void *)(inited + 32) = 0x6449656C646E7562;
  *(void *)(inited + 40) = 0xE800000000000000;
  id v8 = [a1 bundleID];
  uint64_t v9 = sub_100045C30();
  uint64_t v11 = v10;

  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v11;
  uint64_t v36 = sub_100045BE0();
  uint64_t v12 = sub_100003EC0(a1, (SEL *)&selRef_bundleShortVersion);
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
  sub_10000558C((uint64_t)&v34, 0xD000000000000012, 0x8000000100049060);
  uint64_t v14 = sub_100003EC0(a1, (SEL *)&selRef_bundleVersion);
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
  sub_10000558C((uint64_t)&v34, 0x6556656C646E7562, 0xED00006E6F697372);
  id v16 = [a1 installError];
  if (v16)
  {
    NSString v17 = v16;
    swift_getErrorValue();
    uint64_t v18 = sub_100046120();
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
  sub_10000558C((uint64_t)&v34, 0x456C6C6174736E69, 0xEC000000726F7272);
  id v21 = [a1 installID];
  if (v21)
  {
    uint64_t v22 = v21;
    sub_100045150();

    uint64_t v23 = sub_100045170();
    uint64_t v24 = (uint64_t)v4;
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v23 = sub_100045170();
    uint64_t v24 = (uint64_t)v4;
    uint64_t v25 = 1;
  }
  sub_100005994(v24, v25, 1, v23);
  sub_1000059BC((uint64_t)v4, (uint64_t)v6);
  sub_100045170();
  if (sub_100005A24((uint64_t)v6, 1, v23) == 1)
  {
    sub_100005A88((uint64_t)v6, &qword_10005C520);
    long long v34 = 0u;
    long long v35 = 0u;
  }
  else
  {
    uint64_t v26 = sub_100045140();
    *((void *)&v35 + 1) = &type metadata for String;
    *(void *)&long long v34 = v26;
    *((void *)&v34 + 1) = v27;
    (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v6, v23);
  }
  sub_10000558C((uint64_t)&v34, 0x496C6C6174736E69, 0xE900000000000044);
  unsigned __int8 v28 = [a1 isInstalled];
  *((void *)&v35 + 1) = &type metadata for Bool;
  LOBYTE(v34) = v28;
  sub_10000558C((uint64_t)&v34, 0x6C6174736E497369, 0xEB0000000064656CLL);
  id v29 = [a1 storeItemID];
  *((void *)&v35 + 1) = &type metadata for Int64;
  *(void *)&long long v34 = v29;
  sub_10000558C((uint64_t)&v34, 0x65744965726F7473, 0xEB0000000044496DLL);
  id v30 = [a1 storeFront];
  if (v30)
  {
    id v31 = v30;
    *((void *)&v35 + 1) = sub_100005A4C(0, (unint64_t *)&qword_10005C4D8);
    *(void *)&long long v34 = v31;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_10000558C((uint64_t)&v34, 0x6F724665726F7473, 0xEA0000000000746ELL);
  return v36;
}

id sub_100005370(uint64_t a1, uint64_t a2)
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
    uint64_t v5 = sub_100005548(v11, v12);
    unint64_t v6 = *(void *)(v4 - 8);
    __chkstk_darwin(v5);
    id v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    uint64_t v9 = (void *)sub_1000460E0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v11);
  }
  else
  {
    uint64_t v9 = 0;
  }
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v13);

  return v9;
}

uint64_t sub_1000054E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000054F0()
{
  return swift_release();
}

uint64_t _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100005548(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000558C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100005AE4((_OWORD *)a1, v6);
    sub_100005758(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100005A88(a1, (uint64_t *)&unk_10005CC40);
    sub_100005620(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_100005A88((uint64_t)v6, (uint64_t *)&unk_10005CC40);
  }
}

double sub_100005620@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100008474(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100004A2C(&qword_10005C530);
    sub_100046000(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_100005AE4((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    sub_100046010();
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

uint64_t sub_100005758(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1000057E8(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_1000057E8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_100008474(a2, a3);
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
  sub_100004A2C(&qword_10005C530);
  if (!sub_100046000(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_100008474(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)sub_100046110();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    id v21 = (_OWORD *)(v20[7] + 32 * v16);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v21);
    return sub_100005AE4(a1, v21);
  }
  else
  {
    sub_100005928(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_100005928(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_100005AE4(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_100005994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1000059BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005C520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005A24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100005A4C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100005A88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004A2C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_100005AE4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100005AF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  v24[0] = a1;
  uint64_t v11 = sub_100045E70();
  sub_100005D34();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  unint64_t v16 = (char *)v24 - v15;
  sub_100005D34();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  id v21 = (char *)v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a2, v11);
  if (sub_100005A24((uint64_t)v16, 1, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v11);
    a6[3] = a3;
    a6[4] = a5;
    uint64_t v22 = sub_100005CD0(a6);
    return (*(uint64_t (**)(uint64_t *, void, uint64_t))(*(void *)(a3 - 8) + 16))(v22, v24[1], a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, a4);
    sub_100045830();
    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v21, a4);
  }
}

uint64_t *sub_100005CD0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id sub_100005D4C()
{
  if (*v0)
  {
    id v1 = *v0;
    id result = [v1 accountStore];
    if (result)
    {
      sub_100045B40();
      swift_allocObject();
      uint64_t v3 = sub_100045B50();

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
    sub_100045B40();
    swift_allocObject();
    return (id)sub_100045B50();
  }
  return result;
}

uint64_t sub_100005E28()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  uint64_t v3 = v2 - 8;
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v23 = *(void *)(v24 + 64);
  __chkstk_darwin(v2);
  uint64_t v22 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045700();
  sub_1000456E0();
  uint64_t v5 = v34;
  uint64_t v6 = v35;
  sub_100005548(v33, v34);
  uint64_t v7 = sub_100005A4C(0, (unint64_t *)&qword_10005C630);
  v31[0] = *v1;
  uint64_t v8 = (void *)v31[0];
  sub_100005AF4(v7, (uint64_t)v31, v5, v7, v6, v32);
  sub_100005548(v32, v32[3]);
  sub_100045B40();
  v30[0] = sub_100005D4C();
  sub_100045830();
  swift_release();
  sub_100005548(v31, v31[3]);
  type metadata accessor for DynamicAccountsStore();
  id v9 = sub_100005D4C();
  swift_allocObject();
  id v10 = v8;
  v29[0] = DynamicAccountsStore.init(accountStore:account:)((uint64_t)v9, (uint64_t)v8);
  sub_100045830();
  swift_release();
  sub_100005548(v30, v30[3]);
  sub_1000458B0();
  sub_100007154();
  sub_100005548(v29, v29[3]);
  sub_100005A4C(0, &qword_10005C638);
  v27[0] = *(void *)((char *)v1 + *(int *)(v3 + 32));
  uint64_t v11 = (void *)v27[0];
  sub_100007154();
  sub_100005548(v28, v28[3]);
  uint64_t v12 = (void *)((char *)v1 + *(int *)(v3 + 36));
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  v26[0] = v14;
  v26[1] = v13;
  sub_100045830();
  sub_100005548(v27, v27[3]);
  sub_100045840();
  sub_100005548(v26, v26[3]);
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  uint64_t v15 = v22;
  sub_100006828((uint64_t)v1, v22);
  unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  sub_1000069A4(v15, v17 + v16);
  id v18 = v11;
  sub_100045820();
  swift_release();
  sub_100005548(v25, v25[3]);
  uint64_t v19 = sub_100045800();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v25);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v26);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v27);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v29);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v30);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v31);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v32);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v33);
  return v19;
}

uint64_t sub_100006248@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v16 = a1;
  uint64_t v17 = a3;
  uint64_t v4 = sub_100045400();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1000458B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  sub_100045700();
  sub_1000458C0();
  uint64_t v12 = (void *)(a2 + *(int *)(type metadata accessor for BaseBootstrap() + 28));
  uint64_t v13 = v12[1];
  void *v7 = *v12;
  v7[1] = v13;
  v7[2] = 0;
  v7[3] = 0;
  (*(void (**)(void *, void, uint64_t))(v5 + 104))(v7, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v4);
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100045D20();
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
  return sub_100006578;
}

void sub_100006578(void **a1, char a2)
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
  uint64_t result = qword_10005C6A0;
  if (!qword_10005C6A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000688C()
{
  uint64_t v1 = (int *)(type metadata accessor for BaseBootstrap() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;

  uint64_t v6 = v0 + v3;
  uint64_t v7 = v0 + v3 + v1[7];
  uint64_t v8 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000069A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006A08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for BaseBootstrap() - 8);
  return sub_100006248(*(void *)(v1 + 16), v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

void **sub_100006A88(void **a1, void **a2, int *a3)
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
    uint64_t v11 = sub_1000458B0();
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

uint64_t sub_100006BA0(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1000458B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void **sub_100006C3C(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000458B0();
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

void **sub_100006D08(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_1000458B0();
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

void *sub_100006DE4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000458B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void **sub_100006E84(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000458B0();
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

uint64_t sub_100006F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006F5C);
}

uint64_t sub_100006F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000458B0();
  sub_10000713C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return sub_100005A24(v9, a2, v8);
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

uint64_t sub_100006FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007000);
}

void sub_100007000(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000458B0();
  sub_10000713C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    sub_100005994(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t sub_10000708C()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100007154()
{
  return sub_100045830();
}

void *DynamicAccountsStore.account.getter()
{
  sub_100045500();
  __chkstk_darwin();
  sub_1000078D8();
  unint64_t v1 = *(void **)(v0 + 16);
  [v1 lock];
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v2 = sub_100045550();
  sub_1000078C0(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000472A0;
  *((void *)&v19 + 1) = type metadata accessor for DynamicAccountsStore();
  *(void *)&long long v18 = v0;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100045C30();
    uint64_t v7 = v6;

    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&v18, *((uint64_t *)&v19 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v16[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v16);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_1000454E0(v20);
    MetatypeMetadata = &type metadata for String;
    v16[0] = v5;
    v16[1] = v7;
    sub_1000454D0();
    sub_100007820((uint64_t)v16);
    v9._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&v18, *((uint64_t *)&v19 + 1));
    uint64_t v10 = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v16[0] = v10;
    sub_1000454D0();
    sub_100007820((uint64_t)v16);
    v9._countAndFlagsBits = 58;
  }
  v9._object = (void *)0xE100000000000000;
  sub_1000454E0(v9);
  sub_100045510();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v18);
  *((void *)&v19 + 1) = &type metadata for UnsafeMutableRawPointer;
  *(void *)&long long v18 = v0;
  sub_100045520();
  sub_100007820((uint64_t)&v18);
  sub_1000454B0();
  uint64_t v11 = *(void **)(v0 + 24);
  if (v11)
  {
    *((void *)&v19 + 1) = sub_100007880();
    *(void *)&long long v18 = v11;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  type metadata accessor for Log();
  id v12 = v11;
  sub_100045520();
  sub_100007820((uint64_t)&v18);
  sub_1000348CC();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void **)(v0 + 24);
  id v14 = v13;
  [v1 unlock];
  return v13;
}

void DynamicAccountsStore.account.setter(void *a1)
{
  uint64_t v2 = v1;
  sub_100045500();
  __chkstk_darwin();
  sub_1000078D8();
  uint64_t v4 = *(void **)(v1 + 16);
  [v4 lock];
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v5 = sub_100045550();
  sub_1000078C0(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000472A0;
  *((void *)&v20 + 1) = type metadata accessor for DynamicAccountsStore();
  *(void *)&long long v19 = v1;
  swift_retain();
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100045C30();
    uint64_t v10 = v9;

    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&v19, *((uint64_t *)&v20 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v17);
    v21._countAndFlagsBits = 5972026;
    v21._object = (void *)0xE300000000000000;
    sub_1000454E0(v21);
    MetatypeMetadata = &type metadata for String;
    v17[0] = v8;
    v17[1] = v10;
    sub_1000454D0();
    sub_100007820((uint64_t)v17);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&v19, *((uint64_t *)&v20 + 1));
    uint64_t v13 = swift_getDynamicType();
    MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = v13;
    sub_1000454D0();
    sub_100007820((uint64_t)v17);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_1000454E0(v12);
  sub_100045510();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v19);
  *((void *)&v20 + 1) = &type metadata for UnsafeMutableRawPointer;
  *(void *)&long long v19 = v1;
  sub_100045520();
  sub_100007820((uint64_t)&v19);
  sub_1000454B0();
  if (a1)
  {
    *((void *)&v20 + 1) = sub_100007880();
    *(void *)&long long v19 = a1;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }
  type metadata accessor for Log();
  id v14 = a1;
  sub_100045520();
  sub_100007820((uint64_t)&v19);
  sub_1000348CC();
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
  return sub_100007794;
}

void sub_100007794(void **a1, char a2)
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

uint64_t sub_100007820(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C((uint64_t *)&unk_10005CC40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100007880()
{
  unint64_t result = qword_10005C630;
  if (!qword_10005C630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C630);
  }
  return result;
}

uint64_t sub_1000078C0(uint64_t a1)
{
  return a1 - 8;
}

void sub_1000078F0()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_1000454E0(v1);
}

id sub_100007908(void *a1, void *a2)
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
  uint64_t v6 = sub_100007B08(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    if (*(void *)(v6 + 16))
    {
      sub_100005A4C(0, (unint64_t *)&qword_10005C510);
      sub_100004A2C(&qword_10005C7D8);
      id v8 = a1;
      id result = sub_100007BD8((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v7);
      if (!result)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
      sub_100045E10();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v16 = sub_100007B6C(a2);
  if (!v16)
  {
LABEL_12:
    id v26 = [a2 request];
    if (!v26) {
      return v5;
    }
    uint64_t v27 = v26;
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    sub_100005A4C(0, &qword_10005E560);
    id v28 = a1;
    id v29 = v27;
    id result = sub_100007BD8((uint64_t)v29, v30, v31, v32, v33, v34, v35, v36, (uint64_t)v27);
    if (result)
    {
      sub_100045E10();

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
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  sub_100004A2C(&qword_10005C500);
  id v18 = a1;
  id result = sub_100007BD8((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25, v17);
  if (result)
  {
    sub_100045E10();
    goto LABEL_12;
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_100007B08(void *a1)
{
  id v1 = [a1 actions];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  sub_100004A2C(&qword_10005C500);
  uint64_t v3 = sub_100045CE0();

  return v3;
}

uint64_t sub_100007B6C(void *a1)
{
  id v1 = [a1 data];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100045BD0();

  return v3;
}

id sub_100007BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100025D08(&a9, v9);
}

uint64_t sub_100007BF4(void *a1)
{
  uint64_t v2 = (void *)sub_100007DA4();
  uint64_t v3 = sub_100007CCC(v2);
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = sub_100007DA4();
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045920();
    swift_willThrow();
  }

  return v4;
}

uint64_t sub_100007CA0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100007BF4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100007CCC(void *a1)
{
  id v2 = [a1 toDictionary];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100045BD0();

  return v3;
}

unint64_t sub_100007D44()
{
  unint64_t result = qword_10005CC30;
  if (!qword_10005CC30)
  {
    sub_100045950();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CC30);
  }
  return result;
}

ValueMetadata *type metadata accessor for EngagementEvent()
{
  return &type metadata for EngagementEvent;
}

uint64_t sub_100007DA4()
{
  return sub_100045E00();
}

void sub_100007DD4(void *a1)
{
  id v2 = (void *)sub_100008E74();
  uint64_t v3 = sub_100004968(v2);
  if (!v3 || (uint64_t v4 = sub_1000042D4(v3), swift_bridgeObjectRelease(), !v4))
  {
    sub_100008E74();
    sub_100045950();
    sub_100007D44();
    sub_100008E24();
LABEL_17:
    sub_100045920();
    swift_willThrow();

    return;
  }
  id v5 = (void *)sub_100008E44();
  sub_100045DF0();
  uint64_t v7 = v6;

  if (!v7)
  {
    swift_bridgeObjectRelease();
    sub_100008E44();
    sub_100045950();
    sub_100007D44();
    sub_100008E24();
    goto LABEL_17;
  }
  int64_t v8 = v4[2];
  if (v8)
  {
    uint64_t v21 = a1;
    uint64_t v25 = (unint64_t *)&_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_1000044BC(0, v8, 0);
    uint64_t v9 = 0;
    uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v11 = v4[v9 + 4];
      uint64_t v12 = *(void *)(v11 + 16);
      swift_bridgeObjectRetain();
      if (!v12
        || (unint64_t v13 = sub_100008474(0x6E656D6563616C70, 0xE900000000000074), (v14 & 1) == 0)
        || (sub_1000049D0(*(void *)(v11 + 56) + 32 * v13, (uint64_t)v24), !swift_dynamicCast()))
      {
        sub_100045950();
        sub_100007D44();
        sub_100008E24();
        sub_100008EA0();
        goto LABEL_22;
      }
      if (!*(void *)(v11 + 16)) {
        break;
      }
      unint64_t v15 = sub_100008474(0x747865746E6F63, 0xE700000000000000);
      if ((v16 & 1) == 0) {
        break;
      }
      sub_1000049D0(*(void *)(v11 + 56) + 32 * v15, (uint64_t)v24);
      sub_100004A2C(&qword_10005C4F0);
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
        sub_1000044BC((char *)(v17 > 1), v18 + 1, 1);
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
    sub_100045950();
    sub_100007D44();
    sub_100008E24();
    sub_100008EA0();
LABEL_22:
    sub_100045900();
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

id sub_100008190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    sub_100045FD0();
    id v5 = (uint64_t *)(a3 + 48);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      v5 += 3;
      swift_bridgeObjectRetain_n();
      uint64_t v8 = swift_bridgeObjectRetain();
      sub_1000369A0(v8);
      uint64_t v10 = v9;
      id v11 = objc_allocWithZone((Class)AMSEngagementPlacementInfo);
      sub_10000830C(v6, v7, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100045FB0();
      sub_100045FE0();
      sub_100045FF0();
      sub_100045FC0();
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  objc_allocWithZone((Class)AMSEngagementMessageEvent);
  swift_bridgeObjectRetain();
  return sub_1000083AC();
}

void sub_1000082DC(void *a1@<X0>, void *a2@<X8>)
{
  sub_100007DD4(a1);
  if (!v2)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
  }
}

id sub_10000830C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100045C00();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v6.super.Class isa = sub_100045BC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }
  id v7 = [v3 initWithPlacement:v5 context:v6.super.isa];

  return v7;
}

id sub_1000083AC()
{
  NSString v1 = sub_100045C00();
  swift_bridgeObjectRelease();
  sub_100008A50();
  Class isa = sub_100045CD0().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v0 initWithServiceType:v1 placementInfo:isa];

  return v3;
}

unint64_t sub_100008430(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100045F20(*(void *)(v2 + 40));

  return sub_100008580(a1, v4);
}

unint64_t sub_100008474(uint64_t a1, uint64_t a2)
{
  sub_100046180();
  sub_100045C90();
  Swift::Int v4 = sub_1000461A0();

  return sub_100008648(a1, a2, v4);
}

unint64_t sub_1000084EC(uint64_t a1)
{
  sub_100045C30();
  sub_100046180();
  sub_100045C90();
  Swift::Int v2 = sub_1000461A0();
  swift_bridgeObjectRelease();

  return sub_10000872C(a1, v2);
}

unint64_t sub_100008580(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000089A0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100045F30();
      sub_1000089FC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100008648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000460F0() & 1) == 0)
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
      while (!v14 && (sub_1000460F0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000872C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100045C30();
    uint64_t v8 = v7;
    if (v6 == sub_100045C30() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1000460F0();
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
          uint64_t v13 = sub_100045C30();
          uint64_t v15 = v14;
          if (v13 == sub_100045C30() && v15 == v16) {
            break;
          }
          char v18 = sub_1000460F0();
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

Swift::Int sub_1000088A4()
{
  sub_100045C30();
  sub_100046180();
  sub_100045C90();
  Swift::Int v0 = sub_1000461A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100008918()
{
  uint64_t v0 = sub_100045C30();
  uint64_t v2 = v1;
  if (v0 == sub_100045C30() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000460F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000089A0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000089FC(uint64_t a1)
{
  return a1;
}

unint64_t sub_100008A50()
{
  unint64_t result = qword_10005C7E0;
  if (!qword_10005C7E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C7E0);
  }
  return result;
}

uint64_t destroy for EngagementMessagePlacementInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s34AppleMediaServicesUIDynamicService30EngagementMessagePlacementInfoVwCP_0(void *a1, void *a2)
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

void *_s34AppleMediaServicesUIDynamicService22EngagementMessageEventVwCP_0(void *a1, void *a2)
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

uint64_t sub_100008E24()
{
  return swift_allocError();
}

uint64_t sub_100008E44()
{
  return sub_100045E00();
}

uint64_t sub_100008E74()
{
  return sub_100045E00();
}

void *sub_100008EB4(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      __n128 result = (void *)sub_100045FD0();
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = 0;
      while (v4 != v6)
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v7 = (id)sub_100045FA0();
        }
        else {
          id v7 = *(id *)(a1 + 8 * v6 + 32);
        }
        ++v6;
        id v8 = v7;
        sub_100009010(a2, v8);

        sub_100045FB0();
        sub_100045FE0();
        sub_100045FF0();
        sub_100045FC0();
        if (v4 == v6) {
          goto LABEL_13;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100046020();
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

id sub_100009010(void *a1, void *a2)
{
  sub_100045500();
  __chkstk_darwin();
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v5 = result;
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  id v6 = [a2 serviceType];
  uint64_t v7 = sub_100045C30();
  uint64_t v9 = v8;

  ObjectType = (ValueMetadata *)&type metadata for String;
  v28[0] = v7;
  v28[1] = v9;
  id v26 = a1;
  id result = sub_100025D08(v28, a1);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_100045E10();
  id v10 = [a2 dictionaryRepresentation];
  sub_100004A2C(&qword_10005C7F0);
  uint64_t v11 = sub_100045BD0();

  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  ObjectType = &type metadata for EngagementMessageAction;
  v28[0] = a2;
  id v12 = a2;
  id v13 = (id)AMSLogKey();
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_100045C30();
    uint64_t v17 = v16;

    sub_1000454F0();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_1000454E0(v30);
    sub_100009688();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000096C0(MetatypeMetadata);
    sub_100007820((uint64_t)v27);
    v31._countAndFlagsBits = 5972026;
    v31._object = (void *)0xE300000000000000;
    sub_1000454E0(v31);
    v27[3] = &type metadata for String;
    v27[0] = v15;
    v27[1] = v17;
    sub_1000454D0();
    sub_100007820((uint64_t)v27);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_1000454E0(v32);
    sub_100009688();
    uint64_t v20 = swift_getMetatypeMetadata();
    sub_1000096C0(v20);
    sub_100007820((uint64_t)v27);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_1000454E0(v19);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  sub_1000454B0();
  ObjectType = (ValueMetadata *)sub_100004A2C(&qword_10005C7F8);
  v28[0] = v11;
  swift_bridgeObjectRetain();
  sub_100045520();
  sub_100007820((uint64_t)v28);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_10002EB9C(0xD000000000000011, 0x8000000100049170, v11);
  if (!v21) {
    goto LABEL_9;
  }
  uint64_t v22 = v21;
  ObjectType = (ValueMetadata *)swift_getObjectType();
  v28[0] = v22;
  id v23 = v26;
  swift_unknownObjectRetain();
  id result = sub_100025D08(v28, a1);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_100045E10();
  swift_unknownObjectRelease();
LABEL_9:
  uint64_t v24 = sub_10002EB9C(0x6E656D6563616C70, 0xEA00000000007374, v11);
  swift_bridgeObjectRelease();
  if (!v24) {
    return v5;
  }
  ObjectType = (ValueMetadata *)swift_getObjectType();
  v28[0] = v24;
  id v25 = v26;
  swift_unknownObjectRetain();
  id result = sub_100025D08(v28, a1);
  if (result)
  {
    sub_100045E10();
    swift_unknownObjectRelease();
    return v5;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_1000094C4()
{
  return sub_100045850();
}

JSValue sub_1000094DC(JSContext a1)
{
  return sub_100045860(a1);
}

id sub_1000094F4(void *a1)
{
  return sub_100009010(a1, *v1);
}

id sub_1000094FC(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_100009608(a2);
    if (!v6) {
      return v5;
    }
    unint64_t v7 = v6;
    id v8 = a1;
    uint64_t v9 = sub_100008EB4(v7, v8);
    swift_bridgeObjectRelease();
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    v11[3] = sub_100004A2C(&qword_10005C7E8);
    v11[0] = v9;
    id v10 = v8;
    id result = sub_100025D08(v11, a1);
    if (result)
    {
      sub_100045E10();
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

uint64_t sub_100009608(void *a1)
{
  id v1 = [a1 messageActions];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_100005A4C(0, &qword_10005C800);
  uint64_t v3 = sub_100045CE0();

  return v3;
}

ValueMetadata *type metadata accessor for EngagementMessageAction()
{
  return &type metadata for EngagementMessageAction;
}

uint64_t sub_100009688()
{
  sub_100005548((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_1000096C0(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000454D0();
}

uint64_t sub_1000096E0()
{
  uint64_t v1 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_1000078D8();
  sub_100009F90(v5, qword_10005C808);
  uint64_t v6 = sub_100009F58(v1, (uint64_t)qword_10005C808);
  id v7 = [self defaultManager];
  id v8 = [v7 temporaryDirectory];

  sub_1000450A0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v0, v1);
}

uint64_t sub_1000097DC()
{
  uint64_t v0 = sub_1000450E0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009F90(v2, qword_10005C820);
  sub_100009F58(v0, (uint64_t)qword_10005C820);
  id v5 = [self defaultManager];
  id v6 = [v5 temporaryDirectory];

  sub_1000450A0();
  sub_100045070();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

id sub_100009924@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_1000078D8();
  sub_100009C40();
  sub_100009D60();
  id v7 = [self defaultManager];
  sub_100045060(v8);
  id v10 = v9;
  v17[0] = 0;
  unsigned int v11 = [v7 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:v17];

  id v15 = v17[0];
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, v1, v3);
    sub_100005994(a1, 0, 1, v3);
    return v15;
  }
  else
  {
    id v13 = v17[0];
    sub_100045010();

    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
    type metadata accessor for Log();
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    sub_1000454B0();
    swift_getErrorValue();
    void v17[3] = v16;
    uint64_t v14 = sub_100005CD0((uint64_t *)v17);
    (*(void (**)(uint64_t *))(*((void *)v16 - 1) + 16))(v14);
    sub_100045520();
    sub_100007820((uint64_t)v17);
    sub_10003493C();
    swift_errorRelease();
    swift_bridgeObjectRelease();
    return (id)sub_100005994(a1, 1, 1, v3);
  }
}

id sub_100009C40()
{
  id v0 = [self defaultManager];
  if (qword_10005C3F8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000450E0();
  sub_100009F58(v1, (uint64_t)qword_10005C820);
  sub_100045060(v2);
  uint64_t v4 = v3;
  id v8 = 0;
  unsigned int v5 = [v0 removeItemAtURL:v3 error:&v8];

  id result = v8;
  if (!v5)
  {
    id v7 = result;
    sub_100045010();

    swift_willThrow();
    return (id)swift_errorRelease();
  }
  return result;
}

uint64_t sub_100009D60()
{
  uint64_t v0 = sub_1000450E0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100045170();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045160();
  sub_100045140();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (qword_10005C3F8 != -1) {
    swift_once();
  }
  sub_100009F58(v0, (uint64_t)qword_10005C820);
  sub_100045070();
  swift_bridgeObjectRelease();
  sub_100045080();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100009F58(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100009F90(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000A010()
{
  uint64_t v0 = sub_100045BE0();
  uint64_t v1 = sub_10000A07C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_10000A07C(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000450E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v40 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v38 = (char *)v36 - v9;
  v49 = &_swiftEmptyDictionarySingleton;
  sub_100023434(v45, a1);
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
                  sub_10000A950();
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
      NSString v21 = sub_100045C00();
      unsigned int v22 = [v20 fileExistsAtPath:v21];

      if (v22) {
        break;
      }
      sub_100005994((uint64_t)v4, 1, 1, v5);
LABEL_27:
      swift_bridgeObjectRelease();
      uint64_t result = sub_10000A8F0((uint64_t)v4);
    }
    sub_100045050();
    sub_100005994((uint64_t)v4, 0, 1, v5);
    if (sub_100005A24((uint64_t)v4, 1, v5) == 1) {
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
      sub_10000A54C(v26 + 1, 1);
      id v25 = v49;
    }
    uint64_t result = sub_100046170();
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

uint64_t sub_10000A54C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v41 = sub_1000450E0();
  uint64_t v5 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100004A2C(&qword_10005C840);
  int v40 = a2;
  uint64_t result = sub_100046030();
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
      uint64_t result = sub_100046170();
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
              sub_100023418(0, (unint64_t)(v35 + 63) >> 6, v38);
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

uint64_t sub_10000A8F0(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005C838);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000A950()
{
  return swift_release();
}

BOOL sub_10000A958(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000A968(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000A990(unsigned __int8 a1)
{
  return sub_1000461A0();
}

BOOL sub_10000A9D8(char *a1, char *a2)
{
  return sub_10000A958(*a1, *a2);
}

Swift::Int sub_10000A9E4()
{
  return sub_10000A990(*v0);
}

void sub_10000A9EC(uint64_t a1)
{
  sub_10000A968(a1, *v1);
}

Swift::Int sub_10000A9F4()
{
  Swift::UInt v1 = *v0;
  sub_100046180();
  sub_100046190(v1);
  return sub_1000461A0();
}

uint64_t sub_10000AA48()
{
  return [self devMode] ^ 1;
}

uint64_t sub_10000AA78(uint64_t a1, void *a2, void *a3, void (*a4)(void))
{
  v138 = a4;
  id v119 = a3;
  id v118 = a2;
  uint64_t v139 = a1;
  sub_100004A2C(&qword_10005C908);
  sub_100009FF4();
  uint64_t v132 = v6;
  uint64_t v133 = v5;
  __chkstk_darwin(v5);
  sub_10000CB30();
  uint64_t v131 = v7;
  uint64_t v130 = sub_1000455F0();
  sub_100009FF4();
  uint64_t v127 = v8;
  __chkstk_darwin(v9);
  sub_10000CB30();
  sub_10000CB44(v10);
  uint64_t v137 = sub_100004A2C(&qword_10005C910);
  sub_100009FF4();
  uint64_t v129 = v11;
  __chkstk_darwin(v12);
  sub_10000CB30();
  sub_10000CB44(v13);
  uint64_t v125 = sub_100004A2C(&qword_10005C918);
  sub_100009FF4();
  uint64_t v124 = v14;
  __chkstk_darwin(v15);
  sub_10000CB30();
  sub_10000CB44(v16);
  uint64_t v122 = sub_100004A2C(&qword_10005C920);
  sub_100009FF4();
  uint64_t v121 = v17;
  __chkstk_darwin(v18);
  sub_10000CB30();
  sub_10000CB44(v19);
  v117 = (void *)sub_1000452D0();
  sub_100009FF4();
  uint64_t v116 = v20;
  __chkstk_darwin(v21);
  sub_10000CB30();
  sub_10000CB44(v22);
  uint64_t v135 = sub_100004A2C(&qword_10005C928);
  sub_100009FF4();
  uint64_t v120 = v23;
  __chkstk_darwin(v24);
  sub_10000CB30();
  sub_10000CB44(v25);
  uint64_t v114 = sub_100004A2C(&qword_10005C930);
  sub_100009FF4();
  uint64_t v113 = v26;
  __chkstk_darwin(v27);
  sub_10000CB30();
  sub_10000CB44(v28);
  uint64_t v29 = sub_100004A2C(&qword_10005C838);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  unint64_t v32 = (char *)v110 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)v110 - v33;
  uint64_t v35 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v142 = v36;
  uint64_t v38 = __chkstk_darwin(v37);
  v136 = (char *)v110 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __chkstk_darwin(v38);
  v140 = (char *)v110 - v41;
  uint64_t v123 = v42;
  __chkstk_darwin(v40);
  v141 = (char *)v110 - v43;
  uint64_t v44 = sub_100045500();
  __chkstk_darwin(v44 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v45 = sub_100045550();
  sub_1000078C0(v45);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v144 = type metadata accessor for JetpackLoader();
  v143 = (void *)v4;
  uint64_t v134 = v4;
  swift_retain();
  id v46 = (id)AMSLogKey();
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = sub_100045C30();
    uint64_t v50 = v49;

    sub_1000454F0();
    v148._countAndFlagsBits = 0;
    v148._object = (void *)0xE000000000000000;
    sub_1000454E0(v148);
    uint64_t v51 = sub_10000CB94();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v146[0] = v51;
    sub_1000454D0();
    sub_10000C890((uint64_t)v146, (uint64_t *)&unk_10005CC40);
    v149._countAndFlagsBits = 5972026;
    v149._object = (void *)0xE300000000000000;
    sub_1000454E0(v149);
    uint64_t MetatypeMetadata = &type metadata for String;
    v146[0] = v48;
    v146[1] = v50;
    sub_1000454D0();
    sub_10000C890((uint64_t)v146, (uint64_t *)&unk_10005CC40);
    v52._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v150._countAndFlagsBits = 0;
    v150._object = (void *)0xE000000000000000;
    sub_1000454E0(v150);
    uint64_t v53 = sub_10000CB94();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v146[0] = v53;
    sub_1000454D0();
    sub_10000C890((uint64_t)v146, (uint64_t *)&unk_10005CC40);
    v52._countAndFlagsBits = 58;
  }
  v52._object = (void *)0xE100000000000000;
  sub_1000454E0(v52);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v143);
  sub_1000454B0();
  uint64_t v144 = v35;
  sub_100005CD0((uint64_t *)&v143);
  uint64_t v54 = v142;
  v55 = *(void (**)(void))(v142 + 16);
  sub_10000CB5C();
  v55();
  sub_100045520();
  sub_10000C890((uint64_t)&v143, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100005A4C(0, &qword_10005C938);
  sub_100045700();
  sub_1000458C0();
  v56 = v143;
  if (qword_10005C3F0 != -1) {
    swift_once();
  }
  sub_100009F58(v35, (uint64_t)qword_10005C808);
  sub_10000CB5C();
  v55();
  sub_100005994((uint64_t)v34, 0, 1, v35);
  int v57 = sub_100005A24((uint64_t)v34, 1, v35);
  v58 = v140;
  v59 = v141;
  if (v57 == 1)
  {
    sub_10000C890((uint64_t)v34, &qword_10005C838);
    sub_100004A2C(&qword_10005C940);
    sub_10000C45C();
    swift_allocError();
    unsigned char *v60 = 0;
    uint64_t v61 = sub_100045A50();
  }
  else
  {
    v138 = v55;
    v62 = v34;
    v63 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
    v63(v141, v62, v35);
    sub_100009924((uint64_t)v32);
    if (sub_100005A24((uint64_t)v32, 1, v35) == 1)
    {
      sub_10000C890((uint64_t)v32, &qword_10005C838);
      sub_100004A2C(&qword_10005C940);
      sub_10000C45C();
      swift_allocError();
      unsigned char *v64 = 1;
      uint64_t v61 = sub_100045A50();

      (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v35);
    }
    else
    {
      v112 = (void (*)(unint64_t, char *, uint64_t))v63;
      v63(v58, v32, v35);
      uint64_t v65 = (uint64_t)v118;
      uint64_t v66 = (uint64_t)v119;
      id v67 = sub_10002E854((uint64_t)v118, (uint64_t)v119);
      id v68 = sub_10002E7C4(v65, v66);
      v111 = v56;
      uint64_t v69 = v139;
      sub_100045B20();
      v110[1] = v54 + 32;
      id v119 = v67;
      id v118 = v68;
      sub_100045650();
      sub_10000C734(&qword_10005C950, &qword_10005C930);
      uint64_t v70 = sub_1000455D0();
      v71 = *(void (**)(uint64_t))(v120 + 8);
      uint64_t v72 = sub_10000CBCC();
      v71(v72);
      sub_10000CB50();
      v73();
      v146[0] = v70;
      ((void (*)(char *, uint64_t, uint64_t))v138)(v136, v69, v35);
      sub_10000C4F0();
      sub_100045F40();
      uint64_t v74 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
      uint64_t v75 = v116;
      uint64_t v76 = v115;
      v77 = v117;
      (*(void (**)(uint64_t, void, void *))(v116 + 104))(v115, enum case for DispatchQoS.QoSClass.default(_:), v117);
      uint64_t v120 = v74;
      v78 = (void *)sub_100045D90();
      (*(void (**)(uint64_t, void *))(v75 + 8))(v76, v77);
      sub_100045670();

      sub_1000089FC((uint64_t)&v143);
      sub_100004A2C(&qword_10005C968);
      sub_10000C734(&qword_10005C970, &qword_10005C968);
      uint64_t v79 = sub_1000455D0();
      uint64_t v80 = sub_10000CBCC();
      v71(v80);
      swift_release();
      v143 = (void *)v79;
      sub_10000A010();
      sub_10000AA48();
      sub_100045600();
      sub_100045660();
      swift_bridgeObjectRelease();
      sub_10000CB6C();
      uint64_t v81 = sub_1000455D0();
      sub_10000CB50();
      v82();
      swift_release();
      v143 = (void *)v81;
      sub_100045610();
      sub_100004A2C(&qword_10005C978);
      v117 = &protocol conformance descriptor for MapPipelineTask<A, B>;
      sub_10000C734(&qword_10005C980, &qword_10005C978);
      sub_10000CB6C();
      uint64_t v83 = sub_1000455D0();
      sub_10000CB50();
      v84();
      swift_release();
      v143 = (void *)v83;
      uint64_t v85 = v127;
      uint64_t v86 = v126;
      uint64_t v87 = v130;
      (*(void (**)(uint64_t, void, uint64_t))(v127 + 104))(v126, enum case for JetpackBundle.Resource.source(_:), v130);
      uint64_t v88 = v128;
      sub_100045640();
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v86, v87);
      uint64_t v89 = sub_100004A2C(&qword_10005C988);
      uint64_t v90 = sub_10000C734(&qword_10005C990, &qword_10005C988);
      uint64_t v135 = v89;
      uint64_t v127 = v90;
      uint64_t v91 = sub_1000455D0();
      uint64_t v129 = *(void *)(v129 + 8);
      ((void (*)(uint64_t, uint64_t))v129)(v88, v137);
      v143 = (void *)v91;
      v92 = v136;
      sub_10000CB5C();
      v93();
      unint64_t v94 = (*(unsigned __int8 *)(v142 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80);
      unint64_t v95 = (v123 + v94 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v96 = swift_allocObject();
      v112(v96 + v94, v92, v35);
      v97 = v111;
      *(void *)(v96 + v95) = v111;
      v138 = v97;
      sub_100004A2C(&qword_10005C998);
      sub_100004A2C(&qword_10005C9A0);
      sub_10000C734(&qword_10005C9A8, &qword_10005C998);
      v136 = (char *)sub_1000455C0();
      swift_release();
      swift_release();
      uint64_t v139 = v83;
      v143 = (void *)v83;
      if (qword_10005C400 != -1) {
        swift_once();
      }
      sub_100009F58(v87, (uint64_t)qword_10005C848);
      sub_100045640();
      uint64_t v98 = sub_1000455D0();
      ((void (*)(uint64_t, uint64_t))v129)(v88, v137);
      v143 = (void *)v98;
      uint64_t v99 = sub_1000455B0();
      swift_release();
      v143 = (void *)v99;
      sub_100004A2C(&qword_10005C9B0);
      sub_100004A2C(&qword_10005C4F0);
      sub_10000C734(&qword_10005C9B8, &qword_10005C9B0);
      uint64_t v100 = sub_1000455C0();
      swift_release();
      v143 = (void *)v100;
      sub_100045610();
      sub_100004A2C(&qword_10005C9C0);
      sub_10000C734(&qword_10005C9C8, &qword_10005C9C0);
      sub_1000455D0();
      sub_10000CB50();
      v101();
      swift_release();
      sub_100045750();
      sub_100045750();
      uint64_t v102 = sub_100045BE0();
      v103 = (void *)sub_100045D80();
      uint64_t v104 = swift_allocObject();
      *(void *)(v104 + 16) = v102;
      id v105 = v103;
      swift_bridgeObjectRetain();
      sub_10000EFCC((uint64_t)sub_10000C72C, v104, v105);
      swift_bridgeObjectRelease();
      swift_release();

      swift_release();
      sub_100004A2C(&qword_10005C9D0);
      sub_10000C734(&qword_10005C9D8, &qword_10005C9D0);
      sub_100045A30();
      uint64_t v106 = swift_allocObject();
      uint64_t v107 = v134;
      *(void *)(v106 + 16) = sub_10000C778;
      *(void *)(v106 + 24) = v107;
      uint64_t v144 = sub_1000457A0();
      v145 = &protocol witness table for SyncTaskScheduler;
      sub_100005CD0((uint64_t *)&v143);
      swift_retain();
      sub_100045790();
      uint64_t v61 = sub_100045A20();

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v143);
      v108 = *(void (**)(char *, uint64_t))(v142 + 8);
      v108(v140, v35);
      v108(v141, v35);
    }
  }
  return v61;
}

uint64_t sub_10000BC14()
{
  return sub_1000457E0();
}

void *sub_10000BC48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  id v21 = a3;
  uint64_t v7 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000450E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v15((char *)&v20 - v16, a1, v10);
  v15(v14, a2, v10);
  sub_100005994((uint64_t)v9, 1, 1, v10);
  a4[3] = sub_100045770();
  a4[4] = (uint64_t)&protocol witness table for JSBytecodeSource;
  sub_100005CD0(a4);
  id v17 = v21;
  uint64_t v18 = v22;
  uint64_t result = (void *)sub_100045760();
  if (v18) {
    return sub_10000C8DC(a4);
  }
  return result;
}

uint64_t sub_10000BE20()
{
  uint64_t result = sub_1000450F0();
  if (!v0)
  {
    sub_100004A2C(&qword_10005C9E8);
    return sub_100045A60();
  }
  return result;
}

uint64_t sub_10000BE88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004A2C(&qword_10005C9E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045480();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C838(*(void *)a1, *(void *)(a1 + 8));
  uint64_t result = sub_100045440();
  if (!v2)
  {
    sub_100045430();
    uint64_t v13 = sub_1000456B0();
    if (sub_100005A24((uint64_t)v7, 1, v13) == 1)
    {
      sub_10000C890((uint64_t)v7, &qword_10005C9E0);
    }
    else
    {
      uint64_t v14 = sub_1000456A0();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v7, v13);
      if (v14)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        *a2 = v14;
        return result;
      }
    }
    sub_10000C45C();
    swift_allocError();
    *uint64_t v15 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_10000C0C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100045500();
  __chkstk_darwin(v8 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v24 = type metadata accessor for JetpackLoader();
  v23[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100045C30();
    uint64_t v13 = v12;

    sub_1000454F0();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_1000454E0(v25);
    sub_100005548(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = DynamicType;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v26._countAndFlagsBits = 5972026;
    v26._object = (void *)0xE300000000000000;
    sub_1000454E0(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v21[0] = v11;
    v21[1] = v13;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_1000454E0(v27);
    sub_100005548(v23, v24);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = v16;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_1000454E0(v15);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v23);
  sub_1000454B0();
  uint64_t v17 = a1[3];
  uint64_t v18 = sub_100005548(a1, v17);
  uint64_t v24 = v17;
  uint64_t v19 = sub_100005CD0(v23);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v19, v18, v17);
  sub_100045520();
  sub_10000C890((uint64_t)v23, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_10000C7D4((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000C404()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for JetpackLoader()
{
  return self;
}

uint64_t sub_10000C438(uint64_t a1, void *a2, void *a3, void (*a4)(void))
{
  return sub_10000AA78(a1, a2, a3, a4);
}

unint64_t sub_10000C45C()
{
  unint64_t result = qword_10005C948;
  if (!qword_10005C948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C948);
  }
  return result;
}

uint64_t sub_10000C4A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000C4F0()
{
  unint64_t result = qword_10005C958;
  if (!qword_10005C958)
  {
    sub_1000450E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C958);
  }
  return result;
}

uint64_t sub_10000C540()
{
  sub_1000450E0();
  sub_10000CB80();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_10000CB50();
  v5();

  return _swift_deallocObject(v0, v4 + 8, v3);
}

void *sub_10000C5D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_1000450E0();
  sub_1000078C0(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  return sub_10000BC48(a1, v2 + v10, *(void **)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_10000C658()
{
  uint64_t v0 = sub_1000455F0();
  sub_100009F90(v0, qword_10005C848);
  uint64_t v1 = (_OWORD *)sub_100009F58(v0, (uint64_t)qword_10005C848);
  _OWORD *v1 = xmmword_100047430;
  v1[1] = xmmword_100047440;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v2();
}

uint64_t sub_10000C6F4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C72C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000EF60(a1);
}

uint64_t sub_10000C734(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C4A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C778@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000C0C4(a1, a2, v3, a3);
}

uint64_t sub_10000C780()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C7B8(uint64_t a1)
{
  return sub_10000D32C(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

uint64_t sub_10000C7D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000C838(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000C890(uint64_t a1, uint64_t *a2)
{
  sub_100004A2C(a2);
  sub_10000CB80();
  sub_10000CB50();
  v3();
  return a1;
}

void *sub_10000C8DC(void *result)
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
        JUMPOUT(0x10000CA94);
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

uint64_t sub_10000CABC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000CAC8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JetpackLoader.LoadError()
{
  return &type metadata for JetpackLoader.LoadError;
}

unint64_t sub_10000CAE4()
{
  unint64_t result = qword_10005C9F0;
  if (!qword_10005C9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C9F0);
  }
  return result;
}

void sub_10000CB44(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_10000CB6C()
{
  return v0;
}

uint64_t sub_10000CB94()
{
  sub_100005548((void *)(v0 - 160), *(void *)(v0 - 136));
  return swift_getDynamicType();
}

uint64_t sub_10000CBCC()
{
  return v0;
}

ValueMetadata *type metadata accessor for JetpackMetadata()
{
  return &type metadata for JetpackMetadata;
}

uint64_t sub_10000CBF0()
{
  return 1;
}

void sub_10000CBF8()
{
}

uint64_t sub_10000CC20(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000460F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

Swift::Int sub_10000CCA8()
{
  return sub_1000461A0();
}

uint64_t sub_10000CCEC()
{
  return 0;
}

uint64_t sub_10000CCF8()
{
  return 0x6E6F6973726576;
}

Swift::Int sub_10000CD1C()
{
  return sub_1000461A0();
}

uint64_t sub_10000CD60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000CC20(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000CD8C()
{
  return sub_10000CCEC();
}

uint64_t sub_10000CDA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000CBF0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000CDD4(uint64_t a1)
{
  unint64_t v2 = sub_10000D0C0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CE10(uint64_t a1)
{
  unint64_t v2 = sub_10000D0C0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CE4C(void *a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005CA08);
  sub_100009FF4();
  uint64_t v4 = v3;
  __chkstk_darwin();
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005548(a1, a1[3]);
  sub_10000D0C0();
  sub_1000461C0();
  sub_1000460C0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v2);
}

uint64_t sub_10000CF50(void *a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005C9F8);
  sub_100009FF4();
  uint64_t v5 = v4;
  __chkstk_darwin();
  BOOL v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t)sub_100005548(a1, a1[3]);
  sub_10000D0C0();
  sub_1000461B0();
  if (!v1)
  {
    uint64_t v8 = sub_100046080();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
  return v8;
}

uint64_t sub_10000D078@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000CF50(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000D0A4(void *a1)
{
  return sub_10000CE4C(a1);
}

unint64_t sub_10000D0C0()
{
  unint64_t result = qword_10005CA00;
  if (!qword_10005CA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CA00);
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
      JUMPOUT(0x10000D1FCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000D224()
{
  return 0;
}

ValueMetadata *type metadata accessor for JetpackMetadata.CodingKeys()
{
  return &type metadata for JetpackMetadata.CodingKeys;
}

unint64_t sub_10000D240()
{
  unint64_t result = qword_10005CA10;
  if (!qword_10005CA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CA10);
  }
  return result;
}

unint64_t sub_10000D290()
{
  unint64_t result = qword_10005CA18;
  if (!qword_10005CA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CA18);
  }
  return result;
}

unint64_t sub_10000D2E0()
{
  unint64_t result = qword_10005CA20;
  if (!qword_10005CA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CA20);
  }
  return result;
}

uint64_t sub_10000D32C(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000D364(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v157 = a4;
  uint64_t v135 = (void *)a3;
  uint64_t v126 = a2;
  uint64_t v158 = a1;
  sub_100004A2C(&qword_10005C908);
  sub_100009FF4();
  uint64_t v151 = v6;
  uint64_t v152 = v5;
  __chkstk_darwin(v5);
  sub_10000CB30();
  uint64_t v150 = v7;
  uint64_t v149 = sub_1000453E0();
  sub_100009FF4();
  uint64_t v148 = v8;
  __chkstk_darwin(v9);
  sub_10000F3B0();
  sub_10000CB44(v10);
  uint64_t v143 = v11;
  __chkstk_darwin(v12);
  sub_10000CB44((uint64_t)&v124 - v13);
  uint64_t v147 = sub_100004A2C(&qword_10005CAE8);
  sub_100009FF4();
  uint64_t v146 = v14;
  __chkstk_darwin(v15);
  sub_10000CB30();
  sub_10000CB44(v16);
  uint64_t v142 = sub_100004A2C(&qword_10005CAF0);
  sub_100009FF4();
  uint64_t v141 = v17;
  __chkstk_darwin(v18);
  sub_10000CB30();
  sub_10000CB44(v19);
  uint64_t v140 = sub_100004A2C(&qword_10005CAF8);
  sub_100009FF4();
  uint64_t v139 = v20;
  __chkstk_darwin(v21);
  sub_10000CB30();
  sub_10000CB44(v22);
  uint64_t v137 = sub_100004A2C(&qword_10005CB00);
  sub_100009FF4();
  uint64_t v136 = v23;
  __chkstk_darwin(v24);
  sub_10000CB30();
  sub_10000CB44(v25);
  uint64_t v132 = sub_1000452D0();
  sub_100009FF4();
  uint64_t v131 = v26;
  __chkstk_darwin(v27);
  sub_10000CB30();
  sub_10000CB44(v28);
  uint64_t v156 = sub_100004A2C(&qword_10005C928);
  sub_100009FF4();
  uint64_t v134 = v29;
  __chkstk_darwin(v30);
  sub_10000CB30();
  sub_10000CB44(v31);
  uint64_t v128 = sub_100004A2C(&qword_10005C930);
  sub_100009FF4();
  uint64_t v127 = v32;
  __chkstk_darwin(v33);
  sub_10000CB30();
  sub_10000CB44(v34);
  uint64_t v35 = sub_100004A2C(&qword_10005C838);
  uint64_t v36 = __chkstk_darwin(v35 - 8);
  v154 = (char *)&v124 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  uint64_t v39 = (char *)&v124 - v38;
  uint64_t v40 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v160 = v41;
  __chkstk_darwin(v42);
  sub_10000F3B0();
  id v155 = v43;
  uint64_t v45 = __chkstk_darwin(v44);
  v159 = (char *)&v124 - v46;
  uint64_t v129 = v47;
  __chkstk_darwin(v45);
  v161 = (char *)&v124 - v48;
  uint64_t v49 = sub_100045500();
  __chkstk_darwin(v49 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v50 = sub_100045550();
  sub_1000078C0(v50);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v163 = type metadata accessor for JetpackV2Loader();
  v162 = (void *)v4;
  uint64_t v153 = v4;
  swift_retain();
  id v51 = (id)AMSLogKey();
  if (v51)
  {
    Swift::String v52 = v51;
    uint64_t v53 = sub_100045C30();
    uint64_t v55 = v54;

    sub_1000454F0();
    v167._countAndFlagsBits = 0;
    v167._object = (void *)0xE000000000000000;
    sub_1000454E0(v167);
    uint64_t v56 = sub_10000CB94();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v165[0] = v56;
    sub_1000454D0();
    sub_10000C890((uint64_t)v165, (uint64_t *)&unk_10005CC40);
    v168._countAndFlagsBits = 5972026;
    v168._object = (void *)0xE300000000000000;
    sub_1000454E0(v168);
    uint64_t MetatypeMetadata = &type metadata for String;
    v165[0] = v53;
    v165[1] = v55;
    sub_1000454D0();
    sub_10000C890((uint64_t)v165, (uint64_t *)&unk_10005CC40);
    v57._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v169._countAndFlagsBits = 0;
    v169._object = (void *)0xE000000000000000;
    sub_1000454E0(v169);
    uint64_t v58 = sub_10000CB94();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v165[0] = v58;
    sub_1000454D0();
    sub_10000C890((uint64_t)v165, (uint64_t *)&unk_10005CC40);
    v57._countAndFlagsBits = 58;
  }
  v57._object = (void *)0xE100000000000000;
  sub_1000454E0(v57);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v162);
  sub_1000454B0();
  uint64_t v163 = v40;
  sub_100005CD0((uint64_t *)&v162);
  uint64_t v59 = v160;
  v60 = *(void (**)(void))(v160 + 16);
  sub_10000F3A0();
  v60();
  sub_100045520();
  sub_10000C890((uint64_t)&v162, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100005A4C(0, &qword_10005C938);
  sub_100045700();
  sub_1000458C0();
  uint64_t v61 = v162;
  if (qword_10005C3F0 != -1) {
    swift_once();
  }
  sub_100009F58(v40, (uint64_t)qword_10005C808);
  sub_10000F3A0();
  v60();
  sub_100005994((uint64_t)v39, 0, 1, v40);
  BOOL v62 = sub_100005A24((uint64_t)v39, 1, v40) == 1;
  v63 = v159;
  if (v62)
  {
    sub_10000C890((uint64_t)v39, &qword_10005C838);
    sub_100004A2C(&qword_10005C940);
    sub_10000EBC8();
    swift_allocError();
    unsigned char *v64 = 0;
    uint64_t v65 = sub_100045A50();
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
    sub_100009924((uint64_t)v154);
    int v72 = sub_100005A24(v71, 1, v40);
    if (v72 == 1)
    {
      sub_10000C890(v71, &qword_10005C838);
      sub_100004A2C(&qword_10005C940);
      sub_10000EBC8();
      swift_allocError();
      unsigned char *v73 = 1;
      uint64_t v65 = sub_100045A50();

      (*(void (**)(char *, uint64_t))(v66 + 8))(v161, v40);
    }
    else
    {
      uint64_t v125 = v70;
      v70((unint64_t)v63, (id)v71, v40);
      uint64_t v74 = v126;
      uint64_t v75 = (uint64_t)v135;
      id v76 = sub_10002E854(v126, (uint64_t)v135);
      v77 = (char *)sub_10002E7C4(v74, v75);
      uint64_t v126 = v67;
      v78 = v77;
      sub_100045B20();
      uint64_t v79 = v133;
      id v157 = v76;
      v154 = v78;
      sub_100045650();
      sub_10000C734(&qword_10005C950, &qword_10005C930);
      uint64_t v135 = v61;
      uint64_t v80 = sub_1000455D0();
      uint64_t v124 = (void (*)(uint64_t, uint64_t))v134[1];
      v124(v79, v156);
      sub_10000CB50();
      v81();
      v165[0] = v80;
      sub_10000F3A0();
      v60();
      sub_10000C4F0();
      sub_100045F40();
      uint64_t v82 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
      uint64_t v83 = v131;
      uint64_t v84 = v130;
      uint64_t v85 = v132;
      (*(void (**)(uint64_t, void, uint64_t))(v131 + 104))(v130, enum case for DispatchQoS.QoSClass.default(_:), v132);
      uint64_t v158 = v82;
      uint64_t v86 = (void *)sub_100045D90();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v84, v85);
      sub_100045670();

      sub_1000089FC((uint64_t)&v162);
      sub_100004A2C(&qword_10005C968);
      uint64_t v134 = &protocol conformance descriptor for MapPipelineTask<A, B>;
      sub_10000C734(&qword_10005C970, &qword_10005C968);
      uint64_t v87 = sub_1000455D0();
      v124(v79, v156);
      swift_release();
      v162 = (void *)v87;
      LOBYTE(v87) = sub_10000AA48();
      id v88 = v155;
      sub_10000F3A0();
      v60();
      unint64_t v89 = (*(unsigned __int8 *)(v160 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80);
      uint64_t v90 = v89 + v129;
      uint64_t v91 = swift_allocObject();
      v125(v91 + v89, v88, v40);
      *(unsigned char *)(v91 + v90) = v87 & 1;
      sub_100045370();
      sub_100045620();
      uint64_t v92 = sub_1000455D0();
      sub_10000CB50();
      v93();
      swift_release();
      v162 = (void *)v92;
      sub_100045610();
      sub_100004A2C(&qword_10005CB10);
      sub_10000C734(&qword_10005CB18, &qword_10005CB10);
      uint64_t v94 = sub_1000455D0();
      sub_10000CB50();
      v95();
      swift_release();
      v162 = (void *)v94;
      uint64_t v96 = swift_allocObject();
      v97 = v135;
      *(void *)(v96 + 16) = v135;
      id v155 = v97;
      sub_100004A2C(&qword_10005C9A0);
      sub_100045630();
      uint64_t v98 = sub_100004A2C(&qword_10005CB20);
      uint64_t v99 = sub_10000C734(&qword_10005CB28, &qword_10005CB20);
      uint64_t v139 = v98;
      uint64_t v138 = v99;
      uint64_t v140 = sub_1000455D0();
      sub_10000CB50();
      v100();
      uint64_t v156 = v94;
      v162 = (void *)v94;
      if (qword_10005C408 != -1) {
        swift_once();
      }
      uint64_t v101 = v149;
      uint64_t v102 = sub_100009F58(v149, (uint64_t)qword_10005CA28);
      uint64_t v103 = v148;
      uint64_t v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(v148 + 16);
      uint64_t v105 = v145;
      v104(v145, v102, v101);
      sub_10000EBC8();
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
      sub_100045630();
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v105, v101);
      swift_errorRelease();
      uint64_t v112 = sub_1000455D0();
      sub_10000CB50();
      v113();
      v162 = (void *)v112;
      sub_100004A2C(&qword_10005CB30);
      sub_100004A2C(&qword_10005C4F0);
      sub_10000C734(&qword_10005CB38, &qword_10005CB30);
      uint64_t v114 = sub_1000455C0();
      swift_release();
      v162 = (void *)v114;
      sub_100045610();
      sub_100004A2C(&qword_10005C9C0);
      sub_10000C734(&qword_10005C9C8, &qword_10005C9C0);
      sub_1000455D0();
      sub_10000CB50();
      v115();
      swift_release();
      sub_100045750();
      sub_100045750();
      uint64_t v116 = sub_100045BE0();
      v117 = (void *)sub_100045D80();
      uint64_t v118 = swift_allocObject();
      *(void *)(v118 + 16) = v116;
      id v119 = v117;
      swift_bridgeObjectRetain();
      sub_10000EFCC((uint64_t)sub_10000C72C, v118, v119);
      swift_bridgeObjectRelease();
      swift_release();

      swift_release();
      sub_100004A2C(&qword_10005C9D0);
      sub_10000C734(&qword_10005C9D8, &qword_10005C9D0);
      sub_100045A30();
      uint64_t v120 = swift_allocObject();
      uint64_t v121 = v153;
      *(void *)(v120 + 16) = sub_10000F0FC;
      *(void *)(v120 + 24) = v121;
      uint64_t v163 = sub_1000457A0();
      v164 = &protocol witness table for SyncTaskScheduler;
      sub_100005CD0((uint64_t *)&v162);
      swift_retain();
      sub_100045790();
      uint64_t v65 = sub_100045A20();

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v162);
      uint64_t v122 = *(void (**)(char *, uint64_t))(v160 + 8);
      v122(v159, v40);
      v122(v161, v40);
    }
  }
  return v65;
}

uint64_t sub_10000E604@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100004A2C(&qword_10005C9E0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045480();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C838(*(void *)a1, *(void *)(a1 + 8));
  uint64_t result = sub_100045440();
  if (!v2)
  {
    sub_100045430();
    uint64_t v13 = sub_1000456B0();
    if (sub_100005A24((uint64_t)v7, 1, v13) == 1)
    {
      sub_10000C890((uint64_t)v7, &qword_10005C9E0);
    }
    else
    {
      uint64_t v14 = sub_1000456A0();
      (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v7, v13);
      if (v14)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        *a2 = v14;
        return result;
      }
    }
    sub_10000EBC8();
    swift_allocError();
    *uint64_t v15 = 2;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_10000E840@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100045500();
  __chkstk_darwin(v8 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v24 = type metadata accessor for JetpackV2Loader();
  v23[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100045C30();
    uint64_t v13 = v12;

    sub_1000454F0();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_1000454E0(v25);
    sub_100005548(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = DynamicType;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v26._countAndFlagsBits = 5972026;
    v26._object = (void *)0xE300000000000000;
    sub_1000454E0(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v21[0] = v11;
    v21[1] = v13;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_1000454E0(v27);
    sub_100005548(v23, v24);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = v16;
    sub_1000454D0();
    sub_10000C890((uint64_t)v21, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_1000454E0(v15);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v23);
  sub_1000454B0();
  uint64_t v17 = a1[3];
  uint64_t v18 = sub_100005548(a1, v17);
  uint64_t v24 = v17;
  uint64_t v19 = sub_100005CD0(v23);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v19, v18, v17);
  sub_100045520();
  sub_10000C890((uint64_t)v23, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_10000C7D4((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for JetpackV2Loader()
{
  return self;
}

uint64_t sub_10000EBA4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_10000D364(a1, a2, a3, a4);
}

unint64_t sub_10000EBC8()
{
  unint64_t result = qword_10005CB08;
  if (!qword_10005CB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CB08);
  }
  return result;
}

uint64_t sub_10000EC14()
{
  uint64_t v0 = sub_1000453E0();
  sub_100009F90(v0, qword_10005CA28);
  sub_100009F58(v0, (uint64_t)qword_10005CA28);
  return sub_1000453F0();
}

uint64_t sub_10000EC78()
{
  sub_1000450E0();
  sub_10000CB80();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  uint64_t v4 = *(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 1;
  sub_10000CB50();
  v5();

  return _swift_deallocObject(v0, v4, v3);
}

uint64_t sub_10000ECFC(uint64_t a1)
{
  uint64_t v3 = sub_1000450E0();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  int v9 = *(unsigned __int8 *)(v1 + v8 + *(void *)(v7 + 64));

  return sub_1000384B8(a1, v1 + v8, v9);
}

uint64_t sub_10000ED6C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EDA4()
{
  return sub_1000387DC();
}

uint64_t sub_10000EDC0()
{
  sub_1000453E0();
  sub_10000CB80();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_10000CB50();
  v5();
  swift_errorRelease();

  return _swift_deallocObject(v0, v4, v3);
}

uint64_t sub_10000EE54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1000453E0();
  sub_1000078C0(v2);
  return sub_100038778(a1);
}

uint64_t sub_10000EED8()
{
  return sub_100045AA0();
}

uint64_t sub_10000EF0C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  a3(&v4);
  sub_100045AA0();
  return swift_bridgeObjectRelease();
}

uint64_t MetricsContext.overlay.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000EF60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MetricsContext.overlay.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000EF8C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000EFC4()
{
  return sub_10000EED8();
}

uint64_t sub_10000EFCC(uint64_t a1, uint64_t a2, void *a3)
{
  v10[3] = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
  v10[4] = &protocol witness table for OS_dispatch_queue;
  v10[0] = a3;
  id v6 = a3;
  uint64_t v7 = sub_100045AE0();
  unint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  swift_retain_n();
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v10);
  return v7;
}

uint64_t sub_10000F0FC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000E840(a1, a2, v3, a3);
}

uint64_t sub_10000F104()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F13C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000F170()
{
  return sub_10000EFC4();
}

uint64_t sub_10000F178()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000F1B8(uint64_t a1)
{
  return sub_10000EF0C(a1, *(void *)(v1 + 16), *(void (**)(uint64_t *__return_ptr))(v1 + 24));
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
        JUMPOUT(0x10000F318);
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

unint64_t sub_10000F354()
{
  unint64_t result = qword_10005CB40;
  if (!qword_10005CB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CB40);
  }
  return result;
}

uint64_t sub_10000F3C4()
{
  sub_100005548(v0, v0[3]);
  uint64_t v1 = sub_10000FDF8();
  if (v2(v1)) {
    return 0x73656E755469;
  }
  sub_100005548(v0, v0[3]);
  uint64_t v4 = sub_10000FDF8();
  if (v5(v4)) {
    return 0x64756F6C4369;
  }
  sub_100005548(v0, v0[3]);
  uint64_t v6 = sub_10000FDF8();
  if (v7(v6)) {
    return 1936548969;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

id sub_10000F4B4(void *a1)
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
  sub_10000FD4C();
  uint64_t v7 = sub_10000FD70();
  id result = [v4 valueWithBool:v8(v7) & 1 inContext:a1];
  if (!result)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_100045E10();
  sub_10000FD4C();
  uint64_t v9 = sub_10000FD70();
  v10(v9);
  if (v11)
  {
    sub_10000FDBC();
    id v12 = sub_10000FDA0();
    id result = sub_10000FD84((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v104);
    if (!result)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    sub_100045E10();
  }
  sub_10000FD4C();
  uint64_t v20 = sub_10000FD70();
  v21(v20);
  if (v22)
  {
    sub_10000FDBC();
    id v23 = sub_10000FDA0();
    id result = sub_10000FD84((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30, v104);
    if (!result)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    sub_100045E10();
  }
  sub_10000FD4C();
  uint64_t v31 = sub_10000FD70();
  uint64_t v33 = (void *)v32(v31);
  if (v33)
  {
    uint64_t v34 = v33;
    id v35 = [v33 stringValue];

    uint64_t v36 = sub_100045C30();
    uint64_t v38 = v37;

    sub_10000F938();
    uint64_t v106 = &type metadata for String;
    uint64_t v104 = v36;
    uint64_t v105 = v38;
    id v39 = a1;
    id result = sub_100025D08(&v104, a1);
    if (!result)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    sub_100045E10();
  }
  sub_10000FD4C();
  uint64_t v40 = sub_10000FD70();
  v41(v40);
  if (v42)
  {
    sub_10000FDBC();
    id v43 = sub_10000FDA0();
    id result = sub_10000FD84((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50, v104);
    if (!result)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    sub_100045E10();
  }
  sub_10000FD4C();
  uint64_t v51 = sub_10000FD70();
  v52(v51);
  if (v53)
  {
    sub_10000FDBC();
    id v54 = sub_10000FDA0();
    id result = sub_10000FD84((uint64_t)v54, v55, v56, v57, v58, v59, v60, v61, v104);
    if (!result)
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    sub_100045E10();
  }
  sub_10000FD4C();
  uint64_t v62 = sub_10000FD70();
  v63(v62);
  if (v64)
  {
    sub_10000FDBC();
    id v65 = sub_10000FDA0();
    id result = sub_10000FD84((uint64_t)v65, v66, v67, v68, v69, v70, v71, v72, v104);
    if (!result)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    sub_100045E10();
  }
  sub_10000F938();
  uint64_t v73 = sub_10000F3C4();
  uint64_t v106 = &type metadata for String;
  uint64_t v104 = v73;
  uint64_t v105 = v74;
  id v75 = a1;
  id result = sub_10000FD84((uint64_t)v75, v76, v77, v78, v79, v80, v81, v82, v104);
  if (!result) {
    goto LABEL_33;
  }
  sub_100045E10();
  uint64_t v83 = v2[3];
  uint64_t v84 = v2[4];
  sub_100005548(v2, v83);
  uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 88))(v83, v84);
  if (v86)
  {
    uint64_t v106 = &type metadata for String;
    uint64_t v104 = v85;
    uint64_t v105 = v86;
    id v87 = v75;
    id result = sub_10000FD84((uint64_t)v87, v88, v89, v90, v91, v92, v93, v94, v104);
    if (!result)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    sub_100045E10();
  }
  sub_10000FE20();
  uint64_t v95 = sub_10000FE0C();
  char v97 = v96(v95);
  if (v97 == 2)
  {
LABEL_28:
    sub_10000FE20();
    uint64_t v98 = sub_10000FE0C();
    char v100 = v99(v98);
    id result = sub_10000FDD8(v100);
    if (result)
    {
      sub_100045E10();
      sub_10000FE20();
      uint64_t v101 = sub_10000FE0C();
      char v103 = v102(v101);
      id result = sub_10000FDD8(v103);
      if (result)
      {
        sub_100045E10();
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
  id result = sub_10000FDD8(v97);
  if (result)
  {
    sub_100045E10();
    goto LABEL_28;
  }
LABEL_43:
  __break(1u);
  return result;
}

unint64_t sub_10000F938()
{
  unint64_t result = qword_10005C510;
  if (!qword_10005C510)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C510);
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

uint64_t *sub_10000FA30(uint64_t *result, uint64_t *a2)
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
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
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

void *sub_10000FD4C()
{
  return sub_100005548(v0, v0[3]);
}

uint64_t sub_10000FD70()
{
  return v0;
}

id sub_10000FD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_100025D08(&a9, v9);
}

id sub_10000FDA0()
{
  return v0;
}

unint64_t sub_10000FDBC()
{
  return sub_10000F938();
}

id sub_10000FDD8(char a1)
{
  uint64_t v5 = *(const char **)(v3 + 3400);
  return objc_msgSend(v1, v5, a1 & 1, v2);
}

uint64_t sub_10000FDF8()
{
  return v0;
}

uint64_t sub_10000FE0C()
{
  return v0;
}

void *sub_10000FE20()
{
  return sub_100005548(v0, v0[3]);
}

id sub_10000FE44(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_dynamicAccountsStore] = a1;
  *(void *)&v2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t sub_10000FED4()
{
  uint64_t v0 = DynamicAccountsStore.account.getter();
  uint64_t v1 = sub_10001158C();

  return v1;
}

uint64_t sub_10000FF58()
{
  uint64_t v1 = self;
  id v2 = [*(id *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo) accountMediaType];
  id v3 = objc_msgSend(v1, "ams_sharedAccountStoreForMediaType:", v2);

  id v4 = objc_msgSend(v3, "ams_localiTunesAccount");
  uint64_t v5 = sub_10001158C();

  return v5;
}

uint64_t sub_100010044()
{
  return sub_100010174((SEL *)&selRef_ams_activeiTunesAccount);
}

uint64_t sub_100010094()
{
  id v0 = sub_1000100C8();
  uint64_t v1 = sub_10001158C();

  return v1;
}

id sub_1000100C8()
{
  return sub_100010268((SEL *)&selRef_ams_activeiTunesAccount);
}

uint64_t sub_100010118()
{
  return sub_100010174((SEL *)&selRef_ams_activeiCloudAccount);
}

uint64_t sub_100010168()
{
  return sub_100010174((SEL *)&selRef_ams_localiTunesAccount);
}

uint64_t sub_100010174(SEL *a1)
{
  id v2 = objc_msgSend(self, "ams_sharedAccountStore");
  id v3 = [v2 *a1];

  uint64_t v4 = sub_10001158C();
  return v4;
}

uint64_t sub_100010228()
{
  id v0 = sub_10001025C();
  uint64_t v1 = sub_10001158C();

  return v1;
}

id sub_10001025C()
{
  return sub_100010268((SEL *)&selRef_ams_localiTunesAccount);
}

id sub_100010268(SEL *a1)
{
  id v2 = objc_msgSend(self, "ams_sharedAccountStore");
  id v3 = [v2 *a1];

  return v3;
}

uint64_t sub_1000102C8()
{
  sub_100005A4C(0, &qword_10005CB80);
  id v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

void *sub_100010354(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v25 = a1;
  uint64_t v7 = sub_100045B80();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_1000457C0();
  uint64_t v12 = sub_1000457B0();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v21 = v7;
    uint64_t v22 = a4;
    uint64_t v20 = v8;
    uint64_t v11 = sub_1000100C8();
    id v14 = sub_10001025C();
    id v15 = objc_msgSend(self, "ams_sharedAccountStore");
    __src[3] = sub_100005A4C(0, &qword_10005CB88);
    __src[4] = &off_100055810;
    __src[0] = v15;
    sub_100010634(a3, v11, v14, __src, (uint64_t)v24);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)__src);
    if (v4)
    {
      swift_release();
    }
    else
    {

      sub_100011834((uint64_t)v24, (uint64_t)__src);
      uint64_t v16 = (void *)swift_allocObject();
      memcpy(v16 + 2, __src, 0x42uLL);
      uint64_t v17 = v22;
      v16[11] = v22;
      v16[12] = v13;
      v25;
      id v18 = v17;
      swift_retain();
      sub_100045B60();
      uint64_t v11 = (void *)sub_100045B70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v21);
      sub_100011900((uint64_t)v24);
    }
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v11;
}

void sub_100010634(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X3>, void *a4@<X4>, uint64_t a5@<X8>)
{
  sub_100045500();
  __chkstk_darwin();
  uint64_t v10 = sub_100045DF0();
  uint64_t v54 = v11;
  if (!v11)
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    goto LABEL_5;
  }
  uint64_t v46 = a1;
  id v43 = a2;
  uint64_t v42 = a3;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v45 = (void *)sub_100004A2C(&qword_10005CB98);
  uint64_t v49 = v45;
  v48[0] = &type metadata for AccountObjectHelper;
  id v12 = (id)AMSLogKey();
  uint64_t v44 = a5;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100045C30();
    uint64_t v15 = v10;
    uint64_t v17 = v16;

    sub_1000454F0();
    v55._countAndFlagsBits = 0;
    v55._object = (void *)0xE000000000000000;
    sub_1000454E0(v55);
    sub_100005548(v48, (uint64_t)v49);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v56._countAndFlagsBits = 5972026;
    v56._object = (void *)0xE300000000000000;
    sub_1000454E0(v56);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v51 = v14;
    uint64_t v52 = v17;
    uint64_t v10 = v15;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v57._countAndFlagsBits = 0;
    v57._object = (void *)0xE000000000000000;
    sub_1000454E0(v57);
    sub_100005548(v48, (uint64_t)v49);
    uint64_t v20 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v20;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_1000454E0(v19);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v48);
  sub_1000454B0();
  uint64_t v49 = &type metadata for String;
  v48[0] = v10;
  v48[1] = v54;
  swift_bridgeObjectRetain();
  sub_100045520();
  sub_100007820((uint64_t)v48);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v21 = a4[3];
  uint64_t v22 = a4[4];
  sub_100005548(a4, v21);
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
    sub_100045950();
    sub_100007D44();
    swift_allocError();
LABEL_5:
    sub_100045900();
    swift_willThrow();
    return;
  }
  id v25 = (id)v23;
LABEL_12:
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v49 = v45;
  v48[0] = &type metadata for AccountObjectHelper;
  id v27 = v24;
  id v28 = (id)AMSLogKey();
  uint64_t v47 = v27;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = sub_100045C30();
    uint64_t v31 = v10;
    uint64_t v33 = v32;

    sub_1000454F0();
    v58._countAndFlagsBits = 0;
    v58._object = (void *)0xE000000000000000;
    sub_1000454E0(v58);
    sub_100005548(v48, (uint64_t)v49);
    uint64_t v34 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v34;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v59._countAndFlagsBits = 5972026;
    v59._object = (void *)0xE300000000000000;
    sub_1000454E0(v59);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v51 = v30;
    uint64_t v52 = v33;
    uint64_t v10 = v31;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v35._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    sub_1000454E0(v60);
    sub_100005548(v48, (uint64_t)v49);
    uint64_t v36 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v51 = v36;
    sub_1000454D0();
    sub_100007820((uint64_t)&v51);
    v35._countAndFlagsBits = 58;
  }
  v35._object = (void *)0xE100000000000000;
  sub_1000454E0(v35);
  sub_100045510();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v48);
  sub_1000454B0();
  uint64_t v37 = (void *)sub_100005A4C(0, (unint64_t *)&qword_10005C630);
  uint64_t v49 = v37;
  v48[0] = v25;
  id v38 = v25;
  sub_100045540();
  sub_100007820((uint64_t)v48);
  sub_100034904();
  swift_bridgeObjectRelease();
  id v39 = self;
  uint64_t v40 = v54;
  NSString v41 = sub_100045C00();
  LOBYTE(v39) = [v39 acknowledgementNeededForPrivacyIdentifier:v41 account:v38];

  uint64_t v49 = v37;
  uint64_t v50 = &off_100055828;
  v48[0] = v38;
  sub_100011CD8(v48, v10, v40, (char)v39, v44);
}

uint64_t sub_100010D5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v18 = a6;
  uint64_t v10 = sub_100045420();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin();
  sub_100004A2C(&qword_10005CB90);
  sub_100011834(a4, (uint64_t)v19);
  sub_100045A60();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  *(void *)(v14 + ((v12 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  v19[3] = sub_1000457C0();
  v19[4] = &protocol witness table for RunLoopWorkerThread;
  v19[0] = v18;
  id v15 = a5;
  id v16 = a1;
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v19);
}

void sub_100010F4C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  sub_100045500();
  __chkstk_darwin();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v21 = (ValueMetadata *)type metadata accessor for JSAccountObject();
  v20[0] = a2;
  a2;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100045C30();
    uint64_t v10 = v9;

    sub_1000454F0();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_1000454E0(v22);
    sub_100005548(v20, (uint64_t)v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v18);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_1000454E0(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v8;
    v18[1] = v10;
    sub_1000454D0();
    sub_100007820((uint64_t)v18);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_1000454E0(v24);
    sub_100005548(v20, (uint64_t)v21);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v13;
    sub_1000454D0();
    sub_100007820((uint64_t)v18);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_1000454E0(v12);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
  sub_1000454B0();
  uint64_t v21 = &type metadata for JSAccountPrivacyAcknowledgementState;
  v20[0] = swift_allocObject();
  sub_100011834(a1, v20[0] + 16);
  sub_100045520();
  sub_100007820((uint64_t)v20);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000471C0;
  id v15 = sub_100011B34(a4);
  *(void *)(v14 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v14 + 32) = v15;
  id v16 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

uint64_t sub_10001158C()
{
  sub_100005A4C(0, &qword_10005CB80);
  id v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

id sub_100011604(void *a1, void *a2)
{
  if (a2)
  {
    v7[3] = sub_100005A4C(0, (unint64_t *)&qword_10005C630);
    v7[4] = &off_100055828;
    v7[0] = a2;
    id v4 = a2;
    id v5 = sub_10000F4B4(a1);
    sub_1000117C0((uint64_t)v7);
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

void sub_1000116C0()
{
}

id sub_100011700()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAccountObject()
{
  return self;
}

id sub_1000117A4(void *a1)
{
  return sub_100011604(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117C0(uint64_t a1)
{
  return a1;
}

void *sub_100011814(void *a1)
{
  return sub_100010354(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100011834(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100011890()
{
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v0 + 16);
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_1000118E0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100010D5C(a1, a2, a3, v3 + 16, *(void **)(v3 + 88), *(void *)(v3 + 96));
}

uint64_t sub_100011900(uint64_t a1)
{
  return a1;
}

uint64_t sub_100011954()
{
  uint64_t v1 = sub_100045420();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100011A3C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100045420() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void **)(v1 + 16);
  unint64_t v6 = *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_100010F4C(a1, v5, v1 + v4, v6);
}

uint64_t sub_100011ADC()
{
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v0 + 16);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 82, 7);
}

ValueMetadata *type metadata accessor for AccountObjectHelper()
{
  return &type metadata for AccountObjectHelper;
}

id sub_100011B34(void *a1)
{
  uint64_t v3 = self;
  id result = [v3 valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v5 = result;
  sub_10000F4B4(a1);
  sub_100045E10();
  sub_10000F938();
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v11 = &type metadata for String;
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  id v8 = a1;
  id result = sub_100025D08(&v9, a1);
  if (!result)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_100045E10();
  if (*(unsigned char *)(v1 + 64)) {
    goto LABEL_6;
  }
  id result = objc_msgSend(v3, "valueWithDouble:inContext:", v8, (double)*(uint64_t *)(v1 + 56), v9, v10);
  if (result)
  {
    sub_100045E10();
LABEL_6:
    id result = objc_msgSend(v3, "valueWithBool:inContext:", *(unsigned __int8 *)(v1 + 65), v8, v9, v10);
    if (result)
    {
      sub_100045E10();
      return v5;
    }
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100011CD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100005548(a1, v10);
  id v12 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96))(v10, v11);
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10002EBE0(a2, a3, (uint64_t)v12);
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
  sub_10000C7D4((uint64_t)a1, a5);
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = v12;
  *(unsigned char *)(a5 + 64) = v14;
  *(unsigned char *)(a5 + 65) = a4 & 1;

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
}

uint64_t destroy for JSAccountPrivacyAcknowledgementState(uint64_t a1)
{
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);

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
  sub_10000FA30((uint64_t *)a1, (uint64_t *)a2);
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
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
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

uint64_t sub_100012010()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_100012078()
{
  sub_1000457C0();
  uint64_t v0 = sub_1000457B0();
  sub_100045950();
  sub_100007D44();
  swift_allocError();
  sub_100045900();
  if (!v0) {
    return swift_willThrow();
  }
  swift_willThrow();
  return swift_release();
}

uint64_t sub_1000121CC()
{
  return sub_100012C24();
}

uint64_t sub_1000121E4(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100045B80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045500();
  __chkstk_darwin();
  uint64_t v10 = sub_1000457C0();
  uint64_t v11 = sub_1000457B0();
  if (v11)
  {
    uint64_t v12 = v11;
    id v37 = a1;
    id v38 = v9;
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v41[0] = a2;
    id v13 = a2;
    id v14 = (id)AMSLogKey();
    id v36 = v13;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = sub_100045C30();
      uint64_t v18 = v17;

      sub_1000454F0();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_1000454E0(v44);
      sub_100005548(v41, Object);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = DynamicType;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v45._countAndFlagsBits = 5972026;
      v45._object = (void *)0xE300000000000000;
      sub_1000454E0(v45);
      uint64_t MetatypeMetadata = &type metadata for String;
      v39[0] = v16;
      v39[1] = v18;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v20._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_1000454E0(v46);
      sub_100005548(v41, Object);
      uint64_t v21 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = v21;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v20._countAndFlagsBits = 58;
    }
    uint64_t v22 = v43;
    v20._object = (void *)0xE100000000000000;
    sub_1000454E0(v20);
    sub_100045510();
    uint64_t v10 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v41);
    sub_1000454B0();
    uint64_t Object = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    v41[0] = a3;
    id v23 = a3;
    sub_100045520();
    sub_100007820((uint64_t)v41);
    sub_100034904();
    swift_bridgeObjectRelease();
    sub_100003FD0(v23);
    if (!v22)
    {
      if (v24)
      {
        swift_bridgeObjectRelease();
        sub_100005A4C(0, &qword_10005CC50);
        id v26 = sub_10001278C();
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
        sub_100045B60();
        uint64_t v10 = sub_100045B70();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
        return v10;
      }
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100045950();
      sub_100007D44();
      swift_allocError();
      sub_100045900();
      swift_willThrow();
    }
    swift_release();
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v10;
}

id sub_10001278C()
{
  Class isa = sub_100045CD0().super.isa;
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() queryForBundleIDs:isa];

  return v1;
}

uint64_t sub_1000127F8(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v36 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a3;
  NSString v41 = a1;
  uint64_t v8 = sub_100045420();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin();
  uint64_t v31 = v10;
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004A2C(&qword_10005CC58);
  uint64_t v12 = sub_100045AE0();
  id v39 = sub_10001427C;
  uint64_t v40 = v12;
  uint64_t v35 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012B08;
  id v38 = &unk_1000560B8;
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
  id v38 = (void *)sub_1000457C0();
  id v39 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  aBlock[0] = v36;
  id v25 = v16;
  id v26 = v24;
  id v27 = v25;
  id v28 = v26;
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  swift_release();
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)aBlock);
}

uint64_t sub_100012B08(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100005A4C(0, (unint64_t *)&unk_10005CC70);
    uint64_t v4 = sub_100045CE0();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100012C0C()
{
  return sub_100012C24();
}

uint64_t sub_100012C24()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_100012C9C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = sub_100045B80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045500();
  __chkstk_darwin();
  uint64_t v10 = sub_1000457C0();
  uint64_t v11 = sub_1000457B0();
  if (v11)
  {
    uint64_t v12 = v11;
    id v37 = a1;
    id v38 = v9;
    uint64_t v34 = v7;
    uint64_t v35 = v6;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v41[0] = a2;
    id v13 = a2;
    id v14 = (id)AMSLogKey();
    id v36 = v13;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = sub_100045C30();
      uint64_t v18 = v17;

      sub_1000454F0();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_1000454E0(v44);
      sub_100005548(v41, Object);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = DynamicType;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v45._countAndFlagsBits = 5972026;
      v45._object = (void *)0xE300000000000000;
      sub_1000454E0(v45);
      uint64_t MetatypeMetadata = &type metadata for String;
      v39[0] = v16;
      v39[1] = v18;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v20._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v46._countAndFlagsBits = 0;
      v46._object = (void *)0xE000000000000000;
      sub_1000454E0(v46);
      sub_100005548(v41, Object);
      uint64_t v21 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v39[0] = v21;
      sub_1000454D0();
      sub_100007820((uint64_t)v39);
      v20._countAndFlagsBits = 58;
    }
    uint64_t v22 = v43;
    v20._object = (void *)0xE100000000000000;
    sub_1000454E0(v20);
    sub_100045510();
    uint64_t v10 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v41);
    sub_1000454B0();
    uint64_t Object = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    v41[0] = a3;
    id v23 = a3;
    sub_100045520();
    sub_100007820((uint64_t)v41);
    sub_100034904();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_100003FD0(v23);
    if (!v22)
    {
      if (v24)
      {
        swift_bridgeObjectRelease();
        sub_100005A4C(0, &qword_10005CC50);
        id v26 = sub_10001324C();
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
        sub_100045B60();
        uint64_t v10 = sub_100045B70();

        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v32, v35);
        return v10;
      }
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_100045950();
      sub_100007D44();
      swift_allocError();
      sub_100045900();
      swift_willThrow();
    }
    swift_release();
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v10;
}

id sub_10001324C()
{
  sub_100005A4C(0, (unint64_t *)&qword_10005C4D8);
  Class isa = sub_100045CD0().super.isa;
  swift_bridgeObjectRelease();
  id v1 = [(id)swift_getObjCClassFromMetadata() queryForStoreItemIDs:isa];

  return v1;
}

uint64_t sub_1000132D0(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v36 = a6;
  uint64_t v33 = a5;
  uint64_t v34 = a3;
  NSString v41 = a1;
  uint64_t v8 = sub_100045420();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin();
  uint64_t v31 = v10;
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004A2C(&qword_10005CC58);
  uint64_t v12 = sub_100045AE0();
  id v39 = sub_10001427C;
  uint64_t v40 = v12;
  uint64_t v35 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100012B08;
  id v38 = &unk_100056018;
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
  id v38 = (void *)sub_1000457C0();
  id v39 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  aBlock[0] = v36;
  id v25 = v16;
  id v26 = v24;
  id v27 = v25;
  id v28 = v26;
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  swift_release();
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)aBlock);
}

void sub_1000135E0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    NSString v2 = sub_100045C00();
    swift_getErrorValue();
    sub_100046120();
    NSString v3 = sub_100045C00();
    swift_bridgeObjectRelease();
    id v4 = (id)AMSError();

    sub_100045A80();
    swift_errorRelease();
  }
  else if (a1)
  {
    sub_100045AA0();
  }
  else
  {
    NSString v5 = sub_100045C00();
    id v6 = (id)AMSError();

    sub_100045A80();
  }
}

void sub_100013750(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045500();
  __chkstk_darwin(v5 - 8);
  sub_100014644();
  uint64_t v6 = *a1;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v7 = sub_100045550();
  sub_1000078C0(v7);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t Object = type metadata accessor for JSAppQueryObject();
  v22[0] = a2;
  a2;
  id v8 = (id)AMSLogKey();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_100045C30();
    uint64_t v12 = v11;

    sub_100014628();
    sub_1000145D4();
    sub_10001457C();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000145B4(MetatypeMetadata);
    sub_100007820((uint64_t)v21);
    sub_1000145F0();
    void v21[3] = &type metadata for String;
    v21[0] = v10;
    v21[1] = v12;
    sub_1000454D0();
    sub_100007820((uint64_t)v21);
    v14._countAndFlagsBits = 93;
  }
  else
  {
    sub_10001460C();
    sub_1000145D4();
    sub_10001457C();
    uint64_t v15 = swift_getMetatypeMetadata();
    sub_1000145B4(v15);
    sub_100007820((uint64_t)v21);
    v14._countAndFlagsBits = 58;
  }
  sub_100014674(v14);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v22);
  sub_1000454B0();
  uint64_t Object = sub_100004A2C(&qword_10005CC68);
  v22[0] = v6;
  swift_bridgeObjectRetain();
  sub_100045520();
  sub_100007820((uint64_t)v22);
  sub_100034904();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v16 = sub_100004C60(a3, v6);
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1000471C0;
  *(void *)(v17 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v17 + 32) = v16;
  id v18 = v16;
  Swift::String v19 = (void *)sub_100045410();

  swift_bridgeObjectRelease();
}

void sub_100013BD8(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045950();
  sub_100009FF4();
  uint64_t v43 = v8;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100045500();
  __chkstk_darwin(v12 - 8);
  sub_100014644();
  uint64_t v13 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v14 = sub_100045550();
  sub_1000078C0(v14);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v42 = v13;
  uint64_t v40 = v19 + 3 * v16;
  uint64_t v39 = v18 | 7;
  uint64_t v20 = swift_allocObject();
  long long v38 = xmmword_1000473B0;
  *(_OWORD *)(v20 + 16) = xmmword_1000473B0;
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
    uint64_t v23 = sub_100045C30();
    uint64_t v25 = v24;

    sub_100014628();
    sub_1000145D4();
    sub_10001457C();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000145B4(MetatypeMetadata);
    sub_100007820((uint64_t)v48);
    sub_1000145F0();
    void v48[3] = &type metadata for String;
    v48[0] = v23;
    v48[1] = v25;
    sub_1000454D0();
    sub_100007820((uint64_t)v48);
    v27._countAndFlagsBits = 93;
  }
  else
  {
    sub_10001460C();
    sub_1000145D4();
    sub_10001457C();
    uint64_t v28 = swift_getMetatypeMetadata();
    sub_1000145B4(v28);
    sub_100007820((uint64_t)v48);
    v27._countAndFlagsBits = 58;
  }
  sub_100014674(v27);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v49);
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v29 = v46;
  uint64_t v30 = v47;
  uint64_t v50 = v47;
  uint64_t v31 = sub_100005CD0(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v31, v29, v30);
  sub_100045520();
  sub_100007820((uint64_t)v49);
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1000471C0;
  swift_errorRetain();
  sub_10001A1C8(a1);
  v33.super.Class isa = v45;
  Class isa = sub_100045930(v33).super.isa;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  *(void *)(v32 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v32 + 32) = isa;
  uint64_t v35 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

id sub_10001418C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000141E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAppQueryObject()
{
  return self;
}

uint64_t sub_10001423C(void *a1)
{
  return sub_100012C9C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001425C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000132D0(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

void sub_10001427C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100014298(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000142A8()
{
  return swift_release();
}

uint64_t sub_1000142C0(void *a1)
{
  return sub_1000121E4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000142E0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100014328(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000127F8(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_10001434C()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_1000143E8(uint64_t *a1)
{
  sub_100045420();
  sub_100013750(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100014454()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_100014504(uint64_t a1)
{
  uint64_t v3 = sub_100045420();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100013BD8(a1, *(void **)(v1 + 16), v1 + v8, *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10001457C()
{
  sub_100005548((void *)(v0 - 120), *(void *)(v0 - 96));
  return swift_getDynamicType();
}

uint64_t sub_1000145B4(uint64_t a1)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 152) = v1;
  return sub_1000454D0();
}

void sub_1000145D4()
{
  v1._countAndFlagsBits = 0;
  v1._object = (void *)0xE000000000000000;
  sub_1000454E0(v1);
}

void sub_1000145F0()
{
  v1._countAndFlagsBits = 5972026;
  v1._object = (void *)0xE300000000000000;
  sub_1000454E0(v1);
}

uint64_t sub_10001460C()
{
  return sub_1000454F0();
}

uint64_t sub_100014628()
{
  return sub_1000454F0();
}

uint64_t sub_10001465C()
{
  return v0 + v1;
}

void sub_100014674(Swift::String a1)
{
  a1._object = (void *)0xE100000000000000;
  sub_1000454E0(a1);
}

id sub_10001468C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo] = a1;
  uint64_t v6 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient];
  *(void *)uint64_t v6 = a2;
  *((void *)v6 + 1) = a3;
  uint64_t v7 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext];
  char *v7 = a4;
  *((void *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_100014718()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext);
}

uint64_t sub_100014740()
{
  return sub_100014900((SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_1000147A8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100014858()
{
  return swift_bridgeObjectRetain();
}

id sub_100014884(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  NSString v5 = sub_100045C00();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_1000148F4()
{
  return sub_100014900((SEL *)&selRef_clientVersion);
}

uint64_t sub_100014900(SEL *a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo) *a1];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_100045C30();

  return v4;
}

void sub_100014970()
{
}

id sub_1000149B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSClientObject()
{
  return self;
}

const char *sub_100014A6C()
{
  return "AppleMediaServicesUI";
}

const char *sub_100014A80()
{
  return "JetIntents";
}

uint64_t sub_100014A94(uint64_t a1)
{
  uint64_t v2 = sub_1000459E0();
  uint64_t v3 = sub_100017ED4(v2);
  __chkstk_darwin(v3);
  sub_10000CB30();
  uint64_t v116 = v4;
  sub_100017F6C();
  uint64_t v142 = sub_100045980();
  uint64_t v125 = *(void *)(v142 - 8);
  uint64_t v5 = v125;
  __chkstk_darwin(v142);
  sub_10000CB30();
  uint64_t v115 = v6;
  uint64_t v7 = sub_100004A2C(&qword_10005C838);
  uint64_t v8 = sub_100017ED4(v7);
  __chkstk_darwin(v8);
  sub_10000CB30();
  uint64_t v123 = v9;
  sub_100017F6C();
  uint64_t v10 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v127 = v11;
  __chkstk_darwin(v12);
  sub_100017F10();
  uint64_t v126 = v14 - v13;
  uint64_t v15 = sub_1000458B0();
  sub_100009FF4();
  uint64_t v129 = v16;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v124 = (char *)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v134 = (char *)&v107 - v20;
  type metadata accessor for DynamicAccountsStore();
  sub_100045700();
  sub_1000458C0();
  uint64_t v21 = v141[0];
  id v111 = DynamicAccountsStore.account.getter();
  uint64_t v135 = v15;
  sub_1000458C0();
  sub_100005A4C(0, &qword_10005C638);
  sub_100017E14();
  id v121 = (id)v141[0];
  sub_100017E14();
  sub_100005A4C(0, &qword_10005C938);
  sub_100017E14();
  id v114 = v139;
  sub_100017E14();
  uint64_t v131 = (uint64_t)v139;
  id v137 = v140;
  sub_100017E14();
  LODWORD(v122) = v139;
  id v109 = v140;
  uint64_t v128 = v10;
  sub_1000458C0();
  type metadata accessor for URLSessionHandler();
  uint64_t v118 = a1;
  sub_100017E14();
  id v110 = v139;
  sub_100004A2C(&qword_10005CE00);
  uint64_t v22 = *(void *)(v5 + 72);
  uint64_t v23 = v125;
  unint64_t v24 = (*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80);
  uint64_t v25 = swift_allocObject();
  size_t v112 = v25;
  *(_OWORD *)(v25 + 16) = xmmword_1000478B0;
  unint64_t v113 = v24;
  unint64_t v26 = v25 + v24;
  sub_10000C7D4((uint64_t)v141, v25 + v24);
  uint64_t v130 = *(void (**)(void))(v23 + 104);
  uint64_t v27 = v142;
  sub_100017E74();
  v28();
  uint64_t v29 = (void *)(v26 + v22);
  id v30 = objc_allocWithZone((Class)type metadata accessor for JSAccountObject());
  uint64_t v133 = v21;
  swift_retain();
  id v31 = v121;
  id v32 = sub_10000FE44(v21, (uint64_t)v31);
  *uint64_t v29 = 0x746E756F636361;
  v29[1] = 0xE700000000000000;
  v29[2] = v32;
  uint64_t v33 = enum case for JSStack.Prerequisite.globalObject(_:);
  uint64_t v34 = v27;
  uint64_t v35 = v130;
  uint64_t v136 = v23 + 104;
  sub_100017E74();
  v35();
  id v36 = [objc_allocWithZone((Class)type metadata accessor for JSAppQueryObject()) init];
  id v37 = sub_100017E64((uint64_t)v36, 0x7972657551707061);
  ((void (*)(void *, uint64_t, uint64_t))v35)(v37, v33, v34);
  long long v38 = (void *)(v26 + 3 * v22);
  unint64_t v39 = v26;
  id v40 = objc_allocWithZone((Class)type metadata accessor for JSClientObject());
  id v41 = v31;
  id v108 = v41;
  uint64_t v42 = (uint64_t)v137;
  swift_bridgeObjectRetain();
  id v43 = sub_10001468C((uint64_t)v41, v131, v42, v122, (uint64_t)v109);
  void *v38 = 0x746E65696C63;
  v38[1] = 0xE600000000000000;
  v38[2] = v43;
  uint64_t v44 = v35;
  sub_100017E74();
  v35();
  unint64_t v120 = v39;
  Swift::String v45 = (void *)(v39 + 4 * v22);
  id v46 = [objc_allocWithZone((Class)type metadata accessor for JSDeviceObject()) init];
  *Swift::String v45 = 0x656369766564;
  v45[1] = 0xE600000000000000;
  void v45[2] = v46;
  LODWORD(v41) = v33;
  sub_100017E74();
  v35();
  uint64_t v47 = v141[5];
  uint64_t v48 = (objc_class *)type metadata accessor for JSLocalizationObject();
  uint64_t v49 = (char *)objc_allocWithZone(v48);
  *(void *)&v49[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject_localizations] = v47;
  v138.receiver = v49;
  v138.super_class = v48;
  swift_bridgeObjectRetain();
  id v50 = objc_msgSendSuper2(&v138, "init");
  sub_100017E64((uint64_t)v50, 0x617A696C61636F6CLL);
  LODWORD(v121) = v41;
  sub_100017E74();
  v35();
  unint64_t v51 = v120;
  id v52 = [objc_allocWithZone((Class)type metadata accessor for JSLogObject()) init];
  sub_100017E64((uint64_t)v52, 6778732);
  sub_100017E74();
  v35();
  uint64_t v132 = v22;
  unint64_t v53 = v51;
  uint64_t v54 = v128;
  uint64_t v55 = (uint64_t)v123;
  (*(void (**)(void, uint64_t, uint64_t))(v127 + 16))(v123, v126, v128);
  sub_100005994(v55, 0, 1, v54);
  id v56 = objc_allocWithZone((Class)type metadata accessor for JSServiceObject());
  id v57 = sub_100025A74(v55);
  sub_100017F58((uint64_t)v57, 0x65636976726573);
  uint64_t v58 = v121;
  sub_100017E74();
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
  id v69 = sub_10001AB70(v67, v62, (uint64_t)v65, v131, v66);
  void *v60 = 0x6E6974656B72616DLL;
  v60[1] = 0xE900000000000067;
  v60[2] = v69;
  ((void (*)(void *, uint64_t, uint64_t))v130)(v60, v58, v142);
  uint64_t v70 = (void *)(v120 + 9 * v59);
  uint64_t v71 = v62;
  sub_100017EA0();
  v72();
  id v73 = objc_allocWithZone((Class)type metadata accessor for JSMediaAPIObject());
  uint64_t v74 = v133;
  swift_retain();
  id v75 = v65;
  uint64_t v76 = (uint64_t)v137;
  swift_bridgeObjectRetain();
  id v77 = v110;
  id v78 = sub_10001CE90(v74, v71, v75, v68, v76, v77);
  *uint64_t v70 = 0x495041616964656DLL;
  v70[1] = 0xE800000000000000;
  v70[2] = v78;
  uint64_t v79 = v121;
  uint64_t v80 = v142;
  uint64_t v81 = v130;
  ((void (*)(void *, void, uint64_t))v130)(v70, v121, v142);
  id v82 = [objc_allocWithZone((Class)type metadata accessor for JSEngagementObject()) init];
  uint64_t v83 = sub_100017E64((uint64_t)v82, 0x656D656761676E65);
  ((void (*)(void *, uint64_t, uint64_t))v81)(v83, v79, v80);
  uint64_t v84 = (uint64_t)v124;
  sub_100017EA0();
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
  id v93 = sub_10001F84C(v87, v84, v88, v131, v92, v89);
  uint64_t v94 = sub_100017F58((uint64_t)v93, 0x6B726F7774656ELL);
  uint64_t v95 = v142;
  ((void (*)(void *, uint64_t, uint64_t))v81)(v94, v79, v142);
  id v96 = [objc_allocWithZone((Class)type metadata accessor for JSSessionAuthenticatorObject()) init];
  *uint64_t v90 = 0xD000000000000014;
  v90[1] = 0x8000000100049B60;
  v90[2] = v96;
  ((void (*)(void *, uint64_t, uint64_t))v81)(v90, v79, v95);
  unint64_t v98 = *(void *)(v91 + 16);
  unint64_t v97 = *(void *)(v91 + 24);
  if (v98 >= v97 >> 1) {
    size_t v91 = sub_1000179E8(v97 > 1, v98 + 1, 1, v91, &qword_10005CE00, (uint64_t (*)(void))&type metadata accessor for JSStack.Prerequisite, (void (*)(unint64_t, uint64_t, char *))sub_100004870);
  }
  *(void *)(v91 + 16) = v98 + 1;
  (*(void (**)(size_t, void *, uint64_t))(v125 + 32))(v91 + v113 + v98 * v132, v90, v95);
  sub_100045A10();
  swift_retain();
  id v99 = v114;
  sub_1000459D0();
  uint64_t v100 = v117;
  uint64_t v101 = sub_1000459F0();
  if (v100)
  {
    swift_release();

    swift_release();
    sub_10000CB50();
    v102();
    sub_100017958((uint64_t)v141);
    sub_10000CB50();
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
    sub_1000459A0();
    swift_release();
    swift_release();
    if (deviceIsRunningInternalBuild()) {
      sub_1000459B0();
    }

    swift_release();
    swift_release();

    sub_10000CB50();
    v105();
    sub_100017958((uint64_t)v141);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v134, v135);
  }
  return v104;
}

void sub_100015700(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100045500();
  __chkstk_darwin(v4 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v18 = type metadata accessor for JSDataProvider();
  v17[0] = a2;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100045C30();
    uint64_t v9 = v8;

    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000454D0();
    sub_100017C10((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_1000454E0(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v7;
    v15[1] = v9;
    sub_1000454D0();
    sub_100017C10((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_1000454E0(v21);
    sub_100005548(v17, v18);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v12;
    sub_1000454D0();
    sub_100017C10((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_1000454E0(v11);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v17);
  sub_1000454B0();
  sub_100034904();
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

uint64_t sub_1000159D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[74] = a4;
  v4[73] = a3;
  v4[72] = a2;
  v4[71] = a1;
  uint64_t v5 = sub_100004A2C(&qword_10005CDD8);
  sub_100017ED4(v5);
  v4[75] = sub_100017EBC();
  uint64_t v6 = sub_100045950();
  v4[76] = v6;
  sub_1000078C0(v6);
  v4[77] = v7;
  v4[78] = swift_task_alloc();
  v4[79] = swift_task_alloc();
  uint64_t v8 = sub_100004A2C(&qword_10005C9E0);
  sub_100017ED4(v8);
  v4[80] = sub_100017EBC();
  uint64_t v9 = sub_1000455A0();
  v4[81] = v9;
  sub_1000078C0(v9);
  v4[82] = v10;
  v4[83] = sub_100017EBC();
  uint64_t v11 = sub_100004A2C(&qword_10005CDE0);
  v4[84] = v11;
  sub_1000078C0(v11);
  v4[85] = v12;
  v4[86] = sub_100017EBC();
  uint64_t v13 = sub_100045480();
  v4[87] = v13;
  sub_1000078C0(v13);
  v4[88] = v14;
  v4[89] = swift_task_alloc();
  v4[90] = swift_task_alloc();
  uint64_t v15 = sub_100045730();
  v4[91] = v15;
  sub_1000078C0(v15);
  v4[92] = v16;
  v4[93] = sub_100017EBC();
  uint64_t v17 = sub_100045690();
  v4[94] = v17;
  sub_1000078C0(v17);
  v4[95] = v18;
  v4[96] = sub_100017EBC();
  return _swift_task_switch(sub_100015C10, 0, 0);
}

uint64_t sub_100015C10()
{
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[72];
  v0[51] = type metadata accessor for JSServiceRequest();
  v0[52] = sub_100017910(&qword_10005CDE8, (void (*)(uint64_t))type metadata accessor for JSServiceRequest);
  uint64_t v3 = sub_100017B68(v0 + 48);
  sub_1000178AC(v2, (uint64_t)v3);
  v0[97] = *(void *)(v1 + 16);
  uint64_t v4 = v0[51];
  uint64_t v5 = v0[52];
  sub_100005548(v0 + 48, v4);
  v0[45] = v4;
  v0[46] = *(void *)(v5 + 8);
  v0[47] = *(void *)(v5 + 16);
  sub_100017B68(v0 + 42);
  sub_100017F4C();
  (*(void (**)(void))(v6 + 16))();
  sub_100045740();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[98] = (uint64_t)v7;
  void *v7 = v0;
  v7[1] = sub_100015DE4;
  uint64_t v8 = v0[96];
  uint64_t v9 = v0[93];
  uint64_t v10 = v0[91];
  uint64_t v11 = v0[73];
  return JSStack.dispatch<A>(_:objectGraph:)(v8, v9, v11, v10, &protocol witness table for JSRequestIntent);
}

uint64_t sub_100015DE4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 792) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[92] + 8))(v2[93], v2[91]);
  if (v0) {
    uint64_t v3 = sub_100016794;
  }
  else {
    uint64_t v3 = sub_100015F78;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100015F78()
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
  sub_100045680();
  sub_1000455E0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v67);
  sub_100045590();
  sub_100045430();
  uint64_t v8 = sub_1000456B0();
  if (sub_100005A24(v7, 1, v8) == 1)
  {
    sub_100017C10(*(void *)(v0 + 640), &qword_10005C9E0);
LABEL_6:
    id v25 = [objc_allocWithZone((Class)NSError) init];
    goto LABEL_7;
  }
  uint64_t v9 = sub_1000456A0();
  sub_100017F4C();
  sub_10000CB50();
  v10();
  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v11 = self;
  Class isa = sub_100045BC0().super.isa;
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
    uint64_t v20 = sub_100045110();
    uint64_t v22 = v21;

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v63);
    uint64_t v23 = *(void (**)(void))(v16 + 8);
    sub_100017E54();
    v23();
    uint64_t *v19 = v20;
    v19[1] = v22;
    sub_100017E54();
    v23();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v65, v64);
    sub_1000459C0();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v66);
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
  id v25 = (id)sub_100045010();

LABEL_7:
  swift_willThrow();
  uint64_t v26 = *(void *)(v0 + 768);
  uint64_t v27 = *(void *)(v0 + 760);
  uint64_t v28 = *(void *)(v0 + 752);
  uint64_t v29 = *(void *)(v0 + 704);
  (*(void (**)(void, void))(*(void *)(v0 + 656) + 8))(*(void *)(v0 + 664), *(void *)(v0 + 648));
  id v30 = *(void (**)(void))(v29 + 8);
  sub_100017E54();
  v30();
  sub_100017E54();
  v30();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  uint64_t v31 = *(void *)(v0 + 600);
  *(void *)(v0 + 552) = v25;
  swift_errorRetain();
  sub_100004A2C(&qword_10005CDF0);
  if (swift_dynamicCast())
  {
    uint64_t v32 = *(void *)(v0 + 632);
    uint64_t v33 = *(void *)(v0 + 624);
    uint64_t v34 = *(void *)(v0 + 616);
    uint64_t v35 = *(void *)(v0 + 608);
    uint64_t v36 = sub_100017F38();
    sub_100005994(v36, v37, v38, v35);
    unint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
    v39(v32, v31, v35);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v33, v32, v35);
    sub_100017910((unint64_t *)&qword_10005CC30, (void (*)(uint64_t))&type metadata accessor for JSError);
    uint64_t v40 = swift_allocError();
    v39(v41, v33, v35);
    uint64_t v42 = (void *)sub_100045000();
    sub_100004A2C(&qword_10005CDF8);
    uint64_t inited = swift_initStackObject();
    sub_100017E80((__n128 *)inited, (__n128)xmmword_1000472A0);
    sub_100045F40();
    uint64_t v44 = sub_1000458F0();
    if (v45)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_100017EF8();
      *(void *)(inited + 72) = v48;
      *(void *)(inited + 80) = v47;
    }
    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v44;
      sub_100005AE4((_OWORD *)(v0 + 424), (_OWORD *)(inited + 72));
    }
    sub_100017F20();
    sub_100017F78();
    sub_100045F40();
    uint64_t v49 = sub_1000458E0();
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
      sub_100005AE4((_OWORD *)(v0 + 456), (_OWORD *)(inited + 144));
    }
    uint64_t v51 = *(void *)(v0 + 632);
    uint64_t v52 = *(void *)(v0 + 616);
    uint64_t v53 = *(void *)(v0 + 608);
    sub_100017EE0();
    *(void *)(v0 + 528) = 0xE700000000000000;
    sub_100045F40();
    uint64_t v54 = sub_100045910();
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v54;
    *(void *)(inited + 224) = v55;
    sub_100017E30();
    sub_100045F40();
    uint64_t v56 = sub_100045940();
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
    sub_100045BE0();
    Class v60 = sub_100045BC0().super.isa;
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
    sub_100005994(v46, 1, 1, *(void *)(v0 + 608));
    sub_100017C10(v46, &qword_10005CDD8);
    swift_willThrow();
  }
  sub_1000459C0();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v66);
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

uint64_t sub_100016794()
{
  uint64_t v1 = *(void *)(v0 + 608);
  *(void *)(v0 + 552) = *(void *)(v0 + 792);
  swift_errorRetain();
  sub_100004A2C(&qword_10005CDF0);
  if (swift_dynamicCast())
  {
    uint64_t v2 = *(void *)(v0 + 632);
    uint64_t v3 = *(void *)(v0 + 624);
    uint64_t v4 = *(void *)(v0 + 616);
    uint64_t v5 = *(void *)(v0 + 608);
    uint64_t v6 = sub_100017F38();
    sub_100005994(v6, v7, v8, v5);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v9(v2, v1, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
    sub_100017910((unint64_t *)&qword_10005CC30, (void (*)(uint64_t))&type metadata accessor for JSError);
    swift_allocError();
    v9(v10, v3, v5);
    uint64_t v11 = (void *)sub_100045000();
    sub_100004A2C(&qword_10005CDF8);
    uint64_t inited = swift_initStackObject();
    sub_100017E80((__n128 *)inited, (__n128)xmmword_1000472A0);
    sub_100045F40();
    uint64_t v13 = sub_1000458F0();
    if (v14)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_100017EF8();
      *(void *)(inited + 72) = v17;
      *(void *)(inited + 80) = v16;
    }
    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v13;
      sub_100005AE4((_OWORD *)(v0 + 424), (_OWORD *)(inited + 72));
    }
    sub_100017F20();
    sub_100017F78();
    sub_100045F40();
    uint64_t v18 = sub_1000458E0();
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
      sub_100005AE4((_OWORD *)(v0 + 456), (_OWORD *)(inited + 144));
    }
    uint64_t v20 = *(void *)(v0 + 632);
    uint64_t v21 = *(void *)(v0 + 616);
    uint64_t v22 = *(void *)(v0 + 608);
    sub_100017EE0();
    *(void *)(v0 + 528) = 0xE700000000000000;
    sub_100045F40();
    uint64_t v23 = sub_100045910();
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v23;
    *(void *)(inited + 224) = v24;
    sub_100017E30();
    sub_100045F40();
    uint64_t v25 = sub_100045940();
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
    sub_100045BE0();
    Class isa = sub_100045BC0().super.isa;
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
    sub_100005994(v15, 1, 1, *(void *)(v0 + 608));
    sub_100017C10(v15, &qword_10005CDD8);
    swift_willThrow();
  }
  sub_1000459C0();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v0 + 384);
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

uint64_t sub_100016C20(void *a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005C838);
  uint64_t v4 = sub_100017ED4(v3);
  __chkstk_darwin(v4);
  sub_10000CB30();
  uint64_t v49 = v5;
  sub_100017F6C();
  v47[1] = sub_100045BB0();
  sub_100009FF4();
  uint64_t v51 = v6;
  __chkstk_darwin(v7);
  sub_100017F10();
  uint64_t v50 = sub_100045970();
  sub_100009FF4();
  uint64_t v53 = v8;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v52 = (char *)v47 - v13;
  sub_100017F6C();
  uint64_t v14 = sub_100045500();
  uint64_t v15 = sub_100017ED4(v14);
  __chkstk_darwin(v15);
  sub_100017F10();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v16 = sub_100045550();
  sub_1000078C0(v16);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  *((void *)&v55 + 1) = type metadata accessor for JSDataProvider();
  *(void *)&long long v54 = v1;
  uint64_t v48 = v1;
  swift_retain();
  id v17 = (id)AMSLogKey();
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = sub_100045C30();
    uint64_t v20 = v12;
    uint64_t v21 = a1;
    uint64_t v23 = v22;

    sub_1000454F0();
    v59._countAndFlagsBits = 0;
    v59._object = (void *)0xE000000000000000;
    sub_1000454E0(v59);
    uint64_t v24 = sub_100017F8C();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = v24;
    sub_1000454D0();
    sub_100017C10((uint64_t)v57, (uint64_t *)&unk_10005CC40);
    v60._countAndFlagsBits = 5972026;
    v60._object = (void *)0xE300000000000000;
    sub_1000454E0(v60);
    uint64_t MetatypeMetadata = &type metadata for String;
    v57[0] = v19;
    v57[1] = v23;
    a1 = v21;
    uint64_t v12 = v20;
    sub_1000454D0();
    sub_100017C10((uint64_t)v57, (uint64_t *)&unk_10005CC40);
    v25._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v61._countAndFlagsBits = 0;
    v61._object = (void *)0xE000000000000000;
    sub_1000454E0(v61);
    uint64_t v26 = sub_100017F8C();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = v26;
    sub_1000454D0();
    sub_100017C10((uint64_t)v57, (uint64_t *)&unk_10005CC40);
    v25._countAndFlagsBits = 58;
  }
  v25._object = (void *)0xE100000000000000;
  sub_1000454E0(v25);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v54);
  sub_1000454B0();
  uint64_t v27 = type metadata accessor for JSServiceRequest();
  *((void *)&v55 + 1) = v27;
  unint64_t v28 = sub_100017B68((uint64_t *)&v54);
  sub_1000178AC((uint64_t)a1, (uint64_t)v28);
  sub_100045540();
  sub_100017C10((uint64_t)&v54, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v29 = v52;
  sub_100045960();
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v12, v29, v50);
  sub_100045B90();
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
  sub_100045BA0();
  sub_100017C10((uint64_t)&v54, (uint64_t *)&unk_10005CC40);
  uint64_t v33 = a1[2];
  if (v33)
  {
    *((void *)&v55 + 1) = sub_100004A2C(&qword_10005C500);
    *(void *)&long long v54 = v33;
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_100045BA0();
  sub_100017C10((uint64_t)&v54, (uint64_t *)&unk_10005CC40);
  sub_100017BA8((uint64_t)a1 + *(int *)(v27 + 24), v32);
  uint64_t v34 = sub_1000450E0();
  if (sub_100005A24(v32, 1, v34) == 1)
  {
    sub_100017C10(v32, &qword_10005C838);
    long long v54 = 0u;
    long long v55 = 0u;
  }
  else
  {
    uint64_t v35 = sub_100045040();
    *((void *)&v55 + 1) = &type metadata for String;
    *(void *)&long long v54 = v35;
    *((void *)&v54 + 1) = v36;
    sub_100017F4C();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v32, v34);
  }
  uint64_t v38 = v48;
  sub_100045BA0();
  sub_100017C10((uint64_t)&v54, (uint64_t *)&unk_10005CC40);
  sub_100004A2C(&qword_10005CE10);
  uint64_t v39 = sub_100045AE0();
  sub_100045990();
  uint64_t v40 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
  swift_retain_n();
  uint64_t v41 = sub_100045D80();
  *((void *)&v55 + 1) = v40;
  uint64_t v56 = &protocol witness table for OS_dispatch_queue;
  *(void *)&long long v54 = v41;
  sub_100045A40();
  swift_release();
  swift_release_n();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v54);
  *((void *)&v55 + 1) = sub_1000457A0();
  uint64_t v56 = &protocol witness table for SyncTaskScheduler;
  sub_100017B68((uint64_t *)&v54);
  sub_100045790();
  uint64_t v42 = swift_allocObject();
  swift_weakInit();
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = v38;
  *(void *)(v43 + 24) = v42;
  swift_retain();
  sub_100045A70();
  swift_release();
  sub_10000CB50();
  v44();
  sub_10000CB50();
  v45();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v54);
  return v39;
}

uint64_t sub_10001734C(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005CDD8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100045950();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v14 - v10;
  v14[1] = a1;
  swift_errorRetain();
  sub_100004A2C(&qword_10005CDF0);
  if (swift_dynamicCast())
  {
    sub_100005994((uint64_t)v4, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    sub_100005A4C(0, &qword_10005CE18);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v12 = sub_100037F08((uint64_t)v9);
    sub_100045A80();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  else
  {
    sub_100005994((uint64_t)v4, 1, 1, v5);
    sub_100017C10((uint64_t)v4, &qword_10005CDD8);
    return sub_100045A80();
  }
}

uint64_t sub_100017578(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100045500();
  __chkstk_darwin(v3 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v16 = type metadata accessor for JSDataProvider();
  v15[0] = a2;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_100045C30();
    uint64_t v8 = v7;

    sub_1000454F0();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_1000454E0(v17);
    sub_100005548(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000454D0();
    sub_100017C10((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_1000454E0(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v6;
    v13[1] = v8;
    sub_1000454D0();
    sub_100017C10((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v10._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v15, v16);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v11;
    sub_1000454D0();
    sub_100017C10((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v10._countAndFlagsBits = 58;
  }
  v10._object = (void *)0xE100000000000000;
  sub_1000454E0(v10);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v15);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1000459C0();
    return swift_release();
  }
  return result;
}

uint64_t sub_100017850()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for JSDataProvider()
{
  return self;
}

uint64_t sub_1000178AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSServiceRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017910(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017958(uint64_t a1)
{
  return a1;
}

void sub_1000179AC(void *a1)
{
  sub_100015700(a1, v1);
}

size_t sub_1000179B4(size_t a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1000179E8(a1, a2, a3, a4, &qword_10005CE08, (uint64_t (*)(void))type metadata accessor for JSSourceInfo, (void (*)(unint64_t, uint64_t, char *))sub_100004888);
}

size_t sub_1000179E8(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void), void (*a7)(unint64_t, uint64_t, char *))
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
  sub_100004A2C(a5);
  uint64_t v15 = a6(0);
  sub_1000078C0(v15);
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
  sub_10000713C();
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

uint64_t *sub_100017B68(uint64_t *a1)
{
  sub_10000713C();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

uint64_t sub_100017BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005C838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017C10(uint64_t a1, uint64_t *a2)
{
  sub_100004A2C(a2);
  sub_100017F4C();
  sub_10000CB50();
  v3();
  return a1;
}

uint64_t sub_100017C68(uint64_t a1)
{
  return sub_10001734C(a1);
}

uint64_t sub_100017C70()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017CA8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100017CE8(uint64_t a1)
{
  return sub_100017578(a1, *(void *)(v1 + 16));
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
      JUMPOUT(0x100017D8CLL);
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

unint64_t sub_100017DC8()
{
  unint64_t result = qword_10005CE20;
  if (!qword_10005CE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005CE20);
  }
  return result;
}

uint64_t sub_100017E14()
{
  return sub_1000458C0();
}

void sub_100017E30()
{
  *(void *)(v0 + 536) = 0x5255656372756F73;
  *(void *)(v0 + 544) = 0xE90000000000004CLL;
}

void *sub_100017E64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *int v3 = a2;
  v3[1] = v2;
  v3[2] = a1;
  return v3;
}

__n128 *sub_100017E80(__n128 *result, __n128 a2)
{
  result[1] = a2;
  *(void *)(v2 + 488) = 0x6E6D756C6F63;
  *(void *)(v2 + 496) = 0xE600000000000000;
  return result;
}

uint64_t sub_100017EBC()
{
  return swift_task_alloc();
}

uint64_t sub_100017ED4(uint64_t a1)
{
  return a1 - 8;
}

void sub_100017EE0()
{
  *(void *)(v0 + 520) = 0x6567617373656DLL;
}

uint64_t sub_100017F38()
{
  return *(void *)(v0 + 600);
}

void *sub_100017F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v2 = a2;
  v2[1] = 0xE700000000000000;
  v2[2] = a1;
  return v2;
}

uint64_t sub_100017F6C()
{
  return 0;
}

void sub_100017F78()
{
  *(void *)(v0 + 504) = 1701734764;
  *(void *)(v0 + 512) = 0xE400000000000000;
}

uint64_t sub_100017F8C()
{
  sub_100005548((void *)(v0 - 160), *(void *)(v0 - 136));
  return swift_getDynamicType();
}

uint64_t sub_100017FDC()
{
  if (deviceIsRunningInternalBuild()) {
    return 0x6C616E7265746E69;
  }
  if (deviceIsRunningSeedBuild()) {
    return 1684366707;
  }
  return 0x72656D6F74737563;
}

id sub_100018060(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  NSString v5 = sub_100045C00();
  swift_bridgeObjectRelease();

  return v5;
}

uint64_t sub_1000180D0()
{
  uint64_t v0 = self;
  uint64_t v1 = sub_100018384(v0);
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

uint64_t sub_100018160()
{
  return sub_100018208((SEL *)&selRef_deviceGUID);
}

uint64_t sub_100018184()
{
  return sub_100018208((SEL *)&selRef_language);
}

uint64_t sub_1000181A8()
{
  uint64_t v0 = self;
  uint64_t result = sub_100003EC0(v0, (SEL *)&selRef_modelPartNumber);
  if (!v2) {
    return 0;
  }
  return result;
}

uint64_t sub_1000181FC()
{
  return sub_100018208((SEL *)&selRef_productType);
}

uint64_t sub_100018208(SEL *a1)
{
  id v1 = [self *a1];
  uint64_t v2 = sub_100045C30();

  return v2;
}

uint64_t sub_100018280()
{
  uint64_t v0 = self;
  uint64_t result = sub_100003EC0(v0, (SEL *)&selRef_serialNumber);
  if (!v2) {
    return 0x6E776F6E6B6E75;
  }
  return result;
}

id sub_1000182D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001832C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSDeviceObject()
{
  return self;
}

uint64_t sub_100018384(void *a1)
{
  id v1 = [a1 carrierNames];
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  uint64_t v3 = sub_100045CE0();

  return v3;
}

uint64_t sub_1000183DC()
{
  return sub_100018C30();
}

uint64_t sub_1000183F4(void *a1, void *a2, void *a3)
{
  id v38 = a1;
  uint64_t v6 = sub_100045B80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_1000457C0();
  uint64_t v12 = sub_1000457B0();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100007BF4(a2);
    if (v3)
    {
      swift_release();
    }
    else
    {
      uint64_t v33 = v14;
      uint64_t v30 = v7;
      sub_100004A2C((uint64_t *)&unk_10005E040);
      uint64_t v32 = *(void *)(*(void *)(sub_100045550() - 8) + 72);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
      uint64_t v37 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v36[0] = a3;
      id v31 = a3;
      id v15 = (id)AMSLogKey();
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = sub_100045C30();
        uint64_t v29 = v18;

        sub_1000454F0();
        v39._countAndFlagsBits = 0;
        v39._object = (void *)0xE000000000000000;
        sub_1000454E0(v39);
        sub_100005548(v36, (uint64_t)v37);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v34[0] = DynamicType;
        sub_1000454D0();
        sub_100007820((uint64_t)v34);
        v40._countAndFlagsBits = 5972026;
        v40._object = (void *)0xE300000000000000;
        sub_1000454E0(v40);
        uint64_t MetatypeMetadata = &type metadata for String;
        v34[0] = v17;
        v34[1] = v29;
        sub_1000454D0();
        sub_100007820((uint64_t)v34);
        v20._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v41._countAndFlagsBits = 0;
        v41._object = (void *)0xE000000000000000;
        sub_1000454E0(v41);
        sub_100005548(v36, (uint64_t)v37);
        uint64_t v21 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v34[0] = v21;
        sub_1000454D0();
        sub_100007820((uint64_t)v34);
        v20._countAndFlagsBits = 58;
      }
      v20._object = (void *)0xE100000000000000;
      sub_1000454E0(v20);
      sub_100045510();
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v36);
      sub_1000454B0();
      uint64_t v37 = &type metadata for EngagementEvent;
      uint64_t v22 = v33;
      v36[0] = v33;
      swift_bridgeObjectRetain();
      sub_100045520();
      sub_100007820((uint64_t)v36);
      sub_100034904();
      swift_bridgeObjectRelease();
      unint64_t v23 = (void *)swift_allocObject();
      uint64_t v24 = v31;
      v23[2] = v22;
      uint64_t v23[3] = v24;
      v23[4] = v13;
      id v25 = v24;
      id v26 = v38;
      swift_retain();
      sub_100045B60();
      uint64_t v11 = sub_100045B70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v6);
    }
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v11;
}

uint64_t sub_1000188BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v37 = a6;
  uint64_t v32 = a5;
  uint64_t v34 = a3;
  Swift::String v40 = a1;
  uint64_t v7 = sub_100045420();
  uint64_t v38 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v30 = v9;
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [objc_allocWithZone((Class)AMSEngagement) init];
  id v36 = v11;
  Class isa = sub_100045BC0().super.isa;
  id v13 = [v11 enqueueData:isa];

  sub_100004A2C(&qword_10005CE80);
  id v35 = v13;
  uint64_t v33 = sub_100045AD0();
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
  void v39[3] = sub_1000457C0();
  v39[4] = &protocol witness table for RunLoopWorkerThread;
  v39[0] = v37;
  id v24 = v16;
  id v25 = v23;
  id v26 = v24;
  id v27 = v25;
  swift_retain();
  sub_100045A40();

  swift_release();
  swift_release();
  swift_release();

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v39);
}

uint64_t sub_100018C18()
{
  return sub_100018C30();
}

uint64_t sub_100018C30()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_100018CA8(void *a1, void *a2, void *a3)
{
  id v44 = a1;
  uint64_t v6 = sub_100045B80();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_1000457C0();
  uint64_t v12 = sub_1000457B0();
  if (v12)
  {
    uint64_t v13 = v12;
    sub_100007DD4(a2);
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
      sub_100004A2C((uint64_t *)&unk_10005E040);
      uint64_t v35 = *(void *)(*(void *)(sub_100045550() - 8) + 72);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
      uint64_t v43 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v42[0] = a3;
      id v36 = a3;
      id v17 = (id)AMSLogKey();
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = sub_100045C30();
        uint64_t v33 = v20;

        sub_1000454F0();
        v45._countAndFlagsBits = 0;
        v45._object = (void *)0xE000000000000000;
        sub_1000454E0(v45);
        sub_100005548(v42, (uint64_t)v43);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v40[0] = DynamicType;
        sub_1000454D0();
        sub_100007820((uint64_t)v40);
        v46._countAndFlagsBits = 5972026;
        v46._object = (void *)0xE300000000000000;
        sub_1000454E0(v46);
        uint64_t MetatypeMetadata = &type metadata for String;
        v40[0] = v19;
        v40[1] = v33;
        sub_1000454D0();
        sub_100007820((uint64_t)v40);
        v22._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v47._countAndFlagsBits = 0;
        v47._object = (void *)0xE000000000000000;
        sub_1000454E0(v47);
        sub_100005548(v42, (uint64_t)v43);
        uint64_t v23 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v40[0] = v23;
        sub_1000454D0();
        sub_100007820((uint64_t)v40);
        v22._countAndFlagsBits = 58;
      }
      v22._object = (void *)0xE100000000000000;
      sub_1000454E0(v22);
      sub_100045510();
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v42);
      sub_1000454B0();
      uint64_t v25 = v38;
      uint64_t v24 = v39;
      v42[0] = v39;
      v42[1] = v38;
      uint64_t v26 = v37;
      v42[2] = v37;
      uint64_t v43 = &type metadata for EngagementMessageEvent;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100045520();
      sub_100007820((uint64_t)v42);
      sub_100034904();
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
      sub_100045B60();
      uint64_t v11 = sub_100045B70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v6);
    }
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v11;
}

uint64_t sub_100019184(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v41 = a8;
  uint64_t v35 = a2;
  id v36 = a7;
  uint64_t v38 = a3;
  id v44 = a1;
  uint64_t v11 = sub_100045420();
  uint64_t v42 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v33 = v13;
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)AMSEngagement) init];
  id v40 = v15;
  id v16 = sub_100008190(a4, a5, a6);
  id v17 = [v15 enqueueMessageEvent:v16];

  sub_100004A2C(&qword_10005CE78);
  id v39 = v17;
  uint64_t v37 = sub_100045AD0();
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
  v43[3] = sub_1000457C0();
  v43[4] = &protocol witness table for RunLoopWorkerThread;
  v43[0] = v41;
  id v28 = v20;
  id v29 = v27;
  id v30 = v28;
  id v31 = v29;
  swift_retain();
  sub_100045A40();

  swift_release();
  swift_release();
  swift_release();

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v43);
}

void sub_100019470(void **a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, id))
{
  uint64_t v9 = sub_100045500();
  __chkstk_darwin(v9 - 8);
  sub_100014644();
  unint64_t v25 = *a1;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v10 = sub_100045550();
  sub_1000078C0(v10);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  void v28[3] = type metadata accessor for JSEngagementObject();
  v28[0] = a2;
  a2;
  id v11 = (id)AMSLogKey();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100045C30();
    uint64_t v15 = v14;

    sub_100014628();
    sub_1000145D4();
    sub_10001457C();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000145B4(MetatypeMetadata);
    sub_100007820((uint64_t)v27);
    sub_1000145F0();
    v27[3] = &type metadata for String;
    v27[0] = v13;
    v27[1] = v15;
    sub_1000454D0();
    sub_100007820((uint64_t)v27);
    v17._countAndFlagsBits = 93;
  }
  else
  {
    sub_10001460C();
    sub_1000145D4();
    sub_10001457C();
    uint64_t v18 = swift_getMetatypeMetadata();
    sub_1000145B4(v18);
    sub_100007820((uint64_t)v27);
    v17._countAndFlagsBits = 58;
  }
  sub_100014674(v17);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  id v19 = v25;
  uint64_t v20 = (void *)a7(a3, v19);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1000471C0;
  *(void *)(v21 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v21 + 32) = v20;
  id v22 = v20;
  uint64_t v23 = (void *)sub_100045410();

  swift_bridgeObjectRelease();
}

void sub_1000198B4(uint64_t a1, void *a2, uint64_t a3, objc_class *a4, uint64_t a5)
{
  uint64_t v44 = a5;
  uint64_t v8 = sub_100045950();
  sub_100009FF4();
  uint64_t v45 = v9;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045500();
  __chkstk_darwin(v13 - 8);
  sub_100014644();
  uint64_t v14 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v15 = sub_100045550();
  sub_1000078C0(v15);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v19 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v43 = v14;
  uint64_t v41 = v20 + 3 * v17;
  uint64_t v40 = v19 | 7;
  uint64_t v21 = swift_allocObject();
  long long v39 = xmmword_1000473B0;
  *(_OWORD *)(v21 + 16) = xmmword_1000473B0;
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
    uint64_t v24 = sub_100045C30();
    uint64_t v26 = v25;

    sub_100014628();
    sub_1000145D4();
    sub_10001457C();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000145B4(MetatypeMetadata);
    sub_100007820((uint64_t)v50);
    sub_1000145F0();
    v50[3] = &type metadata for String;
    v50[0] = v24;
    v50[1] = v26;
    sub_1000454D0();
    sub_100007820((uint64_t)v50);
    v28._countAndFlagsBits = 93;
  }
  else
  {
    sub_10001460C();
    sub_1000145D4();
    sub_10001457C();
    uint64_t v29 = swift_getMetatypeMetadata();
    sub_1000145B4(v29);
    sub_100007820((uint64_t)v50);
    v28._countAndFlagsBits = 58;
  }
  sub_100014674(v28);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v51);
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v30 = v48;
  uint64_t v31 = v49;
  uint64_t v52 = v49;
  uint64_t v32 = sub_100005CD0(v51);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v32, v30, v31);
  sub_100045520();
  sub_100007820((uint64_t)v51);
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1000471C0;
  swift_errorRetain();
  sub_10001A1C8(a1);
  v34.super.Class isa = v47;
  Class isa = sub_100045930(v34).super.isa;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v46);
  *(void *)(v33 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v33 + 32) = isa;
  id v36 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

id sub_100019E60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100019EB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSEngagementObject()
{
  return self;
}

uint64_t sub_100019F10(void *a1)
{
  return sub_100018CA8(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100019F2C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100019F7C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100019184(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void **)(v3 + 40), *(void *)(v3 + 48));
}

void sub_100019FA4(void **a1)
{
}

void sub_100019FD4(uint64_t a1)
{
}

uint64_t sub_100019FE0(void *a1)
{
  return sub_1000183F4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100019FFC()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001A044(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000188BC(a1, a2, a3, *(void *)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

void sub_10001A068(void **a1)
{
}

void sub_10001A094(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
  uint64_t v9 = *(void *)(sub_100045420() - 8);
  sub_100019470(a1, *(void **)(v4 + 16), *(void *)(v4 + 24), v4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a2, a3, a4);
}

void sub_10001A128(uint64_t a1)
{
}

void sub_10001A134(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100045420();
  sub_1000078C0(v5);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_1000198B4(a1, *(void **)(v2 + 16), v2 + v10, *(objc_class **)(v2 + ((*(void *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

void sub_10001A1B4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_10001A1C0(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
}

uint64_t sub_10001A1C8(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005CDD8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100045950();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[7] = a1;
  swift_errorRetain();
  sub_100004A2C(&qword_10005CDF0);
  if (swift_dynamicCast())
  {
    sub_100005994((uint64_t)v4, 0, 1, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v9 = sub_100045910();
    v12[1] = v10;
    v12[2] = v9;
    v12[0] = sub_1000458E0();
    sub_1000458F0();
    sub_100045940();
    sub_1000458D0();
    sub_100045900();
    swift_errorRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    sub_100005994((uint64_t)v4, 1, 1, v5);
    sub_10001A424((uint64_t)v4);
    swift_getErrorValue();
    sub_100046120();
    sub_100045900();
    return swift_errorRelease();
  }
}

uint64_t sub_10001A424(uint64_t a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005CDD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A4EC()
{
  return swift_bridgeObjectRetain();
}

void sub_10001A4FC()
{
}

id sub_10001A53C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLocalizationObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLocalizationObject()
{
  return self;
}

uint64_t sub_10001A5A4(uint64_t a1)
{
  return sub_10001A7BC(a1, (void (*)(uint64_t))sub_1000348CC);
}

uint64_t sub_10001A624(uint64_t a1)
{
  return sub_10001A7BC(a1, (void (*)(uint64_t))sub_100034904);
}

uint64_t sub_10001A6A4(uint64_t a1)
{
  return sub_10001A7BC(a1, (void (*)(uint64_t))sub_10003493C);
}

uint64_t sub_10001A724(uint64_t a1)
{
  return sub_10001A7BC(a1, (void (*)(uint64_t))sub_100034974);
}

uint64_t sub_10001A7A4(uint64_t a1)
{
  return sub_10001A7BC(a1, (void (*)(uint64_t))sub_1000349AC);
}

uint64_t sub_10001A7BC(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = sub_100045500();
  __chkstk_darwin(v4 - 8);
  uint64_t result = sub_100045DF0();
  if (v6)
  {
    uint64_t v7 = result;
    uint64_t v8 = v6;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100047420;
    uint64_t v21 = (void *)type metadata accessor for JSLogObject();
    v20[0] = v2;
    id v10 = v2;
    id v11 = (id)AMSLogKey();
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = sub_100045C30();
      uint64_t v15 = v14;

      sub_1000454F0();
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      sub_1000454E0(v22);
      sub_100009688();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10001AB50(MetatypeMetadata);
      sub_100007820((uint64_t)v19);
      v23._countAndFlagsBits = 5972026;
      v23._object = (void *)0xE300000000000000;
      sub_1000454E0(v23);
      v19[3] = &type metadata for String;
      v19[0] = v13;
      v19[1] = v15;
      sub_1000454D0();
      sub_100007820((uint64_t)v19);
      v17._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v24._countAndFlagsBits = 0;
      v24._object = (void *)0xE000000000000000;
      sub_1000454E0(v24);
      sub_100009688();
      uint64_t v18 = swift_getMetatypeMetadata();
      sub_10001AB50(v18);
      sub_100007820((uint64_t)v19);
      v17._countAndFlagsBits = 58;
    }
    v17._object = (void *)0xE100000000000000;
    sub_1000454E0(v17);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
    uint64_t v21 = &type metadata for String;
    v20[0] = v7;
    v20[1] = v8;
    sub_100045520();
    sub_100007820((uint64_t)v20);
    a2(v9);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_10001AAA0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001AAF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLogObject()
{
  return self;
}

uint64_t sub_10001AB50(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000454D0();
}

id sub_10001AB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account] = a1;
  id v10 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag];
  uint64_t v11 = sub_1000458B0();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a2, v11);
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo] = a3;
  uint64_t v13 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient];
  *(void *)uint64_t v13 = a4;
  *((void *)v13 + 1) = a5;
  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for JSMarketingObject();
  id v14 = objc_msgSendSuper2(&v16, "init");
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
  return v14;
}

uint64_t sub_10001AC84()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

char *sub_10001AD08(void *a1, void *a2, void *a3)
{
  uint64_t v68 = sub_1000458B0();
  uint64_t v60 = *(void *)(v68 - 8);
  uint64_t v7 = *(void *)(v60 + 64);
  __chkstk_darwin(v68);
  uint64_t v62 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100045B80();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  Swift::String v61 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100045500();
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000457C0();
  uint64_t v14 = sub_1000457B0();
  if (v14)
  {
    uint64_t v15 = v14;
    sub_100034C24(a2, __src);
    if (v3) {
      goto LABEL_9;
    }
    uint64_t v57 = v15;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    uint64_t v16 = *(void *)(sub_100045550() - 8);
    unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    uint64_t v56 = *(void **)(v16 + 72);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1000473B0;
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
      uint64_t v22 = sub_100045C30();
      uint64_t v24 = v23;

      sub_1000454F0();
      v69._countAndFlagsBits = 0;
      v69._object = (void *)0xE000000000000000;
      sub_1000454E0(v69);
      sub_100005548(v65, (uint64_t)v66);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v63[0] = DynamicType;
      sub_1000454D0();
      sub_100007820((uint64_t)v63);
      v70._countAndFlagsBits = 5972026;
      v70._object = (void *)0xE300000000000000;
      sub_1000454E0(v70);
      uint64_t MetatypeMetadata = &type metadata for String;
      v63[0] = v22;
      v63[1] = v24;
      sub_1000454D0();
      sub_100007820((uint64_t)v63);
      v26._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v71._countAndFlagsBits = 0;
      v71._object = (void *)0xE000000000000000;
      sub_1000454E0(v71);
      sub_100005548(v65, (uint64_t)v66);
      uint64_t v27 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v63[0] = v27;
      sub_1000454D0();
      sub_100007820((uint64_t)v63);
      v26._countAndFlagsBits = 58;
    }
    v26._object = (void *)0xE100000000000000;
    sub_1000454E0(v26);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v65);
    sub_1000454B0();
    uint64_t v66 = &type metadata for MarketingItemRequest;
    v65[0] = swift_allocObject();
    memcpy((void *)(v65[0] + 16), __src, 0x48uLL);
    sub_10001C7F8((uint64_t)__src);
    sub_100045520();
    sub_100007820((uint64_t)v65);
    sub_100034904();
    swift_bridgeObjectRelease();
    uint64_t v56 = *(void **)&v19[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account];
    Swift::String v28 = &v19[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag];
    long long v55 = *(void **)&v19[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo];
    uint64_t v29 = *(void *)&v19[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient + 8];
    uint64_t v53 = *(void *)&v19[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient];
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
    sub_100045B60();
    if (v47)
    {
LABEL_9:
      swift_release();
    }
    else
    {
      uint64_t v13 = (char *)sub_100045B70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v46, v51);
    }
  }
  else
  {
    uint64_t v13 = (char *)sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v13;
}

uint64_t sub_10001B3F8(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11)
{
  uint64_t v48 = a1;
  uint64_t v41 = a8;
  id v42 = a2;
  id v45 = a3;
  uint64_t v39 = a5;
  uint64_t v40 = a9;
  uint64_t v12 = sub_100045420();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  __chkstk_darwin(v12);
  uint64_t v43 = v13;
  uint64_t v44 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100045870();
  objc_allocWithZone((Class)AMSMarketingItemTask);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_10001CA6C(v14);
  [v15 setAccount:v41];
  [v15 setClientInfo:v40];
  sub_10001CB6C(a7, (uint64_t)v51, &qword_10005CF38);
  sub_10001CB6C((uint64_t)v51, (uint64_t)&v53, &qword_10005CF38);
  if (v53)
  {
    sub_100036D44(v53);
    sub_100004A2C(&qword_10005C7F0);
    v16.super.Class isa = sub_100045BC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v16.super.Class isa = 0;
  }
  uint64_t v40 = a10;
  uint64_t v41 = a11;
  [v15 setContextInfo:v16.super.isa];

  sub_10001CB6C(a7 + 24, (uint64_t)v50, &qword_10005CF40);
  sub_10001CB6C((uint64_t)v50, (uint64_t)v52, &qword_10005CF40);
  if (v52[1]) {
    NSString v17 = sub_100045C00();
  }
  else {
    NSString v17 = 0;
  }
  [v15 setOfferHints:v17];

  sub_100004A2C(&qword_10005CF48);
  id v18 = [v15 perform];
  uint64_t v39 = sub_100045AD0();
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
  uint64_t v49[3] = sub_1000457C0();
  v49[4] = &protocol witness table for RunLoopWorkerThread;
  v49[0] = v41;
  id v32 = v25;
  id v33 = v31;
  id v34 = v32;
  id v35 = v33;
  swift_retain();
  sub_100045A40();

  swift_release();
  swift_release();
  swift_release();
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v49);
}

void sub_10001B83C(void **a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045500();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = *a1;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  *((void *)&v26 + 1) = type metadata accessor for JSMarketingObject();
  *(void *)&long long v25 = a2;
  a2;
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v27._countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    sub_1000454E0(v27);
    sub_100005548(&v25, *((uint64_t *)&v26 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v23);
    v28._countAndFlagsBits = 5972026;
    v28._object = (void *)0xE300000000000000;
    sub_1000454E0(v28);
    uint64_t MetatypeMetadata = &type metadata for String;
    v23[0] = v9;
    v23[1] = v11;
    sub_1000454D0();
    sub_100007820((uint64_t)v23);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v29._countAndFlagsBits = 0;
    v29._object = (void *)0xE000000000000000;
    sub_1000454E0(v29);
    sub_100005548(&v25, *((uint64_t *)&v26 + 1));
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = v14;
    sub_1000454D0();
    sub_100007820((uint64_t)v23);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v25);
  sub_1000454B0();
  uint64_t v15 = sub_10001CDFC(v6);
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
  sub_100045520();
  sub_100007820((uint64_t)&v25);
  sub_100034904();
  swift_bridgeObjectRelease();
  id v17 = v6;
  id v18 = sub_10003518C(a3, v17);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1000471C0;
  *(void *)(v19 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v19 + 32) = v18;
  id v20 = v18;
  uint64_t v21 = (void *)sub_100045410();

  swift_bridgeObjectRelease();
}

void sub_10001BE30(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045950();
  uint64_t v39 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v12 = *(void *)(sub_100045550() - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v38 = v11;
  uint64_t v36 = v15 + 3 * v13;
  uint64_t v35 = v14 | 7;
  uint64_t v16 = swift_allocObject();
  long long v34 = xmmword_1000473B0;
  *(_OWORD *)(v16 + 16) = xmmword_1000473B0;
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
    uint64_t v19 = sub_100045C30();
    uint64_t v21 = v20;

    sub_1000454F0();
    v48._countAndFlagsBits = 0;
    v48._object = (void *)0xE000000000000000;
    sub_1000454E0(v48);
    sub_100005548(v46, v47);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v44);
    v49._countAndFlagsBits = 5972026;
    v49._object = (void *)0xE300000000000000;
    sub_1000454E0(v49);
    uint64_t MetatypeMetadata = &type metadata for String;
    v44[0] = v19;
    v44[1] = v21;
    sub_1000454D0();
    sub_100007820((uint64_t)v44);
    v23._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v50._countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    sub_1000454E0(v50);
    sub_100005548(v46, v47);
    uint64_t v24 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = v24;
    sub_1000454D0();
    sub_100007820((uint64_t)v44);
    v23._countAndFlagsBits = 58;
  }
  v23._object = (void *)0xE100000000000000;
  sub_1000454E0(v23);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v46);
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v25 = v42;
  uint64_t v26 = v43;
  uint64_t v47 = v43;
  Swift::String v27 = sub_100005CD0(v46);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v27, v25, v26);
  sub_100045520();
  sub_100007820((uint64_t)v46);
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1000471C0;
  swift_errorRetain();
  sub_10001A1C8(a1);
  v29.super.Class isa = v41;
  Class isa = sub_100045930(v29).super.isa;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v40);
  *(void *)(v28 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v28 + 32) = isa;
  unint64_t v31 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

void sub_10001C56C()
{
}

id sub_10001C5AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMarketingObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001C680()
{
  return type metadata accessor for JSMarketingObject();
}

uint64_t type metadata accessor for JSMarketingObject()
{
  uint64_t result = qword_10005CF28;
  if (!qword_10005CF28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001C6D0()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_10001C784(void *a1)
{
  return sub_10001AD08(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001C7A0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10001C7F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001C864()
{
  sub_1000458B0();
  sub_10001CE80();
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

uint64_t sub_10001C990(void *a1, void *a2, void *a3)
{
  uint64_t v7 = sub_1000458B0();
  sub_1000078C0(v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v14 + 79) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001B3F8(a1, a2, a3, v3 + v12, *(void *)(v3 + v13), *(void *)(v3 + v13 + 8), v3 + v14, *(void *)(v3 + v15), *(void **)(v3 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3 + ((((v15 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3+ ((((((v15 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

id sub_10001CA6C(uint64_t a1)
{
  NSString v3 = sub_100045C00();
  swift_bridgeObjectRelease();
  NSString v4 = sub_100045C00();
  swift_bridgeObjectRelease();
  NSString v5 = sub_100045C00();
  swift_bridgeObjectRelease();
  NSString v6 = sub_100045C00();
  swift_bridgeObjectRelease();
  id v7 = [v1 initWithBag:a1 clientIdentifier:v3 clientVersion:v4 placement:v5 serviceType:v6];

  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_10001CB6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_100004A2C(a3);
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_10001CBC8()
{
  sub_100045420();
  sub_10001CE60();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_10001CC60(void **a1)
{
  sub_100045420();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 24);

  sub_10001B83C(a1, v3, v4);
}

uint64_t sub_10001CCD4()
{
  sub_100045420();
  sub_10001CE60();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_10001CD80(uint64_t a1)
{
  uint64_t v3 = sub_100045420();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void **)(v1 + 16);
  uint64_t v10 = *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_10001BE30(a1, v9, v1 + v8, v10);
}

uint64_t sub_10001CDFC(void *a1)
{
  id v1 = [a1 itemID];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100045C30();

  return v3;
}

id sub_10001CE90(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v41 = a2;
  uint64_t v42 = a6;
  uint64_t v43 = sub_100045400();
  sub_100009FF4();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (uint64_t *)((char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore] = a1;
  uint64_t v44 = a1;
  id v17 = &v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_bag];
  uint64_t v45 = sub_1000458B0();
  sub_10001F838();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v18 + 16))(v17, a2);
  *(void *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo] = a3;
  uint64_t v20 = (uint64_t *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient];
  uint64_t *v20 = a4;
  v20[1] = a5;
  swift_retain();
  id v21 = a3;
  swift_bridgeObjectRetain_n();
  uint64_t v22 = v6;
  uint64_t v23 = sub_100045870();
  id v24 = objc_allocWithZone((Class)AMSMediaTokenService);
  id v25 = sub_10001F084(a4, a5, v23);
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_tokenService] = v25;
  id v26 = v25;
  id v27 = [objc_allocWithZone((Class)AMSMediaRequestEncoder) initWithTokenService:v26 bag:sub_100045870()];

  swift_unknownObjectRelease();
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder] = v27;
  uint64_t v28 = v27;
  JSContext v29 = v21;
  [v28 setClientInfo:v21];
  uint64_t v30 = v42;
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSessionHandler] = v42;
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  *uint64_t v16 = a4;
  v16[1] = a5;
  v16[2] = 0;
  void v16[3] = 0;
  uint64_t v31 = v43;
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v16, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v43);
  id v32 = v30;
  uint64_t v33 = v41;
  long long v34 = (void *)sub_100045D20();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v31);
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession] = v34;
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

uint64_t sub_10001D190()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_10001D214(void *a1, void *a2, uint64_t a3)
{
  uint64_t v59 = a3;
  uint64_t v5 = sub_100045B80();
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
  uint64_t v14 = sub_100045500();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_1000457C0();
  uint64_t v16 = sub_1000457B0();
  if (v16)
  {
    uint64_t v57 = v16;
    id v58 = v13;
    id v52 = a1;
    uint64_t v53 = v8;
    uint64_t v50 = v6;
    uint64_t v51 = v5;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    uint64_t v63 = type metadata accessor for JSMediaAPIObject();
    v62[0] = a2;
    long long v54 = a2;
    id v17 = (id)AMSLogKey();
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = sub_100045C30();
      uint64_t v21 = v20;

      sub_1000454F0();
      v65._countAndFlagsBits = 0;
      v65._object = (void *)0xE000000000000000;
      sub_1000454E0(v65);
      sub_100005548(v62, v63);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v60[0] = DynamicType;
      sub_1000454D0();
      sub_10001F568((uint64_t)v60, (uint64_t *)&unk_10005CC40);
      v66._countAndFlagsBits = 5972026;
      v66._object = (void *)0xE300000000000000;
      sub_1000454E0(v66);
      uint64_t MetatypeMetadata = &type metadata for String;
      v60[0] = v19;
      v60[1] = v21;
      sub_1000454D0();
      sub_10001F568((uint64_t)v60, (uint64_t *)&unk_10005CC40);
      v23._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v67._countAndFlagsBits = 0;
      v67._object = (void *)0xE000000000000000;
      sub_1000454E0(v67);
      sub_100005548(v62, v63);
      uint64_t v24 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v60[0] = v24;
      sub_1000454D0();
      sub_10001F568((uint64_t)v60, (uint64_t *)&unk_10005CC40);
      v23._countAndFlagsBits = 58;
    }
    v23._object = (void *)0xE100000000000000;
    sub_1000454E0(v23);
    sub_100045510();
    uint64_t v15 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
    sub_1000454B0();
    uint64_t v63 = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    v62[0] = v59;
    id v25 = (id)v59;
    sub_100045520();
    sub_10001F568((uint64_t)v62, (uint64_t *)&unk_10005CC40);
    sub_100034904();
    swift_bridgeObjectRelease();
    id v26 = v25;
    uint64_t v27 = (uint64_t)v58;
    unint64_t v28 = v64;
    sub_1000352AC(v26, (uint64_t)v58);
    if (v28)
    {
      swift_release();
    }
    else
    {
      uint64_t v29 = *(void *)&v54[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient + 8];
      uint64_t v49 = *(void *)&v54[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient];
      uint64_t v30 = *(void **)&v54[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo];
      swift_bridgeObjectRetain();
      id v31 = [v30 clientVersion];
      if (v31)
      {
        id v32 = v31;
        uint64_t v59 = sub_100045C30();
        unint64_t v64 = v33;
      }
      else
      {
        unint64_t v64 = 0xE100000000000000;
        uint64_t v59 = 49;
      }
      uint64_t v34 = v56;
      sub_10001F218(v27, v56);
      unint64_t v35 = (*(unsigned __int8 *)(v55 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
      unint64_t v36 = (v10 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v39 = swift_allocObject();
      sub_10001F3E4(v34, v39 + v35);
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
      sub_100045B60();
      uint64_t v15 = sub_100045B70();
      swift_release();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v46, v51);
      sub_10001F50C((uint64_t)v58);
    }
  }
  else
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
  }
  return v15;
}

uint64_t sub_10001D894(void *a1, void (*a2)(void, void, void), uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v51 = a7;
  uint64_t v52 = a8;
  uint64_t v60 = a5;
  uint64_t v53 = a2;
  id v58 = a1;
  uint64_t v56 = a3;
  uint64_t v57 = a10;
  uint64_t v12 = sub_100045420();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  long long v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v14;
  uint64_t v15 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000450E0();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for MediaAPIRequest();
  sub_100017BA8(a4 + *(int *)(v22 + 32), (uint64_t)v17);
  if (sub_100005A24((uint64_t)v17, 1, v18) == 1)
  {
    uint64_t v23 = a6;
    uint64_t v24 = v51;
    uint64_t v25 = v52;
    sub_10001F568((uint64_t)v17, &qword_10005C838);
    if ((*(unsigned char *)(a4 + 32) & 1) != 0 || (uint64_t v26 = *(void *)(a4 + 16)) == 0)
    {
      sub_100004A2C(&qword_10005CFC8);
      NSString v32 = sub_100045C00();
      id v33 = (id)AMSError();

      uint64_t v27 = sub_100045A50();
    }
    else
    {
      uint64_t v27 = sub_10001ECB4(*(void *)(a4 + 24), v23, v24, v25, a9, *(unsigned char *)(a4 + 8), v26, *(void *)a4);
    }
    uint64_t v52 = v27;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
    uint64_t v52 = sub_10001EAC4((uint64_t)v21, v28, v29, v30, v31, *(unsigned char *)(a4 + 8));
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
  v59[3] = sub_1000457C0();
  v59[4] = &protocol witness table for RunLoopWorkerThread;
  v59[0] = v57;
  id v46 = v44;
  id v47 = v45;
  id v48 = v46;
  id v49 = v47;
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  swift_release();
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v59);
}

void sub_10001DCF0(void **a1, void *a2, void *a3)
{
  uint64_t v5 = sub_100045500();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = *a1;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v25 = type metadata accessor for JSMediaAPIObject();
  v24[0] = a2;
  a2;
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_1000454E0(v26);
    sub_100005548(v24, v25);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = DynamicType;
    sub_1000454D0();
    sub_10001F568((uint64_t)v22, (uint64_t *)&unk_10005CC40);
    v27._countAndFlagsBits = 5972026;
    v27._object = (void *)0xE300000000000000;
    sub_1000454E0(v27);
    uint64_t MetatypeMetadata = &type metadata for String;
    v22[0] = v9;
    v22[1] = v11;
    sub_1000454D0();
    sub_10001F568((uint64_t)v22, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_1000454E0(v28);
    sub_100005548(v24, v25);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = v14;
    sub_1000454D0();
    sub_10001F568((uint64_t)v22, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v24);
  sub_1000454B0();
  uint64_t v25 = sub_100005A4C(0, &qword_10005CFD8);
  v24[0] = v6;
  id v15 = v6;
  sub_100045520();
  sub_10001F568((uint64_t)v24, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  id v16 = v15;
  id v17 = sub_100035F38(a3, v16);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000471C0;
  *(void *)(v18 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v18 + 32) = v17;
  id v19 = v17;
  uint64_t v20 = (void *)sub_100045410();

  swift_bridgeObjectRelease();
}

void sub_10001E330(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v7 = sub_100045950();
  uint64_t v40 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v12 = *(void *)(sub_100045550() - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v39 = v11;
  uint64_t v37 = v15 + 3 * v13;
  uint64_t v36 = v14 | 7;
  uint64_t v16 = swift_allocObject();
  long long v35 = xmmword_1000473B0;
  *(_OWORD *)(v16 + 16) = xmmword_1000473B0;
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
    uint64_t v19 = sub_100045C30();
    uint64_t v21 = v20;

    sub_1000454F0();
    v50._countAndFlagsBits = 0;
    v50._object = (void *)0xE000000000000000;
    sub_1000454E0(v50);
    sub_100005548(v48, v49);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v46[0] = DynamicType;
    sub_1000454D0();
    sub_10001F568((uint64_t)v46, (uint64_t *)&unk_10005CC40);
    v51._countAndFlagsBits = 5972026;
    v51._object = (void *)0xE300000000000000;
    sub_1000454E0(v51);
    uint64_t MetatypeMetadata = &type metadata for String;
    v46[0] = v19;
    v46[1] = v21;
    sub_1000454D0();
    sub_10001F568((uint64_t)v46, (uint64_t *)&unk_10005CC40);
    v23._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v52._countAndFlagsBits = 0;
    v52._object = (void *)0xE000000000000000;
    sub_1000454E0(v52);
    sub_100005548(v48, v49);
    uint64_t v24 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v46[0] = v24;
    sub_1000454D0();
    sub_10001F568((uint64_t)v46, (uint64_t *)&unk_10005CC40);
    v23._countAndFlagsBits = 58;
  }
  v23._object = (void *)0xE100000000000000;
  sub_1000454E0(v23);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v48);
  sub_1000454B0();
  uint64_t v25 = v41;
  swift_getErrorValue();
  uint64_t v26 = v44;
  uint64_t v27 = v45;
  uint64_t v49 = v45;
  Swift::String v28 = sub_10001F7F4(v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v28, v26, v27);
  sub_100045520();
  sub_10001F568((uint64_t)v48, (uint64_t *)&unk_10005CC40);
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1000471C0;
  swift_errorRetain();
  sub_10001A1C8(v25);
  v30.super.Class isa = v43;
  Class isa = sub_100045930(v30).super.isa;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v42);
  *(void *)(v29 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v29 + 32) = isa;
  NSString v32 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

uint64_t sub_10001EAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  if (a6)
  {
    uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
    uint64_t v9 = *(void **)(v6 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore);
    if (v9) {
      uint64_t v9 = DynamicAccountsStore.account.getter();
    }
    [v8 setAccount:v9];
  }
  uint64_t v10 = *(void **)(v7 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
  sub_100045060((NSURL *)OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
  uint64_t v12 = v11;
  id v13 = [v10 requestWithURL:v11];

  sub_100004A2C(&qword_10005CFD0);
  id v14 = [*(id *)(v7 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession) dataTaskPromiseWithRequestPromise:v13];
  sub_100045AD0();
  void v17[3] = sub_1000457A0();
  id v17[4] = (uint64_t)&protocol witness table for SyncTaskScheduler;
  sub_10001F7F4(v17);
  sub_100045790();
  sub_100005A4C(0, &qword_10005CFD8);
  uint64_t v15 = sub_100045A20();

  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v17);
  return v15;
}

id sub_10001EC30@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
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

uint64_t sub_10001ECB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_100045870();
  id v19 = objc_allocWithZone((Class)AMSMediaTask);
  id v20 = sub_10001F0EC(a1, a2, a3, a4, a5, v18);
  if (a8) {
    v21.super.Class isa = sub_100045BC0().super.isa;
  }
  else {
    v21.super.Class isa = 0;
  }
  [v20 setAdditionalQueryParams:v21.super.isa];

  sub_10001F19C(a7, v20);
  if (a6)
  {
    uint64_t v22 = *(void **)(v9 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore);
    if (v22) {
      uint64_t v22 = DynamicAccountsStore.account.getter();
    }
    [v20 setAccount:v22];
  }
  sub_100004A2C(&qword_10005CFC8);
  id v23 = [v20 perform];
  uint64_t v24 = sub_100045AD0();

  return v24;
}

void sub_10001EE28()
{
}

id sub_10001EE68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMediaAPIObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001EF78()
{
  return type metadata accessor for JSMediaAPIObject();
}

uint64_t type metadata accessor for JSMediaAPIObject()
{
  uint64_t result = qword_10005CFB8;
  if (!qword_10005CFB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001EFC8()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10001F084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100045C00();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithClientIdentifier:v5 bag:a3];

  swift_unknownObjectRelease();
  return v6;
}

id sub_10001F0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v9 = sub_100045C00();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100045C00();
  swift_bridgeObjectRelease();
  id v11 = [v6 initWithType:a1 clientIdentifier:v9 clientVersion:v10 bag:a6];

  swift_unknownObjectRelease();
  return v11;
}

void sub_10001F19C(uint64_t a1, void *a2)
{
  Class isa = sub_100045CD0().super.isa;
  [a2 setItemIdentifiers:isa];
}

uint64_t sub_10001F1FC(void *a1)
{
  return sub_10001D214(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001F218(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F27C()
{
  uint64_t v1 = (int *)(type metadata accessor for MediaAPIRequest() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[10];
  uint64_t v6 = sub_1000450E0();
  if (!sub_100005A24(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v8 + 8, v2 | 7);
}

uint64_t sub_10001F3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F448(void *a1, void (*a2)(void, void, void), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for MediaAPIRequest();
  sub_1000078C0(v7);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v13 = (*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_10001D894(a1, a2, a3, v3 + v12, *(void **)(v3 + v13), *(void *)(v3 + v14), *(void *)(v3 + v14 + 8), *(void *)(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3 + ((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 8), *(void *)(v3 + ((((v14 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_10001F50C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MediaAPIRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F568(uint64_t a1, uint64_t *a2)
{
  sub_100004A2C(a2);
  sub_10000CB80();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10001F5B8()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_10001F654(void **a1)
{
  sub_100045420();
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void **)(v1 + 24);

  sub_10001DCF0(a1, v3, v4);
}

uint64_t sub_10001F6C8()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 24) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_10001F778(uint64_t a1)
{
  uint64_t v3 = sub_100045420();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void **)(v1 + 16);
  uint64_t v10 = *(objc_class **)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_10001E330(a1, v9, v1 + v8, v10);
}

uint64_t *sub_10001F7F4(uint64_t *a1)
{
  sub_10001F838();
  if ((*(unsigned char *)(v2 + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v3;
  }
  return a1;
}

id sub_10001F84C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v13 = sub_100045400();
  sub_100009FF4();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_1000259F8();
  id v17 = v6;
  uint64_t v32 = v13;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100046020()) {
    sub_100023470((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    uint64_t v18 = &_swiftEmptySetSingleton;
  }
  *(void *)&v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions] = v18;
  *(void *)&v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_accountStore] = a1;
  id v19 = &v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_bag];
  uint64_t v30 = sub_1000458B0();
  sub_10001F838();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v20 + 16))(v19, a2);
  *(void *)&v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo] = a3;
  uint64_t v22 = &v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_mediaClient];
  *(void *)uint64_t v22 = a4;
  *((void *)v22 + 1) = a5;
  *(void *)&v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler] = a6;
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  void *v7 = a4;
  v7[1] = a5;
  v7[2] = 0;
  v7[3] = 0;
  (*(void (**)(void *, void, uint64_t))(v15 + 104))(v7, enum case for JetEngineBootstrap.URLProtocolHandler.media(_:), v32);
  swift_retain();
  id v23 = a3;
  swift_bridgeObjectRetain();
  id v24 = a6;
  uint64_t v25 = (void *)sub_100045D20();
  (*(void (**)(void *, uint64_t))(v15 + 8))(v7, v32);
  *(void *)&v17[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession] = v25;
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

uint64_t sub_10001FAE8()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_10001FB6C(void *a1, void *a2, char *a3)
{
  uint64_t v106 = a3;
  id v99 = a1;
  uint64_t v5 = sub_100045B80();
  uint64_t v90 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v100 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100045C70();
  uint64_t v92 = *(void *)(v7 - 8);
  uint64_t v93 = v7;
  __chkstk_darwin(v7);
  size_t v91 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_1000450E0();
  uint64_t v97 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  id v96 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
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
  uint64_t v19 = sub_1000457C0();
  uint64_t v20 = sub_1000457B0();
  if (!v20)
  {
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_100045900();
    swift_willThrow();
    return v19;
  }
  uint64_t v19 = v20;
  sub_100020A2C(a2, v18);
  if (v3)
  {
    swift_release();
    return v19;
  }
  uint64_t v86 = v19;
  uint64_t v89 = 0;
  uint64_t v82 = v5;
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = *(void **)&v106[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession];
  uint64_t v88 = v21;
  *(void *)(v21 + 16) = v22;
  char v23 = v18[v11[10]];
  sub_100024970((uint64_t)v18, (uint64_t)v16);
  if (v23)
  {
    id v26 = v22;
    sub_1000249D4((uint64_t)v16);
    goto LABEL_9;
  }
  uint64_t v24 = *(void *)&v16[v11[13] + 8];
  id v25 = v22;
  sub_1000249D4((uint64_t)v16);
  if (v24)
  {
LABEL_9:
    id v27 = self;
    id v28 = objc_msgSend(v27, "ams_configurationWithProcessInfo:bag:", *(void *)&v106[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo], sub_100045870());
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
    sub_100004A2C((uint64_t *)&unk_10005E040);
    id v87 = *(id *)(*(void *)(sub_100045550() - 8) + 72);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    *((void *)&v105 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v104 = v106;
    uint64_t v83 = v106;
    id v32 = (id)AMSLogKey();
    id v84 = v28;
    if (v32)
    {
      objc_super v33 = v32;
      uint64_t v81 = sub_100045C30();
      uint64_t v80 = v34;

      sub_1000454F0();
      v107._countAndFlagsBits = 0;
      v107._object = (void *)0xE000000000000000;
      sub_1000454E0(v107);
      sub_100005548(&v104, *((uint64_t *)&v105 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v101 = DynamicType;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
      v108._countAndFlagsBits = 5972026;
      v108._object = (void *)0xE300000000000000;
      sub_1000454E0(v108);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v101 = v81;
      uint64_t v102 = v80;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
      v36._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v109._countAndFlagsBits = 0;
      v109._object = (void *)0xE000000000000000;
      sub_1000454E0(v109);
      sub_100005548(&v104, *((uint64_t *)&v105 + 1));
      uint64_t v37 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v101 = v37;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
      v36._countAndFlagsBits = 58;
    }
    v36._object = (void *)0xE100000000000000;
    sub_1000454E0(v36);
    sub_100045510();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v104);
    sub_1000454B0();
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
    sub_100045520();
    sub_10000C890((uint64_t)&v104, (uint64_t *)&unk_10005CC40);
    sub_100034904();
    swift_bridgeObjectRelease();
    if (v31)
    {
      NSString v38 = sub_100045C00();
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

    [v41 setDelegate:*(void *)&v39[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler]];
    swift_beginAccess();
    sub_1000236C4(&v101, v41);
    uint64_t v43 = (void *)v101;
    swift_endAccess();
  }
  id v44 = [objc_allocWithZone((Class)AMSURLRequestEncoder) initWithBag:sub_100045870()];
  swift_unknownObjectRelease();
  if (v18[v11[12]] == 1)
  {
    uint64_t v45 = *(void **)&v106[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_accountStore];
    if (v45) {
      uint64_t v45 = DynamicAccountsStore.account.getter();
    }
    [v44 setAccount:v45];
  }
  if (*(void *)&v18[v11[11] + 8])
  {
    swift_bridgeObjectRetain();
    NSString v46 = sub_100045C00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v46 = 0;
  }
  uint64_t v47 = v94;
  [v44 setGsTokenIdentifier:v46];

  [v44 setClientInfo:*(void *)&v106[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo]];
  int v48 = v18[v11[14]];
  if (v48 != 2) {
    [v44 setUrlKnownToBeTrusted:v48 & 1];
  }
  sub_100044F90();
  uint64_t v49 = swift_allocBox();
  (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v96, v18, v47);
  uint64_t v50 = sub_100044F60();
  uint64_t v51 = *(void *)&v18[v11[6]];
  id v87 = v44;
  if (v51)
  {
    __chkstk_darwin(v50);
    uint64_t v52 = swift_bridgeObjectRetain();
    uint64_t v53 = v89;
    sub_100020F18(v52, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100024C8C);
    uint64_t v89 = v53;
    swift_bridgeObjectRelease();
  }
  uint64_t v54 = *(void *)&v18[v11[9] + 8];
  uint64_t v94 = v49;
  if (v54)
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = v91;
    sub_100045C60();
    sub_100045C40();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v92 + 8))(v55, v93);
  }
  sub_100044F80();
  swift_bridgeObjectRetain();
  sub_100044F40();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  *((void *)&v105 + 1) = type metadata accessor for JSNetworkObject(0);
  *(void *)&long long v104 = v106;
  uint64_t v56 = v106;
  id v57 = (id)AMSLogKey();
  uint64_t v106 = v56;
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = sub_100045C30();
    id v96 = v60;
    uint64_t v97 = v59;

    sub_1000454F0();
    v110._countAndFlagsBits = 0;
    v110._object = (void *)0xE000000000000000;
    sub_1000454E0(v110);
    sub_100005548(&v104, *((uint64_t *)&v105 + 1));
    uint64_t v61 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v101 = v61;
    sub_1000454D0();
    sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
    v111._countAndFlagsBits = 5972026;
    v111._object = (void *)0xE300000000000000;
    sub_1000454E0(v111);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v101 = v97;
    uint64_t v102 = v96;
    sub_1000454D0();
    sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
    v62._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v112._countAndFlagsBits = 0;
    v112._object = (void *)0xE000000000000000;
    sub_1000454E0(v112);
    sub_100005548(&v104, *((uint64_t *)&v105 + 1));
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v101 = v63;
    sub_1000454D0();
    sub_10000C890((uint64_t)&v101, (uint64_t *)&unk_10005CC40);
    v62._countAndFlagsBits = 58;
  }
  uint64_t v64 = v95;
  v62._object = (void *)0xE100000000000000;
  sub_1000454E0(v62);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v104);
  sub_1000454B0();
  *((void *)&v105 + 1) = v11;
  Swift::String v65 = sub_10001F7F4((uint64_t *)&v104);
  sub_100024970((uint64_t)v18, (uint64_t)v65);
  sub_100045520();
  sub_10000C890((uint64_t)&v104, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v66 = v98;
  sub_100024970((uint64_t)v18, v98);
  unint64_t v67 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  unint64_t v68 = (v12 + v67 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v69 = (v68 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  Swift::String v70 = v87;
  uint64_t v97 = (uint64_t)v18;
  uint64_t v71 = v94;
  *(void *)(v19 + 16) = v87;
  *(void *)(v19 + 24) = v71;
  sub_100024B7C(v66, v19 + v67);
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
  sub_100045B60();
  if (v77)
  {
    sub_1000249D4(v97);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v19 = sub_100045B70();

    swift_release();
    (*(void (**)(char *, uint64_t))(v90 + 8))(v76, v82);
    sub_1000249D4(v97);
    swift_release();
    swift_release();
  }
  return v19;
}

void sub_100020A2C(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v5 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v5 - 8);
  sub_1000259F8();
  uint64_t v6 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v60 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for NetworkRequest(0);
  uint64_t v59 = v11[10];
  a2[v59] = 2;
  uint64_t v12 = (void *)sub_100025A54();
  sub_100045DF0();
  uint64_t v14 = v13;

  if (!v14)
  {
    sub_100025A54();
    sub_100045950();
    sub_100007D44();
    sub_100025A20();
    sub_1000259A8();
    goto LABEL_5;
  }
  sub_1000450C0();
  swift_bridgeObjectRelease();
  if (sub_100005A24(v2, 1, v6) == 1)
  {
    sub_10000C890(v2, &qword_10005C838);
    sub_100045950();
    sub_100007D44();
    sub_100025A20();
    sub_100045900();
LABEL_5:
    swift_willThrow();

    return;
  }
  uint64_t v15 = v60;
  id v58 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v56 = v8 + 32;
  v58(v60, v2, v6);
  uint64_t v16 = (void *)sub_1000259D4();
  uint64_t v17 = sub_100045DF0();
  uint64_t v19 = v18;

  uint64_t v57 = v19;
  if (v19)
  {
    uint64_t v20 = (void *)sub_100045E00();
    uint64_t v21 = sub_100007CCC(v20);
    uint64_t v55 = v17;
    if (v21)
    {
      unint64_t v51 = sub_100023020(v21);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v51 = 0;
    }
    uint64_t v22 = (void *)sub_100045E00();
    uint64_t v23 = sub_100045DF0();
    uint64_t v53 = v24;
    uint64_t v54 = v23;

    id v25 = (void *)sub_100045E00();
    uint64_t v52 = sub_100045DF0();
    uint64_t v27 = v26;

    id v28 = (void *)sub_100025974();
    int v50 = sub_100045DE0();

    uint64_t v29 = (void *)sub_100045E00();
    int v46 = sub_100045DE0();

    uint64_t v30 = (void *)sub_100025974();
    uint64_t v31 = sub_100045DF0();
    uint64_t v48 = v32;
    uint64_t v49 = v31;

    objc_super v33 = (void *)sub_100025974();
    int v47 = sub_100045DE0();

    uint64_t v34 = (void *)sub_100025974();
    char v35 = sub_100045DE0();

    Swift::String v36 = (void *)sub_100025974();
    char v37 = sub_100045DE0();

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
    sub_1000259D4();
    sub_100045950();
    sub_100007D44();
    swift_allocError();
    sub_1000259A8();
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v6);
  }
}

uint64_t sub_100020F18(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_100023438(a1, v20);
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

uint64_t sub_1000210CC(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v60 = a8;
  Swift::String v65 = a7;
  uint64_t v56 = a3;
  uint64_t v54 = a2;
  uint64_t v61 = a1;
  uint64_t v59 = a9;
  uint64_t v11 = sub_100045420();
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
  uint64_t v16 = sub_100044F90();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = swift_projectBox();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v20, v16);
  Class v21 = sub_100044F50();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  id v22 = [a4 requestByEncodingRequest:v21 parameters:0];

  if (*(unsigned char *)(a6 + *(int *)(v14 + 36)))
  {
    sub_100004A2C(&qword_10005D068);
    id v23 = v22;
    sub_100045AD0();
    sub_100024970(a6, (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v24 = (*((unsigned __int8 *)v52 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v52 + 80);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    sub_100024B7C((uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24);
    uint64_t v26 = v65;
    *(void *)(v25 + ((v15 + v24 + 7) & 0xFFFFFFFFFFFFFFF8)) = v65;
    uint64_t v27 = sub_1000457A0();
    uint64_t v63 = v27;
    uint64_t v64 = &protocol witness table for SyncTaskScheduler;
    sub_10001F7F4(v62);
    id v28 = a4;
    id v29 = v26;
    sub_100045790();
    sub_100005A4C(0, &qword_10005D070);
    sub_100045A20();
    swift_release();
    swift_release();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
    uint64_t v63 = v27;
    uint64_t v64 = &protocol witness table for SyncTaskScheduler;
    sub_10001F7F4(v62);
    sub_100045790();
    id v22 = (id)sub_100045AC0();
    swift_release();

    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
  }
  uint64_t v52 = v22;
  uint64_t v30 = v60;
  sub_100004A2C(&qword_10005CFD0);
  swift_beginAccess();
  id v31 = [*(id *)(v30 + 16) dataTaskPromiseWithRequestPromise:v22];
  uint64_t v51 = sub_100045AD0();
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
  uint64_t v63 = sub_1000457C0();
  uint64_t v64 = &protocol witness table for RunLoopWorkerThread;
  v62[0] = v59;
  id v44 = v41;
  swift_retain_n();
  id v45 = v43;
  id v46 = v44;
  id v47 = v45;
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  swift_release();

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
}

void sub_10002168C(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  uint64_t v9 = sub_100045500();
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

    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    *((void *)&v41 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v40 = a4;
    id v15 = a4;
    id v11 = v14;
    id v16 = (id)AMSLogKey();
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = sub_100045C30();
      uint64_t v33 = v19;
      uint64_t v35 = v18;

      sub_1000454F0();
      v42._countAndFlagsBits = 0;
      v42._object = (void *)0xE000000000000000;
      sub_1000454E0(v42);
      sub_100005548(&v40, *((uint64_t *)&v41 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = DynamicType;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v43._countAndFlagsBits = 5972026;
      v43._object = (void *)0xE300000000000000;
      sub_1000454E0(v43);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v37 = v35;
      uint64_t v38 = v33;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v21._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v44._countAndFlagsBits = 0;
      v44._object = (void *)0xE000000000000000;
      sub_1000454E0(v44);
      sub_100005548(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v22 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v22;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v21._countAndFlagsBits = 58;
    }
    v21._object = (void *)0xE100000000000000;
    sub_1000454E0(v21);
    sub_100045510();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v40);
    sub_1000454B0();
    if (v11)
    {
      *((void *)&v41 + 1) = sub_100005A4C(0, (unint64_t *)&qword_10005C630);
      *(void *)&long long v40 = v11;
    }
    else
    {
      long long v40 = 0u;
      long long v41 = 0u;
    }
    type metadata accessor for Log();
    sub_100045520();
    sub_10000C890((uint64_t)&v40, (uint64_t *)&unk_10005CC40);
    sub_100034904();
    swift_bridgeObjectRelease();
  }
  if (v11)
  {
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    *((void *)&v41 + 1) = type metadata accessor for JSNetworkObject(0);
    *(void *)&long long v40 = a4;
    id v23 = a4;
    id v24 = v11;
    id v25 = (id)AMSLogKey();
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v34 = sub_100045C30();
      uint64_t v28 = v27;

      sub_1000454F0();
      v45._countAndFlagsBits = 0;
      v45._object = (void *)0xE000000000000000;
      sub_1000454E0(v45);
      sub_100005548(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v29 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v29;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v46._countAndFlagsBits = 5972026;
      v46._object = (void *)0xE300000000000000;
      sub_1000454E0(v46);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v37 = v34;
      uint64_t v38 = v28;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v30._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v47._countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      sub_1000454E0(v47);
      sub_100005548(&v40, *((uint64_t *)&v41 + 1));
      uint64_t v31 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v37 = v31;
      sub_1000454D0();
      sub_10000C890((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
      v30._countAndFlagsBits = 58;
    }
    v30._object = (void *)0xE100000000000000;
    sub_1000454E0(v30);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v40);
    sub_1000454B0();
    sub_100034904();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v24, 0);
  }
  objc_msgSend(v10, "ak_addClientInfoHeader");

  *a5 = v10;
  id v32 = v10;
}

void sub_100021CD4(void **a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_100045500();
  __chkstk_darwin(v8 - 8);
  uint64_t v27 = *a1;
  swift_beginAccess();
  uint64_t v9 = *(void **)(a3 + 16);
  swift_beginAccess();
  id v10 = v9;
  id v11 = (void *)sub_100024414(v10);
  swift_endAccess();

  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v31 = type metadata accessor for JSNetworkObject(0);
  v30[0] = a2;
  a2;
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100045C30();
    id v15 = a4;
    uint64_t v17 = v16;

    sub_1000454F0();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_1000454E0(v32);
    sub_100005548(v30, v31);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v28[0] = DynamicType;
    sub_1000454D0();
    sub_10000C890((uint64_t)v28, (uint64_t *)&unk_10005CC40);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_1000454E0(v33);
    uint64_t MetatypeMetadata = &type metadata for String;
    v28[0] = v14;
    v28[1] = v17;
    a4 = v15;
    sub_1000454D0();
    sub_10000C890((uint64_t)v28, (uint64_t *)&unk_10005CC40);
    v19._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_1000454E0(v34);
    sub_100005548(v30, v31);
    uint64_t v20 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v28[0] = v20;
    sub_1000454D0();
    sub_10000C890((uint64_t)v28, (uint64_t *)&unk_10005CC40);
    v19._countAndFlagsBits = 58;
  }
  v19._object = (void *)0xE100000000000000;
  sub_1000454E0(v19);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v30);
  sub_1000454B0();
  uint64_t v31 = sub_100005A4C(0, &qword_10005D078);
  v30[0] = v27;
  id v21 = v27;
  sub_100045520();
  sub_10000C890((uint64_t)v30, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  id v22 = v21;
  id v23 = sub_100022390(a4, v22);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1000471C0;
  *(void *)(v24 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v24 + 32) = v23;
  id v25 = v23;
  uint64_t v26 = (void *)sub_100045410();

  swift_bridgeObjectRelease();
}

id sub_100022390(void *a1, void *a2)
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
  sub_100045E90();
  swift_unknownObjectRelease();
  sub_100005AE4(v16, &v17);
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  sub_1000049D0((uint64_t)&v17, (uint64_t)v16);
  id v6 = a1;
  id result = sub_100025D08(v16, a1);
  if (!result)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_100045E10();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v17);
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
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  id v11 = [v10 statusCode];
  uint64_t v18 = &type metadata for Int;
  *(void *)&long long v17 = v11;
  id v12 = a1;
  id result = sub_100025D08(&v17, a1);
  if (!result) {
    goto LABEL_14;
  }
  sub_100045E10();
  id v13 = [v10 allHeaderFields];
  uint64_t v14 = sub_100045BD0();

  uint64_t v18 = (void *)sub_100004A2C(&qword_10005C500);
  *(void *)&long long v17 = v14;
  id v15 = v12;
  id result = sub_100025D08(&v17, a1);
  if (result)
  {
    sub_100045E10();
    goto LABEL_10;
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_1000225F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, objc_class *a5)
{
  uint64_t v46 = a4;
  uint64_t v9 = sub_100045950();
  uint64_t v48 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  Swift::String v47 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100045500();
  __chkstk_darwin(v11 - 8);
  swift_beginAccess();
  id v12 = *(void **)(a3 + 16);
  swift_beginAccess();
  id v13 = v12;
  uint64_t v14 = (void *)sub_100024414(v13);
  swift_endAccess();

  uint64_t v15 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v16 = *(void *)(sub_100045550() - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v42 = v18 + 3 * *(void *)(v16 + 72);
  uint64_t v41 = v17 | 7;
  uint64_t v19 = swift_allocObject();
  long long v40 = xmmword_1000473B0;
  *(_OWORD *)(v19 + 16) = xmmword_1000473B0;
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
    uint64_t v23 = sub_100045C30();
    uint64_t v45 = v24;

    sub_1000454F0();
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    sub_1000454E0(v56);
    sub_100005548(v54, v55);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v52[0] = DynamicType;
    sub_1000454D0();
    sub_10000C890((uint64_t)v52, (uint64_t *)&unk_10005CC40);
    v57._countAndFlagsBits = 5972026;
    v57._object = (void *)0xE300000000000000;
    sub_1000454E0(v57);
    uint64_t MetatypeMetadata = &type metadata for String;
    v52[0] = v23;
    v52[1] = v45;
    sub_1000454D0();
    sub_10000C890((uint64_t)v52, (uint64_t *)&unk_10005CC40);
    v26._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v58._countAndFlagsBits = 0;
    v58._object = (void *)0xE000000000000000;
    sub_1000454E0(v58);
    sub_100005548(v54, v55);
    uint64_t v27 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v52[0] = v27;
    sub_1000454D0();
    sub_10000C890((uint64_t)v52, (uint64_t *)&unk_10005CC40);
    v26._countAndFlagsBits = 58;
  }
  v26._object = (void *)0xE100000000000000;
  sub_1000454E0(v26);
  sub_100045510();
  uint64_t v28 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v54);
  sub_1000454B0();
  uint64_t v29 = v49;
  swift_getErrorValue();
  uint64_t v30 = v50;
  uint64_t v31 = v51;
  uint64_t v55 = v51;
  Swift::String v32 = sub_10001F7F4(v54);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v32, v30, v31);
  sub_100045520();
  sub_10000C890((uint64_t)v54, (uint64_t *)&unk_10005CC40);
  uint64_t v45 = v28;
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005CC60);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1000471C0;
  swift_errorRetain();
  Swift::String v34 = v47;
  sub_10001A1C8(v29);
  v35.super.Class isa = a5;
  Class isa = sub_100045930(v35).super.isa;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v9);
  *(void *)(v33 + 56) = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v33 + 32) = isa;
  uint64_t v37 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
}

void sub_100022DF8()
{
}

id sub_100022E38()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSNetworkObject(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100022F34()
{
  return type metadata accessor for JSNetworkObject(0);
}

uint64_t type metadata accessor for JSNetworkObject(uint64_t a1)
{
  return sub_1000233E4(a1, (uint64_t *)&unk_10005D040);
}

uint64_t sub_100022F5C()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100023020(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100004A2C(&qword_10005D050);
    objc_super v2 = (void *)sub_100046040();
  }
  else
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
  }
  sub_100023438(a1, v47);
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
    sub_1000089A0(*(void *)(v41 + 48) + 40 * v14, (uint64_t)__src);
    sub_1000049D0(*(void *)(v41 + 56) + 32 * v14, (uint64_t)&__src[40]);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1000089A0((uint64_t)__dst, (uint64_t)v44);
    if (!swift_dynamicCast())
    {
      sub_10000C890((uint64_t)__dst, &qword_10005D058);
LABEL_33:
      uint64_t v27 = swift_bridgeObjectRelease();
      sub_100025A40(v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)v40, (uint64_t)&__dst[40], (uint64_t)&__src[40], v41);
      sub_10000A950();
      swift_release();
      return 0;
    }
    sub_1000049D0((uint64_t)&__dst[40], (uint64_t)v44);
    sub_10000C890((uint64_t)__dst, &qword_10005D058);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_33;
    }
    unint64_t result = sub_100008474(v42, v43);
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
              sub_100025A40(result, v6, v7, v8, v9, v10, v11, v12, v35, v36, v37, v38, v39, (uint64_t)v40, (uint64_t)&__dst[40], (uint64_t)&__src[40], v41);
              sub_10000A950();
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

void sub_1000233AC(void *a1@<X0>, char *a2@<X8>)
{
}

uint64_t type metadata accessor for NetworkRequest(uint64_t a1)
{
  return sub_1000233E4(a1, qword_10005D0D8);
}

uint64_t sub_1000233E4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100023418(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_100023438@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

void sub_100023470(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100046020();
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
  sub_100004A2C(&qword_10005D060);
  uint64_t v3 = (void *)sub_100045F80();
LABEL_6:
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100046020();
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
      id v8 = (id)sub_100045FA0();
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
    Swift::Int v11 = sub_100045E20(v3[5]);
    uint64_t v12 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
    uint64_t v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_100005A4C(0, (unint64_t *)&qword_10005C640);
      id v17 = *(id *)(v3[6] + 8 * v13);
      char v18 = sub_100045E30();

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
        char v21 = sub_100045E30();

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

uint64_t sub_1000236C4(void *a1, void *a2)
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
    uint64_t v9 = sub_100045EF0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100005A4C(0, (unint64_t *)&qword_10005C640);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100045EE0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100023960(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100023B48();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100023DE4((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v10 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v11 = sub_100045E20(v10);
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_100005A4C(0, (unint64_t *)&qword_10005C640);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_100045E30();

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
        char v18 = sub_100045E30();

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
    sub_100023E68((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_100023960(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  sub_100004A2C(&qword_10005D060);
  uint64_t v2 = sub_100045F70();
  uint64_t v14 = v2;
  sub_100045ED0();
  if (!sub_100045F00())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  while (1)
  {
    swift_dynamicCast();
    uint64_t v2 = v14;
    if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
    {
      sub_100023B48();
      uint64_t v2 = v14;
    }
    Swift::Int result = sub_100045E20(*(void *)(v2 + 40));
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
    if (!sub_100045F00()) {
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

uint64_t sub_100023B48()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A2C(&qword_10005D060);
  uint64_t v3 = sub_100045F60();
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
      uint64_t result = sub_100045E20(*(void *)(v4 + 40));
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
                sub_100023418(0, (unint64_t)(v27 + 63) >> 6, (void *)(v2 + 56));
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

unint64_t sub_100023DE4(uint64_t a1, void *a2)
{
  sub_100045E20(a2[5]);
  unint64_t result = sub_100045EC0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100023E68(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100023B48();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100023FF0();
      goto LABEL_14;
    }
    sub_10002419C();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100045E20(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100005A4C(0, (unint64_t *)&qword_10005C640);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100045E30();

    if (v12)
    {
LABEL_13:
      sub_100046100();
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
        char v15 = sub_100045E30();

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

id sub_100023FF0()
{
  unint64_t v1 = v0;
  sub_100004A2C(&qword_10005D060);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100045F50();
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

uint64_t sub_10002419C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004A2C(&qword_10005D060);
  uint64_t v3 = sub_100045F60();
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
    uint64_t result = sub_100045E20(v18);
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

uint64_t sub_100024414(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) == 0)
  {
    Swift::Int v8 = *(void *)(v4 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v9 = sub_100045E20(v8);
    uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v11 = v9 & ~v10;
    if ((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
    {
      sub_100005A4C(0, (unint64_t *)&qword_10005C640);
      id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v13 = sub_100045E30();

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
          sub_100023FF0();
          uint64_t v18 = v20;
        }
        uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
        sub_100024784(v11);
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
        char v16 = sub_100045E30();

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
  char v6 = sub_100045F10();

  if ((v6 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = sub_1000245E8();
LABEL_12:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1000245E8()
{
  unint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_100045EE0();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_100023960(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = sub_100045E20(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100005A4C(0, (unint64_t *)&qword_10005C640);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = sub_100045E30();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_100024784(v8);
      if (sub_100045E30())
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
        char v13 = sub_100045E30();

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

unint64_t sub_100024784(unint64_t result)
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
    uint64_t v8 = sub_100045EB0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = sub_100045E20(v10);

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

uint64_t sub_10002491C(void *a1)
{
  return sub_10001FB6C(a1, *(void **)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_100024938()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100024970(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000249D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024A30()
{
  uint64_t v1 = *(void *)(type metadata accessor for NetworkRequest(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 32) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  sub_1000450E0();
  sub_10000CB80();
  sub_10000CB50();
  v5();
  sub_100025990();
  swift_bridgeObjectRelease();
  sub_100025990();
  sub_100025990();
  sub_100025990();

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3);
}

uint64_t sub_100024B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024BE0(void *a1, void *a2, void *a3)
{
  uint64_t v7 = type metadata accessor for NetworkRequest(0);
  sub_1000078C0(v7);
  sub_100025A10();
  return sub_1000210CC(a1, a2, a3, *(void **)(v3 + 16), *(void *)(v3 + 24), v3 + v8, *(void **)(v3 + v9), *(void *)(v3 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v3 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_100024C8C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6._countAndFlagsBits = a3;
  v6._object = a4;
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  sub_100044F70(v6, v7);
}

uint64_t sub_100024CC8()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 40) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_release();
  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

void sub_100024D6C(void **a1)
{
  sub_100045420();
  uint64_t v3 = (void *)v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (void *)v1[4];

  sub_100021CD4(a1, v3, v4, v5);
}

uint64_t sub_100024DE4()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((v5 + 32) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  uint64_t v8 = sub_10001465C();
  v9(v8);

  return _swift_deallocObject(v0, v7 + 8, v6);
}

void sub_100024E9C(uint64_t a1)
{
  uint64_t v3 = sub_100045420();
  sub_1000078C0(v3);
  sub_100025A10();
  uint64_t v5 = *(void **)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v8 = *(objc_class **)(v1 + v7);

  sub_1000225F0(a1, v5, v6, v1 + v4, v8);
}

uint64_t sub_100024F10()
{
  uint64_t v1 = *(void *)(type metadata accessor for NetworkRequest(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8;

  sub_1000450E0();
  sub_10000CB80();
  sub_10000CB50();
  v5();
  sub_100025990();
  swift_bridgeObjectRelease();
  sub_100025990();
  sub_100025990();
  sub_100025990();

  return _swift_deallocObject(v0, v4 + 8, v3);
}

void sub_10002502C(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for NetworkRequest(0);
  sub_1000078C0(v5);
  sub_100025A10();
  sub_10002168C(a1, *(void **)(v2 + 16), v2 + v6, *(void **)(v2 + v7), a2);
}

void *sub_1000250AC(void *a1, void *a2, int *a3)
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
    uint64_t v7 = sub_1000450E0();
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

uint64_t sub_10002521C(uint64_t a1)
{
  uint64_t v2 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000252D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000450E0();
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

uint64_t sub_1000253F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000450E0();
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

uint64_t sub_100025568(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000450E0();
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

uint64_t sub_10002563C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000450E0();
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

uint64_t sub_100025760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025774);
}

uint64_t sub_100025774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000450E0();
  sub_10001F838();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_100005A24(a1, a2, v6);
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

uint64_t sub_100025808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002581C);
}

void sub_10002581C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000450E0();
  sub_10001F838();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_100005994(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_1000258AC()
{
  uint64_t result = sub_1000450E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100025974()
{
  return sub_100045E00();
}

uint64_t sub_100025990()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000259A8()
{
  return sub_100045920();
}

uint64_t sub_1000259D4()
{
  return sub_100045E00();
}

uint64_t sub_100025A20()
{
  return swift_allocError();
}

uint64_t sub_100025A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return a17;
}

uint64_t sub_100025A54()
{
  return sub_100045E00();
}

id sub_100025A74(uint64_t a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v3 - 8);
  int v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017BA8(a1, (uint64_t)v5);
  uint64_t v6 = sub_1000450E0();
  int v7 = sub_100005A24((uint64_t)v5, 1, v6);
  uint64_t v8 = v1;
  if (v7 == 1)
  {
    sub_10000A8F0((uint64_t)v5);
    unint64_t v9 = 0xE700000000000000;
    uint64_t v10 = 0x6E776F6E6B6E75;
  }
  else
  {
    uint64_t v10 = sub_100045040();
    unint64_t v9 = v11;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v12 = (uint64_t *)&v8[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSServiceObject_url];
  *uint64_t v12 = v10;
  v12[1] = v9;

  uint64_t v13 = (objc_class *)type metadata accessor for JSServiceObject();
  v16.receiver = v8;
  v16.super_class = v13;
  id v14 = objc_msgSendSuper2(&v16, "init");
  sub_10000A8F0(a1);
  return v14;
}

uint64_t sub_100025C20()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSServiceObject_url);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_100025C5C()
{
}

id sub_100025C9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSServiceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSServiceObject()
{
  return self;
}

id sub_100025D08(void *a1, void *a2)
{
  uint64_t v4 = a1[3];
  if (v4)
  {
    sub_100005548(a1, a1[3]);
    sub_100005D34();
    uint64_t v7 = v6;
    __chkstk_darwin();
    sub_100028238();
    (*(void (**)(uint64_t))(v7 + 16))(v2);
    uint64_t v8 = sub_1000460E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v2, v4);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
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

  return sub_100025EC0(a4, v6);
}

uint64_t type metadata accessor for JSServiceRequest()
{
  uint64_t result = qword_10005D210;
  if (!qword_10005D210) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100025EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005C838);
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

  return sub_100017BA8(v3, a1);
}

uint64_t JSServiceRequest.init(deserializing:using:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = a1;
  uint64_t v2 = sub_100004A2C(&qword_10005C838);
  uint64_t v3 = sub_100017ED4(v2);
  __chkstk_darwin(v3);
  uint64_t v30 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004A2C(&qword_10005C9E0);
  uint64_t v6 = sub_100017ED4(v5);
  __chkstk_darwin(v6);
  sub_100017F10();
  uint64_t v9 = v8 - v7;
  sub_100045480();
  sub_100005D34();
  uint64_t v11 = v10;
  uint64_t v13 = __chkstk_darwin(v12);
  __chkstk_darwin(v13);
  sub_100028314();
  sub_100045490();
  uint64_t v14 = sub_100045460();
  uint64_t v16 = v15;
  uint64_t v17 = *(void (**)(void))(v11 + 8);
  sub_1000282A4();
  v17();
  uint64_t v18 = v28;
  *uint64_t v28 = v14;
  v18[1] = v16;
  uint64_t v19 = v18;
  sub_1000282C8();
  sub_100045490();
  sub_100045430();
  sub_1000282A4();
  v17();
  uint64_t v20 = sub_1000456B0();
  if (sub_100005A24(v9, 1, v20) == 1)
  {
    sub_10000C890(v9, &qword_10005C9E0);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = sub_1000456A0();
    sub_100017F4C();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v9, v20);
  }
  v19[2] = v21;
  sub_100045490();
  uint64_t v23 = (uint64_t)v30;
  sub_100045450();
  sub_1000455A0();
  sub_10000CB80();
  sub_10000CB50();
  v24();
  sub_1000282A4();
  v17();
  sub_1000282A4();
  v17();
  uint64_t v25 = type metadata accessor for JSServiceRequest();
  return sub_100025EC0(v23, (uint64_t)v19 + *(int *)(v25 + 24));
}

uint64_t sub_10002627C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  return JSServiceRequest.init(deserializing:using:)(a1, a2);
}

unint64_t JSServiceRequest.kind.getter()
{
  return 0xD000000000000016;
}

JSValue __swiftcall JSServiceRequest.makeValue(in:)(JSContext in)
{
  uint64_t v3 = sub_100004A2C(&qword_10005C838);
  uint64_t v4 = sub_100017ED4(v3);
  __chkstk_darwin(v4);
  sub_100017F10();
  uint64_t v7 = v6 - v5;
  result.super.Class isa = (Class)[self valueWithNewObjectInContext:in.super.isa];
  if (!result.super.isa)
  {
    __break(1u);
    goto LABEL_15;
  }
  Class isa = result.super.isa;
  sub_10000F938();
  uint64_t v10 = in.super.isa;
  result.super.Class isa = (Class)sub_100028250();
  if (!result.super.isa)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_100045E10();
  if (!*(void *)(v1 + 8)) {
    goto LABEL_6;
  }
  uint64_t v11 = v10;
  swift_bridgeObjectRetain();
  result.super.Class isa = (Class)sub_100028250();
  if (!result.super.isa)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_100045E10();
LABEL_6:
  uint64_t v12 = type metadata accessor for JSServiceRequest();
  sub_100017BA8(v1 + *(int *)(v12 + 24), v7);
  uint64_t v13 = sub_1000450E0();
  if (sub_100005A24(v7, 1, v13) == 1)
  {
    sub_10000C890(v7, &qword_10005C838);
LABEL_10:
    if (!*(void *)(v1 + 16)) {
      return (JSValue)isa;
    }
    sub_100004A2C(&qword_10005C500);
    uint64_t v18 = v10;
    swift_bridgeObjectRetain();
    result.super.Class isa = (Class)sub_100028250();
    if (result.super.isa)
    {
      sub_100045E10();
      return (JSValue)isa;
    }
    goto LABEL_17;
  }
  sub_100045040();
  sub_100017F4C();
  sub_10000CB50();
  v16(v14, v15);
  uint64_t v17 = v10;
  result.super.Class isa = (Class)sub_100028250();
  if (result.super.isa)
  {
    sub_100045E10();
    goto LABEL_10;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_10002651C()
{
}

unint64_t sub_100026530()
{
  return 0xD000000000000016;
}

void *Data.init(deserializing:using:)(void *a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005C9E0);
  uint64_t v4 = sub_100017ED4(v3);
  __chkstk_darwin(v4);
  sub_100028238();
  uint64_t v5 = a1;
  sub_100045430();
  uint64_t v6 = sub_1000456B0();
  if (sub_100005A24(v1, 1, v6) == 1)
  {
    sub_10000C890(v1, &qword_10005C9E0);
LABEL_6:
    [objc_allocWithZone((Class)NSError) init];
LABEL_7:
    swift_willThrow();
    sub_1000455A0();
    sub_10000CB80();
    sub_10000CB50();
    v14();
    sub_100045480();
    sub_10000CB80();
    sub_10000CB50();
    v15();
    return v5;
  }
  uint64_t v5 = (void *)sub_1000456A0();
  sub_100017F4C();
  sub_10000CB50();
  v7();
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v8 = self;
  Class isa = sub_100045BC0().super.isa;
  swift_bridgeObjectRelease();
  id v17 = 0;
  id v10 = [v8 dataWithJSONObject:isa options:0 error:&v17];

  id v11 = v17;
  if (!v10)
  {
    uint64_t v5 = v11;
    sub_100045010();

    goto LABEL_7;
  }
  uint64_t v5 = (void *)sub_100045110();

  sub_1000455A0();
  sub_10000CB80();
  sub_10000CB50();
  v12();
  sub_100045480();
  sub_10000CB80();
  sub_10000CB50();
  v13();
  return v5;
}

uint64_t sub_100026810(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E656D67617266 && a2 == 0xE800000000000000;
  if (v2 || (sub_100028314(), (sub_1000282E0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000;
    if (v6 || (sub_1000282C8(), (sub_1000282E0() & 1) != 0))
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
      char v8 = sub_1000282E0();
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

uint64_t sub_10002690C(char a1)
{
  if (!a1) {
    return 0x746E656D67617266;
  }
  if (a1 == 1) {
    return 0x736E6F6974706FLL;
  }
  return 7107189;
}

void *sub_10002695C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  JSValue result = Data.init(deserializing:using:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_100026988()
{
  return sub_10002690C(*v0);
}

uint64_t sub_100026990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100026810(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000269B8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000269C4(uint64_t a1)
{
  unint64_t v2 = sub_100027498();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100026A00(uint64_t a1)
{
  unint64_t v2 = sub_100027498();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t JSServiceRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100004A2C(&qword_10005C838);
  uint64_t v6 = sub_100017ED4(v5);
  __chkstk_darwin(v6);
  sub_100028288(v7, v24);
  sub_100004A2C(&qword_10005D168);
  sub_100005D34();
  __chkstk_darwin(v8);
  sub_1000282B0();
  uint64_t v9 = type metadata accessor for JSServiceRequest();
  sub_100017F4C();
  __chkstk_darwin(v10);
  sub_100028238();
  sub_100005548(a1, a1[3]);
  sub_100027498();
  sub_1000461B0();
  if (v2) {
    return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
  }
  uint64_t v26 = v9;
  LOBYTE(v30[0]) = 0;
  *uint64_t v3 = sub_100046060();
  v3[1] = v12;
  LOBYTE(v29) = 1;
  sub_1000274E4();
  sub_100046090();
  uint64_t v13 = self;
  id v14 = v30[0];
  id v25 = v30[1];
  Class isa = sub_100045100().super.isa;
  v30[0] = 0;
  id v16 = [v13 JSONObjectWithData:isa options:0 error:v30];

  if (v16)
  {
    id v17 = v30[0];
    sub_100045E90();
    sub_10002758C((uint64_t)v14, (unint64_t)v25);
    swift_unknownObjectRelease();
    sub_100004A2C(&qword_10005C500);
    int v18 = swift_dynamicCast();
    uint64_t v19 = v29;
    if (!v18) {
      uint64_t v19 = 0;
    }
    v3[2] = v19;
    LOBYTE(v30[0]) = 2;
    sub_100046060();
    sub_1000450C0();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_1000282FC();
    v21(v20);
    sub_100025EC0(v28, (uint64_t)v3 + *(int *)(v26 + 24));
    sub_1000178AC((uint64_t)v3, a2);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
    return sub_100027530((uint64_t)v3);
  }
  else
  {
    id v22 = v30[0];
    sub_100045010();

    swift_willThrow();
    sub_10002758C((uint64_t)v14, (unint64_t)v25);
    sub_10000CB50();
    v23();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t JSServiceRequest.encode(to:)(void *a1)
{
  uint64_t v4 = v2;
  uint64_t v5 = v1;
  uint64_t v7 = sub_100004A2C(&qword_10005C838);
  uint64_t v8 = sub_100017ED4(v7);
  __chkstk_darwin(v8);
  sub_100017F10();
  uint64_t v11 = v10 - v9;
  sub_1000450E0();
  sub_100005D34();
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  __chkstk_darwin(v12);
  sub_100028288(v14, v31);
  uint64_t v15 = sub_100004A2C(&qword_10005D180);
  sub_100005D34();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_1000282B0();
  sub_100005548(a1, a1[3]);
  sub_100027498();
  sub_1000461C0();
  if (*(void *)(v5 + 8))
  {
    LOBYTE(v35[0]) = 0;
    sub_10002832C();
    uint64_t v4 = v2;
    if (v2) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
    }
  }
  if (*(void *)(v5 + 16))
  {
    uint64_t v19 = self;
    Class isa = sub_100045BC0().super.isa;
    v35[0] = 0;
    id v21 = [v19 dataWithJSONObject:isa options:0 error:v35];

    id v22 = v35[0];
    if (!v21)
    {
      uint64_t v28 = v22;
      sub_100045010();

      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
    }
    uint64_t v23 = (void *)sub_100045110();
    id v25 = v24;

    v35[0] = v23;
    v35[1] = v25;
    sub_1000275E4();
    sub_1000460D0();
    if (v4)
    {
      sub_1000282A4();
      v26();
      return sub_10002758C((uint64_t)v23, (unint64_t)v25);
    }
    sub_10002758C((uint64_t)v23, (unint64_t)v25);
  }
  uint64_t v29 = type metadata accessor for JSServiceRequest();
  sub_100017BA8(v5 + *(int *)(v29 + 24), v11);
  if (sub_100005A24(v11, 1, v34) == 1)
  {
    sub_1000282A4();
    v30();
    return sub_10000C890(v11, &qword_10005C838);
  }
  (*(void (**)(void))(v33 + 32))();
  sub_100045040();
  LOBYTE(v35[0]) = 2;
  sub_10002832C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v32, v34);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v3, v15);
}

uint64_t sub_1000271CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return JSServiceRequest.init(from:)(a1, a2);
}

uint64_t sub_1000271E4(void *a1)
{
  return JSServiceRequest.encode(to:)(a1);
}

uint64_t JSServiceRequest.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)0xE900000000000064;
  uint64_t v3 = 0x656E696665646E75;
  sub_100004A2C(&qword_10005C838);
  sub_100017F4C();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v20 - v8;
  uint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_100045F90(56);
  uint64_t v10 = type metadata accessor for JSServiceRequest();
  v20[0] = v10;
  sub_100004A2C(&qword_10005D190);
  v23._countAndFlagsBits = sub_100045C80();
  object = v23._object;
  sub_100045CA0(v23);
  swift_bridgeObjectRelease();
  v24._object = (void *)0x800000010004A8D0;
  v24._countAndFlagsBits = 0xD000000000000013;
  sub_100045CA0(v24);
  uint64_t v12 = v0[1];
  if (v12)
  {
    v20[0] = *v0;
    v20[1] = v12;
    swift_bridgeObjectRetain();
    sub_100004A2C(&qword_10005CF40);
    v13._countAndFlagsBits = sub_100045C80();
    object = v13._object;
  }
  else
  {
    v13._countAndFlagsBits = sub_10002826C();
  }
  v13._object = object;
  sub_100045CA0(v13);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0x706F202020200A29;
  v25._object = (void *)0xEF203A736E6F6974;
  sub_100045CA0(v25);
  if (v0[2])
  {
    v20[0] = v0[2];
    swift_bridgeObjectRetain();
    sub_100004A2C(&qword_10005D198);
    v14._countAndFlagsBits = sub_100045C80();
    object = v14._object;
  }
  else
  {
    v14._countAndFlagsBits = sub_10002826C();
  }
  v14._object = object;
  sub_100045CA0(v14);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 0x7275202020200A29;
  v26._object = (void *)0xEB00000000203A6CLL;
  sub_100045CA0(v26);
  uint64_t v15 = (uint64_t)v0 + *(int *)(v10 + 24);
  sub_100017BA8((uint64_t)v1 + *(int *)(v10 + 24), (uint64_t)v9);
  uint64_t v16 = sub_1000450E0();
  int v17 = sub_100005A24((uint64_t)v9, 1, v16);
  sub_10000C890((uint64_t)v9, &qword_10005C838);
  if (v17 != 1)
  {
    sub_100017BA8(v15, (uint64_t)v7);
    uint64_t v3 = sub_100045C80();
    uint64_t v2 = v18;
  }
  v27._countAndFlagsBits = v3;
  v27._object = v2;
  sub_100045CA0(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 8194601;
  v28._object = (void *)0xE300000000000000;
  sub_100045CA0(v28);
  return v21;
}

unint64_t sub_100027498()
{
  unint64_t result = qword_10005D170;
  if (!qword_10005D170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D170);
  }
  return result;
}

unint64_t sub_1000274E4()
{
  unint64_t result = qword_10005D178;
  if (!qword_10005D178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D178);
  }
  return result;
}

uint64_t sub_100027530(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSServiceRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002758C(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000275E4()
{
  unint64_t result = qword_10005D188;
  if (!qword_10005D188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D188);
  }
  return result;
}

uint64_t sub_100027630()
{
  return sub_100027698(&qword_10005D1A0);
}

uint64_t sub_100027664()
{
  return sub_100027698(&qword_10005D1A8);
}

uint64_t sub_100027698(unint64_t *a1)
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

unint64_t sub_1000276E0()
{
  unint64_t result = qword_10005D1B0;
  if (!qword_10005D1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D1B0);
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
    uint64_t v9 = sub_1000450E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_100005A24((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = sub_100004A2C(&qword_10005C838);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      sub_100005994((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for JSServiceRequest(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1000450E0();
  uint64_t result = sub_100005A24(v4, 1, v5);
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
  uint64_t v8 = sub_1000450E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_100005A24((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100004A2C(&qword_10005C838);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    sub_100005994((uint64_t)v6, 0, 1, v8);
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
  uint64_t v9 = sub_1000450E0();
  int v10 = sub_100005A24((uint64_t)v7, 1, v9);
  int v11 = sub_100005A24((uint64_t)v8, 1, v9);
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
    uint64_t v13 = sub_100004A2C(&qword_10005C838);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  sub_100005994((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = sub_1000450E0();
  if (sub_100005A24((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_100004A2C(&qword_10005C838);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    sub_100005994((uint64_t)v5, 0, 1, v7);
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
  uint64_t v10 = sub_1000450E0();
  int v11 = sub_100005A24((uint64_t)v8, 1, v10);
  int v12 = sub_100005A24((uint64_t)v9, 1, v10);
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
    uint64_t v14 = sub_100004A2C(&qword_10005C838);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  sub_100005994((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100027E1C);
}

uint64_t sub_100027E1C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = sub_100004A2C(&qword_10005C838);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return sub_100005A24(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100027EC8);
}

uint64_t sub_100027EC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = sub_100004A2C(&qword_10005C838);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_100005994(v8, a2, a2, v7);
  }
  return result;
}

void sub_100027F4C()
{
  sub_100027FEC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100027FEC()
{
  if (!qword_10005D220)
  {
    sub_1000450E0();
    unint64_t v0 = sub_100045E70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005D220);
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
        JUMPOUT(0x100028110);
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

unint64_t sub_10002814C()
{
  unint64_t result = qword_10005D258;
  if (!qword_10005D258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D258);
  }
  return result;
}

unint64_t sub_10002819C()
{
  unint64_t result = qword_10005D260;
  if (!qword_10005D260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D260);
  }
  return result;
}

unint64_t sub_1000281EC()
{
  unint64_t result = qword_10005D268;
  if (!qword_10005D268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D268);
  }
  return result;
}

id sub_100028250()
{
  return sub_100025D08((void *)(v1 - 112), v0);
}

uint64_t sub_10002826C()
{
  return 0x656E696665646E75;
}

void sub_100028288(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1000282C8()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_1000282E0()
{
  return sub_1000460F0();
}

uint64_t sub_1000282FC()
{
  return v0;
}

uint64_t sub_100028314()
{
  return 0x746E656D67617266;
}

uint64_t sub_10002832C()
{
  return sub_1000460A0();
}

uint64_t sub_10002834C()
{
  return sub_100029118();
}

uint64_t sub_100028364(void *a1)
{
  return sub_100029CE4(a1);
}

uint64_t sub_100028390(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a3;
  Swift::String v27 = a1;
  uint64_t v4 = sub_100045420();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  Swift::String v25 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = sub_100004A2C(&qword_10005D298);
  __chkstk_darwin(v10 - 8);
  int v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045D10();
  sub_100005994((uint64_t)v12, 1, 1, v13);
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
  sub_100028F74((uint64_t)v12, (uint64_t)&unk_10005D2C0, v19);
  return swift_release();
}

uint64_t sub_1000285C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  _OWORD v6[2] = a4;
  uint64_t v7 = sub_100045950();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  type metadata accessor for SessionAuthenticatorBillingPlanResponse(0);
  v6[8] = swift_task_alloc();
  uint64_t v8 = sub_1000452B0();
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  uint64_t v9 = sub_1000451E0();
  v6[12] = v9;
  v6[13] = *(void *)(v9 - 8);
  v6[14] = swift_task_alloc();
  return _swift_task_switch(sub_100028768, 0, 0);
}

uint64_t sub_100028768()
{
  sub_100045270();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v1;
  void *v1 = v0;
  v1[1] = sub_10002880C;
  uint64_t v2 = *(void *)(v0 + 112);
  return OpenAIAuthenticator.refreshBillingPlan()(v2);
}

uint64_t sub_10002880C()
{
  sub_10002B344();
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v1[10] + 8))(v1[11], v1[9]);
  if (v0) {
    int v3 = sub_100028B94;
  }
  else {
    int v3 = sub_100028950;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_100028950()
{
  uint64_t v1 = v0[16];
  (*(void (**)(void, void, void))(v0[13] + 16))(v0[8], v0[14], v0[12]);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v2 = sub_10002B400();
  *(_OWORD *)(v2 + 16) = xmmword_1000471C0;
  id v3 = sub_100028CF8();
  uint64_t v4 = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 32) = v3;
  uint64_t v5 = (void *)sub_100045410();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_10002A95C();
    uint64_t v6 = sub_10002B3D0();
    v7(v6);
    uint64_t v8 = (objc_class *)v0[3];
    sub_100004A2C(&qword_10005CC60);
    uint64_t v9 = (__n128 *)sub_10002B400();
    sub_10002B4CC(v9, (__n128)xmmword_1000471C0);
    sub_10002B494();
    v10.super.Class isa = v8;
    Class isa = sub_100045930(v10).super.isa;
    uint64_t v12 = sub_10002B3D0();
    v13(v12);
    v9[3].n128_u64[1] = v4;
    v9[2].n128_u64[0] = (unint64_t)isa;
    uint64_t v14 = (void *)sub_100045410();
    swift_bridgeObjectRelease();

    swift_errorRelease();
  }
  else
  {

    sub_10002A95C();
    uint64_t v15 = sub_10002B3D0();
    v16(v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10002B36C();
  return v17();
}

uint64_t sub_100028B94()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = (objc_class *)v0[3];
  sub_100004A2C(&qword_10005CC60);
  uint64_t v5 = (__n128 *)sub_10002B400();
  sub_10002B4CC(v5, (__n128)xmmword_1000471C0);
  sub_10002B494();
  v6.super.Class isa = v4;
  Class isa = sub_100045930(v6).super.isa;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5[3].n128_u64[1] = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  v5[2].n128_u64[0] = (unint64_t)isa;
  uint64_t v8 = (void *)sub_100045410();
  swift_bridgeObjectRelease();

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10002B36C();
  return v9();
}

id sub_100028CF8()
{
  sub_10002B418();
  uint64_t v1 = sub_1000451B0();
  sub_100009FF4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100017F10();
  uint64_t v7 = v6 - v5;
  id result = [self valueWithNewObjectInContext:v0];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v9 = result;
  sub_1000451C0();
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v7, v1);
  if (v10 == enum case for OpenAIAuthenticator.BillingPlan.Category.free(_:))
  {
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    id v11 = v0;
    id v10 = sub_100028250();
    if (v10)
    {
LABEL_7:
      sub_10002B31C();
      goto LABEL_10;
    }
    __break(1u);
  }
  int v12 = (int)v10;
  int v13 = enum case for OpenAIAuthenticator.BillingPlan.Category.paid(_:);
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  if (v12 == v13)
  {
    id v14 = v0;
    id result = sub_100028250();
    if (!result)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  id v15 = v0;
  id result = sub_100028250();
  if (result)
  {
    sub_10002B31C();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
LABEL_10:
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    sub_1000451D0();
    id v16 = v0;
    id result = sub_100028250();
    if (result)
    {
      sub_10002B474();
      sub_1000451A0();
      id v17 = v16;
      id result = sub_100028250();
      if (result)
      {
        sub_100045E10();
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

uint64_t sub_100028F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100045D10();
  if (sub_100005A24(a1, 1, v5) == 1)
  {
    sub_10002A908(a1, &qword_10005D298);
  }
  else
  {
    sub_100045D00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100045CF0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_100029100()
{
  return sub_100029118();
}

uint64_t sub_100029118()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

id sub_100029174(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v1 = type metadata accessor for SessionAuthenticatorCredentialsResponse(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100045230();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000452B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004A2C(&qword_10005D2B0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  id v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  id v17 = (char *)&v20 - v16;
  sub_100045270();
  sub_100045240();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10002A8A0((uint64_t)v17, (uint64_t)v15);
  if (sub_100005A24((uint64_t)v15, 1, v4) != 1) {
    goto LABEL_4;
  }
  sub_10002A908((uint64_t)v15, &qword_10005D2B0);
  id v18 = [self valueWithUndefinedInContext:v21];
  if (!v18)
  {
    __break(1u);
LABEL_4:
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v15, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v3, v7, v4);
    id v18 = sub_100029484();
    sub_10002A95C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10002A908((uint64_t)v17, &qword_10005D2B0);
  return v18;
}

id sub_100029484()
{
  uint64_t v1 = sub_10002B418();
  uint64_t v2 = type metadata accessor for SessionAuthenticatorBillingPlanResponse(v1);
  __chkstk_darwin(v2 - 8);
  sub_100017F10();
  id result = [self valueWithNewObjectInContext:v0];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = result;
  sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  uint64_t v12 = &type metadata for String;
  uint64_t v10 = sub_100045220();
  uint64_t v11 = v5;
  id v6 = v0;
  id result = sub_10002B458();
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  sub_10002B474();
  uint64_t v12 = &type metadata for String;
  uint64_t v10 = sub_100045210();
  uint64_t v11 = v7;
  id v8 = v6;
  id result = sub_10002B458();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  sub_100045E10();
  sub_1000451F0();
  sub_100028CF8();
  sub_10002A95C();
  sub_10002B31C();
  uint64_t v12 = (void *)sub_100045130();
  sub_100005CD0(&v10);
  sub_100045200();
  id v9 = v8;
  id result = sub_10002B458();
  if (result)
  {
    sub_100045E10();
    return v4;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1000296A0()
{
  sub_100005A4C(0, &qword_10005CB80);
  uint64_t v0 = (void *)sub_100045E40();
  uint64_t v1 = sub_100045E50();

  return v1;
}

uint64_t sub_100029718(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v1 = type metadata accessor for SessionAuthenticatorSignInResponse(0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000452B0();
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  __chkstk_darwin(v4);
  id v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100045290();
  uint64_t v23 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000450E0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100045DF0();
  if (v17)
  {
    sub_1000450C0();
    swift_bridgeObjectRelease();
    if (sub_100005A24((uint64_t)v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      sub_100045270();
      sub_100045260();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v22);
      uint64_t v19 = v23;
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v3, v9, v7);
      uint64_t v18 = (uint64_t)sub_100029AF0();
      sub_10002A95C();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v7);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      return v18;
    }
    sub_10002A908((uint64_t)v12, &qword_10005C838);
  }
  uint64_t v18 = sub_100045950();
  sub_100007D44();
  swift_allocError();
  sub_100045900();
  swift_willThrow();
  return v18;
}

id sub_100029AF0()
{
  sub_10002B418();
  uint64_t v1 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100017F10();
  uint64_t v7 = v6 - v5;
  id result = [self valueWithNewObjectInContext:v0];
  if (result)
  {
    id v9 = result;
    sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    sub_100045280();
    uint64_t v10 = sub_100045040();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v7, v1);
    v14[3] = &type metadata for String;
    v14[0] = v10;
    v14[1] = v12;
    id v13 = v0;
    id result = sub_100025D08(v14, v0);
    if (result)
    {
      sub_100045E10();
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

uint64_t sub_100029CA0()
{
  return sub_100029118();
}

uint64_t sub_100029CB8(void *a1)
{
  return sub_100029CE4(a1);
}

uint64_t sub_100029CE4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100045B80();
  sub_100009FF4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100017F10();
  uint64_t v10 = v9 - v8;
  id v11 = a1;
  sub_100045B60();
  if (!v1)
  {
    uint64_t v2 = sub_100045B70();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v4);
  }
  return v2;
}

uint64_t sub_100029DB4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a3;
  Swift::String v25 = a1;
  uint64_t v4 = sub_100045420();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_100004A2C(&qword_10005D298);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100045D10();
  sub_100005994((uint64_t)v13, 1, 1, v14);
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
  sub_100028F74((uint64_t)v13, (uint64_t)&unk_10005D2A8, v19);
  return swift_release();
}

uint64_t sub_100029FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  _OWORD v6[2] = a4;
  uint64_t v7 = sub_100045950();
  v6[5] = v7;
  v6[6] = *(void *)(v7 - 8);
  v6[7] = swift_task_alloc();
  uint64_t v8 = sub_1000452B0();
  v6[8] = v8;
  v6[9] = *(void *)(v8 - 8);
  v6[10] = swift_task_alloc();
  return _swift_task_switch(sub_10002A100, 0, 0);
}

uint64_t sub_10002A100()
{
  sub_100045270();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_10002A19C;
  return OpenAIAuthenticator.signOut()();
}

uint64_t sub_10002A19C()
{
  sub_10002B344();
  *(void *)(v2 + 96) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v1[9] + 8))(v1[10], v1[8]);
  if (v0) {
    uint64_t v3 = sub_10002A460;
  }
  else {
    uint64_t v3 = sub_10002A2E0;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002A2E0()
{
  uint64_t v1 = v0[12];
  sub_100004A2C(&qword_10005CC60);
  uint64_t v2 = sub_10002B400();
  *(_OWORD *)(v2 + 16) = xmmword_1000471C0;
  *(void *)(v2 + 56) = &type metadata for Bool;
  *(unsigned char *)(v2 + 32) = 1;
  uint64_t v3 = (void *)sub_100045410();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = (objc_class *)v0[4];
    uint64_t v4 = v0[5];
    sub_100004A2C(&qword_10005CC60);
    uint64_t v6 = (__n128 *)sub_10002B400();
    sub_10002B4CC(v6, (__n128)xmmword_1000471C0);
    sub_10002B494();
    v7.super.Class isa = v5;
    sub_100045930(v7);
    uint64_t v8 = sub_10002B3E4();
    v9(v8);
    uint64_t v10 = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
    uint64_t v11 = (void *)sub_10002B434(v10);
    swift_bridgeObjectRelease();
    if (v4)
    {
      swift_errorRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10002B35C();
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
  sub_10002B36C();
LABEL_7:
  return v12();
}

uint64_t sub_10002A460()
{
  uint64_t v2 = *(objc_class **)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  sub_100004A2C(&qword_10005CC60);
  uint64_t v3 = (__n128 *)sub_10002B400();
  sub_10002B4CC(v3, (__n128)xmmword_1000471C0);
  sub_10002B494();
  v4.super.Class isa = v2;
  sub_100045930(v4);
  uint64_t v5 = sub_10002B3E4();
  v6(v5);
  uint64_t v7 = sub_100005A4C(0, (unint64_t *)&qword_10005C510);
  uint64_t v8 = (void *)sub_10002B434(v7);
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10002B35C();
  }
  else
  {

    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10002B36C();
  }
  return v9();
}

id sub_10002A5C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSSessionAuthenticatorObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10002A620()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSSessionAuthenticatorObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSSessionAuthenticatorObject()
{
  return self;
}

uint64_t sub_10002A678()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = v5 | 7;
  unint64_t v7 = (*(void *)(v4 + 64) + ((*(void *)(v4 + 64) + v5 + ((v5 + 32) & ~v5)) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  uint64_t v8 = *(void (**)(void))(v2 + 8);
  sub_10002B390();
  v8();
  sub_10002B390();
  v8();

  return _swift_deallocObject(v0, v7 + 8, v6);
}

uint64_t sub_10002A748()
{
  uint64_t v1 = sub_100045420();
  sub_1000078C0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  void *v2 = v0;
  v2[1] = sub_10002B304;
  uint64_t v3 = sub_10002B3A0();
  return sub_100029FE0(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10002A844(uint64_t a1)
{
  return sub_100029718(a1);
}

uint64_t type metadata accessor for SessionAuthenticatorSignInResponse(uint64_t a1)
{
  return sub_1000233E4(a1, qword_10005D440);
}

uint64_t type metadata accessor for SessionAuthenticatorCredentialsResponse(uint64_t a1)
{
  return sub_1000233E4(a1, qword_10005D3B0);
}

uint64_t sub_10002A8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005D2B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A908(uint64_t a1, uint64_t *a2)
{
  sub_100004A2C(a2);
  sub_10001CE80();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10002A95C()
{
  uint64_t v1 = sub_10002B418();
  v2(v1);
  sub_10001CE80();
  (*(void (**)(uint64_t))(v3 + 8))(v0);
  return v0;
}

uint64_t type metadata accessor for SessionAuthenticatorBillingPlanResponse(uint64_t a1)
{
  return sub_1000233E4(a1, qword_10005D320);
}

uint64_t sub_10002A9D0()
{
  sub_100045420();
  sub_100009FF4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  unint64_t v8 = (v6 + ((v5 + 32) & ~v5) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = ((v5 + v8 + 8) & ~v5) + v6;
  swift_unknownObjectRelease();
  uint64_t v10 = *(void (**)(void))(v2 + 8);
  sub_10002B390();
  v10();

  sub_10002B390();
  v10();

  return _swift_deallocObject(v0, v9, v7);
}

uint64_t sub_10002AAA0()
{
  uint64_t v1 = sub_100045420();
  sub_1000078C0(v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v2;
  void *v2 = v0;
  v2[1] = sub_10002AB9C;
  uint64_t v3 = sub_10002B3A0();
  return sub_1000285C0(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10002AB9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002AC90()
{
  return sub_10002AF48();
}

uint64_t sub_10002ACA8()
{
  return sub_10002AFBC();
}

uint64_t sub_10002ACC0()
{
  return sub_10002B030();
}

uint64_t sub_10002ACD8()
{
  return sub_10002B094();
}

uint64_t sub_10002ACF0()
{
  return sub_10002B0F8();
}

uint64_t sub_10002AD08()
{
  return sub_10002B15C();
}

uint64_t sub_10002AD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002AD34);
}

uint64_t sub_10002AD34()
{
  sub_1000451E0();
  uint64_t v0 = sub_10002B424();

  return sub_100005A24(v0, v1, v2);
}

uint64_t sub_10002AD74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002AD88);
}

uint64_t sub_10002AD88()
{
  sub_1000451E0();
  uint64_t v0 = sub_10002B37C();

  return sub_100005994(v0, v1, v2, v3);
}

uint64_t sub_10002ADC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002B268(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.BillingPlan);
}

uint64_t sub_10002ADE0()
{
  return sub_10002AF48();
}

uint64_t sub_10002ADF8()
{
  return sub_10002AFBC();
}

uint64_t sub_10002AE10()
{
  return sub_10002B030();
}

uint64_t sub_10002AE28()
{
  return sub_10002B094();
}

uint64_t sub_10002AE40()
{
  return sub_10002B0F8();
}

uint64_t sub_10002AE58()
{
  return sub_10002B15C();
}

uint64_t sub_10002AE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002AE84);
}

uint64_t sub_10002AE84()
{
  sub_100045230();
  uint64_t v0 = sub_10002B424();

  return sub_100005A24(v0, v1, v2);
}

uint64_t sub_10002AEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002AED8);
}

uint64_t sub_10002AED8()
{
  sub_100045230();
  uint64_t v0 = sub_10002B37C();

  return sub_100005994(v0, v1, v2, v3);
}

uint64_t sub_10002AF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002B268(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.Credentials);
}

uint64_t sub_10002AF30()
{
  return sub_10002AF48();
}

uint64_t sub_10002AF48()
{
  uint64_t v2 = sub_10002B308();
  v3(v2);
  sub_10001CE80();
  uint64_t v6 = *v5;

  return v6(v1, v0, v4);
}

uint64_t sub_10002AFA4()
{
  return sub_10002AFBC();
}

uint64_t sub_10002AFBC()
{
  uint64_t v1 = sub_10002B418();
  v2(v1);
  sub_10001CE80();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);

  return v5(v0, v3);
}

uint64_t sub_10002B018()
{
  return sub_10002B030();
}

uint64_t sub_10002B030()
{
  uint64_t v1 = sub_10002B308();
  v2(v1);
  sub_10001CE80();
  uint64_t v3 = sub_10002B3C0();
  v4(v3);
  return v0;
}

uint64_t sub_10002B07C()
{
  return sub_10002B094();
}

uint64_t sub_10002B094()
{
  uint64_t v1 = sub_10002B308();
  v2(v1);
  sub_10001CE80();
  uint64_t v3 = sub_10002B3C0();
  v4(v3);
  return v0;
}

uint64_t sub_10002B0E0()
{
  return sub_10002B0F8();
}

uint64_t sub_10002B0F8()
{
  uint64_t v1 = sub_10002B308();
  v2(v1);
  sub_10001CE80();
  uint64_t v3 = sub_10002B3C0();
  v4(v3);
  return v0;
}

uint64_t sub_10002B144()
{
  return sub_10002B15C();
}

uint64_t sub_10002B15C()
{
  uint64_t v1 = sub_10002B308();
  v2(v1);
  sub_10001CE80();
  uint64_t v3 = sub_10002B3C0();
  v4(v3);
  return v0;
}

uint64_t sub_10002B1A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002B1BC);
}

uint64_t sub_10002B1BC()
{
  sub_100045290();
  uint64_t v0 = sub_10002B424();

  return sub_100005A24(v0, v1, v2);
}

uint64_t sub_10002B1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002B210);
}

uint64_t sub_10002B210()
{
  sub_100045290();
  uint64_t v0 = sub_10002B37C();

  return sub_100005994(v0, v1, v2, v3);
}

uint64_t sub_10002B250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002B268(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for OpenAIAuthenticator.Session);
}

uint64_t sub_10002B268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10002B308()
{
  return 0;
}

uint64_t sub_10002B31C()
{
  return sub_100045E10();
}

uint64_t sub_10002B35C()
{
  return v0 + 8;
}

uint64_t sub_10002B36C()
{
  return v0 + 8;
}

uint64_t sub_10002B37C()
{
  return v0;
}

uint64_t sub_10002B3A0()
{
  return v0;
}

uint64_t sub_10002B3C0()
{
  return v0;
}

uint64_t sub_10002B3D0()
{
  return v0;
}

uint64_t sub_10002B3E4()
{
  return v0;
}

uint64_t sub_10002B400()
{
  return swift_allocObject();
}

uint64_t sub_10002B418()
{
  return 0;
}

uint64_t sub_10002B424()
{
  return v0;
}

uint64_t sub_10002B434(uint64_t a1)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_100045410();
}

id sub_10002B458()
{
  return sub_100025D08((void *)(v1 - 96), v0);
}

uint64_t sub_10002B474()
{
  return sub_100045E10();
}

uint64_t sub_10002B494()
{
  return sub_10001A1C8(v0);
}

uint64_t sub_10002B4AC()
{
  return swift_errorRelease();
}

uint64_t sub_10002B4CC(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return swift_errorRetain();
}

uint64_t *sub_10002B4E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v8 = sub_1000450E0();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_10002B5B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1000450E0();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *sub_10002B618(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1000450E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002B694(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1000450E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002B710(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1000450E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_10002B78C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_1000450E0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_10002B808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002B81C);
}

uint64_t sub_10002B81C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000450E0();
    uint64_t v9 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return sub_100005A24(v9, a2, v8);
  }
}

uint64_t sub_10002B89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002B8B0);
}

unsigned char *sub_10002B8B0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 250)
  {
    *uint64_t result = a2 + 5;
  }
  else
  {
    uint64_t v7 = sub_1000450E0();
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)sub_100005994(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for JSSourceFile()
{
  uint64_t result = qword_10005D4D0;
  if (!qword_10005D4D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002B974()
{
  uint64_t result = sub_1000450E0();
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
        JUMPOUT(0x10002BB60);
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

unint64_t sub_10002BB9C()
{
  unint64_t result = qword_10005D508;
  if (!qword_10005D508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D508);
  }
  return result;
}

Swift::Int sub_10002BBE8(char a1)
{
  int v1 = a1 & 1;
  sub_100046180();
  sub_100046190((v1 + 1));
  return sub_1000461A0();
}

void sub_10002BC30(uint64_t a1, char a2)
{
}

Swift::Int sub_10002BC5C(uint64_t a1, char a2)
{
  int v2 = a2 & 1;
  sub_100046180();
  sub_100046190((v2 + 1));
  return sub_1000461A0();
}

uint64_t sub_10002BCA0(uint64_t a1)
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

uint64_t sub_10002BCB8(char a1)
{
  return (a1 & 1u) + 1;
}

BOOL sub_10002BCC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10002EDF4(*a1, *a2);
}

Swift::Int sub_10002BCD0()
{
  return sub_10002BBE8(*v0);
}

void sub_10002BCD8(uint64_t a1)
{
  sub_10002BC30(a1, *v1);
}

Swift::Int sub_10002BCE0(uint64_t a1)
{
  return sub_10002BC5C(a1, *v1);
}

uint64_t sub_10002BCE8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10002BCA0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10002BD14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002BCB8(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_10002BD40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v2 - 8);
  sub_10002DED8();
  uint64_t v5 = v3 - v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_10002DED8();
  uint64_t v15 = v13 - v14;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = (int *)type metadata accessor for JSSourceInfo();
  sub_10001CE80();
  __chkstk_darwin(v20);
  id v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = 25705;
  unint64_t v48 = 0xE200000000000000;
  sub_10002DF08();
  sub_10002DE9C();
  sub_1000089FC((uint64_t)v49);
  if (!v51) {
    goto LABEL_10;
  }
  uint64_t v46 = v11;
  if ((sub_10002DE7C() & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  unint64_t v23 = v48;
  uint64_t v44 = v47;
  uint64_t v47 = 0x736E726574746170;
  unint64_t v48 = 0xE800000000000000;
  sub_10002DF08();
  sub_10002DE9C();
  sub_1000089FC((uint64_t)v49);
  if (v51)
  {
    unint64_t v45 = v23;
    sub_100004A2C(&qword_10005D530);
    if ((sub_10002DE7C() & 1) == 0)
    {
LABEL_12:
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    uint64_t v43 = v47;
    v50[0] = 0xD000000000000012;
    v50[1] = 0x800000010004AA00;
    sub_100045F40();
    sub_10002DE9C();
    sub_1000089FC((uint64_t)v49);
    if (v51)
    {
      if (sub_10002DE7C()) {
        double v24 = *(double *)&v47;
      }
      else {
        double v24 = 86400.0;
      }
    }
    else
    {
      sub_10002A908((uint64_t)v50, (uint64_t *)&unk_10005CC40);
      double v24 = 86400.0;
    }
    uint64_t v47 = 7107189;
    unint64_t v48 = 0xE300000000000000;
    sub_10002DF08();
    sub_10002DE9C();
    sub_1000089FC((uint64_t)v49);
    if (v51)
    {
      if ((sub_10002DE7C() & 1) == 0) {
        goto LABEL_23;
      }
      sub_1000450C0();
      swift_bridgeObjectRelease();
      if (sub_100005A24((uint64_t)v8, 1, v9) != 1)
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
        sub_10002DEE8();
        sub_100005994(v35, v36, v37, v9);
        *(void *)&v22[v19[7]] = v43;
        uint64_t v38 = (uint64_t)v33;
        uint64_t v39 = 0;
        goto LABEL_31;
      }
      uint64_t v29 = &qword_10005C838;
      uint64_t v30 = v8;
    }
    else
    {
      uint64_t v29 = (uint64_t *)&unk_10005CC40;
      uint64_t v30 = v50;
    }
    sub_10002A908((uint64_t)v30, v29);
LABEL_23:
    unint64_t v31 = v45;
    uint64_t v47 = 0x556B63617074656ALL;
    unint64_t v48 = 0xEA00000000004C52;
    sub_10002DF08();
    sub_10002DE9C();
    swift_bridgeObjectRelease();
    sub_1000089FC((uint64_t)v49);
    if (v51)
    {
      if (sub_10002DE7C())
      {
        sub_1000450C0();
        swift_bridgeObjectRelease();
        if (sub_100005A24(v5, 1, v9) == 1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          Swift::String v25 = &qword_10005C838;
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
        sub_100005994(v41, 0, 1, v9);
        *(void *)&v22[v19[7]] = v43;
        uint64_t v38 = (uint64_t)&v22[v19[8]];
        uint64_t v39 = 1;
LABEL_31:
        sub_100005994(v38, v39, 1, v9);
        sub_10002CE90((uint64_t)v22, a1);
        uint64_t v27 = 0;
        return sub_100005994(a1, v27, 1, (uint64_t)v19);
      }
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  Swift::String v25 = (uint64_t *)&unk_10005CC40;
  uint64_t v26 = v50;
LABEL_11:
  sub_10002A908((uint64_t)v26, v25);
LABEL_14:
  uint64_t v27 = 1;
  return sub_100005994(a1, v27, 1, (uint64_t)v19);
}

uint64_t sub_10002C2D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v113 = a1;
  uint64_t v1 = sub_100004A2C(&qword_10005D510);
  __chkstk_darwin(v1 - 8);
  sub_10000CB30();
  uint64_t v103 = v2;
  sub_100045130();
  sub_100009FF4();
  uint64_t v101 = v4;
  uint64_t v102 = v3;
  __chkstk_darwin(v3);
  sub_10000CB30();
  uint64_t v100 = v5;
  sub_100045020();
  sub_100009FF4();
  uint64_t v107 = v7;
  uint64_t v108 = v6;
  __chkstk_darwin(v6);
  sub_10000CB30();
  uint64_t v106 = v8;
  uint64_t v9 = type metadata accessor for JSSourceInfo();
  sub_10001CE80();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v13 - 8);
  sub_10002DED8();
  uint64_t v16 = v14 - v15;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)v98 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  unint64_t v23 = (char *)v98 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)v98 - v25;
  __chkstk_darwin(v24);
  Swift::String v28 = (char *)v98 - v27;
  uint64_t v29 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v31 = v30;
  __chkstk_darwin(v32);
  sub_10002DED8();
  uint64_t v105 = v33 - v34;
  sub_10002DF20();
  __chkstk_darwin(v35);
  long long v104 = (char *)v98 - v36;
  sub_10002DF20();
  __chkstk_darwin(v37);
  Swift::String v109 = (char *)v98 - v38;
  sub_10002DF20();
  __chkstk_darwin(v39);
  Swift::String v110 = (char *)v98 - v40;
  sub_10002DF20();
  __chkstk_darwin(v41);
  Swift::String v111 = (char *)v98 - v42;
  id v43 = objc_msgSend(self, "ams_cachesDirectory");
  if (v43)
  {
    uint64_t v44 = v43;
    sub_1000450A0();

    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = 1;
  }
  sub_100005994((uint64_t)v23, v45, 1, v29);
  sub_100025EC0((uint64_t)v23, (uint64_t)v26);
  sub_10002DEB8((uint64_t)v26);
  if (v51)
  {
    sub_10002A908((uint64_t)v26, &qword_10005C838);
    sub_10002DEE8();
    sub_100005994(v46, v47, v48, v29);
LABEL_9:
    uint64_t v52 = &qword_10005C838;
    uint64_t v53 = (uint64_t)v28;
LABEL_10:
    sub_10002A908(v53, v52);
    goto LABEL_11;
  }
  sub_100045070();
  uint64_t v49 = v31;
  unint64_t v50 = *(void (**)(void))(v31 + 8);
  sub_10002DE60();
  v50();
  sub_100005994((uint64_t)v28, 0, 1, v29);
  sub_10002DEB8((uint64_t)v28);
  if (v51) {
    goto LABEL_9;
  }
  id v99 = v50;
  uint64_t v59 = v28;
  uint64_t v60 = *(void (**)(void))(v49 + 32);
  ((void (*)(char *, char *, uint64_t))v60)(v111, v59, v29);
  uint64_t v61 = (uint64_t)v112;
  sub_100017BA8((uint64_t)v112 + *(int *)(v9 + 24), v16);
  sub_10002CCE8(v61, (uint64_t)v12);
  sub_10002DEB8(v16);
  v98[1] = v49 + 32;
  if (v62)
  {
    sub_100017BA8((uint64_t)&v12[*(int *)(v9 + 32)], (uint64_t)v20);
    sub_10002CD4C((uint64_t)v12);
    sub_10002A908(v16, &qword_10005C838);
  }
  else
  {
    sub_10002CD4C((uint64_t)v12);
    ((void (*)(char *, uint64_t, uint64_t))v60)(v20, v16, v29);
    sub_100005994((uint64_t)v20, 0, 1, v29);
  }
  sub_10002DEB8((uint64_t)v20);
  if (v51)
  {
    sub_10002DE70();
    v63();
    uint64_t v52 = &qword_10005C838;
    uint64_t v53 = (uint64_t)v20;
    goto LABEL_10;
  }
  sub_10002DEF4();
  *(void *)(v64 - 256) = v60;
  v60();
  sub_100045070();
  sub_100045030();
  sub_100045080();
  swift_bridgeObjectRelease();
  Swift::String v65 = v99;
  sub_10002DE70();
  v65();
  strcpy((char *)&v114, "metadata.plist");
  HIBYTE(v114) = -18;
  uint64_t v67 = v106;
  uint64_t v66 = v107;
  uint64_t v68 = v108;
  (*(void (**)(uint64_t, void, uint64_t))(v107 + 104))(v106, enum case for URL.DirectoryHint.inferFromPath(_:), v108);
  sub_10002CDA8();
  sub_1000450D0();
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v67, v68);
  swift_bridgeObjectRelease();
  uint64_t v69 = sub_1000450F0();
  unint64_t v71 = v70;
  sub_100044FF0();
  swift_allocObject();
  sub_100044FE0();
  sub_10002CE44();
  sub_100044FD0();
  sub_10002DE70();
  v65();
  swift_release();
  sub_10002758C(v69, v71);
  BOOL v97 = (void)v114 == 2;
  id v72 = [self defaultManager];
  sub_1000450B0();
  NSString v73 = sub_100045C00();
  swift_bridgeObjectRelease();
  *(void *)&long long v114 = 0;
  id v74 = [v72 attributesOfItemAtPath:v73 error:&v114];

  id v75 = (void *)v114;
  if (!v74)
  {
    id v92 = (id)v114;
    sub_100045010();

    swift_willThrow();
    swift_errorRelease();
    sub_10002DE60();
    v65();
    sub_10002DE60();
    v65();
    sub_10002DE60();
    v65();
    goto LABEL_11;
  }
  type metadata accessor for FileAttributeKey(0);
  sub_10002CDF4();
  uint64_t v76 = sub_100045BD0();
  id v77 = v75;

  id v78 = NSFileModificationDate;
  sub_10002EC8C((uint64_t)v78, v76, &v114);

  swift_bridgeObjectRelease();
  if (!v115)
  {
    sub_10002A908((uint64_t)&v114, (uint64_t *)&unk_10005CC40);
    uint64_t v79 = v103;
    sub_10002DEE8();
    sub_100005994(v93, v94, v95, v96);
    goto LABEL_26;
  }
  uint64_t v79 = v103;
  uint64_t v80 = v102;
  int v81 = swift_dynamicCast();
  sub_100005994(v79, v81 ^ 1u, 1, v80);
  if (sub_100005A24(v79, 1, v80) == 1)
  {
LABEL_26:
    sub_10002DE60();
    v65();
    sub_10002DE60();
    v65();
    sub_10002DE60();
    v65();
    uint64_t v52 = &qword_10005D510;
    uint64_t v53 = v79;
    goto LABEL_10;
  }
  uint64_t v82 = v101;
  uint64_t v83 = v100;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v100, v79, v80);
  sub_100045120();
  double v85 = v84;
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v83, v80);
  sub_10002DE70();
  v86();
  id v87 = v99;
  sub_10002DE60();
  v87();
  if (*v112 > -v85)
  {
    uint64_t v88 = sub_100004A2C(&qword_10005D518);
    uint64_t v89 = *(int *)(v88 + 48);
    uint64_t v90 = v113;
    sub_10002DEF4();
    (*(void (**)(void))(v91 - 256))();
    *(unsigned char *)(v90 + v89) = v97;
    uint64_t v54 = v90;
    uint64_t v55 = 0;
    uint64_t v56 = 1;
    uint64_t v57 = v88;
    return sub_100005994(v54, v55, v56, v57);
  }
  sub_10002DE60();
  v87();
LABEL_11:
  sub_100004A2C(&qword_10005D518);
  sub_10002DEE8();
  return sub_100005994(v54, v55, v56, v57);
}

uint64_t type metadata accessor for JSSourceInfo()
{
  uint64_t result = qword_10005D590;
  if (!qword_10005D590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002CCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002CD4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002CDA8()
{
  unint64_t result = qword_10005D520;
  if (!qword_10005D520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D520);
  }
  return result;
}

unint64_t sub_10002CDF4()
{
  unint64_t result = qword_10005C4C0;
  if (!qword_10005C4C0)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005C4C0);
  }
  return result;
}

unint64_t sub_10002CE44()
{
  unint64_t result = qword_10005D528;
  if (!qword_10005D528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D528);
  }
  return result;
}

uint64_t sub_10002CE90(uint64_t a1, uint64_t a2)
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
        JUMPOUT(0x10002D048);
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

unsigned char *sub_10002D070(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JetpackKind()
{
  return &type metadata for JetpackKind;
}

uint64_t *sub_10002D08C(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v10 = sub_1000450E0();
    swift_bridgeObjectRetain();
    if (sub_100005A24((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_100004A2C(&qword_10005C838);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      sub_100005994((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    if (sub_100005A24((uint64_t)v15, 1, v10))
    {
      uint64_t v16 = sub_100004A2C(&qword_10005C838);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v14, v15, v10);
      sub_100005994((uint64_t)v14, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t sub_10002D280(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_1000450E0();
  if (!sub_100005A24(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 32);
  uint64_t result = sub_100005A24(v6, 1, v5);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v8(v6, v5);
  }
  return result;
}

uint64_t sub_10002D380(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000450E0();
  swift_bridgeObjectRetain();
  if (sub_100005A24((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_100004A2C(&qword_10005C838);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    sub_100005994((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  swift_bridgeObjectRetain();
  if (sub_100005A24((uint64_t)v13, 1, v9))
  {
    uint64_t v14 = sub_100004A2C(&qword_10005C838);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v12, v13, v9);
    sub_100005994((uint64_t)v12, 0, 1, v9);
  }
  return a1;
}

void *sub_10002D524(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1000450E0();
  int v10 = sub_100005A24((uint64_t)v7, 1, v9);
  int v11 = sub_100005A24((uint64_t)v8, 1, v9);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      sub_100005994((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = sub_100004A2C(&qword_10005C838);
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
  int v17 = sub_100005A24((uint64_t)a1 + v14, 1, v9);
  int v18 = sub_100005A24((uint64_t)v16, 1, v9);
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
    uint64_t v20 = sub_100004A2C(&qword_10005C838);
    memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v15, v16, v9);
  sub_100005994((uint64_t)v15, 0, 1, v9);
  return a1;
}

uint64_t sub_10002D7E8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_1000450E0();
  if (sub_100005A24((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_100004A2C(&qword_10005C838);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    sub_100005994((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  if (sub_100005A24((uint64_t)v13, 1, v9))
  {
    uint64_t v14 = sub_100004A2C(&qword_10005C838);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v12, v13, v9);
    sub_100005994((uint64_t)v12, 0, 1, v9);
  }
  return a1;
}

void *sub_10002D978(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1000450E0();
  int v11 = sub_100005A24((uint64_t)v8, 1, v10);
  int v12 = sub_100005A24((uint64_t)v9, 1, v10);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      sub_100005994((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = sub_100004A2C(&qword_10005C838);
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
  int v18 = sub_100005A24((uint64_t)a1 + v15, 1, v10);
  int v19 = sub_100005A24((uint64_t)v17, 1, v10);
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
    uint64_t v21 = sub_100004A2C(&qword_10005C838);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v16, v17, v10);
  sub_100005994((uint64_t)v16, 0, 1, v10);
  return a1;
}

uint64_t sub_10002DC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002DC38);
}

uint64_t sub_10002DC38(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100004A2C(&qword_10005C838);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return sub_100005A24(v9, a2, v8);
  }
}

uint64_t sub_10002DCC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002DCD8);
}

uint64_t sub_10002DCD8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100004A2C(&qword_10005C838);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_100005994(v8, a2, a2, v7);
  }
  return result;
}

void sub_10002DD5C()
{
  sub_100027FEC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_10002DE14()
{
  unint64_t result = qword_10005D5D8;
  if (!qword_10005D5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D5D8);
  }
  return result;
}

uint64_t sub_10002DE7C()
{
  return swift_dynamicCast();
}

double sub_10002DE9C()
{
  return sub_10002EC28(v1 - 168, v0, (_OWORD *)(v1 - 128));
}

uint64_t sub_10002DEB8(uint64_t a1)
{
  return sub_100005A24(a1, 1, v1);
}

uint64_t sub_10002DF08()
{
  return sub_100045F40();
}

uint64_t sub_10002DF2C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v34 = a2;
  v32[1] = a1;
  uint64_t v5 = sub_1000458B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v33 = v7;
  uint64_t v35 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[0] = type metadata accessor for JSSourceUrlParser();
  __chkstk_darwin(v32[0]);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v11 = sub_100045550();
  sub_1000078C0(v11);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v39 = type metadata accessor for JSSourceLoader();
  v38[0] = v4;
  swift_retain();
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100045C30();
    uint64_t v16 = v15;

    sub_1000454F0();
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_1000454E0(v43);
    sub_100005548(v38, v39);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v41[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v41);
    v44._countAndFlagsBits = 5972026;
    v44._object = (void *)0xE300000000000000;
    sub_1000454E0(v44);
    uint64_t MetatypeMetadata = &type metadata for String;
    v41[0] = v14;
    v41[1] = v16;
    sub_1000454D0();
    sub_100007820((uint64_t)v41);
    v18._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    sub_1000454E0(v45);
    sub_100005548(v38, v39);
    uint64_t v19 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v41[0] = v19;
    sub_1000454D0();
    sub_100007820((uint64_t)v41);
    v18._countAndFlagsBits = 58;
  }
  v18._object = (void *)0xE100000000000000;
  sub_1000454E0(v18);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v38);
  sub_1000454B0();
  uint64_t v20 = sub_1000450E0();
  uint64_t v39 = v20;
  sub_100005CD0(v38);
  uint64_t v21 = *(void (**)(void))(*(void *)(v20 - 8) + 16);
  sub_10002E79C();
  v21();
  sub_100045520();
  sub_100007820((uint64_t)v38);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_10002E79C();
  v21();
  uint64_t v22 = *(void (**)(void))(v6 + 16);
  sub_10002E7B0();
  v22();
  sub_100031528();
  sub_10002E5AC((uint64_t)v9);
  unint64_t v23 = v35;
  sub_10002E7B0();
  v22();
  unint64_t v24 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v25 = (v33 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v26 + v24, v23, v5);
  Swift::String v28 = v36;
  uint64_t v27 = v37;
  *(void *)(v26 + v25) = v36;
  *(void *)(v26 + ((v25 + 15) & 0xFFFFFFFFFFFFFFF8)) = v27;
  uint64_t v39 = sub_1000457A0();
  uint64_t v40 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v38);
  id v29 = v28;
  swift_retain();
  sub_100045790();
  sub_100004A2C(&qword_10005C940);
  sub_10002E748();
  uint64_t v30 = sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v38);
  return v30;
}

uint64_t sub_10002E410(unsigned char *a1, void *a2, void *a3, void (*a4)(void))
{
  switch(*a1)
  {
    case 1:
    case 4:
      uint64_t v8 = type metadata accessor for JetpackLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100055AF0;
      break;
    case 2:
    case 5:
      uint64_t v8 = type metadata accessor for JetpackV2Loader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100055CC0;
      break;
    case 3:
      uint64_t v8 = type metadata accessor for RemoteJavaScriptLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100056CD8;
      break;
    default:
      uint64_t v8 = type metadata accessor for LocalJavascriptLoader();
      uint64_t v9 = swift_allocObject();
      uint64_t v10 = &off_100056970;
      break;
  }
  v14[3] = v8;
  void v14[4] = v10;
  v14[0] = v9;
  sub_100005548(v14, v8);
  uint64_t v11 = type metadata accessor for JSSourceFile();
  uint64_t v12 = ((uint64_t (*)(uint64_t, void *, void *, void (*)(void)))v10[1])((uint64_t)&a1[*(int *)(v11 + 20)], a2, a3, a4);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v14);
  return v12;
}

uint64_t type metadata accessor for JSSourceLoader()
{
  return self;
}

uint64_t sub_10002E5AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceUrlParser();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002E608()
{
  uint64_t v1 = sub_1000458B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release();

  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_10002E6C4(unsigned char *a1)
{
  uint64_t v3 = sub_1000458B0();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void **)(v1 + v9);
  uint64_t v11 = *(void (**)(void))(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));

  return sub_10002E410(a1, (void *)(v1 + v8), v10, v11);
}

unint64_t sub_10002E748()
{
  unint64_t result = qword_10005D680;
  if (!qword_10005D680)
  {
    sub_10000C4A8(&qword_10005C940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D680);
  }
  return result;
}

id sub_10002E7C4(uint64_t a1, uint64_t a2)
{
  id v3 = [objc_allocWithZone((Class)AMSURLRequestEncoder) initWithBag:sub_100045870()];
  swift_unknownObjectRelease();
  [v3 setClientInfo:a2];
  if (deviceIsRunningInternalBuild()) {
    [v3 setUrlKnownToBeTrusted:1];
  }
  return v3;
}

id sub_10002E854(uint64_t a1, uint64_t a2)
{
  id v3 = [self sharedURLCache];
  [v3 setMemoryCapacity:0];

  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", a2, sub_100045870());
  swift_unknownObjectRelease();
  sub_10002E918();
  return sub_10002E958(v5, 0, 0);
}

unint64_t sub_10002E918()
{
  unint64_t result = qword_10005C640;
  if (!qword_10005C640)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C640);
  }
  return result;
}

id sub_10002E958(void *a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithConfiguration:a1 delegate:a2 delegateQueue:a3];

  swift_unknownObjectRelease();
  return v5;
}

uint64_t destroy for JSSourcePackage(uint64_t a1)
{
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);

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
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
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

uint64_t sub_10002EB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_100008474(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_10002EBE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  unint64_t v4 = sub_100008474(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(void **)(*(void *)(a3 + 56) + 8 * v4);
  id v7 = v6;
  return v6;
}

double sub_10002EC28@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100008430(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1000049D0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

double sub_10002EC8C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_1000084EC(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_1000049D0(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_10002ECF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_100008474(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = sub_1000450E0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * v8, v10);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v13 = sub_1000450E0();
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }

  return sub_100005994(v11, v12, 1, v13);
}

NSString sub_10002EDB4()
{
  NSString result = sub_100045C00();
  qword_10005D688 = (uint64_t)result;
  return result;
}

BOOL sub_10002EDF4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10002EE04(uint64_t a1, char a2)
{
}

Swift::Int sub_10002EE2C(char a1)
{
  return sub_1000461A0();
}

Swift::Int sub_10002EE74()
{
  return sub_10002EE2C(*v0);
}

void sub_10002EE7C(uint64_t a1)
{
  sub_10002EE04(a1, *v1);
}

uint64_t sub_10002EE84()
{
  uint64_t v1 = v0;
  uint64_t v27 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v6);
  char v7 = (char *)&v28[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004A2C(&qword_10005D790);
  sub_100009FF4();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v28[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000458B0();
  sub_100009FF4();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v28[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_bag, v14);
  if (qword_10005C410 != -1) {
    swift_once();
  }
  sub_1000458A0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v14);
  sub_100045890();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  uint64_t v20 = sub_1000457A0();
  uint64_t v29 = v20;
  uint64_t v30 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v28);
  swift_retain();
  sub_100045790();
  sub_100004A2C(&qword_10005D798);
  sub_1000310E8(&qword_10005D7A0, &qword_10005D798);
  sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  uint64_t v21 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v28[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_url, v27);
  unint64_t v22 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v23 = (v5 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v24 + v22, v7, v21);
  *(void *)(v24 + v23) = v1;
  uint64_t v29 = v20;
  uint64_t v30 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v28);
  swift_retain();
  sub_100045790();
  sub_100004A2C(&qword_10005D7A8);
  sub_1000310E8(&qword_10005D7B0, &qword_10005D7A8);
  uint64_t v25 = sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  return v25;
}

uint64_t sub_10002F210(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005D7C0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for JSSourceInfo();
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = sub_100045500();
  __chkstk_darwin(v13 - 8);
  if (*a1 && (uint64_t v14 = sub_1000042F4(*a1)) != 0)
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
        sub_10002BD40((uint64_t)v6);
        if (sub_100005A24((uint64_t)v6, 1, v7) == 1)
        {
          sub_100031260((uint64_t)v6, &qword_10005D7C0);
        }
        else
        {
          sub_10002CE90((uint64_t)v6, (uint64_t)v12);
          sub_10002CE90((uint64_t)v12, (uint64_t)v10);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v17 = (void *)sub_1000179B4(0, v17[2] + 1, 1, (uint64_t)v17);
          }
          unint64_t v19 = v17[2];
          unint64_t v18 = v17[3];
          if (v19 >= v18 >> 1) {
            uint64_t v17 = (void *)sub_1000179B4(v18 > 1, v19 + 1, 1, (uint64_t)v17);
          }
          v17[2] = v19 + 1;
          sub_10002CE90((uint64_t)v10, (uint64_t)v17+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v19);
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
    sub_100004A2C(&qword_10005D798);
    v34[0] = v17;
    return sub_100045A60();
  }
  else
  {
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    uint64_t v35 = type metadata accessor for JSSourceUrlOverrider();
    v34[0] = a2;
    swift_retain();
    id v20 = (id)AMSLogKey();
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_100045C30();
      uint64_t v24 = v23;

      sub_1000454F0();
      v36._countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      sub_1000454E0(v36);
      sub_100005548(v34, v35);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v32[0] = DynamicType;
      sub_1000454D0();
      sub_100031260((uint64_t)v32, (uint64_t *)&unk_10005CC40);
      v37._countAndFlagsBits = 5972026;
      v37._object = (void *)0xE300000000000000;
      sub_1000454E0(v37);
      uint64_t MetatypeMetadata = &type metadata for String;
      v32[0] = v22;
      v32[1] = v24;
      sub_1000454D0();
      sub_100031260((uint64_t)v32, (uint64_t *)&unk_10005CC40);
      v26._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v38._countAndFlagsBits = 0;
      v38._object = (void *)0xE000000000000000;
      sub_1000454E0(v38);
      sub_100005548(v34, v35);
      uint64_t v27 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v32[0] = v27;
      sub_1000454D0();
      sub_100031260((uint64_t)v32, (uint64_t *)&unk_10005CC40);
      v26._countAndFlagsBits = 58;
    }
    v26._object = (void *)0xE100000000000000;
    sub_1000454E0(v26);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v34);
    sub_1000454B0();
    sub_10003493C();
    swift_bridgeObjectRelease();
    sub_100004A2C(&qword_10005D798);
    sub_100031214();
    swift_allocError();
    *Swift::String v28 = 0;
    return sub_100045A50();
  }
}

uint64_t sub_10002F734(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v162 = a3;
  uint64_t v4 = sub_100004A2C(&qword_10005D7B8);
  __chkstk_darwin(v4 - 8);
  uint64_t v150 = (uint64_t)&v144 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = sub_100004A2C(&qword_10005D518);
  uint64_t v6 = __chkstk_darwin(v160);
  uint64_t v148 = (char *)&v144 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v149 = (char *)&v144 - v9;
  __chkstk_darwin(v8);
  uint64_t v156 = (char *)&v144 - v10;
  uint64_t v11 = sub_100004A2C(&qword_10005C838);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v144 = (uint64_t)&v144 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v147 = (uint64_t)&v144 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v155 = (uint64_t)&v144 - v17;
  __chkstk_darwin(v16);
  uint64_t v157 = (uint64_t)&v144 - v18;
  uint64_t v158 = sub_1000450E0();
  uint64_t v19 = *(void *)(v158 - 8);
  uint64_t v20 = __chkstk_darwin(v158);
  uint64_t v145 = (char *)&v144 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v146 = (char *)&v144 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v151 = (char *)&v144 - v25;
  __chkstk_darwin(v24);
  v159 = (char *)&v144 - v26;
  uint64_t v27 = sub_100045500();
  __chkstk_darwin(v27 - 8);
  v161 = (char *)&v144 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100004A2C(&qword_10005D7C0);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v144 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = (int *)type metadata accessor for JSSourceInfo();
  uint64_t v33 = *((void *)v32 - 1);
  uint64_t v34 = __chkstk_darwin(v32);
  Swift::String v36 = (char *)&v144 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  uint64_t v163 = (char *)&v144 - v37;
  uint64_t v38 = *a1;
  uint64_t v39 = sub_100045040();
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
      sub_10002CCE8(v42 + v44 * v45, (uint64_t)v36);
      uint64_t v46 = *(void *)&v36[v32[7]];
      uint64_t v47 = *(void *)(v46 + 16);
      if (v47) {
        break;
      }
LABEL_14:
      ++v45;
      sub_10002CD4C((uint64_t)v36);
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
      id v51 = sub_100031138(v49, v50, 0);
      if (v51)
      {
        Swift::Int v52 = (v41 & 0x1000000000000000) != 0 ? sub_100045CB0() : sub_100045CC0();
        Swift::Int v53 = v52;
        NSString v54 = sub_100045C00();
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
    sub_10002CE90((uint64_t)v166, (uint64_t)v153);
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
  sub_100005994((uint64_t)v31, v56, 1, (uint64_t)v32);
  swift_bridgeObjectRelease();
  if (sub_100005A24((uint64_t)v31, 1, (uint64_t)v32) != 1)
  {
    sub_10002CE90((uint64_t)v31, v57);
    type metadata accessor for JSSourceUrlOverrides();
    uint64_t v65 = sub_10003140C();
    uint64_t v66 = v57;
    uint64_t v67 = *(void *)(v57 + 8);
    uint64_t v68 = *(void *)(v57 + 16);
    swift_bridgeObjectRetain();
    uint64_t v69 = v67;
    uint64_t v70 = v157;
    sub_10002ECF0(v69, v68, v65, v157);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v71 = v158;
    if (sub_100005A24(v70, 1, v158) == 1)
    {
      sub_100031260(v70, &qword_10005C838);
      uint64_t v72 = sub_100031418();
      uint64_t v73 = *(void *)(v66 + 8);
      uint64_t v74 = *(void *)(v66 + 16);
      swift_bridgeObjectRetain();
      uint64_t v75 = v73;
      uint64_t v76 = v155;
      sub_10002ECF0(v75, v74, v72, v155);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (sub_100005A24(v76, 1, v71) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v151, v76, v71);
        sub_100004A2C((uint64_t *)&unk_10005E040);
        sub_100045550();
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
        uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
        uint64_t v175 = v162;
        swift_retain();
        id v94 = (id)AMSLogKey();
        if (v94)
        {
          uint64_t v95 = v94;
          uint64_t v96 = sub_100045C30();
          uint64_t v97 = v19;
          uint64_t v99 = v98;

          sub_1000454F0();
          v184._countAndFlagsBits = 0;
          v184._object = (void *)0xE000000000000000;
          sub_1000454E0(v184);
          sub_100005548(&v175, v177);
          uint64_t DynamicType = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v172 = DynamicType;
          sub_1000454D0();
          sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
          v185._countAndFlagsBits = 5972026;
          v185._object = (void *)0xE300000000000000;
          sub_1000454E0(v185);
          uint64_t MetatypeMetadata = &type metadata for String;
          uint64_t v172 = v96;
          uint64_t v173 = v99;
          uint64_t v19 = v97;
          sub_1000454D0();
          sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
          v101._countAndFlagsBits = 93;
        }
        else
        {
          sub_1000454F0();
          v187._countAndFlagsBits = 0;
          v187._object = (void *)0xE000000000000000;
          sub_1000454E0(v187);
          sub_100005548(&v175, v177);
          uint64_t v118 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v172 = v118;
          sub_1000454D0();
          sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
          v101._countAndFlagsBits = 58;
        }
        uint64_t v119 = v156;
        v101._object = (void *)0xE100000000000000;
        sub_1000454E0(v101);
        sub_100045510();
        type metadata accessor for Log();
        _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v175);
        sub_1000454B0();
        sub_100034904();
        swift_bridgeObjectRelease();
        sub_100004A2C(&qword_10005D7A8);
        uint64_t v120 = *(int *)(v160 + 48);
        uint64_t v108 = v151;
        (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v119, v151, v71);
        v119[v120] = 0;
        goto LABEL_39;
      }
      id v77 = (char *)v66;
      sub_100031260(v76, &qword_10005C838);
      uint64_t v78 = v150;
      sub_10002C2D0(v150);
      uint64_t v79 = v160;
      if (sub_100005A24(v78, 1, v160) != 1)
      {
        uint64_t v109 = *(int *)(v79 + 48);
        Swift::String v110 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 32);
        uint64_t v111 = (uint64_t)v149;
        v110(v149, v78, v71);
        uint64_t v112 = v19;
        char v113 = *(unsigned char *)(v78 + v109);
        *(unsigned char *)(v111 + v109) = v113;
        sub_100004A2C(&qword_10005D7A8);
        uint64_t v114 = *(int *)(v79 + 48);
        uint64_t v115 = v156;
        (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v156, v111, v71);
        v115[v114] = v113;
        uint64_t v116 = *(int *)(v79 + 48);
        uint64_t v117 = v148;
        v110(v148, (uint64_t)v115, v71);
        v117[v116] = v113;
        uint64_t v83 = sub_100045A60();
        sub_100031260(v111, &qword_10005D518);
LABEL_40:
        uint64_t v121 = (uint64_t)v163;
LABEL_41:
        sub_10002CD4C(v121);
        return v83;
      }
      sub_100031260(v78, &qword_10005D7B8);
      uint64_t v80 = v147;
      sub_100017BA8((uint64_t)&v77[v32[6]], v147);
      if (sub_100005A24(v80, 1, v71) == 1)
      {
        sub_100031260(v80, &qword_10005C838);
        uint64_t v81 = v144;
        sub_100017BA8((uint64_t)&v77[v32[8]], v144);
        if (sub_100005A24(v81, 1, v71) == 1)
        {
          sub_100031260(v81, &qword_10005C838);
          sub_100004A2C(&qword_10005D7A8);
          sub_100031214();
          swift_allocError();
          *uint64_t v82 = 0;
          uint64_t v83 = sub_100045A50();
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v145, v81, v71);
          sub_100004A2C((uint64_t *)&unk_10005E040);
          sub_100045550();
          *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
          uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
          uint64_t v175 = v162;
          swift_retain();
          id v131 = (id)AMSLogKey();
          if (v131)
          {
            uint64_t v132 = v131;
            uint64_t v133 = sub_100045C30();
            uint64_t v134 = v19;
            uint64_t v136 = v135;

            sub_1000454F0();
            v190._countAndFlagsBits = 0;
            v190._object = (void *)0xE000000000000000;
            sub_1000454E0(v190);
            sub_100005548(&v175, v177);
            uint64_t v137 = swift_getDynamicType();
            uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
            uint64_t v172 = v137;
            sub_1000454D0();
            sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
            v191._countAndFlagsBits = 5972026;
            v191._object = (void *)0xE300000000000000;
            sub_1000454E0(v191);
            uint64_t MetatypeMetadata = &type metadata for String;
            uint64_t v172 = v133;
            uint64_t v173 = v136;
            id v77 = v163;
            uint64_t v19 = v134;
            sub_1000454D0();
            sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
            v138._countAndFlagsBits = 93;
          }
          else
          {
            sub_1000454F0();
            v193._countAndFlagsBits = 0;
            v193._object = (void *)0xE000000000000000;
            sub_1000454E0(v193);
            sub_100005548(&v175, v177);
            uint64_t v140 = swift_getDynamicType();
            uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
            uint64_t v172 = v140;
            sub_1000454D0();
            sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
            v138._countAndFlagsBits = 58;
          }
          v138._object = (void *)0xE100000000000000;
          sub_1000454E0(v138);
          sub_100045510();
          type metadata accessor for Log();
          _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v175);
          sub_1000454B0();
          sub_100034904();
          swift_bridgeObjectRelease();
          sub_100004A2C(&qword_10005D7A8);
          uint64_t v141 = *(int *)(v160 + 48);
          uint64_t v142 = v156;
          uint64_t v143 = v145;
          (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v156, v145, v71);
          v142[v141] = 0;
          uint64_t v83 = sub_100045A60();
          (*(void (**)(char *, uint64_t))(v19 + 8))(v143, v71);
        }
        uint64_t v121 = (uint64_t)v77;
        goto LABEL_41;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v146, v80, v71);
      sub_100004A2C((uint64_t *)&unk_10005E040);
      sub_100045550();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
      uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
      uint64_t v175 = v162;
      swift_retain();
      id v123 = (id)AMSLogKey();
      if (v123)
      {
        uint64_t v124 = v123;
        uint64_t v125 = sub_100045C30();
        uint64_t v126 = v19;
        uint64_t v128 = v127;

        sub_1000454F0();
        v188._countAndFlagsBits = 0;
        v188._object = (void *)0xE000000000000000;
        sub_1000454E0(v188);
        sub_100005548(&v175, v177);
        uint64_t v129 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v129;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v189._countAndFlagsBits = 5972026;
        v189._object = (void *)0xE300000000000000;
        sub_1000454E0(v189);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v172 = v125;
        uint64_t v173 = v128;
        uint64_t v19 = v126;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v130._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v192._countAndFlagsBits = 0;
        v192._object = (void *)0xE000000000000000;
        sub_1000454E0(v192);
        sub_100005548(&v175, v177);
        uint64_t v139 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v139;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v130._countAndFlagsBits = 58;
      }
      uint64_t v103 = v156;
      v130._object = (void *)0xE100000000000000;
      sub_1000454E0(v130);
      sub_100045510();
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v175);
      sub_1000454B0();
      sub_100034904();
      swift_bridgeObjectRelease();
      sub_100004A2C(&qword_10005D7A8);
      uint64_t v104 = *(int *)(v160 + 48);
      uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v106 = v103;
      uint64_t v107 = (uint64_t *)&v176;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v159, v70, v71);
      sub_100004A2C((uint64_t *)&unk_10005E040);
      sub_100045550();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
      uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
      uint64_t v175 = v162;
      swift_retain();
      id v84 = (id)AMSLogKey();
      if (v84)
      {
        double v85 = v84;
        uint64_t v86 = sub_100045C30();
        uint64_t v87 = v19;
        uint64_t v89 = v88;

        sub_1000454F0();
        v181._countAndFlagsBits = 0;
        v181._object = (void *)0xE000000000000000;
        sub_1000454E0(v181);
        sub_100005548(&v175, v177);
        uint64_t v90 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v90;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v182._countAndFlagsBits = 5972026;
        v182._object = (void *)0xE300000000000000;
        sub_1000454E0(v182);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v172 = v86;
        uint64_t v173 = v89;
        uint64_t v19 = v87;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v91._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v186._countAndFlagsBits = 0;
        v186._object = (void *)0xE000000000000000;
        sub_1000454E0(v186);
        sub_100005548(&v175, v177);
        uint64_t v102 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v172 = v102;
        sub_1000454D0();
        sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
        v91._countAndFlagsBits = 58;
      }
      uint64_t v103 = v156;
      v91._object = (void *)0xE100000000000000;
      sub_1000454E0(v91);
      sub_100045510();
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v175);
      sub_1000454B0();
      sub_100034904();
      swift_bridgeObjectRelease();
      sub_100004A2C(&qword_10005D7A8);
      uint64_t v104 = *(int *)(v160 + 48);
      uint64_t v105 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
      uint64_t v106 = v103;
      uint64_t v107 = &v178;
    }
    uint64_t v108 = (char *)*(v107 - 32);
    v105(v106, v108, v71);
    v103[v104] = 1;
LABEL_39:
    uint64_t v83 = sub_100045A60();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v108, v71);
    goto LABEL_40;
  }
  sub_100031260((uint64_t)v31, &qword_10005D7C0);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v177 = type metadata accessor for JSSourceUrlOverrider();
  uint64_t v175 = v162;
  swift_retain();
  id v58 = (id)AMSLogKey();
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = sub_100045C30();
    uint64_t v62 = v61;

    sub_1000454F0();
    v179._countAndFlagsBits = 0;
    v179._object = (void *)0xE000000000000000;
    sub_1000454E0(v179);
    sub_100005548(&v175, v177);
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v172 = v63;
    sub_1000454D0();
    sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
    v180._countAndFlagsBits = 5972026;
    v180._object = (void *)0xE300000000000000;
    sub_1000454E0(v180);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v172 = v60;
    uint64_t v173 = v62;
    sub_1000454D0();
    sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
    v64._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v183._countAndFlagsBits = 0;
    v183._object = (void *)0xE000000000000000;
    sub_1000454E0(v183);
    sub_100005548(&v175, v177);
    uint64_t v92 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v172 = v92;
    sub_1000454D0();
    sub_100031260((uint64_t)&v172, (uint64_t *)&unk_10005CC40);
    v64._countAndFlagsBits = 58;
  }
  v64._object = (void *)0xE100000000000000;
  sub_1000454E0(v64);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v175);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100004A2C(&qword_10005D7A8);
  sub_100031214();
  swift_allocError();
  *uint64_t v93 = 1;
  return sub_100045A50();
}

uint64_t sub_100030DD4()
{
  sub_1000458B0();
  sub_10000CB80();
  uint64_t v1 = sub_1000313FC();
  v2(v1);
  sub_1000450E0();
  sub_10000CB80();
  uint64_t v3 = sub_1000313FC();
  v4(v3);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_100030E90()
{
  return type metadata accessor for JSSourceUrlOverrider();
}

uint64_t type metadata accessor for JSSourceUrlOverrider()
{
  uint64_t result = qword_10005D6C8;
  if (!qword_10005D6C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100030EE0()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000450E0();
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

uint64_t sub_100030FAC(uint64_t *a1)
{
  return sub_10002F210(a1, v1);
}

uint64_t sub_100030FB4()
{
  sub_1000450E0();
  sub_10000CB80();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_10003104C(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_1000450E0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10002F734(a1, v1 + v4, v5);
}

uint64_t sub_1000310E8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000C4A8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100031138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_100045C00();
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
    sub_100045010();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_100031214()
{
  unint64_t result = qword_10005D7C8;
  if (!qword_10005D7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D7C8);
  }
  return result;
}

uint64_t sub_100031260(uint64_t a1, uint64_t *a2)
{
  sub_100004A2C(a2);
  sub_10000CB80();
  uint64_t v3 = sub_1000313FC();
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
        JUMPOUT(0x100031374);
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

unint64_t sub_1000313B0()
{
  unint64_t result = qword_10005D7D0;
  if (!qword_10005D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D7D0);
  }
  return result;
}

uint64_t sub_1000313FC()
{
  return v0;
}

uint64_t sub_10003140C()
{
  return sub_100031424((SEL *)&selRef_jsSourceOverrides);
}

uint64_t sub_100031418()
{
  return sub_100031424((SEL *)&selRef_sourceOverrides);
}

uint64_t sub_100031424(SEL *a1)
{
  uint64_t v2 = self;
  uint64_t result = sub_1000314BC(v2, a1);
  if (!result)
  {
    sub_1000450E0();
    return sub_100045BE0();
  }
  return result;
}

uint64_t type metadata accessor for JSSourceUrlOverrides()
{
  return self;
}

uint64_t sub_1000314BC(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  sub_1000450E0();
  uint64_t v4 = sub_100045BD0();

  return v4;
}

uint64_t sub_100031528()
{
  uint64_t v1 = type metadata accessor for JSSourceUrlParser();
  sub_100009FF4();
  v22[1] = v2;
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v5);
  v22[2] = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v24 = v1;
  sub_100017B68(v23);
  sub_100033358();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_1000454E0(v28);
    sub_100005548(v23, v24);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v26[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v26, (uint64_t *)&unk_10005CC40);
    v29._countAndFlagsBits = 5972026;
    v29._object = (void *)0xE300000000000000;
    sub_1000454E0(v29);
    uint64_t MetatypeMetadata = &type metadata for String;
    v26[0] = v9;
    v26[1] = v11;
    sub_1000454D0();
    sub_10002A908((uint64_t)v26, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_1000454E0(v30);
    sub_100005548(v23, v24);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v26[0] = v14;
    sub_1000454D0();
    sub_10002A908((uint64_t)v26, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v23);
  sub_1000454B0();
  uint64_t v15 = v0 + *(int *)(v1 + 20);
  uint64_t v16 = sub_1000450E0();
  uint64_t v24 = v16;
  uint64_t v17 = sub_100017B68(v23);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v17, v15, v16);
  sub_100045520();
  sub_10002A908((uint64_t)v23, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100031D04();
  sub_100033358();
  uint64_t v18 = swift_allocObject();
  sub_100033304();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_100032C6C;
  *(void *)(v19 + 24) = v18;
  uint64_t v24 = sub_1000457A0();
  uint64_t v25 = &protocol witness table for SyncTaskScheduler;
  sub_100017B68(v23);
  sub_100045790();
  sub_100004A2C(&qword_10005D878);
  sub_100033264();
  uint64_t v20 = sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v23);
  return v20;
}

uint64_t type metadata accessor for JSSourceUrlParser()
{
  uint64_t result = qword_10005D900;
  if (!qword_10005D900) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100031A14@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, char *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v29 = a3;
  uint64_t v32 = a2;
  uint64_t v33 = sub_100004A2C(&qword_10005D8A0);
  uint64_t v4 = __chkstk_darwin(v33);
  uint64_t v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  id v8 = (uint64_t *)((char *)&v28 - v7);
  sub_100023434(v34, a1);
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
    sub_100033358();
    *id v8 = v20;
    v8[1] = v19;
    sub_100033880((uint64_t)v8, (uint64_t)v6);
    uint64_t v22 = *v6;
    uint64_t v23 = v6[1];
    uint64_t v24 = (char *)v6 + *(int *)(v21 + 48);
    swift_bridgeObjectRetain();
    if (v32(v22, v23, v24))
    {
      swift_release();
      uint64_t v25 = v29;
      sub_100033880((uint64_t)v6, v29);
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      return sub_100005994(v26, v27, 1, v33);
    }
    uint64_t result = sub_10002A908((uint64_t)v6, &qword_10005D8A0);
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
              return sub_100005994(v26, v27, 1, v33);
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

void sub_100031CF0()
{
  qword_10005D870 = (uint64_t)&_swiftEmptyDictionarySingleton;
}

uint64_t sub_100031D04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000458B0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000450E0();
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
  v23(v13 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_url, v11, v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v13 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_bag, v5, v2);
  uint64_t v26 = sub_10002EE84();
  swift_release();
  sub_100004A2C(&qword_10005D7A8);
  uint64_t v14 = sub_100045AE0();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1000338E8;
  *(void *)(v15 + 24) = v14;
  int64_t v16 = (void (*)(char *, char *, uint64_t))v24;
  ((void (*)(char *, uint64_t, uint64_t))v24)(v11, v25, v6);
  int64_t v17 = v27;
  v16(v27, v11, v6);
  unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v14;
  v23(v19 + v18, v17, v6);
  unint64_t v20 = sub_1000339F4();
  swift_retain_n();
  uint64_t v21 = sub_100045D80();
  uint64_t v28[3] = v20;
  v28[4] = &protocol witness table for OS_dispatch_queue;
  v28[0] = v21;
  sub_100045A40();
  swift_release();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v28);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  return v14;
}

uint64_t sub_10003208C(uint64_t a1, int a2, char *a3)
{
  int v68 = a2;
  uint64_t v79 = a1;
  uint64_t v4 = sub_100004A2C(&qword_10005D888);
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
  uint64_t v16 = sub_100045500();
  __chkstk_darwin(v16 - 8);
  uint64_t v17 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v18 = *(void *)(sub_100045550() - 8);
  uint64_t v19 = *(void *)(v18 + 72);
  uint64_t v20 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = (v20 + 32) & ~v20;
  uint64_t v77 = v17;
  uint64_t v73 = v21 + 3 * v19;
  uint64_t v75 = v20 | 7;
  uint64_t v22 = swift_allocObject();
  long long v74 = xmmword_1000473B0;
  *(_OWORD *)(v22 + 16) = xmmword_1000473B0;
  uint64_t v76 = v21;
  uint64_t v72 = (void *)type metadata accessor for JSSourceUrlParser();
  uint64_t v86 = v72;
  sub_100017B68(&v84);
  uint64_t v80 = a3;
  sub_100033358();
  id v23 = (id)AMSLogKey();
  uint64_t v71 = v11;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = sub_100045C30();
    uint64_t v26 = v15;
    uint64_t v27 = v19;
    uint64_t v28 = v8;
    uint64_t v30 = v29;

    sub_1000454F0();
    v87._countAndFlagsBits = 0;
    v87._object = (void *)0xE000000000000000;
    sub_1000454E0(v87);
    sub_100005548(&v84, (uint64_t)v86);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v81 = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
    v88._countAndFlagsBits = 5972026;
    v88._object = (void *)0xE300000000000000;
    sub_1000454E0(v88);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v81 = v25;
    uint64_t v82 = v30;
    uint64_t v8 = v28;
    uint64_t v19 = v27;
    uint64_t v15 = v26;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
    v32._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v89._countAndFlagsBits = 0;
    v89._object = (void *)0xE000000000000000;
    sub_1000454E0(v89);
    sub_100005548(&v84, (uint64_t)v86);
    uint64_t v33 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v81 = v33;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
    v32._countAndFlagsBits = 58;
  }
  v32._object = (void *)0xE100000000000000;
  sub_1000454E0(v32);
  sub_100045510();
  uint64_t v34 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v84);
  sub_1000454B0();
  int64_t v35 = (void *)sub_1000450E0();
  uint64_t v86 = v35;
  Swift::String v36 = sub_100017B68(&v84);
  uint64_t v37 = v79;
  (*(void (**)(uint64_t *, uint64_t, void *))(*((void *)v35 - 1) + 16))(v36, v79, v35);
  sub_100045520();
  sub_10002A908((uint64_t)&v84, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v38 = v78;
  sub_100032CCC(v37, v78);
  if (sub_100005A24(v38, 1, v8) != 1)
  {
    uint64_t v79 = 2 * v19;
    sub_100033304();
    *(_OWORD *)(swift_allocObject() + 16) = v74;
    uint64_t v86 = v72;
    sub_100017B68(&v84);
    sub_100033358();
    id v43 = (id)AMSLogKey();
    uint64_t v67 = v34;
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = sub_100045C30();
      uint64_t v80 = v15;
      uint64_t v47 = v46;

      sub_1000454F0();
      v90._countAndFlagsBits = 0;
      v90._object = (void *)0xE000000000000000;
      sub_1000454E0(v90);
      sub_100005548(&v84, (uint64_t)v86);
      uint64_t v48 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v48;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v91._countAndFlagsBits = 5972026;
      v91._object = (void *)0xE300000000000000;
      sub_1000454E0(v91);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v81 = v45;
      uint64_t v82 = v47;
      uint64_t v15 = v80;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v49._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v94._countAndFlagsBits = 0;
      v94._object = (void *)0xE000000000000000;
      sub_1000454E0(v94);
      sub_100005548(&v84, (uint64_t)v86);
      uint64_t v57 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v57;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v49._countAndFlagsBits = 58;
    }
    v49._object = (void *)0xE100000000000000;
    sub_1000454E0(v49);
    sub_100045510();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v84);
    sub_1000454B0();
    uint64_t v58 = sub_100045040();
    uint64_t v86 = &type metadata for String;
    uint64_t v84 = v58;
    uint64_t v85 = v59;
    sub_100045520();
    sub_10002A908((uint64_t)&v84, (uint64_t *)&unk_10005CC40);
    sub_100034904();
    swift_bridgeObjectRelease();
    sub_100004A2C(&qword_10005D878);
    sub_100033358();
    uint64_t v42 = sub_100045A60();
    uint64_t v60 = (uint64_t)v15;
    goto LABEL_15;
  }
  char v39 = v68 & 1;
  sub_10002A908(v38, &qword_10005D888);
  uint64_t v40 = v37;
  unint64_t v41 = v69;
  sub_100033014(v40, v39, v69);
  if (sub_100005A24((uint64_t)v41, 1, v8) != 1)
  {
    uint64_t v79 = 2 * v19;
    uint64_t v67 = v34;
    sub_100033304();
    *(_OWORD *)(swift_allocObject() + 16) = v74;
    uint64_t v86 = v72;
    sub_100017B68(&v84);
    sub_100033358();
    id v50 = (id)AMSLogKey();
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = sub_100045C30();
      uint64_t v54 = v53;

      sub_1000454F0();
      v92._countAndFlagsBits = 0;
      v92._object = (void *)0xE000000000000000;
      sub_1000454E0(v92);
      sub_100005548(&v84, (uint64_t)v86);
      uint64_t v55 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v55;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v93._countAndFlagsBits = 5972026;
      v93._object = (void *)0xE300000000000000;
      sub_1000454E0(v93);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v81 = v52;
      uint64_t v82 = v54;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v56._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v95._countAndFlagsBits = 0;
      v95._object = (void *)0xE000000000000000;
      sub_1000454E0(v95);
      sub_100005548(&v84, (uint64_t)v86);
      uint64_t v61 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v81 = v61;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v81, (uint64_t *)&unk_10005CC40);
      v56._countAndFlagsBits = 58;
    }
    v56._object = (void *)0xE100000000000000;
    sub_1000454E0(v56);
    sub_100045510();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v84);
    sub_1000454B0();
    uint64_t v62 = v70;
    uint64_t v63 = sub_100045040();
    uint64_t v86 = &type metadata for String;
    uint64_t v84 = v63;
    uint64_t v85 = v64;
    sub_100045520();
    sub_10002A908((uint64_t)&v84, (uint64_t *)&unk_10005CC40);
    sub_100034904();
    swift_bridgeObjectRelease();
    sub_100004A2C(&qword_10005D878);
    sub_100033358();
    uint64_t v42 = sub_100045A60();
    uint64_t v60 = (uint64_t)v62;
LABEL_15:
    sub_1000333AC(v60);
    return v42;
  }
  sub_10002A908((uint64_t)v41, &qword_10005D888);
  sub_100004A2C(&qword_10005D878);
  sub_1000332B8();
  swift_allocError();
  return sub_100045A50();
}

uint64_t sub_100032B58()
{
  uint64_t v1 = (int *)(type metadata accessor for JSSourceUrlParser() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  sub_1000458B0();
  sub_10001CE80();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  uint64_t v8 = v6 + v1[7];
  sub_1000450E0();
  sub_10001CE80();
  (*(void (**)(uint64_t))(v9 + 8))(v8);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100032C6C(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = type metadata accessor for JSSourceUrlParser();
  sub_1000341DC(v5);
  uint64_t v7 = (char *)(v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)));

  return sub_10003208C(a1, v4, v7);
}

uint64_t sub_100032CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a1;
  uint64_t v21 = a2;
  uint64_t v3 = sub_100004A2C(&qword_10005D898);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v20 = type metadata accessor for JSSourceFile();
  uint64_t v9 = __chkstk_darwin(v20);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v11 = __chkstk_darwin(v10);
  if (qword_10005C418 != -1) {
    uint64_t v11 = swift_once();
  }
  __chkstk_darwin(v11);
  *(&v19 - 2) = v2;
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_100031A14(v12, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1000337F4, (uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_100004A2C(&qword_10005D8A0);
  if (sub_100005A24((uint64_t)v8, 1, v13) != 1)
  {
    swift_bridgeObjectRelease();
    sub_100033304();
LABEL_8:
    uint64_t v17 = v21;
    sub_100033304();
    uint64_t v16 = 0;
    return sub_100005994(v17, v16, 1, v20);
  }
  uint64_t v14 = sub_10002A908((uint64_t)v8, &qword_10005D898);
  __chkstk_darwin(v14);
  *(&v19 - 2) = v19;
  uint64_t v15 = swift_bridgeObjectRetain();
  sub_100031A14(v15, (uint64_t (*)(uint64_t, uint64_t, char *))sub_100033878, (uint64_t)v6);
  swift_bridgeObjectRelease();
  if (sub_100005A24((uint64_t)v6, 1, v13) != 1)
  {
    swift_bridgeObjectRelease();
    sub_100033304();
    sub_100033304();
    goto LABEL_8;
  }
  sub_10002A908((uint64_t)v6, &qword_10005D898);
  uint64_t v16 = 1;
  uint64_t v17 = v21;
  return sub_100005994(v17, v16, 1, v20);
}

uint64_t sub_100033014@<X0>(uint64_t a1@<X0>, char a2@<W1>, char *a3@<X8>)
{
  uint64_t v6 = sub_100045030();
  BOOL v8 = v6 == 29546 && v7 == 0xE200000000000000;
  if (v8 || (v9 = v6, uint64_t v10 = v7, (sub_1000460F0() & 1) != 0))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v11 = type metadata accessor for JSSourceFile();
    uint64_t v12 = &a3[*(int *)(v11 + 20)];
    uint64_t v13 = sub_1000450E0();
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
    char v17 = sub_1000460F0();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      goto LABEL_7;
    }
  }
  char v14 = a2 & 1 | 4;
  uint64_t v11 = type metadata accessor for JSSourceFile();
  uint64_t v18 = &a3[*(int *)(v11 + 20)];
  uint64_t v19 = sub_1000450E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v18, a1, v19);
LABEL_8:
  *a3 = v14;
  type metadata accessor for JSSourceFile();

  return sub_100005994((uint64_t)a3, 0, 1, v11);
}

uint64_t sub_1000331D4(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100004A2C(&qword_10005D518);
  return a2(a1, *(unsigned __int8 *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_100033224()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003325C(uint64_t a1)
{
  return sub_1000331D4(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

unint64_t sub_100033264()
{
  unint64_t result = qword_10005D880;
  if (!qword_10005D880)
  {
    sub_10000C4A8(&qword_10005D878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D880);
  }
  return result;
}

unint64_t sub_1000332B8()
{
  unint64_t result = qword_10005D890;
  if (!qword_10005D890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D890);
  }
  return result;
}

uint64_t sub_100033304()
{
  uint64_t v2 = sub_1000341F0();
  v3(v2);
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_100033358()
{
  uint64_t v2 = sub_1000341F0();
  v3(v2);
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_1000333AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceFile();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100033408(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = sub_100004A2C(&qword_10005D518);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(int *)(v5 + 56);
  uint64_t v9 = sub_1000450E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, a1, v9);
  v7[v8] = v3;
  sub_100045AA0();
  return sub_10002A908((uint64_t)v7, &qword_10005D518);
}

uint64_t sub_1000334E8(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100004A2C(&qword_10005D518);
  return a2(a1, *(unsigned __int8 *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_100033538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_100004A2C(&qword_10005D518);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Log();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  void v16[3] = v15;
  uint64_t v10 = sub_100017B68(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v10, v8, v9);
  sub_100045520();
  sub_10002A908((uint64_t)v16, (uint64_t *)&unk_10005CC40);
  sub_10003493C();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(v5 + 56);
  uint64_t v12 = sub_1000450E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v7, a3, v12);
  v7[v11] = 0;
  sub_100045AA0();
  return sub_10002A908((uint64_t)v7, &qword_10005D518);
}

uint64_t sub_100033768()
{
  type metadata accessor for JSSourceUrlParser();
  sub_100045040();
  sub_10002CDA8();
  char v0 = sub_100045E80();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_1000337F4()
{
  return sub_100033768();
}

uint64_t sub_1000337FC()
{
  sub_100045040();
  sub_10002CDA8();
  char v0 = sub_100045E80();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_100033878()
{
  return sub_1000337FC();
}

uint64_t sub_100033880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005D8A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000338E8(uint64_t a1, char a2)
{
  return sub_100033408(a1, a2 & 1);
}

uint64_t sub_1000338F4(uint64_t a1)
{
  return sub_1000334E8(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

uint64_t sub_1000338FC()
{
  uint64_t v1 = sub_1000450E0();
  sub_100009FF4();
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

uint64_t sub_1000339A0(uint64_t a1)
{
  uint64_t v3 = sub_1000450E0();
  sub_1000341DC(v3);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_100033538(a1, v5, v6);
}

unint64_t sub_1000339F4()
{
  unint64_t result = qword_10005C960;
  if (!qword_10005C960)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005C960);
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
      JUMPOUT(0x100033AD0);
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

uint64_t *sub_100033B08(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_1000458B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1000450E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_100033C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1000450E0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_100033CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_100033D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100033E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_100033EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000458B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100033F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100033FAC);
}

uint64_t sub_100033FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000458B0();
  sub_10000713C();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_1000450E0();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return sub_100005A24(v9, a2, v8);
}

uint64_t sub_100034028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003403C);
}

uint64_t sub_10003403C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1000458B0();
  sub_10000713C();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    uint64_t v10 = sub_1000450E0();
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  return sub_100005994(v11, a2, a2, v10);
}

uint64_t sub_1000340C0()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000450E0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_10003418C()
{
  unint64_t result = qword_10005D938;
  if (!qword_10005D938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005D938);
  }
  return result;
}

uint64_t sub_1000341DC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_1000341F0()
{
  return 0;
}

uint64_t type metadata accessor for Localizations()
{
  return self;
}

uint64_t sub_100034228(uint64_t a1)
{
  uint64_t v3 = sub_100045B00();
  uint64_t v21 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v25 = type metadata accessor for LocalJavascriptLoader();
  v24[0] = v1;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v28._countAndFlagsBits = 0;
    v28._object = (void *)0xE000000000000000;
    sub_1000454E0(v28);
    sub_100005548(v24, v25);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v22);
    v29._countAndFlagsBits = 5972026;
    v29._object = (void *)0xE300000000000000;
    sub_1000454E0(v29);
    uint64_t MetatypeMetadata = &type metadata for String;
    v22[0] = v9;
    v22[1] = v11;
    sub_1000454D0();
    sub_100007820((uint64_t)v22);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v30._countAndFlagsBits = 0;
    v30._object = (void *)0xE000000000000000;
    sub_1000454E0(v30);
    sub_100005548(v24, v25);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v22[0] = v14;
    sub_1000454D0();
    sub_100007820((uint64_t)v22);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v24);
  sub_1000454B0();
  uint64_t v15 = sub_1000450E0();
  uint64_t v25 = v15;
  uint64_t v16 = sub_100005CD0(v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v16, a1, v15);
  sub_100045520();
  sub_100007820((uint64_t)v24);
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100045BF0();
  sub_100045B10();
  uint64_t v25 = v3;
  uint64_t v26 = &protocol witness table for JSSource;
  char v17 = sub_100005CD0(v24);
  uint64_t v18 = v21;
  (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 16))(v17, v5, v3);
  uint64_t v27 = sub_100045BE0();
  sub_100004A2C(&qword_10005C940);
  sub_10003474C((uint64_t)v24, (uint64_t)v22);
  uint64_t v19 = sub_100045A60();
  sub_100017958((uint64_t)v24);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v3);
  return v19;
}

uint64_t type metadata accessor for LocalJavascriptLoader()
{
  return self;
}

uint64_t sub_1000346DC(uint64_t a1)
{
  return sub_100034228(a1);
}

unint64_t sub_100034700()
{
  unint64_t result = qword_10005DA78;
  if (!qword_10005DA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DA78);
  }
  return result;
}

uint64_t sub_10003474C(uint64_t a1, uint64_t a2)
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
      JUMPOUT(0x100034844);
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

unint64_t sub_100034880()
{
  unint64_t result = qword_10005DA80;
  if (!qword_10005DA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DA80);
  }
  return result;
}

uint64_t sub_1000348CC()
{
  os_log_type_t v0 = sub_100045D40();

  return sub_100034A48(v0);
}

uint64_t sub_100034904()
{
  os_log_type_t v0 = sub_100045D70();

  return sub_100034A48(v0);
}

uint64_t sub_10003493C()
{
  os_log_type_t v0 = sub_100045D50();

  return sub_100034A48(v0);
}

uint64_t sub_100034974()
{
  os_log_type_t v0 = sub_100045D60();

  return sub_100034A48(v0);
}

uint64_t sub_1000349AC()
{
  os_log_type_t v0 = sub_100045D30();

  return sub_100034A48(v0);
}

uint64_t sub_1000349E4()
{
  sub_100034BE4();
  uint64_t result = sub_100045E60();
  qword_10005DA88 = result;
  return result;
}

uint64_t sub_100034A48(os_log_type_t a1)
{
  if (qword_10005C420 != -1) {
    swift_once();
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_10005DA88, a1);
  if (result)
  {
    sub_1000454C0();
    uint64_t v3 = sub_100045530();
    uint64_t v5 = v4;
    sub_100004A2C(&qword_10005DB28);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1000471C0;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_100034B98();
    *(void *)(v6 + 32) = v3;
    *(void *)(v6 + 40) = v5;
    sub_100045190();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for Log()
{
  return self;
}

unint64_t sub_100034B98()
{
  unint64_t result = qword_10005DB30;
  if (!qword_10005DB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DB30);
  }
  return result;
}

unint64_t sub_100034BE4()
{
  unint64_t result = qword_10005DB38;
  if (!qword_10005DB38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DB38);
  }
  return result;
}

void sub_100034C24(void *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4 = (void *)sub_100045E00();
  uint64_t v5 = sub_100007CCC(v4);
  if (v5)
  {
    unint64_t v6 = sub_100023020(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = (void *)sub_100045E00();
  uint64_t v8 = sub_100045DF0();
  unint64_t v10 = v9;

  sub_100035170();
  uint64_t v11 = (void *)sub_100045E00();
  uint64_t v12 = sub_100045DF0();
  unint64_t v14 = v13;

  if (v14)
  {
    uint64_t v24 = v8;
    sub_100035150();
    uint64_t v15 = (void *)sub_100045E00();
    uint64_t v23 = sub_100045DF0();
    unint64_t v17 = v16;

    if (v17)
    {
      unint64_t v22 = v6;
      sub_10000CCF8();
      uint64_t v18 = (void *)sub_100045E00();
      uint64_t v21 = sub_100045DF0();
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
      sub_10000CCF8();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100035150();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100035170();
  }
  sub_100045E00();
  sub_100045950();
  sub_100007D44();
  swift_allocError();
  sub_100045920();
  swift_willThrow();
}

void sub_100034E48(void *a1@<X0>, void *a2@<X8>)
{
  sub_100034C24(a1, __src);
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

uint64_t sub_100035150()
{
  return 0x5465636976726573;
}

uint64_t sub_100035170()
{
  return 0x6E656D6563616C70;
}

id sub_10003518C(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_10000F938();
    id v6 = [a2 rawValues];
    sub_100004A2C(&qword_10005C7F0);
    uint64_t v7 = sub_100045BD0();

    v9[3] = sub_100004A2C(&qword_10005C7F8);
    v9[0] = v7;
    id v8 = a1;
    id result = sub_100025D08(v9, a1);
    if (result)
    {
      sub_100045E10();
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

void sub_1000352AC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000450E0();
  uint64_t v28 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  uint64_t v10 = a2 + *(int *)(type metadata accessor for MediaAPIRequest() + 32);
  sub_100005994(v10, 1, 1, v7);
  uint64_t v11 = (void *)sub_100045E00();
  uint64_t v12 = sub_100007CCC(v11);
  if (v12)
  {
    unint64_t v13 = sub_100023020(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = 0;
  }
  *(void *)a2 = v13;
  unint64_t v14 = (void *)sub_100045E00();
  uint64_t v15 = sub_100004968(v14);
  if (v15)
  {
    unint64_t v16 = sub_100004090(v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v16 = 0;
  }
  *(void *)(a2 + 16) = v16;
  unint64_t v17 = (void *)sub_100045E00();
  char v18 = sub_100045DE0();

  *(unsigned char *)(a2 + 8) = v18 & 1;
  unint64_t v19 = (void *)sub_100045E00();
  sub_100045DF0();
  uint64_t v21 = v20;

  if (v21)
  {
    sub_1000450C0();
    swift_bridgeObjectRelease();
    if (sub_100005A24((uint64_t)v6, 1, v7) == 1)
    {
      sub_10000A8F0((uint64_t)v6);
    }
    else
    {
      unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v22(v9, v6, v7);
      sub_10000A8F0(v10);
      v22((char *)v10, v9, v7);
      sub_100005994(v10, 0, 1, v7);
    }
  }
  uint64_t v23 = (void *)sub_100045E00();
  uint64_t v24 = sub_100045DD0();
  char v26 = v25;

  if ((v26 & 1) == 0)
  {
    *(void *)(a2 + 24) = v24;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

void sub_1000355B8(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t type metadata accessor for MediaAPIRequest()
{
  uint64_t result = qword_10005DB98;
  if (!qword_10005DB98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100035618(uint64_t a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v10 = sub_1000450E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (sub_100005A24((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = sub_100004A2C(&qword_10005C838);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      sub_100005994((uint64_t)v8, 0, 1, v10);
    }
  }
  return v5;
}

uint64_t sub_10003576C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1000450E0();
  uint64_t result = sub_100005A24(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t sub_100035810(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v8 = sub_1000450E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (sub_100005A24((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100004A2C(&qword_10005C838);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    sub_100005994((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_100035918(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v10 = sub_1000450E0();
  int v11 = sub_100005A24((uint64_t)v8, 1, v10);
  int v12 = sub_100005A24((uint64_t)v9, 1, v10);
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
    uint64_t v14 = sub_100004A2C(&qword_10005C838);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  sub_100005994((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t sub_100035AC0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v8 = sub_1000450E0();
  if (sub_100005A24((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_100004A2C(&qword_10005C838);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
    sub_100005994((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_100035BB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v9 = sub_1000450E0();
  int v10 = sub_100005A24((uint64_t)v7, 1, v9);
  int v11 = sub_100005A24((uint64_t)v8, 1, v9);
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
    uint64_t v13 = sub_100004A2C(&qword_10005C838);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  sub_100005994((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_100035D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100035D5C);
}

uint64_t sub_100035D5C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = sub_100004A2C(&qword_10005C838);
    uint64_t v10 = (uint64_t)a1 + *(int *)(a3 + 32);
    return sub_100005A24(v10, a2, v9);
  }
}

uint64_t sub_100035DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100035E08);
}

void *sub_100035E08(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100004A2C(&qword_10005C838);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 32);
    return (void *)sub_100005994(v8, a2, a2, v7);
  }
  return result;
}

void sub_100035E8C()
{
  sub_100027FEC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

id sub_100035F38(void *a1, void *a2)
{
  id result = [self valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v5 = result;
  uint64_t v6 = sub_100036084(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    sub_10000F938();
    uint64_t v13 = sub_100004A2C(&qword_10005C500);
    v12[0] = v7;
    id v8 = a1;
    id result = sub_100025D08(v12, a1);
    if (result)
    {
      sub_100045E10();
      goto LABEL_5;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v9 = sub_1000360F0(a2);
  if (!v9) {
    return v5;
  }
  uint64_t v10 = v9;
  sub_10000F938();
  uint64_t v13 = sub_100004A2C(&qword_10005C7D8);
  v12[0] = v10;
  id v11 = a1;
  id result = sub_100025D08(v12, a1);
  if (result)
  {
    sub_100045E10();
    return v5;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100036084(void *a1)
{
  id v1 = [a1 responseDictionary];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = sub_100045BD0();

  return v3;
}

uint64_t sub_1000360F0(void *a1)
{
  id v1 = [a1 responseDataItems];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  sub_100004A2C(&qword_10005C500);
  uint64_t v3 = sub_100045CE0();

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

uint64_t sub_100036290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_1000460F0();
  }
}

uint64_t sub_1000362AC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_1000460F0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_100036340()
{
  return 0x696669746E656469;
}

uint64_t sub_10003635C(uint64_t *a1, uint64_t *a2)
{
  return sub_100036290(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_100036374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000362AC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000363A0(uint64_t a1)
{
  unint64_t v2 = sub_10003678C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000363DC(uint64_t a1)
{
  unint64_t v2 = sub_10003678C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100036418(void *a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005DBE0);
  sub_100009FF4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)sub_100005548(a1, a1[3]);
  sub_10003678C();
  sub_1000461B0();
  if (!v1)
  {
    uint64_t v9 = sub_100046060();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
  }
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
  return v9;
}

uint64_t sub_100036548(void *a1)
{
  uint64_t v2 = sub_100004A2C(&qword_10005DBF0);
  sub_100009FF4();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005548(a1, a1[3]);
  sub_10003678C();
  sub_1000461C0();
  sub_1000460A0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v2);
}

uint64_t sub_10003665C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100036418(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_100036688(void *a1)
{
  return sub_100036548(a1);
}

uint64_t sub_1000366A4(uint64_t a1, void *a2)
{
  sub_100045F90(27);
  sub_100004A2C(&qword_10005DBF8);
  uint64_t v4 = sub_100045C80();
  swift_bridgeObjectRelease();
  v6._object = (void *)0x800000010004AE60;
  v6._countAndFlagsBits = 0xD000000000000015;
  sub_100045CA0(v6);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  sub_100045CA0(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 32010;
  v8._object = (void *)0xE200000000000000;
  sub_100045CA0(v8);
  return v4;
}

uint64_t sub_100036784()
{
  return sub_1000366A4(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_10003678C()
{
  unint64_t result = qword_10005DBE8;
  if (!qword_10005DBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DBE8);
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
      JUMPOUT(0x100036874);
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

unint64_t sub_1000368B0()
{
  unint64_t result = qword_10005DC00;
  if (!qword_10005DC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC00);
  }
  return result;
}

unint64_t sub_100036900()
{
  unint64_t result = qword_10005DC08;
  if (!qword_10005DC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC08);
  }
  return result;
}

unint64_t sub_100036950()
{
  unint64_t result = qword_10005DC10;
  if (!qword_10005DC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC10);
  }
  return result;
}

void sub_1000369A0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100004A2C(&qword_10005DC68);
    uint64_t v2 = (void *)sub_100046040();
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
    sub_1000049D0(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&long long v43 = v20;
    *((void *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_100005AE4(v42, v36);
    long long v37 = v33;
    long long v38 = v34;
    uint64_t v39 = v35;
    sub_100005AE4(v36, v40);
    long long v33 = v37;
    long long v34 = v38;
    uint64_t v35 = v39;
    sub_100005AE4(v40, v41);
    sub_100005AE4(v41, &v37);
    Swift::Int v21 = sub_100045F20(v2[5]);
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
    sub_100005AE4(&v37, (_OWORD *)(v2[7] + 32 * v25));
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
      sub_100037EF0();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_100037ED8();
      if (!v11)
      {
        sub_100037EF0();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_100037ED8();
        if (!v11)
        {
          sub_100037EF0();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_100037ED8();
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
    sub_10000A950();
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
    sub_100037EF0();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_100037ED8();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_100036D44(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100004A2C(&qword_10005DC60);
    uint64_t v2 = (void *)sub_100046040();
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
  unint64_t v8 = &qword_10005C7F0;
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
          sub_10000A950();
          return;
        }
        unint64_t v12 = *(void *)(v36 + 8 * v11);
        int64_t v13 = v6 + 1;
        if (!v12)
        {
          sub_100037EE4();
          if (v14 == v15) {
            goto LABEL_35;
          }
          sub_100037EFC();
          if (!v12)
          {
            sub_100037EE4();
            if (v14 == v15) {
              goto LABEL_35;
            }
            sub_100037EFC();
            if (!v12)
            {
              sub_100037EE4();
              if (v14 == v15) {
                goto LABEL_35;
              }
              sub_100037EFC();
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
                    sub_100037EE4();
                    if (v14 == v15) {
                      goto LABEL_35;
                    }
                    sub_100037EFC();
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
      sub_100004A2C(v8);
      swift_dynamicCast();
      unint64_t v22 = sub_100008474(v21, v20);
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
    sub_100037100();
    sub_1000369A0(a2);
    id v7 = sub_100037290();
    sub_1000369A0(a4);
    Class isa = sub_100045BC0().super.isa;
    swift_bridgeObjectRelease();
    unint64_t v4 = (unint64_t)[v7 isEqualToDictionary:isa];
  }
  return v4;
}

unint64_t sub_100037100()
{
  unint64_t result = qword_10005DC18;
  if (!qword_10005DC18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005DC18);
  }
  return result;
}

uint64_t sub_100037140(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D796E6F6E417369 && a2 == 0xEB0000000073756FLL;
  if (v2 || (sub_1000460F0() & 1) != 0)
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
    char v7 = sub_1000460F0();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_100037248()
{
  return 2;
}

uint64_t sub_100037250(char a1)
{
  if (a1) {
    return 0x79616C7265766FLL;
  }
  else {
    return 0x6D796E6F6E417369;
  }
}

id sub_100037290()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_100045BC0().super.isa;
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithDictionary:isa];

  return v2;
}

unint64_t sub_100037318(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static MetricsContext.== infix(_:_:)(*a1, *((void *)a1 + 1), *a2, *((void *)a2 + 1));
}

uint64_t sub_100037334()
{
  return sub_100037250(*v0);
}

uint64_t sub_10003733C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100037140(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100037364()
{
  return sub_10000CCEC();
}

uint64_t sub_100037384@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100037248();
  *a1 = result;
  return result;
}

uint64_t sub_1000373AC(uint64_t a1)
{
  unint64_t v2 = sub_1000376DC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000373E8(uint64_t a1)
{
  unint64_t v2 = sub_1000376DC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MetricsContext.init(from:)(void *a1)
{
  uint64_t v3 = sub_100004A2C(&qword_10005DC20);
  sub_100009FF4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  sub_100005548(a1, v9);
  sub_1000376DC();
  sub_1000461B0();
  if (!v1)
  {
    LOBYTE(v22[0]) = 0;
    LOBYTE(v9) = sub_100046070();
    LOBYTE(v21) = 1;
    sub_1000274E4();
    sub_100046090();
    id v11 = v22[0];
    id v12 = v22[1];
    int64_t v13 = self;
    uint64_t v20 = (uint64_t)v11;
    Class isa = sub_100045100().super.isa;
    v22[0] = 0;
    id v15 = [v13 JSONObjectWithData:isa options:0 error:v22];

    if (v15)
    {
      id v16 = v22[0];
      sub_100045E90();
      sub_10002758C(v20, (unint64_t)v12);
      swift_unknownObjectRelease();
      uint64_t v17 = sub_100037EAC();
      v18(v17);
      sub_100004A2C(&qword_10005C4F0);
      swift_dynamicCast();
    }
    else
    {
      uint64_t v9 = (uint64_t)v22[0];
      sub_100045010();

      swift_willThrow();
      sub_10002758C(v20, (unint64_t)v12);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    }
  }
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)a1);
  return v9 & 1;
}

unint64_t sub_1000376DC()
{
  unint64_t result = qword_10005DC28;
  if (!qword_10005DC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC28);
  }
  return result;
}

uint64_t MetricsContext.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  sub_100004A2C(&qword_10005DC30);
  sub_100009FF4();
  __chkstk_darwin(v6);
  sub_100005548(a1, a1[3]);
  sub_1000376DC();
  sub_1000461C0();
  LOBYTE(v20[0]) = 0;
  sub_1000460B0();
  if (v3 || !a3) {
    goto LABEL_2;
  }
  unint64_t v10 = self;
  Class isa = sub_100045BC0().super.isa;
  v20[0] = 0;
  id v12 = [v10 dataWithJSONObject:isa options:0 error:v20];

  id v13 = v20[0];
  if (!v12)
  {
    uint64_t v19 = v13;
    sub_100045010();

    swift_willThrow();
LABEL_2:
    uint64_t v7 = sub_100037EC4();
    return v8(v7);
  }
  char v14 = (void *)sub_100045110();
  id v16 = v15;

  v20[0] = v14;
  v20[1] = v16;
  sub_1000275E4();
  sub_1000460D0();
  uint64_t v17 = sub_100037EC4();
  v18(v17);
  return sub_10002758C((uint64_t)v14, (unint64_t)v16);
}

uint64_t sub_100037964@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = MetricsContext.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_100037998(void *a1)
{
  return MetricsContext.encode(to:)(a1, *v1, *((void *)v1 + 1));
}

uint64_t MetricsContext.description.getter(char a1, uint64_t a2)
{
  sub_100045F90(45);
  sub_100004A2C(&qword_10005DC38);
  uint64_t v4 = sub_100045C80();
  swift_bridgeObjectRelease();
  v10._object = (void *)0x800000010004AE80;
  v10._countAndFlagsBits = 0xD000000000000016;
  sub_100045CA0(v10);
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
  sub_100045CA0(v5);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x65766F202020200ALL;
  v11._object = (void *)0xEE00203A79616C72;
  sub_100045CA0(v11);
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_100004A2C(&qword_10005DC40);
    v7._countAndFlagsBits = sub_100045C80();
    object = v7._object;
  }
  else
  {
    object = (void *)0xE900000000000064;
    v7._countAndFlagsBits = 0x656E696665646E75;
  }
  v7._object = object;
  sub_100045CA0(v7);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 8194601;
  v12._object = (void *)0xE300000000000000;
  sub_100045CA0(v12);
  return v4;
}

uint64_t sub_100037B3C()
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
        JUMPOUT(0x100037D80);
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

unint64_t sub_100037DBC()
{
  unint64_t result = qword_10005DC48;
  if (!qword_10005DC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC48);
  }
  return result;
}

unint64_t sub_100037E0C()
{
  unint64_t result = qword_10005DC50;
  if (!qword_10005DC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC50);
  }
  return result;
}

unint64_t sub_100037E5C()
{
  unint64_t result = qword_10005DC58;
  if (!qword_10005DC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DC58);
  }
  return result;
}

uint64_t sub_100037EAC()
{
  return v0;
}

uint64_t sub_100037EC4()
{
  return v0;
}

id sub_100037F08(uint64_t a1)
{
  NSString v2 = sub_100045C00();
  sub_100004A2C(&qword_10005C528);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100048940;
  *(void *)(inited + 32) = sub_100045C30();
  *(void *)(inited + 40) = v4;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0x726F727245534ALL;
  *(void *)(inited + 56) = 0xE700000000000000;
  *(void *)(inited + 80) = sub_100045C30();
  *(void *)(inited + 88) = v5;
  *(void *)(inited + 96) = sub_100045910();
  *(void *)(inited + 104) = v6;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x6E6D756C6F43;
  *(void *)(inited + 136) = 0xE600000000000000;
  uint64_t v7 = sub_1000458F0();
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
    sub_100005AE4(&v20, (_OWORD *)(inited + 144));
  }
  *(void *)(inited + 176) = 1701734732;
  *(void *)(inited + 184) = 0xE400000000000000;
  uint64_t v9 = sub_1000458E0();
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
    sub_100005AE4(&v20, (_OWORD *)(inited + 192));
  }
  *(void *)(inited + 224) = 0x5520656372756F53;
  *(void *)(inited + 232) = 0xEA00000000004C52;
  uint64_t v11 = sub_100045940();
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
  uint64_t v16 = sub_100045BE0();
  id v17 = sub_100038140((uint64_t)v2, 0, v16, v15);

  uint64_t v18 = sub_100045950();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);
  return v17;
}

id sub_100038140(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  Class isa = sub_100045BC0().super.isa;
  swift_bridgeObjectRelease();
  id v8 = [a4 initWithDomain:a1 code:a2 userInfo:isa];

  return v8;
}

uint64_t sub_1000381D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100038228(a1, a2, a3);
}

uint64_t sub_100038228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000457D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  *(void *)(v3 + qword_10005DC70) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  uint64_t v8 = sub_1000456C0();
  sub_10002E918();
  swift_retain();
  sub_1000456F0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a3, v5);
  uint64_t v9 = *(void **)(v8 + qword_10005DC70);
  *(void *)(v8 + qword_10005DC70) = v11[1];

  return v8;
}

void sub_100038384()
{
}

uint64_t ObjectGraph.deinit()
{
  uint64_t v0 = sub_100045710();

  return v0;
}

uint64_t ObjectGraph.__deallocating_deinit()
{
  uint64_t v0 = sub_100045710();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ObjectGraph()
{
  uint64_t result = qword_10005DC78;
  if (!qword_10005DC78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100038464()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000384B0()
{
  return type metadata accessor for ObjectGraph();
}

uint64_t sub_1000384B8(uint64_t a1, uint64_t a2, int a3)
{
  int v28 = a3;
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v4 = sub_1000453A0();
  sub_100009FF4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = sub_100045330();
  sub_100009FF4();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100038910();
  uint64_t v13 = sub_100045380();
  sub_100009FF4();
  uint64_t v15 = v14;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = &v27[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  uint64_t v21 = &v27[-v20];
  sub_100045340();
  unint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.required(_:);
  if ((v28 & 1) == 0) {
    unint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.ignore(_:);
  }
  (*(void (**)(unsigned char *, void, uint64_t))(v15 + 104))(v21, *v22, v13);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v15 + 16))(v19, v21, v13);
  uint64_t v34 = sub_1000453C0();
  int64_t v35 = &protocol witness table for JetPackManagedKeyProvider;
  sub_100005CD0(v33);
  sub_1000453B0();
  sub_100045300();
  sub_1000450B0();
  sub_100045390();
  uint64_t v34 = v4;
  int64_t v35 = &protocol witness table for JetPackFileStreamSource;
  unint64_t v23 = sub_100005CD0(v33);
  (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v6 + 16))(v23, v9, v4);
  uint64_t v24 = sub_100045310();
  void v32[3] = sub_1000339F4();
  uint64_t v32[4] = &protocol witness table for OS_dispatch_queue;
  v32[0] = v24;
  uint64_t v25 = sub_100045320();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v32);
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v31);
  (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v21, v13);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v33);
  return v25;
}

uint64_t sub_100038778@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100045360();
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

uint64_t sub_1000387DC()
{
  uint64_t v1 = sub_1000453E0();
  sub_100009FF4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100038910();
  uint64_t v5 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000450E0();
  sub_100005994((uint64_t)v7, 1, 1, v8);
  sub_1000453D0();
  sub_100045350();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return sub_10000A8F0((uint64_t)v7);
}

id sub_100038928()
{
  uint64_t v0 = (void *)sub_100045000();
  id v1 = objc_msgSend(v0, "ams_sanitizedForSecureCoding");

  return v1;
}

uint64_t sub_10003896C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v54 = a2;
  uint64_t v55 = (void *)a3;
  uint64_t v58 = a1;
  uint64_t v4 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v56 = v8;
  uint64_t v57 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000458B0();
  sub_100009FF4();
  uint64_t v52 = v10;
  uint64_t v53 = v9;
  __chkstk_darwin(v9);
  uint64_t v51 = v11;
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100045500();
  __chkstk_darwin(v13 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v14 = sub_100045550();
  sub_1000078C0(v14);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v60 = type metadata accessor for RemoteJavaScriptLoader();
  v59[0] = v3;
  swift_retain();
  id v15 = (id)AMSLogKey();
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_100045C30();
    uint64_t v19 = v18;

    sub_1000454F0();
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    sub_1000454E0(v64);
    sub_100005548(v59, v60);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v62[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v62);
    v65._countAndFlagsBits = 5972026;
    v65._object = (void *)0xE300000000000000;
    sub_1000454E0(v65);
    uint64_t MetatypeMetadata = &type metadata for String;
    v62[0] = v17;
    v62[1] = v19;
    sub_1000454D0();
    sub_100007820((uint64_t)v62);
    v21._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v66._countAndFlagsBits = 0;
    v66._object = (void *)0xE000000000000000;
    sub_1000454E0(v66);
    sub_100005548(v59, v60);
    uint64_t v22 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v62[0] = v22;
    sub_1000454D0();
    sub_100007820((uint64_t)v62);
    v21._countAndFlagsBits = 58;
  }
  v21._object = (void *)0xE100000000000000;
  sub_1000454E0(v21);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v59);
  sub_1000454B0();
  uint64_t v60 = v4;
  unint64_t v23 = sub_100005CD0(v59);
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v48 = v4;
  Swift::String v49 = v24;
  v24((char *)v23, v58, v4);
  sub_100045520();
  sub_100007820((uint64_t)v59);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v25 = v54;
  uint64_t v26 = v55;
  id v27 = sub_10002E7C4(v54, (uint64_t)v55);
  id v50 = v27;
  sub_100004A2C(&qword_10005D068);
  sub_100045060(v28);
  uint64_t v30 = v29;
  id v31 = [v27 requestWithMethod:2 URL:v29 parameters:0];

  sub_100045AD0();
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
  uint64_t v39 = sub_1000457A0();
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v59);
  id v40 = v26;
  sub_100045790();
  sub_100004A2C(&qword_10005CFD0);
  sub_1000310E8(&qword_10005DD68, &qword_10005CFD0);
  sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v59);
  unint64_t v41 = v57;
  uint64_t v42 = v48;
  v49(v57, v58, v48);
  unint64_t v43 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v44 + v43, v41, v42);
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v59);
  sub_100045790();
  sub_100004A2C(&qword_10005DD70);
  sub_1000310E8(&qword_10005DD78, &qword_10005DD70);
  sub_100045A90();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v59);
  uint64_t v60 = v39;
  uint64_t v61 = &protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v59);
  sub_100045790();
  uint64_t v45 = sub_100045A20();

  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v59);
  return v45;
}

uint64_t sub_100038F98(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  id v4 = sub_10002E854(a2, a3);
  sub_100004A2C(&qword_10005CFD0);
  id v5 = [v4 dataTaskPromiseWithRequest:v3];
  uint64_t v6 = sub_100045AD0();

  return v6;
}

uint64_t sub_10003900C(id *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005C838);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100045C70();
  __chkstk_darwin(v7 - 8);
  id v8 = [*a1 data];
  uint64_t v9 = sub_100045110();
  unint64_t v11 = v10;

  sub_100045C60();
  sub_100045C50();
  uint64_t v13 = v12;
  sub_10002758C(v9, v11);
  sub_100004A2C(&qword_10005DD70);
  if (v13)
  {
    uint64_t v14 = sub_1000450E0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v6, a2, v14);
    sub_100005994((uint64_t)v6, 0, 1, v14);
    void v17[3] = sub_100045B00();
    id v17[4] = (uint64_t)&protocol witness table for JSSource;
    sub_100005CD0(v17);
    sub_100045AF0();
    return sub_100045A60();
  }
  else
  {
    sub_1000394B8();
    swift_allocError();
    return sub_100045A50();
  }
}

uint64_t sub_1000391FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100045BE0();
  uint64_t result = sub_10000C7D4(a1, a2);
  *(void *)(a2 + 40) = v4;
  return result;
}

uint64_t type metadata accessor for RemoteJavaScriptLoader()
{
  return self;
}

uint64_t sub_100039290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10003896C(a1, a2, a3);
}

uint64_t sub_1000392B4()
{
  sub_1000458B0();
  sub_10000CB80();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v5 + 8, v4);
}

uint64_t sub_10003934C(uint64_t *a1)
{
  uint64_t v3 = sub_1000458B0();
  sub_1000078C0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100038F98(a1, v1 + v8, v9);
}

uint64_t sub_1000393C4()
{
  sub_1000450E0();
  sub_10000CB80();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100039448(id *a1)
{
  uint64_t v3 = *(void *)(sub_1000450E0() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10003900C(a1, v4);
}

unint64_t sub_1000394B8()
{
  unint64_t result = qword_10005DD80;
  if (!qword_10005DD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD80);
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
      JUMPOUT(0x1000395A0);
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

unint64_t sub_1000395DC()
{
  unint64_t result = qword_10005DD88;
  if (!qword_10005DD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005DD88);
  }
  return result;
}

uint64_t sub_100039628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 16) = a1;
  uint64_t v16 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
  sub_1000458B0();
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v17 + 32))(v16, a2);
  *(void *)(v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo) = a3;
  uint64_t v18 = (void *)(v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient);
  *uint64_t v18 = a4;
  v18[1] = a5;
  uint64_t v19 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext;
  *(unsigned char *)uint64_t v19 = a6;
  *(void *)(v19 + 8) = a7;
  uint64_t v20 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url;
  sub_1000450E0();
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v21 + 32))(v20, a8);
  return v8;
}

uint64_t sub_100039738()
{
  sub_1000398D4();
  sub_100039ACC(v6);
  sub_100039B70(v5);
  sub_100039CE8(v4, (uint64_t)v3);
  sub_100005548(v3, v3[3]);
  sub_100045800();
  v2[3] = sub_1000457A0();
  v2[4] = (uint64_t)&protocol witness table for SyncTaskScheduler;
  sub_100005CD0(v2);
  sub_100045790();
  sub_100045700();
  uint64_t v0 = sub_100045A20();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v2);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v4);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v5);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v6);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v3);
  return v0;
}

uint64_t sub_10003983C()
{
  type metadata accessor for ObjectGraph();
  swift_retain();
  uint64_t v0 = sub_100045720();
  swift_retain();
  sub_1000456D0();
  swift_release();
  return v0;
}

uint64_t sub_1000398A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003983C();
  *a1 = result;
  return result;
}

uint64_t sub_1000398D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  int v3 = (int *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)&v19[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)(v1 + 16);
  uint64_t v7 = v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
  uint64_t v8 = (char *)v5 + v3[7];
  sub_1000458B0();
  sub_10001CE80();
  (*(void (**)(char *, uint64_t))(v9 + 16))(v8, v7);
  unint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient + 8);
  *uint64_t v5 = v6;
  *(void *)((char *)v5 + v3[8]) = v10;
  uint64_t v13 = (void *)((char *)v5 + v3[9]);
  *uint64_t v13 = v11;
  v13[1] = v12;
  id v14 = v6;
  id v15 = v10;
  swift_bridgeObjectRetain();
  sub_100005E28();
  sub_10003A5DC((uint64_t)v5);
  sub_100045AB0();
  swift_release();
  sub_100005548(v21, v21[3]);
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext + 8);
  LOBYTE(v19[0]) = *(unsigned char *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext);
  v19[1] = v16;
  sub_100045830();
  sub_100005548(v20, v20[3]);
  sub_1000450E0();
  sub_100045830();
  sub_10003A638(v19);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v19);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v21);
}

uint64_t sub_100039ACC(void *a1)
{
  sub_100005548(a1, a1[3]);
  type metadata accessor for ServiceRequestHandler();
  swift_allocObject();
  sub_100045830();
  swift_release();
  sub_10003A638(v2);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v2);
}

uint64_t sub_100039B70(void *a1)
{
  sub_100005548(a1, a1[3]);
  type metadata accessor for URLSessionHandler();
  sub_100045820();
  sub_10003A638(v2);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v2);
}

void sub_100039BFC(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (objc_class *)type metadata accessor for URLSessionHandler();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17URLSessionHandler_objectGraph] = a1;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v9, "init");
  sub_100005A4C(0, (unint64_t *)&qword_10005C640);
  sub_100045700();
  sub_1000458C0();
  uint64_t v7 = v10;
  id v8 = v6;
  objc_msgSend(v7, "setDelegate:", v8, v9.receiver, v9.super_class);

  *a2 = v8;
}

id sub_100039CE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v30 = sub_1000458B0();
  sub_100009FF4();
  uint64_t v28 = v4;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v7);
  uint64_t v29 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v10 = v9;
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v13);
  id v14 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005548(a1, a1[3]);
  id result = [objc_allocWithZone((Class)JSVirtualMachine) init];
  if (result)
  {
    uint64_t v16 = result;
    sub_100005A4C(0, &qword_10005C938);
    v35[0] = v16;
    sub_100045830();

    sub_100005548(v38, v38[3]);
    sub_10003A674();
    v27[2] = v36;
    v27[3] = v37;
    v27[1] = sub_100005548(v35, v36);
    uint64_t v17 = v2 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
    v27[0] = *(void *)(v2 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo);
    uint64_t v18 = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v2 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url, v8);
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
    sub_100045810();
    swift_release();
    sub_100005548(v34, v34[3]);
    sub_10003A674();
    sub_100005548(v33, v33[3]);
    type metadata accessor for JSDataProvider();
    sub_100045820();
    sub_100005548(v32, v32[3]);
    sub_10003A674();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v32);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v33);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v34);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v35);
    return (id)_s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v38);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003A0BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  type metadata accessor for JSSourceLoader();
  swift_allocObject();
  uint64_t v8 = sub_10002DF2C(a2, a3, a4, a1);
  swift_release();
  return v8;
}

uint64_t sub_10003A138@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for JSDataProvider();
  swift_allocObject();
  uint64_t v3 = swift_retain();
  uint64_t result = sub_100014A94(v3);
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_10003A19C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
  sub_1000458B0();
  sub_10001CE80();
  (*(void (**)(uint64_t))(v2 + 8))(v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url;
  sub_1000450E0();
  sub_10001CE80();
  (*(void (**)(uint64_t))(v4 + 8))(v3);
  return v0;
}

uint64_t sub_10003A274()
{
  sub_10003A19C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10003A2CC()
{
  return type metadata accessor for ServiceBootstrap();
}

uint64_t type metadata accessor for ServiceBootstrap()
{
  uint64_t result = qword_10005DDE0;
  if (!qword_10005DDE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003A31C()
{
  uint64_t result = sub_1000458B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1000450E0();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_10003A410()
{
  uint64_t v1 = sub_1000450E0();
  sub_100009FF4();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1000458B0();
  sub_100009FF4();
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

uint64_t sub_10003A524(uint64_t a1)
{
  uint64_t v3 = sub_1000450E0();
  sub_1000078C0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1000458B0();
  sub_1000078C0(v8);
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  unint64_t v13 = (v5 + v7 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = *(void **)(v1 + ((*(void *)(v12 + 64) + v13 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_10003A0BC(a1, v1 + v5, v1 + v13, v14);
}

uint64_t sub_10003A5DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BaseBootstrap();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003A638(void *a1)
{
  sub_100005548(a1, v1);
  return sub_100045840();
}

uint64_t sub_10003A674()
{
  return sub_100045840();
}

void *sub_10003A690()
{
  type metadata accessor for ServiceConnection();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10003B5F4();
  qword_1000612A0 = v0;
  return result;
}

uint64_t sub_10003A6CC()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (!v1) {
    return 0;
  }
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10003AAF8;
  void aBlock[3] = &unk_100056E68;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = v1;
  swift_retain();
  swift_release();
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v2];
  _Block_release(v2);

  sub_100045E90();
  swift_unknownObjectRelease();
  sub_100004A2C(&qword_10005E058);
  if (swift_dynamicCast()) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t sub_10003A800(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100045500();
  __chkstk_darwin(v3 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v18 = type metadata accessor for ServiceConnection();
  v17[0] = a2;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = sub_100045C30();
    uint64_t v8 = v7;

    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v15);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_1000454E0(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v6;
    v15[1] = v8;
    sub_1000454D0();
    sub_100007820((uint64_t)v15);
    v10._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_1000454E0(v21);
    sub_100005548(v17, v18);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v11;
    sub_1000454D0();
    sub_100007820((uint64_t)v15);
    v10._countAndFlagsBits = 58;
  }
  v10._object = (void *)0xE100000000000000;
  sub_1000454E0(v10);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v17);
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v18 = v14;
  uint64_t v12 = sub_100005CD0(v17);
  (*(void (**)(uint64_t *))(*(void *)(v14 - 8) + 16))(v12);
  sub_100045520();
  sub_100007820((uint64_t)v17);
  sub_10003493C();
  return swift_bridgeObjectRelease();
}

void sub_10003AAF8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10003AB60(void **a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100045500();
  __chkstk_darwin(v4 - 8);
  sub_1000078D8();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v5 = sub_100045550();
  sub_1000078C0(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  id v27 = (void *)type metadata accessor for ServiceConnection();
  aBlock = (void **)v1;
  swift_retain();
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100045C30();
    uint64_t v10 = v9;

    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&aBlock, (uint64_t)v27);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v30);
    v32._countAndFlagsBits = 5972026;
    v32._object = (void *)0xE300000000000000;
    sub_1000454E0(v32);
    uint64_t MetatypeMetadata = &type metadata for String;
    v30[0] = v8;
    v30[1] = v10;
    sub_1000454D0();
    sub_100007820((uint64_t)v30);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    sub_1000078F0();
    sub_100005548(&aBlock, (uint64_t)v27);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = v13;
    sub_1000454D0();
    sub_100007820((uint64_t)v30);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_1000454E0(v12);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&aBlock);
  sub_1000454B0();
  id v27 = (void *)sub_10003BAE4();
  aBlock = a1;
  uint64_t v14 = a1;
  sub_100045520();
  sub_100007820((uint64_t)&aBlock);
  sub_100034904();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v14;
  unint64_t v16 = v14;

  uint64_t v17 = self;
  id v18 = [v17 interfaceWithProtocol:&OBJC_PROTOCOL____TtP34AppleMediaServicesUIDynamicService24ClientConnectionProtocol_];
  [v16 setRemoteObjectInterface:v18];
  id v19 = [v17 interfaceWithProtocol:&OBJC_PROTOCOL____TtP34AppleMediaServicesUIDynamicService25ServiceConnectionProtocol_];
  [v16 setExportedInterface:v19];
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  uint64_t v28 = sub_10003BB5C;
  uint64_t v29 = v20;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  id v26 = sub_10003B2A0;
  id v27 = &unk_100056E18;
  Swift::String v21 = _Block_copy(&aBlock);
  swift_release();
  [v16 setInvalidationHandler:v21];
  _Block_release(v21);
  uint64_t v28 = sub_10003BB7C;
  uint64_t v29 = v2;
  aBlock = _NSConcreteStackBlock;
  uint64_t v25 = 1107296256;
  id v26 = sub_10003B2A0;
  id v27 = &unk_100056E40;
  unint64_t v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v16 setInterruptionHandler:v22];
  _Block_release(v22);
  [v16 setExportedObject:*(void *)(v2 + 16)];
  [v16 resume];

  return 1;
}

void sub_10003AFDC()
{
  uint64_t v0 = sub_100045500();
  __chkstk_darwin(v0 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    uint64_t v15 = type metadata accessor for ServiceConnection();
    v14[0] = v2;
    swift_retain();
    id v3 = (id)AMSLogKey();
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = sub_100045C30();
      uint64_t v7 = v6;

      sub_1000454F0();
      v16._countAndFlagsBits = 0;
      v16._object = (void *)0xE000000000000000;
      sub_1000454E0(v16);
      sub_100005548(v14, v15);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v12[0] = DynamicType;
      sub_1000454D0();
      sub_100007820((uint64_t)v12);
      v17._countAndFlagsBits = 5972026;
      v17._object = (void *)0xE300000000000000;
      sub_1000454E0(v17);
      uint64_t MetatypeMetadata = &type metadata for String;
      v12[0] = v5;
      v12[1] = v7;
      sub_1000454D0();
      sub_100007820((uint64_t)v12);
      v9._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v18._countAndFlagsBits = 0;
      v18._object = (void *)0xE000000000000000;
      sub_1000454E0(v18);
      sub_100005548(v14, v15);
      uint64_t v10 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v12[0] = v10;
      sub_1000454D0();
      sub_100007820((uint64_t)v12);
      v9._countAndFlagsBits = 58;
    }
    v9._object = (void *)0xE100000000000000;
    sub_1000454E0(v9);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v14);
    sub_1000454B0();
    sub_100034904();
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void **)(v2 + 32);
    *(void *)(v2 + 32) = 0;
    swift_release();
  }
}

uint64_t sub_10003B2A0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10003B2E4(uint64_t a1)
{
  uint64_t v2 = sub_100045500();
  __chkstk_darwin(v2 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v15 = type metadata accessor for ServiceConnection();
  v14[0] = a1;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100045C30();
    uint64_t v7 = v6;

    sub_1000454F0();
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_1000454E0(v16);
    sub_100005548(v14, v15);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v12[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v12);
    v17._countAndFlagsBits = 5972026;
    v17._object = (void *)0xE300000000000000;
    sub_1000454E0(v17);
    uint64_t MetatypeMetadata = &type metadata for String;
    v12[0] = v5;
    v12[1] = v7;
    sub_1000454D0();
    sub_100007820((uint64_t)v12);
    v9._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v18._countAndFlagsBits = 0;
    v18._object = (void *)0xE000000000000000;
    sub_1000454E0(v18);
    sub_100005548(v14, v15);
    uint64_t v10 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v12[0] = v10;
    sub_1000454D0();
    sub_100007820((uint64_t)v12);
    v9._countAndFlagsBits = 58;
  }
  v9._object = (void *)0xE100000000000000;
  sub_1000454E0(v9);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v14);
  sub_1000454B0();
  sub_100034904();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003B56C()
{
  swift_release();
  swift_release();

  return v0;
}

uint64_t sub_10003B59C()
{
  sub_10003B56C();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
}

void *sub_10003B5F4()
{
  type metadata accessor for ServiceConnectionExportedObject();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions;
  uint64_t v3 = type metadata accessor for ServiceOptions();
  sub_100005994(v2, 1, 1, v3);
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v1;
  return v0;
}

id sub_10003B668()
{
  *(void *)&v0[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10003B6CC()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for XPCServiceConnection()) init];
  qword_1000612A8 = (uint64_t)result;
  return result;
}

uint64_t sub_10003B6FC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener) = a1;
  return _objc_release_x1();
}

void sub_10003B710()
{
  sub_100045500();
  __chkstk_darwin();
  sub_1000078D8();
  uint64_t v1 = OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener;
  if (!*(void *)&v0[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener])
  {
    sub_100004A2C((uint64_t *)&unk_10005E040);
    uint64_t v2 = sub_100045550();
    sub_1000078C0(v2);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    uint64_t v17 = type metadata accessor for XPCServiceConnection();
    v16[0] = v0;
    uint64_t v3 = v0;
    id v4 = (id)AMSLogKey();
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = sub_100045C30();
      uint64_t v8 = v7;

      sub_1000454F0();
      sub_1000078F0();
      sub_100005548(v16, v17);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v14[0] = DynamicType;
      sub_1000454D0();
      sub_100007820((uint64_t)v14);
      v18._countAndFlagsBits = 5972026;
      v18._object = (void *)0xE300000000000000;
      sub_1000454E0(v18);
      uint64_t MetatypeMetadata = &type metadata for String;
      v14[0] = v6;
      v14[1] = v8;
      sub_1000454D0();
      sub_100007820((uint64_t)v14);
      v10._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      sub_1000078F0();
      sub_100005548(v16, v17);
      uint64_t v11 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v14[0] = v11;
      sub_1000454D0();
      sub_100007820((uint64_t)v14);
      v10._countAndFlagsBits = 58;
    }
    v10._object = (void *)0xE100000000000000;
    sub_1000454E0(v10);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v16);
    sub_1000454B0();
    sub_100034904();
    swift_bridgeObjectRelease();
    id v12 = [self serviceListener];
    sub_10003B6FC((uint64_t)v12);
    uint64_t v13 = *(void **)&v0[v1];
    if (v13)
    {
      [v13 setDelegate:v3];
      uint64_t v13 = *(void **)&v0[v1];
    }
    objc_msgSend(v13, "resume", v14[0]);
  }
}

uint64_t sub_10003B9BC(uint64_t a1, void **a2)
{
  if (qword_10005C428 != -1) {
    swift_once();
  }
  sub_10003AB60(a2);
  return 1;
}

id sub_10003BA7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for XPCServiceConnection()
{
  return self;
}

unint64_t sub_10003BAE4()
{
  unint64_t result = qword_10005E050;
  if (!qword_10005E050)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005E050);
  }
  return result;
}

uint64_t sub_10003BB24()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003BB5C()
{
}

uint64_t sub_10003BB64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003BB74()
{
  return swift_release();
}

uint64_t sub_10003BB7C()
{
  return sub_10003B2E4(v0);
}

uint64_t sub_10003BB84(uint64_t a1)
{
  return sub_10003A800(a1, v1);
}

uint64_t sub_10003BB9C()
{
  uint64_t v0 = sub_100045500();
  __chkstk_darwin(v0 - 8);
  sub_1000420E4();
  sub_100044FA0();
  return v2;
}

uint64_t sub_10003BFA8()
{
  uint64_t v0 = sub_100045500();
  __chkstk_darwin(v0 - 8);
  sub_100042098();
  sub_100044FA0();
  return v2;
}

uint64_t sub_10003C3B4()
{
  return sub_100045AA0();
}

uint64_t sub_10003C3E8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_100045A80();

  return swift_errorRelease();
}

Swift::Int sub_10003C440()
{
  return sub_10000A990(*v0);
}

uint64_t sub_10003C45C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v57 = a3;
  uint64_t v58 = a2;
  uint64_t v3 = sub_100004A2C(&qword_10005D298);
  __chkstk_darwin(v3 - 8);
  sub_100017F10();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100045500();
  __chkstk_darwin(v7 - 8);
  sub_100017F10();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_100004A2C(&qword_10005E1A8);
  __chkstk_darwin(v11 - 8);
  sub_100017F10();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = type metadata accessor for JSServiceRequest();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v18 = __chkstk_darwin(v15);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v51 - v19;
  sub_100044FC0();
  swift_allocObject();
  sub_100044FB0();
  sub_100042130();
  sub_100044FA0();
  uint64_t v52 = v17;
  uint64_t v53 = v6;
  uint64_t v54 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = v10;
  swift_release();
  sub_100005994(v14, 0, 1, v15);
  uint64_t v58 = v20;
  sub_100042180();
  type metadata accessor for JSDataProvider();
  sub_100045700();
  sub_1000458C0();
  uint64_t v21 = v62[0];
  uint64_t v63 = &type metadata for DynamicUIFeatureFlags;
  Swift::String v64 = (void *)sub_1000421D4();
  LOBYTE(v15) = sub_100045180();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
  if (v15)
  {
    sub_100004A2C(&qword_10005C9E8);
    uint64_t v22 = sub_100045AE0();
    sub_100004A2C((uint64_t *)&unk_10005E040);
    uint64_t v23 = sub_100045550();
    sub_1000078C0(v23);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    uint64_t v63 = (ValueMetadata *)type metadata accessor for ServiceConnectionExportedObject();
    v62[0] = v56;
    swift_retain();
    id v24 = (id)AMSLogKey();
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = v21;
      uint64_t v27 = sub_100045C30();
      uint64_t v29 = v28;

      sub_100042950();
      sub_1000078F0();
      sub_100042918();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_1000429A4(MetatypeMetadata);
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      sub_1000145F0();
      uint64_t v61 = &type metadata for String;
      uint64_t v59 = v27;
      uint64_t v60 = v29;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      v31._countAndFlagsBits = 93;
    }
    else
    {
      uint64_t v26 = v21;
      sub_10004296C();
      sub_1000078F0();
      sub_100042918();
      uint64_t v40 = swift_getMetatypeMetadata();
      sub_1000429A4(v40);
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      v31._countAndFlagsBits = 58;
    }
    v31._object = (void *)0xE100000000000000;
    sub_1000454E0(v31);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
    sub_1000429CC();
    sub_100034904();
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_100045D10();
    uint64_t v42 = v53;
    sub_100005994(v53, 1, 1, v41);
    sub_100042294();
    unint64_t v43 = (v52 + ((*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v44 = (v43 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v45 = (void *)swift_allocObject();
    void v45[2] = 0;
    v45[3] = 0;
    v45[4] = v26;
    sub_100042180();
    uint64_t v46 = v56;
    *(void *)((char *)v45 + v43) = v57;
    *(void *)((char *)v45 + v44) = v46;
    *(void *)((char *)v45 + ((v44 + 15) & 0xFFFFFFFFFFFFFFF8)) = v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10003D3E0(v42, (uint64_t)&unk_10005E1C8, (uint64_t)v45);
    swift_release();
    swift_release();
    uint64_t v47 = (uint64_t)v58;
  }
  else
  {
    sub_100004A2C((uint64_t *)&unk_10005E040);
    uint64_t v32 = sub_100045550();
    sub_1000078C0(v32);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
    uint64_t v63 = (ValueMetadata *)type metadata accessor for ServiceConnectionExportedObject();
    v62[0] = v56;
    swift_retain();
    id v33 = (id)AMSLogKey();
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = sub_100045C30();
      uint64_t v37 = v36;

      sub_100042950();
      sub_1000078F0();
      sub_100005548(v62, (uint64_t)v63);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t v61 = (void *)swift_getMetatypeMetadata();
      uint64_t v59 = DynamicType;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      sub_1000145F0();
      uint64_t v61 = &type metadata for String;
      uint64_t v59 = v35;
      uint64_t v60 = v37;
      sub_1000454D0();
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      v39._countAndFlagsBits = 93;
    }
    else
    {
      sub_10004296C();
      sub_1000078F0();
      sub_100042918();
      uint64_t v48 = swift_getMetatypeMetadata();
      sub_1000429A4(v48);
      sub_10002A908((uint64_t)&v59, (uint64_t *)&unk_10005CC40);
      v39._countAndFlagsBits = 58;
    }
    Swift::String v49 = v58;
    v39._object = (void *)0xE100000000000000;
    sub_1000454E0(v39);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
    sub_1000429CC();
    sub_100034904();
    swift_bridgeObjectRelease();
    sub_100016C20(v49);
    uint64_t v63 = (ValueMetadata *)sub_1000457A0();
    Swift::String v64 = &protocol witness table for SyncTaskScheduler;
    sub_100005CD0(v62);
    swift_retain();
    sub_100045790();
    uint64_t v22 = sub_100045A20();
    swift_release();
    swift_release();
    swift_release();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v62);
    uint64_t v47 = (uint64_t)v49;
  }
  sub_10004223C(v47, (void (*)(void))type metadata accessor for JSServiceRequest);
  return v22;
}

uint64_t sub_10003CC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[46] = a7;
  v8[47] = a8;
  sub_100045500();
  v8[48] = swift_task_alloc();
  uint64_t v14 = (char *)&dword_10005CDD0 + dword_10005CDD0;
  uint64_t v12 = (void *)swift_task_alloc();
  v8[49] = v12;
  *uint64_t v12 = v8;
  v12[1] = sub_10003CD5C;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v14)(v8 + 43, a5, a6, a4);
}

uint64_t sub_10003CD5C()
{
  sub_1000429C0();
  sub_100042900();
  uint64_t v2 = *v1;
  sub_100042988();
  *uint64_t v3 = v2;
  *(void *)(v4 + 400) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v5 = sub_10003D0D0;
  }
  else {
    uint64_t v5 = sub_10003CE40;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10003CE40()
{
  uint64_t v1 = v0[46];
  unint64_t v15 = v0[44];
  uint64_t v16 = v0[43];
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v2 = sub_100045550();
  sub_1000078C0(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  v0[37] = type metadata accessor for ServiceConnectionExportedObject();
  v0[34] = v1;
  swift_retain();
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_100045C30();
    uint64_t v7 = v6;

    sub_100042950();
    sub_1000078F0();
    sub_100005548(v0 + 34, v0[37]);
    uint64_t DynamicType = swift_getDynamicType();
    v0[21] = swift_getMetatypeMetadata();
    v0[18] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)(v0 + 18), (uint64_t *)&unk_10005CC40);
    sub_1000145F0();
    v0[26] = v5;
    uint64_t v9 = (uint64_t)(v0 + 26);
    v0[29] = &type metadata for String;
    v0[27] = v7;
    sub_1000454D0();
    uint64_t v10 = 93;
  }
  else
  {
    sub_10004296C();
    sub_1000078F0();
    sub_100005548(v0 + 34, v0[37]);
    uint64_t v11 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v0[22] = v11;
    uint64_t v9 = (uint64_t)(v0 + 22);
    v0[25] = MetatypeMetadata;
    sub_1000454D0();
    uint64_t v10 = 58;
  }
  sub_10002A908(v9, (uint64_t *)&unk_10005CC40);
  v18._countAndFlagsBits = v10;
  v18._object = (void *)0xE100000000000000;
  sub_1000454E0(v18);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)(v0 + 34));
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  v0[41] = v16;
  v0[42] = v15;
  sub_100045AA0();
  sub_10002758C(v16, v15);
  swift_task_dealloc();
  sub_100042998();
  return v13();
}

uint64_t sub_10003D0D0()
{
  uint64_t v1 = v0[46];
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v2 = sub_100045550();
  sub_1000078C0(v2);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  uint64_t v3 = type metadata accessor for ServiceConnectionExportedObject();
  v0[6] = v1;
  v0[9] = v3;
  swift_retain();
  id v4 = (id)AMSLogKey();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_100045C30();
    uint64_t v8 = v7;

    sub_100042950();
    sub_1000078F0();
    sub_100005548(v0 + 6, v0[9]);
    uint64_t DynamicType = swift_getDynamicType();
    v0[5] = swift_getMetatypeMetadata();
    v0[2] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)(v0 + 2), (uint64_t *)&unk_10005CC40);
    sub_1000145F0();
    v0[30] = v6;
    uint64_t v10 = (uint64_t)(v0 + 30);
    v0[33] = &type metadata for String;
    v0[31] = v8;
    sub_1000454D0();
    uint64_t v11 = 93;
  }
  else
  {
    sub_10004296C();
    sub_1000078F0();
    sub_100005548(v0 + 6, v0[9]);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    v0[10] = v12;
    uint64_t v10 = (uint64_t)(v0 + 10);
    v0[13] = MetatypeMetadata;
    sub_1000454D0();
    uint64_t v11 = 58;
  }
  sub_10002A908(v10, (uint64_t *)&unk_10005CC40);
  v21._countAndFlagsBits = v11;
  v21._object = (void *)0xE100000000000000;
  sub_1000454E0(v21);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)(v0 + 6));
  sub_1000454B0();
  swift_getErrorValue();
  uint64_t v14 = v0[38];
  uint64_t v15 = v0[39];
  v0[17] = v15;
  uint64_t v16 = sub_100005CD0(v0 + 14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v16, v14, v15);
  sub_100045520();
  sub_10002A908((uint64_t)(v0 + 14), (uint64_t *)&unk_10005CC40);
  sub_10003493C();
  swift_bridgeObjectRelease();
  uint64_t v17 = (void *)sub_100045000();
  sub_100045A80();

  swift_errorRelease();
  swift_task_dealloc();
  sub_100042998();
  return v18();
}

uint64_t sub_10003D3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100045D10();
  if (sub_100005A24(a1, 1, v6) == 1)
  {
    sub_10002A908(a1, &qword_10005D298);
  }
  else
  {
    sub_100045D00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100045CF0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10003D550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  Swift::String v31 = a3;
  uint64_t v34 = a1;
  uint64_t v4 = sub_100045480();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004A2C(&qword_10005CDE0);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100045500();
  __chkstk_darwin(v10 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v40 = type metadata accessor for ServiceConnectionExportedObject();
  *(void *)&long long v39 = a2;
  swift_retain();
  id v11 = (id)AMSLogKey();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100045C30();
    uint64_t v15 = v14;

    sub_1000454F0();
    v41._countAndFlagsBits = 0;
    v41._object = (void *)0xE000000000000000;
    sub_1000454E0(v41);
    sub_100005548(&v39, v40);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    *(void *)&long long v37 = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
    v42._countAndFlagsBits = 5972026;
    v42._object = (void *)0xE300000000000000;
    sub_1000454E0(v42);
    uint64_t MetatypeMetadata = &type metadata for String;
    *(void *)&long long v37 = v13;
    *((void *)&v37 + 1) = v15;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
    v17._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_1000454E0(v43);
    sub_100005548(&v39, v40);
    uint64_t v18 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    *(void *)&long long v37 = v18;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
    v17._countAndFlagsBits = 58;
  }
  v17._object = (void *)0xE100000000000000;
  sub_1000454E0(v17);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v39);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_1000454A0();
  uint64_t v19 = v33;
  sub_1000455E0();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v19);
  sub_100045470();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
  if (MetatypeMetadata)
  {
    sub_100005AE4(&v37, &v39);
    uint64_t v20 = self;
    sub_100005548(&v39, v40);
    uint64_t v21 = sub_1000460E0();
    *(void *)&long long v37 = 0;
    id v22 = [v20 dataWithJSONObject:v21 options:0 error:&v37];
    swift_unknownObjectRelease();
    id v23 = (id)v37;
    if (v22)
    {
      uint64_t v24 = sub_100045110();
      uint64_t v26 = v25;

      uint64_t result = _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v39);
      uint64_t v28 = v31;
      *Swift::String v31 = v24;
      v28[1] = v26;
    }
    else
    {
      uint64_t v30 = v23;
      sub_100045010();

      swift_willThrow();
      return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v39);
    }
  }
  else
  {
    sub_10002A908((uint64_t)&v37, (uint64_t *)&unk_10005CC40);
    sub_1000419DC();
    swift_allocError();
    *uint64_t v29 = 2;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_10003DA8C()
{
  swift_release();
  sub_10002A908(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions, &qword_10005E180);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10003DB00()
{
  return type metadata accessor for ServiceConnectionExportedObject();
}

uint64_t type metadata accessor for ServiceConnectionExportedObject()
{
  uint64_t result = qword_10005E090;
  if (!qword_10005E090) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10003DB50()
{
  sub_10003DBEC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10003DBEC()
{
  if (!qword_10005E0A0)
  {
    type metadata accessor for ServiceOptions();
    unint64_t v0 = sub_100045E70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10005E0A0);
    }
  }
}

void sub_10003DC44(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11)
{
  uint64_t v161 = a8;
  uint64_t v160 = a7;
  uint64_t v170 = a5;
  id v171 = a6;
  uint64_t v152 = (void *)a4;
  unint64_t v155 = a3;
  uint64_t v154 = a2;
  id v151 = a1;
  uint64_t v150 = sub_1000450E0();
  uint64_t v11 = *(void *)(v150 - 8);
  __chkstk_darwin(v150);
  uint64_t v13 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000458B0();
  __chkstk_darwin(v14 - 8);
  uint64_t v144 = (char *)&v140 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100004A2C(&qword_10005E178);
  __chkstk_darwin(v149);
  uint64_t v157 = (uint64_t)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100004A2C(&qword_10005E180);
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
  uint64_t v28 = sub_100045500();
  __chkstk_darwin(v28 - 8);
  uint64_t v168 = swift_allocObject();
  *(void *)(v168 + 16) = a11;
  uint64_t v29 = sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v30 = *(void *)(sub_100045550() - 8);
  uint64_t v31 = *(unsigned __int8 *)(v30 + 80);
  uint64_t v32 = (v31 + 32) & ~v31;
  uint64_t v172 = *(void *)(v30 + 72);
  uint64_t v33 = v32 + 2 * v172;
  uint64_t v165 = v29;
  uint64_t v163 = v31 | 7;
  uint64_t v34 = swift_allocObject();
  long long v164 = xmmword_100047420;
  *(_OWORD *)(v34 + 16) = xmmword_100047420;
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
    uint64_t v37 = sub_100045C30();
    uint64_t v39 = v38;

    sub_1000454F0();
    v179._countAndFlagsBits = 0;
    v179._object = (void *)0xE000000000000000;
    sub_1000454E0(v179);
    sub_100005548(&v173, v174);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v180._countAndFlagsBits = 5972026;
    v180._object = (void *)0xE300000000000000;
    sub_1000454E0(v180);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v176 = v37;
    uint64_t v177 = v39;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v41._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v181._countAndFlagsBits = 0;
    v181._object = (void *)0xE000000000000000;
    sub_1000454E0(v181);
    sub_100005548(&v173, v174);
    uint64_t v42 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v42;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v41._countAndFlagsBits = 58;
  }
  v41._object = (void *)0xE100000000000000;
  sub_1000454E0(v41);
  sub_100045510();
  uint64_t v43 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
  uint64_t v44 = v43;
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  sub_100044FC0();
  swift_allocObject();
  sub_100044FB0();
  uint64_t v45 = sub_10003BB9C();
  uint64_t v47 = v46;
  swift_release();
  if (v47)
  {
    swift_allocObject();
    sub_100044FB0();
    uint64_t v48 = sub_10003BFA8();
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
        uint64_t v53 = sub_100045C30();
        uint64_t v55 = v54;

        sub_1000454F0();
        v182._countAndFlagsBits = 0;
        v182._object = (void *)0xE000000000000000;
        sub_1000454E0(v182);
        sub_100005548(&v173, v174);
        uint64_t v56 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v56;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v183._countAndFlagsBits = 5972026;
        v183._object = (void *)0xE300000000000000;
        sub_1000454E0(v183);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v176 = v53;
        uint64_t v177 = v55;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v57._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v187._countAndFlagsBits = 0;
        v187._object = (void *)0xE000000000000000;
        sub_1000454E0(v187);
        sub_100005548(&v173, v174);
        uint64_t v90 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v90;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v57._countAndFlagsBits = 58;
      }
      v57._object = (void *)0xE100000000000000;
      sub_1000454E0(v57);
      sub_100045510();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
      sub_1000454B0();
      sub_10003493C();
      swift_bridgeObjectRelease();
      sub_100041E54();
      swift_allocError();
      char v92 = 1;
LABEL_25:
      *Swift::String v91 = v92;
      uint64_t v106 = (void *)sub_100045000();
      uint64_t v107 = v169;
      v169[2](v169, v106);

      swift_errorRelease();
      swift_release();
      Swift::String v89 = v107;
      goto LABEL_38;
    }
    sub_100005A4C(0, &qword_10005E190);
    uint64_t v65 = v154;
    unint64_t v66 = v155;
    sub_10000C838(v154, v155);
    id v171 = sub_10003F23C(v65, v66);
    if (!v171)
    {
      swift_bridgeObjectRelease();
      sub_100041EA0(v48, v50);
      *(_OWORD *)(swift_allocObject() + 16) = v164;
      uint64_t v174 = v166;
      uint64_t v173 = a10;
      swift_retain();
      id v93 = (id)AMSLogKey();
      if (v93)
      {
        Swift::String v94 = v93;
        uint64_t v95 = sub_100045C30();
        uint64_t v97 = v96;

        sub_1000454F0();
        v188._countAndFlagsBits = 0;
        v188._object = (void *)0xE000000000000000;
        sub_1000454E0(v188);
        sub_100005548(&v173, v174);
        uint64_t v98 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v98;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v189._countAndFlagsBits = 5972026;
        v189._object = (void *)0xE300000000000000;
        sub_1000454E0(v189);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v176 = v95;
        uint64_t v177 = v97;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v99._countAndFlagsBits = 93;
      }
      else
      {
        sub_1000454F0();
        v190._countAndFlagsBits = 0;
        v190._object = (void *)0xE000000000000000;
        sub_1000454E0(v190);
        sub_100005548(&v173, v174);
        uint64_t v105 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v176 = v105;
        sub_1000454D0();
        sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
        v99._countAndFlagsBits = 58;
      }
      v99._object = (void *)0xE100000000000000;
      sub_1000454E0(v99);
      sub_100045510();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
      sub_1000454B0();
      sub_10003493C();
      swift_bridgeObjectRelease();
      sub_100041E54();
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
    sub_100042294();
    sub_100005994(v76, 0, 1, v68);
    uint64_t v77 = a10 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions;
    swift_beginAccess();
    uint64_t v78 = v157;
    uint64_t v79 = v157 + *(int *)(v149 + 48);
    sub_100041EB4(v76, v157);
    unint64_t v155 = v77;
    sub_100041EB4(v77, v79);
    if (sub_100005A24(v78, 1, v75) == 1)
    {
      id v80 = v72;
      id v81 = v171;
      id v82 = v74;
      uint64_t v83 = v170;
      sub_100041F1C(v170, v50);
      sub_10002A908(v76, &qword_10005E180);
      if (sub_100005A24(v79, 1, v75) == 1)
      {
        sub_10002A908(v157, &qword_10005E180);
        uint64_t v84 = v161;
LABEL_31:
        if (*(void *)(a10 + 16))
        {
          swift_bridgeObjectRelease();
          sub_100041EA0(v83, v50);
        }
        else
        {
          uint64_t v124 = (uint64_t)v151;
          id v125 = v151;
          id v126 = v171;
          uint64_t v127 = (uint64_t)v144;
          sub_100045880();
          uint64_t v128 = (uint64_t)v145;
          v140(v145, v141, v150);
          type metadata accessor for ServiceBootstrap();
          swift_allocObject();
          uint64_t v129 = v124;
          Swift::String v130 = v152;
          sub_100039628(v129, v127, (uint64_t)v152, v154, v84, v142, v50, v128);
          id v131 = v130;
          uint64_t v132 = sub_100039738();
          swift_release();
          *(void *)(a10 + 16) = v132;
          swift_release();
        }
        if (*(void *)(a10 + 16))
        {
          uint64_t v133 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
          swift_retain();
          uint64_t v134 = (void *)sub_100045D80();
          sub_100041CE8((uint64_t)sub_100038928, 0, v134);
          swift_release();

          uint64_t v135 = (void *)swift_allocObject();
          v135[2] = a10;
          v135[3] = sub_1000428E4;
          uint64_t v136 = v168;
          v135[4] = v168;
          uint64_t v137 = swift_allocObject();
          swift_weakInit();
          Swift::String v138 = (void *)swift_allocObject();
          v138[2] = v137;
          v138[3] = sub_1000428E4;
          v138[4] = v136;
          swift_retain_n();
          swift_retain();
          swift_retain();
          uint64_t v139 = sub_100045D80();
          uint64_t v174 = v133;
          uint64_t v175 = &protocol witness table for OS_dispatch_queue;
          uint64_t v173 = v139;
          sub_100045A40();

          swift_release();
          swift_release();
          swift_release();
          _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
          sub_10004223C(v159, (void (*)(void))type metadata accessor for ServiceOptions);
          swift_release();
          swift_release();
        }
        else
        {
          sub_10004223C(v159, (void (*)(void))type metadata accessor for ServiceOptions);
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
      sub_100041EB4(v78, (uint64_t)v146);
      if (sub_100005A24(v79, 1, v75) != 1)
      {
        uint64_t v108 = v143;
        sub_100042180();
        id v109 = v72;
        id v110 = v171;
        id v111 = v100;
        sub_100041F1C(v83, v50);
        char v112 = sub_1000430C8(v101, v108);
        sub_10004223C((uint64_t)v108, (void (*)(void))type metadata accessor for ServiceOptions);
        sub_10002A908(v153, &qword_10005E180);
        sub_10004223C((uint64_t)v101, (void (*)(void))type metadata accessor for ServiceOptions);
        sub_10002A908(v78, &qword_10005E180);
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
          uint64_t v170 = sub_100045C30();
          uint64_t v117 = v116;

          sub_1000454F0();
          v191._countAndFlagsBits = 0;
          v191._object = (void *)0xE000000000000000;
          sub_1000454E0(v191);
          sub_100005548(&v173, v174);
          uint64_t v118 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v176 = v118;
          sub_1000454D0();
          sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
          v192._countAndFlagsBits = 5972026;
          v192._object = (void *)0xE300000000000000;
          sub_1000454E0(v192);
          uint64_t MetatypeMetadata = &type metadata for String;
          uint64_t v176 = v170;
          uint64_t v177 = v117;
          sub_1000454D0();
          sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
          v119._countAndFlagsBits = 93;
        }
        else
        {
          uint64_t v115 = v83;
          sub_1000454F0();
          v193._countAndFlagsBits = 0;
          v193._object = (void *)0xE000000000000000;
          sub_1000454E0(v193);
          sub_100005548(&v173, v174);
          uint64_t v120 = swift_getDynamicType();
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
          uint64_t v176 = v120;
          sub_1000454D0();
          sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
          v119._countAndFlagsBits = 58;
        }
        uint64_t v121 = (uint64_t)v147;
        v119._object = (void *)0xE100000000000000;
        sub_1000454E0(v119);
        sub_100045510();
        _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
        sub_1000454B0();
        sub_100034904();
        swift_bridgeObjectRelease();
        uint64_t v122 = (uint64_t)v148;
        sub_100042294();
        sub_100005994(v122, 0, 1, v156);
        sub_100041F30(v122, v121);
        uint64_t v123 = v155;
        swift_beginAccess();
        sub_100041F98(v121, v123);
        swift_endAccess();
        *(void *)(a10 + 16) = 0;
        swift_release();
        uint64_t v83 = v115;
        goto LABEL_31;
      }
      id v102 = v72;
      id v103 = v171;
      id v104 = v100;
      sub_100041F1C(v83, v50);
      sub_10002A908(v153, &qword_10005E180);
      sub_10004223C((uint64_t)v101, (void (*)(void))type metadata accessor for ServiceOptions);
    }
    sub_10002A908(v157, &qword_10005E178);
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
    uint64_t v60 = sub_100045C30();
    uint64_t v62 = v61;

    sub_1000454F0();
    v184._countAndFlagsBits = 0;
    v184._object = (void *)0xE000000000000000;
    sub_1000454E0(v184);
    sub_100005548(&v173, v174);
    uint64_t v63 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v63;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v185._countAndFlagsBits = 5972026;
    v185._object = (void *)0xE300000000000000;
    sub_1000454E0(v185);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v176 = v60;
    uint64_t v177 = v62;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v64._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v186._countAndFlagsBits = 0;
    v186._object = (void *)0xE000000000000000;
    sub_1000454E0(v186);
    sub_100005548(&v173, v174);
    uint64_t v85 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v176 = v85;
    sub_1000454D0();
    sub_10002A908((uint64_t)&v176, (uint64_t *)&unk_10005CC40);
    v64._countAndFlagsBits = 58;
  }
  uint64_t v86 = v169;
  v64._object = (void *)0xE100000000000000;
  sub_1000454E0(v64);
  sub_100045510();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)&v173);
  sub_1000454B0();
  sub_10003493C();
  swift_bridgeObjectRelease();
  sub_100041E54();
  swift_allocError();
  *Swift::String v87 = 0;
  Swift::String v88 = (void *)sub_100045000();
  v86[2](v86, v88);

  swift_errorRelease();
  swift_release();
  Swift::String v89 = v86;
LABEL_38:
  _Block_release(v89);
}

id sub_10003F23C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = sub_100045100().super.isa;
  id v6 = [v4 initWithData:isa];
  sub_10002758C(a1, a2);

  return v6;
}

uint64_t sub_10003F2B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_100045500();
  __chkstk_darwin(v5 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v18 = type metadata accessor for ServiceConnectionExportedObject();
  v17[0] = a2;
  swift_retain();
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = sub_100045C30();
    uint64_t v10 = v9;

    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v17, v18);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v20._countAndFlagsBits = 5972026;
    v20._object = (void *)0xE300000000000000;
    sub_1000454E0(v20);
    uint64_t MetatypeMetadata = &type metadata for String;
    v15[0] = v8;
    v15[1] = v10;
    sub_1000454D0();
    sub_10002A908((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v12._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    sub_1000454E0(v21);
    sub_100005548(v17, v18);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v15[0] = v13;
    sub_1000454D0();
    sub_10002A908((uint64_t)v15, (uint64_t *)&unk_10005CC40);
    v12._countAndFlagsBits = 58;
  }
  v12._object = (void *)0xE100000000000000;
  sub_1000454E0(v12);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v17);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  return a3(0);
}

uint64_t sub_10003F578(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = sub_100045500();
  __chkstk_darwin(v5 - 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    sub_100004A2C((uint64_t *)&unk_10005E040);
    sub_100045550();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
    uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
    v20[0] = v7;
    swift_retain();
    id v8 = (id)AMSLogKey();
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = sub_100045C30();
      uint64_t v12 = v11;

      sub_1000454F0();
      v22._countAndFlagsBits = 0;
      v22._object = (void *)0xE000000000000000;
      sub_1000454E0(v22);
      sub_100005548(v20, v21);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = DynamicType;
      sub_1000454D0();
      sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
      v23._countAndFlagsBits = 5972026;
      v23._object = (void *)0xE300000000000000;
      sub_1000454E0(v23);
      uint64_t MetatypeMetadata = &type metadata for String;
      v18[0] = v10;
      v18[1] = v12;
      sub_1000454D0();
      sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
      v14._countAndFlagsBits = 93;
    }
    else
    {
      sub_1000454F0();
      v24._countAndFlagsBits = 0;
      v24._object = (void *)0xE000000000000000;
      sub_1000454E0(v24);
      sub_100005548(v20, v21);
      uint64_t v15 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v18[0] = v15;
      sub_1000454D0();
      sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
      v14._countAndFlagsBits = 58;
    }
    v14._object = (void *)0xE100000000000000;
    sub_1000454E0(v14);
    sub_100045510();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
    sub_1000454B0();
    swift_getErrorValue();
    uint64_t v21 = v17;
    uint64_t v16 = sub_100005CD0(v20);
    (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v16);
    sub_100045520();
    sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
    sub_10003493C();
    swift_bridgeObjectRelease();
    *(void *)(v7 + 16) = 0;
    swift_release();
    a3(a1);
    return swift_release();
  }
  return result;
}

void sub_10003FB00(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_100045000();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_10003FB64(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  uint64_t v7 = sub_100045500();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v28 = type metadata accessor for ServiceConnectionExportedObject();
  v27[0] = a3;
  _Block_copy(a4);
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v25 = a1;
    uint64_t v11 = sub_100045C30();
    uint64_t v13 = v12;

    sub_1000454F0();
    v32._countAndFlagsBits = 0;
    v32._object = (void *)0xE000000000000000;
    sub_1000454E0(v32);
    sub_100005548(v27, v28);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v30, (uint64_t *)&unk_10005CC40);
    v33._countAndFlagsBits = 5972026;
    v33._object = (void *)0xE300000000000000;
    sub_1000454E0(v33);
    uint64_t MetatypeMetadata = &type metadata for String;
    v30[0] = v11;
    v30[1] = v13;
    a1 = v25;
    sub_1000454D0();
    sub_10002A908((uint64_t)v30, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v34._countAndFlagsBits = 0;
    v34._object = (void *)0xE000000000000000;
    sub_1000454E0(v34);
    sub_100005548(v27, v28);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v30[0] = v16;
    sub_1000454D0();
    sub_10002A908((uint64_t)v30, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_1000454E0(v15);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v27);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  if (*(void *)(a3 + 16))
  {
    uint64_t v17 = (void *)swift_allocObject();
    v17[2] = a3;
    void v17[3] = a1;
    id v17[4] = a2;
    uint64_t v28 = sub_1000457A0();
    uint64_t v29 = &protocol witness table for SyncTaskScheduler;
    sub_100005CD0(v27);
    swift_retain();
    swift_retain();
    sub_10000C838(a1, a2);
    sub_100045790();
    sub_100004A2C(&qword_10005C9E8);
    sub_100041C84();
    sub_100045A90();
    swift_release();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v27);
    uint64_t v18 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
    Swift::String v19 = (void *)sub_100045D80();
    sub_100041CE8((uint64_t)sub_100038928, 0, v19);

    Swift::String v20 = (void *)swift_allocObject();
    id v20[2] = a3;
    uint64_t v20[3] = sub_100041C30;
    void v20[4] = v8;
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = a3;
    void v21[3] = sub_100041C30;
    void v21[4] = v8;
    swift_retain_n();
    swift_retain_n();
    uint64_t v22 = sub_100045D80();
    uint64_t v28 = v18;
    uint64_t v29 = &protocol witness table for OS_dispatch_queue;
    v27[0] = v22;
    sub_100045A40();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v27);
  }
  else
  {
    sub_1000419DC();
    swift_allocError();
    *Swift::String v23 = 0;
    Swift::String v24 = (void *)sub_100045000();
    ((void (**)(void, void, void *))a4)[2](a4, 0, v24);

    swift_errorRelease();
  }
  swift_release();
  _Block_release(a4);
}

uint64_t sub_1000400F4(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_10003C45C(a3, a4, *a1);
}

uint64_t sub_100040128(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void, void, void))
{
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v22 = type metadata accessor for ServiceConnectionExportedObject();
  v21[0] = a2;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100045C30();
    uint64_t v12 = a3;
    uint64_t v14 = v13;

    sub_1000454F0();
    v23._countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    sub_1000454E0(v23);
    sub_100005548(v21, v22);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v19[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v19, (uint64_t *)&unk_10005CC40);
    v24._countAndFlagsBits = 5972026;
    v24._object = (void *)0xE300000000000000;
    sub_1000454E0(v24);
    uint64_t MetatypeMetadata = &type metadata for String;
    v19[0] = v11;
    v19[1] = v14;
    a3 = v12;
    sub_1000454D0();
    sub_10002A908((uint64_t)v19, (uint64_t *)&unk_10005CC40);
    v16._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v25._countAndFlagsBits = 0;
    v25._object = (void *)0xE000000000000000;
    sub_1000454E0(v25);
    sub_100005548(v21, v22);
    uint64_t v17 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v19[0] = v17;
    sub_1000454D0();
    sub_10002A908((uint64_t)v19, (uint64_t *)&unk_10005CC40);
    v16._countAndFlagsBits = 58;
  }
  v16._object = (void *)0xE100000000000000;
  sub_1000454E0(v16);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v21);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  return a3(v7, v8, 0);
}

uint64_t sub_100040424(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, unint64_t, uint64_t))
{
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
  v20[0] = a2;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_1000454E0(v22);
    sub_100005548(v20, v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_1000454E0(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v9;
    v18[1] = v11;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_1000454E0(v24);
    sub_100005548(v20, v21);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v14;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
  sub_1000454F0();
  v25._object = (void *)0x800000010004B3E0;
  v25._countAndFlagsBits = 0xD000000000000015;
  sub_1000454E0(v25);
  swift_getErrorValue();
  uint64_t v21 = v17;
  Swift::String v15 = sub_100005CD0(v20);
  (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v15);
  sub_1000454D0();
  sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_1000454E0(v26);
  sub_100045510();
  sub_100034904();
  swift_bridgeObjectRelease();
  return a3(0, 0xF000000000000000, a1);
}

void sub_100040830(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 == 15)
  {
    Class isa = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sub_100045000();
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = sub_100045100().super.isa;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_1000408C8(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100045500();
  __chkstk_darwin(v4 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v16 = type metadata accessor for ServiceConnectionExportedObject();
  v15[0] = a1;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100045C30();
    uint64_t v9 = v8;

    sub_1000454F0();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_1000454E0(v17);
    sub_100005548(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_1000454E0(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v7;
    v13[1] = v9;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v15, v16);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v12;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_1000454E0(v11);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v15);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  a2[2](a2, 0);
  _Block_release(a2);
}

void sub_100040BAC(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = sub_100045500();
  __chkstk_darwin(v4 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v16 = type metadata accessor for ServiceConnectionExportedObject();
  v15[0] = a1;
  swift_retain();
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_100045C30();
    uint64_t v9 = v8;

    sub_1000454F0();
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    sub_1000454E0(v17);
    sub_100005548(v15, v16);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v18._countAndFlagsBits = 5972026;
    v18._object = (void *)0xE300000000000000;
    sub_1000454E0(v18);
    uint64_t MetatypeMetadata = &type metadata for String;
    v13[0] = v7;
    v13[1] = v9;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_1000454E0(v19);
    sub_100005548(v15, v16);
    uint64_t v12 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v13[0] = v12;
    sub_1000454D0();
    sub_10002A908((uint64_t)v13, (uint64_t *)&unk_10005CC40);
    v11._countAndFlagsBits = 58;
  }
  v11._object = (void *)0xE100000000000000;
  sub_1000454E0(v11);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v15);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = 0;
  swift_release();
  a2[2](a2, 0);
  _Block_release(a2);
}

uint64_t sub_100040E9C(int a1, int a2, void *aBlock, void (*a4)(uint64_t, void *))
{
  id v5 = _Block_copy(aBlock);
  _Block_copy(v5);
  uint64_t v6 = swift_retain();
  a4(v6, v5);
  _Block_release(v5);

  return swift_release();
}

void sub_100040F08(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  if (*(void *)(a2 + 16))
  {
    uint64_t v7 = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
    _Block_copy(a3);
    swift_retain();
    uint64_t v8 = (void *)sub_100045D80();
    sub_100041CE8((uint64_t)sub_100038928, 0, v8);

    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = a1;
    v9[3] = a2;
    void v9[4] = sub_1000419D4;
    v9[5] = v6;
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = a2;
    v10[3] = sub_1000419D4;
    v10[4] = v6;
    id v11 = a1;
    swift_retain_n();
    swift_retain_n();
    void v14[3] = v7;
    void v14[4] = &protocol witness table for OS_dispatch_queue;
    v14[0] = sub_100045D80();
    sub_100045A40();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v14);
    swift_release();
    _Block_release(a3);
  }
  else
  {
    sub_1000419DC();
    swift_allocError();
    *uint64_t v12 = 0;
    _Block_copy(a3);
    Swift::String v13 = (void *)sub_100045000();
    ((void (**)(void, void *))a3)[2](a3, v13);

    swift_errorRelease();
    swift_release();
    _Block_release(a3);
  }
}

void sub_100041198(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  type metadata accessor for DynamicAccountsStore();
  sub_100045700();
  sub_1000458C0();
  uint64_t v7 = DynamicAccountsStore.account.getter();
  id v8 = objc_msgSend(v7, "ams_DSID");

  id v18 = a2;
  DynamicAccountsStore.account.setter(a2);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000473B0;
  Swift::String v23 = (void *)type metadata accessor for ServiceConnectionExportedObject();
  v22[0] = a3;
  swift_retain();
  id v9 = (id)AMSLogKey();
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100045C30();
    uint64_t v13 = v12;

    sub_1000454F0();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_1000454E0(v24);
    sub_100005548(v22, (uint64_t)v23);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
    v25._countAndFlagsBits = 5972026;
    v25._object = (void *)0xE300000000000000;
    sub_1000454E0(v25);
    uint64_t MetatypeMetadata = &type metadata for String;
    v20[0] = v11;
    v20[1] = v13;
    sub_1000454D0();
    sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v26._countAndFlagsBits = 0;
    v26._object = (void *)0xE000000000000000;
    sub_1000454E0(v26);
    sub_100005548(v22, (uint64_t)v23);
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = v16;
    sub_1000454D0();
    sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
    v15._countAndFlagsBits = 58;
  }
  v15._object = (void *)0xE100000000000000;
  sub_1000454E0(v15);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v22);
  sub_1000454B0();
  v22[0] = 0x203A646C6FLL;
  v22[1] = 0xE500000000000000;
  v20[0] = v8;
  id v17 = v8;
  sub_100004A2C(&qword_10005E168);
  v27._countAndFlagsBits = sub_100045C80();
  sub_100045CA0(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 0x203A77656E20;
  v28._object = (void *)0xE600000000000000;
  sub_100045CA0(v28);
  v20[0] = objc_msgSend(v18, "ams_DSID");
  v29._countAndFlagsBits = sub_100045C80();
  sub_100045CA0(v29);
  swift_bridgeObjectRelease();
  Swift::String v23 = &type metadata for String;
  sub_100045540();
  sub_10002A908((uint64_t)v22, (uint64_t *)&unk_10005CC40);
  sub_100034904();
  swift_bridgeObjectRelease();
  a4(0);
  swift_release();
}

uint64_t sub_1000415C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = sub_100045500();
  __chkstk_darwin(v6 - 8);
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v21 = type metadata accessor for ServiceConnectionExportedObject();
  v20[0] = a2;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = sub_100045C30();
    uint64_t v11 = v10;

    sub_1000454F0();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    sub_1000454E0(v22);
    sub_100005548(v20, v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v23._countAndFlagsBits = 5972026;
    v23._object = (void *)0xE300000000000000;
    sub_1000454E0(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v9;
    v18[1] = v11;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v24._countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    sub_1000454E0(v24);
    sub_100005548(v20, v21);
    uint64_t v14 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v14;
    sub_1000454D0();
    sub_10002A908((uint64_t)v18, (uint64_t *)&unk_10005CC40);
    v13._countAndFlagsBits = 58;
  }
  v13._object = (void *)0xE100000000000000;
  sub_1000454E0(v13);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v20);
  sub_1000454F0();
  v25._object = (void *)0x800000010004B380;
  v25._countAndFlagsBits = 0xD000000000000017;
  sub_1000454E0(v25);
  swift_getErrorValue();
  uint64_t v21 = v17;
  Swift::String v15 = sub_100005CD0(v20);
  (*(void (**)(uint64_t *))(*(void *)(v17 - 8) + 16))(v15);
  sub_1000454D0();
  sub_10002A908((uint64_t)v20, (uint64_t *)&unk_10005CC40);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_1000454E0(v26);
  sub_100045510();
  sub_100034904();
  swift_bridgeObjectRelease();
  return a3(a1);
}

uint64_t sub_10004199C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000419D4(uint64_t a1)
{
  sub_10003FB00(a1, *(void *)(v1 + 16));
}

unint64_t sub_1000419DC()
{
  unint64_t result = qword_10005E160;
  if (!qword_10005E160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E160);
  }
  return result;
}

uint64_t sub_100041A28(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100041B04;
  return v6(a1);
}

uint64_t sub_100041B04()
{
  sub_1000429C0();
  sub_100042900();
  uint64_t v1 = *v0;
  sub_100042988();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100042998();
  return v3();
}

uint64_t sub_100041BC8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100041C10(uint64_t a1)
{
  sub_100041198(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 32));
}

uint64_t sub_100041C20(uint64_t a1)
{
  return sub_1000415C4(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_100041C30(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100040830(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_100041C38()
{
  swift_release();
  sub_10002758C(*(void *)(v0 + 24), *(void *)(v0 + 32));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100041C78(uint64_t *a1)
{
  return sub_1000400F4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_100041C84()
{
  unint64_t result = qword_10005E170;
  if (!qword_10005E170)
  {
    sub_10000C4A8(&qword_10005C9E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E170);
  }
  return result;
}

uint64_t sub_100041CD8()
{
  return sub_10003C3B4();
}

uint64_t sub_100041CE8(uint64_t a1, uint64_t a2, void *a3)
{
  v10[3] = sub_100005A4C(0, (unint64_t *)&qword_10005C960);
  v10[4] = &protocol witness table for OS_dispatch_queue;
  v10[0] = a3;
  id v6 = a3;
  uint64_t v7 = sub_100045AE0();
  id v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = a1;
  v8[4] = a2;
  swift_retain_n();
  swift_retain();
  sub_100045A40();
  swift_release();
  swift_release();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v10);
  return v7;
}

uint64_t sub_100041E0C(uint64_t *a1)
{
  return sub_100040128(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, void, void))(v1 + 24));
}

uint64_t sub_100041E1C(uint64_t a1)
{
  return sub_100040424(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, unint64_t, uint64_t))(v1 + 24));
}

uint64_t sub_100041E28()
{
  return sub_100041CD8();
}

uint64_t sub_100041E34(uint64_t a1)
{
  return sub_10003C3E8(a1, *(void *)(v1 + 16), *(void (**)(void))(v1 + 24));
}

unint64_t sub_100041E54()
{
  unint64_t result = qword_10005E188;
  if (!qword_10005E188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E188);
  }
  return result;
}

uint64_t sub_100041EA0(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100041EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005E180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100041F1C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100041F30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005E180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100041F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A2C(&qword_10005E180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100042004(uint64_t a1)
{
  return sub_10003F2B4(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t sub_100042010()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004204C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10004208C(uint64_t a1)
{
  return sub_10003F578(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

unint64_t sub_100042098()
{
  unint64_t result = qword_10005E198;
  if (!qword_10005E198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E198);
  }
  return result;
}

unint64_t sub_1000420E4()
{
  unint64_t result = qword_10005E1A0;
  if (!qword_10005E1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1A0);
  }
  return result;
}

unint64_t sub_100042130()
{
  unint64_t result = qword_10005E1B0;
  if (!qword_10005E1B0)
  {
    type metadata accessor for JSServiceRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1B0);
  }
  return result;
}

uint64_t sub_100042180()
{
  uint64_t v2 = sub_1000429EC();
  v3(v2);
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

unint64_t sub_1000421D4()
{
  unint64_t result = qword_10005E1B8;
  if (!qword_10005E1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10005E1B8);
  }
  return result;
}

uint64_t sub_100042220@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10003D550(a1, v2, a2);
}

uint64_t sub_10004223C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_10001CE80();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100042294()
{
  uint64_t v2 = sub_1000429EC();
  v3(v2);
  sub_10001CE80();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_1000422E8()
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
  uint64_t v6 = sub_1000450E0();
  if (!sub_100005A24(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100042440(uint64_t a1)
{
  uint64_t v4 = type metadata accessor for JSServiceRequest();
  sub_1000078C0(v4);
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
  v19[1] = sub_100042570;
  return sub_10003CC5C(a1, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sub_100042570()
{
  sub_1000429C0();
  sub_100042900();
  uint64_t v1 = *v0;
  sub_100042988();
  void *v2 = v1;
  swift_task_dealloc();
  sub_100042998();
  return v3();
}

uint64_t sub_100042630()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100042668(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100042570;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10005E1D0 + dword_10005E1D0);
  return v6(a1, v4);
}

ValueMetadata *type metadata accessor for ServiceConnectionExportedObject.BootstrapError()
{
  return &type metadata for ServiceConnectionExportedObject.BootstrapError;
}

unsigned char *_s34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObjectC14BootstrapErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100042804);
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

unint64_t sub_100042840()
{
  unint64_t result = qword_10005E1E0;
  if (!qword_10005E1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1E0);
  }
  return result;
}

unint64_t sub_100042890()
{
  unint64_t result = qword_10005E1E8;
  if (!qword_10005E1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E1E8);
  }
  return result;
}

uint64_t sub_100042918()
{
  sub_100005548((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t sub_100042950()
{
  return sub_1000454F0();
}

uint64_t sub_10004296C()
{
  return sub_1000454F0();
}

uint64_t sub_100042998()
{
  return v0 + 8;
}

uint64_t sub_1000429A4(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return sub_1000454D0();
}

uint64_t sub_1000429CC()
{
  return sub_1000454B0();
}

uint64_t sub_1000429EC()
{
  return 0;
}

char *sub_100042A00(char *a1, char **a2, uint64_t a3)
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
    uint64_t v10 = sub_1000450E0();
    unint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    uint64_t v12 = v4;
    swift_unknownObjectRetain();
    uint64_t v13 = v6;
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_100042B14(id *a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  unsigned int v4 = (char *)a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1000450E0();
  unsigned int v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100042BA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v10 = sub_1000450E0();
  unint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v5;
  swift_unknownObjectRetain();
  id v13 = v6;
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_100042C6C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_100042D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_100042DD4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v11 = sub_1000450E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100042E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042EAC);
}

uint64_t sub_100042EAC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_1000450E0();
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    return sub_100005A24(v9, a2, v8);
  }
}

uint64_t sub_100042F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100042F48);
}

uint64_t sub_100042F48(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1000450E0();
    uint64_t v8 = v5 + *(int *)(a4 + 32);
    return sub_100005994(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for ServiceOptions()
{
  uint64_t result = qword_10005E248;
  if (!qword_10005E248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100043010()
{
  uint64_t result = sub_1000450E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000430C8(id **a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for ServiceOptions();
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (id *)((char *)&v57 - v9);
  uint64_t v11 = __chkstk_darwin(v8);
  __chkstk_darwin(v11);
  sub_100043760();
  uint64_t v62 = v12;
  sub_10002DF20();
  __chkstk_darwin(v13);
  sub_100043760();
  uint64_t v61 = v14;
  sub_10002DF20();
  __chkstk_darwin(v15);
  sub_100043760();
  uint64_t v60 = v16;
  sub_10002DF20();
  __chkstk_darwin(v17);
  sub_100043760();
  uint64_t v64 = v18;
  sub_10002DF20();
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
      sub_10004364C((uint64_t)a1, (uint64_t)&v57 - v27);
      sub_10004364C((uint64_t)a2, (uint64_t)v25);
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (!v30)
  {
LABEL_6:
    sub_10004364C((uint64_t)a1, (uint64_t)&v57 - v27);
    sub_10004364C((uint64_t)a2, (uint64_t)v25);
    goto LABEL_7;
  }
  uint64_t v57 = v26;
  sub_100005A4C(0, (unint64_t *)&qword_10005C630);
  uint64_t v30 = (uint64_t)(id)v30;
  Swift::String v32 = v29;
  Swift::String v29 = v10;
  Swift::String v33 = v32;
  char v34 = sub_100045E30();

  uint64_t v10 = v29;
  sub_10004364C((uint64_t)a1, (uint64_t)v28);
  sub_10004364C((uint64_t)a2, (uint64_t)v25);
  if ((v34 & 1) == 0)
  {
LABEL_7:
    sub_1000436B0((uint64_t)v28);
    sub_1000436B0((uint64_t)v25);
    sub_10004364C((uint64_t)a1, (uint64_t)v22);
    sub_10004370C();
    goto LABEL_8;
  }
LABEL_14:
  id v58 = v10;
  uint64_t v59 = v7;
  id v39 = [v28[1] profile];
  uint64_t v40 = sub_100045C30();
  uint64_t v42 = v41;

  Swift::String v29 = (id *)[v25[1] profile];
  uint64_t v43 = sub_100045C30();
  uint64_t v45 = v44;

  if (v40 == v43 && v42 == v45)
  {
    swift_bridgeObjectRelease_n();
    sub_1000436B0((uint64_t)v28);
    sub_1000436B0((uint64_t)v25);
    sub_10004364C((uint64_t)a1, (uint64_t)v22);
    sub_10004370C();
    uint64_t v10 = v58;
    uint64_t v7 = v59;
    goto LABEL_21;
  }
  uint64_t v30 = sub_1000460F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000436B0((uint64_t)v28);
  sub_1000436B0((uint64_t)v25);
  sub_10004364C((uint64_t)a1, (uint64_t)v22);
  sub_10004370C();
  uint64_t v10 = v58;
  uint64_t v7 = v59;
  if ((v30 & 1) == 0)
  {
LABEL_8:
    sub_1000436B0((uint64_t)v22);
    sub_1000436B0((uint64_t)v29);
    sub_100043744();
    sub_100043728();
    goto LABEL_9;
  }
LABEL_21:
  id v47 = [v22[1] profileVersion];
  uint64_t v48 = sub_100045C30();
  uint64_t v50 = v49;

  id v51 = [v29[1] profileVersion];
  uint64_t v30 = sub_100045C30();
  Swift::String v28 = v52;

  if (v48 == v30 && v50 == v28)
  {
    swift_bridgeObjectRelease_n();
    sub_1000436B0((uint64_t)v22);
    sub_1000436B0(v64);
    sub_100043744();
    sub_100043728();
    goto LABEL_28;
  }
  char v54 = sub_1000460F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000436B0((uint64_t)v22);
  sub_1000436B0(v64);
  sub_100043744();
  sub_100043728();
  if ((v54 & 1) == 0)
  {
LABEL_9:
    sub_1000436B0(v30);
    sub_1000436B0((uint64_t)v28);
    uint64_t v35 = v62;
    sub_10004364C((uint64_t)a1, v62);
    uint64_t v36 = v63;
    sub_10004364C((uint64_t)a2, v63);
LABEL_10:
    sub_1000436B0(v35);
    sub_1000436B0(v36);
    sub_10004364C((uint64_t)a1, (uint64_t)v10);
    sub_10004364C((uint64_t)a2, (uint64_t)v7);
    goto LABEL_11;
  }
LABEL_28:
  sub_100005A4C(0, &qword_10005E2F0);
  char v55 = sub_100045E30();
  sub_1000436B0(v30);
  sub_1000436B0((uint64_t)v28);
  uint64_t v35 = v62;
  sub_10004364C((uint64_t)a1, v62);
  uint64_t v36 = v63;
  sub_10004364C((uint64_t)a2, v63);
  if ((v55 & 1) == 0) {
    goto LABEL_10;
  }
  char v56 = static MetricsContext.== infix(_:_:)(*(unsigned __int8 *)(v35 + 24), *(void *)(v35 + 32), *(unsigned __int8 *)(v36 + 24), *(void *)(v36 + 32));
  sub_1000436B0(v35);
  sub_1000436B0(v36);
  sub_10004364C((uint64_t)a1, (uint64_t)v10);
  sub_10004364C((uint64_t)a2, (uint64_t)v7);
  if (v56)
  {
    char v37 = sub_100045090();
    goto LABEL_12;
  }
LABEL_11:
  char v37 = 0;
LABEL_12:
  sub_1000436B0((uint64_t)v7);
  sub_1000436B0((uint64_t)v10);
  return v37 & 1;
}

uint64_t sub_10004364C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000436B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ServiceOptions();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004370C()
{
  uint64_t v3 = *(void *)(v1 - 88);
  return sub_10004364C(v0, v3);
}

uint64_t sub_100043728()
{
  uint64_t v3 = *(void *)(v1 - 112);
  return sub_10004364C(v0, v3);
}

uint64_t sub_100043744()
{
  uint64_t v3 = *(void *)(v1 - 120);
  return sub_10004364C(v0, v3);
}

void sub_10004376C()
{
  sub_100043B54();
  if (qword_10005C428 != -1) {
    swift_once();
  }
  if (sub_10003A6CC())
  {
    sub_100043B28();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_100043858;
    void v2[3] = &unk_100057258;
    _Block_copy(v2);
    sub_100043B0C();
    uint64_t v1 = swift_release();
    sub_100043B38(v1, "handleWithAuthenticateRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_10004385C()
{
  sub_100043B54();
  if (qword_10005C428 != -1) {
    swift_once();
  }
  if (sub_10003A6CC())
  {
    sub_100043B28();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_100043858;
    void v2[3] = &unk_100057230;
    _Block_copy(v2);
    sub_100043B0C();
    uint64_t v1 = swift_release();
    sub_100043B38(v1, "handleWithDialogRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_100043948()
{
  sub_100043B54();
  if (qword_10005C428 != -1) {
    swift_once();
  }
  if (sub_10003A6CC())
  {
    sub_100043B28();
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 1107296256;
    v2[2] = sub_100043858;
    void v2[3] = &unk_100057208;
    _Block_copy(v2);
    sub_100043B0C();
    uint64_t v1 = swift_release();
    sub_100043B38(v1, "handleWithEngagementRequest:completion:");
    swift_unknownObjectRelease();
    _Block_release(v0);
  }
}

void sub_100043A34(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_100043AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100043AF4()
{
  return swift_release();
}

uint64_t sub_100043B0C()
{
  return swift_retain();
}

id sub_100043B38(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2, v4);
}

CFRunLoopMode sub_100043B64()
{
  uint64_t v1 = sub_1000452C0();
  sub_100009FF4();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_100017F10();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_1000452F0();
  sub_100009FF4();
  uint64_t v9 = v8;
  __chkstk_darwin();
  sub_100017F10();
  uint64_t v28 = v11 - v10;
  sub_100045500();
  __chkstk_darwin();
  sub_100017F10();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v30 = (void *)type metadata accessor for ServiceStartupTask();
  aBlock[0] = v0;
  swift_retain();
  id v12 = (id)AMSLogKey();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_100045C30();
    uint64_t v27 = v9;
    uint64_t v15 = v6;
    uint64_t v16 = v7;
    uint64_t v17 = v3;
    uint64_t v18 = v1;
    uint64_t v20 = v19;

    sub_1000454F0();
    v35._countAndFlagsBits = 0;
    v35._object = (void *)0xE000000000000000;
    sub_1000454E0(v35);
    uint64_t v21 = sub_100017F8C();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v33[0] = v21;
    sub_1000454D0();
    sub_100007820((uint64_t)v33);
    v36._countAndFlagsBits = 5972026;
    v36._object = (void *)0xE300000000000000;
    sub_1000454E0(v36);
    uint64_t MetatypeMetadata = &type metadata for String;
    v33[0] = v14;
    v33[1] = v20;
    uint64_t v1 = v18;
    uint64_t v3 = v17;
    uint64_t v7 = v16;
    uint64_t v6 = v15;
    uint64_t v9 = v27;
    sub_1000454D0();
    sub_100007820((uint64_t)v33);
    v22._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v37._countAndFlagsBits = 0;
    v37._object = (void *)0xE000000000000000;
    sub_1000454E0(v37);
    uint64_t v23 = sub_100017F8C();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v33[0] = v23;
    sub_1000454D0();
    sub_100007820((uint64_t)v33);
    v22._countAndFlagsBits = 58;
  }
  v22._object = (void *)0xE100000000000000;
  sub_1000454E0(v22);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)aBlock);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  setenv("JSC_criticalGCMemoryThreshold", "0.25", 1);
  [self setBagKeyRegistrationEnabled:0];
  CFRunLoopMode result = kCFRunLoopCommonModes;
  if (kCFRunLoopCommonModes)
  {
    sub_100045B30();
    sub_100005A4C(0, &qword_10005E448);
    sub_100005A4C(0, (unint64_t *)&qword_10005C960);
    Swift::String v25 = (void *)sub_100045D80();
    sub_100045DA0();

    swift_getObjectType();
    uint64_t v31 = sub_100044378;
    uint64_t v32 = v0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10003B2A0;
    uint64_t v30 = &unk_100057280;
    uint64_t v26 = _Block_copy(aBlock);
    swift_retain();
    sub_1000452E0();
    sub_1000442D4();
    sub_100045DB0();
    _Block_release(v26);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v1);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v28, v7);
    swift_release();
    sub_100045DC0();
    if (qword_10005C430 != -1) {
      swift_once();
    }
    sub_10003B710();
    return (CFRunLoopMode)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100044060(uint64_t a1)
{
  sub_100045500();
  __chkstk_darwin();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  sub_100045550();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100047420;
  uint64_t v13 = type metadata accessor for ServiceStartupTask();
  v12[0] = a1;
  swift_retain();
  id v2 = (id)AMSLogKey();
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v6 = sub_100045C30();
    uint64_t v8 = v7;

    sub_1000454F0();
    v15._countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    sub_1000454E0(v15);
    sub_100005548(v12, v13);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v10[0] = DynamicType;
    sub_1000454D0();
    sub_100007820((uint64_t)v10);
    v16._countAndFlagsBits = 5972026;
    v16._object = (void *)0xE300000000000000;
    sub_1000454E0(v16);
    uint64_t MetatypeMetadata = &type metadata for String;
    v10[0] = v6;
    v10[1] = v8;
    sub_1000454D0();
    sub_100007820((uint64_t)v10);
    v4._countAndFlagsBits = 93;
  }
  else
  {
    sub_1000454F0();
    v14._countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    sub_1000454E0(v14);
    sub_100005548(v12, v13);
    uint64_t v3 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v10[0] = v3;
    sub_1000454D0();
    sub_100007820((uint64_t)v10);
    v4._countAndFlagsBits = 58;
  }
  v4._object = (void *)0xE100000000000000;
  sub_1000454E0(v4);
  sub_100045510();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t)v12);
  sub_1000454B0();
  sub_100034904();
  swift_bridgeObjectRelease();
  exit(0);
}

uint64_t sub_1000442D4()
{
  return sub_100045EA0();
}

uint64_t type metadata accessor for ServiceStartupTask()
{
  return self;
}

void sub_100044378()
{
  sub_100044060(v0);
}

uint64_t sub_100044380(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100044390()
{
  return swift_release();
}

unint64_t sub_100044398()
{
  unint64_t result = qword_10005E450;
  if (!qword_10005E450)
  {
    sub_1000452C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E450);
  }
  return result;
}

unint64_t sub_1000443E8()
{
  unint64_t result = qword_10005E460;
  if (!qword_10005E460)
  {
    sub_10000C4A8(&qword_10005E458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005E460);
  }
  return result;
}

void sub_10004443C()
{
  sub_100044F08();
  uint64_t v2 = sub_100044DD0();
  __chkstk_darwin(v2 - 8);
  sub_1000078D8();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v3 = sub_100045550();
  sub_1000078C0(v3);
  *(_OWORD *)(sub_100044D50() + 16) = xmmword_1000473B0;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100045C30();
    sub_100044DA8();
    sub_100042950();
    sub_1000078F0();
    sub_100044DF4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100044EB4(MetatypeMetadata);
    sub_100007820((uint64_t)v8);
    sub_1000145F0();
    sub_100044D7C((uint64_t)&type metadata for String);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_10004296C();
    sub_1000078F0();
    sub_100044E50();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100044ED0(v6);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_1000454E0(v5);
  sub_100045510();
  type metadata accessor for Log();
  sub_100044F20();
  sub_1000454B0();
  uint64_t v10 = sub_100005A4C(0, (unint64_t *)&unk_10005E570);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_100044EEC();
  sub_100007820((uint64_t)&v9);
  sub_100034904();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045700();
  sub_100044E2C();
  sub_100044E88();
  sub_10004376C();
  swift_release();
  sub_100044E9C();
}

#error "100044674: call analysis failed (funcsize=17)"

void sub_100044684()
{
  sub_100044F08();
  uint64_t v2 = sub_100044DD0();
  __chkstk_darwin(v2 - 8);
  sub_1000078D8();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v3 = sub_100045550();
  sub_1000078C0(v3);
  *(_OWORD *)(sub_100044D50() + 16) = xmmword_1000473B0;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100045C30();
    sub_100044DA8();
    sub_100042950();
    sub_1000078F0();
    sub_100044DF4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100044EB4(MetatypeMetadata);
    sub_100007820((uint64_t)v8);
    sub_1000145F0();
    sub_100044D7C((uint64_t)&type metadata for String);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_10004296C();
    sub_1000078F0();
    sub_100044E50();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100044ED0(v6);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_1000454E0(v5);
  sub_100045510();
  type metadata accessor for Log();
  sub_100044F20();
  sub_1000454B0();
  uint64_t v10 = sub_100005A4C(0, &qword_10005E568);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_100044EEC();
  sub_100007820((uint64_t)&v9);
  sub_100034904();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045700();
  sub_100044E2C();
  sub_100044E88();
  sub_10004385C();
  swift_release();
  sub_100044E9C();
}

#error "1000448BC: call analysis failed (funcsize=17)"

void sub_1000448CC()
{
  sub_100044F08();
  uint64_t v2 = sub_100044DD0();
  __chkstk_darwin(v2 - 8);
  sub_1000078D8();
  sub_100004A2C((uint64_t *)&unk_10005E040);
  uint64_t v3 = sub_100045550();
  sub_1000078C0(v3);
  *(_OWORD *)(sub_100044D50() + 16) = xmmword_1000473B0;
  uint64_t v10 = type metadata accessor for URLSessionHandler();
  uint64_t v9 = v1;
  v1;
  if ((id)AMSLogKey())
  {
    sub_100045C30();
    sub_100044DA8();
    sub_100042950();
    sub_1000078F0();
    sub_100044DF4();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100044EB4(MetatypeMetadata);
    sub_100007820((uint64_t)v8);
    sub_1000145F0();
    sub_100044D7C((uint64_t)&type metadata for String);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 93;
  }
  else
  {
    sub_10004296C();
    sub_1000078F0();
    sub_100044E50();
    uint64_t v6 = swift_getMetatypeMetadata();
    sub_100044ED0(v6);
    sub_100007820((uint64_t)v8);
    v5._countAndFlagsBits = 58;
  }
  v5._object = (void *)0xE100000000000000;
  sub_1000454E0(v5);
  sub_100045510();
  type metadata accessor for Log();
  sub_100044F20();
  sub_1000454B0();
  uint64_t v10 = sub_100005A4C(0, &qword_10005E560);
  uint64_t v9 = v0;
  id v7 = v0;
  sub_100044EEC();
  sub_100007820((uint64_t)&v9);
  sub_100034904();
  swift_bridgeObjectRelease();
  type metadata accessor for ServiceRequestHandler();
  sub_100045700();
  sub_100044E2C();
  sub_100044E88();
  sub_100043948();
  swift_release();
  sub_100044E9C();
}

#error "100044B04: call analysis failed (funcsize=17)"

uint64_t sub_100044B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(void))
{
  sub_100044F08();
  Swift::String v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = _Block_copy(v29);
  *(void *)(swift_allocObject() + 16) = v30;
  id v31 = v26;
  id v32 = v24;
  id v33 = v22;
  id v34 = v28;
  a21();

  sub_100044E9C();
  return swift_release();
}

void sub_100044BD8()
{
}

void sub_100044C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100045000();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_100044C88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for URLSessionHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for URLSessionHandler()
{
  return self;
}

uint64_t sub_100044CF0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100044D28(uint64_t a1, uint64_t a2)
{
  sub_100044C08(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100044D50()
{
  return swift_allocObject();
}

uint64_t sub_100044D7C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 120) = a1;
  *(void *)(v3 - 144) = v1;
  *(void *)(v3 - 136) = v2;
  return sub_1000454D0();
}

void sub_100044DA8()
{
  *(void *)(v2 - 152) = v0;
}

uint64_t sub_100044DD0()
{
  return sub_100045500();
}

uint64_t sub_100044DF4()
{
  sub_100005548((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_100044E2C()
{
  return sub_1000458C0();
}

uint64_t sub_100044E50()
{
  sub_100005548((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_100044E88()
{
  return v0;
}

uint64_t sub_100044EB4(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000454D0();
}

uint64_t sub_100044ED0(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_1000454D0();
}

uint64_t sub_100044EEC()
{
  return sub_100045520();
}

uint64_t sub_100044F20()
{
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v0 - 112);
}

uint64_t sub_100044F40()
{
  return URLRequest.httpMethod.setter();
}

Class sub_100044F50()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_100044F60()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

void sub_100044F70(Swift::String _, Swift::String forHTTPHeaderField)
{
}

uint64_t sub_100044F80()
{
  return URLRequest.httpBody.setter();
}

uint64_t sub_100044F90()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_100044FA0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_100044FB0()
{
  return JSONDecoder.init()();
}

uint64_t sub_100044FC0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100044FD0()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100044FE0()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100044FF0()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100045000()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100045010()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100045020()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100045030()
{
  return URL.pathExtension.getter();
}

uint64_t sub_100045040()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100045050()
{
  return URL.init(fileURLWithPath:)();
}

void sub_100045060(NSURL *retstr@<X8>)
{
}

uint64_t sub_100045070()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100045080()
{
  return URL.appendingPathExtension(_:)();
}

uint64_t sub_100045090()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_1000450A0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000450B0()
{
  return URL.path.getter();
}

uint64_t sub_1000450C0()
{
  return URL.init(string:)();
}

uint64_t sub_1000450D0()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_1000450E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000450F0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100045100()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100045110()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045120()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_100045130()
{
  return type metadata accessor for Date();
}

uint64_t sub_100045140()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100045150()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045160()
{
  return UUID.init()();
}

uint64_t sub_100045170()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100045180()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100045190()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_1000451A0()
{
  return OpenAIAuthenticator.BillingPlan.workspaceID.getter();
}

uint64_t sub_1000451B0()
{
  return type metadata accessor for OpenAIAuthenticator.BillingPlan.Category();
}

uint64_t sub_1000451C0()
{
  return OpenAIAuthenticator.BillingPlan.category.getter();
}

uint64_t sub_1000451D0()
{
  return OpenAIAuthenticator.BillingPlan.planName.getter();
}

uint64_t sub_1000451E0()
{
  return type metadata accessor for OpenAIAuthenticator.BillingPlan();
}

uint64_t sub_1000451F0()
{
  return OpenAIAuthenticator.Credentials.billingPlan.getter();
}

uint64_t sub_100045200()
{
  return OpenAIAuthenticator.Credentials.expirationDate.getter();
}

uint64_t sub_100045210()
{
  return OpenAIAuthenticator.Credentials.email.getter();
}

uint64_t sub_100045220()
{
  return OpenAIAuthenticator.Credentials.userName.getter();
}

uint64_t sub_100045230()
{
  return type metadata accessor for OpenAIAuthenticator.Credentials();
}

uint64_t sub_100045240()
{
  return OpenAIAuthenticator.credentials.getter();
}

uint64_t sub_100045260()
{
  return OpenAIAuthenticator.startSignInSession(redirectURI:)();
}

uint64_t sub_100045270()
{
  return static OpenAIAuthenticator.shared.getter();
}

uint64_t sub_100045280()
{
  return OpenAIAuthenticator.Session.authorizationURL.getter();
}

uint64_t sub_100045290()
{
  return type metadata accessor for OpenAIAuthenticator.Session();
}

uint64_t sub_1000452B0()
{
  return type metadata accessor for OpenAIAuthenticator();
}

uint64_t sub_1000452C0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000452D0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1000452E0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000452F0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100045300()
{
  return DiskJetPackLoader.init(signingPolicy:keyProvider:)();
}

uint64_t sub_100045310()
{
  return static DiskJetPackLoader.sharedUnpackQueue.getter();
}

uint64_t sub_100045320()
{
  return DiskJetPackLoader.bundle(from:baseURL:automaticallyCleanUp:on:)();
}

uint64_t sub_100045330()
{
  return type metadata accessor for DiskJetPackLoader();
}

uint64_t sub_100045340()
{
  return static DiskJetPackResourceBundle.cleanUpOldSessions(baseURL:)();
}

uint64_t sub_100045350()
{
  return DiskJetPackResourceBundle.memoryMappedSource(atPath:virtualMachine:cacheURL:)();
}

uint64_t sub_100045360()
{
  return DiskJetPackResourceBundle.fileData(atPath:)();
}

uint64_t sub_100045370()
{
  return type metadata accessor for DiskJetPackResourceBundle();
}

uint64_t sub_100045380()
{
  return type metadata accessor for JetPackSigningPolicy();
}

uint64_t sub_100045390()
{
  return JetPackFileStreamSource.init(path:)();
}

uint64_t sub_1000453A0()
{
  return type metadata accessor for JetPackFileStreamSource();
}

uint64_t sub_1000453B0()
{
  return JetPackManagedKeyProvider.init()();
}

uint64_t sub_1000453C0()
{
  return type metadata accessor for JetPackManagedKeyProvider();
}

uint64_t sub_1000453D0()
{
  return static JetPackPath.sourcePath.getter();
}

uint64_t sub_1000453E0()
{
  return type metadata accessor for JetPackPath();
}

uint64_t sub_1000453F0()
{
  return JetPackPath.init(_:)();
}

uint64_t sub_100045400()
{
  return type metadata accessor for JetEngineBootstrap.URLProtocolHandler();
}

uint64_t sub_100045410()
{
  return JSCallable.call(_:)();
}

uint64_t sub_100045420()
{
  return type metadata accessor for JSCallable();
}

uint64_t sub_100045430()
{
  return JSONObject.dictionary.getter();
}

uint64_t sub_100045440()
{
  return JSONObject.init(deserializing:)();
}

uint64_t sub_100045450()
{
  return JSONObject.url.getter();
}

uint64_t sub_100045460()
{
  return JSONObject.string.getter();
}

uint64_t sub_100045470()
{
  return JSONObject.untyped.getter();
}

uint64_t sub_100045480()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_100045490()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_1000454A0()
{
  return JSResponse.body.getter();
}

uint64_t sub_1000454B0()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_1000454C0()
{
  return static LogMessage.isRedactionEnabled.getter();
}

uint64_t sub_1000454D0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

void sub_1000454E0(Swift::String a1)
{
}

uint64_t sub_1000454F0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100045500()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_100045510()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_100045520()
{
  return static LogMessage.safe(_:)();
}

uint64_t sub_100045530()
{
  return static LogMessage.describe(contentsOf:withRedaction:separator:)();
}

uint64_t sub_100045540()
{
  return static LogMessage.sensitive(_:)();
}

uint64_t sub_100045550()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_100045560()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_100045570()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_100045580()
{
  return static IntentModel<>.kind.getter();
}

uint64_t sub_100045590()
{
  return JSONContext.init()();
}

uint64_t sub_1000455A0()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_1000455B0()
{
  return PipelineTask.mapTaskOutput<A>(_:)();
}

uint64_t sub_1000455C0()
{
  return PipelineTask.mapTaskOutput<A>(_:)();
}

uint64_t sub_1000455D0()
{
  return PipelineTask.andThen<A>(_:)();
}

uint64_t sub_1000455E0()
{
  return CoarselyTimed.contained.getter();
}

uint64_t sub_1000455F0()
{
  return type metadata accessor for JetpackBundle.Resource();
}

uint64_t sub_100045600()
{
  return type metadata accessor for JetpackBundle();
}

uint64_t sub_100045610()
{
  return static PipelinePhase.cacheValueIfSuccessful()();
}

uint64_t sub_100045620()
{
  return PipelinePhase.init(mapOutput:)();
}

uint64_t sub_100045630()
{
  return PipelinePhase.init(mapOutput:)();
}

uint64_t sub_100045640()
{
  return static PipelinePhase<>.urlForResource(_:)();
}

uint64_t sub_100045650()
{
  return static PipelinePhase<>.fetchJetpack(artifactStoreURL:urlSession:urlEncoder:)();
}

uint64_t sub_100045660()
{
  return static PipelinePhase<>.unpackJetpack(keyURLs:bundleOutputURL:artifactStoreURL:verifySignature:)();
}

uint64_t sub_100045670()
{
  return static PipelinePhase<>.rateLimitOnFailure(on:withID:using:)();
}

uint64_t sub_100045680()
{
  return JSIntentResult.jsonObject.getter();
}

uint64_t sub_100045690()
{
  return type metadata accessor for JSIntentResult();
}

uint64_t sub_1000456A0()
{
  return JSONDictionary.bridgedPrimitiveValues<A, B>()();
}

uint64_t sub_1000456B0()
{
  return type metadata accessor for JSONDictionary();
}

uint64_t sub_1000456C0()
{
  return BaseObjectGraph.init(name:dependencies:)();
}

uint64_t sub_1000456D0()
{
  return dispatch thunk of BaseObjectGraph.name.setter();
}

uint64_t sub_1000456E0()
{
  return static BaseObjectGraph.build(withName:)();
}

uint64_t sub_1000456F0()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_100045700()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t sub_100045710()
{
  return BaseObjectGraph.deinit();
}

uint64_t sub_100045720()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_100045730()
{
  return type metadata accessor for JSRequestIntent();
}

uint64_t sub_100045740()
{
  return JSRequestIntent.init(_:timeout:)();
}

uint64_t sub_100045750()
{
  return dispatch thunk of MapPipelineTask.run()();
}

uint64_t sub_100045760()
{
  return JSBytecodeSource.init(fileURL:sourceURL:cacheURL:virtualMachine:)();
}

uint64_t sub_100045770()
{
  return type metadata accessor for JSBytecodeSource();
}

uint64_t sub_100045780()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_100045790()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_1000457A0()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_1000457B0()
{
  return static RunLoopWorkerThread.current.getter();
}

uint64_t sub_1000457C0()
{
  return type metadata accessor for RunLoopWorkerThread();
}

uint64_t sub_1000457D0()
{
  return type metadata accessor for DependencyDictionary();
}

uint64_t sub_1000457E0()
{
  return static JitterPipelineBackoff.forJavaScriptLoading.getter();
}

uint64_t sub_1000457F0()
{
  return type metadata accessor for JitterPipelineBackoff();
}

uint64_t sub_100045800()
{
  return dispatch thunk of AsyncObjectGraphBuilder.makeObjectGraph()();
}

uint64_t sub_100045810()
{
  return dispatch thunk of AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045820()
{
  return AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045830()
{
  return AsyncObjectGraphBuilder.satisfying<A>(_:with:)();
}

uint64_t sub_100045840()
{
  return AsyncObjectGraphBuilder.withDependenciesSatisfied.getter();
}

uint64_t sub_100045850()
{
  return CustomJSValueConvertible.jsRepresentation(in:)();
}

JSValue sub_100045860(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

uint64_t sub_100045870()
{
  return Bag.amsBag.getter();
}

uint64_t sub_100045880()
{
  return Bag.init(from:)();
}

uint64_t sub_100045890()
{
  return Bag.Value.promise()();
}

uint64_t sub_1000458A0()
{
  return Bag.subscript.getter();
}

uint64_t sub_1000458B0()
{
  return type metadata accessor for Bag();
}

uint64_t sub_1000458C0()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_1000458D0()
{
  return JSError.constructorName.getter();
}

uint64_t sub_1000458E0()
{
  return JSError.line.getter();
}

uint64_t sub_1000458F0()
{
  return JSError.column.getter();
}

uint64_t sub_100045900()
{
  return JSError.init(message:line:column:sourceURL:constructorName:)();
}

uint64_t sub_100045910()
{
  return JSError.message.getter();
}

uint64_t sub_100045920()
{
  return JSError.init(badValue:expected:)();
}

JSValue sub_100045930(JSContext in)
{
  return JSError.makeValue(in:)(in);
}

uint64_t sub_100045940()
{
  return JSError.sourceURL.getter();
}

uint64_t sub_100045950()
{
  return type metadata accessor for JSError();
}

uint64_t sub_100045960()
{
  return JSRoute.init(service:function:)();
}

uint64_t sub_100045970()
{
  return type metadata accessor for JSRoute();
}

uint64_t sub_100045980()
{
  return type metadata accessor for JSStack.Prerequisite();
}

uint64_t sub_100045990()
{
  return JSStack.performRequest(_:)();
}

uint64_t sub_1000459A0()
{
  return JSStack.withUnsafeContext(_:)();
}

void sub_1000459B0()
{
}

void sub_1000459C0()
{
}

uint64_t sub_1000459D0()
{
  return static JSStack.StandardGlobalConfiguration.default.getter();
}

uint64_t sub_1000459E0()
{
  return type metadata accessor for JSStack.StandardGlobalConfiguration();
}

uint64_t sub_1000459F0()
{
  return JSStack.__allocating_init(asPartOf:virtualMachine:configuration:customPrerequisites:)();
}

uint64_t sub_100045A10()
{
  return type metadata accessor for JSStack();
}

uint64_t sub_100045A20()
{
  return Promise.map<A>(on:_:)();
}

uint64_t sub_100045A30()
{
  return Promise.join<A>(with:)();
}

uint64_t sub_100045A40()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_100045A50()
{
  return Promise.__allocating_init(error:)();
}

uint64_t sub_100045A60()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_100045A70()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_100045A80()
{
  return Promise.reject(_:)();
}

uint64_t sub_100045A90()
{
  return Promise.flatMap<A>(on:_:)();
}

uint64_t sub_100045AA0()
{
  return Promise.resolve(_:)();
}

uint64_t sub_100045AB0()
{
  return Promise<A>.withDependenciesSatisfied.getter();
}

uint64_t sub_100045AC0()
{
  return Promise<A>.toAMSPromise(on:)();
}

uint64_t sub_100045AD0()
{
  return Promise<A>.init(_:)();
}

uint64_t sub_100045AE0()
{
  return Promise.__allocating_init()();
}

uint64_t sub_100045AF0()
{
  return JSSource.init(code:sourceURL:)();
}

uint64_t sub_100045B00()
{
  return type metadata accessor for JSSource();
}

uint64_t sub_100045B10()
{
  return JSSource.init(_:file:)();
}

uint64_t sub_100045B20()
{
  return static Pipeline.start<A>(with:)();
}

uint64_t sub_100045B30()
{
  return static Unstable.runLoopInstallAutoreleasePools(for:)();
}

uint64_t sub_100045B40()
{
  return type metadata accessor for Unstable.Accounts();
}

uint64_t sub_100045B50()
{
  return Unstable.Accounts.init(_:)();
}

uint64_t sub_100045B60()
{
  return JSPromise.init(in:executor:)();
}

uint64_t sub_100045B70()
{
  return JSPromise.value.getter();
}

uint64_t sub_100045B80()
{
  return type metadata accessor for JSPromise();
}

uint64_t sub_100045B90()
{
  return JSRequest.init(route:timeoutInterval:version:)();
}

uint64_t sub_100045BA0()
{
  return JSRequest.addOption(_:withName:)();
}

uint64_t sub_100045BB0()
{
  return type metadata accessor for JSRequest();
}

NSDictionary sub_100045BC0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100045BD0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045BE0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100045BF0()
{
  return String.init(contentsOf:)();
}

NSString sub_100045C00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100045C10()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100045C20()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100045C30()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045C40()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100045C50()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100045C60()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100045C70()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100045C80()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100045C90()
{
  return String.hash(into:)();
}

void sub_100045CA0(Swift::String a1)
{
}

Swift::Int sub_100045CB0()
{
  return String.UTF16View._foreignCount()();
}

uint64_t sub_100045CC0()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

NSArray sub_100045CD0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100045CE0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100045CF0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100045D00()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100045D10()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100045D20()
{
  return static AMSURLSession.forJetEngineStorefront(with:for:usingProtocol:)();
}

uint64_t sub_100045D30()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100045D40()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100045D50()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100045D60()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100045D70()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100045D80()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100045D90()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_100045DA0()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t sub_100045DB0()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

void sub_100045DC0()
{
}

uint64_t sub_100045DD0()
{
  return JSValue.int.getter();
}

uint64_t sub_100045DE0()
{
  return JSValue.BOOL.getter();
}

uint64_t sub_100045DF0()
{
  return JSValue.string.getter();
}

uint64_t sub_100045E00()
{
  return JSValue.subscript.getter();
}

uint64_t sub_100045E10()
{
  return JSValue.subscript.setter();
}

Swift::Int sub_100045E20(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100045E30()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100045E40()
{
  return static JSContext.requiredCurrent.getter();
}

uint64_t sub_100045E50()
{
  return JSContext.propagateErrorsToExceptions(_:)();
}

uint64_t sub_100045E60()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100045E70()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100045E80()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100045E90()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100045EA0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100045EB0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100045EC0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100045ED0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100045EE0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100045EF0()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100045F00()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100045F10()
{
  return __CocoaSet.contains(_:)();
}

Swift::Int sub_100045F20(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100045F30()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100045F40()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100045F50()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100045F60()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100045F70()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100045F80()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100045F90(Swift::Int a1)
{
}

uint64_t sub_100045FA0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100045FB0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100045FC0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100045FD0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100045FE0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100045FF0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

BOOL sub_100046000(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_100046010()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_100046020()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100046030()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100046040()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100046060()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046070()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046080()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046090()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_1000460A0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000460B0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000460C0()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000460D0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_1000460E0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000460F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100046100()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100046110()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100046120()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100046130()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100046140()
{
  return Error._code.getter();
}

uint64_t sub_100046150()
{
  return Error._domain.getter();
}

uint64_t sub_100046160()
{
  return Error._userInfo.getter();
}

uint64_t sub_100046170()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100046180()
{
  return Hasher.init(_seed:)();
}

void sub_100046190(Swift::UInt a1)
{
}

Swift::Int sub_1000461A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000461B0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_1000461C0()
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

void exit(int a1)
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