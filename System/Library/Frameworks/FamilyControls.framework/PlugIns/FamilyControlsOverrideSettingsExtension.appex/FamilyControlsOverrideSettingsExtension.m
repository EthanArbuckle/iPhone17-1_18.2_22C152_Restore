uint64_t sub_100005248()
{
  return sub_1000073F0();
}

uint64_t sub_10000526C()
{
  return sub_1000073E0();
}

uint64_t sub_100005290@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_10000C118;
  swift_beginAccess();
  sub_100005364(v3, (uint64_t)&v8);
  if (!v9)
  {
    sub_10000649C((uint64_t)&v8, &qword_10000C120);
    uint64_t v4 = sub_100007410();
    uint64_t v5 = sub_100007400();
    uint64_t v9 = v4;
    v10 = &off_100008278;
    *(void *)&long long v8 = v5;
    sub_100005410((uint64_t)&v8, (uint64_t)v7);
    swift_beginAccess();
    sub_100005474((uint64_t)v7, v3);
    swift_endAccess();
  }
  return sub_1000054DC(&v8, a1);
}

uint64_t sub_100005364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053CC(&qword_10000C120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000053CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005410(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005474(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000053CC(&qword_10000C120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000054DC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000054F4(long long *a1)
{
  sub_1000054DC(a1, (uint64_t)v4);
  uint64_t v2 = v1 + qword_10000C118;
  swift_beginAccess();
  sub_100005474((uint64_t)v4, v2);
  return swift_endAccess();
}

void (*sub_100005554(void *a1))(uint64_t *a1, char a2)
{
  long long v3 = malloc(0x98uLL);
  *a1 = v3;
  v3[18] = v1;
  sub_100005290((uint64_t)v3);
  return sub_1000055B4;
}

void sub_1000055B4(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  long long v3 = (long long *)(*a1 + 40);
  uint64_t v4 = *a1 + 80;
  if (a2)
  {
    uint64_t v5 = v2[18];
    sub_100005410(*a1, (uint64_t)v3);
    sub_1000054DC(v3, v4);
    uint64_t v6 = v5 + qword_10000C118;
    swift_beginAccess();
    sub_100005474(v4, v6);
    swift_endAccess();
    sub_100007320((uint64_t)v2);
  }
  else
  {
    uint64_t v7 = v2[18];
    sub_1000054DC((long long *)*a1, (uint64_t)v3);
    uint64_t v8 = v7 + qword_10000C118;
    swift_beginAccess();
    sub_100005474((uint64_t)v3, v8);
    swift_endAccess();
  }

  free(v2);
}

double sub_1000056A8@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1000056B8(uint64_t a1, unint64_t a2, uint64_t a3, char *a4, void (*a5)(void), uint64_t a6)
{
  v104 = a4;
  unint64_t v105 = a2;
  uint64_t v106 = a1;
  uint64_t v10 = sub_1000073D0();
  uint64_t v96 = *(void *)(v10 - 8);
  uint64_t v97 = v10;
  __chkstk_darwin(v10);
  v95 = (char *)v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100007460();
  uint64_t v92 = *(void *)(v12 - 8);
  uint64_t v93 = v12;
  __chkstk_darwin(v12);
  v91 = (char *)v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_100007490();
  uint64_t v89 = *(void *)(v90 - 8);
  uint64_t v14 = __chkstk_darwin(v90);
  v16 = (char *)v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)v85 - v17;
  uint64_t v19 = sub_1000053CC(&qword_10000C128);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  v88 = (char *)v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v103 = (uint64_t)v85 - v22;
  uint64_t v23 = sub_100007450();
  uint64_t v100 = *(void *)(v23 - 8);
  uint64_t v24 = __chkstk_darwin(v23);
  v26 = (char *)v85 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v24);
  v29 = (char *)v85 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  v32 = (char *)v85 - v31;
  __chkstk_darwin(v30);
  v94 = (char *)v85 - v33;
  int v34 = os_variant_allows_internal_security_policies();
  v99 = v6;
  if (!v34)
  {
    uint64_t v101 = a3;
    v86 = v16;
    (*(void (**)(uint64_t *__return_ptr))(qword_10000C180 + (swift_isaMask & *v6) + 8))(v108);
    uint64_t v48 = v109;
    uint64_t v49 = v110;
    sub_100006458(v108, v109);
    uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v49 + 8))(v48, v49);
    uint64_t v51 = *(void *)(v50 + 16);
    if (!v51)
    {
      uint64_t v61 = 1;
LABEL_25:
      v46 = v99;
      uint64_t v47 = v100;
      v62 = v86;
      uint64_t v63 = (uint64_t)v88;
      goto LABEL_35;
    }
    v98 = a5;
    uint64_t v87 = a6;
    v52 = *(void (**)(char *, unint64_t, uint64_t))(v100 + 16);
    unint64_t v53 = v50 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
    v54 = (void (**)(char *, uint64_t))(v100 + 8);
    uint64_t v103 = *(void *)(v100 + 72);
    v85[1] = v50;
    swift_bridgeObjectRetain();
    uint64_t v102 = (unint64_t)v54 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    while (1)
    {
      v52(v29, v53, v23);
      if (sub_100007430() == v106 && v57 == v105)
      {
        swift_bridgeObjectRelease();
        v52(v26, (unint64_t)v29, v23);
      }
      else
      {
        char v58 = sub_100007530();
        swift_bridgeObjectRelease();
        v52(v26, (unint64_t)v29, v23);
        if ((v58 & 1) == 0)
        {
          v56 = *v54;
          (*v54)(v26, v23);
          goto LABEL_12;
        }
      }
      if (sub_100007420() == v101 && v59 == v104)
      {
        swift_bridgeObjectRelease();
        (*v54)(v26, v23);
LABEL_34:
        swift_bridgeObjectRelease();
        uint64_t v47 = v100;
        uint64_t v63 = (uint64_t)v88;
        (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v88, v29, v23);
        uint64_t v61 = 0;
        a6 = v87;
        a5 = v98;
        v46 = v99;
        v62 = v86;
LABEL_35:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v63, v61, 1, v23);
        swift_bridgeObjectRelease();
        sub_100007320((uint64_t)v108);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v63, 1, v23) == 1)
        {
          sub_10000649C(v63, &qword_10000C128);
          sub_100007470();
          unint64_t v68 = v105;
          swift_bridgeObjectRetain_n();
          unint64_t v69 = (unint64_t)v104;
          swift_bridgeObjectRetain_n();
          v70 = sub_100007480();
          os_log_type_t v71 = sub_1000074B0();
          if (os_log_type_enabled(v70, v71))
          {
            uint64_t v72 = swift_slowAlloc();
            v108[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v72 = 136446467;
            swift_bridgeObjectRetain();
            uint64_t v107 = sub_100006BC0(v106, v68, v108);
            sub_1000074D0();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v72 + 12) = 2081;
            swift_bridgeObjectRetain();
            uint64_t v107 = sub_100006BC0(v101, v69, v108);
            sub_1000074D0();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v70, v71, "Couldn't locate existing authorization record for app with bundle identifier “%{public}s” and team identifier “%{private}s”.", (uint8_t *)v72, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v89 + 8))(v86, v90);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v89 + 8))(v62, v90);
          }
          goto LABEL_40;
        }
