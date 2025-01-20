char *sub_100004AD0(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t (*v14)(int, int);
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t (*v18)(int, int);
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  v2 = (id *)(swift_bridgeObjectRetain() + 40);
  v3 = (char *)&_swiftEmptyArrayStorage;
  while (2)
  {
    v4 = (uint64_t)*(v2 - 1);
    v5 = *v2;
    LODWORD(v29) = [v5 errorCode];
    v6 = sub_100011580();
    v27 = v7;
    v28 = v6;
    v8 = [v5 trialIdentifiers];
    if (v8
      && (v9 = v8, v10 = [v8 bmltIdentifiers], v9, v10)
      && (v11 = [v10 trialTaskID], v10, v11))
    {
      v25 = sub_100011310();
      v26 = v12;
    }
    else
    {
      v25 = 7104878;
      v26 = 0xE300000000000000;
    }
    v13 = [v5 count];
    v14 = sub_10001021C;
    switch([v5 aggregateFunction])
    {
      case 0u:
        if (qword_1000188F0 != -1) {
          swift_once();
        }
        v15 = sub_100011290();
        v16 = sub_100011460();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = swift_slowAlloc();
          v29 = swift_slowAlloc();
          *(_DWORD *)v17 = 136446210;
          *(void *)(v17 + 4) = sub_1000073F8(0xD00000000000002CLL, 0x8000000100012540, &v29);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "%{public}s", (uint8_t *)v17, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        goto LABEL_13;
      case 1u:
        goto LABEL_22;
      case 2u:
        v18 = (uint64_t (*)(int, int))sub_10001022C;
        goto LABEL_21;
      case 3u:
        v18 = (uint64_t (*)(int, int))sub_100010238;
        goto LABEL_21;
      default:
        if (qword_1000188F0 != -1) {
          swift_once();
        }
        v15 = sub_100011290();
        v19 = sub_100011460();
        if (os_log_type_enabled(v15, v19))
        {
          v20 = swift_slowAlloc();
          v29 = swift_slowAlloc();
          *(_DWORD *)v20 = 136446210;
          *(void *)(v20 + 4) = sub_1000073F8(0xD00000000000002CLL, 0x8000000100012540, &v29);
          _os_log_impl((void *)&_mh_execute_header, v15, v19, "%{public}s", (uint8_t *)v20, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
LABEL_13:

        v18 = sub_100010C94;
LABEL_21:
        v14 = v18;
LABEL_22:

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v3 = sub_1000071D8(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        v22 = *((void *)v3 + 2);
        v21 = *((void *)v3 + 3);
        if (v22 >= v21 >> 1) {
          v3 = sub_1000071D8((char *)(v21 > 1), v22 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v22 + 1;
        v23 = &v3[64 * v22];
        *((void *)v23 + 4) = v4;
        *((void *)v23 + 5) = v28;
        *((void *)v23 + 6) = v27;
        *((void *)v23 + 7) = v25;
        *((void *)v23 + 8) = v26;
        *((_DWORD *)v23 + 18) = v13;
        v2 += 2;
        *((void *)v23 + 10) = v14;
        *((void *)v23 + 11) = 0;
        if (--v1) {
          continue;
        }
        swift_bridgeObjectRelease();
        break;
    }
    return v3;
  }
}

void *sub_100004FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return &_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  v7 = &_swiftEmptyDictionarySingleton;
  v8 = (double *)(a2 + 40);
  uint64_t v40 = v2;
  v41 = (double *)(a2 + 40);
  uint64_t v42 = v5;
  while (1)
  {
    if (!v4) {
      goto LABEL_5;
    }
    uint64_t v11 = v5 + (v6 << 6);
    double v12 = *(double *)v11;
    uint64_t v13 = *(void *)(v11 + 8);
    uint64_t v14 = *(void *)(v11 + 16);
    uint64_t v16 = *(void *)(v11 + 24);
    uint64_t v15 = *(void *)(v11 + 32);
    v17 = v8;
    uint64_t v18 = v4;
    while (1)
    {
      double v20 = *(v17 - 1);
      double v19 = *v17;
      if (v20 <= v12 && v12 < v19) {
        break;
      }
      v17 += 2;
      if (!--v18) {
        goto LABEL_5;
      }
    }
    int v44 = *(_DWORD *)(v11 + 40);
    long long v43 = *(_OWORD *)(v11 + 48);
    if (v7[2])
    {
      sub_100007B44(v20, v19);
      if (v22) {
        break;
      }
    }
    sub_10000ABC8(&qword_100018A50);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100011B60;
    *(void *)(v9 + 32) = v13;
    *(void *)(v9 + 40) = v14;
    *(void *)(v9 + 48) = v16;
    *(void *)(v9 + 56) = v15;
    *(_DWORD *)(v9 + 64) = v44;
    *(_OWORD *)(v9 + 72) = v43;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v45 = v7;
    sub_100008B70(v9, isUniquelyReferenced_nonNull_native, &qword_100018A68, v20, v19);
    v7 = v45;
    swift_bridgeObjectRelease();
LABEL_4:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = v41;
    uint64_t v5 = v42;
LABEL_5:
    if (++v6 == v2) {
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain();
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  v45 = v7;
  unint64_t v25 = sub_100007B44(v20, v19);
  uint64_t v26 = v7[2];
  BOOL v27 = (v24 & 1) == 0;
  uint64_t v28 = v26 + v27;
  if (!__OFADD__(v26, v27))
  {
    char v29 = v24;
    if (v7[3] >= v28)
    {
      if (v23)
      {
        if ((v24 & 1) == 0) {
          goto LABEL_29;
        }
      }
      else
      {
        v7 = &v45;
        sub_100009188(&qword_100018A68);
        if ((v29 & 1) == 0) {
          goto LABEL_29;
        }
      }
    }
    else
    {
      sub_1000081F0(v28, v23, &qword_100018A68);
      v7 = v45;
      unint64_t v30 = sub_100007B44(v20, v19);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_34;
      }
      unint64_t v25 = v30;
      if ((v29 & 1) == 0)
      {
LABEL_29:
        __break(1u);
LABEL_30:
        swift_bridgeObjectRelease();
        return v7;
      }
    }
    v32 = *(char **)(v45[7] + 8 * v25);
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v32 = sub_1000070AC(0, *((void *)v32 + 2) + 1, 1, v32);
    }
    unint64_t v34 = *((void *)v32 + 2);
    unint64_t v33 = *((void *)v32 + 3);
    int v35 = v44;
    long long v36 = v43;
    if (v34 >= v33 >> 1)
    {
      v38 = sub_1000070AC((char *)(v33 > 1), v34 + 1, 1, v32);
      long long v36 = v43;
      int v35 = v44;
      v32 = v38;
    }
    *((void *)v32 + 2) = v34 + 1;
    v37 = &v32[56 * v34];
    *((void *)v37 + 4) = v13;
    *((void *)v37 + 5) = v14;
    *((void *)v37 + 6) = v16;
    *((void *)v37 + 7) = v15;
    *((_DWORD *)v37 + 16) = v35;
    *(_OWORD *)(v37 + 72) = v36;
    v7 = v45;
    *(void *)(v45[7] + 8 * v25) = v32;
    uint64_t v2 = v40;
    goto LABEL_4;
  }
  __break(1u);
LABEL_34:
  sub_10000ABC8(&qword_1000189F8);
  result = (void *)sub_1000115A0();
  __break(1u);
  return result;
}

uint64_t sub_10000533C(unint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_100009BD8(v4, a1);
  uint64_t v82 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v6 = 0;
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v76 = v5 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v77 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = &_swiftEmptyDictionarySingleton;
  long long v75 = xmmword_100011B60;
  uint64_t v74 = v5;
  while (1)
  {
    v83 = v11;
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      uint64_t v16 = (v10 - 1) & v10;
      unint64_t v17 = v15 | (v6 << 6);
    }
    else
    {
      if (__OFADD__(v6++, 1)) {
        goto LABEL_53;
      }
      if (v6 >= v77)
      {
LABEL_48:
        swift_release();
        return (uint64_t)v11;
      }
      unint64_t v19 = *(void *)(v76 + 8 * v6);
      if (!v19)
      {
        int64_t v20 = v6 + 1;
        if (v6 + 1 >= v77) {
          goto LABEL_48;
        }
        unint64_t v19 = *(void *)(v76 + 8 * v20);
        if (!v19)
        {
          int64_t v20 = v6 + 2;
          if (v6 + 2 >= v77) {
            goto LABEL_48;
          }
          unint64_t v19 = *(void *)(v76 + 8 * v20);
          if (!v19)
          {
            int64_t v20 = v6 + 3;
            if (v6 + 3 >= v77) {
              goto LABEL_48;
            }
            unint64_t v19 = *(void *)(v76 + 8 * v20);
            if (!v19)
            {
              while (1)
              {
                int64_t v6 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_55;
                }
                if (v6 >= v77) {
                  goto LABEL_48;
                }
                unint64_t v19 = *(void *)(v76 + 8 * v6);
                ++v20;
                if (v19) {
                  goto LABEL_19;
                }
              }
            }
          }
        }
        int64_t v6 = v20;
      }
LABEL_19:
      uint64_t v16 = (v19 - 1) & v19;
      unint64_t v17 = __clz(__rbit64(v19)) + (v6 << 6);
    }
    uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
    unint64_t v22 = *(void *)(v21 + 16);
    if (!v22) {
      goto LABEL_47;
    }
    char v23 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = v23[1];
    uint64_t v80 = *v23;
    unint64_t v25 = *(void *)(v21 + 40);
    uint64_t v26 = *(void *)(v21 + 48);
    uint64_t v27 = *(void *)(v21 + 56);
    uint64_t v28 = *(unsigned int *)(v21 + 64);
    uint64_t v29 = *(void *)(v21 + 72);
    uint64_t v30 = *(void *)(v21 + 80);
    uint64_t v87 = *(void *)(v21 + 32);
    unint64_t v88 = v25;
    uint64_t v89 = v26;
    uint64_t v90 = v27;
    uint64_t v91 = v28;
    uint64_t v92 = v29;
    uint64_t v93 = v30;
    uint64_t v81 = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_getAtKeyPath();
    uint64_t v31 = v86;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v32 = *(void *)(v21 + 16);
    if (!v32) {
      break;
    }
    unint64_t v78 = v16;
    int64_t v79 = v6;
    unint64_t v33 = *(uint64_t (**)(uint64_t, void))(v21 + 72);
    uint64_t v34 = swift_retain();
    if (v32 < v22) {
      goto LABEL_51;
    }
    uint64_t v84 = v34;
    unint64_t v35 = v22 - 1;
    if (v35)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      long long v36 = (void *)(v21 + 136);
      uint64_t v37 = a2;
      do
      {
        uint64_t v38 = *(v36 - 1);
        uint64_t v39 = *v36;
        int v40 = *((_DWORD *)v36 - 4);
        uint64_t v41 = *(v36 - 4);
        uint64_t v42 = *(v36 - 3);
        unint64_t v43 = *(v36 - 5);
        uint64_t v87 = *(v36 - 6);
        unint64_t v88 = v43;
        uint64_t v89 = v41;
        uint64_t v90 = v42;
        LODWORD(v91) = v40;
        uint64_t v92 = v38;
        uint64_t v93 = v39;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_getAtKeyPath();
        uint64_t v31 = v33(v31, v86);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v36 += 7;
        --v35;
      }
      while (v35);
      swift_release();
      swift_bridgeObjectRelease();
      a2 = v37;
      uint64_t v5 = v74;
    }
    uint64_t v44 = swift_bridgeObjectRelease();
    uint64_t v87 = 58;
    unint64_t v88 = 0xE100000000000000;
    __chkstk_darwin(v44);
    v73[2] = &v87;
    unint64_t v45 = v81;
    swift_bridgeObjectRetain();
    uint64_t v46 = v82;
    uint64_t v47 = sub_10000688C(0x7FFFFFFFFFFFFFFFLL, 1, sub_10000ACC0, (uint64_t)v73, v80, v45);
    swift_bridgeObjectRelease();
    if (!*(void *)(v47 + 16)) {
      goto LABEL_52;
    }
    uint64_t v82 = v46;
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_100011320();
    uint64_t v49 = v48;
    swift_bridgeObjectRelease();
    unint64_t v50 = *(void *)(v47 + 16);
    if (v50 <= 1) {
      uint64_t v51 = 1;
    }
    else {
      uint64_t v51 = 2 * v50 - 1;
    }
    uint64_t v87 = v47;
    unint64_t v88 = v47 + 32;
    uint64_t v89 = 0;
    uint64_t v90 = v51;
    sub_10000ABC8(&qword_100018A08);
    sub_10000AE20(&qword_100018A10, &qword_100018A08);
    sub_10000AD60();
    uint64_t v52 = sub_100011400();
    unint64_t v54 = v53;
    swift_bridgeObjectRelease();
    uint64_t v87 = v52;
    unint64_t v88 = v54;
    uint64_t v55 = sub_1000113E0();
    uint64_t v57 = v56;
    uint64_t v58 = (uint64_t)v83;
    if (!v83[2]) {
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    sub_100007ACC(v55, v57);
    if ((v59 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_5:
      sub_10000ABC8(&qword_100018A20);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v75;
      *(void *)(inited + 32) = v81;
      *(void *)(inited + 40) = v49;
      *(_DWORD *)(inited + 48) = v31;
      unint64_t v13 = sub_10000C090(inited);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v87 = v58;
      sub_1000089F8(v13, v55, v57, isUniquelyReferenced_nonNull_native);
      uint64_t v11 = (void *)v87;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    uint64_t v60 = a2;
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v87 = v58;
    swift_bridgeObjectRetain();
    unint64_t v63 = sub_100007ACC(v55, v57);
    uint64_t v64 = *(void *)(v58 + 16);
    BOOL v65 = (v62 & 1) == 0;
    uint64_t v66 = v64 + v65;
    if (__OFADD__(v64, v65)) {
      goto LABEL_54;
    }
    char v67 = v62;
    if (*(void *)(v58 + 24) >= v66)
    {
      if (v61)
      {
        if ((v62 & 1) == 0) {
          goto LABEL_46;
        }
      }
      else
      {
        sub_100008FD0();
        if ((v67 & 1) == 0) {
          goto LABEL_46;
        }
      }
    }
    else
    {
      sub_100007EDC(v66, v61, &qword_100018A28);
      unint64_t v68 = sub_100007ACC(v55, v57);
      if ((v67 & 1) != (v69 & 1)) {
        goto LABEL_56;
      }
      unint64_t v63 = v68;
      if ((v67 & 1) == 0)
      {
LABEL_46:
        swift_release();
        __break(1u);
LABEL_47:
        swift_release();
        swift_bridgeObjectRelease();
        return 0;
      }
    }
    uint64_t v70 = *(void *)(*(void *)(v87 + 56) + 8 * v63);
    char v71 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v85 = v70;
    uint64_t v86 = 0x8000000000000000;
    sub_100008894(v31, v81, v49, v71);
    uint64_t v86 = v85;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100009328(&v86, 1, &v87, v63, v55, v57);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v11 = (void *)v87;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    a2 = v60;
LABEL_6:
    int64_t v6 = v79;
    unint64_t v10 = v78;
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  swift_release();
  uint64_t result = sub_1000115A0();
  __break(1u);
  return result;
}

unint64_t sub_100005A94(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = v3;
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_100008B70(a1, isUniquelyReferenced_nonNull_native, &qword_100018A00, a2, a3);
    uint64_t *v3 = v14;
  }
  else
  {
    unint64_t result = sub_100007B44(a2, a3);
    if ((v10 & 1) == 0) {
      return result;
    }
    unint64_t v11 = result;
    int v12 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t v15 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!v12)
    {
      sub_100009188(&qword_100018A00);
      uint64_t v13 = v15;
    }
    sub_1000084E8(v11, v13);
    *uint64_t v4 = v13;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005B9C()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_100005BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_10000B0E4;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100005C84()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000189D0 + dword_1000189D0);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100005D28;
  return v3();
}

uint64_t sub_100005D28(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100005E24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_100005F08;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100005F08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005FFC()
{
  uint64_t v0 = type metadata accessor for TelemetryAggregator();
  uint64_t v1 = sub_100006200(&qword_1000189C8);

  return MLHostExtension.configuration.getter(v0, v1);
}

void *sub_100006068@<X0>(void *a1@<X8>)
{
  type metadata accessor for TelemetryAggregator();
  unint64_t result = (void *)swift_allocObject();
  result[2] = 0xD000000000000017;
  result[3] = 0x8000000100012210;
  result[4] = 7;
  *a1 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for TelemetryAggregator()
{
  return self;
}

uint64_t sub_10000615C()
{
  return sub_100006200(&qword_1000188F8);
}

uint64_t sub_100006190()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_100006200(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TelemetryAggregator();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100006240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_100011170();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_100011130().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_100011130().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

void sub_1000063C4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100011170();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 eventBody];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (char **)(a2 + 16);
    [a1 timestamp];
    sub_100011120();
    sub_100011150();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_beginAccess();
    Class v13 = *v10;
    id v14 = v9;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v10 = v13;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      Class v13 = sub_1000072E8(0, *((void *)v13 + 2) + 1, 1, v13);
      *uint64_t v10 = v13;
    }
    unint64_t v17 = *((void *)v13 + 2);
    unint64_t v16 = *((void *)v13 + 3);
    if (v17 >= v16 >> 1)
    {
      Class v13 = sub_1000072E8((char *)(v16 > 1), v17 + 1, 1, v13);
      *uint64_t v10 = v13;
    }
    *((void *)v13 + 2) = v17 + 1;
    uint64_t v18 = &v13[16 * v17];
    *((void *)v18 + 4) = v12;
    *((void *)v18 + 5) = v14;
    swift_endAccess();
  }
  else
  {
    if (qword_1000188F0 != -1) {
      swift_once();
    }
    uint64_t v24 = 0;
    unint64_t v25 = 0xE000000000000000;
    sub_1000114C0(17);
    swift_bridgeObjectRelease();
    uint64_t v24 = 0x2064696C61766E49;
    unint64_t v25 = 0xEF203A746E657665;
    id v19 = [a1 description];
    uint64_t v20 = sub_100011310();
    unint64_t v22 = v21;

    v27._countAndFlagsBits = v20;
    v27._object = v22;
    sub_100011360(v27);
    swift_bridgeObjectRelease();
    sub_100010CB4(v24, v25);
    swift_bridgeObjectRelease();
  }
}

void sub_10000667C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000066E4(void (*a1)(void *__return_ptr, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (a3 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v6) {
      return (uint64_t)v7;
    }
    uint64_t v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t result = sub_100009400(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      break;
    }
    uint64_t v9 = 0;
    uint64_t v7 = v21;
    while (v6 != v9)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v10 = sub_1000114E0();
      }
      else
      {
        uint64_t v10 = *(void *)(a3 + 8 * v9 + 32);
        swift_retain();
      }
      uint64_t v19 = v10;
      a1(v20, &v19);
      if (v4)
      {
        swift_release();
        swift_release();
        return (uint64_t)v7;
      }
      uint64_t v11 = v6;
      swift_release();
      unint64_t v13 = v20[0];
      unint64_t v12 = v20[1];
      uint64_t v21 = v7;
      unint64_t v15 = v7[2];
      unint64_t v14 = v7[3];
      if (v15 >= v14 >> 1)
      {
        sub_100009400(v14 > 1, v15 + 1, 1);
        uint64_t v7 = v21;
      }
      ++v9;
      v7[2] = v15 + 1;
      unint64_t v16 = &v7[2 * v15];
      v16[4] = v13;
      v16[5] = v12;
      uint64_t v6 = v11;
      BOOL v17 = v11 == v9;
      uint64_t v4 = 0;
      if (v17) {
        return (uint64_t)v7;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100011520();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000688C(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_100006D30(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    unint64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  unint64_t v13 = (char *)&_swiftEmptyArrayStorage;
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_1000113D0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_100011350();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_100011350();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_1000113F0();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v13 = sub_100006F9C(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v27 = *((void *)v13 + 2);
  unint64_t v26 = *((void *)v13 + 3);
  if (v27 >= v26 >> 1) {
    unint64_t v13 = sub_100006F9C((char *)(v26 > 1), v27 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v27 + 1;
  uint64_t v28 = &v13[32 * v27];
  *((void *)v28 + 4) = v45;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_100011350();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (*((void *)v13 + 2) != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_1000113F0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v13 = sub_100006F9C(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v39 = *((void *)v13 + 2);
    unint64_t v38 = *((void *)v13 + 3);
    if (v39 >= v38 >> 1) {
      unint64_t v13 = sub_100006F9C((char *)(v38 > 1), v39 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v39 + 1;
    int v40 = &v13[32 * v39];
    *((void *)v40 + 4) = v31;
    *((void *)v40 + 5) = v33;
    *((void *)v40 + 6) = v35;
    *((void *)v40 + 7) = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_100011510();
  __break(1u);
LABEL_42:
  uint64_t result = sub_100011510();
  __break(1u);
  return result;
}

uint64_t sub_100006D30(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1000113F0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    unint64_t v14 = *(char **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v14 = sub_100006F9C(0, *((void *)v14 + 2) + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = *((void *)v14 + 2);
    unint64_t v16 = *((void *)v14 + 3);
    if (v17 >= v16 >> 1)
    {
      unint64_t v14 = sub_100006F9C((char *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    *((void *)v14 + 2) = v17 + 1;
    char v18 = &v14[32 * v17];
    *((void *)v18 + 4) = v7;
    *((void *)v18 + 5) = v9;
    *((void *)v18 + 6) = v11;
    *((void *)v18 + 7) = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_100011510();
  __break(1u);
  return result;
}

char *sub_100006E8C(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABC8((uint64_t *)&unk_100018B00);
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
    sub_1000099F4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100006F9C(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABC8(&qword_100018A38);
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
    sub_100009F30(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000070AC(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABC8(&qword_100018A50);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[56 * v8 + 32]) {
          memmove(v12, a4 + 32, 56 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100009AE0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000071D8(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABC8(&qword_100018A78);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 31;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 6);
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
        if (v10 != a4 || v13 >= &a4[64 * v8 + 32]) {
          memmove(v13, a4 + 32, v8 << 6);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_1000098E8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000072E8(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000ABC8(&qword_100018AF0);
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
    sub_10000AFD8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000073F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000074CC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AEB4((uint64_t)v12, *a3);
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
      sub_10000AEB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AE64((uint64_t)v12);
  return v7;
}

uint64_t sub_1000074CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100011480();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007688(a5, a6);
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
  uint64_t v8 = sub_1000114F0();
  if (!v8)
  {
    sub_100011510();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100011560();
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

uint64_t sub_100007688(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007720(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000797C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000797C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007720(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007898(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000114D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100011510();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100011370();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100011560();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100011510();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007898(uint64_t a1, uint64_t a2)
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
  sub_10000ABC8(&qword_100018A70);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007900(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000113C0();
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
    uint64_t v5 = sub_100011390();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10000797C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000ABC8(&qword_100018A70);
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
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

unint64_t sub_100007ACC(uint64_t a1, uint64_t a2)
{
  sub_1000115F0();
  sub_100011340();
  Swift::Int v4 = sub_100011610();

  return sub_100008CC8(a1, a2, v4);
}

unint64_t sub_100007B44(double a1, double a2)
{
  sub_1000115F0();
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = *(void *)&a1;
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_100011600(v4);
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v5 = *(void *)&a2;
  }
  else {
    Swift::UInt64 v5 = 0;
  }
  sub_100011600(v5);
  Swift::Int v6 = sub_100011610();

  return sub_100008DAC(v6, a1, a2);
}

uint64_t sub_100007BD0(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_10000ABC8(&qword_100018A30);
  char v37 = a2;
  uint64_t v6 = sub_100011540();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          char v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1000115F0();
    sub_100011340();
    uint64_t result = sub_100011610();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
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
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_100007EDC(uint64_t a1, char a2, uint64_t *a3)
{
  Swift::UInt64 v4 = v3;
  uint64_t v6 = *v3;
  sub_10000ABC8(a3);
  char v37 = a2;
  uint64_t v7 = sub_100011540();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1000115F0();
    sub_100011340();
    uint64_t result = sub_100011610();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::UInt64 v4 = v8;
  return result;
}

uint64_t sub_1000081F0(uint64_t a1, char a2, uint64_t *a3)
{
  Swift::UInt64 v4 = v3;
  uint64_t v6 = *v3;
  sub_10000ABC8(a3);
  uint64_t result = sub_100011540();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    int64_t v9 = 0;
    uint64_t v33 = (void *)(v6 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v6 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v6 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v23 = v22 | (v9 << 6);
      }
      else
      {
        int64_t v24 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
          return result;
        }
        uint64_t result = v6 + 64;
        if (v24 >= v13) {
          goto LABEL_39;
        }
        unint64_t v25 = v33[v24];
        ++v9;
        if (!v25)
        {
          int64_t v9 = v24 + 1;
          if (v24 + 1 >= v13) {
            goto LABEL_39;
          }
          unint64_t v25 = v33[v9];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v13)
            {
LABEL_39:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                Swift::UInt64 v4 = v3;
                goto LABEL_46;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v6 + 32);
              if (v32 >= 64) {
                bzero(v33, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v33 = -1 << v32;
              }
              Swift::UInt64 v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v25 = v33[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v9 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_48;
                }
                if (v9 >= v13) {
                  goto LABEL_39;
                }
                unint64_t v25 = v33[v9];
                ++v26;
                if (v25) {
                  goto LABEL_36;
                }
              }
            }
            int64_t v9 = v26;
          }
        }
LABEL_36:
        unint64_t v12 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v9 << 6);
      }
      long long v34 = *(_OWORD *)(*(void *)(v6 + 48) + 16 * v23);
      uint64_t v31 = *(void *)(*(void *)(v6 + 56) + 8 * v23);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_1000115F0();
      if ((v34 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v15 = v34;
      }
      else {
        Swift::UInt64 v15 = 0;
      }
      sub_100011600(v15);
      if ((*((void *)&v34 + 1) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        Swift::UInt64 v16 = *((void *)&v34 + 1);
      }
      else {
        Swift::UInt64 v16 = 0;
      }
      sub_100011600(v16);
      uint64_t result = sub_100011610();
      uint64_t v17 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1 << v18) & ~*(void *)(v14 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v14 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
        long long v21 = v34;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v17) >> 6;
        long long v21 = v34;
        do
        {
          if (++v19 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_47;
          }
          BOOL v29 = v19 == v28;
          if (v19 == v28) {
            unint64_t v19 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v14 + 8 * v19);
        }
        while (v30 == -1);
        unint64_t v20 = __clz(__rbit64(~v30)) + (v19 << 6);
      }
      *(void *)(v14 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      *(_OWORD *)(*(void *)(v8 + 48) + 16 * v20) = v21;
      *(void *)(*(void *)(v8 + 56) + 8 * v20) = v31;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_46:
  *Swift::UInt64 v4 = v8;
  return result;
}

unint64_t sub_1000084E8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100011490();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        int64_t v9 = (Swift::UInt64 *)(*(void *)(a2 + 48) + 16 * v6);
        Swift::UInt64 v10 = *v9;
        Swift::UInt64 v11 = v9[1];
        sub_1000115F0();
        if ((v10 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
          Swift::UInt64 v12 = v10;
        }
        else {
          Swift::UInt64 v12 = 0;
        }
        sub_100011600(v12);
        if ((v11 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
          Swift::UInt64 v13 = v11;
        }
        else {
          Swift::UInt64 v13 = 0;
        }
        sub_100011600(v13);
        uint64_t result = sub_100011610();
        unint64_t v14 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8) {
            goto LABEL_5;
          }
        }
        else if (v14 >= v8)
        {
          goto LABEL_17;
        }
        if (v3 >= (uint64_t)v14)
        {
LABEL_17:
          uint64_t v15 = *(void *)(a2 + 48);
          Swift::UInt64 v16 = (_OWORD *)(v15 + 16 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 16 * v6);
          if (v3 != v6 || v16 >= v17 + 1) {
            *Swift::UInt64 v16 = *v17;
          }
          uint64_t v18 = *(void *)(a2 + 56);
          unint64_t v19 = (void *)(v18 + 8 * v3);
          unint64_t v20 = (void *)(v18 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
          {
            *unint64_t v19 = *v20;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    long long v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    long long v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *long long v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1000086BC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_100011490();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1000115F0();
        swift_bridgeObjectRetain();
        sub_100011340();
        Swift::Int v9 = sub_100011610();
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
          Swift::UInt64 v12 = (_OWORD *)(v11 + 16 * v3);
          Swift::UInt64 v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *Swift::UInt64 v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          Swift::UInt64 v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
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

uint64_t sub_100008894(int a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007ACC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100008E20();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(_DWORD *)(v18[7] + 4 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100007BD0(result, a4 & 1);
  uint64_t result = sub_100007ACC(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_1000115A0();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a2;
  v20[1] = a3;
  *(_DWORD *)(v18[7] + 4 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000089F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007ACC(a2, a3);
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
    sub_100008FD0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100007EDC(v15, a4 & 1, &qword_100018A28);
  unint64_t v21 = sub_100007ACC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1000115A0();
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
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
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

uint64_t sub_100008B70(uint64_t a1, char a2, uint64_t *a3, double a4, double a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100007B44(a4, a5);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100009188(a3);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    uint64_t v23 = (double *)(v20[6] + 16 * v14);
    *uint64_t v23 = a4;
    v23[1] = a5;
    *(void *)(v20[7] + 8 * v14) = a1;
    uint64_t v24 = v20[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      void v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_1000081F0(result, a2 & 1, a3);
  uint64_t result = sub_100007B44(a4, a5);
  if ((v18 & 1) == (v22 & 1))
  {
    unint64_t v14 = result;
    uint64_t v20 = (void *)*v7;
    if (v18) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_10000ABC8(&qword_1000189F8);
  uint64_t result = sub_1000115A0();
  __break(1u);
  return result;
}

unint64_t sub_100008CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100011590() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100011590() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100008DAC(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a1 & ~v4;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      uint64_t v7 = (double *)(*(void *)(v3 + 48) + 16 * result);
      double v8 = v7[1];
      BOOL v9 = *v7 == a2;
      if (v8 == a3 && v9) {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_100008E20()
{
  uint64_t v1 = v0;
  sub_10000ABC8(&qword_100018A30);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100011530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_100008FD0()
{
  uint64_t v1 = v0;
  sub_10000ABC8(&qword_100018A28);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100011530();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_100009188(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000ABC8(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_100011530();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  unint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    unint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
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
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v14) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v7 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v3 + 56) + v18);
    *(_OWORD *)(*(void *)(v5 + 48) + v17) = *(_OWORD *)(*(void *)(v3 + 48) + v17);
    *(void *)(*(void *)(v5 + 56) + v18) = v19;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v7 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t *sub_100009328(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = *result;
  if (*result)
  {
    int64_t v9 = (void *)*a3;
    if (a2)
    {
      *(void *)(v9[7] + 8 * a4) = v8;
    }
    else
    {
      v9[(a4 >> 6) + 8] |= 1 << a4;
      int64_t v10 = (void *)(v9[6] + 16 * a4);
      *int64_t v10 = a5;
      v10[1] = a6;
      *(void *)(v9[7] + 8 * a4) = v8;
      uint64_t v11 = v9[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12)
      {
        __break(1u);
        return result;
      }
      v9[2] = v13;
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    sub_1000086BC(a4, *a3);
  }

  return (uint64_t *)swift_bridgeObjectRetain();
}

uint64_t sub_100009400(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009420(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100009420(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000ABC8(&qword_100018A60);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
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
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

uint64_t sub_10000958C@<X0>(void *a1@<X8>)
{
  swift_getAtKeyPath();
  sub_100011500();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return result;
}

uint64_t sub_10000963C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000ABC8(&qword_1000189D8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  int64_t v11 = (char *)&aBlock - v10;
  sub_10000AF10();
  sub_10000AF50(a2, (uint64_t)v11);
  sub_10000AF50(a3, (uint64_t)v9);
  id v12 = sub_100006240((uint64_t)v11, (uint64_t)v9, 0, 0, 0);
  NSString v13 = sub_100011300();
  id v14 = [a1 publisherWithUseCase:v13 options:v12];

  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &_swiftEmptyArrayStorage;
  BOOL v25 = (void (*)(void *))nullsub_1;
  uint64_t v26 = 0;
  aBlock = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  unint64_t v23 = sub_1000063C0;
  int64_t v24 = &unk_100014B50;
  unint64_t v16 = _Block_copy(&aBlock);
  BOOL v25 = sub_10000AFD0;
  uint64_t v26 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  unint64_t v23 = sub_1000063C0;
  int64_t v24 = &unk_100014B78;
  uint64_t v17 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v18 = [v14 sinkWithCompletion:v16 receiveInput:v17];

  _Block_release(v17);
  _Block_release(v16);

  swift_beginAccess();
  uint64_t v19 = *(void *)(v15 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v19;
}

uint64_t sub_1000098E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + (a1 << 6) + 32;
    unint64_t v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      sub_10000ABC8(&qword_100018A80);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

char *sub_1000099F4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100011560();
  __break(1u);
  return result;
}

uint64_t sub_100009AE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

uint64_t sub_100009BD8(uint64_t a1, unint64_t a2)
{
  unint64_t v38 = a2;
  uint64_t v2 = &_swiftEmptyDictionarySingleton;
  uint64_t v47 = &_swiftEmptyDictionarySingleton;
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (uint64_t)v2;
  }
  uint64_t v4 = (_OWORD *)(a1 + 72);
  long long v37 = xmmword_100011B60;
  while (1)
  {
    uint64_t v39 = v3;
    uint64_t v8 = *((void *)v4 - 5);
    uint64_t v9 = *((void *)v4 - 4);
    uint64_t v10 = *((void *)v4 - 3);
    uint64_t v11 = *((void *)v4 - 2);
    int v12 = *((_DWORD *)v4 - 2);
    long long v42 = *v4;
    v44[0] = v8;
    v44[1] = v9;
    uint64_t v40 = v10;
    v44[2] = v10;
    v44[3] = v11;
    int v41 = v12;
    int v45 = v12;
    long long v46 = v42;
    __chkstk_darwin();
    v35[2] = v44;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v43 = sub_1000066E4((void (*)(void *__return_ptr, uint64_t *))sub_10000AE00, (uint64_t)v35, v38);
    sub_10000ABC8(&qword_100018A40);
    sub_10000AE20(&qword_100018A48, &qword_100018A40);
    uint64_t v13 = sub_1000112E0();
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    unint64_t v17 = sub_100007ACC(v13, v15);
    uint64_t v18 = v2[2];
    BOOL v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      break;
    }
    char v21 = v16;
    if (v2[3] < v20)
    {
      sub_100007EDC(v20, 1, &qword_100018A58);
      uint64_t v2 = v47;
      unint64_t v22 = sub_100007ACC(v13, v15);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_19;
      }
      unint64_t v17 = v22;
    }
    if (v21)
    {
      swift_bridgeObjectRelease();
      uint64_t v24 = v2[7];
      BOOL v25 = *(char **)(v24 + 8 * v17);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v24 + 8 * v17) = v25;
      uint64_t v36 = v24;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        BOOL v25 = sub_1000070AC(0, *((void *)v25 + 2) + 1, 1, v25);
        *(void *)(v24 + 8 * v17) = v25;
      }
      unint64_t v28 = *((void *)v25 + 2);
      unint64_t v27 = *((void *)v25 + 3);
      if (v28 >= v27 >> 1)
      {
        BOOL v25 = sub_1000070AC((char *)(v27 > 1), v28 + 1, 1, v25);
        *(void *)(v36 + 8 * v17) = v25;
      }
      uint64_t v5 = v39;
      uint64_t v6 = v40;
      *((void *)v25 + 2) = v28 + 1;
      uint64_t v7 = &v25[56 * v28];
      *((void *)v7 + 4) = v8;
      *((void *)v7 + 5) = v9;
      *((void *)v7 + 6) = v6;
      *((void *)v7 + 7) = v11;
      *((_DWORD *)v7 + 16) = v41;
      *(_OWORD *)(v7 + 72) = v42;
    }
    else
    {
      sub_10000ABC8(&qword_100018A50);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = v37;
      *(void *)(v29 + 32) = v8;
      *(void *)(v29 + 40) = v9;
      *(void *)(v29 + 48) = v40;
      *(void *)(v29 + 56) = v11;
      *(_DWORD *)(v29 + 64) = v41;
      *(_OWORD *)(v29 + 72) = v42;
      v2[(v17 >> 6) + 8] |= 1 << v17;
      uint64_t v30 = (uint64_t *)(v2[6] + 16 * v17);
      *uint64_t v30 = v13;
      v30[1] = v15;
      *(void *)(v2[7] + 8 * v17) = v29;
      uint64_t v31 = v2[2];
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      if (v32) {
        goto LABEL_18;
      }
      v2[2] = v33;
      uint64_t v5 = v39;
    }
    uint64_t v4 = (_OWORD *)((char *)v4 + 56);
    uint64_t v3 = v5 - 1;
    if (!v3) {
      return (uint64_t)v2;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  swift_bridgeObjectRelease();
  uint64_t result = sub_1000115A0();
  __break(1u);
  return result;
}

uint64_t sub_100009F30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

uint64_t sub_10000A024()
{
  v1[28] = v0;
  uint64_t v2 = sub_100011170();
  v1[29] = v2;
  v1[30] = *(void *)(v2 - 8);
  v1[31] = swift_task_alloc();
  sub_10000ABC8(&qword_1000189D8);
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  return _swift_task_switch(sub_10000A124, 0, 0);
}

uint64_t sub_10000A124()
{
  id v1 = [(id)BiomeLibrary() Lighthouse];
  swift_unknownObjectRelease();
  id v2 = [v1 Ledger];
  swift_unknownObjectRelease();
  id v3 = [v2 DediscoPrivacyEvent];
  swift_unknownObjectRelease();
  sub_10000ABC8(&qword_1000189E0);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 16) = v3;
  *(void *)(inited + 24) = _swiftEmptyArrayStorage;
  uint64_t v5 = qword_1000188F0;
  id v6 = v3;
  if (v5 != -1) {
    goto LABEL_42;
  }
  while (1)
  {
    uint64_t v8 = v0[32];
    uint64_t v7 = v0[33];
    uint64_t v10 = v0[29];
    uint64_t v9 = v0[30];
    sub_100010C9C(0xD00000000000002FLL, 0x8000000100012250);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v11(v7, 1, 1, v10);
    v11(v8, 1, 1, v10);
    *(void *)(inited + 24) = sub_10000963C(v6, v7, v8);
    swift_bridgeObjectRelease();
    sub_10000AC0C(v8);
    sub_10000AC0C(v7);
    uint64_t v12 = *(void *)(inited + 24);
    if (!*(void *)(v12 + 16))
    {
      sub_100010C9C(0xD00000000000002CLL, 0x80000001000123E0);
      id v41 = objc_allocWithZone((Class)sub_100011250());
      uint64_t v42 = sub_100011240();
      swift_setDeallocating();

      swift_bridgeObjectRelease();
LABEL_36:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v54 = (uint64_t (*)(uint64_t))v0[1];
      return v54(v42);
    }
    uint64_t v57 = v6;
    uint64_t v13 = v0[30];
    uint64_t v14 = v0[31];
    uint64_t v58 = v0[29];
    swift_bridgeObjectRetain();
    sub_1000114C0(28);
    swift_bridgeObjectRelease();
    v0[27] = *(void *)(v12 + 16);
    v61._countAndFlagsBits = sub_100011580();
    sub_100011360(v61);
    swift_bridgeObjectRelease();
    v62._object = (void *)0x8000000100012280;
    v62._countAndFlagsBits = 0xD000000000000012;
    sub_100011360(v62);
    sub_100010C9C(0x2064656863746546, 0xE800000000000000);
    swift_bridgeObjectRelease();
    uint64_t v15 = sub_100004AD0(v12);
    swift_bridgeObjectRelease();
    id v16 = [self standardUserDefaults];
    NSString v17 = sub_100011300();
    [v16 doubleForKey:v17];

    sub_1000114C0(29);
    swift_bridgeObjectRelease();
    v63._countAndFlagsBits = sub_10000B31C();
    sub_100011360(v63);
    swift_bridgeObjectRelease();
    sub_100010C9C(0xD00000000000001BLL, 0x80000001000122A0);
    swift_bridgeObjectRelease();
    sub_100010C9C(0xD000000000000024, 0x80000001000122C0);
    sub_100011160();
    sub_100011150();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v58);
    type metadata accessor for BucketRangeCreator();
    uint64_t v18 = (double *)swift_initStackObject();
    sub_10000B598();
    *((void *)v18 + 2) = v19;
    sub_10000B598();
    *((void *)v18 + 3) = v20;
    uint64_t v21 = sub_10000BB00();
    *((void *)v18 + 4) = v21 & ~(v21 >> 63);
    if (v21 <= 0)
    {
      swift_bridgeObjectRelease();
      sub_1000114C0(70);
      v0[25] = 0;
      v0[26] = 0xE000000000000000;
      v64._countAndFlagsBits = 0xD000000000000026;
      v64._object = (void *)0x8000000100012390;
      sub_100011360(v64);
      sub_100011440();
      v65._countAndFlagsBits = 0x20646E6120;
      v65._object = (void *)0xE500000000000000;
      sub_100011360(v65);
      sub_100011440();
      v66._countAndFlagsBits = 0xD000000000000017;
      v66._object = (void *)0x80000001000123C0;
      sub_100011360(v66);
      sub_100010C9C(v0[25], v0[26]);
      swift_bridgeObjectRelease();
      sub_10000AC6C();
      id v43 = objc_allocWithZone((Class)sub_100011250());
      uint64_t v42 = sub_100011230();

      swift_release();
      swift_release();
      goto LABEL_36;
    }
    id v56 = v16;
    char v59 = v0;
    sub_10000B1D8();
    char v23 = sub_100004FCC((uint64_t)v15, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v23[2])
    {
      swift_bridgeObjectRelease();
      uint64_t v47 = sub_10000B31C();
      uint64_t v49 = v48;
      uint64_t v50 = sub_10000B31C();
      uint64_t v52 = v51;
      sub_1000114C0(67);
      v67._countAndFlagsBits = 0xD000000000000025;
      v67._object = (void *)0x8000000100012340;
      sub_100011360(v67);
      v68._countAndFlagsBits = v47;
      v68._object = v49;
      sub_100011360(v68);
      swift_bridgeObjectRelease();
      v69._countAndFlagsBits = 8236;
      v69._object = (void *)0xE200000000000000;
      sub_100011360(v69);
      v70._countAndFlagsBits = v50;
      v70._object = v52;
      sub_100011360(v70);
      swift_bridgeObjectRelease();
      v71._countAndFlagsBits = 0xD000000000000018;
      v71._object = (void *)0x8000000100012370;
      sub_100011360(v71);
      sub_100010C9C(0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      sub_10000AC6C();
      id v53 = objc_allocWithZone((Class)sub_100011250());
      uint64_t v42 = sub_100011230();

      swift_release();
      goto LABEL_35;
    }
    uint64_t v55 = v18;
    id v6 = v0 + 10;
    sub_100010C9C(0xD00000000000001CLL, 0x80000001000122F0);
    uint64_t v0 = v23 + 8;
    uint64_t v24 = -1;
    uint64_t v25 = -1 << *((unsigned char *)v23 + 32);
    if (-v25 < 64) {
      uint64_t v24 = ~(-1 << -(char)v25);
    }
    unint64_t v26 = v24 & v23[8];
    int64_t v27 = (unint64_t)(63 - v25) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t inited = 0;
    if (v26)
    {
LABEL_8:
      unint64_t v29 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      unint64_t v30 = v29 | (inited << 6);
      if (v23[2]) {
        goto LABEL_28;
      }
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
LABEL_10:
    int64_t v31 = inited + 1;
    if (!__OFADD__(inited, 1)) {
      break;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    swift_once();
  }
  if (v31 >= v27) {
    goto LABEL_33;
  }
  unint64_t v32 = v0[v31];
  ++inited;
  if (v32) {
    goto LABEL_27;
  }
  uint64_t inited = v31 + 1;
  if (v31 + 1 >= v27) {
    goto LABEL_33;
  }
  unint64_t v32 = v0[inited];
  if (v32) {
    goto LABEL_27;
  }
  uint64_t inited = v31 + 2;
  if (v31 + 2 >= v27) {
    goto LABEL_33;
  }
  unint64_t v32 = v0[inited];
  if (v32) {
    goto LABEL_27;
  }
  uint64_t inited = v31 + 3;
  if (v31 + 3 >= v27) {
    goto LABEL_33;
  }
  unint64_t v32 = v0[inited];
  if (v32) {
    goto LABEL_27;
  }
  uint64_t inited = v31 + 4;
  if (v31 + 4 >= v27) {
    goto LABEL_33;
  }
  unint64_t v32 = v0[inited];
  if (v32)
  {
LABEL_27:
    unint64_t v26 = (v32 - 1) & v32;
    unint64_t v30 = __clz(__rbit64(v32)) + (inited << 6);
    if (!v23[2]) {
      goto LABEL_39;
    }
LABEL_28:
    uint64_t v34 = v23[6] + 16 * v30;
    double v35 = *(double *)v34;
    double v36 = *(double *)(v34 + 8);
    sub_100007B44(*(double *)v34, v36);
    if ((v37 & 1) == 0) {
      goto LABEL_40;
    }
    sub_10000ABC8(&qword_1000189E8);
    unint64_t v38 = swift_initStackObject();
    *(_OWORD *)(v38 + 16) = xmmword_100011B70;
    *(void *)(v38 + 32) = swift_getKeyPath();
    *(void *)(v38 + 40) = swift_getKeyPath();
    sub_100011420();
    uint64_t KeyPath = swift_getKeyPath();
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_10000533C(v38, KeyPath);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t result = sub_100005A94(v40, v35, v36);
    if (v26) {
      goto LABEL_8;
    }
    goto LABEL_10;
  }
  int64_t v33 = v31 + 5;
  if (v33 >= v27)
  {
LABEL_33:
    swift_release();
    swift_bridgeObjectRelease();
    sub_100010C9C(0xD00000000000002ALL, 0x8000000100012310);
    type metadata accessor for DediscoDataEncoder();
    swift_initStackObject();
    sub_10000C2C0((uint64_t)&_swiftEmptyDictionarySingleton);
    sub_10000D8C4();
    double v44 = v55[2];
    NSString v45 = sub_100011300();
    [v56 setDouble:v45 forKey:v44];

    id v46 = objc_allocWithZone((Class)sub_100011250());
    uint64_t v42 = sub_100011240();

    swift_release();
    swift_release();
LABEL_35:
    swift_release();
    uint64_t v0 = v59;
    goto LABEL_36;
  }
  unint64_t v32 = v0[v33];
  if (v32)
  {
    uint64_t inited = v33;
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t inited = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (inited >= v27) {
      goto LABEL_33;
    }
    unint64_t v32 = v0[inited];
    ++v33;
    if (v32) {
      goto LABEL_27;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000ABC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000AC0C(uint64_t a1)
{
  uint64_t v2 = sub_10000ABC8(&qword_1000189D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000AC6C()
{
  unint64_t result = qword_1000189F0;
  if (!qword_1000189F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000189F0);
  }
  return result;
}

uint64_t sub_10000ACC0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_100011590() & 1;
  }
}

uint64_t sub_10000AD18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000AD60()
{
  unint64_t result = qword_100018A18;
  if (!qword_100018A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018A18);
  }
  return result;
}

uint64_t sub_10000ADB4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000ADEC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AE00@<X0>(void *a1@<X8>)
{
  return sub_10000958C(a1);
}

uint64_t sub_10000AE20(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000AD18(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000AE64(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000AEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000AF10()
{
  unint64_t result = qword_100018A88;
  if (!qword_100018A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100018A88);
  }
  return result;
}

uint64_t sub_10000AF50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000ABC8(&qword_1000189D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000AFC8()
{
  return swift_release();
}

void sub_10000AFD0(void *a1)
{
  sub_1000063C4(a1, v1);
}

uint64_t sub_10000AFD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_10000ABC8(&qword_100018AF8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100011560();
  __break(1u);
  return result;
}

uint64_t sub_10000B0F8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_10000B150()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LedgerClient()
{
  return sub_10000B1A8();
}

uint64_t sub_10000B1A8()
{
  return swift_getGenericMetadata();
}

void sub_10000B1D8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1 < 0)
  {
LABEL_13:
    __break(1u);
    return;
  }
  if (v1)
  {
    double v2 = *(double *)(v0 + 24);
    uint64_t v3 = sub_100006E8C(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    uint64_t v4 = 0;
    for (uint64_t i = 0x611722833945; i; --i)
    {
      double v6 = v2 + (double)v4;
      if (v6 > v6 + 86400.0) {
        goto LABEL_12;
      }
      unint64_t v8 = *((void *)v3 + 2);
      unint64_t v7 = *((void *)v3 + 3);
      if (v8 >= v7 >> 1) {
        uint64_t v3 = sub_100006E8C((char *)(v7 > 1), v8 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v8 + 1;
      uint64_t v9 = &v3[16 * v8];
      *((double *)v9 + 4) = v6;
      *((double *)v9 + 5) = v6 + 86400.0;
      v4 += 86400;
      if (!--v1) {
        return;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
}

uint64_t sub_10000B2E8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BucketRangeCreator()
{
  return self;
}

uint64_t sub_10000B31C()
{
  uint64_t v0 = sub_100011170();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000ABC8(&qword_100018CA8);
  __chkstk_darwin(v4 - 8);
  double v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)NSDateFormatter) init];
  sub_1000111E0();
  uint64_t v8 = sub_100011210();
  uint64_t v9 = *(void *)(v8 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    Class isa = sub_100011200().super.isa;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  [v7 setTimeZone:isa];

  NSString v11 = sub_100011300();
  [v7 setDateFormat:v11];

  sub_100011140();
  Class v12 = sub_100011130().super.isa;
  id v13 = [v7 stringFromDate:v12];

  uint64_t v14 = sub_100011310();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v14;
}

uint64_t sub_10000B598()
{
  uint64_t v0 = sub_100011170();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  double v6 = (char *)&v17 - v5;
  uint64_t v7 = sub_10000ABC8(&qword_100018CA8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000111D0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000111A0();
  sub_1000111F0();
  uint64_t v14 = sub_100011210();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v9, 1, v14);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1000111B0();
    sub_100011140();
    sub_100011180();
    sub_100011150();
    uint64_t v16 = *(void (**)(char *, uint64_t))(v1 + 8);
    v16(v4, v0);
    v16(v6, v0);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return result;
}

void *sub_10000B810(uint64_t a1)
{
  uint64_t v2 = sub_1000111C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  double v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_10000ABC8(&qword_100018CB8);
    uint64_t v9 = sub_1000114B0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    double v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    int64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_10000BF28(&qword_100018CC0);
      uint64_t v16 = sub_1000112D0();
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
          sub_10000BF28(&qword_100018CC8);
          char v23 = sub_1000112F0();
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

uint64_t sub_10000BB00()
{
  uint64_t v0 = sub_1000110E0();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100011170();
  uint64_t v3 = *(void *)(v27 - 8);
  uint64_t v4 = __chkstk_darwin(v27);
  double v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_10000ABC8(&qword_100018CA8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1000111D0();
  uint64_t v12 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000111A0();
  sub_1000111F0();
  uint64_t v15 = sub_100011210();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v11, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1000111B0();
    sub_100011140();
    sub_100011140();
    sub_10000ABC8(&qword_100018CB0);
    uint64_t v17 = sub_1000111C0();
    uint64_t v18 = *(void *)(v17 - 8);
    unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100011B60;
    (*(void (**)(unint64_t, void, uint64_t))(v18 + 104))(v20 + v19, enum case for Calendar.Component.day(_:), v17);
    sub_10000B810(v20);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_100011190();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_1000110D0();
    LOBYTE(v20) = v22;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v29);
    char v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v24 = v6;
    uint64_t v25 = v27;
    v23(v24, v27);
    v23(v8, v25);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
    if (v20) {
      return 0;
    }
    else {
      return v21;
    }
  }
  return result;
}

uint64_t sub_10000BF28(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000111C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000BF6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ABC8(&qword_100018DB8);
  uint64_t v2 = (void *)sub_100011550();
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
    unint64_t result = sub_100007ACC(v5, v6);
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

unint64_t sub_10000C090(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ABC8(&qword_100018A30);
  uint64_t v2 = (void *)sub_100011550();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100007ACC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
    v2[2] = v13;
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

unint64_t sub_10000C1A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000ABC8(&qword_100018DC8);
  uint64_t v2 = (void *)sub_100011550();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100007ACC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

id sub_10000C2C0(uint64_t a1)
{
  *(void *)(v1 + 16) = 50100;
  *(_DWORD *)(v1 + 24) = 1000;
  *(void *)(v1 + 32) = 4;
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v4 = result;
    char internalBuild = MobileGestalt_get_internalBuild();

    *(unsigned char *)(v1 + 56) = internalBuild;
    *(void *)(v1 + 40) = a1;
    sub_10000ABC8(&qword_100018DB0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100011B60;
    *(void *)(inited + 32) = sub_100011310();
    *(void *)(inited + 40) = v7;
    *(void *)(inited + 48) = 12662;
    *(void *)(inited + 56) = 0xE200000000000000;
    *(void *)(v1 + 48) = sub_10000BF6C(inited);
    return (id)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Class sub_10000C388(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10000EF00();
    v4.super.Class isa = sub_1000112C0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10000C414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  if (qword_1000188F0 != -1) {
LABEL_126:
  }
    swift_once();
  sub_100010C9C(0xD00000000000002BLL, 0x80000001000128E0);
  uint64_t v8 = *(void *)(v4 + 16);
  if ((unint64_t)(v8 - 0x2000000000000000) >> 62 != 3)
  {
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
    JUMPOUT(0x10000D4F4);
  }
  v77._countAndFlagsBits = a1;
  v77._object = (void *)a2;
  int64_t v78 = v4;
  v85[0] = sub_10000EF48(4 * v8);
  v85[1] = v9;
  int64_t v4 = (int64_t)v85;
  a2 = 0;
  sub_10000DE30(v85, 0);
  uint64_t v83 = a3 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  uint64_t v80 = v85[0];
  unint64_t v81 = v85[1];
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 64);
  int64_t v84 = (unint64_t)(v10 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v13 = 0;
  uint64_t v82 = a3;
  while (v12)
  {
    unint64_t v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v15 = v14 | (v13 << 6);
LABEL_20:
    unint64_t v19 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v15);
    uint64_t v21 = *v19;
    unint64_t v20 = v19[1];
    uint64_t v22 = HIBYTE(v20) & 0xF;
    uint64_t v23 = v21 & 0xFFFFFFFFFFFFLL;
    if ((v20 & 0x2000000000000000) != 0) {
      uint64_t v24 = HIBYTE(v20) & 0xF;
    }
    else {
      uint64_t v24 = v21 & 0xFFFFFFFFFFFFLL;
    }
    if (!v24)
    {
      swift_bridgeObjectRetain();
      goto LABEL_114;
    }
    a1 = *(unsigned int *)(*(void *)(a3 + 56) + 4 * v15);
    if ((v20 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      Swift::String v66 = sub_10000E024(v21, v20, 10);
      if (v67) {
        goto LABEL_114;
      }
      int64_t v4 = (int64_t)v66;
LABEL_58:
      swift_bridgeObjectRelease();
      a2 = v4 + 100;
      if ((unint64_t)(v4 + 100) >= 0xC3B4)
      {
        a2 = qword_1000196B0;
        v85[0] = 0;
        v85[1] = 0xE000000000000000;
        sub_1000114C0(43);
        swift_bridgeObjectRelease();
        strcpy((char *)v85, "Error code: ");
        BYTE5(v85[1]) = 0;
        HIWORD(v85[1]) = -5120;
        v92._countAndFlagsBits = sub_100011580();
        sub_100011360(v92);
        swift_bridgeObjectRelease();
        v93._countAndFlagsBits = 0xD000000000000015;
        v93._object = (void *)0x8000000100012930;
        sub_100011360(v93);
        a1 = (uint64_t)&type metadata for Int32;
        v94._countAndFlagsBits = sub_100011580();
        sub_100011360(v94);
        swift_bridgeObjectRelease();
        v95._countAndFlagsBits = 8236;
        v95._object = (void *)0xE200000000000000;
        sub_100011360(v95);
        v96._countAndFlagsBits = sub_100011580();
        sub_100011360(v96);
        swift_bridgeObjectRelease();
        v97._countAndFlagsBits = 11817;
        v97._object = (void *)0xE200000000000000;
        sub_100011360(v97);
        uint64_t v36 = v85[0];
        int64_t v4 = v85[1];
        swift_bridgeObjectRetain_n();
        char v37 = sub_100011290();
        os_log_type_t v38 = sub_100011460();
        if (os_log_type_enabled(v37, v38))
        {
          uint64_t v39 = swift_slowAlloc();
          v85[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v39 = 136446210;
          swift_bridgeObjectRetain();
          *(void *)(v39 + 4) = sub_1000073F8(v36, v4, v85);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "%{public}s", (uint8_t *)v39, 0xCu);
          swift_arrayDestroy();
          a3 = v82;
          swift_slowDealloc();
          goto LABEL_116;
        }
        goto LABEL_6;
      }
      if (a1)
      {
        if ((a1 & 0x80000000) != 0)
        {
          a2 = qword_1000196B0;
          v85[0] = 0;
          v85[1] = 0xE000000000000000;
          sub_1000114C0(32);
          swift_bridgeObjectRelease();
          strcpy((char *)v85, "Count: ");
          v85[1] = 0xE700000000000000;
          v98._countAndFlagsBits = sub_100011580();
          sub_100011360(v98);
          swift_bridgeObjectRelease();
          v99._countAndFlagsBits = 0xD000000000000017;
          v99._object = (void *)0x8000000100012970;
          sub_100011360(v99);
          uint64_t v40 = v85[0];
          int64_t v4 = v85[1];
          swift_bridgeObjectRetain_n();
          char v37 = sub_100011290();
          os_log_type_t v41 = sub_100011460();
          if (os_log_type_enabled(v37, v41))
          {
            uint64_t v42 = swift_slowAlloc();
            v85[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v42 = 136446210;
            swift_bridgeObjectRetain();
            *(void *)(v42 + 4) = sub_1000073F8(v40, v4, v85);
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v37, v41, "%{public}s", (uint8_t *)v42, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            a3 = v82;
            goto LABEL_116;
          }
LABEL_6:
          swift_bridgeObjectRelease_n();
        }
        else
        {
          if (a1 >= 0x65)
          {
            v85[0] = 0;
            v85[1] = 0xE000000000000000;
            sub_1000114C0(46);
            swift_bridgeObjectRelease();
            strcpy((char *)v85, "Count: ");
            v85[1] = 0xE700000000000000;
            v86._countAndFlagsBits = sub_100011580();
            sub_100011360(v86);
            swift_bridgeObjectRelease();
            v87._countAndFlagsBits = 0xD000000000000011;
            v87._object = (void *)0x8000000100012950;
            sub_100011360(v87);
            v88._countAndFlagsBits = sub_100011580();
            sub_100011360(v88);
            swift_bridgeObjectRelease();
            v89._countAndFlagsBits = 0x747465736572202CLL;
            v89._object = (void *)0xEF206F7420676E69;
            sub_100011360(v89);
            v90._countAndFlagsBits = sub_100011580();
            sub_100011360(v90);
            swift_bridgeObjectRelease();
            v91._countAndFlagsBits = 46;
            v91._object = (void *)0xE100000000000000;
            sub_100011360(v91);
            uint64_t v32 = v85[0];
            int64_t v4 = v85[1];
            swift_bridgeObjectRetain_n();
            uint64_t v33 = sub_100011290();
            os_log_type_t v34 = sub_100011450();
            if (os_log_type_enabled(v33, v34))
            {
              uint64_t v79 = v32;
              double v35 = (uint8_t *)swift_slowAlloc();
              v85[0] = swift_slowAlloc();
              *(_DWORD *)double v35 = 136446210;
              swift_bridgeObjectRetain();
              sub_1000073F8(v79, v4, v85);
              sub_100011470();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v33, v34, "%{public}s", v35, 0xCu);
              swift_arrayDestroy();
              a3 = v82;
              swift_slowDealloc();
              swift_slowDealloc();
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            a1 = 100;
          }
          float v51 = (float)a1 / 1000.0;
          switch(v81 >> 62)
          {
            case 1uLL:
              int64_t v4 = v81 & 0x3FFFFFFFFFFFFFFFLL;
              a3 = v80 >> 32;
              if (swift_isUniquelyReferenced_nonNull_native()) {
                goto LABEL_107;
              }
              if (a3 < (int)v80) {
                goto LABEL_128;
              }
              uint64_t v52 = sub_100011080();
              if (v52)
              {
                a1 = v52;
                if (__OFSUB__((int)v80, sub_1000110B0())) {
                  goto LABEL_131;
                }
              }
              sub_1000110C0();
              swift_allocObject();
              uint64_t v62 = sub_100011070();
              swift_release();
              int64_t v4 = v62;
LABEL_107:
              if (a3 < (int)v80) {
                goto LABEL_124;
              }
              uint64_t v63 = sub_100011080();
              if (!v63) {
                goto LABEL_133;
              }
              uint64_t v64 = v63;
              uint64_t v65 = sub_1000110B0();
              a3 = v82;
              if (__OFSUB__((int)v80, v65)) {
                goto LABEL_125;
              }
              a1 = v64 + (int)v80 - v65;
              sub_1000110A0();
              *(float *)(a1 + 4 * a2) = v51;
              unint64_t v81 = v4 | 0x4000000000000000;
              continue;
            case 2uLL:
              int64_t v4 = v81 & 0x3FFFFFFFFFFFFFFFLL;
              if (swift_isUniquelyReferenced_nonNull_native()) {
                goto LABEL_101;
              }
              uint64_t v54 = *(void *)(v80 + 16);
              uint64_t v53 = *(void *)(v80 + 24);
              if (sub_100011080())
              {
                if (__OFSUB__(v54, sub_1000110B0())) {
                  goto LABEL_130;
                }
                if (__OFSUB__(v53, v54)) {
                  goto LABEL_129;
                }
              }
              else if (__OFSUB__(v53, v54))
              {
                goto LABEL_129;
              }
              sub_1000110C0();
              swift_allocObject();
              uint64_t v55 = sub_100011070();
              swift_release();
              int64_t v4 = v55;
LABEL_101:
              uint64_t v56 = v80;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                uint64_t v57 = *(void *)(v80 + 16);
                uint64_t v58 = *(void *)(v80 + 24);
                sub_100011110();
                uint64_t v56 = swift_allocObject();
                *(void *)(v56 + 16) = v57;
                *(void *)(v56 + 24) = v58;
                a3 = v82;
                swift_release();
              }
              uint64_t v80 = v56;
              a1 = *(void *)(v56 + 16);
              uint64_t v59 = sub_100011080();
              if (!v59) {
                goto LABEL_132;
              }
              uint64_t v60 = v59;
              uint64_t v61 = sub_1000110B0();
              if (__OFSUB__(a1, v61)) {
                goto LABEL_123;
              }
              a1 = v60 + a1 - v61;
              sub_1000110A0();
              *(float *)(a1 + 4 * a2) = v51;
              unint64_t v81 = v4 | 0x8000000000000000;
              break;
            case 3uLL:
              continue;
            default:
              v85[0] = v80;
              LODWORD(v85[1]) = v81;
              WORD2(v85[1]) = WORD2(v81);
              BYTE6(v85[1]) = BYTE6(v81);
              *((float *)v85 + a2) = v51;
              uint64_t v80 = v85[0];
              unint64_t v81 = LODWORD(v85[1]) | ((unint64_t)BYTE4(v85[1]) << 32) | ((unint64_t)BYTE5(v85[1]) << 40) | ((unint64_t)BYTE6(v85[1]) << 48);
              continue;
          }
        }
      }
    }
    else
    {
      if ((v20 & 0x2000000000000000) != 0)
      {
        v85[0] = v21;
        v85[1] = v20 & 0xFFFFFFFFFFFFFFLL;
        if (v21 == 43)
        {
          if (!v22) {
            goto LABEL_121;
          }
          if (v22 == 1 || (BYTE1(v21) - 48) > 9u) {
            goto LABEL_50;
          }
          int64_t v4 = (BYTE1(v21) - 48);
          if (v22 != 2)
          {
            if ((BYTE2(v21) - 48) > 9u) {
              goto LABEL_50;
            }
            int64_t v4 = 10 * (BYTE1(v21) - 48) + (BYTE2(v21) - 48);
            uint64_t v28 = v22 - 3;
            if (v28)
            {
              uint64_t v29 = (unsigned __int8 *)v85 + 3;
              while (1)
              {
                unsigned int v30 = *v29 - 48;
                if (v30 > 9) {
                  goto LABEL_50;
                }
                uint64_t v31 = 10 * v4;
                if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                  goto LABEL_50;
                }
                int64_t v4 = v31 + v30;
                if (__OFADD__(v31, v30)) {
                  goto LABEL_50;
                }
                char v27 = 0;
                ++v29;
                if (!--v28) {
                  goto LABEL_57;
                }
              }
            }
          }
        }
        else if (v21 == 45)
        {
          if (!v22) {
            goto LABEL_120;
          }
          if (v22 == 1 || (BYTE1(v21) - 48) > 9u) {
            goto LABEL_50;
          }
          if (v22 == 2)
          {
            char v27 = 0;
            int64_t v4 = -(uint64_t)(BYTE1(v21) - 48);
            goto LABEL_57;
          }
          if ((BYTE2(v21) - 48) > 9u) {
            goto LABEL_50;
          }
          int64_t v4 = -10 * (BYTE1(v21) - 48) - (BYTE2(v21) - 48);
          uint64_t v47 = v22 - 3;
          if (v47)
          {
            unint64_t v48 = (unsigned __int8 *)v85 + 3;
            while (1)
            {
              unsigned int v49 = *v48 - 48;
              if (v49 > 9) {
                break;
              }
              uint64_t v50 = 10 * v4;
              if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                break;
              }
              int64_t v4 = v50 - v49;
              if (__OFSUB__(v50, v49)) {
                break;
              }
              char v27 = 0;
              ++v48;
              if (!--v47) {
                goto LABEL_57;
              }
            }
LABEL_50:
            int64_t v4 = 0;
            char v27 = 1;
            goto LABEL_57;
          }
        }
        else
        {
          if (!v22 || (v21 - 48) > 9u) {
            goto LABEL_50;
          }
          int64_t v4 = (v21 - 48);
          if (v22 != 1)
          {
            if ((BYTE1(v21) - 48) > 9u) {
              goto LABEL_50;
            }
            int64_t v4 = 10 * (v21 - 48) + (BYTE1(v21) - 48);
            uint64_t v43 = v22 - 2;
            if (v43)
            {
              double v44 = (unsigned __int8 *)v85 + 2;
              while (1)
              {
                unsigned int v45 = *v44 - 48;
                if (v45 > 9) {
                  goto LABEL_50;
                }
                uint64_t v46 = 10 * v4;
                if ((unsigned __int128)(v4 * (__int128)10) >> 64 != (10 * v4) >> 63) {
                  goto LABEL_50;
                }
                int64_t v4 = v46 + v45;
                if (__OFADD__(v46, v45)) {
                  goto LABEL_50;
                }
                char v27 = 0;
                ++v44;
                if (!--v43) {
                  goto LABEL_57;
                }
              }
            }
          }
        }
        char v27 = 0;
      }
      else
      {
        if ((v21 & 0x1000000000000000) != 0) {
          uint64_t v25 = (unsigned __int8 *)((v20 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else {
          uint64_t v25 = (unsigned __int8 *)sub_1000114F0();
        }
        int64_t v4 = (int64_t)sub_10000E10C(v25, v23, 10);
        char v27 = v26 & 1;
      }
LABEL_57:
      swift_bridgeObjectRetain();
      if ((v27 & 1) == 0) {
        goto LABEL_58;
      }
LABEL_114:
      a2 = qword_1000196B0;
      v85[0] = 0;
      v85[1] = 0xE000000000000000;
      sub_1000114C0(39);
      swift_bridgeObjectRelease();
      v85[0] = 0xD00000000000001DLL;
      v85[1] = 0x8000000100012910;
      v100._countAndFlagsBits = v21;
      v100._object = (void *)v20;
      sub_100011360(v100);
      swift_bridgeObjectRelease();
      v101._countAndFlagsBits = 0x2E746E69206F7420;
      v101._object = (void *)0xE800000000000000;
      sub_100011360(v101);
      uint64_t v68 = v85[0];
      int64_t v4 = v85[1];
      swift_bridgeObjectRetain_n();
      char v37 = sub_100011290();
      os_log_type_t v69 = sub_100011460();
      if (!os_log_type_enabled(v37, v69)) {
        goto LABEL_6;
      }
      a1 = swift_slowAlloc();
      v85[0] = swift_slowAlloc();
      *(_DWORD *)a1 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(a1 + 4) = sub_1000073F8(v68, v4, v85);
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v37, v69, "%{public}s", (uint8_t *)a1, 0xCu);
      swift_arrayDestroy();
      a3 = v82;
      swift_slowDealloc();
LABEL_116:
      swift_slowDealloc();
      swift_bridgeObjectRelease();
    }
  }
  if (__OFADD__(v13++, 1))
  {
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
    goto LABEL_126;
  }
  if (v13 >= v84) {
    goto LABEL_118;
  }
  unint64_t v17 = *(void *)(v83 + 8 * v13);
  if (v17)
  {
LABEL_19:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
    goto LABEL_20;
  }
  int64_t v18 = v13 + 1;
  if (v13 + 1 >= v84) {
    goto LABEL_118;
  }
  unint64_t v17 = *(void *)(v83 + 8 * v18);
  if (v17) {
    goto LABEL_18;
  }
  int64_t v18 = v13 + 2;
  if (v13 + 2 >= v84) {
    goto LABEL_118;
  }
  unint64_t v17 = *(void *)(v83 + 8 * v18);
  if (v17)
  {
LABEL_18:
    int64_t v13 = v18;
    goto LABEL_19;
  }
  int64_t v18 = v13 + 3;
  if (v13 + 3 < v84)
  {
    unint64_t v17 = *(void *)(v83 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        int64_t v13 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          goto LABEL_122;
        }
        if (v13 >= v84) {
          goto LABEL_118;
        }
        unint64_t v17 = *(void *)(v83 + 8 * v13);
        ++v18;
        if (v17) {
          goto LABEL_19;
        }
      }
    }
    goto LABEL_18;
  }
LABEL_118:
  swift_release();
  v85[0] = 0xD000000000000025;
  v85[1] = 0x8000000100012990;
  sub_100011360(v77);
  id v70 = objc_allocWithZone((Class)_DPFloatValueRecorder);
  NSString v71 = sub_100011300();
  swift_bridgeObjectRelease();
  id v72 = [v70 initWithKey:v71];

  sub_10000ABC8(&qword_100018DD8);
  uint64_t v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = xmmword_100011B60;
  *(void *)(v73 + 32) = v80;
  *(void *)(v73 + 40) = v81;
  sub_10000EFE8(v80, v81);
  Class isa = sub_100011410().super.isa;
  swift_bridgeObjectRelease();
  sub_10000D504(*(void *)(v78 + 48));
  Class v75 = sub_1000112C0().super.isa;
  swift_bridgeObjectRelease();
  [v72 recordFloatVectors:isa metadata:v75];

  return sub_10000F040(v80, v81);
}

uint64_t sub_10000D504(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000ABC8(&qword_100018DE0);
    uint64_t v2 = (void *)sub_100011550();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    unint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000F098(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000F098(v35, v36);
    sub_10000F098(v36, &v32);
    uint64_t result = sub_1000114A0(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000F098(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_10000EF40();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10000D8C4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v39 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & v2;
  int64_t v40 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v41 = *(void *)(v0 + 40);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v44 = v0;
  while (2)
  {
    if (!v5)
    {
      int64_t v9 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_51;
      }
      if (v9 >= v40) {
        return swift_release();
      }
      unint64_t v10 = *(void *)(v39 + 8 * v9);
      int64_t v11 = v7 + 1;
      if (!v10)
      {
        int64_t v11 = v7 + 2;
        if (v7 + 2 >= v40) {
          return swift_release();
        }
        unint64_t v10 = *(void *)(v39 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v7 + 3;
          if (v7 + 3 >= v40) {
            return swift_release();
          }
          unint64_t v10 = *(void *)(v39 + 8 * v11);
          if (!v10)
          {
            uint64_t v12 = v7 + 4;
            if (v7 + 4 < v40)
            {
              unint64_t v10 = *(void *)(v39 + 8 * v12);
              if (v10)
              {
                int64_t v11 = v7 + 4;
                goto LABEL_21;
              }
              while (1)
              {
                int64_t v11 = v12 + 1;
                if (__OFADD__(v12, 1)) {
                  goto LABEL_52;
                }
                if (v11 >= v40) {
                  break;
                }
                unint64_t v10 = *(void *)(v39 + 8 * v11);
                ++v12;
                if (v10) {
                  goto LABEL_21;
                }
              }
            }
            return swift_release();
          }
        }
      }
LABEL_21:
      uint64_t v42 = (v10 - 1) & v10;
      int64_t v43 = v11;
      unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
      goto LABEL_22;
    }
    uint64_t v42 = (v5 - 1) & v5;
    int64_t v43 = v7;
    unint64_t v8 = __clz(__rbit64(v5)) | (v7 << 6);
LABEL_22:
    uint64_t v13 = *(void *)(*(void *)(v41 + 56) + 8 * v8);
    uint64_t v46 = v13 + 64;
    uint64_t v14 = 1 << *(unsigned char *)(v13 + 32);
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & *(void *)(v13 + 64);
    int64_t v47 = (unint64_t)(v14 + 63) >> 6;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v17 = 0;
    uint64_t v45 = v13;
    while (1)
    {
      if (v16)
      {
        unint64_t v18 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        unint64_t v19 = v18 | (v17 << 6);
        goto LABEL_44;
      }
      int64_t v20 = v17 + 1;
      if (__OFADD__(v17, 1))
      {
        __break(1u);
        goto LABEL_50;
      }
      if (v20 >= v47) {
        goto LABEL_5;
      }
      unint64_t v21 = *(void *)(v46 + 8 * v20);
      ++v17;
      if (!v21)
      {
        int64_t v17 = v20 + 1;
        if (v20 + 1 >= v47) {
          goto LABEL_5;
        }
        unint64_t v21 = *(void *)(v46 + 8 * v17);
        if (!v21)
        {
          int64_t v17 = v20 + 2;
          if (v20 + 2 >= v47) {
            goto LABEL_5;
          }
          unint64_t v21 = *(void *)(v46 + 8 * v17);
          if (!v21) {
            break;
          }
        }
      }
LABEL_43:
      unint64_t v16 = (v21 - 1) & v21;
      unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_44:
      unint64_t v23 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v19);
      uint64_t v24 = *v23;
      uint64_t v25 = v23[1];
      uint64_t v26 = *(void *)(*(void *)(v13 + 56) + 8 * v19);
      int v27 = *(unsigned __int8 *)(v0 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v27 == 1)
      {
        uint64_t v49 = sub_100011430();
        uint64_t v29 = v28;
        uint64_t v48 = sub_100011430();
        uint64_t v31 = v30;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        long long v32 = sub_10000ED84(v26);
        swift_bridgeObjectRelease();
        uint64_t v33 = swift_bridgeObjectRetain();
        uint64_t v34 = sub_10000EC9C(v33);
        swift_bridgeObjectRelease();
        if (qword_1000188F0 != -1) {
          swift_once();
        }
        sub_100010C9C(0xD000000000000024, 0x8000000100012890);
        NSString v35 = sub_100011300();
        uint64_t v36 = (void *)swift_allocObject();
        _OWORD v36[2] = v24;
        v36[3] = v25;
        v36[4] = v49;
        v36[5] = v29;
        v36[6] = v48;
        v36[7] = v31;
        v36[8] = v32;
        v36[9] = v34;
        aBlock[4] = sub_10000EEC4;
        aBlock[5] = v36;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10000C388;
        aBlock[3] = &unk_100014C80;
        char v37 = _Block_copy(aBlock);
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v37);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v0 = v44;
        sub_10000C414(v24, v25, v26);
        uint64_t v13 = v45;
      }
      else
      {
        sub_10000C414(v24, v25, v26);
      }
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    int64_t v22 = v20 + 3;
    if (v22 >= v47)
    {
LABEL_5:
      uint64_t result = swift_release();
      unint64_t v5 = v42;
      int64_t v7 = v43;
      continue;
    }
    break;
  }
  unint64_t v21 = *(void *)(v46 + 8 * v22);
  if (v21)
  {
    int64_t v17 = v22;
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v17 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v17 >= v47) {
      goto LABEL_5;
    }
    unint64_t v21 = *(void *)(v46 + 8 * v17);
    ++v22;
    if (v21) {
      goto LABEL_43;
    }
  }
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
  return result;
}

uint64_t sub_10000DDCC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DediscoDataEncoder()
{
  return self;
}

void sub_10000DE30(uint64_t *a1, int __c)
{
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_10000E874((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *a1;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1000110F0();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_100011080();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x10000E014);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_1000110B0();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_1000110A0();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      memset((void *)(v11 + v13), __c, v17);
      *a1 = __b;
      a1[1] = v7 | 0x8000000000000000;
      return;
    case 3uLL:
      return;
    default:
      uint64_t __b = *a1;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *a1 = v5;
      a1[1] = v6;
      return;
  }
}

unsigned __int8 *sub_10000E024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000113E0();
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
  uint64_t v5 = sub_10000E388();
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
    uint64_t v7 = (unsigned __int8 *)sub_1000114F0();
  }
LABEL_7:
  uint64_t v11 = sub_10000E10C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10000E10C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (uint64_t i = result + 1; ; ++i)
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
  unint64_t v18 = result + 1;
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

uint64_t sub_10000E388()
{
  unint64_t v0 = sub_1000113F0();
  uint64_t v4 = sub_10000E408(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000E408(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10000E560(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_100007898(v9, 0),
          unint64_t v12 = sub_10000E660((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100011330();
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
      return sub_100011330();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_1000114F0();
LABEL_4:

  return sub_100011330();
}

uint64_t sub_10000E560(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_100007900(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_100007900(v6, v5, v4);
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

unint64_t sub_10000E660(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      uint64_t result = sub_100007900(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1000113B0();
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
          uint64_t result = sub_1000114F0();
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
    uint64_t result = sub_100007900(v12, a6, a7);
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
    unint64_t v12 = sub_100011380();
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

void sub_10000E874(int *a1, int a2)
{
  sub_100011100();
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = sub_100011080();
  if (!v6)
  {
LABEL_12:
    __break(1u);
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_1000110B0();
  uint64_t v9 = v4 - v8;
  if (__OFSUB__(v4, v8))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v10 = v5 - v4;
  uint64_t v11 = sub_1000110A0();
  if (v11 >= v10) {
    size_t v12 = v10;
  }
  else {
    size_t v12 = v11;
  }

  memset((void *)(v7 + v9), a2, v12);
}

void *sub_10000E908(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    void *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_DWORD *)(*(void *)(a4 + 56) + 4 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000EA9C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
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
  unint64_t v11 = a2;
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
    char v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
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

void *sub_10000EC9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000ABC8(&qword_100018DD0);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = j__malloc_size((const void *)v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 29;
  }
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * (v5 >> 2);
  uint64_t v6 = sub_10000E908(&v8, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_10000EF40();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v3;
}

void *sub_10000ED84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000ABC8(&qword_100018A60);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_10000EA9C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10000EF40();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10000EE6C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

unint64_t sub_10000EEC4()
{
  return sub_10000F0C4();
}

uint64_t sub_10000EEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EEF8()
{
  return swift_release();
}

unint64_t sub_10000EF00()
{
  unint64_t result = qword_100018DC0;
  if (!qword_100018DC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100018DC0);
  }
  return result;
}

uint64_t sub_10000EF40()
{
  return swift_release();
}

uint64_t sub_10000EF48(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1000110C0();
      swift_allocObject();
      sub_100011090();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_100011110();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_10000EFE8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000F040(uint64_t a1, unint64_t a2)
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

_OWORD *sub_10000F098(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t CoreAnalyticsEvents.rawValue.getter()
{
  return 0xD000000000000031;
}

unint64_t sub_10000F0C4()
{
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  sub_10000ABC8(&qword_100018A40);
  sub_10000AE20(&qword_100018A48, &qword_100018A40);
  sub_1000112E0();
  sub_1000109DC((uint64_t)&v15);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v14 = v1;
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_100009400(0, v2, 0);
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 4;
      uint64_t v4 = sub_100011580();
      uint64_t v6 = v5;
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_100009400(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      unint64_t v9 = (char *)&_swiftEmptyArrayStorage[2 * v8];
      *((void *)v9 + 4) = v4;
      *((void *)v9 + 5) = v6;
      --v2;
    }
    while (v2);
    sub_1000109DC((uint64_t)&v14);
  }
  sub_1000112E0();
  swift_bridgeObjectRelease();
  sub_10000ABC8(&qword_100018E38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100011D80;
  *(void *)(inited + 32) = 0x745374656B637562;
  *(void *)(inited + 40) = 0xEB00000000747261;
  *(void *)(inited + 48) = sub_100011300();
  *(void *)(inited + 56) = 0x6E4574656B637562;
  *(void *)(inited + 64) = 0xE900000000000064;
  *(void *)(inited + 72) = sub_100011300();
  *(void *)(inited + 80) = 0x656D614E6B736174;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(void *)(inited + 96) = sub_100011300();
  strcpy((char *)(inited + 104), "errorIndices");
  *(unsigned char *)(inited + 117) = 0;
  *(_WORD *)(inited + 118) = -5120;
  NSString v11 = sub_100011300();
  swift_bridgeObjectRelease();
  *(void *)(inited + 120) = v11;
  *(void *)(inited + 128) = 0x756F43726F727265;
  *(void *)(inited + 136) = 0xEB0000000073746ELL;
  NSString v12 = sub_100011300();
  swift_bridgeObjectRelease();
  *(void *)(inited + 144) = v12;
  return sub_10000C1A4(inited);
}

uint64_t TelemetryError.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x656C6C65636E6163;
  }
  if (a1 == 1) {
    return 0x6375427974706D65;
  }
  return 0x656D656C65546F6ELL;
}

uint64_t sub_10000F410(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10000F678(*a1, *a2);
}

uint64_t sub_10000F41C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB00000000747261;
  uint64_t v3 = 0x745374656B637562;
  uint64_t v4 = a1;
  uint64_t v5 = 0x745374656B637562;
  unint64_t v6 = 0xEB00000000747261;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6E4574656B637562;
      unint64_t v6 = 0xE900000000000064;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x656D614E6B736174;
      break;
    case 3:
      uint64_t v5 = 0x646E49726F727265;
      unint64_t v6 = 0xEC00000073656369;
      break;
    case 4:
      uint64_t v5 = 0x756F43726F727265;
      unint64_t v6 = 0xEB0000000073746ELL;
      break;
    case 5:
      uint64_t v5 = 0x73654D726F727265;
      unint64_t v6 = 0xED00007365676173;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE900000000000064;
      if (v5 == 0x6E4574656B637562) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      if (v5 != 0x656D614E6B736174) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v2 = 0xEC00000073656369;
      if (v5 != 0x646E49726F727265) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v3 = 0x756F43726F727265;
      unint64_t v2 = 0xEB0000000073746ELL;
      goto LABEL_15;
    case 5:
      unint64_t v2 = 0xED00007365676173;
      if (v5 != 0x73654D726F727265) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v3) {
        goto LABEL_19;
      }
LABEL_16:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_100011590();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_10000F678(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000064;
  uint64_t v3 = 0x656C6C65636E6163;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6375427974706D65;
    }
    else {
      uint64_t v5 = 0x656D656C65546F6ELL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEC0000007374656BLL;
    }
    else {
      unint64_t v6 = 0xEB00000000797274;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x656C6C65636E6163;
  unint64_t v6 = 0xE900000000000064;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6375427974706D65;
    }
    else {
      uint64_t v3 = 0x656D656C65546F6ELL;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xEC0000007374656BLL;
    }
    else {
      unint64_t v2 = 0xEB00000000797274;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100011590();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_10000F7B4()
{
  return sub_100011610();
}

Swift::Int sub_10000F86C()
{
  return sub_100011610();
}

uint64_t sub_10000F9A8()
{
  sub_100011340();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000FA4C()
{
  return sub_100011610();
}

Swift::Int sub_10000FB00()
{
  return sub_100011610();
}

uint64_t sub_10000FC38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s19TelemetryAggregator0A5ErrorO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_10000FC68(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000064;
  unint64_t v4 = 0xEC0000007374656BLL;
  uint64_t v5 = 0x6375427974706D65;
  if (v2 != 1)
  {
    uint64_t v5 = 0x656D656C65546F6ELL;
    unint64_t v4 = 0xEB00000000797274;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656C6C65636E6163;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

BOOL CoreAnalyticsEvents.init(rawValue:)(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014940;
  v6._object = a2;
  Swift::Int v4 = sub_100011570(v3, v6);
  swift_bridgeObjectRelease();
  return v4 != 0;
}

_UNKNOWN **static CoreAnalyticsEvents.allCases.getter()
{
  return &off_100014978;
}

uint64_t sub_10000FD40()
{
  return 1;
}

Swift::Int sub_10000FD48()
{
  return sub_100011610();
}

uint64_t sub_10000FDA0()
{
  return sub_100011340();
}

Swift::Int sub_10000FDBC()
{
  return sub_100011610();
}

uint64_t sub_10000FE10@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  Swift::OpaquePointer v3 = (void *)a1[1];
  v4._rawValue = &off_1000149A0;
  v7._object = v3;
  Swift::Int v5 = sub_100011570(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_10000FE64(void *a1@<X8>)
{
  *a1 = 0xD000000000000031;
  a1[1] = 0x8000000100012160;
}

void sub_10000FE84(void *a1@<X8>)
{
  *a1 = &off_1000149D8;
}

_UNKNOWN **static CoreAnalyticsEventsFields.allCases.getter()
{
  return &off_100014AB0;
}

uint64_t CoreAnalyticsEventsFields.rawValue.getter(char a1)
{
  uint64_t result = 0x745374656B637562;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E4574656B637562;
      break;
    case 2:
      uint64_t result = 0x656D614E6B736174;
      break;
    case 3:
      uint64_t result = 0x646E49726F727265;
      break;
    case 4:
      uint64_t result = 0x756F43726F727265;
      break;
    case 5:
      uint64_t result = 0x73654D726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000FF98(unsigned __int8 *a1, char *a2)
{
  return sub_10000F41C(*a1, *a2);
}

Swift::Int sub_10000FFA4()
{
  return sub_10000F86C();
}

uint64_t sub_10000FFAC()
{
  sub_100011340();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000100D0()
{
  return sub_10000FB00();
}

uint64_t sub_1000100D8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s19TelemetryAggregator25CoreAnalyticsEventsFieldsO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100010108(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xEB00000000747261;
  uint64_t v3 = 0x745374656B637562;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE900000000000064;
      uint64_t v3 = 0x6E4574656B637562;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x656D614E6B736174;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 3:
      strcpy((char *)a1, "errorIndices");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 4:
      *(void *)a1 = 0x756F43726F727265;
      *(void *)(a1 + 8) = 0xEB0000000073746ELL;
      break;
    case 5:
      strcpy((char *)a1, "errorMessages");
      *(_WORD *)(a1 + 14) = -4864;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

void sub_10001020C(void *a1@<X8>)
{
  *a1 = &off_100014AB0;
}

uint64_t sub_10001021C(int a1, int a2)
{
  BOOL v2 = __OFADD__(a1, a2);
  uint64_t result = (a1 + a2);
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001022C(uint64_t result, int a2)
{
  if (a2 <= (int)result) {
    return result;
  }
  else {
    return a2;
  }
}

uint64_t sub_100010238(uint64_t result, int a2)
{
  if (a2 >= (int)result) {
    return result;
  }
  else {
    return a2;
  }
}

uint64_t _s19TelemetryAggregator0A5ErrorO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000148D8;
  v6._object = a2;
  unint64_t v4 = sub_100011570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t _s19TelemetryAggregator25CoreAnalyticsEventsFieldsO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100014A00;
  v6._object = a2;
  unint64_t v4 = sub_100011570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

unint64_t sub_1000102E0()
{
  unint64_t result = qword_100018DE8;
  if (!qword_100018DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DE8);
  }
  return result;
}

unint64_t sub_100010338()
{
  unint64_t result = qword_100018DF0;
  if (!qword_100018DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DF0);
  }
  return result;
}

unint64_t sub_100010390()
{
  unint64_t result = qword_100018DF8;
  if (!qword_100018DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018DF8);
  }
  return result;
}

unint64_t sub_1000103E8()
{
  unint64_t result = qword_100018E00;
  if (!qword_100018E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018E00);
  }
  return result;
}

unint64_t sub_100010440()
{
  unint64_t result = qword_100018E08;
  if (!qword_100018E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018E08);
  }
  return result;
}

uint64_t sub_100010494()
{
  return sub_10000AE20(&qword_100018E10, &qword_100018E18);
}

unint64_t sub_1000104D4()
{
  unint64_t result = qword_100018E20;
  if (!qword_100018E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018E20);
  }
  return result;
}

uint64_t sub_100010528()
{
  return sub_10000AE20(&qword_100018E28, &qword_100018E30);
}

unsigned char *initializeBufferWithCopyOfBuffer for TelemetryError(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TelemetryError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TelemetryError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1000106D0);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1000106F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100010700(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TelemetryError()
{
  return &type metadata for TelemetryError;
}

uint64_t getEnumTagSinglePayload for CoreAnalyticsEvents(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CoreAnalyticsEvents(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100010808);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100010830()
{
  return 0;
}

ValueMetadata *type metadata accessor for CoreAnalyticsEvents()
{
  return &type metadata for CoreAnalyticsEvents;
}

uint64_t getEnumTagSinglePayload for CoreAnalyticsEventsFields(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CoreAnalyticsEventsFields(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x1000109A4);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsEventsFields()
{
  return &type metadata for CoreAnalyticsEventsFields;
}

uint64_t sub_1000109DC(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for DediscoTelemetry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DediscoTelemetry()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for DediscoTelemetry(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DediscoTelemetry(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for DediscoTelemetry(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for DediscoTelemetry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DediscoTelemetry(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DediscoTelemetry(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DediscoTelemetry()
{
  return &type metadata for DediscoTelemetry;
}

void sub_100010C9C(uint64_t a1, unint64_t a2)
{
}

void sub_100010CB4(uint64_t a1, unint64_t a2)
{
}

void sub_100010CCC(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  swift_bridgeObjectRetain_n();
  oslog = sub_100011290();
  os_log_type_t v6 = a3();
  if (os_log_type_enabled(oslog, v6))
  {
    BOOL v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)BOOL v7 = 136446210;
    swift_bridgeObjectRetain();
    sub_1000073F8(a1, a2, &v9);
    sub_100011470();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "%{public}s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_100010E6C()
{
  type metadata accessor for TelemetryLogger();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_1000112A0();
  qword_1000196B0 = v0;
  return result;
}

uint64_t sub_100010EEC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19TelemetryAggregator15TelemetryLogger_logger;
  uint64_t v2 = sub_1000112B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_100010F8C()
{
  return type metadata accessor for TelemetryLogger();
}

uint64_t type metadata accessor for TelemetryLogger()
{
  uint64_t result = qword_100018E88;
  if (!qword_100018E88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100010FE0()
{
  uint64_t result = sub_1000112B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100011070()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t sub_100011080()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100011090()
{
  return __DataStorage.init(length:)();
}

uint64_t sub_1000110A0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_1000110B0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000110C0()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_1000110D0()
{
  return DateComponents.day.getter();
}

uint64_t sub_1000110E0()
{
  return type metadata accessor for DateComponents();
}

void sub_1000110F0()
{
}

void sub_100011100()
{
}

uint64_t sub_100011110()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_100011120()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

NSDate sub_100011130()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100011140()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_100011150()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_100011160()
{
  return Date.init()();
}

uint64_t sub_100011170()
{
  return type metadata accessor for Date();
}

uint64_t sub_100011180()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_100011190()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t sub_1000111A0()
{
  return static Calendar.current.getter();
}

uint64_t sub_1000111B0()
{
  return Calendar.timeZone.setter();
}

uint64_t sub_1000111C0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_1000111D0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1000111E0()
{
  return TimeZone.init(identifier:)();
}

uint64_t sub_1000111F0()
{
  return TimeZone.init(abbreviation:)();
}

NSTimeZone sub_100011200()
{
  return TimeZone._bridgeToObjectiveC()();
}

uint64_t sub_100011210()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100011220()
{
  return static AppExtension.main()();
}

uint64_t sub_100011230()
{
  return MLHostResult.init(error:policy:)();
}

uint64_t sub_100011240()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100011250()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100011290()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000112A0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000112B0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_1000112C0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000112D0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000112E0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_1000112F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100011300()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100011310()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100011320()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_100011330()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100011340()
{
  return String.hash(into:)();
}

uint64_t sub_100011350()
{
  return String.index(after:)();
}

void sub_100011360(Swift::String a1)
{
}

Swift::Int sub_100011370()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100011380()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100011390()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000113B0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000113C0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_1000113D0()
{
  return String.subscript.getter();
}

uint64_t sub_1000113E0()
{
  return String.init<A>(_:)();
}

uint64_t sub_1000113F0()
{
  return String.subscript.getter();
}

uint64_t sub_100011400()
{
  return Sequence<>.joined(separator:)();
}

NSArray sub_100011410()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100011420()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100011430()
{
  return Double.description.getter();
}

uint64_t sub_100011440()
{
  return Double.write<A>(to:)();
}

uint64_t sub_100011450()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100011460()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100011470()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100011480()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100011490()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_1000114A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1000114B0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000114C0(Swift::Int a1)
{
}

uint64_t sub_1000114D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000114E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000114F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100011500()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100011510()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100011520()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100011530()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100011540()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100011550()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100011560()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100011570(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100011580()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100011590()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000115A0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000115B0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000115C0()
{
  return Error._code.getter();
}

uint64_t sub_1000115D0()
{
  return Error._domain.getter();
}

uint64_t sub_1000115E0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000115F0()
{
  return Hasher.init(_seed:)();
}

void sub_100011600(Swift::UInt64 a1)
{
}

Swift::Int sub_100011610()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return _MobileGestalt_get_internalBuild();
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

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
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