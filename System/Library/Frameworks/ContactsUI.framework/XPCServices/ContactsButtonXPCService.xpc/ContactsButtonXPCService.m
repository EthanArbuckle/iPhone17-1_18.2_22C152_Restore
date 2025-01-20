int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  qword_10002E720 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  v3 = sub_10001FBF8();
  sub_100003F4C(v3, (uint64_t)qword_10002E740);
  v4 = sub_10001FBD8();
  v5 = sub_100020278();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "#ContactsButton service created delegate", v6, 2u);
    swift_slowDealloc();
  }

  qword_10002E728 = (uint64_t)[self serviceListener];
  [(id)qword_10002E728 setDelegate:qword_10002E720];
  v7 = sub_10001FBD8();
  v8 = sub_100020278();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#ContactsButton service have just set delegate", v9, 2u);
    swift_slowDealloc();
  }

  [(id)qword_10002E728 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  uint64_t result = qword_10002DBF0;
  if (!qword_10002DBF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100003EA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100003F4C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003F84(uint64_t a1, uint64_t a2)
{
  return sub_100004398(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003F9C(uint64_t a1, id *a2)
{
  uint64_t result = sub_100020098();
  *a2 = 0;
  return result;
}

uint64_t sub_100004014(uint64_t a1, id *a2)
{
  char v3 = sub_1000200A8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100004094@<X0>(void *a1@<X8>)
{
  sub_1000200B8();
  NSString v2 = sub_100020088();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000040D8()
{
  return sub_10001FBC8();
}

uint64_t sub_100004124()
{
  return sub_10001FBB8();
}

Swift::Int sub_10000417C()
{
  return sub_1000204F8();
}

uint64_t sub_1000041E4()
{
  swift_getWitnessTable();

  return sub_10001FBA8();
}

uint64_t sub_100004250@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100020088();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100004298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000200B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000042C4(uint64_t a1)
{
  uint64_t v2 = sub_100004744(&qword_10002DC98, type metadata accessor for UIContentSizeCategory);
  uint64_t v3 = sub_100004744(&qword_10002DCA0, type metadata accessor for UIContentSizeCategory);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100004380(uint64_t a1, uint64_t a2)
{
  return sub_100004398(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100004398(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1000200B8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000043DC()
{
  sub_1000200B8();
  sub_100020108();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100004430()
{
  sub_1000200B8();
  sub_1000204E8();
  sub_100020108();
  Swift::Int v0 = sub_1000204F8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000044A4()
{
  uint64_t v0 = sub_1000200B8();
  uint64_t v2 = v1;
  if (v0 == sub_1000200B8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000204A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100004530()
{
  return type metadata accessor for ServiceDelegate();
}

uint64_t sub_100004538()
{
  uint64_t result = sub_10001FBF8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ContactAccessButtonDenied(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100004600(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000460C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000462C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void type metadata accessor for UIContentSizeCategory(uint64_t a1)
{
}

__n128 sub_100004694(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_1000046B4()
{
  return sub_100004744(&qword_10002DC80, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1000046FC()
{
  return sub_100004744(&qword_10002DC88, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_100004744(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000478C()
{
  return sub_100004744(&qword_10002DC90, type metadata accessor for UIContentSizeCategory);
}

uint64_t sub_1000047D4(void *a1)
{
  id v2 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP10ContactsUI19ContactsButtonAgent_];
  [a1 setExportedInterface:v2];

  long long v3 = sub_10001FBD8();
  os_log_type_t v4 = sub_100020278();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)char v5 = 136315138;
    sub_10001A630(0xD000000000000013, 0x80000001000236B0, &v21);
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#ContactsButton service exporting interface %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v6 = objc_allocWithZone((Class)type metadata accessor for ContactsButtonServiceProvider());
  id v7 = a1;
  sub_1000147D8(v7);
  v9 = v8;
  [v7 setExportedObject:v8];
  id v10 = v9;
  v11 = sub_10001FBD8();
  os_log_type_t v12 = sub_100020278();
  if (os_log_type_enabled(v11, v12))
  {
    id v20 = v7;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (void *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    uint64_t v21 = (uint64_t)v10;
    id v15 = v10;
    sub_100020338();
    void *v14 = v10;

    id v7 = v20;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "#ContactsButton service exporting object %@", v13, 0xCu);
    sub_100004B44(&qword_10002DCA8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [v7 resume];
  v16 = sub_10001FBD8();
  os_log_type_t v17 = sub_100020278();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "#ContactsButton service resuming connection...", v18, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_100004B44(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for CGContext(uint64_t a1)
{
}

__n128 sub_100004B9C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004BA8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100004BC8(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_100004C2C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004C74()
{
  return sub_100004744(&qword_10002DCD0, type metadata accessor for CFString);
}

uint64_t sub_100004CBC()
{
  return sub_100004744(&qword_10002DCD8, type metadata accessor for CFString);
}

id sub_100004D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100004B44(&qword_10002DF58);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v31 - v10;
  uint64_t v12 = sub_10001FB08();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  v32 = v11;
  v13(v11, 1, 1, v12);
  id v14 = objc_allocWithZone((Class)LSApplicationExtensionRecord);
  swift_bridgeObjectRetain();
  id v15 = sub_100005224();
  v31 = v9;
  v16 = v15;
  uint64_t v33 = a3;
  id result = [self defaultWorkspace];
  if (!result)
  {
    __break(1u);
    return result;
  }
  v18 = result;
  NSString v19 = sub_100020088();
  unsigned __int8 v20 = [v18 applicationIsInstalled:v19];

  if (v20)
  {
    if (!v16)
    {
      id v21 = objc_allocWithZone((Class)LSApplicationRecord);
      swift_bridgeObjectRetain();
      id v27 = sub_10001A0DC(a1, a2, 0);
      id v28 = [v27 URL];
      uint64_t v29 = (uint64_t)v31;
      sub_10001FAF8();

      uint64_t v30 = (uint64_t)v32;
      sub_1000067C4((uint64_t)v32, &qword_10002DF58);
      v13((char *)v29, 0, 1, v12);
      sub_10000687C(v29, v30);
      return (id)sub_10000687C(v30, v33);
    }
  }
  else if (!v16)
  {
    sub_1000067C4((uint64_t)v32, &qword_10002DF58);
    uint64_t v25 = v33;
    uint64_t v26 = 1;
    return (id)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13)(v25, v26, 1, v12);
  }
  id v22 = v16;
  id v23 = [v22 URL];
  uint64_t v24 = v33;
  sub_10001FAF8();

  sub_1000067C4((uint64_t)v32, &qword_10002DF58);
  uint64_t v25 = v24;
  uint64_t v26 = 0;
  return (id)((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v13)(v25, v26, 1, v12);
}

uint64_t sub_1000051F0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ContactsButtonPurposeStringHelper()
{
  return self;
}

id sub_100005224()
{
  NSString v1 = sub_100020088();
  swift_bridgeObjectRelease();
  id v6 = 0;
  id v2 = [v0 initWithBundleIdentifier:v1 error:&v6];

  if (v2)
  {
    id v3 = v6;
  }
  else
  {
    id v4 = v6;
    sub_10001FAD8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1000052F0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v134 = a3;
  uint64_t v7 = sub_100004B44(&qword_10002DF58);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v131 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v114 - v10;
  uint64_t v12 = sub_10001FB08();
  v13 = *(void **)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  v126 = (char *)&v114 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  v18 = (char *)&v114 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  v130 = (char *)&v114 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  id v23 = (char *)&v114 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v114 - v25;
  __chkstk_darwin(v24);
  id v28 = (char *)&v114 - v27;
  type metadata accessor for ContactsButtonPurposeStringHelper();
  uint64_t v133 = a1;
  sub_100004D14(a1, a2, (uint64_t)v11);
  v128 = (unsigned int (*)(char *, uint64_t, uint64_t))v13[6];
  v129 = v13 + 6;
  if (v128(v11, 1, v12) == 1)
  {
    sub_1000067C4((uint64_t)v11, &qword_10002DF58);
    if (qword_10002DB58 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_10001FBF8();
    sub_100003F4C(v29, (uint64_t)qword_10002E740);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_10001FBD8();
    os_log_type_t v31 = sub_100020298();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v136 = swift_slowAlloc();
      *(_DWORD *)v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_10001A630(v133, a2, (uint64_t *)&v136);
      sub_100020338();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "#ContactsButton unable to get url for %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v115 = v18;
  v119 = v23;
  v120 = (void (*)(char *, char *, uint64_t))v13[4];
  v120(v28, v11, v12);
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_10001FBF8();
  uint64_t v34 = sub_100003F4C(v33, (uint64_t)qword_10002E740);
  v35 = (void (*)(char *, char *, uint64_t))v13[2];
  v118 = v13 + 2;
  v117 = v35;
  v35(v26, v28, v12);
  swift_bridgeObjectRetain_n();
  uint64_t v124 = v34;
  v36 = sub_10001FBD8();
  os_log_type_t v37 = sub_100020278();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v132 = v12;
  v127 = v28;
  v121 = v13 + 4;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    uint64_t v123 = swift_slowAlloc();
    *(void *)&long long v136 = v123;
    *(_DWORD *)uint64_t v39 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v135 = sub_10001A630(v133, a2, (uint64_t *)&v136);
    sub_100020338();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 2080;
    sub_100006714();
    uint64_t v40 = sub_100020498();
    uint64_t v135 = sub_10001A630(v40, v41, (uint64_t *)&v136);
    sub_100020338();
    swift_bridgeObjectRelease();
    v125 = (void (*)(char *, uint64_t))v13[1];
    v125(v26, v132);
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "#ContactsButton bundle for %s found at %s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    id v28 = v127;
    swift_slowDealloc();
    uint64_t v12 = v132;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    v125 = (void (*)(char *, uint64_t))v13[1];
    v125(v26, v12);
  }

  id v42 = objc_allocWithZone((Class)NSBundle);
  sub_10001FAE8(v43);
  v45 = v44;
  v46 = (char *)[v42 initWithURL:v44];

  if (!v46)
  {
    swift_bridgeObjectRetain_n();
    v84 = sub_10001FBD8();
    os_log_type_t v85 = sub_100020298();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v136 = swift_slowAlloc();
      *(_DWORD *)v86 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_10001A630(v133, a2, (uint64_t *)&v136);
      sub_100020338();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v84, v85, "#ContactsButton failed to create bundle for %s", v86, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_36;
  }
  unint64_t v116 = a2;
  v122 = v13;
  id v47 = [v46 preferredLocalizations];
  uint64_t v48 = sub_100020198();

  uint64_t v123 = v48;
  uint64_t v49 = *(void *)(v48 + 16);
  if (!v49)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    NSString v64 = sub_100020088();
    NSString v65 = sub_100020088();
    id v66 = [v46 URLForResource:v64 withExtension:v65];

    if (v66)
    {
      v67 = v130;
      sub_10001FAF8();

      uint64_t v68 = (uint64_t)v131;
      uint64_t v12 = v132;
      v69 = (void (*)(char *, uint64_t, uint64_t))v120;
      v120(v131, v67, v132);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v122[7])(v68, 0, 1, v12);
      unsigned int v70 = v128((char *)v68, 1, v12);
      id v28 = v127;
      unint64_t v71 = v116;
      if (v70 != 1)
      {
        v130 = v46;
        v72 = v119;
        v69(v119, v68, v12);
        uint64_t v94 = sub_10001FB18();
        unint64_t v96 = v95;
        v97 = self;
        Class isa = sub_10001FB28().super.isa;
        *(void *)&long long v136 = 0;
        id v99 = [v97 propertyListWithData:isa options:0 format:0 error:&v136];

        if (v99)
        {
          id v100 = (id)v136;
          sub_100020358();
          sub_10000676C(v94, v96);
          swift_unknownObjectRelease();
          sub_100004B44(&qword_10002DF68);
          if (swift_dynamicCast()) {
            uint64_t v101 = v135;
          }
          else {
            uint64_t v101 = 0;
          }
          if (v101 && *(void *)(v101 + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v102 = sub_10001ACD8(v134, a4);
            if (v103)
            {
              sub_100006820(*(void *)(v101 + 56) + 32 * v102, (uint64_t)&v136);
            }
            else
            {
              long long v136 = 0u;
              long long v137 = 0u;
            }
            swift_bridgeObjectRelease();
            if (*((void *)&v137 + 1))
            {
              if (swift_dynamicCast())
              {

                uint64_t v57 = v135;
                v113 = v125;
                v125(v72, v12);
                v113(v28, v12);
                swift_bridgeObjectRelease();
                return v57;
              }
              goto LABEL_53;
            }
          }
          else
          {
            long long v136 = 0u;
            long long v137 = 0u;
          }
          sub_1000067C4((uint64_t)&v136, (uint64_t *)&unk_10002DF70);
LABEL_53:
          v104 = v115;
          v117(v115, v72, v12);
          swift_bridgeObjectRetain_n();
          v105 = sub_10001FBD8();
          os_log_type_t v106 = sub_100020298();
          if (os_log_type_enabled(v105, v106))
          {
            uint64_t v107 = swift_slowAlloc();
            *(void *)&long long v136 = swift_slowAlloc();
            *(_DWORD *)uint64_t v107 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v135 = sub_10001A630(v134, a4, (uint64_t *)&v136);
            sub_100020338();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v107 + 12) = 2080;
            sub_100006714();
            uint64_t v108 = sub_100020498();
            uint64_t v135 = sub_10001A630(v108, v109, (uint64_t *)&v136);
            sub_100020338();
            swift_bridgeObjectRelease();
            v110 = v125;
            v125(v104, v12);
            _os_log_impl((void *)&_mh_execute_header, v105, v106, "#ContactsButton no %s in %s", (uint8_t *)v107, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v110(v119, v12);
            v110(v127, v12);
          }
          else
          {

            v112 = v125;
            v125(v104, v12);
            swift_bridgeObjectRelease_n();
            v112(v72, v12);
            v112(v28, v12);
          }
          swift_bridgeObjectRelease();
          return 0;
        }
        id v111 = (id)v136;
        sub_10001FAD8();

        swift_willThrow();
        sub_10000676C(v94, v96);
        v73 = v126;
        v117(v126, v72, v12);
        swift_errorRetain();
        swift_errorRetain();
        v74 = sub_10001FBD8();
        v75 = v72;
        os_log_type_t v76 = sub_100020298();
        if (os_log_type_enabled(v74, v76))
        {
          uint64_t v77 = swift_slowAlloc();
          uint64_t v134 = swift_slowAlloc();
          *(void *)&long long v136 = v134;
          *(_DWORD *)uint64_t v77 = 136315394;
          sub_100006714();
          uint64_t v78 = sub_100020498();
          uint64_t v135 = sub_10001A630(v78, v79, (uint64_t *)&v136);
          sub_100020338();
          swift_bridgeObjectRelease();
          v80 = v73;
          v81 = v125;
          v125(v80, v12);
          *(_WORD *)(v77 + 12) = 2080;
          swift_getErrorValue();
          uint64_t v82 = sub_1000204D8();
          uint64_t v135 = sub_10001A630(v82, v83, (uint64_t *)&v136);
          sub_100020338();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v74, v76, "#ContactsButton encountered an error reading %s: %s", (uint8_t *)v77, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
          v81(v119, v12);
          v81(v127, v12);
        }
        else
        {

          swift_errorRelease();
          swift_errorRelease();
          v93 = v125;
          v125(v73, v12);
          swift_errorRelease();
          v93(v75, v12);
          v93(v28, v12);
        }
        return 0;
      }
    }
    else
    {
      uint64_t v68 = (uint64_t)v131;
      uint64_t v12 = v132;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v122[7])(v131, 1, 1, v132);
      id v28 = v127;
      unint64_t v71 = v116;
    }
    sub_1000067C4(v68, &qword_10002DF58);
    swift_bridgeObjectRetain_n();
    v87 = sub_10001FBD8();
    os_log_type_t v88 = sub_100020298();
    if (os_log_type_enabled(v87, v88))
    {
      v130 = v46;
      v89 = v28;
      v90 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v136 = swift_slowAlloc();
      *(_DWORD *)v90 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v135 = sub_10001A630(v133, v71, (uint64_t *)&v136);
      sub_100020338();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v87, v88, "#ContactsButton can't find Info.plist for %s", v90, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v91 = v89;
LABEL_37:
      v125(v91, v12);
      return 0;
    }
    swift_bridgeObjectRelease_n();

LABEL_36:
    v91 = v28;
    goto LABEL_37;
  }
  uint64_t v50 = v123 + 40;
  uint64_t v51 = v134;
  while (1)
  {
    swift_bridgeObjectRetain();
    NSString v52 = sub_100020088();
    NSString v53 = sub_100020088();
    NSString v54 = sub_100020088();
    swift_bridgeObjectRelease();
    v55 = v46;
    id v56 = [v46 localizedStringForKey:v52 value:0 table:v53 localization:v54];

    uint64_t v57 = sub_1000200B8();
    unint64_t v59 = v58;

    BOOL v60 = v57 == v51 && v59 == a4;
    if (!v60 && (sub_1000204A8() & 1) == 0) {
      break;
    }
    v50 += 16;
    swift_bridgeObjectRelease();
    --v49;
    v46 = v55;
    if (!v49) {
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v61 = sub_10001FBD8();
  os_log_type_t v62 = sub_100020278();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v136 = swift_slowAlloc();
    *(_DWORD *)v63 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v135 = sub_10001A630(v57, v59, (uint64_t *)&v136);
    sub_100020338();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "#ContactsButton fetched possibly localized purpose string: %s", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v125(v127, v132);
  return v57;
}

unint64_t sub_100006714()
{
  unint64_t result = qword_10002DF60;
  if (!qword_10002DF60)
  {
    sub_10001FB08();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002DF60);
  }
  return result;
}

uint64_t sub_10000676C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000067C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004B44(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000687C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004B44(&qword_10002DF58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_1000068E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    id v6 = &_swiftEmptyArrayStorage;
    sub_1000203E8();
    uint64_t v4 = a1 + 32;
    do
    {
      sub_100006820(v4, (uint64_t)&v5);
      sub_100004B44((uint64_t *)&unk_10002E080);
      swift_dynamicCast();
      sub_1000203C8();
      sub_1000203F8();
      sub_100020408();
      sub_1000203D8();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_1000069D0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  sub_100020178();
  if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1000201B8();
  }
  sub_1000201D8();
  return sub_1000201A8();
}

void sub_100006A40(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_100006A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_1000204E8();
    sub_100020108();
    Swift::Int v6 = sub_1000204F8();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1000204A8() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1000204A8() & 1) != 0) {
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

void sub_100006BD4(id *a1, unint64_t a2)
{
  id v5 = [*a1 emailAddresses];
  sub_100004B44(&qword_10002E660);
  unint64_t v6 = sub_100020198();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100020428();
    swift_bridgeObjectRelease();
    unint64_t v37 = a2;
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v37 = a2;
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  sub_10001B044(0, v7 & ~(v7 >> 63), 0);
  if (v7 < 0)
  {
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v8 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_1000203A8();
    }
    else {
      id v9 = *(id *)(v6 + 8 * v8 + 32);
    }
    uint64_t v10 = v9;
    id v11 = [v9 value];
    uint64_t v12 = sub_1000200B8();
    uint64_t v14 = v13;

    unint64_t v16 = _swiftEmptyArrayStorage[2];
    unint64_t v15 = _swiftEmptyArrayStorage[3];
    if (v16 >= v15 >> 1) {
      sub_10001B044(v15 > 1, v16 + 1, 1);
    }
    ++v8;
    _swiftEmptyArrayStorage[2] = v16 + 1;
    BOOL v17 = (char *)&_swiftEmptyArrayStorage[2 * v16];
    *((void *)v17 + 4) = v12;
    *((void *)v17 + 5) = v14;
  }
  while (v7 != v8);
  swift_bridgeObjectRelease();
  a2 = v37;
LABEL_14:
  v18 = self;
  Class isa = sub_100020188().super.isa;
  swift_bridgeObjectRelease();
  id v20 = [v18 emailAddressesFromStrings:isa invalidAddresses:0];

  sub_100009C7C(0, (unint64_t *)&unk_10002E0A0);
  unint64_t v2 = sub_100020198();

  if (v2 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100020428();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      goto LABEL_35;
    }
  }
  if (!(a2 >> 62))
  {
    uint64_t v21 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_18;
  }
LABEL_42:
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100020428();
  swift_bridgeObjectRelease();
LABEL_18:
  unint64_t v22 = 0;
  unint64_t v23 = v2 & 0xC000000000000001;
  unint64_t v34 = v2 + 32;
  uint64_t v35 = v2 & 0xFFFFFFFFFFFFFF8;
  unint64_t v24 = a2 & 0xC000000000000001;
  unint64_t v36 = v2;
  unint64_t v32 = v2 & 0xC000000000000001;
  uint64_t v33 = v3;
  while (1)
  {
LABEL_19:
    if (v23)
    {
      id v25 = (id)sub_1000203A8();
    }
    else
    {
      if (v22 >= *(void *)(v35 + 16))
      {
        __break(1u);
        return;
      }
      id v25 = *(id *)(v34 + 8 * v22);
    }
    uint64_t v26 = v25;
    if (__OFADD__(v22++, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v21) {
      break;
    }

    if (v22 == v3) {
      goto LABEL_35;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v2 = 4;
  do
  {
    if (v24) {
      id v28 = (id)sub_1000203A8();
    }
    else {
      id v28 = *(id *)(a2 + 8 * v2);
    }
    uint64_t v29 = v28;
    unint64_t v30 = v2 - 3;
    if (__OFADD__(v2 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    id v31 = [v28 compare:v26];

    if (!v31)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    ++v2;
    a2 = v37;
  }
  while (v30 != v21);

  swift_bridgeObjectRelease();
  unint64_t v2 = v36;
  unint64_t v23 = v32;
  uint64_t v3 = v33;
  if (v22 != v33) {
    goto LABEL_19;
  }
LABEL_35:
  swift_bridgeObjectRelease();
}

uint64_t sub_100006FC4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_100007140(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_100020468();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ContactsButtonQueryHandler()
{
  return self;
}

void *sub_100007140(void *result, int64_t a2, char a3, void *a4)
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
      sub_100004B44(&qword_10002E090);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      BOOL v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = _swiftEmptyArrayStorage;
      BOOL v13 = &_swiftEmptyArrayStorage[4];
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
    sub_100009160(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100007250(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004B44(&qword_10002E090);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100007DC8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_100009C74();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100007338(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_1000204E8();
  swift_bridgeObjectRetain();
  sub_100020108();
  Swift::Int v8 = sub_1000204F8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1000204A8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1000204A8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1000077C8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000074E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004B44(&qword_10002E0B0);
  uint64_t v3 = sub_100020388();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      sub_1000204E8();
      sub_100020108();
      uint64_t result = sub_1000204F8();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_1000077C8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1000074E8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100007964();
      goto LABEL_22;
    }
    sub_100007B18();
  }
  uint64_t v11 = *v4;
  sub_1000204E8();
  sub_100020108();
  uint64_t result = sub_1000204F8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1000204A8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1000204B8();
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
          uint64_t result = sub_1000204A8();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_100007964()
{
  uint64_t v1 = v0;
  sub_100004B44(&qword_10002E0B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100020378();
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
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_100007B18()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004B44(&qword_10002E0B0);
  uint64_t v3 = sub_100020388();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1000204E8();
    swift_bridgeObjectRetain();
    sub_100020108();
    uint64_t result = sub_1000204F8();
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
    void *v13 = v20;
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

uint64_t sub_100007DC8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_100007FC8()
{
  id v0 = [self descriptorForRequiredKeysForStyle:0];
  sub_100004B44(&qword_10002E018);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000210C0;
  *(void *)(inited + 56) = swift_getObjectType();
  *(void *)(inited + 32) = v0;
  uint64_t v2 = sub_1000200B8();
  *(void *)(inited + 88) = &type metadata for String;
  *(void *)(inited + 64) = v2;
  *(void *)(inited + 72) = v3;
  uint64_t v4 = sub_1000200B8();
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v5;
  uint64_t v6 = sub_1000200B8();
  *(void *)(inited + 152) = &type metadata for String;
  *(void *)(inited + 128) = v6;
  *(void *)(inited + 136) = v7;
  uint64_t v8 = sub_1000200B8();
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 160) = v8;
  *(void *)(inited + 168) = v9;
  swift_unknownObjectRetain();
  sub_1000068E4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  id v10 = objc_allocWithZone((Class)CNContactFetchRequest);
  sub_100004B44((uint64_t *)&unk_10002E080);
  Class isa = sub_100020188().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithKeysToFetch:isa];

  unint64_t v23 = _swiftEmptyArrayStorage;
  id v13 = [objc_allocWithZone((Class)CNContactStore) init];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = &v23;
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = sub_100008340;
  v15[3] = v14;
  aBlock[4] = sub_100008358;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_100006A40;
  aBlock[3] = &unk_100029440;
  unint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  unsigned int v17 = [v13 enumerateContactsWithFetchRequest:v12 error:aBlock usingBlock:v16];
  _Block_release(v16);

  id v18 = aBlock[0];
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  if (v17)
  {
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10001FAD8();

    swift_willThrow();
    swift_errorRelease();
    swift_unknownObjectRelease();
  }
  uint64_t v20 = v23;
  swift_release();
  return v20;
}

uint64_t sub_100008330()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008340(void *a1, uint64_t a2)
{
  return sub_1000069D0(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100008348()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008358()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100008380(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008390()
{
  return swift_release();
}

void sub_100008398(void *a1, uint64_t a2, unint64_t a3)
{
  id v6 = [objc_allocWithZone((Class)CNContactStore) init];
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_10001FBF8();
  sub_100003F4C(v7, (uint64_t)qword_10002E740);
  id v8 = a1;
  swift_bridgeObjectRetain_n();
  id v9 = v8;
  id v10 = sub_10001FBD8();
  os_log_type_t v11 = sub_100020278();
  id v12 = &ServiceDelegate;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    id v15 = [v9 identifier];
    uint64_t v16 = sub_1000200B8();
    uint64_t v22 = a2;
    unint64_t v18 = v17;

    sub_10001A630(v16, v18, &v23);
    sub_100020338();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    id v19 = v9;
    sub_100020338();
    void *v14 = v9;

    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_10001A630(v22, a3, &v23);
    id v12 = &ServiceDelegate;
    sub_100020338();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "#ContactsButton adding contact with ID %s (%@) to bundle %s", (uint8_t *)v13, 0x20u);
    sub_100004B44(&qword_10002DCA8);
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
  NSString v20 = sub_100020088();
  NSString v21 = [v9 (SEL)v12[511].count];
  if (!v21)
  {
    sub_1000200B8();
    NSString v21 = sub_100020088();
    swift_bridgeObjectRelease();
  }
  [v6 addLimitedAccessForBundle:v20 contactIdentifier:v21];
}

uint64_t sub_1000086F8(uint64_t a1, unint64_t a2, void *a3)
{
  id v6 = self;
  NSString v7 = sub_100020088();
  id v8 = [v6 predicateForContactsMatchingName:v7 options:1];

  sub_100004B44((uint64_t *)&unk_10002E080);
  Class isa = sub_100020188().super.isa;
  id v22 = 0;
  id v10 = [a3 unifiedContactsMatchingPredicate:v8 keysToFetch:isa error:&v22];

  id v11 = v22;
  if (v10)
  {
    sub_100009C7C(0, &qword_10002E0B8);
    uint64_t v12 = sub_100020198();
    id v13 = v11;
  }
  else
  {
    id v14 = v22;
    sub_10001FAD8();

    swift_willThrow();
    if (qword_10002DB58 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001FBF8();
    sub_100003F4C(v15, (uint64_t)qword_10002E740);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v16 = sub_10001FBD8();
    os_log_type_t v17 = sub_100020298();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      id v19 = (void *)swift_slowAlloc();
      id v22 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315394;
      swift_bridgeObjectRetain();
      sub_10001A630(a1, a2, (uint64_t *)&v22);
      sub_100020338();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v18 + 12) = 2112;
      swift_errorRetain();
      uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
      sub_100020338();
      *id v19 = v21;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "#ContactsButton query failed for %s: %@", (uint8_t *)v18, 0x16u);
      sub_100004B44(&qword_10002DCA8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
    return 0;
  }
  return v12;
}

uint64_t sub_100008A98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100020258();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100007338(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_100008B30(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_1000203A8();
LABEL_9:
        Swift::Int v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        id v8 = [v5 identifier];
        uint64_t v9 = sub_1000200B8();
        uint64_t v11 = v10;

        LOBYTE(v8) = sub_100006A9C(v9, v11, a2);
        swift_bridgeObjectRelease();
        if (v8)
        {
        }
        else
        {
          sub_1000203C8();
          sub_1000203F8();
          sub_100020408();
          sub_1000203D8();
        }
        ++v4;
        if (v7 == v3) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_100020428();
      if (!v3) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_100008CB8(unint64_t a1, void *a2)
{
  unint64_t v4 = a1;
  os_log_type_t v17 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      unint64_t v7 = v4 & 0xC000000000000001;
      uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v14 = v5;
      unint64_t v15 = v4;
      while (v7)
      {
        id v9 = (id)sub_1000203A8();
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_17;
        }
        id v16 = v9;
        sub_100006BD4(&v16, (unint64_t)a2);
        if (v2)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return a2;
        }
        if (v12)
        {
          sub_1000203C8();
          sub_1000203F8();
          sub_100020408();
          sub_1000203D8();
          uint64_t v5 = v14;
          unint64_t v4 = v15;
        }
        else
        {
        }
        ++v6;
        if (v11 == v5)
        {
          a2 = v17;
          goto LABEL_20;
        }
      }
      if (v6 < *(void *)(v8 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v5 = sub_100020428();
      if (!v5) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v6 + 32);
    goto LABEL_9;
  }
LABEL_19:
  a2 = _swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return a2;
}

void *sub_100008E50(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_100009C7C(0, &qword_10002E098);
    uint64_t v3 = (void *)sub_100020308();
    unint64_t v4 = self;
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_100007250(v5);
    swift_bridgeObjectRelease();
    Class isa = sub_100020188().super.isa;
    swift_release();
    v19[0] = v3;
    id v7 = [v4 emailAddressesFromStrings:isa invalidAddresses:v19];

    id v20 = v19[0];
    id v8 = v19[0];

    sub_100009C7C(0, (unint64_t *)&unk_10002E0A0);
    id v9 = (void *)sub_100020198();

    if (v8 && (uint64_t)[v8 count] >= 1)
    {
      if (qword_10002DB58 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_10001FBF8();
      sub_100003F4C(v10, (uint64_t)qword_10002E740);
      unint64_t v11 = sub_10001FBD8();
      os_log_type_t v12 = sub_100020298();
      if (os_log_type_enabled(v11, v12))
      {
        id v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = (void *)swift_slowAlloc();
        *(_DWORD *)id v13 = 138412290;
        swift_beginAccess();
        id v15 = v20;
        if (v20) {
          id v16 = v20;
        }
        sub_100020338();
        void *v14 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "#ContactsButton failed to convert these addresses: %@", v13, 0xCu);
        sub_100004B44(&qword_10002DCA8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
    }
    unint64_t v17 = swift_bridgeObjectRetain();
    a1 = sub_100008CB8(v17, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100009160(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100020468();
  __break(1u);
  return result;
}

void *sub_100009254(unint64_t a1, unint64_t *a2)
{
  unint64_t v2 = a1;
  unint64_t v24 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_100020428())
  {
    unint64_t v4 = 0;
    uint64_t v21 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v22 = v2 & 0xC000000000000001;
    uint64_t v19 = i;
    id v20 = (void **)(v2 + 32);
    while (1)
    {
      if (v22)
      {
        unint64_t v5 = (void *)sub_1000203A8();
      }
      else
      {
        if (v4 >= *(void *)(v21 + 16))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        unint64_t v5 = v20[v4];
      }
      unint64_t v6 = v5;
      if (__OFADD__(v4++, 1)) {
        goto LABEL_31;
      }
      unint64_t v2 = *a2;
      swift_bridgeObjectRetain();
      id v8 = [v6 identifier];
      uint64_t v9 = sub_1000200B8();
      unint64_t v11 = v10;

      os_log_type_t v12 = *(void **)(v2 + 16);
      if (!v12)
      {
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      BOOL v13 = *(void *)(v2 + 32) == v9 && *(void *)(v2 + 40) == (void)v11;
      if (!v13 && (sub_1000204A8() & 1) == 0) {
        break;
      }
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      uint64_t i = v19;
LABEL_5:
      if (v4 == i) {
        return v24;
      }
    }
    if (v12 == (void *)1)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      uint64_t i = v19;
LABEL_27:
      swift_bridgeObjectRelease();
      sub_1000203C8();
      sub_1000203F8();
      sub_100020408();
      unint64_t v2 = (unint64_t)&v24;
      sub_1000203D8();
      goto LABEL_5;
    }
    uint64_t v14 = (void *)(v2 + 56);
    uint64_t v15 = 1;
    while (1)
    {
      uint64_t v16 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      BOOL v17 = *(v14 - 1) == v9 && *v14 == (void)v11;
      if (v17 || (sub_1000204A8() & 1) != 0) {
        goto LABEL_4;
      }
      v14 += 2;
      ++v15;
      if ((void *)v16 == v12) {
        goto LABEL_25;
      }
    }
LABEL_32:
    __break(1u);
LABEL_33:
    ;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100009488(uint64_t a1, uint64_t a2, void *a3)
{
  if (!*(void *)(a2 + 16)) {
    return swift_bridgeObjectRetain();
  }
  unint64_t v36 = _swiftEmptyArrayStorage;
  uint64_t v32 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v33 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  id v31 = a3;
  while (1)
  {
    do
    {
      if (v6)
      {
        v6 &= v6 - 1;
      }
      else
      {
        int64_t v9 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_45;
        }
        if (v9 >= v33)
        {
LABEL_42:
          swift_release();
          unint64_t v29 = swift_bridgeObjectRetain();
          unint64_t v30 = sub_100009254(v29, (unint64_t *)&v36);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (uint64_t)v30;
        }
        uint64_t v10 = *(void *)(v32 + 8 * v9);
        ++v8;
        if (!v10)
        {
          int64_t v8 = v9 + 1;
          if (v9 + 1 >= v33) {
            goto LABEL_42;
          }
          uint64_t v10 = *(void *)(v32 + 8 * v8);
          if (!v10)
          {
            int64_t v8 = v9 + 2;
            if (v9 + 2 >= v33) {
              goto LABEL_42;
            }
            uint64_t v10 = *(void *)(v32 + 8 * v8);
            if (!v10)
            {
              int64_t v11 = v9 + 3;
              if (v11 >= v33) {
                goto LABEL_42;
              }
              uint64_t v10 = *(void *)(v32 + 8 * v11);
              if (!v10)
              {
                while (1)
                {
                  int64_t v8 = v11 + 1;
                  if (__OFADD__(v11, 1)) {
                    goto LABEL_46;
                  }
                  if (v8 >= v33) {
                    goto LABEL_42;
                  }
                  uint64_t v10 = *(void *)(v32 + 8 * v8);
                  ++v11;
                  if (v10) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v8 = v11;
            }
          }
        }
LABEL_21:
        uint64_t v6 = (v10 - 1) & v10;
      }
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_100020148();
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = v12;
        do
        {
          if ((sub_100020058() & 1) == 0)
          {
            v37._countAndFlagsBits = v15;
            v37._object = v14;
            sub_100020128(v37);
          }
          swift_bridgeObjectRelease();
          uint64_t v15 = sub_100020148();
          uint64_t v14 = v16;
        }
        while (v16);
        uint64_t v14 = 0;
      }
      swift_bridgeObjectRelease();
      unint64_t v17 = sub_1000086F8((uint64_t)v14, 0xE000000000000000, a3);
      uint64_t result = swift_bridgeObjectRelease();
    }
    while (!v17);
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100020428();
      swift_bridgeObjectRelease();
      uint64_t v35 = v6;
      if (!v18)
      {
LABEL_41:
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v35 = v6;
      if (!v18) {
        goto LABEL_41;
      }
    }
    uint64_t result = sub_10001B044(0, v18 & ~(v18 >> 63), 0);
    if (v18 < 0) {
      break;
    }
    int64_t v34 = v8;
    uint64_t v19 = 0;
    do
    {
      if ((v17 & 0xC000000000000001) != 0) {
        id v20 = (id)sub_1000203A8();
      }
      else {
        id v20 = *(id *)(v17 + 8 * v19 + 32);
      }
      uint64_t v21 = v20;
      id v22 = [v20 identifier];
      uint64_t v23 = sub_1000200B8();
      uint64_t v25 = v24;

      unint64_t v27 = _swiftEmptyArrayStorage[2];
      unint64_t v26 = _swiftEmptyArrayStorage[3];
      if (v27 >= v26 >> 1) {
        sub_10001B044(v26 > 1, v27 + 1, 1);
      }
      ++v19;
      _swiftEmptyArrayStorage[2] = v27 + 1;
      uint64_t v28 = &_swiftEmptyArrayStorage[2 * v27];
      v28[4] = v23;
      v28[5] = v25;
    }
    while (v18 != v19);
    swift_bridgeObjectRelease();
    a3 = v31;
    int64_t v8 = v34;
LABEL_5:
    uint64_t result = sub_100006FC4((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v6 = v35;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_100009858(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = [objc_allocWithZone((Class)CNContactStore) init];
  id v10 = [self descriptorForRequiredKeysForStyle:0];
  sub_100004B44(&qword_10002E018);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000210C0;
  *(void *)(inited + 56) = swift_getObjectType();
  *(void *)(inited + 32) = v10;
  uint64_t v12 = sub_1000200B8();
  *(void *)(inited + 88) = &type metadata for String;
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 72) = v13;
  uint64_t v14 = sub_1000200B8();
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v14;
  *(void *)(inited + 104) = v15;
  uint64_t v16 = sub_1000200B8();
  *(void *)(inited + 152) = &type metadata for String;
  *(void *)(inited + 128) = v16;
  *(void *)(inited + 136) = v17;
  uint64_t v18 = sub_1000200B8();
  *(void *)(inited + 184) = &type metadata for String;
  *(void *)(inited + 160) = v18;
  *(void *)(inited + 168) = v19;
  swift_unknownObjectRetain();
  sub_1000068E4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  unint64_t v20 = sub_1000086F8(a1, a2, v9);
  swift_bridgeObjectRelease();
  if (v20)
  {
    NSString v21 = sub_100020088();
    id v22 = [v9 fetchLimitedAccessContactIdentifiersForBundle:v21];

    uint64_t v23 = sub_100020198();
    uint64_t v24 = sub_100008A98(v23);
    swift_bridgeObjectRelease();
    if (qword_10002DB58 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_10001FBF8();
    sub_100003F4C(v25, (uint64_t)qword_10002E740);
    swift_bridgeObjectRetain_n();
    unint64_t v26 = sub_10001FBD8();
    os_log_type_t v27 = sub_100020288();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v38 = a6;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_100020248();
      id v37 = v9;
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      uint64_t v32 = v29;
      a6 = v38;
      sub_10001A630(v32, v31, &v40);
      sub_100020338();
      swift_bridgeObjectRelease_n();
      id v9 = v37;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "#ContactsButton already have contacts with IDs: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    int64_t v34 = sub_100008B30(v20, v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_100008E50(v34, a5);
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_100009488((uint64_t)v35, a6, v9);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    return 0;
  }
  return v33;
}

uint64_t sub_100009C74()
{
  return swift_release();
}

uint64_t sub_100009C7C(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ContactsButtonAnalyticsHelper()
{
  return self;
}

Class sub_100009CDC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10000B59C();
    v4.super.Class isa = sub_100020038().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_100009D68(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004B44((uint64_t *)&unk_10002E160);
  char v38 = a2;
  uint64_t v6 = sub_100020448();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1000204E8();
    sub_100020108();
    uint64_t result = sub_1000204F8();
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
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_10000A078(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001ACD8(a2, a3);
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
    sub_10000A1E8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100009D68(v15, a4 & 1);
  unint64_t v20 = sub_10001ACD8(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1000204C8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  id v22 = (uint64_t *)(v18[6] + 16 * v12);
  *id v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

id sub_10000A1E8()
{
  uint64_t v1 = v0;
  sub_100004B44((uint64_t *)&unk_10002E160);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100020438();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10000A39C(void *a1)
{
  uint64_t v2 = sub_10001FA78();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __int16 v54 = 0;
  __int16 v53 = 0;
  __int16 v52 = 0;
  __int16 v51 = 0;
  __int16 v50 = 0;
  char v49 = 0;
  id v6 = [a1 domain];
  uint64_t v7 = sub_1000200B8();
  uint64_t v9 = v8;

  sub_10001FA58();
  if (v7 == sub_10001F9B8() && v9 == v10)
  {
    swift_bridgeObjectRelease_n();
LABEL_11:
    id v24 = [a1 code];
    uint64_t v25 = *(void (**)(char *, void, uint64_t))(v3 + 104);
    v25(v5, enum case for ContactButtonServiceErrorType.avatarTooLarge(_:), v2);
    uint64_t v26 = sub_10001FA68();
    BOOL v27 = *(void (**)(char *, uint64_t))(v3 + 8);
    v27(v5, v2);
    if ((id)v26 == v24)
    {

      HIBYTE(v54) = 1;
    }
    else
    {
      v25(v5, enum case for ContactButtonServiceErrorType.fontTooBig(_:), v2);
      uint64_t v28 = sub_10001FA68();
      v27(v5, v2);
      if ((id)v28 == v24)
      {

        HIBYTE(v53) = 1;
      }
      else
      {
        v25(v5, enum case for ContactButtonServiceErrorType.fontTooSmall(_:), v2);
        uint64_t v29 = sub_10001FA68();
        v27(v5, v2);
        if ((id)v29 == v24)
        {

          LOBYTE(v54) = 1;
        }
        else
        {
          v25(v5, enum case for ContactButtonServiceErrorType._oldTimestamp(_:), v2);
          uint64_t v39 = sub_10001FA68();
          v27(v5, v2);
          if ((id)v39 == v24)
          {

            HIBYTE(v51) = 1;
          }
          else
          {
            v25(v5, enum case for ContactButtonServiceErrorType.invalidContrast(_:), v2);
            uint64_t v40 = sub_10001FA68();
            v27(v5, v2);
            if ((id)v40 == v24)
            {

              LOBYTE(v51) = 1;
            }
            else
            {
              v25(v5, enum case for ContactButtonServiceErrorType.buttonOccluded(_:), v2);
              uint64_t v41 = sub_10001FA68();
              v27(v5, v2);
              if ((id)v41 == v24)
              {

                LOBYTE(v50) = 1;
              }
              else
              {
                v25(v5, enum case for ContactButtonServiceErrorType._mismatchedTokenPid(_:), v2);
                uint64_t v42 = sub_10001FA68();
                v27(v5, v2);
                if ((id)v42 == v24)
                {

                  LOBYTE(v52) = 1;
                }
                else
                {
                  v25(v5, enum case for ContactButtonServiceErrorType._missingHitTest(_:), v2);
                  uint64_t v43 = sub_10001FA68();
                  v27(v5, v2);
                  if ((id)v43 == v24
                    || (v25(v5, enum case for ContactButtonServiceErrorType._missingAuthMessage(_:), v2),
                        uint64_t v44 = sub_10001FA68(),
                        v27(v5, v2),
                        (id)v44 == v24))
                  {

                    HIBYTE(v50) = 1;
                  }
                  else
                  {
                    v25(v5, enum case for ContactButtonServiceErrorType._slotIDMismatch(_:), v2);
                    uint64_t v45 = sub_10001FA68();
                    v27(v5, v2);
                    if ((id)v45 == v24)
                    {

                      LOBYTE(v53) = 1;
                    }
                    else
                    {
                      v25(v5, enum case for ContactButtonServiceErrorType._invalidTimestamp(_:), v2);
                      uint64_t v46 = sub_10001FA68();

                      v27(v5, v2);
                      if ((id)v46 == v24) {
                        HIBYTE(v52) = 1;
                      }
                      else {
                        char v49 = 1;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_19;
  }
  char v12 = sub_1000204A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_11;
  }
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10001FBF8();
  sub_100003F4C(v13, (uint64_t)qword_10002E740);
  id v14 = a1;
  unint64_t v15 = sub_10001FBD8();
  os_log_type_t v16 = sub_100020298();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v18 = sub_10001F9B8();
    uint64_t v47 = sub_10001A630(v18, v19, &v48);
    sub_100020338();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    id v20 = [v14 domain];
    uint64_t v21 = sub_1000200B8();
    unint64_t v23 = v22;

    uint64_t v47 = sub_10001A630(v21, v23, &v48);
    sub_100020338();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "#ContactsButton #Analytics only %s is valid for this initter, got %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
LABEL_19:
  uint64_t v30 = 0x10000;
  if (!(_BYTE)v54) {
    uint64_t v30 = 0;
  }
  uint64_t v31 = v30 | HIBYTE(v54);
  uint64_t v32 = 0x1000000;
  if (!HIBYTE(v53)) {
    uint64_t v32 = 0;
  }
  id v33 = &_mh_execute_header;
  if (!(_BYTE)v53) {
    id v33 = 0;
  }
  unint64_t v34 = v31 | v32 | (unint64_t)v33;
  if (HIBYTE(v52)) {
    uint64_t v35 = 0x10000000000;
  }
  else {
    uint64_t v35 = 0;
  }
  if ((_BYTE)v52) {
    uint64_t v36 = 0x1000000000000;
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v37 = 0x100000000000000;
  if (!HIBYTE(v51)) {
    uint64_t v37 = 0;
  }
  return v34 | v35 | v36 | v37;
}

void sub_10000AB58(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = &_swiftEmptyDictionarySingleton;
  *(void *)(v7 + 16) = &_swiftEmptyDictionarySingleton;
  if (a2)
  {
    NSString v9 = sub_100020088();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = &_swiftEmptyDictionarySingleton;
    *(void *)(v7 + 16) = 0x8000000000000000;
    sub_10000A078((uint64_t)v9, 0x4449656C646E7542, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
    uint64_t v8 = (void *)aBlock[0];
    *(void *)(v7 + 16) = aBlock[0];
    swift_bridgeObjectRelease();
  }
  uint64_t v63 = (a4 >> 40) & 1;
  uint64_t v64 = HIWORD(a4) & 1;
  uint64_t v61 = (a4 >> 24) & 1;
  uint64_t v62 = HIDWORD(a4) & 1;
  uint64_t v59 = (a4 >> 8) & 1;
  uint64_t v60 = (a4 >> 16) & 1;
  unsigned int v58 = a4 & 1;
  uint64_t v56 = HIWORD(a3) & 1;
  uint64_t v57 = HIBYTE(a3) & 1;
  uint64_t v11 = (a3 >> 40) & 1;
  uint64_t v12 = HIDWORD(a3) & 1;
  id v13 = [objc_allocWithZone((Class)NSNumber) initWithBool:a3 & 1];
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v8;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v13, 0x6F54726174617641, 0xEE00656772614C6FLL, v14);
  uint64_t v15 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v16 = [objc_allocWithZone((Class)NSNumber) initWithBool:(a3 >> 24) & 1];
  char v17 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v15;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v16, 0x4C6F6F54746E6F46, 0xEC00000065677261, v17);
  uint64_t v18 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v19 = [objc_allocWithZone((Class)NSNumber) initWithBool:(a3 >> 16) & 1];
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v18;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v19, 0x536F6F54746E6F46, 0xEC0000006C6C616DLL, v20);
  uint64_t v21 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v22 = [objc_allocWithZone((Class)NSNumber) initWithBool:v12];
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v21;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v22, 0x5364696C61766E49, 0xED00004449746F6CLL, v23);
  uint64_t v24 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v25 = [objc_allocWithZone((Class)NSNumber) initWithBool:v11];
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v24;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v25, 0xD000000000000015, 0x8000000100023AD0, v26);
  uint64_t v27 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v28 = [objc_allocWithZone((Class)NSNumber) initWithBool:v56];
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v27;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v28, 0xD000000000000012, 0x8000000100023AF0, v29);
  uint64_t v30 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v31 = [objc_allocWithZone((Class)NSNumber) initWithBool:v57];
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v30;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v31, 0xD000000000000011, 0x8000000100023B10, v32);
  uint64_t v33 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v34 = [objc_allocWithZone((Class)NSNumber) initWithBool:v58];
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v33;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v34, 0x746E6F43726F6F50, 0xEC00000074736172, v35);
  uint64_t v36 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v37 = [objc_allocWithZone((Class)NSNumber) initWithBool:v59];
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v36;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v37, 0xD000000000000015, 0x8000000100023B30, v38);
  uint64_t v39 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v40 = [objc_allocWithZone((Class)NSNumber) initWithBool:v60];
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v39;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v40, 0x4C6F6F5477656956, 0xEC00000065677261, v41);
  uint64_t v42 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v43 = [objc_allocWithZone((Class)NSNumber) initWithBool:v61];
  char v44 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v42;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v43, 0x536F6F5477656956, 0xEC0000006C6C616DLL, v44);
  uint64_t v45 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v46 = [objc_allocWithZone((Class)NSNumber) initWithBool:v62];
  char v47 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v45;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v46, 0x6E61725477656956, 0xEF746E6572617073, v47);
  uint64_t v48 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v49 = [objc_allocWithZone((Class)NSNumber) initWithBool:v63];
  char v50 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v48;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v49, 0x4373615777656956, 0xED000066664F7475, v50);
  uint64_t v51 = aBlock[0];
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  id v52 = [objc_allocWithZone((Class)NSNumber) initWithBool:v64];
  char v53 = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = v51;
  *(void *)(v7 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v52, 0xD000000000000019, 0x8000000100023B50, v53);
  *(void *)(v7 + 16) = aBlock[0];
  swift_bridgeObjectRelease();
  NSString v54 = sub_100020088();
  aBlock[4] = sub_10000B5DC;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009CDC;
  aBlock[3] = &unk_1000294B8;
  v55 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v55);
  swift_release();
}

void sub_10000B2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  id v5 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a1];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15[0] = &_swiftEmptyDictionarySingleton;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v5, 0x686374614D6D754ELL, 0xEA00000000007365, isUniquelyReferenced_nonNull_native);
  uint64_t v7 = v15[0];
  *(void *)(v4 + 16) = v15[0];
  swift_bridgeObjectRelease();
  id v8 = [objc_allocWithZone((Class)NSNumber) initWithBool:a2 == 1];
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  v15[0] = v7;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v8, 0x6574617453434354, 0xEE00656E6F4E7349, v9);
  uint64_t v10 = v15[0];
  *(void *)(v4 + 16) = v15[0];
  swift_bridgeObjectRelease();
  id v11 = [objc_allocWithZone((Class)NSNumber) initWithBool:a2 == 2];
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  v15[0] = v10;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v11, 0xD000000000000011, 0x8000000100023A60, v12);
  *(void *)(v4 + 16) = v15[0];
  swift_bridgeObjectRelease();
  NSString v13 = sub_100020088();
  v15[4] = sub_10000B550;
  v15[5] = v4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100009CDC;
  v15[3] = &unk_100029490;
  char v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);
  swift_release();
}

uint64_t sub_10000B518()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B550()
{
  sub_10000B970(v0, "#ContactsButton #Analytics sending success event: %s");

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B584(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B594()
{
  return swift_release();
}

unint64_t sub_10000B59C()
{
  unint64_t result = qword_10002E158;
  if (!qword_10002E158)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002E158);
  }
  return result;
}

uint64_t sub_10000B5DC()
{
  sub_10000B970(v0, "#ContactsButton #Analytics sending fail event: %s");

  return swift_bridgeObjectRetain();
}

void sub_10000B610(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &_swiftEmptyDictionarySingleton;
  id v5 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a2];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = &_swiftEmptyDictionarySingleton;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v5, 0xD000000000000011, 0x8000000100023BA0, isUniquelyReferenced_nonNull_native);
  uint64_t v7 = v22[0];
  *(void *)(v4 + 16) = v22[0];
  swift_bridgeObjectRelease();
  id v8 = [objc_allocWithZone((Class)NSNumber) initWithBool:a1 == 0];
  char v9 = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v7;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v8, 0xD000000000000014, 0x8000000100023BC0, v9);
  uint64_t v10 = v22[0];
  *(void *)(v4 + 16) = v22[0];
  swift_bridgeObjectRelease();
  id v11 = [objc_allocWithZone((Class)NSNumber) initWithBool:a1 == 1];
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v10;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v11, 0xD000000000000016, 0x8000000100023BE0, v12);
  uint64_t v13 = v22[0];
  *(void *)(v4 + 16) = v22[0];
  swift_bridgeObjectRelease();
  BOOL v14 = a1 > 9;
  id v15 = [objc_allocWithZone((Class)NSNumber) initWithBool:(unint64_t)(a1 - 2) < 8];
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v13;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v15, 0xD000000000000019, 0x8000000100023C00, v16);
  uint64_t v17 = v22[0];
  *(void *)(v4 + 16) = v22[0];
  swift_bridgeObjectRelease();
  id v18 = [objc_allocWithZone((Class)NSNumber) initWithBool:v14];
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v17;
  *(void *)(v4 + 16) = 0x8000000000000000;
  sub_10000A078((uint64_t)v18, 0xD000000000000016, 0x8000000100023C20, v19);
  *(void *)(v4 + 16) = v22[0];
  swift_bridgeObjectRelease();
  NSString v20 = sub_100020088();
  v22[4] = sub_10000B93C;
  v22[5] = v4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 1107296256;
  v22[2] = sub_100009CDC;
  v22[3] = &unk_1000294E0;
  uint64_t v21 = _Block_copy(v22);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v21);
  swift_release();
}

uint64_t sub_10000B93C()
{
  sub_10000B970(v0, "#ContactsButton #Analytics sending display event: %s");

  return swift_bridgeObjectRetain();
}

uint64_t sub_10000B970(uint64_t a1, char *a2)
{
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10001FBF8();
  sub_100003F4C(v4, (uint64_t)qword_10002E740);
  swift_retain_n();
  id v5 = sub_10001FBD8();
  os_log_type_t v6 = sub_100020278();
  if (os_log_type_enabled(v5, v6))
  {
    format = a2;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v13[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_beginAccess();
    sub_10000B59C();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100020048();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_10001A630(v8, v10, v13);
    sub_100020338();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, format, v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  return *(void *)(a1 + 16);
}

id sub_10000BBA4()
{
  id result = [self grayColor];
  qword_10002E738 = (uint64_t)result;
  return result;
}

BOOL sub_10000BBE8()
{
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001FBF8();
  sub_100003F4C(v1, (uint64_t)qword_10002E740);
  uint64_t v2 = v0;
  uint64_t v3 = sub_10001FBD8();
  os_log_type_t v4 = sub_100020278();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v5 = 134217984;
    [*(id *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont] pointSize];
    sub_100020338();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#ContactsButton is font size %f too small?", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  [*(id *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont] pointSize];
  return v6 <= 6.0;
}

BOOL sub_10000BD58()
{
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_10001FBF8();
  sub_100003F4C(v1, (uint64_t)qword_10002E740);
  uint64_t v2 = v0;
  uint64_t v3 = sub_10001FBD8();
  os_log_type_t v4 = sub_100020278();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v5 = 134217984;
    [*(id *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont] pointSize];
    sub_100020338();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#ContactsButton is font size %f too big?", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
  [*(id *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont] pointSize];
  return v6 >= 64.0;
}

BOOL sub_10000BECC()
{
  double v1 = *(double *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarWidth];
  uint64_t v2 = (CGRect *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame];
  double v3 = CGRectGetWidth(*(CGRect *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame]) + 0.01;
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  double v4 = v1 / v3;
  uint64_t v5 = sub_10001FBF8();
  sub_100003F4C(v5, (uint64_t)qword_10002E740);
  double v6 = v0;
  uint64_t v7 = sub_10001FBD8();
  os_log_type_t v8 = sub_100020278();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134218496;
    sub_100020338();
    *(_WORD *)(v9 + 12) = 2048;
    CGRectGetWidth(*v2);
    sub_100020338();

    *(_WORD *)(v9 + 22) = 2048;
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#ContactsButton avatar width %f to frame width %f is %f", (uint8_t *)v9, 0x20u);
    swift_slowDealloc();
  }
  else
  {
  }
  return v4 <= 0.45;
}

id sub_10000C0A4(void *a1)
{
  [a1 setAccessibilityContrast:0];

  return [a1 setAccessibilityButtonShapes:0];
}

void sub_10000C0F4(uint64_t a1, void *a2)
{
  double v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000C240(char a1, double a2)
{
  double v3 = v2;
  uint64_t v5 = &OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_tintColor;
  if ((a1 & 1) == 0) {
    uint64_t v5 = &OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFontColor;
  }
  id v6 = *(id *)&v2[*v5];
  uint64_t v7 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
  os_log_type_t v8 = (CGColor *)[v6 CGColor];
  double Alpha = CGColorGetAlpha(v8);

  double v10 = Alpha * a2;
  id v11 = self;
  char v12 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
  id v13 = [v11 whiteColor];
  sub_100011BA4(v6, v13, Alpha * a2);
  double v15 = v14;

  char v16 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
  id v17 = [v11 blackColor];
  id v51 = v6;
  sub_100011BA4(v6, v17, v10);
  double v19 = v18;

  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_10001FBF8();
  sub_100003F4C(v20, (uint64_t)qword_10002E740);
  uint64_t v21 = v3;
  id v22 = sub_10001FBD8();
  os_log_type_t v23 = sub_100020288();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 134219008;
    sub_100020338();
    *(_WORD *)(v24 + 12) = 2048;
    id v25 = (CGColor *)objc_msgSend(*(id *)&v21[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFontColor], "CGColor", v6, *(void *)&a2);
    CGColorGetAlpha(v25);

    char v12 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
    sub_100020338();

    *(_WORD *)(v24 + 22) = 2048;
    sub_100020338();
    *(_WORD *)(v24 + 32) = 2048;
    sub_100020338();
    *(_WORD *)(v24 + 42) = 2048;
    double v53 = v19;
    uint64_t v7 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "#ContactsButton contrastRatio for font, cumulativeOpacity %f , fontAlpha %f , fontEffectiveOpacity %f , luminanceVsWhite %f , luminanceVsBlack %f", (uint8_t *)v24, 0x34u);
    char v16 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v26 = OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bgColor;
  uint64_t v27 = (CGColor *)objc_msgSend(*(id *)&v21[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bgColor], v7[16], v51, *(void *)&v53);
  double v28 = CGColorGetAlpha(v27);

  double v29 = v28 * a2;
  id v30 = *(id *)&v21[v26];
  id v31 = [v11 v12[17]];
  sub_100011BA4(v30, v31, v28 * a2);
  double v33 = v32;

  id v34 = *(id *)&v21[v26];
  id v35 = [v11 v16[18]];
  sub_100011BA4(v34, v35, v29);
  double v37 = v36;

  char v38 = v21;
  uint64_t v39 = sub_10001FBD8();
  os_log_type_t v40 = sub_100020288();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 134219008;
    sub_100020338();
    *(_WORD *)(v41 + 12) = 2048;
    uint64_t v42 = (CGColor *)[*(id *)&v21[v26] v7[16]];
    CGColorGetAlpha(v42);

    sub_100020338();
    *(_WORD *)(v41 + 22) = 2048;
    sub_100020338();
    *(_WORD *)(v41 + 32) = 2048;
    sub_100020338();
    *(_WORD *)(v41 + 42) = 2048;
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "#ContactsButton contrastRatio for BG, cumulativeOpacity %f , fontAlpha %f , fontEffectiveOpacity %f , luminanceVsWhite %f , luminanceVsBlack %f", (uint8_t *)v41, 0x34u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v39 = v38;
  }

  if ((v19 + 0.05) / (v33 + 0.05) < 1.5)
  {
    id v43 = sub_10001FBD8();
    if ((v37 + 0.05) / (v15 + 0.05) < 1.5)
    {
      os_log_type_t v44 = sub_100020298();
      if (!os_log_type_enabled(v43, v44))
      {
        uint64_t v46 = 0;
        goto LABEL_23;
      }
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 134218496;
      sub_100020338();
      *(_WORD *)(v45 + 12) = 2048;
      sub_100020338();
      *(_WORD *)(v45 + 22) = 2048;
      sub_100020338();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "#ContactsButton contrast ratio failed! fontDarkToWhite: %f , bgDarkToFontWhite %f, thresholdFont %f", (uint8_t *)v45, 0x20u);
      uint64_t v46 = 0;
      goto LABEL_20;
    }
    os_log_type_t v47 = sub_100020288();
    if (os_log_type_enabled(v43, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 134217984;
      sub_100020338();
      id v49 = "#ContactsButton luminance ratio OK for font brightest to background darkest: %f";
      goto LABEL_19;
    }
LABEL_21:
    uint64_t v46 = 1;
    goto LABEL_23;
  }
  id v43 = sub_10001FBD8();
  os_log_type_t v47 = sub_100020288();
  if (!os_log_type_enabled(v43, v47)) {
    goto LABEL_21;
  }
  uint64_t v48 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v48 = 134217984;
  sub_100020338();
  id v49 = "#ContactsButton luminance ratio OK for font darkest to background brightest: %f";
LABEL_19:
  _os_log_impl((void *)&_mh_execute_header, v43, v47, v49, v48, 0xCu);
  uint64_t v46 = 1;
LABEL_20:
  swift_slowDealloc();
LABEL_23:

  return v46;
}

id sub_10000CA08()
{
  return sub_100011570(type metadata accessor for ContactsButtonSlotTag);
}

uint64_t type metadata accessor for ContactsButtonSlotTag()
{
  return self;
}

void sub_10000CB40(double a1)
{
  sub_100004B44((uint64_t *)&unk_10002E4C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000211B0;
  *(void *)(inited + 32) = kCGImageSourceCreateThumbnailFromImageIfAbsent;
  *(unsigned char *)(inited + 40) = 1;
  *(void *)(inited + 64) = &type metadata for Bool;
  *(void *)(inited + 72) = kCGImageSourceCreateThumbnailWithTransform;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 104) = &type metadata for Bool;
  *(void *)(inited + 112) = kCGImageSourceThumbnailMaxPixelSize;
  *(void *)(inited + 144) = &type metadata for CGFloat;
  *(double *)(inited + 120) = a1 * 4.0;
  CFStringRef v4 = (id)kCGImageSourceCreateThumbnailFromImageIfAbsent;
  CFStringRef v5 = (id)kCGImageSourceCreateThumbnailWithTransform;
  CFStringRef v6 = (id)kCGImageSourceThumbnailMaxPixelSize;
  sub_1000141E0(inited);
  uint64_t v7 = *v1 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData;
  unint64_t v8 = *(void *)(v7 + 8);
  if (v8 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    sub_100011C94();
    return;
  }
  uint64_t v9 = *(void *)v7;
  sub_100013648(*(void *)v7, *(void *)(v7 + 8));
  CFDataRef isa = sub_10001FB28().super.isa;
  CGImageSourceRef v11 = CGImageSourceCreateWithData(isa, 0);

  if (v11)
  {
    type metadata accessor for CFString(0);
    sub_1000136A0(&qword_10002DCD0, type metadata accessor for CFString);
    char v12 = v11;
    CFDictionaryRef v13 = sub_100020038().super.isa;
    swift_bridgeObjectRelease();
    CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0, v13);

    if (ThumbnailAtIndex)
    {

      sub_1000124F4(v9, v8);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

BOOL sub_10000CD30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001FB78();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  CFStringRef v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D008();
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10001FBF8();
  sub_100003F4C(v6, (uint64_t)qword_10002E740);
  sub_100012DC0(v0);
  sub_100012DC0(v0);
  uint64_t v7 = sub_10001FBD8();
  os_log_type_t v8 = sub_1000202B8();
  uint64_t v9 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = v2;
    CGImageSourceRef v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v3;
    uint64_t v24 = v12;
    *(_DWORD *)CGImageSourceRef v11 = 136315138;
    v20[1] = v11 + 4;
    id v13 = [*(id *)(v1 + 8) localization];
    uint64_t v14 = sub_1000200B8();
    unint64_t v16 = v15;

    uint64_t v23 = sub_10001A630(v14, v16, &v24);
    sub_100020338();
    uint64_t v9 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
    swift_bridgeObjectRelease();
    sub_100012E00(v1);
    sub_100012E00(v1);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#ContactsButton localization value: %s", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v21;
    swift_slowDealloc();
    uint64_t v2 = v22;
    swift_slowDealloc();
  }
  else
  {
    sub_100012E00(v1);
    sub_100012E00(v1);
  }

  id v17 = [*(id *)(v1 + 8) v9[25]];
  sub_1000200B8();

  sub_10001FB58();
  uint64_t v18 = sub_10001FB68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v18 != 1;
}

void sub_10000D008()
{
  uint64_t v1 = v0;
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001FBF8();
  sub_100003F4C(v2, (uint64_t)qword_10002E740);
  sub_100012DC0(v0);
  oslog = sub_10001FBD8();
  os_log_type_t v3 = sub_1000202B8();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134218752;
    sub_100020338();
    *(_WORD *)(v4 + 12) = 2048;
    sub_100020338();
    *(_WORD *)(v4 + 22) = 2048;
    sub_100020338();
    *(_WORD *)(v4 + 32) = 2048;
    sub_100020338();
    sub_100012E00(v1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "#ContactsButton avatarWidth: %f buttonWidth: %f buttonHeight: %f trailingEdgeFromAvatar: %f", (uint8_t *)v4, 0x2Au);
    swift_slowDealloc();
  }
  else
  {
    sub_100012E00(v1);
  }
}

uint64_t sub_10000D1F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v64 = a1;
  uint64_t v2 = sub_100004B44(&qword_10002E320);
  __chkstk_darwin(v2 - 8);
  uint64_t v60 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001FC18();
  uint64_t v62 = *(void *)(v4 - 8);
  uint64_t v63 = v4;
  __chkstk_darwin(v4);
  uint64_t v61 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004B44(&qword_10002E328);
  __chkstk_darwin(v6 - 8);
  os_log_type_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001FCB8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004B44(&qword_10002E330);
  __chkstk_darwin(v13 - 8);
  unint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004B44(&qword_10002E338);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100004B44(&qword_10002E340);
  uint64_t v58 = *(void *)(v19 - 8);
  uint64_t v59 = v19;
  __chkstk_darwin(v19);
  id v52 = (char *)&v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100004B44(&qword_10002E348);
  __chkstk_darwin(v55);
  NSString v54 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100004B44(&qword_10002E350);
  __chkstk_darwin(v57);
  uint64_t v56 = (uint64_t)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unint64_t v15 = sub_10001FD68();
  *((void *)v15 + 1) = 0;
  v15[16] = 1;
  uint64_t v23 = sub_100004B44(&qword_10002E358);
  sub_10000D914(v1, (uint64_t)&v15[*(int *)(v23 + 44)]);
  uint64_t KeyPath = swift_getKeyPath();
  id v25 = v1;
  BOOL v26 = sub_10000CD30();
  uint64_t v27 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
  if (!v26) {
    uint64_t v27 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *v27, v9);
  uint64_t v53 = v16;
  double v28 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  uint64_t v29 = sub_100004B44(&qword_10002E360);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v28 + *(int *)(v29 + 28), v12, v9);
  *double v28 = KeyPath;
  sub_100013998((uint64_t)v15, (uint64_t)v18, &qword_10002E330);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1000067C4((uint64_t)v15, &qword_10002E330);
  uint64_t v30 = *v25;
  id v31 = *(id *)(*v25 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_contentSizeCategory);
  sub_10001FCA8();
  uint64_t v32 = sub_10001FC98();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v8, 1, v32);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v51 = v30;
    sub_100012C98();
    id v35 = v52;
    sub_10001FEF8();
    sub_1000067C4((uint64_t)v18, &qword_10002E338);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v32);
    [(id)v25[1] userInterfaceStyle];
    uint64_t v36 = (uint64_t)v60;
    sub_10001FC28();
    uint64_t v38 = v62;
    uint64_t v37 = v63;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v36, 1, v63) == 1)
    {
      uint64_t v39 = v61;
      (*(void (**)(char *, void, uint64_t))(v38 + 104))(v61, enum case for ColorScheme.light(_:), v37);
      sub_1000067C4(v36, &qword_10002E320);
    }
    else
    {
      uint64_t v39 = v61;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v61, v36, v37);
    }
    uint64_t v40 = v64;
    uint64_t v42 = v58;
    uint64_t v41 = v59;
    uint64_t v43 = (uint64_t)v54;
    uint64_t v44 = swift_getKeyPath();
    uint64_t v45 = (uint64_t *)(v43 + *(int *)(v55 + 36));
    uint64_t v46 = sub_100004B44(&qword_10002E380);
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))((char *)v45 + *(int *)(v46 + 28), v39, v37);
    uint64_t *v45 = v44;
    (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v43, v35, v41);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v37);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v41);
    id v47 = *(id *)(v51 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bgColor);
    uint64_t v48 = sub_10001FF68();
    LOBYTE(v44) = sub_10001FDE8();
    uint64_t v49 = v56;
    sub_100013998(v43, v56, &qword_10002E348);
    uint64_t v50 = v49 + *(int *)(v57 + 36);
    *(void *)uint64_t v50 = v48;
    *(unsigned char *)(v50 + 8) = v44;
    sub_1000067C4(v43, &qword_10002E348);
    return sub_1000139FC(v49, v40, &qword_10002E350);
  }
  return result;
}

uint64_t sub_10000D914@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v3 = sub_100004B44(&qword_10002E388);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v80 = &v60[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)&v60[-v6];
  *uint64_t v7 = sub_10001FFF8();
  v7[1] = v8;
  uint64_t v9 = *(int *)(sub_100004B44(&qword_10002E390) + 44);
  unint64_t v79 = v7;
  sub_10000DE4C((uint64_t)a1, (uint64_t)v7 + v9);
  uint64_t v75 = sub_10001FDA8();
  sub_10000F164(a1, (uint64_t)&v98);
  uint64_t v68 = v99;
  uint64_t v69 = v98;
  unsigned __int8 v10 = v100;
  uint64_t v77 = v104;
  uint64_t v78 = v102;
  uint64_t v70 = v105;
  uint64_t v71 = v103;
  uint64_t v76 = v106;
  id v66 = a1;
  uint64_t v11 = *a1;
  id v12 = *(id *)(v11 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFontColor);
  uint64_t v74 = sub_10001FF08();
  LOBYTE(v7) = sub_10001FE18();
  int v13 = sub_10001FE28();
  sub_10001FE28();
  if (sub_10001FE28() != v7) {
    int v13 = sub_10001FE28();
  }
  int v73 = v13;
  sub_10001FC08();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  unsigned __int8 v89 = 1;
  unsigned __int8 v87 = v10;
  unsigned __int8 v84 = 0;
  uint64_t v67 = sub_10001FDB8();
  uint64_t v22 = *(void *)(v11 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_rightSideText + 8);
  uint64_t v98 = *(void *)(v11 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_rightSideText);
  uint64_t v99 = v22;
  sub_100012E40();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_10001FEB8();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_10001FE48();
  uint64_t v28 = sub_10001FE98();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  sub_100012E94(v23, v25, v27);
  swift_bridgeObjectRelease();
  id v33 = [(id)v66[1] tintColor];
  uint64_t v98 = sub_10001FF58();
  uint64_t v34 = sub_10001FE88();
  uint64_t v64 = v35;
  uint64_t v65 = v34;
  id v66 = v36;
  LOBYTE(v23) = v37 & 1;
  sub_100012E94(v28, v30, v32 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v38 = v80;
  sub_100013998((uint64_t)v79, (uint64_t)v80, &qword_10002E388);
  LOBYTE(v25) = v89;
  v83[0] = *(_DWORD *)v88;
  *(_DWORD *)((char *)v83 + 3) = *(_DWORD *)&v88[3];
  LOBYTE(v30) = v87;
  int v61 = v89;
  int v62 = v87;
  v82[0] = *(_DWORD *)v86;
  *(_DWORD *)((char *)v82 + 3) = *(_DWORD *)&v86[3];
  v81[0] = *(_DWORD *)v85;
  *(_DWORD *)((char *)v81 + 3) = *(_DWORD *)&v85[3];
  unsigned __int8 v39 = v84;
  int v63 = v84;
  uint64_t v40 = (uint64_t)v38;
  uint64_t v41 = v72;
  sub_100013998(v40, v72, &qword_10002E388);
  uint64_t v42 = (int *)sub_100004B44(&qword_10002E3A0);
  uint64_t v43 = (_OWORD *)(v41 + v42[12]);
  v90[0] = v75;
  v90[1] = 0;
  LOBYTE(v91) = v25;
  *(_DWORD *)((char *)&v91 + 1) = *(_DWORD *)v88;
  DWORD1(v91) = *(_DWORD *)&v88[3];
  uint64_t v44 = v68;
  uint64_t v45 = v69;
  *((void *)&v91 + 1) = v69;
  *(void *)&long long v92 = v68;
  BYTE8(v92) = v30;
  *(_DWORD *)((char *)&v92 + 9) = *(_DWORD *)v86;
  HIDWORD(v92) = *(_DWORD *)&v86[3];
  uint64_t v47 = v70;
  uint64_t v46 = v71;
  *(void *)&long long v93 = v78;
  *((void *)&v93 + 1) = v71;
  *(void *)&long long v94 = v77;
  *((void *)&v94 + 1) = v70;
  *(void *)&long long v95 = v76;
  *((void *)&v95 + 1) = v74;
  LOBYTE(v96) = v73;
  DWORD1(v96) = *(_DWORD *)&v85[3];
  *(_DWORD *)((char *)&v96 + 1) = *(_DWORD *)v85;
  *((void *)&v96 + 1) = v15;
  *(void *)&v97[0] = v17;
  *((void *)&v97[0] + 1) = v19;
  *(void *)&v97[1] = v21;
  BYTE8(v97[1]) = v39;
  long long v48 = (unint64_t)v75;
  long long v49 = v91;
  long long v50 = v93;
  v43[2] = v92;
  v43[3] = v50;
  _OWORD *v43 = v48;
  v43[1] = v49;
  long long v51 = v94;
  long long v52 = v95;
  *(_OWORD *)((char *)v43 + 121) = *(_OWORD *)((char *)v97 + 9);
  long long v53 = v97[0];
  v43[6] = v96;
  v43[7] = v53;
  v43[4] = v51;
  v43[5] = v52;
  uint64_t v54 = v41 + v42[16];
  *(void *)uint64_t v54 = 0;
  *(unsigned char *)(v54 + 8) = 1;
  uint64_t v55 = v41 + v42[20];
  uint64_t v56 = v66;
  *(void *)uint64_t v55 = v67;
  *(void *)(v55 + 8) = 0;
  *(unsigned char *)(v55 + 16) = 1;
  uint64_t v58 = v64;
  uint64_t v57 = v65;
  *(void *)(v55 + 24) = v65;
  *(void *)(v55 + 32) = v58;
  *(unsigned char *)(v55 + 40) = v23;
  *(void *)(v55 + 48) = v56;
  sub_100012EA4((uint64_t)v90);
  sub_100012F20(v57, v58, v23);
  swift_bridgeObjectRetain();
  sub_1000067C4((uint64_t)v79, &qword_10002E388);
  sub_100012E94(v57, v58, v23);
  swift_bridgeObjectRelease();
  uint64_t v98 = v75;
  uint64_t v99 = 0;
  unsigned __int8 v100 = v61;
  *(_DWORD *)uint64_t v101 = v83[0];
  *(_DWORD *)&v101[3] = *(_DWORD *)((char *)v83 + 3);
  uint64_t v102 = v45;
  uint64_t v103 = v44;
  LOBYTE(v104) = v62;
  *(_DWORD *)((char *)&v104 + 1) = v82[0];
  HIDWORD(v104) = *(_DWORD *)((char *)v82 + 3);
  uint64_t v105 = v78;
  uint64_t v106 = v46;
  uint64_t v107 = v77;
  uint64_t v108 = v47;
  uint64_t v109 = v76;
  uint64_t v110 = v74;
  char v111 = v73;
  *(_DWORD *)&v112[3] = *(_DWORD *)((char *)v81 + 3);
  *(_DWORD *)v112 = v81[0];
  uint64_t v113 = v15;
  uint64_t v114 = v17;
  uint64_t v115 = v19;
  uint64_t v116 = v21;
  char v117 = v63;
  sub_100012F74((uint64_t)&v98);
  return sub_1000067C4((uint64_t)v80, &qword_10002E388);
}

uint64_t sub_10000DE4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v183 = a2;
  uint64_t v175 = sub_100004B44(&qword_10002E3A8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v177 = (uint64_t)&v150 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001FCD8();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v6 = (double *)((char *)&v150 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_10001FCC8();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v163 = (uint64_t)&v150 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004B44(&qword_10002E3B0);
  ((void (*)(void))__chkstk_darwin)();
  unsigned __int8 v10 = (char *)&v150 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = sub_100004B44(&qword_10002E3B8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v168 = (uint64_t)&v150 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10001FF98();
  uint64_t v161 = *(void *)(v12 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v160 = (char *)&v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_100004B44(&qword_10002E3C0);
  ((void (*)(void))__chkstk_darwin)();
  v167 = (uint64_t *)((char *)&v150 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v165 = sub_100004B44(&qword_10002E3C8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v170 = (uint64_t)&v150 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = sub_100004B44(&qword_10002E3D0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v172 = (uint64_t)&v150 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_100004B44(&qword_10002E3D8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v173 = (uint64_t)&v150 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = sub_100004B44(&qword_10002E3E0);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v176 = (uint64_t)&v150 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = sub_100004B44(&qword_10002E3E8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v179 = (uint64_t)&v150 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = sub_100004B44(&qword_10002E3F0);
  uint64_t v20 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v178 = (uint64_t)&v150 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v180 = (char *)&v150 - v22;
  uint64_t v181 = sub_100004B44(&qword_10002E3F8);
  __chkstk_darwin(v181);
  v182 = (char *)&v150 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10001FF88();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  char v27 = (char *)&v150 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(*(void *)a1 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData + 8) >> 60 == 15)
  {
    sub_100011C94();
    uint64_t v150 = v4;
    uint64_t v151 = v7;
    sub_10001FD78();
    sub_10001FEA8();
    sub_10001FFC8();
    unsigned int v158 = enum case for Image.ResizingMode.stretch(_:);
    v157 = *(void (**)(char *))(v25 + 104);
    uint64_t v159 = v25 + 104;
    v157(v27);
    uint64_t v28 = v12;
    v153 = v27;
    sub_10001FFB8();
    uint64_t v154 = v24;
    swift_release();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v25 + 8);
    uint64_t v155 = v25 + 8;
    v156 = v29;
    v29(v27, v24);
    char v31 = v160;
    uint64_t v30 = v161;
    (*(void (**)(char *, void, uint64_t))(v161 + 104))(v160, enum case for Image.Interpolation.high(_:), v28);
    uint64_t v152 = sub_10001FFA8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v28);
    uint64_t v32 = *(void *)(a1 + 16);
    double v33 = *(double *)(a1 + 32);
    uint64_t v161 = *(void *)(a1 + 56);
    double v34 = *(double *)(a1 + 136)
        * (*(double *)(v32 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarWidth)
         / v33);
    uint64_t v35 = (char *)v6 + *(int *)(v150 + 20);
    uint64_t v36 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v37 = sub_10001FD88();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v35, v36, v37);
    *uint64_t v6 = v34;
    v6[1] = v34;
    uint64_t v38 = v163;
    sub_100013034((uint64_t)v6, v163, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(void *)(v38 + *(int *)(v151 + 20)) = 0x3FE0000000000000;
    sub_10001309C((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    uint64_t v39 = sub_10001FF28();
    sub_10001FC38();
    sub_100013034(v38, (uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle._Inset);
    uint64_t v40 = &v10[*(int *)(sub_100004B44(&qword_10002E400) + 36)];
    long long v41 = v196;
    *(_OWORD *)uint64_t v40 = v195;
    *((_OWORD *)v40 + 1) = v41;
    *((void *)v40 + 4) = v197;
    uint64_t v42 = sub_100004B44(&qword_10002E408);
    *(void *)&v10[*(int *)(v42 + 52)] = v39;
    *(_WORD *)&v10[*(int *)(v42 + 56)] = 256;
    uint64_t v43 = sub_10001FFE8();
    uint64_t v45 = v44;
    uint64_t v46 = (uint64_t *)&v10[*(int *)(sub_100004B44(&qword_10002E410) + 36)];
    uint64_t *v46 = v43;
    v46[1] = v45;
    sub_10001309C(v38, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle._Inset);
    sub_10001FFE8();
    sub_10001FC48();
    uint64_t v47 = v168;
    sub_100013998((uint64_t)v10, v168, &qword_10002E3B0);
    long long v48 = (_OWORD *)(v47 + *(int *)(v164 + 36));
    long long v49 = v199;
    *long long v48 = v198;
    v48[1] = v49;
    v48[2] = v200;
    sub_1000067C4((uint64_t)v10, &qword_10002E3B0);
    uint64_t v50 = sub_10001FFE8();
    uint64_t v52 = v51;
    uint64_t v53 = v177;
    sub_100013998(v47, v177, &qword_10002E3B8);
    uint64_t v54 = (uint64_t *)(v53 + *(int *)(v175 + 36));
    *uint64_t v54 = v50;
    v54[1] = v52;
    uint64_t v55 = v167;
    sub_100013998(v53, (uint64_t)v167 + *(int *)(v162 + 36), &qword_10002E3A8);
    uint64_t *v55 = v152;
    swift_retain();
    sub_1000067C4(v53, &qword_10002E3A8);
    sub_1000067C4(v47, &qword_10002E3B8);
    swift_release();
    LOBYTE(v50) = sub_10001FDF8();
    sub_10001FC08();
    uint64_t v57 = v56;
    uint64_t v59 = v58;
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    uint64_t v64 = v170;
    sub_100013998((uint64_t)v55, v170, &qword_10002E3C0);
    uint64_t v65 = v64 + *(int *)(v165 + 36);
    *(unsigned char *)uint64_t v65 = v50;
    *(void *)(v65 + 8) = v57;
    *(void *)(v65 + 16) = v59;
    *(void *)(v65 + 24) = v61;
    *(void *)(v65 + 32) = v63;
    *(unsigned char *)(v65 + 40) = 0;
    sub_1000067C4((uint64_t)v55, &qword_10002E3C0);
    LOBYTE(v50) = sub_10001FE18();
    sub_10001FC08();
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    uint64_t v74 = v172;
    sub_100013998(v64, v172, &qword_10002E3C8);
    uint64_t v75 = v74 + *(int *)(v166 + 36);
    *(unsigned char *)uint64_t v75 = v50;
    *(void *)(v75 + 8) = v67;
    *(void *)(v75 + 16) = v69;
    *(void *)(v75 + 24) = v71;
    *(void *)(v75 + 32) = v73;
    *(unsigned char *)(v75 + 40) = 0;
    sub_1000067C4(v64, &qword_10002E3C8);
    LOBYTE(v50) = sub_10001FE38();
    sub_10001FC08();
    uint64_t v77 = v76;
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    uint64_t v84 = v173;
    sub_100013998(v74, v173, &qword_10002E3D0);
    uint64_t v85 = v84 + *(int *)(v169 + 36);
    *(unsigned char *)uint64_t v85 = v50;
    *(void *)(v85 + 8) = v77;
    *(void *)(v85 + 16) = v79;
    *(void *)(v85 + 24) = v81;
    *(void *)(v85 + 32) = v83;
    *(unsigned char *)(v85 + 40) = 0;
    sub_1000067C4(v74, &qword_10002E3D0);
    LOBYTE(v50) = sub_10001FE08();
    sub_10001FC08();
    uint64_t v87 = v86;
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    uint64_t v94 = v176;
    sub_100013998(v84, v176, &qword_10002E3D8);
    uint64_t v95 = v94 + *(int *)(v171 + 36);
    *(unsigned char *)uint64_t v95 = v50;
    *(void *)(v95 + 8) = v87;
    *(void *)(v95 + 16) = v89;
    *(void *)(v95 + 24) = v91;
    *(void *)(v95 + 32) = v93;
    *(unsigned char *)(v95 + 40) = 0;
    sub_1000067C4(v84, &qword_10002E3D8);
    sub_10001FFE8();
    sub_10001FC48();
    uint64_t v96 = v179;
    sub_100013998(v94, v179, &qword_10002E3E0);
    v97 = (_OWORD *)(v96 + *(int *)(v174 + 36));
    long long v98 = v202;
    _OWORD *v97 = v201;
    v97[1] = v98;
    _OWORD v97[2] = v203;
    sub_1000067C4(v94, &qword_10002E3E0);
    uint64_t v99 = sub_10001FFD8();
    uint64_t v176 = v100;
    uint64_t v177 = v99;
    sub_10001FF78();
    uint64_t v101 = v153;
    uint64_t v102 = v154;
    ((void (*)(char *, void, uint64_t))v157)(v153, v158, v154);
    uint64_t v175 = sub_10001FFB8();
    swift_release();
    v156(v101, v102);
    sub_10001FFD8();
    sub_10001FC48();
    uint64_t v174 = v194[0];
    LODWORD(v173) = LOBYTE(v194[1]);
    uint64_t v103 = v194[2];
    char v104 = v194[3];
    uint64_t v171 = v194[5];
    uint64_t v172 = v194[4];
    uint64_t v105 = sub_10001FF18();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v107 = sub_10001FF48();
    uint64_t v108 = sub_10001FFE8();
    uint64_t v110 = v109;
    uint64_t v111 = v178;
    sub_100013998(v96, v178, &qword_10002E3E8);
    uint64_t v112 = v111 + *(int *)(v184 + 36);
    uint64_t v113 = v174;
    *(void *)uint64_t v112 = v175;
    *(void *)(v112 + 8) = v113;
    *(unsigned char *)(v112 + 16) = v173;
    *(void *)(v112 + 24) = v103;
    *(unsigned char *)(v112 + 32) = v104;
    uint64_t v114 = v171;
    *(void *)(v112 + 40) = v172;
    *(void *)(v112 + 48) = v114;
    *(void *)(v112 + 56) = KeyPath;
    *(void *)(v112 + 64) = v105;
    *(void *)(v112 + 72) = v107;
    *(void *)(v112 + 80) = v108;
    uint64_t v115 = v177;
    *(void *)(v112 + 88) = v110;
    *(void *)(v112 + 96) = v115;
    *(void *)(v112 + 104) = v176;
    sub_1000067C4(v96, &qword_10002E3E8);
    uint64_t v116 = (uint64_t)v180;
    sub_1000139FC(v111, (uint64_t)v180, &qword_10002E3F0);
    sub_100013998(v116, (uint64_t)v182, &qword_10002E3F0);
    swift_storeEnumTagMultiPayload();
    sub_100004B44(&qword_10002E418);
    sub_100013344(&qword_10002E420, &qword_10002E418, (void (*)(void))sub_100013154);
    sub_100013344(&qword_10002E488, &qword_10002E3F0, (void (*)(void))sub_1000133E8);
    sub_10001FDC8();
    return sub_1000067C4(v116, &qword_10002E3F0);
  }
  else
  {
    uint64_t v118 = *(void *)(a1 + 16);
    uint64_t v179 = *(void *)(a1 + 56);
    sub_10000CB40(*(double *)(v118 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarWidth));
    v180 = (char *)v119;
    sub_10001FD78();
    sub_10001FEA8();
    sub_10001FFC8();
    LODWORD(v168) = enum case for Image.ResizingMode.stretch(_:);
    v167 = *(uint64_t **)(v25 + 104);
    ((void (*)(char *))v167)(v27);
    uint64_t v178 = sub_10001FFB8();
    swift_release();
    v120 = *(void (**)(char *, uint64_t))(v25 + 8);
    v120(v27, v24);
    sub_10001FFE8();
    sub_10001FC48();
    char v121 = BYTE8(v198);
    uint64_t v169 = v198;
    uint64_t v170 = v199;
    char v122 = BYTE8(v199);
    uint64_t v172 = *((void *)&v200 + 1);
    uint64_t v173 = v200;
    LODWORD(v175) = sub_10001FE38();
    sub_10001FC08();
    uint64_t v171 = v123;
    uint64_t v125 = v124;
    uint64_t v127 = v126;
    uint64_t v129 = v128;
    LODWORD(v174) = sub_10001FE08();
    sub_10001FC08();
    uint64_t v131 = v130;
    uint64_t v133 = v132;
    uint64_t v135 = v134;
    uint64_t v137 = v136;
    char v193 = v121;
    char v192 = v122;
    char v188 = 0;
    char v185 = 0;
    uint64_t v138 = sub_10001FFD8();
    uint64_t v176 = v139;
    uint64_t v177 = v138;
    sub_10001FF78();
    ((void (*)(char *, void, uint64_t))v167)(v27, v168, v24);
    uint64_t v168 = sub_10001FFB8();
    swift_release();
    v120(v27, v24);
    sub_10001FFD8();
    sub_10001FC48();
    uint64_t v140 = v201;
    char v141 = BYTE8(v201);
    uint64_t v142 = v202;
    char v143 = BYTE8(v202);
    long long v144 = v203;
    uint64_t v145 = sub_10001FF18();
    uint64_t v146 = swift_getKeyPath();
    uint64_t v147 = sub_10001FF48();
    uint64_t v148 = sub_10001FFE8();
    v194[0] = v178;
    v194[1] = v169;
    LOBYTE(v194[2]) = v193;
    *(_DWORD *)((char *)&v194[2] + 1) = v195;
    HIDWORD(v194[2]) = *(_DWORD *)((char *)&v195 + 3);
    v194[3] = v170;
    LOBYTE(v194[4]) = v192;
    *(_DWORD *)((char *)&v194[4] + 1) = *(_DWORD *)v191;
    HIDWORD(v194[4]) = *(_DWORD *)&v191[3];
    v194[5] = v173;
    v194[6] = v172;
    LOWORD(v194[7]) = 256;
    HIWORD(v194[7]) = v190;
    *(_DWORD *)((char *)&v194[7] + 2) = *(_DWORD *)&v189[7];
    LOBYTE(v194[8]) = v175;
    HIDWORD(v194[8]) = *(_DWORD *)&v189[3];
    *(_DWORD *)((char *)&v194[8] + 1) = *(_DWORD *)v189;
    v194[9] = v171;
    v194[10] = v125;
    v194[11] = v127;
    v194[12] = v129;
    LOBYTE(v194[13]) = v188;
    HIDWORD(v194[13]) = *(_DWORD *)&v187[3];
    *(_DWORD *)((char *)&v194[13] + 1) = *(_DWORD *)v187;
    LOBYTE(v194[14]) = v174;
    *(_DWORD *)((char *)&v194[14] + 1) = *(_DWORD *)v186;
    HIDWORD(v194[14]) = *(_DWORD *)&v186[3];
    v194[15] = v131;
    v194[16] = v133;
    v194[17] = v135;
    v194[18] = v137;
    LOBYTE(v194[19]) = v185;
    v194[20] = v168;
    v194[21] = v140;
    LOBYTE(v194[22]) = v141;
    v194[23] = v142;
    LOBYTE(v194[24]) = v143;
    *(_OWORD *)&v194[25] = v144;
    v194[27] = v146;
    v194[28] = v145;
    v194[29] = v147;
    v194[30] = v148;
    v194[31] = v149;
    v194[32] = v177;
    v194[33] = v176;
    memcpy(v182, v194, 0x110uLL);
    swift_storeEnumTagMultiPayload();
    sub_100013578((uint64_t)v194);
    sub_100004B44(&qword_10002E418);
    sub_100013344(&qword_10002E420, &qword_10002E418, (void (*)(void))sub_100013154);
    sub_100013344(&qword_10002E488, &qword_10002E3F0, (void (*)(void))sub_1000133E8);
    sub_10001FDC8();

    return sub_1000135E0((uint64_t)v194);
  }
}

uint64_t sub_10000F164@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_100012E40();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_10001FEB8();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  uint64_t v9 = OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont;
  id v10 = *(id *)(v3 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont);
  sub_10001FE78();
  uint64_t v37 = sub_10001FE98();
  uint64_t v35 = v11;
  char v36 = v12;
  uint64_t v14 = v13;
  swift_release();
  sub_100012E94(v4, v6, v8);
  swift_bridgeObjectRelease();
  if (*(void *)(v3 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent)) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = *(void *)(v3 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent + 8) == 0xE000000000000000;
  }
  uint64_t v38 = v14;
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    if ((sub_1000204A8() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_10001FEB8();
      uint64_t v22 = v21;
      char v24 = v23 & 1;
      id v25 = *(id *)(v3 + v9);
      sub_10001FE78();
      uint64_t v26 = sub_10001FE98();
      uint64_t v28 = v27;
      char v30 = v29;
      swift_release();
      sub_100012E94(v20, v22, v24);
      swift_bridgeObjectRelease();
      sub_10001FDD8();
      LOBYTE(v20) = v30 & 1;
      uint64_t v16 = sub_10001FE88();
      uint64_t v17 = v31;
      uint64_t v19 = v32;
      uint64_t v18 = v33 & 1;
      sub_100012E94(v26, v28, v20);
      swift_bridgeObjectRelease();
    }
  }
  *(void *)a2 = v37;
  *(void *)(a2 + 8) = v35;
  *(unsigned char *)(a2 + 16) = v36 & 1;
  *(void *)(a2 + 24) = v38;
  *(void *)(a2 + 32) = v16;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v18;
  *(void *)(a2 + 56) = v19;
  sub_100012F20(v37, v35, v36 & 1);
  swift_bridgeObjectRetain();
  sub_100012F30(v16, v17, v18, v19);
  sub_100012FF0(v16, v17, v18, v19);
  sub_100012E94(v37, v35, v36 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F420@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D1F4(a1);
}

void sub_10000F474(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v1 = sub_100004B44(&qword_10002E320);
  __chkstk_darwin(v1 - 8);
  uint64_t v67 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001FC18();
  uint64_t v68 = *(void *)(v3 - 8);
  uint64_t v69 = v3;
  __chkstk_darwin(v3);
  uint64_t v64 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004B44(&qword_10002E328);
  __chkstk_darwin(v5 - 8);
  uint64_t v73 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100004B44(&qword_10002E360);
  __chkstk_darwin(v70);
  char v8 = (uint64_t *)((char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v71 = sub_10001FCB8();
  uint64_t v9 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100004B44(&qword_10002E4D8);
  __chkstk_darwin(v72);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100004B44(&qword_10002E4E0);
  uint64_t v66 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v75 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100004B44(&qword_10002E4E8);
  __chkstk_darwin(v58);
  uint64_t v63 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100004B44(&qword_10002E4F0);
  __chkstk_darwin(v62);
  uint64_t v61 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", 15.0, 15.0, 1.0);
  id v18 = objc_allocWithZone((Class)ISIcon);
  NSString v19 = sub_100020088();
  id v20 = [v18 initWithBundleIdentifier:v19];

  id v59 = v17;
  id v21 = [v20 prepareImageForDescriptor:v17];

  if (!v21)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v22 = [v21 CGImage];

  if (!v22)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    return;
  }
  uint64_t v23 = v74;
  sub_100004B44(&qword_10002E4F8);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1000211C0;
  *(void *)(v24 + 56) = &type metadata for String;
  *(void *)(v24 + 64) = sub_1000136E8();
  *(void *)(v24 + 32) = 7368801;
  *(void *)(v24 + 40) = 0xE300000000000000;
  sub_1000200C8();
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_10001FD98();
  id v57 = v22;
  sub_10000FD4C(v22, v23, (uint64_t)v78);
  uint64_t KeyPath = swift_getKeyPath();
  BOOL v27 = sub_100010610();
  uint64_t v28 = (unsigned int *)&enum case for LayoutDirection.rightToLeft(_:);
  if (!v27) {
    uint64_t v28 = (unsigned int *)&enum case for LayoutDirection.leftToRight(_:);
  }
  uint64_t v29 = v71;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *v28, v71);
  v76[280] = 1;
  memcpy(&v76[7], v78, 0x110uLL);
  v77[0] = v25;
  v77[1] = 0;
  LOBYTE(v77[2]) = 1;
  memcpy((char *)&v77[2] + 1, v76, 0x117uLL);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v8 + *(int *)(v70 + 28), v11, v29);
  uint64_t *v8 = KeyPath;
  sub_100013998((uint64_t)v8, (uint64_t)&v13[*(int *)(v72 + 36)], &qword_10002E360);
  memcpy(v13, v77, 0x128uLL);
  sub_10001373C((uint64_t)v77);
  sub_1000067C4((uint64_t)v8, &qword_10002E360);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  sub_100013808((uint64_t)v78);
  id v30 = objc_retain(*(id *)(*(void *)(v23 + 32)
                          + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_contentSizeCategory));
  uint64_t v31 = v73;
  sub_10001FCA8();
  uint64_t v32 = sub_10001FC98();
  uint64_t v33 = *(void *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) == 1) {
    goto LABEL_15;
  }
  sub_1000138D4();
  sub_10001FEF8();
  sub_1000067C4((uint64_t)v13, &qword_10002E4D8);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
  double v34 = *(void **)(v23 + 40);
  [v34 userInterfaceStyle];
  uint64_t v35 = (uint64_t)v67;
  sub_10001FC28();
  uint64_t v37 = v68;
  uint64_t v36 = v69;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v35, 1, v69) == 1)
  {
    uint64_t v38 = v64;
    (*(void (**)(char *, void, uint64_t))(v37 + 104))(v64, enum case for ColorScheme.light(_:), v36);
    sub_1000067C4(v35, &qword_10002E320);
  }
  else
  {
    uint64_t v38 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v64, v35, v36);
  }
  uint64_t v39 = (uint64_t)v63;
  uint64_t v40 = v60;
  uint64_t v41 = v58;
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = (uint64_t *)(v39 + *(int *)(v41 + 36));
  uint64_t v44 = sub_100004B44(&qword_10002E380);
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))((char *)v43 + *(int *)(v44 + 28), v38, v36);
  uint64_t *v43 = v42;
  uint64_t v45 = v66;
  uint64_t v46 = v75;
  (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v39, v75, v40);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v40);
  if ([v34 userInterfaceStyle] == (id)1) {
    uint64_t v47 = sub_10001FF38();
  }
  else {
    uint64_t v47 = sub_10001FF48();
  }
  uint64_t v48 = v47;
  uint64_t v49 = v65;
  uint64_t v51 = (uint64_t)v61;
  uint64_t v50 = v62;
  uint64_t v52 = v59;
  uint64_t v53 = v57;
  char v54 = sub_10001FDE8();

  sub_100013998(v39, v51, &qword_10002E4E8);
  uint64_t v55 = v51 + *(int *)(v50 + 36);
  *(void *)uint64_t v55 = v48;
  *(unsigned char *)(v55 + 8) = v54;
  sub_1000067C4(v39, &qword_10002E4E8);
  sub_1000139FC(v51, v49, &qword_10002E4F0);
}

uint64_t sub_10000FD4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v30 = sub_10001FD68();
  sub_10001011C(a1, a2, (uint64_t)v43);
  char v46 = 1;
  *(_OWORD *)&v45[135] = v43[8];
  *(_OWORD *)&v45[151] = v43[9];
  *(_OWORD *)&v45[167] = v43[10];
  v45[183] = v44;
  *(_OWORD *)&v45[71] = v43[4];
  *(_OWORD *)&v45[87] = v43[5];
  *(_OWORD *)&v45[103] = v43[6];
  *(_OWORD *)&v45[119] = v43[7];
  *(_OWORD *)&v45[7] = v43[0];
  *(_OWORD *)&v45[23] = v43[1];
  *(_OWORD *)&v45[39] = v43[2];
  *(_OWORD *)&v45[55] = v43[3];
  long long v55 = *(_OWORD *)&v45[128];
  long long v56 = *(_OWORD *)&v45[144];
  long long v57 = *(_OWORD *)&v45[160];
  uint64_t v58 = *(void *)&v45[176];
  long long v51 = *(_OWORD *)&v45[64];
  long long v52 = *(_OWORD *)&v45[80];
  long long v53 = *(_OWORD *)&v45[96];
  long long v54 = *(_OWORD *)&v45[112];
  long long v47 = *(_OWORD *)v45;
  long long v48 = *(_OWORD *)&v45[16];
  long long v49 = *(_OWORD *)&v45[32];
  long long v50 = *(_OWORD *)&v45[48];
  uint64_t v6 = (uint64_t *)(*(void *)(a2 + 32)
                 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent);
  uint64_t v7 = v6[1];
  uint64_t v64 = *v6;
  uint64_t v65 = v7;
  sub_100012E40();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_10001FEB8();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v64 = sub_10001FF38();
  uint64_t v13 = sub_10001FE88();
  uint64_t v15 = v14;
  uint64_t v29 = v16;
  char v18 = v17 & 1;
  sub_100012E94(v8, v10, v12);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v20 = sub_10001FE68();
  uint64_t v21 = swift_getKeyPath();
  long long v39 = v55;
  long long v40 = v56;
  long long v41 = v57;
  long long v35 = v51;
  long long v36 = v52;
  long long v37 = v53;
  long long v38 = v54;
  long long v31 = v47;
  long long v32 = v48;
  long long v33 = v49;
  long long v34 = v50;
  *(_OWORD *)&v60[129] = v55;
  *(_OWORD *)&v60[145] = v56;
  *(_OWORD *)&v60[161] = v57;
  *(_OWORD *)&v60[65] = v51;
  *(_OWORD *)&v60[81] = v52;
  *(_OWORD *)&v60[97] = v53;
  *(_OWORD *)&v60[113] = v54;
  *(_OWORD *)&v60[1] = v47;
  *(_OWORD *)&v60[17] = v48;
  uint64_t v42 = v58;
  long long v59 = (unint64_t)v30;
  v60[0] = 1;
  *(void *)&v60[177] = v58;
  *(_OWORD *)&v60[33] = v49;
  *(_OWORD *)&v60[49] = v50;
  long long v22 = *(_OWORD *)&v60[160];
  *(_OWORD *)(a3 + 160) = *(_OWORD *)&v60[144];
  *(_OWORD *)(a3 + 176) = v22;
  *(_OWORD *)(a3 + 185) = *(_OWORD *)&v60[169];
  long long v23 = *(_OWORD *)&v60[96];
  *(_OWORD *)(a3 + 96) = *(_OWORD *)&v60[80];
  *(_OWORD *)(a3 + 112) = v23;
  long long v24 = *(_OWORD *)&v60[128];
  *(_OWORD *)(a3 + 128) = *(_OWORD *)&v60[112];
  *(_OWORD *)(a3 + 144) = v24;
  long long v25 = *(_OWORD *)&v60[32];
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&v60[16];
  *(_OWORD *)(a3 + 48) = v25;
  long long v26 = *(_OWORD *)&v60[64];
  *(_OWORD *)(a3 + 64) = *(_OWORD *)&v60[48];
  *(_OWORD *)(a3 + 80) = v26;
  long long v27 = *(_OWORD *)v60;
  *(_OWORD *)a3 = v59;
  *(_OWORD *)(a3 + 16) = v27;
  char v63 = v18;
  *(_DWORD *)(a3 + 225) = *(_DWORD *)v62;
  *(_DWORD *)(a3 + 228) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a3 + 249) = *(_DWORD *)v61;
  *(_DWORD *)(a3 + 252) = *(_DWORD *)&v61[3];
  *(void *)(a3 + 208) = v13;
  *(void *)(a3 + 216) = v15;
  *(unsigned char *)(a3 + 224) = v18;
  *(void *)(a3 + 232) = v29;
  *(void *)(a3 + 240) = KeyPath;
  *(unsigned char *)(a3 + 248) = 1;
  *(void *)(a3 + 256) = v21;
  *(void *)(a3 + 264) = v20;
  sub_100013BC0((uint64_t)&v59);
  sub_100012F20(v13, v15, v18);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100012E94(v13, v15, v18);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v75 = v39;
  long long v76 = v40;
  long long v77 = v41;
  long long v71 = v35;
  long long v72 = v36;
  long long v73 = v37;
  long long v74 = v38;
  long long v67 = v31;
  long long v68 = v32;
  long long v69 = v33;
  uint64_t v64 = v30;
  uint64_t v65 = 0;
  char v66 = 1;
  uint64_t v78 = v42;
  long long v70 = v34;
  return sub_100013C28((uint64_t)&v64);
}

uint64_t sub_10001011C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10001FF88();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a1;
  sub_10001FD78();
  sub_10001FEA8();
  sub_10001FFC8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  uint64_t v52 = sub_10001FFB8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_10001FFE8();
  sub_10001FC48();
  uint64_t v51 = v55;
  int v46 = v56;
  uint64_t v50 = v57;
  int v45 = v58;
  uint64_t v49 = v59;
  uint64_t v48 = v60;
  int v47 = sub_10001FE18();
  sub_10001FC08();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  NSString v19 = (uint64_t *)(*(void *)(a2 + 32)
                  + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent);
  uint64_t v20 = v19[1];
  uint64_t v53 = *v19;
  uint64_t v54 = v20;
  sub_100012E40();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_10001FEB8();
  uint64_t v23 = v22;
  LOBYTE(v7) = v24 & 1;
  sub_10001FE68();
  sub_10001FE58();
  swift_release();
  uint64_t v25 = sub_10001FE98();
  uint64_t v27 = v26;
  LOBYTE(v6) = v28;
  swift_release();
  sub_100012E94(v21, v23, v7);
  swift_bridgeObjectRelease();
  uint64_t v53 = sub_10001FF38();
  uint64_t v29 = sub_10001FE88();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  LOBYTE(v7) = v34 & 1;
  sub_100012E94(v25, v27, v6 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  char v72 = 1;
  char v36 = v46;
  char v71 = v46;
  char v37 = v45;
  char v69 = v45;
  char v66 = 0;
  char v64 = v7;
  char v61 = 1;
  *(_DWORD *)(a3 + 9) = v53;
  *(_DWORD *)(a3 + 12) = *(_DWORD *)((char *)&v53 + 3);
  *(_DWORD *)(a3 + 33) = *(_DWORD *)v70;
  *(_DWORD *)(a3 + 36) = *(_DWORD *)&v70[3];
  int v38 = *(_DWORD *)v68;
  *(_DWORD *)(a3 + 52) = *(_DWORD *)&v68[3];
  *(_DWORD *)(a3 + 49) = v38;
  *(_DWORD *)(a3 + 73) = *(_DWORD *)v67;
  *(_DWORD *)(a3 + 76) = *(_DWORD *)&v67[3];
  *(_DWORD *)(a3 + 113) = *(_DWORD *)v65;
  *(_DWORD *)(a3 + 116) = *(_DWORD *)&v65[3];
  char v39 = v64;
  *(_DWORD *)(a3 + 137) = *(_DWORD *)v63;
  *(_DWORD *)(a3 + 140) = *(_DWORD *)&v63[3];
  int v40 = *(_DWORD *)v62;
  *(_DWORD *)(a3 + 164) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a3 + 161) = v40;
  LOBYTE(v40) = v61;
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v41 = v51;
  *(void *)(a3 + 16) = v52;
  *(void *)(a3 + 24) = v41;
  *(unsigned char *)(a3 + 32) = v36;
  *(void *)(a3 + 40) = v50;
  *(unsigned char *)(a3 + 48) = v37;
  uint64_t v42 = v48;
  *(void *)(a3 + 56) = v49;
  *(void *)(a3 + 64) = v42;
  *(unsigned char *)(a3 + 72) = v47;
  *(void *)(a3 + 80) = v12;
  *(void *)(a3 + 88) = v14;
  *(void *)(a3 + 96) = v16;
  *(void *)(a3 + 104) = v18;
  *(unsigned char *)(a3 + 112) = 0;
  *(void *)(a3 + 120) = v29;
  *(void *)(a3 + 128) = v31;
  *(unsigned char *)(a3 + 136) = v39;
  *(void *)(a3 + 144) = v33;
  *(void *)(a3 + 152) = KeyPath;
  *(unsigned char *)(a3 + 160) = 1;
  *(void *)(a3 + 168) = 0;
  *(unsigned char *)(a3 + 176) = v40;
  swift_retain();
  sub_100012F20(v29, v31, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100012E94(v29, v31, v7);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

BOOL sub_100010610()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = sub_10001FB78();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10001FBF8();
  sub_100003F4C(v6, (uint64_t)qword_10002E740);
  sub_100013A60(v0);
  sub_100013A60(v0);
  uint64_t v7 = sub_10001FBD8();
  os_log_type_t v8 = sub_1000202B8();
  uint64_t v9 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v3;
    uint64_t v24 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    v20[1] = v11 + 4;
    id v13 = [*(id *)(v1 + 40) localization];
    uint64_t v14 = sub_1000200B8();
    unint64_t v16 = v15;

    uint64_t v23 = sub_10001A630(v14, v16, &v24);
    sub_100020338();
    uint64_t v9 = &selRef_addLimitedAccessForBundle_contactIdentifier_;
    swift_bridgeObjectRelease();
    sub_100013AB8(v1);
    sub_100013AB8(v1);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "#ContactsButton localization value: %s", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v21;
    swift_slowDealloc();
    uint64_t v2 = v22;
    swift_slowDealloc();
  }
  else
  {
    sub_100013AB8(v1);
    sub_100013AB8(v1);
  }

  id v17 = [*(id *)(v1 + 40) v9[25]];
  sub_1000200B8();

  sub_10001FB58();
  uint64_t v18 = sub_10001FB68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v18 != 1;
}

uint64_t sub_1000108E4()
{
  return sub_10001FEE8();
}

void sub_100010900(uint64_t a1@<X8>)
{
}

void sub_1000109F4(void *a1, double a2, double a3)
{
  uint64_t v7 = sub_100020008();
  uint64_t v24 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100020028();
  uint64_t v22 = *(void *)(v10 - 8);
  uint64_t v23 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = dispatch_group_create();
  *(void *)(v13 + 16) = v14;
  dispatch_group_enter(v14);
  sub_1000121DC();
  unint64_t v15 = (void *)sub_1000202E8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v3;
  *(void *)(v16 + 24) = a1;
  *(double *)(v16 + 32) = a2;
  *(double *)(v16 + 40) = a3;
  *(void *)(v16 + 48) = v13;
  aBlock[4] = sub_100012264;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100014710;
  aBlock[3] = &unk_100029558;
  id v17 = _Block_copy(aBlock);
  id v18 = v3;
  id v19 = a1;
  swift_retain();
  swift_release();
  sub_100020018();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000136A0(&qword_10002E2F0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004B44(&qword_10002E2F8);
  sub_100013FE8((unint64_t *)&qword_10002E300, &qword_10002E2F8);
  sub_100020368();
  sub_1000202F8();
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v23);
  swift_beginAccess();
  id v20 = *(id *)(v13 + 16);
  sub_1000202D8();
  swift_release();
}

uint64_t sub_100010D44(void *a1, void *a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10 = sub_100004B44(&qword_10002E680);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100020228();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  sub_100020208();
  id v14 = a1;
  id v15 = a2;
  swift_retain();
  uint64_t v16 = sub_1000201F8();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = &protocol witness table for MainActor;
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v15;
  *(double *)(v17 + 48) = a4;
  *(double *)(v17 + 56) = a5;
  *(void *)(v17 + 64) = a3;
  sub_10001456C((uint64_t)v12, (uint64_t)&unk_10002E318, v17);
  return swift_release();
}

uint64_t sub_100010E98(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 72) = a8;
  *(double *)(v8 + 56) = a1;
  *(double *)(v8 + 64) = a2;
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 48) = a7;
  sub_100020208();
  *(void *)(v8 + 80) = sub_1000201F8();
  uint64_t v10 = sub_1000201E8();
  return _swift_task_switch(sub_100010F38, v10, v9);
}

uint64_t sub_100010F38()
{
  uint64_t v1 = v0[5];
  swift_release();
  uint64_t v2 = *(unsigned char **)(v1 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonDrawing_tag);
  char v3 = v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton];
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonDrawing_style);
  uint64_t v5 = (CGRect *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame];
  CGFloat Width = CGRectGetWidth(*(CGRect *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame]);
  v7.n128_u64[0] = CGRectGetHeight(*v5);
  v8.n128_f64[0] = Width;
  nullsub_2(v8, v7);
  sub_100011F78((v3 & 1) == 0, v2, v4);
  if (v9)
  {
    uint64_t v10 = qword_10002DB58;
    uint64_t v11 = v9;
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001FBF8();
    sub_100003F4C(v12, (uint64_t)qword_10002E740);
    uint64_t v13 = sub_10001FBD8();
    os_log_type_t v14 = sub_100020278();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "#ContactsButton cgImage created! ", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = v0[9];
    uint64_t v17 = (CGContext *)v0[6];

    sub_10001127C(v17);
    v2[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_renderedSuccessfully] = 1;
    swift_beginAccess();
    dispatch_group_leave(*(dispatch_group_t *)(v16 + 16));
  }
  else
  {
    if (qword_10002DB58 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10001FBF8();
    sub_100003F4C(v18, (uint64_t)qword_10002E740);
    uint64_t v11 = sub_10001FBD8();
    os_log_type_t v19 = sub_100020298();
    if (os_log_type_enabled(v11, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v19, "#ContactsButton Can't render image", v20, 2u);
      swift_slowDealloc();
    }
  }

  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

void sub_10001127C(CGContext *a1)
{
  CGContextSaveGState(a1);
  char v3 = (CGRect *)(*(void *)&v1[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonDrawing_tag]
                + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame);
  CGFloat Width = CGRectGetWidth(*v3);
  v5.n128_u64[0] = CGRectGetHeight(*v3);
  v6.n128_f64[0] = Width;
  nullsub_2(v6, v5);
  CGContextTranslateCTM(a1, 0.0, v7);
  CGContextScaleCTM(a1, 1.0, -1.0);
  CGFloat v8 = CGRectGetWidth(*v3);
  v9.n128_u64[0] = CGRectGetHeight(*v3);
  v10.n128_f64[0] = v8;
  nullsub_2(v10, v9);
  CGFloat v11 = CGRectGetWidth(*v3);
  v12.n128_u64[0] = CGRectGetHeight(*v3);
  v13.n128_f64[0] = v11;
  nullsub_2(v13, v12);
  sub_100020268();
  if (qword_10002DB58 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_10001FBF8();
  sub_100003F4C(v14, (uint64_t)qword_10002E740);
  id v15 = v1;
  uint64_t v16 = sub_10001FBD8();
  os_log_type_t v17 = sub_100020278();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 134218240;
    CGFloat v19 = CGRectGetWidth(*v3);
    v20.n128_u64[0] = CGRectGetHeight(*v3);
    v21.n128_f64[0] = v19;
    nullsub_2(v21, v20);
    sub_100020338();
    *(_WORD *)(v18 + 12) = 2048;
    CGFloat v22 = CGRectGetWidth(*v3);
    v23.n128_u64[0] = CGRectGetHeight(*v3);
    v24.n128_f64[0] = v22;
    nullsub_2(v24, v23);
    sub_100020338();

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "#ContactsButton will drawing Size (%f, %f)", (uint8_t *)v18, 0x16u);
    swift_slowDealloc();
  }
  else
  {
  }
  CGContextRestoreGState(a1);
}

id sub_100011558()
{
  return sub_100011570(type metadata accessor for ContactsButtonDrawing);
}

id sub_100011570(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ContactsButtonDrawing()
{
  return self;
}

uint64_t sub_100011638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  __n128 v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

id sub_100011708(void *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6, void *a7, void *a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  uint64_t v27 = OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarBackgroundColor;
  uint64_t v28 = qword_10002DB50;
  uint64_t v29 = v14;
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v30 = (void *)qword_10002E738;
  *(void *)&v29[v27] = qword_10002E738;
  uint64_t v31 = &v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
  void *v31 = 0;
  v31[1] = 0xE000000000000000;
  uint64_t v32 = &v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
  void *v32 = 0;
  v32[1] = 0xE000000000000000;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatar] = 0;
  *(_OWORD *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData] = xmmword_1000211D0;
  v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_renderedSuccessfully] = 0;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_buttonHeight] = 0xBFF0000000000000;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_buttonWidth] = 0xBFF0000000000000;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_contactBadge] = 0;
  uint64_t v33 = (double *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame];
  *uint64_t v33 = a9;
  v33[1] = a10;
  v33[2] = a11;
  v33[3] = a12;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bgColor] = a1;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFont] = a5;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_primaryFontColor] = a6;
  char v34 = &v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_rightSideText];
  *char v34 = a2;
  v34[1] = a3;
  v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton] = a4 & 1;
  *(double *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_trailingEdgeFromAvatar] = a13;
  *(double *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarWidth] = a14;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_contentSizeCategory] = a7;
  *(void *)&v29[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_tintColor] = a8;
  id v35 = v30;
  id v36 = a1;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;

  v44.receiver = v29;
  v44.super_class = (Class)type metadata accessor for ContactsButtonSlotTag();
  return objc_msgSendSuper2(&v44, "init");
}

id sub_100011924(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  double v11 = COERCE_DOUBLE(sub_10001FA08());
  char v13 = v12;
  double v14 = COERCE_DOUBLE(sub_10001F9D8());
  char v16 = v15;
  os_log_type_t v17 = (void *)sub_10001FA28();
  uint64_t v18 = (void *)sub_10001FA18();
  CGFloat v19 = (void *)sub_10001FA38();
  __n128 v20 = (void *)sub_10001F9F8();
  id v21 = (id)sub_10001FA48();
  if (!v21) {
    id v21 = objc_msgSend(self, "systemBlueColor", v28, v29);
  }
  CGFloat v22 = v21;
  if (v16) {
    double v23 = 30.0;
  }
  else {
    double v23 = v14;
  }
  if (v13) {
    double v24 = 4.0;
  }
  else {
    double v24 = v11;
  }
  id v25 = objc_allocWithZone((Class)type metadata accessor for ContactsButtonSlotTag());
  id v26 = sub_100011708(v17, v28, v29, 0, v18, v19, v20, v22, a1, a2, a3, a4, v24, v23);

  return v26;
}

double sub_100011A7C(double a1, double a2, double a3)
{
  if (a1 > 0.03928)
  {
    double v5 = pow((a1 + 0.055) / 1.055, 2.4);
    if (a2 <= 0.03928) {
      goto LABEL_3;
    }
LABEL_6:
    double v6 = pow((a2 + 0.055) / 1.055, 2.4);
    if (a3 <= 0.03928) {
      goto LABEL_4;
    }
LABEL_7:
    double v7 = pow((a3 + 0.055) / 1.055, 2.4);
    return v5 * 0.2126 + v6 * 0.7152 + v7 * 0.0722;
  }
  double v5 = a1 / 12.92;
  if (a2 > 0.03928) {
    goto LABEL_6;
  }
LABEL_3:
  double v6 = a2 / 12.92;
  if (a3 > 0.03928) {
    goto LABEL_7;
  }
LABEL_4:
  double v7 = a3 / 12.92;
  return v5 * 0.2126 + v6 * 0.7152 + v7 * 0.0722;
}

void sub_100011BA4(void *a1, void *a2, double a3)
{
  double v12 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v9 = 0;
  [a1 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  double v7 = 0.0;
  double v8 = 0.0;
  uint64_t v5 = 0;
  double v6 = 0.0;
  [a2 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  sub_100011A7C(v12 * a3 + (1.0 - a3) * v8, v11 * a3 + (1.0 - a3) * v7, v10 * a3 + (1.0 - a3) * v6);
}

void sub_100011C94()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)ISImageDescriptor), "initWithSize:scale:", 32.0, 32.0, 1.0);
  id v1 = objc_allocWithZone((Class)ISIcon);
  NSString v2 = sub_100020088();
  id v3 = [v1 initWithBundleIdentifier:v2];

  id v4 = [v3 prepareImageForDescriptor:v0];
  if (v4)
  {
    id v5 = [v4 CGImage];

    if (v5)
    {

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

double sub_100011D8C@<D0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10001FB88();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100020078();
  __chkstk_darwin(v7 - 8);
  sub_100020068();
  sub_10001FB48();
  uint64_t v8 = sub_1000200D8();
  uint64_t v10 = v9;
  sub_100020068();
  sub_10001FB48();
  uint64_t v11 = sub_1000200D8();
  uint64_t v13 = v12;
  id v14 = a1;
  *(void *)a3 = v8;
  *(void *)(a3 + 8) = v10;
  *(void *)(a3 + 16) = v11;
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = v14;
  *(void *)(a3 + 40) = a2;
  *(void *)(a3 + 48) = v14;
  *(_OWORD *)(a3 + 56) = xmmword_1000211E0;
  *(int64x2_t *)(a3 + 72) = vdupq_n_s64(0x4040000000000000uLL);
  *(_OWORD *)(a3 + 88) = xmmword_1000211F0;
  *(_OWORD *)(a3 + 104) = xmmword_100021200;
  *(_OWORD *)(a3 + 120) = xmmword_100021210;
  *(_OWORD *)(a3 + 136) = xmmword_100021220;
  double result = 6.0;
  *(_OWORD *)(a3 + 152) = xmmword_100021230;
  *(void *)(a3 + 168) = 0x401E000000000000;
  return result;
}

double sub_100011F78(char a1, void *a2, void *a3)
{
  if (a1)
  {
    id v4 = a2;
    id v5 = a3;
    sub_10001FFE8();
    sub_10001FC48();
    LOBYTE(v27) = BYTE8(v16);
    *(void *)&long long v11 = v4;
    *((void *)&v11 + 1) = v5;
    *(void *)uint64_t v12 = v4;
    *(_OWORD *)&v12[8] = xmmword_1000211E0;
    *(int64x2_t *)&v12[24] = vdupq_n_s64(0x4040000000000000uLL);
    *(_OWORD *)&v12[40] = xmmword_1000211F0;
    *(_OWORD *)&v12[56] = xmmword_100021200;
    *(_OWORD *)&v12[72] = xmmword_100021210;
    *(_OWORD *)&v12[88] = xmmword_100021220;
    *(_OWORD *)&v12[104] = xmmword_100021230;
    *(void *)&v12[120] = 0x401E000000000000;
    *(void *)&long long v13 = v16;
    BYTE8(v13) = BYTE8(v16);
    *(void *)&long long v14 = v17;
    BYTE8(v14) = BYTE8(v17);
    long long v15 = v18;
    uint64_t v6 = (uint64_t *)&unk_10002E2E0;
  }
  else
  {
    id v7 = a2;
    id v5 = a3;
    sub_100011D8C(v7, (uint64_t)v5, (uint64_t)&v16);
    sub_10001FFE8();
    sub_10001FC48();
    *(_OWORD *)&v12[112] = v24;
    long long v13 = v25;
    long long v14 = v26;
    *(_OWORD *)&v12[48] = v20;
    *(_OWORD *)&v12[64] = v21;
    *(_OWORD *)&v12[80] = v22;
    *(_OWORD *)&v12[96] = v23;
    long long v11 = v16;
    *(_OWORD *)uint64_t v12 = v17;
    *(_OWORD *)&v12[16] = v18;
    *(_OWORD *)&v12[32] = v19;
    *(void *)&long long v15 = v27;
    BYTE8(v15) = v28;
    uint64_t v6 = (uint64_t *)&unk_10002E2D8;
  }
  sub_100004B44(v6);
  swift_allocObject();
  sub_10001FC88();
  objc_msgSend(v5, "displayScale", v11, *(void *)v12, *(void *)&v12[8], *(void *)&v12[16], *(void *)&v12[24], *(void *)&v12[32], *(void *)&v12[40], *(void *)&v12[48], *(void *)&v12[56], *(void *)&v12[64], *(void *)&v12[72], *(void *)&v12[80], *(void *)&v12[88], *(void *)&v12[96], *(void *)&v12[104], *(void *)&v12[112], *(void *)&v12[120],
    v13,
    v14,
    v15);
  sub_10001FC78();
  sub_10001FC58();
  sub_10001FC68();
  double v9 = v8;
  swift_release();
  return v9;
}

uint64_t sub_1000121A4()
{
  return _swift_deallocObject(v0, 24, 7);
}

unint64_t sub_1000121DC()
{
  unint64_t result = qword_10002E2E8;
  if (!qword_10002E2E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002E2E8);
  }
  return result;
}

uint64_t sub_10001221C()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100012264()
{
  return sub_100010D44(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 48), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_100012274(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012284()
{
  return swift_release();
}

uint64_t sub_10001228C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000122D4()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100012324(uint64_t a1)
{
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t v5 = *((void *)v1 + 3);
  uint64_t v6 = *((void *)v1 + 4);
  uint64_t v7 = *((void *)v1 + 5);
  double v8 = v1[6];
  double v9 = v1[7];
  uint64_t v10 = *((void *)v1 + 8);
  long long v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_100012400;
  return sub_100010E98(v8, v9, a1, v4, v5, v6, v7, v10);
}

uint64_t sub_100012400()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000124F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000676C(a1, a2);
  }
  return a1;
}

void destroy for ContactsButtonCell(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for ContactsButtonCell(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

uint64_t assignWithCopy for ContactsButtonCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  long long v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

__n128 initializeWithTake for ContactsButtonCell(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for ContactsButtonCell(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsButtonCell(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactsButtonCell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsButtonCell()
{
  return &type metadata for ContactsButtonCell;
}

void destroy for ContactAccessButtonDenied(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v2 = *(void **)(a1 + 48);
}

uint64_t initializeWithCopy for ContactAccessButtonDenied(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void **)(a2 + 32);
  long long v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  long long v7 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v7;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  return a1;
}

void *assignWithCopy for ContactAccessButtonDenied(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[4];
  uint64_t v5 = (void *)a1[4];
  a1[4] = v4;
  id v6 = v4;

  long long v7 = (void *)a2[5];
  id v8 = (void *)a1[5];
  a1[5] = v7;
  id v9 = v7;

  id v10 = (void *)a2[6];
  long long v11 = (void *)a1[6];
  a1[6] = v10;
  id v12 = v10;

  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  a1[21] = a2[21];
  return a1;
}

__n128 initializeWithTake for ContactAccessButtonDenied(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for ContactAccessButtonDenied(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  long long v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  long long v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactAccessButtonDenied(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 176)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactAccessButtonDenied(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 176) = 1;
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
    *(unsigned char *)(result + 176) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactAccessButtonDenied()
{
  return &type metadata for ContactAccessButtonDenied;
}

uint64_t sub_100012BFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012C18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012C34()
{
  return sub_10001FD18();
}

uint64_t sub_100012C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100011638(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for LayoutDirection, (uint64_t (*)(char *))&EnvironmentValues.layoutDirection.setter);
}

unint64_t sub_100012C98()
{
  unint64_t result = qword_10002E368;
  if (!qword_10002E368)
  {
    sub_10001228C(&qword_10002E338);
    sub_100013FE8(&qword_10002E370, &qword_10002E330);
    sub_100013FE8(&qword_10002E378, &qword_10002E360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E368);
  }
  return result;
}

uint64_t sub_100012D5C()
{
  return sub_10001FCE8();
}

uint64_t sub_100012D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100011638(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_100012DC0(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 8);
  long long v3 = *(void **)(a1 + 16);
  id v4 = *(id *)a1;
  id v5 = v2;
  id v6 = v3;
  return a1;
}

uint64_t sub_100012E00(uint64_t a1)
{
  unint64_t v2 = *(void **)a1;
  long long v3 = *(void **)(a1 + 8);

  return a1;
}

unint64_t sub_100012E40()
{
  unint64_t result = qword_10002E398;
  if (!qword_10002E398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E398);
  }
  return result;
}

uint64_t sub_100012E94(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100012EA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_100012F20(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_100012F30(v2, v3, v4, v5);
  swift_retain();
  return a1;
}

uint64_t sub_100012F20(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100012F30(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100012F20(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100012F74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_100012E94(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100012FF0(v2, v3, v4, v5);
  swift_release();
  return a1;
}

uint64_t sub_100012FF0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100012E94(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100013034(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001309C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000130FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001FCF8();
  *a1 = result;
  return result;
}

uint64_t sub_100013128()
{
  return sub_10001FD08();
}

uint64_t sub_100013154()
{
  return sub_1000131B4(&qword_10002E428, &qword_10002E430, (void (*)(void))sub_100013184);
}

uint64_t sub_100013184()
{
  return sub_1000131B4(&qword_10002E438, &qword_10002E440, (void (*)(void))sub_100013230);
}

uint64_t sub_1000131B4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001228C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013230()
{
  unint64_t result = qword_10002E448;
  if (!qword_10002E448)
  {
    sub_10001228C(&qword_10002E450);
    sub_1000132D0();
    sub_100013FE8(&qword_10002E468, &qword_10002E470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E448);
  }
  return result;
}

unint64_t sub_1000132D0()
{
  unint64_t result = qword_10002E458;
  if (!qword_10002E458)
  {
    sub_10001228C(&qword_10002E460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E458);
  }
  return result;
}

uint64_t sub_100013344(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001228C(a2);
    a3();
    sub_100013FE8(&qword_10002E478, &qword_10002E480);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000133E8()
{
  return sub_1000131B4(&qword_10002E490, &qword_10002E3E8, (void (*)(void))sub_100013418);
}

uint64_t sub_100013418()
{
  return sub_1000131B4(&qword_10002E498, &qword_10002E3E0, (void (*)(void))sub_100013448);
}

uint64_t sub_100013448()
{
  return sub_1000131B4(&qword_10002E4A0, &qword_10002E3D8, (void (*)(void))sub_100013478);
}

uint64_t sub_100013478()
{
  return sub_1000131B4(&qword_10002E4A8, &qword_10002E3D0, (void (*)(void))sub_1000134A8);
}

uint64_t sub_1000134A8()
{
  return sub_1000131B4(&qword_10002E4B0, &qword_10002E3C8, (void (*)(void))sub_1000134D8);
}

unint64_t sub_1000134D8()
{
  unint64_t result = qword_10002E4B8;
  if (!qword_10002E4B8)
  {
    sub_10001228C(&qword_10002E3C0);
    sub_100013FE8(&qword_10002E4C0, &qword_10002E3A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E4B8);
  }
  return result;
}

uint64_t sub_100013578(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000135E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013648(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000136A0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000136E8()
{
  unint64_t result = qword_10002E500;
  if (!qword_10002E500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E500);
  }
  return result;
}

uint64_t sub_10001373C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  char v4 = *(unsigned char *)(a1 + 184);
  uint64_t v5 = *(void *)(a1 + 232);
  uint64_t v6 = *(void *)(a1 + 240);
  char v7 = *(unsigned char *)(a1 + 248);
  swift_retain();
  sub_100012F20(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100012F20(v5, v6, v7);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100013808(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  char v4 = *(unsigned char *)(a1 + 160);
  uint64_t v5 = *(void *)(a1 + 208);
  uint64_t v6 = *(void *)(a1 + 216);
  char v7 = *(unsigned char *)(a1 + 224);
  swift_release();
  sub_100012E94(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100012E94(v5, v6, v7);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

unint64_t sub_1000138D4()
{
  unint64_t result = qword_10002E508;
  if (!qword_10002E508)
  {
    sub_10001228C(&qword_10002E4D8);
    sub_100013FE8(&qword_10002E510, &qword_10002E518);
    sub_100013FE8(&qword_10002E378, &qword_10002E360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E508);
  }
  return result;
}

uint64_t sub_100013998(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004B44(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000139FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004B44(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_100013A60(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  char v4 = (void *)a1[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v2;
  id v6 = v3;
  id v7 = v4;
  return a1;
}

uint64_t sub_100013AB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100013B14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10001FD28();
  *a1 = result;
  return result;
}

uint64_t sub_100013B40()
{
  return sub_10001FD38();
}

uint64_t sub_100013B68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001FD48();
  *a1 = result;
  return result;
}

uint64_t sub_100013B94()
{
  return sub_10001FD58();
}

uint64_t sub_100013BC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  char v4 = *(unsigned char *)(a1 + 160);
  swift_retain();
  sub_100012F20(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_100013C28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 144);
  uint64_t v3 = *(void *)(a1 + 152);
  char v4 = *(unsigned char *)(a1 + 160);
  swift_release();
  sub_100012E94(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

void destroy for ContactsButtonComputedProperties(id *a1)
{
}

uint64_t initializeWithCopy for ContactsButtonComputedProperties(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ContactsButtonComputedProperties(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

__n128 initializeWithTake for ContactsButtonComputedProperties(uint64_t a1, long long *a2)
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
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for ContactsButtonComputedProperties(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsButtonComputedProperties(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 128)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactsButtonComputedProperties(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsButtonComputedProperties()
{
  return &type metadata for ContactsButtonComputedProperties;
}

unint64_t sub_100013F1C()
{
  unint64_t result = qword_10002E520;
  if (!qword_10002E520)
  {
    sub_10001228C(&qword_10002E350);
    sub_1000140FC(&qword_10002E528, &qword_10002E348, &qword_10002E338, (void (*)(void))sub_100012C98);
    sub_100013FE8(&qword_10002E538, &qword_10002E540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E520);
  }
  return result;
}

uint64_t sub_100013FE8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001228C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100014030()
{
  unint64_t result = qword_10002E548;
  if (!qword_10002E548)
  {
    sub_10001228C(&qword_10002E4F0);
    sub_1000140FC((unint64_t *)&unk_10002E550, &qword_10002E4E8, &qword_10002E4D8, (void (*)(void))sub_1000138D4);
    sub_100013FE8(&qword_10002E538, &qword_10002E540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E548);
  }
  return result;
}

uint64_t sub_1000140FC(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001228C(a2);
    sub_10001228C(a3);
    a4();
    swift_getOpaqueTypeConformance2();
    sub_100013FE8(&qword_10002E530, &qword_10002E380);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000141E0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B44(&qword_10002E700);
  uint64_t v2 = sub_100020458();
  long long v3 = (void *)v2;
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
    sub_100013998(v6, (uint64_t)&v13, &qword_10002E708);
    uint64_t v7 = v13;
    unint64_t result = sub_10001AD50(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10001C804(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

unint64_t sub_100014310(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B44(&qword_10002E678);
  uint64_t v2 = (void *)sub_100020458();
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
    unint64_t result = sub_10001ACD8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

unint64_t sub_100014434(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B44(&qword_10002E670);
  uint64_t v2 = sub_100020458();
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
    sub_100013998(v6, (uint64_t)&v15, &qword_10002E6B0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001ACD8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10001C804(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10001456C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100020228();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100020218();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001F560(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000201E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100014710(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100014754()
{
  uint64_t v0 = sub_10001FBF8();
  sub_10001F948(v0, qword_10002E740);
  sub_100003F4C(v0, (uint64_t)qword_10002E740);
  return sub_10001FBE8();
}

void sub_1000147D8(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_logger];
  uint64_t v4 = qword_10002DB58;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10001FBF8();
  uint64_t v7 = sub_100003F4C(v6, (uint64_t)qword_10002E740);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v3, v7, v6);
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotMachine] = 0;
  *(_DWORD *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotID] = -1;
  uint64_t v8 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_auditToken];
  *(_OWORD *)uint64_t v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v8[32] = 1;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_credential] = 0;
  uint64_t v9 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_layerGrader;
  *(void *)&v5[v9] = [objc_allocWithZone((Class)UISTransform3DGrader) init];
  uint64_t v10 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_contentsGrader;
  *(void *)&v5[v10] = [objc_allocWithZone((Class)UISTransform3DGrader) init];
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag] = 0;
  BOOL v11 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID];
  *(void *)BOOL v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  BOOL v13 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedAppName];
  *(void *)BOOL v13 = 7368769;
  *((void *)v13 + 1) = 0xE300000000000000;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cnAuditToken] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_matches] = 0;
  uint64_t v14 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedQueryString];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredEmails] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredPhones] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTraits] = 0;
  uint64_t v15 = &v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedFrame];
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v15[32] = 1;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTag] = 0;
  *(void *)&v5[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle] = 0;

  v46.receiver = v5;
  v46.super_class = (Class)type metadata accessor for ContactsButtonServiceProvider();
  id v16 = objc_msgSendSuper2(&v46, "init");
  id v17 = objc_allocWithZone((Class)UISSlotMachine);
  long long v18 = (char *)v16;
  id v19 = [v17 initWithSlotDrawer:v18 options:3];
  long long v20 = *(void **)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotMachine];
  *(void *)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotMachine] = v19;

  [a1 auditToken];
  LODWORD(v17) = v38;
  unsigned int v21 = v39;
  unsigned int v22 = v40;
  unsigned int v23 = v41;
  unsigned int v24 = v42;
  LODWORD(v10) = v43;
  unsigned int v25 = v44;
  unsigned int v26 = v45;
  unint64_t v27 = v40 | ((unint64_t)v41 << 32);
  unint64_t v28 = v42 | ((unint64_t)v43 << 32);
  unint64_t v29 = v44 | ((unint64_t)v45 << 32);
  uint64_t v30 = &v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_auditToken];
  *(void *)uint64_t v30 = v38 | ((unint64_t)v39 << 32);
  *((void *)v30 + 1) = v27;
  *((void *)v30 + 2) = v28;
  *((void *)v30 + 3) = v29;
  v30[32] = 0;
  uint64_t v31 = self;
  unsigned int v38 = v17;
  unsigned int v39 = v21;
  unsigned int v40 = v22;
  unsigned int v41 = v23;
  unsigned int v42 = v24;
  unsigned int v43 = v10;
  unsigned int v44 = v25;
  unsigned int v45 = v26;
  id v32 = [v31 auditToken:&v38];
  uint64_t v33 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cnAuditToken;
  char v34 = *(void **)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cnAuditToken];
  *(void *)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cnAuditToken] = v32;

  uint64_t v35 = *(void *)&v18[v33];
  if (v35)
  {
    id v36 = [objc_allocWithZone((Class)CNAuthorizationContext) initWithAuditToken:v35 assumedIdentity:0];

    id v37 = *(void **)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext];
    *(void *)&v18[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext] = v36;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100014B44(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v30 = a6;
  uint64_t v15 = sub_100004B44(&qword_10002E680);
  __chkstk_darwin(v15 - 8);
  id v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100020228();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  sub_100020208();
  id v19 = a5;
  swift_retain();
  id v20 = a8;
  id v21 = a1;
  id v22 = a2;
  id v23 = a3;
  id v24 = a4;
  uint64_t v25 = sub_1000201F8();
  unsigned int v26 = (void *)swift_allocObject();
  v26[2] = v25;
  v26[3] = &protocol witness table for MainActor;
  v26[4] = v21;
  v26[5] = v22;
  v26[6] = a3;
  v26[7] = v24;
  uint64_t v27 = v30;
  v26[8] = a5;
  v26[9] = v27;
  v26[10] = a7;
  v26[11] = v20;
  sub_10001456C((uint64_t)v17, (uint64_t)&unk_10002E6F0, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_100014CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 136) = v14;
  *(_OWORD *)(v8 + 120) = v13;
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  *(void *)(v8 + 80) = a4;
  sub_100020208();
  *(void *)(v8 + 144) = sub_1000201F8();
  uint64_t v10 = sub_1000201E8();
  return _swift_task_switch(sub_100014D84, v10, v9);
}

int64_t sub_100014D84()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 80);
  swift_release();
  char v3 = *(unsigned char *)(v2 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton);
  if (v1) {
    [*(id *)(v0 + 96) floatValue];
  }
  double v5 = sub_100011F78(v3 ^ 1u, *(void **)(v0 + 80), *(void **)(v0 + 88));
  if (!v4)
  {
    long long v13 = sub_10001FBD8();
    os_log_type_t v14 = sub_100020298();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "#ContactsButton #size imageRenderer could not render cgImage so returning default values for sizeThatFits", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void (**)(Class, Class))(v0 + 120);

    sub_100009C7C(0, &qword_10002E6F8);
    Class isa = sub_100020318(300).super.super.isa;
    Class v18 = sub_100020318(50).super.super.isa;
    v16(isa, v18);

    id v19 = 0;
    goto LABEL_32;
  }
  double v6 = v5;
  uint64_t v50 = v1;
  uint64_t v7 = v4;
  uint64_t v8 = sub_10001FBD8();
  os_log_type_t v9 = sub_1000202B8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134218240;
    *(void *)(v0 + 16) = CGImageGetWidth(v7);
    sub_100020338();
    *(_WORD *)(v10 + 12) = 2048;
    BOOL v11 = v7;
    size_t Height = CGImageGetHeight(v7);

    *(void *)(v0 + 16) = Height;
    uint64_t v7 = v11;
    sub_100020338();

    _os_log_impl((void *)&_mh_execute_header, v8, v9, "#ContactsButton #size renderer Scaled image: %ld x %ld", (uint8_t *)v10, 0x16u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v8 = v7;
  }

  int64_t result = CGImageGetWidth(v7);
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v21 = (uint64_t)v6;
  if (!(uint64_t)v6)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    return result;
  }
  if (v21 == -1 && result == 0x8000000000000000) {
    goto LABEL_39;
  }
  id v23 = [objc_allocWithZone((Class)NSNumber) initWithInteger:result / v21];
  *(void *)(v0 + 72) = v23;
  uint64_t v49 = v7;
  int64_t result = CGImageGetHeight(v7);
  if (v21 == -1 && result == 0x8000000000000000) {
    goto LABEL_40;
  }
  id v25 = [objc_allocWithZone((Class)NSNumber) initWithInteger:result / v21];
  *(void *)(v0 + 64) = v25;
  if (v50)
  {
    unsigned int v26 = *(void **)(v0 + 96);
    [v26 floatValue];
    if (v27 > 0.0)
    {
      id v28 = v26;

      *(void *)(v0 + 72) = v28;
      id v23 = v28;
    }
  }
  uint64_t v29 = *(void **)(v0 + 112);
  if (v29)
  {
    [*(id *)(v0 + 112) floatValue];
    if (v30 > 0.0)
    {
      id v31 = v29;

      *(void *)(v0 + 64) = v31;
      id v25 = v31;
    }
  }
  id v32 = v23;
  id v33 = v25;
  id v34 = v32;
  id v35 = v33;
  id v36 = sub_10001FBD8();
  os_log_type_t v37 = sub_1000202B8();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    unsigned int v39 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 138412546;
    *(void *)(v0 + 16) = v34;
    os_log_type_t type = v37;
    id v40 = v34;
    sub_100020338();
    *unsigned int v39 = v34;

    *(_WORD *)(v38 + 12) = 2112;
    *(void *)(v0 + 16) = v35;
    id v41 = v35;
    sub_100020338();
    v39[1] = v35;

    _os_log_impl((void *)&_mh_execute_header, v36, type, "#ContactsButton #size provider resolved width: %@ height: %@", (uint8_t *)v38, 0x16u);
    sub_100004B44(&qword_10002DCA8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v19 = v49;
  unsigned int v42 = *(void (**)(void *, void *))(v0 + 120);

  swift_beginAccess();
  unsigned int v43 = *(void **)(v0 + 72);
  swift_beginAccess();
  unsigned int v44 = *(void **)(v0 + 64);
  id v45 = v43;
  id v46 = v44;
  v42(v43, v44);

LABEL_32:
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 136));

  int v47 = *(uint64_t (**)(void))(v0 + 8);
  return v47();
}

unint64_t sub_100015434(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100004B44(&qword_10002E670);
    uint64_t v2 = (void *)sub_100020458();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
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
  double v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  BOOL v11 = &type metadata for String;
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
          sub_100009C74();
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
    id v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10001C804(v6, v7);
    sub_10001C804(v7, v40);
    sub_10001C804(v40, &v38);
    unint64_t result = sub_10001ACD8(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      long long v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      id v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      BOOL v11 = v15;
      uint64_t v1 = v14;
      double v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      Class v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_10001AC88((uint64_t)v18);
      unint64_t result = (unint64_t)sub_10001C804(&v38, v18);
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
    float v27 = (uint64_t *)(v2[6] + 16 * result);
    *float v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_10001C804(&v38, (_OWORD *)(v2[7] + 32 * result));
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

uint64_t sub_10001594C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2) {
    return sub_100020168();
  }
  else {
    return 0;
  }
}

uint64_t sub_100015A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a7;
  v8[9] = a8;
  v8[6] = a5;
  v8[7] = a6;
  v8[5] = a4;
  sub_100020208();
  v8[10] = sub_1000201F8();
  uint64_t v10 = sub_1000201E8();
  return _swift_task_switch(sub_100015AC0, v10, v9);
}

uint64_t sub_100015AC0()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(unsigned char **)(v0 + 48);
  swift_release();
  char v5 = v3[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton];
  CGRectGetWidth(*(CGRect *)&v3[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_frame]);
  sub_100011F78((v5 & 1) == 0, v3, v1);
  uint64_t v7 = v6;
  swift_beginAccess();
  uint64_t v8 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v7;

  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag);
  if (v9) {
    *(unsigned char *)(v9 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_renderedSuccessfully) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 72));
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

id sub_100015C4C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10001FA78();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v182 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(unsigned char **)&v1[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag];
  if (!v8 || v8[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_renderedSuccessfully] != 1)
  {
    unint64_t v19 = sub_10001FBD8();
    os_log_type_t v20 = sub_100020298();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "#ContactsButton rendering did not succeed", v21, 2u);
      swift_slowDealloc();
    }

    sub_10001FA58();
    sub_10001F9B8();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType._failedRendering(_:), v4);
    uint64_t v22 = sub_10001FA68();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id v23 = objc_allocWithZone((Class)NSError);
    NSString v24 = sub_100020088();
    swift_bridgeObjectRelease();
    id v25 = [v23 initWithDomain:v24 code:v22 userInfo:0];
    goto LABEL_39;
  }
  uint64_t v187 = v4;
  uint64_t v9 = self;
  uint64_t v10 = v8;
  id v11 = [v9 sharedInstance];
  id v12 = [v11 authenticateMessage:a1];

  if (v12 != (id)2)
  {
    char v26 = sub_10001FBD8();
    os_log_type_t v27 = sub_100020298();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 134217984;
      v189[0] = (uint64_t)v12;
      sub_100020338();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "#ContactsButton authentication status is invalid: %ld", v28, 0xCu);
      swift_slowDealloc();
    }

    sub_10001FA58();
    sub_10001F9B8();
    BOOL v29 = (unsigned int *)&enum case for ContactButtonServiceErrorType._invalidAuthMessage(_:);
    goto LABEL_37;
  }
  long long v13 = (uint64_t *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_auditToken];
  if (v2[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_auditToken + 32])
  {
    uint64_t v14 = sub_10001FBD8();
    os_log_type_t v15 = sub_100020298();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = v187;
    if (v16)
    {
      Class v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Class v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "#ContactsButton no audit token found", v18, 2u);
      swift_slowDealloc();
    }

    sub_10001FA58();
    sub_10001F9B8();
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType._invalidAuditToken(_:), v17);
    goto LABEL_38;
  }
  uint64_t v31 = v13[2];
  uint64_t v30 = v13[3];
  uint64_t v32 = *(void *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_auditToken + 8];
  v189[0] = *v13;
  v189[1] = v32;
  v189[2] = v31;
  v189[3] = v30;
  id v33 = (id)BSVersionedPIDForAuditToken();
  if (v33 != [a1 versionedPID])
  {
    id v40 = a1;
    id v41 = sub_10001FBD8();
    os_log_type_t v42 = sub_100020298();
    if (os_log_type_enabled(v41, v42))
    {
      unsigned int v43 = (_DWORD *)swift_slowAlloc();
      v186 = v10;
      unsigned int v44 = v43;
      _DWORD *v43 = 134218240;
      v189[0] = (uint64_t)[v40 versionedPID];
      sub_100020338();

      *((_WORD *)v44 + 6) = 2048;
      v189[0] = (uint64_t)v33;
      sub_100020338();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "#ContactsButton authMessage vpid: %lld does not matches auditToken vpid: %lld", (uint8_t *)v44, 0x16u);
      uint64_t v10 = v186;
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10001FA58();
    sub_10001F9B8();
    BOOL v29 = (unsigned int *)&enum case for ContactButtonServiceErrorType._mismatchedTokenPid(_:);
LABEL_37:
    uint64_t v17 = v187;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v29, v187);
