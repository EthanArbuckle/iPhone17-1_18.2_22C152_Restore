Swift::Int sub_100002454(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;

  v3 = a3 + 4;
  v4 = a3 + 8;
  os_unfair_lock_lock(a3 + 8);
  sub_10000291C(v3);
  os_unfair_lock_unlock(v4);
  return sub_100006BA0();
}

uint64_t sub_1000024B8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

void sub_1000024D8(void *a1)
{
}

void sub_1000024F0(void *a1)
{
  v20 = a1;
  uint64_t v22 = sub_100006A10();
  uint64_t v1 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v3 = (os_unfair_lock_t *)((char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_100006A30();
  uint64_t v4 = *(void *)(v21 - 8);
  uint64_t v5 = __chkstk_darwin(v21);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v19 - v8;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  sub_10000281C();
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 32) = 0;
  os_unfair_lock_t v19 = (os_unfair_lock_t)(v11 + 32);
  *(void *)(v11 + 16) = 0xD00000000000001DLL;
  *(void *)(v11 + 24) = 0x80000001000075D0;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v10;
  swift_retain();
  v13 = v10;
  sub_1000057F4(v20, (uint64_t)sub_100002914, v12);
  swift_release();
  sub_100006A20();
  *uint64_t v3 = 30;
  uint64_t v14 = v22;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for DispatchTimeInterval.seconds(_:), v22);
  sub_100006A40();
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v14);
  v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v16 = v21;
  v15(v7, v21);
  LOBYTE(v7) = sub_100006B90();
  v15(v9, v16);
  if (v7) {
    goto LABEL_4;
  }
  v17 = v19;
  os_unfair_lock_lock(v19);
  uint64_t v18 = v23[3];
  sub_1000024B8((uint64_t *)(v11 + 16), v23);
  if (!v18)
  {
    os_unfair_lock_unlock(v17);
LABEL_4:

    swift_release();
    return;
  }
  os_unfair_lock_unlock(v17);
  __break(1u);
}

void sub_10000281C()
{
  if (!qword_10000C200)
  {
    type metadata accessor for os_unfair_lock_s();
    unint64_t v0 = sub_100006C40();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C200);
    }
  }
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!qword_10000C208)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C208);
    }
  }
}

uint64_t sub_1000028D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_100002914(uint64_t a1, uint64_t a2)
{
  return sub_100002454(a1, a2, *(os_unfair_lock_s **)(v2 + 16));
}