LABEL_38:
        v73 = v94;
        uint64_t v74 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 32))(v94, v63, v23);
        (*(void (**)(uint64_t *__return_ptr, uint64_t))(qword_10000C180 + (swift_isaMask & *v46) + 8))(v108, v74);
        uint64_t v75 = v47;
        uint64_t v76 = v109;
        uint64_t v77 = v110;
        v104 = (char *)sub_100006458(v108, v109);
        v78 = v95;
        sub_100007440();
        v79 = (void *)swift_allocObject();
        v79[2] = v106;
        v79[3] = v105;
        v79[4] = a5;
        v79[5] = a6;
        v80 = *(void (**)(char *, uint64_t (*)(uint64_t, char), void *, uint64_t, uint64_t))(v77 + 16);
        swift_bridgeObjectRetain();
        swift_retain();
        v80(v78, sub_100007258, v79, v76, v77);
        swift_release();
        (*(void (**)(char *, uint64_t))(v96 + 8))(v78, v97);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v23);
        return sub_100007320((uint64_t)v108);
      }
      char v55 = sub_100007530();
      swift_bridgeObjectRelease();
      v56 = *v54;
      (*v54)(v26, v23);
      if (v55) {
        goto LABEL_34;
      }
LABEL_12:
      v56(v29, v23);
      v53 += v103;
      if (!--v51)
      {
        swift_bridgeObjectRelease();
        uint64_t v61 = 1;
        a6 = v87;
        a5 = v98;
        goto LABEL_25;
      }
    }
  }
  v98 = a5;
  (*(void (**)(uint64_t *__return_ptr))(qword_10000C180 + (swift_isaMask & *v6) + 8))(v108);
  uint64_t v35 = v109;
  uint64_t v36 = v110;
  sub_100006458(v108, v109);
  uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8))(v35, v36);
  uint64_t v38 = *(void *)(v37 + 16);
  if (v38)
  {
    v104 = v18;
    uint64_t v87 = a6;
    v39 = *(void (**)(char *, unint64_t, uint64_t))(v100 + 16);
    unint64_t v40 = v37 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
    v41 = (void (**)(char *, uint64_t))(v100 + 8);
    uint64_t v42 = *(void *)(v100 + 72);
    uint64_t v102 = v37;
    swift_bridgeObjectRetain();
    while (1)
    {
      v39(v32, v40, v23);
      if (sub_100007430() == v106 && v43 == v105) {
        break;
      }
      char v44 = sub_100007530();
      swift_bridgeObjectRelease();
      if (v44) {
        goto LABEL_27;
      }
      (*v41)(v32, v23);
      v40 += v42;
      if (!--v38)
      {
        swift_bridgeObjectRelease();
        uint64_t v45 = 1;
        a6 = v87;
        a5 = v98;
        v46 = v99;
        uint64_t v47 = v100;
        v18 = v104;
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
LABEL_27:
    a6 = v87;
    a5 = v98;
    v46 = v99;
    uint64_t v47 = v100;
    uint64_t v60 = v103;
    v18 = v104;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v60, v32, v23);
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = 1;
    a5 = v98;
    v46 = v99;
    uint64_t v47 = v100;
LABEL_22:
    uint64_t v60 = v103;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v60, v45, 1, v23);
  swift_bridgeObjectRelease();
  sub_100007320((uint64_t)v108);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v60, 1, v23) != 1)
  {
    uint64_t v63 = v60;
    goto LABEL_38;
  }
  sub_10000649C(v60, &qword_10000C128);
  sub_100007470();
  unint64_t v64 = v105;
  swift_bridgeObjectRetain_n();
  v65 = sub_100007480();
  os_log_type_t v66 = sub_1000074B0();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc();
    v108[0] = swift_slowAlloc();
    *(_DWORD *)v67 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v107 = sub_100006BC0(v106, v64, v108);
    sub_1000074D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Couldn't locate existing authorization record for app with bundle identifier “%{public}s”.", v67, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v89 + 8))(v18, v90);