LABEL_38:
    uint64_t v73 = sub_10001FA68();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
    id v74 = objc_allocWithZone((Class)NSError);
    NSString v24 = sub_100020088();
    swift_bridgeObjectRelease();
    id v25 = [v74 initWithDomain:v24 code:v73 userInfo:0];

LABEL_39:
    return v25;
  }
  uint64_t v34 = mach_continuous_time();
  if (v34 < (unint64_t)[a1 timestamp])
  {
    id v35 = a1;
    uint64_t v36 = sub_10001FBD8();
    os_log_type_t v37 = sub_100020298();
    if (os_log_type_enabled(v36, v37))
    {
      long long v38 = (_DWORD *)swift_slowAlloc();
      v186 = v10;
      uint64_t v39 = v38;
      *long long v38 = 134218240;
      v189[0] = v34;
      sub_100020338();
      *((_WORD *)v39 + 6) = 2048;
      v189[0] = (uint64_t)[v35 timestamp];
      sub_100020338();

      _os_log_impl((void *)&_mh_execute_header, v36, v37, "#ContactsButton authentication message came from the future? currentTime: %llu  messageTime: %llu", (uint8_t *)v39, 0x16u);
      uint64_t v10 = v186;
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10001FA58();
    sub_10001F9B8();
    long long v76 = (unsigned int *)&enum case for ContactButtonServiceErrorType._invalidTimestamp(_:);
LABEL_49:
    uint64_t v87 = v187;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v76, v187);
    uint64_t v88 = sub_10001FA68();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v87);
    id v89 = objc_allocWithZone((Class)NSError);
    NSString v90 = sub_100020088();
    swift_bridgeObjectRelease();
    id v25 = [v89 initWithDomain:v90 code:v88 userInfo:0];

    return v25;
  }
  id v45 = [a1 timestamp];
  unint64_t v47 = v34 - (void)v45;
  if (v34 < (unint64_t)v45)
  {
    __break(1u);
  }
  else if (qword_10002DB60 == -1)
  {
    goto LABEL_22;
  }
  swift_once();