uint64_t sub_10000291C(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100002964(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_100006A00();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DiagnosticLogSessionAttachment();
  uint64_t v8 = swift_allocObject();
  uint64_t result = sub_1000044C4();
  if (a1)
  {
    uint64_t v39 = sub_100006AA0();
    uint64_t v40 = v10;
    sub_100006C10();
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v37 = ObjectType;
    if (v11 && (unint64_t v12 = sub_100005534((uint64_t)v41), (v13 & 1) != 0))
    {
      sub_100006014(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v42);
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
    sub_100005ED4((uint64_t)v41);
    if (*((void *)&v43 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0 && v39 == 1)
      {
        sub_100005FAC();
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100007160;
        *(void *)(inited + 56) = &type metadata for NotificationSettingsAttachment;
        *(void *)(inited + 64) = &off_100008748;
        *(void *)(inited + 96) = &type metadata for NotificationStateAttachment;
        *(void *)(inited + 104) = &off_100008730;
        *(void *)(inited + 136) = &type metadata for SleepingSampleDaySummariesAttachment;
        *(void *)(inited + 144) = &off_100008718;
        *(void *)(inited + 176) = v7;
        *(void *)(inited + 184) = &off_100008688;
        *(void *)(inited + 152) = v8;
        id v15 = objc_allocWithZone((Class)HKHealthStore);
        swift_retain();
        uint64_t v16 = [v15 init];
        v17 = sub_100002E94(inited, v16);
        swift_setDeallocating();
        sub_100006784(0, &qword_10000C338);
        swift_arrayDestroy();

LABEL_15:
        uint64_t v32 = sub_100003480((unint64_t)v17);
        swift_release();
        swift_bridgeObjectRelease();
        return v32;
      }
    }
    else
    {
      sub_100005F28((uint64_t)&v42);
    }
    uint64_t v38 = v4;
    sub_100004654(0xD000000000000039, (void *)0x80000001000077E0);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100006A70();
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_100004654(v18, v20);
    swift_bridgeObjectRelease();
    sub_1000069E0();
    uint64_t v21 = sub_1000069F0();
    uint64_t v22 = v6;
    os_log_type_t v23 = sub_100006B50();
    if (os_log_type_enabled(v21, v23))
    {
      v33 = (char *)&type metadata for Any + 8;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v36 = v7;
      v25 = (uint8_t *)v24;
      uint64_t v26 = swift_slowAlloc();
      v35 = v22;
      v41[0] = v26;
      *(_DWORD *)v25 = 136446210;
      uint64_t v34 = v3;
      uint64_t v27 = sub_100006CB0();
      *(void *)&long long v42 = sub_100004E9C(v27, v28, v41);
      sub_100006BC0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v23, "[%{public}s] Consent not provided; exiting without attaching any files",
        v25,
        0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v7 = v36;
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v34);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v3);
    }
    sub_100005FAC();
    uint64_t v29 = swift_initStackObject();
    *(_OWORD *)(v29 + 16) = xmmword_100007170;
    *(void *)(v29 + 56) = v7;
    *(void *)(v29 + 64) = &off_100008688;
    *(void *)(v29 + 32) = v8;
    id v30 = objc_allocWithZone((Class)HKHealthStore);
    swift_retain();
    v31 = [v30 init];
    v17 = sub_100002E94(v29, v31);

    swift_setDeallocating();
    sub_100006784(0, &qword_10000C338);
    swift_arrayDestroy();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void *sub_100002E94(uint64_t a1, void *a2)
{
  uint64_t v39 = a2;
  uint64_t v40 = (void (*)(char *, uint64_t))a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_100006A00();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  __chkstk_darwin(v2);
  v44 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000067F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006840();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v38 - v13;
  id v15 = self;
  id v16 = [v15 defaultManager];
  id v17 = [v16 temporaryDirectory];

  sub_100006810();
  v46[0] = (id)0xD000000000000019;
  v46[1] = (id)0x8000000100007A00;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for URL.DirectoryHint.isDirectory(_:), v4);
  sub_10000611C();
  sub_100006820();
  uint64_t v18 = v4;
  uint64_t v19 = v8;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  swift_bridgeObjectRelease();
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  id v21 = [v15 defaultManager];
  sub_100006800(v22);
  uint64_t v24 = v23;
  v46[0] = 0;
  LODWORD(v16) = [v21 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:v46];

  id v26 = v46[0];
  if (v16)
  {
    __chkstk_darwin(v25);
    uint64_t v27 = v39;
    *(&v38 - 4) = v14;
    *(&v38 - 3) = v27;
    *(&v38 - 2) = (void *)ObjectType;
    id v28 = v26;
    uint64_t v29 = sub_100003FC8((void (*)(uint64_t *__return_ptr, uint64_t))sub_1000061D8, (uint64_t)(&v38 - 6), (uint64_t)v40);
  }
  else
  {
    uint64_t v40 = v20;
    id v30 = v46[0];
    sub_1000067E0();

    swift_willThrow();
    sub_1000069E0();
    swift_errorRetain();
    swift_errorRetain();
    v31 = sub_1000069F0();
    os_log_type_t v32 = sub_100006B50();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v38 = (void *)swift_slowAlloc();
      uint64_t v39 = (void *)swift_slowAlloc();
      v46[0] = v39;
      *(_DWORD *)uint64_t v33 = 136446466;
      uint64_t v34 = sub_100006CB0();
      uint64_t v45 = sub_100004E9C(v34, v35, (uint64_t *)v46);
      sub_100006BC0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2114;
      swift_errorRetain();
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v45 = v36;
      sub_100006BC0();
      *uint64_t v38 = v36;
      uint64_t v19 = v8;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "[%{public}s] Failed to create diagnostics directory %{public}@", (uint8_t *)v33, 0x16u);
      sub_100006170();
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

    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v42);
    swift_errorRelease();
    uint64_t v29 = &_swiftEmptyArrayStorage;
    v20 = v40;
  }
  v20(v14, v19);
  return v29;
}