LABEL_40:
  uint64_t v83 = v92;
  uint64_t v82 = v93;
  v84 = v91;
  (*(void (**)(char *, void, uint64_t))(v92 + 104))(v91, enum case for OverrideSettingsResponse.approved(_:), v93);
  a5(v84);
  return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v84, v82);
}

void *sub_100006458(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000649C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000053CC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000064F8(uint64_t a1, char a2, uint64_t a3, unint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v35 = a3;
  uint64_t v11 = sub_100007460();
  uint64_t v12 = *(void *)(v11 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100007490();
  uint64_t v38 = *(void *)(v15 - 8);
  uint64_t v39 = v15;
  uint64_t v16 = ((uint64_t (*)(void))__chkstk_darwin)();
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v32 - v19;
  if (a2)
  {
    uint64_t v36 = a6;
    swift_errorRetain();
    sub_100007470();
    swift_bridgeObjectRetain();
    sub_100007308(a1, 1);
    swift_bridgeObjectRetain();
    sub_100007308(a1, 1);
    uint64_t v25 = sub_100007480();
    os_log_type_t v26 = sub_1000074B0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v34 = v11;
      uint64_t v28 = v27;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v41 = v33;
      *(_DWORD *)uint64_t v28 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_100006BC0(v35, a4, &v41);
      uint64_t v37 = a5;
      sub_1000074D0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v29 = sub_100007540();
      uint64_t v40 = sub_100006BC0(v29, v30, &v41);
      a5 = v37;
      sub_1000074D0();
      swift_bridgeObjectRelease();
      sub_100007314(a1, 1);
      sub_100007314(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unable to revoke authorization for app with bundle identifier “%{public}s”. Error: %{public}s", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v11 = v34;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_100007314(a1, 1);
      sub_100007314(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v39);
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for OverrideSettingsResponse.denied(_:), v11);
    a5(v14);
    sub_100007314(a1, 1);
  }
  else
  {
    uint64_t v37 = a5;
    sub_100007470();
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_100007480();
    os_log_type_t v22 = sub_1000074C0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v36 = a6;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v34 = v11;
      uint64_t v24 = (uint8_t *)v23;
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_100006BC0(v35, a4, &v41);
      sub_1000074D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Successfully revoked authorization for app with bundle identifier “%{public}s”.", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v11 = v34;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for OverrideSettingsResponse.approved(_:), v11);
    v37(v14);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

id sub_100006A48()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_100006A7C()
{
  id v1 = &v0[qword_10000C118];
  uint64_t v2 = (objc_class *)type metadata accessor for FamilyControlsOverrideSettingsHandler();
  *(_OWORD *)id v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((void *)v1 + 4) = 0;
  v4.receiver = v0;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, "init");
}

id sub_100006AD4(char *a1)
{
  uint64_t v2 = &a1[qword_10000C118];
  uint64_t v3 = (objc_class *)type metadata accessor for FamilyControlsOverrideSettingsHandler();
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  v5.receiver = a1;
  v5.super_class = v3;
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t sub_100006B30()
{
  return sub_10000649C(v0 + qword_10000C118, &qword_10000C120);
}

id sub_100006B5C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FamilyControlsOverrideSettingsHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100006B94(uint64_t a1)
{
  return sub_10000649C(a1 + qword_10000C118, &qword_10000C120);
}

uint64_t sub_100006BC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006C94(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007370((uint64_t)v12, *a3);
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
      sub_100007370((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007320((uint64_t)v12);
  return v7;
}

uint64_t sub_100006C94(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000074E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006E50(a5, a6);
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
  uint64_t v8 = sub_100007500();
  if (!v8)
  {
    sub_100007510();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007520();
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

uint64_t sub_100006E50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006EE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000070C8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000070C8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006EE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007060(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000074F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007510();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000074A0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007520();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007510();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007060(uint64_t a1, uint64_t a2)
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
  sub_1000053CC(&qword_10000C170);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000070C8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000053CC(&qword_10000C170);
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
  uint64_t result = sub_100007520();
  __break(1u);
  return result;
}

uint64_t sub_100007218()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100007258(uint64_t a1, char a2)
{
  return sub_1000064F8(a1, a2 & 1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(void))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t type metadata accessor for FamilyControlsOverrideSettingsHandler()
{
  uint64_t result = qword_10000C190;
  if (!qword_10000C190) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000072B4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100007300()
{
  return type metadata accessor for FamilyControlsOverrideSettingsHandler();
}

uint64_t sub_100007308(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_100007314(uint64_t a1, char a2)
{
  if (a2) {
    return _swift_errorRelease();
  }
  return result;
}

uint64_t sub_100007320(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007370(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000073D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000073E0()
{
  return AuthorizationCenter.revokeAuthorizationForDeletion(recordIdentifier:completionHandler:)();
}

uint64_t sub_1000073F0()
{
  return AuthorizationCenter.authorizationRecords.getter();
}

uint64_t sub_100007400()
{
  return static AuthorizationCenter.shared.getter();
}

uint64_t sub_100007410()
{
  return type metadata accessor for AuthorizationCenter();
}

uint64_t sub_100007420()
{
  return AuthorizationRecord.teamIdentifier.getter();
}

uint64_t sub_100007430()
{
  return AuthorizationRecord.bundleIdentifier.getter();
}

uint64_t sub_100007440()
{
  return AuthorizationRecord.recordIdentifier.getter();
}

uint64_t sub_100007450()
{
  return type metadata accessor for AuthorizationRecord();
}

uint64_t sub_100007460()
{
  return type metadata accessor for OverrideSettingsResponse();
}

uint64_t sub_100007470()
{
  return static Logger.overrideSettings.getter();
}

uint64_t sub_100007480()
{
  return Logger.logObject.getter();
}

uint64_t sub_100007490()
{
  return type metadata accessor for Logger();
}

Swift::Int sub_1000074A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000074B0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000074C0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000074D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000074E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000074F0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100007500()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007510()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007520()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100007530()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100007540()
{
  return Error.localizedDescription.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
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