LABEL_22:
  if (!is_mul_ok(v47, qword_10002E560))
  {
    __break(1u);
LABEL_114:
    if (([v10 hasInsecureFilter] & 1) != 0
      || [v185 hasInsecureFilter])
    {
      uint64_t v173 = v10;
      uint64_t v174 = v185;
      uint64_t v175 = sub_10001FBD8();
      os_log_type_t v176 = sub_100020298();
      if (os_log_type_enabled(v175, v176))
      {
        uint64_t v177 = swift_slowAlloc();
        *(_DWORD *)uint64_t v177 = 67109376;
        LODWORD(v189[0]) = [v173 hasInsecureFilter];
        sub_100020338();

        *(_WORD *)(v177 + 8) = 1024;
        LODWORD(v189[0]) = [v174 hasInsecureFilter];
        sub_100020338();

        _os_log_impl((void *)&_mh_execute_header, v175, v176, "#ContactsButton insecure filter start=%{BOOL}d end=%{BOOL}d", (uint8_t *)v177, 0xEu);
        swift_slowDealloc();
      }
      else
      {
      }
      sub_10001FA58();
      sub_10001F9B8();
      uint64_t v178 = v187;
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType._insecureFilter(_:), v187);
      uint64_t v179 = sub_10001FA68();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v178);
      id v180 = objc_allocWithZone((Class)NSError);
      NSString v181 = sub_100020088();
      swift_bridgeObjectRelease();
      id v25 = [v180 initWithDomain:v181 code:v179 userInfo:0];
    }
    else
    {

      return 0;
    }
    return v25;
  }
  LODWORD(v46) = HIDWORD(qword_10002E560);
  double v48 = (double)(v47 * qword_10002E560) / (double)v46 / 1000000000.0;
  if (v48 >= 3.0)
  {
    id v77 = a1;
    uint64_t v78 = sub_10001FBD8();
    os_log_type_t v79 = sub_100020298();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = (_DWORD *)swift_slowAlloc();
      v186 = v10;
      uint64_t v81 = v80;
      _DWORD *v80 = 134218496;
      *(double *)v189 = v48;
      sub_100020338();
      *((_WORD *)v81 + 6) = 2048;
      v189[0] = v34;
      sub_100020338();
      *((_WORD *)v81 + 11) = 2048;
      v189[0] = (uint64_t)[v77 timestamp];
      sub_100020338();

      _os_log_impl((void *)&_mh_execute_header, v78, v79, "#ContactsButton message is too old: %f  currentTime: %llu  messageTime: %llu", (uint8_t *)v81, 0x20u);
      uint64_t v10 = v186;
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10001FA58();
    sub_10001F9B8();
    long long v76 = (unsigned int *)&enum case for ContactButtonServiceErrorType._oldTimestamp(_:);
    goto LABEL_49;
  }
  unsigned int v49 = [a1 targetSlotID];
  uint64_t v50 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotID;
  if (v49 != *(_DWORD *)&v2[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotID])
  {
    v186 = v10;
    uint64_t v82 = v2;
    id v83 = a1;
    uint64_t v84 = sub_10001FBD8();
    os_log_type_t v85 = sub_100020298();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 67109376;
      LODWORD(v189[0]) = *(_DWORD *)&v2[v50];
      sub_100020338();

      *(_WORD *)(v86 + 8) = 1024;
      LODWORD(v189[0]) = [v83 targetSlotID];
      sub_100020338();

      _os_log_impl((void *)&_mh_execute_header, v84, v85, "#ContactsButton invalid slot ID, expected %u but got %u", (uint8_t *)v86, 0xEu);
      swift_slowDealloc();
    }
    else
    {
    }
    sub_10001FA58();
    sub_10001F9B8();
    uint64_t v91 = v187;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType._slotIDMismatch(_:), v187);
    uint64_t v92 = sub_10001FA68();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v91);
    id v93 = objc_allocWithZone((Class)NSError);
    NSString v94 = sub_100020088();
    swift_bridgeObjectRelease();
    id v25 = [v93 initWithDomain:v94 code:v92 userInfo:0];
    id v95 = v186;
    goto LABEL_52;
  }
  id v51 = [a1 hitTestInformationFromStartEvent];
  if (!v51)
  {
    uint64_t v96 = sub_10001FBD8();
    os_log_type_t v97 = sub_100020298();
    if (os_log_type_enabled(v96, v97))
    {
      long long v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v98 = 0;
      _os_log_impl((void *)&_mh_execute_header, v96, v97, "#ContactsButton message didn't have starting hit test info?", v98, 2u);
      swift_slowDealloc();
    }

    sub_10001FA58();
    sub_10001F9B8();
    long long v76 = (unsigned int *)&enum case for ContactButtonServiceErrorType._missingHitTest(_:);
    goto LABEL_49;
  }
  uint64_t v52 = v51;
  id v53 = [a1 hitTestInformationFromEndEvent];
  if (v53)
  {
    uint64_t v54 = v53;
    [v52 cumulativeOpacity];
    char v56 = sub_10000C240(0, v55);
    char v185 = v54;
    [v54 cumulativeOpacity];
    char v58 = sub_10000C240(0, v57);
    char v59 = v58;
    if (v56 & 1) != 0 && (v58)
    {
      [v52 cumulativeOpacity];
      char v61 = sub_10000C240(1, v60);
      [v185 cumulativeOpacity];
      char v63 = sub_10000C240(1, v62);
      char v64 = v63;
      if (v61 & 1) != 0 && (v63)
      {
        if (sub_10000BBE8())
        {
          uint64_t v65 = v52;
          char v66 = sub_10001FBD8();
          os_log_type_t v67 = sub_100020298();
          if (os_log_type_enabled(v66, v67))
          {
            long long v68 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)long long v68 = 0;
            _os_log_impl((void *)&_mh_execute_header, v66, v67, "#ContactsButton font size is too small to be legible", v68, 2u);
            swift_slowDealloc();
          }

          sub_100004B44(&qword_10002E668);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_1000211C0;
          sub_10001FA58();
          *(void *)(inited + 32) = sub_10001F9C8();
          *(void *)(inited + 40) = v70;
          *(void *)(inited + 48) = 0xD000000000000034;
          *(void *)(inited + 56) = 0x8000000100024700;
          unint64_t v71 = sub_100014310(inited);
          sub_10001F9B8();
          char v72 = (unsigned int *)&enum case for ContactButtonServiceErrorType.fontTooSmall(_:);
LABEL_96:
          uint64_t v139 = v187;
          (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v72, v187);
          uint64_t v140 = sub_10001FA68();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v139);
          sub_100015434(v71);
          swift_bridgeObjectRelease();
          id v141 = objc_allocWithZone((Class)NSError);
          NSString v128 = sub_100020088();
          swift_bridgeObjectRelease();
          v133.super.Class isa = sub_100020038().super.isa;
          swift_bridgeObjectRelease();
          id v25 = [v141 initWithDomain:v128 code:v140 userInfo:v133.super.isa];

          goto LABEL_91;
        }
        if (sub_10000BD58())
        {
          uint64_t v65 = v52;
          uint64_t v134 = sub_10001FBD8();
          os_log_type_t v135 = sub_100020298();
          if (os_log_type_enabled(v134, v135))
          {
            uint64_t v136 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v136 = 0;
            _os_log_impl((void *)&_mh_execute_header, v134, v135, "#ContactsButton font size is too large to be useful", v136, 2u);
            swift_slowDealloc();
          }

          sub_100004B44(&qword_10002E668);
          uint64_t v137 = swift_initStackObject();
          *(_OWORD *)(v137 + 16) = xmmword_1000211C0;
          sub_10001FA58();
          *(void *)(v137 + 32) = sub_10001F9C8();
          *(void *)(v137 + 40) = v138;
          *(void *)(v137 + 48) = 0xD000000000000034;
          *(void *)(v137 + 56) = 0x80000001000246C0;
          unint64_t v71 = sub_100014310(v137);
          sub_10001F9B8();
          char v72 = (unsigned int *)&enum case for ContactButtonServiceErrorType.fontTooBig(_:);
          goto LABEL_96;
        }
        v186 = v10;
        if (!sub_10000BECC())
        {
          uint64_t v147 = v52;
          uint64_t v148 = sub_10001FBD8();
          os_log_type_t v149 = sub_100020298();
          if (os_log_type_enabled(v148, v149))
          {
            uint64_t v150 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v150 = 0;
            _os_log_impl((void *)&_mh_execute_header, v148, v149, "#ContactsButton avatar is too large", v150, 2u);
            swift_slowDealloc();
          }

          sub_100004B44(&qword_10002E668);
          uint64_t v151 = swift_initStackObject();
          *(_OWORD *)(v151 + 16) = xmmword_1000211C0;
          sub_10001FA58();
          *(void *)(v151 + 32) = sub_10001F9C8();
          *(void *)(v151 + 40) = v152;
          *(void *)(v151 + 48) = 0xD000000000000047;
          *(void *)(v151 + 56) = 0x8000000100024630;
          unint64_t v153 = sub_100014310(v151);
          sub_10001F9B8();
          uint64_t v154 = v187;
          (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType.avatarTooLarge(_:), v187);
          uint64_t v155 = sub_10001FA68();
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v154);
          sub_100015434(v153);
          swift_bridgeObjectRelease();
          id v156 = objc_allocWithZone((Class)NSError);
          NSString v128 = sub_100020088();
          swift_bridgeObjectRelease();
          v133.super.Class isa = sub_100020038().super.isa;
          swift_bridgeObjectRelease();
          id v25 = [v156 initWithDomain:v128 code:v155 userInfo:v133.super.isa];

          goto LABEL_91;
        }
        uint64_t v10 = v52;
        if (sub_100017AD0(v52, v185))
        {
          if (([v52 detectedOcclusion] & 1) != 0
            || [v185 detectedOcclusion])
          {
            id v142 = v52;
            char v143 = v185;
            long long v144 = sub_10001FBD8();
            os_log_type_t v145 = sub_100020298();
            if (os_log_type_enabled(v144, v145))
            {
              uint64_t v146 = swift_slowAlloc();
              *(_DWORD *)uint64_t v146 = 67109376;
              LODWORD(v189[0]) = [v142 detectedOcclusion];
              sub_100020338();

              *(_WORD *)(v146 + 8) = 1024;
              LODWORD(v189[0]) = [v143 detectedOcclusion];
              sub_100020338();

              _os_log_impl((void *)&_mh_execute_header, v144, v145, "#ContactsButton occlusion detected start=%{BOOL}d end=%{BOOL}d", (uint8_t *)v146, 0xEu);
              swift_slowDealloc();
            }
            else
            {
            }
            sub_100004B44(&qword_10002E668);
            uint64_t v165 = swift_initStackObject();
            *(_OWORD *)(v165 + 16) = xmmword_1000211C0;
            sub_10001FA58();
            *(void *)(v165 + 32) = sub_10001F9C8();
            *(void *)(v165 + 40) = v166;
            *(void *)(v165 + 48) = 0xD000000000000012;
            *(void *)(v165 + 56) = 0x80000001000246A0;
            unint64_t v167 = sub_100014310(v165);
            sub_10001F9B8();
            uint64_t v168 = v187;
            (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType.buttonOccluded(_:), v187);
            uint64_t v169 = sub_10001FA68();
            (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v168);
            sub_100015434(v167);
            swift_bridgeObjectRelease();
            id v170 = objc_allocWithZone((Class)NSError);
            NSString v171 = sub_100020088();
            swift_bridgeObjectRelease();
            Class isa = sub_100020038().super.isa;
            swift_bridgeObjectRelease();
            id v25 = [v170 initWithDomain:v171 code:v169 userInfo:isa];

            return v25;
          }
          goto LABEL_114;
        }
        v157 = sub_10001FBD8();
        os_log_type_t v158 = sub_100020298();
        if (os_log_type_enabled(v157, v158))
        {
          uint64_t v159 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v159 = 0;
          _os_log_impl((void *)&_mh_execute_header, v157, v158, "#ContactsButton invalid transform", v159, 2u);
          swift_slowDealloc();
        }

        sub_100004B44(&qword_10002E668);
        uint64_t v160 = swift_initStackObject();
        *(_OWORD *)(v160 + 16) = xmmword_1000211C0;
        sub_10001FA58();
        *(void *)(v160 + 32) = sub_10001F9C8();
        *(void *)(v160 + 40) = v161;
        *(void *)(v160 + 48) = 0xD000000000000018;
        *(void *)(v160 + 56) = 0x8000000100024680;
        sub_100014310(v160);
        swift_bridgeObjectRelease();
        sub_10001F9B8();
        uint64_t v162 = v187;
        (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType.invalidTransform(_:), v187);
        uint64_t v163 = sub_10001FA68();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v162);
        id v164 = objc_allocWithZone((Class)NSError);
        NSString v94 = sub_100020088();
        swift_bridgeObjectRelease();
        id v25 = [v164 initWithDomain:v94 code:v163 userInfo:0];

        id v95 = v185;