uint64_t sub_100003480(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006C70();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100005640(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_100006C30();
        sub_1000064C0(0, &qword_10000C348);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100005640(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100005640(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_1000060C0(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_1000064C0(0, &qword_10000C348);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100005640(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_100005640(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_1000060C0(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000379C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  v65 = a3;
  uint64_t v58 = a4;
  uint64_t v64 = a2;
  v62 = a5;
  uint64_t v6 = sub_100006A00();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  __chkstk_darwin(v6);
  v67 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000061F8(0, &qword_10000C370, (void (*)(uint64_t))&type metadata accessor for URL);
  __chkstk_darwin(v8 - 8);
  v57 = (char *)&v55 - v9;
  uint64_t v10 = sub_100006AC0();
  uint64_t v55 = *(void *)(v10 - 8);
  v56 = (void *)v10;
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000067F0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_100006840();
  uint64_t v68 = *(void *)(v63 - 8);
  uint64_t v17 = __chkstk_darwin(v63);
  v61 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v20 = (char *)&v55 - v19;
  uint64_t v21 = a1[3];
  uint64_t v22 = a1[4];
  sub_10000624C(a1, v21);
  uint64_t v69 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
  uint64_t v70 = v23;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for URL.DirectoryHint.notDirectory(_:), v13);
  sub_10000611C();
  sub_100006830();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_bridgeObjectRelease();
  uint64_t v24 = a1[3];
  uint64_t v25 = a1[4];
  sub_10000624C(a1, v24);
  uint64_t v26 = v66;
  uint64_t v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 16))(v65, v24, v25);
  if (v26)
  {
    uint64_t v66 = 0;
    os_log_type_t v32 = v67;
    sub_1000069E0();
    uint64_t v33 = v68;
    uint64_t v34 = v61;
    uint64_t v35 = v63;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v61, v20, v63);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v36 = sub_1000069F0();
    os_log_type_t v37 = sub_100006B50();
    int v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v39 = swift_slowAlloc();
      v56 = (void *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v69 = v64;
      *(_DWORD *)uint64_t v39 = 136446722;
      LODWORD(v57) = v38;
      uint64_t v40 = sub_100006CB0();
      v65 = v20;
      uint64_t v71 = sub_100004E9C(v40, v41, &v69);
      sub_100006BC0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      sub_100006290(&qword_10000C378, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v42 = sub_100006C90();
      uint64_t v71 = sub_100004E9C(v42, v43, &v69);
      sub_100006BC0();
      swift_bridgeObjectRelease();
      v44 = *(void (**)(char *, uint64_t))(v68 + 8);
      v44(v34, v35);
      *(_WORD *)(v39 + 22) = 2114;
      swift_errorRetain();
      uint64_t v45 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v71 = v45;
      sub_100006BC0();
      void *v56 = v45;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v36, (os_log_type_t)v57, "[%{public}s] Failed to write to %s: %{public}@", (uint8_t *)v39, 0x20u);
      sub_100006170();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v67, v60);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v44)(v65, v35);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      v47 = *(void (**)(char *, uint64_t))(v33 + 8);
      v47(v34, v35);
      swift_errorRelease();
      (*(void (**)(char *, uint64_t))(v59 + 8))(v32, v60);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v47)(v20, v35);
    }
    id v48 = 0;
    v49 = v62;
  }
  else
  {
    uint64_t v30 = v55;
    uint64_t v29 = v56;
    v31 = v57;
    uint64_t v69 = v27;
    uint64_t v70 = v28;
    sub_100006AB0();
    sub_100006BE0();
    (*(void (**)(char *, void *))(v30 + 8))(v12, v29);
    swift_bridgeObjectRelease();
    uint64_t v50 = v68;
    uint64_t v51 = v63;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v31, v20, v63);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v31, 0, 1, v51);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v31, 1, v51) == 1)
    {
      v53 = 0;
    }
    else
    {
      sub_100006800(v52);
      v53 = v54;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v31, v51);
    }
    id v48 = [objc_allocWithZone((Class)DEAttachmentItem) initWithPathURL:v53];

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v20, v51);
    v49 = v62;
  }
  void *v49 = v48;
  return result;
}

