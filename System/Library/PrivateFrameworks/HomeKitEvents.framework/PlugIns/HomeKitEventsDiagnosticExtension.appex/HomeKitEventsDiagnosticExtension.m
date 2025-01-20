uint64_t sub_100003C54()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t vars8;

  v0 = sub_1000071B0();
  sub_100006E78(v0, qword_10000C280);
  *(void *)sub_10000627C(v0, (uint64_t)qword_10000C280) = 300;
  v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v1();
}

void sub_100003CE4(uint64_t a1)
{
  ObjectType = swift_getObjectType();
  sub_100005FD4(&qword_10000C168);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007160();
  uint64_t v90 = *(void *)(v5 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v92 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000071E0();
  uint64_t v83 = *(void *)(v7 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v82 = (char *)&v78 - v11;
  uint64_t v12 = sub_100005FD4(&qword_10000C170);
  __chkstk_darwin(v12 - 8);
  v80 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000071A0();
  uint64_t v89 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  v85 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v84 = (char *)&v78 - v18;
  __chkstk_darwin(v17);
  v20 = (char *)&v78 - v19;
  uint64_t v81 = sub_100006FCC(&qword_10000C178, v21, (void (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension);
  v88 = ObjectType;
  sub_100007170();
  swift_bridgeObjectRetain_n();
  v22 = sub_100007190();
  os_log_type_t v23 = sub_1000072C0();
  BOOL v24 = os_log_type_enabled(v22, v23);
  v91 = v4;
  uint64_t v87 = v14;
  if (v24)
  {
    v79 = v10;
    uint64_t v86 = v7;
    v25 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v95 = swift_slowAlloc();
    *(_DWORD *)v25 = 136315138;
    if (!a1)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v78 = v25 + 4;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100007200();
    unint64_t v28 = v27;
    swift_bridgeObjectRelease();
    *(void *)&long long v97 = sub_100006488(v26, v28, (uint64_t *)&v95);
    sub_100007300();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Starting with parameters: %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v29 = *(void (**)(char *, uint64_t))(v89 + 8);
    v29(v20, v87);
    v4 = v91;
    uint64_t v7 = v86;
    v10 = v79;
LABEL_5:
    id v93 = (id)sub_100007210();
    uint64_t v94 = v30;
    sub_100007340();
    if (*(void *)(a1 + 16) && (unint64_t v31 = sub_100006AE0((uint64_t)&v95), (v32 & 1) != 0))
    {
      sub_100006CA8(*(void *)(a1 + 56) + 32 * v31, (uint64_t)&v97);
    }
    else
    {
      long long v97 = 0u;
      long long v98 = 0u;
    }
    sub_100007014((uint64_t)&v95);
    v79 = (char *)v29;
    if (*((void *)&v98 + 1))
    {
      sub_100006C0C(0, &qword_10000C198);
      if (swift_dynamicCast())
      {
        id v33 = v93;
        unsigned __int8 v34 = [v93 BOOLValue];

        goto LABEL_14;
      }
    }
    else
    {
      sub_100007068((uint64_t)&v97, (uint64_t *)&unk_10000C1E0);
    }
    unsigned __int8 v34 = 0;
LABEL_14:
    uint64_t v35 = swift_allocObject();
    *(_DWORD *)(v35 + 16) = 0;
    v36 = (os_unfair_lock_s *)(v35 + 16);
    *(void *)(v35 + 24) = &_swiftEmptyArrayStorage;
    dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
    uint64_t v38 = sub_100007270();
    uint64_t v39 = (uint64_t)v80;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v80, 1, 1, v38);
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = 0;
    *(void *)(v40 + 24) = 0;
    *(unsigned char *)(v40 + 32) = v34;
    *(void *)(v40 + 40) = v35;
    *(void *)(v40 + 48) = v37;
    *(void *)(v40 + 56) = v88;
    uint64_t v86 = v35;
    swift_retain();
    v41 = v37;
    sub_100004ED0(v39, (uint64_t)&unk_10000C190, v40);
    swift_release();
    sub_1000071C0();
    v42 = v10;
    if (qword_10000C1F0 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_1000071B0();
    sub_10000627C(v43, (uint64_t)qword_10000C280);
    v44 = v82;
    sub_1000071D0();
    v45 = *(void (**)(char *, uint64_t))(v83 + 8);
    v45(v42, v7);
    char v46 = sub_1000072D0();
    v45(v44, v7);
    v47 = v85;
    if (v46)
    {
      sub_100007170();
      v56 = sub_100007190();
      os_log_type_t v57 = sub_1000072B0();
      BOOL v58 = os_log_type_enabled(v56, v57);
      v59 = (void (*)(char *, uint64_t))v79;
      if (v58)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Timed out collecting attachments", v60, 2u);
        swift_slowDealloc();
      }

      v59(v84, v87);
    }
    else
    {
      os_unfair_lock_lock(v36);
      uint64_t v48 = *(void *)(v86 + 24);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v36);
      sub_100007170();
      swift_bridgeObjectRetain_n();
      v49 = sub_100007190();
      os_log_type_t v50 = sub_1000072C0();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v95 = swift_slowAlloc();
        *(_DWORD *)v51 = 136315138;
        v88 = (v51 + 4);
        swift_bridgeObjectRetain();
        uint64_t v52 = sub_100007240();
        unint64_t v54 = v53;
        swift_bridgeObjectRelease();
        *(void *)&long long v97 = sub_100006488(v52, v54, (uint64_t *)&v95);
        sub_100007300();
        v4 = v91;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Finished collecting attachments: %s", v51, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v55 = v85;
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v55 = v47;
      }
      ((void (*)(char *, uint64_t))v79)(v55, v87);
      int64_t v61 = *(void *)(v48 + 16);
      if (v61)
      {
        v88 = v41;
        *(void *)&long long v97 = &_swiftEmptyArrayStorage;
        sub_100006BEC(0, v61, 0);
        v62 = *(void (**)(char *, uint64_t, uint64_t))(v90 + 16);
        uint64_t v63 = *(unsigned __int8 *)(v90 + 80);
        uint64_t v87 = v48;
        uint64_t v64 = v48 + ((v63 + 32) & ~v63);
        v65 = (void (**)(char *, void, uint64_t, uint64_t))(v90 + 56);
        v66 = (unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48);
        uint64_t v89 = *(void *)(v90 + 72);
        v90 += 16;
        v67 = (void (**)(char *, uint64_t))(v90 - 8);
        while (1)
        {
          v68 = v92;
          v62(v92, v64, v5);
          v62(v4, (uint64_t)v68, v5);
          (*v65)(v4, 0, 1, v5);
          if ((*v66)(v4, 1, v5) == 1)
          {
            v70 = 0;
          }
          else
          {
            sub_100007150(v69);
            v70 = v71;
            (*v67)(v4, v5);
          }
          id v72 = [objc_allocWithZone((Class)DEAttachmentItem) initWithPathURL:v70];

          if (!v72) {
            break;
          }
          sub_100006C0C(0, &qword_10000C198);
          Class isa = sub_1000072F0(1).super.super.isa;
          [v72 setShouldCompress:isa];

          Class v74 = sub_1000072F0(1).super.super.isa;
          [v72 setDeleteOnAttach:v74];

          uint64_t v96 = sub_100006C0C(0, &qword_10000C1A0);
          *(void *)&long long v95 = v72;
          (*v67)(v92, v5);
          uint64_t v75 = v97;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_100006BEC(0, *(void *)(v75 + 16) + 1, 1);
            uint64_t v75 = v97;
          }
          unint64_t v77 = *(void *)(v75 + 16);
          unint64_t v76 = *(void *)(v75 + 24);
          if (v77 >= v76 >> 1)
          {
            sub_100006BEC(v76 > 1, v77 + 1, 1);
            uint64_t v75 = v97;
          }
          *(void *)(v75 + 16) = v77 + 1;
          sub_100006C48(&v95, (_OWORD *)(v75 + 32 * v77 + 32));
          v64 += v89;
          --v61;
          v4 = v91;
          if (!v61)
          {

            swift_bridgeObjectRelease();
            swift_release();
            return;
          }
        }
        __break(1u);
        goto LABEL_38;
      }

      swift_bridgeObjectRelease();
    }
    swift_release();
    return;
  }
  swift_bridgeObjectRelease_n();

  v29 = *(void (**)(char *, uint64_t))(v89 + 8);
  v29(v20, v14);
  if (a1) {
    goto LABEL_5;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_100004944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[3] = a5;
  uint64_t v9 = sub_1000071A0();
  v7[6] = v9;
  v7[7] = *(void *)(v9 - 8);
  v7[8] = swift_task_alloc();
  uint64_t v10 = sub_100007160();
  v7[9] = v10;
  v7[10] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v7[11] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v7[12] = v12;
  *uint64_t v12 = v7;
  v12[1] = sub_100004AA8;
  return collectDiagnostics(includeSensitiveData:)(v11, a4);
}

uint64_t sub_100004AA8()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    v2 = sub_100004C98;
  }
  else {
    v2 = sub_100004BBC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100004BBC()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = (char *)v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[3];
  uint64_t v5 = sub_1000051D0(v1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v1, v3);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 16));
  swift_bridgeObjectRelease();
  *(void *)(v4 + 24) = v5;
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
  sub_1000072E0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100004C98(uint64_t a1, uint64_t a2)
{
  sub_100006FCC(&qword_10000C178, a2, (void (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension);
  sub_100007170();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_100007190();
  os_log_type_t v4 = sub_1000072B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v2[2] = v7;
    sub_100007300();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to collect attachments: %@", v5, 0xCu);
    sub_100005FD4(&qword_10000C1C8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
  sub_1000072E0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v2[1];
  return v8();
}

uint64_t sub_100004ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007270();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100007260();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100007068(a1, &qword_10000C170);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100007250();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_100005174()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HomeKitEventsDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HomeKitEventsDiagnosticExtension()
{
  return self;
}

char *sub_1000051D0(char *a1)
{
  uint64_t v2 = sub_100005FD4(&qword_10000C168);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v4 = (char *)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100007130();
  uint64_t v97 = *(void *)(v5 - 8);
  uint64_t v98 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007160();
  uint64_t v105 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  v100 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v101 = (char *)&v79 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  id v93 = (char *)&v79 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v92 = (char *)&v79 - v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v79 - v17;
  uint64_t v19 = sub_1000071A0();
  uint64_t v104 = *(void *)(v19 - 8);
  uint64_t v20 = __chkstk_darwin(v19);
  v22 = (char *)&v79 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v20);
  v99 = (char *)&v79 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v91 = (char *)&v79 - v26;
  __chkstk_darwin(v25);
  unint64_t v28 = (char *)&v79 - v27;
  id v29 = [self defaultManager];
  id v102 = (id)sub_100007290();
  uint64_t v103 = v19;
  if (!v102)
  {
    type metadata accessor for HomeKitEventsDiagnosticExtension();
    sub_100006FCC(&qword_10000C178, v40, (void (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension);
    sub_100007170();
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v100, a1, v8);
    v41 = sub_100007190();
    os_log_type_t v42 = sub_1000072B0();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc();
      id v96 = v29;
      v44 = (uint8_t *)v43;
      v106[0] = swift_slowAlloc();
      *(_DWORD *)v44 = 136315138;
      sub_100006FCC(&qword_10000C1D0, 255, (void (*)(uint64_t))&type metadata accessor for URL);
      v45 = v100;
      uint64_t v46 = sub_100007390();
      uint64_t v108 = sub_100006488(v46, v47, v106);
      sub_100007300();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v105 + 8))(v45, v8);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Could not enumerate '%s'", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      id v29 = v96;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v105 + 8))(v100, v8);
    }

    (*(void (**)(char *, uint64_t))(v104 + 8))(v22, v103);
LABEL_27:
    v70 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_28;
  }
  id v96 = v29;
  uint64_t v30 = type metadata accessor for HomeKitEventsDiagnosticExtension();
  uint64_t v32 = sub_100006FCC(&qword_10000C178, v31, (void (*)(uint64_t))type metadata accessor for HomeKitEventsDiagnosticExtension);
  uint64_t v89 = v30;
  uint64_t v88 = v32;
  sub_100007170();
  uint64_t v33 = v105;
  unsigned __int8 v34 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
  v100 = a1;
  uint64_t v94 = v34;
  uint64_t v95 = v105 + 16;
  v34(v18, a1, v8);
  uint64_t v35 = sub_100007190();
  os_log_type_t v36 = sub_1000072A0();
  if (os_log_type_enabled(v35, v36))
  {
    dispatch_semaphore_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v87 = (void (*)(char *, uint64_t))swift_slowAlloc();
    v106[0] = (uint64_t)v87;
    *(_DWORD *)dispatch_semaphore_t v37 = 136315138;
    uint64_t v90 = (void (*)(char *, uint64_t))(v37 + 4);
    sub_100006FCC(&qword_10000C1D0, 255, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v38 = sub_100007390();
    uint64_t v108 = sub_100006488(v38, v39, v106);
    uint64_t v33 = v105;
    sub_100007300();
    swift_bridgeObjectRelease();
    uint64_t v90 = *(void (**)(char *, uint64_t))(v33 + 8);
    v90(v18, v8);
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Enumerating '%s' for attachments", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v19 = v103;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v90 = *(void (**)(char *, uint64_t))(v33 + 8);
    v90(v18, v8);
  }

  uint64_t v87 = *(void (**)(char *, uint64_t))(v104 + 8);
  v87(v28, v19);
  uint64_t v48 = v100;
  v49 = v101;
  sub_100007280();
  sub_100007120();
  if (!v107)
  {
    (*(void (**)(char *, uint64_t))(v97 + 8))(v7, v98);
LABEL_21:
    v71 = v99;
    sub_100007170();
    v94(v49, v48, v8);
    id v72 = sub_100007190();
    os_log_type_t v73 = sub_1000072A0();
    if (os_log_type_enabled(v72, v73))
    {
      Class v74 = (uint8_t *)swift_slowAlloc();
      v106[0] = swift_slowAlloc();
      *(_DWORD *)Class v74 = 136315138;
      sub_100006FCC(&qword_10000C1D0, 255, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v75 = sub_100007390();
      uint64_t v108 = sub_100006488(v75, v76, v106);
      sub_100007300();
      swift_bridgeObjectRelease();
      v90(v49, v8);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Directory '%s' is empty", v74, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v77 = v99;
    }
    else
    {
      v90(v49, v8);

      unint64_t v77 = v71;
    }
    v87(v77, v103);
    id v29 = v96;

    goto LABEL_27;
  }
  uint64_t v51 = v33;
  uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56);
  unint64_t v53 = (unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  v85 = (void (**)(char *, char *, uint64_t))(v51 + 32);
  uint64_t v86 = v51 + 8;
  uint64_t v84 = v104 + 8;
  char v54 = 1;
  *(void *)&long long v50 = 136315138;
  long long v83 = v50;
  do
  {
    while (1)
    {
      int v55 = swift_dynamicCast();
      v56 = *v52;
      if (!v55)
      {
        v56(v4, 1, 1, v8);
        break;
      }
      v56(v4, 0, 1, v8);
      if ((*v53)(v4, 1, v8) == 1) {
        break;
      }
      os_log_type_t v57 = v92;
      (*v85)(v92, v4, v8);
      sub_100007170();
      v94(v93, v57, v8);
      BOOL v58 = sub_100007190();
      os_log_type_t v59 = sub_1000072A0();
      int v60 = v59;
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v61 = swift_slowAlloc();
        int v81 = v60;
        uint64_t v62 = v61;
        uint64_t v82 = swift_slowAlloc();
        uint64_t v108 = v82;
        *(_DWORD *)uint64_t v62 = v83;
        os_log_t v80 = v58;
        uint64_t v63 = v93;
        uint64_t v64 = sub_100007140();
        *(void *)(v62 + 4) = sub_100006488(v64, v65, &v108);
        swift_bridgeObjectRelease();
        v90(v63, v8);
        os_log_t v66 = v80;
        _os_log_impl((void *)&_mh_execute_header, v80, (os_log_type_t)v81, "Adding '%s' to attachments", (uint8_t *)v62, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v87(v91, v103);
        v90(v92, v8);
      }
      else
      {

        v67 = v90;
        v90(v93, v8);
        v87(v91, v103);
        v67(v92, v8);
      }
      sub_100007120();
      char v54 = 0;
      if (!v107)
      {
        (*(void (**)(char *, uint64_t))(v97 + 8))(v7, v98);
        uint64_t v68 = v105;
        uint64_t v48 = v100;
        goto LABEL_19;
      }
    }
    sub_100007068((uint64_t)v4, &qword_10000C168);
    sub_100007120();
  }
  while (v107);
  (*(void (**)(char *, uint64_t))(v97 + 8))(v7, v98);
  uint64_t v68 = v105;
  uint64_t v48 = v100;
  v49 = v101;
  if (v54) {
    goto LABEL_21;
  }
LABEL_19:
  sub_100005FD4(&qword_10000C1D8);
  unint64_t v69 = (*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  v70 = (char *)swift_allocObject();
  *((_OWORD *)v70 + 1) = xmmword_100007720;
  v94(&v70[v69], v48, v8);

  id v29 = v96;
LABEL_28:

  return v70;
}

unint64_t sub_100005FB8()
{
  return 0xD000000000000013;
}

uint64_t sub_100005FD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006018()
{
  uint64_t v1 = sub_100005FD4(&qword_10000C180);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + 24, v1);

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006090()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000060D8()
{
  uint64_t v2 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_100006188;
  return sub_100004944((uint64_t)v6, v7, v8, v2, v3, v4, v5);
}

uint64_t sub_100006188()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000627C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000062B4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100006390;
  return v6(a1);
}

uint64_t sub_100006390()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006488(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000655C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006CA8((uint64_t)v12, *a3);
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
      sub_100006CA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C58((uint64_t)v12);
  return v7;
}

uint64_t sub_10000655C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007310();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006718(a5, a6);
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
  uint64_t v8 = sub_100007360();
  if (!v8)
  {
    sub_100007370();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007380();
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

uint64_t sub_100006718(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000067B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006990(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006990(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000067B0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006928(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100007350();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007370();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007220();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007380();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007370();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006928(uint64_t a1, uint64_t a2)
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
  sub_100005FD4(&qword_10000C1A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006990(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005FD4(&qword_10000C1A8);
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
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

unint64_t sub_100006AE0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100007320(*(void *)(v2 + 40));

  return sub_100006B24(a1, v4);
}

unint64_t sub_100006B24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000070C4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100007330();
      sub_100007014((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100006BEC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100006D08(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100006C0C(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_100006C48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006C58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D08(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005FD4(&qword_10000C1B0);
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
  uint64_t result = sub_100007380();
  __break(1u);
  return result;
}

uint64_t *sub_100006E78(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006EDC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006F14(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100006188;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C1B8 + dword_10000C1B8);
  return v6(a1, v4);
}

uint64_t sub_100006FCC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007014(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007068(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005FD4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000070C4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007120()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t sub_100007130()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t sub_100007140()
{
  return URL.lastPathComponent.getter();
}

void sub_100007150(NSURL *retstr@<X8>)
{
}

uint64_t sub_100007160()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007170()
{
  return static LoggedObject.logger.getter();
}

uint64_t sub_100007190()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000071A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000071B0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000071C0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000071D0()
{
  return DispatchTime.advanced(by:)();
}

uint64_t sub_1000071E0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000071F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007200()
{
  return Dictionary.description.getter();
}

uint64_t sub_100007210()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100007220()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100007230()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100007240()
{
  return Array.description.getter();
}

uint64_t sub_100007250()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100007260()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100007270()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100007280()
{
  return NSEnumerator.makeIterator()();
}

uint64_t sub_100007290()
{
  return NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();
}

uint64_t sub_1000072A0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000072B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000072C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000072D0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_1000072E0()
{
  return OS_dispatch_semaphore.signal()();
}

NSNumber sub_1000072F0(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t sub_100007300()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007310()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100007320(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100007330()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100007340()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100007350()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007360()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007370()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007380()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007390()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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