LABEL_52:

        return v25;
      }
      v186 = v52;
      uint64_t v114 = sub_10001FBD8();
      os_log_type_t v115 = sub_100020298();
      int v116 = v115;
      if (os_log_type_enabled(v114, v115))
      {
        uint64_t v117 = swift_slowAlloc();
        uint64_t v184 = swift_slowAlloc();
        v189[0] = v184;
        *(_DWORD *)uint64_t v117 = 136315394;
        if (v61) {
          uint64_t v118 = 0;
        }
        else {
          uint64_t v118 = 7630702;
        }
        if (v61) {
          unint64_t v119 = 0xE000000000000000;
        }
        else {
          unint64_t v119 = 0xE300000000000000;
        }
        uint64_t v188 = sub_10001A630(v118, v119, v189);
        int v183 = v116;
        sub_100020338();
        swift_bridgeObjectRelease();
        *(_WORD *)(v117 + 12) = 2080;
        if (v64) {
          uint64_t v120 = 0;
        }
        else {
          uint64_t v120 = 7630702;
        }
        if (v64) {
          unint64_t v121 = 0xE000000000000000;
        }
        else {
          unint64_t v121 = 0xE300000000000000;
        }
        uint64_t v188 = sub_10001A630(v120, v121, v189);
        sub_100020338();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v114, (os_log_type_t)v183, "#ContactsButton invalid contrast for tint color, start %s ok, end %s ok", (uint8_t *)v117, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      sub_100004B44(&qword_10002E668);
      uint64_t v122 = swift_initStackObject();
      *(_OWORD *)(v122 + 16) = xmmword_1000211C0;
      sub_10001FA58();
      *(void *)(v122 + 32) = sub_10001F9C8();
      *(void *)(v122 + 40) = v123;
      *(void *)(v122 + 48) = 0xD000000000000062;
      *(void *)(v122 + 56) = 0x80000001000245C0;
      unint64_t v124 = sub_100014310(v122);
      sub_10001F9B8();
      uint64_t v125 = v187;
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType.invalidContrast(_:), v187);
      uint64_t v126 = sub_10001FA68();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v125);
      sub_100015434(v124);
      swift_bridgeObjectRelease();
      id v127 = objc_allocWithZone((Class)NSError);
      NSString v128 = sub_100020088();
      swift_bridgeObjectRelease();
    }
    else
    {
      v186 = v52;
      uint64_t v106 = sub_10001FBD8();
      os_log_type_t v107 = sub_100020298();
      int v108 = v107;
      if (os_log_type_enabled(v106, v107))
      {
        uint64_t v109 = swift_slowAlloc();
        uint64_t v184 = swift_slowAlloc();
        v189[0] = v184;
        *(_DWORD *)uint64_t v109 = 136315394;
        if (v56) {
          uint64_t v110 = 0;
        }
        else {
          uint64_t v110 = 7630702;
        }
        if (v56) {
          unint64_t v111 = 0xE000000000000000;
        }
        else {
          unint64_t v111 = 0xE300000000000000;
        }
        int v183 = v108;
        uint64_t v188 = sub_10001A630(v110, v111, v189);
        sub_100020338();
        swift_bridgeObjectRelease();
        *(_WORD *)(v109 + 12) = 2080;
        if (v59) {
          uint64_t v112 = 0;
        }
        else {
          uint64_t v112 = 7630702;
        }
        if (v59) {
          unint64_t v113 = 0xE000000000000000;
        }
        else {
          unint64_t v113 = 0xE300000000000000;
        }
        uint64_t v188 = sub_10001A630(v112, v113, v189);
        sub_100020338();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v106, (os_log_type_t)v183, "#ContactsButton invalid contrast for FG font color, start %s ok, end %s ok", (uint8_t *)v109, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      sub_100004B44(&qword_10002E668);
      uint64_t v129 = swift_initStackObject();
      *(_OWORD *)(v129 + 16) = xmmword_1000211C0;
      sub_10001FA58();
      *(void *)(v129 + 32) = sub_10001F9C8();
      *(void *)(v129 + 40) = v130;
      *(void *)(v129 + 48) = 0xD00000000000006CLL;
      *(void *)(v129 + 56) = 0x8000000100024550;
      unint64_t v131 = sub_100014310(v129);
      sub_10001F9B8();
      uint64_t v132 = v187;
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType.invalidContrast(_:), v187);
      uint64_t v126 = sub_10001FA68();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v132);
      sub_100015434(v131);
      swift_bridgeObjectRelease();
      id v127 = objc_allocWithZone((Class)NSError);
      NSString v128 = sub_100020088();
      swift_bridgeObjectRelease();
    }
    v133.super.Class isa = sub_100020038().super.isa;
    swift_bridgeObjectRelease();
    id v25 = [v127 initWithDomain:v128 code:v126 userInfo:v133.super.isa];

