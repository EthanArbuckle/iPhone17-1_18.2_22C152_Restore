id sub_100005C7C(uint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (qword_100076858 != -1) {
    dispatch_once(&qword_100076858, &stru_10006DC98);
  }
  v2 = (void *)qword_100076850[a1];

  return v2;
}

void sub_100005CE0(id a1)
{
  qword_100076850 = (uint64_t)os_log_create("com.apple.AppDistributionLaunchAngel", "LaunchAngel");

  _objc_release_x1();
}

id sub_1000061C0()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100076878;
  uint64_t v7 = qword_100076878;
  if (!qword_100076878)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000069A4;
    v3[3] = &unk_10006DCC0;
    v3[4] = &v4;
    sub_1000069A4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000628C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000062A4()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)qword_100076880;
  uint64_t v8 = qword_100076880;
  if (!qword_100076880)
  {
    id v1 = (void *)sub_1000067D8();
    v6[3] = (uint64_t)dlsym(v1, "ASCLockupKindApp");
    qword_100076880 = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)sub_1000589B0();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

Class sub_100006780(uint64_t a1)
{
  sub_1000067D8();
  Class result = objc_getClass("ASCMiniProductPageView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100058B58();
  }
  qword_100076860 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000067D8()
{
  v3[0] = 0;
  if (!qword_100076868)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1000068D8;
    v3[4] = &unk_10006DCF8;
    void v3[5] = v3;
    long long v4 = off_10006DCE0;
    uint64_t v5 = 0;
    qword_100076868 = _sl_dlopen();
  }
  uint64_t v0 = qword_100076868;
  id v1 = (void *)v3[0];
  if (!qword_100076868)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000068D8()
{
  uint64_t result = _sl_dlopen();
  qword_100076868 = result;
  return result;
}

Class sub_10000694C(uint64_t a1)
{
  sub_1000067D8();
  Class result = objc_getClass("ASCAdamID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100058B80();
  }
  qword_100076870 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000069A4(uint64_t a1)
{
  sub_1000067D8();
  Class result = objc_getClass("ASCLockupRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_100058BA8();
  }
  qword_100076878 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000069FC(uint64_t a1)
{
  v2 = (void *)sub_1000067D8();
  Class result = dlsym(v2, "ASCLockupKindApp");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100076880 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100006A4C(uint64_t a1)
{
  v2 = (void *)sub_1000067D8();
  Class result = dlsym(v2, "ASCLockupContextAppStoreInstall");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100076888 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100006A9C(uint64_t a1)
{
  v2 = (void *)sub_1000067D8();
  Class result = dlsym(v2, "ASCLockupContextAppDistributionInstall");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100076890 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__n128 initializeWithTake for XPCEncoder(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006AFC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006B1C(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

uint64_t sub_100006B58()
{
  sub_100007960(v0, (uint64_t)&v3);
  uint64_t result = 0xD00000000000003BLL;
  switch(v7)
  {
    case 1:
      return 0x100000000000002BLL;
    case 2:
      return 0x1000000000000086;
    case 3:
      return 0x1000000000000039;
    case 4:
      return 0x10000000000000BALL;
    case 5:
      return 0x100000000000002DLL;
    case 6:
      return 0x100000000000009DLL;
    case 7:
      return 0x1000000000000016;
    case 8:
      return 0x1000000000000027;
    case 9:
      return 0x100000000000003CLL;
    case 10:
      if (!(v5 | v6 | v3 | v4)) {
        return 0x776F6C6C41;
      }
      uint64_t v2 = v5 | v6 | v4;
      if (v3 == 1 && !v2) {
        return 0x6C65636E6143;
      }
      if (v3 == 2 && !v2) {
        return 0x65756E69746E6F43;
      }
      if (v3 == 3 && !v2) {
        return 1701736260;
      }
      if (v3 == 4 && !v2) {
        return 0x6DA0C26E7261654CLL;
      }
      if (v3 == 5 && !v2) {
        return 0x100000000000002CLL;
      }
      uint64_t result = 0x206C6C6174736E49;
      if (v3 == 6 && !v2) {
        return result;
      }
      if (v3 == 7 && !v2) {
        return 0xD000000000000017;
      }
      if (v3 == 8 && !v2) {
        return 0x1000000000000028;
      }
      if (v3 == 9 && !v2) {
        return 0xD000000000000024;
      }
      if (v3 == 10 && !v2) {
        return 0xD0000000000000AELL;
      }
      if (v3 == 11 && !v2) {
        return 0x6150207265746E45;
      }
      if (v3 == 12 && !v2) {
        return 0xD00000000000002ELL;
      }
      if (v3 == 13 && !v2) {
        return 0xD000000000000036;
      }
      if (v3 == 14 && !v2) {
        return 0x4449206863756F54;
      }
      if (v3 == 15 && !v2) {
        return 0xD000000000000021;
      }
      if (v3 == 16 && !v2) {
        return 0xD000000000000029;
      }
      if (v3 != 17 || v2)
      {
        if (v3 == 18 && !v2) {
          return 0xD000000000000017;
        }
        if (v3 != 19 || v2)
        {
          if (v3 != 20 || v2)
          {
            if (v3 == 21 && v2 == 0) {
              return 0xD000000000000014;
            }
            else {
              return 0xD000000000000090;
            }
          }
          else
          {
            return 0xD00000000000005ALL;
          }
        }
        else
        {
          return 0x7461442072756F59;
        }
      }
      return result;
    default:
      return result;
  }
}

unint64_t sub_100006FC8()
{
  unint64_t v1 = 0xD000000000000031;
  sub_100007960(v0, (uint64_t)&v4);
  switch(v8)
  {
    case 1:
      return 0xD000000000000035;
    case 2:
      return 0xD000000000000034;
    case 3:
      return 0xD000000000000039;
    case 4:
      return 0xD000000000000038;
    case 6:
      return 0xD000000000000030;
    case 7:
      return 0xD000000000000028;
    case 8:
      return 0xD000000000000029;
    case 9:
      return 0xD00000000000003BLL;
    case 10:
      if (!(v6 | v7 | v4 | v5)) {
        return 0xD000000000000023;
      }
      uint64_t v2 = v6 | v7 | v5;
      if (v4 == 1 && !v2) {
        return 0xD000000000000024;
      }
      if (v4 == 2 && !v2) {
        return 0xD000000000000026;
      }
      if (v4 == 3 && !v2) {
        return 0xD000000000000022;
      }
      if (v4 == 4 && !v2) {
        return 0xD000000000000038;
      }
      if (v4 == 5 && !v2) {
        return 0xD000000000000032;
      }
      if (v4 == 6 && !v2) {
        return 0xD00000000000002ELL;
      }
      if (v4 == 7 && !v2) {
        return 0xD000000000000036;
      }
      if (v4 == 8 && !v2) {
        return 0xD00000000000002CLL;
      }
      if (v4 != 9 || v2)
      {
        if (v4 != 10 || v2)
        {
          if (v4 != 11 || v2)
          {
            if (v4 != 12 || v2)
            {
              if (v4 != 13 || v2)
              {
                if (v4 == 14 && !v2) {
                  return 0xD000000000000024;
                }
                if (v4 != 15 || v2)
                {
                  if (v4 != 16 || v2)
                  {
                    if (v4 != 17 || v2)
                    {
                      if (v4 != 18 || v2)
                      {
                        if (v4 != 19 || v2)
                        {
                          if (v4 != 20 || v2)
                          {
                            if (v4 == 21 && v2 == 0) {
                              return 0xD000000000000048;
                            }
                            else {
                              return 0xD000000000000047;
                            }
                          }
                          else
                          {
                            return 0xD000000000000046;
                          }
                        }
                        else
                        {
                          return 0xD000000000000047;
                        }
                      }
                      else
                      {
                        return 0xD000000000000035;
                      }
                    }
                    else
                    {
                      return 0xD00000000000002DLL;
                    }
                  }
                }
                else
                {
                  return 0xD000000000000029;
                }
              }
              else
              {
                return 0xD000000000000032;
              }
            }
            else
            {
              return 0xD00000000000002ALL;
            }
          }
          else
          {
            return 0xD000000000000025;
          }
        }
        else
        {
          return 0xD000000000000033;
        }
      }
      return v1;
    default:
      return v1;
  }
}

unint64_t sub_10000739C()
{
  uint64_t v1 = (uint64_t)v0;
  sub_100007960(v0, (uint64_t)v19);
  sub_100007960(v0, (uint64_t)&v20);
  switch(v23)
  {
    case 0:
      long long v24 = v20;
      sub_100007978(&qword_100074FE0);
      uint64_t inited = swift_initStackObject();
      uint64_t v5 = inited;
      *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
      uint64_t v12 = 0x726F4D6E7261656CLL;
      unint64_t v13 = 0xED00006B6E694C65;
      goto LABEL_8;
    case 1:
      long long v24 = v20;
      sub_100007978(&qword_100074FE0);
      uint64_t inited = swift_initStackObject();
      uint64_t v5 = inited;
      *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
      uint64_t v12 = 1701667182;
      unint64_t v13 = 0xE400000000000000;
LABEL_8:
      *(void *)(inited + 32) = v12;
      *(void *)(inited + 40) = v13;
      *(_OWORD *)(inited + 48) = v24;
      goto LABEL_11;
    case 2:
      long long v14 = v20;
      uint64_t v16 = v21;
      uint64_t v15 = v22;
      sub_100007978(&qword_100074FE0);
      uint64_t v5 = swift_initStackObject();
      *(_OWORD *)(v5 + 16) = xmmword_10005B4C0;
      *(void *)(v5 + 32) = 1701667182;
      *(void *)(v5 + 40) = 0xE400000000000000;
      *(_OWORD *)(v5 + 48) = v14;
      strcpy((char *)(v5 + 64), "learnMoreLink");
      *(_WORD *)(v5 + 78) = -4864;
      *(void *)(v5 + 80) = v16;
      *(void *)(v5 + 88) = v15;
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 3:
    case 5:
      uint64_t v2 = *((void *)&v20 + 1);
      uint64_t v3 = v20;
      sub_100007978(&qword_100074FE0);
      uint64_t v4 = swift_initStackObject();
      uint64_t v5 = v4;
      *(_OWORD *)(v4 + 16) = xmmword_10005B4B0;
      uint64_t v6 = 0x6E69616D6F64;
      unint64_t v7 = 0xE600000000000000;
      goto LABEL_5;
    case 4:
    case 6:
      uint64_t v9 = v21;
      uint64_t v8 = v22;
      long long v10 = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100007978(&qword_100074FE0);
      uint64_t v5 = swift_initStackObject();
      *(_OWORD *)(v5 + 16) = xmmword_10005B4C0;
      strcpy((char *)(v5 + 32), "developerName");
      *(_WORD *)(v5 + 46) = -4864;
      *(_OWORD *)(v5 + 48) = v10;
      strcpy((char *)(v5 + 64), "learnMoreLink");
      *(_WORD *)(v5 + 78) = -4864;
      *(void *)(v5 + 80) = v9;
      *(void *)(v5 + 88) = v8;
      goto LABEL_12;
    case 7:
    case 8:
      uint64_t v2 = *((void *)&v20 + 1);
      uint64_t v3 = v20;
      sub_100007978(&qword_100074FE0);
      uint64_t v4 = swift_initStackObject();
      uint64_t v5 = v4;
      *(_OWORD *)(v4 + 16) = xmmword_10005B4B0;
      uint64_t v6 = 0x656D614E707061;
      unint64_t v7 = 0xE700000000000000;
LABEL_5:
      *(void *)(v4 + 32) = v6;
      *(void *)(v4 + 40) = v7;
      *(void *)(v4 + 48) = v3;
      *(void *)(v4 + 56) = v2;
      sub_1000079BC(v1);
      goto LABEL_12;
    case 9:
      long long v17 = v20;
      sub_100007978(&qword_100074FE0);
      uint64_t v5 = swift_initStackObject();
      *(_OWORD *)(v5 + 16) = xmmword_10005B4B0;
      strcpy((char *)(v5 + 32), "developerName");
      *(_WORD *)(v5 + 46) = -4864;
      *(_OWORD *)(v5 + 48) = v17;
LABEL_11:
      swift_bridgeObjectRetain();
LABEL_12:
      unint64_t result = sub_10004DE3C(v5);
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

void sub_1000076DC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000076E8(uint64_t a1, uint64_t a2)
{
  return sub_1000077E0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007700()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100007754()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000077C8(uint64_t a1, uint64_t a2)
{
  return sub_1000077E0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000077E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100007824(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000789C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000791C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100007960(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100007978(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000079BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000079F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 9u)
  {
    if (((1 << a5) & 0x3AB) == 0) {
      swift_bridgeObjectRetain();
    }
    return swift_bridgeObjectRetain();
  }
  return result;
}

id sub_100007A5C()
{
  return *v0;
}

uint64_t sub_100007A64@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for LocalizationKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LocalizationKey(uint64_t a1)
{
  return sub_100007AC8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t sub_100007AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 <= 9u)
  {
    if (((1 << a5) & 0x3AB) == 0) {
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LocalizationKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1000079F4(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for LocalizationKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1000079F4(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_100007AC8(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for LocalizationKey(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LocalizationKey(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_100007AC8(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizationKey(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF6 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 246);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 0xA) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizationKey(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 246;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100007CF8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 9u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_100007D14(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(void *)__n128 result = a2 - 10;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 10;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalizationKey()
{
  return &type metadata for LocalizationKey;
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_100007D54()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100007DE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007DF0(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100007E5C(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100007EC8(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100007F58()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100007F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10000800C()
{
  return Hasher._finalize()();
}

void *sub_10000806C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_10000807C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100008090@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000080D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100008104(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C58, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100008250(&qword_100074C60, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000081C0()
{
  return sub_100008250(&qword_100074BF0, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100008208()
{
  return sub_100008250(&qword_100074BF8, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100008250(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008298()
{
  return sub_100008250(&qword_100074C00, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000082E0()
{
  return sub_100008250(&qword_100074C08, type metadata accessor for Code);
}

uint64_t sub_100008328()
{
  return sub_100008250(&qword_100074C10, type metadata accessor for LAError);
}

void type metadata accessor for LAError(uint64_t a1)
{
}

void sub_100008384(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000083CC()
{
  return sub_100008250(&qword_100074C18, type metadata accessor for LAError);
}

uint64_t sub_100008414()
{
  return sub_100008250(&qword_100074C20, type metadata accessor for LAError);
}

uint64_t sub_10000845C()
{
  return sub_100008250(&qword_100074C28, type metadata accessor for LAError);
}

uint64_t sub_1000084A4()
{
  return sub_100008250(&qword_100074C30, type metadata accessor for Code);
}

uint64_t sub_1000084EC()
{
  return sub_100008250(&qword_100074C38, type metadata accessor for Code);
}

unint64_t sub_100008538()
{
  unint64_t result = qword_100074C40;
  if (!qword_100074C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100074C40);
  }
  return result;
}

uint64_t sub_10000858C()
{
  return sub_100008250(&qword_100074C48, type metadata accessor for LAError);
}

uint64_t sub_1000085D4(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C18, type metadata accessor for LAError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100008640(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C18, type metadata accessor for LAError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000086B0(uint64_t a1)
{
  uint64_t v2 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_10000871C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100008250(&qword_100074C10, type metadata accessor for LAError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000087A0()
{
  return sub_100008250(&qword_100074C50, type metadata accessor for LAError);
}

uint64_t sub_1000087EC(const char *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v44 = a3;
  uint64_t v43 = a2;
  uint64_t v8 = type metadata accessor for OSSignpostID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v41 = v8;
  uint64_t v42 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v38 = &v35[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  unint64_t v13 = &v35[-v12];
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  long long v17 = &v35[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = type metadata accessor for OSSignposter();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = &v35[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v37 = a1;
  *(void *)(v5 + 16) = a1;
  char v22 = v44;
  *(void *)(v5 + 24) = v43;
  *(unsigned char *)(v5 + 32) = v22;
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  char v23 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 16);
  uint64_t v43 = a4;
  v23(v17, a4, v14);
  OSSignposter.init(logger:)();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v19 + 32))(v5 + OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_signposter, v21, v18);
  static OSSignpostID.exclusive.getter();
  long long v24 = OSSignposter.logHandle.getter();
  int v25 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v27 = v42;
  int v36 = v25;
  if ((v22 & 1) == 0)
  {
    uint64_t v28 = v41;
    v29 = v37;
    if (!v37)
    {
      __break(1u);
LABEL_5:

      uint64_t v28 = v41;
      uint64_t v27 = v42;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v42 + 16))(v38, v13, v41);
LABEL_11:
      type metadata accessor for OSSignpostIntervalState();
      swift_allocObject();
      uint64_t v34 = OSSignpostIntervalState.init(id:isOpen:)();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v40);
      (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v13, v28);
      *(void *)(v5 + OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_interval) = v34;
      return v5;
    }
LABEL_10:
    v30 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v42 + 16);
    v31 = v38;
    v30(v38, v13, v28);
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    os_signpost_id_t v33 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, (os_signpost_type_t)v36, v33, v29, "", v32, 2u);
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v31, v28);
    v30(v31, v13, v28);
    goto LABEL_11;
  }
  uint64_t v28 = v41;
  if ((unint64_t)v37 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v37 >> 11 != 27)
  {
    if (v37 >> 16 <= 0x10)
    {
      v29 = &v45;
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_100008BF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostError();
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = &v24[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for OSSignpostID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v24[-v10];
  uint64_t v12 = *(const char **)(v0 + 16);
  char v13 = *(unsigned char *)(v0 + 32);
  uint64_t v29 = OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_interval;
  v30 = (char *)v12;
  uint64_t v28 = v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel16SignpostInterval_signposter;
  uint64_t v14 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  int v25 = static os_signpost_type_t.end.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  if ((v13 & 1) == 0)
  {
    if (!v30)
    {
      __break(1u);
LABEL_5:

      (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);
      uint64_t v16 = v28;
LABEL_14:
      uint64_t v23 = type metadata accessor for OSSignposter();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v16, v23);
      swift_release();
      return v1;
    }
LABEL_10:
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v18 = v26;
    uint64_t v17 = v27;
    if ((*(unsigned int (**)(unsigned char *, uint64_t))(v26 + 88))(v4, v27) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v19 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v4, v17);
      uint64_t v19 = "";
    }
    uint64_t v16 = v28;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v21 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, (os_signpost_type_t)v25, v21, v30, v19, v20, 2u);
    swift_slowDealloc();

    char v22 = *(void (**)(unsigned char *, uint64_t))(v6 + 8);
    v22(v11, v5);
    v22(v9, v5);
    goto LABEL_14;
  }
  if ((unint64_t)v30 >> 32)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v30 >> 11 != 27)
  {
    if (v30 >> 16 <= 0x10)
    {
      v30 = &v31;
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_100008F70()
{
  sub_100008BF4();

  return swift_deallocClassInstance();
}

uint64_t sub_100008FC8()
{
  return type metadata accessor for SignpostInterval();
}

uint64_t type metadata accessor for SignpostInterval()
{
  uint64_t result = qword_100074CF8;
  if (!qword_100074CF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000901C()
{
  uint64_t result = type metadata accessor for OSSignposter();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000093FC(char a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  int v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - v7;
  type metadata accessor for MainActor();
  uint64_t v9 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = (objc_class *)type metadata accessor for LicenseResolutionViewController();
  v47.receiver = v1;
  v47.super_class = v10;
  [super viewDidAppear:a1 & 1];
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_10000AEDC(v11, (uint64_t)qword_100078088);
  id v12 = v1;
  char v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v40 = v14;
    uint64_t v41 = v4;
    uint64_t v42 = v3;
    uint64_t v43 = v9;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v46 = v39;
    *(_DWORD *)uint64_t v15 = 136446467;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = LicenseResolutionContext.logKey.getter();
    unint64_t v18 = v17;
    swift_release();
    uint64_t v45 = sub_100057B1C(v16, v18, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2085;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    LicenseResolutionContext.url.getter();
    swift_release();
    sub_10000AFD4();
    uint64_t v3 = v42;
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v21 = v20;
    uint64_t v22 = v41;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v3);
    uint64_t v45 = sub_100057B1C(v19, v21, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v40, "[%{public}s] Activating license resolution sheet: %{sensitive}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v22;
    swift_slowDealloc();

    uint64_t v23 = v44;
  }
  else
  {

    uint64_t v23 = v44;
  }
  LicenseResolutionContext.url.getter();
  id v24 = objc_allocWithZone((Class)SFSafariViewController);
  URL._bridgeToObjectiveC()(v25);
  uint64_t v27 = v26;
  id v28 = [v24 initWithURL:v26];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
  [v28 setModalPresentationStyle:2];
  [v28 setDelegate:v12];
  id v29 = [v28 presentationController];
  if (v29)
  {
    v30 = v29;
    [v29 setDelegate:v12];
  }
  id v31 = [v12 view];
  if (!v31)
  {
    __break(1u);
    goto LABEL_22;
  }
  v32 = v31;
  id v33 = [v31 window];

  if (v33)
  {
    id v34 = [v33 _rootSheetPresentationController];

    if (v34)
    {
      [v34 _setShouldScaleDownBehindDescendantSheets:0];

      goto LABEL_18;
    }
LABEL_22:
    __break(1u);
    return;
  }
LABEL_18:
  id v35 = [self blackColor];
  int v36 = v35;
  double v37 = 0.8;
  if (*((unsigned char *)v12 + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad)) {
    double v37 = 0.4;
  }
  id v38 = [v35 colorWithAlphaComponent:v37];

  sub_100009AF8(v38);
  [v12 presentViewController:v28 animated:1 completion:0];
  swift_release();
}

uint64_t sub_100009AF8(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  v9[4] = sub_10000AFCC;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000535E8;
  v9[3] = &unk_10006E208;
  uint64_t v5 = _Block_copy(v9);
  id v6 = v1;
  id v7 = a1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
  return swift_release();
}

void sub_100009C5C(void *a1, uint64_t a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = [a1 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setBackgroundColor:a2];
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100009D40()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  id v2 = v0;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v5 = 136446210;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v6 = LicenseResolutionContext.logKey.getter();
    unint64_t v8 = v7;
    swift_release();
    sub_100057B1C(v6, v8, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%{public}s] Completing license resolution request", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v9 = [self clearColor];
  sub_100009AF8(v9);

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v2;
  aBlock[4] = (uint64_t)sub_10000AF4C;
  aBlock[5] = v10;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000535E8;
  aBlock[3] = (uint64_t)&unk_10006E1B8;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v2;
  swift_release();
  [v12 dismissViewControllerAnimated:1 completion:v11];
  _Block_release(v11);
  return swift_release();
}

uint64_t sub_10000A094(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = (uint64_t *)(a1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction);
  uint64_t v3 = *(void (**)(uint64_t))(a1
                                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction);
  sub_10000AF6C((uint64_t)v3);
  uint64_t v4 = swift_release();
  if (v3)
  {
    v3(v4);
    sub_10000AF7C((uint64_t)v3);
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = *v2;
  uint64_t *v2 = 0;
  v2[1] = 0;
  sub_10000AF7C(v5);
  swift_release();

  return swift_release();
}

id sub_10000A2B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LicenseResolutionViewController();
  return [super dealloc];
}

uint64_t sub_10000A374()
{
  return type metadata accessor for LicenseResolutionViewController();
}

uint64_t type metadata accessor for LicenseResolutionViewController()
{
  uint64_t result = qword_100074DD0;
  if (!qword_100074DD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000A3C8()
{
  uint64_t result = type metadata accessor for LicenseResolutionContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000A46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_10000A48C, 0, 0);
}

uint64_t sub_10000A48C()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 24) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000A520, v2, v1);
}

uint64_t sub_10000A520()
{
  swift_release();
  sub_100009D40();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_10000A704(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad;
  uint64_t v5 = self;
  uint64_t v6 = v1;
  id v7 = [v5 currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  v1[v4] = v8 == (id)1;
  id v9 = &v6[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_sheetContext];
  uint64_t v10 = type metadata accessor for LicenseResolutionContext();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);

  v14.receiver = v6;
  v14.super_class = (Class)type metadata accessor for LicenseResolutionViewController();
  [super initWithNibName:0 bundle:0];
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v12;
}

uint64_t sub_10000A854()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
  *uint64_t v1 = 0;
  v1[1] = 0;
  uint64_t v2 = OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad;
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  v0[v2] = v4 == (id)1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000A978()
{
  uint64_t v1 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_10000AD8C((uint64_t)v3);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_100074EB0;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_10000ABB0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000ABF0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_10000AC98;
  v3[2] = v2;
  return _swift_task_switch(sub_10000A48C, 0, 0);
}

uint64_t sub_10000AC98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000AD8C(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100074EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000ADEC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000AE24(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000AC98;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100075F20 + dword_100075F20);
  return v6(a1, v4);
}

uint64_t sub_10000AEDC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000AF14()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AF4C()
{
  return sub_10000A094(*(void *)(v0 + 16));
}

uint64_t sub_10000AF54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000AF64()
{
  return swift_release();
}

uint64_t sub_10000AF6C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10000AF7C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000AF8C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000AFCC()
{
  sub_100009C5C(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10000AFD4()
{
  unint64_t result = qword_100074EC0;
  if (!qword_100074EC0)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100074EC0);
  }
  return result;
}

uint64_t sub_10000B034()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_10000B054, 0, 0);
}

uint64_t sub_10000B054()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 5);
  uint64_t v1 = (void *)v0[5];
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000AEDC(v3, (uint64_t)qword_100078088);
  id v4 = v1;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (char *)v0[5];
  if (v7)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v11 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    v0[4] = v11;
    id v12 = v11;
    uint64_t v2 = (id *)(v0 + 5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v10 = v11;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@] Running OAuth web authentication task", v9, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v13 = [self identityOfCurrentProcess];
  v0[6] = v13;
  if (v13)
  {
    objc_super v14 = v13;
    uint64_t v15 = v0[5];
    id v16 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    id v17 = v14;
    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v16 initWithSceneProvidingProcess:v17 configurationIdentifier:v18];
    v0[7] = v19;

    uint64_t v20 = swift_task_alloc();
    v0[8] = v20;
    *(void *)(v20 + 16) = v15;
    *(void *)(v20 + 24) = v19;
    unint64_t v21 = (void *)swift_task_alloc();
    v0[9] = v21;
    uint64_t v22 = sub_100007978(&qword_100074F90);
    *unint64_t v21 = v0;
    v21[1] = sub_10000B4C8;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 3, 0, 0, 0x29286E7572, 0xE500000000000000, sub_10000D48C, v20, v22);
  }
  else
  {
    id v23 = *v2;
    id v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = (char *)*v2;
    if (v26)
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      id v29 = (void *)swift_slowAlloc();
      *(_DWORD *)id v28 = 138412290;
      v30 = *(void **)&v27[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
      v0[2] = v30;
      id v31 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v29 = v30;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No identity", v28, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v24 = *v2;
    }

    unint64_t v32 = sub_10004DE3C((uint64_t)&_swiftEmptyArrayStorage);
    id v33 = (uint64_t (*)(unint64_t))v0[1];
    return v33(v32);
  }
}

uint64_t sub_10000B4C8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_10000B5E0, 0, 0);
}

uint64_t sub_10000B5E0()
{
  uint64_t v1 = *(void **)(v0 + 56);

  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

void sub_10000B648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a3;
  uint64_t v5 = sub_100007978(&qword_100074F98);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext) init];
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v37 = a1;
  v11(v8, a1, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, v8, v5);
  uint64_t v42 = sub_10000D59C;
  uint64_t v43 = v13;
  unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
  unint64_t v39 = 1107296256;
  int v40 = sub_10001D994;
  uint64_t v41 = &unk_10006E280;
  objc_super v14 = _Block_copy(&aBlock);
  uint64_t v15 = self;
  swift_retain();
  id v16 = [v15 responderWithHandler:v14];
  _Block_release(v14);
  swift_release();
  swift_release();
  id v17 = [objc_allocWithZone((Class)BSAction) initWithInfo:0 responder:v16];
  sub_100007978((uint64_t *)&unk_100074FA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005BA50;
  *(void *)(inited + 32) = v17;
  unint64_t aBlock = inited;
  specialized Array._endMutation()();
  unint64_t v19 = aBlock;
  if (aBlock >> 62)
  {
    id v22 = v17;
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v23) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v20 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v21 = v17;
  if (v20) {
LABEL_3:
  }
    sub_100046A14(v19);
LABEL_5:
  swift_bridgeObjectRelease();
  sub_10000D62C();
  sub_10000D66C((unint64_t *)&qword_100074FB0, (void (*)(uint64_t))sub_10000D62C);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v9 setActions:isa];

  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  type metadata accessor for OAuthAuthorizationContext();
  os_log_type_t v25 = v9;
  sub_10000D66C(&qword_100074FB8, (void (*)(uint64_t))&type metadata accessor for OAuthAuthorizationContext);
  uint64_t v26 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v28 = v27;
  swift_release();
  sub_100007978(&qword_100074FC0);
  uint64_t v29 = swift_initStackObject();
  *(_OWORD *)(v29 + 16) = xmmword_10005B4B0;
  unint64_t aBlock = 0x44747865746E6F63;
  unint64_t v39 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)();
  *(void *)(v29 + 96) = &type metadata for Data;
  *(void *)(v29 + 72) = v26;
  *(void *)(v29 + 80) = v28;
  sub_10000D6B4(v26, v28);
  sub_10004DF60(v29);
  Class v30 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v25 setUserInfo:v30];

  id v31 = [self newHandleWithDefinition:v36 configurationContext:v25];
  unint64_t v32 = *(void **)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle);
  *(void *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle) = v31;
  id v33 = v31;

  [v33 registerObserver:a2];
  id v34 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
  [v33 activateWithContext:v34];

  sub_10000D70C(v26, v28);
}

void sub_10000BD88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v63 = type metadata accessor for URLQueryItem();
  uint64_t v5 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007978(&qword_100074FC8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URLComponents();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  objc_super v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  id v16 = (void *)Strong;
  id v17 = [a1 info];
  if (!v17)
  {
    long long v65 = 0u;
    long long v66 = 0u;
LABEL_11:
    id v21 = &qword_100074FD0;
    id v22 = (char *)&v65;
    goto LABEL_12;
  }
  NSString v18 = v17;
  uint64_t v19 = v5;
  id v20 = [v17 objectForSetting:2];

  if (v20)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v64, 0, sizeof(v64));
  }
  sub_10000D764((uint64_t)v64, (uint64_t)&v65);
  if (!*((void *)&v66 + 1)) {
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_10000AEDC(v23, (uint64_t)qword_100078088);
    id v24 = v16;
    os_log_type_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      unint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 138412290;
      uint64_t v29 = *(Class *)((char *)&v24->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey);
      *(void *)&long long v65 = v29;
      id v30 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v28 = v29;

      _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%@] No response provided, defaulting to cancel.", v27, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      os_log_type_t v25 = v24;
    }

    *(void *)&long long v65 = sub_10004DE3C((uint64_t)&_swiftEmptyArrayStorage);
    sub_100007978(&qword_100074F98);
    CheckedContinuation.resume(returning:)();

    return;
  }
  URLComponents.init(string:)();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    id v21 = &qword_100074FC8;
    id v22 = v10;
LABEL_12:
    sub_10000D7CC((uint64_t)v22, v21);
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  uint64_t v31 = URLComponents.queryItems.getter();
  if (!v31)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_13;
  }
  v54 = v14;
  uint64_t v55 = v12;
  uint64_t v56 = v11;
  v57 = v16;
  uint64_t v58 = a3;
  uint64_t v32 = *(void *)(v31 + 16);
  uint64_t v53 = v31;
  if (v32)
  {
    uint64_t v34 = v19 + 16;
    id v33 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    unint64_t v35 = v31 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    uint64_t v61 = *(void *)(v19 + 72);
    v62 = v33;
    v60 = (void (**)(char *, uint64_t))(v19 + 8);
    uint64_t v36 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v37 = v63;
    uint64_t v59 = v34;
    v33(v7, v35, v63);
    while (1)
    {
      uint64_t v38 = URLQueryItem.value.getter();
      if (v39)
      {
        uint64_t v40 = v38;
        uint64_t v41 = v39;
        uint64_t v42 = URLQueryItem.name.getter();
        uint64_t v44 = v43;
        (*v60)(v7, v37);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v36 = sub_10000C758(0, *((void *)v36 + 2) + 1, 1, v36);
        }
        unint64_t v46 = *((void *)v36 + 2);
        unint64_t v45 = *((void *)v36 + 3);
        if (v46 >= v45 >> 1) {
          uint64_t v36 = sub_10000C758((char *)(v45 > 1), v46 + 1, 1, v36);
        }
        *((void *)v36 + 2) = v46 + 1;
        objc_super v47 = &v36[32 * v46];
        *((void *)v47 + 4) = v42;
        *((void *)v47 + 5) = v44;
        *((void *)v47 + 6) = v40;
        *((void *)v47 + 7) = v41;
        uint64_t v37 = v63;
      }
      else
      {
        (*v60)(v7, v37);
      }
      v35 += v61;
      if (!--v32) {
        break;
      }
      v62(v7, v35, v37);
    }
  }
  else
  {
    uint64_t v36 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease();
  if (*((void *)v36 + 2))
  {
    sub_100007978(&qword_100074FD8);
    v48 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v48 = &_swiftEmptyDictionarySingleton;
  }
  v49 = v57;
  uint64_t v51 = v55;
  uint64_t v50 = v56;
  v52 = v54;
  *(void *)&long long v65 = v48;
  sub_10000C974((uint64_t)v36, 1, &v65);
  swift_bridgeObjectRelease();
  sub_100007978(&qword_100074F98);
  CheckedContinuation.resume(returning:)();

  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v50);
}

id sub_10000C464()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OAuthAuthorizationTask();
  return [super dealloc];
}

uint64_t sub_10000C52C()
{
  return type metadata accessor for OAuthAuthorizationTask();
}

uint64_t type metadata accessor for OAuthAuthorizationTask()
{
  uint64_t result = qword_100074F10;
  if (!qword_100074F10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C580()
{
  uint64_t result = type metadata accessor for OAuthAuthorizationContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_10000C758(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100007978(&qword_100074FE0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000C868(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C868(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_100007978(&qword_100074FE8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C974(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    unint64_t v6 = (void *)swift_bridgeObjectRetain();
    uint64_t v8 = v6[4];
    uint64_t v7 = v6[5];
    uint64_t v9 = v6[7];
    uint64_t v54 = v6[6];
    uint64_t v55 = v6;
    uint64_t v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_1000502D4(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    char v16 = v11;
    if (v10[3] < v15)
    {
      sub_100051460(v15, a2 & 1);
      unint64_t v17 = sub_1000502D4(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_27:
        uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
        __break(1u);
        return result;
      }
      unint64_t v12 = v17;
      uint64_t v19 = (void *)*a3;
      if ((v16 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      id v20 = (uint64_t *)(v19[7] + 16 * v12);
      id v21 = a3;
      uint64_t v23 = *v20;
      uint64_t v22 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v24 = (void *)(v19[7] + 16 * v12);
      swift_bridgeObjectRelease();
      *id v24 = v23;
      v24[1] = v22;
      a3 = v21;
      uint64_t v25 = v3 - 1;
      if (v3 == 1) {
        return swift_bridgeObjectRelease();
      }
LABEL_16:
      uint64_t v31 = v55 + 11;
      uint64_t v56 = a3;
      while (1)
      {
        uint64_t v37 = *(v31 - 3);
        uint64_t v36 = *(v31 - 2);
        uint64_t v38 = *(v31 - 1);
        uint64_t v39 = *v31;
        uint64_t v40 = *a3;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v41 = sub_1000502D4(v37, v36);
        uint64_t v43 = *(void *)(v40 + 16);
        BOOL v44 = (v42 & 1) == 0;
        BOOL v29 = __OFADD__(v43, v44);
        uint64_t v45 = v43 + v44;
        if (v29) {
          goto LABEL_25;
        }
        char v46 = v42;
        if (*(void *)(v40 + 24) < v45)
        {
          sub_100051460(v45, 1);
          unint64_t v41 = sub_1000502D4(v37, v36);
          if ((v46 & 1) != (v47 & 1)) {
            goto LABEL_27;
          }
        }
        v48 = (void *)*a3;
        uint64_t v49 = 16 * v41;
        if (v46)
        {
          uint64_t v32 = (uint64_t *)(v48[7] + v49);
          uint64_t v34 = *v32;
          uint64_t v33 = v32[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v35 = (void *)(v48[7] + v49);
          swift_bridgeObjectRelease();
          *unint64_t v35 = v34;
          v35[1] = v33;
          a3 = v56;
        }
        else
        {
          v48[(v41 >> 6) + 8] |= 1 << v41;
          uint64_t v50 = (uint64_t *)(v48[6] + v49);
          *uint64_t v50 = v37;
          v50[1] = v36;
          uint64_t v51 = (void *)(v48[7] + v49);
          *uint64_t v51 = v38;
          v51[1] = v39;
          uint64_t v52 = v48[2];
          BOOL v29 = __OFADD__(v52, 1);
          uint64_t v53 = v52 + 1;
          a3 = v56;
          if (v29) {
            goto LABEL_26;
          }
          v48[2] = v53;
        }
        v31 += 4;
        if (!--v25) {
          return swift_bridgeObjectRelease();
        }
      }
    }
    if (a2)
    {
      uint64_t v19 = (void *)*a3;
      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_100050C2C();
      uint64_t v19 = (void *)*a3;
      if (v16) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    os_log_type_t v26 = (uint64_t *)(v19[6] + 16 * v12);
    *os_log_type_t v26 = v8;
    v26[1] = v7;
    unint64_t v27 = (void *)(v19[7] + 16 * v12);
    *unint64_t v27 = v54;
    v27[1] = v9;
    uint64_t v28 = v19[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v19[2] = v30;
    uint64_t v25 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

void sub_10000CC78()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  uint64_t v7 = v0;
  objc_super v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    unint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    id v6 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v8;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10000CE4C()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  objc_super v2 = v0;
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 138412290;
    char v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
    id v7 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v6 = v11;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v8 = OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle;
  uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle];
  if (v9)
  {
    [v9 unregisterObserver:v2];
    uint64_t v9 = *(void **)&v2[v8];
  }
  [v9 invalidate];
  uint64_t v10 = *(void **)&v2[v8];
  *(void *)&v2[v8] = 0;
}

void sub_10000D02C(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle;
  os_log_type_t v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle];
  if (v4)
  {
    [v4 unregisterObserver:v1];
    os_log_type_t v4 = *(void **)&v1[v3];
  }
  [v4 invalidate];
  unint64_t v5 = *(void **)&v1[v3];
  *(void *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain();
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000AEDC(v6, (uint64_t)qword_100078088);
    swift_errorRetain();
    id v7 = v1;
    swift_errorRetain();
    uint64_t v8 = v7;
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      char v11 = (void *)swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412546;
      unint64_t v12 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey];
      id v13 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *char v11 = v12;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      sub_100057B1C(v14, v15, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000AEDC(v16, (uint64_t)qword_100078088);
    oslog = v1;
    unint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      id v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      id v23 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey);
      id v21 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v20 = v23;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@] Remote alert did invalidate", v19, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

void sub_10000D48C(uint64_t a1)
{
  sub_10000B648(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000D494()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000D4CC()
{
  uint64_t v1 = sub_100007978(&qword_100074F98);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10000D59C(void *a1)
{
  uint64_t v3 = *(void *)(sub_100007978(&qword_100074F98) - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  sub_10000BD88(a1, v4, v5);
}

uint64_t sub_10000D614(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D624()
{
  return swift_release();
}

unint64_t sub_10000D62C()
{
  unint64_t result = qword_1000763E0;
  if (!qword_1000763E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000763E0);
  }
  return result;
}

uint64_t sub_10000D66C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000D6B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D70C(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100074FD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D7CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007978(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D82C()
{
  id v1 = [objc_allocWithZone((Class)type metadata accessor for LaunchAngelService()) init];
  uint64_t v2 = (objc_class *)type metadata accessor for LaunchAngelServiceDelegate();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service] = v1;
  v12.receiver = v3;
  v12.super_class = v2;
  id v4 = [super init];
  v10[2] = v4;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_10000DB40;
  *(void *)(v5 + 24) = v10;
  aBlock[4] = sub_10000DB58;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000DA88;
  aBlock[3] = &unk_10006E2D0;
  uint64_t v6 = _Block_copy(aBlock);
  id v7 = self;
  swift_retain();
  id v8 = [v7 listenerWithConfigurator:v6];
  _Block_release(v6);
  swift_release();
  LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v0 + 16) = v8;
    *(void *)(v0 + 24) = v4;
    return v0;
  }
  return result;
}

id sub_10000D9C8(void *a1, uint64_t a2)
{
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 setDomain:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

uint64_t sub_10000DA88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_10000DADC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LaunchAngelXPCServer()
{
  return self;
}

id sub_10000DB40(void *a1)
{
  return sub_10000D9C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000DB48()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DB58()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000DB80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000DB90()
{
  return swift_release();
}

void *sub_10000DB98(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for InstallSheetContext();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    os_log_type_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_100007978((uint64_t *)&unk_1000755C0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    unint64_t v17 = (void *)((char *)a1 + v15);
    os_log_type_t v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    *unint64_t v17 = *v18;
    v17[1] = v19;
    id v20 = (void *)((char *)a1 + v16);
    id v21 = (void *)((char *)a2 + v16);
    uint64_t v22 = v21[1];
    *id v20 = *v21;
    v20[1] = v22;
    uint64_t v23 = a3[8];
    id v24 = (char *)a1 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = *(void *)v25;
    uint64_t v27 = *((void *)v25 + 1);
    char v28 = v25[16];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000DED4();
    *(void *)id v24 = v26;
    *((void *)v24 + 1) = v27;
    v24[16] = v28;
    uint64_t v29 = a3[9];
    uint64_t v30 = a3[10];
    uint64_t v31 = (void *)((char *)a1 + v29);
    uint64_t v32 = (void *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    uint64_t v34 = (void *)((char *)a1 + v30);
    unint64_t v35 = (void *)((char *)a2 + v30);
    uint64_t v74 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v74;
    uint64_t v36 = a3[11];
    uint64_t v37 = a3[12];
    uint64_t v38 = (void *)((char *)a1 + v36);
    uint64_t v39 = (void *)((char *)a2 + v36);
    uint64_t v40 = v39[1];
    void *v38 = *v39;
    v38[1] = v40;
    unint64_t v41 = (void *)((char *)a1 + v37);
    char v42 = (void *)((char *)a2 + v37);
    uint64_t v43 = v42[1];
    *unint64_t v41 = *v42;
    v41[1] = v43;
    uint64_t v44 = a3[13];
    uint64_t v45 = a3[14];
    char v46 = (void *)((char *)a1 + v44);
    char v47 = (void *)((char *)a2 + v44);
    uint64_t v48 = v47[1];
    *char v46 = *v47;
    v46[1] = v48;
    uint64_t v49 = (void *)((char *)a1 + v45);
    uint64_t v50 = (void *)((char *)a2 + v45);
    uint64_t v51 = v50[1];
    void *v49 = *v50;
    v49[1] = v51;
    uint64_t v52 = a3[15];
    uint64_t v53 = a3[16];
    uint64_t v54 = (void *)((char *)a1 + v52);
    uint64_t v55 = (void *)((char *)a2 + v52);
    uint64_t v56 = v55[1];
    void *v54 = *v55;
    v54[1] = v56;
    *((unsigned char *)a1 + v53) = *((unsigned char *)a2 + v53);
    uint64_t v57 = a3[17];
    uint64_t v58 = a3[18];
    uint64_t v59 = (void *)((char *)a1 + v57);
    v60 = (void *)((char *)a2 + v57);
    uint64_t v61 = v60[1];
    *uint64_t v59 = *v60;
    v59[1] = v61;
    v62 = (void *)((char *)a1 + v58);
    uint64_t v63 = (void *)((char *)a2 + v58);
    uint64_t v64 = v63[1];
    void *v62 = *v63;
    v62[1] = v64;
    uint64_t v65 = a3[19];
    uint64_t v66 = a3[20];
    v67 = (void *)((char *)a1 + v65);
    v68 = (void *)((char *)a2 + v65);
    uint64_t v69 = v68[1];
    void *v67 = *v68;
    v67[1] = v69;
    v70 = (void *)((char *)a1 + v66);
    v71 = (void *)((char *)a2 + v66);
    uint64_t v72 = v71[1];
    void *v70 = *v71;
    v70[1] = v72;
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

uint64_t sub_10000DED4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallSheetContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000E0B8();
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

uint64_t sub_10000E0B8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E0C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  os_log_type_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100007978((uint64_t *)&unk_1000755C0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  os_log_type_t v18 = (void *)(a1 + v14);
  uint64_t v19 = (void *)(a2 + v14);
  uint64_t v20 = v19[1];
  *os_log_type_t v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  char v26 = *((unsigned char *)v23 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000DED4();
  *(void *)uint64_t v22 = v24;
  *(void *)(v22 + 8) = v25;
  *(unsigned char *)(v22 + 16) = v26;
  uint64_t v27 = a3[9];
  uint64_t v28 = a3[10];
  uint64_t v29 = (void *)(a1 + v27);
  uint64_t v30 = (void *)(a2 + v27);
  uint64_t v31 = v30[1];
  void *v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = (void *)(a1 + v28);
  uint64_t v33 = (void *)(a2 + v28);
  uint64_t v72 = v33[1];
  void *v32 = *v33;
  v32[1] = v72;
  uint64_t v34 = a3[11];
  uint64_t v35 = a3[12];
  uint64_t v36 = (void *)(a1 + v34);
  uint64_t v37 = (void *)(a2 + v34);
  uint64_t v38 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v38;
  uint64_t v39 = (void *)(a1 + v35);
  uint64_t v40 = (void *)(a2 + v35);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  uint64_t v42 = a3[13];
  uint64_t v43 = a3[14];
  uint64_t v44 = (void *)(a1 + v42);
  uint64_t v45 = (void *)(a2 + v42);
  uint64_t v46 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v46;
  char v47 = (void *)(a1 + v43);
  uint64_t v48 = (void *)(a2 + v43);
  uint64_t v49 = v48[1];
  *char v47 = *v48;
  v47[1] = v49;
  uint64_t v50 = a3[15];
  uint64_t v51 = a3[16];
  uint64_t v52 = (void *)(a1 + v50);
  uint64_t v53 = (void *)(a2 + v50);
  uint64_t v54 = v53[1];
  void *v52 = *v53;
  v52[1] = v54;
  *(unsigned char *)(a1 + v51) = *(unsigned char *)(a2 + v51);
  uint64_t v55 = a3[17];
  uint64_t v56 = a3[18];
  uint64_t v57 = (void *)(a1 + v55);
  uint64_t v58 = (void *)(a2 + v55);
  uint64_t v59 = v58[1];
  void *v57 = *v58;
  v57[1] = v59;
  v60 = (void *)(a1 + v56);
  uint64_t v61 = (void *)(a2 + v56);
  uint64_t v62 = v61[1];
  void *v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = a3[19];
  uint64_t v64 = a3[20];
  uint64_t v65 = (void *)(a1 + v63);
  uint64_t v66 = (void *)(a2 + v63);
  uint64_t v67 = v66[1];
  *uint64_t v65 = *v66;
  v65[1] = v67;
  v68 = (void *)(a1 + v64);
  uint64_t v69 = (void *)(a2 + v64);
  uint64_t v70 = v69[1];
  void *v68 = *v69;
  v68[1] = v70;
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
  return a1;
}

uint64_t sub_10000E3B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  os_log_type_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL();
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
    uint64_t v15 = sub_100007978((uint64_t *)&unk_1000755C0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (void *)(a1 + v16);
  os_log_type_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  *uint64_t v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v25 = *v24;
  uint64_t v26 = v24[1];
  char v27 = *((unsigned char *)v24 + 16);
  sub_10000DED4();
  *(void *)uint64_t v23 = v25;
  *(void *)(v23 + 8) = v26;
  *(unsigned char *)(v23 + 16) = v27;
  sub_10000E0B8();
  uint64_t v28 = a3[9];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  void *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  void *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[11];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  *uint64_t v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[12];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  void *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[13];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  *uint64_t v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v43 = a3[14];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (void *)(a2 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[15];
  char v47 = (void *)(a1 + v46);
  uint64_t v48 = (void *)(a2 + v46);
  *char v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v49 = a3[17];
  uint64_t v50 = (void *)(a1 + v49);
  uint64_t v51 = (void *)(a2 + v49);
  *uint64_t v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v52 = a3[18];
  uint64_t v53 = (void *)(a1 + v52);
  uint64_t v54 = (void *)(a2 + v52);
  *uint64_t v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[19];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = (void *)(a2 + v55);
  *uint64_t v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = a3[20];
  uint64_t v59 = (void *)(a1 + v58);
  v60 = (void *)(a2 + v58);
  *uint64_t v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000E7EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  os_log_type_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_100007978((uint64_t *)&unk_1000755C0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v17 + 16);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)(a2 + v15);
  uint64_t v18 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  uint64_t v19 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  uint64_t v20 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  uint64_t v21 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v21) = *(_OWORD *)(a2 + v21);
  uint64_t v22 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  *(_OWORD *)(a1 + a3[20]) = *(_OWORD *)(a2 + a3[20]);
  return a1;
}

uint64_t sub_10000E9EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  os_log_type_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL();
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
    uint64_t v15 = sub_100007978((uint64_t *)&unk_1000755C0);
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
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[8];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = a2 + v26;
  char v29 = *(unsigned char *)(v28 + 16);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  *(unsigned char *)(v27 + 16) = v29;
  sub_10000E0B8();
  uint64_t v30 = a3[9];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[10];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (uint64_t *)(a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  *uint64_t v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[11];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (uint64_t *)(a2 + v40);
  uint64_t v44 = *v42;
  uint64_t v43 = v42[1];
  *uint64_t v41 = v44;
  v41[1] = v43;
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[12];
  uint64_t v46 = (void *)(a1 + v45);
  char v47 = (uint64_t *)(a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *uint64_t v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  uint64_t v50 = a3[13];
  uint64_t v51 = (void *)(a1 + v50);
  uint64_t v52 = (uint64_t *)(a2 + v50);
  uint64_t v54 = *v52;
  uint64_t v53 = v52[1];
  *uint64_t v51 = v54;
  v51[1] = v53;
  swift_bridgeObjectRelease();
  uint64_t v55 = a3[14];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = (uint64_t *)(a2 + v55);
  uint64_t v59 = *v57;
  uint64_t v58 = v57[1];
  *uint64_t v56 = v59;
  v56[1] = v58;
  swift_bridgeObjectRelease();
  uint64_t v60 = a3[15];
  uint64_t v61 = (void *)(a1 + v60);
  uint64_t v62 = (uint64_t *)(a2 + v60);
  uint64_t v64 = *v62;
  uint64_t v63 = v62[1];
  *uint64_t v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  uint64_t v66 = (void *)(a1 + v65);
  uint64_t v67 = (uint64_t *)(a2 + v65);
  uint64_t v69 = *v67;
  uint64_t v68 = v67[1];
  *uint64_t v66 = v69;
  v66[1] = v68;
  swift_bridgeObjectRelease();
  uint64_t v70 = a3[18];
  v71 = (void *)(a1 + v70);
  uint64_t v72 = (uint64_t *)(a2 + v70);
  uint64_t v74 = *v72;
  uint64_t v73 = v72[1];
  void *v71 = v74;
  v71[1] = v73;
  swift_bridgeObjectRelease();
  uint64_t v75 = a3[19];
  v76 = (void *)(a1 + v75);
  v77 = (uint64_t *)(a2 + v75);
  uint64_t v79 = *v77;
  uint64_t v78 = v77[1];
  void *v76 = v79;
  v76[1] = v78;
  swift_bridgeObjectRelease();
  uint64_t v80 = a3[20];
  v81 = (void *)(a1 + v80);
  v82 = (uint64_t *)(a2 + v80);
  uint64_t v84 = *v82;
  uint64_t v83 = v82[1];
  void *v81 = v84;
  v81[1] = v83;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000ED44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000ED58);
}

uint64_t sub_10000ED58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    os_log_type_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100007978((uint64_t *)&unk_1000755C0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    os_log_type_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_10000EE74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000EE88);
}

uint64_t sub_10000EE88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for InstallSheetContext();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100007978((uint64_t *)&unk_1000755C0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LocalizedCombinedApprovalAndInstallContent()
{
  uint64_t result = qword_100075150;
  if (!qword_100075150) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000EFEC()
{
  type metadata accessor for InstallSheetContext();
  if (v0 <= 0x3F)
  {
    sub_10000F0E8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000F0E8()
{
  if (!qword_100075160)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100075160);
    }
  }
}

uint64_t sub_10000F140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[111] = a4;
  v4[110] = a3;
  v4[109] = a2;
  v4[108] = a1;
  uint64_t v5 = type metadata accessor for InstallSheetContext.InstallType();
  v4[112] = v5;
  v4[113] = *(void *)(v5 - 8);
  v4[114] = swift_task_alloc();
  v4[115] = swift_task_alloc();
  v4[116] = swift_task_alloc();
  return _swift_task_switch(sub_10000F228, 0, 0);
}

uint64_t sub_10000F228()
{
  uint64_t v1 = *(void *)(v0 + 872);
  uint64_t v2 = *(void *)(v0 + 864);
  uint64_t v3 = type metadata accessor for InstallSheetContext();
  *(void *)(v0 + 936) = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)(v0 + 944) = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  uint64_t v5 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  *(void *)(v0 + 952) = v5;
  InstallSheetContext.Source.WebInstallContext.iconURL.getter();
  uint64_t v6 = InstallSheetContext.Source.WebInstallContext.appName.getter();
  uint64_t v7 = (uint64_t *)(v2 + *(int *)(v5 + 24));
  *uint64_t v7 = v6;
  v7[1] = v8;
  *(void *)(v0 + 16) = 8;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 48) = 10;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 960) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10000F370;
  return sub_100042C74(v0 + 16);
}

uint64_t sub_10000F370(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 968) = a1;
  *(void *)(v3 + 976) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000F474, 0, 0);
}

uint64_t sub_10000F474()
{
  uint64_t v1 = *(void *)(v0 + 952);
  uint64_t v2 = *(void *)(v0 + 928);
  uint64_t v3 = *(void *)(v0 + 904);
  uint64_t v4 = *(void *)(v0 + 896);
  uint64_t v5 = *(void *)(v0 + 864);
  String.append(_:)(*(Swift::String *)(v0 + 968));
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 10333;
  v6._object = (void *)0xE200000000000000;
  String.append(_:)(v6);
  v7._countAndFlagsBits = InstallSheetContext.learnMoreURL.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 41;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  *(void *)(v0 + 984) = 91;
  *(void *)(v0 + 992) = 0xE100000000000000;
  uint64_t v9 = (void *)(v5 + *(int *)(v1 + 52));
  *uint64_t v9 = 91;
  v9[1] = 0xE100000000000000;
  swift_bridgeObjectRetain();
  InstallSheetContext.type.getter();
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v10 == enum case for InstallSheetContext.InstallType.app(_:))
  {
    uint64_t v11 = v0 + 336;
    uint64_t v12 = InstallSheetContext.Source.WebInstallContext.domain.getter();
    *(void *)(v0 + 1000) = v13;
    *(void *)(v0 + 336) = v12;
    *(void *)(v0 + 344) = v13;
    *(void *)(v0 + 352) = 0;
    *(void *)(v0 + 360) = 0;
    *(unsigned char *)(v0 + 368) = 5;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 1008) = v14;
    *uint64_t v14 = v0;
    uint64_t v15 = sub_10000F704;
  }
  else
  {
    if (v10 != enum case for InstallSheetContext.InstallType.marketplace(_:)) {
      return _assertionFailure(_:_:file:line:flags:)();
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = InstallSheetContext.Source.WebInstallContext.developerName.getter();
    *(void *)(v0 + 1096) = v17;
    *(void *)(v0 + 56) = v16;
    uint64_t v11 = v0 + 56;
    *(void *)(v0 + 72) = 0;
    *(void *)(v0 + 80) = 0;
    *(void *)(v0 + 64) = v17;
    *(unsigned char *)(v0 + 88) = 9;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 1104) = v14;
    *uint64_t v14 = v0;
    uint64_t v15 = sub_10000FEBC;
  }
  v14[1] = v15;
  return sub_100042C74(v11);
}

uint64_t sub_10000F704(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1016) = a1;
  *(void *)(v3 + 1024) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000F828, 0, 0);
}

uint64_t sub_10000F828()
{
  uint64_t v1 = *(void *)(v0 + 1024);
  uint64_t v2 = *(void *)(v0 + 992);
  uint64_t v3 = *(void *)(v0 + 984);
  uint64_t v4 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 28));
  *uint64_t v4 = *(void *)(v0 + 1016);
  v4[1] = v1;
  uint64_t v5 = InstallSheetContext.Source.WebInstallContext.developerName.getter();
  *(void *)(v0 + 1032) = v6;
  *(void *)(v0 + 376) = v5;
  *(void *)(v0 + 384) = v6;
  *(void *)(v0 + 392) = v3;
  *(void *)(v0 + 400) = v2;
  *(unsigned char *)(v0 + 408) = 6;
  Swift::String v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 1040) = v7;
  *Swift::String v7 = v0;
  v7[1] = sub_10000F908;
  return sub_100042C74(v0 + 376);
}

uint64_t sub_10000F908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1048) = a1;
  *(void *)(v3 + 1056) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000FA48, 0, 0);
}

uint64_t sub_10000FA48()
{
  uint64_t v1 = *(void *)(v0 + 1056);
  uint64_t v2 = *(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 32);
  *(void *)uint64_t v2 = *(void *)(v0 + 1048);
  *(void *)(v2 + 8) = v1;
  *(unsigned char *)(v2 + 16) = 0;
  *(void *)(v0 + 416) = 6;
  *(void *)(v0 + 424) = 0;
  *(void *)(v0 + 432) = 0;
  *(void *)(v0 + 440) = 0;
  *(unsigned char *)(v0 + 448) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1064) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10000FB14;
  return sub_100042C74(v0 + 416);
}

uint64_t sub_10000FB14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1072) = a1;
  *(void *)(v3 + 1080) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000FC18, 0, 0);
}

uint64_t sub_10000FC18()
{
  uint64_t v1 = *(void *)(v0 + 1080);
  uint64_t v2 = *(void *)(v0 + 952);
  uint64_t v3 = *(void *)(v0 + 864);
  uint64_t v4 = (void *)(v3 + *(int *)(v2 + 36));
  *uint64_t v4 = *(void *)(v0 + 1072);
  v4[1] = v1;
  *(unsigned char *)(v3 + *(int *)(v2 + 64)) = 0;
  *(void *)(v0 + 456) = 17;
  *(void *)(v0 + 464) = 0;
  *(void *)(v0 + 472) = 0;
  *(void *)(v0 + 480) = 0;
  *(unsigned char *)(v0 + 488) = 10;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 1088) = v5;
  void *v5 = v0;
  v5[1] = sub_10000FCE8;
  return sub_100042C74(v0 + 456);
}

uint64_t sub_10000FCE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[102] = v2;
  v3[103] = a1;
  v3[104] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000FDF0, 0, 0);
}

uint64_t sub_10000FDF0()
{
  uint64_t v1 = *(void *)(v0 + 832);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 56));
  void *v2 = *(void *)(v0 + 824);
  v2[1] = v1;
  *(void *)(v0 + 496) = 1;
  *(void *)(v0 + 504) = 0;
  *(void *)(v0 + 520) = 0;
  *(void *)(v0 + 512) = 0;
  *(unsigned char *)(v0 + 528) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1256) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100010B88;
  return sub_100042C74(v0 + 496);
}

uint64_t sub_10000FEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1112) = a1;
  *(void *)(v3 + 1120) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000FFE0, 0, 0);
}

uint64_t sub_10000FFE0()
{
  uint64_t v1 = *(void *)(v0 + 1120);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 28));
  void *v2 = *(void *)(v0 + 1112);
  v2[1] = v1;
  *(void *)(v0 + 96) = 19;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + 104) = 0;
  *(unsigned char *)(v0 + 128) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1128) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000100AC;
  return sub_100042C74(v0 + 96);
}

uint64_t sub_1000100AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v7 = (void *)*v2;
  v3[142] = a1;
  v3[143] = a2;
  swift_task_dealloc();
  v3[17] = 20;
  uint64_t v4 = (uint64_t)(v3 + 17);
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 32) = 10;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 1016) = v5;
  void *v5 = v7;
  v5[1] = sub_1000101FC;
  return sub_100042C74(v4);
}

uint64_t sub_1000101FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v7 = (void *)*v2;
  v3[145] = a1;
  v3[146] = a2;
  swift_task_dealloc();
  v3[22] = 21;
  uint64_t v4 = (uint64_t)(v3 + 22);
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 32) = 10;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 1000) = v5;
  void *v5 = v7;
  v5[1] = sub_10001034C;
  return sub_100042C74(v4);
}

uint64_t sub_10001034C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  uint64_t v7 = (void *)*v2;
  v3[148] = a1;
  v3[149] = a2;
  swift_task_dealloc();
  v3[27] = 22;
  uint64_t v4 = (uint64_t)(v3 + 27);
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 32) = 10;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 984) = v5;
  void *v5 = v7;
  v5[1] = sub_10001049C;
  return sub_100042C74(v4);
}

uint64_t sub_10001049C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1208) = a1;
  *(void *)(v3 + 1216) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000105A0, 0, 0);
}

uint64_t sub_1000105A0()
{
  uint64_t v25 = *(void *)(v0 + 1216);
  uint64_t v23 = *(void *)(v0 + 1192);
  uint64_t v24 = *(void *)(v0 + 1208);
  uint64_t v1 = *(void *)(v0 + 1168);
  uint64_t v2 = *(void *)(v0 + 1160);
  uint64_t v3 = *(void *)(v0 + 1144);
  uint64_t v4 = *(void *)(v0 + 1136);
  uint64_t v22 = *(void *)(v0 + 952);
  uint64_t v20 = *(void *)(v0 + 1184);
  uint64_t v21 = *(void *)(v0 + 864);
  sub_100007978(&qword_1000751D8);
  uint64_t v5 = (int *)(type metadata accessor for BulletPoint(0) - 8);
  uint64_t v6 = *(void *)(*(void *)v5 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10005B4C0;
  unint64_t v9 = v8 + v7;
  UUID.init()();
  int v10 = (void *)(v9 + v5[7]);
  *int v10 = 0xD000000000000020;
  v10[1] = 0x800000010005DF70;
  uint64_t v11 = (void *)(v9 + v5[8]);
  *uint64_t v11 = v4;
  v11[1] = v3;
  uint64_t v12 = (void *)(v9 + v5[9]);
  *uint64_t v12 = v2;
  v12[1] = v1;
  uint64_t v13 = v9 + v6;
  UUID.init()();
  uint64_t v14 = (void *)(v13 + v5[7]);
  *uint64_t v14 = 0xD000000000000011;
  v14[1] = 0x800000010005DFA0;
  uint64_t v15 = (void *)(v13 + v5[8]);
  *uint64_t v15 = v20;
  v15[1] = v23;
  uint64_t v16 = (void *)(v13 + v5[9]);
  *uint64_t v16 = v24;
  v16[1] = v25;
  uint64_t v17 = v21 + *(int *)(v22 + 32);
  *(void *)uint64_t v17 = v8;
  *(void *)(v17 + 8) = 0;
  *(unsigned char *)(v17 + 16) = 1;
  *(_OWORD *)(v0 + 256) = 0u;
  *(_OWORD *)(v0 + 272) = 0u;
  *(unsigned char *)(v0 + 288) = 10;
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 1224) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_1000107DC;
  return sub_100042C74(v0 + 256);
}

uint64_t sub_1000107DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1232) = a1;
  *(void *)(v3 + 1240) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000108E0, 0, 0);
}

uint64_t sub_1000108E0()
{
  uint64_t v1 = *(void *)(v0 + 1240);
  uint64_t v2 = *(void *)(v0 + 952);
  uint64_t v3 = *(void *)(v0 + 864);
  uint64_t v4 = (void *)(v3 + *(int *)(v2 + 36));
  *uint64_t v4 = *(void *)(v0 + 1232);
  v4[1] = v1;
  *(unsigned char *)(v3 + *(int *)(v2 + 64)) = 1;
  *(void *)(v0 + 296) = 18;
  *(void *)(v0 + 304) = 0;
  *(void *)(v0 + 312) = 0;
  *(void *)(v0 + 320) = 0;
  *(unsigned char *)(v0 + 328) = 10;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 1248) = v5;
  void *v5 = v0;
  v5[1] = sub_1000109B4;
  return sub_100042C74(v0 + 296);
}

uint64_t sub_1000109B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[105] = v2;
  v3[106] = a1;
  v3[107] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100010ABC, 0, 0);
}

uint64_t sub_100010ABC()
{
  uint64_t v1 = *(void *)(v0 + 856);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 56));
  void *v2 = *(void *)(v0 + 848);
  v2[1] = v1;
  *(void *)(v0 + 496) = 1;
  *(void *)(v0 + 504) = 0;
  *(void *)(v0 + 520) = 0;
  *(void *)(v0 + 512) = 0;
  *(unsigned char *)(v0 + 528) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1256) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100010B88;
  return sub_100042C74(v0 + 496);
}

uint64_t sub_100010B88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1264) = a1;
  *(void *)(v3 + 1272) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100010C8C, 0, 0);
}

uint64_t sub_100010C8C()
{
  uint64_t v1 = *(void *)(v0 + 1272);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 40));
  void *v2 = *(void *)(v0 + 1264);
  v2[1] = v1;
  *(void *)(v0 + 536) = 3;
  *(void *)(v0 + 544) = 0;
  *(void *)(v0 + 560) = 0;
  *(void *)(v0 + 552) = 0;
  *(unsigned char *)(v0 + 568) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1280) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100010D5C;
  return sub_100042C74(v0 + 536);
}

uint64_t sub_100010D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1288) = a1;
  *(void *)(v3 + 1296) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100010E60, 0, 0);
}

uint64_t sub_100010E60()
{
  uint64_t v1 = *(void *)(v0 + 1296);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 44));
  void *v2 = *(void *)(v0 + 1288);
  v2[1] = v1;
  uint64_t v3 = InstallSheetContext.Source.WebInstallContext.appName.getter();
  *(void *)(v0 + 1304) = v4;
  *(void *)(v0 + 576) = v3;
  *(void *)(v0 + 584) = v4;
  *(_OWORD *)(v0 + 592) = 0u;
  *(unsigned char *)(v0 + 608) = 7;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 1312) = v5;
  void *v5 = v0;
  v5[1] = sub_100010F38;
  return sub_100042C74(v0 + 576);
}

uint64_t sub_100010F38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1320) = a1;
  *(void *)(v3 + 1328) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001105C, 0, 0);
}

uint64_t sub_10001105C()
{
  uint64_t v1 = *(void *)(v0 + 1328);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 48));
  void *v2 = *(void *)(v0 + 1320);
  v2[1] = v1;
  uint64_t v3 = InstallSheetContext.Source.WebInstallContext.appName.getter();
  *(void *)(v0 + 1336) = v4;
  *(void *)(v0 + 616) = v3;
  *(void *)(v0 + 624) = v4;
  *(_OWORD *)(v0 + 632) = 0u;
  *(unsigned char *)(v0 + 648) = 8;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 1344) = v5;
  void *v5 = v0;
  v5[1] = sub_100011138;
  return sub_100042C74(v0 + 616);
}

uint64_t sub_100011138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1352) = a1;
  *(void *)(v3 + 1360) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10001125C, 0, 0);
}

uint64_t sub_10001125C()
{
  uint64_t v1 = *(void *)(v0 + 1360);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 60));
  void *v2 = *(void *)(v0 + 1352);
  v2[1] = v1;
  *(void *)(v0 + 656) = 11;
  *(void *)(v0 + 664) = 0;
  *(void *)(v0 + 680) = 0;
  *(void *)(v0 + 672) = 0;
  *(unsigned char *)(v0 + 688) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1368) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001132C;
  return sub_100042C74(v0 + 656);
}

uint64_t sub_10001132C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1376) = a1;
  *(void *)(v3 + 1384) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100011430, 0, 0);
}

uint64_t sub_100011430()
{
  uint64_t v1 = *(void *)(v0 + 1384);
  uint64_t v2 = *(void *)(v0 + 920);
  uint64_t v3 = *(void *)(v0 + 912);
  uint64_t v4 = *(void *)(v0 + 904);
  uint64_t v5 = *(void *)(v0 + 896);
  uint64_t v6 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 68));
  *uint64_t v6 = *(void *)(v0 + 1376);
  v6[1] = v1;
  InstallSheetContext.type.getter();
  *(_DWORD *)(v0 + 52) = enum case for InstallSheetContext.InstallType.marketplace(_:);
  uint64_t v7 = *(void (**)(uint64_t))(v4 + 104);
  *(void *)(v0 + 1392) = v7;
  *(void *)(v0 + 1400) = (v4 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v7(v3);
  char v8 = static InstallSheetContext.InstallType.== infix(_:_:)();
  *(unsigned char *)(v0 + 49) = v8 & 1;
  unint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(void *)(v0 + 1408) = v9;
  *(void *)(v0 + 1416) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v8) {
    uint64_t v10 = 13;
  }
  else {
    uint64_t v10 = 12;
  }
  v9(v3, v5);
  v9(v2, v5);
  *(void *)(v0 + 696) = v10;
  *(void *)(v0 + 704) = 0;
  *(void *)(v0 + 720) = 0;
  *(void *)(v0 + 712) = 0;
  *(unsigned char *)(v0 + 728) = 10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 1424) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_1000115C4;
  return sub_100042C74(v0 + 696);
}

uint64_t sub_1000115C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (*(unsigned char *)(*v2 + 49)) {
    uint64_t v4 = 13;
  }
  else {
    uint64_t v4 = 12;
  }
  *(void *)(v3 + 1432) = a1;
  *(void *)(v3 + 1440) = a2;
  swift_task_dealloc();
  sub_100007AC8(v4, 0, 0, 0, 0xAu);
  return _swift_task_switch(sub_1000116F4, 0, 0);
}

uint64_t sub_1000116F4()
{
  uint64_t v1 = *(void *)(v0 + 1440);
  uint64_t v2 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 72));
  void *v2 = *(void *)(v0 + 1432);
  v2[1] = v1;
  *(void *)(v0 + 736) = 14;
  *(void *)(v0 + 744) = 0;
  *(void *)(v0 + 760) = 0;
  *(void *)(v0 + 752) = 0;
  *(unsigned char *)(v0 + 768) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1448) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000117C4;
  return sub_100042C74(v0 + 736);
}

uint64_t sub_1000117C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1456) = a1;
  *(void *)(v3 + 1464) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000118C8, 0, 0);
}

uint64_t sub_1000118C8()
{
  uint64_t v1 = *(void *)(v0 + 1464);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1408);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1392);
  uint64_t v4 = *(unsigned int *)(v0 + 52);
  uint64_t v5 = *(void *)(v0 + 920);
  uint64_t v6 = *(void *)(v0 + 912);
  uint64_t v7 = *(void *)(v0 + 896);
  char v8 = (void *)(*(void *)(v0 + 864) + *(int *)(*(void *)(v0 + 952) + 76));
  *char v8 = *(void *)(v0 + 1456);
  v8[1] = v1;
  InstallSheetContext.type.getter();
  v3(v6, v4, v7);
  char v9 = static InstallSheetContext.InstallType.== infix(_:_:)();
  *(unsigned char *)(v0 + 50) = v9 & 1;
  if (v9) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 15;
  }
  v2(v6, v7);
  v2(v5, v7);
  *(void *)(v0 + 776) = v10;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 1472) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_100011A28;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_100011A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (*(unsigned char *)(*v2 + 50)) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = 15;
  }
  *(void *)(v3 + 1480) = a1;
  *(void *)(v3 + 1488) = a2;
  swift_task_dealloc();
  sub_100007AC8(v4, 0, 0, 0, 0xAu);
  return _swift_task_switch(sub_100011B58, 0, 0);
}

uint64_t sub_100011B58()
{
  uint64_t v1 = v0[185];
  uint64_t v2 = v0[119];
  uint64_t v3 = v0[118];
  uint64_t v4 = v0[117];
  uint64_t v12 = v0[186];
  uint64_t v5 = v0[110];
  uint64_t v6 = v0[109];
  uint64_t v7 = v0[108];
  swift_release();
  uint64_t v8 = type metadata accessor for InstallSheetContext.Source.WebInstallContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v5, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v4);
  char v9 = (void *)(v7 + *(int *)(v2 + 80));
  *char v9 = v1;
  v9[1] = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t destroy for LocalizedCombinedApprovalAndInstallContent.BodyContent()
{
  return sub_10000E0B8();
}

uint64_t _s26AppDistributionLaunchAngel42LocalizedCombinedApprovalAndInstallContentV11BodyContentOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000DED4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LocalizedCombinedApprovalAndInstallContent.BodyContent(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_10000DED4();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000E0B8();
  return a1;
}

__n128 initializeWithTake for LocalizedCombinedApprovalAndInstallContent.BodyContent(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LocalizedCombinedApprovalAndInstallContent.BodyContent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000E0B8();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalizedCombinedApprovalAndInstallContent.BodyContent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalizedCombinedApprovalAndInstallContent.BodyContent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100011E20(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100011E28(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocalizedCombinedApprovalAndInstallContent.BodyContent()
{
  return &type metadata for LocalizedCombinedApprovalAndInstallContent.BodyContent;
}

id sub_100012170()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_100012438()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_100007978((uint64_t *)&unk_1000755C0);
  __chkstk_darwin(v2 - 8);
  int v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window] = 0;
  char v5 = v0;
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [self bagForProfile:v6 profileVersion:v7];

  *(void *)&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag] = v8;
  id v9 = v8;
  swift_unknownObjectRetain();
  URL.init(string:)();
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v4, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for LocalizationJetPack();
    uint64_t v13 = swift_allocObject();
    swift_defaultActor_initialize();
    *(void *)(v13 + 112) = 0;
    uint64_t v14 = v13 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v13 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url, v4, v10);
    *(void *)(v13 + 120) = v9;

    *(void *)&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer] = v13;
    v16.receiver = v5;
    v16.super_class = ObjectType;
    return [super init];
  }
  return result;
}

void sub_100012738(void *a1, void *a2)
{
  uint64_t v4 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v4 - 8);
  NSString v6 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100007978(&qword_100075320);
  __chkstk_darwin(v7 - 8);
  uint64_t v89 = (uint64_t)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for InstallSheetContext();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  v85 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v80 - v13;
  uint64_t v15 = type metadata accessor for MainActor();
  uint64_t v16 = static MainActor.shared.getter();
  uint64_t v91 = v15;
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v17 = [a1 configurationContext];
  if (v17)
  {
    id v18 = v17;
    v81 = v14;
    v82 = v6;
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    uint64_t v20 = sub_10000AEDC(v19, (uint64_t)qword_100078088);
    id v21 = a2;
    v86 = (void (*)(char *, uint64_t))v20;
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    BOOL v24 = os_log_type_enabled(v22, v23);
    id v87 = a1;
    uint64_t v88 = v16;
    if (v24)
    {
      id v83 = v18;
      uint64_t v84 = v10;
      unint64_t v80 = v9;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v94[0] = (uint64_t)v21;
      id v27 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v26 = v21;

      _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@] Handling install confirmation sheet request", v25, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v87;
      uint64_t v9 = v80;
      uint64_t v10 = v84;
      id v18 = v83;
    }
    else
    {
    }
    id v34 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:a1];
    id v35 = v90;
    uint64_t v36 = (void **)&v90[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window];
    swift_beginAccess();
    uint64_t v37 = *v36;
    *uint64_t v36 = v34;

    id v38 = [v18 userInfo];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v92 = 0x44747865746E6F63;
      unint64_t v93 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v40 + 16))
      {
        unint64_t v41 = sub_10005034C((uint64_t)v94);
        uint64_t v42 = v89;
        if (v43)
        {
          sub_1000183B0(*(void *)(v40 + 56) + 32 * v41, (uint64_t)&v95);
        }
        else
        {
          long long v95 = 0u;
          long long v96 = 0u;
        }
      }
      else
      {
        long long v95 = 0u;
        long long v96 = 0u;
        uint64_t v42 = v89;
      }
      swift_bridgeObjectRelease();
      sub_1000180B8((uint64_t)v94);
      if (*((void *)&v96 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v84 = v10;
          id v83 = v18;
          uint64_t v45 = v92;
          unint64_t v46 = v93;
          type metadata accessor for PropertyListDecoder();
          swift_allocObject();
          PropertyListDecoder.init()();
          sub_10001810C(&qword_100075338, (void (*)(uint64_t))&type metadata accessor for InstallSheetContext);
          uint64_t v89 = v45;
          unint64_t v80 = v46;
          dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
          swift_release();
          uint64_t v69 = v84;
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v84 + 56))(v42, 0, 1, v9);
          v86 = *(void (**)(char *, uint64_t))(v69 + 32);
          uint64_t v70 = v81;
          v86(v81, v42);
          uint64_t v71 = type metadata accessor for TaskPriority();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v82, 1, 1, v71);
          uint64_t v72 = v85;
          (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v85, v70, v9);
          v90 = (char *)v35;
          id v83 = v83;
          id v87 = a1;
          uint64_t v73 = static MainActor.shared.getter();
          unint64_t v74 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
          uint64_t v75 = v69;
          unint64_t v76 = (v11 + v74 + 7) & 0xFFFFFFFFFFFFFFF8;
          unint64_t v77 = (v76 + 15) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v78 = swift_allocObject();
          *(void *)(v78 + 16) = v73;
          *(void *)(v78 + 24) = &protocol witness table for MainActor;
          ((void (*)(unint64_t, char *, uint64_t))v86)(v78 + v74, v72, v9);
          *(void *)(v78 + v76) = v90;
          id v79 = v83;
          *(void *)(v78 + v77) = v83;
          *(void *)(v78 + ((v77 + 15) & 0xFFFFFFFFFFFFFFF8)) = v87;
          sub_10003338C((uint64_t)v82, (uint64_t)&unk_100075348, v78);
          sub_10000D70C(v89, v80);

          swift_release();
          (*(void (**)(char *, uint64_t))(v75 + 8))(v81, v9);
          swift_release();
          return;
        }
      }
      else
      {
        sub_10000D7CC((uint64_t)&v95, &qword_100074FD0);
      }
    }
    id v47 = v21;
    id v48 = v18;
    id v49 = v47;
    id v50 = v48;
    uint64_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      v90 = (char *)swift_slowAlloc();
      v94[0] = (uint64_t)v90;
      *(_DWORD *)uint64_t v53 = 138412546;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      *(void *)&long long v95 = v49;
      id v55 = v49;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v54 = v49;

      *(_WORD *)(v53 + 12) = 2082;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v56 = [v50 userInfo];
      if (v56)
      {
        uint64_t v57 = v56;
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
        swift_release();
      }
      else
      {
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_10004DF60((uint64_t)&_swiftEmptyArrayStorage);
        swift_release();
        swift_release();
      }
      uint64_t v58 = Dictionary.description.getter();
      unint64_t v60 = v59;
      swift_bridgeObjectRelease();
      *(void *)&long long v95 = sub_100057B1C(v58, v60, v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "[%@] Invalid context: %{public}s", (uint8_t *)v53, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v87;
    }
    else
    {
    }
    id v61 = [a1 activationContext];
    if (!v61) {
      goto LABEL_46;
    }
    uint64_t v62 = v61;
    id v63 = [v61 actions];

    sub_100018668(0, (unint64_t *)&qword_1000763E0);
    sub_100018050();
    uint64_t v64 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v65 = (void *)sub_1000157B4(v64);
    swift_bridgeObjectRelease();
    if (v65)
    {
      if ([v65 canSendResponse])
      {
        id v66 = [objc_allocWithZone((Class)BSMutableSettings) init];
        sub_100018668(0, (unint64_t *)&unk_100075328);
        Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        [v66 setObject:isa forSetting:1];

        id v68 = [self responseWithInfo:v66];
        [v65 sendResponse:v68];
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
LABEL_46:
      swift_release();
    }
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_10000AEDC(v28, (uint64_t)qword_100078088);
    v90 = a2;
    char v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v94[0] = (uint64_t)v90;
      uint64_t v33 = v90;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v32 = v90;

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[%@] No configuration context provided.", v31, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {
      swift_release();

      id v44 = v90;
    }
  }
}

void sub_10001363C(void *a1, void *a2)
{
  uint64_t v4 = sub_100007978(&qword_100075358);
  __chkstk_darwin(v4 - 8);
  NSString v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for LicenseResolutionContext();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  id v79 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v75 - v11;
  type metadata accessor for MainActor();
  uint64_t v13 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v84 = [a1 configurationContext];
  if (v84)
  {
    uint64_t v78 = v6;
    unint64_t v77 = v12;
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    uint64_t v15 = sub_10000AEDC(v14, (uint64_t)qword_100078088);
    id v16 = a2;
    uint64_t v80 = v15;
    id v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    v81 = a1;
    uint64_t v82 = v13;
    if (v19)
    {
      uint64_t v75 = v8;
      uint64_t v76 = v7;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      id v21 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v87[0] = (uint64_t)v16;
      id v22 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v21 = v16;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@] Handling license resolution sheet request", v20, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v81;
      uint64_t v7 = v76;
      uint64_t v8 = v75;
    }
    else
    {
    }
    id v29 = v84;
    id v30 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:a1];
    uint64_t v31 = (id *)(v83 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
    swift_beginAccess();
    id v32 = *v31;
    id *v31 = v30;

    id v33 = [v29 userInfo];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v85 = 0x44747865746E6F63;
      unint64_t v86 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v35 + 16) && (unint64_t v36 = sub_10005034C((uint64_t)v87), (v37 & 1) != 0))
      {
        sub_1000183B0(*(void *)(v35 + 56) + 32 * v36, (uint64_t)&v88);
      }
      else
      {
        long long v88 = 0u;
        long long v89 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1000180B8((uint64_t)v87);
      if (*((void *)&v89 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v38 = v8;
          uint64_t v39 = v85;
          unint64_t v40 = v86;
          type metadata accessor for JSONDecoder();
          swift_allocObject();
          JSONDecoder.init()();
          sub_10001810C(&qword_100075360, (void (*)(uint64_t))&type metadata accessor for LicenseResolutionContext);
          unint64_t v41 = v78;
          uint64_t v83 = v39;
          uint64_t v76 = v40;
          dispatch thunk of JSONDecoder.decode<A>(_:from:)();
          swift_release();
          uint64_t v64 = v38;
          (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v41, 0, 1, v7);
          uint64_t v65 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
          id v66 = v77;
          v65(v77, v41, v7);
          uint64_t v67 = (uint64_t)v79;
          (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v79, v66, v7);
          id v68 = objc_allocWithZone((Class)type metadata accessor for LicenseResolutionViewController());
          uint64_t v69 = (char *)sub_10000A704(v67);
          uint64_t v70 = swift_allocObject();
          swift_unknownObjectWeakInit();
          swift_retain();
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          char isCurrentExecutor = swift_task_isCurrentExecutor();
          if ((isCurrentExecutor & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          uint64_t v72 = (void (**)())&v69[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
          uint64_t v73 = *(void *)&v69[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction];
          *uint64_t v72 = sub_100018628;
          v72[1] = (void (*)())v70;
          sub_10000AF7C(v73);
          swift_release();
          swift_release();
          unint64_t v74 = v76;
          if (*v31)
          {
            [*v31 setRootViewController:v69];
            if (*v31) {
              [*v31 makeKeyAndVisible];
            }
          }
          [a1 setDesiredHardwareButtonEvents:16];
          [a1 setAllowsMenuButtonDismissal:0];
          [a1 setAllowsAlertStacking:1];
          [a1 setDismissalAnimationStyle:2];
          [a1 setReachabilityDisabled:1];
          sub_10000D70C(v83, v74);

          (*(void (**)(char *, uint64_t))(v64 + 8))(v77, v7);
          swift_release();
          return;
        }
      }
      else
      {
        sub_10000D7CC((uint64_t)&v88, &qword_100074FD0);
      }
    }
    id v43 = v16;
    id v44 = v29;
    id v45 = v43;
    id v46 = v44;
    id v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v84 = (void *)swift_slowAlloc();
      uint64_t v83 = swift_slowAlloc();
      v87[0] = v83;
      *(_DWORD *)uint64_t v49 = 138412546;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      *(void *)&long long v88 = v45;
      id v50 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v84 = v45;

      *(_WORD *)(v49 + 12) = 2082;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v51 = [v46 userInfo];
      if (v51)
      {
        os_log_type_t v52 = v51;
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
        swift_release();
      }
      else
      {
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_10004DF60((uint64_t)&_swiftEmptyArrayStorage);
        swift_release();
        swift_release();
      }
      uint64_t v53 = Dictionary.description.getter();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&long long v88 = sub_100057B1C(v53, v55, v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "[%@] Invalid context: %{public}s", (uint8_t *)v49, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v81;
    }
    else
    {
    }
    id v56 = [a1 activationContext];
    if (!v56) {
      goto LABEL_45;
    }
    uint64_t v57 = v56;
    id v58 = [v56 actions];

    sub_100018668(0, (unint64_t *)&qword_1000763E0);
    sub_100018050();
    uint64_t v59 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v60 = (void *)sub_1000157B4(v59);
    swift_bridgeObjectRelease();
    if (v60)
    {
      if ([v60 canSendResponse])
      {
        id v61 = [objc_allocWithZone((Class)BSMutableSettings) init];
        sub_100018668(0, (unint64_t *)&unk_100075328);
        Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        [v61 setObject:isa forSetting:1];

        id v63 = [self responseWithInfo:v61];
        [v60 sendResponse:v63];
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
LABEL_45:
      swift_release();
    }
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_10000AEDC(v23, (uint64_t)qword_100078088);
    uint64_t v84 = a2;
    BOOL v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      id v27 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v87[0] = (uint64_t)v84;
      uint64_t v28 = v84;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v27 = v84;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No configuration context provided.", v26, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {
      swift_release();

      id v42 = v84;
    }
  }
}

void sub_1000144E8(id a1, void *a2)
{
  uint64_t v4 = sub_100007978(&qword_100075368);
  __chkstk_darwin(v4 - 8);
  NSString v6 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for OAuthAuthorizationContext();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v94 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  long long v95 = (char *)&v90 - v11;
  uint64_t v12 = type metadata accessor for MainActor();
  uint64_t v13 = static MainActor.shared.getter();
  uint64_t v101 = v12;
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = [a1 configurationContext];
  if (v14)
  {
    uint64_t v15 = v14;
    v99 = v6;
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    uint64_t v17 = sub_10000AEDC(v16, (uint64_t)qword_100078088);
    id v18 = a2;
    uint64_t v96 = v17;
    BOOL v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v97 = v13;
    id v98 = a1;
    if (v21)
    {
      uint64_t v93 = v8;
      uint64_t v92 = v7;
      id v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)id v22 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v105[0] = (uint64_t)v18;
      id v24 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v23 = v18;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] Handling OAuth authentication sheet request", v22, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v98;
      uint64_t v7 = v92;
      uint64_t v8 = v93;
    }
    else
    {
    }
    id v31 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:a1];
    id v32 = (id *)&v100[OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window];
    swift_beginAccess();
    id v33 = *v32;
    id *v32 = v31;

    id v34 = [v15 userInfo];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v103 = 0x44747865746E6F63;
      unint64_t v104 = 0xEB00000000617461;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v36 + 16) && (unint64_t v37 = sub_10005034C((uint64_t)v105), (v38 & 1) != 0))
      {
        sub_1000183B0(*(void *)(v36 + 56) + 32 * v37, (uint64_t)&v106);
      }
      else
      {
        long long v106 = 0u;
        long long v107 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1000180B8((uint64_t)v105);
      if (*((void *)&v107 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v93 = v8;
          uint64_t v39 = (char *)v103;
          unint64_t v40 = v104;
          type metadata accessor for JSONDecoder();
          swift_allocObject();
          JSONDecoder.init()();
          sub_10001810C((unint64_t *)&unk_100075370, (void (*)(uint64_t))&type metadata accessor for OAuthAuthorizationContext);
          v100 = v39;
          unint64_t v91 = v40;
          dispatch thunk of JSONDecoder.decode<A>(_:from:)();
          swift_release();
          uint64_t v64 = v93;
          uint64_t v65 = v99;
          (*(void (**)(char *, void, uint64_t, uint64_t))(v93 + 56))(v99, 0, 1, v7);
          id v66 = v95;
          (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v95, v65, v7);
          uint64_t v67 = v7;
          id v68 = *(void (**)(char *, char *))(v64 + 16);
          uint64_t v92 = v67;
          v68(v94, v66);
          uint64_t v69 = (objc_class *)type metadata accessor for OAuthAuthorizationViewController();
          uint64_t v70 = (char *)objc_allocWithZone(v69);
          uint64_t v71 = &v70[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          *(void *)uint64_t v71 = 0;
          *((void *)v71 + 1) = 0;
          uint64_t v72 = OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction;
          *(void *)&v70[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction] = 0;
          uint64_t v73 = v70;
          id v74 = v15;
          id v75 = [v74 actions];
          uint64_t v76 = v75;
          if (v75)
          {
            sub_100018668(0, (unint64_t *)&qword_1000763E0);
            sub_100018050();
            uint64_t v77 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v76 = (void *)sub_1000157B4(v77);
            swift_bridgeObjectRelease();
          }
          uint64_t v78 = *(void **)&v70[v72];
          *(void *)&v70[v72] = v76;

          id v79 = v94;
          uint64_t v80 = v92;
          ((void (*)(char *, char *, uint64_t))v68)(&v73[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_sheetContext], v94, v92);
          uint64_t v81 = v80;

          v102.receiver = v73;
          v102.super_class = v69;
          uint64_t v82 = (char *)[super initWithNibName:0 bundle:0];

          uint64_t v83 = *(void (**)(char *, uint64_t))(v93 + 8);
          v93 += 8;
          v83(v79, v80);
          uint64_t v84 = swift_allocObject();
          swift_unknownObjectWeakInit();
          swift_retain();
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          uint64_t v85 = (void (**)())&v82[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          uint64_t v86 = *(void *)&v82[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
          char *v85 = sub_100018648;
          v85[1] = (void (*)())v84;
          sub_10000AF7C(v86);
          swift_release();
          swift_release();
          uint64_t v87 = (uint64_t)v100;
          unint64_t v88 = v91;
          if (*v32)
          {
            [*v32 setRootViewController:v82];
            if (*v32) {
              [*v32 makeKeyAndVisible];
            }
          }
          id v89 = v98;
          [v98 setDesiredHardwareButtonEvents:16];
          [v89 setAllowsMenuButtonDismissal:0];
          [v89 setAllowsAlertStacking:1];
          [v89 setDismissalAnimationStyle:2];
          [v89 setReachabilityDisabled:1];
          sub_10000D70C(v87, v88);

          v83(v95, v81);
          swift_release();
          return;
        }
      }
      else
      {
        sub_10000D7CC((uint64_t)&v106, &qword_100074FD0);
      }
    }
    id v42 = v18;
    id v43 = v15;
    id v44 = v42;
    id v45 = v43;
    id v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = swift_slowAlloc();
      uint64_t v49 = (void *)swift_slowAlloc();
      v100 = (char *)swift_slowAlloc();
      v105[0] = (uint64_t)v100;
      *(_DWORD *)uint64_t v48 = 138412546;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      *(void *)&long long v106 = v44;
      id v50 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v49 = v44;

      *(_WORD *)(v48 + 12) = 2082;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v51 = [v45 userInfo];
      if (v51)
      {
        os_log_type_t v52 = v51;
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
        swift_release();
      }
      else
      {
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_10004DF60((uint64_t)&_swiftEmptyArrayStorage);
        swift_release();
        swift_release();
      }
      uint64_t v53 = Dictionary.description.getter();
      unint64_t v55 = v54;
      swift_bridgeObjectRelease();
      *(void *)&long long v106 = sub_100057B1C(v53, v55, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "[%@] Invalid context: %{public}s", (uint8_t *)v48, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v98;
    }
    else
    {
    }
    id v56 = [a1 activationContext];
    if (!v56) {
      goto LABEL_45;
    }
    uint64_t v57 = v56;
    id v58 = [v56 actions];

    sub_100018668(0, (unint64_t *)&qword_1000763E0);
    sub_100018050();
    uint64_t v59 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v60 = (void *)sub_1000157B4(v59);
    swift_bridgeObjectRelease();
    if (v60)
    {
      if ([v60 canSendResponse])
      {
        id v61 = [objc_allocWithZone((Class)BSMutableSettings) init];
        sub_100018668(0, (unint64_t *)&unk_100075328);
        Class isa = NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
        [v61 setObject:isa forSetting:1];

        id v63 = [self responseWithInfo:v61];
        [v60 sendResponse:v63];
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
LABEL_45:
      swift_release();
    }
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v25 = type metadata accessor for Logger();
    sub_10000AEDC(v25, (uint64_t)qword_100078088);
    v100 = a2;
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      id v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412290;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v105[0] = (uint64_t)v100;
      id v30 = v100;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v29 = v100;

      _os_log_impl((void *)&_mh_execute_header, v26, v27, "[%@] No configuration context provided.", v28, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();
    }
    else
    {
      swift_release();

      id v41 = v100;
    }
  }
}

uint64_t sub_100015618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100017D74(a4, a5);

  return swift_release();
}

uint64_t sub_1000157B4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10001861C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_100016BDC(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_10001861C(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_100016E54(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000158C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[13] = a6;
  v7[14] = a7;
  v7[11] = a4;
  v7[12] = a5;
  type metadata accessor for Bag();
  v7[15] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  v7[16] = v8;
  v7[17] = *(void *)(v8 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  sub_100007978(&qword_100075350);
  v7[20] = swift_task_alloc();
  v7[21] = swift_task_alloc();
  v7[22] = type metadata accessor for LocalizedInstallSheetContent();
  v7[23] = swift_task_alloc();
  v7[24] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for InstallSheetContext();
  v7[25] = v9;
  v7[26] = *(void *)(v9 - 8);
  v7[27] = swift_task_alloc();
  type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  v7[28] = swift_task_alloc();
  v7[29] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for InstallSheetContext.Source();
  v7[30] = v10;
  v7[31] = *(void *)(v10 - 8);
  v7[32] = swift_task_alloc();
  v7[33] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for InstallSheetContext.Source.WebInstallContext();
  v7[34] = v11;
  v7[35] = *(void *)(v11 - 8);
  v7[36] = swift_task_alloc();
  v7[37] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for FeatureFlag();
  v7[38] = v12;
  v7[39] = *(void *)(v12 - 8);
  v7[40] = swift_task_alloc();
  v7[41] = type metadata accessor for MainActor();
  v7[42] = static MainActor.shared.getter();
  uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[43] = v14;
  v7[44] = v13;
  return _swift_task_switch(sub_100015C48, v14, v13);
}

uint64_t sub_100015C48()
{
  uint64_t v2 = v0[39];
  uint64_t v1 = v0[40];
  uint64_t v3 = v0[38];
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for FeatureFlag.newInstallSheetFlow(_:), v3);
  char v4 = isFeatureEnabled(_:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v4)
  {
    uint64_t v5 = v0[33];
    uint64_t v6 = v0[30];
    uint64_t v7 = v0[31];
    InstallSheetContext.source.getter();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v7 + 88))(v5, v6) == enum case for InstallSheetContext.Source.webWithContext(_:))
    {
      uint64_t v8 = v0[37];
      uint64_t v28 = v0[36];
      uint64_t v9 = v0[34];
      uint64_t v10 = v0[35];
      uint64_t v11 = v0[33];
      uint64_t v13 = v0[26];
      uint64_t v12 = v0[27];
      uint64_t v14 = v0[25];
      uint64_t v16 = v0[11];
      uint64_t v15 = v0[12];
      (*(void (**)(uint64_t, void))(v0[31] + 96))(v11, v0[30]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v11, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v16, v14);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v28, v8, v9);
      uint64_t v17 = *(void *)(v15
                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer);
      swift_retain();
      id v18 = (void *)swift_task_alloc();
      v0[45] = v18;
      *id v18 = v0;
      v18[1] = sub_100015F14;
      uint64_t v19 = v0[36];
      uint64_t v20 = v0[29];
      uint64_t v21 = v0[27];
      return sub_10000F140(v20, v21, v19, v17);
    }
    (*(void (**)(void, void))(v0[31] + 8))(v0[33], v0[30]);
  }
  uint64_t v23 = v0[12];
  (*(void (**)(void, void, void))(v0[26] + 16))(v0[27], v0[11], v0[25]);
  uint64_t v24 = *(void *)(v23 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_localizer);
  swift_retain();
  uint64_t v25 = (void *)swift_task_alloc();
  v0[46] = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_1000163D8;
  uint64_t v26 = v0[27];
  uint64_t v27 = v0[24];
  return sub_100048528(v27, v26, v24);
}

uint64_t sub_100015F14()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 352);
  uint64_t v3 = *(void *)(v1 + 344);
  return _swift_task_switch(sub_100016034, v3, v2);
}

uint64_t sub_100016034()
{
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = (void *)v0[13];
  swift_release();
  sub_100018534(v1, v2, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  id v4 = objc_allocWithZone((Class)type metadata accessor for CombinedApprovalAndInstallViewController());
  uint64_t v5 = sub_1000186A4(v3, v2);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = v0[12];
  uint64_t v8 = (void (**)())&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction];
  uint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction];
  *uint64_t v8 = sub_10001859C;
  v8[1] = (void (*)())v6;
  sub_10000AF7C(v9);
  swift_release();
  swift_release();
  uint64_t v10 = (void **)(v7 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = v0[37];
  uint64_t v13 = v0[34];
  uint64_t v14 = v0[35];
  uint64_t v15 = v0[29];
  if (v11)
  {
    swift_endAccess();
    [v11 setRootViewController:v5];

    sub_1000185BC(v15, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  else
  {
    sub_1000185BC(v0[29], (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    swift_endAccess();
  }
  uint64_t v16 = (id *)(v0[12] + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  if (*v16) {
    [*v16 makeKeyAndVisible];
  }
  uint64_t v17 = (void *)v0[14];
  [v17 setDesiredHardwareButtonEvents:16, v0[24]];
  [v17 setAllowsMenuButtonDismissal:0];
  [v17 setAllowsAlertStacking:1];
  [v17 setDismissalAnimationStyle:2];
  [v17 setReachabilityDisabled:1];
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_1000163D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 352);
  uint64_t v3 = *(void *)(v1 + 344);
  return _swift_task_switch(sub_1000164F8, v3, v2);
}

uint64_t sub_1000164F8()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[30];
  swift_release();
  InstallSheetContext.source.getter();
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  uint64_t v5 = v0[31];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[30];
  uint64_t v8 = v0[21];
  if (v4 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    uint64_t v10 = v0[19];
    uint64_t v9 = v0[20];
    uint64_t v12 = v0[17];
    uint64_t v11 = v0[18];
    uint64_t v14 = v0[15];
    uint64_t v13 = v0[16];
    uint64_t v15 = v0[12];
    (*(void (**)(uint64_t, uint64_t))(v5 + 96))(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v10, v6, v13);
    id v16 = objc_retain(*(id *)(v15
                            + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_bag));
    Bag.init(from:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v10, v13);
    sub_10004E3C8(v14, v11, v9);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v13);
    uint64_t v17 = type metadata accessor for InstallConfirmationAppStoreMetrics();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 0, 1, v17);
    sub_1000184CC(v9, v8);
  }
  else
  {
    (*(void (**)(void, uint64_t))(v5 + 8))(v0[32], v7);
    uint64_t v18 = type metadata accessor for InstallConfirmationAppStoreMetrics();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  }
  uint64_t v19 = v0[23];
  uint64_t v21 = v0[20];
  uint64_t v20 = v0[21];
  id v22 = (void *)v0[13];
  sub_100018534(v0[24], v19, (uint64_t (*)(void))type metadata accessor for LocalizedInstallSheetContent);
  sub_10001840C(v20, v21);
  id v23 = objc_allocWithZone((Class)type metadata accessor for InstallConfirmationViewController());
  uint64_t v24 = sub_10005362C(v22, v19, v21);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v26 = v0[12];
  uint64_t v27 = (void (**)())&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  uint64_t v28 = *(void *)&v24[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  *uint64_t v27 = sub_1000184AC;
  v27[1] = (void (*)())v25;
  sub_10000AF7C(v28);
  swift_release();
  swift_release();
  uint64_t v29 = (void **)(v26 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  id v30 = *v29;
  uint64_t v31 = v0[24];
  uint64_t v32 = v0[21];
  if (v30)
  {
    swift_endAccess();
    [v30 setRootViewController:v24];

    sub_10000D7CC(v32, &qword_100075350);
    sub_1000185BC(v31, (uint64_t (*)(void))type metadata accessor for LocalizedInstallSheetContent);
  }
  else
  {
    sub_10000D7CC(v0[21], &qword_100075350);
    sub_1000185BC(v31, (uint64_t (*)(void))type metadata accessor for LocalizedInstallSheetContent);
    swift_endAccess();
  }
  id v33 = (id *)(v0[12] + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  if (*v33) {
    [*v33 makeKeyAndVisible];
  }
  id v34 = (void *)v0[14];
  [v34 setDesiredHardwareButtonEvents:16, v0[24]];
  [v34 setAllowsMenuButtonDismissal:0];
  [v34 setAllowsAlertStacking:1];
  [v34 setDismissalAnimationStyle:2];
  [v34 setReachabilityDisabled:1];
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = (uint64_t (*)(void))v0[1];
  return v35();
}

void sub_100016A48()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong invalidate];
    swift_release();
  }
  else
  {
    swift_release();
  }
}

id sub_100016B24()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for AppDistributionRemoteAlertSceneDelegate()
{
  return self;
}

void sub_100016BDC(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_100018668(0, (unint64_t *)&qword_1000763E0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_100018668(0, (unint64_t *)&qword_1000763E0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  int v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100016E54(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

id sub_100016EDC(void *a1, void *a2, void *a3)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10000AEDC(v6, (uint64_t)qword_100078088);
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  char v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    id v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412802;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id v17 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v16 = v10;

    *(_WORD *)(v15 + 12) = 2112;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id v18 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v16[1] = v11;

    *(_WORD *)(v15 + 22) = 2112;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    id v19 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v16[2] = v12;

    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Application: %@, configuration for connecting scene session: %@, options: %@", (uint8_t *)v15, 0x20u);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v20 = [v11 role];
  id v21 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v20];

  sub_100018668(0, (unint64_t *)&unk_100075380);
  [v21 setSceneClass:swift_getObjCClassFromMetadata()];
  type metadata accessor for AppDistributionRemoteAlertSceneDelegate();
  [v21 setDelegateClass:swift_getObjCClassFromMetadata()];
  swift_release();
  return v21;
}

void sub_100017338(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = objc_allocWithZone((Class)type metadata accessor for LogKey());
  id v3 = sub_10004D210();
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    char v5 = (void *)v4;
    id v6 = a1;
    id v7 = [v5 configurationIdentifier];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v11 = v10;

      swift_bridgeObjectRetain();
      v12._countAndFlagsBits = v9;
      v12._object = v11;
      unint64_t v13 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10006DE68, v12);
      swift_bridgeObjectRelease();
      if (v13 < 3)
      {
        id v49 = v6;
        if (qword_100074B50 != -1) {
          swift_once();
        }
        uint64_t v14 = type metadata accessor for Logger();
        sub_10000AEDC(v14, (uint64_t)qword_100078088);
        id v15 = v3;
        swift_bridgeObjectRetain();
        id v16 = v15;
        id v17 = Logger.logObject.getter();
        os_log_type_t v18 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v17, v18))
        {
          log = v17;
          uint64_t v19 = swift_slowAlloc();
          os_log_type_t v47 = (void *)swift_slowAlloc();
          v51[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v19 = 138412546;
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_release();
          uint64_t v52 = (uint64_t)v16;
          id v20 = v16;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *os_log_type_t v47 = v16;

          *(_WORD *)(v19 + 12) = 2082;
          static MainActor.shared.getter();
          dispatch thunk of Actor.unownedExecutor.getter();
          if ((swift_task_isCurrentExecutor() & 1) == 0) {
            swift_task_reportUnexpectedExecutor();
          }
          swift_bridgeObjectRetain();
          swift_release();
          uint64_t v52 = sub_100057B1C(v9, (unint64_t)v11, v51);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, log, v18, "[%@] Scene requested with identifier %{public}s", (uint8_t *)v19, 0x16u);
          sub_100007978(&qword_100074F88);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        if ((_BYTE)v13)
        {
          if (v13 == 1) {
            sub_10001363C(v5, v16);
          }
          else {
            sub_1000144E8(v5, v16);
          }
        }
        else
        {
          sub_100012738(v5, v16);
        }
        swift_release();

        return;
      }
      swift_bridgeObjectRelease();
    }
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_10000AEDC(v31, (uint64_t)qword_100078088);
    id v32 = v6;
    id v33 = v3;
    id v34 = v32;
    id v50 = v33;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v48 = (void *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 138412546;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      v51[0] = (uint64_t)v50;
      id v38 = v50;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v48 = v50;

      *(_WORD *)(v37 + 12) = 2082;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v39 = [v5 configurationIdentifier];
      if (v39)
      {
        unint64_t v40 = v39;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v42 = v41;
      }
      else
      {
        uint64_t v42 = 0;
      }
      v51[1] = v42;
      sub_100007978((uint64_t *)&unk_100075310);
      uint64_t v43 = String.init<A>(describing:)();
      unint64_t v45 = v44;
      swift_release();
      v51[0] = sub_100057B1C(v43, v45, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] Invalid configuration identifier %{public}s", (uint8_t *)v37, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_release();

      return;
    }
    swift_release();

    goto LABEL_34;
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  sub_10000AEDC(v21, (uint64_t)qword_100078088);
  id v22 = a1;
  id v23 = v3;
  id v24 = v22;
  id v50 = v23;
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v25, v26))
  {
    swift_release();

LABEL_34:

    return;
  }
  uint64_t v27 = swift_slowAlloc();
  uint64_t v28 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v27 = 138412546;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  v51[0] = (uint64_t)v50;
  id v29 = v50;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *uint64_t v28 = v50;

  *(_WORD *)(v27 + 12) = 2112;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  v51[0] = (uint64_t)v24;
  id v30 = v24;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  v28[1] = v24;

  _os_log_impl((void *)&_mh_execute_header, v25, v26, "[%@] Expected scene to be SBSUIRemoteAlertScene but got %@", (uint8_t *)v27, 0x16u);
  sub_100007978(&qword_100074F88);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();
  swift_release();
}

void sub_100017D74(uint64_t a1, const char *a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000AEDC(v3, (uint64_t)qword_100078088);
  oslog = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, a2, v5, 2u);
    swift_slowDealloc();
  }
  swift_release();
}

void sub_100017ED4()
{
  uint64_t v1 = v0;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000AEDC(v2, (uint64_t)qword_100078088);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Remote alert scene sceneDidDisconnect", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = (void **)(v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel39AppDistributionRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  id v7 = *v6;
  *id v6 = 0;
  swift_release();
}

unint64_t sub_100018050()
{
  unint64_t result = qword_100074FB0;
  if (!qword_100074FB0)
  {
    sub_100018668(255, (unint64_t *)&qword_1000763E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100074FB0);
  }
  return result;
}

uint64_t sub_1000180B8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001810C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018154()
{
  uint64_t v1 = type metadata accessor for InstallSheetContext();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v8 + 8, v5);
}

uint64_t sub_100018264(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for InstallSheetContext() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 24);
  uint64_t v10 = v1 + v5;
  uint64_t v11 = *(void *)(v1 + v6);
  uint64_t v12 = *(void *)(v1 + v7);
  uint64_t v13 = *(void *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_10000AC98;
  return sub_1000158C4(a1, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_1000183B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001840C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018474()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000184AC()
{
}

uint64_t sub_1000184CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018534(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_10001859C()
{
}

uint64_t sub_1000185BC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001861C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_100018628()
{
}

void sub_100018648()
{
}

uint64_t sub_100018668(uint64_t a1, unint64_t *a2)
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

char *sub_1000186A4(void *a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  __chkstk_darwin(v5 - 8);
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction];
  *uint64_t v8 = 0;
  v8[1] = 0;
  *(void *)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController] = 0;
  uint64_t v9 = OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction;
  *(void *)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction] = 0;
  v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_response] = 0;
  uint64_t v10 = OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_isIPad;
  uint64_t v11 = self;
  uint64_t v12 = v2;
  id v13 = [v11 currentDevice];
  id v14 = [v13 userInterfaceIdiom];

  v2[v10] = v14 == (id)1;
  id v15 = [a1 actions];
  if (v15)
  {
    sub_10000D62C();
    sub_100018050();
    uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    id v15 = (id)sub_1000157B4(v16);
    swift_bridgeObjectRelease();
  }
  id v17 = *(void **)&v2[v9];
  *(void *)&v2[v9] = v15;

  sub_10001A1EC(a2, (uint64_t)&v12[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_localizedContent]);
  os_log_type_t v18 = (objc_class *)type metadata accessor for CombinedApprovalAndInstallViewController();
  v24.receiver = v12;
  v24.super_class = v18;
  id v19 = [super initWithNibName:0 bundle:0];
  sub_10001A1EC(a2, (uint64_t)v7);
  objc_allocWithZone((Class)type metadata accessor for CombinedApprovalAndInstallSheetViewController());
  id v20 = (char *)v19;
  id v21 = sub_1000336EC((uint64_t)v7, (uint64_t)v19, (uint64_t)&off_10006E3D8);

  sub_10001A250(a2);
  id v22 = *(void **)&v20[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController];
  *(void *)&v20[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController] = v21;

  return v20;
}

void sub_100018978(char a1)
{
  uint64_t v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for CombinedApprovalAndInstallViewController();
  [super viewDidAppear:a1 & 1];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController];
  id v5 = v4;
  swift_release();
  if (!v4) {
    goto LABEL_13;
  }
  [v5 setModalPresentationStyle:2];
  id v6 = [v1 view];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = [v6 window];

    if (!v8)
    {
LABEL_10:
      id v10 = [self blackColor];
      uint64_t v11 = v10;
      double v12 = 0.8;
      if (v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_isIPad]) {
        double v12 = 0.4;
      }
      id v13 = [v10 colorWithAlphaComponent:v12];

      sub_100019BCC(v13);
      [v2 presentViewController:v5 animated:1 completion:0];

LABEL_13:
      swift_release();
      return;
    }
    id v9 = [v8 _rootSheetPresentationController];

    if (v9)
    {
      [v9 _setShouldScaleDownBehindDescendantSheets:0];

      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100018D94(char a1)
{
  *(void *)(v2 + 32) = v1;
  *(unsigned char *)(v2 + 120) = a1;
  type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  *(void *)(v2 + 40) = swift_task_alloc();
  *(void *)(v2 + 48) = type metadata accessor for MainActor();
  *(void *)(v2 + 56) = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 72) = v3;
  return _swift_task_switch(sub_100018E60, v4, v3);
}

uint64_t sub_100018E60()
{
  if (*(unsigned char *)(v0 + 120) == 1)
  {
    sub_10001A1EC(*(void *)(v0 + 32)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_localizedContent, *(void *)(v0 + 40));
    uint64_t v1 = (objc_class *)type metadata accessor for OsloAuthenticationTask();
    *(void *)(v0 + 80) = v1;
    *(void *)(v0 + 88) = objc_allocWithZone(v1);
    *(void *)(v0 + 96) = static MainActor.shared.getter();
    uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(sub_100018F6C, v3, v2);
  }
  else
  {
    swift_release();
    sub_100019568(0);
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_100018F6C()
{
  Class super_class = v0[5].super_class;
  receiver = (objc_class *)v0[5].receiver;
  uint64_t v3 = (uint64_t)v0[2].super_class;
  swift_release();
  uint64_t v4 = (char *)super_class + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalizedContinuation;
  uint64_t v5 = sub_100007978((uint64_t *)&unk_100075A40);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((unsigned char *)super_class + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalResult) = 0;
  sub_10001A1EC(v3, (uint64_t)super_class + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_localizedContent);
  v0[1].receiver = super_class;
  v0[1].Class super_class = receiver;
  v0[6].Class super_class = (Class)objc_msgSendSuper2(v0 + 1, "init");
  sub_10001A250(v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7].receiver = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000190B0;
  return sub_10002706C();
}

uint64_t sub_1000190B0(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 121) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  return _swift_task_switch(sub_1000191D8, v4, v3);
}

uint64_t sub_1000191D8()
{
  char v1 = *(unsigned char *)(v0 + 121);
  swift_release();
  uint64_t v2 = *(void **)(v0 + 104);
  sub_100019568(v1);

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100019260()
{
  *(void *)(v1 + 64) = v0;
  type metadata accessor for MainActor();
  *(void *)(v1 + 72) = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000192F8, v3, v2);
}

uint64_t sub_1000192F8()
{
  uint64_t v1 = (void *)v0[8];
  swift_release();
  id v2 = [self clearColor];
  sub_100019BCC(v2);

  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  v0[6] = sub_10001A1E4;
  v0[7] = v3;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000535E8;
  v0[5] = &unk_10006E490;
  uint64_t v4 = _Block_copy(v0 + 2);
  id v5 = v1;
  swift_release();
  [v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001943C(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v2 = *(void (**)(uint64_t))(a1
                                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction);
  sub_10000AF6C((uint64_t)v2);
  uint64_t v3 = swift_release();
  if (v2)
  {
    v2(v3);
    sub_10000AF7C((uint64_t)v2);
  }

  return swift_release();
}

uint64_t sub_100019568(char a1)
{
  id v2 = v1;
  uint64_t v4 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_response;
  v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_response] = a1 & 1;
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction;
  id v9 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction];
  id v10 = v9;
  swift_release();
  if (v9)
  {
    if ([v10 canSendResponse])
    {
      id v21 = v6;
      id v22 = [objc_allocWithZone((Class)BSMutableSettings) init];
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v11 = v1[v7];
      swift_release();
      id v12 = [objc_allocWithZone((Class)NSNumber) initWithBool:v11];
      id v13 = v22;
      [v22 setObject:v12 forSetting:1];

      id v14 = [self responseWithInfo:v13];
      [v10 sendResponse:v14];

      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v15 = *(void **)&v2[v8];
      *(void *)&v2[v8] = 0;
      swift_release();

      id v10 = v15;
      uint64_t v6 = v21;
    }
  }
  if (a1)
  {
    return swift_release();
  }
  else
  {
    uint64_t v17 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
    os_log_type_t v18 = v2;
    uint64_t v19 = static MainActor.shared.getter();
    id v20 = (void *)swift_allocObject();
    v20[2] = v19;
    v20[3] = &protocol witness table for MainActor;
    v20[4] = v18;
    sub_10003338C((uint64_t)v6, (uint64_t)&unk_1000754C8, (uint64_t)v20);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_100019984()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100019A30;
  return sub_100019260();
}

uint64_t sub_100019A30()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100019B6C, v1, v0);
}

uint64_t sub_100019B6C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100019BCC(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  v9[4] = sub_10001A098;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000535E8;
  v9[3] = &unk_10006E418;
  uint64_t v5 = _Block_copy(v9);
  id v6 = v1;
  id v7 = a1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
  return swift_release();
}

void sub_100019D30(void *a1, uint64_t a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = [a1 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setBackgroundColor:a2];
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

id sub_100019EAC()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for CombinedApprovalAndInstallViewController();
  [super dealloc];
}

uint64_t sub_100019F54()
{
  return type metadata accessor for CombinedApprovalAndInstallViewController();
}

uint64_t type metadata accessor for CombinedApprovalAndInstallViewController()
{
  uint64_t result = qword_1000754A0;
  if (!qword_1000754A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019FA8()
{
  uint64_t result = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001A058()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001A098()
{
  sub_100019D30(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10001A0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A0B0()
{
  return swift_release();
}

uint64_t sub_10001A0B8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001A0F8()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_10000AC98;
  return sub_100019984();
}

uint64_t sub_10001A1AC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A1E4()
{
  return sub_10001943C(*(void *)(v0 + 16));
}

uint64_t sub_10001A1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A250(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A2AC()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction];
  *unint64_t v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction] = 0;
  v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_response] = 0;
  uint64_t v2 = OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_isIPad;
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  v0[v2] = v4 == (id)1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10001A3FC()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v0 = self;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 activateManualDomain:v1];
  swift_unknownObjectRelease();

  int v3 = static CommandLine.argc.getter();
  id v4 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for AppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v3, v4, 0, v6);
  swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10001A5D0();
  swift_release();
  return 0;
}

uint64_t sub_10001A5D0()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AEDC(v0, (uint64_t)qword_100078088);
  NSString v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Angel startup", v3, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for LaunchAngelXPCServer();
  swift_initStackObject();
  [*(id *)(sub_10000D82C() + 16) activate];
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Configured XPC listeners", v6, 2u);
    swift_slowDealloc();
  }

  sub_10001A3FC();
  swift_release();
  return swift_release();
}

id sub_10001A7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = &v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate];
  *(void *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v7 = OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_isIPad;
  uint64_t v8 = self;
  id v9 = v3;
  id v10 = [v8 currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  v3[v7] = v11 == (id)1;
  uint64_t v12 = OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton;
  *(void *)&v9[v12] = [self boldButton];
  *((void *)v6 + 1) = a3;
  swift_unknownObjectWeakAssign();
  sub_10001F35C(a1, (uint64_t)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent]);

  NSString v13 = String._bridgeToObjectiveC()();
  NSString v14 = String._bridgeToObjectiveC()();
  v17.receiver = v9;
  v17.Class super_class = (Class)type metadata accessor for InstallSheetViewController();
  id v15 = [super initWithTitle:v13 detailText:v14 symbolName:0 contentLayout:3];

  swift_unknownObjectRelease();
  sub_10001F3C0(a1);
  return v15;
}

void sub_10001A950()
{
  NSString v1 = v0;
  uint64_t v2 = type metadata accessor for InstallSheetContext();
  uint64_t v128 = *(void *)(v2 - 8);
  uint64_t v129 = v2;
  __chkstk_darwin(v2);
  v127 = (char *)v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = (void *)type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
  uint64_t v120 = *(v130 - 1);
  __chkstk_darwin(v130);
  v119 = (char *)v116 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
  uint64_t v117 = *(void *)(v5 - 8);
  uint64_t v118 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AttributedString.MarkdownParsingOptions();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_100007978((uint64_t *)&unk_1000755C0);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)v116 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = type metadata accessor for LocalizedInstallSheetContent();
  uint64_t v12 = __chkstk_darwin(v125);
  uint64_t v124 = (uint64_t)v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v123 = (char *)v116 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v122 = (char *)v116 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v116 - v18;
  type metadata accessor for MainActor();
  v116[1] = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v20 = (objc_class *)type metadata accessor for InstallSheetViewController();
  v132.receiver = v0;
  v132.Class super_class = v20;
  [super viewDidLoad];
  [v0 setModalInPresentation:1];
  [v0 setDefinesPresentationContext:1];
  int v126 = v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_isIPad];
  if (v126) {
    double v21 = 88.0;
  }
  else {
    double v21 = 24.0;
  }
  id v22 = [v0 contentView];
  [v22 setDirectionalLayoutMargins:0.0, v21, 0.0, v21];

  id v23 = [v1 headerView];
  id v24 = [v23 bottomAnchor];

  id v25 = [v1 contentView];
  id v26 = [v25 topAnchor];

  id v27 = [v24 constraintEqualToAnchor:v26 constant:-4.0];
  [v27 setActive:1];

  type metadata accessor for NonHighlightableTextView();
  id v28 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v28 setEditable:0];
  id v29 = v28;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10001FBFC();
  v121 = &v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent];
  sub_10001F35C((uint64_t)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent], (uint64_t)v19);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10001F3C0((uint64_t)v19);
  uint64_t v30 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v11, 1, 1, v30);
  (*(void (**)(char *, void, uint64_t))(v117 + 104))(v7, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v118);
  (*(void (**)(char *, void, void *))(v120 + 104))(v119, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v130);
  AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
  uint64_t v31 = NSAttributedString.init(markdown:options:baseURL:)();
  [v29 setAttributedText:v31];

  [v29 setTextAlignment:1];
  id v32 = self;
  id v33 = v29;
  id v34 = [v32 preferredFontForTextStyle:UIFontTextStyleBody];
  [v33 setFont:v34];

  [v33 setScrollEnabled:0];
  [v33 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v35 = self;
  id v36 = v33;
  id v37 = [v35 labelColor];
  [v36 setTextColor:v37];

  [v36 setDelegate:v1];
  id v38 = [v1 contentView];
  [v38 addSubview:v36];

  id v39 = [v1 contentView];
  id v40 = [v39 leadingAnchor];

  id v41 = [v36 leadingAnchor];
  id v42 = [v40 constraintEqualToAnchor:v41 constant:-v21];

  [v42 setActive:1];
  id v43 = [v1 contentView];
  id v44 = [v43 trailingAnchor];

  id v45 = [v36 trailingAnchor];
  id v46 = [v44 constraintEqualToAnchor:v45 constant:v21];

  [v46 setActive:1];
  id v47 = [v1 contentView];
  id v48 = [v47 topAnchor];

  id v49 = [v36 topAnchor];
  id v50 = [v48 constraintEqualToAnchor:v49];

  [v50 setActive:1];
  id v51 = *(char **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton];
  [v51 setEnabled:0];
  id v52 = [v35 systemBlueColor];
  [v51 setTintColor:v52];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v54 = (uint64_t)v121;
  uint64_t v53 = (uint64_t)v122;
  sub_10001F35C((uint64_t)v121, (uint64_t)v122);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10001F3C0(v53);
  NSString v55 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v51 setTitle:v55 forState:0];

  [v51 addTarget:v1 action:"confirmPressed" forControlEvents:64];
  id v56 = [v1 buttonTray];
  v122 = v51;
  [v56 addButton:v51];

  uint64_t v57 = (char *)[self linkButton];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v130 = v36;
  uint64_t v58 = (uint64_t)v123;
  sub_10001F35C(v54, (uint64_t)v123);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10001F3C0(v58);
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setTitle:v59 forState:0];

  [v57 addTarget:v1 action:"cancelPressed" forControlEvents:64];
  id v60 = [v1 buttonTray];
  v123 = v57;
  [v60 addButton:v57];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v61 = v124;
  sub_10001F35C(v54, v124);
  swift_release();
  uint64_t v62 = v127;
  uint64_t v63 = v128;
  uint64_t v64 = *(void (**)(char *, uint64_t, uint64_t))(v128 + 16);
  uint64_t v65 = v129;
  v64(v127, v61 + *(int *)(v125 + 60), v129);
  sub_10001F3C0(v61);
  id v66 = (objc_class *)type metadata accessor for MiniProductPageView();
  uint64_t v67 = (char *)objc_allocWithZone(v66);
  v64(&v67[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_context], (uint64_t)v62, v65);
  id v68 = v1;
  uint64_t v69 = v67;
  InstallSheetContext.logKey.getter();
  id v70 = objc_allocWithZone((Class)AppStoreComponentsWrapper);
  NSString v71 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v72 = [v70 initWithLogKey:v71];

  *(void *)&v69[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper] = v72;
  v131.receiver = v69;
  v131.Class super_class = v66;
  uint64_t v73 = (char *)objc_msgSendSuper2(&v131, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_10003BCEC(v68, v73);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v65);

  [v73 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v74 = [v68 contentView];
  [v74 addSubview:v73];

  id v75 = [v130 bottomAnchor];
  id v76 = [v73 topAnchor];
  id v77 = [v75 constraintEqualToAnchor:v76 constant:-24.0];

  [v77 setActive:1];
  id v78 = [v68 contentView];
  id v79 = [v78 leadingAnchor];

  id v80 = [v73 leadingAnchor];
  if (v126)
  {
    id v81 = [v79 constraintGreaterThanOrEqualToAnchor:v80 constant:-v21];

    LODWORD(v82) = 1140457472;
    [v81 setPriority:v82];
    [v81 setActive:1];
    id v83 = [v68 contentView];
    id v84 = [v83 centerXAnchor];

    id v85 = [v73 centerXAnchor];
    id v86 = [v84 constraintEqualToAnchor:v85];

    [v86 setActive:1];
    id v87 = [v73 widthAnchor];
    id v88 = [v87 constraintLessThanOrEqualToConstant:360.0];

    [v88 setActive:1];
    id v89 = [v68 buttonTray];
    id v90 = [v89 widthAnchor];

    id v91 = [v90 constraintLessThanOrEqualToConstant:360.0];
    [v91 setActive:1];

    id v92 = v123;
    id v93 = [v123 bottomAnchor];
    p_align = (_DWORD *)(&stru_100072FE8 + 24);
    id v95 = [v68 buttonTray];
    id v96 = [v95 bottomAnchor];

    id v97 = [v93 constraintEqualToAnchor:v96 constant:-24.0];
    id v98 = (_DWORD *)(&stru_100072FE8 + 24);

    [v97 setActive:1];
  }
  else
  {
    id v99 = [v79 constraintEqualToAnchor:v80 constant:-v21];

    [v99 setActive:1];
    id v100 = [v68 contentView];
    id v101 = [v100 trailingAnchor];

    id v102 = [v73 trailingAnchor];
    id v103 = [v101 constraintEqualToAnchor:v102 constant:24.0];

    [v103 setActive:1];
    id v104 = [v68 buttonTray];
    id v105 = [v104 leadingAnchor];

    id v106 = v122;
    id v107 = [v122 leadingAnchor];
    id v108 = [v105 constraintEqualToAnchor:v107 constant:-v21];

    [v108 setActive:1];
    p_align = &stru_100072FE8.align;
    id v109 = [v68 buttonTray];
    id v110 = [v109 trailingAnchor];

    id v111 = [v106 trailingAnchor];
    id v97 = [v110 constraintEqualToAnchor:v111 constant:24.0];

    [v97 setActive:1];
    id v98 = &stru_100072FE8.align;
    id v92 = v123;
  }

  id v112 = [v68 *((SEL *)p_align + 128)];
  id v113 = [v112 bottomAnchor];

  id v114 = [v73 bottomAnchor];
  id v115 = [v113 *((SEL *)v98 + 147) v114];

  [v115 setActive:1];
  swift_release();
}

uint64_t sub_10001BCBC(char a1)
{
  uint64_t v3 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = (objc_class *)type metadata accessor for InstallSheetViewController();
  v12.receiver = v1;
  v12.Class super_class = v6;
  [super viewDidAppear:a1 & 1];
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  id v8 = v1;
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  void v10[4] = v8;
  sub_100033538((uint64_t)v5, (uint64_t)&unk_1000755B8, (uint64_t)v10);
  swift_release();
  return swift_release();
}

uint64_t sub_10001BE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10001BF08, v6, v5);
}

uint64_t sub_10001BF08()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001C068;
    return sub_100055A58();
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10001C068()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return _swift_task_switch(sub_10001FC6C, v3, v2);
}

uint64_t sub_10001C480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10001C518, v6, v5);
}

uint64_t sub_10001C518()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  [*(id *)(v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton) setEnabled:1];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10001C5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10001C664, v6, v5);
}

uint64_t sub_10001C664()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001C068;
    return sub_100055614();
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10001C7F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, void *))
{
  uint64_t v8 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for MainActor();
  id v12 = a1;
  uint64_t v13 = static MainActor.shared.getter();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v13;
  v14[3] = &protocol witness table for MainActor;
  void v14[4] = v12;
  a5(v10, a4, v14);

  return swift_release();
}

uint64_t sub_10001C930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = type metadata accessor for MainActor();
  v5[6] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[7] = v7;
  v5[8] = v6;
  return _swift_task_switch(sub_10001C9D0, v7, v6);
}

uint64_t sub_10001C9D0()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 72) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 80) = v2;
    void *v2 = v0;
    v2[1] = sub_10001CB38;
    uint64_t v3 = *(void *)(v0 + 32);
    return sub_1000550CC(v3);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 72) == 0;
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return v5();
  }
}

uint64_t sub_10001CB38()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return _swift_task_switch(sub_10001CC7C, v3, v2);
}

uint64_t sub_10001CC7C()
{
  swift_release();
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 72) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10001CDF0()
{
  uint64_t v0 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v0 - 8);
  id v56 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for InstallSheetContext.InstallType();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v51 - v7;
  uint64_t v57 = type metadata accessor for LocalizedInstallSheetContent();
  uint64_t v9 = __chkstk_darwin(v57);
  uint64_t v54 = (uint64_t)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v53 = (uint64_t)&v51 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v52 = (uint64_t)&v51 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v51 = (uint64_t)&v51 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v51 - v17;
  uint64_t v19 = type metadata accessor for FeatureFlag();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for MainActor();
  uint64_t v59 = static MainActor.shared.getter();
  uint64_t v60 = v23;
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, enum case for FeatureFlag.webDistribution(_:), v19);
  int v55 = isFeatureEnabled(_:)();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v24 = v58;
  uint64_t v25 = (uint64_t)v58 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent;
  sub_10001F35C((uint64_t)v58 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent, (uint64_t)v18);
  swift_release();
  InstallSheetContext.type.getter();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, enum case for InstallSheetContext.InstallType.marketplace(_:), v2);
  char v26 = static InstallSheetContext.InstallType.== infix(_:_:)();
  id v27 = *(void (**)(char *, uint64_t))(v3 + 8);
  v27(v6, v2);
  v27(v8, v2);
  sub_10001F3C0((uint64_t)v18);
  if ((v26 & 1) == 0) {
    goto LABEL_9;
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  if ((v55 & 1) == 0)
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v33 = v51;
    sub_10001F35C(v25, v51);
    swift_release();
    swift_bridgeObjectRetain();
    sub_10001F3C0(v33);
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v57 = v25;
    uint64_t v34 = v52;
    sub_10001F35C(v25, v52);
    swift_release();
    swift_bridgeObjectRetain();
    sub_10001F3C0(v34);
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v37 = [self alertControllerWithTitle:v35 message:v36 preferredStyle:1];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v38 = v53;
    sub_10001F35C(v57, v53);
    swift_release();
    swift_bridgeObjectRetain();
    sub_10001F3C0(v38);
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v24;
    id v40 = v24;
    NSString v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v65 = sub_10001F50C;
    uint64_t v66 = v39;
    unint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v62 = 1107296256;
    uint64_t v63 = sub_10001D994;
    uint64_t v64 = &unk_10006E508;
    id v42 = _Block_copy(&aBlock);
    swift_release();
    id v43 = self;
    id v44 = [v43 actionWithTitle:v41 style:1 handler:v42];
    _Block_release(v42);

    [v37 addAction:v44];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v45 = v54;
    sub_10001F35C(v57, v54);
    swift_release();
    swift_bridgeObjectRetain();
    sub_10001F3C0(v45);
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = v40;
    id v47 = v40;
    NSString v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v65 = sub_10001F560;
    uint64_t v66 = v46;
    unint64_t aBlock = _NSConcreteStackBlock;
    uint64_t v62 = 1107296256;
    uint64_t v63 = sub_10001D994;
    uint64_t v64 = &unk_10006E558;
    id v49 = _Block_copy(&aBlock);
    swift_release();
    id v50 = [v43 actionWithTitle:v48 style:0 handler:v49];
    _Block_release(v49);

    [v37 addAction:v50];
    [v37 setPreferredAction:v50];
    [v47 presentViewController:v37 animated:1 completion:0];
    swift_release();
  }
  else
  {
LABEL_9:
    uint64_t v28 = type metadata accessor for TaskPriority();
    uint64_t v29 = (uint64_t)v56;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v56, 1, 1, v28);
    id v30 = v24;
    uint64_t v31 = static MainActor.shared.getter();
    id v32 = (void *)swift_allocObject();
    v32[2] = v31;
    v32[3] = &protocol witness table for MainActor;
    v32[4] = v30;
    sub_100033538(v29, (uint64_t)&unk_100075548, (uint64_t)v32);
    swift_release();
    swift_release();
  }
}

uint64_t sub_10001D794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10001D830, v6, v5);
}

uint64_t sub_10001D830()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001C068;
    return sub_100053D84(0);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

void sub_10001D994(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10001D9FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  id v11 = a2;
  uint64_t v12 = static MainActor.shared.getter();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  sub_100033538((uint64_t)v9, a5, (uint64_t)v13);
  swift_release();
  return swift_release();
}

uint64_t sub_10001DB84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10001DC20, v6, v5);
}

uint64_t sub_10001DC20()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001C068;
    return sub_100053D84(1);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    id v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

void sub_10001DDA0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();
  swift_release();
}

uint64_t sub_10001DE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10001DF08, v6, v5);
}

uint64_t sub_10001DF08()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v2;
    void *v2 = v0;
    v2[1] = sub_10001E06C;
    return sub_100053D84(0);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    id v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10001E06C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return _swift_task_switch(sub_10001E1B0, v3, v2);
}

uint64_t sub_10001E1B0()
{
  swift_release();
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_10001E534()
{
  return sub_10001E94C(0, type metadata accessor for InstallSheetViewController);
}

uint64_t sub_10001E5AC()
{
  return type metadata accessor for InstallSheetViewController();
}

uint64_t type metadata accessor for InstallSheetViewController()
{
  uint64_t result = qword_100075508;
  if (!qword_100075508) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001E600()
{
  uint64_t result = type metadata accessor for LocalizedInstallSheetContent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10001E934(uint64_t a1)
{
  return sub_10001E94C(a1, type metadata accessor for NonHighlightableTextView);
}

id sub_10001E94C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.Class super_class = (Class)a2();
  return [super dealloc];
}

uint64_t type metadata accessor for NonHighlightableTextView()
{
  return self;
}

uint64_t sub_10001E9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = a2;
  uint64_t v2 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v2 - 8);
  id v49 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InstallSheetContext();
  uint64_t v44 = *(void *)(v4 - 8);
  uint64_t v45 = v4;
  __chkstk_darwin(v4);
  id v43 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedInstallSheetContent();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for URL();
  uint64_t v50 = *(void *)(v53 - 8);
  uint64_t v9 = __chkstk_darwin(v53);
  id v47 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = v10;
  __chkstk_darwin(v9);
  uint64_t v52 = (char *)v39 - v11;
  uint64_t v12 = type metadata accessor for UITextItem.Content();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  uint64_t v51 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  UITextItem.content.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v13 + 88))(v15, v12) == enum case for UITextItem.Content.link(_:))
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v15, v12);
    NSString v41 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v42 = v50 + 32;
    v41(v52, v15, v53);
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000AEDC(v16, (uint64_t)qword_100078088);
    id v17 = v46;
    uint64_t v18 = Logger.logObject.getter();
    int v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
    {
      LODWORD(v46) = v19;
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v56 = v40;
      *(_DWORD *)uint64_t v20 = 136446210;
      v39[1] = static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v39[0] = v20 + 4;
      sub_10001F35C((uint64_t)v17 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent, (uint64_t)v8);
      swift_release();
      uint64_t v21 = &v8[*(int *)(v6 + 60)];
      id v22 = v43;
      uint64_t v23 = v44;
      uint64_t v24 = v45;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v43, v21, v45);
      sub_10001F3C0((uint64_t)v8);
      uint64_t v25 = InstallSheetContext.logKey.getter();
      unint64_t v27 = v26;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v24);
      swift_release();
      uint64_t v55 = sub_100057B1C(v25, v27, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v46, "[%{public}s] User tapped learn more link", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v28 = type metadata accessor for TaskPriority();
    uint64_t v29 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v49, 1, 1, v28);
    uint64_t v30 = v50;
    uint64_t v31 = v47;
    id v32 = v52;
    uint64_t v33 = v53;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v47, v52, v53);
    id v34 = v17;
    uint64_t v35 = static MainActor.shared.getter();
    unint64_t v36 = (*(unsigned __int8 *)(v30 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    id v37 = (char *)swift_allocObject();
    *((void *)v37 + 2) = v35;
    *((void *)v37 + 3) = &protocol witness table for MainActor;
    *((void *)v37 + 4) = v34;
    v41(&v37[v36], v31, v33);
    sub_100033538(v29, (uint64_t)&unk_100075588, (uint64_t)v37);
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v33);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  swift_release();
  return v54;
}

id sub_10001F0B0(double a1, double a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = [v2 closestPositionToPoint:a1, a2];
  if (!v5)
  {
    swift_release();
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(objc_msgSend(v2, "tokenizer"), "rangeEnclosingPosition:withGranularity:inDirection:", v5, 0, static UITextDirection.layout(_:)());
  swift_unknownObjectRelease();
  if (!v7)
  {
    swift_release();

    return 0;
  }
  id v8 = [v2 beginningOfDocument];
  id v9 = [v7 start];
  id v10 = [v2 offsetFromPosition:v8 toPosition:v9];

  id result = [v2 attributedText];
  if (result)
  {
    uint64_t v12 = result;
    id v13 = [result attribute:NSLinkAttributeName atIndex:v10 effectiveRange:0];

    BOOL v14 = v13 != 0;
    if (v13)
    {
      _bridgeAnyObjectToAny(_:)();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v15, 0, sizeof(v15));
    }
    sub_10001F2FC((uint64_t)v15);
    swift_release();
    return (id)v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001F2FC(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100074FD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocalizedInstallSheetContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F3C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LocalizedInstallSheetContent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F420(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001DB84(a1, v4, v5, v6);
}

uint64_t sub_10001F4D4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F50C(uint64_t a1)
{
  return sub_10001D9FC(a1, *(void **)(v1 + 16), 155, (uint64_t)&unk_10006E5B8, (uint64_t)&unk_100075568);
}

uint64_t sub_10001F548(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001F558()
{
  return swift_release();
}

uint64_t sub_10001F560(uint64_t a1)
{
  return sub_10001D9FC(a1, *(void **)(v1 + 16), 160, (uint64_t)&unk_10006E590, (uint64_t)&unk_100075558);
}

uint64_t sub_10001F5A0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001DB84(a1, v4, v5, v6);
}

uint64_t sub_10001F658(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001D794(a1, v4, v5, v6);
}

uint64_t sub_10001F710(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001DE6C(a1, v4, v5, v6);
}

uint64_t sub_10001F7C4()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001F898(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000AC98;
  return sub_10001C930(a1, v5, v6, v7, v8);
}

uint64_t sub_10001F998(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001C5C8(a1, v4, v5, v6);
}

uint64_t sub_10001FA50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001C480(a1, v4, v5, v6);
}

uint64_t sub_10001FB08()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001FB48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10001BE6C(a1, v4, v5, v6);
}

unint64_t sub_10001FBFC()
{
  unint64_t result = qword_100075FC0;
  if (!qword_100075FC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100075FC0);
  }
  return result;
}

uint64_t sub_10001FC3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10001FC78()
{
  sub_100007978(&qword_1000756E0);
  swift_allocObject();
  uint64_t result = TaskLocal.init(wrappedValue:)();
  qword_100075630 = result;
  return result;
}

uint64_t sub_10001FCD4()
{
  os_activity_scope_state_s v2 = *(os_activity_scope_state_s *)(v0 + 16);
  os_activity_scope_leave(&v2);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LogActivity()
{
  return self;
}

uint64_t sub_10001FD60()
{
  qword_100075638 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");

  return swift_unknownObjectRetain();
}

os_activity_t sub_10001FD9C(os_activity_t description, char a2, void *dso)
{
  uint64_t v4 = (const char *)description;
  if (a2)
  {
    if ((unint64_t)description >> 32)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    if (description >> 11 == 27)
    {
      __break(1u);
      return description;
    }
    if (description >> 16 > 0x10)
    {
      __break(1u);
    }
    else if ((description & 0xFFFFFF80) == 0)
    {
      if (description > 0xFF)
      {
        __break(1u);
        goto LABEL_26;
      }
      unsigned int v6 = ((_BYTE)description + 1);
LABEL_13:
      *(void *)descriptiona = (v6 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v6) & 0x38)) & 0x38));
      if (qword_100074B48 == -1) {
        return _os_activity_create(dso, descriptiona, (os_activity_t)qword_100075638, OS_ACTIVITY_FLAG_DEFAULT);
      }
LABEL_26:
      swift_once();
      return _os_activity_create(dso, descriptiona, (os_activity_t)qword_100075638, OS_ACTIVITY_FLAG_DEFAULT);
    }
    int v7 = (description & 0x3F) << 8;
    unsigned int v8 = (v7 | (description >> 6)) + 33217;
    unsigned int v9 = (v7 | (description >> 6) & 0x3F) << 8;
    unsigned int v10 = (((v9 | (description >> 12) & 0x3F) << 8) | (description >> 18)) - 2122219023;
    unsigned int v11 = (v9 | (description >> 12)) + 8487393;
    if (description >> 16) {
      unsigned int v6 = v10;
    }
    else {
      unsigned int v6 = v11;
    }
    if (description < 0x800) {
      unsigned int v6 = v8;
    }
    goto LABEL_13;
  }
  if (!description)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (qword_100074B48 != -1) {
LABEL_17:
  }
    swift_once();
  uint64_t v5 = qword_100075638;

  return _os_activity_create(dso, v4, v5, OS_ACTIVITY_FLAG_DEFAULT);
}

uint64_t *sub_10001FF5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unsigned int v10 = (uint64_t *)((char *)a1 + v8);
    unsigned int v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *unsigned int v10 = *v11;
    v10[1] = v12;
    id v13 = (uint64_t *)((char *)a1 + v9);
    BOOL v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *id v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    id v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *id v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100020068(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100020100(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  unsigned int v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  id v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  id v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000201BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000202B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100020340(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100020404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020418);
}

uint64_t sub_100020418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
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

uint64_t sub_1000204DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000204F0);
}

uint64_t sub_1000204F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID();
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

uint64_t type metadata accessor for BulletPoint(uint64_t a1)
{
  return sub_100020D6C(a1, qword_100075740);
}

uint64_t sub_1000205D0()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100020668(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (uint64_t *)((char *)a2 + v6);
    swift_bridgeObjectRetain();
    sub_100007978(&qword_100075FB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100020780(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100007978(&qword_100075FB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for DynamicTypeSize();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100020838(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (void *)((char *)a2 + v4);
  swift_bridgeObjectRetain();
  sub_100007978(&qword_100075FB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  }
  else
  {
    void *v5 = *v6;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100020900(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_10000D7CC((uint64_t)a1 + v6, &qword_100075FB0);
    sub_100007978(&qword_100075FB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_1000209F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100007978(&qword_100075FB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

void *sub_100020AC8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_10000D7CC((uint64_t)a1 + v6, &qword_100075FB0);
    uint64_t v9 = sub_100007978(&qword_100075FB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for DynamicTypeSize();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100020BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020BD8);
}

uint64_t sub_100020BD8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100007978(&qword_100075780);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100020C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020CA0);
}

void *sub_100020CA0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100007978(&qword_100075780);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for MultiBulletPointView(uint64_t a1)
{
  return sub_100020D6C(a1, (uint64_t *)&unk_1000757E0);
}

uint64_t sub_100020D6C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100020DA4()
{
  sub_100020E40();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100020E40()
{
  if (!qword_1000757F0)
  {
    type metadata accessor for DynamicTypeSize();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000757F0);
    }
  }
}

uint64_t sub_100020E98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100020EB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100020F1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v2 = type metadata accessor for MultiBulletPointView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = sub_100007978(&qword_100075828);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007978(&qword_100075830);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v22 = (uint64_t)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v21 = (uint64_t)v20 - v11;
  type metadata accessor for MainActor();
  v20[1] = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (sub_100022600()) {
    uint64_t v12 = static HorizontalAlignment.leading.getter();
  }
  else {
    uint64_t v12 = static HorizontalAlignment.center.getter();
  }
  uint64_t v13 = v12;
  swift_release();
  *(void *)uint64_t v7 = v13;
  *((void *)v7 + 1) = 0x4036000000000000;
  v7[16] = 0;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v20[0] = &v7[*(int *)(sub_100007978(&qword_100075838) + 44)];
  uint64_t v24 = *v1;
  sub_100022984((uint64_t)v1, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  sub_100022B00((uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  swift_bridgeObjectRetain();
  sub_100007978(&qword_100075840);
  type metadata accessor for UUID();
  sub_100007978(&qword_100075848);
  sub_100025164(&qword_100075850, &qword_100075840);
  sub_100025164(&qword_100075858, &qword_100075848);
  sub_100022C2C(&qword_100075860, (void (*)(uint64_t))type metadata accessor for BulletPoint);
  ForEach<>.init(_:content:)();
  swift_release();
  double v16 = sub_1000224A4();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (sub_100022600()) {
    static Alignment.leading.getter();
  }
  else {
    static Alignment.center.getter();
  }
  swift_release();
  uint64_t v17 = v22;
  sub_1000220F0(0.0, 1, 0.0, 1, v16, 0, 0.0, 1, v22, 0.0, 1, 0.0, 1);
  sub_10000D7CC((uint64_t)v7, &qword_100075828);
  uint64_t v18 = v21;
  sub_100023A58(v17, v21, &qword_100075830);
  sub_100023A58(v18, v23, &qword_100075830);
  return swift_release();
}

uint64_t sub_100021448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007978(&qword_100075848);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v7 = sub_1000215B0();
  uint64_t v8 = (uint64_t *)&v6[*(int *)(v4 + 40)];
  *uint64_t v8 = swift_getKeyPath();
  sub_100007978(&qword_100075FB0);
  swift_storeEnumTagMultiPayload();
  sub_1000216D4(a1, (uint64_t)v6);
  *(double *)&v6[*(int *)(v4 + 36)] = v7;
  sub_100023A58((uint64_t)v6, a2, &qword_100075848);
  return swift_release();
}

double sub_1000215B0()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];
  swift_release();
  swift_release();

  double result = 16.0;
  if (v1 == (id)1) {
    return 14.0;
  }
  return result;
}

uint64_t sub_1000216D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v37 = sub_100007978(&qword_100075868);
  __chkstk_darwin(v37);
  uint64_t v39 = (uint64_t *)((char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100007978(&qword_100075870);
  __chkstk_darwin(v4 - 8);
  uint64_t v38 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Image.ResizingMode();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100007978(&qword_100075878);
  __chkstk_darwin(v35);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_100007978(&qword_100075880);
  uint64_t v12 = __chkstk_darwin(v36);
  uint64_t v42 = (uint64_t)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v40 = (uint64_t)&v31 - v14;
  type metadata accessor for MainActor();
  uint64_t v41 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for BulletPoint(0);
  swift_bridgeObjectRetain();
  Image.init(_internalSystemName:)();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v15 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v16 = v50;
  int v33 = v51;
  uint64_t v17 = v52;
  char v18 = v53;
  uint64_t v34 = a1;
  uint64_t v31 = v55;
  uint64_t v32 = v54;
  uint64_t v19 = (uint64_t)v38;
  static SymbolRenderingMode.hierarchical.getter();
  uint64_t v20 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = v39;
  sub_100023C98(v19, (uint64_t)v39 + *(int *)(v37 + 28), &qword_100075870);
  *uint64_t v22 = KeyPath;
  sub_100023C98((uint64_t)v22, (uint64_t)&v11[*(int *)(v35 + 36)], &qword_100075868);
  *(void *)uint64_t v11 = v15;
  *((void *)v11 + 1) = 0;
  *((_WORD *)v11 + 8) = 257;
  *((void *)v11 + 3) = v16;
  v11[32] = v33;
  *((void *)v11 + 5) = v17;
  v11[48] = v18;
  uint64_t v23 = v31;
  *((void *)v11 + 7) = v32;
  *((void *)v11 + 8) = v23;
  swift_retain();
  sub_10000D7CC((uint64_t)v22, &qword_100075868);
  sub_10000D7CC(v19, &qword_100075870);
  swift_release();
  uint64_t v24 = static Color.blue.getter();
  uint64_t v25 = v42;
  sub_100023C98((uint64_t)v11, v42, &qword_100075878);
  *(void *)(v25 + *(int *)(v36 + 36)) = v24;
  sub_10000D7CC((uint64_t)v11, &qword_100075878);
  uint64_t v26 = v40;
  sub_100023A58(v25, v40, &qword_100075880);
  uint64_t v27 = static HorizontalAlignment.center.getter();
  sub_100021C78(v34, v44);
  v45[296] = 1;
  memcpy(&v45[7], v44, 0x120uLL);
  sub_100023C98(v26, v25, &qword_100075880);
  uint64_t v28 = v43;
  sub_100023C98(v25, v43, &qword_100075880);
  uint64_t v29 = (void *)(v28 + *(int *)(sub_100007978(&qword_100075888) + 48));
  v46[0] = v27;
  v46[1] = 0;
  LOBYTE(v46[2]) = 1;
  memcpy((char *)&v46[2] + 1, v45, 0x127uLL);
  memcpy(v29, v46, 0x138uLL);
  sub_100023ABC((uint64_t)v46);
  sub_10000D7CC(v26, &qword_100075880);
  v47[0] = v27;
  v47[1] = 0;
  char v48 = 1;
  memcpy(v49, v45, sizeof(v49));
  sub_100023B40((uint64_t)v47);
  sub_10000D7CC(v25, &qword_100075880);
  return swift_release();
}

uint64_t sub_100021C78@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = type metadata accessor for BulletPoint(0);
  uint64_t v4 = (void *)(a1 + *(int *)(v3 + 24));
  uint64_t v5 = v4[1];
  *(void *)&__src[0] = *v4;
  *((void *)&__src[0] + 1) = v5;
  sub_100023BC4();
  swift_bridgeObjectRetain();
  uint64_t v6 = Text.init<A>(_:)();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  static Font.subheadline.getter();
  uint64_t v50 = a1;
  uint64_t v11 = Text.font(_:)();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  char v16 = v15 & 1;
  sub_100023BB4(v6, v8, v10);
  swift_bridgeObjectRelease();
  uint64_t v17 = Text.bold()();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_100023BB4(v11, v13, v16);
  swift_bridgeObjectRelease();
  uint64_t v24 = static Alignment.leading.getter();
  sub_1000222B0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v24, v25, v17, v19, v23, v21);
  sub_100023BB4(v17, v19, v23);
  swift_bridgeObjectRelease();
  long long v67 = __src[6];
  long long v68 = __src[7];
  long long v69 = __src[8];
  long long v63 = __src[2];
  long long v64 = __src[3];
  long long v65 = __src[4];
  long long v66 = __src[5];
  long long v61 = __src[0];
  long long v62 = __src[1];
  uint64_t v26 = (void *)(v50 + *(int *)(v3 + 28));
  uint64_t v27 = v26[1];
  *(void *)&__src[0] = *v26;
  *((void *)&__src[0] + 1) = v27;
  swift_bridgeObjectRetain();
  uint64_t v28 = Text.init<A>(_:)();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  LODWORD(__src[0]) = static HierarchicalShapeStyle.secondary.getter();
  uint64_t v33 = Text.foregroundStyle<A>(_:)();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  LOBYTE(v21) = v38 & 1;
  sub_100023BB4(v28, v30, v32);
  swift_bridgeObjectRelease();
  uint64_t v39 = static Alignment.leading.getter();
  sub_1000222B0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v39, v40, v33, v35, v21, v37);
  sub_100023BB4(v33, v35, v21);
  swift_bridgeObjectRelease();
  long long v58 = __src[6];
  long long v59 = __src[7];
  long long v60 = __src[8];
  long long v54 = __src[2];
  long long v55 = __src[3];
  long long v56 = __src[4];
  long long v57 = __src[5];
  long long v52 = __src[0];
  long long v53 = __src[1];
  v70[6] = v67;
  v70[7] = v68;
  v70[8] = v69;
  v70[2] = v63;
  v70[3] = v64;
  v70[4] = v65;
  v70[5] = v66;
  v70[0] = v61;
  v70[1] = v62;
  long long v41 = __src[6];
  long long v42 = __src[7];
  v71[6] = __src[6];
  v71[7] = __src[7];
  v71[8] = __src[8];
  long long v43 = __src[2];
  long long v44 = __src[3];
  v71[2] = __src[2];
  v71[3] = __src[3];
  long long v46 = __src[4];
  long long v45 = __src[5];
  v71[4] = __src[4];
  v71[5] = __src[5];
  long long v48 = __src[0];
  long long v47 = __src[1];
  v71[0] = __src[0];
  v71[1] = __src[1];
  __src[6] = v67;
  __src[7] = v68;
  __src[2] = v63;
  __src[3] = v64;
  __src[4] = v65;
  __src[5] = v66;
  __src[0] = v61;
  __src[1] = v62;
  __src[14] = v45;
  __src[15] = v41;
  __src[16] = v42;
  __src[17] = __src[8];
  __src[10] = v47;
  __src[11] = v43;
  __src[12] = v44;
  __src[13] = v46;
  __src[8] = v69;
  __src[9] = v48;
  memcpy(a2, __src, 0x120uLL);
  v73[6] = v58;
  v73[7] = v59;
  v73[8] = v60;
  v73[2] = v54;
  v73[3] = v55;
  v73[5] = v57;
  v73[4] = v56;
  v73[1] = v53;
  v73[0] = v52;
  sub_100023C18((uint64_t)v70);
  sub_100023C18((uint64_t)v71);
  sub_100023C58((uint64_t)v73);
  v74[6] = v67;
  v74[7] = v68;
  v74[8] = v69;
  v74[2] = v63;
  v74[3] = v64;
  v74[4] = v65;
  v74[5] = v66;
  v74[0] = v61;
  v74[1] = v62;
  sub_100023C58((uint64_t)v74);
  return swift_release();
}

__n128 sub_1000220F0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    char v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100023C98(v13, a9, &qword_100075828);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100007978(&qword_100075830) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_1000222B0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    long long v31 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_100023B30(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

double sub_1000224A4()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (sub_100022600())
  {
    swift_release();
    return INFINITY;
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v1 = [self currentDevice];
    id v2 = [v1 userInterfaceIdiom];
    swift_release();
    swift_release();

    double result = INFINITY;
    if (v2 == (id)1) {
      return 340.0;
    }
  }
  return result;
}

uint64_t sub_100022600()
{
  uint64_t v0 = type metadata accessor for DynamicTypeSize();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  type metadata accessor for MultiBulletPointView(0);
  sub_1000236D4((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for DynamicTypeSize.large(_:), v0);
  sub_100022C2C(qword_100075898, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v7 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  swift_release();
  return v7 & 1;
}

uint64_t sub_100022864()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100022880@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1000236D4(a1);

  return swift_release();
}

uint64_t sub_10002293C()
{
  return sub_100022C2C(&qword_100075820, (void (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100022984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MultiBulletPointView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000229E8()
{
  uint64_t v1 = (int *)(type metadata accessor for MultiBulletPointView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + v1[7];
  sub_100007978(&qword_100075FB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for DynamicTypeSize();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100022B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MultiBulletPointView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022B64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for MultiBulletPointView(0);

  return sub_100021448(a1, a2);
}

uint64_t sub_100022BE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100022C2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100022C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v3 = *(char **)(a1 + 16);
  uint64_t v2 = *(char **)(a1 + 24);
  uint64_t v4 = type metadata accessor for HStack();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  long long v48 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v47 = (char *)&v44 - v7;
  unsigned __int8 v51 = v3;
  long long v52 = v2;
  uint64_t v8 = type metadata accessor for VStack();
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  long long v45 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  long long v44 = (char *)&v44 - v11;
  uint64_t v12 = type metadata accessor for DynamicTypeSize();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  char v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v44 - v17;
  uint64_t v19 = type metadata accessor for _ConditionalContent();
  uint64_t v55 = *(void *)(v19 - 8);
  uint64_t v56 = v19;
  __chkstk_darwin(v19);
  long long v54 = (char *)&v44 - v20;
  type metadata accessor for MainActor();
  uint64_t v53 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  char v21 = v50;
  sub_100022880((uint64_t)v18);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v16, enum case for DynamicTypeSize.large(_:), v12);
  sub_100022C2C(qword_100075898, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v22 = dispatch thunk of static Comparable.< infix(_:_:)();
  char v23 = *(void (**)(char *, uint64_t))(v13 + 8);
  v23(v16, v12);
  v23(v18, v12);
  if (v22)
  {
    uint64_t v24 = static HorizontalAlignment.leading.getter();
    __chkstk_darwin(v24);
    uint64_t v25 = v52;
    *(&v44 - 4) = v51;
    *(&v44 - 3) = v25;
    *(&v44 - 2) = v21;
    uint64_t v26 = (uint64_t)v45;
    VStack.init(alignment:spacing:content:)();
    swift_getWitnessTable();
    uint64_t v27 = v46;
    long long v28 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
    __n128 v29 = v44;
    v28(v44, v26, v8);
    long long v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v30(v26, v8);
    v28((char *)v26, (uint64_t)v29, v8);
    swift_getWitnessTable();
    long long v31 = v54;
    sub_100023374(v26, v8);
    v30(v26, v8);
    v30((uint64_t)v29, v8);
  }
  else
  {
    uint64_t v32 = static VerticalAlignment.center.getter();
    __chkstk_darwin(v32);
    long long v33 = v52;
    *(&v44 - 4) = v51;
    *(&v44 - 3) = v33;
    *(&v44 - 2) = v21;
    uint64_t v34 = (uint64_t)v48;
    HStack.init(alignment:spacing:content:)();
    swift_getWitnessTable();
    uint64_t v35 = v49;
    long long v36 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
    long long v37 = v47;
    v36(v47, v34, v4);
    long long v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v38(v34, v4);
    v36((char *)v34, (uint64_t)v37, v4);
    swift_getWitnessTable();
    long long v31 = v54;
    sub_1000235D8(v34, v8, v4);
    v38(v34, v4);
    v38((uint64_t)v37, v4);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v58 = WitnessTable;
  uint64_t v59 = v40;
  uint64_t v41 = v56;
  swift_getWitnessTable();
  uint64_t v42 = v55;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v57, v31, v41);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v31, v41);
  return swift_release();
}

uint64_t sub_100023374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _ConditionalContent.Storage();
  __chkstk_darwin(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10002346C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v9(v8, a1, a2);
  v9(a3, (uint64_t)v8, a2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a2);
  return swift_release();
}

uint64_t sub_1000235D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for _ConditionalContent.Storage();
  __chkstk_darwin(v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000236D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007978(&qword_100075FB0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023C98(v2, (uint64_t)v10, &qword_100075FB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for DynamicTypeSize();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    uint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      char v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)char v16 = 136315138;
      v18[2] = sub_100057B1C(0x5463696D616E7944, 0xEF657A6953657079, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10002399C()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_1000239C0(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100075870);
  __chkstk_darwin(v2 - 8);
  sub_100023C98(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100075870);
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_100023A58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007978(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100023ABC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  char v4 = *(unsigned char *)(a1 + 184);
  sub_100023B30(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_100023B30(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100023B30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100023B40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  char v4 = *(unsigned char *)(a1 + 184);
  sub_100023BB4(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100023BB4(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100023BB4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100023BC4()
{
  unint64_t result = qword_100075890;
  if (!qword_100075890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075890);
  }
  return result;
}

uint64_t sub_100023C18(uint64_t a1)
{
  return a1;
}

uint64_t sub_100023C58(uint64_t a1)
{
  return a1;
}

uint64_t sub_100023C98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007978(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100023CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100023D04()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_100020E40();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_100023DDC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v9 & 0xF8 | 7;
  if (*(void *)(v8 + 64) <= 8uLL) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = *(void *)(v8 + 64);
  }
  int v12 = v9 | *(_DWORD *)(v6 + 80);
  if ((v12 & 0x1000F8) != 0 || v11 + ((v10 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10) + 1 > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + (((v12 & 0xF8 | 7u) + 16) & ~(unint64_t)(v12 & 0xF8 | 7u)));
LABEL_24:
    swift_retain();
    return a1;
  }
  uint64_t v15 = ~v10;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
  char v16 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  *char v16 = *v17;
  uint64_t v18 = (void *)(((unint64_t)v16 + v10 + 8) & v15);
  uint64_t v19 = (unsigned __int8 *)(((unint64_t)v17 + v10 + 8) & v15);
  unsigned int v20 = v19[v11];
  unsigned int v21 = v20 - 2;
  if (v20 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v22 = v11;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *v19;
        goto LABEL_19;
      case 2:
        int v23 = *(unsigned __int16 *)v19;
        goto LABEL_19;
      case 3:
        int v23 = *(unsigned __int16 *)v19 | (v19[2] << 16);
        goto LABEL_19;
      case 4:
        int v23 = *(_DWORD *)v19;
LABEL_19:
        int v24 = (v23 | (v21 << (8 * v11))) + 2;
        unsigned int v20 = v23 + 2;
        if (v11 < 4) {
          unsigned int v20 = v24;
        }
        break;
      default:
        break;
    }
  }
  if (v20 != 1)
  {
    *uint64_t v18 = *(void *)v19;
    *((unsigned char *)v18 + v11) = 0;
    goto LABEL_24;
  }
  (*(void (**)(void *))(v8 + 16))(v18);
  *((unsigned char *)v18 + v11) = 1;
  return a1;
}

uint64_t sub_10002404C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  uint64_t v7 = (unsigned __int8 *)((v4 + v6 + 8) & ~v6);
  unint64_t v8 = *(void *)(v5 + 64);
  if (v8 <= 8) {
    unint64_t v8 = 8;
  }
  unsigned int v9 = v7[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *v7;
        goto LABEL_12;
      case 2:
        int v12 = *(unsigned __int16 *)v7;
        goto LABEL_12;
      case 3:
        int v12 = *(unsigned __int16 *)v7 | (v7[2] << 16);
        goto LABEL_12;
      case 4:
        int v12 = *(_DWORD *)v7;
LABEL_12:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 == 1)
  {
    uint64_t v14 = *(uint64_t (**)(void))(v5 + 8);
    return v14();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000241EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  uint64_t v11 = v10 + 15;
  unint64_t v12 = (unint64_t)v7 + v10 + 15;
  unint64_t v13 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = (void *)(v12 & v13);
  uint64_t v15 = (unsigned __int8 *)(((unint64_t)v8 + v11) & v13);
  if (*(void *)(v9 + 64) <= 8uLL) {
    uint64_t v16 = 8;
  }
  else {
    uint64_t v16 = *(void *)(v9 + 64);
  }
  unsigned int v17 = v15[v16];
  unsigned int v18 = v17 - 2;
  if (v17 >= 2)
  {
    if (v16 <= 3) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 4;
    }
    switch(v19)
    {
      case 1:
        int v20 = *v15;
        goto LABEL_13;
      case 2:
        int v20 = *(unsigned __int16 *)v15;
        goto LABEL_13;
      case 3:
        int v20 = *(unsigned __int16 *)(((unint64_t)v8 + v11) & v13) | (*(unsigned __int8 *)((((unint64_t)v8
                                                                                                + v11) & v13)
                                                                                              + 2) << 16);
        goto LABEL_13;
      case 4:
        int v20 = *(_DWORD *)v15;
LABEL_13:
        int v21 = (v20 | (v18 << (8 * v16))) + 2;
        unsigned int v17 = v20 + 2;
        if (v16 < 4) {
          unsigned int v17 = v21;
        }
        break;
      default:
        break;
    }
  }
  if (v17 == 1)
  {
    (*(void (**)(void *))(v9 + 16))(v14);
    char v22 = 1;
  }
  else
  {
    *uint64_t v14 = *(void *)v15;
    swift_retain();
    char v22 = 0;
  }
  *((unsigned char *)v14 + v16) = v22;
  return a1;
}

uint64_t sub_1000243AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = type metadata accessor for DynamicTypeSize();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v12 = v11 + 15;
  unint64_t v13 = (unint64_t)v7 + v11 + 15;
  unint64_t v14 = ~v11 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = (unsigned __int8 *)(v13 & v14);
  unint64_t v16 = (unint64_t)v8 + v12;
  unsigned int v17 = (unsigned __int8 *)(v16 & v14);
  if ((v13 & v14) != (v16 & v14))
  {
    uint64_t v18 = v9;
    uint64_t v19 = *(void *)(v9 - 8);
    if (*(void *)(v10 + 64) <= 8uLL) {
      uint64_t v20 = 8;
    }
    else {
      uint64_t v20 = *(void *)(v10 + 64);
    }
    unsigned int v21 = v15[v20];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v15;
          goto LABEL_14;
        case 2:
          int v24 = *(unsigned __int16 *)v15;
          goto LABEL_14;
        case 3:
          int v24 = *(unsigned __int16 *)v15 | (v15[2] << 16);
          goto LABEL_14;
        case 4:
          int v24 = *(_DWORD *)v15;
LABEL_14:
          int v25 = (v24 | (v22 << (8 * v20))) + 2;
          unsigned int v21 = v24 + 2;
          if (v20 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v19 + 8))(v15, v9);
    }
    else {
      swift_release();
    }
    unsigned int v26 = v17[v20];
    unsigned int v27 = v26 - 2;
    if (v26 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v28 = v20;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *v17;
          goto LABEL_28;
        case 2:
          int v29 = *(unsigned __int16 *)v17;
          goto LABEL_28;
        case 3:
          int v29 = *(unsigned __int16 *)v17 | (v17[2] << 16);
          goto LABEL_28;
        case 4:
          int v29 = *(_DWORD *)v17;
LABEL_28:
          int v30 = (v29 | (v27 << (8 * v20))) + 2;
          unsigned int v26 = v29 + 2;
          if (v20 < 4) {
            unsigned int v26 = v30;
          }
          break;
        default:
          break;
      }
    }
    if (v26 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v19 + 16))(v15, v17, v18);
      v15[v20] = 1;
    }
    else
    {
      *(void *)uint64_t v15 = *(void *)v17;
      v15[v20] = 0;
      swift_retain();
    }
  }
  return a1;
}

uint64_t sub_10002462C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  uint64_t v11 = v10 + 15;
  unint64_t v12 = (unint64_t)v7 + v10 + 15;
  unint64_t v13 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (void *)(v12 & v13);
  uint64_t v15 = (unsigned __int8 *)(((unint64_t)v8 + v11) & v13);
  if (*(void *)(v9 + 64) <= 8uLL) {
    uint64_t v16 = 8;
  }
  else {
    uint64_t v16 = *(void *)(v9 + 64);
  }
  unsigned int v17 = v15[v16];
  unsigned int v18 = v17 - 2;
  if (v17 >= 2)
  {
    if (v16 <= 3) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 4;
    }
    switch(v19)
    {
      case 1:
        int v20 = *v15;
        goto LABEL_13;
      case 2:
        int v20 = *(unsigned __int16 *)v15;
        goto LABEL_13;
      case 3:
        int v20 = *(unsigned __int16 *)(((unint64_t)v8 + v11) & v13) | (*(unsigned __int8 *)((((unint64_t)v8
                                                                                                + v11) & v13)
                                                                                              + 2) << 16);
        goto LABEL_13;
      case 4:
        int v20 = *(_DWORD *)v15;
LABEL_13:
        int v21 = (v20 | (v18 << (8 * v16))) + 2;
        unsigned int v17 = v20 + 2;
        if (v16 < 4) {
          unsigned int v17 = v21;
        }
        break;
      default:
        break;
    }
  }
  if (v17 == 1)
  {
    (*(void (**)(void *))(v9 + 32))(v14);
    char v22 = 1;
  }
  else
  {
    char v22 = 0;
    *unint64_t v14 = *(void *)v15;
  }
  *((unsigned char *)v14 + v16) = v22;
  return a1;
}

uint64_t sub_1000247E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = type metadata accessor for DynamicTypeSize();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v12 = v11 + 15;
  unint64_t v13 = (unint64_t)v7 + v11 + 15;
  unint64_t v14 = ~v11 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = (unsigned __int8 *)(v13 & v14);
  unint64_t v16 = (unint64_t)v8 + v12;
  unsigned int v17 = (unsigned __int8 *)(v16 & v14);
  if ((v13 & v14) != (v16 & v14))
  {
    uint64_t v18 = v9;
    uint64_t v19 = *(void *)(v9 - 8);
    if (*(void *)(v10 + 64) <= 8uLL) {
      uint64_t v20 = 8;
    }
    else {
      uint64_t v20 = *(void *)(v10 + 64);
    }
    unsigned int v21 = v15[v20];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v15;
          goto LABEL_14;
        case 2:
          int v24 = *(unsigned __int16 *)v15;
          goto LABEL_14;
        case 3:
          int v24 = *(unsigned __int16 *)v15 | (v15[2] << 16);
          goto LABEL_14;
        case 4:
          int v24 = *(_DWORD *)v15;
LABEL_14:
          int v25 = (v24 | (v22 << (8 * v20))) + 2;
          unsigned int v21 = v24 + 2;
          if (v20 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v19 + 8))(v15, v9);
    }
    else {
      swift_release();
    }
    unsigned int v26 = v17[v20];
    unsigned int v27 = v26 - 2;
    if (v26 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v28 = v20;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *v17;
          goto LABEL_28;
        case 2:
          int v29 = *(unsigned __int16 *)v17;
          goto LABEL_28;
        case 3:
          int v29 = *(unsigned __int16 *)v17 | (v17[2] << 16);
          goto LABEL_28;
        case 4:
          int v29 = *(_DWORD *)v17;
LABEL_28:
          int v30 = (v29 | (v27 << (8 * v20))) + 2;
          unsigned int v26 = v29 + 2;
          if (v20 < 4) {
            unsigned int v26 = v30;
          }
          break;
        default:
          break;
      }
    }
    if (v26 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v19 + 32))(v15, v17, v18);
      char v31 = 1;
    }
    else
    {
      char v31 = 0;
      *(void *)uint64_t v15 = *(void *)v17;
    }
    v15[v20] = v31;
  }
  return a1;
}

uint64_t sub_100024A64(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  uint64_t v9 = 8;
  if (*(void *)(v8 + 64) > 8uLL) {
    uint64_t v9 = *(void *)(v8 + 64);
  }
  if (v7 <= 0xFE) {
    unsigned int v10 = 254;
  }
  else {
    unsigned int v10 = v7;
  }
  uint64_t v11 = *(void *)(v6 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  if (a2 <= v10) {
    goto LABEL_27;
  }
  unint64_t v13 = v9 + ((v12 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v12) + 1;
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v17 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_27;
      }
      goto LABEL_17;
    }
    if (v17 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_27;
      }
      goto LABEL_17;
    }
    if (v17 < 2)
    {
LABEL_27:
      if (v7 < 0xFE)
      {
        unsigned int v22 = *(unsigned __int8 *)((((((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + v12 + 8) & ~v12) + v9);
        if (v22 >= 2) {
          return (v22 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
      else
      {
        unsigned int v21 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
        return v21(a1, v7, v5);
      }
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_27;
  }
LABEL_17:
  int v18 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v18 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v19 = v13;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v10 + (v20 | v18) + 1;
}

void sub_100024CEC(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v27 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(type metadata accessor for DynamicTypeSize() - 8);
  unint64_t v11 = *(void *)(v10 + 64);
  if (v11 <= 8) {
    unint64_t v11 = 8;
  }
  if (v9 <= 0xFE) {
    unsigned int v12 = 254;
  }
  else {
    unsigned int v12 = v9;
  }
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  size_t v15 = v11 + 1;
  size_t v16 = ((v14 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v14) + v11 + 1;
  if (a3 <= v12)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v12 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v12 < a2)
  {
    unsigned int v18 = ~v12 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_54;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_54:
      __break(1u);
      JUMPOUT(0x100025070);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v9 < 0xFE)
        {
          uint64_t v23 = (unsigned char *)((((unint64_t)&a1[v13 + 7] & 0xFFFFFFFFFFFFFFF8) + v14 + 8) & ~v14);
          if (a2 > 0xFE)
          {
            if (v15 <= 3) {
              int v24 = ~(-1 << (8 * v15));
            }
            else {
              int v24 = -1;
            }
            if (v15)
            {
              int v25 = v24 & (a2 - 255);
              if (v15 <= 3) {
                int v26 = v15;
              }
              else {
                int v26 = 4;
              }
              bzero(v23, v15);
              switch(v26)
              {
                case 2:
                  *(_WORD *)uint64_t v23 = v25;
                  break;
                case 3:
                  *(_WORD *)uint64_t v23 = v25;
                  v23[2] = BYTE2(v25);
                  break;
                case 4:
                  *(_DWORD *)uint64_t v23 = v25;
                  break;
                default:
                  *uint64_t v23 = v25;
                  break;
              }
            }
          }
          else
          {
            v23[v11] = -(char)a2;
          }
        }
        else
        {
          unsigned int v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
          v22(a1, a2, v9, v7);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for TypeDependentStackView()
{
  return sub_100025234();
}

unint64_t sub_1000250C4()
{
  unint64_t result = qword_100075920;
  if (!qword_100075920)
  {
    sub_100022BE4(&qword_100075830);
    sub_100025164(&qword_100075928, &qword_100075828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075920);
  }
  return result;
}

uint64_t sub_100025164(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100022BE4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000251A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000251EC@<X0>(char *a1@<X8>)
{
  return sub_10002346C(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_100025210@<X0>(char *a1@<X8>)
{
  return sub_10002346C(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_100025234()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100025264()
{
  return swift_getWitnessTable();
}

uint64_t sub_100025334()
{
  *(void *)(v1 + 88) = v0;
  return _swift_task_switch(sub_100025354, 0, 0);
}

uint64_t sub_100025354()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000AEDC(v2, (uint64_t)qword_100078088);
  id v3 = v1;
  unint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (char *)v0[11];
  uint64_t v28 = (id *)(v0 + 11);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    uint64_t v10 = *(void **)&v7[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    v0[10] = v10;
    id v11 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v10;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[%@] Running install confirmation task", v8, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v12 = [self identityOfCurrentProcess];
  v0[12] = v12;
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    id v15 = v13;
    NSString v16 = String._bridgeToObjectiveC()();
    v0[13] = [v14 initWithSceneProvidingProcess:v15 configurationIdentifier:v16];

    return _swift_task_switch(sub_10002573C, 0, 0);
  }
  else
  {
    id v17 = *v28;
    unsigned int v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    BOOL v20 = os_log_type_enabled(v18, v19);
    int v21 = (char *)*v28;
    if (v20)
    {
      unsigned int v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      *(_DWORD *)unsigned int v22 = 138412290;
      uint64_t v23 = *(void **)&v21[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
      v0[10] = v23;
      id v24 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v27 = v23;

      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] No identity", v22, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    int v25 = (uint64_t (*)(void))v0[1];
    return v25(0);
  }
}

uint64_t sub_10002573C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[11];
  v0[2] = v0;
  v0[7] = v0 + 10;
  v0[3] = sub_1000257EC;
  uint64_t v3 = swift_continuation_init();
  sub_100025938(v3, v2, v1);
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000257EC()
{
  *(unsigned char *)(*(void *)v0 + 112) = *(unsigned char *)(*(void *)v0 + 80);
  return _swift_task_switch(sub_1000258D0, 0, 0);
}

uint64_t sub_1000258D0()
{
  uint64_t v1 = *(void **)(v0 + 104);

  uint64_t v2 = *(unsigned __int8 *)(v0 + 112);
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

void sub_100025938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext) init];
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = a1;
  uint64_t v35 = sub_100027004;
  uint64_t v36 = v8;
  unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
  unint64_t v32 = 1107296256;
  long long v33 = sub_10001D994;
  uint64_t v34 = &unk_10006E768;
  uint64_t v9 = _Block_copy(&aBlock);
  uint64_t v10 = self;
  swift_retain();
  id v11 = [v10 responderWithHandler:v9];
  _Block_release(v9);
  swift_release();
  swift_release();
  int v30 = v11;
  id v12 = [objc_allocWithZone((Class)BSAction) initWithInfo:0 responder:v11];
  sub_100007978((uint64_t *)&unk_100074FA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005BA50;
  *(void *)(inited + 32) = v12;
  unint64_t aBlock = inited;
  specialized Array._endMutation()();
  unint64_t v14 = aBlock;
  if (aBlock >> 62)
  {
    id v17 = v12;
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v18) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v15 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v16 = v12;
  if (v15) {
LABEL_3:
  }
    sub_100046A14(v14);
LABEL_5:
  swift_bridgeObjectRelease();
  sub_10000D62C();
  sub_100027024((unint64_t *)&qword_100074FB0, (void (*)(uint64_t))sub_10000D62C);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v6 setActions:isa];

  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  BOOL v20 = v6;
  PropertyListEncoder.init()();
  type metadata accessor for InstallSheetContext();
  sub_100027024(&qword_100075988, (void (*)(uint64_t))&type metadata accessor for InstallSheetContext);
  uint64_t v21 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v23 = v22;
  swift_release();
  sub_100007978(&qword_100074FC0);
  uint64_t v24 = swift_initStackObject();
  *(_OWORD *)(v24 + 16) = xmmword_10005B4B0;
  unint64_t aBlock = 0x44747865746E6F63;
  unint64_t v32 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)();
  *(void *)(v24 + 96) = &type metadata for Data;
  *(void *)(v24 + 72) = v21;
  *(void *)(v24 + 80) = v23;
  sub_10000D6B4(v21, v23);
  sub_10004DF60(v24);
  Class v25 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v20 setUserInfo:v25];

  id v26 = [self newHandleWithDefinition:a3 configurationContext:v20];
  uint64_t v27 = *(void **)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle);
  *(void *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle) = v26;
  id v28 = v26;

  [v28 registerObserver:a2];
  id v29 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
  [v28 activateWithContext:v29];

  sub_10000D70C(v21, v23);
}

void sub_100025F7C(void *a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = [a1 info];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = [v7 objectForSetting:1];

      if (v9)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v32, 0, sizeof(v32));
      }
      sub_10000D764((uint64_t)v32, (uint64_t)&v33);
      if (*((void *)&v34 + 1))
      {
        if (swift_dynamicCast())
        {
          int v10 = LOBYTE(v32[0]);
          if (qword_100074B50 != -1) {
            swift_once();
          }
          uint64_t v11 = type metadata accessor for Logger();
          sub_10000AEDC(v11, (uint64_t)qword_100078088);
          id v12 = v6;
          uint64_t v13 = Logger.logObject.getter();
          os_log_type_t v14 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = swift_slowAlloc();
            id v29 = (void *)swift_slowAlloc();
            *(void *)&long long v33 = swift_slowAlloc();
            *(_DWORD *)uint64_t v15 = 138412546;
            log = v13;
            id v16 = *(void **)&v12[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
            *(void *)&v32[0] = v16;
            id v17 = v16;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v29 = v16;

            *(_WORD *)(v15 + 12) = 2080;
            if (v10) {
              uint64_t v18 = 0x656D7269666E6F63;
            }
            else {
              uint64_t v18 = 0x64656C65636E6163;
            }
            if (v10) {
              unint64_t v19 = 0xE900000000000064;
            }
            else {
              unint64_t v19 = 0xE800000000000000;
            }
            *(void *)&v32[0] = sub_100057B1C(v18, v19, (uint64_t *)&v33);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, log, v14, "[%@] Install %s", (uint8_t *)v15, 0x16u);
            sub_100007978(&qword_100074F88);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
          }
LABEL_26:
          **(unsigned char **)(*(void *)(a3 + 64) + 40) = v10;
          swift_continuation_resume();

          return;
        }
LABEL_20:
        if (qword_100074B50 != -1) {
          swift_once();
        }
        uint64_t v20 = type metadata accessor for Logger();
        sub_10000AEDC(v20, (uint64_t)qword_100078088);
        uint64_t v21 = v6;
        unint64_t v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          Class v25 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v24 = 138412290;
          char v31 = v6;
          uint64_t v26 = a3;
          uint64_t v27 = *(void **)&v21[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
          *(void *)&long long v33 = v27;
          id v28 = v27;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *Class v25 = v27;
          a3 = v26;
          id v6 = v31;

          _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@] No response provided, defaulting to cancel.", v24, 0xCu);
          sub_100007978(&qword_100074F88);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        LOBYTE(v10) = 0;
        goto LABEL_26;
      }
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    sub_10001F2FC((uint64_t)&v33);
    goto LABEL_20;
  }
}

id sub_10002648C()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for InstallConfirmationTask();
  return [super dealloc];
}

uint64_t sub_100026554()
{
  return type metadata accessor for InstallConfirmationTask();
}

uint64_t type metadata accessor for InstallConfirmationTask()
{
  uint64_t result = qword_100075970;
  if (!qword_100075970) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000265A8()
{
  uint64_t result = type metadata accessor for InstallSheetContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100026780()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  id v7 = v0;
  objc_super v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v4 = 138412290;
    uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    id v6 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v8;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100026954()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  objc_super v2 = v0;
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    uint64_t v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
    id v7 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v6 = v11;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v8 = OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle;
  id v9 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle];
  if (v9)
  {
    [v9 unregisterObserver:v2];
    id v9 = *(void **)&v2[v8];
  }
  [v9 invalidate];
  int v10 = *(void **)&v2[v8];
  *(void *)&v2[v8] = 0;
}

void sub_100026B34(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle;
  os_log_type_t v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle];
  if (v4)
  {
    [v4 unregisterObserver:v1];
    os_log_type_t v4 = *(void **)&v1[v3];
  }
  [v4 invalidate];
  uint64_t v5 = *(void **)&v1[v3];
  *(void *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain();
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000AEDC(v6, (uint64_t)qword_100078088);
    swift_errorRetain();
    id v7 = v1;
    swift_errorRetain();
    uint64_t v8 = v7;
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412546;
      id v12 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey];
      id v13 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v11 = v12;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      sub_100057B1C(v14, v15, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000AEDC(v16, (uint64_t)qword_100078088);
    oslog = v1;
    id v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v19 = 138412290;
      id v23 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey);
      id v21 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v20 = v23;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@] Remote alert did invalidate", v19, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

uint64_t sub_100026F94()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100026FCC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100027004(void *a1)
{
  sub_100025F7C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10002700C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002701C()
{
  return swift_release();
}

uint64_t sub_100027024(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10002706C()
{
  v1[132] = v0;
  uint64_t v2 = sub_100007978(&qword_100075AA0);
  v1[133] = v2;
  v1[134] = *(void *)(v2 - 8);
  v1[135] = swift_task_alloc();
  uint64_t v3 = sub_100007978((uint64_t *)&unk_100075A40);
  v1[136] = v3;
  v1[137] = *(void *)(v3 - 8);
  v1[138] = swift_task_alloc();
  sub_100007978((uint64_t *)&unk_1000755C0);
  v1[139] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for URL();
  v1[140] = v4;
  v1[141] = *(void *)(v4 - 8);
  v1[142] = swift_task_alloc();
  v1[143] = type metadata accessor for MainActor();
  v1[144] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[145] = v5;
  v1[146] = v6;
  return _swift_task_switch(sub_10002728C, v5, v6);
}

uint64_t sub_10002728C()
{
  uint64_t v1 = *(void *)(v0 + 1056);
  id v2 = [objc_allocWithZone((Class)PKPaymentRequest) init];
  *(void *)(v0 + 1176) = v2;
  [v2 setConfirmationStyle:3];
  [v2 setRequestType:1];
  [v2 setRequestor:0];
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 setCurrencyCode:v3];

  NSString v4 = String._bridgeToObjectiveC()();
  [v2 setCountryCode:v4];

  uint64_t v5 = v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_localizedContent;
  uint64_t v6 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  id v7 = (uint64_t *)(v5 + *(int *)(v6 + 56));
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  NSString v10 = String._bridgeToObjectiveC()();
  [v2 setLocalizedNavigationTitle:v10];

  id v11 = [objc_allocWithZone((Class)PKPaymentContentItem) init];
  *(void *)(v0 + 1184) = v11;
  id v12 = objc_allocWithZone((Class)NSAttributedString);
  swift_bridgeObjectRetain();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v14 = [v12 initWithString:v13];

  [v11 setTitle:v14];
  uint64_t v65 = v6;
  uint64_t v66 = v5;
  unint64_t v15 = (uint64_t *)(v5 + *(int *)(v6 + 60));
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  id v18 = objc_allocWithZone((Class)NSAttributedString);
  swift_bridgeObjectRetain();
  uint64_t v62 = v17;
  NSString v19 = String._bridgeToObjectiveC()();
  uint64_t v63 = v16;
  swift_bridgeObjectRelease();
  id v20 = [v18 initWithString:v19];

  [v11 setLabel:v20];
  sub_100007978((uint64_t *)&unk_100074FA0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10005BA50;
  *(void *)(v21 + 32) = v11;
  specialized Array._endMutation()();
  sub_100018668(0, &qword_100075AA8);
  id v22 = v11;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setPaymentContentItems:isa];

  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_10005BA50;
  Class v25 = self;
  swift_bridgeObjectRetain();
  id v26 = [v25 zero];
  uint64_t v64 = v9;
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v28 = [self summaryItemWithLabel:v27 amount:v26 type:0];

  *(void *)(v24 + 32) = v28;
  specialized Array._endMutation()();
  sub_100018668(0, (unint64_t *)&unk_100075AB0);
  Class v29 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setPaymentSummaryItems:v29];

  SecAccessControlRef v30 = sub_10002A158();
  [v2 setAccesssControlRef:v30];

  sub_100007978(&qword_100074FC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
  *(void *)(v0 + 936) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 944) = v32;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = 0xD000000000000033;
  *(void *)(inited + 80) = 0x800000010005E8D0;
  unint64_t v33 = sub_10004DF60(inited);
  long long v34 = self;
  *(void *)(v0 + 1048) = 0;
  id v35 = [v34 archivedDataWithRootObject:v2 requiringSecureCoding:1 error:v0 + 1048];
  id v36 = *(id *)(v0 + 1048);
  if (v35)
  {
    uint64_t v37 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v39 = v38;

    *(void *)(v0 + 1016) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v0 + 1024) = v40;
    AnyHashable.init<A>(_:)();
    *(void *)(v0 + 896) = &type metadata for Data;
    *(void *)(v0 + 872) = v37;
    *(void *)(v0 + 880) = v39;
    sub_10002A9CC((_OWORD *)(v0 + 872), (_OWORD *)(v0 + 744));
    sub_10000D6B4(v37, v39);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100052460((_OWORD *)(v0 + 744), v0 + 624, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_1000180B8(v0 + 624);
    sub_10000D70C(v37, v39);
  }
  else
  {
    uint64_t v42 = v36;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  *(void *)(v0 + 1192) = v33;
  uint64_t v43 = *(void *)(v0 + 1128);
  uint64_t v44 = *(void *)(v0 + 1120);
  uint64_t v45 = *(void *)(v0 + 1112);
  id v46 = [self mainScreen];
  [v46 scale];
  uint64_t v48 = v47;

  uint64_t v49 = swift_initStackObject();
  *(_OWORD *)(v49 + 16) = xmmword_10005BEF0;
  *(void *)(v0 + 968) = 0x656C746974;
  *(void *)(v0 + 976) = 0xE500000000000000;
  AnyHashable.init<A>(_:)();
  *(void *)(v49 + 96) = &type metadata for String;
  *(void *)(v49 + 72) = v64;
  *(void *)(v49 + 80) = v8;
  *(void *)(v0 + 1032) = 0x6567617373656DLL;
  *(void *)(v0 + 1040) = 0xE700000000000000;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  *(void *)(v49 + 168) = &type metadata for String;
  *(void *)(v49 + 144) = v62;
  *(void *)(v49 + 152) = v63;
  *(void *)(v0 + 952) = 0x63536E6565726373;
  *(void *)(v0 + 960) = 0xEB00000000656C61;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  *(void *)(v49 + 240) = &type metadata for CGFloat;
  *(void *)(v49 + 216) = v48;
  unint64_t v50 = sub_10004DF60(v49);
  *(void *)(v0 + 1200) = v50;
  sub_10002A964(v66 + *(int *)(v65 + 20), v45);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v45, 1, v44) == 1)
  {
    sub_10000D7CC(*(void *)(v0 + 1112), (uint64_t *)&unk_1000755C0);
    unsigned __int8 v51 = *(void **)(v0 + 1176);
    uint64_t v69 = *(void *)(v0 + 1104);
    uint64_t v52 = *(void *)(v0 + 1096);
    uint64_t v67 = *(void *)(v0 + 1056);
    uint64_t v68 = *(void *)(v0 + 1088);
    *(void *)(v0 + 1000) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v0 + 1008) = v53;
    AnyHashable.init<A>(_:)();
    *(void *)(v0 + 928) = sub_100007978(&qword_100075AC0);
    *(void *)(v0 + 904) = v50;
    sub_10002A9CC((_OWORD *)(v0 + 904), (_OWORD *)(v0 + 776));
    char v54 = swift_isUniquelyReferenced_nonNull_native();
    sub_100052460((_OWORD *)(v0 + 776), v0 + 664, v54);
    swift_bridgeObjectRelease();
    sub_1000180B8(v0 + 664);
    NSString v55 = String._bridgeToObjectiveC()();
    [v51 setClientViewSourceIdentifier:v55];

    Class v56 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v51 setClientViewSourceParameter:v56];

    id v57 = [objc_allocWithZone((Class)PKPaymentAuthorizationController) initWithPaymentRequest:v51];
    *(void *)(v0 + 1240) = v57;
    [v57 setDelegate:v67];
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 1272;
    *(void *)(v0 + 24) = sub_100028370;
    swift_continuation_init();
    *(void *)(v0 + 552) = v68;
    uint64_t v58 = sub_10002A9DC((uint64_t *)(v0 + 528));
    CheckedContinuation.init(continuation:function:)();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 32))(v58, v69, v68);
    *(void *)(v0 + 496) = _NSConcreteStackBlock;
    *(void *)(v0 + 504) = 1107296256;
    *(void *)(v0 + 512) = sub_100028F44;
    *(void *)(v0 + 520) = &unk_10006E830;
    [v57 presentWithCompletion:];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 1128) + 32))(*(void *)(v0 + 1136), *(void *)(v0 + 1112), *(void *)(v0 + 1120));
    *(void *)(v0 + 1208) = [self sharedSession];
    uint64_t v59 = (void *)swift_task_alloc();
    *(void *)(v0 + 1216) = v59;
    *uint64_t v59 = v0;
    v59[1] = sub_100027DD8;
    uint64_t v60 = *(void *)(v0 + 1136);
    return NSURLSession.data(from:delegate:)(v60, 0);
  }
}

uint64_t sub_100027DD8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = (void *)*v4;
  uint64_t v8 = (void *)*v4;
  swift_task_dealloc();
  NSString v10 = (void *)v8[151];
  if (v3)
  {

    swift_errorRelease();
    uint64_t v11 = v9[146];
    uint64_t v12 = v9[145];
    NSString v13 = sub_100028BF4;
  }
  else
  {

    v9[153] = a2;
    v9[154] = a1;
    uint64_t v11 = v9[146];
    uint64_t v12 = v9[145];
    NSString v13 = sub_100027F70;
  }
  return _swift_task_switch(v13, v12, v11);
}

uint64_t sub_100027F70()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = v0 + 664;
  uint64_t v4 = v0 + 704;
  uint64_t v5 = (_OWORD *)(v0 + 776);
  uint64_t v6 = (_OWORD *)(v0 + 808);
  id v7 = (_OWORD *)(v0 + 840);
  id v28 = v5;
  uint64_t v8 = *(void *)(v1 + 1232);
  unint64_t v9 = *(void *)(v1 + 1224);
  uint64_t v10 = *(void *)(v1 + 1200);
  uint64_t v27 = *(void *)(v1 + 1136);
  uint64_t v11 = *(void *)(v1 + 1128);
  uint64_t v26 = *(void *)(v1 + 1120);
  *(void *)(v1 + 984) = 1852793705;
  *(void *)(v1 + 992) = 0xE400000000000000;
  AnyHashable.init<A>(_:)();
  *(void *)(v1 + 832) = &type metadata for Data;
  *(void *)(v1 + 808) = v8;
  *(void *)(v1 + 816) = v9;
  sub_10002A9CC(v6, v7);
  sub_10000D6B4(v8, v9);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v29 = v10;
  uint64_t v13 = v2;
  sub_100052460(v7, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1000180B8(v4);
  sub_10000D70C(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v27, v26);
  id v14 = *(void **)(v1 + 1176);
  uint64_t v15 = *(void *)(v1 + 1104);
  uint64_t v16 = *(void *)(v1 + 1096);
  uint64_t v17 = *(void *)(v1 + 1088);
  uint64_t v18 = *(void *)(v1 + 1056);
  *(void *)(v1 + 1000) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v1 + 1008) = v19;
  AnyHashable.init<A>(_:)();
  *(void *)(v1 + 928) = sub_100007978(&qword_100075AC0);
  *(void *)(v1 + 904) = v29;
  sub_10002A9CC((_OWORD *)(v1 + 904), v28);
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  sub_100052460(v28, v3, v20);
  swift_bridgeObjectRelease();
  sub_1000180B8(v3);
  NSString v21 = String._bridgeToObjectiveC()();
  [v14 setClientViewSourceIdentifier:v21];

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v14 setClientViewSourceParameter:isa];

  id v23 = [objc_allocWithZone((Class)PKPaymentAuthorizationController) initWithPaymentRequest:v14];
  *(void *)(v1 + 1240) = v23;
  [v23 setDelegate:v18];
  *(void *)(v1 + 16) = v1;
  *(void *)(v1 + 56) = v1 + 1272;
  *(void *)(v1 + 24) = sub_100028370;
  swift_continuation_init();
  *(void *)(v1 + 552) = v17;
  uint64_t v24 = sub_10002A9DC((uint64_t *)(v1 + 528));
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 32))(v24, v15, v17);
  *(void *)(v1 + 496) = _NSConcreteStackBlock;
  *(void *)(v1 + 504) = 1107296256;
  *(void *)(v1 + 512) = sub_100028F44;
  *(void *)(v1 + 520) = &unk_10006E830;
  [v23 presentWithCompletion:];
  return _swift_continuation_await(v13);
}

uint64_t sub_100028370()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 1168);
  uint64_t v2 = *(void *)(*(void *)v0 + 1160);
  return _swift_task_switch(sub_1000284A4, v2, v1);
}

uint64_t sub_1000284A4()
{
  if (*(unsigned char *)(v0 + 1272) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 1056);
    uint64_t v2 = static MainActor.shared.getter();
    *(void *)(v0 + 1248) = v2;
    uint64_t v3 = swift_task_alloc();
    *(void *)(v0 + 1256) = v3;
    *(void *)(v3 + 16) = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 1264) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_100028680;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 1273, v2, &protocol witness table for MainActor, 0x29286E7572, 0xE500000000000000, sub_10002AAA8, v3, &type metadata for Bool);
  }
  else
  {
    uint64_t v5 = *(void **)(v0 + 1240);
    uint64_t v6 = *(void **)(v0 + 1176);

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7(0);
  }
}

uint64_t sub_100028680()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1168);
  uint64_t v3 = *(void *)(v1 + 1160);
  return _swift_task_switch(sub_100028814, v3, v2);
}

uint64_t sub_100028814()
{
  uint64_t v1 = *(void **)(v0 + 1240);
  uint64_t v2 = *(void *)(v0 + 1080);
  uint64_t v3 = *(void *)(v0 + 1072);
  uint64_t v4 = *(void *)(v0 + 1064);
  *(unsigned char *)(v0 + 1274) = *(unsigned char *)(v0 + 1273);
  *(void *)(v0 + 80) = v0;
  *(void *)(v0 + 88) = sub_1000289D4;
  swift_continuation_init();
  *(void *)(v0 + 616) = v4;
  uint64_t v5 = sub_10002A9DC((uint64_t *)(v0 + 592));
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v5, v2, v4);
  *(void *)(v0 + 560) = _NSConcreteStackBlock;
  *(void *)(v0 + 568) = 1107296256;
  *(void *)(v0 + 576) = sub_100029144;
  *(void *)(v0 + 584) = &unk_10006E858;
  [v1 dismissWithCompletion:v0 + 560];
  return _swift_continuation_await(v0 + 80);
}

uint64_t sub_1000289D4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 1168);
  uint64_t v2 = *(void *)(*(void *)v0 + 1160);
  return _swift_task_switch(sub_100028B08, v2, v1);
}

uint64_t sub_100028B08()
{
  uint64_t v1 = *(void **)(v0 + 1240);
  uint64_t v2 = *(void **)(v0 + 1176);

  swift_release();
  uint64_t v3 = *(unsigned __int8 *)(v0 + 1274);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_100028BF4()
{
  uint64_t v1 = v0;
  (*(void (**)(void, void))(v1[141] + 8))(v1[142], v1[140]);
  uint64_t v2 = v0[150];
  uint64_t v3 = (void *)v0[147];
  uint64_t v14 = v0[138];
  uint64_t v4 = v0[137];
  uint64_t v12 = v0[132];
  uint64_t v13 = v0[136];
  v0[125] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v0[126] = v5;
  AnyHashable.init<A>(_:)();
  v0[116] = sub_100007978(&qword_100075AC0);
  v0[113] = v2;
  sub_10002A9CC(v1 + 113, v1 + 97);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_100052460(v1 + 97, (uint64_t)(v1 + 83), isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_1000180B8((uint64_t)(v0 + 83));
  NSString v7 = String._bridgeToObjectiveC()();
  [v3 setClientViewSourceIdentifier:v7];

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v3 setClientViewSourceParameter:isa];

  id v9 = [objc_allocWithZone((Class)PKPaymentAuthorizationController) initWithPaymentRequest:v3];
  v0[155] = v9;
  [v9 setDelegate:v12];
  v0[2] = v0;
  v0[7] = v0 + 159;
  v0[3] = sub_100028370;
  swift_continuation_init();
  v0[69] = v13;
  uint64_t v10 = sub_10002A9DC(v0 + 66);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 32))(v10, v14, v13);
  v0[62] = _NSConcreteStackBlock;
  v0[63] = 1107296256;
  v0[64] = sub_100028F44;
  v0[65] = &unk_10006E830;
  [v9 presentWithCompletion:];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100028F44(uint64_t a1)
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100028F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075A90);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = sub_100007978((uint64_t *)&unk_100075A40);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v9 = a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalizedContinuation;
  swift_beginAccess();
  sub_10002A8FC((uint64_t)v6, v9);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_100029144(uint64_t a1)
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000293DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for MainActor();
  v4[7] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10002947C, v6, v5);
}

uint64_t sub_10002947C()
{
  uint64_t v1 = (const void *)v0[4];
  uint64_t v2 = (void *)v0[5];
  uint64_t v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  id v5 = v4;
  id v6 = v3;
  id v7 = v2;
  v0[9] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10002953C, v9, v8);
}

uint64_t sub_10002953C()
{
  uint64_t v1 = (void (**)(void, void))v0[8];
  uint64_t v2 = (unsigned char *)v0[5];
  uint64_t v4 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  swift_release();
  v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalResult] = 1;
  id v5 = [objc_allocWithZone((Class)PKPaymentAuthorizationResult) initWithStatus:0 errors:0];

  ((void (**)(void, id))v1)[2](v1, v5);
  _Block_release(v1);

  id v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1000296E8()
{
  return type metadata accessor for OsloAuthenticationTask();
}

uint64_t type metadata accessor for OsloAuthenticationTask()
{
  uint64_t result = qword_100075A28;
  if (!qword_100075A28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10002973C()
{
  type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  if (v0 <= 0x3F)
  {
    sub_100029810();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100029810()
{
  if (!qword_100075A38)
  {
    sub_100022BE4((uint64_t *)&unk_100075A40);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100075A38);
    }
  }
}

uint64_t sub_10002986C()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000298BC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  id v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *id v6 = v1;
  v6[1] = sub_10000AC98;
  id v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100075A50 + dword_100075A50);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10002997C(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10001FC74;
  return v6();
}

uint64_t sub_100029A4C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10001FC74;
  id v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100075A60 + dword_100075A60);
  return v6(v2, v3, v4);
}

uint64_t sub_100029B0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10001FC74;
  return v7();
}

uint64_t sub_100029BDC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100029C1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100075A70 + dword_100075A70);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100029CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D7CC(a1, &qword_100074EA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100029E94(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100029F70;
  return v6(a1);
}

uint64_t sub_100029F70()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002A068()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A0A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10000AC98;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100075A80 + dword_100075A80);
  return v6(a1, v4);
}

SecAccessControlRef sub_10002A158()
{
  SecAccessControlRef v21 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000000uLL, 0);
  sub_100007978(&qword_100075AC8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10005BF00;
  *(void *)(v0 + 32) = 0x6E666F6B70;
  *(void *)(v0 + 40) = 0xE500000000000000;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 64) = 2;
  *(void *)(v0 + 88) = &type metadata for Int;
  *(void *)(v0 + 96) = 1668640112;
  *(void *)(v0 + 104) = 0xE400000000000000;
  *(void *)(v0 + 120) = &type metadata for String;
  *(void *)(v0 + 128) = 2;
  *(void *)(v0 + 184) = &type metadata for String;
  *(void *)(v0 + 152) = &type metadata for Int;
  *(void *)(v0 + 160) = 1869177443;
  *(void *)(v0 + 168) = 0xE400000000000000;
  sub_100007978(&qword_100075AD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005B4C0;
  *(void *)(inited + 32) = 0x636F696270;
  *(void *)(inited + 40) = 0xE500000000000000;
  id v2 = [objc_allocWithZone((Class)NSData) init];
  uint64_t v3 = sub_100018668(0, &qword_100075AD8);
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 80) = 0x746F696270;
  *(void *)(inited + 120) = &type metadata for Int;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = 2;
  unint64_t v4 = sub_10004E0A4(inited);
  uint64_t v5 = sub_100007978(&qword_100075AE0);
  *(void *)(v0 + 192) = v4;
  *(void *)(v0 + 248) = &type metadata for String;
  *(void *)(v0 + 216) = v5;
  *(void *)(v0 + 224) = 1853121123;
  *(void *)(v0 + 232) = 0xE400000000000000;
  *(void *)(v0 + 280) = &type metadata for Bool;
  *(unsigned char *)(v0 + 256) = 1;
  uint64_t v6 = sub_100018668(0, &qword_100075AE8);
  uint64_t v7 = NSDictionary.init(dictionaryLiteral:)();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10005BF10;
  *(void *)(v8 + 32) = 0x6E666F6B70;
  *(void *)(v8 + 40) = 0xE500000000000000;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = 1;
  *(void *)(v8 + 88) = &type metadata for Int;
  *(void *)(v8 + 96) = 1668640112;
  *(void *)(v8 + 104) = 0xE400000000000000;
  *(void *)(v8 + 120) = &type metadata for String;
  *(void *)(v8 + 128) = 2;
  *(void *)(v8 + 184) = &type metadata for String;
  *(void *)(v8 + 152) = &type metadata for Int;
  *(void *)(v8 + 160) = 1869177443;
  *(void *)(v8 + 168) = 0xE400000000000000;
  uint64_t v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_10005B4C0;
  *(void *)(v9 + 32) = 0x636F696270;
  *(void *)(v9 + 40) = 0xE500000000000000;
  *(void *)(v9 + 48) = [objc_allocWithZone((Class)NSData) init];
  *(void *)(v9 + 72) = v3;
  *(void *)(v9 + 80) = 0x746F696270;
  *(void *)(v9 + 120) = &type metadata for Int;
  *(void *)(v9 + 88) = 0xE500000000000000;
  *(void *)(v9 + 96) = 1;
  *(void *)(v8 + 192) = sub_10004E0A4(v9);
  *(void *)(v8 + 248) = &type metadata for String;
  *(void *)(v8 + 216) = v5;
  *(void *)(v8 + 224) = 7370083;
  *(void *)(v8 + 232) = 0xE300000000000000;
  *(unsigned char *)(v8 + 256) = 1;
  *(void *)(v8 + 280) = &type metadata for Bool;
  *(void *)(v8 + 288) = 1852795747;
  *(void *)(v8 + 296) = 0xE400000000000000;
  *(void *)(v8 + 344) = v6;
  *(void *)(v8 + 312) = &type metadata for String;
  *(void *)(v8 + 320) = v7;
  id v10 = v7;
  char v20 = NSDictionary.init(dictionaryLiteral:)();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10005BF20;
  *(void *)(v11 + 32) = 0x6E666F6B70;
  *(void *)(v11 + 40) = 0xE500000000000000;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = 1;
  *(void *)(v11 + 88) = &type metadata for Int;
  *(void *)(v11 + 96) = 1668246896;
  *(void *)(v11 + 104) = 0xE400000000000000;
  *(void *)(v11 + 120) = &type metadata for String;
  *(void *)(v11 + 128) = 1;
  *(void *)(v11 + 152) = &type metadata for Int;
  *(void *)(v11 + 160) = 1668640112;
  *(void *)(v11 + 168) = 0xE400000000000000;
  *(void *)(v11 + 184) = &type metadata for String;
  *(void *)(v11 + 192) = 2;
  *(void *)(v11 + 248) = &type metadata for String;
  *(void *)(v11 + 216) = &type metadata for Int;
  *(void *)(v11 + 224) = 1869177443;
  *(void *)(v11 + 232) = 0xE400000000000000;
  uint64_t v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_10005B4C0;
  *(void *)(v12 + 32) = 0x636F696270;
  *(void *)(v12 + 40) = 0xE500000000000000;
  *(void *)(v12 + 48) = [objc_allocWithZone((Class)NSData) init];
  *(void *)(v12 + 72) = v3;
  *(void *)(v12 + 80) = 0x746F696270;
  *(void *)(v12 + 120) = &type metadata for Int;
  *(void *)(v12 + 88) = 0xE500000000000000;
  *(void *)(v12 + 96) = 1;
  *(void *)(v11 + 256) = sub_10004E0A4(v12);
  *(void *)(v11 + 312) = &type metadata for String;
  *(void *)(v11 + 280) = v5;
  *(void *)(v11 + 288) = 7370083;
  *(void *)(v11 + 296) = 0xE300000000000000;
  *(unsigned char *)(v11 + 320) = 1;
  *(void *)(v11 + 344) = &type metadata for Bool;
  *(void *)(v11 + 352) = 1852795747;
  *(void *)(v11 + 360) = 0xE400000000000000;
  *(void *)(v11 + 408) = v6;
  *(void *)(v11 + 376) = &type metadata for String;
  *(void *)(v11 + 384) = v10;
  id v13 = v10;
  uint64_t v14 = NSDictionary.init(dictionaryLiteral:)();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10005BF00;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 32) = 24943;
  *(void *)(v15 + 40) = 0xE200000000000000;
  *(unsigned char *)(v15 + 64) = 1;
  *(void *)(v15 + 88) = &type metadata for Bool;
  *(void *)(v15 + 96) = 7037807;
  *(void *)(v15 + 104) = 0xE300000000000000;
  *(void *)(v15 + 120) = &type metadata for String;
  *(void *)(v15 + 128) = v20;
  *(void *)(v15 + 184) = &type metadata for String;
  *(void *)(v15 + 152) = v6;
  *(void *)(v15 + 160) = 1818584175;
  *(void *)(v15 + 168) = 0xE400000000000000;
  *(unsigned char *)(v15 + 192) = 1;
  *(void *)(v15 + 216) = &type metadata for Bool;
  *(void *)(v15 + 224) = 1852273519;
  *(void *)(v15 + 232) = 0xE400000000000000;
  *(void *)(v15 + 280) = v6;
  *(void *)(v15 + 248) = &type metadata for String;
  *(void *)(v15 + 256) = v14;
  id v16 = v20;
  id v17 = v14;
  uint64_t v18 = NSDictionary.init(dictionaryLiteral:)();
  SecAccessControlSetConstraints();

  return v21;
}

uint64_t sub_10002A6AC()
{
  uint64_t v1 = sub_100007978(&qword_100075A90);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100007978((uint64_t *)&unk_100075A40);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalizedContinuation;
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
    v10[0] = *(unsigned char *)(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel22OsloAuthenticationTask_finalResult);
    CheckedContinuation.resume(returning:)();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  swift_beginAccess();
  sub_10002A8FC((uint64_t)v3, v8);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_10002A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075A90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002A964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978((uint64_t *)&unk_1000755C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10002A9CC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_10002A9DC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10002AA40(uint64_t a1, uint64_t a2)
{
  return sub_1000183B0(a2 + 32, a1 + 32);
}

uint64_t sub_10002AA50(uint64_t a1)
{
  return sub_10002AA58(a1 + 32);
}

uint64_t sub_10002AA58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10002AAA8(uint64_t a1)
{
  return sub_100028F9C(a1, *(void *)(v1 + 16));
}

void *sub_10002AAB0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10002AAFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 96) = v12;
  *(void *)(v8 + 104) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 202) = a6;
  *(unsigned char *)(v8 + 201) = a5;
  *(unsigned char *)(v8 + 200) = a4;
  *(void *)(v8 + 64) = a2;
  *(void *)(v8 + 72) = a3;
  *(void *)(v8 + 56) = a1;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 112) = v9;
  *(void *)(v8 + 120) = *(void *)(v9 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  *(void *)(v8 + 136) = swift_task_alloc();
  sub_100007978(&qword_100075B38);
  *(void *)(v8 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_10002AC48, 0, 0);
}

uint64_t sub_10002AC48()
{
  if (*(unsigned char *)(v0 + 201) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 104);
    uint64_t v2 = *(NSObject **)(v0 + 64);
    char v3 = *(unsigned char *)(v0 + 200);
    type metadata accessor for LogActivity();
    uint64_t v4 = swift_allocObject();
    uint64_t v5 = sub_10001FD9C(v2, v3, v1);
    *(void *)(v0 + 40) = 0;
    *(void *)(v0 + 48) = 0;
    os_activity_scope_enter(v5, (os_activity_scope_state_t)(v0 + 40));
    swift_unknownObjectRelease();
    *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(v0 + 152) = v4;
  if (*(unsigned char *)(v0 + 202) == 1)
  {
    type metadata accessor for Transaction();
    swift_allocObject();
    uint64_t v6 = sub_100030B94();
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v0 + 160) = v6;
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 120);
  sub_100023C98(*(void *)(v0 + 80), v7, &qword_100075B38);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 112);
    id v16 = *(const char **)(v0 + 64);
    uint64_t v15 = *(void *)(v0 + 72);
    int v17 = *(unsigned __int8 *)(v0 + 200);
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 32))(v11, *(void *)(v0 + 144), v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v14);
    type metadata accessor for SignpostInterval();
    swift_allocObject();
    uint64_t v10 = sub_1000087EC(v16, v15, v17, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v14);
  }
  *(void *)(v0 + 168) = v10;
  if (qword_100074B40 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v6;
  *(void *)(v0 + 32) = v10;
  uint64_t v18 = swift_task_alloc();
  *(void *)(v0 + 176) = v18;
  *(_OWORD *)(v18 + 16) = *(_OWORD *)(v0 + 88);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 184) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_10002AFA0;
  uint64_t v20 = *(void *)(v0 + 56);
  return TaskLocal.withValue<A>(_:operation:isolation:file:line:)(v20, v0 + 16, &unk_100075B60, v18, 0, 0, 0xD000000000000037, 0x800000010005E9D0);
}

uint64_t sub_10002AFA0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 192) = v0;
  swift_task_dealloc();
  sub_100031B18(*(void *)(v2 + 16));
  swift_task_dealloc();
  if (v0) {
    char v3 = sub_10002B1E0;
  }
  else {
    char v3 = sub_10002B110;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_10002B110()
{
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002B1E0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002B2B0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000AC98;
  return v6(a1);
}

uint64_t sub_10002B38C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_10002A9CC((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_100052700(v9, a2, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = type metadata accessor for CodingUserInfoKey();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_10000D7CC(a1, &qword_100074FD0);
    sub_100031088(a2, v9);
    uint64_t v7 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_10000D7CC((uint64_t)v9, &qword_100074FD0);
  }
}

BOOL sub_10002B4AC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_10002B4BC(uint64_t a1, char a2)
{
}

uint64_t sub_10002B4E4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::Int sub_10002B5D8(char a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10002B620(char a1)
{
  if (a1) {
    return 0x6572756C696166;
  }
  else {
    return 0x73736563637573;
  }
}

BOOL sub_10002B650(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10002B4AC(*a1, *a2);
}

Swift::Int sub_10002B668()
{
  return sub_10002B5D8(*v0);
}

void sub_10002B67C(uint64_t a1)
{
  sub_10002B4BC(a1, *v1);
}

Swift::Int sub_10002B690()
{
  Hasher.init(_seed:)();
  sub_10002B4BC((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_10002B6DC()
{
  return sub_10002B620(*v0);
}

uint64_t sub_10002B6F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002B4E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002B724()
{
  return 0;
}

uint64_t sub_10002B730@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10003146C();
  *a1 = result;
  return result;
}

uint64_t sub_10002B764(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10002B7B8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_10002B80C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_10002B87C(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v39 = v6;
  uint64_t v7 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v41 = *(void *)(v7 - 8);
  uint64_t v42 = v7;
  __chkstk_darwin(v7);
  uint64_t v40 = (char *)&v31 - v8;
  uint64_t v9 = type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys();
  uint64_t v10 = swift_getWitnessTable();
  uint64_t v34 = v9;
  uint64_t v31 = v10;
  uint64_t v11 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v36 = *(void *)(v11 - 8);
  uint64_t v37 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  unint64_t v33 = (char *)&v31 - v13;
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v32 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a2 - 8);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = v5;
  uint64_t v44 = v4;
  type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys();
  swift_getWitnessTable();
  uint64_t v19 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v45 = *(void *)(v19 - 8);
  uint64_t v46 = v19;
  __chkstk_darwin(v19);
  SecAccessControlRef v21 = (char *)&v31 - v20;
  sub_10002AAB0(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v47, a2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    char v49 = 1;
    uint64_t v22 = v40;
    uint64_t v23 = v46;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v24 = v42;
    KeyedEncodingContainer.encode(_:forKey:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v22, v24);
  }
  else
  {
    uint64_t v25 = v35;
    uint64_t v26 = v32;
    uint64_t v27 = v44;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v32, v18, v44);
    char v48 = 0;
    id v28 = v33;
    uint64_t v23 = v46;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v29 = v37;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v29);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v21, v23);
}

uint64_t sub_10002BD74@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v65 = a4;
  uint64_t v7 = type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v63 = v7;
  uint64_t v55 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v58 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v64 = (char *)&v50 - v8;
  uint64_t v9 = type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys();
  uint64_t v59 = swift_getWitnessTable();
  uint64_t v60 = v9;
  uint64_t v54 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v57 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  long long v61 = (char *)&v50 - v10;
  type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys();
  uint64_t v70 = swift_getWitnessTable();
  uint64_t v11 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v67 = *(void *)(v11 - 8);
  uint64_t v68 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v69 = a2;
  uint64_t v56 = a3;
  uint64_t v66 = type metadata accessor for AppDistributionLaunchAngelServiceResult();
  uint64_t v53 = *(void *)(v66 - 8);
  uint64_t v14 = __chkstk_darwin(v66);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v50 - v18;
  __chkstk_darwin(v17);
  SecAccessControlRef v21 = (char *)&v50 - v20;
  sub_10002AAB0(a1, a1[3]);
  uint64_t v22 = v75;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v22) {
    goto LABEL_7;
  }
  uint64_t v70 = (uint64_t)v19;
  unsigned __int8 v51 = (uint64_t *)v16;
  uint64_t v52 = v21;
  uint64_t v23 = v68;
  id v75 = a1;
  *(void *)&long long v71 = KeyedDecodingContainer.allKeys.getter();
  type metadata accessor for Array();
  swift_getWitnessTable();
  *(void *)&long long v73 = ArraySlice.init<A>(_:)();
  *((void *)&v73 + 1) = v24;
  *(void *)&long long v74 = v25;
  *((void *)&v74 + 1) = v26;
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  Collection<>.popFirst()();
  char v27 = v71;
  if (v71 == 2 || (long long v50 = v73, v71 = v73, v72 = v74, (Collection.isEmpty.getter() & 1) == 0))
  {
    uint64_t v32 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v34 = v33;
    sub_100007978(qword_100075C48);
    *uint64_t v34 = v66;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v32 - 8) + 104))(v34, enum case for DecodingError.typeMismatch(_:), v32);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v23);
    a1 = v75;
LABEL_7:
    uint64_t v35 = (uint64_t)a1;
    return sub_10002AA58(v35);
  }
  if (v27)
  {
    LOBYTE(v71) = 1;
    uint64_t v37 = v64;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v45 = v65;
    uint64_t v38 = v55;
    uint64_t v39 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v40 = v37;
    uint64_t v46 = v39;
    uint64_t v48 = v47;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v40, v38);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v13, v23);
    char v49 = v51;
    *unsigned __int8 v51 = v46;
    v49[1] = v48;
    uint64_t v41 = v66;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, uint64_t *, uint64_t))(v53 + 32);
    uint64_t v44 = v52;
    v42(v52, v49, v41);
  }
  else
  {
    LOBYTE(v71) = 0;
    id v28 = v61;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v29 = v70;
    uint64_t v30 = v54;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v31 = v67;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v28, v30);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v23);
    uint64_t v41 = v66;
    swift_storeEnumTagMultiPayload();
    uint64_t v42 = *(void (**)(char *, uint64_t *, uint64_t))(v53 + 32);
    uint64_t v43 = v29;
    uint64_t v44 = v52;
    v42(v52, (uint64_t *)v43, v41);
    uint64_t v45 = v65;
  }
  v42(v45, (uint64_t *)v44, v41);
  uint64_t v35 = (uint64_t)v75;
  return sub_10002AA58(v35);
}

uint64_t sub_10002C564()
{
  return 1;
}

void sub_10002C570()
{
}

uint64_t sub_10002C59C()
{
  return 12383;
}

uint64_t sub_10002C5AC@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_10002C6A4(a1, (uint64_t (*)(void, void, void))sub_10002C564, a2);
}

uint64_t sub_10002C5C4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10002C618(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_10002C66C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10002B80C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10002C6A4@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10002C6E0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10002C734(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_10002C788@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_10002BD74(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_10002C7AC(void *a1, uint64_t a2)
{
  return sub_10002B87C(a1, a2);
}

Swift::Int sub_10002C7C4()
{
  return Hasher._finalize()();
}

Swift::Int sub_10002C808()
{
  return Hasher._finalize()();
}

uint64_t sub_10002C854()
{
  return 0x6874756120746F4ELL;
}

uint64_t sub_10002C878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[34] = a2;
  v3[35] = a3;
  v3[33] = a1;
  uint64_t v4 = type metadata accessor for LicenseResolutionContext();
  v3[36] = v4;
  v3[37] = *(void *)(v4 - 8);
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for OAuthAuthorizationContext();
  v3[41] = v5;
  v3[42] = *(void *)(v5 - 8);
  v3[43] = swift_task_alloc();
  v3[44] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for InstallSheetContext();
  v3[45] = v6;
  v3[46] = *(void *)(v6 - 8);
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for LaunchAngelXPCResponse.ResponseType();
  v3[50] = v7;
  v3[51] = *(void *)(v7 - 8);
  v3[52] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for LaunchAngelXPCRequest.RequestType();
  v3[53] = v8;
  v3[54] = *(void *)(v8 - 8);
  v3[55] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for LaunchAngelXPCResponse();
  v3[56] = v9;
  v3[57] = *(void *)(v9 - 8);
  v3[58] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for LaunchAngelXPCRequest();
  v3[59] = v10;
  v3[60] = *(void *)(v10 - 8);
  v3[61] = swift_task_alloc();
  return _swift_task_switch(sub_10002CBAC, 0, 0);
}

uint64_t sub_10002CBAC()
{
  uint64_t v167 = v0;
  uint64_t v1 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 272);
  unint64_t v2 = *(void *)(v0 + 280);
  uint64_t v4 = (objc_class *)type metadata accessor for LogKey();
  id v5 = objc_allocWithZone(v4);
  id v6 = sub_10004D210();
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 240) = v1;
  *(void *)(v0 + 496) = v6;
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 160) = v0 + 48;
  sub_10000D6B4(v3, v2);
  sub_10002F318(v0 + 160, (void *)(v0 + 240));
  uint64_t v8 = *(void *)(v0 + 432);
  uint64_t v7 = *(void *)(v0 + 440);
  uint64_t v9 = *(void *)(v0 + 424);
  sub_10000D70C(*(void *)(v0 + 48), *(void *)(v0 + 56));
  LaunchAngelXPCRequest.requestType.getter();
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9);
  if (v10 == enum case for LaunchAngelXPCRequest.RequestType.displayProductPage(_:))
  {
    uint64_t v11 = *(uint64_t **)(v0 + 440);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 432) + 96))(v11, *(void *)(v0 + 424));
    uint64_t v12 = *v11;
    uint64_t v156 = v11[1];
    unsigned int v154 = *((unsigned __int8 *)v11 + 16);
    unint64_t v13 = v11[4];
    uint64_t v151 = v11[3];
    uint64_t v14 = v0;
    *(void *)(v0 + 504) = v13;
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AEDC(v15, (uint64_t)qword_1000780D0);
    id v16 = v6;
    swift_bridgeObjectRetain_n();
    id v17 = v16;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      log = v18;
      uint64_t v20 = swift_slowAlloc();
      v145 = (void *)swift_slowAlloc();
      v166[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138413058;
      uint64_t v21 = v14;
      *(void *)(v14 + 224) = v17;
      id v22 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v145 = v17;
      uint64_t v23 = v21;

      *(_WORD *)(v20 + 12) = 2050;
      *(void *)(v21 + 232) = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v20 + 22) = 2082;
      uint64_t v24 = v156;
      *(void *)(v21 + 128) = v156;
      uint64_t v25 = v154;
      *(unsigned char *)(v23 + 136) = v154;
      sub_100007978(&qword_100075B88);
      uint64_t v26 = String.init<A>(describing:)();
      *(void *)(v23 + 248) = sub_100057B1C(v26, v27, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 32) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v28 = v151;
      *(void *)(v23 + 256) = sub_100057B1C(v151, v13, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, log, v19, "[%@] Asked to display product page %{public}llu - %{public}s by %{public}s", (uint8_t *)v20, 0x2Au);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v23 = v14;
      uint64_t v24 = v156;
      uint64_t v25 = v154;
      uint64_t v28 = v151;
    }
    v160 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100076358
                                                                                        + dword_100076358);
    uint64_t v41 = (void *)swift_task_alloc();
    *(void *)(v23 + 512) = v41;
    *uint64_t v41 = v23;
    v41[1] = sub_10002E258;
    return v160(v28, v13, v12, v24, v25);
  }
  if (v10 == enum case for LaunchAngelXPCRequest.RequestType.displaySearchResults(_:))
  {
    uint64_t v29 = *(uint64_t **)(v0 + 440);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 432) + 96))(v29, *(void *)(v0 + 424));
    uint64_t v31 = *v29;
    unint64_t v30 = v29[1];
    *(void *)(v0 + 528) = v30;
    unint64_t v32 = v29[3];
    uint64_t v157 = v29[2];
    *(void *)(v0 + 536) = v32;
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_10000AEDC(v33, (uint64_t)qword_1000780D0);
    id v34 = v6;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v35 = v34;
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      os_log_type_t v152 = v37;
      uint64_t v38 = swift_slowAlloc();
      type = (void *)swift_slowAlloc();
      v166[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 138412802;
      *(void *)(v0 + 200) = v35;
      id v39 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *type = v35;

      *(_WORD *)(v38 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 208) = sub_100057B1C(v31, v30, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v38 + 22) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v40 = v157;
      *(void *)(v0 + 216) = sub_100057B1C(v157, v32, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v36, v152, "[%@] Asked to display search results %{public}s by %{public}s", (uint8_t *)v38, 0x20u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      uint64_t v40 = v157;
    }
    v162 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))((char *)&dword_100076370
                                                                                        + dword_100076370);
    uint64_t v54 = (void *)swift_task_alloc();
    *(void *)(v0 + 544) = v54;
    void *v54 = v0;
    v54[1] = sub_10002E634;
    uint64_t v55 = v40;
    unint64_t v56 = v32;
    uint64_t v57 = v31;
LABEL_29:
    return v162(v55, v56, v57, v30);
  }
  if (v10 == enum case for LaunchAngelXPCRequest.RequestType.displayAuthorization(_:))
  {
    uint64_t v43 = *(uint64_t **)(v0 + 440);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 432) + 96))(v43, *(void *)(v0 + 424));
    unint64_t v30 = v43[1];
    uint64_t v161 = *v43;
    *(void *)(v0 + 560) = v30;
    uint64_t v45 = v43[2];
    unint64_t v44 = v43[3];
    *(void *)(v0 + 568) = v44;
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v46 = type metadata accessor for Logger();
    sub_10000AEDC(v46, (uint64_t)qword_1000780D0);
    id v47 = v6;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v48 = v47;
    char v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      v146 = (void *)swift_slowAlloc();
      v166[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 138412802;
      *(void *)(v0 + 176) = v48;
      id v52 = v48;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v146 = v48;

      *(_WORD *)(v51 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v53 = v161;
      *(void *)(v0 + 184) = sub_100057B1C(v161, v30, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v51 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 192) = sub_100057B1C(v45, v44, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "[%@] Asked to display authorization for %{public}s by %{public}s", (uint8_t *)v51, 0x20u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      uint64_t v53 = v161;
    }
    v162 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))((char *)&dword_100076378
                                                                                        + dword_100076378);
    id v77 = (void *)swift_task_alloc();
    *(void *)(v0 + 576) = v77;
    void *v77 = v0;
    v77[1] = sub_10002E8A0;
    uint64_t v55 = v45;
    unint64_t v56 = v44;
    uint64_t v57 = v53;
    goto LABEL_29;
  }
  if (v10 == enum case for LaunchAngelXPCRequest.RequestType.getInstallConfirmation(_:))
  {
    uint64_t v58 = *(void *)(v0 + 440);
    uint64_t v59 = *(void *)(v0 + 392);
    uint64_t v60 = *(void *)(v0 + 360);
    uint64_t v61 = *(void *)(v0 + 368);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 432) + 96))(v58, *(void *)(v0 + 424));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v59, v58, v60);
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v63 = *(void *)(v0 + 384);
    uint64_t v62 = *(void *)(v0 + 392);
    uint64_t v64 = *(void *)(v0 + 360);
    uint64_t v65 = *(void *)(v0 + 368);
    uint64_t v66 = type metadata accessor for Logger();
    sub_10000AEDC(v66, (uint64_t)qword_1000780D0);
    v163 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
    v163(v63, v62, v64);
    uint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.default.getter();
    BOOL v69 = os_log_type_enabled(v67, v68);
    uint64_t v70 = *(void *)(v0 + 384);
    uint64_t v71 = *(void *)(v0 + 368);
    if (v69)
    {
      os_log_t v150 = *(os_log_t *)(v0 + 360);
      v153 = v67;
      long long v72 = (uint8_t *)swift_slowAlloc();
      v166[0] = swift_slowAlloc();
      *(_DWORD *)long long v72 = 136446210;
      uint64_t v73 = InstallSheetContext.logKey.getter();
      *(void *)(v0 + 168) = sub_100057B1C(v73, v74, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v75 = *(void (**)(uint64_t, os_log_t))(v71 + 8);
      uint64_t v76 = (v71 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v75(v70, v150);
      _os_log_impl((void *)&_mh_execute_header, v153, v68, "[%{public}s]: Asked to confirm install", v72, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v75 = *(void (**)(uint64_t, os_log_t))(v71 + 8);
      uint64_t v76 = (v71 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v75(*(void *)(v0 + 384), *(os_log_t *)(v0 + 360));
    }
    *(void *)(v0 + 592) = v75;
    uint64_t v88 = *(void *)(v0 + 376);
    id v89 = (void (*)(uint64_t, uint64_t))v75;
    uint64_t v90 = *(void *)(v0 + 360);
    v163(v88, *(void *)(v0 + 392), v90);
    id v91 = (objc_class *)type metadata accessor for InstallConfirmationTask();
    id v92 = (char *)objc_allocWithZone(v91);
    *(void *)&v92[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_remoteHandle] = 0;
    v163((uint64_t)&v92[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_context], v88, v90);
    id v93 = v92;
    uint64_t v94 = InstallSheetContext.logKey.getter();
    uint64_t v96 = v95;
    id v97 = (char *)objc_allocWithZone(v4);
    id v98 = (uint64_t *)&v97[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
    *id v98 = v94;
    v98[1] = v96;
    *(void *)(v0 + 96) = v97;
    *(void *)(v0 + 104) = v4;
    *(void *)&v93[OBJC_IVAR____TtC26AppDistributionLaunchAngel23InstallConfirmationTask_logKey] = [v0 init];

    *(void *)(v0 + 32) = v93;
    *(void *)(v0 + 40) = v91;
    [super init];
    *(void *)(v0 + 608) = v76;
    v89(v88, v90);
    id v99 = (void *)swift_task_alloc();
    *(void *)(v0 + 616) = v99;
    void *v99 = v0;
    v99[1] = sub_10002EB0C;
    return sub_100025334();
  }
  else if (v10 == enum case for LaunchAngelXPCRequest.RequestType.oauthAuthorization(_:))
  {
    uint64_t v78 = *(void *)(v0 + 440);
    uint64_t v79 = *(void *)(v0 + 352);
    uint64_t v81 = *(void *)(v0 + 328);
    uint64_t v80 = *(void *)(v0 + 336);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 432) + 96))(v78, *(void *)(v0 + 424));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 32))(v79, v78, v81);
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v82 = type metadata accessor for Logger();
    sub_10000AEDC(v82, (uint64_t)qword_1000780D0);
    id v83 = v6;
    id v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v84, v85))
    {
      id v86 = (uint8_t *)swift_slowAlloc();
      v158 = (void *)swift_slowAlloc();
      *(_DWORD *)id v86 = 138412290;
      *(void *)(v0 + 144) = v83;
      id v87 = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v158 = v83;

      _os_log_impl((void *)&_mh_execute_header, v84, v85, "[%@] Asked to display OAuth web authentication", v86, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v84 = v83;
    }
    uint64_t v119 = *(void *)(v0 + 344);
    uint64_t v120 = *(void *)(v0 + 352);
    uint64_t v121 = *(void *)(v0 + 328);
    uint64_t v122 = *(void *)(v0 + 336);

    v123 = *(void (**)(uint64_t, uint64_t, uint64_t))(v122 + 16);
    v123(v119, v120, v121);
    uint64_t v124 = (objc_class *)type metadata accessor for OAuthAuthorizationTask();
    uint64_t v125 = (char *)objc_allocWithZone(v124);
    *(void *)&v125[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_remoteHandle] = 0;
    v123((uint64_t)&v125[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_context], v119, v121);
    int v126 = v125;
    uint64_t v127 = OAuthAuthorizationContext.logKey.getter();
    uint64_t v129 = v128;
    v130 = (char *)objc_allocWithZone(v4);
    objc_super v131 = (uint64_t *)&v130[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
    *objc_super v131 = v127;
    v131[1] = v129;
    *(void *)(v0 + 112) = v130;
    *(void *)(v0 + 120) = v4;
    *(void *)&v126[OBJC_IVAR____TtC26AppDistributionLaunchAngel22OAuthAuthorizationTask_logKey] = [v0 init];

    *(void *)(v0 + 80) = v126;
    *(void *)(v0 + 88) = v124;
    [super init];
    objc_super v132 = *(void (**)(uint64_t, uint64_t))(v122 + 8);
    *(void *)(v0 + 632) = v132;
    *(void *)(v0 + 640) = (v122 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v132(v119, v121);
    v133 = (void *)swift_task_alloc();
    *(void *)(v0 + 648) = v133;
    void *v133 = v0;
    v133[1] = sub_10002EDBC;
    return sub_10000B034();
  }
  else if (v10 == enum case for LaunchAngelXPCRequest.RequestType.handleLicenseResolution(_:))
  {
    v155 = (uint64_t *)(v0 + 152);
    uint64_t v100 = *(void *)(v0 + 440);
    uint64_t v101 = *(void *)(v0 + 320);
    uint64_t v102 = *(void *)(v0 + 288);
    uint64_t v103 = *(void *)(v0 + 296);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 432) + 96))(v100, *(void *)(v0 + 424));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v103 + 32))(v101, v100, v102);
    if (qword_100074B68 != -1) {
      swift_once();
    }
    uint64_t v105 = *(void *)(v0 + 312);
    uint64_t v104 = *(void *)(v0 + 320);
    uint64_t v106 = *(void *)(v0 + 288);
    uint64_t v107 = *(void *)(v0 + 296);
    uint64_t v108 = type metadata accessor for Logger();
    sub_10000AEDC(v108, (uint64_t)qword_1000780D0);
    v159 = *(void (**)(uint64_t, uint64_t, uint64_t))(v107 + 16);
    v159(v105, v104, v106);
    id v109 = Logger.logObject.getter();
    os_log_type_t v110 = static os_log_type_t.default.getter();
    BOOL v111 = os_log_type_enabled(v109, v110);
    uint64_t v112 = *(void *)(v0 + 312);
    uint64_t v113 = *(void *)(v0 + 296);
    if (v111)
    {
      os_log_t loga = *(os_log_t *)(v0 + 288);
      uint64_t v164 = v0;
      id v114 = (uint8_t *)swift_slowAlloc();
      v166[0] = swift_slowAlloc();
      *(_DWORD *)id v114 = 136446210;
      uint64_t v115 = LicenseResolutionContext.logKey.getter();
      uint64_t *v155 = sub_100057B1C(v115, v116, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v117 = *(void (**)(uint64_t, os_log_t))(v113 + 8);
      uint64_t v118 = (v113 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v117(v112, loga);
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "[%{public}s] Handling license resolution request", v114, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v0 = v164;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v117 = *(void (**)(uint64_t, os_log_t))(v113 + 8);
      uint64_t v118 = (v113 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v117(*(void *)(v0 + 312), *(os_log_t *)(v0 + 288));
    }
    v165 = (void (*)(uint64_t, uint64_t))v117;
    *(void *)(v0 + 664) = v117;
    uint64_t v134 = *(void *)(v0 + 304);
    uint64_t v135 = *(void *)(v0 + 288);
    v159(v134, *(void *)(v0 + 320), v135);
    v136 = (objc_class *)type metadata accessor for LicenseResolutionTask();
    v137 = (char *)objc_allocWithZone(v136);
    *(void *)&v137[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle] = 0;
    v159((uint64_t)&v137[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_context], v134, v135);
    v138 = v137;
    uint64_t v139 = LicenseResolutionContext.logKey.getter();
    uint64_t v141 = v140;
    v142 = (char *)objc_allocWithZone(v4);
    v143 = (uint64_t *)&v142[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
    uint64_t *v143 = v139;
    v143[1] = v141;
    *(void *)(v0 + 64) = v142;
    *(void *)(v0 + 72) = v4;
    *(void *)&v138[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey] = [v0 init];

    *(void *)(v0 + 16) = v138;
    *(void *)(v0 + 24) = v136;
    [v0 initWith];
    *(void *)(v0 + 680) = v118;
    v165(v134, v135);
    v144 = (void *)swift_task_alloc();
    *(void *)(v0 + 688) = v144;
    void *v144 = v0;
    v144[1] = sub_10002F070;
    return sub_100045844();
  }
  else
  {
    return _assertionFailure(_:_:file:line:flags:)();
  }
}

uint64_t sub_10002E258()
{
  *(void *)(*(void *)v1 + 520) = v0;
  swift_task_dealloc();
  if (v0)
  {
    unint64_t v2 = sub_10002E4FC;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v2 = sub_10002E374;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002E374()
{
  uint64_t v1 = (void *)v0[62];
  (*(void (**)(void, void, void))(v0[51] + 104))(v0[52], enum case for LaunchAngelXPCResponse.ResponseType.ignored(_:), v0[50]);
  LaunchAngelXPCResponse.init(responseType:)();

  uint64_t v2 = v0[60];
  uint64_t v3 = v0[61];
  uint64_t v4 = v0[59];
  (*(void (**)(void, void, void))(v0[57] + 32))(v0[33], v0[58], v0[56]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
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
  swift_task_dealloc();
  swift_task_dealloc();
  id v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10002E4FC()
{
  uint64_t v2 = *(void *)(v0 + 480);
  uint64_t v1 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 472);

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002E634()
{
  *(void *)(*(void *)v1 + 552) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10002E75C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100033388;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002E75C()
{
  uint64_t v1 = *(void *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 480);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002E8A0()
{
  *(void *)(*(void *)v1 + 584) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10002E9C8;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_100033388;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002E9C8()
{
  uint64_t v1 = *(void *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 480);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002EB0C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 137) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002EC0C, 0, 0);
}

uint64_t sub_10002EC0C()
{
  uint64_t v1 = *(void **)(v0 + 600);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 592);
  uint64_t v3 = *(void **)(v0 + 496);
  uint64_t v4 = *(void *)(v0 + 408);
  id v5 = *(unsigned char **)(v0 + 416);
  uint64_t v7 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 400);
  uint64_t v8 = *(void *)(v0 + 360);
  unsigned char *v5 = *(unsigned char *)(v0 + 137);
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v5, enum case for LaunchAngelXPCResponse.ResponseType.installSheetConfirmation(_:), v6);
  LaunchAngelXPCResponse.init(responseType:)();

  v2(v7, v8);
  uint64_t v9 = *(void *)(v0 + 480);
  uint64_t v10 = *(void *)(v0 + 488);
  uint64_t v11 = *(void *)(v0 + 472);
  (*(void (**)(void, void, void))(*(void *)(v0 + 456) + 32))(*(void *)(v0 + 264), *(void *)(v0 + 464), *(void *)(v0 + 448));
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_10002EDBC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 656) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002EEBC, 0, 0);
}

uint64_t sub_10002EEBC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[79];
  uint64_t v2 = (void *)v0[78];
  uint64_t v3 = (void *)v0[62];
  uint64_t v4 = v0[51];
  id v5 = (void *)v0[52];
  uint64_t v6 = v0[50];
  uint64_t v7 = v0[44];
  uint64_t v8 = v0[41];
  void *v5 = v0[82];
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v5, enum case for LaunchAngelXPCResponse.ResponseType.oauthAuthorization(_:), v6);
  LaunchAngelXPCResponse.init(responseType:)();

  v1(v7, v8);
  uint64_t v9 = v0[60];
  uint64_t v10 = v0[61];
  uint64_t v11 = v0[59];
  (*(void (**)(void, void, void))(v0[57] + 32))(v0[33], v0[58], v0[56]);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_10002F070()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10002F16C, 0, 0);
}

uint64_t sub_10002F16C()
{
  uint64_t v1 = (void *)v0[84];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[83];
  uint64_t v3 = (void *)v0[62];
  uint64_t v4 = v0[40];
  uint64_t v5 = v0[36];
  (*(void (**)(void, void, void))(v0[51] + 104))(v0[52], enum case for LaunchAngelXPCResponse.ResponseType.ignored(_:), v0[50]);
  LaunchAngelXPCResponse.init(responseType:)();

  v2(v4, v5);
  uint64_t v6 = v0[60];
  uint64_t v7 = v0[61];
  uint64_t v8 = v0[59];
  (*(void (**)(void, void, void))(v0[57] + 32))(v0[33], v0[58], v0[56]);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10002F318@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v30 = a1;
  unint64_t v27 = a2;
  uint64_t v2 = sub_100007978(&qword_100075B90);
  __chkstk_darwin(v2);
  uint64_t v29 = (uint64_t)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007978(&qword_100075B98);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_allocBox();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for LaunchAngelXPCRequest();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v28 = v9;
  v12(v9, 1, 1, v10);
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  CodingUserInfoKey.init(rawValue:)();
  uint64_t v13 = type metadata accessor for CodingUserInfoKey();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v6, 1, v13);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_100031E94;
    *(void *)(v15 + 24) = v7;
    v32[3] = sub_100007978(&qword_100075BA0);
    v32[0] = sub_100031EE8;
    v32[1] = v15;
    swift_retain();
    id v16 = (void (*)(char *, void))dispatch thunk of PropertyListDecoder.userInfo.modify();
    sub_10002B38C((uint64_t)v32, (uint64_t)v6);
    v16(v31, 0);
    unint64_t v17 = sub_100031F10();
    __chkstk_darwin(v17);
    (*(void (**)(char *))(v19 + 16))((char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
    uint64_t v20 = Data.init<A>(_:)();
    unint64_t v22 = v21;
    sub_100031F64();
    uint64_t v23 = v32[5];
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
    if (v23)
    {
      swift_release();
      sub_10000D70C(v20, v22);
      return swift_release();
    }
    sub_10000D70C(v20, v22);
    uint64_t v24 = v28;
    swift_beginAccess();
    uint64_t v25 = v24;
    uint64_t v26 = v29;
    sub_100023C98(v25, v29, &qword_100075B90);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v26, 1, v10);
    if (result != 1)
    {
      (*(void (**)(void, uint64_t, uint64_t))(v11 + 32))(*v27, v26, v10);
      swift_release();
      return swift_release();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002F804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = v12;
  *(void *)(v8 + 80) = v13;
  *(_OWORD *)(v8 + 56) = v11;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 112) = a6;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 16) = a1;
  sub_100007978(&qword_100075B38);
  *(void *)(v8 + 88) = swift_task_alloc();
  return _swift_task_switch(sub_10002F8B8, 0, 0);
}

void sub_10002F8B8()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  char v5 = *(unsigned char *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = type metadata accessor for Logger();
  long long v10 = *(_OWORD *)(v0 + 48);
  long long v11 = *(_OWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 1, 1, v7);
  uint64_t v8 = swift_task_alloc();
  *(void *)(v0 + 96) = v8;
  *(void *)(v8 + 16) = v3;
  *(_OWORD *)(v8 + 24) = v10;
  *(void *)(v8 + 40) = v2;
  *(void *)(v8 + 48) = v6;
  *(void *)(v8 + 56) = v4;
  *(unsigned char *)(v8 + 64) = v5;
  *(_OWORD *)(v8 + 72) = v11;
  uint64_t v12 = (char *)&dword_100075B50 + dword_100075B50;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_10002FA40;
  __asm { BR              X8; sub_10002AAFC }
}

uint64_t sub_10002FA40()
{
  uint64_t v1 = *(void *)(*v0 + 88);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000D7CC(v1, &qword_100075B38);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_10002FB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 128) = v13;
  *(void *)(v8 + 136) = v14;
  *(unsigned char *)(v8 + 216) = a8;
  *(void *)(v8 + 112) = a6;
  *(void *)(v8 + 120) = a7;
  *(void *)(v8 + 96) = a4;
  *(void *)(v8 + 104) = a5;
  *(void *)(v8 + 80) = a2;
  *(void *)(v8 + 88) = a3;
  uint64_t v9 = sub_100007978(&qword_100075B68);
  *(void *)(v8 + 144) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 152) = v10;
  *(void *)(v8 + 160) = *(void *)(v10 + 64);
  *(void *)(v8 + 168) = swift_task_alloc();
  *(void *)(v8 + 176) = swift_task_alloc();
  *(void *)(v8 + 184) = swift_task_alloc();
  *(void *)(v8 + 192) = swift_task_alloc();
  return _swift_task_switch(sub_10002FC88, 0, 0);
}

uint64_t sub_10002FC88()
{
  uint64_t v45 = v0;
  uint64_t v1 = (void *)v0[10];
  if (v1)
  {
    uint64_t v2 = v0[11];
    uint64_t v5 = *(void *)(v2 + 56);
    uint64_t v4 = v2 + 56;
    uint64_t v3 = v5;
    uint64_t v6 = -1;
    uint64_t v7 = -1 << *(unsigned char *)(v0[11] + 32);
    if (-v7 < 64) {
      uint64_t v6 = ~(-1 << -(char)v7);
    }
    uint64_t v8 = v6 & v3;
    int64_t v9 = (unint64_t)(63 - v7) >> 6;
    id v10 = v1;
    swift_bridgeObjectRetain();
    int64_t v11 = 0;
    while (1)
    {
      if (!v8)
      {
        int64_t v14 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
        if (v14 >= v9) {
          goto LABEL_28;
        }
        uint64_t v8 = *(void *)(v4 + 8 * v14);
        ++v11;
        if (!v8)
        {
          int64_t v11 = v14 + 1;
          if (v14 + 1 >= v9) {
            goto LABEL_28;
          }
          uint64_t v8 = *(void *)(v4 + 8 * v11);
          if (!v8)
          {
            int64_t v15 = v14 + 2;
            if (v15 >= v9)
            {
LABEL_28:
              swift_release();
              uint64_t v43 = (uint64_t (*)(uint64_t))(v0[12] + *(int *)v0[12]);
              uint64_t v40 = (void *)swift_task_alloc();
              v0[25] = v40;
              *uint64_t v40 = v0;
              v40[1] = sub_100030310;
              uint64_t v41 = v0[23];
              return v43(v41);
            }
            uint64_t v8 = *(void *)(v4 + 8 * v15);
            if (!v8)
            {
              while (1)
              {
                int64_t v11 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_32;
                }
                if (v11 >= v9) {
                  goto LABEL_28;
                }
                uint64_t v8 = *(void *)(v4 + 8 * v11);
                ++v15;
                if (v8) {
                  goto LABEL_7;
                }
              }
            }
            int64_t v11 = v15;
          }
        }
      }
LABEL_7:
      v8 &= v8 - 1;
      NSString v12 = String._bridgeToObjectiveC()();
      unsigned __int8 v13 = [v10 hasEntitlement:v12];

      if ((v13 & 1) == 0)
      {
        sub_100031B68();
        swift_allocError();
        swift_willThrow();

        swift_release();
        goto LABEL_21;
      }
    }
  }
  sub_100031B68();
  swift_allocError();
  swift_willThrow();
LABEL_21:
  if (qword_100074B68 != -1) {
LABEL_33:
  }
    swift_once();
  uint64_t v16 = type metadata accessor for Logger();
  sub_10000AEDC(v16, (uint64_t)qword_1000780D0);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v42 = (void *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v20 = StaticString.description.getter();
    v0[8] = sub_100057B1C(v20, v21, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2114;
    swift_errorRetain();
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    v0[9] = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v42 = v22;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Error in %s: %{public}@", (uint8_t *)v19, 0x16u);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v23 = v0[24];
  uint64_t v24 = (uint64_t *)v0[22];
  swift_getErrorValue();
  uint64_t v25 = Error.localizedDescription.getter();
  uint64_t v27 = v26;
  swift_errorRelease();
  *uint64_t v24 = v25;
  v24[1] = v27;
  swift_storeEnumTagMultiPayload();
  sub_100031BBC((uint64_t)v24, v23);
  uint64_t v28 = v0[21];
  uint64_t v29 = v0[22];
  uint64_t v30 = v0[19];
  sub_100023C98(v0[24], v28, &qword_100075B68);
  sub_100023C98(v28, v29, &qword_100075B68);
  unint64_t v31 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v32 = swift_allocObject();
  sub_100031BBC(v29, v32 + v31);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  v0[5] = sub_100031D24;
  v0[6] = v32;
  sub_100031D94();
  uint64_t v33 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v35 = v34;
  swift_release();
  swift_release();
  uint64_t v36 = v0[24];
  os_log_type_t v37 = (void (*)(uint64_t, unint64_t, void))v0[16];
  sub_10000D7CC(v0[21], &qword_100075B68);
  v37(v33, v35, 0);
  sub_10000D70C(v33, v35);
  sub_10000D7CC(v36, &qword_100075B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(void))v0[1];
  return v38();
}

uint64_t sub_100030310()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100030618;
  }
  else {
    uint64_t v2 = sub_100030424;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100030424()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = *(void *)(v0 + 192);

  swift_storeEnumTagMultiPayload();
  sub_100031BBC(v1, v2);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v6 = *(void *)(v0 + 152);
  sub_100023C98(*(void *)(v0 + 192), v4, &qword_100075B68);
  sub_100023C98(v4, v5, &qword_100075B68);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = swift_allocObject();
  sub_100031BBC(v5, v8 + v7);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  *(void *)(v0 + 40) = sub_100031D24;
  *(void *)(v0 + 48) = v8;
  sub_100031D94();
  uint64_t v9 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v11 = v10;
  swift_release();
  swift_release();
  if (v3)
  {
    swift_errorRelease();
    uint64_t v9 = 0;
    unint64_t v11 = 0xC000000000000000;
  }
  uint64_t v12 = *(void *)(v0 + 192);
  unsigned __int8 v13 = *(void (**)(uint64_t, unint64_t, void))(v0 + 128);
  sub_10000D7CC(*(void *)(v0 + 168), &qword_100075B68);
  v13(v9, v11, 0);
  sub_10000D70C(v9, v11);
  sub_10000D7CC(v12, &qword_100075B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_100030618()
{
  uint64_t v27 = v0;

  if (qword_100074B68 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_1000780D0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v25 = (void *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v5 = StaticString.description.getter();
    *(void *)(v0 + 64) = sub_100057B1C(v5, v6, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2114;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 72) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v25 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error in %s: %{public}@", (uint8_t *)v4, 0x16u);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v8 = *(void *)(v0 + 192);
  uint64_t v9 = *(uint64_t **)(v0 + 176);
  swift_getErrorValue();
  uint64_t v10 = Error.localizedDescription.getter();
  uint64_t v12 = v11;
  swift_errorRelease();
  *uint64_t v9 = v10;
  v9[1] = v12;
  swift_storeEnumTagMultiPayload();
  sub_100031BBC((uint64_t)v9, v8);
  uint64_t v13 = *(void *)(v0 + 168);
  uint64_t v14 = *(void *)(v0 + 176);
  uint64_t v15 = *(void *)(v0 + 152);
  sub_100023C98(*(void *)(v0 + 192), v13, &qword_100075B68);
  sub_100023C98(v13, v14, &qword_100075B68);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = swift_allocObject();
  sub_100031BBC(v14, v17 + v16);
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  *(void *)(v0 + 40) = sub_100031D24;
  *(void *)(v0 + 48) = v17;
  sub_100031D94();
  uint64_t v18 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v20 = v19;
  swift_release();
  swift_release();
  uint64_t v21 = *(void *)(v0 + 192);
  uint64_t v22 = *(void (**)(uint64_t, unint64_t, void))(v0 + 128);
  sub_10000D7CC(*(void *)(v0 + 168), &qword_100075B68);
  v22(v18, v20, 0);
  sub_10000D70C(v18, v20);
  sub_10000D7CC(v21, &qword_100075B68);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

id sub_100030AA4()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for LaunchAngelService();
  return [super dealloc];
}

uint64_t type metadata accessor for LaunchAngelService()
{
  return self;
}

uint64_t sub_100030AFC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100030B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(v3 + 16);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *, uint64_t))(v5 + 16))(v5, isa, a3);
}

uint64_t sub_100030B94()
{
  uint64_t v1 = v0;
  StaticString.description.getter();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v2 = os_transaction_create();
  uint64_t result = swift_release();
  if (v2)
  {
    *(void *)(v1 + 16) = v2;
    os_transaction_get_timestamp();
    if (qword_100074B58 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_10000AEDC(v4, (uint64_t)qword_1000780A0);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 33554946;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v7 + 6) = 2080;
      uint64_t v8 = StaticString.description.getter();
      sub_100057B1C(v8, v9, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[TXN%hx] 🐏 Beginning transaction (%s)", (uint8_t *)v7, 0x10u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100030D8C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075B68);
  sub_100031DE8();
  sub_10002AAB0(a1, a1[3]);
  uint64_t v5 = dispatch thunk of Encoder.unkeyedContainer()();
  uint64_t v6 = *(void *)(v4 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v4);
  sub_100031E44((uint64_t)v11, v12);
  dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v4);
  return sub_10002AA58((uint64_t)v11);
}

uint64_t sub_100030F04(void *a1)
{
  uint64_t v3 = sub_100007978(&qword_100075B90);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 22;
  uint64_t v6 = swift_projectBox();
  sub_10002AAB0(a1, a1[3]);
  uint64_t result = dispatch thunk of Decoder.unkeyedContainer()();
  if (!v1)
  {
    uint64_t v8 = type metadata accessor for LaunchAngelXPCRequest();
    sub_100031FB8();
    sub_100031E44((uint64_t)v10, v11);
    dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 0, 1, v8);
    swift_beginAccess();
    sub_100032010((uint64_t)v5, v6);
    return sub_10002AA58((uint64_t)v10);
  }
  return result;
}

double sub_100031088@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100050414(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000511B8();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_10002A9CC((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_1000311B4(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_1000311B4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v38 = a2 + 64;
    unint64_t result = _HashTable.previousHole(before:)();
    uint64_t v12 = v38;
    if ((*(void *)(v38 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v36 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      unint64_t v35 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v37 = v13;
      unint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v35(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        uint64_t v18 = dispatch thunk of Hashable._rawHashValue(seed:)();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_17:
            uint64_t v22 = *(void *)(a2 + 48);
            unint64_t result = v22 + v15 * a1;
            unint64_t v23 = v22 + v17 + v15;
            if (v15 * a1 < v17 || result >= v23)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v17)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v25 = *(void *)(a2 + 56);
            uint64_t v26 = (_OWORD *)(v25 + 32 * a1);
            uint64_t v27 = (_OWORD *)(v25 + 32 * v10);
            uint64_t v12 = v38;
            if (a1 != v10 || (a1 = v10, v26 >= v27 + 2))
            {
              long long v28 = v27[1];
              *uint64_t v26 = *v27;
              v26[1] = v28;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_17;
        }
        uint64_t v12 = v38;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v29 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v29 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  uint64_t *v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10003146C()
{
  return 2;
}

uint64_t sub_100031474(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100007978(&qword_100074EA0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v23 - v12;
  swift_retain();
  Swift::Int v14 = sub_100047084((uint64_t)&off_10006DF60);
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  int64_t v17 = self;
  sub_10000D6B4(a1, a2);
  id v18 = [v17 currentContext];
  if (v18)
  {
    unint64_t v19 = v18;
    id v20 = [v18 remoteToken];
  }
  else
  {
    id v20 = 0;
  }
  sub_100023C98((uint64_t)v13, (uint64_t)v11, &qword_100074EA0);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  *(void *)(v21 + 32) = "handleXPCRequest";
  *(void *)(v21 + 40) = 16;
  *(unsigned char *)(v21 + 48) = 2;
  *(void *)(v21 + 56) = v20;
  *(void *)(v21 + 64) = v14;
  *(void *)(v21 + 72) = &unk_100075B20;
  *(void *)(v21 + 80) = v16;
  *(void *)(v21 + 88) = a3;
  *(void *)(v21 + 96) = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10003338C((uint64_t)v11, (uint64_t)&unk_100075B30, v21);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return sub_10000D7CC((uint64_t)v13, &qword_100074EA0);
}

uint64_t sub_1000316C0()
{
  sub_10000D70C(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000316F8(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_10001FC74;
  return sub_10002C878(a1, v5, v4);
}

uint64_t sub_1000317A4()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_1000317FC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 64);
  uint64_t v12 = *(void *)(v1 + 56);
  char v9 = *(unsigned char *)(v1 + 48);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000AC98;
  return sub_10002F804(a1, v4, v5, v6, v7, v9, v12, v8);
}

uint64_t sub_100031900(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 56);
  char v9 = *(unsigned char *)(v1 + 64);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_10000AC98;
  return sub_10002FB7C(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1000319F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001FC74;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_10000AC98;
  return v8(a1);
}

uint64_t sub_100031B18(uint64_t result)
{
  if (result != 1)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_100031B68()
{
  unint64_t result = qword_100075B70;
  if (!qword_100075B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075B70);
  }
  return result;
}

uint64_t sub_100031BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075B68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100031C24()
{
  uint64_t v1 = *(void *)(sub_100007978(&qword_100075B68) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = type metadata accessor for LaunchAngelXPCResponse();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100031D24(void *a1)
{
  uint64_t v3 = *(void *)(sub_100007978(&qword_100075B68) - 8);
  return sub_100030D8C(a1, v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
}

unint64_t sub_100031D94()
{
  unint64_t result = qword_100075B78;
  if (!qword_100075B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075B78);
  }
  return result;
}

unint64_t sub_100031DE8()
{
  unint64_t result = qword_100075B80;
  if (!qword_100075B80)
  {
    sub_100022BE4(&qword_100075B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075B80);
  }
  return result;
}

uint64_t sub_100031E44(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100031E94(void *a1)
{
  return sub_100030F04(a1);
}

uint64_t sub_100031EB0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031EE8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_100031F10()
{
  unint64_t result = qword_100075BA8;
  if (!qword_100075BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075BA8);
  }
  return result;
}

unint64_t sub_100031F64()
{
  unint64_t result = qword_100075BB0;
  if (!qword_100075BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075BB0);
  }
  return result;
}

unint64_t sub_100031FB8()
{
  unint64_t result = qword_100075BB8[0];
  if (!qword_100075BB8[0])
  {
    type metadata accessor for LaunchAngelXPCRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100075BB8);
  }
  return result;
}

uint64_t sub_100032010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032084()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppDistributionLaunchAngelError()
{
  return &type metadata for AppDistributionLaunchAngelError;
}

uint64_t sub_10003209C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_100032130(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 2;
    if (v9 >= 2)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 2;
          unsigned int v9 = v12 + 2;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 1)
    {
      uint64_t v14 = *((void *)a2 + 1);
      *uint64_t v3 = *(void *)a2;
      v3[1] = v14;
      *((unsigned char *)v3 + v5) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(void *))(v4 + 16))(a1);
      *((unsigned char *)v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_1000322AC(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x10) {
    unint64_t v2 = 16;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 2;
  if (v3 >= 2)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 2;
        unsigned int v3 = v6 + 2;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_1000323AC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    uint64_t v10 = *((void *)a2 + 1);
    *a1 = *(void *)a2;
    a1[1] = v10;
    swift_bridgeObjectRetain();
    char v11 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
    char v11 = 0;
  }
  *((unsigned char *)a1 + v4) = v11;
  return a1;
}

unsigned __int8 *sub_1000324E8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = *((void *)a2 + 1);
      a1[v7] = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
      a1[v7] = 0;
    }
  }
  return a1;
}

_OWORD *sub_10003270C(_OWORD *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 2;
  if (v5 >= 2)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 2;
        unsigned int v5 = v8 + 2;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 1)
  {
    *a1 = *(_OWORD *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_100032844(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 2;
    if (v8 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 2;
          unsigned int v8 = v11 + 2;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 2;
    if (v13 >= 2)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_28;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_28;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_28;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_28:
          int v17 = (v16 | (v14 << (8 * v7))) + 2;
          unsigned int v13 = v16 + 2;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_100032A5C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 16;
  if (*(void *)(v3 + 64) > 0x10uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 254) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 2) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 255;
}

void sub_100032B90(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10) {
    unint64_t v5 = 16;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFE)
  {
    unsigned int v8 = a2 - 255;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x100032D58);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_100032D80(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 16;
  if (*(void *)(v2 + 64) > 0x10uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 2;
  if (v4 >= 2)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 2;
        LODWORD(v4) = v7 + 2;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_100032E38(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x10uLL) {
    size_t v4 = 16;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult()
{
  return sub_100025234();
}

unint64_t sub_100032F2C()
{
  unint64_t result = qword_100075C40;
  if (!qword_100075C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100075C40);
  }
  return result;
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.FailureCodingKeys()
{
  return sub_100025234();
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.SuccessCodingKeys()
{
  return sub_100025234();
}

uint64_t type metadata accessor for AppDistributionLaunchAngelServiceResult.CodingKeys()
{
  return sub_100025234();
}

uint64_t sub_100032FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

unsigned char *sub_100032FD0(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_100032FDC(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_10003306C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100033138);
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

uint64_t sub_100033160(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100033168(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

uint64_t getEnumTagSinglePayload for LaunchAngelEntitlements(unsigned int *a1, int a2)
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

unsigned char *_s26AppDistributionLaunchAngel31AppDistributionLaunchAngelErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100033260);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100033288()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000332A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000332C0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000332DC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000332F8()
{
  return swift_getWitnessTable();
}

uint64_t sub_100033314()
{
  return swift_getWitnessTable();
}

uint64_t sub_100033330()
{
  return swift_getWitnessTable();
}

uint64_t sub_10003334C()
{
  return swift_getWitnessTable();
}

uint64_t sub_100033368()
{
  return swift_getWitnessTable();
}

uint64_t sub_10003338C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D7CC(a1, &qword_100074EA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100033538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000D7CC(a1, &qword_100074EA0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_100007978(&qword_100075F90);
  return swift_task_create();
}

id sub_1000336EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_delegate];
  *(void *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v7 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_isIPad;
  uint64_t v8 = self;
  int v9 = v3;
  id v10 = [v8 currentDevice];
  id v11 = [v10 userInterfaceIdiom];

  v3[v7] = v11 == (id)1;
  uint64_t v12 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton;
  unsigned int v13 = self;
  unsigned int v14 = &selRef_boldButton;
  *(void *)&v9[v12] = [v13 boldButton];
  uint64_t v15 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView;
  *(void *)&v9[v15] = [objc_allocWithZone((Class)ASCLockupView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_currentLockup] = 0;
  *(void *)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp] = 0;
  v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButtonPressed] = 0;
  *(void *)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressKVOToken] = 0;
  *((void *)v6 + 1) = a3;
  swift_unknownObjectWeakAssign();
  sub_10003CEE0(a1, (uint64_t)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent], (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  if ((*(unsigned char *)(a1 + *(int *)(type metadata accessor for LocalizedCombinedApprovalAndInstallContent() + 64)) & 1) == 0)
  {
    unsigned int v13 = self;
    unsigned int v14 = &selRef_linkButton;
  }
  id v16 = [v13 *v14];
  *(void *)&v9[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_cancelButton] = v16;

  NSString v17 = String._bridgeToObjectiveC()();
  NSString v18 = String._bridgeToObjectiveC()();
  v21.receiver = v9;
  v21.Class super_class = (Class)type metadata accessor for CombinedApprovalAndInstallSheetViewController();
  [super initWithTitle:v17 detailText:v18 symbolName:0 contentLayout:3];

  swift_unknownObjectRelease();
  sub_10003CF48(a1, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  return v19;
}

void sub_10003395C()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_100007978(&qword_100075F68);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v210 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  v214 = (char *)&v210 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v233 = (uint64_t)&v210 - v9;
  __chkstk_darwin(v8);
  v213 = (char *)&v210 - v10;
  uint64_t v216 = type metadata accessor for MultiBulletPointView(0);
  uint64_t v11 = __chkstk_darwin(v216);
  uint64_t v218 = (uint64_t)&v210 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v225 = (uint64_t *)((char *)&v210 - v13);
  uint64_t v223 = type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
  uint64_t v222 = *(void *)(v223 - 8);
  __chkstk_darwin(v223);
  v224 = (char *)&v210 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v220 = type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
  uint64_t v219 = *(void *)(v220 - 8);
  __chkstk_darwin(v220);
  v221 = (char *)&v210 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AttributedString.MarkdownParsingOptions();
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  v212 = (char *)&v210 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v217 = (char *)&v210 - v19;
  uint64_t v20 = sub_100007978((uint64_t *)&unk_1000755C0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  v211 = (char *)&v210 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v215 = (char *)&v210 - v23;
  uint64_t v24 = type metadata accessor for InstallSheetContext();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v210 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v236 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  uint64_t v28 = __chkstk_darwin(v236);
  uint64_t v228 = (uint64_t)&v210 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v227 = (uint64_t)&v210 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v226 = (uint64_t)&v210 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  uint64_t v210 = (uint64_t)&v210 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v232 = (char *)&v210 - v37;
  __chkstk_darwin(v36);
  id v39 = (char *)&v210 - v38;
  uint64_t v40 = type metadata accessor for MainActor();
  uint64_t v231 = static MainActor.shared.getter();
  uint64_t v237 = v40;
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v230 = v5;
  uint64_t v41 = (objc_class *)type metadata accessor for CombinedApprovalAndInstallSheetViewController();
  v239.receiver = v0;
  v239.Class super_class = v41;
  [super viewDidLoad];
  [v0 setModalInPresentation:1];
  [v0 setDefinesPresentationContext:1];
  int v229 = v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_isIPad];
  if (v229) {
    double v42 = 88.0;
  }
  else {
    double v42 = 24.0;
  }
  id v43 = [v0 contentView];
  [v43 setDirectionalLayoutMargins:0.0, v42, 0.0, v42];

  id v44 = [v1 headerView];
  id v45 = [v44 bottomAnchor];

  id v46 = [v1 contentView];
  id v47 = [v46 topAnchor];

  id v48 = [v45 constraintEqualToAnchor:v47 constant:-4.0];
  [v48 setActive:1];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  Class isa = (Class)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent];
  sub_10003CEE0((uint64_t)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent], (uint64_t)v39, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  char v49 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  v49(v27, v39, v24);
  sub_10003CF48((uint64_t)v39, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  os_log_type_t v50 = (objc_class *)type metadata accessor for MiniProductPageView();
  uint64_t v51 = (char *)objc_allocWithZone(v50);
  v49(&v51[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_context], v27, v24);
  id v52 = v1;
  uint64_t v53 = v51;
  InstallSheetContext.logKey.getter();
  id v54 = objc_allocWithZone((Class)AppStoreComponentsWrapper);
  NSString v55 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v56 = [v54 initWithLogKey:v55];

  *(void *)&v53[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper] = v56;
  v238.receiver = v53;
  v238.Class super_class = v50;
  uint64_t v57 = (char *)objc_msgSendSuper2(&v238, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_10003BD08(v52, v57, (uint64_t)&unk_10006ED50, (uint64_t)&unk_10006ED78, (uint64_t)&unk_10006EDA0);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);

  [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v58 = [v52 contentView];
  v234 = v57;
  [v58 addSubview:v57];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v59 = v232;
  sub_10003CEE0((uint64_t)isa, (uint64_t)v232, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  uint64_t v60 = &v59[*(int *)(v236 + 32)];
  uint64_t v61 = *(void *)v60;
  char v62 = v60[16];
  sub_10000DED4();
  sub_10003CF48((uint64_t)v59, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  if (v62)
  {
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v64 = v225;
    *(void *)((char *)v225 + *(int *)(v216 + 20)) = KeyPath;
    sub_100007978(&qword_100075FB0);
    swift_storeEnumTagMultiPayload();
    *uint64_t v64 = v61;
    sub_10003CEE0((uint64_t)v64, v218, type metadata accessor for MultiBulletPointView);
    id v65 = objc_allocWithZone((Class)sub_100007978(&qword_100075FB8));
    uint64_t v66 = (char *)UIHostingController.init(rootView:)();
    [v52 addChildViewController:v66];
    id v67 = [v66 view];
    if (v67)
    {
      os_log_type_t v68 = v67;
      [v67 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v69 = [v52 contentView];
      id v70 = [v66 view];
      if (v70)
      {
        uint64_t v71 = v70;
        [v69 addSubview:v70];

        [v66 didMoveToParentViewController:v52];
        id v72 = [v52 contentView];
        id v73 = [v72 leadingAnchor];

        id v74 = [v66 view];
        if (v74)
        {
          id v75 = v74;
          id v76 = [v74 leadingAnchor];

          id v77 = [v73 constraintEqualToAnchor:v76 constant:-(v42 + 12.0)];
          [v77 setActive:1];

          id v78 = [v52 contentView];
          id v79 = [v78 trailingAnchor];

          id v80 = [v66 view];
          if (v80)
          {
            uint64_t v81 = v80;
            id v82 = [v80 trailingAnchor];

            id v83 = [v79 constraintEqualToAnchor:v82 constant:v42];
            [v83 setActive:1];

            id v84 = [v52 contentView];
            id v85 = [v84 topAnchor];

            id v86 = [v66 view];
            Class v87 = isa;
            if (v86)
            {
              uint64_t v88 = v86;
              id v89 = [v86 topAnchor];

              id v90 = [v85 constraintEqualToAnchor:v89 constant:-24.0];
              [v90 setActive:1];

              id v91 = [v66 view];
              if (v91)
              {
                id v92 = v91;
                v232 = v66;
                id v93 = [v91 bottomAnchor];

                id v94 = [v234 topAnchor];
                id v95 = [v93 constraintEqualToAnchor:v94 constant:-24.0];

                [v95 setActive:1];
                type metadata accessor for NonHighlightableTextView();
                id v96 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithFrame:0.0, 0.0, 0.0, 0.0];
                [v96 setEditable:0];
                id v97 = v96;
                static MainActor.shared.getter();
                dispatch thunk of Actor.unownedExecutor.getter();
                if ((swift_task_isCurrentExecutor() & 1) == 0) {
                  swift_task_reportUnexpectedExecutor();
                }
                sub_100018668(0, (unint64_t *)&qword_100075FC0);
                uint64_t v98 = v210;
                sub_10003CEE0((uint64_t)v87, v210, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
                swift_release();
                swift_bridgeObjectRetain();
                sub_10003CF48(v98, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
                uint64_t v99 = type metadata accessor for URL();
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v211, 1, 1, v99);
                (*(void (**)(char *, void, uint64_t))(v219 + 104))(v221, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v220);
                (*(void (**)(char *, void, uint64_t))(v222 + 104))(v224, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v223);
                AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
                objc_super v131 = NSAttributedString.init(markdown:options:baseURL:)();
                [v97 setAttributedText:v131];

                [v97 setTextAlignment:1];
                objc_super v132 = self;
                id v133 = v97;
                id v134 = [v132 preferredFontForTextStyle:UIFontTextStyleBody];
                [v133 setFont:v134];

                [v133 setScrollEnabled:0];
                [v133 setTranslatesAutoresizingMaskIntoConstraints:0];
                uint64_t v135 = self;
                id v136 = v133;
                id v137 = [v135 labelColor];
                [v136 setTextColor:v137];

                [v136 setDelegate:v52];
                id v138 = [v52 contentView];
                [v138 addSubview:v136];

                id v139 = [v52 contentView];
                id v140 = [v139 leadingAnchor];

                id v141 = [v136 leadingAnchor];
                id v142 = [v140 constraintEqualToAnchor:v141 constant:-v42];

                [v142 setActive:1];
                id v143 = [v52 contentView];
                id v144 = [v143 trailingAnchor];

                id v145 = [v136 trailingAnchor];
                id v146 = [v144 constraintEqualToAnchor:v145 constant:v42];

                [v146 setActive:1];
                id v147 = [v234 bottomAnchor];
                id v148 = [v136 topAnchor];
                id v149 = [v147 constraintEqualToAnchor:v148 constant:-12.0];

                [v149 setActive:1];
                id v150 = [v52 contentView];
                id v151 = [v150 bottomAnchor];

                id v152 = [v136 bottomAnchor];
                id v153 = [v151 constraintEqualToAnchor:v152];

                [v153 setActive:1];
                sub_10003CF48((uint64_t)v225, type metadata accessor for MultiBulletPointView);
                goto LABEL_21;
              }
LABEL_48:
              __break(1u);
              return;
            }
LABEL_47:
            __break(1u);
            goto LABEL_48;
          }
LABEL_46:
          __break(1u);
          goto LABEL_47;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_45;
  }
  type metadata accessor for NonHighlightableTextView();
  id v100 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v100 setEditable:0];
  sub_100018668(0, (unint64_t *)&qword_100075FC0);
  uint64_t v101 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v215, 1, 1, v101);
  (*(void (**)(char *, void, uint64_t))(v219 + 104))(v221, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v220);
  (*(void (**)(char *, void, uint64_t))(v222 + 104))(v224, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v223);
  id v102 = v100;
  AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
  uint64_t v103 = NSAttributedString.init(markdown:options:baseURL:)();
  [v102 setAttributedText:v103];

  [v102 setTextAlignment:1];
  uint64_t v104 = self;
  id v105 = v102;
  id v106 = [v104 preferredFontForTextStyle:UIFontTextStyleBody];
  [v105 setFont:v106];

  [v105 setScrollEnabled:0];
  [v105 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v107 = self;
  id v108 = v105;
  id v109 = [v107 labelColor];
  [v108 setTextColor:v109];

  [v108 setDelegate:v52];
  id v110 = [v52 contentView];
  [v110 addSubview:v108];

  id v111 = [v52 contentView];
  id v112 = [v111 leadingAnchor];

  id v113 = [v108 leadingAnchor];
  id v114 = [v112 constraintEqualToAnchor:v113 constant:-v42];

  [v114 setActive:1];
  id v115 = [v52 contentView];
  id v116 = [v115 trailingAnchor];

  id v117 = [v108 trailingAnchor];
  id v118 = [v116 constraintEqualToAnchor:v117 constant:v42];

  [v118 setActive:1];
  id v119 = [v52 contentView];
  id v120 = [v119 topAnchor];

  id v121 = [v108 topAnchor];
  id v122 = [v120 constraintEqualToAnchor:v121];

  [v122 setActive:1];
  id v123 = [v108 bottomAnchor];
  uint64_t v124 = v234;
  id v125 = [v234 topAnchor];
  id v126 = [v123 constraintEqualToAnchor:v125 constant:-24.0];

  [v126 setActive:1];
  id v127 = [v124 bottomAnchor];
  id v128 = [v52 contentView];
  id v129 = [v128 bottomAnchor];

  id v130 = [v127 constraintEqualToAnchor:v129];
  [v130 setActive:1];

LABEL_21:
  Class v154 = isa;
  sub_100018668(0, &qword_100075FC8);
  Class isa = UIColor.init(_colorLiteralRed:green:blue:alpha:)(0.88, 0.88, 0.88, 1.0).super.isa;
  v155 = *(void **)((char *)v52
                  + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton);
  [v155 setEnabled:0];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v156 = v226;
  sub_10003CEE0((uint64_t)v154, v226, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10003CF48(v156, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  NSString v157 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v155 setTitle:v157 forState:0];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v158 = v227;
  sub_10003CEE0((uint64_t)v154, v227, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  int v159 = *(unsigned __int8 *)(v158 + *(int *)(v236 + 64));
  sub_10003CF48(v158, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  if (v159 == 1)
  {
    uint64_t v160 = (uint64_t)v213;
    UIButton.configuration.getter();
    uint64_t v161 = type metadata accessor for UIButton.Configuration();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v161 - 8) + 48))(v160, 1, v161))
    {
      sub_10003CBD4(v160, v233);
      UIButton.configuration.setter();
      sub_10000D7CC(v160, &qword_100075F68);
    }
    else
    {
      id v164 = [self systemBlueColor];
      UIButton.Configuration.baseForegroundColor.setter();
      UIButton.configuration.setter();
    }
    [v155 setTintColor:isa];
  }
  else
  {
    uint64_t v162 = (uint64_t)v214;
    UIButton.configuration.getter();
    uint64_t v163 = type metadata accessor for UIButton.Configuration();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v163 - 8) + 48))(v162, 1, v163))
    {
      sub_10003CBD4(v162, v233);
      UIButton.configuration.setter();
      sub_10000D7CC(v162, &qword_100075F68);
    }
    else
    {
      id v165 = [self whiteColor];
      UIButton.Configuration.baseForegroundColor.setter();
      UIButton.configuration.setter();
    }
    id v166 = [self systemBlueColor];
    [v155 setTintColor:v166];
  }
  [v155 addTarget:v52 action:"allowPressed" forControlEvents:64];
  id v167 = [v52 buttonTray];
  [v167 addButton:v155];

  uint64_t v168 = *(void **)((char *)v52
                  + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_cancelButton);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v169 = (uint64_t)v154;
  uint64_t v170 = v228;
  sub_10003CEE0(v169, v228, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10003CF48(v170, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  NSString v171 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v168 setTitle:v171 forState:0];

  uint64_t v172 = (uint64_t)v230;
  UIButton.configuration.getter();
  uint64_t v173 = type metadata accessor for UIButton.Configuration();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v173 - 8) + 48))(v172, 1, v173))
  {
    sub_10003CBD4(v172, v233);
    UIButton.configuration.setter();
    sub_10000D7CC(v172, &qword_100075F68);
  }
  else
  {
    id v174 = [self systemBlueColor];
    UIButton.Configuration.baseForegroundColor.setter();
    UIButton.configuration.setter();
  }
  [v168 setTintColor:isa];
  [v168 addTarget:v52 action:"cancelPressed" forControlEvents:64];
  id v175 = [v52 buttonTray];
  [v175 addButton:v168];

  id v176 = [v155 heightAnchor];
  id v177 = [v168 heightAnchor];
  id v178 = [v176 constraintEqualToAnchor:v177];

  [v178 setActive:1];
  id v179 = [v52 contentView];
  id v180 = [v179 leadingAnchor];

  v181 = v234;
  id v182 = [v234 leadingAnchor];
  if (v229)
  {
    id v183 = [v180 constraintGreaterThanOrEqualToAnchor:v182 constant:-88.0];

    LODWORD(v184) = 1140457472;
    [v183 setPriority:v184];
    [v183 setActive:1];
    id v185 = [v52 contentView];
    id v186 = [v185 centerXAnchor];

    id v187 = [v181 centerXAnchor];
    id v188 = [v186 constraintEqualToAnchor:v187];

    [v188 setActive:1];
    id v189 = [v181 widthAnchor];
    id v190 = [v189 constraintLessThanOrEqualToConstant:360.0];

    [v190 setActive:1];
    id v191 = [v52 buttonTray];
    id v192 = [v191 widthAnchor];

    id v193 = [v192 constraintLessThanOrEqualToConstant:360.0];
    [v193 setActive:1];

    id v194 = [v168 bottomAnchor];
    id v195 = [v52 buttonTray];
    id v196 = [v195 bottomAnchor];

    id v197 = [v194 constraintEqualToAnchor:v196 constant:-24.0];
    [v197 setActive:1];
  }
  else
  {
    id v198 = [v180 constraintEqualToAnchor:v182 constant:-24.0];

    [v198 setActive:1];
    id v199 = [v52 contentView];
    id v200 = [v199 trailingAnchor];

    id v201 = [v181 trailingAnchor];
    id v202 = [v200 constraintEqualToAnchor:v201 constant:24.0];

    [v202 setActive:1];
    id v203 = [v52 buttonTray];
    id v204 = [v203 leadingAnchor];

    id v205 = [v155 leadingAnchor];
    id v206 = [v204 constraintEqualToAnchor:v205 constant:-24.0];

    [v206 setActive:1];
    id v207 = [v52 buttonTray];
    id v208 = [v207 trailingAnchor];

    id v209 = [v155 trailingAnchor];
    id v197 = [v208 constraintEqualToAnchor:v209 constant:24.0];

    [v197 setActive:1];
  }
  swift_release();
}

uint64_t sub_100035EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100035F50, v6, v5);
}

uint64_t sub_100035F50()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  [*(id *)(v1 + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton) setEnabled:1];
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000361F4()
{
  uint64_t v1 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButtonPressed;
  int v5 = v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButtonPressed];
  swift_release();
  if (v5 == 1)
  {
    return swift_release();
  }
  else
  {
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    v0[v4] = 1;
    swift_release();
    uint64_t v7 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
    uint64_t v8 = v0;
    uint64_t v9 = static MainActor.shared.getter();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    void v10[4] = v8;
    sub_10003338C((uint64_t)v3, (uint64_t)&unk_100075F60, (uint64_t)v10);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_100036474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_100007978(&qword_100075F68);
  v4[3] = swift_task_alloc();
  v4[4] = swift_task_alloc();
  v4[5] = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  v4[6] = swift_task_alloc();
  v4[7] = swift_task_alloc();
  v4[8] = type metadata accessor for MainActor();
  v4[9] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[10] = v6;
  v4[11] = v5;
  return _swift_task_switch(sub_100036590, v6, v5);
}

uint64_t sub_100036590()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[12] = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[13] = v2;
    void *v2 = v0;
    v2[1] = sub_100036FB8;
    return sub_100018D94(1);
  }
  else
  {
    swift_release();
    uint64_t v4 = *(void **)(v0[2]
                  + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_cancelButton);
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[2]
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent;
    sub_10003CEE0(v6, v5, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    swift_release();
    swift_bridgeObjectRetain();
    sub_10003CF48(v5, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v4 setTitle:v7 forState:0];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v8 = v0[2];
    uint64_t v9 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView;
    id v10 = objc_retain(*(id *)(v8
                            + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView));
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v12 = v0[5];
    uint64_t v11 = v0[6];
    sub_10003CEE0(v6, v11, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    swift_release();
    int v13 = *(unsigned __int8 *)(v11 + *(int *)(v12 + 64));
    sub_10003CF48(v11, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
    uint64_t v14 = self;
    uint64_t v15 = &selRef_blueTheme;
    if (!v13) {
      uint64_t v15 = &selRef_whiteTheme;
    }
    id v16 = [v14 *v15];
    [v10 setOfferTheme:v16];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v17 = *(id *)(v8 + v9);
    swift_release();
    [v17 setLockupSize:ASCLockupViewSizeSmallOfferButton];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v18 = v0[4];
    uint64_t v19 = v0[2];
    id v20 = *(id *)(v8 + v9);
    swift_release();
    uint64_t v21 = *(void **)(v19
                   + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton);
    [v21 frame];
    [v20 setLayoutMargins:0.0, CGRectGetHeight(v43) * -0.5, 0.0, 0.0];

    UIButton.configuration.getter();
    uint64_t v22 = type metadata accessor for UIButton.Configuration();
    int v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 48))(v18, 1, v22);
    uint64_t v24 = v0[4];
    if (v23)
    {
      sub_10003CBD4(v0[4], v0[3]);
      UIButton.configuration.setter();
      sub_10000D7CC(v24, &qword_100075F68);
    }
    else
    {
      UIButton.Configuration.title.setter();
      UIButton.configuration.setter();
    }
    [v21 setTitle:0 forState:0];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v25 = *(id *)(v8 + v9);
    swift_release();
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v26 = *(id *)(v8 + v9);
    swift_release();
    [v21 addSubview:v26];

    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v27 = *(id *)(v8 + v9);
    swift_release();
    id v28 = [v27 centerXAnchor];

    id v29 = [v21 centerXAnchor];
    id v30 = [v28 constraintEqualToAnchor:v29];

    [v30 setActive:1];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v31 = *(id *)(v8 + v9);
    swift_release();
    id v32 = [v31 centerYAnchor];

    id v33 = [v21 centerYAnchor];
    id v34 = [v32 constraintEqualToAnchor:v33];

    [v34 setActive:1];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v35 = *(id *)(v8 + v9);
    swift_release();
    id v36 = [v35 heightAnchor];

    [v21 frame];
    id v37 = [v36 constraintEqualToConstant:CGRectGetHeight(v44)];

    [v37 setActive:1];
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v38 = *(id *)(v8 + v9);
    swift_release();
    id v39 = [v38 widthAnchor];

    [v21 frame];
    id v40 = [v39 constraintEqualToConstant:CGRectGetHeight(v45)];

    [v40 setActive:1];
    sub_100038300();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = (uint64_t (*)(void))v0[1];
    return v41();
  }
}

uint64_t sub_100036FB8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return _swift_task_switch(sub_1000370FC, v3, v2);
}

uint64_t sub_1000370FC()
{
  swift_release();
  uint64_t v1 = *(void **)(v0[2]
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_cancelButton);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[2]
     + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent;
  sub_10003CEE0(v3, v2, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10003CF48(v2, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v4 forState:0];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = v0[2];
  uint64_t v6 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView;
  id v7 = objc_retain(*(id *)(v5
                         + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView));
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v9 = v0[5];
  uint64_t v8 = v0[6];
  sub_10003CEE0(v3, v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  int v10 = *(unsigned __int8 *)(v8 + *(int *)(v9 + 64));
  sub_10003CF48(v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  uint64_t v11 = self;
  uint64_t v12 = &selRef_blueTheme;
  if (!v10) {
    uint64_t v12 = &selRef_whiteTheme;
  }
  id v13 = [v11 *v12];
  [v7 setOfferTheme:v13];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v14 = *(id *)(v5 + v6);
  swift_release();
  [v14 setLockupSize:ASCLockupViewSizeSmallOfferButton];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v15 = v0[4];
  uint64_t v16 = v0[2];
  id v17 = *(id *)(v5 + v6);
  swift_release();
  uint64_t v18 = *(void **)(v16
                 + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton);
  [v18 frame];
  [v17 setLayoutMargins:0.0, CGRectGetHeight(v41) * -0.5, 0.0, 0.0];

  UIButton.configuration.getter();
  uint64_t v19 = type metadata accessor for UIButton.Configuration();
  int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v15, 1, v19);
  uint64_t v21 = v0[4];
  if (v20)
  {
    sub_10003CBD4(v0[4], v0[3]);
    UIButton.configuration.setter();
    sub_10000D7CC(v21, &qword_100075F68);
  }
  else
  {
    UIButton.Configuration.title.setter();
    UIButton.configuration.setter();
  }
  [v18 setTitle:0 forState:0];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v22 = *(id *)(v5 + v6);
  swift_release();
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v23 = *(id *)(v5 + v6);
  swift_release();
  [v18 addSubview:v23];

  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v24 = *(id *)(v5 + v6);
  swift_release();
  id v25 = [v24 centerXAnchor];

  id v26 = [v18 centerXAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];

  [v27 setActive:1];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v28 = *(id *)(v5 + v6);
  swift_release();
  id v29 = [v28 centerYAnchor];

  id v30 = [v18 centerYAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  [v31 setActive:1];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v32 = *(id *)(v5 + v6);
  swift_release();
  id v33 = [v32 heightAnchor];

  [v18 frame];
  id v34 = [v33 constraintEqualToConstant:CGRectGetHeight(v42)];

  [v34 setActive:1];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v35 = *(id *)(v5 + v6);
  swift_release();
  id v36 = [v35 widthAnchor];

  [v18 frame];
  id v37 = [v36 constraintEqualToConstant:CGRectGetHeight(v43)];

  [v37 setActive:1];
  sub_100038300();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v38 = (uint64_t (*)(void))v0[1];
  return v38();
}

uint64_t sub_100037A4C()
{
  uint64_t v1 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp];
  swift_retain();
  swift_release();
  if (v4)
  {
    uint64_t v5 = AppLibrary.App.id.getter();
    swift_release();
    uint64_t v6 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v3, 1, 1, v6);
    id v7 = v0;
    uint64_t v8 = static MainActor.shared.getter();
    uint64_t v9 = (void *)swift_allocObject();
    _OWORD v9[2] = v8;
    v9[3] = &protocol witness table for MainActor;
    v9[4] = v7;
    v9[5] = v5;
    sub_10004C180((uint64_t)v3, (uint64_t)&unk_100075F50, (uint64_t)v9);
    swift_release();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100037C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  v5[4] = type metadata accessor for MainActor();
  v5[5] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[6] = v7;
  v5[7] = v6;
  return _swift_task_switch(sub_100037D18, v7, v6);
}

uint64_t sub_100037D18()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[8] = Strong;
  swift_release();
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[9] = v2;
    void *v2 = v0;
    v2[1] = sub_100037EAC;
    return sub_100019260();
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100076330 + dword_100076330);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[10] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_100038024;
    uint64_t v5 = v0[3];
    return v6(v5);
  }
}

uint64_t sub_100037EAC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_100076330 + dword_100076330);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 80) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100038024;
  uint64_t v4 = *(void *)(v1 + 24);
  return v6(v4);
}

uint64_t sub_100038024()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 88) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v5 = sub_1000381C4;
  }
  else {
    uint64_t v5 = sub_100038160;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100038160()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000381C4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100038244(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a1;
  a4();

  return swift_release();
}

uint64_t sub_100038300()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for InstallSheetContext();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v39[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v39[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10003CEE0(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_10003CF48((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  uint64_t v9 = InstallSheetContext.itemID.getter();
  unint64_t v11 = v10;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v13 = HIBYTE(v11) & 0xF;
  uint64_t v14 = v9 & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x2000000000000000) != 0) {
    uint64_t v15 = HIBYTE(v11) & 0xF;
  }
  else {
    uint64_t v15 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (!v15)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  if ((v11 & 0x1000000000000000) != 0)
  {
    sub_10003B3D4(v9, v11, 10);
    char v18 = v37;
    goto LABEL_40;
  }
  if ((v11 & 0x2000000000000000) == 0)
  {
    if ((v9 & 0x1000000000000000) != 0) {
      uint64_t v16 = (unsigned __int8 *)((v11 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v16 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
    }
    sub_10003B4BC(v16, v14, 10);
    char v18 = v17 & 1;
LABEL_40:
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      type metadata accessor for AppLibrary();
      static AppLibrary.current.getter();
      uint64_t v26 = AppLibrary.app(forAppleItemID:)();
      swift_release();
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      *(void *)(v1
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp) = v26;
      swift_release();
      swift_release();
      sub_100038EAC();
      sub_100038890();
    }
    return swift_release();
  }
  v39[0] = v9;
  v39[1] = v11 & 0xFFFFFFFFFFFFFFLL;
  if (v9 == 43)
  {
    if (!v13) {
      goto LABEL_68;
    }
    if (v13 != 1 && (BYTE1(v9) - 48) <= 9u)
    {
      if (v13 == 2) {
        goto LABEL_39;
      }
      if ((BYTE2(v9) - 48) <= 9u)
      {
        unint64_t v22 = 10 * (BYTE1(v9) - 48) + (BYTE2(v9) - 48);
        uint64_t v23 = v13 - 3;
        if (v23)
        {
          id v24 = (unsigned __int8 *)v39 + 3;
          while (1)
          {
            unsigned int v25 = *v24 - 48;
            if (v25 > 9) {
              goto LABEL_37;
            }
            if (!is_mul_ok(v22, 0xAuLL)) {
              goto LABEL_37;
            }
            BOOL v20 = __CFADD__(10 * v22, v25);
            unint64_t v22 = 10 * v22 + v25;
            if (v20) {
              goto LABEL_37;
            }
            char v18 = 0;
            ++v24;
            if (!--v23) {
              goto LABEL_40;
            }
          }
        }
        goto LABEL_39;
      }
    }
LABEL_37:
    char v18 = 1;
    goto LABEL_40;
  }
  if (v9 != 45)
  {
    if (v13 && (v9 - 48) <= 9u)
    {
      if (v13 == 1) {
        goto LABEL_39;
      }
      if ((BYTE1(v9) - 48) <= 9u)
      {
        unint64_t v27 = 10 * (v9 - 48) + (BYTE1(v9) - 48);
        uint64_t v28 = v13 - 2;
        if (v28)
        {
          id v29 = (unsigned __int8 *)v39 + 2;
          while (1)
          {
            unsigned int v30 = *v29 - 48;
            if (v30 > 9) {
              goto LABEL_37;
            }
            if (!is_mul_ok(v27, 0xAuLL)) {
              goto LABEL_37;
            }
            BOOL v20 = __CFADD__(10 * v27, v30);
            unint64_t v27 = 10 * v27 + v30;
            if (v20) {
              goto LABEL_37;
            }
            char v18 = 0;
            ++v29;
            if (!--v28) {
              goto LABEL_40;
            }
          }
        }
        goto LABEL_39;
      }
    }
    goto LABEL_37;
  }
  if (v13)
  {
    if (v13 == 1) {
      goto LABEL_37;
    }
    unsigned __int8 v19 = BYTE1(v9) - 48;
    if ((BYTE1(v9) - 48) > 9u) {
      goto LABEL_37;
    }
    BOOL v20 = v19 == 0;
    unint64_t v21 = -(uint64_t)v19;
    if (!v20) {
      goto LABEL_37;
    }
    if (v13 == 2)
    {
      char v18 = 0;
      goto LABEL_40;
    }
    unsigned __int8 v31 = BYTE2(v9) - 48;
    if ((BYTE2(v9) - 48) > 9u) {
      goto LABEL_37;
    }
    if (!is_mul_ok(v21, 0xAuLL)) {
      goto LABEL_37;
    }
    unint64_t v32 = 10 * v21;
    unint64_t v33 = v32 - v31;
    if (v32 < v31) {
      goto LABEL_37;
    }
    uint64_t v34 = v13 - 3;
    if (v34)
    {
      id v35 = (unsigned __int8 *)v39 + 3;
      while (1)
      {
        unsigned int v36 = *v35 - 48;
        if (v36 > 9) {
          goto LABEL_37;
        }
        if (!is_mul_ok(v33, 0xAuLL)) {
          goto LABEL_37;
        }
        BOOL v20 = 10 * v33 >= v36;
        unint64_t v33 = 10 * v33 - v36;
        if (!v20) {
          goto LABEL_37;
        }
        char v18 = 0;
        ++v35;
        if (!--v34) {
          goto LABEL_40;
        }
      }
    }
LABEL_39:
    char v18 = 0;
    goto LABEL_40;
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_100038890()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp);
  swift_retain();
  uint64_t v2 = swift_release();
  if (v1)
  {
    __chkstk_darwin(v2);
    withObservationTracking<A>(_:onChange:)();
    swift_release();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_100038A30()
{
  uint64_t v0 = sub_100007978(&qword_100075F40);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007978((uint64_t *)&unk_100075F00);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  AppLibrary.App.installation.getter();
  sub_10000D7CC((uint64_t)v5, (uint64_t *)&unk_100075F00);
  AppLibrary.App.isInstalling.getter();
  AppLibrary.App.isInstalled.getter();
  AppLibrary.App.installationError.getter();
  sub_10000D7CC((uint64_t)v2, &qword_100075F40);
  return swift_release();
}

uint64_t (*sub_100038B94())()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_release();
  return sub_10003B310;
}

uint64_t sub_100038C58()
{
  uint64_t v0 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
    type metadata accessor for MainActor();
    id v6 = v4;
    uint64_t v7 = static MainActor.shared.getter();
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v8[3] = &protocol witness table for MainActor;
    v8[4] = v6;
    sub_10003338C((uint64_t)v2, (uint64_t)&unk_100075F38, (uint64_t)v8);

    return swift_release();
  }
  return result;
}

uint64_t sub_100038DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100038E44, v6, v5);
}

uint64_t sub_100038E44()
{
  swift_release();
  sub_100038EAC();
  sub_100038890();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100038EAC()
{
  uint64_t v1 = type metadata accessor for InstallSheetContext();
  uint64_t v81 = *(void *)(v1 - 8);
  uint64_t v82 = v1;
  __chkstk_darwin(v1);
  id v80 = (char *)v74 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  uint64_t v3 = __chkstk_darwin(v84);
  uint64_t v79 = (uint64_t)v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v83 = (uint64_t)v74 - v5;
  uint64_t v6 = type metadata accessor for AppLibrary.App.Installation();
  Class v87 = *(void **)(v6 - 8);
  uint64_t v88 = v6;
  uint64_t v7 = v87[8];
  uint64_t v8 = __chkstk_darwin(v6);
  id v85 = (char *)v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)v74 - v9;
  uint64_t v11 = sub_100007978((uint64_t *)&unk_100075F00);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v74 - v15;
  type metadata accessor for MainActor();
  uint64_t v17 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v18 = *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp];
  swift_retain();
  swift_release();
  if (v18)
  {
    id v77 = v10;
    uint64_t v86 = v17;
    if (AppLibrary.App.isInstalled.getter())
    {
LABEL_7:
      sub_10003A358();
      swift_release();
      return swift_release();
    }
    uint64_t v78 = v18;
    id v76 = v0;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    AppLibrary.App.installation.getter();
    unsigned __int8 v19 = v87;
    uint64_t v20 = v88;
    unint64_t v21 = (unsigned int (*)(char *, uint64_t, uint64_t))v87[6];
    if (v21(v16, 1, v88) == 1)
    {
      sub_10000D7CC((uint64_t)v16, (uint64_t *)&unk_100075F00);
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      swift_release();
      swift_release();
      unint64_t v22 = v76;
    }
    else
    {
      uint64_t v23 = (void *)AppLibrary.App.Installation.progress.getter();
      ((void (*)(char *, uint64_t))v19[1])(v16, v20);
      [v23 fractionCompleted];
      double v25 = v24;

      swift_release();
      unint64_t v22 = v76;
      if (v25 >= 1.0) {
        goto LABEL_7;
      }
    }
    AppLibrary.App.installation.getter();
    uint64_t v26 = v88;
    if (v21(v14, 1, v88) == 1)
    {
      sub_10000D7CC((uint64_t)v14, (uint64_t *)&unk_100075F00);
      id v27 = [self indeterminateProgressMetadata];
      id v75 = [objc_allocWithZone((Class)ASCLocalOffer) initWithMetadata:v27 action:0];
    }
    else
    {
      uint64_t v28 = v87;
      id v29 = v77;
      v74[0] = v87[4];
      v74[1] = v87 + 4;
      ((void (*)(char *, char *, uint64_t))v74[0])(v77, v14, v26);
      unsigned int v30 = self;
      unsigned __int8 v31 = (void *)AppLibrary.App.Installation.progress.getter();
      [v31 fractionCompleted];
      double v33 = v32;

      id v34 = [v30 progressMetadataWithValue:v33];
      id v75 = [objc_allocWithZone((Class)ASCLocalOffer) initWithMetadata:v34 action:0];

      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v35 = v83;
      sub_10003CEE0((uint64_t)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent], v83, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      swift_release();
      char v36 = *(unsigned char *)(v35 + *(int *)(v84 + 64));
      sub_10003CF48(v35, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      if ((v36 & 1) == 0)
      {
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        id v37 = *(id *)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView];
        swift_release();
        id v38 = self;
        id v39 = [v38 whiteColor];
        id v40 = [v38 whiteColor];
        id v41 = [v38 whiteColor];
        id v42 = [v38 whiteColor];
        id v43 = [v38 systemBlueColor];
        id v44 = [objc_allocWithZone((Class)ASCOfferTheme) initWithTitleBackgroundColor:v39 titleTextColor:v40 subtitleTextColor:v41 iconTintColor:v42 progressColor:v43];

        [v37 setOfferTheme:v44];
        unint64_t v22 = v76;

        id v29 = v77;
        uint64_t v28 = v87;
      }
      id v89 = (id)AppLibrary.App.Installation.progress.getter();
      swift_getKeyPath();
      CGRect v45 = v85;
      uint64_t v46 = v88;
      ((void (*)(char *, char *, uint64_t))v28[2])(v85, v29, v88);
      unint64_t v47 = (*((unsigned __int8 *)v28 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v28 + 80);
      uint64_t v48 = swift_allocObject();
      *(void *)(v48 + 16) = v22;
      ((void (*)(unint64_t, char *, uint64_t))v74[0])(v48 + v47, v45, v46);
      char v49 = v22;
      uint64_t v50 = _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
      swift_release();
      swift_release();

      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v51 = *(void **)&v49[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressKVOToken];
      *(void *)&v49[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressKVOToken] = v50;
      swift_release();

      ((void (*)(char *, uint64_t))v28[1])(v77, v88);
    }
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v52 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_currentLockup;
    uint64_t v53 = *(void **)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_currentLockup];
    id v54 = v53;
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    char isCurrentExecutor = swift_task_isCurrentExecutor();
    if (v53)
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v56 = *(id *)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView];
      swift_release();
      id v57 = v75;
      id v58 = [v54 lockupWithOffer:v75];
      [v56 setLockup:v58];

      swift_release();
    }
    else
    {
      if ((isCurrentExecutor & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v59 = v79;
      sub_10003CEE0((uint64_t)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent], v79, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      swift_release();
      uint64_t v61 = v80;
      uint64_t v60 = v81;
      uint64_t v62 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v81 + 16))(v80, v59, v82);
      sub_10003CF48(v59, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      InstallSheetContext.itemID.getter();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
      id v63 = objc_allocWithZone((Class)ASCAdamID);
      NSString v64 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v65 = [v63 initWithStringValue:v64];

      uint64_t v66 = ASCLockupKindApp;
      id v67 = objc_allocWithZone((Class)ASCLockup);
      id v68 = [v67 initWithID:v65 kind:v66 metrics:0 icon:0 heading:0 title:0 subtitle:0 ageRating:0 offer:v75];

      id v69 = v68;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v70 = *(void **)&v22[v52];
      *(void *)&v22[v52] = v68;
      swift_release();

      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v71 = *(id *)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView];
      swift_release();
      id v72 = v69;
      [v71 setLockup:v72];

      swift_release();
    }
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return swift_release();
}

uint64_t sub_100039B88(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for AppLibrary.App.Installation();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a4, v6);
  type metadata accessor for MainActor();
  id v14 = a3;
  uint64_t v15 = static MainActor.shared.getter();
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = v15;
  *((void *)v17 + 3) = &protocol witness table for MainActor;
  *((void *)v17 + 4) = v14;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v17[v16], v9, v6);
  sub_10003338C((uint64_t)v12, (uint64_t)&unk_100075F18, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_100039D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[8] = a4;
  v5[9] = a5;
  v5[10] = type metadata accessor for MainActor();
  v5[11] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100039E18, v7, v6);
}

uint64_t sub_100039E18()
{
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = *(void **)(v0[8]
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_currentLockup);
  id v2 = v1;
  swift_release();
  if (v1)
  {
    uint64_t v3 = self;
    uint64_t v4 = (void *)AppLibrary.App.Installation.progress.getter();
    [v4 fractionCompleted];
    double v6 = v5;

    id v7 = [v3 progressMetadataWithValue:v6];
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v9 = objc_allocWithZone((Class)ASCLocalOffer);
    v0[6] = sub_10003B2E0;
    v0[7] = v8;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_1000535E8;
    v0[5] = &unk_10006EC38;
    uint64_t v10 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    id v11 = [v9 initWithMetadata:v7 action:v10];

    _Block_release(v10);
    swift_release();
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    id v12 = objc_retain(*(id *)(v0[8]
                            + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView));
    swift_release();
    id v13 = [v2 lockupWithOffer:v11];
    [v12 setLockup:v13];
  }
  id v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

void sub_10003A0E0()
{
  uint64_t v0 = sub_100007978((uint64_t *)&unk_100075F00);
  __chkstk_darwin(v0 - 8);
  id v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (char *)Strong;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installingApp];
    swift_retain();
    swift_release();
    if (!v5)
    {
      swift_release();

      return;
    }
    AppLibrary.App.installation.getter();
    uint64_t v6 = type metadata accessor for AppLibrary.App.Installation();
    uint64_t v7 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) == 1)
    {
      swift_release();

      sub_10000D7CC((uint64_t)v2, (uint64_t *)&unk_100075F00);
    }
    else
    {
      uint64_t v8 = (void *)AppLibrary.App.Installation.progress.getter();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v6);
      if ([v8 isCancellable]) {
        [v8 cancel];
      }
      swift_release();
    }
  }
  swift_release();
}

void sub_10003A358()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressKVOToken;
  uint64_t v6 = *(void **)(v0
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressKVOToken);
  id v7 = v6;
  swift_release();
  if (v6)
  {
    dispatch thunk of NSKeyValueObservation.invalidate()();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v8 = *(void **)(v0 + v5);
  *(void *)(v0 + v5) = 0;
  swift_release();

  uint64_t v9 = *(void **)(v0
                + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_allowButton);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10003CEE0(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  swift_release();
  swift_bridgeObjectRetain();
  sub_10003CF48((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setTitle:v10 forState:0];

  [v9 addTarget:v1 action:"openAppPressed" forControlEvents:64];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v11 = objc_retain(*(id *)(v1
                          + OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_installProgressView));
  swift_release();
  [v11 removeFromSuperview];
  swift_release();
}

uint64_t sub_10003A6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = type metadata accessor for MainActor();
  v4[5] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[6] = v6;
  v4[7] = v5;
  return _swift_task_switch(sub_10003A73C, v6, v5);
}

uint64_t sub_10003A73C()
{
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 64) = Strong;
  swift_release();
  if (Strong)
  {
    *(void *)(v0 + 72) = static MainActor.shared.getter();
    uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(sub_10003A898, v3, v2);
  }
  else
  {
    swift_release();
    **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_10003A898()
{
  swift_release();
  sub_100019568(0);
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  return _swift_task_switch(sub_10001E1B0, v1, v2);
}

id sub_10003AC14()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for CombinedApprovalAndInstallSheetViewController();
  return [super dealloc];
}

uint64_t sub_10003AD0C()
{
  return type metadata accessor for CombinedApprovalAndInstallSheetViewController();
}

uint64_t type metadata accessor for CombinedApprovalAndInstallSheetViewController()
{
  uint64_t result = qword_100075EF0;
  if (!qword_100075EF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003AD60()
{
  uint64_t result = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

const char *sub_10003AE24()
{
  return "fractionCompleted";
}

id sub_10003AE30@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 fractionCompleted];
  *a2 = v4;
  return result;
}

uint64_t sub_10003AE64()
{
  uint64_t v1 = type metadata accessor for AppLibrary.App.Installation();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003AF30(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for AppLibrary.App.Installation() - 8);
  uint64_t v6 = *(void **)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100039B88(a1, a2, v6, v7);
}

uint64_t sub_10003AFB4()
{
  uint64_t v1 = type metadata accessor for AppLibrary.App.Installation();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10003B088(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AppLibrary.App.Installation() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_10000AC98;
  return sub_100039D7C(a1, v5, v6, v7, v8);
}

uint64_t sub_10003B184()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_10003B1A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DynamicTypeSize();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t sub_10003B270()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003B2A8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003B2E0()
{
}

uint64_t sub_10003B2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003B2F8()
{
  return swift_release();
}

uint64_t sub_10003B300()
{
  return sub_100038A30();
}

uint64_t (*sub_10003B308())()
{
  return sub_100038B94();
}

uint64_t sub_10003B310()
{
  return sub_100038C58();
}

uint64_t sub_10003B318()
{
  return sub_10003CDB8(40);
}

uint64_t sub_10003B320(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_100038DAC(a1, v4, v5, v6);
}

unsigned __int8 *sub_10003B3D4(uint64_t a1, uint64_t a2, int64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = String.init<A>(_:)();
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
  uint64_t v5 = sub_10003B738();
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
    uint64_t v7 = (unsigned __int8 *)_StringObject.sharedUTF8.getter();
  }
LABEL_7:
  uint64_t v11 = sub_10003B4BC(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10003B4BC(unsigned __int8 *result, uint64_t a2, int64_t a3)
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
            unint64_t v9 = 0;
            for (i = result + 1; ; ++i)
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
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
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
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }
      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }
      if (result)
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0;
              }
              char v30 = -87;
            }
            else
            {
              char v30 = -55;
            }
          }
          else
          {
            char v30 = -48;
          }
          if (!is_mul_ok(v28, a3)) {
            return 0;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v28;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }
  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  uint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0;
        }
        char v22 = -87;
      }
      else
      {
        char v22 = -55;
      }
    }
    else
    {
      char v22 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0;
    }
    ++v20;
    --v16;
  }
  while (v16);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10003B738()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = sub_10003B7B8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10003B7B8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10003B910(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100057FBC(v9, 0),
          unint64_t v12 = sub_10003BA10((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = static String._uncheckedFromUTF8(_:)();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return static String._uncheckedFromUTF8(_:)();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  _StringObject.sharedUTF8.getter();
LABEL_4:

  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_10003B910(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_100058024(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100058024(v6, v5, v4);
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
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10003BA10(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    _OWORD v9[2] = a6;
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
    id result = v12;
    if (v17 == v15) {
      id result = sub_100058024(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      id result = String.UTF8View._foreignSubscript(position:)();
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
        id result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          id result = _StringObject.sharedUTF8.getter();
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
    id result = sub_100058024(v12, a6, a7);
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
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
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

uint64_t sub_10003BC24()
{
  return sub_10003CDB8(48);
}

uint64_t sub_10003BC2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000AC98;
  return sub_100037C7C(a1, v4, v5, v7, v6);
}

void sub_10003BCEC(id (*a1)(void *a1), char *a2)
{
}

void sub_10003BD08(id (*a1)(void *a1), char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v51 = a3;
  uint64_t v52 = a1;
  uint64_t v8 = type metadata accessor for InstallSheetContext.Source();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v51 - v13;
  type metadata accessor for MainActor();
  uint64_t v15 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  InstallSheetContext.source.getter();
  int v16 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v14, v8);
  uint64_t v54 = v15;
  uint64_t v55 = a5;
  uint64_t v53 = a4;
  if (v16 == enum case for InstallSheetContext.Source.distributor(_:))
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v14, v8);
    uint64_t v17 = *((void *)v14 + 3);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    uint64_t v17 = 0;
  }
  id v56 = a2;
  unint64_t v18 = *(void **)&a2[OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper];
  InstallSheetContext.itemID.getter();
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  InstallSheetContext.versionID.getter();
  if (!v20)
  {
    NSString v21 = 0;
    if (v17) {
      goto LABEL_8;
    }
LABEL_10:
    NSString v22 = 0;
    goto LABEL_11;
  }
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_10;
  }
LABEL_8:
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_11:
  InstallSheetContext.source.getter();
  char v23 = InstallSheetContext.Source.isAppStore.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  id v24 = [v18 lockupWithItemID:v19 versionID:v21 distributorID:v22 isForAppStore:v23 & 1 delegate:v52];

  id v25 = objc_allocWithZone((Class)UIColor);
  uint64_t v52 = sub_1000588D8;
  uint64_t v61 = sub_1000588D8;
  uint64_t v62 = 0;
  unint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v58 = 1107296256;
  uint64_t v59 = sub_10003FFFC;
  uint64_t v60 = v51;
  uint64_t v26 = _Block_copy(&aBlock);
  id v27 = [v25 initWithDynamicProvider:v26];
  _Block_release(v26);
  swift_release();
  [v24 setBackgroundColor:v27];

  id v28 = v56;
  [v56 addSubview:v24];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v29 = [v28 leadingAnchor];
  id v30 = [v24 leadingAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30 constant:-16.0];

  [v31 setActive:1];
  id v32 = [v28 trailingAnchor];
  id v33 = [v24 trailingAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33 constant:16.0];

  [v34 setActive:1];
  id v35 = [v28 topAnchor];
  id v36 = [v24 topAnchor];
  id v37 = [v35 constraintEqualToAnchor:v36 constant:-16.0];

  [v37 setActive:1];
  id v38 = [v28 bottomAnchor];
  id v39 = [v24 bottomAnchor];
  id v40 = [v38 constraintEqualToAnchor:v39 constant:16.0];

  [v40 setActive:1];
  id v41 = [v28 layer];
  [v41 setCornerRadius:20.0];

  id v42 = [v28 layer];
  id v43 = objc_allocWithZone((Class)UIColor);
  uint64_t v61 = sub_1000588FC;
  uint64_t v62 = 0;
  unint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v58 = 1107296256;
  uint64_t v59 = sub_10003FFFC;
  uint64_t v60 = v53;
  id v44 = _Block_copy(&aBlock);
  id v45 = [v43 initWithDynamicProvider:v44];
  _Block_release(v44);
  swift_release();
  id v46 = [v45 CGColor];

  [v42 setBorderColor:v46];
  id v47 = [v28 layer];
  [v47 setBorderWidth:1.0];

  id v48 = objc_allocWithZone((Class)UIColor);
  uint64_t v61 = v52;
  uint64_t v62 = 0;
  unint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v58 = 1107296256;
  uint64_t v59 = sub_10003FFFC;
  uint64_t v60 = v55;
  char v49 = _Block_copy(&aBlock);
  id v50 = [v48 initWithDynamicProvider:v49];
  _Block_release(v49);
  swift_release();
  [v28 setBackgroundColor:v50];
  swift_release();
}

uint64_t sub_10003C444(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_10003C524;
  return v5(v2 + 32);
}

uint64_t sub_10003C524()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10003C638(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = type metadata accessor for InstallSheetContext();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LocalizedCombinedApprovalAndInstallContent();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UITextItem.Content();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  uint64_t v34 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  UITextItem.content.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v12, v9) == enum case for UITextItem.Content.link(_:))
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000AEDC(v13, (uint64_t)qword_100078088);
    id v14 = v2;
    uint64_t v15 = Logger.logObject.getter();
    int v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, (os_log_type_t)v16))
    {
      int v29 = v16;
      os_log_t v31 = v15;
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v37 = v28;
      *(_DWORD *)uint64_t v17 = 136446210;
      v27[1] = static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      id v30 = v5;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      v27[0] = v17 + 4;
      sub_10003CEE0((uint64_t)v14+ OBJC_IVAR____TtC26AppDistributionLaunchAngel45CombinedApprovalAndInstallSheetViewController_localizedContent, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      swift_release();
      unint64_t v18 = v17;
      uint64_t v20 = v32;
      uint64_t v19 = v33;
      NSString v21 = v30;
      (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v30, v8, v33);
      sub_10003CF48((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for LocalizedCombinedApprovalAndInstallContent);
      uint64_t v22 = InstallSheetContext.logKey.getter();
      unint64_t v24 = v23;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
      swift_release();
      uint64_t v36 = sub_100057B1C(v22, v24, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      os_log_t v25 = v31;
      _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v29, "[%{public}s] User tapped learn more link", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();
  return v35;
}

uint64_t sub_10003CB18()
{
  return sub_10003CDB8(40);
}

uint64_t sub_10003CB20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_100036474(a1, v4, v5, v6);
}

uint64_t sub_10003CBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100075F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003CC3C()
{
  return sub_10003CDB8(40);
}

uint64_t sub_10003CC44(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_10003A6A0(a1, v4, v5, v6);
}

uint64_t sub_10003CCF8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10001FC74;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100075F80 + dword_100075F80);
  return v6(a1, v4);
}

uint64_t sub_10003CDB0()
{
  return sub_10003CDB8(40);
}

uint64_t sub_10003CDB8(uint64_t a1)
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_10003CE04(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10001FC74;
  return sub_100035EB8(a1, v4, v5, v6);
}

uint64_t sub_10003CEB8()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_10003CEE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003CF48(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_10003D300(char a1)
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v41 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v36 - v7;
  type metadata accessor for MainActor();
  uint64_t v9 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v42 = v4;
  uint64_t v10 = (objc_class *)type metadata accessor for OAuthAuthorizationViewController();
  v45.receiver = v1;
  v45.Class super_class = v10;
  [super viewDidAppear:a1 & 1];
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_10000AEDC(v11, (uint64_t)qword_100078088);
  id v12 = v1;
  uint64_t v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v38 = v14;
    uint64_t v39 = v9;
    uint64_t v40 = v3;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)uint64_t v15 = 136315395;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v16 = OAuthAuthorizationContext.logKey.getter();
    unint64_t v18 = v17;
    swift_release();
    uint64_t v43 = sub_100057B1C(v16, v18, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2085;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    OAuthAuthorizationContext.requestURL.getter();
    swift_release();
    sub_10000AFD4();
    uint64_t v3 = v40;
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v21 = v20;
    uint64_t v22 = v8;
    uint64_t v23 = v42;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v22, v3);
    uint64_t v43 = sub_100057B1C(v19, v21, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v38, "[%s] Activating web authentication request: %{sensitive}s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v23 = v42;
  }
  unint64_t v24 = v41;
  OAuthAuthorizationContext.requestURL.getter();
  os_log_t v25 = self;
  NSString v26 = String._bridgeToObjectiveC()();
  id v27 = [v25 callbackWithCustomScheme:v26];

  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v12;
  id v29 = objc_allocWithZone((Class)ASWebAuthenticationSession);
  id v30 = v12;
  URL._bridgeToObjectiveC()(v31);
  uint64_t v33 = v32;
  aBlock[4] = (uint64_t)sub_10003F16C;
  aBlock[5] = v28;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10003ED50;
  aBlock[3] = (uint64_t)&unk_10006EF08;
  uint64_t v34 = _Block_copy(aBlock);
  id v35 = [v29 initWithURL:v33 callback:v27 completionHandler:v34];
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v3);
  swift_release();
  [v35 setPrefersEphemeralWebBrowserSession:1];
  [v35 setPresentationContextProvider:v30];
  [v35 start];
  swift_release();
}

void sub_10003D8F0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100007978((uint64_t *)&unk_1000755C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  char v49 = (char *)&v45 - v14;
  type metadata accessor for MainActor();
  uint64_t v50 = static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_10002A964(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10003F174((uint64_t)v8);
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    sub_10000AEDC(v15, (uint64_t)qword_100078088);
    id v16 = a3;
    swift_errorRetain();
    id v17 = v16;
    swift_errorRetain();
    unint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      char v49 = (char *)swift_slowAlloc();
      uint64_t v52 = v49;
      *(_DWORD *)uint64_t v20 = 136446466;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v21 = OAuthAuthorizationContext.logKey.getter();
      unint64_t v23 = v22;
      swift_release();
      uint64_t v51 = sub_100057B1C(v21, v23, (uint64_t *)&v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2082;
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v51 = a2;
      swift_errorRetain();
      sub_100007978((uint64_t *)&unk_100076080);
      uint64_t v24 = String.init<A>(describing:)();
      unint64_t v26 = v25;
      swift_release();
      uint64_t v51 = sub_100057B1C(v24, v26, (uint64_t *)&v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%{public}s] Authentication failed: %{public}s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      if (a2) {
        goto LABEL_12;
      }
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      if (a2)
      {
LABEL_12:
        swift_errorRetain();
        id v27 = (void *)_convertErrorToNSError(_:)();
        swift_errorRelease();
LABEL_23:
        id v41 = [self responseForError:v27];

        sub_10003E4A8((uint64_t)v41);
        swift_release();

        return;
      }
    }
    id v27 = 0;
    goto LABEL_23;
  }
  uint64_t v28 = v49;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v49, v8, v9);
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v29 = type metadata accessor for Logger();
  sub_10000AEDC(v29, (uint64_t)qword_100078088);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v28, v9);
  id v30 = a3;
  os_log_t v31 = Logger.logObject.getter();
  int v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, (os_log_type_t)v32))
  {
    int v46 = v32;
    os_log_t v47 = v31;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v52 = (char *)v45;
    *(_DWORD *)uint64_t v33 = 136446467;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v34 = OAuthAuthorizationContext.logKey.getter();
    unint64_t v36 = v35;
    swift_release();
    uint64_t v51 = sub_100057B1C(v34, v36, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    id v48 = v30;
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2085;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_release();
    sub_10000AFD4();
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v51 = sub_100057B1C(v37, v38, (uint64_t *)&v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v39 = *(void (**)(char *, uint64_t))(v10 + 8);
    v39(v13, v9);
    os_log_t v40 = v47;
    _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v46, "[%{public}s] Received authorization %{sensitive}s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v28 = v49;
  }
  else
  {

    uint64_t v39 = *(void (**)(char *, uint64_t))(v10 + 8);
    v39(v13, v9);
  }
  id v42 = [objc_allocWithZone((Class)BSMutableSettings) init];
  URL.absoluteString.getter();
  NSString v43 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v42 setObject:v43 forSetting:2];

  id v44 = [self responseWithInfo:v42];
  sub_10003E4A8((uint64_t)v44);

  v39(v28, v9);
  swift_release();
}

uint64_t sub_10003E260(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  v9[4] = sub_10003F164;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  _OWORD v9[2] = sub_1000535E8;
  v9[3] = &unk_10006EEB8;
  uint64_t v5 = _Block_copy(v9);
  id v6 = v1;
  id v7 = a1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
  return swift_release();
}

void sub_10003E3C4(void *a1, uint64_t a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = [a1 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setBackgroundColor:a2];
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

void sub_10003E4A8(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000AEDC(v3, (uint64_t)qword_100078088);
  id v4 = v1;
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v7 = 136446210;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    uint64_t v8 = OAuthAuthorizationContext.logKey.getter();
    unint64_t v10 = v9;
    swift_release();
    sub_100057B1C(v8, v10, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%{public}s] Completing web authentication request", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v11 = OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction;
  uint64_t v12 = *(void **)&v4[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction];
  id v13 = v12;
  swift_release();
  if (v12)
  {
    if ([v13 canSendResponse]) {
      [v13 sendResponse:a1];
    }
  }
  id v14 = [self clearColor];
  sub_10003E260(v14);

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v4;
  aBlock[4] = (uint64_t)sub_10003F104;
  aBlock[5] = v15;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1000535E8;
  aBlock[3] = (uint64_t)&unk_10006EE68;
  id v16 = _Block_copy(aBlock);
  id v17 = v4;
  swift_release();
  [v17 dismissViewControllerAnimated:1 completion:v16];
  _Block_release(v16);
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unint64_t v18 = *(void **)&v4[v11];
  *(void *)&v4[v11] = 0;
  swift_release();
  swift_release();
}

uint64_t sub_10003E8FC(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void (**)(uint64_t))(a1
                                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction);
  sub_10000AF6C((uint64_t)v2);
  uint64_t v3 = swift_release();
  if (v2)
  {
    v2(v3);
    sub_10000AF7C((uint64_t)v2);
  }

  return swift_release();
}

id sub_10003EAC0()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for OAuthAuthorizationViewController();
  return [super dealloc];
}

uint64_t sub_10003EB8C()
{
  return type metadata accessor for OAuthAuthorizationViewController();
}

uint64_t type metadata accessor for OAuthAuthorizationViewController()
{
  uint64_t result = qword_100076010;
  if (!qword_100076010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003EBE0()
{
  uint64_t result = type metadata accessor for OAuthAuthorizationContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10003ED50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100007978((uint64_t *)&unk_1000755C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_10003F174((uint64_t)v8);
}

uint64_t sub_10003EE90()
{
  unint64_t v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction];
  *(void *)unint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction] = 0;

  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10003EF74()
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_11;
  }
  objc_super v2 = v1;
  id v3 = [v1 window];

  if (!v3)
  {
LABEL_7:
    id v5 = [v0 view];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [v5 window];

      if (v7)
      {
        swift_release();
        return;
      }
      goto LABEL_12;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v4 = [v3 _rootSheetPresentationController];

  if (v4)
  {
    [v4 _setShouldScaleDownBehindDescendantSheets:0];

    goto LABEL_7;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_10003F0CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003F104()
{
  return sub_10003E8FC(*(void *)(v0 + 16));
}

uint64_t sub_10003F10C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003F11C()
{
  return swift_release();
}

uint64_t sub_10003F124()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003F164()
{
  sub_10003E3C4(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10003F16C(uint64_t a1, uint64_t a2)
{
  sub_10003D8F0(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10003F174(uint64_t a1)
{
  uint64_t v2 = sub_100007978((uint64_t *)&unk_1000755C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10003F1E8(void *a1, uint64_t a2)
{
  id v4 = [self userInteractive];
  [a1 setServiceQuality:v4];

  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [self interfaceWithIdentifier:v5];

  id v7 = [self protocolForProtocol:&OBJC_PROTOCOL____TtP14MarketplaceKit35AppDistributionLaunchAngelInterface_];
  [v6 setServer:v7];

  [v6 setClientMessagingExpectation:1];
  [a1 setInterface:v6];

  [a1 setInterfaceTarget:*(void *)(a2 + OBJC_IVAR____TtC26AppDistributionLaunchAngel26LaunchAngelServiceDelegate_service)];
  v9[4] = sub_10003F3B4;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  _OWORD v9[2] = sub_10001D994;
  v9[3] = &unk_10006EFA8;
  uint64_t v8 = _Block_copy(v9);
  [a1 setInvalidationHandler:v8];
  _Block_release(v8);
}

void sub_10003F3B4()
{
  if (qword_100074B68 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000AEDC(v0, (uint64_t)qword_1000780D0);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Connection invalidated", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t type metadata accessor for LaunchAngelServiceDelegate()
{
  return self;
}

id sub_10003F594(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100074B68 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000AEDC(v4, (uint64_t)qword_1000780D0);
  id v5 = a1;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    id v9 = [v5 remoteToken];
    id v10 = [v9 bundleID];

    if (v10)
    {
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v13 = v12;
    }
    else
    {
      unint64_t v13 = 0xE700000000000000;
      uint64_t v11 = 0x6E776F6E6B6E75;
    }
    sub_100057B1C(v11, v13, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received connection from %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v14 = [v5 remoteProcess];
  NSString v15 = String._bridgeToObjectiveC()();
  unsigned int v16 = [v14 hasEntitlement:v15];

  if (v16)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v2;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_10003F9E0;
    *(void *)(v18 + 24) = v17;
    aBlock[4] = (uint64_t)sub_10000DB58;
    aBlock[5] = v18;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000DA88;
    aBlock[3] = (uint64_t)&unk_10006EF80;
    os_log_type_t v19 = _Block_copy(aBlock);
    id v20 = v2;
    swift_retain();
    swift_release();
    [v5 configureConnection:v19];
    _Block_release(v19);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    id result = (id)swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
      [v5 activate];
      return (id)swift_release();
    }
  }
  else
  {
    unint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Process not entitled, failing", v25, 2u);
      swift_slowDealloc();
    }

    return [v5 invalidate];
  }
  return result;
}

uint64_t sub_10003F9A8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10003F9E0(void *a1)
{
  sub_10003F1E8(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003F9E8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003F9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003FA08()
{
  return swift_release();
}

uint64_t sub_10003FB30(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10.receiver = v1;
  v10.Class super_class = (Class)type metadata accessor for MiniProductPageView();
  [super traitCollectionDidChange:a1];
  id v3 = [v1 layer];
  id v4 = objc_allocWithZone((Class)UIColor);
  v9[4] = sub_1000588FC;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  _OWORD v9[2] = sub_10003FFFC;
  v9[3] = &unk_10006EFD0;
  id v5 = _Block_copy(v9);
  id v6 = [v4 initWithDynamicProvider:v5];
  _Block_release(v5);
  swift_release();
  id v7 = [v6 CGColor];

  [v3 setBorderColor:v7];
  [v1 setNeedsDisplay];
  return swift_release();
}

id sub_10003FE54()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for MiniProductPageView();
  return [super dealloc];
}

uint64_t sub_10003FF0C()
{
  return type metadata accessor for MiniProductPageView();
}

uint64_t type metadata accessor for MiniProductPageView()
{
  uint64_t result = qword_1000761B8;
  if (!qword_1000761B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003FF60()
{
  uint64_t result = type metadata accessor for InstallSheetContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10003FFFC(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_100040064(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100040074()
{
  return swift_release();
}

uint64_t sub_10004007C()
{
  v1[40] = v0;
  uint64_t v2 = type metadata accessor for BagLanguageSource();
  v1[41] = v2;
  v1[42] = *(void *)(v2 - 8);
  v1[43] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Bag();
  v1[44] = v3;
  v1[45] = *(void *)(v3 - 8);
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  type metadata accessor for JetPackPath();
  v1[48] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for LocalizedStringsBundle();
  v1[49] = v4;
  v1[50] = *(void *)(v4 - 8);
  v1[51] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for InMemoryJetPackResourceBundle();
  v1[52] = v5;
  v1[53] = *(void *)(v5 - 8);
  v1[54] = swift_task_alloc();
  v1[55] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for JetPackSigningPolicy();
  v1[56] = v6;
  v1[57] = *(void *)(v6 - 8);
  v1[58] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for InMemoryJetPackLoader();
  v1[59] = v7;
  v1[60] = *(void *)(v7 - 8);
  v1[61] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for JetPackAssetRequestSourcePolicy();
  v1[62] = v8;
  v1[63] = *(void *)(v8 - 8);
  v1[64] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v1[65] = v9;
  v1[66] = *(void *)(v9 - 8);
  v1[67] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for URLJetPackAssetRequest();
  v1[68] = v10;
  v1[69] = *(void *)(v10 - 8);
  v1[70] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for JetPackAsset();
  v1[71] = v11;
  v1[72] = *(void *)(v11 - 8);
  v1[73] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for URLJetPackAssetFetcher();
  v1[74] = v12;
  v1[75] = *(void *)(v12 - 8);
  v1[76] = swift_task_alloc();
  type metadata accessor for JetPackAssetSession.Configuration();
  v1[77] = swift_task_alloc();
  sub_100007978(&qword_100076320);
  v1[78] = swift_task_alloc();
  v1[79] = swift_task_alloc();
  v1[80] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for Date();
  v1[81] = v13;
  v1[82] = *(void *)(v13 - 8);
  v1[83] = swift_task_alloc();
  v1[84] = swift_task_alloc();
  return _swift_task_switch(sub_100040604, v0, 0);
}

uint64_t sub_100040604()
{
  NSString v43 = v0;
  uint64_t v1 = v0[40];
  if (!*(void *)(v1 + 112))
  {
    uint64_t v2 = v0[82];
    uint64_t v3 = v0[81];
    uint64_t v4 = v0[80];
    uint64_t v5 = OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
    v0[85] = OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt;
    uint64_t v6 = v1 + v5;
    swift_beginAccess();
    sub_100043558(v6, v4);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v3) == 1)
    {
      sub_1000435C0(v0[80]);
LABEL_5:
      if (qword_100074B58 != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      v0[86] = sub_10000AEDC(v14, (uint64_t)qword_1000780A0);
      swift_retain_n();
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        v42[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315138;
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_1000436F0((unint64_t *)&qword_100074EC0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
        v0[39] = sub_100057B1C(v18, v19, v42);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Loading localization resource bundle from %s", v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }

      uint64_t v20 = type metadata accessor for JetPackAssetDiskCache();
      uint64_t v21 = JetPackAssetDiskCache.__allocating_init()();
      v0[87] = v21;
      uint64_t v22 = v0[67];
      uint64_t v23 = v0[66];
      uint64_t v40 = v0[65];
      uint64_t v25 = v0[63];
      uint64_t v24 = v0[64];
      uint64_t v41 = v0[62];
      uint64_t v26 = v0[40];
      v42[3] = v20;
      v42[4] = (uint64_t)&protocol witness table for JetPackAssetDiskCache;
      v42[0] = v21;
      swift_retain();
      JetPackAssetSession.Configuration.init(cache:)();
      type metadata accessor for JetPackAssetSession();
      swift_allocObject();
      v0[88] = JetPackAssetSession.init(configuration:)();
      uint64_t v27 = *(void *)(v26 + 120);
      v0[89] = v27;
      uint64_t v28 = self;
      uint64_t v29 = self;
      swift_unknownObjectRetain();
      id v30 = [v29 currentProcess];
      id v31 = [v28 ams_configurationWithProcessInfo:v30 bag:v27];

      URLJetPackAssetFetcher.init(bag:urlSessionConfiguration:)();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v26 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url, v40);
      (*(void (**)(uint64_t, void, uint64_t))(v25 + 104))(v24, enum case for JetPackAssetRequestSourcePolicy.standard(_:), v41);
      URLJetPackAssetRequest.init(url:sourcePolicy:)();
      int v32 = (void *)swift_task_alloc();
      v0[90] = v32;
      uint64_t v33 = sub_1000436F0(&qword_100076328, (void (*)(uint64_t))&type metadata accessor for URLJetPackAssetFetcher);
      void *v32 = v0;
      v32[1] = sub_100040F08;
      uint64_t v34 = v0[76];
      uint64_t v35 = v0[74];
      uint64_t v36 = v0[73];
      uint64_t v37 = v0[70];
      return JetPackAssetSession.jetPack<A>(for:fetcher:)(v36, v37, v34, v35, v33);
    }
    uint64_t v7 = v0[84];
    uint64_t v8 = v0[83];
    uint64_t v9 = v0[82];
    uint64_t v10 = v0[81];
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 32))(v7, v0[80], v10);
    Date.init()();
    Date.timeIntervalSince(_:)();
    double v12 = v11;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v8, v10);
    v13(v7, v10);
    if (v12 >= 3600.0) {
      goto LABEL_5;
    }
  }
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
  unint64_t v38 = (uint64_t (*)(void))v0[1];
  return v38();
}

uint64_t sub_100040F08()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 728) = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[70];
  uint64_t v4 = v2[69];
  uint64_t v5 = v2[68];
  uint64_t v6 = v2[40];
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0) {
    uint64_t v7 = sub_100041F04;
  }
  else {
    uint64_t v7 = sub_100041084;
  }
  return _swift_task_switch(v7, v6, 0);
}

uint64_t sub_100041084()
{
  (*(void (**)(uint64_t, void, uint64_t))(v0[57] + 104))(v0[58], enum case for JetPackSigningPolicy.required(_:), v0[56]);
  v0[25] = type metadata accessor for JetPackManagedKeyProvider();
  v0[26] = (uint64_t)&protocol witness table for JetPackManagedKeyProvider;
  sub_10002A9DC(v0 + 22);
  JetPackManagedKeyProvider.init()();
  InMemoryJetPackLoader.init(signingPolicy:keyProvider:)();
  JetPackAsset.streamSource.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[92] = (uint64_t)v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000411A8;
  uint64_t v2 = v0[55];
  return InMemoryJetPackLoader.bundle(from:)(v2, v0 + 2);
}

uint64_t sub_1000411A8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1 + 16;
  *(void *)(*v1 + 744) = v0;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v2 + 320);
  sub_10002AA58(v3);
  if (v0) {
    uint64_t v5 = sub_100042310;
  }
  else {
    uint64_t v5 = sub_1000412E4;
  }
  return _swift_task_switch(v5, v4, 0);
}

uint64_t sub_1000412E4()
{
  uint64_t v59 = v0;
  uint64_t v1 = v0 + 17;
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[53] + 16);
  v2(v0[54], v0[55], v0[52]);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v55 = v0[53];
    uint64_t v50 = v0[54];
    uint64_t v52 = v0[52];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    v58[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v6 = JetPackResourceBundle.version.getter();
    if (!v7) {
      uint64_t v6 = 48;
    }
    uint64_t v8 = v2;
    if (v7) {
      unint64_t v9 = v7;
    }
    else {
      unint64_t v9 = 0xE100000000000000;
    }
    v0[38] = sub_100057B1C(v6, v9, v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v2 = v8;
    uint64_t v1 = v0 + 17;
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v10(v50, v52);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Loaded resource bundle version %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0[53] + 8);
    v10(v0[54], v0[52]);
  }

  v0[94] = (uint64_t)v10;
  uint64_t v11 = v0[93];
  uint64_t v12 = v0[55];
  uint64_t v13 = v0[52];
  v0[20] = v13;
  v0[21] = (uint64_t)&protocol witness table for InMemoryJetPackResourceBundle;
  uint64_t v14 = sub_10002A9DC(v1);
  v2((uint64_t)v14, v12, v13);
  JetPackPath.init(_:)();
  LocalizedStringsBundle.init(resourceBundle:indexPath:)();
  if (v11)
  {
    uint64_t v56 = v0[76];
    uint64_t v15 = v0[75];
    uint64_t v53 = v0[73];
    uint64_t v54 = v0[74];
    uint64_t v16 = v0[72];
    uint64_t v17 = v0[60];
    uint64_t v49 = v0[61];
    uint64_t v51 = v0[71];
    uint64_t v18 = v0[59];
    unint64_t v19 = v10;
    uint64_t v20 = v0[55];
    uint64_t v21 = v0[52];
    swift_release();
    swift_release();
    v19(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v49, v18);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v53, v51);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v56, v54);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      v58[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446210;
      swift_getErrorValue();
      uint64_t v25 = *(void *)(v0[31] - 8);
      swift_task_alloc();
      (*(void (**)(void))(v25 + 16))();
      uint64_t v26 = String.init<A>(describing:)();
      unint64_t v28 = v27;
      swift_task_dealloc();
      v0[36] = sub_100057B1C(v26, v28, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to load localization jetpack: %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    uint64_t v42 = v0[82];
    uint64_t v43 = v0[81];
    uint64_t v44 = v0[79];
    uint64_t v45 = v0[78];
    uint64_t v46 = v0[40] + v0[85];
    Date.init()();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v44, 0, 1, v43);
    sub_100043620(v44, v45);
    swift_beginAccess();
    sub_100043688(v45, v46);
    swift_endAccess();
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
    os_log_t v47 = (uint64_t (*)(void))v0[1];
    return v47();
  }
  else
  {
    uint64_t v29 = v0[50];
    uint64_t v57 = v0[51];
    uint64_t v30 = v0[49];
    uint64_t v32 = v0[46];
    uint64_t v31 = v0[47];
    uint64_t v34 = v0[44];
    uint64_t v33 = v0[45];
    uint64_t v35 = v0[42];
    uint64_t v36 = v0[43];
    uint64_t v37 = v0[41];
    swift_unknownObjectRetain();
    Bag.init(from:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v32, v31, v34);
    BagLanguageSource.init(bag:)();
    type metadata accessor for AppleServicesLocalizer();
    v0[15] = v30;
    v0[16] = (uint64_t)&protocol witness table for LocalizedStringsBundle;
    unint64_t v38 = sub_10002A9DC(v0 + 12);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v29 + 16))(v38, v57, v30);
    v0[10] = v37;
    v0[11] = (uint64_t)&protocol witness table for BagLanguageSource;
    uint64_t v39 = sub_10002A9DC(v0 + 7);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 16))(v39, v36, v37);
    type metadata accessor for BaseObjectGraph();
    uint64_t v40 = BaseObjectGraph.__allocating_init(name:_:)();
    v0[95] = v40;
    uint64_t v41 = (void *)swift_task_alloc();
    v0[96] = (uint64_t)v41;
    *uint64_t v41 = v0;
    v41[1] = sub_100041AE0;
    return static AppleServicesLocalizer.fetch(contentsOf:for:asPartOf:)(v0 + 12, v0 + 7, v40);
  }
}

uint64_t sub_100041AE0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 776) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = *(void *)(v4 + 320);
    swift_release();
    uint64_t v6 = sub_100042764;
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = *(void *)(v4 + 320);
    swift_release();
    *(void *)(v4 + 784) = a1;
    sub_10002AA58(v4 + 56);
    sub_10002AA58(v4 + 96);
    uint64_t v6 = sub_100041C44;
    uint64_t v7 = v8;
  }
  return _swift_task_switch(v6, v7, 0);
}

uint64_t sub_100041C44()
{
  uint64_t v25 = v0[98];
  unint64_t v19 = (void (*)(uint64_t, uint64_t))v0[94];
  uint64_t v24 = v0[76];
  uint64_t v22 = v0[75];
  uint64_t v23 = v0[74];
  uint64_t v1 = v0[72];
  uint64_t v20 = v0[71];
  uint64_t v21 = v0[73];
  uint64_t v2 = v0[60];
  uint64_t v16 = v0[59];
  uint64_t v17 = v0[61];
  uint64_t v14 = v0[52];
  uint64_t v15 = v0[55];
  uint64_t v3 = v0[50];
  uint64_t v13 = v0[51];
  uint64_t v12 = v0[49];
  uint64_t v4 = v0[47];
  uint64_t v5 = v0[44];
  uint64_t v6 = v0[45];
  uint64_t v8 = v0[42];
  uint64_t v7 = v0[43];
  uint64_t v9 = v0[41];
  uint64_t v18 = v0[40];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v13, v12);
  v19(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  *(void *)(v18 + 112) = v25;
  swift_release();
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100041F04()
{
  unint64_t v19 = v0;
  uint64_t v1 = v0[76];
  uint64_t v2 = v0[75];
  uint64_t v3 = v0[74];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    swift_getErrorValue();
    uint64_t v7 = *(void *)(v0[31] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v7 + 16))();
    uint64_t v8 = String.init<A>(describing:)();
    unint64_t v10 = v9;
    swift_task_dealloc();
    v0[36] = sub_100057B1C(v8, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed to load localization jetpack: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v11 = v0[82];
  uint64_t v12 = v0[81];
  uint64_t v13 = v0[79];
  uint64_t v14 = v0[78];
  uint64_t v15 = v0[40] + v0[85];
  Date.init()();
  swift_errorRelease();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v12);
  sub_100043620(v13, v14);
  swift_beginAccess();
  sub_100043688(v14, v15);
  swift_endAccess();
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100042310()
{
  uint64_t v25 = v0;
  uint64_t v23 = v0[76];
  uint64_t v1 = v0[75];
  uint64_t v2 = v0[74];
  uint64_t v3 = v0[73];
  uint64_t v4 = v0[72];
  uint64_t v5 = v0[71];
  uint64_t v6 = v0[60];
  uint64_t v7 = v0[61];
  uint64_t v8 = v0[59];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v23, v2);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136446210;
    swift_getErrorValue();
    uint64_t v12 = *(void *)(v0[31] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v12 + 16))();
    uint64_t v13 = String.init<A>(describing:)();
    unint64_t v15 = v14;
    swift_task_dealloc();
    v0[36] = sub_100057B1C(v13, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Failed to load localization jetpack: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v16 = v0[82];
  uint64_t v17 = v0[81];
  uint64_t v18 = v0[79];
  uint64_t v19 = v0[78];
  uint64_t v20 = v0[40] + v0[85];
  Date.init()();
  swift_errorRelease();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v17);
  sub_100043620(v18, v19);
  swift_beginAccess();
  sub_100043688(v19, v20);
  swift_endAccess();
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
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_100042764()
{
  uint64_t v37 = v0;
  uint64_t v30 = (void (*)(uint64_t, uint64_t))v0[94];
  uint64_t v34 = v0[74];
  uint64_t v35 = v0[76];
  uint64_t v32 = v0[73];
  uint64_t v33 = v0[75];
  uint64_t v1 = v0[72];
  uint64_t v31 = v0[71];
  uint64_t v2 = v0[60];
  uint64_t v28 = v0[59];
  uint64_t v29 = v0[61];
  uint64_t v26 = v0[52];
  uint64_t v27 = v0[55];
  uint64_t v3 = v0[50];
  uint64_t v25 = v0[51];
  uint64_t v24 = v0[49];
  uint64_t v4 = v0[47];
  uint64_t v5 = v0[44];
  uint64_t v6 = v0[45];
  uint64_t v7 = v0[42];
  uint64_t v8 = v0[43];
  uint64_t v9 = v0[41];
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v25, v24);
  v30(v27, v26);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v29, v28);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v32, v31);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v34);
  sub_10002AA58((uint64_t)(v0 + 7));
  sub_10002AA58((uint64_t)(v0 + 12));
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    swift_getErrorValue();
    uint64_t v13 = *(void *)(v0[31] - 8);
    swift_task_alloc();
    (*(void (**)(void))(v13 + 16))();
    uint64_t v14 = String.init<A>(describing:)();
    unint64_t v16 = v15;
    swift_task_dealloc();
    v0[36] = sub_100057B1C(v14, v16, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to load localization jetpack: %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v17 = v0[82];
  uint64_t v18 = v0[81];
  uint64_t v19 = v0[79];
  uint64_t v20 = v0[78];
  uint64_t v21 = v0[40] + v0[85];
  Date.init()();
  swift_errorRelease();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v17 + 56))(v19, 0, 1, v18);
  sub_100043620(v19, v20);
  swift_beginAccess();
  sub_100043688(v20, v21);
  swift_endAccess();
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
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_100042C74(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = type metadata accessor for LocalizerLookupStrategy();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return _swift_task_switch(sub_100042D34, v1, 0);
}

uint64_t sub_100042D34()
{
  v0[2] = sub_100006FC8();
  v0[3] = v1;
  v0[9] = v1;
  v0[10] = sub_10000739C();
  v0[11] = sub_100006B58();
  v0[12] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[13] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100042DE4;
  return sub_10004007C();
}

uint64_t sub_100042DE4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return _swift_task_switch(sub_100042EF4, v1, 0);
}

uint64_t sub_100042EF4()
{
  if (*(void *)(v0[5] + 112))
  {
    uint64_t v2 = v0[7];
    uint64_t v1 = v0[8];
    uint64_t v3 = v0[6];
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for LocalizerLookupStrategy.default(_:), v3);
    swift_retain();
    uint64_t v4 = AppleServicesLocalizer.string(forKey:with:using:)();
    uint64_t v6 = v5;
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    v7._countAndFlagsBits = v4;
    v7._object = v6;
    Swift::Bool v8 = AppleServicesLocalizer.isLocalizedString(_:)(v7);
    uint64_t v9 = v0[12];
    if (v8)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    uint64_t v12 = v0[10];
    uint64_t v11 = v0[11];
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1000432E4(v11, v9, v12);
    uint64_t v6 = v13;
    swift_release();
  }
  else
  {
    uint64_t v4 = sub_1000432E4(v0[11], v0[12], v0[10]);
    uint64_t v6 = v10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v6)
  {
    uint64_t v4 = sub_100006B58();
    uint64_t v6 = v14;
  }
LABEL_8:
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(uint64_t, void *))v0[1];
  return v15(v4, v6);
}

uint64_t sub_1000430A4()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_url;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1000435C0(v0 + OBJC_IVAR____TtC26AppDistributionLaunchAngel19LocalizationJetPack_lastFailedLoadAttempt);
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t sub_100043140()
{
  return type metadata accessor for LocalizationJetPack();
}

uint64_t type metadata accessor for LocalizationJetPack()
{
  uint64_t result = qword_100076208;
  if (!qword_100076208) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100043194()
{
  type metadata accessor for URL();
  if (v0 <= 0x3F)
  {
    sub_100043280();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100043280()
{
  if (!qword_100076228)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100076228);
    }
  }
}

uint64_t sub_1000432D8()
{
  return v0;
}

uint64_t sub_1000432E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3 || !a2)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v20 = a3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v21 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_7;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v17 >= v21) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v21) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v21) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_7:
    uint64_t v12 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = (void *)v12[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15._countAndFlagsBits = v13;
    v15._object = v14;
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    v16._countAndFlagsBits = 16448;
    v16._object = (void *)0xE200000000000000;
    String.append(_:)(v16);
    sub_100023BC4();
    a1 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v21)
  {
LABEL_24:
    swift_release();
    return a1;
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v21) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100043558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100076320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000435C0(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100076320);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100043620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100076320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100043688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100076320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000436F0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100043738(uint64_t a1, void *a2, void *a3)
{
  sub_10002AAB0((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_100007978(&qword_100076340);
    CheckedContinuation.resume(throwing:)();
  }
  else if (a2)
  {
    id v6 = a2;
    sub_100007978(&qword_100076340);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000437DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[20] = a2;
  v3[21] = a3;
  v3[19] = a1;
  uint64_t v4 = sub_100007978(&qword_100076340);
  v3[22] = v4;
  v3[23] = *(void *)(v4 - 8);
  v3[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000438A4, 0, 0);
}

uint64_t sub_1000438A4()
{
  id v1 = (id)SBSCreateOpenApplicationService();
  v0[25] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v0[23];
    uint64_t v4 = v0[24];
    uint64_t v5 = v0[22];
    uint64_t v9 = v0[21];
    NSString v6 = String._bridgeToObjectiveC()();
    v0[26] = v6;
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_100043A68;
    swift_continuation_init();
    v0[17] = v5;
    unint64_t v7 = sub_10002A9DC(v0 + 14);
    sub_100045794();
    sub_100007978(&qword_100076350);
    CheckedContinuation.init(continuation:function:)();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(v7, v4, v5);
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 1107296256;
    v0[12] = sub_100043738;
    v0[13] = &unk_10006EFF8;
    [v2 openApplication:v6 withOptions:v9];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_100043A68()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 216) = v1;
  if (v1) {
    uint64_t v2 = sub_100043BF4;
  }
  else {
    uint64_t v2 = sub_100043B78;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100043B78()
{
  uint64_t v1 = *(void **)(v0 + 208);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100043BF4()
{
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = (void *)v0[25];
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_100043C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 264) = a5;
  *(void *)(v5 + 160) = a3;
  *(void *)(v5 + 168) = a4;
  *(void *)(v5 + 144) = a1;
  *(void *)(v5 + 152) = a2;
  uint64_t v6 = type metadata accessor for MarketplaceDisplayOption();
  *(void *)(v5 + 176) = v6;
  *(void *)(v5 + 184) = *(void *)(v6 - 8);
  *(void *)(v5 + 192) = swift_task_alloc();
  sub_100007978((uint64_t *)&unk_1000755C0);
  *(void *)(v5 + 200) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for URL();
  *(void *)(v5 + 208) = v7;
  *(void *)(v5 + 216) = *(void *)(v7 - 8);
  *(void *)(v5 + 224) = swift_task_alloc();
  return _swift_task_switch(sub_100043DD0, 0, 0);
}

id sub_100043DD0()
{
  if (*(void *)(v0 + 144) == 0xD000000000000012 && *(void *)(v0 + 152) == 0x800000010005F100
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v1 = *(void *)(v0 + 208);
    uint64_t v2 = *(void *)(v0 + 216);
    uint64_t v3 = *(void *)(v0 + 200);
    uint64_t v4 = *(void *)(v0 + 160);
    _StringGuts.grow(_:)(36);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 136) = v4;
    v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 0x383D746D3FLL;
    v6._object = (void *)0xE500000000000000;
    String.append(_:)(v6);
    URL.init(string:)();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
    {
      sub_10003F174(*(void *)(v0 + 200));
    }
    else
    {
      (*(void (**)(void, void, void))(*(void *)(v0 + 216) + 32))(*(void *)(v0 + 224), *(void *)(v0 + 200), *(void *)(v0 + 208));
      id result = [self defaultWorkspace];
      if (!result)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = result;
      uint64_t v11 = *(void *)(v0 + 216);
      uint64_t v10 = *(void *)(v0 + 224);
      uint64_t v12 = *(void *)(v0 + 208);
      URL._bridgeToObjectiveC()(v8);
      uint64_t v14 = v13;
      [v9 openSensitiveURL:v13 withOptions:0];

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    Swift::String v15 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v15();
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v17 = *(void *)(v0 + 192);
    uint64_t v18 = *(void *)(v0 + 176);
    char v19 = *(unsigned char *)(v0 + 264);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)(v0 + 160);
    *(unsigned char *)(v17 + 16) = v19 & 1;
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v17, enum case for MarketplaceDisplayOption.productPage(_:), v18);
    type metadata accessor for MarketplaceSceneConnectionOptionDefinition();
    sub_1000457EC();
    uint64_t v20 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)();
    *(void *)(v0 + 232) = v20;
    int64_t v21 = (void *)v20;
    (*(void (**)(void, void))(*(void *)(v0 + 184) + 8))(*(void *)(v0 + 192), *(void *)(v0 + 176));
    sub_100007978(&qword_100074FC0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
    *(void *)(v0 + 120) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v0 + 128) = v23;
    AnyHashable.init<A>(_:)();
    sub_100007978((uint64_t *)&unk_100074FA0);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_10005BA50;
    *(void *)(v24 + 32) = v21;
    uint64_t v31 = v24;
    specialized Array._endMutation()();
    *(void *)(inited + 96) = sub_100007978(&qword_100076368);
    *(void *)(inited + 72) = v31;
    id v25 = v21;
    sub_10004DF60(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v27 = [self optionsWithDictionary:isa];
    *(void *)(v0 + 240) = v27;

    uint64_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v28;
    *uint64_t v28 = v0;
    v28[1] = sub_100044270;
    uint64_t v30 = *(void *)(v0 + 144);
    uint64_t v29 = *(void *)(v0 + 152);
    return (id)sub_1000437DC(v30, v29, (uint64_t)v27);
  }
}

uint64_t sub_100044270()
{
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100044408;
  }
  else {
    uint64_t v2 = sub_100044384;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100044384()
{
  uint64_t v1 = *(void **)(v0 + 232);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100044408()
{
  uint64_t v1 = *(void **)(v0 + 232);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100044494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[21] = a3;
  v4[22] = a4;
  v4[19] = a1;
  v4[20] = a2;
  uint64_t v5 = type metadata accessor for MarketplaceDisplayOption();
  v4[23] = v5;
  v4[24] = *(void *)(v5 - 8);
  v4[25] = swift_task_alloc();
  sub_100007978((uint64_t *)&unk_1000755C0);
  v4[26] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for URL();
  v4[27] = v6;
  v4[28] = *(void *)(v6 - 8);
  v4[29] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for CharacterSet();
  v4[30] = v7;
  v4[31] = *(void *)(v7 - 8);
  v4[32] = swift_task_alloc();
  return _swift_task_switch(sub_100044640, 0, 0);
}

id sub_100044640()
{
  if (v0[19] == 0xD000000000000012 && v0[20] == 0x800000010005F100
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v2 = v0[31];
    uint64_t v1 = v0[32];
    uint64_t v3 = v0[30];
    uint64_t v4 = v0[22];
    v0[17] = v0[21];
    v0[18] = v4;
    static CharacterSet.urlQueryAllowed.getter();
    sub_100023BC4();
    uint64_t v5 = StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
    uint64_t v7 = v6;
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    if (v7)
    {
      uint64_t v8 = v0[27];
      uint64_t v9 = v0[28];
      uint64_t v10 = v0[26];
      _StringGuts.grow(_:)(34);
      swift_bridgeObjectRelease();
      v11._countAndFlagsBits = v5;
      v11._object = v7;
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      URL.init(string:)();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8) == 1)
      {
        sub_10003F174(v0[26]);
      }
      else
      {
        (*(void (**)(void, void, void))(v0[28] + 32))(v0[29], v0[26], v0[27]);
        id result = [self defaultWorkspace];
        if (!result)
        {
          __break(1u);
          return result;
        }
        char v19 = result;
        uint64_t v21 = v0[28];
        uint64_t v20 = v0[29];
        uint64_t v22 = v0[27];
        URL._bridgeToObjectiveC()(v18);
        uint64_t v24 = v23;
        [v19 openSensitiveURL:v23 withOptions:0];

        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v25 = (uint64_t (*)(void))v0[1];
    return (id)v25();
  }
  else
  {
    uint64_t v12 = v0[24];
    uint64_t v13 = (void *)v0[25];
    uint64_t v15 = v0[22];
    uint64_t v14 = v0[23];
    *uint64_t v13 = v0[21];
    v13[1] = v15;
    (*(void (**)(void *, void, uint64_t))(v12 + 104))(v13, enum case for MarketplaceDisplayOption.searchResults(_:), v14);
    type metadata accessor for MarketplaceSceneConnectionOptionDefinition();
    sub_1000457EC();
    swift_bridgeObjectRetain();
    uint64_t v16 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)();
    v0[33] = v16;
    uint64_t v26 = (void *)v16;
    (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
    sub_100007978(&qword_100074FC0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
    v0[15] = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v0[16] = v28;
    AnyHashable.init<A>(_:)();
    sub_100007978((uint64_t *)&unk_100074FA0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10005BA50;
    *(void *)(v29 + 32) = v26;
    uint64_t v36 = v29;
    specialized Array._endMutation()();
    *(void *)(inited + 96) = sub_100007978(&qword_100076368);
    *(void *)(inited + 72) = v36;
    id v30 = v26;
    sub_10004DF60(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v32 = [self optionsWithDictionary:isa];
    v0[34] = v32;

    uint64_t v33 = (void *)swift_task_alloc();
    v0[35] = v33;
    *uint64_t v33 = v0;
    v33[1] = sub_100044B18;
    uint64_t v35 = v0[19];
    uint64_t v34 = v0[20];
    return (id)sub_1000437DC(v35, v34, (uint64_t)v32);
  }
}

uint64_t sub_100044B18()
{
  *(void *)(*(void *)v1 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100044CC4;
  }
  else {
    uint64_t v2 = sub_100044C2C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100044C2C()
{
  uint64_t v1 = *(void **)(v0 + 264);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100044CC4()
{
  uint64_t v1 = *(void **)(v0 + 264);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100044D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[19] = a3;
  v4[20] = a4;
  v4[17] = a1;
  v4[18] = a2;
  uint64_t v5 = type metadata accessor for MarketplaceDisplayOption();
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  return _swift_task_switch(sub_100044E20, 0, 0);
}

uint64_t sub_100044E20()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = (void *)v0[23];
  uint64_t v4 = v0[20];
  uint64_t v3 = v0[21];
  void *v2 = v0[19];
  v2[1] = v4;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v2, enum case for MarketplaceDisplayOption.authentication(_:), v3);
  type metadata accessor for MarketplaceSceneConnectionOptionDefinition();
  sub_1000457EC();
  swift_bridgeObjectRetain();
  uint64_t v5 = static UISceneConnectionOptionDefinition.createAction(payload:responder:)();
  v0[24] = v5;
  uint64_t v6 = (void *)v5;
  (*(void (**)(void, void))(v0[22] + 8))(v0[23], v0[21]);
  sub_100007978(&qword_100074FC0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
  v0[15] = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v0[16] = v8;
  AnyHashable.init<A>(_:)();
  sub_100007978((uint64_t *)&unk_100074FA0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10005BA50;
  *(void *)(v9 + 32) = v6;
  uint64_t v17 = v9;
  specialized Array._endMutation()();
  *(void *)(inited + 96) = sub_100007978(&qword_100076368);
  *(void *)(inited + 72) = v17;
  id v10 = v6;
  sub_10004DF60(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [self optionsWithDictionary:isa];
  v0[25] = v12;

  uint64_t v13 = (void *)swift_task_alloc();
  v0[26] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1000450CC;
  uint64_t v15 = v0[17];
  uint64_t v14 = v0[18];
  return sub_1000437DC(v15, v14, (uint64_t)v12);
}

uint64_t sub_1000450CC()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100045254;
  }
  else {
    uint64_t v2 = sub_1000451E0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000451E0()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100045254()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_1000452C4(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_100045354, 0, 0);
}

uint64_t sub_100045354()
{
  uint64_t v1 = v0[3];
  id v2 = objc_allocWithZone((Class)LSApplicationRecord);
  v0[2] = 0;
  id v3 = [v2 initWithStoreItemIdentifier:v1 error:v0 + 2];
  v0[4] = v3;
  uint64_t v4 = (void *)v0[2];
  if (v3)
  {
    uint64_t v5 = v3;
    id v6 = v4;
    id v7 = [v5 bundleIdentifier];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      v0[5] = v11;
      id v12 = (void *)swift_task_alloc();
      v0[6] = v12;
      *id v12 = v0;
      v12[1] = sub_10004552C;
      return sub_1000437DC(v9, v11, 0);
    }

    uint64_t v15 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    id v14 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v15 = (uint64_t (*)(void))v0[1];
  }
  return v15();
}

uint64_t sub_10004552C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_100045700;
  }
  else {
    id v2 = sub_10004566C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10004566C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  swift_bridgeObjectRelease();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100045700()
{
  uint64_t v1 = *(void **)(v0 + 32);
  swift_bridgeObjectRelease();

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_100045794()
{
  unint64_t result = qword_100076348;
  if (!qword_100076348)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100076348);
  }
  return result;
}

uint64_t sub_1000457D4(uint64_t a1, uint64_t a2)
{
  return sub_1000183B0(a2 + 32, a1 + 32);
}

uint64_t sub_1000457E4(uint64_t a1)
{
  return sub_10002AA58(a1 + 32);
}

unint64_t sub_1000457EC()
{
  unint64_t result = qword_100076360;
  if (!qword_100076360)
  {
    type metadata accessor for MarketplaceSceneConnectionOptionDefinition();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100076360);
  }
  return result;
}

uint64_t sub_100045844()
{
  *(void *)(v1 + 32) = v0;
  return _swift_task_switch(sub_100045864, 0, 0);
}

uint64_t sub_100045864()
{
  uint64_t v1 = (void *)v0;
  if (qword_100074B50 != -1) {
    swift_once();
  }
  id v2 = (void *)(v0 + 24);
  uint64_t v4 = (void **)(v0 + 32);
  id v3 = (void *)v1[4];
  uint64_t v5 = type metadata accessor for Logger();
  sub_10000AEDC(v5, (uint64_t)qword_100078088);
  id v6 = v3;
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (char *)*v4;
  if (v9)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v12 = *(void **)&v10[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    void *v2 = v12;
    id v13 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v34 = v12;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Running license resolution task", v11, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v14 = [self identityOfCurrentProcess];
  v1[5] = v14;
  uint64_t v15 = (void *)v1[4];
  if (v14)
  {
    uint64_t v16 = v14;
    id v17 = objc_allocWithZone((Class)SBSRemoteAlertDefinition);
    id v18 = v16;
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = [v17 initWithSceneProvidingProcess:v18 configurationIdentifier:v19];
    v1[6] = v20;

    uint64_t v21 = swift_task_alloc();
    v1[7] = v21;
    *(void *)(v21 + 16) = v15;
    *(void *)(v21 + 24) = v20;
    uint64_t v22 = (void *)swift_task_alloc();
    v1[8] = v22;
    *uint64_t v22 = v1;
    v22[1] = sub_100045CBC;
    return withCheckedContinuation<A>(isolation:function:_:)(v22, 0, 0, 0x29286E7572, 0xE500000000000000, sub_100047994, v21, (char *)&type metadata for () + 8);
  }
  else
  {
    id v23 = v15;
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    BOOL v26 = os_log_type_enabled(v24, v25);
    id v27 = (char *)*v4;
    if (v26)
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138412290;
      id v30 = *(void **)&v27[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
      v1[2] = v30;
      id v31 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v29 = v30;

      _os_log_impl((void *)&_mh_execute_header, v24, v25, "[%@] No identity", v28, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v32 = (uint64_t (*)(void))v1[1];
    return v32();
  }
}

uint64_t sub_100045CBC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_100045DD4, 0, 0);
}

uint64_t sub_100045DD4()
{
  uint64_t v1 = *(void **)(v0 + 48);

  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_100045E38(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v34 = a3;
  uint64_t v5 = sub_100007978(&qword_100075AA0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v36 = [objc_allocWithZone((Class)SBSRemoteAlertConfigurationContext) init];
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  uint64_t v11 = *(void (**)(unint64_t, char *, uint64_t))(v6 + 32);
  uint64_t v35 = v5;
  v11(v10 + v9, v8, v5);
  uint64_t v41 = sub_100047A6C;
  uint64_t v42 = v10;
  unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
  unint64_t v38 = 1107296256;
  uint64_t v39 = sub_10001D994;
  uint64_t v40 = &unk_10006F048;
  id v12 = _Block_copy(&aBlock);
  id v13 = self;
  id v14 = a2;
  id v15 = [v13 responderWithHandler:v12];
  _Block_release(v12);
  swift_release();
  id v16 = [objc_allocWithZone((Class)BSAction) initWithInfo:0 responder:v15];
  sub_100007978((uint64_t *)&unk_100074FA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005BA50;
  *(void *)(inited + 32) = v16;
  unint64_t aBlock = inited;
  specialized Array._endMutation()();
  unint64_t v18 = aBlock;
  if (aBlock >> 62)
  {
    id v32 = v16;
    swift_bridgeObjectRetain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = *(void *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v20 = v16;
  }
  uint64_t v21 = v36;
  if (v19) {
    sub_100046A14(v18);
  }
  swift_bridgeObjectRelease();
  sub_10000D62C();
  sub_100047AFC((unint64_t *)&qword_100074FB0, (void (*)(uint64_t))sub_10000D62C);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v21 setActions:isa];

  type metadata accessor for JSONEncoder();
  swift_allocObject();
  JSONEncoder.init()();
  type metadata accessor for LicenseResolutionContext();
  sub_100047AFC((unint64_t *)&unk_1000763F0, (void (*)(uint64_t))&type metadata accessor for LicenseResolutionContext);
  uint64_t v23 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v25 = v24;
  swift_release();
  sub_100007978(&qword_100074FC0);
  uint64_t v26 = swift_initStackObject();
  *(_OWORD *)(v26 + 16) = xmmword_10005B4B0;
  unint64_t aBlock = 0x44747865746E6F63;
  unint64_t v38 = 0xEB00000000617461;
  AnyHashable.init<A>(_:)();
  *(void *)(v26 + 96) = &type metadata for Data;
  *(void *)(v26 + 72) = v23;
  *(void *)(v26 + 80) = v25;
  sub_10000D6B4(v23, v25);
  sub_10004DF60(v26);
  Class v27 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v21 setUserInfo:v27];

  id v28 = [self newHandleWithDefinition:v34 configurationContext:v21];
  uint64_t v29 = *(void **)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  *(void *)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle] = v28;
  id v30 = v28;

  [v30 registerObserver:v14];
  id v31 = [objc_allocWithZone((Class)SBSRemoteAlertActivationContext) init];
  [v30 activateWithContext:v31];

  sub_10000D70C(v23, v25);
}

uint64_t sub_10004652C(uint64_t a1, void *a2)
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10000AEDC(v3, (uint64_t)qword_100078088);
  uint64_t v4 = a2;
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    uint64_t v11 = *(void **)&v4[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    id v9 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v8 = v11;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[%@] Dismissing license resolution sheet", v7, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_100007978(&qword_100075AA0);
  return CheckedContinuation.resume(returning:)();
}

id sub_100046720()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for LicenseResolutionTask();
  return [super dealloc];
}

uint64_t sub_1000467E8()
{
  return type metadata accessor for LicenseResolutionTask();
}

uint64_t type metadata accessor for LicenseResolutionTask()
{
  uint64_t result = qword_1000763C0;
  if (!qword_1000763C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004683C()
{
  uint64_t result = type metadata accessor for LicenseResolutionContext();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100046A14(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100007978(&qword_100076400);
      uint64_t v3 = (void *)static _SetStorage.allocate(capacity:)();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v42 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      BOOL v10 = __OFADD__(v8++, 1);
      if (v10)
      {
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v11 = v9;
      Swift::Int v12 = NSObject._rawHashValue(seed:)(v3[5]);
      uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
      unint64_t v14 = v12 & ~v13;
      unint64_t v15 = v14 >> 6;
      uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
      uint64_t v17 = 1 << v14;
      if (((1 << v14) & v16) != 0)
      {
        sub_10000D62C();
        id v18 = *(id *)(v3[6] + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19)
        {
LABEL_11:
          swift_unknownObjectRelease();
          goto LABEL_12;
        }
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
      }
      *(void *)&v7[8 * v15] = v17 | v16;
      *(void *)(v3[6] + 8 * v14) = v11;
      uint64_t v23 = v3[2];
      BOOL v10 = __OFADD__(v23, 1);
      uint64_t v24 = v23 + 1;
      if (v10) {
        goto LABEL_37;
      }
      v3[2] = v24;
LABEL_12:
      if (v8 == v42) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  uint64_t v41 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v41)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(a1 + 32 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_10000D62C();
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35) {
        goto LABEL_23;
      }
      uint64_t v36 = ~v29;
      unint64_t v30 = (v30 + 1) & v36;
      unint64_t v31 = v30 >> 6;
      uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
      uint64_t v33 = 1 << v30;
      if ((v32 & (1 << v30)) != 0)
      {
        while (1)
        {
          id v37 = *(id *)(v3[6] + 8 * v30);
          char v38 = static NSObject.== infix(_:_:)();

          if (v38) {
            break;
          }
          unint64_t v30 = (v30 + 1) & v36;
          unint64_t v31 = v30 >> 6;
          uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
          uint64_t v33 = 1 << v30;
          if ((v32 & (1 << v30)) == 0) {
            goto LABEL_31;
          }
        }
LABEL_23:

        uint64_t v5 = v42;
        goto LABEL_24;
      }
LABEL_31:
      uint64_t v5 = v42;
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_24:
    if (++v25 == v5) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void *sub_100046D6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MetricsFieldInclusionRequest();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100007978(&qword_100076410);
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    Swift::Int v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    char v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    unint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100047AFC(&qword_100076418, (void (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_100047AFC((unint64_t *)&unk_100076420, (void (*)(uint64_t))&type metadata accessor for MetricsFieldInclusionRequest);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

Swift::Int sub_100047084(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100007978(&qword_100076408);
    uint64_t v2 = static _SetStorage.allocate(capacity:)();
    uint64_t v3 = v2 + 56;
    while (1)
    {
      Hasher.init(_seed:)();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      unint64_t v5 = result & ~(-1 << *(unsigned char *)(v2 + 32));
      unint64_t v6 = v5 >> 6;
      uint64_t v7 = *(void *)(v3 + 8 * (v5 >> 6));
      uint64_t v8 = 1 << v5;
      if ((v8 & v7) == 0)
      {
        *(void *)(v3 + 8 * v6) = v8 | v7;
        uint64_t v9 = *(void *)(v2 + 16);
        BOOL v10 = __OFADD__(v9, 1);
        uint64_t v11 = v9 + 1;
        if (v10)
        {
          __break(1u);
          return result;
        }
        *(void *)(v2 + 16) = v11;
      }
      if (!--v1) {
        return v2;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_100047180()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  uint64_t v7 = v0;
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    unint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    id v6 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v8;

    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[%@] Remote alert did activate", v4, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100047354()
{
  if (qword_100074B50 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_100078088);
  uint64_t v2 = v0;
  os_log_type_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v5 = 138412290;
    uint64_t v11 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
    id v7 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v6 = v11;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Remote alert did deactivate", v5, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v8 = OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle;
  uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  if (v9)
  {
    [v9 unregisterObserver:v2];
    uint64_t v9 = *(void **)&v2[v8];
  }
  [v9 invalidate];
  BOOL v10 = *(void **)&v2[v8];
  *(void *)&v2[v8] = 0;
}

void sub_100047534(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle;
  os_log_type_t v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_remoteHandle];
  if (v4)
  {
    [v4 unregisterObserver:v1];
    os_log_type_t v4 = *(void **)&v1[v3];
  }
  [v4 invalidate];
  unint64_t v5 = *(void **)&v1[v3];
  *(void *)&v1[v3] = 0;

  if (a1)
  {
    swift_errorRetain();
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000AEDC(v6, (uint64_t)qword_100078088);
    swift_errorRetain();
    id v7 = v1;
    swift_errorRetain();
    uint64_t v8 = v7;
    oslog = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      id v23 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 138412546;
      Swift::Int v12 = *(void **)&v8[OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey];
      id v13 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v11 = v12;

      *(_WORD *)(v10 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      sub_100057B1C(v14, v15, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "[%@] Remote alert did invalidate with error: %{public}s", (uint8_t *)v10, 0x16u);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000AEDC(v16, (uint64_t)qword_100078088);
    oslog = v1;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v19 = 138412290;
      id v23 = *(Class *)((char *)&oslog->isa + OBJC_IVAR____TtC26AppDistributionLaunchAngel21LicenseResolutionTask_logKey);
      id v21 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v20 = v23;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[%@] Remote alert did invalidate", v19, 0xCu);
      sub_100007978(&qword_100074F88);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

void sub_100047994(uint64_t a1)
{
  sub_100045E38(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10004799C()
{
  uint64_t v1 = sub_100007978(&qword_100075AA0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100047A6C(uint64_t a1)
{
  sub_100007978(&qword_100075AA0);
  uint64_t v3 = *(void **)(v1 + 16);

  return sub_10004652C(a1, v3);
}

uint64_t sub_100047AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100047AF4()
{
  return swift_release();
}

uint64_t sub_100047AFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100047B44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    uint64_t v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    uint64_t v10 = a2[11];
    a1[10] = a2[10];
    a1[11] = v10;
    uint64_t v11 = a2[13];
    a1[12] = a2[12];
    a1[13] = v11;
    uint64_t v12 = a2[15];
    a1[14] = a2[14];
    a1[15] = v12;
    uint64_t v13 = a2[17];
    a1[16] = a2[16];
    a1[17] = v13;
    uint64_t v14 = a2[19];
    a1[18] = a2[18];
    a1[19] = v14;
    uint64_t v15 = a2[21];
    uint64_t v16 = *(int *)(a3 + 60);
    id v21 = (char *)a1 + v16;
    uint64_t v22 = (char *)a2 + v16;
    a1[20] = a2[20];
    a1[21] = v15;
    uint64_t v17 = type metadata accessor for InstallSheetContext();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
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
    v20(v21, v22, v17);
  }
  return v3;
}

uint64_t sub_100047CE8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v4 = a1 + *(int *)(a2 + 60);
  uint64_t v5 = type metadata accessor for InstallSheetContext();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100047DB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  uint64_t v14 = a2[21];
  uint64_t v15 = *(int *)(a3 + 60);
  unint64_t v19 = (char *)a1 + v15;
  uint64_t v20 = (char *)a2 + v15;
  a1[20] = a2[20];
  a1[21] = v14;
  uint64_t v16 = type metadata accessor for InstallSheetContext();
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
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
  v18(v19, v20, v16);
  return a1;
}

void *sub_100047F04(void *a1, void *a2, uint64_t a3)
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  a1[15] = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[18] = a2[18];
  a1[19] = a2[19];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[20] = a2[20];
  a1[21] = a2[21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 60);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for InstallSheetContext();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1000480E0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  long long v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  long long v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  long long v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  uint64_t v9 = *(int *)(a3 + 60);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  a1[10] = a2[10];
  uint64_t v12 = type metadata accessor for InstallSheetContext();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

void *sub_100048184(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = a2[13];
  a1[12] = a2[12];
  a1[13] = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a2[15];
  a1[14] = a2[14];
  a1[15] = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = a2[17];
  a1[16] = a2[16];
  a1[17] = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = a2[19];
  a1[18] = a2[18];
  a1[19] = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = a2[21];
  a1[20] = a2[20];
  a1[21] = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(a3 + 60);
  uint64_t v18 = (char *)a1 + v17;
  unint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = type metadata accessor for InstallSheetContext();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_1000482B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000482C4);
}

uint64_t sub_1000482C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for InstallSheetContext();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 60);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100048374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100048388);
}

uint64_t sub_100048388(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for InstallSheetContext();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 60);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LocalizedInstallSheetContent()
{
  uint64_t result = qword_100076488;
  if (!qword_100076488) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004847C()
{
  uint64_t result = type metadata accessor for InstallSheetContext();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100048528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[157] = a3;
  v3[156] = a2;
  v3[155] = a1;
  uint64_t v4 = type metadata accessor for InstallSheetContext.Source.WebInstallContext();
  v3[158] = v4;
  v3[159] = *(void *)(v4 - 8);
  v3[160] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for InstallSheetContext.InstallType();
  v3[161] = v5;
  v3[162] = *(void *)(v5 - 8);
  v3[163] = swift_task_alloc();
  v3[164] = swift_task_alloc();
  v3[165] = swift_task_alloc();
  v3[166] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for InstallSheetContext.Source();
  v3[167] = v6;
  v3[168] = *(void *)(v6 - 8);
  v3[169] = swift_task_alloc();
  return _swift_task_switch(sub_1000486D0, 0, 0);
}

uint64_t sub_1000486D0()
{
  uint64_t v1 = *(void *)(v0 + 1248);
  uint64_t v2 = *(void *)(v0 + 1240);
  uint64_t v3 = v2 + *(int *)(type metadata accessor for LocalizedInstallSheetContent() + 60);
  uint64_t v4 = type metadata accessor for InstallSheetContext();
  *(void *)(v0 + 1360) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v0 + 1368) = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v1, v4);
  *(void *)(v0 + 16) = 4;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 48) = 10;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1376) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000487F0;
  return sub_100042C74(v0 + 16);
}

uint64_t sub_1000487F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1384) = a1;
  *(void *)(v3 + 1392) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000488F4, 0, 0);
}

uint64_t sub_1000488F4()
{
  uint64_t v1 = *(void *)(v0 + 1352);
  uint64_t v2 = *(void *)(v0 + 1344);
  uint64_t v3 = *(void *)(v0 + 1336);
  String.append(_:)(*(Swift::String *)(v0 + 1384));
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 10333;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);
  v5._countAndFlagsBits = InstallSheetContext.learnMoreURL.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 41;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  *(void *)(v0 + 1400) = 91;
  *(void *)(v0 + 1408) = 0xE100000000000000;
  InstallSheetContext.source.getter();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v7 != enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    if (v7 == enum case for InstallSheetContext.Source.distributor(_:))
    {
      uint64_t v14 = *(uint64_t **)(v0 + 1352);
      (*(void (**)(uint64_t *, void))(*(void *)(v0 + 1344) + 96))(v14, *(void *)(v0 + 1336));
      uint64_t v15 = *v14;
      *(void *)(v0 + 1472) = *v14;
      uint64_t v16 = v14[1];
      *(void *)(v0 + 1480) = v16;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 536) = v15;
      *(void *)(v0 + 544) = v16;
      *(_OWORD *)(v0 + 552) = 0u;
      *(unsigned char *)(v0 + 568) = 1;
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 1488) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_100049474;
      uint64_t v13 = v0 + 536;
      goto LABEL_7;
    }
    if (v7 == enum case for InstallSheetContext.Source.web(_:))
    {
      unint64_t v19 = *(uint64_t **)(v0 + 1352);
      uint64_t v20 = *(void *)(v0 + 1328);
      uint64_t v21 = *(void *)(v0 + 1296);
      uint64_t v22 = *(void *)(v0 + 1288);
      (*(void (**)(uint64_t *, void))(*(void *)(v0 + 1344) + 96))(v19, *(void *)(v0 + 1336));
      uint64_t v24 = *v19;
      uint64_t v23 = v19[1];
      *(void *)(v0 + 1544) = v23;
      *(void *)(v0 + 1552) = v19[2];
      *(void *)(v0 + 1560) = v19[3];
      InstallSheetContext.type.getter();
      int v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 88))(v20, v22);
      if (v25 == enum case for InstallSheetContext.InstallType.app(_:))
      {
        uint64_t v10 = v0 + 416;
        *(void *)(v0 + 416) = v24;
        *(void *)(v0 + 424) = v23;
        *(void *)(v0 + 432) = 0;
        *(void *)(v0 + 440) = 0;
        *(unsigned char *)(v0 + 448) = 5;
        uint64_t v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 1568) = v11;
        *uint64_t v11 = v0;
        uint64_t v12 = sub_100049A30;
        goto LABEL_4;
      }
      if (v25 == enum case for InstallSheetContext.InstallType.marketplace(_:))
      {
        uint64_t v10 = v0 + 296;
        *(void *)(v0 + 296) = v24;
        *(void *)(v0 + 304) = v23;
        *(void *)(v0 + 312) = 0;
        *(void *)(v0 + 320) = 0;
        *(unsigned char *)(v0 + 328) = 3;
        uint64_t v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 1624) = v11;
        *uint64_t v11 = v0;
        uint64_t v12 = sub_100049FE4;
        goto LABEL_4;
      }
    }
    else if (v7 == enum case for InstallSheetContext.Source.webWithContext(_:))
    {
      uint64_t v26 = *(void *)(v0 + 1352);
      uint64_t v27 = *(void *)(v0 + 1320);
      uint64_t v28 = *(void *)(v0 + 1296);
      uint64_t v29 = *(void *)(v0 + 1288);
      uint64_t v30 = *(void *)(v0 + 1280);
      uint64_t v31 = *(void *)(v0 + 1272);
      uint64_t v32 = *(void *)(v0 + 1264);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v26, *(void *)(v0 + 1336));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v30, v26, v32);
      InstallSheetContext.type.getter();
      int v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 88))(v27, v29);
      if (v33 == enum case for InstallSheetContext.InstallType.app(_:))
      {
        uint64_t v34 = InstallSheetContext.Source.WebInstallContext.domain.getter();
        *(void *)(v0 + 1680) = v35;
        *(void *)(v0 + 176) = v34;
        uint64_t v10 = v0 + 176;
        *(void *)(v0 + 192) = 0;
        *(void *)(v0 + 200) = 0;
        *(void *)(v0 + 184) = v35;
        *(unsigned char *)(v0 + 208) = 5;
        uint64_t v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 1688) = v11;
        *uint64_t v11 = v0;
        uint64_t v12 = sub_10004A594;
        goto LABEL_4;
      }
      if (v33 == enum case for InstallSheetContext.InstallType.marketplace(_:))
      {
        uint64_t v36 = InstallSheetContext.Source.WebInstallContext.domain.getter();
        *(void *)(v0 + 1752) = v37;
        *(void *)(v0 + 56) = v36;
        uint64_t v10 = v0 + 56;
        *(void *)(v0 + 72) = 0;
        *(void *)(v0 + 80) = 0;
        *(void *)(v0 + 64) = v37;
        *(unsigned char *)(v0 + 88) = 3;
        uint64_t v11 = (void *)swift_task_alloc();
        *(void *)(v0 + 1760) = v11;
        *uint64_t v11 = v0;
        uint64_t v12 = sub_10004AB74;
        goto LABEL_4;
      }
    }
    else if (v7 == enum case for InstallSheetContext.Source.appStore(_:))
    {
      goto LABEL_3;
    }
    return _assertionFailure(_:_:file:line:flags:)();
  }
  uint64_t v8 = *(void *)(v0 + 1352);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 1344) + 96))(v8, *(void *)(v0 + 1336));
  uint64_t v9 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
LABEL_3:
  uint64_t v10 = v0 + 656;
  *(void *)(v0 + 656) = 5;
  *(void *)(v0 + 664) = 0;
  *(void *)(v0 + 680) = 0;
  *(void *)(v0 + 672) = 0;
  *(unsigned char *)(v0 + 688) = 10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 1416) = v11;
  *uint64_t v11 = v0;
  uint64_t v12 = sub_100048EF4;
LABEL_4:
  v11[1] = v12;
  uint64_t v13 = v10;
LABEL_7:
  return sub_100042C74(v13);
}

uint64_t sub_100048EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1424) = a1;
  *(void *)(v3 + 1432) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100048FF8, 0, 0);
}

uint64_t sub_100048FF8()
{
  uint64_t v1 = *(void *)(v0 + 1432);
  uint64_t v2 = *(void *)(v0 + 1408);
  uint64_t v3 = *(void *)(v0 + 1400);
  Swift::String v4 = *(void **)(v0 + 1240);
  *Swift::String v4 = *(void *)(v0 + 1424);
  v4[1] = v1;
  *(void *)(v0 + 696) = v3;
  *(void *)(v0 + 704) = v2;
  *(_OWORD *)(v0 + 712) = 0u;
  *(unsigned char *)(v0 + 728) = 0;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 1440) = v5;
  void *v5 = v0;
  v5[1] = sub_1000490C0;
  return sub_100042C74(v0 + 696);
}

uint64_t sub_1000490C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1448) = a1;
  *(void *)(v3 + 1456) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000491E4, 0, 0);
}

uint64_t sub_1000491E4()
{
  uint64_t v1 = *(void *)(v0 + 1456);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1448);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 736) = 6;
  *(void *)(v0 + 744) = 0;
  *(void *)(v0 + 760) = 0;
  *(void *)(v0 + 752) = 0;
  *(unsigned char *)(v0 + 768) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1464) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000492A8;
  return sub_100042C74(v0 + 736);
}

uint64_t sub_1000492A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[137] = v2;
  v3[138] = a1;
  v3[139] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000493B0, 0, 0);
}

uint64_t sub_1000493B0()
{
  uint64_t v1 = *(void *)(v0 + 1112);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1104);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_100049474(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1496) = a1;
  *(void *)(v3 + 1504) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100049598, 0, 0);
}

uint64_t sub_100049598()
{
  uint64_t v1 = *(void *)(v0 + 1504);
  long long v2 = *(_OWORD *)(v0 + 1472);
  uint64_t v3 = *(void *)(v0 + 1408);
  uint64_t v4 = *(void *)(v0 + 1400);
  uint64_t v5 = *(void **)(v0 + 1240);
  void *v5 = *(void *)(v0 + 1496);
  v5[1] = v1;
  *(_OWORD *)(v0 + 576) = v2;
  *(void *)(v0 + 592) = v4;
  *(void *)(v0 + 600) = v3;
  *(unsigned char *)(v0 + 608) = 2;
  Swift::String v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1512) = v6;
  *Swift::String v6 = v0;
  v6[1] = sub_100049660;
  return sub_100042C74(v0 + 576);
}

uint64_t sub_100049660(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1520) = a1;
  *(void *)(v3 + 1528) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1000497A0, 0, 0);
}

uint64_t sub_1000497A0()
{
  uint64_t v1 = *(void *)(v0 + 1528);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1520);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 616) = 6;
  *(void *)(v0 + 624) = 0;
  *(void *)(v0 + 640) = 0;
  *(void *)(v0 + 632) = 0;
  *(unsigned char *)(v0 + 648) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1536) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100049864;
  return sub_100042C74(v0 + 616);
}

uint64_t sub_100049864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[140] = v2;
  v3[141] = a1;
  v3[142] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004996C, 0, 0);
}

uint64_t sub_10004996C()
{
  uint64_t v1 = *(void *)(v0 + 1136);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1128);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_100049A30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1576) = a1;
  *(void *)(v3 + 1584) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100049B54, 0, 0);
}

uint64_t sub_100049B54()
{
  uint64_t v1 = *(void *)(v0 + 1584);
  long long v2 = *(_OWORD *)(v0 + 1552);
  uint64_t v3 = *(void *)(v0 + 1408);
  uint64_t v4 = *(void *)(v0 + 1400);
  uint64_t v5 = *(void **)(v0 + 1240);
  void *v5 = *(void *)(v0 + 1576);
  v5[1] = v1;
  *(_OWORD *)(v0 + 456) = v2;
  *(void *)(v0 + 472) = v4;
  *(void *)(v0 + 480) = v3;
  *(unsigned char *)(v0 + 488) = 6;
  Swift::String v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1592) = v6;
  *Swift::String v6 = v0;
  v6[1] = sub_100049C18;
  return sub_100042C74(v0 + 456);
}

uint64_t sub_100049C18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1600) = a1;
  *(void *)(v3 + 1608) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_100049D58, 0, 0);
}

uint64_t sub_100049D58()
{
  uint64_t v1 = *(void *)(v0 + 1608);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1600);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 496) = 6;
  *(void *)(v0 + 504) = 0;
  *(void *)(v0 + 520) = 0;
  *(void *)(v0 + 512) = 0;
  *(unsigned char *)(v0 + 528) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1616) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100049E18;
  return sub_100042C74(v0 + 496);
}

uint64_t sub_100049E18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[143] = v2;
  v3[144] = a1;
  v3[145] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_100049F20, 0, 0);
}

uint64_t sub_100049F20()
{
  uint64_t v1 = *(void *)(v0 + 1160);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1152);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_100049FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1632) = a1;
  *(void *)(v3 + 1640) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004A108, 0, 0);
}

uint64_t sub_10004A108()
{
  uint64_t v1 = *(void *)(v0 + 1640);
  long long v2 = *(_OWORD *)(v0 + 1552);
  uint64_t v3 = *(void *)(v0 + 1408);
  uint64_t v4 = *(void *)(v0 + 1400);
  uint64_t v5 = *(void **)(v0 + 1240);
  void *v5 = *(void *)(v0 + 1632);
  v5[1] = v1;
  *(_OWORD *)(v0 + 336) = v2;
  *(void *)(v0 + 352) = v4;
  *(void *)(v0 + 360) = v3;
  *(unsigned char *)(v0 + 368) = 4;
  Swift::String v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1648) = v6;
  *Swift::String v6 = v0;
  v6[1] = sub_10004A1CC;
  return sub_100042C74(v0 + 336);
}

uint64_t sub_10004A1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1656) = a1;
  *(void *)(v3 + 1664) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004A30C, 0, 0);
}

uint64_t sub_10004A30C()
{
  uint64_t v1 = *(void *)(v0 + 1664);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1656);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 376) = 7;
  *(void *)(v0 + 384) = 0;
  *(void *)(v0 + 392) = 0;
  *(void *)(v0 + 400) = 0;
  *(unsigned char *)(v0 + 408) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1672) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004A3C8;
  return sub_100042C74(v0 + 376);
}

uint64_t sub_10004A3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[146] = v2;
  v3[147] = a1;
  v3[148] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004A4D0, 0, 0);
}

uint64_t sub_10004A4D0()
{
  uint64_t v1 = *(void *)(v0 + 1184);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1176);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_10004A594(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1696) = a1;
  *(void *)(v3 + 1704) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004A6B8, 0, 0);
}

uint64_t sub_10004A6B8()
{
  uint64_t v1 = *(void *)(v0 + 1704);
  uint64_t v2 = *(void *)(v0 + 1408);
  uint64_t v3 = *(void *)(v0 + 1400);
  uint64_t v4 = *(void **)(v0 + 1240);
  *uint64_t v4 = *(void *)(v0 + 1696);
  v4[1] = v1;
  uint64_t v5 = InstallSheetContext.Source.WebInstallContext.developerName.getter();
  *(void *)(v0 + 1712) = v6;
  *(void *)(v0 + 216) = v5;
  *(void *)(v0 + 224) = v6;
  *(void *)(v0 + 232) = v3;
  *(void *)(v0 + 240) = v2;
  *(unsigned char *)(v0 + 248) = 6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 1720) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10004A790;
  return sub_100042C74(v0 + 216);
}

uint64_t sub_10004A790(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1728) = a1;
  *(void *)(v3 + 1736) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004A8D0, 0, 0);
}

uint64_t sub_10004A8D0()
{
  uint64_t v1 = *(void *)(v0 + 1736);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1728);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 256) = 6;
  *(void *)(v0 + 264) = 0;
  *(void *)(v0 + 272) = 0;
  *(void *)(v0 + 280) = 0;
  *(unsigned char *)(v0 + 288) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1744) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004A98C;
  return sub_100042C74(v0 + 256);
}

uint64_t sub_10004A98C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[149] = v2;
  v3[150] = a1;
  v3[151] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004AA94, 0, 0);
}

uint64_t sub_10004AA94()
{
  (*(void (**)(void, void))(*(void *)(v0 + 1272) + 8))(*(void *)(v0 + 1280), *(void *)(v0 + 1264));
  uint64_t v1 = *(void *)(v0 + 1208);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1200);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_10004AB74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1768) = a1;
  *(void *)(v3 + 1776) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004AC98, 0, 0);
}

uint64_t sub_10004AC98()
{
  uint64_t v1 = *(void *)(v0 + 1776);
  uint64_t v2 = *(void *)(v0 + 1408);
  uint64_t v3 = *(void *)(v0 + 1400);
  uint64_t v4 = *(void **)(v0 + 1240);
  *uint64_t v4 = *(void *)(v0 + 1768);
  v4[1] = v1;
  uint64_t v5 = InstallSheetContext.Source.WebInstallContext.developerName.getter();
  *(void *)(v0 + 1784) = v6;
  *(void *)(v0 + 96) = v5;
  *(void *)(v0 + 104) = v6;
  *(void *)(v0 + 112) = v3;
  *(void *)(v0 + 120) = v2;
  *(unsigned char *)(v0 + 128) = 4;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 1792) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_10004AD70;
  return sub_100042C74(v0 + 96);
}

uint64_t sub_10004AD70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1800) = a1;
  *(void *)(v3 + 1808) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10004AEB0, 0, 0);
}

uint64_t sub_10004AEB0()
{
  uint64_t v1 = *(void *)(v0 + 1808);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 16) = *(void *)(v0 + 1800);
  *(void *)(v2 + 24) = v1;
  *(void *)(v0 + 136) = 7;
  *(void *)(v0 + 152) = 0;
  *(void *)(v0 + 160) = 0;
  *(void *)(v0 + 144) = 0;
  *(unsigned char *)(v0 + 168) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1816) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004AF70;
  return sub_100042C74(v0 + 136);
}

uint64_t sub_10004AF70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)*v2;
  v3[152] = v2;
  v3[153] = a1;
  v3[154] = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B078, 0, 0);
}

uint64_t sub_10004B078()
{
  (*(void (**)(void, void))(*(void *)(v0 + 1272) + 8))(*(void *)(v0 + 1280), *(void *)(v0 + 1264));
  uint64_t v1 = *(void *)(v0 + 1232);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 32) = *(void *)(v0 + 1224);
  *(void *)(v2 + 40) = v1;
  *(void *)(v0 + 776) = 1;
  *(void *)(v0 + 784) = 0;
  *(void *)(v0 + 800) = 0;
  *(void *)(v0 + 792) = 0;
  *(unsigned char *)(v0 + 808) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1824) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B158;
  return sub_100042C74(v0 + 776);
}

uint64_t sub_10004B158(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1832) = a1;
  *(void *)(v3 + 1840) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B25C, 0, 0);
}

uint64_t sub_10004B25C()
{
  uint64_t v1 = *(void *)(v0 + 1840);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 48) = *(void *)(v0 + 1832);
  *(void *)(v2 + 56) = v1;
  *(void *)(v0 + 816) = 9;
  *(void *)(v0 + 824) = 0;
  *(void *)(v0 + 840) = 0;
  *(void *)(v0 + 832) = 0;
  *(unsigned char *)(v0 + 848) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1848) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B320;
  return sub_100042C74(v0 + 816);
}

uint64_t sub_10004B320(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1856) = a1;
  *(void *)(v3 + 1864) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B424, 0, 0);
}

uint64_t sub_10004B424()
{
  uint64_t v1 = *(void *)(v0 + 1864);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 64) = *(void *)(v0 + 1856);
  *(void *)(v2 + 72) = v1;
  *(void *)(v0 + 856) = 10;
  *(void *)(v0 + 864) = 0;
  *(void *)(v0 + 880) = 0;
  *(void *)(v0 + 872) = 0;
  *(unsigned char *)(v0 + 888) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1872) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B4E4;
  return sub_100042C74(v0 + 856);
}

uint64_t sub_10004B4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1880) = a1;
  *(void *)(v3 + 1888) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B5E8, 0, 0);
}

uint64_t sub_10004B5E8()
{
  uint64_t v1 = *(void *)(v0 + 1888);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 80) = *(void *)(v0 + 1880);
  *(void *)(v2 + 88) = v1;
  *(void *)(v0 + 896) = 2;
  *(void *)(v0 + 904) = 0;
  *(void *)(v0 + 920) = 0;
  *(void *)(v0 + 912) = 0;
  *(unsigned char *)(v0 + 928) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1896) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B6AC;
  return sub_100042C74(v0 + 896);
}

uint64_t sub_10004B6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1904) = a1;
  *(void *)(v3 + 1912) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B7B0, 0, 0);
}

uint64_t sub_10004B7B0()
{
  uint64_t v1 = *(void *)(v0 + 1912);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 96) = *(void *)(v0 + 1904);
  *(void *)(v2 + 104) = v1;
  *(void *)(v0 + 936) = 11;
  *(void *)(v0 + 944) = 0;
  *(void *)(v0 + 960) = 0;
  *(void *)(v0 + 952) = 0;
  *(unsigned char *)(v0 + 968) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 1920) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004B874;
  return sub_100042C74(v0 + 936);
}

uint64_t sub_10004B874(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1928) = a1;
  *(void *)(v3 + 1936) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004B978, 0, 0);
}

uint64_t sub_10004B978()
{
  uint64_t v1 = *(void *)(v0 + 1936);
  uint64_t v2 = *(void *)(v0 + 1312);
  uint64_t v3 = *(void *)(v0 + 1304);
  uint64_t v4 = *(void *)(v0 + 1296);
  uint64_t v5 = *(void *)(v0 + 1288);
  uint64_t v6 = *(void *)(v0 + 1240);
  *(void *)(v6 + 112) = *(void *)(v0 + 1928);
  *(void *)(v6 + 120) = v1;
  InstallSheetContext.type.getter();
  *(_DWORD *)(v0 + 52) = enum case for InstallSheetContext.InstallType.marketplace(_:);
  uint64_t v7 = *(void (**)(uint64_t))(v4 + 104);
  *(void *)(v0 + 1944) = v7;
  *(void *)(v0 + 1952) = (v4 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  v7(v3);
  char v8 = static InstallSheetContext.InstallType.== infix(_:_:)();
  *(unsigned char *)(v0 + 49) = v8 & 1;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(void *)(v0 + 1960) = v9;
  *(void *)(v0 + 1968) = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  if (v8) {
    uint64_t v10 = 13;
  }
  else {
    uint64_t v10 = 12;
  }
  v9(v3, v5);
  v9(v2, v5);
  *(void *)(v0 + 976) = v10;
  *(void *)(v0 + 984) = 0;
  *(void *)(v0 + 1000) = 0;
  *(void *)(v0 + 992) = 0;
  *(unsigned char *)(v0 + 1008) = 10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 1976) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10004BB00;
  return sub_100042C74(v0 + 976);
}

uint64_t sub_10004BB00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (*(unsigned char *)(*v2 + 49)) {
    uint64_t v4 = 13;
  }
  else {
    uint64_t v4 = 12;
  }
  *(void *)(v3 + 1984) = a1;
  *(void *)(v3 + 1992) = a2;
  swift_task_dealloc();
  sub_100007AC8(v4, 0, 0, 0, 0xAu);
  return _swift_task_switch(sub_10004BC30, 0, 0);
}

uint64_t sub_10004BC30()
{
  uint64_t v1 = *(void *)(v0 + 1992);
  uint64_t v2 = *(void *)(v0 + 1240);
  *(void *)(v2 + 128) = *(void *)(v0 + 1984);
  *(void *)(v2 + 136) = v1;
  *(void *)(v0 + 1016) = 14;
  *(void *)(v0 + 1024) = 0;
  *(void *)(v0 + 1040) = 0;
  *(void *)(v0 + 1032) = 0;
  *(unsigned char *)(v0 + 1048) = 10;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 2000) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10004BCF4;
  return sub_100042C74(v0 + 1016);
}

uint64_t sub_10004BCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 2008) = a1;
  *(void *)(v3 + 2016) = a2;
  swift_task_dealloc();
  return _swift_task_switch(sub_10004BDF8, 0, 0);
}

uint64_t sub_10004BDF8()
{
  uint64_t v1 = *(void *)(v0 + 2016);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1960);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1944);
  uint64_t v4 = *(unsigned int *)(v0 + 52);
  uint64_t v5 = *(void *)(v0 + 1312);
  uint64_t v6 = *(void *)(v0 + 1304);
  uint64_t v7 = *(void *)(v0 + 1288);
  uint64_t v8 = *(void *)(v0 + 1240);
  *(void *)(v8 + 144) = *(void *)(v0 + 2008);
  *(void *)(v8 + 152) = v1;
  InstallSheetContext.type.getter();
  v3(v6, v4, v7);
  char v9 = static InstallSheetContext.InstallType.== infix(_:_:)();
  *(unsigned char *)(v0 + 50) = v9 & 1;
  if (v9) {
    uint64_t v10 = 16;
  }
  else {
    uint64_t v10 = 15;
  }
  v2(v6, v7);
  v2(v5, v7);
  *(void *)(v0 + 1056) = v10;
  *(void *)(v0 + 1064) = 0;
  *(void *)(v0 + 1080) = 0;
  *(void *)(v0 + 1072) = 0;
  *(unsigned char *)(v0 + 1088) = 10;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 2024) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10004BF4C;
  return sub_100042C74(v0 + 1056);
}

uint64_t sub_10004BF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  if (*(unsigned char *)(*v2 + 50)) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = 15;
  }
  *(void *)(v3 + 2032) = a1;
  *(void *)(v3 + 2040) = a2;
  swift_task_dealloc();
  sub_100007AC8(v4, 0, 0, 0, 0xAu);
  return _swift_task_switch(sub_10004C07C, 0, 0);
}

uint64_t sub_10004C07C()
{
  uint64_t v1 = v0[255];
  uint64_t v2 = v0[254];
  uint64_t v3 = v0[171];
  uint64_t v4 = v0[170];
  uint64_t v5 = v0[156];
  uint64_t v6 = v0[155];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v4);
  *(void *)(v6 + 160) = v2;
  *(void *)(v6 + 168) = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10004C180(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for TaskPriority();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10000AD8C(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_10004C300()
{
  uint64_t result = os_transaction_get_description();
  if (result) {
    return String.init(cString:)();
  }
  return result;
}

uint64_t sub_10004C330()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100007978(&qword_1000765F8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v54 = (char *)v44 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v44 - v13;
  uint64_t v15 = *(void *)(v2 + 16);
  __uint64_t v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  unint64_t timestamp = os_transaction_get_timestamp();
  if (v16 < timestamp)
  {
    __break(1u);
  }
  else
  {
    unint64_t v1 = timestamp;
    uint64_t v53 = v6;
    uint64_t v50 = v10;
    uint64_t v10 = (char *)self;
    id v18 = [v10 nanoseconds];
    sub_10004CEA4();
    Measurement.init(value:unit:)();
    if (qword_100074B58 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  uint64_t v19 = type metadata accessor for Logger();
  sub_10000AEDC(v19, (uint64_t)qword_1000780A0);
  uint64_t v21 = v53;
  uint64_t v20 = v54;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v54, v14, v53);
  swift_unknownObjectRetain_n();
  uint64_t v22 = Logger.logObject.getter();
  int v49 = static os_log_type_t.default.getter();
  BOOL v23 = os_log_type_enabled(v22, (os_log_type_t)v49);
  unint64_t v51 = v1;
  uint64_t v52 = v14;
  if (v23)
  {
    os_log_t v46 = v22;
    os_log_t v47 = v5;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v56 = v45;
    *(_DWORD *)uint64_t v24 = 33555202;
    LOWORD(v55) = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v24 + 6) = 2080;
    swift_unknownObjectRetain();
    uint64_t description = os_transaction_get_description();
    uint64_t v48 = v2;
    if (description)
    {
      uint64_t v26 = String.init(cString:)();
      unint64_t v28 = v27;
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      uint64_t v26 = 0;
      unint64_t v28 = 0xE000000000000000;
    }
    uint64_t v55 = sub_100057B1C(v26, v28, &v56);
    v44[1] = &v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 16) = 2080;
    id v31 = [v10 milliseconds:v24 + 18];
    uint64_t v32 = v50;
    uint64_t v33 = v53;
    uint64_t v34 = v54;
    Measurement<>.converted(to:)();

    uint64_t v35 = Measurement<>.formatted()();
    unint64_t v37 = v36;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v7 + 8);
    v29(v32, v33);
    uint64_t v38 = v35;
    uint64_t v30 = v33;
    uint64_t v55 = sub_100057B1C(v38, v37, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v29(v34, v33);
    os_log_t v39 = v46;
    _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v49, "[TXN%hx] 🐏 Ending transaction (%s) (%s)", (uint8_t *)v24, 0x1Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v5 = v47;
    uint64_t v2 = v48;
  }
  else
  {
    swift_unknownObjectRelease_n();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v7 + 8);
    v29(v20, v21);

    uint64_t v30 = v21;
  }
  uint64_t v40 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v5, 1, 1, v40);
  uint64_t v41 = (void *)swift_allocObject();
  v41[2] = 0;
  v41[3] = 0;
  unint64_t v42 = v51;
  v41[4] = v15;
  v41[5] = v42;
  swift_unknownObjectRetain();
  sub_10004C180((uint64_t)v5, (uint64_t)&unk_100076610, (uint64_t)v41);
  swift_release();
  v29(v52, v30);
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_10004C888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = type metadata accessor for ContinuousClock();
  v5[5] = v6;
  v5[6] = *(void *)(v6 - 8);
  v5[7] = swift_task_alloc();
  return _swift_task_switch(sub_10004C948, 0, 0);
}

uint64_t sub_10004C948()
{
  ContinuousClock.init()();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100076838 + dword_100076838);
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_10004CA10;
  return v3(0xB469471F80140000, 0, 0, 0, 1);
}

uint64_t sub_10004CA10()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  uint64_t v3 = *(void *)(*(void *)v1 + 48);
  uint64_t v4 = *(void *)(*(void *)v1 + 40);
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = sub_10004CB80;
  }
  else {
    uint64_t v5 = sub_10004CBE4;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10004CB80()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10004CBE4()
{
  uint64_t v12 = v0;
  if (qword_100074B58 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_1000780A0);
  swift_unknownObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 32);
    uint64_t v5 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 33554946;
    *(_WORD *)(v0 + 80) = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v5 + 6) = 2080;
    swift_unknownObjectRetain();
    if (os_transaction_get_description())
    {
      uint64_t v6 = String.init(cString:)();
      unint64_t v8 = v7;
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      uint64_t v6 = 0;
      unint64_t v8 = 0xE000000000000000;
    }
    *(void *)(v0 + 16) = sub_100057B1C(v6, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "[TXN%hx] 🐏 Releasing transaction (%s)", (uint8_t *)v5, 0x10u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_10004CE3C()
{
  sub_10004C330();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Transaction()
{
  return self;
}

ValueMetadata *type metadata accessor for Transaction.SendableTransaction()
{
  return &type metadata for Transaction.SendableTransaction;
}

unint64_t sub_10004CEA4()
{
  unint64_t result = qword_100076600;
  if (!qword_100076600)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_100076600);
  }
  return result;
}

uint64_t sub_10004CEE4()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10004CF24(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *unint64_t v8 = v2;
  v8[1] = sub_10000AC98;
  return sub_10004C888(a1, v4, v5, v7, v6);
}

uint64_t sub_10004CFE4(uint64_t a1)
{
  return sub_10004D064(a1, qword_100078088);
}

uint64_t sub_10004D00C(uint64_t a1)
{
  return sub_10004D064(a1, qword_1000780A0);
}

uint64_t sub_10004D02C(uint64_t a1)
{
  return sub_10004D064(a1, qword_1000780B8);
}

uint64_t sub_10004D04C(uint64_t a1)
{
  return sub_10004D064(a1, qword_1000780D0);
}

uint64_t sub_10004D064(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_10004D1AC(v3, a2);
  sub_10000AEDC(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for LogKey()
{
  return self;
}

uint64_t *sub_10004D1AC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_10004D210()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = v0;
  swift_stdlib_random();
  uint64_t v8 = 5129543;
  unint64_t v9 = 0xE300000000000000;
  int v7 = 0;
  sub_10004D2D8();
  v3._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = &v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel6LogKey_stringValue];
  *(void *)uint64_t v4 = 5129543;
  *((void *)v4 + 1) = 0xE300000000000000;

  v6.receiver = v2;
  v6.Class super_class = ObjectType;
  return [super init];
}

unint64_t sub_10004D2D8()
{
  unint64_t result = qword_100076650;
  if (!qword_100076650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100076650);
  }
  return result;
}

uint64_t *sub_10004D32C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for MetricsPipeline();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    unint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for MetricsData.Configuration();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10004D494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for MetricsData.Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10004D590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for MetricsData.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10004D6A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for MetricsData.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10004D7CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for MetricsData.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10004D8E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for MetricsData.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10004D9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004DA10);
}

uint64_t sub_10004DA10(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for MetricsPipeline();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for MetricsData.Configuration();
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_7;
  }
  unint64_t v16 = *(void *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  return (v16 + 1);
}

uint64_t sub_10004DB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004DB84);
}

uint64_t sub_10004DB84(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for MetricsPipeline();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = type metadata accessor for MetricsData.Configuration();
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t result = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
      if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
      {
        *(void *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      uint64_t v10 = result;
      uint64_t v14 = *(void *)(result - 8);
      uint64_t v15 = a4[6];
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for InstallConfirmationAppStoreMetrics()
{
  uint64_t result = qword_1000766B0;
  if (!qword_1000766B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10004DD2C()
{
  uint64_t result = type metadata accessor for MetricsPipeline();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for MetricsData.Configuration();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_10004DE3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007978(&qword_100074FD8);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
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
    unint64_t result = sub_1000502D4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
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

unint64_t sub_10004DF60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007978(&qword_1000766F8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100023C98(v6, (uint64_t)v15, &qword_100076700);
    unint64_t result = sub_10005034C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10002A9CC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_10004E0A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007978(&qword_100076708);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100023C98(v6, (uint64_t)&v15, &qword_100076720);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000502D4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10002A9CC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10004E1DC(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007978(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    long long v11 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007978(a3);
  uint64_t v10 = static _DictionaryStorage.allocate(capacity:)();
  long long v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_100023C98(v16, (uint64_t)v9, a2);
    unint64_t result = sub_100050390((uint64_t)v9);
    if (v19) {
      break;
    }
    unint64_t v20 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v21 = v11[6];
    uint64_t v22 = type metadata accessor for MetricsEventType();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v21 + *(void *)(*(void *)(v22 - 8) + 72) * v20, v9, v22);
    *(void *)(v11[7] + 8 * v20) = *(void *)&v9[v13];
    uint64_t v23 = v11[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24) {
      goto LABEL_11;
    }
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

uint64_t sub_10004E3C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for MetricsData.Configuration();
  uint64_t v78 = *(void *)(v6 - 8);
  uint64_t v79 = v6;
  __chkstk_darwin(v6);
  id v76 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MetricsPipeline.Configuration();
  uint64_t v83 = *(void *)(v8 - 8);
  uint64_t v84 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  long long v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v12 = type metadata accessor for Bag();
  uint64_t v86 = *(void *)(v12 - 8);
  uint64_t v87 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v85 = (int *)type metadata accessor for InstallConfirmationAppStoreMetrics();
  uint64_t v15 = a3 + v85[6];
  uint64_t v16 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  uint64_t v74 = *(void *)(v16 - 8);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v74 + 16);
  uint64_t v75 = v16;
  v17(v15, a2);
  uint64_t v77 = a2;
  uint64_t v18 = InstallSheetContext.Source.AppStoreSheetContext.metricsFieldData.getter();
  uint64_t v80 = a1;
  if (v19 >> 60 == 15) {
    goto LABEL_7;
  }
  uint64_t v20 = v18;
  unint64_t v21 = v19;
  uint64_t v22 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v89 = 0;
  id v24 = [v22 JSONObjectWithData:isa options:0 error:&v89];

  if (!v24)
  {
    id v27 = v89;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    sub_100053318(v20, v21);
    a1 = v80;
    swift_errorRelease();
LABEL_7:
    unint64_t v26 = sub_10004E0A4((uint64_t)&_swiftEmptyArrayStorage);
    goto LABEL_8;
  }
  id v25 = v89;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100007978(&qword_100075AE0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_100053318(v20, v21);
    goto LABEL_7;
  }
  unint64_t v26 = sub_10005315C(v88, &off_10006DED0);
  a1 = v80;
  swift_bridgeObjectRelease();
  sub_100053318(v20, v21);
  swift_arrayDestroy();
LABEL_8:
  uint64_t v71 = a3;
  *(void *)(a3 + v85[7]) = v26;
  uint64_t v28 = type metadata accessor for AMSMetricsEventRecorder();
  uint64_t v29 = v87;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v86 + 16);
  uint64_t v31 = a1;
  v30(v14, a1, v87);
  unint64_t v73 = 0x800000010005F3C0;
  uint64_t v32 = (void *)AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)();
  v30(v14, v31, v29);
  id v90 = &type metadata for InstallConfirmationAppStoreMetrics.Linter;
  id v91 = (void *)sub_100052DDC();
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
  id v90 = (ValueMetadata *)v28;
  id v91 = &protocol witness table for AMSMetricsEventRecorder;
  id v72 = v32;
  id v89 = v32;
  swift_retain();
  MetricsPipeline.Configuration.withRecorder(_:)();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v11, v84);
  sub_10002AA58((uint64_t)&v89);
  MetricsPipeline.init(from:)();
  sub_100007978(&qword_100076740);
  uint64_t v33 = (int *)(sub_100007978(&qword_100076748) - 8);
  unint64_t v34 = (*(unsigned __int8 *)(*(void *)v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v33 + 80);
  uint64_t v83 = *(void *)(*(void *)v33 + 72);
  uint64_t v35 = v83;
  uint64_t v36 = swift_allocObject();
  uint64_t v70 = v36;
  *(_OWORD *)(v36 + 16) = xmmword_10005BF20;
  unint64_t v37 = v36 + v34;
  unint64_t v64 = v37;
  uint64_t v38 = v33[14];
  static MetricsEventType.click.getter();
  *(void *)(v37 + v38) = &_swiftEmptySetSingleton;
  uint64_t v39 = v37 + v35;
  uint64_t v68 = v33[14];
  static MetricsEventType.page.getter();
  uint64_t v81 = sub_100007978(&qword_100076750);
  uint64_t v84 = type metadata accessor for MetricsFieldInclusionRequest();
  uint64_t v40 = *(void *)(*(void *)(v84 - 8) + 72);
  uint64_t v41 = *(unsigned __int8 *)(*(void *)(v84 - 8) + 80);
  uint64_t v42 = (v41 + 32) & ~v41;
  uint64_t v67 = 2 * v40;
  uint64_t v69 = v42 + 3 * v40;
  uint64_t v82 = v41 | 7;
  uint64_t v43 = swift_allocObject();
  long long v66 = xmmword_10005BEF0;
  *(_OWORD *)(v43 + 16) = xmmword_10005BEF0;
  static MetricsFieldInclusionRequest.pageFields.getter();
  uint64_t v44 = v40;
  uint64_t v63 = v40;
  static MetricsFieldInclusionRequest.pageReferrer.getter();
  static MetricsFieldInclusionRequest.crossfireReferral.getter();
  uint64_t v45 = sub_100046D6C(v43);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *(void *)(v39 + v68) = v45;
  uint64_t v46 = v83;
  unint64_t v47 = v64;
  uint64_t v62 = v33[14];
  static MetricsEventType.search.getter();
  uint64_t v61 = v42;
  uint64_t v68 = v42 + v44;
  uint64_t v48 = swift_allocObject();
  long long v65 = xmmword_10005B4B0;
  *(_OWORD *)(v48 + 16) = xmmword_10005B4B0;
  static MetricsFieldInclusionRequest.pageReferrer.getter();
  int v49 = sub_100046D6C(v48);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *(void *)(v47 + 2 * v46 + v62) = v49;
  uint64_t v50 = v33[14];
  static MetricsEventType.impressions.getter();
  uint64_t v51 = swift_allocObject();
  *(_OWORD *)(v51 + 16) = v66;
  static MetricsFieldInclusionRequest.impressions.getter();
  static MetricsFieldInclusionRequest.pageFields.getter();
  static MetricsFieldInclusionRequest.pageReferrer.getter();
  uint64_t v52 = sub_100046D6C(v51);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *(void *)(v47 + 3 * v46 + v50) = v52;
  uint64_t v53 = v83;
  uint64_t v54 = v33[14];
  static MetricsEventType.media.getter();
  *(void *)(v47 + 4 * v53 + v54) = &_swiftEmptySetSingleton;
  unint64_t v55 = v47 + 5 * v53;
  uint64_t v56 = v33[14];
  static MetricsEventType.pageRender.getter();
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = v65;
  static MetricsFieldInclusionRequest.pageFields.getter();
  uint64_t v58 = sub_100046D6C(v57);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *(void *)(v55 + v56) = v58;
  sub_10004E1DC(v70, &qword_100076748, &qword_100076778);
  sub_10004E1DC((uint64_t)&_swiftEmptyArrayStorage, &qword_100076758, &qword_100076760);
  uint64_t v59 = v76;
  MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v77, v75);
  (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v80, v87);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v78 + 32))(v71 + v85[5], v59, v79);
}

uint64_t sub_10004ED9C()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  return 1;
}

uint64_t sub_10004EE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[43] = v17;
  v9[44] = v8;
  v9[41] = a7;
  v9[42] = a8;
  v9[39] = a5;
  v9[40] = a6;
  v9[37] = a3;
  v9[38] = a4;
  v9[35] = a1;
  v9[36] = a2;
  uint64_t v10 = type metadata accessor for MetricsFieldsContext();
  v9[45] = v10;
  v9[46] = *(void *)(v10 - 8);
  v9[47] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for LintedMetricsEvent();
  v9[48] = v11;
  v9[49] = *(void *)(v11 - 8);
  v9[50] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for MetricsData();
  v9[51] = v12;
  v9[52] = *(void *)(v12 - 8);
  v9[53] = swift_task_alloc();
  v9[54] = type metadata accessor for MainActor();
  v9[55] = static MainActor.shared.getter();
  uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter();
  v9[56] = v14;
  v9[57] = v13;
  return _swift_task_switch(sub_10004EFEC, v14, v13);
}

uint64_t sub_10004EFEC()
{
  uint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 304);
  uint64_t v3 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 296);
  type metadata accessor for InstallConfirmationAppStoreMetrics();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  sub_10004F788(v6, v1);
  *(void *)(v0 + 40) = &type metadata for String;
  *(void *)(v0 + 16) = v3;
  *(void *)(v0 + 24) = v2;
  sub_10002A9CC((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1000525AC((_OWORD *)(v0 + 48), 0x79546E6F69746361, 0xEA00000000006570, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 104) = &type metadata for String;
  *(void *)(v0 + 80) = v5;
  *(void *)(v0 + 88) = v4;
  sub_10002A9CC((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 112));
  swift_bridgeObjectRetain();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_1000525AC((_OWORD *)(v0 + 112), 0x644965676170, 0xE600000000000000, v8);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 168) = &type metadata for String;
  *(void *)(v0 + 144) = 0x6C61646F4DLL;
  *(void *)(v0 + 152) = 0xE500000000000000;
  sub_10002A9CC((_OWORD *)(v0 + 144), (_OWORD *)(v0 + 176));
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  sub_1000525AC((_OWORD *)(v0 + 176), 0x7073694465676170, 0xEF6570795479616CLL, v9);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 232) = &type metadata for String;
  *(void *)(v0 + 208) = 0x6174736E49707041;
  *(void *)(v0 + 216) = 0xEA00000000006C6CLL;
  sub_10002A9CC((_OWORD *)(v0 + 208), (_OWORD *)(v0 + 240));
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_1000525AC((_OWORD *)(v0 + 240), 0x6570795465676170, 0xE800000000000000, v10);
  swift_bridgeObjectRelease();
  static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)();
  swift_bridgeObjectRelease();
  MetricsFieldsContext.init()();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 464) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10004F2F8;
  uint64_t v12 = *(void *)(v0 + 424);
  uint64_t v13 = *(void *)(v0 + 400);
  uint64_t v14 = *(void *)(v0 + 376);
  return MetricsPipeline.process(_:using:)(v13, v12, v14);
}

uint64_t sub_10004F2F8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[46] + 8))(v2[47], v2[45]);
    uint64_t v3 = v2[56];
    uint64_t v4 = v2[57];
    uint64_t v5 = sub_10004F500;
  }
  else
  {
    uint64_t v7 = v2[49];
    uint64_t v6 = v2[50];
    uint64_t v8 = v2[48];
    (*(void (**)(void, void))(v2[46] + 8))(v2[47], v2[45]);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v3 = v2[56];
    uint64_t v4 = v2[57];
    uint64_t v5 = sub_10004F460;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10004F460()
{
  swift_release();
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10004F500()
{
  swift_release();
  if (qword_100074B60 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_1000780B8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138543362;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_errorRetain();
    swift_release();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[34] = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error recording button click: %{public}@", v4, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10004F788(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_100050968(a1, (uint64_t)sub_100052A80, 0, isUniquelyReferenced_nonNull_native, &v8, 71);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_10004F818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[28] = a4;
  v5[29] = v4;
  v5[26] = a2;
  v5[27] = a3;
  v5[25] = a1;
  uint64_t v6 = type metadata accessor for MetricsFieldsContext();
  v5[30] = v6;
  v5[31] = *(void *)(v6 - 8);
  v5[32] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for LintedMetricsEvent();
  v5[33] = v7;
  v5[34] = *(void *)(v7 - 8);
  v5[35] = swift_task_alloc();
  type metadata accessor for JSONContext();
  v5[36] = swift_task_alloc();
  type metadata accessor for JSONObject();
  v5[37] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for JSNetworkPerformanceMetrics();
  v5[38] = v8;
  v5[39] = *(void *)(v8 - 8);
  v5[40] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for MetricsData();
  v5[41] = v9;
  v5[42] = *(void *)(v9 - 8);
  v5[43] = swift_task_alloc();
  v5[44] = type metadata accessor for MainActor();
  v5[45] = static MainActor.shared.getter();
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[46] = v11;
  v5[47] = v10;
  return _swift_task_switch(sub_10004FA84, v11, v10);
}

uint64_t sub_10004FA84()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  uint64_t v5 = v0[25];
  sub_100007978(&qword_100075AD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10005BEF0;
  *(void *)(inited + 32) = 0x644965676170;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v3;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 80) = 0x6570795465676170;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v1;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x7073694465676170;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 136) = 0xEF6570795479616CLL;
  *(void *)(inited + 144) = 0x6C61646F4DLL;
  *(void *)(inited + 152) = 0xE500000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_10004E0A4(inited);
  uint64_t v8 = *(void *)(v2 + *(int *)(type metadata accessor for InstallConfirmationAppStoreMetrics() + 28));
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19[0] = v7;
  sub_100050968(v8, (uint64_t)sub_100052A80, 0, isUniquelyReferenced_nonNull_native, v19, 89);
  uint64_t v11 = v0[39];
  uint64_t v10 = v0[40];
  uint64_t v18 = v0[38];
  swift_bridgeObjectRelease();
  unint64_t v12 = sub_10004DF60((uint64_t)&_swiftEmptyArrayStorage);
  v19[3] = sub_100007978(&qword_100075AC0);
  v19[0] = v12;
  JSONObject.init(wrapping:)();
  JSONContext.init()();
  JSNetworkPerformanceMetrics.init(deserializing:using:)();
  static MetricsData.makeMetricsPageData(fields:timingMetrics:configuration:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v18);
  MetricsFieldsContext.init()();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[48] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_10004FD58;
  uint64_t v14 = v0[43];
  uint64_t v15 = v0[35];
  uint64_t v16 = v0[32];
  return MetricsPipeline.process(_:using:)(v15, v14, v16);
}

uint64_t sub_10004FD58()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[31] + 8))(v2[32], v2[30]);
    uint64_t v3 = v2[46];
    uint64_t v4 = v2[47];
    uint64_t v5 = sub_10004FF88;
  }
  else
  {
    uint64_t v7 = v2[34];
    uint64_t v6 = v2[35];
    uint64_t v8 = v2[33];
    (*(void (**)(void, void))(v2[31] + 8))(v2[32], v2[30]);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v3 = v2[46];
    uint64_t v4 = v2[47];
    uint64_t v5 = sub_10004FEC0;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10004FEC0()
{
  swift_release();
  (*(void (**)(void, void))(v0[42] + 8))(v0[43], v0[41]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_10004FF88()
{
  swift_release();
  if (qword_100074B60 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000AEDC(v1, (uint64_t)qword_1000780B8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138543362;
    static MainActor.shared.getter();
    dispatch thunk of Actor.unownedExecutor.getter();
    if ((swift_task_isCurrentExecutor() & 1) == 0) {
      swift_task_reportUnexpectedExecutor();
    }
    swift_errorRetain();
    swift_release();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[24] = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error recording page event: %{public}@", v4, 0xCu);
    sub_100007978(&qword_100074F88);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_errorRelease();
  (*(void (**)(void, void))(v0[42] + 8))(v0[43], v0[41]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_100050230()
{
  uint64_t v0 = type metadata accessor for LintedMetricsEvent();
  __chkstk_darwin(v0 - 8);
  sub_100007978(&qword_100076780);
  swift_bridgeObjectRetain();
  LintedMetricsEvent.init(fields:issues:)();
  return Promise.__allocating_init(value:)();
}

unint64_t sub_1000502D4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100050478(a1, a2, v4);
}

unint64_t sub_10005034C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10005055C(a1, v4);
}

unint64_t sub_100050390(uint64_t a1)
{
  type metadata accessor for MetricsEventType();
  sub_10005332C(&qword_100076768);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100050624(a1, v2);
}

unint64_t sub_100050414(uint64_t a1)
{
  type metadata accessor for CodingUserInfoKey();
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_1000507D0(a1, v2);
}

unint64_t sub_100050478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10005055C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100052AD4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000180B8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100050624(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for MetricsEventType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
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
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10005332C(&qword_100076770);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
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

unint64_t sub_1000507D0(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    char v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_100050968(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5, uint64_t a6)
{
  uint64_t v43 = a6;
  uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = ~v8;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = -v8;
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 64;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  else {
    uint64_t v12 = -1;
  }
  uint64_t v38 = v9;
  uint64_t v39 = 0;
  uint64_t v40 = v12 & v10;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100052B30(&v34);
  uint64_t v13 = *((void *)&v34 + 1);
  if (!*((void *)&v34 + 1))
  {
LABEL_20:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100052D0C();
    return swift_release();
  }
  while (1)
  {
    uint64_t v15 = v34;
    sub_10002A9CC(&v35, v33);
    uint64_t v16 = *a5;
    unint64_t v18 = sub_1000502D4(v15, v13);
    uint64_t v19 = *(void *)(v16 + 16);
    BOOL v20 = (v17 & 1) == 0;
    uint64_t v21 = v19 + v20;
    if (__OFADD__(v19, v20)) {
      break;
    }
    char v22 = v17;
    if (*(void *)(v16 + 24) >= v21)
    {
      if (a4)
      {
        if (v17) {
          goto LABEL_15;
        }
      }
      else
      {
        sub_100050FD0();
        if (v22) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      sub_100051AA0(v21, a4 & 1);
      unint64_t v23 = sub_1000502D4(v15, v13);
      if ((v22 & 1) != (v24 & 1)) {
        goto LABEL_23;
      }
      unint64_t v18 = v23;
      if (v22)
      {
LABEL_15:
        sub_1000183B0(*(void *)(*a5 + 56) + 32 * v18, (uint64_t)v31);
        type metadata accessor for MainActor();
        static MainActor.shared.getter();
        dispatch thunk of Actor.unownedExecutor.getter();
        if ((swift_task_isCurrentExecutor() & 1) == 0) {
          swift_task_reportUnexpectedExecutor();
        }
        sub_1000183B0((uint64_t)v31, (uint64_t)v32);
        swift_release();
        sub_10002AA58((uint64_t)v31);
        sub_10002AA58((uint64_t)v33);
        swift_bridgeObjectRelease();
        uint64_t v14 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v18);
        sub_10002AA58((uint64_t)v14);
        sub_10002A9CC(v32, v14);
        goto LABEL_7;
      }
    }
    id v25 = (void *)*a5;
    *(void *)(*a5 + 8 * (v18 >> 6) + 64) |= 1 << v18;
    unint64_t v26 = (uint64_t *)(v25[6] + 16 * v18);
    *unint64_t v26 = v15;
    v26[1] = v13;
    sub_10002A9CC(v33, (_OWORD *)(v25[7] + 32 * v18));
    uint64_t v27 = v25[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_22;
    }
    v25[2] = v29;
LABEL_7:
    sub_100052B30(&v34);
    uint64_t v13 = *((void *)&v34 + 1);
    a4 = 1;
    if (!*((void *)&v34 + 1)) {
      goto LABEL_20;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *sub_100050C2C()
{
  uint64_t v1 = v0;
  sub_100007978(&qword_100074FD8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    BOOL v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
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

void *sub_100050DE8()
{
  uint64_t v1 = v0;
  sub_100007978(&qword_1000766F8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_100052AD4(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_1000183B0(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10002A9CC(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100050FD0()
{
  uint64_t v1 = v0;
  sub_100007978(&qword_100076708);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
    sub_1000183B0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_10002A9CC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

void *sub_1000511B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CodingUserInfoKey();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007978(&qword_100076730);
  uint64_t v6 = *v0;
  uint64_t v7 = static _DictionaryStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v8;
    return result;
  }
  int64_t v22 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v23 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v25 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v24) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 32 * v16;
    sub_1000183B0(*(void *)(v6 + 56) + v18, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = sub_10002A9CC(v26, (_OWORD *)(*(void *)(v8 + 56) + v18));
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100051460(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007978(&qword_100074FD8);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
    int64_t v24 = (void *)(v5 + 64);
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
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    long long v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
    int64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *int64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100051788(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007978(&qword_1000766F8);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10002A9CC((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_100052AD4(v25, (uint64_t)&v38);
      sub_1000183B0(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10002A9CC(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100051AA0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007978(&qword_100076708);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
                  *uint64_t v34 = -1 << v32;
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
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_10002A9CC(v24, v35);
      }
      else
      {
        sub_1000183B0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
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
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_10002A9CC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100051DA0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v44 = type metadata accessor for CodingUserInfoKey();
  uint64_t v5 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100007978(&qword_100076730);
  int v45 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    long long v38 = v2;
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v40 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v13 = ~(-1 << v11);
    }
    else {
      uint64_t v13 = -1;
    }
    unint64_t v14 = v13 & v12;
    int64_t v39 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v15 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v17 = 0;
    uint64_t v42 = v8;
    uint64_t v43 = v7;
    while (1)
    {
      if (v14)
      {
        unint64_t v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        unint64_t v20 = v19 | (v17 << 6);
      }
      else
      {
        int64_t v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v39) {
          goto LABEL_34;
        }
        unint64_t v22 = v40[v21];
        ++v17;
        if (!v22)
        {
          int64_t v17 = v21 + 1;
          if (v21 + 1 >= v39) {
            goto LABEL_34;
          }
          unint64_t v22 = v40[v17];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v39)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v38;
              if (v45)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
                if (v36 >= 64) {
                  bzero(v40, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v40 = -1 << v36;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v40[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v17 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v39) {
                  goto LABEL_34;
                }
                unint64_t v22 = v40[v17];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v17 = v23;
          }
        }
LABEL_21:
        unint64_t v14 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 72);
      unint64_t v26 = *(void *)(v8 + 48) + v25 * v20;
      unint64_t v27 = v43;
      uint64_t v28 = v44;
      if (v45)
      {
        (*v46)(v43, v26, v44);
        sub_10002A9CC((_OWORD *)(*(void *)(v8 + 56) + 32 * v20), v47);
      }
      else
      {
        (*v41)(v43, v26, v44);
        sub_1000183B0(*(void *)(v8 + 56) + 32 * v20, (uint64_t)v47);
      }
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v30) & ~*(void *)(v15 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v15 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v18 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      (*v46)((char *)(*(void *)(v10 + 48) + v25 * v18), (unint64_t)v27, v28);
      uint64_t result = (uint64_t)sub_10002A9CC(v47, (_OWORD *)(*(void *)(v10 + 56) + 32 * v18));
      ++*(void *)(v10 + 16);
      uint64_t v5 = v24;
      uint64_t v8 = v42;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_10005219C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100007978(&qword_100076708);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v30) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v30) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v30) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v30) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v30) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    int64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1000183B0(*(void *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_10002A9CC(v33, v32);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v19;
    v28[1] = v18;
    uint64_t result = (uint64_t)sub_10002A9CC(v32, (_OWORD *)(*(void *)(v8 + 56) + 32 * v23));
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

_OWORD *sub_100052460(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_10005034C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100050DE8();
      goto LABEL_7;
    }
    sub_100051788(v13, a3 & 1);
    unint64_t v19 = sub_10005034C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_100052AD4(a2, (uint64_t)v21);
      return sub_1000528D8(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  int64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_10002AA58((uint64_t)v17);

  return sub_10002A9CC(a1, v17);
}

_OWORD *sub_1000525AC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000502D4(a2, a3);
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
      sub_100050FD0();
      goto LABEL_7;
    }
    sub_100051AA0(v15, a4 & 1);
    unint64_t v21 = sub_1000502D4(a2, a3);
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
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10002AA58((uint64_t)v19);
    return sub_10002A9CC(a1, v19);
  }
LABEL_13:
  sub_100052954(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100052700(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for CodingUserInfoKey();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_100050414(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_1000511B8();
      goto LABEL_7;
    }
    sub_100051DA0(v17, a3 & 1);
    unint64_t v23 = sub_100050414(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      char v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1000529C0(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v21 = (_OWORD *)(v20[7] + 32 * v14);
  sub_10002AA58((uint64_t)v21);

  return sub_10002A9CC(a1, v21);
}

_OWORD *sub_1000528D8(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_10002A9CC(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

_OWORD *sub_100052954(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v6 = (void *)(a5[6] + 16 * a1);
  *long long v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10002A9CC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

_OWORD *sub_1000529C0(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_10002A9CC(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100052A80@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_1000183B0((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100052AD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100052B30@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_1000183B0(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_100052D14((uint64_t)&v23, (uint64_t)v22);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_100052D7C((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_100052D0C()
{
  return swift_release();
}

uint64_t sub_100052D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007978(&qword_100076710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100052D7C(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100076718);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100052DDC()
{
  unint64_t result = qword_100076738;
  if (!qword_100076738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100076738);
  }
  return result;
}

uint64_t sub_100052E30(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = (unint64_t *)result;
  int64_t v4 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = a3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  BOOL v26 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        unint64_t v8 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        int64_t v35 = v4;
        unint64_t v9 = v8 | (v4 << 6);
      }
      else
      {
        int64_t v10 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_44;
        }
        if (v10 >= v29) {
          return sub_10005219C(v25, a2, v27, a3);
        }
        unint64_t v11 = *(void *)(v28 + 8 * v10);
        int64_t v12 = v4 + 1;
        if (!v11)
        {
          int64_t v12 = v4 + 2;
          if (v4 + 2 >= v29) {
            return sub_10005219C(v25, a2, v27, a3);
          }
          unint64_t v11 = *(void *)(v28 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 3;
            if (v4 + 3 >= v29) {
              return sub_10005219C(v25, a2, v27, a3);
            }
            unint64_t v11 = *(void *)(v28 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = v4 + 4;
              if (v4 + 4 >= v29) {
                return sub_10005219C(v25, a2, v27, a3);
              }
              unint64_t v11 = *(void *)(v28 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_45;
                  }
                  if (v12 >= v29) {
                    return sub_10005219C(v25, a2, v27, a3);
                  }
                  unint64_t v11 = *(void *)(v28 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_20;
                  }
                }
              }
              int64_t v12 = v4 + 4;
            }
          }
        }
LABEL_20:
        unint64_t v7 = (v11 - 1) & v11;
        int64_t v35 = v12;
        unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      int64_t v14 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v9);
      uint64_t v15 = *v14;
      uint64_t v16 = v14[1];
      sub_1000183B0(*(void *)(a3 + 56) + 32 * v9, (uint64_t)v34);
      v32[0] = v15;
      v32[1] = v16;
      sub_1000183B0((uint64_t)v34, (uint64_t)&v33);
      type metadata accessor for MainActor();
      swift_bridgeObjectRetain_n();
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v17 = a4[2];
      if (v17) {
        break;
      }
LABEL_4:
      sub_100052D7C((uint64_t)v32);
      swift_release();
      sub_10002AA58((uint64_t)v34);
      unint64_t result = swift_bridgeObjectRelease();
      int64_t v4 = v35;
    }
    if (a4[4] != v15 || a4[5] != v16)
    {
      unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_39:
    sub_100052D7C((uint64_t)v32);
    swift_release();
    sub_10002AA58((uint64_t)v34);
    unint64_t result = swift_bridgeObjectRelease();
    *(unint64_t *)((char *)v25 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    BOOL v23 = __OFADD__(v27++, 1);
    int64_t v4 = v35;
    if (v23)
    {
      __break(1u);
      return sub_10005219C(v25, a2, v27, a3);
    }
  }
  if (v17 == 1) {
    goto LABEL_4;
  }
  uint64_t v19 = v26;
  uint64_t v20 = 1;
  while (1)
  {
    uint64_t v21 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (*(v19 - 1) == v15 && *v19 == v16) {
      goto LABEL_39;
    }
    unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      goto LABEL_39;
    }
    v19 += 2;
    ++v20;
    if (v21 == v17) {
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_10005315C(uint64_t a1, void *a2)
{
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100052E30((uint64_t)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100052E30((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_100053318(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000D70C(a1, a2);
  }
  return a1;
}

uint64_t sub_10005332C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MetricsEventType();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InstallConfirmationAppStoreMetrics.Linter()
{
  return &type metadata for InstallConfirmationAppStoreMetrics.Linter;
}

Swift::Int sub_100053380()
{
  return Hasher._finalize()();
}

uint64_t sub_1000533D8()
{
  return String.hash(into:)();
}

Swift::Int sub_1000533F4()
{
  return Hasher._finalize()();
}

uint64_t sub_100053448@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10006DF88, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_10005349C(void *a1@<X8>)
{
  *a1 = 0xD000000000000022;
  a1[1] = 0x800000010005CBF0;
}

unsigned char *storeEnumTagSinglePayload for LaunchAngelEntitlements(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100053558);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LaunchAngelEntitlements()
{
  return &type metadata for LaunchAngelEntitlements;
}

unint64_t sub_100053594()
{
  unint64_t result = qword_100076788;
  if (!qword_100076788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100076788);
  }
  return result;
}

uint64_t sub_1000535E8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

char *sub_10005362C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for LocalizedInstallSheetContent();
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  *uint64_t v10 = 0;
  v10[1] = 0;
  *(void *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = 0;
  uint64_t v11 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction;
  *(void *)&v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction] = 0;
  v3[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = 0;
  uint64_t v12 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad;
  uint64_t v13 = self;
  int64_t v14 = v3;
  id v15 = [v13 currentDevice];
  id v16 = [v15 userInterfaceIdiom];

  v3[v12] = v16 == (id)1;
  id v17 = [a1 actions];
  if (v17)
  {
    sub_100018668(0, (unint64_t *)&qword_1000763E0);
    sub_100018050();
    uint64_t v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    id v17 = (id)sub_1000157B4(v18);
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = *(void **)&v3[v11];
  *(void *)&v3[v11] = v17;

  sub_10001F35C(a2, (uint64_t)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent]);
  sub_10001840C(a3, (uint64_t)&v14[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics]);

  uint64_t v20 = (objc_class *)type metadata accessor for InstallConfirmationViewController();
  v26.receiver = v14;
  v26.Class super_class = v20;
  id v21 = [super initWithNibName:0 bundle:0];
  sub_10001F35C(a2, (uint64_t)v9);
  objc_allocWithZone((Class)type metadata accessor for InstallSheetViewController());
  char v22 = (char *)v21;
  id v23 = sub_10001A7CC((uint64_t)v9, (uint64_t)v21, (uint64_t)&off_10006F170);

  sub_100058290(a3);
  sub_1000584E4(a2, (uint64_t (*)(void))type metadata accessor for LocalizedInstallSheetContent);
  char v24 = *(void **)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController];
  *(void *)&v22[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = v23;

  return v22;
}

void sub_100053948(char a1)
{
  uint64_t v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v14.receiver = v1;
  v14.Class super_class = (Class)type metadata accessor for InstallConfirmationViewController();
  [super viewDidAppear:a1 & 1];
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  unsigned int v4 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController];
  id v5 = v4;
  swift_release();
  if (!v4)
  {
    swift_release();
    return;
  }
  [v5 setModalPresentationStyle:2];
  id v6 = [v1 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  id v8 = [v6 window];

  if (v8)
  {
    id v9 = [v8 _rootSheetPresentationController];

    if (v9)
    {
      [v9 _setShouldScaleDownBehindDescendantSheets:0];

      goto LABEL_10;
    }
LABEL_16:
    __break(1u);
    return;
  }
LABEL_10:
  id v10 = [self blackColor];
  uint64_t v11 = v10;
  double v12 = 0.8;
  if (v2[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad]) {
    double v12 = 0.4;
  }
  id v13 = [v10 colorWithAlphaComponent:v12];

  sub_100056374(v13);
  [v2 presentViewController:v5 animated:1 completion:0];
  swift_release();
}

uint64_t sub_100053D84(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 234) = a1;
  uint64_t v3 = type metadata accessor for ContinuousClock();
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = *(void *)(v3 - 8);
  *(void *)(v2 + 40) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 56) = *(void *)(v4 - 8);
  *(void *)(v2 + 64) = swift_task_alloc();
  uint64_t v5 = type metadata accessor for InstallSheetContext.Source();
  *(void *)(v2 + 72) = v5;
  *(void *)(v2 + 80) = *(void *)(v5 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  *(void *)(v2 + 96) = swift_task_alloc();
  sub_100007978(&qword_100075350);
  *(void *)(v2 + 104) = swift_task_alloc();
  uint64_t v6 = type metadata accessor for InstallConfirmationAppStoreMetrics();
  *(void *)(v2 + 112) = v6;
  *(void *)(v2 + 120) = *(void *)(v6 - 8);
  *(void *)(v2 + 128) = swift_task_alloc();
  type metadata accessor for MainActor();
  *(void *)(v2 + 136) = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v2 + 144) = v8;
  *(void *)(v2 + 152) = v7;
  return _swift_task_switch(sub_100053FD0, v8, v7);
}

uint64_t sub_100053FD0()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  sub_10001840C(*(void *)(v0 + 16)+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_100058290(*(void *)(v0 + 104));
    uint64_t v4 = *(void *)(v0 + 96);
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v6 = *(void *)(v0 + 80);
    uint64_t v7 = *(void *)(v0 + 16)
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent;
    type metadata accessor for LocalizedInstallSheetContent();
    InstallSheetContext.source.getter();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 88);
    int v9 = v8(v4, v5);
    int v10 = enum case for InstallSheetContext.Source.appStoreWithContext(_:);
    if (v9 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
    {
      uint64_t v11 = *(void *)(v0 + 96);
      uint64_t v12 = *(void *)(v0 + 48);
      uint64_t v13 = *(void *)(v0 + 56);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v11, *(void *)(v0 + 72));
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    else
    {
      if (v9 == enum case for InstallSheetContext.Source.distributor(_:)
        || v9 == enum case for InstallSheetContext.Source.web(_:))
      {
        goto LABEL_22;
      }
      if (v9 == enum case for InstallSheetContext.Source.webWithContext(_:))
      {
        uint64_t v38 = *(void *)(v0 + 96);
        (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v38, *(void *)(v0 + 72));
        uint64_t v39 = type metadata accessor for InstallSheetContext.Source.WebInstallContext();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v38, v39);
        goto LABEL_24;
      }
      if (v9 != enum case for InstallSheetContext.Source.appStore(_:))
      {
LABEL_22:
        uint64_t v44 = *(void *)(v0 + 96);
        goto LABEL_23;
      }
    }
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 72);
    InstallSheetContext.source.getter();
    int v16 = v8(v14, v15);
    if (v16 == v10)
    {
      uint64_t v17 = *(void *)(v0 + 88);
      uint64_t v18 = *(void *)(v0 + 64);
      uint64_t v19 = *(void *)(v0 + 48);
      uint64_t v20 = *(void *)(v0 + 56);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v17, *(void *)(v0 + 72));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v18, v17, v19);
      LOBYTE(v17) = InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
      if (v17) {
        goto LABEL_24;
      }
LABEL_19:
      char v42 = *(unsigned char *)(v0 + 234);
      swift_release();
      char v43 = v42;
LABEL_29:
      sub_100055EE0(v43);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
      return v46();
    }
    if (v16 == enum case for InstallSheetContext.Source.appStore(_:))
    {
      if ((InstallSheetContext.showBiometricsForAppStoreInstall.getter() & 1) == 0) {
        goto LABEL_19;
      }
LABEL_24:
      if (*(unsigned char *)(v0 + 234) == 1)
      {
        int v45 = (void *)swift_task_alloc();
        *(void *)(v0 + 216) = v45;
        *int v45 = v0;
        v45[1] = sub_100054BD8;
        return sub_1000565BC(v7);
      }
      swift_release();
      char v43 = 0;
      goto LABEL_29;
    }
    uint64_t v44 = *(void *)(v0 + 88);
LABEL_23:
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 8))(v44, *(void *)(v0 + 72));
    goto LABEL_24;
  }
  int v21 = *(unsigned __int8 *)(v0 + 234);
  sub_1000582F0(*(void *)(v0 + 104), *(void *)(v0 + 128));
  type metadata accessor for LocalizedInstallSheetContent();
  uint64_t v22 = InstallSheetContext.itemID.getter();
  uint64_t v24 = v23;
  *(void *)(v0 + 160) = v23;
  if (v21 == 1)
  {
    uint64_t v25 = InstallSheetContext.itemID.getter();
    uint64_t v27 = v26;
    *(void *)(v0 + 168) = v26;
    uint64_t v28 = InstallSheetContext.Source.AppStoreSheetContext.installType.getter();
    uint64_t v30 = v29;
    *(void *)(v0 + 176) = v29;
    *(void *)(v0 + 184) = sub_10004E0A4((uint64_t)&_swiftEmptyArrayStorage);
    unint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v31;
    void *v31 = v0;
    v31[1] = sub_10005454C;
    uint64_t v32 = v22;
    uint64_t v33 = v24;
    uint64_t v34 = v25;
    uint64_t v35 = v27;
    uint64_t v36 = v28;
    uint64_t v37 = v30;
  }
  else
  {
    *(void *)(v0 + 200) = sub_10004E0A4((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v40 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v40;
    *uint64_t v40 = v0;
    v40[1] = sub_100054A78;
    uint64_t v32 = 0x6C65636E6143;
    uint64_t v33 = 0xE600000000000000;
    uint64_t v34 = v22;
    uint64_t v35 = v24;
    uint64_t v36 = 0x7373696D736964;
    uint64_t v37 = 0xE700000000000000;
  }
  return sub_10004EE24(v32, v33, v34, v35, v36, v37, 0x6E6F74747562, 0xE600000000000000);
}

uint64_t sub_10005454C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return _swift_task_switch(sub_1000546EC, v3, v2);
}

uint64_t sub_1000546EC()
{
  sub_1000584E4(*(void *)(v0 + 128), (uint64_t (*)(void))type metadata accessor for InstallConfirmationAppStoreMetrics);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 16)
     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent;
  type metadata accessor for LocalizedInstallSheetContent();
  InstallSheetContext.source.getter();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 88);
  int v6 = v5(v1, v2);
  int v7 = enum case for InstallSheetContext.Source.appStoreWithContext(_:);
  if (v6 == enum case for InstallSheetContext.Source.appStoreWithContext(_:))
  {
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v10 = *(void *)(v0 + 56);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v8, *(void *)(v0 + 72));
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  else
  {
    if (v6 == enum case for InstallSheetContext.Source.distributor(_:)
      || v6 == enum case for InstallSheetContext.Source.web(_:))
    {
      goto LABEL_15;
    }
    if (v6 == enum case for InstallSheetContext.Source.webWithContext(_:))
    {
      uint64_t v18 = *(void *)(v0 + 96);
      (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v18, *(void *)(v0 + 72));
      uint64_t v19 = type metadata accessor for InstallSheetContext.Source.WebInstallContext();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
      goto LABEL_17;
    }
    if (v6 != enum case for InstallSheetContext.Source.appStore(_:))
    {
LABEL_15:
      uint64_t v22 = *(void *)(v0 + 96);
      goto LABEL_16;
    }
  }
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 72);
  InstallSheetContext.source.getter();
  int v13 = v5(v11, v12);
  if (v13 == v7)
  {
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 64);
    uint64_t v16 = *(void *)(v0 + 48);
    uint64_t v17 = *(void *)(v0 + 56);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 96))(v14, *(void *)(v0 + 72));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v15, v14, v16);
    LOBYTE(v14) = InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    if (v14) {
      goto LABEL_17;
    }
LABEL_12:
    char v20 = *(unsigned char *)(v0 + 234);
    swift_release();
    char v21 = v20;
    goto LABEL_22;
  }
  if (v13 != enum case for InstallSheetContext.Source.appStore(_:))
  {
    uint64_t v22 = *(void *)(v0 + 88);
LABEL_16:
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 80) + 8))(v22, *(void *)(v0 + 72));
    goto LABEL_17;
  }
  if ((InstallSheetContext.showBiometricsForAppStoreInstall.getter() & 1) == 0) {
    goto LABEL_12;
  }
LABEL_17:
  if (*(unsigned char *)(v0 + 234) == 1)
  {
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_100054BD8;
    return sub_1000565BC(v4);
  }
  swift_release();
  char v21 = 0;
LABEL_22:
  sub_100055EE0(v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_100054A78()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 152);
  uint64_t v3 = *(void *)(v1 + 144);
  return _swift_task_switch(sub_100058554, v3, v2);
}

uint64_t sub_100054BD8(__int16 a1)
{
  uint64_t v2 = *v1;
  *(_WORD *)(*v1 + 232) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 144);
  return _swift_task_switch(sub_100054D00, v4, v3);
}

uint64_t sub_100054D00()
{
  if ((*(_WORD *)(v0 + 232) & 1) == 0)
  {
    swift_release();
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  if ((*(_WORD *)(v0 + 232) & 0x100) == 0)
  {
    swift_release();
    sub_100055EE0(1);
    goto LABEL_5;
  }
  ContinuousClock.init()();
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_100076838 + dword_100076838);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 224) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100054E7C;
  return v4(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_100054E7C()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[5];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[3];
  if (v0)
  {
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[18];
    uint64_t v8 = v3[19];
    uint64_t v9 = sub_10005854C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[18];
    uint64_t v8 = v3[19];
    uint64_t v9 = sub_100055010;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_100055010()
{
  swift_release();
  sub_100055EE0(1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000550CC(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  sub_100007978(&qword_100075350);
  v2[14] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for InstallConfirmationAppStoreMetrics();
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[18] = static MainActor.shared.getter();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[19] = v5;
  v2[20] = v4;
  return _swift_task_switch(sub_1000551F0, v5, v4);
}

uint64_t sub_1000551F0()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[14];
  sub_10001840C(v0[13] + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[14];
    swift_release();
    sub_100058290(v4);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
  else
  {
    sub_1000582F0(v0[14], v0[17]);
    type metadata accessor for LocalizedInstallSheetContent();
    uint64_t v7 = InstallSheetContext.itemID.getter();
    uint64_t v9 = v8;
    v0[21] = v8;
    sub_100007978(&qword_100075AD0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10005B4B0;
    *(void *)(inited + 32) = 0x72556E6F69746361;
    *(void *)(inited + 40) = 0xE90000000000006CLL;
    uint64_t v11 = URL.absoluteString.getter();
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v11;
    *(void *)(inited + 56) = v12;
    v0[22] = sub_10004E0A4(inited);
    int v13 = (void *)swift_task_alloc();
    v0[23] = v13;
    *int v13 = v0;
    v13[1] = sub_100055424;
    return sub_10004EE24(0x726F4D6E7261654CLL, 0xE900000000000065, v7, v9, 0x657461676976616ELL, 0xE800000000000000, 1802398060, 0xE400000000000000);
  }
}

uint64_t sub_100055424()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return _swift_task_switch(sub_100055584, v3, v2);
}

uint64_t sub_100055584()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_release();
  sub_1000584E4(v1, (uint64_t (*)(void))type metadata accessor for InstallConfirmationAppStoreMetrics);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100055614()
{
  v1[2] = v0;
  sub_100007978(&qword_100075350);
  v1[3] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for InstallConfirmationAppStoreMetrics();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[7] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_100055738, v4, v3);
}

uint64_t sub_100055738()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  sub_10001840C(v0[2] + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    swift_release();
    sub_100058290(v5);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    sub_1000582F0(v0[3], v0[6]);
    type metadata accessor for LocalizedInstallSheetContent();
    uint64_t v8 = InstallSheetContext.itemID.getter();
    uint64_t v10 = v9;
    v0[10] = v9;
    v0[11] = sub_10004E0A4((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[12] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_1000558F8;
    return sub_10004EE24(1701998413, 0xE400000000000000, v8, v10, 1701998445, 0xE400000000000000, 0x6E6F74747562, 0xE600000000000000);
  }
}

uint64_t sub_1000558F8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return _swift_task_switch(sub_100058544, v3, v2);
}

uint64_t sub_100055A58()
{
  v1[2] = v0;
  sub_100007978(&qword_100075350);
  v1[3] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for InstallConfirmationAppStoreMetrics();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[7] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[8] = v4;
  v1[9] = v3;
  return _swift_task_switch(sub_100055B7C, v4, v3);
}

uint64_t sub_100055B7C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  sub_10001840C(v0[2] + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics, v3);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  uint64_t v5 = v0[3];
  if (v4 == 1)
  {
    swift_release();
    sub_100058290(v5);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    sub_1000582F0(v0[3], v0[6]);
    type metadata accessor for LocalizedInstallSheetContent();
    uint64_t v8 = InstallSheetContext.itemID.getter();
    uint64_t v10 = v9;
    v0[10] = v9;
    uint64_t v11 = (void *)swift_task_alloc();
    v0[11] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_100055D0C;
    return sub_10004F818(v8, v10, 0x6174736E49707041, 0xEA00000000006C6CLL);
  }
}

uint64_t sub_100055D0C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return _swift_task_switch(sub_100055E50, v3, v2);
}

uint64_t sub_100055E50()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_release();
  sub_1000584E4(v1, (uint64_t (*)(void))type metadata accessor for InstallConfirmationAppStoreMetrics);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100055EE0(char a1)
{
  uint64_t v2 = v1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response;
  v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = a1 & 1;
  swift_release();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction];
  id v6 = v5;
  swift_release();
  if (v5)
  {
    if ([v6 canSendResponse])
    {
      id v7 = [objc_allocWithZone((Class)BSMutableSettings) init];
      static MainActor.shared.getter();
      dispatch thunk of Actor.unownedExecutor.getter();
      if ((swift_task_isCurrentExecutor() & 1) == 0) {
        swift_task_reportUnexpectedExecutor();
      }
      uint64_t v8 = v1[v4];
      swift_release();
      id v9 = [objc_allocWithZone((Class)NSNumber) initWithBool:v8];
      [v7 setObject:v9 forSetting:1];

      id v10 = [self responseWithInfo:v7];
      [v6 sendResponse:v10];

      id v6 = v10;
    }
  }
  id v11 = [self clearColor];
  sub_100056374(v11);

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v2;
  v16[4] = sub_100058288;
  v16[5] = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_1000535E8;
  v16[3] = &unk_10006F238;
  int v13 = _Block_copy(v16);
  id v14 = v2;
  swift_release();
  [v14 dismissViewControllerAnimated:1 completion:v13];
  _Block_release(v13);
  return swift_release();
}

uint64_t sub_100056248(uint64_t a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v2 = *(void (**)(uint64_t))(a1
                                      + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction);
  sub_10000AF6C((uint64_t)v2);
  uint64_t v3 = swift_release();
  if (v2)
  {
    v2(v3);
    sub_10000AF7C((uint64_t)v2);
  }

  return swift_release();
}

uint64_t sub_100056374(void *a1)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  v9[4] = sub_100058230;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  _OWORD v9[2] = sub_1000535E8;
  v9[3] = &unk_10006F1E8;
  uint64_t v5 = _Block_copy(v9);
  id v6 = v1;
  id v7 = a1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
  return swift_release();
}

void sub_1000564D8(void *a1, uint64_t a2)
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = [a1 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setBackgroundColor:a2];
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000565BC(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  uint64_t v3 = sub_100007978(&qword_100076828);
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_1000566AC, 0, 0);
}

uint64_t sub_1000566AC()
{
  uint64_t v56 = v0;
  uint64_t v1 = v0 + 184;
  type metadata accessor for LocalizedInstallSheetContent();
  uint64_t v2 = InstallSheetContext.authenticationContextData.getter();
  id v4 = &swift_setDeallocating_ptr;
  if (v3 >> 60 != 15)
  {
    uint64_t v5 = v2;
    unint64_t v6 = v3;
    id v7 = objc_allocWithZone((Class)LAContext);
    uint64_t v53 = v5;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v9 = [v7 initWithExternalizedContext:isa];

    id v54 = v9;
    uint64_t v10 = 0x64696C6156;
    if (!v9) {
      uint64_t v10 = 0x64696C61766E49;
    }
    uint64_t v52 = v10;
    if (v9) {
      unint64_t v11 = 0xE500000000000000;
    }
    else {
      unint64_t v11 = 0xE700000000000000;
    }
    if (qword_100074B50 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void **)(v0 + 232);
    uint64_t v13 = type metadata accessor for Logger();
    sub_10000AEDC(v13, (uint64_t)qword_100078088);
    id v14 = v12;
    swift_bridgeObjectRetain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v18 = *(void **)(v0 + 232);
    if (v17)
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136446466;
      uint64_t v20 = InstallSheetContext.logKey.getter();
      *(void *)(v0 + 208) = sub_100057B1C(v20, v21, &v55);
      uint64_t v1 = v0 + 184;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v19 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 216) = sub_100057B1C(v52, v11, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%{public}s] Received authentication context, is valid: %s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v4 = &swift_setDeallocating_ptr;
      swift_slowDealloc();

      sub_100053318(v53, v6);
      uint64_t v22 = v54;
      if (v54)
      {
LABEL_11:
        id v23 = v22;
        uint64_t v24 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      sub_100053318(v53, v6);

      swift_bridgeObjectRelease_n();
      uint64_t v22 = v54;
      if (v54) {
        goto LABEL_11;
      }
    }
  }
  id v23 = [objc_allocWithZone((Class)v4[177]) init];
  uint64_t v24 = 0;
LABEL_14:
  *(void *)(v0 + 264) = v23;
  *(void *)(v0 + 272) = v24;
  sub_100018668(0, (unint64_t *)&unk_100075328);
  Class v25 = NSNumber.init(integerLiteral:)(60).super.super.isa;
  [v23 setOptionMaxCredentialAge:v25];

  NSString v26 = String._bridgeToObjectiveC()();
  [v23 setOptionPasscodeTitle:v26];

  *(void *)(v0 + 184) = 0;
  unsigned int v27 = [v23 canEvaluatePolicy:2 error:v1];
  uint64_t v28 = *(void **)(v0 + 184);
  *(void *)(v0 + 280) = v28;
  if (v27)
  {
    *(void *)(v0 + 192) = 0;
    swift_bridgeObjectRetain();
    id v29 = v28;
    id v30 = [v23 evaluationMechanismsForPolicy:2 error:v0 + 192];
    unint64_t v31 = *(void **)(v0 + 192);
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
      id v34 = v31;

      *(_DWORD *)(v0 + 312) = 1;
      AnyHashable.init<A>(_:)();
      char v35 = sub_1000571D0(v0 + 144, v33);
      swift_bridgeObjectRelease();
      sub_1000180B8(v0 + 144);
      if (v35)
      {
        swift_bridgeObjectRelease();
        NSString v36 = String._bridgeToObjectiveC()();
        [v23 setOptionAuthenticationTitle:v36];

        swift_bridgeObjectRetain();
      }
    }
    else
    {
      id v40 = v31;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
    }
    NSString v41 = String._bridgeToObjectiveC()();
    [v23 setOptionPasscodeTitle:v41];

    NSString v42 = String._bridgeToObjectiveC()();
    [v23 setOptionPasswordAuthenticationReason:v42];

    SecAccessControlRef v43 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000001uLL, 0);
    *(void *)(v0 + 288) = v43;
    if (v43)
    {
      SecAccessControlRef v44 = v43;
      uint64_t v45 = *(void *)(v0 + 248);
      uint64_t v46 = *(void *)(v0 + 256);
      uint64_t v47 = *(void *)(v0 + 240);
      NSString v48 = String._bridgeToObjectiveC()();
      *(void *)(v0 + 296) = v48;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 316;
      *(void *)(v0 + 24) = sub_100056EE0;
      swift_continuation_init();
      *(void *)(v0 + 136) = v47;
      int v49 = sub_10002A9DC((uint64_t *)(v0 + 112));
      sub_100007978(&qword_100076350);
      CheckedContinuation.init(continuation:function:)();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v45 + 32))(v49, v46, v47);
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 1107296256;
      *(void *)(v0 + 96) = sub_1000572A8;
      *(void *)(v0 + 104) = &unk_10006F198;
      [v23 evaluateAccessControl:v44 operation:3 localizedReason:v48];
      return _swift_continuation_await(v0 + 16);
    }
    swift_bridgeObjectRelease();

    goto LABEL_29;
  }
  if (!v28)
  {

    goto LABEL_29;
  }
  type metadata accessor for Code(0);
  *(void *)(v0 + 200) = -5;
  sub_100058354(&qword_100074C30, type metadata accessor for Code);
  id v37 = v28;
  char v38 = static _ErrorCodeProtocol.~= infix(_:_:)();

  if ((v38 & 1) == 0)
  {
LABEL_29:
    uint64_t v39 = 0;
    goto LABEL_30;
  }
  uint64_t v39 = 1;
LABEL_30:
  swift_task_dealloc();
  uint64_t v50 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v50(v39);
}

uint64_t sub_100056EE0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 304) = v1;
  if (v1) {
    uint64_t v2 = sub_1000570EC;
  }
  else {
    uint64_t v2 = sub_10005701C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10005701C()
{
  uint64_t v2 = *(void **)(v0 + 288);
  uint64_t v1 = *(void **)(v0 + 296);
  unint64_t v3 = *(void **)(v0 + 280);
  uint64_t v4 = *(void **)(v0 + 264);

  char v5 = *(unsigned char *)(v0 + 316);
  swift_task_dealloc();
  if (v5) {
    int v6 = 256;
  }
  else {
    int v6 = 0;
  }
  id v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(v6 | v5 & 1u);
}

uint64_t sub_1000570EC()
{
  uint64_t v1 = (void *)v0[37];
  unint64_t v3 = (void *)v0[35];
  uint64_t v2 = (void *)v0[36];
  char v5 = (void *)v0[33];
  uint64_t v4 = (void *)v0[34];
  swift_willThrow();

  swift_errorRelease();
  swift_task_dealloc();
  int v6 = (uint64_t (*)(void))v0[1];
  return v6(0);
}

uint64_t sub_1000571D0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (Swift::Int v3 = AnyHashable._rawHashValue(seed:)(*(void *)(a2 + 40)),
        uint64_t v4 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v5 = v3 & ~v4,
        ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0))
  {
    uint64_t v6 = ~v4;
    do
    {
      sub_100052AD4(*(void *)(a2 + 48) + 40 * v5, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)();
      sub_1000180B8((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

void sub_1000572A8(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10002AAB0((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v4 = a3;
    sub_100007978(&qword_100076828);
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_100007978(&qword_100076828);
    CheckedContinuation.resume(returning:)();
  }
}

id sub_1000573D8()
{
  v2.receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for InstallConfirmationViewController();
  return [super dealloc];
}

uint64_t sub_1000574A4()
{
  return type metadata accessor for InstallConfirmationViewController();
}

uint64_t type metadata accessor for InstallConfirmationViewController()
{
  uint64_t result = qword_1000767E8;
  if (!qword_1000767E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000574F8()
{
  type metadata accessor for LocalizedInstallSheetContent();
  if (v0 <= 0x3F)
  {
    sub_1000575E0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_1000575E0()
{
  if (!qword_100076820)
  {
    type metadata accessor for InstallConfirmationAppStoreMetrics();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100076820);
    }
  }
}

uint64_t sub_100057638(uint64_t a1, uint64_t a2)
{
  return sub_1000183B0(a2 + 32, a1 + 32);
}

uint64_t sub_100057648(uint64_t a1)
{
  return sub_10002AA58(a1 + 32);
}

uint64_t sub_100057650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_100057754, 0, 0);
}

uint64_t sub_100057754()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock();
  uint64_t v5 = sub_100058354(&qword_100076840, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100058354(&qword_100076848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  char v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *char v7 = v0;
  v7[1] = sub_1000578F4;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_1000578F4()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_100057AB0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_100057AB0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100057B1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100057BF0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000183B0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000183B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002AA58((uint64_t)v12);
  return v7;
}

uint64_t sub_100057BF0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100057DAC(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100057DAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100057E44(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000580A0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000580A0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100057E44(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100057FBC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100057FBC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100007978(&qword_100076830);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100058024(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
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
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000580A0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007978(&qword_100076830);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000581F0()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100058230()
{
  sub_1000564D8(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100058238(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100058248()
{
  return swift_release();
}

uint64_t sub_100058250()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100058288()
{
  return sub_100056248(*(void *)(v0 + 16));
}

uint64_t sub_100058290(uint64_t a1)
{
  uint64_t v2 = sub_100007978(&qword_100075350);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000582F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InstallConfirmationAppStoreMetrics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100058354(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10005839C()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction];
  *uint64_t v1 = 0;
  v1[1] = 0;
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction] = 0;
  v0[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_response] = 0;
  uint64_t v2 = OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad;
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  v0[v2] = v4 == (id)1;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  swift_release();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000584E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for XPCDecoder()
{
  return &type metadata for XPCDecoder;
}

void *initializeBufferWithCopyOfBuffer for XPCEncoder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for XPCEncoder()
{
  return swift_release();
}

void *assignWithCopy for XPCEncoder(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for XPCEncoder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCEncoder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCEncoder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCEncoder()
{
  return &type metadata for XPCEncoder;
}

uint64_t sub_1000586A4()
{
  return (*v0)();
}

uint64_t sub_1000586CC(void *a1)
{
  return sub_1000586E4(a1);
}

uint64_t sub_1000586E4(void *a1)
{
  uint64_t v2 = sub_100007978(&qword_100075B98);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002AAB0(a1, a1[3]);
  uint64_t v5 = dispatch thunk of Decoder.userInfo.getter();
  CodingUserInfoKey.init(rawValue:)();
  uint64_t v6 = type metadata accessor for CodingUserInfoKey();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    if (*(void *)(v5 + 16) && (unint64_t v9 = sub_100050414((uint64_t)v4), (v10 & 1) != 0))
    {
      sub_1000183B0(*(void *)(v5 + 56) + 32 * v9, (uint64_t)&v13);
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v14 + 1))
    {
      sub_10002A9CC(&v13, &v15);
      sub_100007978(&qword_100075BA0);
      swift_dynamicCast();
      size_t v11 = v12;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
      v11(a1);
      swift_release();
      return sub_10002AA58((uint64_t)a1);
    }
  }
  __break(1u);
  return result;
}

id sub_1000588D8(void *a1)
{
  return sub_100058918(a1, 0.14, 0.15, 0.98, 0.98);
}

id sub_1000588FC(void *a1)
{
  return sub_100058918(a1, 0.25, 0.25, 0.87, 0.88);
}

id sub_100058918(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = [a1 userInterfaceStyle];
  id v10 = objc_allocWithZone((Class)UIColor);
  if (v9 == (id)2)
  {
    double v11 = a2;
    double v12 = a2;
    double v13 = a3;
  }
  else
  {
    double v11 = a4;
    double v12 = a4;
    double v13 = a5;
  }

  return [v10 initWithRed:v11 green:v12 blue:v13 alpha:1.0];
}

uint64_t sub_1000589B0()
{
  dlerror();
  int v0 = abort_report_np();
  return sub_1000589D4(v0, v1, v2);
}

void sub_1000589D4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@] Mini product page failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100058A60(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Mini product page content size did invalidate", (uint8_t *)&v3, 0xCu);
}

void sub_100058ADC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Mini product page did present description", (uint8_t *)&v3, 0xCu);
}

void sub_100058B58()
{
  uint64_t v0 = abort_report_np();
  sub_100058B80(v0);
}

void sub_100058B80()
{
}

void sub_100058BA8()
{
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Measurement<>.formatted()()
{
  return Measurement<>.formatted()();
}

uint64_t static CharacterSet.urlQueryAllowed.getter()
{
  return static CharacterSet.urlQueryAllowed.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t type metadata accessor for AttributedString.MarkdownParsingOptions()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t dispatch thunk of PropertyListDecoder.userInfo.modify()
{
  return dispatch thunk of PropertyListDecoder.userInfo.modify();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t dispatch thunk of NSKeyValueObservation.invalidate()()
{
  return dispatch thunk of NSKeyValueObservation.invalidate()();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.init<A>(_:)()
{
  return Data.init<A>(_:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t withObservationTracking<A>(_:onChange:)()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t type metadata accessor for MarketplaceSceneConnectionOptionDefinition()
{
  return type metadata accessor for MarketplaceSceneConnectionOptionDefinition();
}

uint64_t AppLibrary.App.isInstalled.getter()
{
  return AppLibrary.App.isInstalled.getter();
}

uint64_t AppLibrary.App.Installation.progress.getter()
{
  return AppLibrary.App.Installation.progress.getter();
}

uint64_t type metadata accessor for AppLibrary.App.Installation()
{
  return type metadata accessor for AppLibrary.App.Installation();
}

uint64_t AppLibrary.App.installation.getter()
{
  return AppLibrary.App.installation.getter();
}

uint64_t AppLibrary.App.isInstalling.getter()
{
  return AppLibrary.App.isInstalling.getter();
}

uint64_t AppLibrary.App.installationError.getter()
{
  return AppLibrary.App.installationError.getter();
}

uint64_t AppLibrary.App.id.getter()
{
  return AppLibrary.App.id.getter();
}

uint64_t AppLibrary.app(forAppleItemID:)()
{
  return AppLibrary.app(forAppleItemID:)();
}

uint64_t static AppLibrary.current.getter()
{
  return static AppLibrary.current.getter();
}

uint64_t type metadata accessor for AppLibrary()
{
  return type metadata accessor for AppLibrary();
}

uint64_t type metadata accessor for FeatureFlag()
{
  return type metadata accessor for FeatureFlag();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t InstallSheetContext.authenticationContextData.getter()
{
  return InstallSheetContext.authenticationContextData.getter();
}

uint64_t InstallSheetContext.showBiometricsForAppStoreInstall.getter()
{
  return InstallSheetContext.showBiometricsForAppStoreInstall.getter();
}

uint64_t static InstallSheetContext.InstallType.== infix(_:_:)()
{
  return static InstallSheetContext.InstallType.== infix(_:_:)();
}

uint64_t type metadata accessor for InstallSheetContext.InstallType()
{
  return type metadata accessor for InstallSheetContext.InstallType();
}

uint64_t InstallSheetContext.learnMoreURL.getter()
{
  return InstallSheetContext.learnMoreURL.getter();
}

uint64_t InstallSheetContext.type.getter()
{
  return InstallSheetContext.type.getter();
}

uint64_t InstallSheetContext.Source.WebInstallContext.developerName.getter()
{
  return InstallSheetContext.Source.WebInstallContext.developerName.getter();
}

uint64_t InstallSheetContext.Source.WebInstallContext.domain.getter()
{
  return InstallSheetContext.Source.WebInstallContext.domain.getter();
}

uint64_t InstallSheetContext.Source.WebInstallContext.appName.getter()
{
  return InstallSheetContext.Source.WebInstallContext.appName.getter();
}

uint64_t InstallSheetContext.Source.WebInstallContext.iconURL.getter()
{
  return InstallSheetContext.Source.WebInstallContext.iconURL.getter();
}

uint64_t type metadata accessor for InstallSheetContext.Source.WebInstallContext()
{
  return type metadata accessor for InstallSheetContext.Source.WebInstallContext();
}

uint64_t InstallSheetContext.Source.AppStoreSheetContext.installType.getter()
{
  return InstallSheetContext.Source.AppStoreSheetContext.installType.getter();
}

uint64_t InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter()
{
  return InstallSheetContext.Source.AppStoreSheetContext.showBiometrics.getter();
}

uint64_t InstallSheetContext.Source.AppStoreSheetContext.metricsFieldData.getter()
{
  return InstallSheetContext.Source.AppStoreSheetContext.metricsFieldData.getter();
}

uint64_t type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext()
{
  return type metadata accessor for InstallSheetContext.Source.AppStoreSheetContext();
}

uint64_t InstallSheetContext.Source.isAppStore.getter()
{
  return InstallSheetContext.Source.isAppStore.getter();
}

uint64_t type metadata accessor for InstallSheetContext.Source()
{
  return type metadata accessor for InstallSheetContext.Source();
}

uint64_t InstallSheetContext.itemID.getter()
{
  return InstallSheetContext.itemID.getter();
}

uint64_t InstallSheetContext.logKey.getter()
{
  return InstallSheetContext.logKey.getter();
}

uint64_t InstallSheetContext.source.getter()
{
  return InstallSheetContext.source.getter();
}

uint64_t InstallSheetContext.versionID.getter()
{
  return InstallSheetContext.versionID.getter();
}

uint64_t type metadata accessor for InstallSheetContext()
{
  return type metadata accessor for InstallSheetContext();
}

uint64_t type metadata accessor for LaunchAngelXPCRequest.RequestType()
{
  return type metadata accessor for LaunchAngelXPCRequest.RequestType();
}

uint64_t LaunchAngelXPCRequest.requestType.getter()
{
  return LaunchAngelXPCRequest.requestType.getter();
}

uint64_t type metadata accessor for LaunchAngelXPCRequest()
{
  return type metadata accessor for LaunchAngelXPCRequest();
}

uint64_t type metadata accessor for LaunchAngelXPCResponse.ResponseType()
{
  return type metadata accessor for LaunchAngelXPCResponse.ResponseType();
}

uint64_t LaunchAngelXPCResponse.init(responseType:)()
{
  return LaunchAngelXPCResponse.init(responseType:)();
}

uint64_t type metadata accessor for LaunchAngelXPCResponse()
{
  return type metadata accessor for LaunchAngelXPCResponse();
}

uint64_t LicenseResolutionContext.url.getter()
{
  return LicenseResolutionContext.url.getter();
}

uint64_t LicenseResolutionContext.logKey.getter()
{
  return LicenseResolutionContext.logKey.getter();
}

uint64_t type metadata accessor for LicenseResolutionContext()
{
  return type metadata accessor for LicenseResolutionContext();
}

uint64_t OAuthAuthorizationContext.requestURL.getter()
{
  return OAuthAuthorizationContext.requestURL.getter();
}

uint64_t OAuthAuthorizationContext.logKey.getter()
{
  return OAuthAuthorizationContext.logKey.getter();
}

uint64_t type metadata accessor for OAuthAuthorizationContext()
{
  return type metadata accessor for OAuthAuthorizationContext();
}

uint64_t type metadata accessor for MarketplaceDisplayOption()
{
  return type metadata accessor for MarketplaceDisplayOption();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static UISceneConnectionOptionDefinition.createAction(payload:responder:)()
{
  return static UISceneConnectionOptionDefinition.createAction(payload:responder:)();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return EnvironmentValues.dynamicTypeSize.setter();
}

uint64_t EnvironmentValues.symbolRenderingMode.getter()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t EnvironmentValues.symbolRenderingMode.setter()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t type metadata accessor for _ConditionalContent.Storage()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t type metadata accessor for _ConditionalContent()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.bold()()
{
  return Text.bold()();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t HStack.init(alignment:spacing:content:)()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for HStack()
{
  return type metadata accessor for HStack();
}

uint64_t VStack.init(alignment:spacing:content:)()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t type metadata accessor for VStack()
{
  return type metadata accessor for VStack();
}

uint64_t ForEach<>.init(_:content:)()
{
  return ForEach<>.init(_:content:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Alignment.leading.getter()
{
  return static Alignment.leading.getter();
}

uint64_t InMemoryJetPackLoader.init(signingPolicy:keyProvider:)()
{
  return InMemoryJetPackLoader.init(signingPolicy:keyProvider:)();
}

uint64_t type metadata accessor for InMemoryJetPackLoader()
{
  return type metadata accessor for InMemoryJetPackLoader();
}

uint64_t type metadata accessor for InMemoryJetPackResourceBundle()
{
  return type metadata accessor for InMemoryJetPackResourceBundle();
}

uint64_t JetPackAssetSession.Configuration.init(cache:)()
{
  return JetPackAssetSession.Configuration.init(cache:)();
}

uint64_t type metadata accessor for JetPackAssetSession.Configuration()
{
  return type metadata accessor for JetPackAssetSession.Configuration();
}

uint64_t JetPackAssetSession.init(configuration:)()
{
  return JetPackAssetSession.init(configuration:)();
}

uint64_t type metadata accessor for JetPackAssetSession()
{
  return type metadata accessor for JetPackAssetSession();
}

uint64_t type metadata accessor for JetPackSigningPolicy()
{
  return type metadata accessor for JetPackSigningPolicy();
}

uint64_t JetPackAssetDiskCache.__allocating_init()()
{
  return JetPackAssetDiskCache.__allocating_init()();
}

uint64_t type metadata accessor for JetPackAssetDiskCache()
{
  return type metadata accessor for JetPackAssetDiskCache();
}

uint64_t JetPackResourceBundle.version.getter()
{
  return JetPackResourceBundle.version.getter();
}

uint64_t JetPackManagedKeyProvider.init()()
{
  return JetPackManagedKeyProvider.init()();
}

uint64_t type metadata accessor for JetPackManagedKeyProvider()
{
  return type metadata accessor for JetPackManagedKeyProvider();
}

uint64_t type metadata accessor for JetPackAssetRequestSourcePolicy()
{
  return type metadata accessor for JetPackAssetRequestSourcePolicy();
}

uint64_t type metadata accessor for JetPackPath()
{
  return type metadata accessor for JetPackPath();
}

uint64_t JetPackPath.init(_:)()
{
  return JetPackPath.init(_:)();
}

uint64_t JetPackAsset.streamSource.getter()
{
  return JetPackAsset.streamSource.getter();
}

uint64_t type metadata accessor for JetPackAsset()
{
  return type metadata accessor for JetPackAsset();
}

uint64_t JSONObject.init(wrapping:)()
{
  return JSONObject.init(wrapping:)();
}

uint64_t type metadata accessor for JSONObject()
{
  return type metadata accessor for JSONObject();
}

uint64_t JSONContext.init()()
{
  return JSONContext.init()();
}

uint64_t type metadata accessor for JSONContext()
{
  return type metadata accessor for JSONContext();
}

uint64_t static MetricsData.makeMetricsPageData(fields:timingMetrics:configuration:)()
{
  return static MetricsData.makeMetricsPageData(fields:timingMetrics:configuration:)();
}

uint64_t static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)()
{
  return static MetricsData.makeMetricsClickData(targetID:targetType:fields:configuration:)();
}

uint64_t MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)()
{
  return MetricsData.Configuration.init(defaultTopic:defaultIncludingFields:defaultExcludingFields:shouldFlush:)();
}

uint64_t type metadata accessor for MetricsData.Configuration()
{
  return type metadata accessor for MetricsData.Configuration();
}

uint64_t type metadata accessor for MetricsData()
{
  return type metadata accessor for MetricsData();
}

uint64_t BaseObjectGraph.__allocating_init(name:_:)()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t type metadata accessor for BaseObjectGraph()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t MetricsPipeline.Configuration.withRecorder(_:)()
{
  return MetricsPipeline.Configuration.withRecorder(_:)();
}

uint64_t MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)()
{
  return MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
}

uint64_t type metadata accessor for MetricsPipeline.Configuration()
{
  return type metadata accessor for MetricsPipeline.Configuration();
}

uint64_t MetricsPipeline.init(from:)()
{
  return MetricsPipeline.init(from:)();
}

uint64_t type metadata accessor for MetricsPipeline()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t static MetricsEventType.pageRender.getter()
{
  return static MetricsEventType.pageRender.getter();
}

uint64_t static MetricsEventType.impressions.getter()
{
  return static MetricsEventType.impressions.getter();
}

uint64_t static MetricsEventType.page.getter()
{
  return static MetricsEventType.page.getter();
}

uint64_t static MetricsEventType.click.getter()
{
  return static MetricsEventType.click.getter();
}

uint64_t static MetricsEventType.media.getter()
{
  return static MetricsEventType.media.getter();
}

uint64_t static MetricsEventType.search.getter()
{
  return static MetricsEventType.search.getter();
}

uint64_t type metadata accessor for MetricsEventType()
{
  return type metadata accessor for MetricsEventType();
}

uint64_t BagLanguageSource.init(bag:)()
{
  return BagLanguageSource.init(bag:)();
}

uint64_t type metadata accessor for BagLanguageSource()
{
  return type metadata accessor for BagLanguageSource();
}

uint64_t LintedMetricsEvent.init(fields:issues:)()
{
  return LintedMetricsEvent.init(fields:issues:)();
}

uint64_t type metadata accessor for LintedMetricsEvent()
{
  return type metadata accessor for LintedMetricsEvent();
}

uint64_t MetricsFieldsContext.init()()
{
  return MetricsFieldsContext.init()();
}

uint64_t type metadata accessor for MetricsFieldsContext()
{
  return type metadata accessor for MetricsFieldsContext();
}

Swift::Bool __swiftcall AppleServicesLocalizer.isLocalizedString(_:)(Swift::String a1)
{
  return AppleServicesLocalizer.isLocalizedString(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t AppleServicesLocalizer.string(forKey:with:using:)()
{
  return AppleServicesLocalizer.string(forKey:with:using:)();
}

uint64_t type metadata accessor for AppleServicesLocalizer()
{
  return type metadata accessor for AppleServicesLocalizer();
}

uint64_t LocalizedStringsBundle.init(resourceBundle:indexPath:)()
{
  return LocalizedStringsBundle.init(resourceBundle:indexPath:)();
}

uint64_t type metadata accessor for LocalizedStringsBundle()
{
  return type metadata accessor for LocalizedStringsBundle();
}

uint64_t URLJetPackAssetFetcher.init(bag:urlSessionConfiguration:)()
{
  return URLJetPackAssetFetcher.init(bag:urlSessionConfiguration:)();
}

uint64_t type metadata accessor for URLJetPackAssetFetcher()
{
  return type metadata accessor for URLJetPackAssetFetcher();
}

uint64_t URLJetPackAssetRequest.init(url:sourcePolicy:)()
{
  return URLJetPackAssetRequest.init(url:sourcePolicy:)();
}

uint64_t type metadata accessor for URLJetPackAssetRequest()
{
  return type metadata accessor for URLJetPackAssetRequest();
}

uint64_t AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)()
{
  return AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:)();
}

uint64_t type metadata accessor for AMSMetricsEventRecorder()
{
  return type metadata accessor for AMSMetricsEventRecorder();
}

uint64_t type metadata accessor for LocalizerLookupStrategy()
{
  return type metadata accessor for LocalizerLookupStrategy();
}

uint64_t JSNetworkPerformanceMetrics.init(deserializing:using:)()
{
  return JSNetworkPerformanceMetrics.init(deserializing:using:)();
}

uint64_t type metadata accessor for JSNetworkPerformanceMetrics()
{
  return type metadata accessor for JSNetworkPerformanceMetrics();
}

uint64_t static MetricsFieldInclusionRequest.pageFields.getter()
{
  return static MetricsFieldInclusionRequest.pageFields.getter();
}

uint64_t static MetricsFieldInclusionRequest.impressions.getter()
{
  return static MetricsFieldInclusionRequest.impressions.getter();
}

uint64_t static MetricsFieldInclusionRequest.pageReferrer.getter()
{
  return static MetricsFieldInclusionRequest.pageReferrer.getter();
}

uint64_t static MetricsFieldInclusionRequest.crossfireReferral.getter()
{
  return static MetricsFieldInclusionRequest.crossfireReferral.getter();
}

uint64_t type metadata accessor for MetricsFieldInclusionRequest()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t Bag.init(from:)()
{
  return Bag.init(from:)();
}

uint64_t type metadata accessor for Bag()
{
  return type metadata accessor for Bag();
}

uint64_t Promise.__allocating_init(value:)()
{
  return Promise.__allocating_init(value:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.init(continuation:function:)()
{
  return CheckedContinuation.init(continuation:function:)();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Collection<>.popFirst()()
{
  return Collection<>.popFirst()();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t type metadata accessor for UITextItem.Content()
{
  return type metadata accessor for UITextItem.Content();
}

uint64_t UITextItem.content.getter()
{
  return UITextItem.content.getter();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return NSDictionary.init(dictionaryLiteral:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static UITextDirection.layout(_:)()
{
  return static UITextDirection.layout(_:)();
}

uint64_t NSAttributedString.init(markdown:options:baseURL:)()
{
  return NSAttributedString.init(markdown:options:baseURL:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

UIColor __swiftcall UIColor.init(_colorLiteralRed:green:blue:alpha:)(Swift::Float _colorLiteralRed, Swift::Float green, Swift::Float blue, Swift::Float alpha)
{
  return (UIColor)UIColor.init(_colorLiteralRed:green:blue:alpha:)(_colorLiteralRed, green, blue, alpha);
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t UIButton.Configuration.baseForegroundColor.setter()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t UIButton.Configuration.title.setter()
{
  return UIButton.Configuration.title.setter();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.configuration.getter()
{
  return UIButton.configuration.getter();
}

uint64_t UIButton.configuration.setter()
{
  return UIButton.configuration.setter();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t type metadata accessor for ArraySlice()
{
  return type metadata accessor for ArraySlice();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return ArraySlice.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t type metadata accessor for DecodingError()
{
  return type metadata accessor for DecodingError();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return CodingUserInfoKey.init(rawValue:)();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return type metadata accessor for CodingUserInfoKey();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return type metadata accessor for KeyedEncodingContainer();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)()
{
  return dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)()
{
  return dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.unkeyedContainer()()
{
  return dispatch thunk of Decoder.unkeyedContainer()();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return dispatch thunk of Decoder.userInfo.getter();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.unkeyedContainer()()
{
  return dispatch thunk of Encoder.unkeyedContainer()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return TaskLocal.init(wrappedValue:)();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

uint64_t SecAccessControlSetConstraints()
{
  return _SecAccessControlSetConstraints();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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
  return __os_activity_create(dso, description, activity, flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
}

uint64_t os_transaction_get_timestamp()
{
  return _os_transaction_get_timestamp();
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__requestWithID_kind_context_appVersionId_distributorId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestWithID:kind:context:appVersionId:distributorId:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithID_kind_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithID:kind:context:];
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithStringValue:];
}

id objc_msgSend_miniProductPagePresentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 miniProductPagePresentingViewController];
}

id objc_msgSend_miniProductPageRequestDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 miniProductPageRequestDidFinish];
}

id objc_msgSend_moreButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 moreButtonPressed];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return [a1 setRequest:];
}