void *sub_100003FC8(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v9 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = a3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      a1(&v8, v7);
      if (v3)
      {
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      if (v8)
      {
        sub_100006B00();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100006B30();
        }
        sub_100006B40();
        sub_100006B20();
      }
      v7 += 40;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    return (void *)v9;
  }
  return result;
}

id sub_100004128()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HealthBalanceDiagnosticExtensionProvider()
{
  return self;
}

unint64_t sub_100004184()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_1000041A0()
{
  sub_1000069D0();
  sub_1000069C0();
  sub_1000064C0(0, &qword_10000C388);
  swift_retain();
  uint64_t v0 = (void *)sub_100006B70();
  id v1 = [v0 formattedTable];
  uint64_t v2 = sub_100006AA0();
  swift_release();

  return v2;
}

unint64_t sub_100004250()
{
  return 0xD000000000000029;
}

id sub_10000426C()
{
  return sub_100006364();
}

uint64_t sub_100004284(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v9 = sub_100006960();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  unint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000069B0();
  __chkstk_darwin();
  if (a3)
  {
    v20[1] = a2;
    swift_errorRetain();
    swift_errorRetain();
    sub_100006784(0, &qword_10000C3B8);
    uint64_t v19 = sub_100006AD0();
    a5(v19);
    swift_bridgeObjectRelease();
    return sub_1000067D4(a2, 1);
  }
  else
  {
    sub_1000064C0(0, &qword_10000C388);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
    swift_bridgeObjectRetain();
    sub_1000069A0();
    uint64_t v13 = (void *)sub_100006B80();
    id v14 = [v13 formattedTable];

    uint64_t v15 = sub_100006AA0();
    uint64_t v17 = v16;

    ((void (*)(uint64_t, uint64_t))a5)(v15, v17);
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_1000044A8()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_1000044C4()
{
  uint64_t v1 = sub_100006930();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v0 + 16) = &_swiftEmptyArrayStorage;
  sub_100004654(0x206E6F6973736553, (void *)0xEF64657472617453);
  uint64_t v6 = 0x656E6F5A656D6954;
  uint64_t v7 = (void *)0xEA0000000000203ALL;
  sub_100006920();
  sub_100006290(&qword_10000C380, (void (*)(uint64_t))&type metadata accessor for TimeZone);
  v8._countAndFlagsBits = sub_100006C90();
  sub_100006AE0(v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_100004654(v6, v7);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100004654(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v25 = a2;
  uint64_t v5 = sub_1000068B0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  Swift::String v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000068D0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = 91;
  unint64_t v27 = 0xE100000000000000;
  sub_1000068C0();
  sub_1000048BC((uint64_t)v8);
  uint64_t v13 = sub_100006850();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v28._countAndFlagsBits = v13;
  v28._object = v15;
  sub_100006AE0(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = 8285;
  v29._object = (void *)0xE200000000000000;
  sub_100006AE0(v29);
  v30._countAndFlagsBits = a1;
  v30._object = v25;
  sub_100006AE0(v30);
  uint64_t v16 = v26;
  unint64_t v17 = v27;
  uint64_t v18 = (char **)(v3 + 16);
  swift_beginAccess();
  uint64_t v19 = *(char **)(v3 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 16) = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v19 = sub_100004D6C(0, *((void *)v19 + 2) + 1, 1, v19);
    *uint64_t v18 = v19;
  }
  unint64_t v22 = *((void *)v19 + 2);
  unint64_t v21 = *((void *)v19 + 3);
  if (v22 >= v21 >> 1)
  {
    uint64_t v19 = sub_100004D6C((char *)(v21 > 1), v22 + 1, 1, v19);
    *uint64_t v18 = v19;
  }
  *((void *)v19 + 2) = v22 + 1;
  uint64_t v23 = &v19[16 * v22];
  *((void *)v23 + 4) = v16;
  *((void *)v23 + 5) = v17;
  return swift_endAccess();
}

uint64_t sub_1000048BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  sub_1000061F8(0, &qword_10000C320, (void (*)(uint64_t))&type metadata accessor for TimeZone);
  __chkstk_darwin(v1 - 8);
  Swift::String v29 = (char *)&v24 - v2;
  uint64_t v28 = sub_100006930();
  uint64_t v3 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000068A0();
  uint64_t v5 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006880();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100006860();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100006870();
  __chkstk_darwin(v16);
  (*(void (**)(char *, void))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Date.ISO8601FormatStyle.DateSeparator.dash(_:));
  uint64_t v19 = v12;
  uint64_t v20 = v28;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for Date.ISO8601FormatStyle.DateTimeSeparator.standard(_:), v19);
  unint64_t v21 = v7;
  unint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for Date.ISO8601FormatStyle.TimeSeparator.colon(_:), v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v21, enum case for Date.ISO8601FormatStyle.TimeZoneSeparator.omitted(_:), v27);
  sub_100006910();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v22, 1, v20);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v25, v22, v20);
    return sub_100006890();
  }
  return result;
}