LABEL_91:
    return v25;
  }
  uint64_t v99 = sub_10001FBD8();
  os_log_type_t v100 = sub_100020298();
  if (os_log_type_enabled(v99, v100))
  {
    uint64_t v101 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v101 = 0;
    _os_log_impl((void *)&_mh_execute_header, v99, v100, "#ContactsButton message didn't have ending hit test info?", v101, 2u);
    swift_slowDealloc();
  }

  sub_10001FA58();
  sub_10001F9B8();
  uint64_t v102 = v187;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for ContactButtonServiceErrorType._missingHitTest(_:), v187);
  uint64_t v103 = sub_10001FA68();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v102);
  id v104 = objc_allocWithZone((Class)NSError);
  NSString v105 = sub_100020088();
  swift_bridgeObjectRelease();
  id v25 = [v104 initWithDomain:v105 code:v103 userInfo:0];

  return v25;
}

BOOL sub_100017AD0(void *a1, void *a2)
{
  uint64_t v5 = *(void **)(v2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_layerGrader);
  [a1 cumulativeLayerTransform];
  long long v41 = v54;
  long long v43 = v53;
  long long v37 = v56;
  long long v39 = v55;
  long long v33 = v58;
  long long v35 = v57;
  long long v31 = v59;
  long long v6 = v60;
  [a2 cumulativeLayerTransform];
  long long v7 = v53;
  long long v8 = v54;
  long long v9 = v55;
  long long v10 = v56;
  long long v11 = v57;
  long long v12 = v58;
  long long v13 = v59;
  long long v14 = v60;
  long long v53 = v43;
  long long v54 = v41;
  long long v55 = v39;
  long long v56 = v37;
  long long v57 = v35;
  long long v58 = v33;
  long long v59 = v31;
  long long v60 = v6;
  long long v45 = v7;
  long long v46 = v8;
  long long v47 = v9;
  long long v48 = v10;
  long long v49 = v11;
  long long v50 = v12;
  long long v51 = v13;
  long long v52 = v14;
  unint64_t v15 = (unint64_t)[v5 gradeStartTransform3D:&v53 endTransform3D:&v45];
  BOOL v16 = *(void **)(v2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_contentsGrader);
  [a1 cumulativeContentsTransform];
  long long v44 = v53;
  long long v42 = v54;
  long long v40 = v55;
  long long v38 = v56;
  long long v36 = v57;
  long long v34 = v58;
  long long v32 = v59;
  long long v17 = v60;
  [a2 cumulativeContentsTransform];
  long long v18 = v53;
  long long v19 = v54;
  long long v20 = v55;
  long long v21 = v56;
  long long v22 = v57;
  long long v23 = v58;
  long long v24 = v59;
  long long v25 = v60;
  long long v53 = v44;
  long long v54 = v42;
  long long v55 = v40;
  long long v56 = v38;
  long long v57 = v36;
  long long v58 = v34;
  long long v59 = v32;
  long long v60 = v17;
  long long v45 = v18;
  long long v46 = v19;
  long long v47 = v20;
  long long v48 = v21;
  long long v49 = v22;
  long long v50 = v23;
  long long v51 = v24;
  long long v52 = v25;
  unint64_t v26 = (unint64_t)[v16 gradeStartTransform3D:&v53 endTransform3D:&v45];
  os_log_type_t v27 = sub_10001FBD8();
  os_log_type_t v28 = sub_100020288();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134218240;
    *(void *)&long long v53 = v15;
    sub_100020338();
    *(_WORD *)(v29 + 12) = 2048;
    *(void *)&long long v53 = v26;
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "#ContactsButton layerStatus: %lu  contentsStatus: %lu", (uint8_t *)v29, 0x16u);
    swift_slowDealloc();
  }

  return (v15 | v26) == 0;
}

double sub_100017D84()
{
  double v1 = 0.0;
  mach_timebase_info((mach_timebase_info_t)&v1);
  double result = v1;
  qword_10002E560 = *(void *)&v1;
  return result;
}

void sub_100017DE8(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v12 = sub_10001FB88();
  __chkstk_darwin(v12 - 8);
  unint64_t v124 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100020078();
  __chkstk_darwin(v14 - 8);
  uint64_t v123 = (char *)&v110 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_10001FB78();
  uint64_t v114 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  long long v17 = (char *)&v110 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_10001FAC8();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  long long v21 = (char *)&v110 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001FAB8();
  id v22 = [a1 givenName];
  sub_1000200B8();

  sub_10001FA88();
  id v23 = [a1 familyName];
  sub_1000200B8();

  sub_10001FA98();
  long long v24 = self;
  Class v25 = sub_10001FAA8();
  id v26 = [v24 localizedStringFromPersonNameComponents:v25 style:0 options:0];

  uint64_t v27 = sub_1000200B8();
  uint64_t v119 = v28;

  uint64_t v29 = sub_10001F9E8();
  unint64_t v121 = v21;
  uint64_t v122 = v19;
  uint64_t v120 = v27;
  if (v29 == 0x6C69616D65 && v30 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    id v32 = [a1 emailAddresses];
    sub_100004B44(&qword_10002E660);
    unint64_t v33 = sub_100020198();

    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100020428();
      swift_bridgeObjectRelease();
      if (!v46) {
        goto LABEL_28;
      }
      goto LABEL_7;
    }
    if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_7:
      if ((v33 & 0xC000000000000001) != 0)
      {
        id v34 = (id)sub_1000203A8();
LABEL_10:
        long long v35 = v34;
        swift_bridgeObjectRelease();
        id v36 = [v35 value];

        if (v36)
        {
          uint64_t v117 = sub_1000200B8();
          unint64_t v116 = v37;

          goto LABEL_30;
        }
        goto LABEL_29;
      }
      if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v34 = *(id *)(v33 + 32);
        goto LABEL_10;
      }
      __break(1u);
LABEL_27:
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_100020428();
      swift_bridgeObjectRelease();
      if (!v47) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  char v31 = sub_1000204A8();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_5;
  }
  if (sub_10001F9E8() == 0x656E6F6870 && v38 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v39 = sub_1000204A8();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0) {
      goto LABEL_29;
    }
  }
  id v40 = [a1 phoneNumbers];
  sub_100004B44(&qword_10002E660);
  unint64_t v33 = sub_100020198();

  if (v33 >> 62) {
    goto LABEL_27;
  }
  if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_28;
  }
LABEL_18:
  if ((v33 & 0xC000000000000001) != 0)
  {
    id v41 = (id)sub_1000203A8();
  }
  else
  {
    if (!*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_54;
    }
    id v41 = *(id *)(v33 + 32);
  }
  long long v42 = v41;
  swift_bridgeObjectRelease();
  id v43 = [v42 value];

  if (v43)
  {
    id v44 = [v43 stringValue];
    uint64_t v117 = sub_1000200B8();
    unint64_t v116 = v45;

    goto LABEL_30;
  }
LABEL_29:
  uint64_t v117 = 0;
  unint64_t v116 = 0xE000000000000000;
LABEL_30:
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1000211D0;
  unsigned int v49 = [a1 imageDataAvailable];
  id v118 = a2;
  if (v49)
  {
    id v50 = [a1 thumbnailImageData];
    if (v50)
    {
      long long v51 = v50;
      uint64_t v52 = sub_10001FB38();
      uint64_t v54 = v53;

      uint64_t v55 = *(void *)(v48 + 16);
      unint64_t v56 = *(void *)(v48 + 24);
      *(void *)(v48 + 16) = v52;
      *(void *)(v48 + 24) = v54;
      sub_1000124F4(v55, v56);
    }
  }
  else
  {
    long long v57 = dispatch_group_create();
    dispatch_group_enter(v57);
    id v58 = [objc_allocWithZone((Class)CNAvatarImageRenderer) init];
    uint64_t v59 = v125;
    uint64_t v60 = *(void *)(v125 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag);
    id v112 = v58;
    unint64_t v111 = v57;
    if (v60) {
      double v61 = *(double *)(v60 + OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarWidth);
    }
    else {
      double v61 = 41.0;
    }
    id v62 = [self mainScreen];
    [v62 scale];
    double v64 = v63;

    uint64_t v65 = *(void **)(v59 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle);
    uint64_t v113 = v18;
    if (v65)
    {
      id v66 = [v65 localization];
      sub_1000200B8();

      sub_10001FB58();
      uint64_t v67 = sub_10001FB68();
      (*(void (**)(char *, uint64_t))(v114 + 8))(v17, v115);
      BOOL v68 = v67 != 1;
    }
    else
    {
      BOOL v68 = 1;
    }
    id v69 = objc_msgSend(self, "scopeWithPointSize:scale:rightToLeft:style:", v68, 0, v61, v61, v64);
    id v70 = [a1 givenName];
    uint64_t v71 = sub_1000200B8();
    unint64_t v73 = v72;

    uint64_t v74 = sub_10001594C(v71, v73);
    unint64_t v76 = v75;
    swift_bridgeObjectRelease();
    if (v76) {
      uint64_t v77 = v74;
    }
    else {
      uint64_t v77 = 32;
    }
    if (!v76) {
      unint64_t v76 = 0xE100000000000000;
    }
    id v78 = [a1 familyName];
    uint64_t v79 = sub_1000200B8();
    unint64_t v81 = v80;

    uint64_t v82 = sub_10001594C(v79, v81);
    uint64_t v84 = v83;
    swift_bridgeObjectRelease();
    if (v84) {
      uint64_t v85 = v82;
    }
    else {
      uint64_t v85 = 32;
    }
    if (!v84) {
      uint64_t v84 = (void *)0xE100000000000000;
    }
    aBlock = (void **)v77;
    uint64_t v127 = v76;
    swift_bridgeObjectRetain();
    v132._countAndFlagsBits = v85;
    v132._object = v84;
    sub_100020138(v132);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    NSString v86 = sub_100020088();
    swift_bridgeObjectRelease();
    uint64_t v87 = swift_allocObject();
    uint64_t v88 = v111;
    *(void *)(v87 + 16) = v48;
    *(void *)(v87 + 24) = v88;
    uint64_t v130 = sub_10001C7D0;
    uint64_t v131 = v87;
    aBlock = _NSConcreteStackBlock;
    uint64_t v127 = 1107296256;
    NSString v128 = sub_10000C0F4;
    uint64_t v129 = &unk_1000297F0;
    id v89 = _Block_copy(&aBlock);
    swift_retain();
    NSString v90 = v88;
    swift_release();
    id v91 = v112;
    id v92 = [v112 renderMonogramForString:v86 scope:v69 imageHandler:v89];
    _Block_release(v89);
    swift_unknownObjectRelease();

    sub_1000202D8();
    swift_unknownObjectRelease();
    uint64_t v18 = v113;
  }
  sub_100020068();
  sub_10001FB48();
  uint64_t v93 = sub_1000200D8();
  uint64_t v95 = v94;
  swift_beginAccess();
  uint64_t v96 = *(void **)(v125 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext);
  if (v96)
  {
    uint64_t v98 = *(void *)(v48 + 16);
    unint64_t v97 = *(void *)(v48 + 24);
    sub_10001C7F0(v98, v97);
    unsigned __int8 v99 = [v96 isAccessDenied];
    id v100 = v118;
    uint64_t v101 = (char *)sub_100011924(a3, a4, a5, a6, (uint64_t)v100, v93, v95);

    uint64_t v102 = (uint64_t *)&v101[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
    uint64_t v103 = v119;
    *uint64_t v102 = v120;
    v102[1] = v103;
    id v104 = v101;
    swift_bridgeObjectRelease();
    NSString v105 = (uint64_t *)&v104[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
    unint64_t v106 = v116;
    uint64_t *v105 = v117;
    v105[1] = v106;
    swift_bridgeObjectRelease();
    os_log_type_t v107 = (uint64_t *)&v104[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData];
    uint64_t v108 = *(void *)&v104[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData];
    unint64_t v109 = *(void *)&v104[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData + 8];
    *os_log_type_t v107 = v98;
    v107[1] = v97;
    sub_1000124F4(v108, v109);
    v104[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton] = v99;

    (*(void (**)(char *, uint64_t))(v122 + 8))(v121, v18);
    swift_release();
    return;
  }
LABEL_54:
  __break(1u);
}

void sub_100018930(UIImage *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = UIImagePNGRepresentation(a1);
  if (v5)
  {
    long long v6 = v5;
    uint64_t v7 = sub_10001FB38();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xF000000000000000;
  }
  swift_beginAccess();
  uint64_t v10 = *(void *)(a2 + 16);
  unint64_t v11 = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = v7;
  *(void *)(a2 + 24) = v9;
  sub_1000124F4(v10, v11);
  dispatch_group_leave(a3);
}

char *sub_1000189C4(unint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = sub_10001FAC8();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v127 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001FB88();
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)v127 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100020078();
  __chkstk_darwin(v20 - 8);
  Swift::String v132 = (char *)v127 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = *(void **)&v6[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext];
  if (!v22) {
    goto LABEL_65;
  }
  if ([v22 isAccessDenied])
  {
    id v23 = a2;
    sub_100020068();
    sub_10001FB48();
    sub_1000200D8();
    sub_100004B44(&qword_10002E4F8);
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1000211C0;
    uint64_t v26 = *(void *)&v6[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedAppName];
    uint64_t v25 = *(void *)&v6[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedAppName + 8];
    *(void *)(v24 + 56) = &type metadata for String;
    *(void *)(v24 + 64) = sub_1000136E8();
    *(void *)(v24 + 32) = v26;
    *(void *)(v24 + 40) = v25;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1000200C8();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    sub_100020068();
    sub_10001FB48();
    uint64_t v30 = sub_1000200D8();
    uint64_t v32 = v31;
    sub_100020068();
    sub_10001FB48();
    uint64_t v33 = sub_1000200D8();
    long long v35 = (char *)sub_100011924(a3, a4, a5, a6, (uint64_t)v23, v33, v34);

    id v36 = (uint64_t *)&v35[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
    uint64_t *v36 = v27;
    v36[1] = v29;
    unint64_t v37 = v35;
    swift_bridgeObjectRelease();
    uint64_t v38 = (uint64_t *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
    *uint64_t v38 = v30;
    v38[1] = v32;
    swift_bridgeObjectRelease();
    uint64_t v39 = *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData];
    unint64_t v40 = *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData + 8];
    *(_OWORD *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData] = xmmword_1000211D0;
    sub_1000124F4(v39, v40);
    v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton] = 1;
LABEL_4:

    return v37;
  }
  if (!a1)
  {
    if (sub_100020118())
    {
      uint64_t v47 = sub_10001FBD8();
      os_log_type_t v48 = sub_1000202A8();
      if (os_log_type_enabled(v47, v48))
      {
        unsigned int v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned int v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "#ContactsButton had contacts in it, but is somehow null??", v49, 2u);
        swift_slowDealloc();
      }

      return 0;
    }
    goto LABEL_21;
  }
  v127[2] = v6;
  unint64_t v42 = a1 >> 62;
  unint64_t v131 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_100020428();
    swift_bridgeObjectRelease();
    if (!v50) {
      goto LABEL_21;
    }
  }
  else if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_21;
  }
  if (sub_100020118())
  {
    unint64_t v43 = v131;
    if (!v42)
    {
      int64_t v44 = *(void *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v44 == 1)
      {
LABEL_12:
        if ((v43 & 0xC000000000000001) != 0)
        {
          id v45 = (id)sub_1000203A8();
          goto LABEL_15;
        }
        if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v45 = *(id *)(v43 + 32);
LABEL_15:
          swift_bridgeObjectRelease();
          sub_100017DE8(v45, a2, a3, a4, a5, a6);
          unint64_t v37 = v46;

          return v37;
        }
        __break(1u);
        goto LABEL_63;
      }
LABEL_29:
      if (v44 < 2)
      {
        swift_bridgeObjectRelease();
        id v55 = a2;
        sub_100020068();
        sub_10001FB48();
        uint64_t v56 = sub_1000200D8();
        id v58 = (char *)sub_100011924(a3, a4, a5, a6, (uint64_t)v55, v56, v57);

        uint64_t v59 = &v58[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
        unint64_t v60 = 0xE000000000000000;
        *(void *)uint64_t v59 = 0;
        *((void *)v59 + 1) = 0xE000000000000000;
        unint64_t v37 = v58;
        swift_bridgeObjectRelease();
        double v61 = &v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
        *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent] = 0;
LABEL_58:
        *((void *)v61 + 1) = v60;
        swift_bridgeObjectRelease();
        uint64_t v125 = *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData];
        unint64_t v126 = *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData + 8];
        *(_OWORD *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData] = xmmword_1000211D0;
        sub_1000124F4(v125, v126);
        v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton] = 0;
        goto LABEL_4;
      }
      v127[0] = a2;
      v127[1] = v19;
      NSDictionary v133 = _swiftEmptyArrayStorage;
      sub_10001B044(0, v44, 0);
      id v62 = self;
      double v63 = 0;
      unint64_t v128 = v43 & 0xC000000000000001;
      id v129 = v62;
      double v64 = (void (**)(char *, uint64_t))(v14 + 8);
      for (i = (void *)v44; i != v63; uint64_t v78 = (uint64_t)i)
      {
        if (v128) {
          id v65 = (id)sub_1000203A8();
        }
        else {
          id v65 = *(id *)(v131 + 8 * (void)v63 + 32);
        }
        id v66 = v65;
        sub_10001FAB8();
        id v67 = [v66 givenName];
        sub_1000200B8();

        sub_10001FA88();
        id v68 = [v66 familyName];
        sub_1000200B8();

        sub_10001FA98();
        Class v69 = sub_10001FAA8();
        (*v64)(v16, v13);
        id v70 = [v129 localizedStringFromPersonNameComponents:v69 style:0 options:0];

        uint64_t v71 = sub_1000200B8();
        uint64_t v73 = v72;

        uint64_t v74 = v133;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10001B044(0, v74[2] + 1, 1);
          uint64_t v74 = v133;
        }
        unint64_t v76 = v74[2];
        unint64_t v75 = v74[3];
        if (v76 >= v75 >> 1)
        {
          sub_10001B044(v75 > 1, v76 + 1, 1);
          uint64_t v74 = v133;
        }
        double v63 = (void *)((char *)v63 + 1);
        v74[2] = v76 + 1;
        uint64_t v77 = &v74[2 * v76];
        v77[4] = v71;
        v77[5] = v73;
      }
      NSDictionary v133 = v74;
      swift_bridgeObjectRetain();
      sub_10001B1D0((uint64_t *)&v133);
      swift_bridgeObjectRelease();
      uint64_t v79 = v133;
      if (v78 >= 10)
      {
        sub_100020068();
        sub_10001FB48();
        unint64_t v81 = (void *)sub_1000200D8();
        uint64_t v82 = v91;
        swift_bridgeObjectRelease();
        if (v79[2])
        {
          uint64_t v93 = v79[4];
          unint64_t v92 = v79[5];
          swift_bridgeObjectRetain();
          swift_release();
        }
        else
        {
          swift_retain();
          id v104 = sub_10001FBD8();
          os_log_type_t v105 = sub_1000202A8();
          if (os_log_type_enabled(v104, v105))
          {
            unint64_t v106 = (uint8_t *)swift_slowAlloc();
            uint64_t v107 = swift_slowAlloc();
            uint64_t v134 = 0;
            v135[0] = v107;
            *(_DWORD *)unint64_t v106 = 136315138;
            NSDictionary v133 = 0;
            sub_100004B44(&qword_10002E648);
            uint64_t v108 = sub_1000200E8();
            unint64_t v131 = v82;
            NSDictionary v133 = (void *)sub_10001A630(v108, v109, v135);
            sub_100020338();
            swift_release_n();
            uint64_t v82 = v131;
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v104, v105, "#ContactsButton many matches, first one is nil? %s", v106, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_release_n();
          }

          uint64_t v93 = 0;
          unint64_t v92 = 0xE000000000000000;
        }
        sub_100020068();
        sub_10001FB48();
        sub_1000200D8();
        sub_100004B44(&qword_10002E4F8);
        uint64_t v118 = swift_allocObject();
        *(_OWORD *)(v118 + 16) = xmmword_1000211C0;
        *(void *)(v118 + 56) = &type metadata for String;
        *(void *)(v118 + 64) = sub_1000136E8();
        *(void *)(v118 + 32) = v93;
        *(void *)(v118 + 40) = v92;
      }
      else
      {
        v135[0] = v78;
        NSDictionary v133 = (void *)sub_100020498();
        uint64_t v134 = v80;
        v137._countAndFlagsBits = 0x7365686374616D20;
        v137._object = (void *)0xE800000000000000;
        sub_100020138(v137);
        unint64_t v81 = v133;
        uint64_t v82 = v134;
        swift_bridgeObjectRelease();
        uint64_t v83 = v79[2];
        if (v78 != 2)
        {
          if (!v83)
          {
LABEL_63:
            __break(1u);
            goto LABEL_64;
          }
          int64_t i = v81;
          unint64_t v131 = v82;
          if (v83 == 1)
          {
LABEL_64:
            __break(1u);
LABEL_65:
            __break(1u);
            double result = (char *)swift_release();
            __break(1u);
            return result;
          }
          uint64_t v95 = v79[4];
          uint64_t v94 = v79[5];
          uint64_t v96 = v79[7];
          id v129 = (id)v79[6];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_release();
          sub_100020068();
          sub_10001FB48();
          sub_1000200D8();
          sub_100004B44(&qword_10002E4F8);
          uint64_t v97 = swift_allocObject();
          *(_OWORD *)(v97 + 16) = xmmword_1000211B0;
          *(void *)(v97 + 56) = &type metadata for String;
          unint64_t v98 = sub_1000136E8();
          *(void *)(v97 + 32) = v95;
          *(void *)(v97 + 40) = v94;
          *(void *)(v97 + 96) = &type metadata for String;
          *(void *)(v97 + 104) = v98;
          id v99 = v129;
          *(void *)(v97 + 64) = v98;
          *(void *)(v97 + 72) = v99;
          *(void *)(v97 + 80) = v96;
          NSDictionary v133 = (void *)(v83 - 2);
          uint64_t v100 = sub_100020498();
          *(void *)(v97 + 136) = &type metadata for String;
          *(void *)(v97 + 144) = v98;
          *(void *)(v97 + 112) = v100;
          *(void *)(v97 + 120) = v101;
          uint64_t v102 = sub_1000200C8();
          unint64_t v60 = v103;
          swift_bridgeObjectRelease();
          unint64_t v81 = i;
          uint64_t v82 = v131;
          goto LABEL_57;
        }
        if (!v83)
        {
          swift_retain_n();
          uint64_t v110 = sub_10001FBD8();
          uint64_t v111 = sub_1000202A8();
          if (os_log_type_enabled(v110, (os_log_type_t)v111))
          {
            uint64_t v112 = swift_slowAlloc();
            uint64_t v113 = swift_slowAlloc();
            uint64_t v134 = 0;
            v135[0] = v113;
            *(_DWORD *)uint64_t v112 = 136315394;
            NSDictionary v133 = 0;
            sub_100004B44(&qword_10002E648);
            int64_t i = v81;
            uint64_t v114 = sub_1000200E8();
            NSDictionary v133 = (void *)sub_10001A630(v114, v115, v135);
            sub_100020338();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v112 + 12) = 2080;
            NSDictionary v133 = 0;
            uint64_t v134 = 0;
            uint64_t v116 = sub_1000200E8();
            NSDictionary v133 = (void *)sub_10001A630(v116, v117, v135);
            unint64_t v81 = i;
            sub_100020338();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v110, (os_log_type_t)v111, "#ContactsButton two matches, but one was missing a name? first %s  second %s", (uint8_t *)v112, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_release_n();
            swift_bridgeObjectRelease();
          }

          uint64_t v102 = 0;
          unint64_t v60 = 0xE000000000000000;
          goto LABEL_57;
        }
        unint64_t v131 = v82;
        uint64_t v84 = v79[4];
        uint64_t v85 = v79[5];
        uint64_t v86 = (uint64_t)&v79[2 * v83 + 4];
        uint64_t v87 = *(void *)(v86 - 8);
        int64_t i = *(void **)(v86 - 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        sub_100020068();
        sub_10001FB48();
        sub_1000200D8();
        sub_100004B44(&qword_10002E4F8);
        uint64_t v88 = swift_allocObject();
        *(_OWORD *)(v88 + 16) = xmmword_100021490;
        *(void *)(v88 + 56) = &type metadata for String;
        unint64_t v89 = sub_1000136E8();
        *(void *)(v88 + 32) = v84;
        *(void *)(v88 + 40) = v85;
        NSString v90 = i;
        uint64_t v82 = v131;
        *(void *)(v88 + 96) = &type metadata for String;
        *(void *)(v88 + 104) = v89;
        *(void *)(v88 + 64) = v89;
        *(void *)(v88 + 72) = v90;
        *(void *)(v88 + 80) = v87;
      }
      uint64_t v102 = sub_1000200C8();
      unint64_t v60 = v119;
      swift_bridgeObjectRelease();