uint64_t sub_100004CD0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for DiagnosticLogSessionAttachment()
{
  return self;
}

unint64_t sub_100004D2C()
{
  return 0xD000000000000024;
}

uint64_t sub_100004D48()
{
  return sub_100005D70();
}

char *sub_100004D6C(char *result, int64_t a2, char a3, char *a4)
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
      sub_1000060D0(0, &qword_10000C318, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100005C7C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100004E9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004F70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006014((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100006014((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006070((uint64_t)v12);
  return v7;
}

uint64_t sub_100004F70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006BD0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000512C(a5, a6);
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
  uint64_t v8 = sub_100006C50();
  if (!v8)
  {
    sub_100006C60();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006C80();
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

uint64_t sub_10000512C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000051C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000053C4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000053C4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000051C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000533C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006C20();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006C60();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006AF0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006C80();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006C60();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000533C(uint64_t a1, uint64_t a2)
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
  sub_1000060D0(0, &qword_10000C340, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000053C4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000060D0(0, &qword_10000C340, (uint64_t)&type metadata for UInt8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
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
  uint64_t result = sub_100006C80();
  __break(1u);
  return result;
}

unint64_t sub_100005534(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100006BF0(*(void *)(v2 + 40));

  return sub_100005578(a1, v4);
}

unint64_t sub_100005578(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000062D8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100006C00();
      sub_100005ED4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100005640(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100005660(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100005660(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000060D0(0, &qword_10000C350, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100006C80();
  __break(1u);
  return result;
}

uint64_t sub_1000057F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  id v44 = a1;
  sub_1000064FC();
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v41 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_1000068D0();
  uint64_t v38 = *(void *)(v40 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100006960();
  uint64_t v6 = *(void *)(v39 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  os_log_type_t v37 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v35 = (char *)v34 - v9;
  uint64_t v10 = sub_1000068E0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006900();
  uint64_t v36 = *(void *)(v14 - 8);
  uint64_t v15 = v36;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34[1] = v18;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v34 - v19;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for Calendar.Identifier.gregorian(_:), v10);
  sub_1000068F0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  sub_1000068C0();
  unint64_t v21 = v35;
  sub_100006950();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v40);
  sub_100006940();
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v20, v14);
  unint64_t v22 = v37;
  uint64_t v23 = v21;
  uint64_t v24 = v39;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v37, v21, v39);
  unint64_t v25 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v26 = (v7 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v27 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v27 + v25, v22, v24);
  uint64_t v28 = (void *)(v27 + v26);
  uint64_t v29 = v43;
  *uint64_t v28 = v42;
  v28[1] = v29;
  sub_1000066F0();
  id v31 = objc_allocWithZone(v30);
  swift_retain();
  os_log_type_t v32 = (void *)sub_100006980();
  [v44 executeQuery:v32];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v23, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v20, v14);
}

uint64_t sub_100005C7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100006C80();
  __break(1u);
  return result;
}

uint64_t sub_100005D70()
{
  sub_100004654(0x206E6F6973736553, (void *)0xED00006465646E45);
  swift_beginAccess();
  sub_1000060D0(0, &qword_10000C308, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
  sub_100005E54();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_100006A80();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_100005E54()
{
  unint64_t result = qword_10000C310;
  if (!qword_10000C310)
  {
    sub_1000060D0(255, &qword_10000C308, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C310);
  }
  return result;
}

uint64_t sub_100005ED4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005F28(uint64_t a1)
{
  sub_1000060D0(0, &qword_10000C328, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100005FAC()
{
  if (!qword_10000C330)
  {
    sub_100006784(255, &qword_10000C338);
    unint64_t v0 = sub_100006CA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C330);
    }
  }
}

uint64_t sub_100006014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006070(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_1000060C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1000060D0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_10000611C()
{
  unint64_t result = qword_10000C358;
  if (!qword_10000C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C358);
  }
  return result;
}

void sub_100006170()
{
  if (!qword_10000C360)
  {
    sub_1000064C0(255, &qword_10000C368);
    unint64_t v0 = sub_100006BB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C360);
    }
  }
}

uint64_t sub_1000061D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_10000379C(a1, *(void *)(v2 + 16), *(char **)(v2 + 24), *(void *)(v2 + 32), a2);
}

void sub_1000061F8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100006BB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_10000624C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006290(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000062D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for SleepingSampleDaySummariesAttachment()
{
  return &type metadata for SleepingSampleDaySummariesAttachment;
}

ValueMetadata *type metadata accessor for NotificationStateAttachment()
{
  return &type metadata for NotificationStateAttachment;
}

ValueMetadata *type metadata accessor for NotificationSettingsAttachment()
{
  return &type metadata for NotificationSettingsAttachment;
}

id sub_100006364()
{
  sub_1000064C0(0, &qword_10000C390);
  unint64_t v0 = (void *)sub_100006B60();
  id v7 = 0;
  id v1 = [v0 allValuesWithError:&v7];
  id v2 = v7;
  if (v1)
  {
    uint64_t v3 = v1;
    sub_100006A60();
    id v4 = v2;

    id v2 = (id)sub_100006A70();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = v7;
    sub_1000067E0();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1000064C0(uint64_t a1, unint64_t *a2)
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

void sub_1000064FC()
{
  if (!qword_10000C398)
  {
    sub_100006A50();
    sub_100006290(&qword_10000C3A0, (void (*)(uint64_t))&type metadata accessor for DayIndex);
    unint64_t v0 = sub_100006A90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C398);
    }
  }
}

uint64_t sub_100006590()
{
  uint64_t v1 = sub_100006960();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100006638(uint64_t a1, uint64_t a2, char a3)
{
  char v6 = a3 & 1;
  uint64_t v7 = *(void *)(sub_100006960() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void (**)(uint64_t))(v3 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100004284(a1, a2, v6, v3 + v8, v9);
}

void sub_1000066F0()
{
  if (!qword_10000C3A8)
  {
    sub_100006970();
    sub_100006290(&qword_10000C3B0, (void (*)(uint64_t))&type metadata accessor for SleepingSampleDaySummary);
    unint64_t v0 = sub_100006990();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C3A8);
    }
  }
}

uint64_t sub_100006784(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000067D4(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000067E0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000067F0()
{
  return type metadata accessor for URL.DirectoryHint();
}

void sub_100006800(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006810()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006820()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100006830()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_100006840()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006850()
{
  return Date.ISO8601Format(_:)();
}

uint64_t sub_100006860()
{
  return type metadata accessor for Date.ISO8601FormatStyle.DateTimeSeparator();
}

uint64_t sub_100006870()
{
  return type metadata accessor for Date.ISO8601FormatStyle.DateSeparator();
}

uint64_t sub_100006880()
{
  return type metadata accessor for Date.ISO8601FormatStyle.TimeSeparator();
}

uint64_t sub_100006890()
{
  return Date.ISO8601FormatStyle.init(dateSeparator:dateTimeSeparator:timeSeparator:timeZoneSeparator:includingFractionalSeconds:timeZone:)();
}

uint64_t sub_1000068A0()
{
  return type metadata accessor for Date.ISO8601FormatStyle.TimeZoneSeparator();
}

uint64_t sub_1000068B0()
{
  return type metadata accessor for Date.ISO8601FormatStyle();
}

uint64_t sub_1000068C0()
{
  return static Date.now.getter();
}

uint64_t sub_1000068D0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000068E0()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_1000068F0()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_100006900()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100006910()
{
  return TimeZone.init(secondsFromGMT:)();
}

uint64_t sub_100006920()
{
  return static TimeZone.current.getter();
}

uint64_t sub_100006930()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100006940()
{
  return GregorianDayRange.dayIndexRange.getter();
}

uint64_t sub_100006950()
{
  return static GregorianDayRange.previousWeek(through:gregorianCalendar:)();
}

uint64_t sub_100006960()
{
  return type metadata accessor for GregorianDayRange();
}

uint64_t sub_100006970()
{
  return type metadata accessor for SleepingSampleDaySummary();
}

uint64_t sub_100006980()
{
  return SleepingSampleDaySummaryQuery.init(morningIndexRange:gregorianCalendar:continueAfterInitialResults:resultsHandler:)();
}

uint64_t sub_100006990()
{
  return type metadata accessor for SleepingSampleDaySummaryQuery();
}

uint64_t sub_1000069A0()
{
  return SleepingSampleDaySummaryCollection.init(gregorianDayRange:daySummaries:)();
}

uint64_t sub_1000069B0()
{
  return type metadata accessor for SleepingSampleDaySummaryCollection();
}

uint64_t sub_1000069C0()
{
  return SleepingSampleChangeNotificationSettingsProvider.__allocating_init()();
}

uint64_t sub_1000069D0()
{
  return type metadata accessor for SleepingSampleChangeNotificationSettingsProvider();
}

uint64_t sub_1000069E0()
{
  return static Logger.balance.getter();
}

uint64_t sub_1000069F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006A00()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100006A10()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100006A20()
{
  return static DispatchTime.now()();
}

uint64_t sub_100006A30()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100006A40()
{
  return + infix(_:_:)();
}

uint64_t sub_100006A50()
{
  return type metadata accessor for DayIndex();
}

uint64_t sub_100006A60()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A70()
{
  return Dictionary.description.getter();
}

uint64_t sub_100006A80()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100006A90()
{
  return type metadata accessor for ClosedRange();
}

uint64_t sub_100006AA0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006AB0()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100006AC0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_100006AD0()
{
  return String.init<A>(describing:)();
}

void sub_100006AE0(Swift::String a1)
{
}

Swift::Int sub_100006AF0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006B00()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006B10()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006B20()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006B30()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006B40()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006B50()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006B60()
{
  return static HKKeyValueDomain.makeSleepingSampleChangeNotificationStateDomain(for:)();
}

uint64_t sub_100006B70()
{
  return HKTableFormatter.init(notificationSettings:)();
}

uint64_t sub_100006B80()
{
  return HKTableFormatter.init(_:)();
}

uint64_t sub_100006B90()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100006BA0()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100006BB0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100006BC0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006BD0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006BE0()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

Swift::Int sub_100006BF0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100006C00()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100006C10()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100006C20()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006C30()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006C40()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t sub_100006C50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006C70()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006C80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006C90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100006CA0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_100006CB0()
{
  return _typeName(_:qualified:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}