LABEL_57:
      id v120 = v127[0];
      sub_100020068();
      sub_10001FB48();
      uint64_t v121 = sub_1000200D8();
      uint64_t v123 = (char *)sub_100011924(a3, a4, a5, a6, (uint64_t)v120, v121, v122);

      unint64_t v124 = &v123[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
      *(void *)unint64_t v124 = v81;
      *((void *)v124 + 1) = v82;
      unint64_t v37 = v123;
      swift_bridgeObjectRelease();
      double v61 = &v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
      *(void *)&v37[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent] = v102;
      goto LABEL_58;
    }
    swift_bridgeObjectRetain();
    int64_t v44 = sub_100020428();
    if (v44 != 1) {
      goto LABEL_29;
    }
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_100020428();
    swift_bridgeObjectRelease();
    if (v51) {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_10001FBD8();
    os_log_type_t v53 = sub_1000202A8();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "#ContactsButton we have exactly one match, but unexpectedly the only item is nil", v54, 2u);
      swift_slowDealloc();
    }
  }
LABEL_21:

  return sub_10001C4B0(a2, a3, a4, a5, a6);
}

uint64_t sub_100019AF4(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v5 = sub_10001A0DC(a1, a2, 0);
  id v6 = [v5 localizedName];
  uint64_t v7 = sub_1000200B8();

  return v7;
}

id sub_100019DCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactsButtonServiceProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100019F94()
{
  return type metadata accessor for ContactsButtonServiceProvider();
}

uint64_t type metadata accessor for ContactsButtonServiceProvider()
{
  uint64_t result = qword_10002E628;
  if (!qword_10002E628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019FE8()
{
  uint64_t result = sub_10001FBF8();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

id sub_10001A0DC(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_100020088();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_10001FAD8();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_10001A1B8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1000204E8();
    swift_bridgeObjectRetain();
    sub_100020108();
    Swift::Int v18 = sub_1000204F8();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    id v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_1000204A8() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_1000204A8() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_10001A45C(uint64_t a1, int *a2)
{
  unint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001A538;
  return v6(a1);
}

uint64_t sub_10001A538()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001A630(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001A704(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006820((uint64_t)v12, *a3);
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
      sub_100006820((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001AC88((uint64_t)v12);
  return v7;
}

uint64_t sub_10001A704(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100020348();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001A8C0(a5, a6);
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
  uint64_t v8 = sub_1000203B8();
  if (!v8)
  {
    sub_100020418();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100020468();
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

uint64_t sub_10001A8C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001A958(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001AB38(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001AB38(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001A958(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001AAD0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100020398();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100020418();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100020158();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100020468();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100020418();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001AAD0(uint64_t a1, uint64_t a2)
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
  sub_100004B44(&qword_10002E640);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001AB38(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004B44(&qword_10002E640);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100020468();
  __break(1u);
  return result;
}

uint64_t sub_10001AC88(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001ACD8(uint64_t a1, uint64_t a2)
{
  sub_1000204E8();
  sub_100020108();
  Swift::Int v4 = sub_1000204F8();

  return sub_10001AE04(a1, a2, v4);
}

unint64_t sub_10001AD50(uint64_t a1)
{
  sub_1000204E8();
  type metadata accessor for CFString(0);
  sub_1000136A0((unint64_t *)&unk_10002E710, type metadata accessor for CFString);
  sub_10001FBB8();
  Swift::Int v2 = sub_1000204F8();

  return sub_10001AEE8(a1, v2);
}

unint64_t sub_10001AE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000204A8() & 1) == 0)
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
      while (!v14 && (sub_1000204A8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001AEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_1000136A0((unint64_t *)&unk_10002E710, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_10001FBA8();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_10001FBA8();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_10001B044(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001B064(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001B064(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004B44(&qword_10002E090);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100020468();
  __break(1u);
  return result;
}

Swift::Int sub_10001B1D0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001BE60(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10001B23C(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_10001B23C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_100020488(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_10001B928(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      int64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      uint64_t v94 = v11;
      id v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_10001B9F8((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_10001BE4C((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    id v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_1000201C8();
    *(void *)(v7 + 16) = v6;
    id v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  int64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    BOOL v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_1000204A8();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      BOOL v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_1000204A8()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_10001BC94(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      int64_t v11 = sub_10001BC94((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v42 = v11 + 32;
    unint64_t v43 = &v11[16 * v41 + 32];
    *(void *)unint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          unsigned int v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        id v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        id v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        unint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        NSString v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_10001B9F8((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        int64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        unint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_1000204A8() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = sub_100020418();
  __break(1u);
  return result;
}

uint64_t sub_10001B928(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_1000204A8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B9F8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        Swift::Int v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_1000204A8() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)Swift::Int v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)Swift::Int v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    BOOL v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_1000204A8() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_10001BD90((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_100020468();
  __break(1u);
  return result;
}

char *sub_10001BC94(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004B44((uint64_t *)&unk_10002E650);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  BOOL v14 = a4 + 32;
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

char *sub_10001BD90(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_100020468();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_10001BE4C(uint64_t a1)
{
  return sub_10001BC94(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10001BE60(uint64_t a1)
{
  return sub_10001B064(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_10001BE74(void *a1, void *a2, char *a3, void (**a4)(void, void, void))
{
  id v59 = a1;
  uint64_t v7 = sub_100020008();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v57 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100020028();
  uint64_t v58 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a4;
  BOOL v14 = *(void **)&a3[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTag];
  if (v14
    && (BOOL v15 = *(void **)&a3[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle]) != 0)
  {
    uint64_t v53 = v12;
    uint64_t v54 = v10;
    uint64_t v55 = v8;
    uint64_t v56 = v7;
    id v16 = a2;
    id v17 = v59;
    id v18 = v59;
    id v19 = v16;
    id v20 = v18;
    _Block_copy(a4);
    id v21 = v14;
    id v52 = v15;
    uint64_t v22 = sub_10001FBD8();
    os_log_type_t v23 = sub_1000202B8();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v51 = v13;
    if (v24)
    {
      os_log_t v48 = v22;
      id v49 = v21;
      id v50 = v20;
      id v46 = v19;
      uint64_t v25 = swift_slowAlloc();
      uint64_t v47 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412546;
      if (v17)
      {
        id v26 = v50;
        aBlock[0] = v50;
        id v27 = v50;
        id v17 = v59;
        sub_100020338();
      }
      else
      {
        aBlock[0] = 0;
        sub_100020338();
        id v26 = v50;
      }
      uint64_t v29 = v47;
      *uint64_t v47 = v17;

      *(_WORD *)(v25 + 12) = 2112;
      if (a2)
      {
        id v28 = v46;
        aBlock[0] = v46;
        id v30 = v46;
        sub_100020338();
      }
      else
      {
        aBlock[0] = 0;
        sub_100020338();
        id v28 = v46;
      }
      v29[1] = a2;

      os_log_t v31 = v48;
      _os_log_impl((void *)&_mh_execute_header, v48, v23, "#ContactsButton provider proposed width: %@ height: %@", (uint8_t *)v25, 0x16u);
      sub_100004B44(&qword_10002DCA8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v21 = v49;
      id v20 = v50;
    }
    else
    {

      id v28 = v19;
    }
    Swift::Int v32 = dispatch_group_create();
    dispatch_group_enter(v32);
    sub_100009C7C(0, (unint64_t *)&qword_10002E2E8);
    id v50 = (id)sub_1000202E8();
    uint64_t v33 = (void *)swift_allocObject();
    uint64_t v34 = v51;
    uint64_t v35 = v52;
    v33[2] = v21;
    v33[3] = v35;
    v33[4] = v59;
    v33[5] = a3;
    v33[6] = a2;
    v33[7] = sub_10001F6E8;
    v33[8] = v34;
    v33[9] = v32;
    aBlock[4] = sub_10001F768;
    aBlock[5] = v33;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100014710;
    aBlock[3] = &unk_1000298E0;
    uint64_t v36 = _Block_copy(aBlock);
    id v37 = v20;
    id v38 = v28;
    id v59 = v21;
    id v39 = v35;
    unint64_t v40 = a3;
    swift_retain();
    unint64_t v41 = v32;
    swift_release();
    unint64_t v42 = v53;
    sub_100020018();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000136A0(&qword_10002E2F0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004B44(&qword_10002E2F8);
    sub_10001F77C();
    uint64_t v44 = v56;
    unint64_t v43 = v57;
    sub_100020368();
    id v45 = v50;
    sub_1000202F8();
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v55 + 8))(v43, v44);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v54);
    sub_1000202D8();
    swift_release();
  }
  else
  {
    _Block_copy(a4);
    a4[2](a4, 0, 0);
    swift_release();
  }
}

char *sub_10001C4B0(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = sub_10001FB88();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = sub_100020078();
  __chkstk_darwin(v11 - 8);
  sub_100020068();
  sub_10001FB48();
  uint64_t v12 = sub_1000200D8();
  uint64_t v14 = v13;
  sub_100020068();
  sub_10001FB48();
  uint64_t v15 = sub_1000200D8();
  uint64_t v17 = v16;
  id v18 = a1;
  sub_100020068();
  sub_10001FB48();
  uint64_t v19 = sub_1000200D8();
  id v21 = (char *)sub_100011924(a2, a3, a4, a5, (uint64_t)v18, v19, v20);

  uint64_t v22 = (uint64_t *)&v21[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_topTextContent];
  *uint64_t v22 = v12;
  v22[1] = v14;
  os_log_type_t v23 = v21;
  swift_bridgeObjectRelease();
  BOOL v24 = (uint64_t *)&v23[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_bottomTextContent];
  *BOOL v24 = v15;
  v24[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)&v23[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData];
  unint64_t v26 = *(void *)&v23[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData + 8];
  *(_OWORD *)&v23[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_avatarImageData] = xmmword_1000211D0;
  sub_1000124F4(v25, v26);
  v23[OBJC_IVAR____TtC24ContactsButtonXPCService21ContactsButtonSlotTag_showingOnboardingButton] = 0;

  return v23;
}

uint64_t sub_10001C748()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 60 != 15) {
    sub_10000676C(*(void *)(v0 + 16), v1);
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001C790()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001C7D0(UIImage *a1)
{
  sub_100018930(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10001C7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001C7E8()
{
  return swift_release();
}

uint64_t sub_10001C7F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100013648(a1, a2);
  }
  return a1;
}

_OWORD *sub_10001C804(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_10001C814(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ClassDescriptor **a16)
{
  uint64_t v126 = a6;
  uint64_t v127 = a5;
  uint64_t v119 = a2;
  uint64_t v125 = a1;
  uint64_t v22 = a16;
  uint64_t v23 = sub_10001FA78();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  unint64_t v26 = (char *)&v116 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009C7C(0, &qword_10002E6B8);
  sub_100004B44(&qword_10002E6C0);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_1000210C0;
  uint64_t v128 = sub_10001FA58();
  *(void *)(v27 + 32) = v128;
  *(void *)(v27 + 40) = sub_100009C7C(0, &qword_10002E6C8);
  *(void *)(v27 + 48) = sub_100009C7C(0, &qword_10002E6D0);
  *(void *)(v27 + 56) = sub_100009C7C(0, &qword_10002E6D8);
  *(void *)(v27 + 64) = sub_100009C7C(0, &qword_10002E6E0);
  sub_1000202C8();
  id v120 = v26;
  uint64_t v121 = v24;
  uint64_t v122 = v23;
  uint64_t v130 = a3;
  swift_bridgeObjectRelease();
  if (!v133) {
    goto LABEL_49;
  }
  sub_10001C804(&v132, &v134);
  swift_dynamicCast();
  uint64_t v28 = a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_logger;
  id v29 = v131;
  swift_bridgeObjectRetain_n();
  id v30 = v29;
  uint64_t v118 = v28;
  os_log_t v31 = sub_10001FBD8();
  os_log_type_t v32 = sub_1000202B8();
  BOOL v33 = os_log_type_enabled(v31, v32);
  unint64_t v124 = a16;
  id v129 = v30;
  if (v33)
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v117 = swift_slowAlloc();
    *(void *)&long long v134 = v117;
    *(_DWORD *)uint64_t v34 = 136315394;
    id v35 = [v30 debugDescription];
    uint64_t v36 = sub_1000200B8();
    uint64_t v116 = (char *)&type metadata for Any + 8;
    uint64_t v37 = v36;
    unint64_t v39 = v38;

    *(void *)&long long v132 = sub_10001A630(v37, v39, (uint64_t *)&v134);
    sub_100020338();

    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    uint64_t v22 = (ClassDescriptor **)(v34 + 14);
    swift_bridgeObjectRetain();
    *(void *)&long long v132 = sub_10001A630(v130, a4, (uint64_t *)&v134);
    sub_100020338();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "#ContactsButton received traits %s with query %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  unint64_t v40 = (uint64_t *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID);
  if (*(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID + 8))
  {
LABEL_15:
    unint64_t v59 = a4;
    uint64_t v60 = (void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedQueryString);
    uint64_t v22 = &off_10002E000;
    uint64_t v61 = *(void *)(a15
                    + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedQueryString
                    + 8);
    unint64_t v123 = v59;
    if (!v61 || (*v60 != v130 || v61 != v59) && (sub_1000204A8() & 1) == 0) {
      goto LABEL_30;
    }
    if (!*(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredEmails)) {
      goto LABEL_30;
    }
    uint64_t v62 = v127;
    swift_bridgeObjectRetain();
    uint64_t v63 = swift_bridgeObjectRetain();
    char v64 = sub_10001A1B8(v63, v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v64 & 1) == 0) {
      goto LABEL_30;
    }
    if (!*(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredPhones)) {
      goto LABEL_30;
    }
    uint64_t v65 = v126;
    swift_bridgeObjectRetain();
    uint64_t v66 = swift_bridgeObjectRetain();
    char v67 = sub_10001A1B8(v66, v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0) {
      goto LABEL_30;
    }
    id v68 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTraits);
    if (!v68) {
      goto LABEL_30;
    }
    id v69 = v129;
    id v70 = v68;
    char v71 = sub_100020328();

    if ((v71 & 1) == 0) {
      goto LABEL_30;
    }
    if ((*(unsigned char *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedFrame + 32) & 1) == 0
      && (v135.origin.x = a7,
          v135.origin.y = a8,
          v135.size.width = a9,
          v135.size.height = a10,
          CGRectEqualToRect(*(CGRect *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedFrame), v135)))
    {
      BOOL v72 = sub_10001FBD8();
      os_log_type_t v73 = sub_100020278();
      if (os_log_type_enabled(v72, v73))
      {
        uint64_t v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v74 = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, v73, "#ContactsButton nothing changed, returning same tag", v74, 2u);
        swift_slowDealloc();
      }
      id v75 = v129;
      uint64_t v76 = &off_10002E000;
    }
    else
    {
LABEL_30:
      uint64_t v77 = v130;
      *uint64_t v60 = v130;
      v60[1] = v59;
      unint64_t v78 = v59;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v79 = v127;
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredEmails) = v127;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v80 = v126;
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedIgnoredPhones) = v126;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v81 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTraits);
      id v82 = v129;
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTraits) = v129;
      id v83 = v82;

      uint64_t v84 = a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedFrame;
      *(double *)uint64_t v84 = a7;
      *(double *)(v84 + 8) = a8;
      *(double *)(v84 + 16) = a9;
      *(double *)(v84 + 24) = a10;
      *(unsigned char *)(v84 + 32) = 0;
      uint64_t v22 = (ClassDescriptor **)OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag;
      uint64_t v85 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag);
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag) = 0;

      uint64_t v86 = v40[1];
      if (!v86)
      {
LABEL_50:
        _Block_release(v124);
        __break(1u);
        goto LABEL_51;
      }
      uint64_t v87 = *v40;
      swift_bridgeObjectRetain();
      uint64_t v88 = sub_100009858(v77, v78, v87, v86, v79, v80);
      swift_bridgeObjectRelease();
      uint64_t v76 = &off_10002E000;
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_matches) = v88;
      swift_bridgeObjectRelease();
      unint64_t v89 = swift_bridgeObjectRetain();
      NSString v90 = sub_1000189C4(v89, v83, a7, a8, a9, a10);
      swift_bridgeObjectRelease();
      uint64_t v91 = *(ClassDescriptor **)((char *)v22 + a15);
      *(ClassDescriptor **)((char *)v22 + a15) = (ClassDescriptor *)v90;

      uint64_t v92 = *(ClassDescriptor **)((char *)v22 + a15);
      unint64_t v93 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTag);
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedTag) = v92;
      id v94 = v92;

      BOOL v72 = *(NSObject **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle);
      uint64_t v95 = v125;
      *(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedStyle) = v125;
      id v96 = v95;
      id v75 = v129;
    }

    if (!*(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString + 8))
    {
      sub_100004B44(&qword_10002E668);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1000211C0;
      *(void *)(inited + 32) = sub_10001F9C8();
      *(void *)(inited + 40) = v105;
      *(void *)(inited + 48) = 0xD00000000000002FLL;
      *(void *)(inited + 56) = 0x8000000100024780;
      unint64_t v106 = sub_100014310(inited);
      sub_10001F9B8();
      uint64_t v107 = v121;
      uint64_t v108 = v120;
      uint64_t v109 = v122;
      (*(void (**)(char *, void, uint64_t))(v121 + 104))(v120, enum case for ContactButtonServiceErrorType.missingPurposeString(_:), v122);
      uint64_t v110 = sub_10001FA68();
      (*(void (**)(char *, uint64_t))(v107 + 8))(v108, v109);
      sub_100015434(v106);
      swift_bridgeObjectRelease();
      id v111 = objc_allocWithZone((Class)NSError);
      NSString v112 = sub_100020088();
      swift_bridgeObjectRelease();
      Class isa = sub_100020038().super.isa;
      swift_bridgeObjectRelease();
      id v114 = [v111 initWithDomain:v112 code:v110 userInfo:isa];

      ((void (*)(ClassDescriptor **, void, id))v124[2])(v124, 0, v114);
      id v98 = v75;
      id v75 = v114;
LABEL_46:

      return;
    }
    if (!*(void *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_imagedTag)
      || (uint64_t v97 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotMachine)) == 0)
    {
      sub_10001FB98();
      id v98 = 0;
      uint64_t v100 = v124;
LABEL_40:
      unint64_t v102 = *(void *)((char *)&v76[248]->Flags + a15);
      if (v102)
      {
        if (v102 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v103 = sub_100020428();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v103 = *(void *)((v102 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
      }
      else
      {
        uint64_t v103 = 0;
      }
      uint64_t v115 = sub_100020118();
      sub_10000B610(v103, v115);
      ((void (*)(ClassDescriptor **, id, void))v100[2])(v100, v98, 0);
      goto LABEL_46;
    }
    if ((v119 & 0x8000000000000000) == 0)
    {
      id v98 = objc_msgSend(v97, "remoteContentForLayerContextWithId:style:tag:");
      uint64_t v99 = sub_10001FB98();
      uint64_t v100 = v124;
      if (v98 && [v98 respondsToSelector:v99])
      {
        unsigned int v101 = [v98 slotID];
        *(_DWORD *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_slotID) = v101;
      }
      goto LABEL_40;
    }
    __break(1u);
LABEL_49:
    _Block_release(v22);
    __break(1u);
    goto LABEL_50;
  }
  sub_1000200F8();
  sandbox_extension_consume();
  swift_release();
  unint64_t v41 = *(void **)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext);
  if (v41)
  {
    id v42 = [v41 clientBundleIdentifier];
    if (v42)
    {
      unint64_t v43 = v42;
      uint64_t v44 = sub_1000200B8();
      uint64_t v46 = v45;
    }
    else
    {
      uint64_t v44 = 0;
      uint64_t v46 = 0;
    }
    *unint64_t v40 = v44;
    v40[1] = v46;
    swift_bridgeObjectRelease();
    unint64_t v47 = v40[1];
    if (!v47) {
      goto LABEL_52;
    }
    uint64_t v48 = *v40;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_1000052F0(v48, v47, 0xD00000000000001ALL, 0x8000000100024910);
    uint64_t v51 = v50;
    swift_bridgeObjectRelease();
    if (v51)
    {
      id v52 = (uint64_t *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString);
      *id v52 = v49;
      v52[1] = v51;
      swift_bridgeObjectRelease();
    }
    [self setDefaultBackgroundGPUPriority:2];
    uint64_t v53 = v40[1];
    if (!v53) {
      goto LABEL_53;
    }
    uint64_t v54 = *v40;
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_100019AF4(v54, v53);
    uint64_t v57 = v56;
    swift_bridgeObjectRelease();
    uint64_t v58 = (uint64_t *)(a15 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_cachedAppName);
    *uint64_t v58 = v55;
    v58[1] = v57;
    swift_bridgeObjectRelease();
    sandbox_extension_release();
    goto LABEL_15;
  }
LABEL_51:
  _Block_release(v124);
  __break(1u);
LABEL_52:
  _Block_release(v124);
  __break(1u);
LABEL_53:
  _Block_release(v124);
  __break(1u);
  _Block_release(v22);
  swift_bridgeObjectRelease();
  swift_unexpectedError();
  __break(1u);
}

void sub_10001D4B4()
{
  uint64_t v1 = sub_10001FB88();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100020078();
  __chkstk_darwin(v2 - 8);
  NSString v59 = sub_100020088();
  NSString v60 = sub_100020088();
  sub_100020068();
  sub_10001FB48();
  sub_1000200D8();
  sub_100004B44(&qword_10002E4F8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1000211C0;
  uint64_t v4 = *(void *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID + 8];
  if (!v4)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v5 = (void *)v3;
  uint64_t v58 = &v0[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID];
  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID];
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100019AF4(v6, v4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  v5[7] = &type metadata for String;
  v5[8] = sub_1000136E8();
  v5[4] = v7;
  v5[5] = v9;
  uint64_t v10 = sub_1000200C8();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  sub_100020068();
  sub_10001FB48();
  uint64_t v13 = sub_1000200D8();
  uint64_t v61 = v14;
  uint64_t v62 = v13;
  sub_100020068();
  sub_10001FB48();
  uint64_t v16 = sub_1000200D8();
  uint64_t v63 = v0;
  uint64_t v17 = *(void *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString + 8];
  if (!v17)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v18 = v15;
  CFOptionFlags v65 = *(void *)&v0[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString];
  uint64_t v66 = v17;
  swift_bridgeObjectRetain();
  v67._countAndFlagsBits = 2570;
  v67._object = (void *)0xE200000000000000;
  sub_100020138(v67);
  sub_100020068();
  sub_10001FB48();
  v68._countAndFlagsBits = sub_1000200D8();
  sub_100020138(v68);
  swift_bridgeObjectRelease();
  CFOptionFlags v19 = v65;
  uint64_t v20 = v66;
  sub_100004B44(&qword_10002E6A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000214A0;
  if (!kCFUserNotificationAlertHeaderKey)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  *(void *)(inited + 32) = sub_1000200B8();
  *(void *)(inited + 40) = v22;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v10;
  *(void *)(inited + 56) = v12;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  *(void *)(inited + 80) = sub_1000200B8();
  *(void *)(inited + 88) = v23;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 96) = v19;
  *(void *)(inited + 104) = v20;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  *(void *)(inited + 128) = sub_1000200B8();
  *(void *)(inited + 136) = v24;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = v62;
  *(void *)(inited + 152) = v61;
  if (!kCFUserNotificationAlternateButtonTitleKey) {
    goto LABEL_43;
  }
  *(void *)(inited + 176) = sub_1000200B8();
  *(void *)(inited + 184) = v25;
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 192) = v16;
  *(void *)(inited + 200) = v18;
  sub_100014434(inited);
  v26.super.Class isa = sub_100020038().super.isa;
  swift_bridgeObjectRelease();
  SInt32 v64 = 0;
  uint64_t v27 = CFUserNotificationCreate(0, 0.0, 0x20uLL, &v64, v26.super.isa);
  if (!v27)
  {
    unint64_t v40 = sub_10001FBD8();
    os_log_type_t v41 = sub_1000202A8();
    if (os_log_type_enabled(v40, v41))
    {
      id v42 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v42 = 67109120;
      swift_beginAccess();
      sub_100020338();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "#ContactsButton failed to create a CFUN, %d", v42, 8u);
      swift_slowDealloc();
    }

    goto LABEL_37;
  }
  uint64_t v28 = v27;
  CFOptionFlags v65 = 0;
  CFUserNotificationReceiveResponse(v27, 0.0, &v65);
  CFOptionFlags v29 = v65 & 3;
  id v30 = sub_10001FBD8();
  os_log_type_t v31 = sub_1000202B8();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v32 = 134217984;
    sub_100020338();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "#ContactsButton response was %lu", v32, 0xCu);
    swift_slowDealloc();
  }

  if (v29 == 3)
  {
    uint64_t v36 = sub_10001FBD8();
    os_log_type_t v43 = sub_1000202B8();
    if (os_log_type_enabled(v36, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      unint64_t v39 = "#ContactsButton user dismissed the onboarding prompt";
      uint64_t v45 = v36;
      os_log_type_t v46 = v43;
      unint64_t v47 = v44;
      uint32_t v48 = 2;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v45, v46, v39, v47, v48);
      swift_slowDealloc();
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v29 != 1)
  {
    if (v29)
    {
      uint64_t v36 = sub_10001FBD8();
      os_log_type_t v37 = sub_1000202B8();
      if (os_log_type_enabled(v36, v37))
      {
        unint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v38 = 134217984;
        sub_100020338();
        unint64_t v39 = "#ContactsButton unhandled onboarding response: %lu";
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v33 = *(void **)&v63[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext];
      if (v33)
      {
        if (!*((void *)v58 + 1))
        {
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        id v34 = v33;
        swift_bridgeObjectRetain();
        NSString v35 = sub_100020088();
        swift_bridgeObjectRelease();
        [v34 setAuthorizationStatus:2 forBundleIdentifier:v35 noKillApp:1];
      }
      uint64_t v36 = sub_10001FBD8();
      os_log_type_t v37 = sub_1000202B8();
      if (os_log_type_enabled(v36, v37))
      {
        unint64_t v38 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v38 = 134217984;
        sub_100020338();
        unint64_t v39 = "#ContactsButton user allowed limited access, updated access to be %ld";
LABEL_30:
        uint64_t v45 = v36;
        os_log_type_t v46 = v37;
        unint64_t v47 = v38;
        uint32_t v48 = 12;
        goto LABEL_31;
      }
    }
    goto LABEL_32;
  }
  uint64_t v49 = *(void **)&v63[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext];
  if (!v49)
  {
LABEL_26:
    uint64_t v36 = sub_10001FBD8();
    os_log_type_t v37 = sub_1000202B8();
    if (os_log_type_enabled(v36, v37))
    {
      unint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v38 = 134217984;
      sub_100020338();
      unint64_t v39 = "#ContactsButton user declined limited access, updated access to be %ld";
      goto LABEL_30;
    }
LABEL_32:

    uint64_t v52 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext;
    [*(id *)&v63[OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext] resetCachedStatus];
    uint64_t v53 = v63;
    uint64_t v54 = sub_10001FBD8();
    os_log_type_t v55 = sub_1000202B8();
    if (!os_log_type_enabled(v54, v55))
    {

      goto LABEL_36;
    }
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 134217984;
    uint64_t v57 = *(void **)&v63[v52];
    if (v57)
    {
      [v57 authorizationStatus];
      sub_100020338();

      _os_log_impl((void *)&_mh_execute_header, v54, v55, "#ContactsButton new context auth state is refreshed to  %ld", v56, 0xCu);
      swift_slowDealloc();
LABEL_36:

LABEL_37:
      return;
    }

    __break(1u);
    goto LABEL_45;
  }
  if (*((void *)v58 + 1))
  {
    id v50 = v49;
    swift_bridgeObjectRetain();
    NSString v51 = sub_100020088();
    swift_bridgeObjectRelease();
    [v50 setAuthorizationStatus:1 forBundleIdentifier:v51 noKillApp:1];

    goto LABEL_26;
  }
LABEL_46:
  __break(1u);
}

void sub_10001DE8C(void *a1, unint64_t a2, void (**a3)(void, void, void, void))
{
  uint64_t v130 = sub_10001FA78();
  unint64_t v6 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v8 = (char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_purposeString + 8))
  {
    sub_100004B44(&qword_10002E668);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000211C0;
    sub_10001FA58();
    *(void *)(inited + 32) = sub_10001F9C8();
    *(void *)(inited + 40) = v22;
    *(void *)(inited + 48) = 0xD00000000000002FLL;
    *(void *)(inited + 56) = 0x8000000100024780;
    unint64_t v23 = sub_100014310(inited);
    sub_10001F9B8();
    uint64_t v24 = v130;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ContactButtonServiceErrorType.missingPurposeString(_:), v130);
    uint64_t v25 = sub_10001FA68();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v24);
    sub_100015434(v23);
    swift_bridgeObjectRelease();
    id v26 = objc_allocWithZone((Class)NSError);
    NSString v27 = sub_100020088();
    swift_bridgeObjectRelease();
    Class isa = sub_100020038().super.isa;
    swift_bridgeObjectRelease();
    Class v29 = (Class)[v26 initWithDomain:v27 code:v25 userInfo:isa];

    goto LABEL_11;
  }
  if (a1)
  {
    uint64_t v9 = (char *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_logger);
    id v10 = a1;
    uint64_t v11 = sub_10001FBD8();
    os_log_type_t v12 = sub_100020278();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "#ContactsButton gonna validate touch", v13, 2u);
      swift_slowDealloc();
    }

    id v131 = sub_100015C4C(v10);
    id v14 = v131;
    if (!v131)
    {
      uint64_t v15 = (char *)OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext;
      uint64_t v16 = *(void **)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_authContext);
      if (!v16)
      {
LABEL_128:
        _Block_release(a3);
        __break(1u);
LABEL_129:
        _Block_release(a3);
        __break(1u);
LABEL_130:
        _Block_release(a3);
        __break(1u);
        goto LABEL_131;
      }
      id v17 = [v16 authorizationStatus];
      uint64_t v18 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_matches;
      unint64_t v19 = *(void *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_matches);
      if (v19)
      {
        if (v19 >> 62)
        {
          uint64_t v118 = OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_matches;
          swift_bridgeObjectRetain();
          uint64_t v18 = v118;
          uint64_t v20 = sub_100020428();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      sub_10000B2AC(v20, (uint64_t)v17);
      BOOL v43 = (_AXFeatureSupportsNonSightedUsage() & 1) != 0
         || _AXSCommandAndControlEnabled()
         || _AXSFullKeyboardAccessEnabled() != 0;
      LODWORD(v131) = v43;
      uint64_t v44 = sub_10001FBD8();
      os_log_type_t v45 = sub_100020278();
      BOOL v46 = os_log_type_enabled(v44, v45);
      unint64_t v129 = v6;
      if (v46)
      {
        unint64_t v47 = (uint8_t *)swift_slowAlloc();
        id v48 = (id)swift_slowAlloc();
        uint64_t v128 = v9;
        uint64_t v127 = v15;
        uint64_t v126 = a3;
        *(_DWORD *)unint64_t v47 = 136315138;
        id v133 = v48;
        if (v131) {
          uint64_t v49 = 28261;
        }
        else {
          uint64_t v49 = 7563620;
        }
        if (v131) {
          unint64_t v6 = 0xE200000000000000;
        }
        else {
          unint64_t v6 = 0xE300000000000000;
        }
        uint64_t v132 = sub_10001A630(v49, v6, (uint64_t *)&v133);
        a3 = v126;
        uint64_t v15 = v127;
        sub_100020338();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "#ContactsButton voice interaction currently %sabled", v47, 0xCu);
        swift_arrayDestroy();
        uint64_t v9 = v128;
        swift_slowDealloc();
        swift_slowDealloc();
      }

      id v50 = *(void **)&v15[a2];
      if (!v50) {
        goto LABEL_129;
      }
      if ([v50 isAccessUnknown]) {
        goto LABEL_39;
      }
      NSString v51 = *(void **)&v15[a2];
      if (!v51)
      {
LABEL_131:
        _Block_release(a3);
        __break(1u);
LABEL_132:
        _Block_release(a3);
        swift_bridgeObjectRelease();
        __break(1u);
        goto LABEL_133;
      }
      if ([v51 isAccessDenied])
      {
LABEL_39:
        uint64_t v52 = sub_10001FBD8();
        os_log_type_t v53 = sub_100020278();
        if (os_log_type_enabled(v52, v53))
        {
          unint64_t v6 = swift_slowAlloc();
          *(_WORD *)unint64_t v6 = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, v53, "#ContactsButton presenting onboarding prompt instead of authorizing single contact", (uint8_t *)v6, 2u);
          swift_slowDealloc();
        }

        uint64_t v54 = *(void *)(a2 + v18);
        if (v54)
        {
          if ((unint64_t)v54 >> 62)
          {
            if (v54 >= 0) {
              unint64_t v6 = v54 & 0xFFFFFFFFFFFFFF8;
            }
            else {
              unint64_t v6 = *(void *)(a2 + v18);
            }
            swift_bridgeObjectRetain();
            uint64_t v117 = sub_100020428();
            swift_bridgeObjectRelease();
            if (v117)
            {
LABEL_45:
              unint64_t v55 = *(void *)(a2 + v18);
              if (v55)
              {
                uint64_t v56 = v18;
                swift_bridgeObjectRetain();
                sub_10001D4B4();
                swift_bridgeObjectRelease();
                uint64_t v57 = sub_10001FBD8();
                os_log_type_t v58 = sub_100020278();
                if (os_log_type_enabled(v57, v58))
                {
                  unint64_t v6 = swift_slowAlloc();
                  *(_WORD *)unint64_t v6 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v57, v58, "#ContactsButton onboarding prompt has completed", (uint8_t *)v6, 2u);
                  swift_slowDealloc();
                }

                NSString v59 = *(void **)&v15[a2];
                if (v59)
                {
                  if ([v59 isAccessDenied])
                  {
                    sub_100004B44(&qword_10002E668);
                    uint64_t v60 = swift_initStackObject();
                    *(_OWORD *)(v60 + 16) = xmmword_1000211C0;
                    sub_10001FA58();
                    *(void *)(v60 + 32) = sub_10001F9C8();
                    *(void *)(v60 + 40) = v61;
                    *(void *)(v60 + 48) = 0xD00000000000001ELL;
                    *(void *)(v60 + 56) = 0x80000001000247B0;
                    unint64_t v62 = sub_100014310(v60);
                    sub_10001F9B8();
                    unint64_t v64 = v129;
                    uint64_t v63 = v130;
                    (*(void (**)(char *, void, uint64_t))(v129 + 104))(v8, enum case for ContactButtonServiceErrorType.accessDenied(_:), v130);
                    uint64_t v65 = sub_10001FA68();
                    (*(void (**)(char *, uint64_t))(v64 + 8))(v8, v63);
                    sub_100015434(v62);
                    swift_bridgeObjectRelease();
                    id v66 = objc_allocWithZone((Class)NSError);
                    NSString v67 = sub_100020088();
                    swift_bridgeObjectRelease();
                    Class v68 = sub_100020038().super.isa;
                    swift_bridgeObjectRelease();
                    id v69 = [v66 initWithDomain:v67 code:v65 userInfo:v68];

                    ((void (**)(void, void, void, id))a3)[2](a3, 0, 0, v69);
                    return;
                  }
                  uint64_t v70 = *(void *)(a2 + v56);
                  if (v70)
                  {
                    if ((unint64_t)v70 >> 62)
                    {
                      if (v70 < 0) {
                        unint64_t v6 = *(void *)(a2 + v56);
                      }
                      else {
                        unint64_t v6 = v70 & 0xFFFFFFFFFFFFFF8;
                      }
                      swift_bridgeObjectRetain_n();
                      uint64_t v71 = sub_100020428();
                      swift_bridgeObjectRelease();
                      if (v71 == 1) {
                        goto LABEL_54;
                      }
                    }
                    else
                    {
                      uint64_t v71 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
                      swift_bridgeObjectRetain();
                      if (v71 == 1)
                      {
LABEL_54:
                        sub_100004B44(&qword_10002E090);
                        uint64_t v15 = (char *)swift_allocObject();
                        *((_OWORD *)v15 + 1) = xmmword_1000211C0;
                        if ((unint64_t)v70 >> 62)
                        {
                          if (v70 < 0) {
                            unint64_t v6 = v70;
                          }
                          else {
                            unint64_t v6 = v70 & 0xFFFFFFFFFFFFFF8;
                          }
                          swift_bridgeObjectRetain();
                          uint64_t v72 = sub_100020428();
                          swift_bridgeObjectRelease();
                        }
                        else
                        {
                          uint64_t v72 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
                        }
                        if (v72)
                        {
                          if ((v70 & 0xC000000000000001) != 0)
                          {
                            id v78 = (id)sub_1000203A8();
                            goto LABEL_70;
                          }
                          if (*(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10))
                          {
                            id v78 = *(id *)(v70 + 32);
LABEL_70:
                            uint64_t v79 = v78;
                            swift_bridgeObjectRelease();
                            id v80 = [v79 identifier];

                            uint64_t v81 = sub_1000200B8();
                            uint64_t v83 = v82;

                            *((void *)v15 + 4) = v81;
                            *((void *)v15 + 5) = v83;
                            Class v84 = sub_100020188().super.isa;
                            ((void (**)(void, Class, void, void))a3)[2](a3, v84, 0, 0);
                            swift_bridgeObjectRelease();

                            return;
                          }
                          __break(1u);
                          goto LABEL_125;
                        }
                        goto LABEL_132;
                      }
                    }
                    swift_bridgeObjectRelease();
                    uint64_t v119 = a3[2];
                    if (v71 >= 2)
                    {
                      id v120 = a3;
                      uint64_t v121 = 1;
LABEL_122:
                      v119(v120, 0, v121, 0);
                      return;
                    }
LABEL_121:
                    id v120 = a3;
                    uint64_t v121 = 0;
                    goto LABEL_122;
                  }
LABEL_120:
                  uint64_t v119 = a3[2];
                  goto LABEL_121;
                }
                goto LABEL_130;
              }
              goto LABEL_127;
            }
          }
          else if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_45;
          }
          *(void *)(a2 + v18) = sub_100007FC8();
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
LABEL_127:
        _Block_release(a3);
        __break(1u);
        goto LABEL_128;
      }
      unint64_t v55 = *(void *)(a2 + v18);
      if (v55)
      {
        if (v55 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v73 = sub_100020428();
          swift_bridgeObjectRelease();
          if (v73 >= 1) {
            goto LABEL_59;
          }
        }
        else
        {
          uint64_t v73 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v73 >= 1)
          {
LABEL_59:
            swift_bridgeObjectRetain();
            uint64_t v128 = v9;
            uint64_t v74 = sub_10001FBD8();
            os_log_type_t v75 = sub_100020278();
            BOOL v76 = os_log_type_enabled(v74, v75);
            uint64_t v127 = v15;
            if (v76)
            {
              uint64_t v15 = (char *)a3;
              uint64_t v77 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v77 = 134217984;
              id v133 = (id)v73;
              sub_100020338();
              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v74, v75, "#ContactsButton number of matches %ld", v77, 0xCu);
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease();
            }

            char v85 = (char)v131;
            if (v73 != 1) {
              char v85 = 1;
            }
            if (v85)
            {
              swift_bridgeObjectRelease();
              uint64_t v15 = (char *)(id)a2;
              uint64_t v86 = sub_10001FBD8();
              os_log_type_t v87 = sub_100020278();
              if (os_log_type_enabled(v86, v87))
              {
                uint64_t v88 = (uint8_t *)swift_slowAlloc();
                *(_DWORD *)uint64_t v88 = 134217984;
                unint64_t v89 = *(void **)&v127[a2];
                if (!v89)
                {
LABEL_134:
                  _Block_release(a3);

                  __break(1u);
                  return;
                }
                id v133 = [v89 authorizationStatus];
                sub_100020338();

                _os_log_impl((void *)&_mh_execute_header, v86, v87, "#ContactsButton will bring up library management UI? authorization right is %ld", v88, 0xCu);
                swift_slowDealloc();
              }
              else
              {
              }
              uint64_t v92 = *(void **)&v127[a2];
              if (v92)
              {
                ((void (**)(void, void, id, void))a3)[2](a3, 0, [v92 isLimitedAccessGranted], 0);
                return;
              }
LABEL_133:
              _Block_release(a3);
              __break(1u);
              goto LABEL_134;
            }
            NSString v90 = (uint64_t *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID);
            a2 = *(void *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID + 8);
            if (a2)
            {
              uint64_t v56 = *v90;
              if (v55 >> 62)
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v91 = sub_100020428();
              }
              else
              {
                uint64_t v91 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
              }
              if (v91)
              {
                unint64_t v6 = v55 & 0xC000000000000001;
                if ((v55 & 0xC000000000000001) != 0)
                {
LABEL_125:
                  id v97 = (id)sub_1000203A8();
                  goto LABEL_92;
                }
                if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  id v97 = *(id *)(v55 + 32);
LABEL_92:
                  id v98 = v97;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRetain();
                  uint64_t v99 = sub_10001FBD8();
                  os_log_type_t v100 = sub_100020278();
                  if (os_log_type_enabled(v99, v100))
                  {
                    uint64_t v126 = a3;
                    unsigned int v101 = (uint8_t *)swift_slowAlloc();
                    unint64_t v102 = (void *)swift_slowAlloc();
                    *(_DWORD *)unsigned int v101 = 138412290;
                    if (v6)
                    {
                      swift_bridgeObjectRetain();
                      id v103 = (id)sub_1000203A8();
                      swift_bridgeObjectRelease();
                    }
                    else
                    {
                      id v103 = *(id *)(v55 + 32);
                    }
                    id v133 = v103;
                    sub_100020338();
                    *unint64_t v102 = v103;
                    swift_bridgeObjectRelease_n();
                    _os_log_impl((void *)&_mh_execute_header, v99, v100, "#ContactsButton will authorize the contact %@", v101, 0xCu);
                    sub_100004B44(&qword_10002DCA8);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();
                    a3 = v126;
                  }
                  else
                  {
                    swift_bridgeObjectRelease_n();
                  }

                  sub_100008398(v98, v56, a2);
                  swift_bridgeObjectRelease();
                  sub_100004B44(&qword_10002E090);
                  uint64_t v112 = swift_allocObject();
                  *(_OWORD *)(v112 + 16) = xmmword_1000211C0;
                  id v113 = [v98 identifier];
                  uint64_t v114 = sub_1000200B8();
                  uint64_t v116 = v115;

                  *(void *)(v112 + 32) = v114;
                  *(void *)(v112 + 40) = v116;
                  Class v29 = sub_100020188().super.isa;
                  ((void (**)(void, Class, void, void))a3)[2](a3, v29, 0, 0);

                  swift_bridgeObjectRelease();
                  goto LABEL_12;
                }
                __break(1u);
                goto LABEL_127;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();
              id v104 = sub_10001FBD8();
              os_log_type_t v105 = sub_1000202A8();
              if (os_log_type_enabled(v104, v105))
              {
                unint64_t v106 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)unint64_t v106 = 0;
                _os_log_impl((void *)&_mh_execute_header, v104, v105, "#ContactsButton: nil contact for single match case?", v106, 2u);
                swift_slowDealloc();
              }

              sub_10001FA58();
              sub_10001F9B8();
              id v96 = (unsigned int *)&enum case for ContactButtonServiceErrorType._invalidContact(_:);
            }
            else
            {
              swift_bridgeObjectRelease();
              unint64_t v93 = sub_10001FBD8();
              uint64_t v94 = sub_1000202A8();
              if (os_log_type_enabled(v93, (os_log_type_t)v94))
              {
                uint64_t v95 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v95 = 0;
                _os_log_impl((void *)&_mh_execute_header, v93, (os_log_type_t)v94, "#ContactsButton: bundleID is nil, can't add single match to limited access", v95, 2u);
                swift_slowDealloc();
              }

              sub_10001FA58();
              sub_10001F9B8();
              id v96 = (unsigned int *)&enum case for ContactButtonServiceErrorType._invalidBundleID(_:);
            }
            unint64_t v108 = v129;
            uint64_t v107 = v130;
            (*(void (**)(char *, void, uint64_t))(v129 + 104))(v8, *v96, v130);
            uint64_t v109 = sub_10001FA68();
            (*(void (**)(char *, uint64_t))(v108 + 8))(v8, v107);
            id v110 = objc_allocWithZone((Class)NSError);
            NSString v111 = sub_100020088();
            swift_bridgeObjectRelease();
            Class v29 = (Class)[v110 initWithDomain:v111 code:v109 userInfo:0];

LABEL_11:
            ((void (**)(void, void, void, Class))a3)[2](a3, 0, 0, v29);
LABEL_12:

            return;
          }
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v122 = sub_10001FBD8();
      os_log_type_t v123 = sub_100020278();
      if (os_log_type_enabled(v122, v123))
      {
        unint64_t v124 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v124 = 0;
        _os_log_impl((void *)&_mh_execute_header, v122, v123, "#ContactsButton no matches, nothing to do on tap", v124, 2u);
        swift_slowDealloc();
      }

      goto LABEL_120;
    }
  }
  else
  {
    id v30 = sub_10001FBD8();
    os_log_type_t v31 = sub_100020298();
    if (os_log_type_enabled(v30, v31))
    {
      os_log_type_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "#ContactsButton touch up event had no authentication message?", v32, 2u);
      swift_slowDealloc();
    }

    id v14 = 0;
  }
  id v131 = v14;
  BOOL v33 = sub_10001FBD8();
  os_log_type_t v34 = sub_100020298();
  if (os_log_type_enabled(v33, v34))
  {
    NSString v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "#ContactsButton we were unable to validate the tap", v35, 2u);
    swift_slowDealloc();
  }

  if (v131)
  {
    uint64_t v36 = sub_10000A39C(v131);
    uint64_t v37 = *(void *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID);
    uint64_t v38 = *(void *)(a2 + OBJC_IVAR____TtC24ContactsButtonXPCService29ContactsButtonServiceProvider_bundleID + 8);
    unint64_t v39 = v36 & 0x101010101010101;
    unint64_t v41 = v40 & 0x1010101010101;
    swift_bridgeObjectRetain();
    sub_10000AB58(v37, v38, v39, v41);
    swift_bridgeObjectRelease();
  }
  ((void (*)(void (**)(void, void, void, void), void, void))a3[2])(a3, 0, 0);
  id v42 = v131;
}

void *sub_10001F178(void *a1, void *a2)
{
  uint64_t v5 = sub_100004B44(&qword_10002E680);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  type metadata accessor for ContactsButtonSlotTag();
  uint64_t v9 = swift_dynamicCastClassUnconditional();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = 0;
  uint64_t v11 = sub_100020228();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_100020208();
  id v12 = a2;
  swift_retain();
  id v13 = a1;
  id v14 = v2;
  uint64_t v15 = sub_1000201F8();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v10;
  v16[5] = v9;
  v16[6] = v13;
  v16[7] = v14;
  v16[8] = v8;
  id v17 = v8;
  sub_10001456C((uint64_t)v7, (uint64_t)&unk_10002E690, (uint64_t)v16);
  swift_release();
  sub_1000202D8();

  uint64_t v18 = sub_10001FBD8();
  os_log_type_t v19 = sub_100020278();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "#ContactsButton finished rendering an image", v20, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  id v21 = *(void **)(v10 + 16);
  id v22 = v21;
  swift_release();
  return v21;
}

uint64_t sub_10001F3EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F424()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001F484(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_10001F9B4;
  return sub_100015A20(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10001F560(uint64_t a1)
{
  uint64_t v2 = sub_100004B44(&qword_10002E680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F5C0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F5F8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100012400;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10002E698 + dword_10002E698);
  return v6(a1, v4);
}

uint64_t sub_10001F6B0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F6E8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10001F700()
{
  swift_release();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10001F768()
{
  return sub_100014B44(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void **)(v0 + 72));
}

unint64_t sub_10001F77C()
{
  unint64_t result = qword_10002E300;
  if (!qword_10002E300)
  {
    sub_10001228C(&qword_10002E2F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002E300);
  }
  return result;
}

uint64_t sub_10001F7D8()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_10001F848(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_100012400;
  return sub_100014CD0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t *sub_10001F948(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10001F9B8()
{
  return static ContactsButtonSlotTraits.ContactsButtonAgentErrorDomain.getter();
}

uint64_t sub_10001F9C8()
{
  return static ContactsButtonSlotTraits.ContactsButtonAgentErrorDescriptionKey.getter();
}

uint64_t sub_10001F9D8()
{
  return ContactsButtonSlotTraits.widthOfAvatar.getter();
}

uint64_t sub_10001F9E8()
{
  return ContactsButtonSlotTraits.captionTextField.getter();
}

uint64_t sub_10001F9F8()
{
  return ContactsButtonSlotTraits.contentSizeCategory.getter();
}

uint64_t sub_10001FA08()
{
  return ContactsButtonSlotTraits.trailingEdgeFromAvatar.getter();
}

uint64_t sub_10001FA18()
{
  return ContactsButtonSlotTraits.font.getter();
}

uint64_t sub_10001FA28()
{
  return ContactsButtonSlotTraits.bgColor.getter();
}

uint64_t sub_10001FA38()
{
  return ContactsButtonSlotTraits.fgColor.getter();
}

uint64_t sub_10001FA48()
{
  return ContactsButtonSlotTraits.tintColor.getter();
}

uint64_t sub_10001FA58()
{
  return type metadata accessor for ContactsButtonSlotTraits();
}

uint64_t sub_10001FA68()
{
  return ContactButtonServiceErrorType.rawValue.getter();
}

uint64_t sub_10001FA78()
{
  return type metadata accessor for ContactButtonServiceErrorType();
}

uint64_t sub_10001FA88()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t sub_10001FA98()
{
  return PersonNameComponents.familyName.setter();
}

Class sub_10001FAA8()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_10001FAB8()
{
  return PersonNameComponents.init()();
}

uint64_t sub_10001FAC8()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_10001FAD8()
{
  return _convertNSErrorToError(_:)();
}

void sub_10001FAE8(NSURL *retstr@<X8>)
{
}

uint64_t sub_10001FAF8()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001FB08()
{
  return type metadata accessor for URL();
}

uint64_t sub_10001FB18()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10001FB28()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10001FB38()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001FB48()
{
  return static Locale.current.getter();
}

uint64_t sub_10001FB58()
{
  return Locale.Language.init(identifier:)();
}

uint64_t sub_10001FB68()
{
  return Locale.Language.characterDirection.getter();
}

uint64_t sub_10001FB78()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_10001FB88()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10001FB98()
{
  return Selector.init(_:)();
}

uint64_t sub_10001FBA8()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_10001FBB8()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_10001FBC8()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10001FBD8()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001FBE8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001FBF8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001FC08()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10001FC18()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_10001FC28()
{
  return ColorScheme.init(_:)();
}

uint64_t sub_10001FC38()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_10001FC48()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10001FC58()
{
  return ImageRenderer.cgImage.getter();
}

uint64_t sub_10001FC68()
{
  return ImageRenderer.scale.getter();
}

uint64_t sub_10001FC78()
{
  return ImageRenderer.scale.setter();
}

uint64_t sub_10001FC88()
{
  return ImageRenderer.init(content:)();
}

uint64_t sub_10001FC98()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_10001FCA8()
{
  return DynamicTypeSize.init(_:)();
}

uint64_t sub_10001FCB8()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_10001FCC8()
{
  return type metadata accessor for RoundedRectangle._Inset();
}

uint64_t sub_10001FCD8()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10001FCE8()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10001FCF8()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10001FD08()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10001FD18()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10001FD28()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_10001FD38()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001FD48()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10001FD58()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10001FD68()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10001FD78()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_10001FD88()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10001FD98()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10001FDA8()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10001FDB8()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t sub_10001FDC8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10001FDD8()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_10001FDE8()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10001FDF8()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10001FE08()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10001FE18()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10001FE28()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_10001FE38()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10001FE48()
{
  return static Font.body.getter();
}

uint64_t sub_10001FE58()
{
  return Font.bold()();
}

uint64_t sub_10001FE68()
{
  return static Font.caption.getter();
}

uint64_t sub_10001FE78()
{
  return Font.init(_:)();
}

uint64_t sub_10001FE88()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_10001FE98()
{
  return Text.font(_:)();
}

uint64_t sub_10001FEA8()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_10001FEB8()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10001FEC8()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10001FED8()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10001FEE8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10001FEF8()
{
  return View.dynamicTypeSize(_:)();
}

uint64_t sub_10001FF08()
{
  return Color.init(uiColor:)();
}

uint64_t sub_10001FF18()
{
  return static Color.blue.getter();
}

uint64_t sub_10001FF28()
{
  return static Color.gray.getter();
}

uint64_t sub_10001FF38()
{
  return static Color.black.getter();
}

uint64_t sub_10001FF48()
{
  return static Color.white.getter();
}

uint64_t sub_10001FF58()
{
  return Color.init(_:)();
}

uint64_t sub_10001FF68()
{
  return Color.init(_:)();
}

uint64_t sub_10001FF78()
{
  return Image.init(systemName:)();
}

uint64_t sub_10001FF88()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10001FF98()
{
  return type metadata accessor for Image.Interpolation();
}

uint64_t sub_10001FFA8()
{
  return Image.interpolation(_:)();
}

uint64_t sub_10001FFB8()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10001FFC8()
{
  return Image.init(_:scale:orientation:label:)();
}

uint64_t sub_10001FFD8()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t sub_10001FFE8()
{
  return static Alignment.center.getter();
}

uint64_t sub_10001FFF8()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100020008()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100020018()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100020028()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100020038()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100020048()
{
  return Dictionary.description.getter();
}

uint64_t sub_100020058()
{
  return Character.isWhitespace.getter();
}

uint64_t sub_100020068()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100020078()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100020088()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100020098()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000200A8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000200B8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000200C8()
{
  return String.init(format:_:)();
}

uint64_t sub_1000200D8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_1000200E8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000200F8()
{
  return String.utf8CString.getter();
}

uint64_t sub_100020108()
{
  return String.hash(into:)();
}

uint64_t sub_100020118()
{
  return String.count.getter();
}

void sub_100020128(Swift::String a1)
{
}

void sub_100020138(Swift::String a1)
{
}

uint64_t sub_100020148()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_100020158()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100020168()
{
  return String.subscript.getter();
}

uint64_t sub_100020178()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100020188()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100020198()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000201A8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000201B8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000201C8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000201D8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000201E8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000201F8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100020208()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100020218()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100020228()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100020238()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100020248()
{
  return Set.description.getter();
}

uint64_t sub_100020258()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100020268()
{
  return CGContextRef.draw(_:in:byTiling:)();
}

uint64_t sub_100020278()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100020288()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100020298()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000202A8()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000202B8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000202C8()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

void sub_1000202D8()
{
}

uint64_t sub_1000202E8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000202F8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100020308()
{
  return NSArray.init(arrayLiteral:)();
}

NSNumber sub_100020318(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100020328()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100020338()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100020348()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100020358()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100020368()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100020378()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100020388()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100020398()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000203A8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000203B8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000203C8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000203D8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000203E8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000203F8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100020408()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100020418()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100020428()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100020438()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100020448()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100020458()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100020468()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100020488(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100020498()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000204A8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000204B8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000204C8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000204D8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000204E8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000204F8()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return _BSVersionedPIDForAuditToken();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  return _CGColorGetAlpha(color);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t _AXFeatureSupportsNonSightedUsage()
{
  return __AXFeatureSupportsNonSightedUsage();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return __AXSFullKeyboardAccessEnabled();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}