double sub_4854(char *a1, char *a2, void *a3)
{
  uint64_t v3;
  double v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  char v12;
  char v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint8_t *buf;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  Swift::String v62;
  Swift::String v63;
  Swift::String v64;
  Swift::String v65;
  Swift::String v66;

  if (qword_527A8 != -1) {
    swift_once();
  }
  v8 = sub_3EC68();
  sub_60E8(v8, (uint64_t)qword_57CC8);
  v9 = sub_3EC48();
  v10 = sub_3EFB8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Start runP2P()", v11, 2u);
    swift_slowDealloc();
  }

  switch(a1[OBJC_IVAR___PhonemeString_encoding])
  {
    case 1:
    case 2:
    case 3:
      v12 = sub_3F5A8();
      swift_bridgeObjectRelease();
      if (v12) {
        goto LABEL_8;
      }
LABEL_10:
      sub_3F238(86);
      v59._countAndFlagsBits = 0xD000000000000049;
      v59._object = (void *)0x80000000000429C0;
      sub_3EE18(v59);
      v14 = [a1 description];
      v15 = sub_3ED78();
      v17 = v16;

      v60._countAndFlagsBits = v15;
      v60._object = v17;
      sub_3EE18(v60);
      swift_bridgeObjectRelease();
      v61._countAndFlagsBits = 0x3A74656772617420;
      v61._object = (void *)0xE900000000000020;
      sub_3EE18(v61);
      v18 = [a2 description];
      v19 = sub_3ED78();
      v21 = v20;

      v62._countAndFlagsBits = v19;
      v62._object = v21;
      sub_3EE18(v62);
      swift_bridgeObjectRelease();
      sub_6120();
      swift_allocError();
      *(void *)v22 = 0;
      *(void *)(v22 + 8) = 0xE000000000000000;
      *(unsigned char *)(v22 + 16) = 0;
      goto LABEL_11;
    default:
      swift_bridgeObjectRelease();
LABEL_8:
      switch(a2[OBJC_IVAR___PhonemeString_encoding])
      {
        case 2:
          swift_bridgeObjectRelease();
          break;
        default:
          v13 = sub_3F5A8();
          swift_bridgeObjectRelease();
          if ((v13 & 1) == 0) {
            goto LABEL_10;
          }
          break;
      }
      v27 = *(void *)&a1[OBJC_IVAR___PhonemeString_symbols + 8];
      if ((v27 & 0x2000000000000000) != 0) {
        v28 = HIBYTE(v27) & 0xF;
      }
      else {
        v28 = *(void *)&a1[OBJC_IVAR___PhonemeString_symbols] & 0xFFFFFFFFFFFFLL;
      }
      if (!v28)
      {
        sub_3F238(67);
        v63._object = (void *)0x8000000000042A60;
        v63._countAndFlagsBits = 0xD000000000000041;
        sub_3EE18(v63);
        v38 = [a1 description];
LABEL_30:
        v39 = v38;
        v40 = sub_3ED78();
        v42 = v41;

        v65._countAndFlagsBits = v40;
        v65._object = v42;
        sub_3EE18(v65);
        swift_bridgeObjectRelease();
        sub_6120();
        swift_allocError();
        *(void *)v43 = 0;
        *(void *)(v43 + 8) = 0xE000000000000000;
        *(unsigned char *)(v43 + 16) = 2;
        swift_willThrow();
LABEL_31:
        v23 = sub_3EC48();
        v24 = sub_3EFB8();
        if (!os_log_type_enabled(v23, v24)) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      v29 = *(void *)&a2[OBJC_IVAR___PhonemeString_symbols + 8];
      if ((v29 & 0x2000000000000000) != 0) {
        v30 = HIBYTE(v29) & 0xF;
      }
      else {
        v30 = *(void *)&a2[OBJC_IVAR___PhonemeString_symbols] & 0xFFFFFFFFFFFFLL;
      }
      if (!v30)
      {
        sub_3F238(67);
        v64._object = (void *)0x8000000000042A10;
        v64._countAndFlagsBits = 0xD000000000000041;
        sub_3EE18(v64);
        v38 = [a2 description];
        goto LABEL_30;
      }
      sub_6280(a3, a3[3]);
      v31 = sub_33FD4(a1, 2, 0);
      if (v3) {
        goto LABEL_31;
      }
      v32 = sub_5138(a2, v31);
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0)
      {
        sub_6280(a3, a3[3]);
        v44 = sub_33FD4(a2, 0, 0);
        v45 = (void *)sub_1F1C8(v44);
        swift_bridgeObjectRelease();
        if (v45)
        {
          sub_5288(v45);
          v4 = v46;
          sub_6280((void *)buf + 2, *((void *)buf + 5));
          sub_3E608();

          v23 = sub_3EC48();
          v55 = sub_3EFB8();
          if (os_log_type_enabled(v23, v55))
          {
            v56 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_0, v23, v55, "End runP2P()", v56, 2u);
            swift_slowDealloc();
          }
          goto LABEL_13;
        }
        v50 = [a2 description];
        v51 = sub_3ED78();
        v53 = v52;

        v66._object = (void *)0xE900000000000052;
        v66._countAndFlagsBits = 0x5341766E206F7420;
        sub_3EE18(v66);
        sub_6120();
        swift_allocError();
        *(void *)v54 = v51;
        *(void *)(v54 + 8) = v53;
        *(unsigned char *)(v54 + 16) = 4;
LABEL_11:
        swift_willThrow();
        v23 = sub_3EC48();
        v24 = sub_3EFB8();
        if (!os_log_type_enabled(v23, v24)) {
          goto LABEL_13;
        }
LABEL_12:
        v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_0, v23, v24, "End runP2P()", v25, 2u);
        swift_slowDealloc();
LABEL_13:

        return v4;
      }
      v33 = a2;
      v34 = sub_3EC48();
      v35 = sub_3EFB8();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v57 = (void *)swift_slowAlloc();
        *(_DWORD *)v36 = 138412290;
        v37 = v33;
        sub_3F088();
        *v57 = v33;

        _os_log_impl(&dword_0, v34, v35, "Found exact match for %@, p2p distance is 0", v36, 0xCu);
        sub_62C4(&qword_528D8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      v47 = sub_3EC48();
      v48 = sub_3EFB8();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_0, v47, v48, "End runP2P()", v49, 2u);
        swift_slowDealloc();
      }

      return 0.0;
  }
}

uint64_t sub_5138(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v3 = a1;
    char v4 = sub_3F1D8();

    return v4 & 1;
  }
  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = sub_3F058(*(void *)(a2 + 40)),
        uint64_t v7 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }
  type metadata accessor for PhonemeString();
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = sub_3F068();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if ((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = sub_3F068();

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

void sub_5288(void *a1)
{
  v2 = (double **)0xE100000000000000;
  unint64_t v3 = sub_1A6C0();
  uint64_t v5 = v4;
  v48 = a1;
  unint64_t v6 = sub_1A6C0();
  unint64_t v8 = v7;
  if (qword_52760 != -1) {
    goto LABEL_81;
  }
  while (1)
  {
    uint64_t v9 = qword_57CA8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_6330(v3, v5, v9);
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = qword_57CA8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_6330(v6, (uint64_t)v8, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = 32;
    sub_6688();
    unint64_t v3 = sub_3F0A8();
    swift_bridgeObjectRelease();
    unint64_t v8 = (double *)sub_3F0A8();
    swift_bridgeObjectRelease();
    unint64_t v50 = v3;
    uint64_t v13 = *(void **)(v3 + 16);
    v52 = v8;
    unint64_t v6 = *((void *)v8 + 2);
    unint64_t v14 = sub_5BF0(v6 + 1, 0.0);
    id v15 = sub_5CE4((uint64_t)v14, (uint64_t)v13 + 1);
    v49 = v13;
    if (v13)
    {
      unint64_t v11 = (unint64_t)v15;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_4;
      }
    }
    else
    {
      __break(1u);
    }
    unint64_t v11 = (unint64_t)sub_631C((void *)v11);
LABEL_4:
    if (*(void *)(v11 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      unint64_t v8 = *(double **)(v11 + 40);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v11 + 40) = v8;
      if (isUniquelyReferenced_nonNull_native)
      {
        if (!*((void *)v8 + 2)) {
          goto LABEL_86;
        }
        goto LABEL_7;
      }
    }
    unint64_t v8 = (double *)sub_6308(v8);
    if (!*((void *)v8 + 2))
    {
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }
LABEL_7:
    v8[4] = 1.0;
    v51 = (void *)v11;
    *(void *)(v11 + 40) = v8;
    unint64_t v11 = (unint64_t)v13 - 1;
    if (v13 != (void *)((char *)&dword_0 + 1)) {
      goto LABEL_49;
    }
LABEL_8:
    if (!v6) {
      goto LABEL_87;
    }
    uint64_t v13 = v51;
    if (v51[2])
    {
      v2 = (double **)(v51 + 4);
      unint64_t v8 = (double *)v51[4];
      char v17 = swift_isUniquelyReferenced_nonNull_native();
      v51[4] = v8;
      if (v17) {
        goto LABEL_11;
      }
      goto LABEL_89;
    }
LABEL_88:
    __break(1u);
LABEL_89:
    unint64_t v8 = (double *)sub_6308(v8);
LABEL_11:
    if (*((void *)v8 + 2) < 2uLL) {
      break;
    }
    v8[5] = 1.0;
    *v2 = v8;
    unint64_t v56 = v6 - 1;
    if (v6 == 1)
    {
LABEL_13:
      if (*(void *)(v50 + 16))
      {
        unint64_t v11 = 1;
        unint64_t v53 = 0;
        v54 = (unint64_t *)(v50 + 32);
LABEL_15:
        if (*((void *)v52 + 2))
        {
          unint64_t v3 = 0;
          v18 = (uint64_t *)(v52 + 5);
          while (1)
          {
            unint64_t v6 = *v54;
            unint64_t v8 = (double *)v54[1];
            uint64_t v19 = *(v18 - 1);
            uint64_t v20 = *v18;
            double v21 = 0.0;
            BOOL v22 = *v54 == v19 && v8 == (double *)v20;
            if (!v22 && (sub_3F5A8() & 1) == 0)
            {
              uint64_t v23 = qword_52758;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if (v23 != -1) {
                swift_once();
              }
              uint64_t v24 = qword_57CA0;
              if (*(void *)(qword_57CA0 + 16))
              {
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v25 = v6;
                unint64_t v6 = v24;
                unint64_t v26 = sub_34B48(v25, (uint64_t)v8, v19, v20);
                double v21 = 1.0;
                if (v27) {
                  double v21 = *(double *)(*(void *)(v24 + 56) + 8 * v26);
                }
                swift_bridgeObjectRelease_n();
              }
              else
              {
                double v21 = 1.0;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v13 = v51;
            }
            unint64_t v28 = v13[2];
            if (v11 > v28) {
              break;
            }
            unint64_t v6 = v3 + 1;
            v29 = v2[v53];
            if (v3 + 1 >= *((void *)v29 + 2)) {
              goto LABEL_72;
            }
            if (v11 >= v28) {
              goto LABEL_73;
            }
            unint64_t v8 = v2[v11];
            if (v3 >= *((void *)v8 + 2)) {
              goto LABEL_74;
            }
            double v30 = v29[v3 + 5] + 1.0;
            v31 = &v8[v3];
            double v32 = v29[v3 + 4];
            if (v31[4] + 1.0 < v30) {
              double v30 = v31[4] + 1.0;
            }
            if (v21 + v32 >= v30) {
              double v33 = v30;
            }
            else {
              double v33 = v21 + v32;
            }
            char v34 = swift_isUniquelyReferenced_nonNull_native();
            v2[v11] = v8;
            if ((v34 & 1) == 0)
            {
              unint64_t v8 = (double *)sub_6308(v8);
              v2[v11] = v8;
            }
            if (v6 >= *((void *)v8 + 2)) {
              goto LABEL_75;
            }
            v8[v3 + 5] = v33;
            if (v56 == v3)
            {
              if ((void *)v11 != v49)
              {
                unint64_t v53 = v11;
                v54 = (unint64_t *)(v50 + 32 + 16 * v11);
                if (v11++ >= *(void *)(v50 + 16)) {
                  goto LABEL_48;
                }
                goto LABEL_15;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v38 = v13[2];
              if (!v38 || !*((void *)v2[v38 - 1] + 2))
              {
                sub_3F238(24);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                sub_62C4(&qword_528E8);
                v58._countAndFlagsBits = sub_3EEC8();
                sub_3EE18(v58);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_6120();
                swift_allocError();
                *(void *)uint64_t v46 = 0xD000000000000016;
                *(void *)(v46 + 8) = 0x8000000000042AB0;
                *(unsigned char *)(v46 + 16) = 1;
                swift_willThrow();
                swift_bridgeObjectRelease();
                return;
              }
              if (qword_527A8 != -1) {
                goto LABEL_91;
              }
              goto LABEL_67;
            }
            v18 += 2;
            if (++v3 >= *((void *)v52 + 2)) {
              goto LABEL_70;
            }
          }
        }
        else
        {
LABEL_70:
          __break(1u);
        }
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }
LABEL_48:
      __break(1u);
LABEL_49:
      uint64_t v13 = 0;
      v2 = (double **)(v51 + 6);
      while (1)
      {
        uint64_t v5 = (uint64_t)v13 + 2;
        if ((unint64_t)v13 + 2 >= v51[2]) {
          break;
        }
        unint64_t v3 = 8 * (void)v13;
        unint64_t v8 = v2[(void)v13];
        char v36 = swift_isUniquelyReferenced_nonNull_native();
        v2[(void)v13] = v8;
        if (v36)
        {
          if (!*((void *)v8 + 2)) {
            goto LABEL_56;
          }
        }
        else
        {
          unint64_t v8 = (double *)sub_6308(v8);
          v2[(void)v13] = v8;
          if (!*((void *)v8 + 2))
          {
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
        }
        v8[4] = (double)v5;
        uint64_t v13 = (void *)((char *)v13 + 1);
        if ((void *)v11 == v13) {
          goto LABEL_8;
        }
      }
      __break(1u);
      goto LABEL_79;
    }
LABEL_57:
    unint64_t v6 = 0;
    while (v13[2])
    {
      char v37 = swift_isUniquelyReferenced_nonNull_native();
      *v2 = v8;
      if ((v37 & 1) == 0) {
        unint64_t v8 = (double *)sub_6308(v8);
      }
      if (v6 + 2 >= *((void *)v8 + 2)) {
        goto LABEL_80;
      }
      v8[v6 + 6] = (double)(uint64_t)(v6 + 2);
      *v2 = v8;
      if (v56 == ++v6) {
        goto LABEL_13;
      }
    }
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    swift_once();
  }
  __break(1u);
LABEL_91:
  swift_once();
LABEL_67:
  uint64_t v39 = sub_3EC68();
  sub_60E8(v39, (uint64_t)qword_57CC8);
  id v40 = v47;
  id v41 = v48;
  unint64_t v8 = (double *)v40;
  v2 = (double **)v41;
  unint64_t v6 = sub_3EC48();
  os_log_type_t v42 = sub_3EFB8();
  if (os_log_type_enabled((os_log_t)v6, v42))
  {
    os_log_type_t v57 = v42;
    uint64_t v43 = swift_slowAlloc();
    v55 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 138412802;
    v44 = v8;
    sub_3F088();
    void *v55 = v8;

    *(_WORD *)(v43 + 12) = 2112;
    v45 = v2;
    sub_3F088();
    v55[1] = v2;

    *(_WORD *)(v43 + 22) = 2048;
    sub_3F088();
    _os_log_impl(&dword_0, (os_log_t)v6, v57, "Calculated Levenshtein Edit Distance between %@ and %@: %f", (uint8_t *)v43, 0x20u);
    sub_62C4(&qword_528D8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_bridgeObjectRelease();
    goto LABEL_77;
  }
LABEL_76:
  swift_bridgeObjectRelease();

  unint64_t v6 = (unint64_t)v8;
LABEL_77:
}

uint64_t sub_5B94()
{
  sub_66DC(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for P2PRunner()
{
  return self;
}

void *sub_5BF0(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    result = (void *)sub_3F368();
    __break(1u);
    return result;
  }
  if (!a1) {
    return _swiftEmptyArrayStorage;
  }
  result = (void *)sub_3EEF8();
  result[2] = a1;
  uint64_t v4 = (double *)(result + 4);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  unint64_t v8 = (int64x2_t *)(result + 6);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *unint64_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

void *sub_5CE4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    result = (void *)sub_3F368();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      sub_62C4(&qword_528E8);
      uint64_t v4 = (void *)sub_3EEF8();
      unint64_t v5 = v4;
      v4[2] = a2;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        uint64_t v6 = a2 - 2;
        if (v6)
        {
          int64x2_t v7 = v4 + 6;
          do
          {
            *v7++ = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
    return v5;
  }
  return result;
}

uint64_t sub_5DD8(uint64_t a1, uint64_t a2)
{
  return sub_5ED0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_5DF0()
{
  sub_3ED78();
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_5E44()
{
  sub_3ED78();
  sub_3F628();
  sub_3EDE8();
  Swift::Int v0 = sub_3F658();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_5EB8(uint64_t a1, uint64_t a2)
{
  return sub_5ED0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_5ED0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_3ED78();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_5F14(uint64_t a1, id *a2)
{
  uint64_t result = sub_3ED58();
  *a2 = 0;
  return result;
}

uint64_t sub_5F8C(uint64_t a1, id *a2)
{
  char v3 = sub_3ED68();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_600C@<X0>(void *a1@<X8>)
{
  sub_3ED78();
  NSString v2 = sub_3ED48();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_6050(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_605C()
{
  uint64_t v0 = sub_3ED78();
  uint64_t v2 = v1;
  if (v0 == sub_3ED78() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_60E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_6120()
{
  unint64_t result = qword_528D0;
  if (!qword_528D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_528D0);
  }
  return result;
}

uint64_t sub_6174@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_3ED48();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_61BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3ED78();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_61E8(uint64_t a1)
{
  uint64_t v2 = sub_6820((unint64_t *)&qword_52910);
  uint64_t v3 = sub_6820(&qword_52918);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void *sub_6280(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_62C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_6308(void *a1)
{
  return sub_1750C(0, a1[2], 0, a1);
}

void *sub_631C(void *a1)
{
  return sub_1761C(0, a1[2], 0, a1);
}

uint64_t sub_6330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v20 = a3 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a3 + 64);
  int64_t v21 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  uint64_t v18 = v3;
LABEL_5:
  uint64_t v19 = a1;
  if (v7) {
    goto LABEL_8;
  }
LABEL_9:
  if (!__OFADD__(v9++, 1))
  {
    if (v9 >= v21) {
      goto LABEL_35;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v9);
    if (v12)
    {
LABEL_19:
      uint64_t v23 = (v12 - 1) & v12;
      for (unint64_t i = __clz(__rbit64(v12)) + (v9 << 6); ; unint64_t i = __clz(__rbit64(v7)) | (v9 << 6))
      {
        uint64_t v14 = *(void *)(*(void *)(v3 + 56) + 8 * i);
        sub_6688();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (sub_3F0F8())
        {
          int64_t v22 = v9;
          uint64_t v15 = *(void *)(v14 + 16);
          if (v15)
          {
            swift_bridgeObjectRetain();
            uint64_t v16 = v14 + 40;
            do
            {
              swift_bridgeObjectRetain();
              if (sub_3F0F8())
              {
                swift_bridgeObjectRelease();
                a1 = sub_3F0D8();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t result = swift_bridgeObjectRelease();
                uint64_t v3 = v18;
                int64_t v9 = v22;
                unint64_t v7 = v23;
                goto LABEL_5;
              }
              v16 += 16;
              swift_bridgeObjectRelease();
              --v15;
            }
            while (v15);
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease_n();
            a1 = v19;
            uint64_t v3 = v18;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
          }
          int64_t v9 = v22;
          unint64_t v7 = v23;
          if (!v23) {
            goto LABEL_9;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v7 = v23;
          if (!v23) {
            goto LABEL_9;
          }
        }
LABEL_8:
        uint64_t v23 = (v7 - 1) & v7;
      }
    }
    int64_t v13 = v9 + 1;
    if (v9 + 1 >= v21) {
      goto LABEL_35;
    }
    unint64_t v12 = *(void *)(v20 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = v9 + 2;
      if (v9 + 2 >= v21) {
        goto LABEL_35;
      }
      unint64_t v12 = *(void *)(v20 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v9 + 3;
        if (v9 + 3 < v21)
        {
          unint64_t v12 = *(void *)(v20 + 8 * v13);
          if (v12) {
            goto LABEL_18;
          }
          int64_t v17 = v9 + 4;
          if (v9 + 4 < v21)
          {
            unint64_t v12 = *(void *)(v20 + 8 * v17);
            v9 += 4;
            if (v12) {
              goto LABEL_19;
            }
            while (1)
            {
              int64_t v9 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_37;
              }
              if (v9 >= v21) {
                break;
              }
              unint64_t v12 = *(void *)(v20 + 8 * v9);
              ++v17;
              if (v12) {
                goto LABEL_19;
              }
            }
          }
        }
LABEL_35:
        swift_release();
        return a1;
      }
    }
LABEL_18:
    int64_t v9 = v13;
    goto LABEL_19;
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_6688()
{
  unint64_t result = qword_528E0;
  if (!qword_528E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_528E0);
  }
  return result;
}

uint64_t sub_66DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_528F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_528F0);
    }
  }
}

uint64_t sub_6784()
{
  return sub_6820(&qword_528F8);
}

uint64_t sub_67B8()
{
  return sub_6820(&qword_52900);
}

uint64_t sub_67EC()
{
  return sub_6820(&qword_52908);
}

uint64_t sub_6820(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_6868()
{
  uint64_t v1 = v0;
  sub_3F238(295);
  v21._countAndFlagsBits = 0xD00000000000001DLL;
  v21._object = (void *)0x8000000000042CB0;
  sub_3EE18(v21);
  sub_3E558();
  sub_BC2C((unint64_t *)&qword_52C00, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  v22._countAndFlagsBits = sub_3F598();
  sub_3EE18(v22);
  swift_bridgeObjectRelease();
  v23._object = (void *)0x8000000000042CD0;
  v23._countAndFlagsBits = 0xD000000000000010;
  sub_3EE18(v23);
  uint64_t v2 = (int *)type metadata accessor for TMDCGroundTruth();
  uint64_t v3 = (uint64_t *)(v0 + v2[6]);
  uint64_t v4 = *v3;
  uint64_t v5 = (void *)v3[1];
  swift_bridgeObjectRetain();
  v24._countAndFlagsBits = v4;
  v24._object = v5;
  sub_3EE18(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 0xD000000000000012;
  v25._object = (void *)0x8000000000042CF0;
  sub_3EE18(v25);
  v26._countAndFlagsBits = sub_3F598();
  sub_3EE18(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 0xD000000000000015;
  v27._object = (void *)0x8000000000042D10;
  sub_3EE18(v27);
  uint64_t v6 = (uint64_t *)(v0 + v2[8]);
  uint64_t v7 = *v6;
  unint64_t v8 = (void *)v6[1];
  swift_bridgeObjectRetain();
  v28._countAndFlagsBits = v7;
  v28._object = v8;
  sub_3EE18(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = 0xD00000000000001ELL;
  v29._object = (void *)0x8000000000042D30;
  sub_3EE18(v29);
  id v9 = *(id *)(v0 + v2[9]);
  id v10 = [v9 description];
  uint64_t v11 = sub_3ED78();
  int64_t v13 = v12;

  v30._countAndFlagsBits = v11;
  v30._object = v13;
  sub_3EE18(v30);

  swift_bridgeObjectRelease();
  v31._countAndFlagsBits = 0xD000000000000020;
  v31._object = (void *)0x8000000000042D50;
  sub_3EE18(v31);
  id v14 = *(id *)(v1 + v2[10]);
  sub_62C4(&qword_52C08);
  v32._countAndFlagsBits = sub_3EDC8();
  sub_3EE18(v32);
  swift_bridgeObjectRelease();
  v33._object = (void *)0x8000000000042D80;
  v33._countAndFlagsBits = 0xD000000000000010;
  sub_3EE18(v33);
  sub_3EF68();
  v34._countAndFlagsBits = 0x6F7320676F4C0A2CLL;
  v34._object = (void *)0xEE00203A65637275;
  sub_3EE18(v34);
  sub_3F348();
  v35._countAndFlagsBits = 0xD000000000000021;
  v35._object = (void *)0x8000000000042DA0;
  sub_3EE18(v35);
  uint64_t v15 = (uint64_t *)(v1 + v2[13]);
  if (v15[1])
  {
    uint64_t v16 = *v15;
    int64_t v17 = (void *)v15[1];
  }
  else
  {
    uint64_t v16 = 0xD000000000000014;
    int64_t v17 = (void *)0x8000000000042DD0;
  }
  swift_bridgeObjectRetain();
  v36._countAndFlagsBits = v16;
  v36._object = v17;
  sub_3EE18(v36);
  swift_bridgeObjectRelease();
  v37._countAndFlagsBits = 0xD00000000000002DLL;
  v37._object = (void *)0x8000000000042DF0;
  sub_3EE18(v37);
  if (*(unsigned char *)(v1 + v2[12])) {
    v18._countAndFlagsBits = 0x6F6E6F727073696DLL;
  }
  else {
    v18._countAndFlagsBits = 0xD000000000000013;
  }
  if (*(unsigned char *)(v1 + v2[12])) {
    uint64_t v19 = (void *)0xED00006465636E75;
  }
  else {
    uint64_t v19 = (void *)0x8000000000042E20;
  }
  v18._object = v19;
  sub_3EE18(v18);
  swift_bridgeObjectRelease();
  v38._countAndFlagsBits = 0xD000000000000015;
  v38._object = (void *)0x8000000000042E40;
  sub_3EE18(v38);
  return 0;
}

unint64_t sub_6CAC(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6372756F53676F6CLL;
      break;
    case 2:
      unint64_t result = 0x4E746361746E6F63;
      break;
    case 3:
      unint64_t result = 0x69666E6F43727361;
      break;
    case 4:
      unint64_t result = 0x656E6F6850727361;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0x6174736944703270;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

BOOL sub_6E1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_6E34()
{
  sub_3F638(*v0);
}

unint64_t sub_6E64()
{
  return sub_6CAC(*v0);
}

uint64_t sub_6E6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_9718(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_6E94()
{
  return 0;
}

void sub_6EA0(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_6EAC(uint64_t a1)
{
  unint64_t v2 = sub_BA70();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_6EE8(uint64_t a1)
{
  unint64_t v2 = sub_BA70();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_6F24(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4(&qword_52DB8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  unint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_BA70();
  sub_3F688();
  LOBYTE(v12) = 0;
  sub_3E558();
  sub_BC2C(&qword_52DC0, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_3F558();
  if (!v2)
  {
    id v9 = (int *)type metadata accessor for TMDCGroundTruth();
    LOBYTE(v12) = *(unsigned char *)(v3 + v9[5]);
    char v13 = 1;
    sub_BBD8();
    sub_3F558();
    LOBYTE(v12) = 2;
    sub_3F528();
    LOBYTE(v12) = 3;
    sub_3F578();
    LOBYTE(v12) = 4;
    sub_3F528();
    uint64_t v12 = *(void *)(v3 + v9[9]);
    char v13 = 5;
    type metadata accessor for ContactPronunciation();
    sub_BC2C(&qword_52DD0, 255, (void (*)(uint64_t))type metadata accessor for ContactPronunciation);
    sub_3F558();
    uint64_t v12 = *(void *)(v3 + v9[10]);
    char v13 = 6;
    type metadata accessor for CorrectedPronunciation();
    sub_BC2C(&qword_52DD8, v10, (void (*)(uint64_t))type metadata accessor for CorrectedPronunciation);
    sub_3F508();
    LOBYTE(v12) = 7;
    sub_3F548();
    LOBYTE(v12) = 8;
    sub_3F538();
    LOBYTE(v12) = 9;
    sub_3F4E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_7304(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v4 = sub_3E558();
  uint64_t v41 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_62C4(&qword_52D88);
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v36 = v7;
  __chkstk_darwin();
  id v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TMDCGroundTruth();
  __chkstk_darwin();
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3E548();
  sub_3E9B8();
  swift_allocObject();
  sub_3E9A8();
  char v13 = sub_3E998();
  swift_release();
  uint64_t v39 = (int *)v10;
  id v40 = v12;
  uint64_t v14 = *(int *)(v10 + 20);
  v12[v14] = (v13 & 1) == 0;
  uint64_t v15 = a1[3];
  Swift::String v38 = a1;
  sub_6280(a1, v15);
  sub_BA70();
  Swift::String v37 = v9;
  sub_3F678();
  if (v2)
  {
    int64_t v17 = v40;
    sub_66DC((uint64_t)v38);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v4);
  }
  else
  {
    uint64_t v16 = v35;
    LOBYTE(v42) = 0;
    sub_BC2C(&qword_52D98, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_3F498();
    Swift::String v18 = v40;
    (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v40, v6, v4);
    char v43 = 1;
    sub_BAC4();
    sub_3F498();
    v18[v14] = v42;
    LOBYTE(v42) = 2;
    uint64_t v19 = sub_3F468();
    uint64_t v20 = v39;
    Swift::String v21 = (uint64_t *)&v18[v39[6]];
    *Swift::String v21 = v19;
    v21[1] = v22;
    LOBYTE(v42) = 3;
    *(void *)&v18[v20[7]] = sub_3F4B8();
    LOBYTE(v42) = 4;
    uint64_t v23 = sub_3F468();
    Swift::String v24 = (uint64_t *)&v18[v20[8]];
    *Swift::String v24 = v23;
    v24[1] = v25;
    type metadata accessor for ContactPronunciation();
    char v43 = 5;
    sub_BC2C(&qword_52DA8, 255, (void (*)(uint64_t))type metadata accessor for ContactPronunciation);
    sub_3F498();
    *(void *)&v18[v20[9]] = v42;
    type metadata accessor for CorrectedPronunciation();
    char v43 = 6;
    sub_BC2C(&qword_52DB0, v26, (void (*)(uint64_t))type metadata accessor for CorrectedPronunciation);
    sub_3F448();
    *(void *)&v18[v20[10]] = v42;
    LOBYTE(v42) = 7;
    sub_3F488();
    *(void *)&v18[v20[11]] = v27;
    LOBYTE(v42) = 8;
    v18[v20[12]] = sub_3F478() & 1;
    LOBYTE(v42) = 9;
    uint64_t v28 = sub_3F428();
    uint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v37, v36);
    uint64_t v31 = (uint64_t)v40;
    Swift::String v32 = (uint64_t *)&v40[v39[13]];
    *Swift::String v32 = v28;
    v32[1] = v30;
    sub_BB18(v31, v34);
    sub_66DC((uint64_t)v38);
    sub_BB7C(v31);
  }
}

void sub_7A10(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_7A28(void *a1)
{
  return sub_6F24(a1);
}

void sub_7A58()
{
  qword_52AA8 = 0x656C61636F6CLL;
  unk_52AB0 = 0xE600000000000000;
}

uint64_t sub_7AE0()
{
  sub_3F238(96);
  v7._countAndFlagsBits = 0x656C61636F6C207BLL;
  v7._object = (void *)0xEA0000000000203ALL;
  sub_3EE18(v7);
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CorrectedPronunciation_locale);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___CorrectedPronunciation_locale + 8);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v1;
  v8._object = v2;
  sub_3EE18(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0xD00000000000001ALL;
  v9._object = (void *)0x8000000000042EB0;
  sub_3EE18(v9);
  id v3 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  sub_62C4(&qword_52C40);
  v10._countAndFlagsBits = sub_3EDC8();
  sub_3EE18(v10);
  swift_bridgeObjectRelease();
  v11._object = (void *)0x8000000000042ED0;
  v11._countAndFlagsBits = 0xD000000000000019;
  sub_3EE18(v11);
  id v4 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  v12._countAndFlagsBits = sub_3EDC8();
  sub_3EE18(v12);
  swift_bridgeObjectRelease();
  v13._object = (void *)0x8000000000042EF0;
  v13._countAndFlagsBits = 0xD000000000000019;
  sub_3EE18(v13);
  id v5 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  v14._countAndFlagsBits = sub_3EDC8();
  sub_3EE18(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 32032;
  v15._object = (void *)0xE200000000000000;
  sub_3EE18(v15);
  return 0;
}

id sub_7CA0(void *a1)
{
  uint64_t v2 = v1;
  sub_BA34(0, (unint64_t *)&unk_53520);
  uint64_t v4 = qword_52720;
  id v5 = v2;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_3F048();
  if (v6)
  {
    Swift::String v7 = (void *)v6;
    uint64_t v8 = sub_3ED78();
    uint64_t v10 = v9;

    Swift::String v11 = (uint64_t *)&v5[OBJC_IVAR___CorrectedPronunciation_locale];
    *Swift::String v11 = v8;
    v11[1] = v10;
    type metadata accessor for PhonemeString();
    *(void *)&v5[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = sub_3F048();
    *(void *)&v5[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = sub_3F048();
    *(void *)&v5[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = sub_3F048();

    v14.receiver = v5;
    v14.super_class = (Class)type metadata accessor for CorrectedPronunciation();
    id v12 = objc_msgSendSuper2(&v14, "init");
  }
  else
  {

    type metadata accessor for CorrectedPronunciation();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v12;
}

void sub_7E84(void *a1)
{
  NSString v3 = sub_3ED48();
  if (qword_52720 != -1) {
    swift_once();
  }
  NSString v4 = sub_3ED48();
  [a1 encodeObject:v3 forKey:v4];

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  NSString v6 = sub_3ED48();
  [a1 encodeObject:v5 forKey:v6];

  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  NSString v8 = sub_3ED48();
  [a1 encodeObject:v7 forKey:v8];

  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  NSString v10 = sub_3ED48();
  [a1 encodeObject:v9 forKey:v10];
}

uint64_t sub_8080(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_AC94(a1, (uint64_t)v23);
  if (!v24)
  {
    sub_AC34((uint64_t)v23);
    goto LABEL_23;
  }
  type metadata accessor for CorrectedPronunciation();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_23:
    char v19 = 0;
    return v19 & 1;
  }
  BOOL v3 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_locale) == *(void *)&v22[OBJC_IVAR___CorrectedPronunciation_locale]
    && *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_locale + 8) == *(void *)&v22[OBJC_IVAR___CorrectedPronunciation_locale
                                                                                        + 8];
  if (!v3 && (sub_3F5A8() & 1) == 0) {
    goto LABEL_22;
  }
  NSString v4 = *(void **)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  uint64_t v5 = *(void **)&v22[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString];
  if (v4)
  {
    if (!v5) {
      goto LABEL_22;
    }
    type metadata accessor for PhonemeString();
    id v6 = v5;
    id v7 = v4;
    char v8 = sub_3F068();

    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (v5)
  {
    goto LABEL_22;
  }
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  NSString v10 = *(void **)&v22[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString];
  if (!v9)
  {
    if (!v10) {
      goto LABEL_19;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!v10) {
    goto LABEL_22;
  }
  type metadata accessor for PhonemeString();
  id v11 = v10;
  id v12 = v9;
  char v13 = sub_3F068();

  if ((v13 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  objc_super v14 = *(void **)(v2 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  Swift::String v15 = *(void **)&v22[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString];
  if (!v14)
  {
    id v21 = v15;

    if (!v15)
    {
      char v19 = 1;
      return v19 & 1;
    }

    goto LABEL_23;
  }
  if (!v15) {
    goto LABEL_22;
  }
  type metadata accessor for PhonemeString();
  id v16 = v14;
  id v17 = v15;
  id v18 = v16;
  char v19 = sub_3F068();

  return v19 & 1;
}

unint64_t sub_8308(char a1)
{
  unint64_t result = 0xD00000000000001BLL;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      unint64_t result = 0x656C61636F6CLL;
      break;
  }
  return result;
}

unint64_t sub_8398()
{
  return sub_8308(*v0);
}

uint64_t sub_83A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_9B18(a1, a2);
  *a3 = result;
  return result;
}

void sub_83C8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_83D4(uint64_t a1)
{
  unint64_t v2 = sub_ABE0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_8410(uint64_t a1)
{
  unint64_t v2 = sub_ABE0();

  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_844C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CorrectedPronunciation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CorrectedPronunciation()
{
  return self;
}

uint64_t sub_8514(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4(&qword_52C20);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  char v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_ABE0();
  sub_3F688();
  LOBYTE(v11) = 0;
  sub_3F528();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
    HIBYTE(v10) = 1;
    type metadata accessor for PhonemeString();
    sub_BC2C(&qword_52C28, 255, (void (*)(uint64_t))type metadata accessor for PhonemeString);
    sub_3F508();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
    HIBYTE(v10) = 2;
    sub_3F508();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
    HIBYTE(v10) = 3;
    sub_3F508();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_8760(void *a1)
{
  uint64_t v19 = sub_62C4(&qword_52BE8);
  uint64_t v4 = *(void *)(v19 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v20 = a1;
  char v8 = sub_6280(a1, v7);
  sub_ABE0();
  uint64_t v9 = v1;
  id v10 = v8;
  sub_3F678();
  if (v2)
  {
    sub_66DC((uint64_t)v20);

    type metadata accessor for CorrectedPronunciation();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v4;
    LOBYTE(v23) = 0;
    uint64_t v12 = v19;
    uint64_t v13 = sub_3F468();
    Swift::String v15 = (uint64_t *)&v9[OBJC_IVAR___CorrectedPronunciation_locale];
    *Swift::String v15 = v13;
    v15[1] = v16;
    id v18 = v15;
    type metadata accessor for PhonemeString();
    char v22 = 1;
    sub_BC2C(&qword_52BF8, 255, (void (*)(uint64_t))type metadata accessor for PhonemeString);
    sub_3F448();
    *(void *)&v9[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = v23;
    char v22 = 2;
    sub_3F448();
    *(void *)&v9[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = v23;
    char v22 = 3;
    sub_3F448();
    *(void *)&v9[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = v23;

    id v17 = (objc_class *)type metadata accessor for CorrectedPronunciation();
    v21.receiver = v9;
    v21.super_class = v17;
    id v10 = objc_msgSendSuper2(&v21, "init");
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v12);
    sub_66DC((uint64_t)v20);
  }
  return v10;
}

id sub_8B04@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for CorrectedPronunciation());
  id result = sub_8760(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_8B58(void *a1)
{
  return sub_8514(a1);
}

id sub_8C40()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CorrectedPronunciationValueTransformer()
{
  return self;
}

uint64_t sub_8CA0(char a1)
{
  return *(void *)&aInternalclient[8 * a1];
}

uint64_t sub_8CC0(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_62C4(&qword_52D60);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  __chkstk_darwin();
  objc_super v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_62C4(&qword_52D68);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_62C4(&qword_52D70);
  uint64_t v18 = *(void *)(v8 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_62C4(&qword_52D78);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  objc_super v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_B8E4();
  sub_3F688();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_B98C();
      sub_3F4D8();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_B938();
      Swift::String v15 = v21;
      sub_3F4D8();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_B9E0();
    sub_3F4D8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_902C()
{
  return 0;
}

void sub_9038(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_9044(uint64_t a1)
{
  unint64_t v2 = sub_B98C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9080(uint64_t a1)
{
  unint64_t v2 = sub_B98C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_90BC()
{
  return sub_8CA0(*v0);
}

uint64_t sub_90C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_9CA8(a1, a2);
  *a3 = result;
  return result;
}

void sub_90EC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_90F8(uint64_t a1)
{
  unint64_t v2 = sub_B8E4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9134(uint64_t a1)
{
  unint64_t v2 = sub_B8E4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_9170@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_91A0(uint64_t a1)
{
  unint64_t v2 = sub_B9E0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_91DC(uint64_t a1)
{
  unint64_t v2 = sub_B9E0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_9218(uint64_t a1)
{
  unint64_t v2 = sub_B938();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_9254(uint64_t a1)
{
  unint64_t v2 = sub_B938();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_9290()
{
  Swift::UInt v1 = *v0;
  sub_3F628();
  sub_3F638(v1);
  return sub_3F658();
}

Swift::Int sub_92D8()
{
  Swift::UInt v1 = *v0;
  sub_3F628();
  sub_3F638(v1);
  return sub_3F658();
}

void *sub_931C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_9E00(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_9348(void *a1)
{
  return sub_8CC0(a1, *v1);
}

void sub_9364()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_3ED48();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_52AB8 = v2;
}

uint64_t sub_93F4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TMDCSELFLogger()
{
  return self;
}

uint64_t sub_9428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_3E558();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3E548();
  unint64_t v13 = sub_A370(a1, (uint64_t)v12, a2, a3, a4);
  if (!v4)
  {
    sub_A8CC(v13);
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

BOOL sub_9548(uint64_t a1, uint64_t a2)
{
  if ((sub_3E528() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for TMDCGroundTruth();
  if (*(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (v10 || (char v11 = sub_3F5A8(), result = 0, (v11 & 1) != 0))
  {
    if (*(void *)(a1 + v5[7]) != *(void *)(a2 + v5[7])) {
      return 0;
    }
    uint64_t v13 = v5[8];
    uint64_t v14 = *(void *)(a1 + v13);
    uint64_t v15 = *(void *)(a1 + v13 + 8);
    uint64_t v16 = (void *)(a2 + v13);
    BOOL v17 = v14 == *v16 && v15 == v16[1];
    if (v17 || (v18 = sub_3F5A8(), BOOL result = 0, (v18 & 1) != 0))
    {
      sub_BA34(0, &qword_52D80);
      if (sub_3F068())
      {
        uint64_t v19 = v5[10];
        uint64_t v20 = *(void **)(a1 + v19);
        objc_super v21 = *(void **)(a2 + v19);
        if (v20)
        {
          if (!v21) {
            return 0;
          }
          type metadata accessor for CorrectedPronunciation();
          id v22 = v21;
          id v23 = v20;
          char v24 = sub_3F068();

          if ((v24 & 1) == 0) {
            return 0;
          }
        }
        else if (v21)
        {
          return 0;
        }
        if (*(double *)(a1 + v5[11]) != *(double *)(a2 + v5[11])
          || *(unsigned __int8 *)(a1 + v5[12]) != *(unsigned __int8 *)(a2 + v5[12]))
        {
          return 0;
        }
        uint64_t v25 = v5[13];
        char v26 = (void *)(a1 + v25);
        uint64_t v27 = *(void *)(a1 + v25 + 8);
        uint64_t v28 = (void *)(a2 + v25);
        uint64_t v29 = v28[1];
        if (v27) {
          return v29 && (*v26 == *v28 && v27 == v29 || (sub_3F5A8() & 1) != 0);
        }
        if (!v29) {
          return 1;
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_9718(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6372756F53676F6CLL && a2 == 0xE900000000000065 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E746361746E6F63 && a2 == 0xEB00000000656D61 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x69666E6F43727361 && a2 == 0xED000065636E6564 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E6F6850727361 && a2 == 0xEB0000000073656DLL || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000000042F40 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000000042F60 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6174736944703270 && a2 == 0xEB0000000065636ELL || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000000042F80 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000000042FA0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

uint64_t sub_9B18(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x8000000000042B90 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000000042BB0 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000000042BD0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_9CA8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C616E7265746E69 && a2 == 0xEE00656372756F53;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E65696C63 && a2 == 0xE600000000000000 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_9E00(void *a1)
{
  uint64_t v2 = sub_62C4(&qword_52D18);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_62C4(&qword_52D20);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_62C4(&qword_52D28);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_62C4(&qword_52D30);
  uint64_t v28 = *(void *)(v9 - 8);
  __chkstk_darwin();
  char v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_6280(a1, a1[3]);
  sub_B8E4();
  uint64_t v12 = (uint64_t)v30;
  sub_3F678();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_3F4C8();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_3F2A8();
    swift_allocError();
    char v11 = v18;
    sub_62C4(&qword_52D40);
    *char v11 = &type metadata for LogSource;
    sub_3F418();
    sub_3F298();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, enum case for DecodingError.typeMismatch(_:), v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    sub_66DC((uint64_t)a1);
    return v11;
  }
  char v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_B98C();
      sub_3F408();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_B938();
      sub_3F408();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_B9E0();
    sub_3F408();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  sub_66DC((uint64_t)v30);
  return v11;
}

uint64_t sub_A370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = [objc_allocWithZone((Class)PLUSSchemaPLUSClientEvent) init];
  if (!v10) {
    goto LABEL_18;
  }
  char v11 = v10;
  id v12 = [objc_allocWithZone((Class)PLUSSchemaPLUSClientEventMetadata) init];
  if (!v12)
  {
LABEL_17:

LABEL_18:
    sub_AB40();
    swift_allocError();
    *char v33 = xmmword_40180;
    swift_willThrow();
    return a2;
  }
  uint64_t v13 = v12;
  uint64_t v44 = a5;
  id v14 = [objc_allocWithZone((Class)PLUSSchemaPLUSTMDCGroundTruthGenerated) init];
  if (!v14)
  {
    id v15 = v13;
LABEL_16:

    char v11 = v15;
    goto LABEL_17;
  }
  id v15 = v14;
  uint64_t v45 = a1;
  id v16 = [objc_allocWithZone((Class)PLUSSchemaPLUSTMDCGroundTruth) init];
  if (!v16)
  {

    char v11 = v13;
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  id v43 = v15;
  id v18 = objc_allocWithZone((Class)SISchemaUUID);
  Class isa = sub_3E518().super.isa;
  id v42 = [v18 initWithNSUUID:isa];

  [v17 setAsrPostItnLinkId:a4];
  [v17 setAsrRawRecognitionLinkId:a3];
  id v20 = [objc_allocWithZone((Class)PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1) init];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v41 = *(void *)(v45 + *(int *)(type metadata accessor for TMDCGroundTruth() + 36));
    swift_bridgeObjectRetain();
    uint64_t v22 = v17;
    NSString v23 = sub_3ED48();
    swift_bridgeObjectRelease();
    [v21 setPhonemes:v23];

    uint64_t v17 = v22;
    if (*(unsigned char *)(v41 + OBJC_IVAR___ContactPronunciation_source)) {
      uint64_t v24 = 2 * (*(unsigned char *)(v41 + OBJC_IVAR___ContactPronunciation_source) == 2);
    }
    else {
      uint64_t v24 = 1;
    }
    [v21 setSource:v24];
    [v22 setSiriCurrentPronunciation:v21];
  }
  uint64_t v25 = (int *)type metadata accessor for TMDCGroundTruth();
  uint64_t v26 = *(void **)(v45 + v25[10]);
  if (v26)
  {
    id v27 = objc_allocWithZone((Class)PLUSSchemaPLUSTMDCCorrectedPronunciationTier1);
    uint64_t v28 = v26;
    id v29 = [v27 init];
    if (v29)
    {
      uint64_t v30 = v29;
      char v31 = v17;
      if (*(void *)&v28[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString])
      {
        swift_bridgeObjectRetain();
        NSString v32 = sub_3ED48();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v32 = 0;
      }
      [v30 setFirstNamePhonemes:v32];

      if (*(void *)&v28[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString])
      {
        swift_bridgeObjectRetain();
        NSString v35 = sub_3ED48();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v35 = 0;
      }
      [v30 setLastNamePhonemes:v35];

      if (*(void *)&v28[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString])
      {
        swift_bridgeObjectRetain();
        NSString v36 = sub_3ED48();
        swift_bridgeObjectRelease();
      }
      else
      {
        NSString v36 = 0;
      }
      [v30 setNicknamePhonemes:v36];

      uint64_t v17 = v31;
      [v31 setCorrectedPronunciation:v30];
    }
    else
    {
      uint64_t v30 = v28;
    }
  }
  id v37 = objc_allocWithZone((Class)SISchemaUUID);
  Class v38 = sub_3E518().super.isa;
  id v39 = [v37 initWithNSUUID:v38];

  [v17 setGroundTruthId:v39];
  [v17 setIsTTSMispronounced:*(unsigned __int8 *)(v45 + v25[12])];
  [v17 setPhonemesToPhonemesDistance:*(double *)(v45 + v25[11])];
  [v43 setGroundTruth:v17];
  [v43 setOriginalRequestId:v44];
  [v13 setPlusId:v42];
  [v11 setTmdcGroundTruthGenerated:v43];
  [v11 setEventMetadata:v13];
  sub_62C4(&qword_52BE0);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_40170;
  *(void *)(v40 + 32) = v11;
  uint64_t v46 = v40;
  sub_3EED8();
  a2 = v46;

  return a2;
}

void sub_A8CC(unint64_t a1)
{
  if (qword_52728 != -1) {
    swift_once();
  }
  if (byte_52AB8)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_3EC68();
    sub_60E8(v2, (uint64_t)qword_57CC8);
    oslog = sub_3EC48();
    os_log_type_t v3 = sub_3EFB8();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, oslog, v3, "Omitting SELF logging call as UsageLoggingDisabled flag present", v4, 2u);
      swift_slowDealloc();
    }

    return;
  }
  id v5 = [self sharedAnalytics];
  id v6 = [v5 defaultMessageStream];

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_3F378();
    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_13:
      if (v7 < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v8 = 0;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v9 = (id)sub_3F278();
        }
        else {
          id v9 = *(id *)(a1 + 8 * v8 + 32);
        }
        id v10 = v9;
        ++v8;
        Class isa = sub_3E518().super.isa;
        [v6 emitMessage:v10 isolatedStreamUUID:isa];
      }
      while (v7 != v8);
    }
  }

  swift_bridgeObjectRelease();
}

unint64_t sub_AB40()
{
  unint64_t result = qword_52BD8;
  if (!qword_52BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52BD8);
  }
  return result;
}

uint64_t type metadata accessor for TMDCGroundTruth()
{
  uint64_t result = qword_52CA0;
  if (!qword_52CA0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_ABE0()
{
  unint64_t result = qword_52BF0;
  if (!qword_52BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52BF0);
  }
  return result;
}

uint64_t sub_AC34(uint64_t a1)
{
  uint64_t v2 = sub_62C4((uint64_t *)&unk_52C30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_AC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4((uint64_t *)&unk_52C30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for PhonemeFormat(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LogSource()
{
  return &type metadata for LogSource;
}

uint64_t getEnumTagSinglePayload for PhonemeFormat(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CorrectedPronunciation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0xAE84);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectedPronunciation.CodingKeys()
{
  return &type metadata for CorrectedPronunciation.CodingKeys;
}

void *sub_AEBC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_3E558();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    id v9 = (void *)((char *)a1 + v8);
    id v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *id v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    uint64_t v13 = (void *)((char *)a1 + v12);
    id v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[9];
    uint64_t v17 = a3[10];
    id v18 = *(void **)((char *)a2 + v16);
    *(void *)((char *)a1 + v16) = v18;
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v19;
    uint64_t v20 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
    uint64_t v21 = a3[13];
    uint64_t v22 = (void *)((char *)a1 + v21);
    NSString v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v25 = v18;
    id v26 = v19;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_B014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3E558();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_B0C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_3E558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[9];
  uint64_t v16 = a3[10];
  uint64_t v17 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v17;
  id v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v19) = *(unsigned char *)(a2 + v19);
  uint64_t v20 = a3[13];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = v17;
  id v25 = v18;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_B1CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_3E558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[9];
  uint64_t v14 = *(void **)(a2 + v13);
  uint64_t v15 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = v14;
  id v16 = v14;

  uint64_t v17 = a3[10];
  id v18 = *(void **)(a1 + v17);
  uint64_t v19 = *(void **)(a2 + v17);
  *(void *)(a1 + v17) = v19;
  id v20 = v19;

  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  uint64_t v21 = a3[13];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_B320(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_3E558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_B3EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_3E558();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[9];
  id v18 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);

  uint64_t v19 = a3[10];
  id v20 = *(void **)(a1 + v19);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);

  uint64_t v21 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v21) = *(unsigned char *)(a2 + v21);
  uint64_t v22 = a3[13];
  uint64_t v23 = (void *)(a1 + v22);
  id v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_B4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B510);
}

uint64_t sub_B510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3E558();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_B5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B5E8);
}

uint64_t sub_B5E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_3E558();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_B6A8()
{
  uint64_t result = sub_3E558();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_B788()
{
  unint64_t result = qword_52CF8;
  if (!qword_52CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52CF8);
  }
  return result;
}

unint64_t sub_B7E0()
{
  unint64_t result = qword_52D00;
  if (!qword_52D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D00);
  }
  return result;
}

unint64_t sub_B838()
{
  unint64_t result = qword_52D08;
  if (!qword_52D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D08);
  }
  return result;
}

unint64_t sub_B890()
{
  unint64_t result = qword_52D10;
  if (!qword_52D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D10);
  }
  return result;
}

unint64_t sub_B8E4()
{
  unint64_t result = qword_52D38;
  if (!qword_52D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D38);
  }
  return result;
}

unint64_t sub_B938()
{
  unint64_t result = qword_52D48;
  if (!qword_52D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D48);
  }
  return result;
}

unint64_t sub_B98C()
{
  unint64_t result = qword_52D50;
  if (!qword_52D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D50);
  }
  return result;
}

unint64_t sub_B9E0()
{
  unint64_t result = qword_52D58;
  if (!qword_52D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D58);
  }
  return result;
}

uint64_t sub_BA34(uint64_t a1, unint64_t *a2)
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

unint64_t sub_BA70()
{
  unint64_t result = qword_52D90;
  if (!qword_52D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52D90);
  }
  return result;
}

unint64_t sub_BAC4()
{
  unint64_t result = qword_52DA0;
  if (!qword_52DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DA0);
  }
  return result;
}

uint64_t sub_BB18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TMDCGroundTruth();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_BB7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TMDCGroundTruth();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_BBD8()
{
  unint64_t result = qword_52DC8;
  if (!qword_52DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DC8);
  }
  return result;
}

uint64_t sub_BC2C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t getEnumTagSinglePayload for TMDCGroundTruth.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TMDCGroundTruth.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 9;
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
        JUMPOUT(0xBDD0);
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
          void *result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t sub_BDF8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_BE00(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TMDCGroundTruth.CodingKeys()
{
  return &type metadata for TMDCGroundTruth.CodingKeys;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin9LogSourceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s44SiriPrivateLearningTTSMispronunciationPlugin9LogSourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0xBF74);
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

ValueMetadata *type metadata accessor for LogSource.CodingKeys()
{
  return &type metadata for LogSource.CodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.InternalSourceCodingKeys()
{
  return &type metadata for LogSource.InternalSourceCodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.ClientCodingKeys()
{
  return &type metadata for LogSource.ClientCodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.UnknownCodingKeys()
{
  return &type metadata for LogSource.UnknownCodingKeys;
}

unint64_t sub_BFE0()
{
  unint64_t result = qword_52DE0;
  if (!qword_52DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DE0);
  }
  return result;
}

unint64_t sub_C038()
{
  unint64_t result = qword_52DE8;
  if (!qword_52DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DE8);
  }
  return result;
}

unint64_t sub_C090()
{
  unint64_t result = qword_52DF0;
  if (!qword_52DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DF0);
  }
  return result;
}

unint64_t sub_C0E8()
{
  unint64_t result = qword_52DF8;
  if (!qword_52DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52DF8);
  }
  return result;
}

unint64_t sub_C140()
{
  unint64_t result = qword_52E00;
  if (!qword_52E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E00);
  }
  return result;
}

unint64_t sub_C198()
{
  unint64_t result = qword_52E08;
  if (!qword_52E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E08);
  }
  return result;
}

unint64_t sub_C1F0()
{
  unint64_t result = qword_52E10;
  if (!qword_52E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E10);
  }
  return result;
}

unint64_t sub_C248()
{
  unint64_t result = qword_52E18;
  if (!qword_52E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E18);
  }
  return result;
}

unint64_t sub_C2A0()
{
  unint64_t result = qword_52E20;
  if (!qword_52E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E20);
  }
  return result;
}

unint64_t sub_C2F8()
{
  unint64_t result = qword_52E28;
  if (!qword_52E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E28);
  }
  return result;
}

unint64_t sub_C350()
{
  unint64_t result = qword_52E30;
  if (!qword_52E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E30);
  }
  return result;
}

unint64_t sub_C3A8()
{
  unint64_t result = qword_52E38;
  if (!qword_52E38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52E38);
  }
  return result;
}

uint64_t sub_C410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[31] = a2;
  v3[32] = a3;
  v3[30] = a1;
  sub_62C4(&qword_52F20);
  v3[33] = swift_task_alloc();
  uint64_t v4 = sub_3E558();
  v3[34] = v4;
  v3[35] = *(void *)(v4 - 8);
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  return _swift_task_switch(sub_C550, 0, 0);
}

uint64_t sub_C550()
{
  uint64_t v118 = v0;
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 264);
  sub_3E718();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_DCD4(*(void *)(v0 + 264), &qword_52F20);
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_3EC68();
    sub_60E8(v4, (uint64_t)qword_57CC8);
    uint64_t v5 = sub_3EC48();
    os_log_type_t v6 = sub_3EFB8();
    if (os_log_type_enabled(v5, v6))
    {
      BOOL v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_0, v5, v6, "Couldn't locate conversationID, skipping conversation", v7, 2u);
      swift_slowDealloc();
    }

    goto LABEL_12;
  }
  uint64_t v8 = *(void *)(v0 + 256);
  uint64_t v9 = *(void *)(v0 + 248);
  (*(void (**)(void, void, void))(*(void *)(v0 + 280) + 32))(*(void *)(v0 + 336), *(void *)(v0 + 264), *(void *)(v0 + 272));
  sub_D460(v9, v8, v117);
  uint64_t v11 = *(void *)(v0 + 336);
  uint64_t v12 = v117[0];
  char v13 = sub_24C08(v11, v117[0]);
  if (v13 == 2)
  {
    swift_bridgeObjectRelease();
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v15 = *(void *)(v0 + 328);
    uint64_t v14 = *(void *)(v0 + 336);
    uint64_t v17 = *(void *)(v0 + 272);
    uint64_t v16 = *(void *)(v0 + 280);
    uint64_t v18 = sub_3EC68();
    sub_60E8(v18, (uint64_t)qword_57CC8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v14, v17);
    uint64_t v19 = sub_3EC48();
    os_log_type_t v20 = sub_3EFB8();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = *(void *)(v0 + 328);
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v25 = *(void *)(v0 + 272);
    uint64_t v24 = *(void *)(v0 + 280);
    if (v21)
    {
      uint64_t v112 = *(void *)(v0 + 336);
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      sub_DB78();
      uint64_t v27 = sub_3F598();
      *(void *)(v0 + 192) = sub_2B8C8(v27, v28, v117);
      sub_3F088();
      swift_bridgeObjectRelease();
      id v29 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v29(v22, v25);
      _os_log_impl(&dword_0, v19, v20, "[%s]: Conversation doesn't belong to accepted domains", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v29(v112, v25);
    }
    else
    {

      v52 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v52(v22, v25);
      v52(v23, v25);
    }
    goto LABEL_12;
  }
  char v32 = v13;
  char v33 = v13 & 1;
  sub_6280((void *)(*(void *)(v0 + 256) + 144), *(void *)(*(void *)(v0 + 256) + 168));
  if (v32)
  {
    if ((sub_3E648() & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if ((sub_3E638() & 1) == 0)
  {
LABEL_17:
    char v113 = v33;
    swift_bridgeObjectRelease();
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v34 = *(void *)(v0 + 336);
    uint64_t v35 = *(void *)(v0 + 296);
    uint64_t v37 = *(void *)(v0 + 272);
    uint64_t v36 = *(void *)(v0 + 280);
    uint64_t v38 = sub_3EC68();
    sub_60E8(v38, (uint64_t)qword_57CC8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v34, v37);
    id v39 = sub_3EC48();
    os_log_type_t v40 = sub_3EFB8();
    BOOL v41 = os_log_type_enabled(v39, v40);
    uint64_t v42 = *(void *)(v0 + 336);
    uint64_t v43 = *(void *)(v0 + 296);
    uint64_t v45 = *(void *)(v0 + 272);
    uint64_t v44 = *(void *)(v0 + 280);
    if (v41)
    {
      uint64_t v110 = *(void *)(v0 + 336);
      uint64_t v46 = swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 136315394;
      sub_DB78();
      uint64_t v47 = sub_3F598();
      *(void *)(v0 + 200) = sub_2B8C8(v47, v48, v117);
      sub_3F088();
      swift_bridgeObjectRelease();
      v49 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v49(v43, v45);
      *(_WORD *)(v46 + 12) = 2080;
      *(unsigned char *)(v0 + 65) = v113;
      uint64_t v50 = sub_3EDC8();
      *(void *)(v0 + 208) = sub_2B8C8(v50, v51, v117);
      sub_3F088();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v39, v40, "[%s]: %s is not enabled", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v49(v110, v45);
    }
    else
    {

      v68 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v68(v43, v45);
      v68(v42, v45);
    }
    goto LABEL_12;
  }
  uint64_t v53 = v0 + 128;
  if (qword_527A8 != -1) {
    swift_once();
  }
  v108 = (_OWORD *)(v0 + 72);
  uint64_t v54 = *(void *)(v0 + 336);
  uint64_t v55 = *(void *)(v0 + 320);
  uint64_t v56 = *(void *)(v0 + 272);
  uint64_t v57 = *(void *)(v0 + 280);
  uint64_t v58 = sub_3EC68();
  sub_60E8(v58, (uint64_t)qword_57CC8);
  v107 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16);
  v107(v55, v54, v56);
  v59 = sub_3EC48();
  os_log_type_t v60 = sub_3EFB8();
  BOOL v61 = os_log_type_enabled(v59, v60);
  uint64_t v62 = *(void *)(v0 + 320);
  uint64_t v64 = *(void *)(v0 + 272);
  uint64_t v63 = *(void *)(v0 + 280);
  if (v61)
  {
    v65 = (uint8_t *)swift_slowAlloc();
    uint64_t v106 = swift_slowAlloc();
    *(_DWORD *)v65 = 136315138;
    v117[0] = v106;
    sub_DB78();
    uint64_t v66 = sub_3F598();
    *(void *)(v0 + 232) = sub_2B8C8(v66, v67, v117);
    uint64_t v53 = v0 + 128;
    sub_3F088();
    swift_bridgeObjectRelease();
    v116 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v116(v62, v64);
    _os_log_impl(&dword_0, v59, v60, "[%s]: Begin fetching ConversationData for conversation", v65, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v116 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v116(v62, v64);
  }

  sub_6280((void *)(*(void *)(v0 + 256) + 56), *(void *)(*(void *)(v0 + 256) + 80));
  sub_3CBB8(v33, v12, v53);
  v69 = *(void **)(v0 + 136);
  v70 = *(void **)(v0 + 144);
  v71 = *(void **)(v0 + 152);
  swift_bridgeObjectRelease();
  sub_DBD0(v53, (uint64_t)v108);
  uint64_t v72 = *(void *)(v0 + 336);
  uint64_t v73 = *(void *)(v0 + 272);
  if (*(void *)(v0 + 72))
  {
    v111 = v69;
    v114 = v70;
    uint64_t v74 = *(void *)(v0 + 304);
    long long v75 = *(_OWORD *)(v0 + 88);
    *(_OWORD *)(v0 + 16) = *v108;
    *(_OWORD *)(v0 + 32) = v75;
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 104);
    *(unsigned char *)(v0 + 64) = *(unsigned char *)(v0 + 120);
    v107(v74, v72, v73);
    v76 = sub_3EC48();
    os_log_type_t v77 = sub_3EFB8();
    BOOL v78 = os_log_type_enabled(v76, v77);
    uint64_t v79 = *(void *)(v0 + 304);
    uint64_t v80 = *(void *)(v0 + 272);
    if (v78)
    {
      v109 = v71;
      v81 = (uint8_t *)swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)v81 = 136315138;
      sub_DB78();
      uint64_t v82 = sub_3F598();
      *(void *)(v0 + 224) = sub_2B8C8(v82, v83, v117);
      sub_3F088();
      swift_bridgeObjectRelease();
      v116(v79, v80);
      _os_log_impl(&dword_0, v76, v77, "[%s]: Finished fetching ConversationData", v81, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      v71 = v109;
      swift_slowDealloc();
    }
    else
    {
      v116(*(void *)(v0 + 304), *(void *)(v0 + 272));
    }

    v93 = **(void ***)(v0 + 240);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v94 = v111;
    id v95 = v114;
    id v96 = v71;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v93 = sub_17990(0, v93[2] + 1, 1, v93);
    }
    unint64_t v98 = v93[2];
    unint64_t v97 = v93[3];
    if (v98 >= v97 >> 1) {
      v93 = sub_17990((void *)(v97 > 1), v98 + 1, 1, v93);
    }
    uint64_t v99 = *(void *)(v0 + 336);
    uint64_t v100 = *(void *)(v0 + 272);
    v101 = *(void **)(v0 + 240);
    v93[2] = v98 + 1;
    v102 = &v93[7 * v98];
    long long v103 = *(_OWORD *)(v0 + 16);
    long long v104 = *(_OWORD *)(v0 + 32);
    long long v105 = *(_OWORD *)(v0 + 48);
    *((unsigned char *)v102 + 80) = *(unsigned char *)(v0 + 64);
    *((_OWORD *)v102 + 3) = v104;
    *((_OWORD *)v102 + 4) = v105;
    *((_OWORD *)v102 + 2) = v103;
    sub_DC38(v0 + 128);
    void *v101 = v93;
    v116(v99, v100);
  }
  else
  {
    v107(*(void *)(v0 + 312), v72, v73);
    v84 = sub_3EC48();
    os_log_type_t v85 = sub_3EFB8();
    BOOL v86 = os_log_type_enabled(v84, v85);
    uint64_t v87 = *(void *)(v0 + 336);
    uint64_t v88 = *(void *)(v0 + 312);
    uint64_t v89 = *(void *)(v0 + 272);
    if (v86)
    {
      uint64_t v115 = *(void *)(v0 + 336);
      v90 = (uint8_t *)swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)v90 = 136315138;
      sub_DB78();
      uint64_t v91 = sub_3F598();
      *(void *)(v0 + 216) = sub_2B8C8(v91, v92, v117);
      sub_3F088();
      swift_bridgeObjectRelease();
      v116(v88, v89);
      _os_log_impl(&dword_0, v84, v85, "[%s]: ConversationData couldn't be fetched, skipping conversation", v90, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v116(v115, v89);
    }
    else
    {

      v116(v88, v89);
      v116(v87, v89);
    }
  }
LABEL_12:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_D460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v42 = a3;
  sub_62C4(&qword_52F30);
  ((void (*)(void))__chkstk_darwin)();
  BOOL v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3E4F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v41 = a1;
  sub_3E728();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_DCD4((uint64_t)v7, &qword_52F30);
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_3EC68();
    sub_60E8(v15, (uint64_t)qword_57CC8);
    uint64_t v16 = sub_3EC48();
    os_log_type_t v17 = sub_3EFC8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_0, v16, v17, "No timestamp found in the conversation, skipping joining with CoreDuet events", v18, 2u);
      swift_slowDealloc();
    }

    sub_3E738();
    sub_3F328();
    sub_3F3D8();
    uint64_t v19 = v43;
    if (v43)
    {
      os_log_type_t v20 = _swiftEmptyArrayStorage;
      do
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v20 = sub_17AB8(0, v20[2] + 1, 1, v20);
        }
        unint64_t v22 = v20[2];
        unint64_t v21 = v20[3];
        if (v22 >= v21 >> 1) {
          os_log_type_t v20 = sub_17AB8((void *)(v21 > 1), v22 + 1, 1, v20);
        }
        v20[2] = v22 + 1;
        uint64_t v23 = &v20[2 * v22];
        v23[4] = v19;
        v23[5] = _swiftEmptyArrayStorage;
        sub_3F3D8();
        uint64_t v19 = v43;
      }
      while (v43);
    }
    else
    {
      os_log_type_t v20 = _swiftEmptyArrayStorage;
    }
    swift_release();
    uint64_t result = swift_release();
    *uint64_t v42 = (uint64_t)v20;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    sub_3E4C8();
    sub_6280((void *)(a2 + 104), *(void *)(a2 + 128));
    sub_DB18();
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_40A20;
    *(void *)(v24 + 32) = sub_BA34(0, &qword_52F38);
    *(void *)(v24 + 40) = sub_BA34(0, &qword_52F40);
    sub_3E858();
    if (v3)
    {
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v9 + 8);
      v25(v12, v8);
      return ((uint64_t (*)(char *, uint64_t))v25)(v14, v8);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v27 = sub_3F338();
      swift_release();
      sub_3E738();
      sub_3F338();
      swift_release();
      sub_3E9E8();
      sub_3E798();
      uint64_t v28 = sub_3EAA8();
      swift_release();
      if (qword_527A8 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_3EC68();
      sub_60E8(v29, (uint64_t)qword_57CC8);
      swift_bridgeObjectRetain_n();
      swift_retain();
      uint64_t v30 = sub_3EC48();
      os_log_type_t v31 = sub_3EFB8();
      int v32 = v31;
      if (os_log_type_enabled(v30, v31))
      {
        char v33 = (_DWORD *)swift_slowAlloc();
        LODWORD(v41) = v32;
        uint64_t v34 = v33;
        *char v33 = 134218240;
        id v39 = v33 + 1;
        os_log_t v40 = v30;
        uint64_t v35 = *(void *)(v27 + 16);
        swift_release();
        uint64_t v43 = v35;
        sub_3F088();
        swift_release();
        *((_WORD *)v34 + 6) = 2048;
        id v39 = (_DWORD *)((char *)v34 + 14);
        uint64_t v36 = *(void *)(v28 + 16);
        swift_bridgeObjectRelease();
        uint64_t v43 = v36;
        sub_3F088();
        swift_bridgeObjectRelease();
        os_log_t v37 = v40;
        _os_log_impl(&dword_0, v40, (os_log_type_t)v41, "Found %ld call/message events, grouped into %ld turnEventPairs", (uint8_t *)v34, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v38 = *(void (**)(char *, uint64_t))(v9 + 8);
      v38(v12, v8);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v38)(v14, v8);
      *uint64_t v42 = v28;
    }
  }
  return result;
}

uint64_t sub_DA9C()
{
  sub_66DC(v0 + 16);
  sub_66DC(v0 + 56);
  swift_release();
  sub_66DC(v0 + 104);
  sub_66DC(v0 + 144);

  return _swift_deallocClassInstance(v0, 192, 7);
}

uint64_t type metadata accessor for ConversationDataController()
{
  return self;
}

uint64_t sub_DB18()
{
  uint64_t v0 = sub_62C4(&qword_52F48);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = &qword_52BE0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_52F50;
  }

  return sub_62C4(v2);
}

unint64_t sub_DB78()
{
  unint64_t result = qword_52C00;
  if (!qword_52C00)
  {
    sub_3E558();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52C00);
  }
  return result;
}

uint64_t sub_DBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_52F28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_DC38(uint64_t a1)
{
  return a1;
}

uint64_t sub_DC74(uint64_t result, void *a2, void *a3, void *a4)
{
  if (result)
  {
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_DCD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_62C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_DD30()
{
  qword_57C60 = 0x746361746E6F635CLL;
  *(void *)algn_57C68 = 0xE90000000000002DLL;
}

void sub_DD58(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_62C4(&qword_53040);
  __chkstk_darwin(v4 - 8);
  uint64_t v56 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3E708();
  uint64_t v57 = *(uint8_t **)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_3E558();
  uint64_t v9 = *(void *)(v60 - 8);
  uint64_t v10 = __chkstk_darwin(v60);
  uint64_t v58 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v52 - v12;
  uint64_t v61 = a1;
  sub_3E9C8();
  uint64_t v14 = sub_3E8C8();
  uint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (*(void *)(v14 + 16))
  {
    uint64_t v59 = v16;
    sub_3E9D8();
    os_log_type_t v17 = sub_E63C((uint64_t)v13, v14);
    if (v1)
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v55 = v17;
    uint64_t v53 = *(void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v54 = v9 + 8;
    v53(v13, v60);
    swift_bridgeObjectRelease();
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_3EC68();
    sub_60E8(v27, (uint64_t)qword_57CC8);
    uint64_t v28 = v55;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_3EC48();
    os_log_type_t v30 = sub_3EFB8();
    if (os_log_type_enabled(v29, v30))
    {
      os_log_type_t v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v31 = 134217984;
      unint64_t v2 = 0;
      *(void *)&long long v62 = v28[2];
      sub_3F088();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v29, v30, "Fetched %ld asrContactTokens", v31, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v9 = (uint64_t)v58;
    unint64_t v32 = sub_3E9C8();
    unint64_t v33 = v32;
    if (v32 >> 62)
    {
      uint64_t v34 = sub_3F378();
      if (!v34) {
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v34 = *(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8));
      if (!v34) {
        goto LABEL_30;
      }
    }
    unint64_t v52 = v2;
    unint64_t v35 = 0;
    unint64_t v2 = v33 & 0xC000000000000001;
    while (1)
    {
      if (v2)
      {
        swift_bridgeObjectRetain();
        id v36 = (id)sub_3F278();
      }
      else
      {
        os_log_t v37 = *(void **)(v33 + 8 * v35 + 32);
        swift_bridgeObjectRetain();
        id v36 = v37;
      }
      uint64_t v38 = v36;
      id v39 = (void *)sub_3E6D8();
      swift_bridgeObjectRelease();

      if (v39) {
        break;
      }
      unint64_t v40 = v35 + 1;
      if (__OFADD__(v35, 1))
      {
        __break(1u);
        goto LABEL_45;
      }
      ++v35;
      if (v40 == v34) {
        goto LABEL_30;
      }
    }
    if (v34 == v35) {
      goto LABEL_30;
    }
    if (v2)
    {
      id v41 = (id)sub_3F278();
    }
    else
    {
      if ((v35 & 0x8000000000000000) != 0) {
        goto LABEL_49;
      }
      if (v35 >= *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8)))
      {
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
        return;
      }
      id v41 = *(id *)(v33 + 8 * v35 + 32);
    }
    uint64_t v42 = sub_3E6D8();

    if (!v42) {
      goto LABEL_51;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t v43 = *(void *)(v59 + 16);
    if (v43
      && (uint64_t v44 = v57,
          (*((void (**)(char *, unint64_t, uint64_t))v57 + 2))(v8, v59 + ((v44[80] + 32) & ~(unint64_t)v44[80]), v6), uint64_t v45 = (void *)sub_3E6F8(), (*((void (**)(char *, uint64_t))v44 + 1))(v8, v6), v45))
    {
      *((void *)&v63 + 1) = sub_10050();
      *(void *)&long long v62 = v45;
    }
    else
    {
      uint64_t v45 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
    }
    id v46 = v45;
    sub_3E9D8();
    sub_FD74((uint64_t)&v62, 0xD000000000000014, 0x8000000000043190, v9);
    v53((char *)v9, v60);
    sub_DCD4((uint64_t)&v62, (uint64_t *)&unk_52C30);
    if (!v43)
    {
      uint64_t v49 = 1;
      uint64_t v47 = (uint64_t)v56;
      unint64_t v48 = v57;
LABEL_38:
      (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v48 + 7))(v47, v49, 1, v6);
      swift_bridgeObjectRelease();
      if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v48 + 6))(v47, 1, v6) == 1)
      {
        sub_DCD4(v47, &qword_53040);
      }
      else
      {
        uint64_t v50 = (void *)sub_3E6E8();
        (*((void (**)(uint64_t, uint64_t))v48 + 1))(v47, v6);
        if (v50)
        {
          *((void *)&v63 + 1) = sub_10050();
          *(void *)&long long v62 = v50;
LABEL_43:
          id v51 = v50;
          sub_3E9D8();
          sub_FD74((uint64_t)&v62, 0x4C4E544974736F70, 0xED000044496B6E69, v9);
          v53((char *)v9, v60);
          sub_DCD4((uint64_t)&v62, (uint64_t *)&unk_52C30);
          return;
        }
      }
      uint64_t v50 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
      goto LABEL_43;
    }
    if (*(void *)(v59 + 16))
    {
      uint64_t v47 = (uint64_t)v56;
      unint64_t v48 = v57;
      (*((void (**)(char *, unint64_t, uint64_t))v57 + 2))(v56, v59 + ((v57[80] + 32) & ~(unint64_t)v57[80]), v6);
      uint64_t v49 = 0;
      goto LABEL_38;
    }
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
LABEL_45:
  }
    swift_once();
  uint64_t v18 = sub_3EC68();
  sub_60E8(v18, (uint64_t)qword_57CC8);
  swift_retain_n();
  uint64_t v19 = sub_3EC48();
  os_log_type_t v20 = sub_3EFC8();
  if (os_log_type_enabled(v19, v20))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    *(void *)&long long v62 = v59;
    *(_DWORD *)unint64_t v21 = 136315138;
    uint64_t v56 = (char *)(v21 + 4);
    uint64_t v57 = v21;
    unint64_t v22 = v58;
    sub_3E9D8();
    sub_DB78();
    uint64_t v23 = v60;
    uint64_t v24 = sub_3F598();
    unint64_t v52 = v2;
    unint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v22, v23);
    uint64_t v64 = sub_2B8C8(v24, v26, (uint64_t *)&v62);
    sub_3F088();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v19, v20, "[%s]: No ASR features found for turn", v57, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
}

void *sub_E63C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_3E558();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246DC(a2);
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v25 = sub_3E508();
    uint64_t v27 = v26;
    sub_F8B4();
    swift_allocError();
    *(void *)uint64_t v28 = v25;
    *(void *)(v28 + 8) = v27;
    *(unsigned char *)(v28 + 16) = 0;
LABEL_21:
    swift_willThrow();
    return (void *)v25;
  }
  uint64_t v54 = v7;
  uint64_t v13 = sub_246F4(a2);
  if (!v13)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_3E508();
    uint64_t v30 = v29;
    sub_F8B4();
    swift_allocError();
    *(void *)uint64_t v31 = v25;
    *(void *)(v31 + 8) = v30;
    char v32 = 1;
LABEL_20:
    *(unsigned char *)(v31 + 16) = v32;
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  if (!*(void *)(v13 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  uint64_t v15 = sub_2489C(a2);
  if (!v15)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_3E508();
    uint64_t v34 = v33;
    sub_F8B4();
    swift_allocError();
    *(void *)uint64_t v31 = v25;
    *(void *)(v31 + 8) = v34;
    char v32 = 2;
    goto LABEL_20;
  }
  uint64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v17 = *(void *)(v14 + 16);
  if (v17 != *(void *)(v11 + 16) || v16 != v17)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_3E508();
    uint64_t v36 = v35;
    sub_F8B4();
    swift_allocError();
    *(void *)uint64_t v31 = v25;
    *(void *)(v31 + 8) = v36;
    char v32 = 3;
    goto LABEL_20;
  }
  Class v53 = (Class)v15;
  swift_bridgeObjectRetain();
  os_log_t v18 = (os_log_t)sub_F9A0(0, v12, v11);
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_3EC68();
  uint64_t v20 = sub_60E8(v19, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain();
  uint64_t v50 = v20;
  unint64_t v21 = sub_3EC48();
  os_log_type_t v22 = sub_3EFB8();
  int v51 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    os_log_t v52 = v18;
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v23 = 134217984;
    Class isa = v52[2].isa;
    sub_3F088();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v21, (os_log_type_t)v51, "Found %ld ASR indices containing contact tags", v24, 0xCu);
    os_log_t v18 = v52;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v38 = (uint64_t)v53;
  if (v18[2].isa)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v25 = (uint64_t)sub_FBE8((uint64_t)v18, v11, v14, v38, v3, (uint64_t)v18);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v39 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v9, a1, v6);
    swift_bridgeObjectRetain();
    unint64_t v40 = sub_3EC48();
    os_log_type_t v41 = sub_3EFB8();
    int v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v43 = swift_slowAlloc();
      Class v53 = (Class)swift_slowAlloc();
      Class isa = v53;
      *(_DWORD *)uint64_t v43 = 136315394;
      sub_DB78();
      os_log_t v52 = v40;
      uint64_t v44 = sub_3F598();
      uint64_t v55 = sub_2B8C8(v44, v45, (uint64_t *)&isa);
      int v51 = v42;
      sub_3F088();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v6);
      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_3EEC8();
      unint64_t v48 = v47;
      swift_bridgeObjectRelease();
      uint64_t v55 = sub_2B8C8(v46, v48, (uint64_t *)&isa);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      os_log_t v49 = v52;
      _os_log_impl(&dword_0, v52, (os_log_type_t)v51, "[%s]: No contact found in ASR for %s", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v6);

      swift_bridgeObjectRelease_n();
    }
    return _swiftEmptyArrayStorage;
  }
  return (void *)v25;
}

double sub_ECA4@<D0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unint64_t v8 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  unint64_t v9 = *(void *)(a2 + 16);
  if (v8 >= v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v41 = a7;
  uint64_t v13 = a2 + 16 * v8;
  uint64_t v15 = *(void *)(v13 + 32);
  unint64_t v14 = *(void *)(v13 + 40);
  uint64_t v7 = (uint64_t *)(v13 + 32);
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_EFA8(v15, v14);
  unsigned __int8 v39 = v17;
  uint64_t v40 = v16;
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v19)
  {
    if (v8 < *(void *)(a3 + 16))
    {
      if (v8 < *(void *)(a4 + 16))
      {
        uint64_t v20 = a3 + 16 * v8;
        uint64_t v22 = *(void *)(v20 + 32);
        uint64_t v21 = *(void *)(v20 + 40);
        uint64_t v23 = *(void *)(a4 + 8 * v8 + 32);
        uint64_t v24 = 24;
        if (v9 == *(void *)(a6 + 16)) {
          uint64_t v24 = 32;
        }
        BOOL v25 = *(double *)(a5 + v24) <= (double)v23;
        uint64_t v26 = (objc_class *)type metadata accessor for PhonemeString();
        uint64_t v27 = objc_allocWithZone(v26);
        uint64_t v28 = &v27[OBJC_IVAR___PhonemeString_symbols];
        *uint64_t v28 = v22;
        v28[1] = v21;
        v27[OBJC_IVAR___PhonemeString_encoding] = 0;
        uint64_t v29 = &v27[OBJC_IVAR___PhonemeString_boundary];
        void *v29 = 32;
        v29[1] = 0xE100000000000000;
        v42.receiver = v27;
        v42.super_class = v26;
        swift_bridgeObjectRetain();
        id v30 = objc_msgSendSuper2(&v42, "init");
        *(void *)uint64_t v41 = v40;
        *(void *)(v41 + 8) = v19;
        *(void *)(v41 + 16) = v39;
        *(void *)(v41 + 24) = v30;
        *(void *)(v41 + 32) = v23;
        *(unsigned char *)(v41 + 40) = v25;
        return result;
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (qword_527A8 != -1) {
LABEL_18:
  }
    swift_once();
  uint64_t v32 = sub_3EC68();
  sub_60E8(v32, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_3EC48();
  os_log_type_t v34 = sub_3EFC8();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v36 = *v7;
    unint64_t v37 = v7[1];
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_2B8C8(v36, v37, &v44);
    sub_3F088();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v33, v34, "Couldn't build ASRContactName from %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  double result = 0.0;
  *(_OWORD *)(v41 + 25) = 0u;
  *(_OWORD *)uint64_t v41 = 0u;
  *(_OWORD *)(v41 + 16) = 0u;
  return result;
}

uint64_t sub_EFA8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_3E478();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  uint64_t v49 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_3EC68();
  sub_60E8(v8, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain_n();
  unint64_t v9 = sub_3EC48();
  os_log_type_t v10 = sub_3EFB8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_2B8C8(a1, a2, &v54);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v9, v10, "toASRContactName for ASR token %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v54 = a1;
  unint64_t v55 = a2;
  uint64_t v52 = 3158110;
  unint64_t v53 = 0xE300000000000000;
  unint64_t v12 = sub_6688();
  uint64_t v13 = (void *)sub_3F0A8();
  if (v13[2] != 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_3EC48();
    os_log_type_t v27 = sub_3EFB8();
    if (!os_log_type_enabled(v24, v27))
    {
LABEL_30:

      return 0;
    }
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    uint64_t v29 = "Multiple name parts not supported. Skipping this ASR token.";
    id v30 = v24;
    os_log_type_t v31 = v27;
    uint64_t v32 = v28;
    uint32_t v33 = 2;
    goto LABEL_17;
  }
  uint64_t v14 = v13[4];
  unint64_t v15 = v13[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = v14;
  unint64_t v55 = v15;
  if (qword_52730 != -1) {
    swift_once();
  }
  uint64_t v52 = qword_57C60;
  unint64_t v53 = *(void *)algn_57C68;
  uint64_t v16 = (void *)sub_3F0A8();
  swift_bridgeObjectRelease();
  uint64_t v17 = v16[2];
  if (v17 != 2)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_3EC48();
    os_log_type_t v34 = sub_3EFB8();
    if (!os_log_type_enabled(v24, v34))
    {
LABEL_23:

      goto LABEL_32;
    }
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 134217984;
    swift_bridgeObjectRelease();
    uint64_t v54 = v17;
    sub_3F088();
    swift_bridgeObjectRelease();
    uint64_t v29 = "Invalid token format. Expected 2 components, actual: %ld. Skipping this ASR token.";
    id v30 = v24;
    os_log_type_t v31 = v34;
    uint64_t v32 = v35;
    uint32_t v33 = 12;
LABEL_17:
    _os_log_impl(&dword_0, v30, v31, v29, v32, v33);
LABEL_29:
    swift_slowDealloc();
    goto LABEL_30;
  }
  unint64_t v18 = v16[5];
  uint64_t v54 = v16[4];
  unint64_t v55 = v18;
  uint64_t v52 = 3158622;
  unint64_t v53 = 0xE300000000000000;
  uint64_t v50 = 32;
  unint64_t v51 = 0xE100000000000000;
  uint64_t v54 = sub_3F0D8();
  unint64_t v55 = v19;
  sub_3E448();
  uint64_t v20 = sub_3F0C8();
  unint64_t v22 = v21;
  uint64_t v23 = *(void (**)(char *, uint64_t))(v49 + 8);
  v49 += 8;
  unint64_t v47 = v23;
  v23(v7, v48);
  swift_bridgeObjectRelease();
  uint64_t v54 = v20;
  unint64_t v55 = v22;
  uint64_t v52 = 32;
  unint64_t v53 = 0xE100000000000000;
  if (sub_3F0F8())
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_3EC48();
    os_log_type_t v25 = sub_3EFC8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2B8C8(v20, v22, &v54);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v24, v25, "Multiple words in name text %s not supported. Skipping this ASR token.", v26, 0xCu);
LABEL_28:
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (v16[2] < 2uLL)
  {
    __break(1u);
  }
  else
  {
    uint64_t v36 = v16[6];
    unint64_t v37 = v16[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v54 = v36;
    unint64_t v55 = v37;
    uint64_t v52 = 3158622;
    unint64_t v53 = 0xE300000000000000;
    uint64_t v50 = 32;
    unint64_t v51 = 0xE100000000000000;
    uint64_t v38 = sub_3F0D8();
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v54 = v38;
    unint64_t v55 = v40;
    sub_3E448();
    uint64_t v16 = (void *)sub_3F0C8();
    unint64_t v12 = v41;
    v47(v7, v48);
    swift_bridgeObjectRelease();
    if (qword_52738 == -1) {
      goto LABEL_20;
    }
  }
  swift_once();
LABEL_20:
  if (!*(void *)((char *)&dword_10 + (void)off_52F58))
  {
LABEL_26:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_3EC48();
    os_log_type_t v43 = sub_3EFC8();
    if (os_log_type_enabled(v24, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2B8C8((uint64_t)v16, v12, &v54);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v44 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2B8C8(v20, v22, &v54);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v24, v43, "Name part %s invalid for name %s. Skipping this ASR token.", (uint8_t *)v44, 0x16u);
      goto LABEL_28;
    }

    swift_bridgeObjectRelease_n();
LABEL_32:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_34AD0((uint64_t)v16, v12);
  if ((v42 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  swift_bridgeObjectRelease_n();
  return v20;
}

uint64_t sub_F858()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for ASRLoggedContactTokensProcessor()
{
  return self;
}

unint64_t sub_F8B4()
{
  unint64_t result = qword_53030;
  if (!qword_53030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53030);
  }
  return result;
}

int *sub_F908()
{
  sub_62C4(&qword_53038);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_40AF0;
  *(void *)(inited + 32) = 0x7473726966;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(unsigned char *)(inited + 48) = 0;
  *(void *)(inited + 56) = 1953718636;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(unsigned char *)(inited + 72) = 1;
  *(void *)(inited + 80) = 0x656D616E6B63696ELL;
  *(void *)(inited + 88) = 0xE800000000000000;
  *(unsigned char *)(inited + 96) = 2;
  unint64_t result = (int *)sub_1F3F4(inited);
  off_52F58 = result;
  return result;
}

uint64_t sub_F9A0(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result == a2) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = result;
  if (a2 >= result)
  {
    uint64_t v6 = a3 + 40;
    uint64_t v16 = a2 - 1;
    uint64_t v3 = _swiftEmptyArrayStorage;
    uint64_t v7 = result;
    uint64_t v17 = a3 + 40;
    do
    {
      unint64_t v18 = v3;
      if (v7 <= a2) {
        uint64_t v8 = a2;
      }
      else {
        uint64_t v8 = v7;
      }
      uint64_t v19 = v8;
      uint64_t v9 = v6 + 16 * v7;
      unint64_t v10 = v7;
      while (1)
      {
        if (v7 < v5)
        {
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }
        if (v19 == v10) {
          goto LABEL_25;
        }
        if (v7 < 0) {
          goto LABEL_26;
        }
        if (v10 >= *(void *)(a3 + 16)) {
          goto LABEL_27;
        }
        sub_62C4((uint64_t *)&unk_536F0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_40160;
        uint64_t v12 = qword_52730;
        swift_bridgeObjectRetain();
        if (v12 != -1) {
          swift_once();
        }
        uint64_t v13 = *(void *)algn_57C68;
        *(void *)(inited + 32) = qword_57C60;
        *(void *)(inited + 40) = v13;
        sub_6688();
        swift_bridgeObjectRetain();
        LOBYTE(v13) = sub_3F0F8();
        swift_bridgeObjectRelease();
        unint64_t result = swift_bridgeObjectRelease();
        if (v13) {
          break;
        }
        ++v10;
        v9 += 16;
        if (a2 == v10) {
          return (uint64_t)v18;
        }
      }
      uint64_t v3 = v18;
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        unint64_t result = sub_3A778(0, v18[2] + 1, 1);
        uint64_t v3 = v18;
      }
      unint64_t v15 = v3[2];
      unint64_t v14 = v3[3];
      if (v15 >= v14 >> 1)
      {
        unint64_t result = sub_3A778(v14 > 1, v15 + 1, 1);
        uint64_t v3 = v18;
      }
      uint64_t v7 = v10 + 1;
      v3[2] = v15 + 1;
      v3[v15 + 4] = v10;
      uint64_t v6 = v17;
    }
    while (v16 != v10);
    return (uint64_t)v3;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_FBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v7 = a1;
  uint64_t v8 = 0;
  uint64_t v9 = _swiftEmptyArrayStorage;
  uint64_t v18 = swift_bridgeObjectRetain();
  do
  {
    unint64_t v33 = *(void *)(v7 + 8 * v8 + 32);
    sub_ECA4(&v33, a2, a3, a4, a5, a6, (uint64_t)&v27);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9;
    }
    uint64_t v11 = v28;
    if (v28)
    {
      uint64_t v12 = v27;
      uint64_t v13 = v30;
      uint64_t v25 = v31;
      char v26 = v29;
      char v14 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_17848(0, v9[2] + 1, 1, v9);
      }
      unint64_t v16 = v9[2];
      unint64_t v15 = v9[3];
      if (v16 >= v15 >> 1) {
        uint64_t v9 = sub_17848((void *)(v15 > 1), v16 + 1, 1, v9);
      }
      v9[2] = v16 + 1;
      unint64_t v10 = &v9[6 * v16];
      v10[4] = v12;
      v10[5] = v11;
      *((unsigned char *)v10 + 48) = v26;
      v10[7] = v13;
      v10[8] = v25;
      *((unsigned char *)v10 + 72) = v14 & 1;
      uint64_t v7 = v18;
    }
    ++v8;
  }
  while (v19 != v8);
  swift_bridgeObjectRelease();
  return v9;
}

void sub_FD74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_3E558();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 24))
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_3EC68();
    sub_60E8(v12, (uint64_t)qword_57CC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a4, v8);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_3EC48();
    os_log_type_t v14 = sub_3EFC8();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v19 = a2;
      uint64_t v16 = v15;
      uint64_t v20 = swift_slowAlloc();
      uint64_t v22 = v20;
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_DB78();
      uint64_t v17 = sub_3F598();
      uint64_t v21 = sub_2B8C8(v17, v18, &v22);
      sub_3F088();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      *(_WORD *)(v16 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_2B8C8(v19, a3, &v22);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v13, v14, "[%s]: Failed to extract link ID '%s' for turn", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

      swift_bridgeObjectRelease_n();
    }
  }
}

unint64_t sub_10050()
{
  unint64_t result = qword_535B0;
  if (!qword_535B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_535B0);
  }
  return result;
}

id sub_10090(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = sub_3EC98();
  uint64_t v57 = *(void *)(v10 - 8);
  uint64_t v58 = v10;
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v54 - v14;
  id v16 = objc_allocWithZone((Class)sub_3E5D8());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v56._countAndFlagsBits = a3;
  v56._object = a4;
  sub_3E5C8();
  id v17 = objc_allocWithZone((Class)sub_3E5B8());
  v55._countAndFlagsBits = a1;
  v55._object = a2;
  uint64_t v59 = sub_3E5A8();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  v54[1] = v18 + 16;
  uint64_t v61 = (void *)v18;
  *(void *)(v18 + 24) = 0xE000000000000000;
  uint64_t v19 = swift_allocObject();
  uint64_t v60 = v19;
  *(void *)(v19 + 16) = 0;
  uint64_t v20 = (uint64_t *)(v19 + 16);
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  if (a5) {
    id v22 = a5;
  }
  else {
    id v22 = objc_retain(*(id *)(v54[3]
  }
                            + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_sharedSession));
  uint64_t v23 = (void *)swift_allocObject();
  uint64_t v24 = v60;
  v23[2] = v61;
  v23[3] = v24;
  v23[4] = v21;
  id v25 = a5;
  swift_retain();
  swift_retain();
  char v26 = v21;
  uint64_t v27 = (void *)v59;
  sub_3E588();

  swift_release();
  sub_3EC88();
  sub_3ECA8();
  uint64_t v28 = *(void (**)(char *, NSObject *))(v57 + 8);
  uint64_t v29 = v13;
  uint64_t v30 = v58;
  v28(v29, v58);
  sub_3F008();
  v28(v15, v30);
  if (sub_3EC78())
  {
    uint64_t v67 = 0;
    unint64_t v68 = 0xE000000000000000;
    sub_3F238(28);
    swift_bridgeObjectRelease();
    uint64_t v67 = 0x7478657420726F66;
    unint64_t v68 = 0xE900000000000020;
    sub_3EE18(v55);
    v69._countAndFlagsBits = 0x6175676E616C202CLL;
    v69._object = (void *)0xEF2065646F436567;
    sub_3EE18(v69);
    sub_3EE18(v56);
    uint64_t v31 = v67;
    unint64_t v32 = v68;
    sub_10AC0();
    swift_allocError();
    *(void *)uint64_t v33 = v31;
    *(void *)(v33 + 8) = v32;
    *(unsigned char *)(v33 + 16) = 2;
    swift_willThrow();
LABEL_8:
    id v38 = v61;
    swift_release();

    swift_release();
    return v38;
  }
  swift_beginAccess();
  uint64_t v34 = *v20;
  if (*v20)
  {
    uint64_t v65 = 0;
    unint64_t v66 = 0xE000000000000000;
    swift_errorRetain();
    sub_3F238(49);
    v70._countAndFlagsBits = 0x7478657420726F66;
    v70._object = (void *)0xE900000000000020;
    sub_3EE18(v70);
    sub_3EE18(v55);
    v71._countAndFlagsBits = 0x6175676E616C202CLL;
    v71._object = (void *)0xEF2065646F436567;
    sub_3EE18(v71);
    sub_3EE18(v56);
    v72._object = (void *)0x8000000000043220;
    v72._countAndFlagsBits = 0xD000000000000013;
    sub_3EE18(v72);
    uint64_t v63 = v34;
    sub_62C4(&qword_53118);
    sub_3F348();
    uint64_t v35 = v65;
    unint64_t v36 = v66;
    sub_10AC0();
    swift_allocError();
    *(void *)uint64_t v37 = v35;
    *(void *)(v37 + 8) = v36;
    *(unsigned char *)(v37 + 16) = 1;
    swift_willThrow();
    swift_errorRelease();
    goto LABEL_8;
  }
  unint64_t v40 = v61;
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_3EC68();
  sub_60E8(v41, (uint64_t)qword_57CC8);
  swift_retain();
  char v42 = sub_3EC48();
  os_log_type_t v43 = sub_3EFB8();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v58 = v26;
    uint64_t v65 = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    swift_beginAccess();
    uint64_t v46 = v40[2];
    unint64_t v47 = v40[3];
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_2B8C8(v46, v47, &v65);
    uint64_t v27 = (void *)v59;
    sub_3F088();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v42, v43, "Successfully fetched phonemes from TTS: %s", v44, 0xCu);
    swift_arrayDestroy();
    char v26 = v58;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  uint64_t v49 = v40[2];
  uint64_t v48 = v40[3];
  uint64_t v50 = (objc_class *)type metadata accessor for PhonemeString();
  unint64_t v51 = objc_allocWithZone(v50);
  uint64_t v52 = &v51[OBJC_IVAR___PhonemeString_symbols];
  void *v52 = v49;
  v52[1] = v48;
  v51[OBJC_IVAR___PhonemeString_encoding] = 2;
  unint64_t v53 = &v51[OBJC_IVAR___PhonemeString_boundary];
  *unint64_t v53 = 32;
  v53[1] = 0xE100000000000000;
  v64.receiver = v51;
  v64.super_class = v50;
  swift_bridgeObjectRetain();
  id v38 = objc_msgSendSuper2(&v64, "init");

  swift_release();
  swift_release();

  return v38;
}

Swift::Int sub_10794(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = 0;
  }
  if (a2) {
    unint64_t v9 = a2;
  }
  else {
    unint64_t v9 = 0xE000000000000000;
  }
  swift_beginAccess();
  *(void *)(a4 + 16) = v8;
  *(void *)(a4 + 24) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(a5 + 16) = a3;
  swift_errorRetain();
  swift_errorRelease();
  return sub_3F018();
}

uint64_t sub_1085C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_currentLocale;
  uint64_t v2 = sub_3EA38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_sharedSession));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1090C()
{
  return type metadata accessor for TTSPhonemesGenerator();
}

uint64_t type metadata accessor for TTSPhonemesGenerator()
{
  uint64_t result = qword_53070;
  if (!qword_53070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10960()
{
  uint64_t result = sub_3EA38();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_109FC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10A34()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10A6C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

Swift::Int sub_10AB4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10794(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

unint64_t sub_10AC0()
{
  unint64_t result = qword_53120;
  if (!qword_53120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53120);
  }
  return result;
}

uint64_t sub_10B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3EA38();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v10 = v9;
  if (*(void *)(a2 + 16))
  {
    uint64_t v11 = v8;
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_34AD0(v11, v10);
    if (v13)
    {
      uint64_t v14 = *(void *)(a2 + 56) + 120 * v12;
      long long v15 = *(_OWORD *)(v14 + 48);
      long long v17 = *(_OWORD *)v14;
      long long v16 = *(_OWORD *)(v14 + 16);
      v30[2] = *(_OWORD *)(v14 + 32);
      v30[3] = v15;
      v30[0] = v17;
      v30[1] = v16;
      long long v19 = *(_OWORD *)(v14 + 80);
      long long v18 = *(_OWORD *)(v14 + 96);
      long long v20 = *(_OWORD *)(v14 + 64);
      char v31 = *(unsigned char *)(v14 + 112);
      v30[5] = v19;
      v30[6] = v18;
      v30[4] = v20;
      sub_113D0((uint64_t)v30, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_11390);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v21 = sub_10E50();
      sub_113D0((uint64_t)v30, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1148C);
      return v21 & 1;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_3EC68();
  sub_60E8(v22, (uint64_t)qword_57CC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v23 = sub_3EC48();
  os_log_type_t v24 = sub_3EFB8();
  if (os_log_type_enabled(v23, v24))
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    *(void *)&v30[0] = swift_slowAlloc();
    *(_DWORD *)id v25 = 136315138;
    uint64_t v26 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
    v29[1] = sub_2B8C8(v26, v27, (uint64_t *)v30);
    sub_3F088();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_0, v23, v24, "No phonemeData entry for locale %s", v25, 0xCu);
    char v21 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    char v21 = 1;
  }
  return v21 & 1;
}

uint64_t sub_10E50()
{
  uint64_t v1 = sub_3E478();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_114CC(v0 + 80, (uint64_t)v41);
  sub_114CC((uint64_t)v41, (uint64_t)v42);
  uint64_t v5 = v42[0];
  if (v42[0])
  {
    v48[0] = v42[0];
    uint64_t v6 = *(void *)(v42[0] + 16);
    if (v6)
    {
      uint64_t v35 = v0;
      sub_1158C((uint64_t)v41, (void (*)(void, void, void, void, void))sub_11390);
      sub_11534((uint64_t)v48);
      uint64_t v36 = v2;
      uint64_t v7 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v8 = (unint64_t *)(v5 + 56);
      do
      {
        unint64_t v9 = *v8;
        if (*v8)
        {
          uint64_t v10 = HIBYTE(v9) & 0xF;
          if ((v9 & 0x2000000000000000) == 0) {
            uint64_t v10 = *(v8 - 1) & 0xFFFFFFFFFFFFLL;
          }
          if (v10)
          {
            uint64_t v44 = *(v8 - 1);
            unint64_t v45 = v9;
            uint64_t v11 = qword_527A0;
            swift_bridgeObjectRetain();
            if (v11 != -1) {
              swift_once();
            }
            sub_60E8(v1, (uint64_t)qword_53CF0);
            sub_3E468();
            sub_6688();
            sub_3F0B8();
            char v13 = v12;
            (*v7)(v4, v1);
            swift_bridgeObjectRelease();
            if ((v13 & 1) == 0)
            {
              uint64_t v31 = 0;
              unint64_t v32 = v41;
              uint64_t v33 = v48;
              goto LABEL_42;
            }
          }
        }
        v8 += 8;
        --v6;
      }
      while (v6);
      sub_11560((uint64_t)v48);
      sub_1158C((uint64_t)v41, (void (*)(void, void, void, void, void))sub_1148C);
      uint64_t v0 = v35;
      uint64_t v2 = v36;
    }
  }
  sub_114CC(v0, (uint64_t)v40);
  sub_114CC((uint64_t)v40, (uint64_t)v43);
  uint64_t v14 = v43[0];
  if (v43[0])
  {
    uint64_t v47 = v43[0];
    uint64_t v15 = *(void *)(v43[0] + 16);
    if (v15)
    {
      uint64_t v35 = v0;
      sub_1158C((uint64_t)v40, (void (*)(void, void, void, void, void))sub_11390);
      sub_11534((uint64_t)&v47);
      uint64_t v36 = v2;
      long long v16 = (void (**)(char *, uint64_t))(v2 + 8);
      long long v17 = (unint64_t *)(v14 + 56);
      do
      {
        unint64_t v18 = *v17;
        if (*v17)
        {
          uint64_t v19 = HIBYTE(v18) & 0xF;
          if ((v18 & 0x2000000000000000) == 0) {
            uint64_t v19 = *(v17 - 1) & 0xFFFFFFFFFFFFLL;
          }
          if (v19)
          {
            uint64_t v44 = *(v17 - 1);
            unint64_t v45 = v18;
            uint64_t v20 = qword_527A0;
            swift_bridgeObjectRetain();
            if (v20 != -1) {
              swift_once();
            }
            sub_60E8(v1, (uint64_t)qword_53CF0);
            sub_3E468();
            sub_6688();
            sub_3F0B8();
            char v22 = v21;
            (*v16)(v4, v1);
            swift_bridgeObjectRelease();
            if ((v22 & 1) == 0)
            {
              uint64_t v31 = 0;
              unint64_t v32 = v40;
              uint64_t v33 = &v47;
              goto LABEL_42;
            }
          }
        }
        v17 += 8;
        --v15;
      }
      while (v15);
      sub_11560((uint64_t)&v47);
      sub_1158C((uint64_t)v40, (void (*)(void, void, void, void, void))sub_1148C);
      uint64_t v0 = v35;
      uint64_t v2 = v36;
    }
  }
  sub_114CC(v0 + 40, (uint64_t)v39);
  sub_114CC((uint64_t)v39, (uint64_t)&v44);
  uint64_t v23 = v44;
  if (!v44) {
    return 1;
  }
  uint64_t v46 = v44;
  uint64_t v24 = *(void *)(v44 + 16);
  if (!v24) {
    return 1;
  }
  sub_1158C((uint64_t)v39, (void (*)(void, void, void, void, void))sub_11390);
  sub_11534((uint64_t)&v46);
  id v25 = (unint64_t *)(v23 + 56);
  do
  {
    unint64_t v26 = *v25;
    if (*v25)
    {
      uint64_t v27 = HIBYTE(v26) & 0xF;
      if ((v26 & 0x2000000000000000) == 0) {
        uint64_t v27 = *(v25 - 1) & 0xFFFFFFFFFFFFLL;
      }
      if (v27)
      {
        uint64_t v37 = *(v25 - 1);
        unint64_t v38 = v26;
        uint64_t v28 = qword_527A0;
        swift_bridgeObjectRetain();
        if (v28 != -1) {
          swift_once();
        }
        sub_60E8(v1, (uint64_t)qword_53CF0);
        sub_3E468();
        sub_6688();
        sub_3F0B8();
        char v30 = v29;
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
        {
          uint64_t v31 = 0;
          goto LABEL_41;
        }
      }
    }
    v25 += 8;
    --v24;
  }
  while (v24);
  uint64_t v31 = 1;
LABEL_41:
  unint64_t v32 = v39;
  uint64_t v33 = &v46;
LABEL_42:
  sub_11560((uint64_t)v33);
  sub_1158C((uint64_t)v32, (void (*)(void, void, void, void, void))sub_1148C);
  return v31;
}

uint64_t sub_11390(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_113D0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 104);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 112);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  a2(v4, v5, v6, v7, v10);
  a2(v14, v13, v8, v9, v11);
  return a1;
}

uint64_t sub_1148C(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_114CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_11534(uint64_t a1)
{
  return a1;
}

uint64_t sub_11560(uint64_t a1)
{
  return a1;
}

uint64_t sub_1158C(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_115CC(char a1)
{
  if (a1) {
    return 0x63656843656D616ELL;
  }
  else {
    return 0xD000000000000012;
  }
}

uint64_t sub_11610(void *a1, uint64_t a2)
{
  uint64_t v5 = sub_62C4(&qword_53158);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6280(a1, a1[3]);
  sub_1350C();
  sub_3F688();
  uint64_t v11 = a2;
  v10[15] = 0;
  sub_62C4(&qword_53140);
  sub_135FC(&qword_53160, (void (*)(void))sub_13678);
  sub_3F558();
  if (!v2)
  {
    v10[14] = 1;
    sub_3F568();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_117D4(char a1)
{
  unint64_t result = 0xD000000000000025;
  if (!a1) {
    return 0xD000000000000026;
  }
  return result;
}

BOOL sub_1182C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_11844()
{
  return sub_115CC(*v0);
}

uint64_t sub_1184C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_131E4(a1, a2);
  *a3 = result;
  return result;
}

void sub_11874(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_11880(uint64_t a1)
{
  unint64_t v2 = sub_1350C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_118BC(uint64_t a1)
{
  unint64_t v2 = sub_1350C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_118F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_132E4(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_DWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_11928(void *a1)
{
  return sub_11610(a1, *v1);
}

uint64_t sub_11948(char *a1, unsigned __int8 *a2)
{
  return sub_2E414(*a1, *a2);
}

Swift::Int sub_11954()
{
  return sub_2E598();
}

uint64_t sub_1195C()
{
  return sub_2E8E8();
}

Swift::Int sub_11964()
{
  return sub_2EA30();
}

uint64_t sub_1196C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4(&qword_531E0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_145F4();
  sub_3F688();
  sub_114CC(v3, (uint64_t)v15);
  sub_114CC((uint64_t)v15, (uint64_t)v12);
  char v11 = 0;
  sub_1469C();
  sub_3F508();
  if (!v2)
  {
    sub_114CC(v3 + 40, (uint64_t)v14);
    sub_114CC((uint64_t)v14, (uint64_t)v12);
    char v11 = 1;
    sub_3F508();
    sub_114CC(v3 + 80, (uint64_t)v13);
    sub_114CC((uint64_t)v13, (uint64_t)v12);
    char v11 = 2;
    sub_3F508();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_11B68@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_136CC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_11B98@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_117D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_11BC4()
{
  return sub_117D4(*v0);
}

uint64_t sub_11BCC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_136CC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_11BF4(uint64_t a1)
{
  unint64_t v2 = sub_145F4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_11C30(uint64_t a1)
{
  unint64_t v2 = sub_145F4();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_11C6C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_13718(a1, v8);
  if (!v2)
  {
    long long v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(unsigned char *)(a2 + 112) = v14;
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

uint64_t sub_11CD4(void *a1)
{
  return sub_1196C(a1);
}

uint64_t sub_11D28(char a1)
{
  if (!a1) {
    return 0xD000000000000014;
  }
  if (a1 == 1) {
    return 0x65756C6176;
  }
  return 0x6D617473656D6974;
}

uint64_t sub_11D84(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4(&qword_53198);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6280(a1, a1[3]);
  sub_13FA0();
  sub_3F688();
  uint64_t v11 = *v3;
  v10[7] = 0;
  sub_62C4(&qword_53180);
  sub_14048(&qword_531A0, (void (*)(void))sub_140B8);
  sub_3F558();
  if (!v2)
  {
    v10[6] = 1;
    sub_3F528();
    v10[5] = 2;
    sub_3F518();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_11F64()
{
  return sub_11D28(*v0);
}

uint64_t sub_11F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_13B7C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_11F94(uint64_t a1)
{
  unint64_t v2 = sub_13FA0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_11FD0(uint64_t a1)
{
  unint64_t v2 = sub_13FA0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_1200C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_13CC8(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(unsigned char *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t sub_12054(void *a1)
{
  return sub_11D84(a1);
}

uint64_t sub_1206C(char a1)
{
  return *(void *)&aApgid_0[8 * a1];
}

uint64_t sub_1208C(void *a1)
{
  uint64_t v3 = sub_62C4(&qword_531C0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6280(a1, a1[3]);
  sub_145A0();
  sub_3F688();
  v8[15] = 0;
  sub_3F4E8();
  if (!v1)
  {
    v8[14] = 1;
    sub_3F4E8();
    v8[13] = 2;
    sub_3F4F8();
    v8[12] = 3;
    sub_3F4E8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_12240()
{
  return sub_1206C(*v0);
}

uint64_t sub_12248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1410C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_12270(uint64_t a1)
{
  unint64_t v2 = sub_145A0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_122AC(uint64_t a1)
{
  unint64_t v2 = sub_145A0();

  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_122E8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_142C8(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_1232C(void *a1)
{
  return sub_1208C(a1);
}

uint64_t sub_12344(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  LODWORD(v5) = 0;
  uint64_t v6 = 0;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  while ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      v16[0] = a1;
      v16[1] = v7;
      int v9 = *((unsigned __int8 *)v16 + v6);
      if (*((char *)v16 + v6) < 0)
      {
        switch(__clz(v9 ^ 0xFF))
        {
          case 0x1Au:
            long long v12 = (char *)v16 + v6;
LABEL_19:
            uint64_t v10 = 2;
            int v9 = v12[1] & 0x3F | ((v9 & 0x1F) << 6);
            break;
          case 0x1Bu:
            long long v13 = (char *)v16 + v6;
LABEL_23:
            int v9 = ((v9 & 0xF) << 12) | ((v13[1] & 0x3F) << 6) | v13[2] & 0x3F;
            uint64_t v10 = 3;
            break;
          case 0x1Cu:
            char v14 = (char *)v16 + v6;
LABEL_25:
            int v9 = ((v9 & 0xF) << 18) | ((v14[1] & 0x3F) << 12) | ((v14[2] & 0x3F) << 6) | v14[3] & 0x3F;
            uint64_t v10 = 4;
            break;
          default:
            goto LABEL_16;
        }
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v11 = v8;
      if ((a1 & 0x1000000000000000) == 0) {
        uint64_t v11 = sub_3F2B8();
      }
      int v9 = *(unsigned __int8 *)(v11 + v6);
      if (*(char *)(v11 + v6) < 0)
      {
        switch(__clz(v9 ^ 0xFF))
        {
          case 0x1Au:
            long long v12 = (char *)(v6 + v11);
            goto LABEL_19;
          case 0x1Bu:
            long long v13 = (char *)(v6 + v11);
            goto LABEL_23;
          case 0x1Cu:
            char v14 = (char *)(v6 + v11);
            goto LABEL_25;
          default:
            break;
        }
      }
    }
LABEL_16:
    uint64_t v10 = 1;
LABEL_7:
    v6 += v10;
    uint64_t v5 = (v9 - v5 + 32 * v5);
    if (v6 >= v2) {
      return v5;
    }
  }
  int v9 = sub_3F228();
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_7;
  }
  __break(1u);
  return 0;
}

uint64_t destroy for TokenPhonemeDataList()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TokenPhonemeDataList(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TokenPhonemeDataList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  return a1;
}

__n128 initializeWithTake for TokenPhonemeDataList(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TokenPhonemeDataList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenPhonemeDataList(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenPhonemeDataList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeDataList()
{
  return &type metadata for TokenPhonemeDataList;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenPhonemeData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TokenPhonemeData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TokenPhonemeData(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenPhonemeData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64)) {
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

uint64_t storeEnumTagSinglePayload for TokenPhonemeData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeData()
{
  return &type metadata for TokenPhonemeData;
}

uint64_t initializeBufferWithCopyOfBuffer for PhonemeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PhonemeData()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for PhonemeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  return a1;
}

uint64_t initializeWithTake for PhonemeData(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t assignWithTake for PhonemeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemeData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 12)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhonemeData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 12) = 1;
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
    *(unsigned char *)(result + 12) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhonemeData()
{
  return &type metadata for PhonemeData;
}

uint64_t destroy for PhonemeDataLocaleEntry(void *a1)
{
  if (*a1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[5])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t result = a1[10];
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PhonemeDataLocaleEntry(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v5 = *(void *)(a2 + 16);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v5;
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  }
  uint64_t v8 = *(void *)(a2 + 40);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    uint64_t v10 = *(void *)(a2 + 56);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v9;
    uint64_t v11 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v10;
    *(void *)(a1 + 64) = v11;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v12;
    *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  }
  uint64_t v13 = *(void *)(a2 + 80);
  if (v13)
  {
    uint64_t v14 = *(void *)(a2 + 88);
    uint64_t v15 = *(void *)(a2 + 96);
    *(void *)(a1 + 80) = v13;
    *(void *)(a1 + 88) = v14;
    uint64_t v16 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v15;
    *(void *)(a1 + 104) = v16;
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v17;
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  }
  return a1;
}

uint64_t assignWithCopy for PhonemeDataLocaleEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *a2;
  if (v4)
  {
    if (v5)
    {
      *(void *)a1 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 8) = a2[1];
      *(void *)(a1 + 16) = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v6 = a2[3];
      *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
      *(void *)(a1 + 24) = v6;
    }
    else
    {
      sub_12F70(a1);
      char v8 = *((unsigned char *)a2 + 32);
      long long v9 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
      *(unsigned char *)(a1 + 32) = v8;
    }
  }
  else if (v5)
  {
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = a2[2];
    uint64_t v7 = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 24) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)a2;
    long long v11 = *((_OWORD *)a2 + 1);
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(_OWORD *)a1 = v10;
    *(_OWORD *)(a1 + 16) = v11;
  }
  long long v12 = (_OWORD *)(a1 + 40);
  uint64_t v14 = a2 + 5;
  uint64_t v13 = a2[5];
  if (*(void *)(a1 + 40))
  {
    if (v13)
    {
      *(void *)(a1 + 40) = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 48) = a2[6];
      *(void *)(a1 + 56) = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v15 = a2[8];
      *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
      *(void *)(a1 + 64) = v15;
    }
    else
    {
      sub_12F70(a1 + 40);
      char v17 = *((unsigned char *)a2 + 72);
      long long v18 = *(_OWORD *)(a2 + 7);
      *long long v12 = *v14;
      *(_OWORD *)(a1 + 56) = v18;
      *(unsigned char *)(a1 + 72) = v17;
    }
  }
  else if (v13)
  {
    *(void *)(a1 + 40) = v13;
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = a2[7];
    uint64_t v16 = a2[8];
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    *(void *)(a1 + 64) = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v19 = *v14;
    long long v20 = *(_OWORD *)(a2 + 7);
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    *long long v12 = v19;
    *(_OWORD *)(a1 + 56) = v20;
  }
  char v21 = (_OWORD *)(a1 + 80);
  uint64_t v23 = a2 + 10;
  uint64_t v22 = a2[10];
  if (*(void *)(a1 + 80))
  {
    if (v22)
    {
      *(void *)(a1 + 80) = v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = a2[11];
      *(void *)(a1 + 96) = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v24 = a2[13];
      *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
      *(void *)(a1 + 104) = v24;
    }
    else
    {
      sub_12F70(a1 + 80);
      char v26 = *((unsigned char *)a2 + 112);
      long long v27 = *((_OWORD *)a2 + 6);
      *char v21 = *v23;
      *(_OWORD *)(a1 + 96) = v27;
      *(unsigned char *)(a1 + 112) = v26;
    }
  }
  else if (v22)
  {
    *(void *)(a1 + 80) = v22;
    *(void *)(a1 + 88) = a2[11];
    *(void *)(a1 + 96) = a2[12];
    uint64_t v25 = a2[13];
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    *(void *)(a1 + 104) = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v28 = *v23;
    long long v29 = *((_OWORD *)a2 + 6);
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    *char v21 = v28;
    *(_OWORD *)(a1 + 96) = v29;
  }
  return a1;
}

uint64_t sub_12F70(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for PhonemeDataLocaleEntry(uint64_t a1, long long *a2)
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
  *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for PhonemeDataLocaleEntry(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1)
  {
    if (*(void *)a2)
    {
      *(void *)a1 = *(void *)a2;
      swift_bridgeObjectRelease();
      uint64_t v4 = *(void *)(a2 + 16);
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = v4;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      goto LABEL_6;
    }
    sub_12F70(a1);
  }
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
LABEL_6:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v6)
    {
      *(void *)(a1 + 40) = v6;
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = v7;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
      goto LABEL_11;
    }
    sub_12F70(a1 + 40);
  }
  long long v8 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
LABEL_11:
  uint64_t v9 = *(void *)(a2 + 80);
  if (!*(void *)(a1 + 80))
  {
LABEL_15:
    long long v11 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v11;
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
    return a1;
  }
  if (!v9)
  {
    sub_12F70(a1 + 80);
    goto LABEL_15;
  }
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemeDataLocaleEntry(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 113)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhonemeDataLocaleEntry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 112) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 113) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 113) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhonemeDataLocaleEntry()
{
  return &type metadata for PhonemeDataLocaleEntry;
}

uint64_t sub_131E4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000000043240 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x63656843656D616ELL && a2 == 0xEC0000006D75736BLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_132E4(void *a1)
{
  uint64_t v3 = sub_62C4(&qword_53130);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  sub_6280(a1, v7);
  sub_1350C();
  sub_3F678();
  if (v1)
  {
    sub_66DC((uint64_t)a1);
  }
  else
  {
    sub_62C4(&qword_53140);
    v9[7] = 0;
    sub_135FC(&qword_53148, (void (*)(void))sub_135A8);
    sub_3F498();
    uint64_t v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_3F4A8();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    sub_66DC((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_1350C()
{
  unint64_t result = qword_53138;
  if (!qword_53138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53138);
  }
  return result;
}

uint64_t sub_13560(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_135A8()
{
  unint64_t result = qword_53150;
  if (!qword_53150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53150);
  }
  return result;
}

uint64_t sub_135FC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_13560(&qword_53140);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_13678()
{
  unint64_t result = qword_53168;
  if (!qword_53168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53168);
  }
  return result;
}

uint64_t sub_136CC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4D590;
  v6._object = a2;
  unint64_t v4 = sub_3F3F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_13718@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_62C4(&qword_531C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_145F4();
  sub_3F678();
  if (v2) {
    return sub_66DC((uint64_t)a1);
  }
  char v45 = 0;
  sub_14648();
  sub_3F448();
  uint64_t v34 = a2;
  uint64_t v9 = v42;
  int v10 = v43;
  char v45 = 1;
  uint64_t v36 = v39;
  uint64_t v37 = v40;
  uint64_t v38 = v41;
  sub_11390(v39);
  sub_3F448();
  int v32 = v10;
  uint64_t v33 = v9;
  uint64_t v11 = v41;
  uint64_t v12 = v42;
  char v45 = 2;
  uint64_t v35 = v39;
  uint64_t v31 = v40;
  int v44 = v43;
  sub_11390(v39);
  uint64_t v30 = 0;
  sub_3F448();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v29 = v40;
  uint64_t v30 = v39;
  uint64_t v27 = v41;
  uint64_t v28 = v42;
  HIDWORD(v26) = v43;
  sub_11390(v36);
  uint64_t v13 = v35;
  sub_11390(v35);
  sub_11390(v30);
  sub_1148C(v13);
  uint64_t v14 = v36;
  sub_1148C(v36);
  sub_66DC((uint64_t)a1);
  sub_1148C(v14);
  char v15 = v44;
  sub_1148C(v35);
  uint64_t v17 = v29;
  uint64_t v16 = v30;
  uint64_t v18 = v27;
  uint64_t v19 = v28;
  char v20 = BYTE4(v26);
  uint64_t result = sub_1148C(v30);
  uint64_t v22 = v34;
  uint64_t v23 = v37;
  *uint64_t v34 = v36;
  v22[1] = v23;
  uint64_t v24 = v33;
  v22[2] = v38;
  v22[3] = v24;
  *((unsigned char *)v22 + 32) = v32;
  uint64_t v25 = v31;
  v22[5] = v35;
  v22[6] = v25;
  v22[7] = v11;
  v22[8] = v12;
  *((unsigned char *)v22 + 72) = v15;
  v22[10] = v16;
  v22[11] = v17;
  v22[12] = v18;
  v22[13] = v19;
  *((unsigned char *)v22 + 112) = v20;
  return result;
}

uint64_t sub_13B7C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000000043260 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_13CC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_62C4(&qword_53170);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_13FA0();
  sub_3F678();
  if (v2) {
    return sub_66DC((uint64_t)a1);
  }
  sub_62C4(&qword_53180);
  char v25 = 0;
  sub_14048(&qword_53188, (void (*)(void))sub_13FF4);
  sub_3F498();
  uint64_t v9 = v26;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_3F468();
  uint64_t v12 = v11;
  uint64_t v21 = v10;
  char v23 = 2;
  swift_bridgeObjectRetain();
  uint64_t v22 = v12;
  uint64_t v13 = sub_3F458();
  uint64_t v14 = v8;
  char v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  sub_66DC((uint64_t)a1);
  uint64_t v17 = v22;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v19 = v21;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v19;
  *(void *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v13;
  *(unsigned char *)(a2 + 32) = v16 & 1;
  return result;
}

unint64_t sub_13FA0()
{
  unint64_t result = qword_53178;
  if (!qword_53178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53178);
  }
  return result;
}

unint64_t sub_13FF4()
{
  unint64_t result = qword_53190;
  if (!qword_53190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53190);
  }
  return result;
}

uint64_t sub_14048(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_13560(&qword_53180);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_140B8()
{
  unint64_t result = qword_531A8;
  if (!qword_531A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531A8);
  }
  return result;
}

uint64_t sub_1410C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449677061 && a2 == 0xE500000000000000;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746144737474 && a2 == 0xE700000000000000 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x66664F6E656B6F74 && a2 == 0xEB00000000746573 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6172676F6874726FLL && a2 == 0xEB00000000796870)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_142C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_62C4(&qword_531B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  long long v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6280(a1, a1[3]);
  sub_145A0();
  sub_3F678();
  if (v2) {
    return sub_66DC((uint64_t)a1);
  }
  char v31 = 0;
  uint64_t v9 = sub_3F428();
  uint64_t v11 = v10;
  uint64_t v26 = v9;
  char v30 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_3F428();
  uint64_t v14 = v13;
  uint64_t v24 = v12;
  char v29 = 2;
  swift_bridgeObjectRetain();
  uint64_t v25 = v14;
  uint64_t v15 = sub_3F438();
  int v27 = v16;
  uint64_t v23 = v15;
  char v28 = 3;
  uint64_t v17 = sub_3F428();
  uint64_t v19 = v18;
  uint64_t v20 = v17;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  sub_66DC((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v21 = v25;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = v23;
  *(unsigned char *)(a2 + 40) = v27 & 1;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v19;
  return result;
}

unint64_t sub_145A0()
{
  unint64_t result = qword_531B8;
  if (!qword_531B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531B8);
  }
  return result;
}

unint64_t sub_145F4()
{
  unint64_t result = qword_531D0;
  if (!qword_531D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531D0);
  }
  return result;
}

unint64_t sub_14648()
{
  unint64_t result = qword_531D8;
  if (!qword_531D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531D8);
  }
  return result;
}

unint64_t sub_1469C()
{
  unint64_t result = qword_531E8;
  if (!qword_531E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PhonemeDataLocaleEntry.CodingKeys()
{
  return &type metadata for PhonemeDataLocaleEntry.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for TokenPhonemeData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    int *result = a2 + 3;
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
        JUMPOUT(0x147D0);
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
          int *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeData.CodingKeys()
{
  return &type metadata for TokenPhonemeData.CodingKeys;
}

unsigned char *_s44SiriPrivateLearningTTSMispronunciationPlugin22PhonemeDataLocaleEntryV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    int *result = a2 + 2;
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
        JUMPOUT(0x148D4);
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
          int *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeDataList.CodingKeys()
{
  return &type metadata for TokenPhonemeDataList.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PhonemeData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PhonemeData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    int *result = a2 + 1;
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
        JUMPOUT(0x14A68);
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
          int *result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_14A90(unsigned char *result, char a2)
{
  int *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemeData.CodingKeys()
{
  return &type metadata for PhonemeData.CodingKeys;
}

unint64_t sub_14AB0()
{
  unint64_t result = qword_531F0;
  if (!qword_531F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531F0);
  }
  return result;
}

unint64_t sub_14B08()
{
  unint64_t result = qword_531F8;
  if (!qword_531F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_531F8);
  }
  return result;
}

unint64_t sub_14B60()
{
  unint64_t result = qword_53200;
  if (!qword_53200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53200);
  }
  return result;
}

unint64_t sub_14BB8()
{
  unint64_t result = qword_53208;
  if (!qword_53208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53208);
  }
  return result;
}

unint64_t sub_14C10()
{
  unint64_t result = qword_53210;
  if (!qword_53210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53210);
  }
  return result;
}

unint64_t sub_14C68()
{
  unint64_t result = qword_53218;
  if (!qword_53218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53218);
  }
  return result;
}

unint64_t sub_14CC0()
{
  unint64_t result = qword_53220;
  if (!qword_53220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53220);
  }
  return result;
}

unint64_t sub_14D18()
{
  unint64_t result = qword_53228;
  if (!qword_53228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53228);
  }
  return result;
}

unint64_t sub_14D70()
{
  unint64_t result = qword_53230;
  if (!qword_53230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53230);
  }
  return result;
}

unint64_t sub_14DC8()
{
  unint64_t result = qword_53238;
  if (!qword_53238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53238);
  }
  return result;
}

unint64_t sub_14E20()
{
  unint64_t result = qword_53240;
  if (!qword_53240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53240);
  }
  return result;
}

unint64_t sub_14E78()
{
  unint64_t result = qword_53248;
  if (!qword_53248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53248);
  }
  return result;
}

uint64_t type metadata accessor for TMDCCoreDataStore()
{
  uint64_t result = qword_53260;
  if (!qword_53260) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_14F20()
{
  return swift_initClassMetadata2();
}

uint64_t sub_14F60()
{
  uint64_t v2 = sub_3E9F8();
  uint64_t v3 = v0;
  swift_bridgeObjectRetain();
  v4._object = (void *)0x80000000000434B0;
  v4._countAndFlagsBits = 0xD000000000000019;
  sub_3EE18(v4);
  uint64_t result = swift_bridgeObjectRelease();
  qword_53250 = v2;
  *(void *)algn_53258 = v3;
  return result;
}

id sub_14FD0(id a1)
{
  uint64_t v2 = self;
  NSString v3 = sub_3ED48();
  id v4 = [v2 entityForName:v3 inManagedObjectContext:a1];

  if (v4)
  {
    a1 = [objc_allocWithZone((Class)type metadata accessor for TMDCGroundTruthCoreDataRecord()) initWithEntity:v4 insertIntoManagedObjectContext:a1];
    BOOL v7 = a1;
    sub_150CC(&v7);
  }
  else
  {
    sub_18C2C();
    swift_allocError();
    *uint64_t v5 = 0;
    v5[1] = 0;
    swift_willThrow();
  }
  return a1;
}

void sub_150CC(void **a1)
{
  uint64_t v3 = sub_3E4F8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = *a1;
  Class isa = sub_3E518().super.isa;
  [v7 setIdentifier:isa];

  uint64_t v9 = (int *)type metadata accessor for TMDCGroundTruth();
  NSString v10 = sub_3ED48();
  [v7 setContactName:v10];

  NSString v11 = sub_3ED48();
  [v7 setAsrPhonemes:v11];

  id v12 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:*(void *)(v1 + v9[7])];
  [v7 setAsrConfidence:v12];

  [v7 setSiriCurrentPronunciation:*(void *)(v1 + v9[9])];
  [v7 setSiriCorrectedPronunciation:*(void *)(v1 + v9[10])];
  id v13 = [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)(v1 + v9[11])];
  [v7 setP2pDistance:v13];

  id v14 = [objc_allocWithZone((Class)NSNumber) initWithBool:*(unsigned __int8 *)(v1 + v9[12])];
  [v7 setTtsMispronounced:v14];

  if (*(void *)(v1 + v9[13] + 8)) {
    NSString v15 = sub_3ED48();
  }
  else {
    NSString v15 = 0;
  }
  [v7 setOverriddenContactIdentifier:v15];

  sub_3E4E8();
  sub_3E4D8();
  double v17 = v16;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v18 = [objc_allocWithZone((Class)NSNumber) initWithDouble:v17];
  [v7 setEditTimestamp:v18];
}

int *sub_15398@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = sub_3E558();
  uint64_t v3 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [v1 identifier];
  sub_3E538();

  id v7 = [v1 contactName];
  uint64_t v8 = sub_3ED78();
  uint64_t v36 = v9;
  uint64_t v37 = v8;

  id v10 = [v1 asrConfidence];
  id v35 = [v10 longLongValue];

  id v11 = [v1 asrPhonemes];
  uint64_t v12 = sub_3ED78();
  uint64_t v33 = v13;
  uint64_t v34 = v12;

  id v14 = [v1 siriCurrentPronunciation];
  id v15 = [v1 siriCorrectedPronunciation];
  id v16 = [v1 p2pDistance];
  [v16 doubleValue];
  uint64_t v18 = v17;

  id v19 = [v1 ttsMispronounced];
  unsigned __int8 v20 = [v19 BOOLValue];

  id v21 = [v1 overriddenContactIdentifier];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = sub_3ED78();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  sub_3E9B8();
  swift_allocObject();
  sub_3E9A8();
  char v26 = sub_3E998();
  swift_release();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v38);
  uint64_t result = (int *)type metadata accessor for TMDCGroundTruth();
  *(unsigned char *)(a1 + result[5]) = (v26 & 1) == 0;
  char v28 = (uint64_t *)(a1 + result[6]);
  uint64_t v29 = v36;
  *char v28 = v37;
  v28[1] = v29;
  *(void *)(a1 + result[7]) = v35;
  char v30 = (uint64_t *)(a1 + result[8]);
  uint64_t v31 = v33;
  *char v30 = v34;
  v30[1] = v31;
  *(void *)(a1 + result[9]) = v14;
  *(void *)(a1 + result[10]) = v15;
  *(void *)(a1 + result[11]) = v18;
  *(unsigned char *)(a1 + result[12]) = v20;
  int v32 = (uint64_t *)(a1 + result[13]);
  *int v32 = v23;
  v32[1] = v25;
  return result;
}

void sub_156A0()
{
  qword_57C80 = 0x411E848000000000;
}

void sub_156B4()
{
  uint64_t v1 = (void *)sub_3E768();
  id v2 = sub_14FD0(v1);

  if (!v0)
  {

    uint64_t v3 = (void *)sub_3E768();
    id v7 = 0;
    unsigned int v4 = [v3 save:&v7];

    if (v4)
    {
      id v5 = v7;
    }
    else
    {
      id v6 = v7;
      sub_3E488();

      swift_willThrow();
    }
  }
}

void sub_157A8(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_62C4(&qword_532B0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for TMDCGroundTruth();
  uint64_t v42 = *(void *)(v45 - 8);
  uint64_t v9 = __chkstk_darwin(v45);
  uint64_t v44 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v41 = (uint64_t)&v38 - v11;
  id v12 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v13 = sub_3ED48();
  id v14 = [v12 initWithEntityName:v13];

  if (a2)
  {
    sub_BA34(0, &qword_532C0);
    sub_62C4(&qword_532C8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_40160;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = sub_17E48();
    *(void *)(v15 + 32) = a1;
    *(void *)(v15 + 40) = a2;
    swift_bridgeObjectRetain();
    id v16 = (void *)sub_3EF98();
    [v14 setPredicate:v16];
  }
  sub_62C4(&qword_52BE0);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_40170;
  id v18 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v19 = sub_3ED48();
  id v20 = [v18 initWithKey:v19 ascending:0];

  *(void *)(v17 + 32) = v20;
  uint64_t v46 = v17;
  sub_3EED8();
  sub_BA34(0, &qword_532B8);
  Class isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  [v14 setSortDescriptors:isa];

  uint64_t v22 = (void *)sub_3E768();
  type metadata accessor for TMDCGroundTruthCoreDataRecord();
  unint64_t v23 = v43;
  uint64_t v24 = sub_3F038();
  if (v23)
  {

    return;
  }
  unint64_t v25 = v24;

  if (!(v25 >> 62))
  {
    uint64_t v26 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v26) {
      goto LABEL_7;
    }
LABEL_22:

    swift_bridgeObjectRelease();
    char v30 = _swiftEmptyArrayStorage;
LABEL_23:
    swift_bridgeObjectRelease();
    *a3 = v30;
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_3F378();
  if (!v26) {
    goto LABEL_22;
  }
LABEL_7:
  if (v26 >= 1)
  {
    uint64_t v38 = 0;
    id v39 = v14;
    uint64_t v40 = a3;
    uint64_t v27 = 0;
    unint64_t v43 = v25 & 0xC000000000000001;
    char v28 = (void (**)(char *, void, uint64_t, uint64_t))(v42 + 56);
    uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
    char v30 = _swiftEmptyArrayStorage;
    unint64_t v31 = v25;
    do
    {
      if (v43) {
        id v32 = (id)sub_3F278();
      }
      else {
        id v32 = *(id *)(v25 + 8 * v27 + 32);
      }
      uint64_t v33 = v32;
      sub_15398((uint64_t)v8);
      uint64_t v34 = v45;
      (*v28)(v8, 0, 1, v45);

      if ((*v29)(v8, 1, v34) == 1)
      {
        sub_DCD4((uint64_t)v8, &qword_532B0);
      }
      else
      {
        uint64_t v35 = v41;
        sub_17494((uint64_t)v8, v41);
        sub_17494(v35, v44);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v30 = (void *)sub_17BC8(0, v30[2] + 1, 1, (unint64_t)v30, &qword_532D8, (uint64_t (*)(void))type metadata accessor for TMDCGroundTruth, (uint64_t (*)(void))type metadata accessor for TMDCGroundTruth);
        }
        unint64_t v37 = v30[2];
        unint64_t v36 = v30[3];
        if (v37 >= v36 >> 1) {
          char v30 = (void *)sub_17BC8(v36 > 1, v37 + 1, 1, (unint64_t)v30, &qword_532D8, (uint64_t (*)(void))type metadata accessor for TMDCGroundTruth, (uint64_t (*)(void))type metadata accessor for TMDCGroundTruth);
        }
        v30[2] = v37 + 1;
        sub_17494(v44, (uint64_t)v30+ ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80))+ *(void *)(v42 + 72) * v37);
      }
      ++v27;
      unint64_t v25 = v31;
    }
    while (v26 != v27);

    swift_bridgeObjectRelease();
    a3 = v40;
    goto LABEL_23;
  }
  __break(1u);
}

void sub_15D38(uint64_t a1, uint64_t a2)
{
}

void sub_15D60(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v4 = sub_3ED48();
  id v5 = [v3 initWithEntityName:v4];

  if (*(void *)(a1 + 16))
  {
    sub_BA34(0, &qword_532C0);
    sub_62C4(&qword_532C8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_40160;
    *(void *)(v6 + 56) = sub_62C4(&qword_53350);
    *(void *)(v6 + 64) = sub_19130();
    *(void *)(v6 + 32) = a1;
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_3EF98();
    [v5 setPredicate:v7];
  }
  uint64_t v8 = (void *)sub_3E768();
  type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t v9 = sub_3F038();
  if (v1)
  {

    return;
  }
  unint64_t v10 = v9;

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_3F378();
    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_7:
      if (v11 < 1) {
        __break(1u);
      }
      uint64_t v12 = 0;
      do
      {
        if ((v10 & 0xC000000000000001) != 0) {
          id v13 = (id)sub_3F278();
        }
        else {
          id v13 = *(id *)(v10 + 8 * v12 + 32);
        }
        id v14 = v13;
        ++v12;
        uint64_t v15 = (void *)sub_3E768();
        [v15 deleteObject:v14];
      }
      while (v11 != v12);
    }
  }
  swift_bridgeObjectRelease_n();
  id v16 = (void *)sub_3E768();
  id v20 = 0;
  unsigned __int8 v17 = [v16 save:&v20];

  if (v17)
  {
    id v18 = v20;
  }
  else
  {
    id v19 = v20;
    sub_3E488();

    swift_willThrow();
  }
}

void sub_16040()
{
}

void sub_16064()
{
  uint64_t v2 = v0;
  id v3 = (void *)sub_3E768();
  int64_t v4 = (int64_t)sub_167C0();

  if (qword_527A8 != -1) {
    goto LABEL_43;
  }
LABEL_2:
  uint64_t v5 = sub_3EC68();
  sub_60E8(v5, (uint64_t)qword_57CC8);
  uint64_t v6 = sub_3EC48();
  os_log_type_t v7 = sub_3EFB8();
  unint64_t v8 = v7;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 134217984;
    uint64_t v47 = (void *)v4;
    sub_3F088();
    _os_log_impl(&dword_0, v6, (os_log_type_t)v8, "Current TMDCCoreData store size (bytes): %ld", v9, 0xCu);
    swift_slowDealloc();
  }

  if (qword_52748 != -1) {
    swift_once();
  }
  if ((~qword_57C80 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_45;
  }
  if (*(double *)&qword_57C80 <= -9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (*(double *)&qword_57C80 >= 9.22337204e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v1 = v4 - (uint64_t)*(double *)&qword_57C80;
  if (__OFSUB__(v4, (uint64_t)*(double *)&qword_57C80))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  unint64_t v10 = sub_3EC48();
  os_log_type_t v11 = sub_3EFB8();
  BOOL v12 = os_log_type_enabled(v10, v11);
  if (v1 < 1)
  {
    if (!v12) {
      goto LABEL_53;
    }
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_0, v10, v11, "Store size to delete is not greater than 0, skipping deletion", v29, 2u);
    goto LABEL_52;
  }
  if (v12)
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v13 = 134217984;
    uint64_t v47 = (void *)v1;
    sub_3F088();
    _os_log_impl(&dword_0, v10, v11, "Store size to delete (in bytes): %ld", v13, 0xCu);
    swift_slowDealloc();
  }

  unint64_t v14 = sub_1725C(0, 1, 1);
  if (v2) {
    return;
  }
  unint64_t v8 = v14;
  if (v14 >> 62)
  {
LABEL_48:
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_3F378();
    swift_bridgeObjectRelease();
    if (v15 < 1)
    {
LABEL_49:
      swift_bridgeObjectRelease();
      unint64_t v10 = sub_3EC48();
      os_log_type_t v30 = sub_3EFB8();
      if (os_log_type_enabled(v10, v30))
      {
        unint64_t v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v31 = 0;
        id v32 = "No records were fetched, skipping deletion";
        goto LABEL_51;
      }
      goto LABEL_53;
    }
    goto LABEL_16;
  }
  uint64_t v15 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
  if (v15 < 1) {
    goto LABEL_49;
  }
LABEL_16:
  uint64_t v16 = v4 / v15;
  if (!(v4 / v15))
  {
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
  }
  uint64_t v17 = v1 / v16;
  if (v1 / v16 < 1)
  {
    swift_bridgeObjectRelease();
    unint64_t v10 = sub_3EC48();
    os_log_type_t v30 = sub_3EFB8();
    if (!os_log_type_enabled(v10, v30)) {
      goto LABEL_53;
    }
    unint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v31 = 0;
    id v32 = "No records to delete based on size, skipping deletion";
LABEL_51:
    _os_log_impl(&dword_0, v10, v30, v32, v31, 2u);
LABEL_52:
    swift_slowDealloc();
LABEL_53:

    return;
  }
  id v18 = sub_3EC48();
  os_log_type_t v19 = sub_3EFB8();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v20 = 134217984;
    uint64_t v47 = (void *)v17;
    sub_3F088();
    _os_log_impl(&dword_0, v18, v19, "Number of records to delete: %ld", v20, 0xCu);
    swift_slowDealloc();
  }

  sub_18C80(v17, v8);
  uint64_t v1 = v21;
  uint64_t v2 = v22;
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  unint64_t v25 = (v24 >> 1) - v2;
  if (__OFSUB__(v24 >> 1, v2)) {
    goto LABEL_56;
  }
  if (!v25)
  {
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  uint64_t v46 = v17;
  uint64_t v47 = _swiftEmptyArrayStorage;
  sub_3F2F8();
  if ((v25 & 0x8000000000000000) != 0) {
    goto LABEL_57;
  }
  if (v2 <= (uint64_t)(v24 >> 1)) {
    unint64_t v26 = v24 >> 1;
  }
  else {
    unint64_t v26 = v2;
  }
  int64_t v4 = v26 - v2;
  uint64_t v27 = (void **)(v1 + 8 * v2);
  do
  {
    if (!v4)
    {
      __break(1u);
LABEL_43:
      swift_once();
      goto LABEL_2;
    }
    char v28 = *v27++;
    uint64_t v1 = (uint64_t)[v28 objectID];
    sub_3F2D8();
    uint64_t v2 = v47[2];
    sub_3F308();
    sub_3F318();
    sub_3F2E8();
    --v4;
    --v25;
  }
  while (v25);
  swift_unknownObjectRelease();
  uint64_t v17 = v46;
LABEL_35:
  id v33 = objc_allocWithZone((Class)NSBatchDeleteRequest);
  sub_BA34(0, &qword_53338);
  Class isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  id v35 = [v33 initWithObjectIDs:isa];

  unint64_t v36 = (void *)sub_3E768();
  uint64_t v47 = 0;
  id v37 = [v36 executeRequest:v35 error:&v47];

  id v38 = v47;
  if (v37
    && (id v39 = v47,
        v37,
        uint64_t v40 = (void *)sub_3E768(),
        uint64_t v47 = 0,
        unsigned __int8 v41 = [v40 save:&v47],
        v40,
        id v38 = v47,
        (v41 & 1) != 0))
  {
    uint64_t v42 = v47;
    unint64_t v10 = sub_3EC48();
    os_log_type_t v43 = sub_3EFB8();
    if (os_log_type_enabled(v10, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 134217984;
      uint64_t v47 = (void *)v17;
      sub_3F088();
      _os_log_impl(&dword_0, v10, v43, "Completed deleting %ld TMDC CoreData records", v44, 0xCu);
      swift_slowDealloc();

      goto LABEL_53;
    }
  }
  else
  {
    id v45 = v38;
    sub_3E488();

    swift_willThrow();
  }
}

char *sub_167C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_62C4(&qword_53340);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (NSString *)((char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v3);
  os_log_type_t v7 = (char *)&v69 - v6;
  uint64_t v8 = sub_3E4B8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [v1 persistentStoreCoordinator];
  if (!v12)
  {
LABEL_64:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
LABEL_65:
    sub_DCD4((uint64_t)v7, &qword_53340);
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_3EC68();
    sub_60E8(v65, (uint64_t)qword_57CC8);
    unint64_t v66 = sub_3EC48();
    os_log_type_t v67 = sub_3EFC8();
    if (os_log_type_enabled(v66, v67))
    {
      unint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v68 = 0;
      _os_log_impl(&dword_0, v66, v67, "NSManagedObjectContext: Failed to get store URL", v68, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  id v13 = v12;
  id v14 = [v12 persistentStores];

  sub_BA34(0, &qword_53348);
  unint64_t v15 = sub_3EEB8();

  if (v15 >> 62) {
    goto LABEL_62;
  }
  if (!*(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_63:
    swift_bridgeObjectRelease();
    goto LABEL_64;
  }
  while (1)
  {
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = (id)sub_3F278();
    }
    else
    {
      if (!*(void *)((char *)&dword_10 + (v15 & 0xFFFFFFFFFFFFFF8)))
      {
        __break(1u);
        goto LABEL_73;
      }
      id v16 = *(id *)(v15 + 32);
    }
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    id v18 = [v17 URL];

    if (v18)
    {
      sub_3E498();

      (*(void (**)(NSString *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    }
    else
    {
      (*(void (**)(NSString *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
    }
    sub_19014((uint64_t)v5, (uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
      goto LABEL_65;
    }
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    os_log_type_t v19 = self;
    id v20 = [v19 defaultManager];
    sub_3E4A8();
    NSString v21 = sub_3ED48();
    swift_bridgeObjectRelease();
    Swift::String v72 = 0;
    id v22 = [v20 attributesOfItemAtPath:v21 error:&v72];

    id v23 = v72;
    if (!v22) {
      goto LABEL_24;
    }
    type metadata accessor for FileAttributeKey();
    uint64_t v5 = v24;
    unint64_t v15 = sub_1907C();
    uint64_t v25 = sub_3ECB8();
    id v26 = v23;

    if (*(void *)(v25 + 16))
    {
      uint64_t v27 = NSFileSize;
      unint64_t v28 = sub_34BE0((uint64_t)v27);
      if (v29)
      {
        sub_190D4(*(void *)(v25 + 56) + 32 * v28, (uint64_t)&v74);
      }
      else
      {
        long long v74 = 0u;
        long long v75 = 0u;
      }
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v75 + 1)) {
      break;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_31;
    }
    id v70 = v72;
    NSFileAttributeKey v71 = NSFileSize;
    id v30 = [v19 defaultManager];
    Swift::String v72 = (char *)sub_3E4A8();
    uint64_t v73 = v31;
    v76._countAndFlagsBits = 1818326829;
    v76._object = (void *)0xE400000000000000;
    sub_3EE18(v76);
    NSString v32 = sub_3ED48();
    swift_bridgeObjectRelease();
    Swift::String v72 = 0;
    id v33 = [v30 attributesOfItemAtPath:v32 error:&v72];

    id v23 = v72;
    if (!v33)
    {
LABEL_24:
      id v39 = (char *)v23;
      goto LABEL_25;
    }
    uint64_t v34 = sub_3ECB8();
    id v35 = v23;

    if (*(void *)(v34 + 16))
    {
      unint64_t v36 = v71;
      unint64_t v37 = sub_34BE0((uint64_t)v36);
      if (v38)
      {
        sub_190D4(*(void *)(v34 + 56) + 32 * v37, (uint64_t)&v74);
      }
      else
      {
        long long v74 = 0u;
        long long v75 = 0u;
      }
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v75 + 1))
    {
      if (swift_dynamicCast())
      {
        uint64_t v50 = v72;
        goto LABEL_45;
      }
    }
    else
    {
      sub_DCD4((uint64_t)&v74, (uint64_t *)&unk_52C30);
    }
    uint64_t v50 = 0;
LABEL_45:
    id v51 = [v19 defaultManager];
    Swift::String v72 = (char *)sub_3E4A8();
    uint64_t v73 = v52;
    v77._countAndFlagsBits = 1835561773;
    v77._object = (void *)0xE400000000000000;
    sub_3EE18(v77);
    NSString v53 = sub_3ED48();
    swift_bridgeObjectRelease();
    Swift::String v72 = 0;
    id v54 = [v51 attributesOfItemAtPath:v53 error:&v72];

    id v55 = v72;
    if (!v54)
    {
      id v39 = v72;
LABEL_25:
      sub_3E488();

      swift_willThrow();
      if (qword_527A8 == -1)
      {
LABEL_26:
        uint64_t v40 = sub_3EC68();
        sub_60E8(v40, (uint64_t)qword_57CC8);
        swift_errorRetain();
        swift_errorRetain();
        unsigned __int8 v41 = sub_3EC48();
        os_log_type_t v42 = sub_3EFC8();
        if (os_log_type_enabled(v41, v42))
        {
          os_log_type_t v43 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v74 = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v43 = 136315138;
          NSFileAttributeKey v71 = (NSFileAttributeKey)(v43 + 4);
          swift_getErrorValue();
          uint64_t v44 = sub_3F5D8();
          Swift::String v72 = (char *)sub_2B8C8(v44, v45, (uint64_t *)&v74);
          sub_3F088();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v41, v42, "NSManagedObjectContext: Cannot determine store size %s", v43, 0xCu);
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
        goto LABEL_36;
      }
LABEL_73:
      swift_once();
      goto LABEL_26;
    }
    os_log_type_t v7 = (char *)sub_3ECB8();
    id v56 = v55;

    if (*((void *)v7 + 2))
    {
      uint64_t v5 = v71;
      unint64_t v57 = sub_34BE0((uint64_t)v5);
      if (v58)
      {
        sub_190D4(*((void *)v7 + 7) + 32 * v57, (uint64_t)&v74);
      }
      else
      {
        long long v74 = 0u;
        long long v75 = 0u;
      }
    }
    else
    {
      long long v74 = 0u;
      long long v75 = 0u;
    }
    swift_bridgeObjectRelease();
    uint64_t v59 = *(void (**)(char *, uint64_t))(v9 + 8);
    v9 += 8;
    v59(v11, v8);
    if (!*((void *)&v75 + 1))
    {
      sub_DCD4((uint64_t)&v74, (uint64_t *)&unk_52C30);
LABEL_57:
      uint64_t v60 = 0;
      goto LABEL_58;
    }
    if (!swift_dynamicCast()) {
      goto LABEL_57;
    }
    uint64_t v60 = v72;
LABEL_58:
    BOOL v61 = __OFADD__(v70, v60);
    uint64_t v62 = &v60[(void)v70];
    if (v61) {
      __break(1u);
    }
    uint64_t result = &v50[(void)v62];
    if (!__OFADD__(v62, v50)) {
      return result;
    }
    __break(1u);
LABEL_62:
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_3F378();
    swift_bridgeObjectRelease();
    if (!v64) {
      goto LABEL_63;
    }
  }
  sub_DCD4((uint64_t)&v74, (uint64_t *)&unk_52C30);
LABEL_31:
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v46 = sub_3EC68();
  sub_60E8(v46, (uint64_t)qword_57CC8);
  uint64_t v47 = sub_3EC48();
  os_log_type_t v48 = sub_3EFC8();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_0, v47, v48, "NSManagedObjectContext: Failed to get store size", v49, 2u);
    swift_slowDealloc();
  }

LABEL_36:
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return 0;
}

uint64_t sub_1725C(uint64_t a1, char a2, char a3)
{
  id v5 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v6 = sub_3ED48();
  id v7 = [v5 initWithEntityName:v6];

  sub_62C4(&qword_52BE0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_40170;
  id v9 = objc_allocWithZone((Class)NSSortDescriptor);
  NSString v10 = sub_3ED48();
  id v11 = [v9 initWithKey:v10 ascending:a3 & 1];

  *(void *)(v8 + 32) = v11;
  sub_3EED8();
  sub_BA34(0, &qword_532B8);
  Class isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  [v7 setSortDescriptors:isa];

  if ((a2 & 1) == 0) {
    [v7 setFetchLimit:a1];
  }
  id v13 = (void *)sub_3E768();
  type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t v14 = sub_3F038();

  return v14;
}

void sub_1742C()
{
}

uint64_t sub_1745C()
{
  uint64_t v0 = sub_3E778();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_1748C()
{
  return type metadata accessor for TMDCCoreDataStore();
}

uint64_t sub_17494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TMDCGroundTruth();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_174F8(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_17630(a1, a2, a3, a4, &qword_53300, &qword_53308);
}

void *sub_1750C(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53368);
      NSString v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      NSString v10 = _swiftEmptyArrayStorage;
      id v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_184EC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1761C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_17630(a1, a2, a3, a4, &qword_53370, &qword_528E8);
}

void *sub_17630(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_62C4(a5);
      id v13 = (void *)swift_allocObject();
      int64_t v14 = j__malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      id v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      id v13 = _swiftEmptyArrayStorage;
      id v16 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_183E4(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void *sub_1774C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_62C4(&qword_53320);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_186E4(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_17848(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53360);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_187CC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1796C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_17BC8(a1, a2, a3, a4, &qword_532E8, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

void *sub_17990(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53318);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_189D4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_17AB8(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53328);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      id v13 = &_swiftEmptyArrayStorage[4];
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
    sub_185D8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_17BC8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
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
    id v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_62C4(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  id v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_3F368();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_18ACC(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

unint64_t sub_17E48()
{
  unint64_t result = qword_532D0;
  if (!qword_532D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_532D0);
  }
  return result;
}

void *sub_17E9C(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53378);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_18E14(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_17FAC(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_53310);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_18F08(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_180BC(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4((uint64_t *)&unk_536F0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
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
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_182F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_181CC(void *result, int64_t a2, char a3, void *a4)
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
      sub_62C4(&qword_532F0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_188C4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_182F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_183E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      sub_62C4(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

char *sub_184EC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_185D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_62C4(&qword_53330);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

char *sub_186E4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_187CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_188C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_62C4(&qword_532F8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_189D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_18ACC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

unint64_t sub_18C2C()
{
  unint64_t result = qword_532E0;
  if (!qword_532E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_532E0);
  }
  return result;
}

uint64_t sub_18C80(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_3F378();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_3F378();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_3F378();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    type metadata accessor for TMDCGroundTruthCoreDataRecord();
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      sub_3F268(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_3F388();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_18E14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_18F08(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_62C4(&qword_53118);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_19014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1907C()
{
  unint64_t result = qword_52910;
  if (!qword_52910)
  {
    type metadata accessor for FileAttributeKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_52910);
  }
  return result;
}

uint64_t sub_190D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_19130()
{
  unint64_t result = qword_53358;
  if (!qword_53358)
  {
    sub_13560(&qword_53350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53358);
  }
  return result;
}

id TMDCGroundTruthCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id TMDCGroundTruthCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TMDCGroundTruthCoreDataRecord();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for TMDCGroundTruthCoreDataRecord()
{
  return self;
}

id TMDCGroundTruthCoreDataRecord.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TMDCGroundTruthCoreDataRecord();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_192F8()
{
  uint64_t v1 = sub_62C4(&qword_53458);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  objc_super v7 = (char *)&v12 - v6;
  sub_6280(v0 + 7, v0[10]);
  uint64_t v8 = sub_3E8F8();
  if (!v8)
  {
    sub_3E7F8();
    uint64_t v8 = sub_3E7E8();
  }
  uint64_t v9 = (void *)v8;
  sub_6280(v0 + 2, v0[5]);
  sub_3E978();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = &unk_53468;
  *(void *)(v10 + 24) = v0;
  sub_3E748();
  sub_19A34();
  swift_retain();
  sub_3F358();

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
}

uint64_t sub_19514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_19538, 0, 0);
}

uint64_t sub_19538()
{
  uint64_t v1 = (void *)v0[4];
  if (v1)
  {
    sub_6280((void *)(v0[5] + 56), *(void *)(v0[5] + 80));
    id v2 = v1;
    sub_3E908();
  }
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = sub_3E748();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v3, v4, v5);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_19610(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_62C4(&qword_53488) + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_19A90;
  return v10(a1, a2, v7);
}

uint64_t sub_1971C()
{
  sub_66DC(v0 + 16);
  sub_66DC(v0 + 56);

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for SiriConversationReader()
{
  return self;
}

uint64_t sub_19780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[4] = a3;
  v8[5] = v3;
  _OWORD v8[2] = a1;
  v8[3] = a2;
  v8[1] = sub_19A90;
  return _swift_task_switch(sub_19538, 0, 0);
}

uint64_t sub_19840()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_19878(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_19940;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_53470 + dword_53470);
  return v8(a1, a2, v6);
}

uint64_t sub_19940()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_19A34()
{
  unint64_t result = qword_53480;
  if (!qword_53480)
  {
    sub_13560(&qword_53458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53480);
  }
  return result;
}

uint64_t sub_19A94(char a1)
{
  return *(void *)&aFirst_1[8 * a1];
}

uint64_t sub_19AB4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  _OWORD v7[2] = *(_OWORD *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 48);
  return sub_1DE80((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_19B10(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_3F5A8();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t sub_19B70(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return sub_1DF2C((uint64_t)&v5, (uint64_t)&v7) & 1;
}

uint64_t sub_19BBC(uint64_t a1, uint64_t a2)
{
  return sub_1DC68(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_19BD8(char *a1, char *a2)
{
  return sub_2E304(*a1, *a2);
}

Swift::Int sub_19BE4()
{
  return sub_2E63C();
}

uint64_t sub_19BEC()
{
  return sub_2E840();
}

Swift::Int sub_19BF4()
{
  return sub_2EB38();
}

uint64_t sub_19BFC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1E060(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_19C2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19A94(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_19C70(void *a1)
{
  NSString v2 = sub_3ED48();
  NSString v3 = sub_3ED48();
  [a1 encodeObject:v2 forKey:v3];

  NSString v4 = sub_3ED48();
  swift_bridgeObjectRelease();
  NSString v5 = sub_3ED48();
  [a1 encodeObject:v4 forKey:v5];

  NSString v6 = sub_3ED48();
  NSString v7 = sub_3ED48();
  [a1 encodeObject:v6 forKey:v7];
}

uint64_t sub_19DD0(char a1)
{
  return *(void *)&aNvasr_2[8 * a1];
}

id sub_19E58(void *a1)
{
  NSString v2 = v1;
  sub_BA34(0, (unint64_t *)&unk_53520);
  NSString v4 = v2;
  uint64_t v5 = sub_3F048();
  if (v5)
  {
    NSString v6 = (void *)v5;
    uint64_t v7 = sub_3ED78();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = sub_3F048();
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = sub_3ED78();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v15 = sub_3F048();
  if (!v15)
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    if (v9) {
      goto LABEL_9;
    }
LABEL_13:

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = sub_3ED78();
  uint64_t v19 = v18;

  if (!v9) {
    goto LABEL_13;
  }
LABEL_9:
  if (!v14 || (char v20 = sub_1E0AC(v12, v14), v20 == 4))
  {
    swift_bridgeObjectRelease();

LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (v19)
  {
    unint64_t v23 = (uint64_t *)&v4[OBJC_IVAR___PhonemeString_symbols];
    *unint64_t v23 = v7;
    v23[1] = v9;
    v4[OBJC_IVAR___PhonemeString_encoding] = v20;
    unint64_t v24 = (uint64_t *)&v4[OBJC_IVAR___PhonemeString_boundary];
    *unint64_t v24 = v17;
    v24[1] = v19;

    v25.receiver = v4;
    v25.super_class = (Class)type metadata accessor for PhonemeString();
    id v21 = objc_msgSendSuper2(&v25, "init");

    return v21;
  }
  swift_bridgeObjectRelease();

LABEL_15:
  type metadata accessor for PhonemeString();
  swift_deallocPartialClassInstance();
  return 0;
}

void *sub_1A094()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  uint64_t v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary) & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_6688();
    return (void *)sub_3F0A8();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_3EDF8();
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = v4;
  uint64_t result = (void *)sub_3A758(0, v4 & ~(v4 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    NSString v3 = _swiftEmptyArrayStorage;
    do
    {
      sub_3EE58();
      sub_3ECD8();
      swift_bridgeObjectRelease();
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_3A758(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v9 = &_swiftEmptyArrayStorage[2 * v8];
      v9[4] = 0;
      v9[5] = 0xE000000000000000;
      sub_3EE08();
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A25C(uint64_t a1)
{
  sub_AC94(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_AC34((uint64_t)v7);
    goto LABEL_16;
  }
  type metadata accessor for PhonemeString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    char v4 = 0;
    return v4 & 1;
  }
  BOOL v2 = *(void *)(v1 + OBJC_IVAR___PhonemeString_symbols) == *(void *)&v6[OBJC_IVAR___PhonemeString_symbols]
    && *(void *)(v1 + OBJC_IVAR___PhonemeString_symbols + 8) == *(void *)&v6[OBJC_IVAR___PhonemeString_symbols + 8];
  if (!v2 && (sub_3F5A8() & 1) == 0
    || (sub_2E510(*(unsigned char *)(v1 + OBJC_IVAR___PhonemeString_encoding), v6[OBJC_IVAR___PhonemeString_encoding]) & 1) == 0)
  {

    goto LABEL_16;
  }
  if (*(void *)(v1 + OBJC_IVAR___PhonemeString_boundary) == *(void *)&v6[OBJC_IVAR___PhonemeString_boundary]
    && *(void *)(v1 + OBJC_IVAR___PhonemeString_boundary + 8) == *(void *)&v6[OBJC_IVAR___PhonemeString_boundary + 8])
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_3F5A8();
  }
  return v4 & 1;
}

Swift::Int sub_1A414()
{
  return sub_3F648();
}

uint64_t sub_1A574()
{
  BYTE8(v6) = 0;
  sub_3F238(54);
  v7._object = (void *)0x8000000000043670;
  v7._countAndFlagsBits = 0xD000000000000018;
  sub_3EE18(v7);
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols);
  BOOL v2 = *(void **)(v0 + OBJC_IVAR___PhonemeString_symbols + 8);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = v1;
  v8._object = v2;
  sub_3EE18(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x69646F636E65202CLL;
  v9._object = (void *)0xEC000000203A676ELL;
  sub_3EE18(v9);
  *(void *)&long long v6 = *(unsigned __int8 *)(v0 + OBJC_IVAR___PhonemeString_encoding);
  sub_3F348();
  v10._countAndFlagsBits = 0x61646E756F62202CLL;
  v10._object = (void *)0xEC000000203A7972;
  sub_3EE18(v10);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary);
  char v4 = *(void **)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v3;
  v11._object = v4;
  sub_3EE18(v11);
  swift_bridgeObjectRelease();
  return *(void *)((char *)&v6 + 1);
}

uint64_t sub_1A6C0()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  uint64_t v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary) & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    sub_6688();
    return sub_3F0D8();
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_3EDF8();
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    sub_62C4(&qword_53308);
    sub_1E1A0();
    uint64_t v3 = sub_3ECE8();
    swift_bridgeObjectRelease();
    return v3;
  }
  uint64_t v5 = v4;
  uint64_t result = sub_3A758(0, v4 & ~(v4 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    do
    {
      sub_3EE58();
      sub_3ECD8();
      swift_bridgeObjectRelease();
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_3A758(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      Swift::String v9 = &_swiftEmptyArrayStorage[2 * v8];
      v9[4] = 0;
      v9[5] = 0xE000000000000000;
      sub_3EE08();
      --v5;
    }
    while (v5);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A928(char a1)
{
  return *(void *)&aSymbols_1[8 * a1];
}

uint64_t sub_1A948()
{
  return sub_1A928(*v0);
}

uint64_t sub_1A950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1ED9C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A978(uint64_t a1)
{
  unint64_t v2 = sub_1B1E8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1A9B4(uint64_t a1)
{
  unint64_t v2 = sub_1B1E8();

  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_1A9F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhonemeString();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PhonemeString()
{
  return self;
}

uint64_t sub_1AA9C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4(&qword_53500);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  unint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6280(a1, a1[3]);
  sub_1B1E8();
  sub_3F688();
  v10[15] = 0;
  sub_3F528();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + OBJC_IVAR___PhonemeString_encoding);
    v10[13] = 1;
    sub_1E14C();
    sub_3F558();
    v10[12] = 2;
    sub_3F528();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unsigned char *storeEnumTagSinglePayload for PhonemeFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x1AD28);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhonemeFormat()
{
  return &type metadata for PhonemeFormat;
}

id sub_1AD60(void *a1)
{
  uint64_t v4 = sub_62C4(&qword_534E0);
  uint64_t v20 = *(void *)(v4 - 8);
  uint64_t v21 = v4;
  __chkstk_darwin();
  unsigned int v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6280(a1, a1[3]);
  sub_1B1E8();
  unint64_t v8 = v1;
  id v9 = v7;
  sub_3F678();
  if (v2)
  {
    sub_66DC((uint64_t)a1);

    type metadata accessor for PhonemeString();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v20;
    uint64_t v10 = v21;
    char v24 = 0;
    uint64_t v12 = sub_3F468();
    uint64_t v14 = (uint64_t *)&v8[OBJC_IVAR___PhonemeString_symbols];
    *uint64_t v14 = v12;
    v14[1] = v15;
    char v23 = 1;
    sub_1B23C();
    sub_3F498();
    v8[OBJC_IVAR___PhonemeString_encoding] = v24;
    char v24 = 2;
    uint64_t v16 = sub_3F468();
    uint64_t v17 = (uint64_t *)&v8[OBJC_IVAR___PhonemeString_boundary];
    *uint64_t v17 = v16;
    v17[1] = v18;

    uint64_t v19 = (objc_class *)type metadata accessor for PhonemeString();
    v22.receiver = v8;
    v22.super_class = v19;
    id v9 = objc_msgSendSuper2(&v22, "init");
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    sub_66DC((uint64_t)a1);
  }
  return v9;
}

id sub_1AFE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for PhonemeString());
  id result = sub_1AD60(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1B03C(void *a1)
{
  return sub_1AA9C(a1);
}

uint64_t sub_1B060(char *a1, char *a2)
{
  return sub_2E510(*a1, *a2);
}

Swift::Int sub_1B06C()
{
  return sub_2E6A8();
}

uint64_t sub_1B074()
{
  return sub_2E974();
}

Swift::Int sub_1B07C()
{
  return sub_2E9C8();
}

uint64_t sub_1B084@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1E0AC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1B0B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_19DD0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B0E0()
{
  return sub_3EE88();
}

uint64_t sub_1B140()
{
  return sub_3EE78();
}

unint64_t sub_1B194()
{
  unint64_t result = qword_534D8;
  if (!qword_534D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_534D8);
  }
  return result;
}

unint64_t sub_1B1E8()
{
  unint64_t result = qword_534E8;
  if (!qword_534E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_534E8);
  }
  return result;
}

unint64_t sub_1B23C()
{
  unint64_t result = qword_534F0;
  if (!qword_534F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_534F0);
  }
  return result;
}

uint64_t sub_1B290(uint64_t a1, uint64_t a2)
{
  return sub_1DD20(*(void *)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void *)a2, *(void **)(a2 + 8), *(void **)(a2 + 16), *(void **)(a2 + 24));
}

uint64_t sub_1B2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_62C4((uint64_t *)&unk_536F0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_40A20;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = a3;
  *(void *)(v9 + 48) = a4;
  *(void *)(v9 + 56) = a5;
  uint64_t v11 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_355E0(&v11);
  swift_bridgeObjectRelease();
  sub_62C4(&qword_53308);
  sub_1E1A0();
  sub_3ECE8();
  swift_release();
  sub_3EDE8();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1B3C0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  sub_3F628();
  sub_1B2AC((uint64_t)v6, v1, v2, v4, v3);
  return sub_3F658();
}

uint64_t sub_1B420(uint64_t a1)
{
  return sub_1B2AC(a1, *v1, v1[1], v1[2], v1[3]);
}

Swift::Int sub_1B42C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  sub_3F628();
  sub_1B2AC((uint64_t)v6, v1, v2, v4, v3);
  return sub_3F658();
}

BOOL sub_1B488(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  sub_3F628();
  sub_1B2AC((uint64_t)v12, v2, v3, v4, v5);
  Swift::Int v10 = sub_3F658();
  sub_3F628();
  sub_1B2AC((uint64_t)v12, v6, v7, v8, v9);
  return v10 == sub_3F658();
}

double sub_1B538()
{
  sub_62C4(&qword_53538);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 121;
  *(_OWORD *)(v0 + 16) = xmmword_41400;
  *(void *)(v0 + 32) = 16705;
  *(void *)(v0 + 40) = 0xE200000000000000;
  *(void *)(v0 + 48) = 17729;
  *(void *)(v0 + 56) = 0xE200000000000000;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 16705;
  *(void *)(v0 + 80) = 0xE200000000000000;
  *(void *)(v0 + 88) = 18497;
  *(void *)(v0 + 96) = 0xE200000000000000;
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 16705;
  *(void *)(v0 + 120) = 0xE200000000000000;
  *(void *)(v0 + 128) = 22337;
  *(void *)(v0 + 136) = 0xE200000000000000;
  *(void *)(v0 + 144) = 0;
  *(void *)(v0 + 152) = 16705;
  *(void *)(v0 + 160) = 0xE200000000000000;
  *(void *)(v0 + 168) = 4740929;
  *(void *)(v0 + 176) = 0xE300000000000000;
  *(void *)(v0 + 184) = 0;
  *(void *)(v0 + 192) = 16705;
  *(void *)(v0 + 200) = 0xE200000000000000;
  *(void *)(v0 + 208) = 18517;
  *(void *)(v0 + 216) = 0xE200000000000000;
  *(void *)(v0 + 224) = 0;
  *(void *)(v0 + 232) = 16705;
  *(void *)(v0 + 240) = 0xE200000000000000;
  *(void *)(v0 + 248) = 26741;
  *(void *)(v0 + 256) = 0xE200000000000000;
  *(void *)(v0 + 264) = 0;
  *(void *)(v0 + 272) = 17729;
  *(void *)(v0 + 280) = 0xE200000000000000;
  *(void *)(v0 + 288) = 18497;
  *(void *)(v0 + 296) = 0xE200000000000000;
  *(void *)(v0 + 304) = 0;
  *(void *)(v0 + 312) = 17729;
  *(void *)(v0 + 320) = 0xE200000000000000;
  *(void *)(v0 + 328) = 22337;
  *(void *)(v0 + 336) = 0xE200000000000000;
  *(void *)(v0 + 344) = 0;
  *(void *)(v0 + 352) = 17729;
  *(void *)(v0 + 360) = 0xE200000000000000;
  *(void *)(v0 + 368) = 4740929;
  *(void *)(v0 + 376) = 0xE300000000000000;
  *(void *)(v0 + 384) = 0;
  *(void *)(v0 + 392) = 17729;
  *(void *)(v0 + 400) = 0xE200000000000000;
  *(void *)(v0 + 408) = 22849;
  *(void *)(v0 + 416) = 0xE200000000000000;
  *(void *)(v0 + 424) = 0x3FE0000000000000;
  *(void *)(v0 + 432) = 17729;
  *(void *)(v0 + 440) = 0xE200000000000000;
  *(void *)(v0 + 448) = 18517;
  *(void *)(v0 + 456) = 0xE200000000000000;
  *(void *)(v0 + 464) = 0;
  *(void *)(v0 + 472) = 17729;
  *(void *)(v0 + 480) = 0xE200000000000000;
  *(void *)(v0 + 488) = 26741;
  *(void *)(v0 + 496) = 0xE200000000000000;
  *(void *)(v0 + 504) = 0;
  *(void *)(v0 + 512) = 18497;
  *(void *)(v0 + 520) = 0xE200000000000000;
  *(void *)(v0 + 528) = 22337;
  *(void *)(v0 + 536) = 0xE200000000000000;
  *(void *)(v0 + 544) = 0;
  *(void *)(v0 + 552) = 18497;
  *(void *)(v0 + 560) = 0xE200000000000000;
  *(void *)(v0 + 568) = 4740929;
  *(void *)(v0 + 576) = 0xE300000000000000;
  *(void *)(v0 + 584) = 0;
  *(void *)(v0 + 592) = 18497;
  *(void *)(v0 + 600) = 0xE200000000000000;
  *(void *)(v0 + 608) = 18501;
  *(void *)(v0 + 616) = 0xE200000000000000;
  *(void *)(v0 + 624) = 0x3FE0000000000000;
  *(void *)(v0 + 632) = 18497;
  *(void *)(v0 + 640) = 0xE200000000000000;
  *(void *)(v0 + 648) = 18505;
  *(void *)(v0 + 656) = 0xE200000000000000;
  *(void *)(v0 + 664) = 0x3FE0000000000000;
  *(void *)(v0 + 672) = 18497;
  *(void *)(v0 + 680) = 0xE200000000000000;
  *(void *)(v0 + 688) = 18511;
  *(void *)(v0 + 696) = 0xE200000000000000;
  *(void *)(v0 + 704) = 0x3FE0000000000000;
  *(void *)(v0 + 712) = 18497;
  *(void *)(v0 + 720) = 0xE200000000000000;
  *(void *)(v0 + 728) = 18517;
  *(void *)(v0 + 736) = 0xE200000000000000;
  *(void *)(v0 + 744) = 0;
  *(void *)(v0 + 752) = 18497;
  *(void *)(v0 + 760) = 0xE200000000000000;
  *(void *)(v0 + 768) = 26725;
  *(void *)(v0 + 776) = 0xE200000000000000;
  *(void *)(v0 + 784) = 0x3FE0000000000000;
  *(void *)(v0 + 792) = 18497;
  *(void *)(v0 + 800) = 0xE200000000000000;
  *(void *)(v0 + 808) = 26729;
  *(void *)(v0 + 816) = 0xE200000000000000;
  *(void *)(v0 + 824) = 0x3FE0000000000000;
  *(void *)(v0 + 832) = 18497;
  *(void *)(v0 + 840) = 0xE200000000000000;
  *(void *)(v0 + 848) = 26741;
  *(void *)(v0 + 856) = 0xE200000000000000;
  *(void *)(v0 + 864) = 0;
  *(void *)(v0 + 872) = 22337;
  *(void *)(v0 + 880) = 0xE200000000000000;
  *(void *)(v0 + 888) = 4740929;
  *(void *)(v0 + 896) = 0xE300000000000000;
  *(void *)(v0 + 904) = 0;
  *(void *)(v0 + 912) = 22337;
  *(void *)(v0 + 920) = 0xE200000000000000;
  *(void *)(v0 + 928) = 18517;
  *(void *)(v0 + 936) = 0xE200000000000000;
  *(void *)(v0 + 944) = 0;
  *(void *)(v0 + 952) = 22337;
  *(void *)(v0 + 960) = 0xE200000000000000;
  *(void *)(v0 + 968) = 26741;
  *(void *)(v0 + 976) = 0xE200000000000000;
  *(void *)(v0 + 984) = 0;
  *(void *)(v0 + 992) = 4740929;
  *(void *)(v0 + 1000) = 0xE300000000000000;
  *(void *)(v0 + 1008) = 18517;
  *(void *)(v0 + 1016) = 0xE200000000000000;
  *(void *)(v0 + 1024) = 0;
  *(void *)(v0 + 1032) = 4740929;
  *(void *)(v0 + 1040) = 0xE300000000000000;
  *(void *)(v0 + 1048) = 26741;
  *(void *)(v0 + 1056) = 0xE200000000000000;
  *(void *)(v0 + 1064) = 0;
  *(void *)(v0 + 1072) = 22849;
  *(void *)(v0 + 1080) = 0xE200000000000000;
  *(void *)(v0 + 1088) = 22853;
  *(void *)(v0 + 1096) = 0xE200000000000000;
  *(void *)(v0 + 1104) = 0x3FE0000000000000;
  *(void *)(v0 + 1112) = 17733;
  *(void *)(v0 + 1120) = 0xE200000000000000;
  *(void *)(v0 + 1128) = 18501;
  *(void *)(v0 + 1136) = 0xE200000000000000;
  *(void *)(v0 + 1144) = 0x3FE0000000000000;
  *(void *)(v0 + 1152) = 17733;
  *(void *)(v0 + 1160) = 0xE200000000000000;
  *(void *)(v0 + 1168) = 18505;
  *(void *)(v0 + 1176) = 0xE200000000000000;
  *(void *)(v0 + 1184) = 0x3FE0000000000000;
  *(void *)(v0 + 1192) = 17733;
  *(void *)(v0 + 1200) = 0xE200000000000000;
  *(void *)(v0 + 1208) = 25957;
  *(void *)(v0 + 1216) = 0xE200000000000000;
  *(void *)(v0 + 1224) = 0;
  *(void *)(v0 + 1232) = 17733;
  *(void *)(v0 + 1240) = 0xE200000000000000;
  *(void *)(v0 + 1248) = 26725;
  *(void *)(v0 + 1256) = 0xE200000000000000;
  *(void *)(v0 + 1264) = 0x3FE0000000000000;
  *(void *)(v0 + 1272) = 17733;
  *(void *)(v0 + 1280) = 0xE200000000000000;
  *(void *)(v0 + 1288) = 26729;
  *(void *)(v0 + 1296) = 0xE200000000000000;
  *(void *)(v0 + 1304) = 0x3FE0000000000000;
  *(void *)(v0 + 1312) = 18501;
  *(void *)(v0 + 1320) = 0xE200000000000000;
  *(void *)(v0 + 1328) = 18505;
  *(void *)(v0 + 1336) = 0xE200000000000000;
  *(void *)(v0 + 1344) = 0x3FE0000000000000;
  *(void *)(v0 + 1352) = 18501;
  *(void *)(v0 + 1360) = 0xE200000000000000;
  *(void *)(v0 + 1368) = 25957;
  *(void *)(v0 + 1376) = 0xE200000000000000;
  *(void *)(v0 + 1384) = 0x3FE0000000000000;
  *(void *)(v0 + 1392) = 18501;
  *(void *)(v0 + 1400) = 0xE200000000000000;
  *(void *)(v0 + 1408) = 26725;
  *(void *)(v0 + 1416) = 0xE200000000000000;
  *(void *)(v0 + 1424) = 0;
  *(void *)(v0 + 1432) = 18501;
  *(void *)(v0 + 1440) = 0xE200000000000000;
  *(void *)(v0 + 1448) = 26729;
  *(void *)(v0 + 1456) = 0xE200000000000000;
  *(void *)(v0 + 1464) = 0x3FE0000000000000;
  *(void *)(v0 + 1472) = 18505;
  *(void *)(v0 + 1480) = 0xE200000000000000;
  *(void *)(v0 + 1488) = 18511;
  *(void *)(v0 + 1496) = 0xE200000000000000;
  *(void *)(v0 + 1504) = 0x3FE0000000000000;
  *(void *)(v0 + 1512) = 18505;
  *(void *)(v0 + 1520) = 0xE200000000000000;
  *(void *)(v0 + 1528) = 20303;
  *(void *)(v0 + 1536) = 0xE200000000000000;
  *(void *)(v0 + 1544) = 0x3FE0000000000000;
  *(void *)(v0 + 1552) = 18505;
  *(void *)(v0 + 1560) = 0xE200000000000000;
  *(void *)(v0 + 1568) = 4738895;
  *(void *)(v0 + 1576) = 0xE300000000000000;
  *(void *)(v0 + 1584) = 0x3FE0000000000000;
  *(void *)(v0 + 1592) = 18505;
  *(void *)(v0 + 1600) = 0xE200000000000000;
  *(void *)(v0 + 1608) = 22351;
  *(void *)(v0 + 1616) = 0xE200000000000000;
  *(void *)(v0 + 1624) = 0x3FE0000000000000;
  *(void *)(v0 + 1632) = 18505;
  *(void *)(v0 + 1640) = 0xE200000000000000;
  *(void *)(v0 + 1648) = 18517;
  *(void *)(v0 + 1656) = 0xE200000000000000;
  *(void *)(v0 + 1664) = 0;
  *(void *)(v0 + 1672) = 18505;
  *(void *)(v0 + 1680) = 0xE200000000000000;
  *(void *)(v0 + 1688) = 25957;
  *(void *)(v0 + 1696) = 0xE200000000000000;
  *(void *)(v0 + 1704) = 0x3FE0000000000000;
  *(void *)(v0 + 1712) = 18505;
  *(void *)(v0 + 1720) = 0xE200000000000000;
  *(void *)(v0 + 1728) = 26725;
  *(void *)(v0 + 1736) = 0xE200000000000000;
  *(void *)(v0 + 1744) = 0x3FE0000000000000;
  *(void *)(v0 + 1752) = 18505;
  *(void *)(v0 + 1760) = 0xE200000000000000;
  *(void *)(v0 + 1768) = 104;
  *(void *)(v0 + 1776) = 0xE100000000000000;
  *(void *)(v0 + 1784) = 0x3FE0000000000000;
  *(void *)(v0 + 1792) = 18505;
  *(void *)(v0 + 1800) = 0xE200000000000000;
  *(void *)(v0 + 1808) = 26729;
  *(void *)(v0 + 1816) = 0xE200000000000000;
  *(void *)(v0 + 1824) = 0;
  *(void *)(v0 + 1832) = 18505;
  *(void *)(v0 + 1840) = 0xE200000000000000;
  *(void *)(v0 + 1848) = 26735;
  *(void *)(v0 + 1856) = 0xE200000000000000;
  *(void *)(v0 + 1864) = 0x3FE0000000000000;
  *(void *)(v0 + 1872) = 18505;
  *(void *)(v0 + 1880) = 0xE200000000000000;
  *(void *)(v0 + 1888) = 26741;
  *(void *)(v0 + 1896) = 0xE200000000000000;
  *(void *)(v0 + 1904) = 0;
  *(void *)(v0 + 1912) = 18511;
  *(void *)(v0 + 1920) = 0xE200000000000000;
  *(void *)(v0 + 1928) = 20303;
  *(void *)(v0 + 1936) = 0xE200000000000000;
  *(void *)(v0 + 1944) = 0;
  *(void *)(v0 + 1952) = 18511;
  *(void *)(v0 + 1960) = 0xE200000000000000;
  *(void *)(v0 + 1968) = 4738895;
  *(void *)(v0 + 1976) = 0xE300000000000000;
  *(void *)(v0 + 1984) = 0;
  *(void *)(v0 + 1992) = 18511;
  *(void *)(v0 + 2000) = 0xE200000000000000;
  *(void *)(v0 + 2008) = 22351;
  *(void *)(v0 + 2016) = 0xE200000000000000;
  *(void *)(v0 + 2800) = 0xE200000000000000;
  *(void *)(v0 + 2808) = 21077;
  *(void *)(v0 + 2816) = 0xE200000000000000;
  *(void *)(v0 + 2760) = 0xE200000000000000;
  *(void *)(v0 + 2768) = 121;
  *(void *)(v0 + 2776) = 0xE100000000000000;
  *(void *)(v0 + 2784) = 0x3FE0000000000000;
  *(void *)(v0 + 2792) = 18517;
  *(void *)(v0 + 2712) = 22863;
  *(void *)(v0 + 2720) = 0xE200000000000000;
  *(void *)(v0 + 2728) = 26741;
  *(void *)(v0 + 2736) = 0xE200000000000000;
  *(void *)(v0 + 2744) = 0x3FE0000000000000;
  *(void *)(v0 + 2752) = 22863;
  *(void *)(v0 + 2664) = 0x3FE0000000000000;
  *(void *)(v0 + 2672) = 22863;
  *(void *)(v0 + 2680) = 0xE200000000000000;
  *(void *)(v0 + 2688) = 26735;
  *(void *)(v0 + 2696) = 0xE200000000000000;
  *(void *)(v0 + 2704) = 0x3FE0000000000000;
  *(void *)(v0 + 2616) = 0xE200000000000000;
  *(void *)(v0 + 2624) = 0x3FE0000000000000;
  *(void *)(v0 + 2632) = 22351;
  *(void *)(v0 + 2640) = 0xE200000000000000;
  *(void *)(v0 + 2648) = 18517;
  *(void *)(v0 + 2656) = 0xE200000000000000;
  *(void *)(v0 + 2568) = 26735;
  *(void *)(v0 + 2576) = 0xE200000000000000;
  *(void *)(v0 + 2584) = 0x3FE0000000000000;
  *(void *)(v0 + 2592) = 22351;
  *(void *)(v0 + 2600) = 0xE200000000000000;
  *(void *)(v0 + 2608) = 26741;
  *(void *)(v0 + 2520) = 0xE300000000000000;
  *(void *)(v0 + 2528) = 26741;
  *(void *)(v0 + 2536) = 0xE200000000000000;
  *(void *)(v0 + 2544) = 0x3FE0000000000000;
  *(void *)(v0 + 2552) = 22351;
  *(void *)(v0 + 2560) = 0xE200000000000000;
  *(void *)(v0 + 2472) = 4738895;
  *(void *)(v0 + 2480) = 0xE300000000000000;
  *(void *)(v0 + 2488) = 26735;
  *(void *)(v0 + 2496) = 0xE200000000000000;
  *(void *)(v0 + 2504) = 0x3FE0000000000000;
  *(void *)(v0 + 2512) = 4738895;
  *(void *)(v0 + 2424) = 0;
  *(void *)(v0 + 2432) = 4738895;
  *(void *)(v0 + 2440) = 0xE300000000000000;
  *(void *)(v0 + 2448) = 18517;
  *(void *)(v0 + 2456) = 0xE200000000000000;
  *(void *)(v0 + 2464) = 0x3FE0000000000000;
  *(void *)(v0 + 2376) = 0xE200000000000000;
  *(void *)(v0 + 2384) = 0x3FE0000000000000;
  *(void *)(v0 + 2392) = 4738895;
  *(void *)(v0 + 2400) = 0xE300000000000000;
  *(void *)(v0 + 2408) = 22351;
  *(void *)(v0 + 2416) = 0xE200000000000000;
  *(void *)(v0 + 2328) = 26735;
  *(void *)(v0 + 2336) = 0xE200000000000000;
  *(void *)(v0 + 2344) = 0x3FE0000000000000;
  *(void *)(v0 + 2352) = 20303;
  *(void *)(v0 + 2360) = 0xE200000000000000;
  *(void *)(v0 + 2368) = 26741;
  *(void *)(v0 + 2280) = 0xE200000000000000;
  *(void *)(v0 + 2288) = 18517;
  *(void *)(v0 + 2296) = 0xE200000000000000;
  *(void *)(v0 + 2304) = 0x3FE0000000000000;
  *(void *)(v0 + 2312) = 20303;
  *(void *)(v0 + 2320) = 0xE200000000000000;
  *(void *)(v0 + 2232) = 20303;
  *(void *)(v0 + 2240) = 0xE200000000000000;
  *(void *)(v0 + 2248) = 22351;
  *(void *)(v0 + 2256) = 0xE200000000000000;
  *(void *)(v0 + 2264) = 0;
  *(void *)(v0 + 2272) = 20303;
  *(void *)(v0 + 2184) = 0x3FE0000000000000;
  *(void *)(v0 + 2192) = 20303;
  *(void *)(v0 + 2200) = 0xE200000000000000;
  *(void *)(v0 + 2208) = 4738895;
  *(void *)(v0 + 2216) = 0xE300000000000000;
  *(void *)(v0 + 2224) = 0;
  *(void *)(v0 + 2136) = 0xE200000000000000;
  *(void *)(v0 + 2144) = 0;
  *(void *)(v0 + 2152) = 18511;
  *(void *)(v0 + 2160) = 0xE200000000000000;
  *(void *)(v0 + 2168) = 26741;
  *(void *)(v0 + 2176) = 0xE200000000000000;
  *(void *)(v0 + 2088) = 26729;
  *(void *)(v0 + 2096) = 0xE200000000000000;
  *(void *)(v0 + 2104) = 0x3FE0000000000000;
  *(void *)(v0 + 2112) = 18511;
  *(void *)(v0 + 2120) = 0xE200000000000000;
  *(void *)(v0 + 2128) = 26735;
  *(void *)(v0 + 2040) = 0xE200000000000000;
  *(void *)(v0 + 2048) = 18517;
  *(void *)(v0 + 2056) = 0xE200000000000000;
  *(void *)(v0 + 2064) = 0x3FE0000000000000;
  *(void *)(v0 + 2072) = 18511;
  *(void *)(v0 + 2080) = 0xE200000000000000;
  *(void *)(v0 + 2024) = 0;
  *(void *)(v0 + 2032) = 18511;
  *(void *)(v0 + 2824) = 0x3FE0000000000000;
  *(void *)(v0 + 2832) = 18517;
  *(void *)(v0 + 2840) = 0xE200000000000000;
  *(void *)(v0 + 2848) = 26729;
  *(void *)(v0 + 2856) = 0xE200000000000000;
  *(void *)(v0 + 2864) = 0;
  *(void *)(v0 + 2872) = 18517;
  *(void *)(v0 + 2880) = 0xE200000000000000;
  *(void *)(v0 + 2888) = 26735;
  *(void *)(v0 + 2896) = 0xE200000000000000;
  *(void *)(v0 + 2904) = 0x3FE0000000000000;
  *(void *)(v0 + 2912) = 18517;
  *(void *)(v0 + 2920) = 0xE200000000000000;
  *(void *)(v0 + 2928) = 26741;
  *(void *)(v0 + 2936) = 0xE200000000000000;
  *(void *)(v0 + 2944) = 0;
  *(void *)(v0 + 2952) = 18517;
  *(void *)(v0 + 2960) = 0xE200000000000000;
  *(void *)(v0 + 2968) = 27765;
  *(void *)(v0 + 2976) = 0xE200000000000000;
  *(void *)(v0 + 2984) = 0x3FE0000000000000;
  *(void *)(v0 + 2992) = 18517;
  *(void *)(v0 + 3000) = 0xE200000000000000;
  *(void *)(v0 + 3008) = 28021;
  *(void *)(v0 + 3016) = 0xE200000000000000;
  *(void *)(v0 + 3024) = 0x3FE0000000000000;
  *(void *)(v0 + 3032) = 18517;
  *(void *)(v0 + 3040) = 0xE200000000000000;
  *(void *)(v0 + 3048) = 28277;
  *(void *)(v0 + 3056) = 0xE200000000000000;
  *(void *)(v0 + 3064) = 0x3FE0000000000000;
  *(void *)(v0 + 3072) = 18517;
  *(void *)(v0 + 3080) = 0xE200000000000000;
  *(void *)(v0 + 3088) = 29301;
  *(void *)(v0 + 3096) = 0xE200000000000000;
  *(void *)(v0 + 3104) = 0x3FE0000000000000;
  *(void *)(v0 + 3112) = 21077;
  *(void *)(v0 + 3120) = 0xE200000000000000;
  *(void *)(v0 + 3128) = 114;
  *(void *)(v0 + 3136) = 0xE100000000000000;
  *(void *)(v0 + 3144) = 0x3FE0000000000000;
  *(void *)(v0 + 3152) = 21077;
  *(void *)(v0 + 3160) = 0xE200000000000000;
  *(void *)(v0 + 3168) = 26741;
  *(void *)(v0 + 3176) = 0xE200000000000000;
  *(void *)(v0 + 3184) = 0x3FE0000000000000;
  *(void *)(v0 + 3192) = 21077;
  *(void *)(v0 + 3200) = 0xE200000000000000;
  *(void *)(v0 + 3208) = 27765;
  *(void *)(v0 + 3216) = 0xE200000000000000;
  *(void *)(v0 + 3224) = 0x3FE0000000000000;
  *(void *)(v0 + 3232) = 21077;
  *(void *)(v0 + 3240) = 0xE200000000000000;
  *(void *)(v0 + 3248) = 28021;
  *(void *)(v0 + 3256) = 0xE200000000000000;
  *(void *)(v0 + 3264) = 0x3FE0000000000000;
  *(void *)(v0 + 3272) = 21077;
  *(void *)(v0 + 3280) = 0xE200000000000000;
  *(void *)(v0 + 3288) = 28277;
  *(void *)(v0 + 3296) = 0xE200000000000000;
  *(void *)(v0 + 3304) = 0x3FE0000000000000;
  *(void *)(v0 + 3312) = 21077;
  *(void *)(v0 + 3320) = 0xE200000000000000;
  *(void *)(v0 + 3328) = 29301;
  *(void *)(v0 + 3336) = 0xE200000000000000;
  *(void *)(v0 + 3344) = 0;
  *(void *)(v0 + 3352) = 26723;
  *(void *)(v0 + 3360) = 0xE200000000000000;
  *(void *)(v0 + 3368) = 107;
  *(void *)(v0 + 3376) = 0xE100000000000000;
  *(void *)(v0 + 3384) = 0x4000000000000000;
  *(void *)(v0 + 3392) = 26723;
  *(void *)(v0 + 3400) = 0xE200000000000000;
  *(void *)(v0 + 3408) = 26739;
  *(void *)(v0 + 3416) = 0xE200000000000000;
  *(void *)(v0 + 3424) = 0x4000000000000000;
  *(void *)(v0 + 3432) = 26723;
  *(void *)(v0 + 3440) = 0xE200000000000000;
  *(void *)(v0 + 3448) = 26746;
  *(void *)(v0 + 3456) = 0xE200000000000000;
  *(void *)(v0 + 3464) = 0x4000000000000000;
  *(void *)(v0 + 3472) = 100;
  *(void *)(v0 + 3480) = 0xE100000000000000;
  *(void *)(v0 + 3488) = 26724;
  *(void *)(v0 + 3496) = 0xE200000000000000;
  *(void *)(v0 + 3504) = 0x3FE0000000000000;
  *(void *)(v0 + 3512) = 100;
  *(void *)(v0 + 3520) = 0xE100000000000000;
  *(void *)(v0 + 3528) = 116;
  *(void *)(v0 + 3536) = 0xE100000000000000;
  *(void *)(v0 + 3544) = 0x4000000000000000;
  *(void *)(v0 + 3552) = 100;
  *(void *)(v0 + 3560) = 0xE100000000000000;
  *(void *)(v0 + 3568) = 26740;
  *(void *)(v0 + 3576) = 0xE200000000000000;
  *(void *)(v0 + 3584) = 0x4000000000000000;
  *(void *)(v0 + 3592) = 26724;
  *(void *)(v0 + 3600) = 0xE200000000000000;
  *(void *)(v0 + 3608) = 116;
  *(void *)(v0 + 3616) = 0xE100000000000000;
  *(void *)(v0 + 3624) = 0x4000000000000000;
  *(void *)(v0 + 3632) = 26724;
  *(void *)(v0 + 3640) = 0xE200000000000000;
  *(void *)(v0 + 3648) = 26740;
  *(void *)(v0 + 3656) = 0xE200000000000000;
  *(void *)(v0 + 3664) = 0x4000000000000000;
  *(void *)(v0 + 3672) = 25957;
  *(void *)(v0 + 3680) = 0xE200000000000000;
  *(void *)(v0 + 3688) = 26725;
  *(void *)(v0 + 3696) = 0xE200000000000000;
  *(void *)(v0 + 3704) = 0x3FE0000000000000;
  *(void *)(v0 + 3712) = 25957;
  *(void *)(v0 + 3720) = 0xE200000000000000;
  *(void *)(v0 + 3728) = 26729;
  *(void *)(v0 + 3736) = 0xE200000000000000;
  *(void *)(v0 + 3744) = 0x3FE0000000000000;
  *(void *)(v0 + 3752) = 25957;
  *(void *)(v0 + 3760) = 0xE200000000000000;
  *(void *)(v0 + 3768) = 26741;
  *(void *)(v0 + 3776) = 0xE200000000000000;
  *(void *)(v0 + 3784) = 0x3FE0000000000000;
  *(void *)(v0 + 3792) = 26725;
  *(void *)(v0 + 3800) = 0xE200000000000000;
  *(void *)(v0 + 3808) = 26729;
  *(void *)(v0 + 3816) = 0xE200000000000000;
  *(void *)(v0 + 3824) = 0x3FE0000000000000;
  *(void *)(v0 + 3832) = 26725;
  *(void *)(v0 + 3840) = 0xE200000000000000;
  *(void *)(v0 + 3848) = 26741;
  *(void *)(v0 + 3856) = 0xE200000000000000;
  *(void *)(v0 + 3864) = 0x3FE0000000000000;
  *(void *)(v0 + 3872) = 103;
  *(void *)(v0 + 3880) = 0xE100000000000000;
  *(void *)(v0 + 3888) = 106;
  *(void *)(v0 + 3896) = 0xE100000000000000;
  *(void *)(v0 + 3904) = 0x4000000000000000;
  *(void *)(v0 + 3912) = 103;
  *(void *)(v0 + 3920) = 0xE100000000000000;
  *(void *)(v0 + 3928) = 26478;
  *(void *)(v0 + 3936) = 0xE200000000000000;
  *(void *)(v0 + 3944) = 0x3FE0000000000000;
  *(void *)(v0 + 3952) = 104;
  *(void *)(v0 + 3960) = 0xE100000000000000;
  *(void *)(v0 + 3968) = 26729;
  *(void *)(v0 + 3976) = 0xE200000000000000;
  *(void *)(v0 + 3984) = 0x3FE0000000000000;
  *(void *)(v0 + 3992) = 104;
  *(void *)(v0 + 4000) = 0xE100000000000000;
  *(void *)(v0 + 4008) = 106;
  *(void *)(v0 + 4016) = 0xE100000000000000;
  *(void *)(v0 + 4024) = 0x4000000000000000;
  *(void *)(v0 + 4032) = 26729;
  *(void *)(v0 + 4040) = 0xE200000000000000;
  *(void *)(v0 + 4048) = 26735;
  *(void *)(v0 + 4056) = 0xE200000000000000;
  *(void *)(v0 + 4064) = 0x3FE0000000000000;
  *(void *)(v0 + 4072) = 26729;
  *(void *)(v0 + 4080) = 0xE200000000000000;
  *(void *)(v0 + 4088) = 26741;
  *(void *)(v0 + 4096) = 0xE200000000000000;
  *(void *)(v0 + 4104) = 0;
  *(void *)(v0 + 4112) = 106;
  *(void *)(v0 + 4120) = 0xE100000000000000;
  *(void *)(v0 + 4128) = 26746;
  *(void *)(v0 + 4136) = 0xE200000000000000;
  *(void *)(v0 + 4144) = 0x4000000000000000;
  *(void *)(v0 + 4152) = 108;
  *(void *)(v0 + 4160) = 0xE100000000000000;
  *(void *)(v0 + 4168) = 27765;
  *(void *)(v0 + 4176) = 0xE200000000000000;
  *(void *)(v0 + 4184) = 0;
  *(void *)(v0 + 4192) = 109;
  *(void *)(v0 + 4200) = 0xE100000000000000;
  *(void *)(v0 + 4208) = 28021;
  *(void *)(v0 + 4216) = 0xE200000000000000;
  *(void *)(v0 + 4224) = 0;
  *(void *)(v0 + 4232) = 110;
  *(void *)(v0 + 4240) = 0xE100000000000000;
  *(void *)(v0 + 4248) = 28277;
  *(void *)(v0 + 4256) = 0xE200000000000000;
  *(void *)(v0 + 4264) = 0;
  *(void *)(v0 + 4272) = 26735;
  *(void *)(v0 + 4280) = 0xE200000000000000;
  *(void *)(v0 + 4288) = 26741;
  *(void *)(v0 + 4296) = 0xE200000000000000;
  *(void *)(v0 + 4304) = 0x3FE0000000000000;
  *(void *)(v0 + 4312) = 114;
  *(void *)(v0 + 4320) = 0xE100000000000000;
  *(void *)(v0 + 4328) = 29301;
  *(void *)(v0 + 4336) = 0xE200000000000000;
  *(void *)(v0 + 4344) = 0;
  *(void *)(v0 + 4352) = 115;
  *(void *)(v0 + 4360) = 0xE100000000000000;
  *(void *)(v0 + 4368) = 122;
  *(void *)(v0 + 4376) = 0xE100000000000000;
  *(void *)(v0 + 4384) = 0x4000000000000000;
  *(void *)(v0 + 4392) = 26739;
  *(void *)(v0 + 4400) = 0xE200000000000000;
  *(void *)(v0 + 4408) = 26746;
  *(void *)(v0 + 4416) = 0xE200000000000000;
  *(void *)(v0 + 4424) = 0x4000000000000000;
  *(void *)(v0 + 4432) = 116;
  *(void *)(v0 + 4440) = 0xE100000000000000;
  *(void *)(v0 + 4448) = 26740;
  *(void *)(v0 + 4456) = 0xE200000000000000;
  *(void *)(v0 + 4464) = 0x3FE0000000000000;
  *(void *)(v0 + 4472) = 26741;
  *(void *)(v0 + 4480) = 0xE200000000000000;
  *(void *)(v0 + 4488) = 27765;
  *(void *)(v0 + 4496) = 0xE200000000000000;
  *(void *)(v0 + 4504) = 0x3FE0000000000000;
  *(void *)(v0 + 4512) = 26741;
  *(void *)(v0 + 4520) = 0xE200000000000000;
  *(void *)(v0 + 4528) = 28021;
  *(void *)(v0 + 4536) = 0xE200000000000000;
  *(void *)(v0 + 4544) = 0x3FE0000000000000;
  *(void *)(v0 + 4552) = 26741;
  *(void *)(v0 + 4560) = 0xE200000000000000;
  *(void *)(v0 + 4568) = 28277;
  *(void *)(v0 + 4576) = 0xE200000000000000;
  *(void *)(v0 + 4584) = 0x3FE0000000000000;
  *(void *)(v0 + 4592) = 26741;
  *(void *)(v0 + 4600) = 0xE200000000000000;
  *(void *)(v0 + 4608) = 29301;
  *(void *)(v0 + 4616) = 0xE200000000000000;
  *(void *)(v0 + 4624) = 0x3FE0000000000000;
  *(void *)(v0 + 4632) = 27765;
  *(void *)(v0 + 4640) = 0xE200000000000000;
  *(void *)(v0 + 4648) = 28021;
  *(void *)(v0 + 4656) = 0xE200000000000000;
  *(void *)(v0 + 4664) = 0x3FE0000000000000;
  *(void *)(v0 + 4672) = 27765;
  *(void *)(v0 + 4680) = 0xE200000000000000;
  *(void *)(v0 + 4688) = 28277;
  *(void *)(v0 + 4696) = 0xE200000000000000;
  *(void *)(v0 + 4704) = 0x3FE0000000000000;
  *(void *)(v0 + 4712) = 27765;
  *(void *)(v0 + 4720) = 0xE200000000000000;
  *(void *)(v0 + 4728) = 29301;
  *(void *)(v0 + 4736) = 0xE200000000000000;
  *(void *)(v0 + 4744) = 0x3FE0000000000000;
  *(void *)(v0 + 4752) = 28021;
  *(void *)(v0 + 4760) = 0xE200000000000000;
  *(void *)(v0 + 4768) = 28277;
  *(void *)(v0 + 4776) = 0xE200000000000000;
  *(void *)(v0 + 4784) = 0x3FE0000000000000;
  *(void *)(v0 + 4792) = 28277;
  *(void *)(v0 + 4800) = 0xE200000000000000;
  *(void *)(v0 + 4808) = 29301;
  *(void *)(v0 + 4816) = 0xE200000000000000;
  *(void *)(v0 + 4824) = 0x3FE0000000000000;
  *(void *)(v0 + 4832) = 122;
  *(void *)(v0 + 4840) = 0xE100000000000000;
  *(void *)(v0 + 4848) = 26746;
  *(void *)(v0 + 4856) = 0xE200000000000000;
  *(void *)(v0 + 4864) = 0x4000000000000000;
  qword_57C98 = v0;
  return result;
}

uint64_t sub_1BF50()
{
  if (qword_52750 != -1) {
LABEL_24:
  }
    swift_once();
  uint64_t v0 = qword_57C98;
  uint64_t v1 = *(void *)(qword_57C98 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = (uint64_t *)(v0 + 64);
    while (1)
    {
      uint64_t v4 = *(v2 - 4);
      uint64_t v3 = *(v2 - 3);
      uint64_t v6 = *(v2 - 2);
      uint64_t v5 = *(v2 - 1);
      uint64_t v7 = *v2;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v10 = sub_34B48(v4, v3, v6, v5);
      uint64_t v11 = _swiftEmptyDictionarySingleton[2];
      BOOL v12 = (v9 & 1) == 0;
      uint64_t v13 = v11 + v12;
      if (__OFADD__(v11, v12))
      {
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      char v14 = v9;
      if (_swiftEmptyDictionarySingleton[3] >= v13)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v9) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_1D78C();
          if (v14) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        sub_1CD90(v13, isUniquelyReferenced_nonNull_native);
        unint64_t v15 = sub_34B48(v4, v3, v6, v5);
        if ((v14 & 1) != (v16 & 1))
        {
          uint64_t result = sub_3F5C8();
          __break(1u);
          return result;
        }
        unint64_t v10 = v15;
        if (v14)
        {
LABEL_4:
          *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v10) = v7;
          goto LABEL_5;
        }
      }
      _swiftEmptyDictionarySingleton[(v10 >> 6) + 8] |= 1 << v10;
      uint64_t v17 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 32 * v10);
      *uint64_t v17 = v4;
      v17[1] = v3;
      v17[2] = v6;
      v17[3] = v5;
      *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v10) = v7;
      uint64_t v18 = _swiftEmptyDictionarySingleton[2];
      BOOL v19 = __OFADD__(v18, 1);
      uint64_t v20 = v18 + 1;
      if (v19) {
        goto LABEL_23;
      }
      _swiftEmptyDictionarySingleton[2] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_5:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v2 += 5;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
  }
  swift_bridgeObjectRetain();
LABEL_19:
  qword_57CA0 = (uint64_t)_swiftEmptyDictionarySingleton;

  return swift_bridgeObjectRelease();
}

unint64_t sub_1C1B0()
{
  sub_62C4(&qword_53540);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_41410;
  *(void *)(inited + 32) = 1914726517;
  *(void *)(inited + 40) = 0xE400000000000000;
  sub_62C4((uint64_t *)&unk_536F0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_40AF0;
  *(void *)(v1 + 32) = 1914720853;
  *(void *)(v1 + 40) = 0xE400000000000000;
  *(void *)(v1 + 48) = 29301;
  *(void *)(v1 + 56) = 0xE200000000000000;
  *(void *)(v1 + 64) = 21077;
  *(void *)(v1 + 72) = 0xE200000000000000;
  *(void *)(inited + 48) = v1;
  *(void *)(inited + 56) = 1814063221;
  *(void *)(inited + 64) = 0xE400000000000000;
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_40160;
  *(void *)(v2 + 32) = 27765;
  *(void *)(v2 + 40) = 0xE200000000000000;
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 80) = 1814054997;
  *(void *)(inited + 88) = 0xE400000000000000;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_40160;
  *(void *)(v3 + 32) = 27765;
  *(void *)(v3 + 40) = 0xE200000000000000;
  *(void *)(inited + 96) = v3;
  *(void *)(inited + 104) = 1847617653;
  *(void *)(inited + 112) = 0xE400000000000000;
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_40160;
  *(void *)(v4 + 32) = 28277;
  *(void *)(v4 + 40) = 0xE200000000000000;
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 128) = 1847609409;
  *(void *)(inited + 136) = 0xE400000000000000;
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_40160;
  *(void *)(v5 + 32) = 28277;
  *(void *)(v5 + 40) = 0xE200000000000000;
  *(void *)(inited + 144) = v5;
  *(void *)(inited + 152) = 1830830401;
  *(void *)(inited + 160) = 0xE400000000000000;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_40160;
  *(void *)(v6 + 32) = 28021;
  *(void *)(v6 + 40) = 0xE200000000000000;
  *(void *)(inited + 168) = v6;
  *(void *)(inited + 176) = 1746949953;
  *(void *)(inited + 184) = 0xE400000000000000;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_40160;
  *(void *)(v7 + 32) = 4740929;
  *(void *)(v7 + 40) = 0xE300000000000000;
  *(void *)(inited + 192) = v7;
  *(void *)(inited + 200) = 1212751976;
  *(void *)(inited + 208) = 0xE400000000000000;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_40160;
  *(void *)(v8 + 32) = 1162158184;
  *(void *)(v8 + 40) = 0xE400000000000000;
  *(void *)(inited + 216) = v8;
  *(void *)(inited + 224) = 1830840437;
  *(void *)(inited + 232) = 0xE400000000000000;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_40160;
  *(void *)(v9 + 32) = 28021;
  *(void *)(v9 + 40) = 0xE200000000000000;
  *(void *)(inited + 240) = v9;
  *(void *)(inited + 248) = 2032167029;
  *(void *)(inited + 256) = 0xE400000000000000;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_40160;
  *(void *)(v10 + 32) = 22863;
  *(void *)(v10 + 40) = 0xE200000000000000;
  *(void *)(inited + 264) = v10;
  *(void *)(inited + 272) = 1847617641;
  *(void *)(inited + 280) = 0xE400000000000000;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_40160;
  *(void *)(v11 + 32) = 28277;
  *(void *)(v11 + 40) = 0xE200000000000000;
  *(void *)(inited + 288) = v11;
  *(void *)(inited + 296) = 1814054981;
  *(void *)(inited + 304) = 0xE400000000000000;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_40160;
  *(void *)(v12 + 32) = 27765;
  *(void *)(v12 + 40) = 0xE200000000000000;
  *(void *)(inited + 312) = v12;
  *(void *)(inited + 320) = 1847611215;
  *(void *)(inited + 328) = 0xE400000000000000;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_40160;
  *(void *)(v13 + 32) = 28277;
  *(void *)(v13 + 40) = 0xE200000000000000;
  *(void *)(inited + 336) = v13;
  *(void *)(inited + 344) = 1914718273;
  *(void *)(inited + 352) = 0xE400000000000000;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_40160;
  *(void *)(v14 + 32) = 29301;
  *(void *)(v14 + 40) = 0xE200000000000000;
  *(void *)(inited + 360) = v14;
  *(void *)(inited + 368) = 1914718293;
  *(void *)(inited + 376) = 0xE400000000000000;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_40160;
  *(void *)(v15 + 32) = 21077;
  *(void *)(v15 + 40) = 0xE200000000000000;
  *(void *)(inited + 384) = v15;
  *(void *)(inited + 392) = 1162158184;
  *(void *)(inited + 400) = 0xE400000000000000;
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_40160;
  *(void *)(v16 + 32) = 26729;
  *(void *)(v16 + 40) = 0xE200000000000000;
  *(void *)(inited + 408) = v16;
  *(void *)(inited + 416) = 1847613249;
  *(void *)(inited + 424) = 0xE400000000000000;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_40160;
  *(void *)(v17 + 32) = 28277;
  *(void *)(v17 + 40) = 0xE200000000000000;
  *(void *)(inited + 432) = v17;
  unint64_t result = sub_1F2D8(inited);
  qword_57CA8 = result;
  return result;
}

unint64_t sub_1C574()
{
  sub_62C4(&qword_53548);
  sub_62C4(&qword_53550);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_41420;
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  sub_3EA28();
  unint64_t result = sub_1F508(v0);
  qword_57CB0 = result;
  return result;
}

unint64_t sub_1C85C()
{
  sub_62C4(&qword_53568);
  uint64_t v0 = (int *)(sub_62C4(&qword_53570) - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v3 = 8 * v1;
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_41420;
  unint64_t v5 = v4 + v2;
  uint64_t v6 = (void *)(v5 + v0[14]);
  sub_3EA28();
  *uint64_t v6 = 0xD000000000000013;
  v6[1] = 0x8000000000043690;
  uint64_t v7 = (void *)(v5 + v1 + v0[14]);
  sub_3EA28();
  *uint64_t v7 = 0xD000000000000013;
  v7[1] = 0x80000000000436B0;
  uint64_t v8 = (void *)(v5 + 2 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v8 = 0xD000000000000013;
  v8[1] = 0x80000000000436D0;
  uint64_t v9 = (void *)(v5 + 3 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v9 = 0xD000000000000013;
  v9[1] = 0x8000000000043690;
  uint64_t v10 = (void *)(v5 + 4 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v10 = 0xD000000000000013;
  v10[1] = 0x80000000000436F0;
  uint64_t v11 = (void *)(v5 + 5 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v11 = 0xD000000000000013;
  v11[1] = 0x8000000000043710;
  uint64_t v12 = (void *)(v5 + 6 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v12 = 0xD000000000000013;
  v12[1] = 0x8000000000043710;
  uint64_t v13 = (void *)(v5 + 7 * v1 + v0[14]);
  sub_3EA28();
  *uint64_t v13 = 0xD000000000000013;
  v13[1] = 0x8000000000043730;
  uint64_t v14 = (void *)(v5 + v3 + v0[14]);
  sub_3EA28();
  *uint64_t v14 = 0xD000000000000013;
  v14[1] = 0x8000000000043750;
  unint64_t result = sub_1F720(v4);
  qword_57CB8 = result;
  return result;
}

uint64_t sub_1CB14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  char v3 = *(unsigned char *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  int v6 = *(unsigned __int8 *)(a1 + 72);
  char v7 = *(unsigned char *)(a2 + 48);
  uint64_t v8 = *(void **)(a2 + 56);
  uint64_t v24 = *(void *)(a2 + 64);
  int v23 = *(unsigned __int8 *)(a2 + 72);
  if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)
    || (char v9 = sub_3F5A8(), result = 0, (v9 & 1) != 0))
  {
    uint64_t v22 = v5;
    int v21 = v6;
    for (uint64_t i = 0; ; i += 48)
    {
      --v2;
      swift_bridgeObjectRetain();
      id v12 = v4;
      swift_bridgeObjectRetain();
      if (*(void *)&aFirst_1[8 * v3] == *(void *)&aFirst_1[8 * v7] && qword_41A88[v3] == qword_41A88[v7])
      {
        id v16 = v8;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v14 = sub_3F5A8();
        id v15 = v8;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      sub_BA34(0, &qword_52D80);
      char v17 = sub_3F068();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = 0;
      if (v17 & 1) == 0 || v22 != v24 || ((v23 ^ v21)) {
        return result;
      }
      if (!v2) {
        return 1;
      }
      char v3 = *(unsigned char *)(a1 + i + 96);
      uint64_t v4 = *(void **)(a1 + i + 104);
      uint64_t v22 = *(void *)(a1 + i + 112);
      int v18 = *(unsigned __int8 *)(a1 + i + 120);
      char v7 = *(unsigned char *)(a2 + i + 96);
      uint64_t v8 = *(void **)(a2 + i + 104);
      uint64_t v24 = *(void *)(a2 + i + 112);
      int v23 = *(unsigned __int8 *)(a2 + i + 120);
      if ((*(void *)(a1 + i + 80) != *(void *)(a2 + i + 80) || *(void *)(a1 + i + 88) != *(void *)(a2 + i + 88))
        && (sub_3F5A8() & 1) == 0)
      {
        return 0;
      }
      int v21 = v18;
    }
  }
  return result;
}

uint64_t sub_1CD90(uint64_t a1, char a2)
{
  uint64_t v4 = *v2;
  sub_62C4(&qword_53530);
  char v39 = a2;
  uint64_t v5 = sub_3F3A8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    unint64_t v37 = (void *)(v4 + 64);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v4 + 64);
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 64;
    swift_retain();
    int64_t v11 = 0;
    uint64_t v38 = v4;
    while (1)
    {
      if (v9)
      {
        uint64_t v40 = (v9 - 1) & v9;
        unint64_t v14 = __clz(__rbit64(v9)) | (v11 << 6);
      }
      else
      {
        if (__OFADD__(v11++, 1)) {
          goto LABEL_38;
        }
        if (v11 >= v36)
        {
LABEL_31:
          swift_release();
          if (v39)
          {
            uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
            if (v34 >= 64) {
              bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *unint64_t v37 = -1 << v34;
            }
            *(void *)(v4 + 16) = 0;
          }
          break;
        }
        unint64_t v16 = v37[v11];
        if (!v16)
        {
          int64_t v17 = v11 + 1;
          if (v11 + 1 >= v36) {
            goto LABEL_31;
          }
          unint64_t v16 = v37[v17];
          if (!v16)
          {
            while (1)
            {
              int64_t v11 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                break;
              }
              if (v11 >= v36) {
                goto LABEL_31;
              }
              unint64_t v16 = v37[v11];
              ++v17;
              if (v16) {
                goto LABEL_19;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            uint64_t result = swift_release();
            __break(1u);
            return result;
          }
          ++v11;
        }
LABEL_19:
        uint64_t v40 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      uint64_t v18 = *(void *)(v4 + 56);
      BOOL v19 = (uint64_t *)(*(void *)(v4 + 48) + 32 * v14);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = v19[2];
      uint64_t v23 = v19[3];
      uint64_t v24 = *(void *)(v18 + 8 * v14);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_3F628();
      sub_62C4((uint64_t *)&unk_536F0);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_40A20;
      *(void *)(v25 + 32) = v21;
      *(void *)(v25 + 40) = v20;
      *(void *)(v25 + 48) = v22;
      *(void *)(v25 + 56) = v23;
      uint64_t v41 = v25;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_355E0(&v41);
      swift_bridgeObjectRelease();
      sub_62C4(&qword_53308);
      sub_1E1A0();
      sub_3ECE8();
      swift_release();
      sub_3EDE8();
      swift_bridgeObjectRelease();
      Swift::Int v26 = sub_3F658();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = v26 & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v10 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v28) & ~*(void *)(v10 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v10 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v12 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v10 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v6 + 48) + 32 * v12);
      *uint64_t v13 = v21;
      v13[1] = v20;
      v13[2] = v22;
      v13[3] = v23;
      *(void *)(*(void *)(v6 + 56) + 8 * v12) = v24;
      ++*(void *)(v6 + 16);
      uint64_t v4 = v38;
      unint64_t v9 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v2 = v6;
  return result;
}

uint64_t sub_1D168(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_62C4(&qword_53558);
  char v6 = a2;
  uint64_t v7 = sub_3F3A8();
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  BOOL v32 = v2;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v33) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          char v3 = v32;
          if ((v6 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v33) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v34 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_30:
    unint64_t v11 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_3F628();
    sub_3EDE8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_3F658();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v17 == v26;
        if (v17 == v26) {
          unint64_t v17 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(unsigned char *)(*(void *)(v8 + 48) + v18) = v29;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v30;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  char v3 = v32;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v6 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v8;
  return result;
}

uint64_t sub_1D484(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  sub_62C4(&qword_53560);
  uint64_t v6 = sub_3F3A8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  char v32 = a2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v33 = v2;
  uint64_t v34 = v5 + 64;
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
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      return result;
    }
    if (v18 >= v11) {
      break;
    }
    unint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_31;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_31:
          swift_release();
          char v3 = v33;
          if ((v32 & 1) == 0) {
            goto LABEL_38;
          }
          goto LABEL_34;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_40;
            }
            if (v14 >= v11) {
              goto LABEL_31;
            }
            unint64_t v20 = *(void *)(v34 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    char v22 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
    sub_3F628();
    sub_3EDE8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_3F658();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v26);
      }
      while (v30 == -1);
      unint64_t v15 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(unsigned char *)(*(void *)(v7 + 48) + v15) = v22;
    *(void *)(*(void *)(v7 + 56) + 8 * v15) = v23;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v33;
  unint64_t v19 = (void *)(v5 + 64);
  if ((v32 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 >= 64) {
    bzero(v19, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v19 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

void *sub_1D78C()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53530);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F398();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    if (!v25) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 32 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1D934()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53558);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F398();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1DAD8()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53560);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F398();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DC68(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a1 == a4 && a2 == a5 || (char v8 = 0, (sub_3F5A8() & 1) != 0))
  {
    if (*(void *)&aFirst_1[8 * a3] == *(void *)&aFirst_1[8 * a6] && qword_41A88[a3] == qword_41A88[a6]) {
      char v8 = 1;
    }
    else {
      char v8 = sub_3F5A8();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

uint64_t sub_1DD20(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  if ((sub_1CB14(a1, a5) & 1) == 0) {
    return 0;
  }
  if (a2)
  {
    if (!a6) {
      return 0;
    }
    sub_BA34(0, (unint64_t *)&qword_535B0);
    id v14 = a6;
    id v15 = a2;
    char v16 = sub_3F068();

    if ((v16 & 1) == 0) {
      return 0;
    }
  }
  else if (a6)
  {
    return 0;
  }
  if (a3)
  {
    if (!a7) {
      return 0;
    }
    sub_BA34(0, (unint64_t *)&qword_535B0);
    id v17 = a7;
    id v18 = a3;
    char v19 = sub_3F068();

    if ((v19 & 1) == 0) {
      return 0;
    }
  }
  else if (a7)
  {
    return 0;
  }
  if (a4)
  {
    if (a8)
    {
      sub_BA34(0, (unint64_t *)&qword_535B0);
      id v20 = a8;
      id v21 = a4;
      char v22 = sub_3F068();

      if (v22) {
        return 1;
      }
    }
  }
  else if (!a8)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_1DE80(uint64_t a1, uint64_t a2)
{
  if ((sub_1DD20(*(void *)a1, *(void **)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(void *)a2, *(void **)(a2 + 8), *(void **)(a2 + 16), *(void **)(a2 + 24)) & 1) == 0)return 0; {
  uint64_t v4 = *(void *)(a1 + 40);
  }
  uint64_t v5 = *(void *)(a2 + 40);
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v8 = *(void *)(a2 + 32);
      int v9 = *(unsigned __int8 *)(a2 + 48);
      if (v6 == v8 && v4 == v5)
      {
        if ((v7 & 1) != (v9 & 1)) {
          return 0;
        }
      }
      else if (sub_3F5A8() & 1) == 0 || ((v7 ^ v9))
      {
        return 0;
      }
      return 1;
    }
  }
  else if (!v5)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_1DF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(char *)(a1 + 16);
  uint64_t v5 = *(char *)(a2 + 16);
  BOOL v6 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v6 || (char v7 = sub_3F5A8(), v8 = 0, (v7 & 1) != 0))
  {
    uint64_t v9 = *(void *)&aFirst_1[8 * v4];
    uint64_t v10 = qword_41A88[v4];
    uint64_t v11 = *(void *)&aFirst_1[8 * v5];
    uint64_t v12 = qword_41A88[v5];
    if (v9 == v11 && v10 == v12)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_3F5A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v8 = 0;
      if ((v14 & 1) == 0) {
        return v8 & 1;
      }
    }
    sub_BA34(0, &qword_52D80);
    if ((sub_3F068() & 1) != 0 && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
      char v8 = ((*(unsigned char *)(a1 + 40) & 1) == 0) ^ *(unsigned char *)(a2 + 40);
    }
    else {
      char v8 = 0;
    }
  }
  return v8 & 1;
}

uint64_t sub_1E060(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4D5F8;
  v6._object = a2;
  unint64_t v4 = sub_3F3F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_1E0AC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4D660;
  v6._object = a2;
  unint64_t v4 = sub_3F3F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

unint64_t sub_1E0F8()
{
  unint64_t result = qword_534F8;
  if (!qword_534F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_534F8);
  }
  return result;
}

unint64_t sub_1E14C()
{
  unint64_t result = qword_53508;
  if (!qword_53508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53508);
  }
  return result;
}

unint64_t sub_1E1A0()
{
  unint64_t result = qword_53510;
  if (!qword_53510)
  {
    sub_13560(&qword_53308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53510);
  }
  return result;
}

ValueMetadata *type metadata accessor for NvASRPhonemesDistances()
{
  return &type metadata for NvASRPhonemesDistances;
}

uint64_t destroy for NvASRPhonemesDistances.PhonemesPair()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

void *assignWithCopy for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

__n128 initializeWithTake for NvASRPhonemesDistances.PhonemesPair(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for NvASRPhonemesDistances.PhonemesPair(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NvASRPhonemesDistances.PhonemesPair(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for NvASRPhonemesDistances.PhonemesPair()
{
  return &type metadata for NvASRPhonemesDistances.PhonemesPair;
}

ValueMetadata *type metadata accessor for NamePart()
{
  return &type metadata for NamePart;
}

void destroy for ASRToken(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for ASRToken(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ASRToken(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)(a2 + 24);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for ASRToken(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ASRToken(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASRToken(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRToken(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASRToken()
{
  return &type metadata for ASRToken;
}

uint64_t destroy for TMDCConversationData(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void **)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v5;
  id v6 = v5;

  id v7 = *(void **)(a1 + 16);
  id v8 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v8;
  id v9 = v8;

  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t v11 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v11;
  id v12 = v11;

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for TMDCConversationData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TMDCConversationData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TMDCConversationData()
{
  return &type metadata for TMDCConversationData;
}

unsigned char *storeEnumTagSinglePayload for Domain(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1E980);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

uint64_t destroy for TMDCPostSiriEngagementData()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ASRContactName(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ASRContactName(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ASRContactName(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for TMDCPostSiriEngagementData()
{
  return &type metadata for TMDCPostSiriEngagementData;
}

unsigned char *_s44SiriPrivateLearningTTSMispronunciationPlugin8NamePartOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1EB54);
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

ValueMetadata *type metadata accessor for PhonemeString.CodingKeys()
{
  return &type metadata for PhonemeString.CodingKeys;
}

unint64_t sub_1EB90()
{
  unint64_t result = qword_53578;
  if (!qword_53578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53578);
  }
  return result;
}

unint64_t sub_1EBE8()
{
  unint64_t result = qword_53580;
  if (!qword_53580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53580);
  }
  return result;
}

unint64_t sub_1EC40()
{
  unint64_t result = qword_53588;
  if (!qword_53588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53588);
  }
  return result;
}

unint64_t sub_1EC98()
{
  unint64_t result = qword_53590;
  if (!qword_53590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53590);
  }
  return result;
}

unint64_t sub_1ECF0()
{
  unint64_t result = qword_53598;
  if (!qword_53598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53598);
  }
  return result;
}

unint64_t sub_1ED48()
{
  unint64_t result = qword_535A0;
  if (!qword_535A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_535A0);
  }
  return result;
}

uint64_t sub_1ED9C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736C6F626D7973 && a2 == 0xE700000000000000;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69646F636E65 && a2 == 0xE800000000000000 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x797261646E756F62 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin14ASRContactNameVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin14ASRContactNameVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1EF64(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASRContactName()
{
  return &type metadata for ASRContactName;
}

void destroy for ASRLoggedToken(uint64_t a1)
{
  swift_bridgeObjectRelease();

  unint64_t v2 = *(void **)(a1 + 24);
}

void *initializeWithCopy for ASRLoggedToken(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unsigned int v4 = (void *)a2[2];
  uint64_t v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

void *assignWithCopy for ASRLoggedToken(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v4 = (void *)a1[1];
  uint64_t v5 = (void *)a2[1];
  a1[1] = v5;
  id v6 = v5;

  id v7 = (void *)a1[2];
  id v8 = (void *)a2[2];
  a1[2] = v8;
  id v9 = v8;

  uint64_t v10 = (void *)a1[3];
  uint64_t v11 = (void *)a2[3];
  a1[3] = v11;
  id v12 = v11;

  return a1;
}

uint64_t assignWithTake for ASRLoggedToken(uint64_t a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for ASRLoggedToken(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRLoggedToken(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASRLoggedToken()
{
  return &type metadata for ASRLoggedToken;
}

uint64_t sub_1F1C8(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_3F148();
    uint64_t v5 = v4;
    sub_3F1E8();
    char v6 = sub_3F168();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_22540(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_21D78(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_22540(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_21FD0(a1);
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

unint64_t sub_1F2D8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_62C4((uint64_t *)&unk_53750);
  unint64_t v2 = (void *)sub_3F3B8();
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
    swift_bridgeObjectRetain();
    unint64_t result = sub_34AD0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
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

unint64_t sub_1F3F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_62C4(&qword_53748);
  unint64_t v2 = (void *)sub_3F3B8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_34AD0(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

unint64_t sub_1F508(uint64_t a1)
{
  uint64_t v2 = sub_62C4(&qword_53550);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_62C4((uint64_t *)&unk_53760);
  uint64_t v6 = sub_3F3B8();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  unint64_t v25 = &v5[*(int *)(v2 + 48)];
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  v23[1] = a1;
  uint64_t v24 = v11;
  swift_retain();
  while (1)
  {
    sub_24678(v10, (uint64_t)v5, &qword_53550);
    unint64_t result = sub_34C74((uint64_t)v5);
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[6];
    uint64_t v16 = sub_3EA38();
    uint64_t v17 = *(void *)(v16 - 8);
    id v18 = *(void (**)(unint64_t, char *, uint64_t))(v17 + 32);
    unint64_t v19 = *(void *)(v17 + 72) * v14;
    v18(v15 + v19, v5, v16);
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v7[7] + v19, v25, v16);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    _OWORD v7[2] = v22;
    v10 += v24;
    if (!--v8)
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

unint64_t sub_1F720(uint64_t a1)
{
  uint64_t v2 = sub_62C4(&qword_53570);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_62C4((uint64_t *)&unk_53770);
  uint64_t v6 = sub_3F3B8();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24678(v12, (uint64_t)v5, &qword_53570);
    unint64_t result = sub_34C74((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_3EA38();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t v19 = (void *)(v7[7] + 16 * v16);
    uint64_t v20 = *((void *)v9 + 1);
    *unint64_t v19 = *(void *)v9;
    v19[1] = v20;
    uint64_t v21 = v7[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_11;
    }
    _OWORD v7[2] = v23;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_1F91C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
    goto LABEL_10;
  }
  sub_62C4(&qword_53730);
  uint64_t v2 = sub_3F3B8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(v1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v24 = v2 + 64;
  swift_retain();
  uint64_t v26 = v4 - 1;
  uint64_t v5 = 32;
  for (i = v1; ; uint64_t v1 = i)
  {
    uint64_t v25 = v5;
    uint64_t v6 = v1 + v5;
    long long v7 = *(_OWORD *)(v6 + 48);
    long long v36 = *(_OWORD *)(v6 + 32);
    long long v37 = v7;
    long long v8 = *(_OWORD *)(v6 + 80);
    long long v38 = *(_OWORD *)(v6 + 64);
    long long v39 = v8;
    long long v9 = *(_OWORD *)(v6 + 112);
    long long v40 = *(_OWORD *)(v6 + 96);
    long long v41 = v9;
    long long v10 = *(_OWORD *)(v6 + 16);
    v35[0] = *(_OWORD *)v6;
    v35[1] = v10;
    char v11 = *(unsigned char *)(v6 + 128);
    char v42 = v11;
    long long v12 = v10;
    long long v13 = v36;
    char v14 = v37;
    uint64_t v15 = *((void *)&v37 + 1);
    uint64_t v33 = *((void *)&v38 + 1);
    uint64_t v34 = v38;
    uint64_t v32 = v39;
    char v31 = BYTE8(v39);
    uint64_t v29 = *((void *)&v40 + 1);
    uint64_t v30 = v40;
    uint64_t v27 = *((void *)&v9 + 1);
    uint64_t v28 = v9;
    long long v16 = v35[0];
    sub_2457C(v35);
    unint64_t result = sub_34AD0(v16, *((uint64_t *)&v16 + 1));
    if (v18) {
      break;
    }
    *(void *)(v24 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v16;
    uint64_t v19 = v3[7] + 120 * result;
    *(_OWORD *)uint64_t v19 = v12;
    *(_OWORD *)(v19 + 16) = v13;
    *(unsigned char *)(v19 + 32) = v14;
    *(void *)(v19 + 40) = v15;
    *(void *)(v19 + 48) = v34;
    *(void *)(v19 + 56) = v33;
    *(void *)(v19 + 64) = v32;
    *(unsigned char *)(v19 + 72) = v31;
    *(void *)(v19 + 80) = v30;
    *(void *)(v19 + 88) = v29;
    *(void *)(v19 + 96) = v28;
    *(void *)(v19 + 104) = v27;
    *(unsigned char *)(v19 + 112) = v11;
    uint64_t v20 = v3[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_12;
    }
    v3[2] = v22;
    if (!v26)
    {
      swift_release();
      goto LABEL_10;
    }
    --v26;
    uint64_t v5 = v25 + 136;
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1FB18()
{
  sub_62C4(&qword_536D8);
  sub_3EA38();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_40A20;
  sub_3EA28();
  uint64_t result = sub_3EA28();
  qword_57CC0 = v0;
  return result;
}

void *sub_1FBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_3EC68();
  sub_60E8(v8, (uint64_t)qword_57CC8);
  long long v9 = sub_3EC48();
  os_log_type_t v10 = sub_3EFB8();
  if (os_log_type_enabled(v9, v10))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "Start runTTSOverrider()", v11, 2u);
    swift_slowDealloc();
  }

  sub_24418(a1 + 32, (uint64_t)v100, &qword_53718);
  sub_24418((uint64_t)v100, (uint64_t)&v101, &qword_53718);
  if (!v102)
  {
    uint64_t v17 = sub_3EC48();
    os_log_type_t v18 = sub_3EFB8();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "No post Siri engagement data found", v19, 2u);
      swift_slowDealloc();
    }
    goto LABEL_21;
  }
  char v12 = v103;
  id v13 = sub_20D80(v101, v102);
  if (v3) {
    goto LABEL_7;
  }
  uint64_t v4 = v13;
  if (!v13) {
    goto LABEL_22;
  }
  int v20 = *(unsigned __int8 *)(a2 + 16);
  if (!sub_22058(v13, *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16)))
  {
    id v23 = v4;
    uint64_t v17 = sub_3EC48();
    os_log_type_t v24 = sub_3EFB8();
    if (os_log_type_enabled(v17, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      id v98 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      buf = v25;
      id v26 = [v23 identifier];
      uint64_t v27 = sub_3ED78();
      unint64_t v29 = v28;

      sub_2B8C8(v27, v29, (uint64_t *)&v98);
      sub_3F088();

      swift_bridgeObjectRelease();
      uint64_t v30 = "ASR contact name does not match the contact name, skipping correcting mispronunciation for contact ID: %s";
LABEL_20:
      _os_log_impl(&dword_0, v17, v24, v30, buf, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

LABEL_21:
LABEL_22:
      char v14 = sub_3EC48();
      os_log_type_t v36 = sub_3EFB8();
      if (!os_log_type_enabled(v14, v36))
      {
        uint64_t v4 = 0;
        goto LABEL_26;
      }
      long long v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v37 = 0;
      _os_log_impl(&dword_0, v14, v36, "End runTTSOverrider()", v37, 2u);
      uint64_t v4 = 0;
      goto LABEL_24;
    }
LABEL_27:

    goto LABEL_22;
  }
  if ((sub_2141C(v4, v12 & 1) & 1) == 0)
  {
    id v23 = v4;
    uint64_t v17 = sub_3EC48();
    os_log_type_t v24 = sub_3EFB8();
    if (os_log_type_enabled(v17, v24))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      id v98 = (id)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      buf = v31;
      id v32 = [v23 identifier];
      uint64_t v33 = sub_3ED78();
      unint64_t v35 = v34;

      sub_2B8C8(v33, v35, (uint64_t *)&v98);
      sub_3F088();

      swift_bridgeObjectRelease();
      uint64_t v30 = "Pronunciation is not overridable, skipping correcting mispronunciation for contact ID: %s";
      goto LABEL_20;
    }
    goto LABEL_27;
  }
  BOOL v21 = *(unsigned char **)(a2 + 24);
  uint64_t v22 = sub_208F4(v21);
  long long v39 = (void *)v22;
  if (!v22)
  {
    id v98 = 0;
    unint64_t v99 = 0xE000000000000000;
    sub_3F238(51);
    v104._countAndFlagsBits = 0x74276E646C756F43;
    v104._object = (void *)0xED00002070616D20;
    sub_3EE18(v104);
    NSString v53 = v21;
    id v54 = [v53 description];
    uint64_t v55 = sub_3ED78();
    unint64_t v57 = v56;

    v105._countAndFlagsBits = v55;
    v105._object = v57;
    sub_3EE18(v105);

    swift_bridgeObjectRelease();
    v106._countAndFlagsBits = 0xD00000000000001BLL;
    v106._object = (void *)0x8000000000043830;
    sub_3EE18(v106);
    v107._countAndFlagsBits = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
    sub_3EE18(v107);
    swift_bridgeObjectRelease();
    v108._countAndFlagsBits = 0x656C61636F6C20;
    v108._object = (void *)0xE700000000000000;
    sub_3EE18(v108);
    sub_224A4();
    swift_allocError();
    *char v58 = 0;
    v58[1] = 0xE000000000000000;
    swift_willThrow();

    char v14 = sub_3EC48();
    os_log_type_t v15 = sub_3EFB8();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_26;
    }
    goto LABEL_8;
  }
  uint64_t v97 = v5 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
  unint64_t v40 = sub_233A0(v20, v22, v5 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale);
  if (!v40)
  {
    sub_3F238(40);
    swift_bridgeObjectRelease();
    id v98 = (id)0xD000000000000010;
    unint64_t v99 = 0x8000000000043850;
    uint64_t v59 = v21;
    id v60 = [v59 description];
    uint64_t v61 = sub_3ED78();
    uint64_t v63 = v62;

    v109._countAndFlagsBits = v61;
    v109._object = v63;
    sub_3EE18(v109);

    swift_bridgeObjectRelease();
    v110._countAndFlagsBits = 0xD000000000000016;
    v110._object = (void *)0x8000000000043870;
    sub_3EE18(v110);
    sub_224A4();
    swift_allocError();
    *uint64_t v64 = 0xD000000000000010;
    v64[1] = 0x8000000000043850;
LABEL_37:
    swift_willThrow();

    goto LABEL_7;
  }
  unint64_t v42 = v40;
  unsigned int v43 = v41;
  sub_2D420();
  if (!v44)
  {
    swift_bridgeObjectRelease();
    sub_224A4();
    swift_allocError();
    void *v65 = 0xD000000000000028;
    v65[1] = 0x8000000000043890;
    goto LABEL_37;
  }
  unsigned int v89 = v43;
  unint64_t v45 = v4;
  uint64_t v46 = sub_3EC48();
  os_log_type_t v47 = sub_3EFB8();
  bufa = v45;
  v90 = v39;
  uint64_t v91 = v42;
  if (os_log_type_enabled(v46, v47))
  {
    log = v46;
    os_log_type_t v48 = (uint8_t *)swift_slowAlloc();
    id v98 = (id)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v48 = 136315138;
    id v49 = [(uint8_t *)v45 identifier];
    uint64_t v50 = sub_3ED78();
    unint64_t v52 = v51;

    unint64_t v45 = bufa;
    sub_2B8C8(v50, v52, (uint64_t *)&v98);
    sub_3F088();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, log, v47, "Updating phonemeData for contact: %s", v48, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v66 = [objc_allocWithZone((Class)CNSaveRequest) init];
  id v67 = [(uint8_t *)v45 selfOrMutableCopy];
  NSString v68 = sub_3ED48();
  swift_bridgeObjectRelease();
  [v67 setPhonemeData:v68];

  uint64_t v4 = v67;
  [v66 updateContact:v67];
  uint64_t v69 = *(void **)(v5 + 16);
  id v98 = 0;
  unsigned int v70 = [v69 executeSaveRequest:v66 error:&v98];
  id v71 = v98;
  if (v70)
  {
    v93 = v66;
    Swift::String v72 = bufa;
    id v73 = v71;
    long long v74 = sub_3EC48();
    os_log_type_t v75 = sub_3EFB8();
    bufb = v72;
    if (os_log_type_enabled(v74, v75))
    {
      unint64_t v92 = v74;
      os_log_type_t v87 = v75;
      Swift::String v76 = (uint8_t *)swift_slowAlloc();
      id v98 = (id)swift_slowAlloc();
      *(_DWORD *)Swift::String v76 = 136315138;
      Swift::String v77 = v4;
      id v78 = [(uint8_t *)v72 identifier];
      uint64_t v86 = sub_3ED78();
      unint64_t v80 = v79;

      uint64_t v4 = v77;
      sub_2B8C8(v86, v80, (uint64_t *)&v98);
      sub_3F088();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v92, v87, "Finished updating phonemeData for contact: %s", v76, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v82 = v4;
    id v83 = [v4 identifier];
    uint64_t v4 = (void *)sub_3ED78();

    sub_237F0(v91, v89, v97, v20);
    swift_bridgeObjectRelease();

    char v14 = sub_3EC48();
    os_log_type_t v84 = sub_3EFB8();
    if (!os_log_type_enabled(v14, v84)) {
      goto LABEL_26;
    }
    os_log_type_t v85 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v85 = 0;
    _os_log_impl(&dword_0, v14, v84, "End runTTSOverrider()", v85, 2u);
LABEL_24:
    swift_slowDealloc();
    goto LABEL_26;
  }
  id v81 = v98;
  swift_bridgeObjectRelease();
  sub_3E488();

  swift_willThrow();
LABEL_7:
  char v14 = sub_3EC48();
  os_log_type_t v15 = sub_3EFB8();
  if (os_log_type_enabled(v14, v15))
  {
LABEL_8:
    long long v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "End runTTSOverrider()", v16, 2u);
    swift_slowDealloc();
  }
LABEL_26:

  return v4;
}

uint64_t sub_208F4(unsigned char *a1)
{
  uint64_t v4 = v3;
  uint64_t v6 = sub_3EA38();
  unint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  long long v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_52778 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v10 = qword_57CC0;
    unint64_t v35 = *(unsigned char **)(qword_57CC0 + 16);
    if (!v35)
    {
      uint64_t v14 = 3;
      goto LABEL_16;
    }
    uint64_t v11 = v2 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    unint64_t v28 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v29 = v2;
    uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    unint64_t v34 = v7 + 16;
    v33(v9, qword_57CC0 + v28, v6);
    uint64_t v12 = sub_224F8((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
    swift_bridgeObjectRetain();
    uint64_t v31 = v12;
    uint64_t v32 = v11;
    uint64_t v1 = sub_3ED28();
    uint64_t v2 = v10;
    id v13 = *(void (**)(char *, uint64_t))(v7 + 8);
    v13(v9, v6);
    if (v1)
    {
      swift_bridgeObjectRelease();
      uint64_t v14 = 2;
      goto LABEL_15;
    }
    uint64_t v27 = v2;
    if (v35 == (unsigned char *)&dword_0 + 1) {
      break;
    }
    uint64_t v25 = v4;
    id v26 = a1;
    uint64_t v30 = *(void *)(v7 + 72);
    unint64_t v7 = v27 + v30 + v28;
    a1 = (unsigned char *)(&dword_0 + 1);
    while (1)
    {
      v33(v9, v7, v6);
      uint64_t v4 = a1 + 1;
      if (__OFADD__(a1, 1)) {
        break;
      }
      uint64_t v2 = v6;
      uint64_t v1 = sub_3ED28();
      v13(v9, v6);
      if (v1)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = 2;
        goto LABEL_14;
      }
      ++a1;
      v7 += v30;
      if (v4 == v35)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = 3;
LABEL_14:
        uint64_t v4 = v25;
        a1 = v26;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_24:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = 3;
LABEL_15:
  uint64_t v2 = v29;
LABEL_16:
  sub_6280((void *)(v2 + 24), *(void *)(v2 + 48));
  uint64_t v15 = sub_33FD4(a1, v14, 1);
  if (!v4)
  {
    uint64_t v16 = v15;
    if ((v15 & 0xC000000000000001) != 0)
    {
      if (sub_3F198() == 1)
      {
LABEL_19:
        uint64_t v1 = sub_1F1C8(v16);
        swift_bridgeObjectRelease();
        return v1;
      }
    }
    else if (*(void *)(v15 + 16) == 1)
    {
      goto LABEL_19;
    }
    uint64_t v36 = 0;
    unint64_t v37 = 0xE000000000000000;
    sub_3F238(47);
    id v17 = [a1 description];
    uint64_t v18 = sub_3ED78();
    int v20 = v19;

    v39._countAndFlagsBits = v18;
    v39._object = v20;
    sub_3EE18(v39);
    swift_bridgeObjectRelease();
    v40._object = (void *)0x8000000000043810;
    v40._countAndFlagsBits = 0xD00000000000001ELL;
    sub_3EE18(v40);
    char v38 = v14;
    sub_3F348();
    v41._countAndFlagsBits = 0x656D656E6F687020;
    v41._object = (void *)0xEB00000000203A73;
    sub_3EE18(v41);
    type metadata accessor for PhonemeString();
    sub_224F8(&qword_53710, (void (*)(uint64_t))type metadata accessor for PhonemeString);
    v42._countAndFlagsBits = sub_3EF78();
    sub_3EE18(v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v1 = v36;
    unint64_t v21 = v37;
    sub_224A4();
    swift_allocError();
    *uint64_t v22 = v1;
    v22[1] = v21;
    swift_willThrow();
  }
  return v1;
}

id sub_20D80(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  sub_62C4(&qword_52BE0);
  unint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_41AB0;
  unint64_t v7 = (void *)CNContactPhonemeDataKey;
  *(void *)(v6 + 32) = CNContactPhonemeDataKey;
  *(void *)(v6 + 40) = CNContactGivenNameKey;
  *(void *)(v6 + 48) = CNContactFamilyNameKey;
  *(void *)(v6 + 56) = CNContactNicknameKey;
  uint64_t v8 = self;
  id v9 = v7;
  uint64_t v10 = CNContactGivenNameKey;
  uint64_t v11 = CNContactFamilyNameKey;
  uint64_t v12 = CNContactNicknameKey;
  *(void *)(v6 + 64) = [v8 descriptorForRequiredKeysForStyle:0];
  uint64_t v46 = v6;
  sub_3EED8();
  id v13 = (void *)CNContactPronunciationGivenNameKey;
  uint64_t v14 = (void *)CNContactPronunciationFamilyNameKey;
  if (v6 >> 62)
  {
    id v36 = CNContactPronunciationGivenNameKey;
    id v37 = v14;
    swift_bridgeObjectRetain();
    id v15 = (id)sub_3F378();
    swift_bridgeObjectRelease();
    uint64_t v18 = (uint64_t)v15 + 2;
    if (!__OFADD__(v15, 2))
    {
LABEL_3:
      sub_31974(v18);
      sub_3EED8();
      id v15 = v13;
      sub_3EE98();
      if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) < *(void *)((char *)&dword_18
                                                                                   + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    id v15 = *(id *)((char *)&dword_10 + (v46 & 0xFFFFFFFFFFFFFF8));
    id v16 = CNContactPronunciationGivenNameKey;
    id v17 = v14;
    uint64_t v18 = (uint64_t)v15 + 2;
    if (!__OFADD__(v15, 2)) {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_16:
  sub_3EEE8();
LABEL_4:
  sub_3EF08();
  sub_3EED8();
  swift_unknownObjectRetain();
  sub_3EE98();
  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_3EEE8();
  sub_3EF08();
  sub_3EED8();

  uint64_t v19 = self;
  sub_62C4((uint64_t *)&unk_536F0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_40160;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  swift_bridgeObjectRetain();
  Class isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  id v22 = [v19 predicateForContactsWithIdentifiers:isa];

  id v23 = *(void **)(v3 + 16);
  sub_62C4((uint64_t *)&unk_53C90);
  Class v24 = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v46 = 0;
  id v25 = [v23 unifiedContactsMatchingPredicate:v22 keysToFetch:v24 error:&v46];

  id v26 = (id)v46;
  if (!v25)
  {
    id v33 = (id)v46;
    sub_3E488();

    goto LABEL_12;
  }
  sub_22464();
  unint64_t v27 = sub_3EEB8();
  id v28 = v26;

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_3F378();
    swift_bridgeObjectRelease();
    if (v38)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_3F378();
      swift_bridgeObjectRelease();
      if (v39 >= 2) {
        goto LABEL_10;
      }
LABEL_19:
      if ((v27 & 0xC000000000000001) != 0)
      {
        id v40 = (id)sub_3F278();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8))) {
          __break(1u);
        }
        id v40 = *(id *)(v27 + 32);
      }
      id v33 = v40;
      swift_bridgeObjectRelease();

      return v33;
    }
  }
  else
  {
    uint64_t v29 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
    if (v29)
    {
      if (v29 >= 2)
      {
LABEL_10:
        uint64_t v46 = 0;
        unint64_t v47 = 0xE000000000000000;
        sub_3F238(40);
        swift_bridgeObjectRelease();
        uint64_t v30 = sub_3F598();
        unint64_t v32 = v31;
        swift_bridgeObjectRelease();
        uint64_t v46 = v30;
        unint64_t v47 = v32;
        v48._object = (void *)0x80000000000437E0;
        v48._countAndFlagsBits = 0xD000000000000023;
        sub_3EE18(v48);
        v49._countAndFlagsBits = a1;
        v49._object = a2;
        sub_3EE18(v49);
        v50._countAndFlagsBits = 46;
        v50._object = (void *)0xE100000000000000;
        sub_3EE18(v50);
        id v33 = (id)v46;
        unint64_t v34 = v47;
        sub_224A4();
        swift_allocError();
        *unint64_t v35 = v33;
        v35[1] = v34;
LABEL_12:
        swift_willThrow();

        return v33;
      }
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_3EC68();
  sub_60E8(v41, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain_n();
  Swift::String v42 = sub_3EC48();
  os_log_type_t v43 = sub_3EFC8();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136315138;
    swift_bridgeObjectRetain();
    sub_2B8C8(a1, (unint64_t)a2, &v46);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v42, v43, "No matching contacts found for overriding for %s", v44, 0xCu);
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

uint64_t sub_2141C(void *a1, char a2)
{
  if ((a2 & 1) != 0
    || (*(unsigned char *)(v2 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_isCurareRun) & 1) != 0)
  {
    unsigned __int8 v4 = sub_215E4(a1);
    id v5 = [a1 pronunciationGivenName];
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = sub_3ED78();
      unint64_t v9 = v8;

      uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v10 = 0;
      unint64_t v9 = 0xE000000000000000;
    }
    id v11 = [a1 pronunciationFamilyName];
    if (v11)
    {
      uint64_t v12 = sub_3ED78();
      unint64_t v14 = v13;

      id v11 = (id)(v12 & 0xFFFFFFFFFFFFLL);
    }
    else
    {
      unint64_t v14 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    if ((v9 & 0x2000000000000000) != 0) {
      uint64_t v15 = HIBYTE(v9) & 0xF;
    }
    else {
      uint64_t v15 = v10;
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = HIBYTE(v14) & 0xF;
    if ((v14 & 0x2000000000000000) == 0) {
      uint64_t v16 = (uint64_t)v11;
    }
    unsigned int v17 = (v16 == 0) & v4;
    if (v15) {
      return 0;
    }
    else {
      return v17;
    }
  }
  else
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_3EC68();
    sub_60E8(v19, (uint64_t)qword_57CC8);
    uint64_t v20 = sub_3EC48();
    os_log_type_t v21 = sub_3EFB8();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "The user-initiated conversation wasn't a success", v22, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
}

uint64_t sub_215E4(void *a1)
{
  uint64_t v3 = sub_3EA38();
  unint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2C9AC(a1);
  if (v7)
  {
    uint64_t v9 = v7;
    LODWORD(v10) = v8;
    uint64_t v35 = v1 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    if (qword_52778 != -1) {
      goto LABEL_23;
    }
    while (1)
    {
      uint64_t v11 = qword_57CC0;
      uint64_t v34 = *(void *)(qword_57CC0 + 16);
      if (!v34) {
        goto LABEL_18;
      }
      unint64_t v31 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      id v33 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      v33(v6, qword_57CC0 + v31, v3);
      uint64_t v12 = sub_224F8((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
      swift_bridgeObjectRetain();
      uint64_t v32 = v12;
      char v13 = sub_3ED28();
      unint64_t v14 = *(void (**)(char *, uint64_t))(v4 + 8);
      v14(v6, v3);
      if (v13) {
        break;
      }
      if (v34 == 1)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        char v24 = sub_10B14(v35, v9);
        swift_bridgeObjectRelease();
        return v24 & 1;
      }
      v28[1] = v10;
      uint64_t v29 = v11;
      uint64_t v30 = v9;
      uint64_t v9 = *(void *)(v4 + 72);
      unint64_t v4 = v11 + v9 + v31;
      uint64_t v25 = 1;
      while (1)
      {
        v33(v6, v4, v3);
        uint64_t v10 = v25 + 1;
        if (__OFADD__(v25, 1)) {
          break;
        }
        char v26 = sub_3ED28();
        v14(v6, v3);
        if (v26) {
          goto LABEL_19;
        }
        ++v25;
        v4 += v9;
        if (v10 == v34)
        {
          swift_bridgeObjectRelease();
          uint64_t v9 = v30;
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_23:
      swift_once();
    }
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_3EC68();
  sub_60E8(v15, (uint64_t)qword_57CC8);
  id v16 = a1;
  unsigned int v17 = sub_3EC48();
  os_log_type_t v18 = sub_3EFC8();
  if (!os_log_type_enabled(v17, v18))
  {

LABEL_20:
    char v24 = 1;
    return v24 & 1;
  }
  uint64_t v19 = (uint8_t *)swift_slowAlloc();
  uint64_t v37 = swift_slowAlloc();
  *(_DWORD *)uint64_t v19 = 136315138;
  id v20 = [v16 identifier];
  uint64_t v21 = sub_3ED78();
  unint64_t v23 = v22;

  uint64_t v36 = sub_2B8C8(v21, v23, &v37);
  sub_3F088();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_0, v17, v18, "Couldn't parse phonemeData for contact: %s", v19, 0xCu);
  char v24 = 1;
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return v24 & 1;
}

uint64_t sub_21A4C()
{
  sub_66DC((uint64_t)(v0 + 3));
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
  uint64_t v2 = sub_3EA38();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_21AFC()
{
  return type metadata accessor for TTSContactOverrider();
}

uint64_t type metadata accessor for TTSContactOverrider()
{
  uint64_t result = qword_535F8;
  if (!qword_535F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21B50()
{
  uint64_t result = sub_3EA38();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_21C00()
{
  return sub_224F8(&qword_536D0, (void (*)(uint64_t))type metadata accessor for PhonemeString);
}

BOOL sub_21C48()
{
  id v1 = [v0 pronunciationGivenName];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_3ED78();
    unint64_t v5 = v4;

    uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v5 = 0xE000000000000000;
  }
  id v7 = [v0 pronunciationFamilyName];
  if (v7)
  {
    uint64_t v8 = sub_3ED78();
    unint64_t v10 = v9;

    id v7 = (id)(v8 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  if ((v5 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v5) & 0xF;
  }
  else {
    uint64_t v11 = v6;
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v12 = (uint64_t)v7;
  }
  BOOL v13 = v12 == 0;
  return !v11 && v13;
}

uint64_t sub_21D2C(void *a1, void *a2)
{
  uint64_t v2 = (void *)(*a1 + OBJC_IVAR___PhonemeString_symbols);
  if (*v2 == *(void *)(*a2 + OBJC_IVAR___PhonemeString_symbols)
    && v2[1] == *(void *)(*a2 + OBJC_IVAR___PhonemeString_symbols + 8))
  {
    return 0;
  }
  else
  {
    return sub_3F5A8();
  }
}

void sub_21D78(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_3F1B8();
      type metadata accessor for PhonemeString();
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
  if (sub_3F178() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_3F188();
  type metadata accessor for PhonemeString();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_3F058(*(void *)(a4 + 40));
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
  char v10 = sub_3F068();

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
      char v13 = sub_3F068();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_21FD0(uint64_t a1)
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

BOOL sub_22058(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8 = sub_3E478();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    if (a4 == 1) {
      id v12 = [a1 familyName];
    }
    else {
      id v12 = [a1 nickname];
    }
  }
  else
  {
    id v12 = [a1 givenName];
  }
  id v13 = v12;
  uint64_t v14 = sub_3ED78();
  unint64_t v16 = v15;

  uint64_t v40 = v14;
  unint64_t v41 = v16;
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_3EC68();
  sub_60E8(v17, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  os_log_type_t v18 = sub_3EC48();
  os_log_type_t v19 = sub_3EFB8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v34 = v8;
    uint64_t v21 = v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = v9;
    v37[0] = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v32 = v14;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_2B8C8(a2, a3, v37);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_2B8C8(v32, v16, v37);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v18, v19, "In doesContactNameMatch() ASR contact name: %s, contact name: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    uint64_t v9 = v33;
    swift_slowDealloc();
    uint64_t v8 = v34;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v37[0] = a2;
  v37[1] = a3;
  swift_bridgeObjectRetain();
  sub_3E448();
  sub_6688();
  uint64_t v23 = sub_3F0C8();
  uint64_t v25 = v24;
  char v26 = *(void (**)(char *, uint64_t))(v9 + 8);
  v26(v11, v8);
  swift_bridgeObjectRelease();
  uint64_t v38 = v23;
  uint64_t v39 = v25;
  swift_beginAccess();
  uint64_t v35 = v40;
  unint64_t v36 = v41;
  sub_3E448();
  uint64_t v27 = sub_3F0C8();
  unint64_t v29 = v28;
  v26(v11, v8);
  swift_bridgeObjectRelease();
  uint64_t v35 = v27;
  unint64_t v36 = v29;
  uint64_t v30 = sub_3F0E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30 == 0;
}

unint64_t sub_22464()
{
  unint64_t result = qword_53700;
  if (!qword_53700)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_53700);
  }
  return result;
}

unint64_t sub_224A4()
{
  unint64_t result = qword_53708;
  if (!qword_53708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53708);
  }
  return result;
}

uint64_t sub_224F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22540(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2254C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_3E4F8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR___PhonemeString_symbols + 8);
  sub_62C4((uint64_t *)&unk_53738);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_40160;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 40) = 0;
  *(void *)(v10 + 48) = v9;
  *(void *)(v10 + 56) = v8;
  *(void *)(v10 + 64) = 0;
  *(unsigned char *)(v10 + 72) = 1;
  *(void *)(v10 + 80) = 0;
  *(void *)(v10 + 88) = 0;
  swift_bridgeObjectRetain_n();
  sub_3E4E8();
  uint64_t result = sub_3E4D8();
  double v13 = round(v12 * 1000.0);
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v13 < 9.22337204e18)
  {
    uint64_t v14 = (uint64_t)v13;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v14;
    *(unsigned char *)(a2 + 32) = 0;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_226EC@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v103 = a3;
  int v102 = a1;
  uint64_t v8 = sub_3EA38();
  unint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2254C(a2, (uint64_t)&v104);
  uint64_t v13 = v104;
  double v12 = (void (*)(void, void, void))v105[0];
  uint64_t v15 = v105[1];
  unint64_t v14 = v105[2];
  unsigned int v16 = v106;
  unsigned int v89 = (uint8_t *)sub_2C9AC(v5);
  uint64_t v92 = v15;
  unint64_t v93 = v14;
  uint64_t v91 = v12;
  uint64_t v90 = v13;
  if (!v89) {
    goto LABEL_25;
  }
  int v18 = v17;
  if (qword_52778 != -1) {
    goto LABEL_45;
  }
  while (1)
  {
    uint64_t v19 = qword_57CC0;
    uint64_t v20 = v103;
    uint64_t v101 = *(char **)(qword_57CC0 + 16);
    if (!v101) {
      goto LABEL_13;
    }
    os_log_type_t v87 = v5;
    LODWORD(v98) = v18;
    LODWORD(v88) = v16;
    unint64_t v97 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v100 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    v100(v11, qword_57CC0 + v97, v8);
    uint64_t v21 = sub_224F8((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
    swift_bridgeObjectRetain();
    uint64_t v99 = v21;
    unsigned int v16 = sub_3ED28();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
    v22(v11, v8);
    if (v16)
    {
      swift_bridgeObjectRelease();
      unsigned int v16 = v88;
      uint64_t v23 = (uint64_t)v89;
      uint64_t v5 = v87;
      goto LABEL_16;
    }
    uint64_t v96 = v19;
    if (v101 == (unsigned char *)&dword_0 + 1) {
      break;
    }
    id v95 = (void (*)(void, void, void))a4;
    a4 = *(void *)(v9 + 72);
    unint64_t v9 = v96 + a4 + v97;
    uint64_t v24 = 1;
    while (1)
    {
      v100(v11, v9, v8);
      uint64_t v5 = (char *)(v24 + 1);
      if (__OFADD__(v24, 1)) {
        break;
      }
      unsigned int v16 = sub_3ED28();
      v22(v11, v8);
      if (v16)
      {
        swift_bridgeObjectRelease();
        a4 = (uint64_t)v95;
        unsigned int v16 = v88;
        uint64_t v5 = v87;
        uint64_t v23 = (uint64_t)v89;
        goto LABEL_16;
      }
      ++v24;
      v9 += a4;
      if (v5 == v101)
      {
        swift_bridgeObjectRelease();
        a4 = (uint64_t)v95;
        unsigned int v16 = v88;
        uint64_t v5 = v87;
        uint64_t v20 = v103;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_45:
    LODWORD(v98) = v18;
    swift_once();
    int v18 = v98;
  }
  swift_bridgeObjectRelease();
  unsigned int v16 = v88;
  uint64_t v5 = v87;
LABEL_13:
  uint64_t v23 = (uint64_t)v89;
  if ((sub_10B14(v20, (uint64_t)v89) & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
LABEL_16:
  uint64_t v25 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v27 = v26;
  if (!*(void *)(v23 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v28 = v25;
  swift_bridgeObjectRetain();
  unint64_t v29 = sub_34AD0(v28, v27);
  if ((v30 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_25:
    unint64_t v97 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v103 = 0;
    uint64_t v94 = 0;
    id v95 = 0;
    uint64_t v59 = 0;
    uint64_t v61 = 0;
    uint64_t v101 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    unint64_t v63 = 0;
    LODWORD(v96) = 0;
    goto LABEL_26;
  }
  os_log_type_t v87 = v5;
  LODWORD(v88) = v16;
  uint64_t v31 = *(void *)(v23 + 56) + 120 * v29;
  uint64_t v32 = *(void *)v31;
  uint64_t v33 = *(void (**)(void, void, void))(v31 + 8);
  uint64_t v34 = *(void *)(v31 + 16);
  unint64_t v35 = *(void *)(v31 + 24);
  int v36 = *(unsigned __int8 *)(v31 + 32);
  uint64_t v37 = *(void *)(v31 + 40);
  uint64_t v86 = *(void (**)(void, void, void))(v31 + 48);
  uint64_t v38 = *(void *)(v31 + 56);
  uint64_t v39 = *(char **)(v31 + 64);
  int v40 = *(unsigned __int8 *)(v31 + 72);
  uint64_t v42 = *(void *)(v31 + 80);
  unint64_t v41 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 88);
  unint64_t v43 = *(void *)(v31 + 104);
  uint64_t v103 = *(void *)(v31 + 96);
  int v44 = *(unsigned __int8 *)(v31 + 112);
  uint64_t v83 = v32;
  id v95 = v33;
  uint64_t v84 = v34;
  unint64_t v85 = v35;
  LODWORD(v96) = v36;
  sub_11390(v32);
  uint64_t v82 = v37;
  uint64_t v45 = v37;
  uint64_t v46 = v86;
  uint64_t v99 = v38;
  uint64_t v101 = v39;
  HIDWORD(v94) = v40;
  sub_11390(v45);
  unint64_t v97 = v43;
  uint64_t v98 = v42;
  uint64_t v100 = v41;
  LODWORD(v94) = v44;
  sub_11390(v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v47 = sub_3EC68();
  sub_60E8(v47, (uint64_t)qword_57CC8);
  Swift::String v48 = v87;
  Swift::String v49 = sub_3EC48();
  os_log_type_t v50 = sub_3EFB8();
  if (os_log_type_enabled(v49, v50))
  {
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v107 = swift_slowAlloc();
    *(_DWORD *)unint64_t v51 = 136315138;
    unsigned int v89 = v51 + 4;
    id v52 = [v48 identifier];
    uint64_t v53 = sub_3ED78();
    unint64_t v55 = v54;

    uint64_t v56 = v82;
    uint64_t v108 = sub_2B8C8(v53, v55, (uint64_t *)&v107);
    sub_3F088();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v49, v50, "Found existing phonemeData for contact: %s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v57 = v83;
    uint64_t v58 = v84;
    sub_11390(v83);
    uint64_t v59 = v56;
    sub_11390(v56);
    sub_11390(v98);
    unint64_t v60 = v85;
    sub_1148C(v57);
    uint64_t v61 = v86;
    sub_1148C(v56);
    uint64_t v62 = v98;
    unint64_t v63 = v60;
  }
  else
  {

    uint64_t v78 = v83;
    uint64_t v58 = v84;
    unint64_t v63 = v85;
    sub_11390(v83);
    uint64_t v59 = v82;
    sub_11390(v82);
    uint64_t v79 = v98;
    sub_11390(v98);
    sub_1148C(v78);
    uint64_t v61 = v46;
    sub_1148C(v59);
    uint64_t v62 = v79;
    uint64_t v57 = v78;
  }
  sub_1148C(v62);
  unsigned int v16 = v88;
LABEL_26:
  if (!(_BYTE)v102)
  {
    unsigned int v65 = v16;
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  unsigned __int8 v64 = v102;
  uint64_t v88 = (long long *)v105;
  LODWORD(v89) = v16;
  unsigned int v65 = v16;
  char v66 = sub_3F5A8();
  swift_bridgeObjectRelease();
  if (v66)
  {
LABEL_33:
    uint64_t result = sub_1148C(v57);
    uint64_t v57 = v90;
    uint64_t v69 = v91;
    uint64_t v58 = v92;
    unint64_t v63 = v93;
    uint64_t v70 = v99;
    unint64_t v71 = (unint64_t)v101;
    unsigned int v72 = HIDWORD(v94);
    goto LABEL_36;
  }
  if (v64 == 2)
  {
    char v67 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if ((v67 & 1) == 0)
    {
      sub_1148C(v98);
      if (v64 > 1u)
      {
        uint64_t result = swift_bridgeObjectRelease();
      }
      else
      {
        char v80 = sub_3F5A8();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v80 & 1) == 0)
        {
          sub_1148C(v59);
          sub_1148C(v57);
          uint64_t v108 = v104;
          sub_11560((uint64_t)&v108);
          long long v107 = *v88;
          uint64_t result = sub_2464C((uint64_t)&v107);
          uint64_t v69 = 0;
          uint64_t v58 = 0;
          unint64_t v63 = 0;
          unsigned int v65 = 0;
          uint64_t v59 = 0;
          uint64_t v61 = 0;
          uint64_t v70 = 0;
          unint64_t v71 = 0;
          unsigned int v72 = 0;
          uint64_t v73 = 0;
          os_log_type_t v75 = 0;
          uint64_t v76 = 0;
          unint64_t v74 = 0;
          char v77 = 0;
          uint64_t v57 = 1;
          goto LABEL_37;
        }
      }
      unsigned int v65 = v96;
      uint64_t v73 = v90;
      os_log_type_t v75 = (void (*)(char *, unint64_t, uint64_t))v91;
      uint64_t v76 = v92;
      unint64_t v74 = v93;
      char v77 = (char)v89;
      uint64_t v70 = v99;
      uint64_t v69 = v95;
      unint64_t v71 = (unint64_t)v101;
      unsigned int v72 = HIDWORD(v94);
      goto LABEL_37;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t result = sub_1148C(v59);
  unsigned int v72 = v65;
  unsigned int v65 = v96;
  uint64_t v59 = v90;
  uint64_t v61 = v91;
  uint64_t v70 = v92;
  unint64_t v71 = v93;
  uint64_t v69 = v95;
LABEL_36:
  unint64_t v74 = v97;
  uint64_t v73 = v98;
  os_log_type_t v75 = v100;
  uint64_t v76 = v103;
  char v77 = v94;
LABEL_37:
  *(void *)a4 = v57;
  *(void *)(a4 + 8) = v69;
  *(void *)(a4 + 16) = v58;
  *(void *)(a4 + 24) = v63;
  *(void *)(a4 + 32) = v65;
  *(void *)(a4 + 40) = v59;
  *(void *)(a4 + 48) = v61;
  *(void *)(a4 + 56) = v70;
  *(void *)(a4 + 64) = v71;
  *(void *)(a4 + 72) = v72;
  *(void *)(a4 + 80) = v73;
  *(void *)(a4 + 88) = v75;
  *(void *)(a4 + 96) = v76;
  *(void *)(a4 + 104) = v74;
  *(unsigned char *)(a4 + 112) = v77;
  return result;
}

uint64_t sub_231A4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  LODWORD(v5) = 0;
  uint64_t v6 = 0;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  while ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      v16[0] = a1;
      v16[1] = v7;
      int v9 = *((unsigned __int8 *)v16 + v6);
      if (*((char *)v16 + v6) < 0)
      {
        switch(__clz(v9 ^ 0xFF))
        {
          case 0x1Au:
            double v12 = (char *)v16 + v6;
LABEL_19:
            uint64_t v10 = 2;
            int v9 = v12[1] & 0x3F | ((v9 & 0x1F) << 6);
            break;
          case 0x1Bu:
            uint64_t v13 = (char *)v16 + v6;
LABEL_23:
            int v9 = ((v9 & 0xF) << 12) | ((v13[1] & 0x3F) << 6) | v13[2] & 0x3F;
            uint64_t v10 = 3;
            break;
          case 0x1Cu:
            unint64_t v14 = (char *)v16 + v6;
LABEL_25:
            int v9 = ((v9 & 0xF) << 18) | ((v14[1] & 0x3F) << 12) | ((v14[2] & 0x3F) << 6) | v14[3] & 0x3F;
            uint64_t v10 = 4;
            break;
          default:
            goto LABEL_16;
        }
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v11 = v8;
      if ((a1 & 0x1000000000000000) == 0) {
        uint64_t v11 = sub_3F2B8();
      }
      int v9 = *(unsigned __int8 *)(v11 + v6);
      if (*(char *)(v11 + v6) < 0)
      {
        switch(__clz(v9 ^ 0xFF))
        {
          case 0x1Au:
            double v12 = (char *)(v6 + v11);
            goto LABEL_19;
          case 0x1Bu:
            uint64_t v13 = (char *)(v6 + v11);
            goto LABEL_23;
          case 0x1Cu:
            unint64_t v14 = (char *)(v6 + v11);
            goto LABEL_25;
          default:
            break;
        }
      }
    }
LABEL_16:
    uint64_t v10 = 1;
LABEL_7:
    v6 += v10;
    uint64_t v5 = (v9 - v5 + 32 * v5);
    if (v6 >= v2) {
      return v5;
    }
  }
  int v9 = sub_3F228();
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_7;
  }
  __break(1u);
  return 0;
}

unint64_t sub_233A0(int a1, uint64_t a2, uint64_t a3)
{
  sub_226EC(a1, a2, a3, (uint64_t)v31);
  sub_24418((uint64_t)v31, (uint64_t)v32, &qword_53720);
  if (*(void *)&v32[0] != 1)
  {
    long long v38 = v32[4];
    long long v39 = v32[5];
    long long v40 = v32[6];
    char v41 = v33;
    long long v34 = v32[0];
    long long v35 = v32[1];
    long long v36 = v32[2];
    long long v37 = v32[3];
    id v14 = [self stringFromContact:v3 style:0];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = sub_3ED78();
      unint64_t v18 = v17;

      sub_231A4(v16, v18);
      swift_bridgeObjectRelease();
      sub_62C4(&qword_53728);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_40160;
      *(void *)(inited + 32) = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      *(void *)(inited + 40) = v20;
      long long v21 = v39;
      *(_OWORD *)(inited + 112) = v38;
      *(_OWORD *)(inited + 128) = v21;
      *(_OWORD *)(inited + 144) = v40;
      *(unsigned char *)(inited + 160) = v41;
      long long v22 = v35;
      *(_OWORD *)(inited + 48) = v34;
      *(_OWORD *)(inited + 64) = v22;
      long long v23 = v37;
      *(_OWORD *)(inited + 80) = v36;
      *(_OWORD *)(inited + 96) = v23;
      return sub_1F91C(inited);
    }
    sub_2447C(v31);
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_3EC68();
    sub_60E8(v25, (uint64_t)qword_57CC8);
    id v5 = v3;
    uint64_t v6 = sub_3EC48();
    os_log_type_t v7 = sub_3EFC8();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      id v26 = [v5 identifier];
      uint64_t v27 = sub_3ED78();
      unint64_t v29 = v28;

      sub_2B8C8(v27, v29, &v30);
      sub_3F088();

      swift_bridgeObjectRelease();
      uint64_t v13 = "Unable to get full name for contact %s";
      goto LABEL_12;
    }
LABEL_13:

    return 0;
  }
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_3EC68();
  sub_60E8(v4, (uint64_t)qword_57CC8);
  id v5 = v3;
  uint64_t v6 = sub_3EC48();
  os_log_type_t v7 = sub_3EFC8();
  if (!os_log_type_enabled(v6, v7)) {
    goto LABEL_13;
  }
  uint64_t v8 = (uint8_t *)swift_slowAlloc();
  *(void *)&long long v34 = swift_slowAlloc();
  *(_DWORD *)uint64_t v8 = 136315138;
  id v9 = [v5 identifier];
  uint64_t v10 = sub_3ED78();
  unint64_t v12 = v11;

  uint64_t v30 = sub_2B8C8(v10, v12, (uint64_t *)&v34);
  sub_3F088();

  swift_bridgeObjectRelease();
  uint64_t v13 = "Unable to build phonemeData for contact: %s";
LABEL_12:
  _os_log_impl(&dword_0, v6, v7, v13, v8, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return 0;
}

id sub_237F0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v103 = a4;
  uint64_t v105 = a1;
  uint64_t v6 = sub_3EA38();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unsigned __int8 v106 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v112 = (char *)&v93 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v93 - v12;
  if (qword_52778 != -1) {
    goto LABEL_74;
  }
  while (1)
  {
    uint64_t v14 = qword_57CC0;
    uint64_t v15 = v4 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    uint64_t v16 = *(void *)(qword_57CC0 + 16);
    uint64_t v113 = v6;
    uint64_t v111 = v16;
    uint64_t v107 = a3;
    if (!v16)
    {
      LODWORD(v108) = 3;
      goto LABEL_15;
    }
    unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    Swift::String v110 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v110(v13, qword_57CC0 + v17, v6);
    uint64_t v18 = sub_224F8((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
    swift_bridgeObjectRetain();
    uint64_t v109 = v18;
    char v19 = sub_3ED28();
    a3 = v7 + 8;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v7 + 8);
    v20(v13, v6);
    if (v19)
    {
      swift_bridgeObjectRelease();
      LODWORD(v108) = 2;
      goto LABEL_14;
    }
    unint64_t v102 = v14;
    if (v111 == 1) {
      break;
    }
    uint64_t v104 = v7;
    uint64_t v108 = *(void *)(v7 + 72);
    unint64_t v21 = v102 + v108 + v17;
    uint64_t v7 = 1;
    while (1)
    {
      v110(v13, v21, v6);
      uint64_t v4 = v6;
      uint64_t v6 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        break;
      }
      uint64_t v22 = v15;
      char v23 = sub_3ED28();
      v20(v13, v4);
      if (v23)
      {
        swift_bridgeObjectRelease();
        LODWORD(v108) = 2;
        uint64_t v6 = v113;
        uint64_t v7 = v104;
        a3 = v107;
        uint64_t v15 = v22;
        goto LABEL_15;
      }
      ++v7;
      v21 += v108;
      BOOL v24 = v6 == v111;
      uint64_t v6 = v113;
      uint64_t v15 = v22;
      if (v24)
      {
        swift_bridgeObjectRelease();
        LODWORD(v108) = 3;
        uint64_t v7 = v104;
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    swift_once();
  }
  swift_bridgeObjectRelease();
  LODWORD(v108) = 3;
LABEL_14:
  a3 = v107;
LABEL_15:
  uint64_t v25 = qword_57CC0;
  uint64_t v111 = *(void *)(qword_57CC0 + 16);
  if (!v111) {
    goto LABEL_20;
  }
  unint64_t v102 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  id v26 = v112;
  Swift::String v110 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
  v110(v112, qword_57CC0 + v102, v6);
  sub_224F8((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
  swift_bridgeObjectRetain();
  uint64_t v109 = v15;
  char v27 = sub_3ED28();
  unint64_t v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v28(v26, v6);
  if ((v27 & 1) == 0)
  {
    uint64_t v101 = v25;
    if (v111 != 1)
    {
      uint64_t v104 = v7;
      uint64_t v13 = *(char **)(v7 + 72);
      uint64_t v31 = &v13[v101 + v102];
      a3 = 1;
      while (1)
      {
        uint64_t v7 = (uint64_t)v112;
        v110(v112, (unint64_t)v31, v6);
        uint64_t v4 = v6;
        uint64_t v6 = a3 + 1;
        if (__OFADD__(a3, 1)) {
          goto LABEL_73;
        }
        char v32 = sub_3ED28();
        uint64_t v33 = v7;
        char v34 = v32;
        v28((char *)v33, v4);
        if (v34) {
          break;
        }
        ++a3;
        uint64_t v31 = &v13[(void)v31];
        BOOL v24 = v6 == v111;
        uint64_t v6 = v113;
        if (v24)
        {
          swift_bridgeObjectRelease();
          uint64_t v30 = 0;
          unint64_t v29 = 0xE000000000000000;
LABEL_29:
          uint64_t v7 = v104;
          a3 = v107;
          goto LABEL_30;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v29 = 0xE100000000000000;
      uint64_t v30 = 32;
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v30 = 0;
    unint64_t v29 = 0xE000000000000000;
    goto LABEL_30;
  }
  swift_bridgeObjectRelease();
  unint64_t v29 = 0xE100000000000000;
  uint64_t v30 = 32;
LABEL_30:
  uint64_t v35 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v37 = v105;
  long long v38 = (SEL *)&unk_51000;
  if (*(void *)(v105 + 16))
  {
    unint64_t v39 = sub_34AD0(v35, v36);
    if (v40)
    {
      uint64_t v94 = v30;
      unint64_t v102 = v29;
      uint64_t v104 = v7;
      uint64_t v41 = *(void *)(v37 + 56) + 120 * v39;
      unint64_t v43 = *(void **)v41;
      uint64_t v42 = *(void *)(v41 + 8);
      uint64_t v44 = *(void *)(v41 + 16);
      uint64_t v45 = *(void *)(v41 + 24);
      int v46 = *(unsigned __int8 *)(v41 + 32);
      uint64_t v47 = *(void *)(v41 + 40);
      uint64_t v48 = *(void *)(v41 + 48);
      uint64_t v50 = *(void *)(v41 + 56);
      uint64_t v49 = *(void *)(v41 + 64);
      LODWORD(v112) = *(unsigned __int8 *)(v41 + 72);
      id v95 = *(void **)(v41 + 80);
      unint64_t v52 = *(void *)(v41 + 96);
      uint64_t v51 = *(void *)(v41 + 104);
      int v53 = *(unsigned __int8 *)(v41 + 112);
      uint64_t v100 = v42;
      uint64_t v99 = v44;
      uint64_t v98 = v45;
      int v97 = v46;
      sub_11390((uint64_t)v43);
      uint64_t v96 = (void *)v47;
      uint64_t v109 = v48;
      uint64_t v105 = v50;
      uint64_t v101 = v49;
      unint64_t v54 = v95;
      sub_11390(v47);
      unint64_t v55 = v52;
      uint64_t v111 = v51;
      LODWORD(v110) = v53;
      sub_11390((uint64_t)v54);
      swift_bridgeObjectRelease();
      if (v43)
      {
        swift_bridgeObjectRetain();
        long long v38 = (SEL *)&unk_51000;
        if (v43[2])
        {
          uint64_t v56 = v43[6];
          id v57 = (id)v43[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          unint64_t v58 = v102;
          uint64_t v59 = v96;
          if (v57)
          {
            uint64_t v93 = v56;
            long long v38 = (SEL *)&unk_51000;
            if ((_BYTE)v103)
            {
              char v60 = sub_3F5A8();
              swift_bridgeObjectRelease();
              unint64_t v61 = v55;
              if ((v60 & 1) == 0)
              {
                swift_bridgeObjectRelease();
                id v57 = 0;
                if (!v59) {
                  goto LABEL_54;
                }
LABEL_44:
                swift_bridgeObjectRetain();
                if (v59[2])
                {
                  uint64_t v96 = v43;
                  unint64_t v102 = v61;
                  uint64_t v64 = v59[6];
                  uint64_t v65 = v59[7];
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (!v65)
                  {
                    swift_bridgeObjectRelease();
                    id v63 = 0;
                    unint64_t v43 = v96;
                    goto LABEL_58;
                  }
                  uint64_t v93 = v64;
                  if ((_BYTE)v103 && v103 == 1)
                  {
                    swift_bridgeObjectRelease();
                    unint64_t v43 = v96;
                  }
                  else
                  {
                    unint64_t v43 = v96;
                    char v70 = sub_3F5A8();
                    swift_bridgeObjectRelease();
                    if ((v70 & 1) == 0)
                    {
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      id v63 = 0;
LABEL_58:
                      sub_11390((uint64_t)v54);
                      sub_1148C((uint64_t)v43);
                      sub_1148C((uint64_t)v59);
                      sub_1148C((uint64_t)v54);
                      if (!v54)
                      {
LABEL_67:
                        id v62 = 0;
                        goto LABEL_68;
                      }
                      swift_bridgeObjectRelease();
                      if (v54[2])
                      {
                        uint64_t v75 = v54[6];
                        id v62 = (id)v54[7];
                        swift_bridgeObjectRetain();
                        swift_bridgeObjectRetain();
                        swift_bridgeObjectRetain();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        if (!v62)
                        {
LABEL_68:
                          uint64_t v7 = v104;
                          a3 = v107;
                          goto LABEL_69;
                        }
                        if ((_BYTE)v103 && v103 != 1)
                        {
                          swift_bridgeObjectRelease();
                        }
                        else
                        {
                          char v76 = sub_3F5A8();
                          swift_bridgeObjectRelease();
                          if ((v76 & 1) == 0) {
                            goto LABEL_66;
                          }
                        }
                        unsigned int v89 = (objc_class *)type metadata accessor for PhonemeString();
                        uint64_t v90 = objc_allocWithZone(v89);
                        uint64_t v91 = &v90[OBJC_IVAR___PhonemeString_symbols];
                        *uint64_t v91 = v75;
                        v91[1] = v62;
                        v90[OBJC_IVAR___PhonemeString_encoding] = v108;
                        uint64_t v92 = &v90[OBJC_IVAR___PhonemeString_boundary];
                        *uint64_t v92 = 0;
                        v92[1] = 0xE000000000000000;
                        v116.receiver = v90;
                        v116.super_class = v89;
                        id v62 = objc_msgSendSuper2(&v116, v38[472]);
                        goto LABEL_68;
                      }
LABEL_66:
                      swift_bridgeObjectRelease();
                      goto LABEL_67;
                    }
                  }
                  unint64_t v71 = (objc_class *)type metadata accessor for PhonemeString();
                  unsigned int v72 = objc_allocWithZone(v71);
                  uint64_t v73 = &v72[OBJC_IVAR___PhonemeString_symbols];
                  *uint64_t v73 = v93;
                  v73[1] = v65;
                  v72[OBJC_IVAR___PhonemeString_encoding] = v108;
                  unint64_t v74 = (uint64_t *)&v72[OBJC_IVAR___PhonemeString_boundary];
                  *unint64_t v74 = v94;
                  v74[1] = v58;
                  v115.receiver = v72;
                  v115.super_class = v71;
                  id v63 = objc_msgSendSuper2(&v115, v38[472]);
                  goto LABEL_58;
                }
                swift_bridgeObjectRelease();
LABEL_54:
                swift_bridgeObjectRelease();
                id v63 = 0;
                goto LABEL_58;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              unint64_t v61 = v55;
            }
            char v66 = (objc_class *)type metadata accessor for PhonemeString();
            char v67 = objc_allocWithZone(v66);
            NSString v68 = &v67[OBJC_IVAR___PhonemeString_symbols];
            *NSString v68 = v93;
            v68[1] = v57;
            v67[OBJC_IVAR___PhonemeString_encoding] = v108;
            uint64_t v69 = (uint64_t *)&v67[OBJC_IVAR___PhonemeString_boundary];
            uint64_t *v69 = v94;
            v69[1] = v58;
            v114.receiver = v67;
            v114.super_class = v66;
            swift_bridgeObjectRetain();
            id v57 = objc_msgSendSuper2(&v114, "init");
            if (!v59) {
              goto LABEL_54;
            }
            goto LABEL_44;
          }
          long long v38 = (SEL *)&unk_51000;
LABEL_43:
          unint64_t v61 = v55;
          if (!v59) {
            goto LABEL_54;
          }
          goto LABEL_44;
        }
        swift_bridgeObjectRelease();
        id v57 = 0;
      }
      else
      {
        id v57 = 0;
        long long v38 = (SEL *)&unk_51000;
      }
      unint64_t v58 = v102;
      uint64_t v59 = v96;
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v62 = 0;
  id v63 = 0;
  id v57 = 0;
LABEL_69:
  char v77 = v106;
  uint64_t v78 = v113;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v106, a3, v113);
  uint64_t v79 = (objc_class *)type metadata accessor for CorrectedPronunciation();
  char v80 = (char *)objc_allocWithZone(v79);
  uint64_t v81 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v82 = (uint64_t *)&v80[OBJC_IVAR___CorrectedPronunciation_locale];
  *uint64_t v82 = v81;
  v82[1] = v83;
  *(void *)&v80[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = v57;
  *(void *)&v80[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = v63;
  *(void *)&v80[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = v62;
  id v84 = v62;
  id v85 = v57;
  id v86 = v63;

  v117.receiver = v80;
  v117.super_class = v79;
  id v87 = objc_msgSendSuper2(&v117, v38[472]);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v77, v78);

  return v87;
}

uint64_t sub_24418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_62C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_2447C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_244D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (result != 1)
  {
    sub_1148C(result);
    sub_1148C(a6);
    return sub_1148C(a11);
  }
  return result;
}

void *sub_2457C(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[12];
  swift_bridgeObjectRetain();
  sub_11390(v2);
  sub_11390(v4);
  sub_11390(v5);
  return a1;
}

uint64_t sub_2464C(uint64_t a1)
{
  return a1;
}

uint64_t sub_24678(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_62C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_246DC(uint64_t a1)
{
  return sub_2470C(a1, (void (*)(void))&type metadata accessor for ASRBestRawRecognitionUtterance);
}

uint64_t sub_246F4(uint64_t a1)
{
  return sub_2470C(a1, (void (*)(void))&type metadata accessor for ASRBestRawRecognitionPhonemes);
}

uint64_t sub_2470C(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_26030(v4, (uint64_t)&v7);
      sub_26030((uint64_t)&v7, (uint64_t)v9);
      sub_62C4(&qword_532F8);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_66DC((uint64_t)&v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_26094(&v7, (uint64_t)v9);
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_24678((uint64_t)v9, (uint64_t)&v7, &qword_53840);
  if (!v8)
  {
    sub_DCD4((uint64_t)&v7, &qword_53840);
    goto LABEL_12;
  }
  sub_62C4(&qword_532F8);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_3E8B8();
  swift_release_n();
  uint64_t v5 = v7;
LABEL_13:
  sub_DCD4((uint64_t)v9, &qword_53840);
  return v5;
}

uint64_t sub_2489C(uint64_t a1)
{
  return sub_2470C(a1, (void (*)(void))&type metadata accessor for ASRBestRawRecognitionConfidence);
}

uint64_t sub_248B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_26030(v2, (uint64_t)&v5);
      sub_26030((uint64_t)&v5, (uint64_t)v7);
      sub_62C4(&qword_532F8);
      sub_3EAB8();
      if (swift_dynamicCast()) {
        break;
      }
      sub_66DC((uint64_t)&v5);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_26094(&v5, (uint64_t)v7);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  sub_24678((uint64_t)v7, (uint64_t)&v5, &qword_53840);
  if (!v6)
  {
    sub_DCD4((uint64_t)&v5, &qword_53840);
    goto LABEL_12;
  }
  sub_62C4(&qword_532F8);
  sub_3EAB8();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_3E8B8();
  swift_release_n();
  uint64_t v3 = v5;
LABEL_13:
  sub_DCD4((uint64_t)v7, &qword_53840);
  return v3;
}

uint64_t sub_24A44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_26030(v2, (uint64_t)&v5);
      sub_26030((uint64_t)&v5, (uint64_t)v7);
      sub_62C4(&qword_532F8);
      sub_3EA48();
      if (swift_dynamicCast()) {
        break;
      }
      sub_66DC((uint64_t)&v5);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_26094(&v5, (uint64_t)v7);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  sub_24678((uint64_t)v7, (uint64_t)&v5, &qword_53840);
  if (!v6)
  {
    sub_DCD4((uint64_t)&v5, &qword_53840);
    goto LABEL_12;
  }
  sub_62C4(&qword_532F8);
  sub_3EA48();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_3E8B8();
  swift_release_n();
  uint64_t v3 = v5;
LABEL_13:
  sub_DCD4((uint64_t)v7, &qword_53840);
  return v3;
}

uint64_t sub_24BD4()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for PostSiriEngagementDataProcessor()
{
  return self;
}

uint64_t sub_24C08(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = a1;
  uint64_t v3 = sub_3E558();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  long long v7 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v46 - v8;
  uint64_t v10 = sub_3E798();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a2 + 16);
  if (!v14)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_3EC68();
    sub_60E8(v28, (uint64_t)qword_57CC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v50, v3);
    unint64_t v29 = sub_3EC48();
    os_log_type_t v30 = sub_3EFC8();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      sub_DB78();
      uint64_t v32 = sub_3F598();
      uint64_t v53 = sub_2B8C8(v32, v33, &v54);
      sub_3F088();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      _os_log_impl(&dword_0, v29, v30, "Conversation %s has 0 turns in it", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    return 2;
  }
  uint64_t v49 = v9;
  uint64_t v15 = *(void *)(a2 + 16 * v14 + 24);
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v47 = v4;
    uint64_t v48 = v3;
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v17 = v11 + 16;
    uint64_t v19 = v15 + ((*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64));
    uint64_t v51 = *(void *)(v17 + 56);
    unint64_t v52 = v18;
    uint64_t v20 = (void (**)(char *, uint64_t))(v17 - 8);
    v46[1] = v15;
    swift_bridgeObjectRetain_n();
    unint64_t v21 = _swiftEmptyArrayStorage;
    while (1)
    {
      v52(v13, v19, v10);
      uint64_t v22 = (void *)sub_3E788();
      id v23 = [v22 intent];

      self;
      uint64_t v24 = swift_dynamicCastObjCClass();
      if (v24) {
        break;
      }
      self;
      uint64_t v25 = swift_dynamicCastObjCClass();

      if (v25) {
        goto LABEL_9;
      }
      (*v20)(v13, v10);
LABEL_5:
      v19 += v51;
      if (!--v16)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v4 = v47;
        uint64_t v3 = v48;
        goto LABEL_20;
      }
    }

LABEL_9:
    (*v20)(v13, v10);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v21 = sub_1774C(0, v21[2] + 1, 1, v21);
    }
    unint64_t v27 = v21[2];
    unint64_t v26 = v21[3];
    if (v27 >= v26 >> 1) {
      unint64_t v21 = sub_1774C((void *)(v26 > 1), v27 + 1, 1, v21);
    }
    v21[2] = v27 + 1;
    *((unsigned char *)v21 + v27 + 32) = v24 == 0;
    goto LABEL_5;
  }
  unint64_t v21 = _swiftEmptyArrayStorage;
LABEL_20:
  uint64_t v34 = swift_bridgeObjectRetain();
  uint64_t v35 = sub_39484(v34);
  swift_bridgeObjectRelease();
  unint64_t v36 = *(void *)(v35 + 16);
  swift_bridgeObjectRelease();
  uint64_t v37 = v49;
  if (v36 > 1)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_3EC68();
    sub_60E8(v38, (uint64_t)qword_57CC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v37, v50, v3);
    unint64_t v39 = sub_3EC48();
    os_log_type_t v40 = sub_3EFC8();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      unint64_t v52 = (void (*)(char *, uint64_t, uint64_t))(v41 + 4);
      sub_DB78();
      uint64_t v42 = sub_3F598();
      uint64_t v53 = sub_2B8C8(v42, v43, &v54);
      sub_3F088();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v37, v3);
      _os_log_impl(&dword_0, v39, v40, "Conversation %s is linked with multiple domains", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v37, v3);
    }
  }
  if (!v21[2])
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  uint64_t v44 = *((unsigned __int8 *)v21 + 32);
  swift_bridgeObjectRelease();
  return v44;
}

uint64_t sub_252C0(char *a1, uint64_t a2, int a3)
{
  LODWORD(v105) = a3;
  unsigned __int8 v106 = a1;
  uint64_t v4 = sub_3E558();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v107 = v4;
  uint64_t v108 = v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v99 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  unint64_t v102 = (char *)&v99 - v13;
  __chkstk_darwin(v12);
  uint64_t v101 = (char *)&v99 - v14;
  uint64_t v15 = sub_62C4(&qword_53830);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_62C4(&qword_53838);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_3EA98();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v99 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v23);
  uint64_t v104 = (char *)&v99 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  int v103 = (char *)&v99 - v29;
  __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v99 - v30;
  sub_24678(a2, (uint64_t)v20, &qword_53838);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_DCD4((uint64_t)v20, &qword_53838);
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_3EC68();
    sub_60E8(v32, (uint64_t)qword_57CC8);
    uint64_t v34 = v107;
    uint64_t v33 = v108;
    (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v8, v106, v107);
    uint64_t v35 = sub_3EC48();
    os_log_type_t v36 = sub_3EFC8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v110 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      sub_DB78();
      uint64_t v38 = sub_3F598();
      uint64_t v109 = sub_2B8C8(v38, v39, &v110);
      sub_3F088();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v34);
      _os_log_impl(&dword_0, v35, v36, "[%s]: No event found for extraction of features", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v34);
    }

    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v31, v20, v21);
  uint64_t v40 = sub_3EA88();
  uint64_t v41 = sub_2470C(v40, (void (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease();
  uint64_t v42 = v31;
  uint64_t v100 = v21;
  if (v41)
  {
    uint64_t v43 = v22;
    uint64_t v44 = *(void *)(v41 + 16);
    uint64_t v45 = sub_3EAD8();
    uint64_t v46 = *(void *)(v45 - 8);
    if (v44)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v45 - 8) + 16))(v17, v41+ ((*(unsigned __int8 *)(*(void *)(v45 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v45 - 8) + 80)), v45);
      uint64_t v47 = 0;
    }
    else
    {
      uint64_t v47 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v17, v47, 1, v45);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v17, 1, v45) == 1)
    {
      sub_DCD4((uint64_t)v17, &qword_53830);
      uint64_t v22 = v43;
      uint64_t v21 = v100;
      uint64_t v42 = v31;
      goto LABEL_18;
    }
    uint64_t v48 = sub_3EAC8();
    uint64_t v50 = v49;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v45);
    uint64_t v22 = v43;
    uint64_t v21 = v100;
    uint64_t v42 = v31;
    if (v50)
    {
      uint64_t v51 = sub_3EA88();
      if (v105)
      {
        sub_24A44(v51);
        char v72 = v71;
        swift_bridgeObjectRelease();
        uint64_t v73 = v108;
        if ((v72 & 1) == 0)
        {
LABEL_29:
          (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v21);
          return v48;
        }
        swift_bridgeObjectRelease();
        if (qword_527A8 != -1) {
          swift_once();
        }
        uint64_t v88 = sub_3EC68();
        sub_60E8(v88, (uint64_t)qword_57CC8);
        unsigned int v89 = v102;
        uint64_t v90 = v107;
        (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v102, v106, v107);
        uint64_t v91 = v104;
        (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v104, v31, v21);
        char v76 = sub_3EC48();
        os_log_type_t v92 = sub_3EFB8();
        int v93 = v92;
        if (!os_log_type_enabled(v76, v92))
        {

          NSString v68 = *(void (**)(char *, uint64_t))(v22 + 8);
          v68(v91, v21);
          (*(void (**)(char *, uint64_t))(v73 + 8))(v89, v90);
          goto LABEL_24;
        }
        uint64_t v79 = swift_slowAlloc();
        uint64_t v105 = swift_slowAlloc();
        uint64_t v110 = v105;
        *(_DWORD *)uint64_t v79 = 136315394;
        unsigned __int8 v106 = v42;
        sub_DB78();
        LODWORD(v103) = v93;
        uint64_t v94 = sub_3F598();
        uint64_t v109 = sub_2B8C8(v94, v95, &v110);
        sub_3F088();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v73 + 8))(v89, v90);
        *(_WORD *)(v79 + 12) = 2080;
        uint64_t v96 = v104;
        uint64_t v97 = sub_3EA78();
        uint64_t v109 = sub_2B8C8(v97, v98, &v110);
        sub_3F088();
        swift_bridgeObjectRelease();
        NSString v68 = *(void (**)(char *, uint64_t))(v22 + 8);
        v68(v96, v21);
        id v85 = "[%s]: Failed to get message handling status for core duet event: %s";
        id v86 = v76;
        os_log_type_t v87 = v103;
      }
      else
      {
        sub_248B4(v51);
        char v53 = v52;
        swift_bridgeObjectRelease();
        uint64_t v54 = v108;
        if ((v53 & 1) == 0) {
          goto LABEL_29;
        }
        swift_bridgeObjectRelease();
        if (qword_527A8 != -1) {
          swift_once();
        }
        uint64_t v74 = sub_3EC68();
        sub_60E8(v74, (uint64_t)qword_57CC8);
        uint64_t v11 = v101;
        uint64_t v56 = v107;
        (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v101, v106, v107);
        uint64_t v75 = v103;
        (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v103, v31, v21);
        char v76 = sub_3EC48();
        os_log_type_t v77 = sub_3EFB8();
        int v78 = v77;
        if (!os_log_type_enabled(v76, v77))
        {

          NSString v68 = *(void (**)(char *, uint64_t))(v22 + 8);
          v68(v75, v21);
          goto LABEL_23;
        }
        uint64_t v79 = swift_slowAlloc();
        uint64_t v105 = swift_slowAlloc();
        uint64_t v110 = v105;
        *(_DWORD *)uint64_t v79 = 136315394;
        unsigned __int8 v106 = v42;
        sub_DB78();
        LODWORD(v104) = v78;
        uint64_t v80 = sub_3F598();
        uint64_t v109 = sub_2B8C8(v80, v81, &v110);
        sub_3F088();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v56);
        *(_WORD *)(v79 + 12) = 2080;
        uint64_t v82 = v103;
        uint64_t v83 = sub_3EA78();
        uint64_t v109 = sub_2B8C8(v83, v84, &v110);
        sub_3F088();
        swift_bridgeObjectRelease();
        NSString v68 = *(void (**)(char *, uint64_t))(v22 + 8);
        v68(v82, v21);
        id v85 = "[%s]: Failed to get call duration for core duet event: %s";
        id v86 = v76;
        os_log_type_t v87 = v104;
      }
      _os_log_impl(&dword_0, v86, v87, v85, (uint8_t *)v79, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v69 = v106;
      goto LABEL_25;
    }
  }
LABEL_18:
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v55 = sub_3EC68();
  sub_60E8(v55, (uint64_t)qword_57CC8);
  uint64_t v56 = v107;
  uint64_t v54 = v108;
  (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v11, v106, v107);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v42, v21);
  id v57 = sub_3EC48();
  os_log_type_t v58 = sub_3EFB8();
  int v59 = v58;
  if (!os_log_type_enabled(v57, v58))
  {

    NSString v68 = *(void (**)(char *, uint64_t))(v22 + 8);
    v68(v25, v21);
LABEL_23:
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v56);
LABEL_24:
    uint64_t v69 = v42;
LABEL_25:
    v68(v69, v21);
    return 0;
  }
  uint64_t v60 = swift_slowAlloc();
  uint64_t v105 = swift_slowAlloc();
  unsigned __int8 v106 = v42;
  uint64_t v110 = v105;
  *(_DWORD *)uint64_t v60 = 136315394;
  sub_DB78();
  LODWORD(v104) = v59;
  uint64_t v61 = sub_3F598();
  uint64_t v109 = sub_2B8C8(v61, v62, &v110);
  sub_3F088();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v56);
  *(_WORD *)(v60 + 12) = 2080;
  uint64_t v63 = sub_3EA78();
  uint64_t v109 = sub_2B8C8(v63, v64, &v110);
  sub_3F088();
  swift_bridgeObjectRelease();
  uint64_t v65 = *(void (**)(char *, uint64_t))(v22 + 8);
  char v66 = v25;
  uint64_t v67 = v100;
  v65(v66, v100);
  _os_log_impl(&dword_0, v57, (os_log_type_t)v104, "[%s]: Failed to get call contact ID for core duet event: %s", (uint8_t *)v60, 0x16u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  v65(v106, v67);
  return 0;
}

uint64_t sub_26030(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_26094(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_260AC@<X0>(uint64_t *a1@<X8>)
{
  sub_3E848();
  sub_3E838();
  sub_3E808();
  swift_release();
  long long v8 = v10;
  uint64_t v2 = v10;
  long long v3 = sub_6280(&v9, v10);
  *(_OWORD *)&v11[3] = v8;
  uint64_t v4 = sub_2C320(v11);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(v4, v3, v2);
  sub_66DC((uint64_t)&v9);
  sub_3E838();
  sub_3E828();
  swift_release();
  uint64_t v5 = type metadata accessor for SiriConversationReader();
  uint64_t v6 = swift_allocObject();
  sub_26094((long long *)v11, v6 + 16);
  uint64_t result = sub_26094(&v9, v6 + 56);
  a1[3] = v5;
  a1[4] = (uint64_t)&off_4E098;
  *a1 = v6;
  return result;
}

uint64_t sub_261C8@<X0>(void *a1@<X8>)
{
  sub_265A0(v27);
  type metadata accessor for PostSiriEngagementDataProcessor();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0x4014000000000000;
  sub_62C4(&qword_53A00);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_40AF0;
  uint64_t v4 = sub_3EB68();
  swift_allocObject();
  uint64_t v5 = sub_3EB58();
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = sub_2C884(&qword_53A08, (void (*)(uint64_t))&type metadata accessor for INStartCallIntentFeatureExtractor);
  *(void *)(v3 + 32) = v5;
  uint64_t v6 = sub_3EB88();
  swift_allocObject();
  uint64_t v7 = sub_3EB78();
  *(void *)(v3 + 96) = v6;
  *(void *)(v3 + 104) = sub_2C884(&qword_53A10, (void (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor);
  *(void *)(v3 + 72) = v7;
  uint64_t v8 = sub_3EB48();
  swift_allocObject();
  uint64_t v9 = sub_3EB38();
  *(void *)(v3 + 136) = v8;
  *(void *)(v3 + 144) = sub_2C884(&qword_53A18, (void (*)(uint64_t))&type metadata accessor for CommonInteractionFeatureExtractor);
  *(void *)(v3 + 112) = v9;
  sub_62C4(&qword_52BE0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_41C30;
  sub_3EB08();
  swift_allocObject();
  *(void *)(v10 + 32) = sub_3EAF8();
  sub_3EB28();
  swift_allocObject();
  *(void *)(v10 + 40) = sub_3EB18();
  v26[0] = v10;
  sub_3EED8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2B524((uint64_t)v27, v27[3]);
  __chkstk_darwin(v12);
  uint64_t v14 = (void *)((char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  uint64_t v16 = *v14;
  uint64_t v17 = type metadata accessor for ASRLoggedContactTokensProcessor();
  v26[3] = v17;
  v26[4] = &off_4DB80;
  v26[0] = v16;
  uint64_t v18 = type metadata accessor for ConversationDataProcessor();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = sub_2B524((uint64_t)v26, v17);
  __chkstk_darwin(v20);
  uint64_t v22 = (void *)((char *)v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = *v22;
  v19[5] = v17;
  v19[6] = &off_4DB80;
  v19[2] = v24;
  v19[7] = v2;
  v19[8] = v3;
  v19[9] = v11;
  sub_66DC((uint64_t)v26);
  uint64_t result = sub_66DC((uint64_t)v27);
  a1[3] = v18;
  a1[4] = &off_4EE28;
  *a1 = v19;
  return result;
}

uint64_t sub_265A0@<X0>(void *a1@<X8>)
{
  sub_3E8E8();
  swift_allocObject();
  uint64_t v2 = sub_3E8D8();
  sub_3E5F8();
  swift_allocObject();
  sub_3E5E8();
  uint64_t v3 = type metadata accessor for ASRLoggedContactTokensProcessor();
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = v2;
  swift_retain();
  sub_3E628();
  v4[3] = v5;
  sub_3E678();
  uint64_t v7 = v6;
  swift_release();
  v4[4] = v7;
  uint64_t result = swift_release();
  a1[3] = v3;
  a1[4] = &off_4DB80;
  *a1 = v4;
  return result;
}

uint64_t sub_266AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  sub_62C4(&qword_539B8);
  v3[5] = swift_task_alloc();
  uint64_t v5 = sub_3E748();
  v3[6] = v5;
  v3[7] = *(void *)(v5 - 8);
  v3[8] = swift_task_alloc();
  uint64_t v6 = sub_62C4(&qword_53998);
  v3[9] = v6;
  v3[10] = *(void *)(v6 - 8);
  v3[11] = swift_task_alloc();
  uint64_t v7 = sub_62C4(&qword_539C0);
  v3[12] = v7;
  v3[13] = *(void *)(v7 - 8);
  v3[14] = swift_task_alloc();
  v3[2] = a1;
  return _swift_task_switch(sub_26864, 0, 0);
}

uint64_t sub_26864()
{
  (*(void (**)(void, void, void))(v0[10] + 16))(v0[11], v0[3], v0[9]);
  sub_2C618(&qword_539C8, &qword_53998);
  sub_3EF58();
  uint64_t v1 = sub_2C618(&qword_539D0, &qword_539C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_269A0;
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[5];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v3, v1);
}

uint64_t sub_269A0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[13];
    uint64_t v3 = v2[14];
    uint64_t v5 = v2[12];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_26C7C;
  }
  else
  {
    uint64_t v6 = sub_26AE4;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_26AE4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[5];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
    sub_DCD4(v3, &qword_539B8);
    swift_release();
    uint64_t v4 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
    return v5(v4);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[8], v3, v1);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[17] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_26D1C;
    uint64_t v8 = v0[8];
    uint64_t v9 = v0[4];
    return sub_C410((uint64_t)(v0 + 2), v8, v9);
  }
}

uint64_t sub_26C7C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_26D1C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[13];
    uint64_t v3 = v2[14];
    uint64_t v5 = v2[12];
    uint64_t v7 = v2[7];
    uint64_t v6 = v2[8];
    uint64_t v8 = v2[6];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v9 = sub_26F78;
  }
  else
  {
    (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
    uint64_t v9 = sub_26EA8;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_26EA8()
{
  uint64_t v1 = sub_2C618(&qword_539D0, &qword_539C0);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_269A0;
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[5];
  return dispatch thunk of AsyncIteratorProtocol.next()(v4, v3, v1);
}

uint64_t sub_26F78()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningTTSMispronunciationPlugin.init()();
  return v0;
}

uint8_t *SiriPrivateLearningTTSMispronunciationPlugin.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3EA38();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v102 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v93 - v6;
  uint64_t v8 = sub_3E578();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_3E7D8();
  uint64_t v108 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_3E948();
  __chkstk_darwin(v12 - 8);
  type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v101 = self;
  id v14 = [v101 bundleForClass:ObjCClassFromMetadata];
  sub_3E938();
  uint64_t v15 = sub_3E968();
  swift_allocObject();
  uint64_t v16 = sub_3E958();
  uint64_t v114 = v15;
  objc_super v115 = (char **)&protocol witness table for SupportedLocalesPListStore;
  *(void *)&long long v113 = v16;
  id v17 = [self currentLocale];
  sub_3E568();

  id v18 = [self sharedPreferences];
  sub_3E7A8();
  sub_3E8A8();
  swift_allocObject();
  uint64_t v19 = v11;
  *(void *)(v1 + 344) = sub_3E888();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v104 = v7;
  uint64_t v107 = v2;
  uint64_t v20 = sub_3EC68();
  sub_60E8(v20, (uint64_t)qword_57CC8);
  swift_retain_n();
  uint64_t v21 = sub_3EC48();
  os_log_type_t v22 = sub_3EFA8();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v105 = v3;
  uint64_t v100 = v19;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v113 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315138;
    unsigned __int8 v106 = v24 + 4;
    sub_3E898();
    sub_2C884(&qword_53848, (void (*)(uint64_t))&type metadata accessor for CurrentLocales);
    uint64_t v25 = sub_3F598();
    uint64_t v26 = v9;
    unint64_t v28 = v27;
    (*(void (**)(char *, uint64_t))(v108 + 8))(v19, v26);
    v110[0] = sub_2B8C8(v25, v28, (uint64_t *)&v113);
    sub_3F088();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v21, v22, "Initialising TMDC plugin with current locale %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v29 = v26;
  }
  else
  {

    swift_release_n();
    uint64_t v29 = v9;
  }
  sub_3E9B8();
  swift_allocObject();
  sub_3E9A8();
  char v30 = sub_3E998();
  swift_release();
  uint64_t v99 = (unsigned __int8 *)(v1 + 352);
  *(unsigned char *)(v1 + 352) = v30 & 1;
  sub_260AC((uint64_t *)&v113);
  sub_261C8(v110);
  type metadata accessor for PostSiriEngagementDataProcessor();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = 0x4014000000000000;
  sub_3E848();
  sub_3E838();
  sub_3E818();
  swift_release();
  uint64_t v98 = sub_3E5F8();
  swift_allocObject();
  uint64_t v32 = sub_3E5E8();
  uint64_t v33 = sub_2B524((uint64_t)&v113, v114);
  __chkstk_darwin(v33);
  uint64_t v35 = (uint64_t *)((char *)&v93 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v36 + 16))(v35);
  uint64_t v37 = sub_2B524((uint64_t)v110, v111);
  __chkstk_darwin(v37);
  unint64_t v39 = (uint64_t *)((char *)&v93 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v40 + 16))(v39);
  uint64_t v41 = sub_2C0E4(*v35, *v39, v31, &v109, v32);
  sub_66DC((uint64_t)v110);
  sub_66DC((uint64_t)&v113);
  *(void *)(v1 + 40) = type metadata accessor for ConversationDataController();
  *(void *)(v1 + 48) = &off_4DB70;
  *(void *)(v1 + 16) = v41;
  uint64_t v42 = (uint8_t *)v1;
  uint64_t v43 = v100;
  sub_3E898();
  uint64_t v44 = v104;
  sub_3E7C8();
  int v103 = *(void (**)(char *, uint64_t))(v108 + 8);
  v108 += 8;
  v103(v43, v29);
  uint64_t v45 = type metadata accessor for TTSPhonemesGenerator();
  uint64_t v46 = swift_allocObject();
  uint64_t v47 = v105;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
  uint64_t v95 = v105 + 16;
  uint64_t v96 = v48;
  unsigned __int8 v106 = v42;
  uint64_t v49 = v107;
  v48((char *)(v46 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_currentLocale), v44, v107);
  id v50 = [objc_allocWithZone((Class)sub_3E598()) init];
  uint64_t v94 = *(void (**)(char *, uint64_t))(v47 + 8);
  v94(v44, v49);
  *(void *)(v46 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_sharedSession) = v50;
  id v51 = [objc_allocWithZone((Class)CNContactStore) init];
  uint64_t v114 = v45;
  objc_super v115 = &off_4DB90;
  *(void *)&long long v113 = v46;
  type metadata accessor for ContactPronunciationController();
  char v52 = (void *)swift_allocObject();
  uint64_t v53 = sub_2B524((uint64_t)&v113, v45);
  __chkstk_darwin(v53);
  uint64_t v55 = (uint64_t *)((char *)&v93 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v56 + 16))(v55);
  uint64_t v57 = *v55;
  v52[6] = v45;
  v52[7] = &off_4DB90;
  v52[2] = v51;
  v52[3] = v57;
  sub_66DC((uint64_t)&v113);
  *((void *)v106 + 7) = v52;
  sub_3E898();
  sub_3E7B8();
  os_log_type_t v58 = v43;
  uint64_t v97 = v29;
  v103(v43, v29);
  uint64_t v59 = type metadata accessor for PhonemesMapper();
  uint64_t v60 = swift_allocObject();
  uint64_t v61 = (char *)[v101 bundleForClass:swift_getObjCClassFromMetadata()];
  unint64_t v62 = (unint64_t)v102;
  uint64_t v63 = v107;
  v96(v102, v44, v107);
  uint64_t v64 = sub_3954C(v61, v62);
  uint64_t v65 = v63;
  char v66 = v106;
  v94(v44, v65);
  *(void *)(v60 + 16) = v64;
  *((void *)v66 + 8) = v60;
  uint64_t v67 = v59;
  *((void *)v66 + 11) = v59;
  *((void *)v66 + 12) = &off_4ED20;
  uint64_t v68 = v98;
  swift_allocObject();
  *((void *)v66 + 13) = sub_3E5E8();
  *((void *)v66 + 16) = v68;
  *((void *)v66 + 17) = &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver;
  sub_26030((uint64_t)(v66 + 104), (uint64_t)&v113);
  uint64_t v69 = type metadata accessor for P2PRunner();
  uint64_t v70 = swift_allocObject();
  sub_26094(&v113, v70 + 16);
  *((void *)v66 + 21) = v69;
  *((void *)v66 + 22) = &off_4D888;
  *((void *)v66 + 18) = v70;
  uint64_t v71 = type metadata accessor for TMDCSELFLogger();
  uint64_t v72 = swift_allocObject();
  *((void *)v66 + 26) = v71;
  *((void *)v66 + 27) = &off_4D8C0;
  *((void *)v66 + 23) = v72;
  uint8_t v73 = v66[352];
  uint64_t v74 = v58;
  if (qword_52740 != -1) {
    swift_once();
  }
  type metadata accessor for TMDCCoreDataStore();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v75 = sub_3E758();
  uint64_t v76 = type metadata accessor for TMDCCoreDataLogger();
  uint64_t v77 = swift_allocObject();
  *(void *)(v77 + 32) = 2;
  *(void *)(v77 + 16) = v75;
  *(unsigned char *)(v77 + 24) = v73;
  *((void *)v66 + 31) = v76;
  *((void *)v66 + 32) = &off_4EE18;
  *((void *)v66 + 28) = v77;
  uint64_t v114 = sub_3E928();
  objc_super v115 = (char **)&protocol witness table for EnvironmentFeatureFlags;
  sub_2C320((uint64_t *)&v113);
  sub_3E918();
  sub_26094(&v113, (uint64_t)(v66 + 264));
  sub_26030((uint64_t)(v66 + 64), (uint64_t)&v113);
  sub_3E898();
  int v78 = v104;
  sub_3E7B8();
  v103(v74, v97);
  LODWORD(v108) = *v99;
  id v79 = [objc_allocWithZone((Class)CNContactStore) init];
  uint64_t v80 = sub_2B524((uint64_t)&v113, v114);
  __chkstk_darwin(v80);
  uint64_t v82 = (uint64_t *)((char *)&v93 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v83 + 16))(v82);
  uint64_t v84 = *v82;
  uint64_t v111 = v67;
  uint64_t v112 = &off_4ED20;
  v110[0] = v84;
  uint64_t v85 = type metadata accessor for TTSContactOverrider();
  id v86 = (void *)swift_allocObject();
  uint64_t v87 = sub_2B524((uint64_t)v110, v67);
  __chkstk_darwin(v87);
  unsigned int v89 = (uint64_t *)((char *)&v93 - ((v88 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v90 + 16))(v89);
  uint64_t v91 = *v89;
  v86[6] = v67;
  v86[7] = &off_4ED20;
  v86[2] = v79;
  v86[3] = v91;
  (*(void (**)(uint64_t, char *, uint64_t))(v105 + 32))((uint64_t)v86 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale, v78, v107);
  *((unsigned char *)v86 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_isCurareRun) = v108;
  sub_66DC((uint64_t)v110);
  sub_66DC((uint64_t)&v113);
  *((void *)v66 + 41) = v85;
  *((void *)v66 + 42) = &off_4E640;
  *((void *)v66 + 38) = v86;
  return v66;
}

uint64_t type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin()
{
  return self;
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.run(context:completion:)(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v7 = sub_3E6A8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_62C4(&qword_53850);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2A478(a1))
  {
    uint64_t v14 = sub_3EF48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v3;
    v15[5] = a2;
    v15[6] = a3;
    swift_retain();
    swift_retain();
    sub_28174((uint64_t)v13, (uint64_t)&unk_53860, (uint64_t)v15);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for PrivateLearningPluginResult.success(_:), v7);
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_280C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_19A90;
  return sub_28320(a5, a6);
}

uint64_t sub_28174(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_3EF48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_3EF38();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_DCD4(a1, &qword_53850);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_3EF18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_28320(uint64_t a1, uint64_t a2)
{
  v3[38] = a2;
  v3[39] = v2;
  v3[37] = a1;
  uint64_t v4 = sub_3E6A8();
  v3[40] = v4;
  v3[41] = *(void *)(v4 - 8);
  v3[42] = swift_task_alloc();
  uint64_t v5 = sub_3E558();
  v3[43] = v5;
  v3[44] = *(void *)(v5 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = type metadata accessor for TMDCGroundTruth();
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  uint64_t v6 = sub_3EA38();
  v3[49] = v6;
  v3[50] = *(void *)(v6 - 8);
  v3[51] = swift_task_alloc();
  uint64_t v7 = sub_3E7D8();
  v3[52] = v7;
  v3[53] = *(void *)(v7 - 8);
  v3[54] = swift_task_alloc();
  uint64_t v8 = sub_62C4(&qword_53998);
  v3[55] = v8;
  v3[56] = *(void *)(v8 - 8);
  v3[57] = swift_task_alloc();
  uint64_t v9 = sub_3EBB8();
  v3[58] = v9;
  v3[59] = *(void *)(v9 - 8);
  v3[60] = swift_task_alloc();
  return _swift_task_switch(sub_285F4, 0, 0);
}

uint64_t sub_285F4()
{
  if (qword_527B8 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[59];
  uint64_t v1 = v0[60];
  uint64_t v3 = v0[58];
  uint64_t v4 = sub_3EBE8();
  v0[61] = sub_60E8(v4, (uint64_t)qword_57CF8);
  sub_3EBD8();
  sub_3EB98();
  v0[62] = sub_3B60C("pluginRunExecutionTime", 22, 2, v1);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[63] = v5;
  v0[64] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_3EC68();
  v0[65] = sub_60E8(v6, (uint64_t)qword_57CC8);
  uint64_t v7 = sub_3EC48();
  os_log_type_t v8 = sub_3EFA8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "SiriPrivateLearningTTSMispronunciationPlugin.run() started", v9, 2u);
    swift_slowDealloc();
  }
  uint64_t v10 = v0[39];

  uint64_t v11 = sub_6280((void *)(v10 + 16), *(void *)(v10 + 40));
  uint64_t v12 = *v11;
  sub_6280((void *)(*v11 + 16), *(void *)(*v11 + 40));
  sub_192F8();
  uint64_t v16 = (char *)&dword_539A0 + dword_539A0;
  swift_retain();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[66] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_28848;
  uint64_t v14 = v0[57];
  return ((uint64_t (*)(void *, uint64_t, uint64_t))v16)(_swiftEmptyArrayStorage, v14, v12);
}

uint64_t sub_28848(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 536) = a1;
  *(void *)(v3 + 544) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_29EF0;
  }
  else {
    uint64_t v4 = sub_28960;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_28960()
{
  v188 = v0;
  uint64_t v1 = v0;
  (*(void (**)(void, void))(v0[56] + 8))(v0[57], v0[55]);
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_3EC48();
  os_log_type_t v3 = sub_3EFB8();
  v180 = v0;
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[67];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    uint64_t v1 = v0;
    v0[36] = *(void *)(v4 + 16);
    sub_3F088();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v2, v3, "Fetched %ld conversationData", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v6 = v1[67];
  uint64_t v153 = *(void *)(v6 + 16);
  if (!v153)
  {
    swift_bridgeObjectRelease();
    if (_swiftEmptyArrayStorage[2]) {
      goto LABEL_70;
    }
    goto LABEL_72;
  }
  uint64_t v142 = 0;
  unint64_t v7 = 0;
  uint64_t v161 = (uint64_t)(v1 + 20);
  uint64_t v165 = (uint64_t)(v1 + 25);
  uint64_t v169 = (uint64_t)(v1 + 28);
  uint64_t v158 = (uint64_t)(v1 + 15);
  uint64_t v159 = (uint64_t)(v1 + 2);
  v162 = v1 + 31;
  v136 = v1 + 34;
  uint64_t v138 = (uint64_t)(v1 + 9);
  v139 = v1 + 35;
  v141 = (int *)v1[46];
  uint64_t v8 = v1[39];
  v154 = (void *)(v8 + 64);
  v155 = (void *)(v8 + 144);
  v144 = (void *)(v8 + 104);
  v137 = (void *)(v8 + 304);
  uint64_t v152 = v6 + 32;
  v170 = (unsigned char *)(v8 + 352);
  uint64_t v143 = (uint64_t)(v1 + 6);
  v164 = (void (**)(uint64_t, uint64_t))(v1[53] + 8);
  v163 = (void (**)(void, void))(v1[50] + 8);
  v140 = (void (**)(uint64_t, uint64_t, uint64_t))(v1[44] + 32);
  v175 = (void *)v1[68];
  uint64_t v9 = _swiftEmptyArrayStorage;
  uint64_t v10 = (uint64_t)(v1 + 33);
  uint64_t v157 = (uint64_t)(v1 + 33);
  uint64_t v151 = v1[67];
  v173 = (void *)v8;
  do
  {
    if (v7 >= *(void *)(v6 + 16))
    {
      __break(1u);
LABEL_77:
      __break(1u);
      JUMPOUT(0x29EDCLL);
    }
    unint64_t v156 = v7;
    uint64_t v11 = (long long *)(v152 + 56 * v7);
    long long v13 = v11[1];
    long long v12 = v11[2];
    long long v14 = *v11;
    *(unsigned char *)(v159 + 48) = *((unsigned char *)v11 + 48);
    *(_OWORD *)(v159 + 16) = v13;
    *(_OWORD *)(v159 + 32) = v12;
    *(_OWORD *)uint64_t v159 = v14;
    uint64_t v15 = v1[2];
    uint64_t v167 = v1[4];
    uint64_t v168 = v1[3];
    uint64_t v166 = v1[5];
    v1[33] = v15;
    swift_bridgeObjectRetain_n();
    sub_11534(v10);
    sub_2C474((void *)v159);
    uint64_t v16 = sub_3EC48();
    os_log_type_t v17 = sub_3EFB8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 134217984;
      uint64_t v19 = *(void *)(v15 + 16);
      sub_11560(v157);
      *(void *)(v18 + 4) = v19;
      sub_11560(v157);
      _os_log_impl(&dword_0, v16, v17, "Current ConversationData consists of %ld asrContactTokens", (uint8_t *)v18, 0xCu);
      uint64_t v1 = v180;
      swift_slowDealloc();
    }
    else
    {
      sub_11560(v10);
      sub_11560(v10);
    }

    uint64_t v179 = *(void *)(v15 + 16);
    if (v179)
    {
      sub_2C4CC(v143, v169);
      uint64_t v20 = 0;
      uint64_t v178 = v15 + 32;
      do
      {
        uint64_t v21 = v178 + 48 * v20;
        uint64_t v22 = *(void *)v21;
        unint64_t v23 = *(void *)(v21 + 8);
        int v24 = *(unsigned __int8 *)(v21 + 16);
        uint64_t v26 = *(void **)(v21 + 24);
        uint64_t v25 = *(void *)(v21 + 32);
        int v27 = *(unsigned __int8 *)(v21 + 40);
        v1[9] = *(void *)v21;
        v1[10] = v23;
        int v181 = v24;
        *((unsigned char *)v1 + 88) = v24;
        v1[12] = v26;
        v1[13] = v25;
        uint64_t v183 = v25;
        *((unsigned char *)v1 + 112) = v27;
        swift_bridgeObjectRetain_n();
        unint64_t v28 = v26;
        uint64_t v29 = sub_3EC48();
        os_log_type_t v30 = sub_3EFB8();
        v185 = v9;
        v186 = v28;
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = v1;
          uint64_t v32 = v20;
          uint64_t v33 = swift_slowAlloc();
          v187[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v33 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v33 + 4) = sub_2B8C8(v22, v23, v187);
          swift_bridgeObjectRelease_n();

          _os_log_impl(&dword_0, v29, v30, "ASR token name: %s", (uint8_t *)v33, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v20 = v32;
          uint64_t v1 = v31;
          uint64_t v9 = v185;
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
        uint64_t v34 = (void *)v23;
        uint64_t v35 = sub_3EC48();
        os_log_type_t v36 = sub_3EFB8();
        if (os_log_type_enabled(v35, v36))
        {
          uint64_t v37 = swift_slowAlloc();
          *(_DWORD *)uint64_t v37 = 134217984;
          *(double *)(v37 + 4) = (double)v183;
          _os_log_impl(&dword_0, v35, v36, "ASR token confidence: %f", (uint8_t *)v37, 0xCu);
          swift_slowDealloc();
        }

        if (!v27)
        {
          swift_bridgeObjectRelease();

          goto LABEL_14;
        }
        uint64_t v38 = sub_3EC48();
        os_log_type_t v39 = sub_3EFB8();
        if (os_log_type_enabled(v38, v39))
        {
          uint64_t v40 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v40 = 0;
          _os_log_impl(&dword_0, v38, v39, "ASR token confidence meets the asrConfidenceThreshold", v40, 2u);
          swift_slowDealloc();
        }

        uint64_t v41 = v173[7];
        if (*v170 == 1)
        {
          sub_6280((void *)(v41 + 24), *(void *)(v41 + 48));
          swift_bridgeObjectRetain();
          uint64_t v42 = v186;
          uint64_t v43 = sub_3EA18();
          uint64_t v44 = v22;
          uint64_t v45 = v22;
          uint64_t v46 = v175;
          uint64_t v48 = sub_10090(v44, v34, v43, v47, 0);
          swift_bridgeObjectRelease();
          if (v175)
          {

            swift_bridgeObjectRelease();
            uint64_t v9 = v185;
LABEL_32:
            swift_errorRetain();
            swift_errorRetain();
            uint64_t v61 = sub_3EC48();
            os_log_type_t v62 = sub_3EFC8();
            if (os_log_type_enabled(v61, v62))
            {
              uint64_t v63 = (uint8_t *)swift_slowAlloc();
              uint64_t v64 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v63 = 138412290;
              swift_errorRetain();
              uint64_t v65 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t *v162 = v65;
              sub_3F088();
              *uint64_t v64 = v65;
              uint64_t v1 = v180;
              swift_errorRelease();
              swift_errorRelease();
              _os_log_impl(&dword_0, v61, v62, "%@", v63, 0xCu);
              sub_62C4(&qword_528D8);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              swift_errorRelease();
              swift_errorRelease();
            }

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v9 = sub_17FAC(0, v9[2] + 1, 1, v9);
            }
            unint64_t v67 = v9[2];
            unint64_t v66 = v9[3];
            if (v67 >= v66 >> 1) {
              uint64_t v9 = sub_17FAC((void *)(v66 > 1), v67 + 1, 1, v9);
            }
            _OWORD v9[2] = v67 + 1;
            v9[v67 + 4] = v46;
            swift_bridgeObjectRelease();

            v175 = 0;
            goto LABEL_14;
          }
          id v49 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
          uint64_t v68 = sub_30638(v48, 0);
          uint64_t v69 = v45;
          uint64_t v70 = v41;
        }
        else
        {
          uint64_t v171 = v20;
          uint64_t v50 = v173[7];
          uint64_t v51 = v1[54];
          char v52 = v1[51];
          uint64_t v53 = v1[52];
          sub_2C4CC(v169, v165);
          uint64_t v54 = (void *)v180[26];
          if (v54) {
            uint64_t v55 = v180[25];
          }
          else {
            uint64_t v55 = 0;
          }
          swift_bridgeObjectRetain();
          uint64_t v56 = v186;
          sub_3E898();
          sub_3E7C8();
          uint64_t v70 = v50;
          (*v164)(v51, v53);
          uint64_t v57 = v54;
          uint64_t v1 = v180;
          os_log_type_t v58 = (void (*)(uint64_t, unint64_t, uint64_t))v22;
          uint64_t v59 = v52;
          uint64_t v60 = v22;
          uint64_t v46 = v175;
          uint64_t v68 = sub_2EC08(v55, v57, v58, v34, v181, v59);
          (*v163)(v1[51], v1[49]);
          if (v175)
          {

            swift_bridgeObjectRelease();
            uint64_t v9 = v185;
            uint64_t v20 = v171;
            goto LABEL_32;
          }
          uint64_t v20 = v171;
          uint64_t v69 = v60;
        }
        v174 = v34;
        uint64_t v160 = v69;
        switch(v68[OBJC_IVAR___ContactPronunciation_source])
        {
          case 1:
          case 2:
          case 3:
          case 4:
            char v71 = sub_3F5A8();
            swift_bridgeObjectRelease();
            if (v71) {
              goto LABEL_44;
            }
            sub_6280((void *)(v70 + 24), *(void *)(v70 + 48));
            uint64_t v73 = sub_3EA18();
            uint64_t v75 = sub_10090(v69, v174, v73, v74, 0);
            swift_bridgeObjectRelease();
            id v76 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
            objc_super v115 = sub_30638(v75, 0);
            uint64_t v72 = (char *)*(id *)&v115[OBJC_IVAR___ContactPronunciation_phonemeString];

            break;
          default:
            swift_bridgeObjectRelease();
LABEL_44:
            uint64_t v72 = (char *)*(id *)&v68[OBJC_IVAR___ContactPronunciation_phonemeString];
            break;
        }
        sub_6280(v155, v173[21]);
        double v77 = sub_4854(v186, v72, v154);
        int v79 = v78;
        v182 = v72;
        sub_6280(v144, v173[16]);
        int v80 = sub_3E658();
        uint64_t v172 = v20;
        char v176 = v79;
        if (v80 & v79)
        {
          uint64_t v81 = sub_3EC48();
          os_log_type_t v82 = sub_3EFB8();
          if (os_log_type_enabled(v81, v82))
          {
            uint64_t v83 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v83 = 0;
            _os_log_impl(&dword_0, v81, v82, "tmdcRuntimeCorrections is enabled", v83, 2u);
            swift_slowDealloc();
          }

          uint64_t v84 = sub_3EC48();
          os_log_type_t v85 = sub_3EFB8();
          if (os_log_type_enabled(v84, v85))
          {
            id v86 = (uint8_t *)swift_slowAlloc();
            v187[0] = swift_slowAlloc();
            *(_DWORD *)id v86 = 136315138;
            uint64_t *v139 = sub_2B8C8(0, 0xE000000000000000, v187);
            sub_3F088();
            _os_log_impl(&dword_0, v84, v85, "TTS mispronunciation is %s detected", v86, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }

          sub_6280(v137, v173[41]);
          objc_super v116 = sub_1FBFC(v159, v138);
          uint64_t v118 = v117;
          v120 = v119;
          sub_2C5D4(0, 0, 0);
          uint64_t v87 = *(void *)&v186[OBJC_IVAR___PhonemeString_symbols + 8];
          uint64_t v147 = (uint64_t)v116;
          uint64_t v150 = *(void *)&v186[OBJC_IVAR___PhonemeString_symbols];
          if (v118)
          {
            swift_bridgeObjectRetain();
            sub_2C590((uint64_t)v116, v118, v120);
            swift_bridgeObjectRelease();

            id v121 = v120;
            swift_bridgeObjectRetain();
            v145 = v120;
            v148 = v116;
            uint64_t v88 = v118;
            goto LABEL_55;
          }
        }
        else
        {
          v120 = 0;
          uint64_t v147 = 0;
          uint64_t v87 = *(void *)&v186[OBJC_IVAR___PhonemeString_symbols + 8];
          uint64_t v150 = *(void *)&v186[OBJC_IVAR___PhonemeString_symbols];
        }
        v145 = v120;
        swift_bridgeObjectRetain();
        v120 = 0;
        uint64_t v88 = 0;
        v148 = 0;
LABEL_55:
        uint64_t v1 = v180;
        uint64_t v89 = v180[48];
        uint64_t v149 = v180[47];
        uint64_t v90 = v180[45];
        uint64_t v91 = v180[43];
        sub_3E548();
        sub_3E9B8();
        swift_allocObject();
        sub_3E9A8();
        char v92 = sub_3E998();
        swift_release();
        (*v140)(v89, v90, v91);
        *(unsigned char *)(v89 + v141[5]) = (v92 & 1) == 0;
        uint64_t v93 = (uint64_t *)(v89 + v141[6]);
        uint64_t *v93 = v160;
        v93[1] = (uint64_t)v174;
        *(void *)(v89 + v141[7]) = v183;
        uint64_t v94 = (void *)(v89 + v141[8]);
        *uint64_t v94 = v150;
        v94[1] = v87;
        *(void *)(v89 + v141[9]) = v68;
        *(void *)(v89 + v141[10]) = v120;
        *(double *)(v89 + v141[11]) = v77;
        *(unsigned char *)(v89 + v141[12]) = v176 & 1;
        uint64_t v95 = (void *)(v89 + v141[13]);
        *uint64_t v95 = v148;
        v95[1] = v88;
        sub_BB18(v89, v149);
        uint64_t v96 = v68;
        uint64_t v97 = sub_3EC48();
        os_log_type_t v98 = sub_3EFB8();
        BOOL v99 = os_log_type_enabled(v97, v98);
        uint64_t v100 = v180[47];
        uint64_t v146 = v88;
        v177 = v96;
        if (v99)
        {
          id v101 = (uint8_t *)swift_slowAlloc();
          v187[0] = swift_slowAlloc();
          *(_DWORD *)id v101 = 136315138;
          uint64_t v102 = sub_6868();
          uint64_t *v136 = sub_2B8C8(v102, v103, v187);
          sub_3F088();
          uint64_t v1 = v180;
          swift_bridgeObjectRelease();
          sub_BB7C(v100);
          _os_log_impl(&dword_0, v97, v98, "TMDC created groundtruth: %s", v101, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          sub_BB7C(v100);
        }

        uint64_t v104 = v161;
        uint64_t v184 = sub_2B184();
        uint64_t v105 = *(void *)(v184 + 16);
        if (v105)
        {
          unsigned __int8 v106 = (void *)(v184 + 32);
          do
          {
            sub_26030((uint64_t)v106, v104);
            uint64_t v107 = sub_3EC48();
            os_log_type_t v108 = sub_3EFB8();
            if (os_log_type_enabled(v107, v108))
            {
              uint64_t v109 = swift_slowAlloc();
              v187[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v109 = 136315138;
              sub_26030(v104, v158);
              sub_62C4(&qword_539B0);
              uint64_t v110 = sub_3EDC8();
              *(void *)(v109 + 4) = sub_2B8C8(v110, v111, v187);
              swift_bridgeObjectRelease();
              sub_66DC(v104);
              _os_log_impl(&dword_0, v107, v108, "Logger %s started", (uint8_t *)v109, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              sub_66DC(v104);
            }

            uint64_t v112 = v1[48];
            uint64_t v113 = v106[3];
            uint64_t v114 = v106[4];
            sub_6280(v106, v113);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v114 + 8))(v112, v168, v167, v166, v113, v114);
            v106 += 5;
            --v105;
            uint64_t v104 = v161;
          }
          while (v105);
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if (__OFADD__(v142, 1)) {
          goto LABEL_77;
        }
        ++v142;
        sub_BB7C(v1[48]);
        sub_2C5D4(v147, v146, v145);
        v175 = 0;
        uint64_t v9 = v185;
        uint64_t v20 = v172;
LABEL_14:
        ++v20;
      }
      while (v20 != v179);
    }
    uint64_t v10 = v157;
    unint64_t v7 = v156 + 1;
    sub_11560(v157);
    sub_2C534((void *)v159);
    uint64_t v6 = v151;
  }
  while (v156 + 1 != v153);
  swift_bridgeObjectRelease();
  if (v9[2] && !v142)
  {
LABEL_70:
    v187[0] = 0;
    v187[1] = 0xE000000000000000;
    sub_3F238(51);
    v190._object = (void *)0x8000000000043B40;
    v190._countAndFlagsBits = 0xD000000000000031;
    sub_3EE18(v190);
    sub_62C4(&qword_53118);
    v191._countAndFlagsBits = sub_3EEC8();
    sub_3EE18(v191);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_3E698();
    sub_2C884(&qword_539A8, (void (*)(uint64_t))&type metadata accessor for PrivateLearningPluginError);
    uint64_t v122 = swift_allocError();
    sub_3E688();
    swift_willThrow();
    uint64_t v123 = v1[60];
    uint64_t v124 = v1[41];
    uint64_t v125 = v1[42];
    v126 = v1;
    uint64_t v127 = v1[40];
    v128 = (void (*)(uint64_t))v126[37];
    v126[32] = v122;
    swift_errorRetain();
    sub_62C4(&qword_53118);
    sub_3EDC8();
    sub_3E688();
    (*(void (**)(uint64_t, void, uint64_t))(v124 + 104))(v125, enum case for PrivateLearningPluginResult.failure(_:), v127);
    v128(v125);
    (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v125, v127);
    sub_3EBD8();
    sub_3EB98();
    sub_3B900("pluginRunFailure", 16, 2, v123);
    swift_errorRelease();
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v129 = v1[60];
  uint64_t v131 = v1[41];
  uint64_t v130 = v1[42];
  uint64_t v132 = v1[40];
  v126 = v1;
  v133 = (void (*)(uint64_t))v1[37];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v131 + 104))(v130, enum case for PrivateLearningPluginResult.success(_:), v132);
  v133(v130);
  (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v130, v132);
  sub_3EBD8();
  sub_3EB98();
  sub_3B900("pluginRunSuccess", 16, 2, v129);
LABEL_73:
  ((void (*)(void, void))v126[63])(v126[60], v126[58]);
  sub_2A0BC();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v134 = (uint64_t (*)(void))v126[1];
  return v134();
}

uint64_t sub_29EF0()
{
  (*(void (**)(void, void))(*(void *)(v0 + 448) + 8))(*(void *)(v0 + 456), *(void *)(v0 + 440));
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 320);
  uint64_t v5 = *(void (**)(uint64_t))(v0 + 296);
  *(void *)(v0 + 256) = *(void *)(v0 + 544);
  swift_errorRetain();
  sub_62C4(&qword_53118);
  sub_3EDC8();
  sub_3E688();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for PrivateLearningPluginResult.failure(_:), v4);
  v5(v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_3EBD8();
  sub_3EB98();
  sub_3B900("pluginRunFailure", 16, 2, v1);
  swift_errorRelease();
  (*(void (**)(void, void))(v0 + 504))(*(void *)(v0 + 480), *(void *)(v0 + 464));
  sub_2A0BC();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2A0BC()
{
  uint64_t v0 = sub_3EBF8();
  uint64_t v24 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_3EBB8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v23 - v8;
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_3EC68();
  sub_60E8(v10, (uint64_t)qword_57CC8);
  uint64_t v11 = sub_3EC48();
  os_log_type_t v12 = sub_3EFA8();
  if (os_log_type_enabled(v11, v12))
  {
    long long v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "SiriPrivateLearningTTSMispronunciationPlugin.run() ended", v13, 2u);
    swift_slowDealloc();
  }

  if (qword_527B8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_3EBE8();
  sub_60E8(v14, (uint64_t)qword_57CF8);
  uint64_t v15 = sub_3EBD8();
  sub_3EC08();
  os_signpost_type_t v16 = sub_3EFD8();
  if (sub_3F078())
  {
    swift_retain();
    sub_3EC38();
    swift_release();
    uint64_t v17 = v24;
    if ((*(unsigned int (**)(char *, uint64_t))(v24 + 88))(v2, v0) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v18 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v2, v0);
      uint64_t v18 = "";
    }
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    os_signpost_id_t v21 = sub_3EBA8();
    _os_signpost_emit_with_name_impl(&dword_0, v15, v16, v21, "pluginRunExecutionTime", v18, v20, 2u);
    swift_slowDealloc();

    uint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v9, v3);
    return ((uint64_t (*)(char *, uint64_t))v22)(v7, v3);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
}

uint64_t sub_2A478(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_3EA38();
  uint64_t v66 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v65 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_3E7D8();
  uint64_t v64 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  unint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_3E6C8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  os_log_type_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v58 - v13;
  if ((sub_3E868() & 1) == 0)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_3EC68();
    sub_60E8(v22, (uint64_t)qword_57CC8);
    swift_retain_n();
    uint64_t v23 = sub_3EC48();
    os_log_type_t v24 = sub_3EFA8();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v68 = sub_2B8C8(0xD00000000000003DLL, 0x8000000000043BA0, &v69);
      sub_3F088();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v63 = v1;
      sub_3E898();
      uint64_t v26 = v65;
      sub_3E7B8();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v7, v67);
      uint64_t v27 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v66 + 8))(v26, v4);
      uint64_t v68 = sub_2B8C8(v27, v29, &v69);
      sub_3F088();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v23, v24, "%s: siri locale %s isn't supported", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
LABEL_19:
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }
LABEL_20:

LABEL_21:
    swift_release_n();
    return 0;
  }
  if ((sub_3E878() & 1) == 0)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_3EC68();
    sub_60E8(v30, (uint64_t)qword_57CC8);
    swift_retain_n();
    uint64_t v23 = sub_3EC48();
    os_log_type_t v31 = sub_3EFA8();
    if (os_log_type_enabled(v23, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t v69 = v63;
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v68 = sub_2B8C8(0xD00000000000003DLL, 0x8000000000043BA0, &v69);
      sub_3F088();
      *(_WORD *)(v32 + 12) = 2080;
      os_log_type_t v62 = (uint64_t *)(v32 + 14);
      sub_3E898();
      uint64_t v33 = v65;
      sub_3E7C8();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v7, v67);
      uint64_t v34 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v36 = v35;
      (*(void (**)(char *, uint64_t))(v66 + 8))(v33, v4);
      uint64_t v68 = sub_2B8C8(v34, v36, &v69);
      sub_3F088();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v23, v31, "%s: siri voice locale %s isn't supported", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if ((sub_3BEA0() & 1) == 0)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_3EC68();
    sub_60E8(v37, (uint64_t)qword_57CC8);
    swift_retain_n();
    uint64_t v38 = sub_3EC48();
    os_log_type_t v39 = sub_3EFA8();
    int v40 = v39;
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      uint64_t v69 = v61;
      *(_DWORD *)uint64_t v41 = 136315650;
      os_log_t v60 = v38;
      uint64_t v68 = sub_2B8C8(0xD00000000000003DLL, 0x8000000000043BA0, &v69);
      os_log_type_t v62 = &v69;
      sub_3F088();
      *(_WORD *)(v41 + 12) = 2080;
      sub_3E898();
      uint64_t v42 = v65;
      sub_3E7B8();
      uint64_t v63 = v2;
      uint64_t v59 = *(void (**)(char *, uint64_t))(v64 + 8);
      v59(v7, v67);
      uint64_t v43 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v45 = v44;
      LODWORD(v64) = v40;
      uint64_t v66 = *(void *)(v66 + 8);
      ((void (*)(char *, uint64_t))v66)(v42, v4);
      uint64_t v68 = sub_2B8C8(v43, v45, &v69);
      sub_3F088();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 22) = 2080;
      sub_3E898();
      sub_3E7C8();
      v59(v7, v67);
      uint64_t v46 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v48 = v47;
      ((void (*)(char *, uint64_t))v66)(v42, v4);
      uint64_t v68 = sub_2B8C8(v46, v48, &v69);
      sub_3F088();
      swift_release_n();
      swift_bridgeObjectRelease();
      id v49 = v60;
      _os_log_impl(&dword_0, v60, (os_log_type_t)v64, "%s: siri locale / siri voice locale pair %s / %s isn't supported", (uint8_t *)v41, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_35;
    }

    goto LABEL_21;
  }
  sub_6280((void *)(v1 + 104), *(void *)(v1 + 128));
  if ((sub_3E618() & 1) == 0)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_3EC68();
    sub_60E8(v50, (uint64_t)qword_57CC8);
    id v49 = sub_3EC48();
    os_log_type_t v51 = sub_3EFA8();
    if (!os_log_type_enabled(v49, v51)) {
      goto LABEL_36;
    }
    char v52 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    *(_DWORD *)char v52 = 136315138;
    uint64_t v68 = sub_2B8C8(0xD00000000000003DLL, 0x8000000000043BA0, &v69);
    sub_3F088();
    _os_log_impl(&dword_0, v49, v51, "%s: TMDCRuntime trial flag are both disabled", v52, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    goto LABEL_35;
  }
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v14, enum case for PrivateLearningPluginRunContext.maintenance(_:), v8);
  char v15 = sub_3E6B8();
  os_signpost_type_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v14, v8);
  if ((v15 & 1) == 0)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_3EC68();
    sub_60E8(v53, (uint64_t)qword_57CC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
    id v49 = sub_3EC48();
    os_log_type_t v54 = sub_3EFA8();
    if (!os_log_type_enabled(v49, v54))
    {
      v16(v12, v8);
      goto LABEL_36;
    }
    uint64_t v55 = swift_slowAlloc();
    uint64_t v67 = swift_slowAlloc();
    uint64_t v69 = v67;
    *(_DWORD *)uint64_t v55 = 136315394;
    uint64_t v68 = sub_2B8C8(0xD00000000000003DLL, 0x8000000000043BA0, &v69);
    sub_3F088();
    *(_WORD *)(v55 + 12) = 2080;
    sub_2C884(&qword_539F0, (void (*)(uint64_t))&type metadata accessor for PrivateLearningPluginRunContext);
    uint64_t v56 = sub_3F598();
    uint64_t v68 = sub_2B8C8(v56, v57, &v69);
    sub_3F088();
    swift_bridgeObjectRelease();
    v16(v12, v8);
    _os_log_impl(&dword_0, v49, v54, "%s: context is %s", (uint8_t *)v55, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
LABEL_35:
    swift_slowDealloc();
LABEL_36:

    return 0;
  }
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_3EC68();
  sub_60E8(v17, (uint64_t)qword_57CC8);
  uint64_t v18 = sub_3EC48();
  os_log_type_t v19 = sub_3EFB8();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_0, v18, v19, "SiriPrivateLearningTTSMispronunciationPlugin is enabled", v20, 2u);
    swift_slowDealloc();
  }

  return 1;
}

uint64_t sub_2B184()
{
  uint64_t v1 = v0;
  sub_6280((void *)(v0 + 104), *(void *)(v0 + 128));
  if ((sub_3E668() & 1) != 0 || *(unsigned char *)(v0 + 352) == 1)
  {
    sub_62C4(&qword_53990);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_40A20;
    sub_26030(v1 + 184, v2 + 32);
    uint64_t v3 = v2 + 72;
    uint64_t v4 = v1 + 224;
  }
  else
  {
    sub_62C4(&qword_53990);
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_40160;
    uint64_t v3 = v2 + 32;
    uint64_t v4 = v1 + 184;
  }
  sub_26030(v4, v3);
  return v2;
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.deinit()
{
  sub_66DC(v0 + 16);
  swift_release();
  sub_66DC(v0 + 64);
  sub_66DC(v0 + 104);
  sub_66DC(v0 + 144);
  sub_66DC(v0 + 184);
  sub_66DC(v0 + 224);
  sub_66DC(v0 + 264);
  sub_66DC(v0 + 304);
  swift_release();
  return v0;
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.__deallocating_deinit()
{
  SiriPrivateLearningTTSMispronunciationPlugin.deinit();

  return _swift_deallocClassInstance(v0, 353, 7);
}

uint64_t sub_2B2F0()
{
  type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin();
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningTTSMispronunciationPlugin.init()();
  return v0;
}

uint64_t sub_2B328(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v7 = sub_3E6A8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_62C4(&qword_53850);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2A478(a1))
  {
    uint64_t v14 = sub_3EF48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    char v15 = (void *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v3;
    v15[5] = a2;
    v15[6] = a3;
    swift_retain();
    swift_retain();
    sub_28174((uint64_t)v13, (uint64_t)&unk_539D8, (uint64_t)v15);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for PrivateLearningPluginResult.success(_:), v7);
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_2B524(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_2B574(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2B584(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2B5C0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_2B5D0(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_3EBA8();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_2B654(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2B730;
  return v6(a1);
}

uint64_t sub_2B730()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2B828(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2B850(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2B8C8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_3F088();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2B8C8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2B99C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_190D4((uint64_t)v12, *a3);
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
      sub_190D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_66DC((uint64_t)v12);
  return v7;
}

uint64_t sub_2B99C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_3F098();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2BB58(a5, a6);
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
  uint64_t v8 = sub_3F2B8();
  if (!v8)
  {
    sub_3F368();
    __break(1u);
LABEL_17:
    uint64_t result = sub_3F3C8();
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

uint64_t sub_2BB58(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_2BBF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2BE4C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2BE4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_2BBF0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2BD68(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_3F248();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_3F368();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_3EE28();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_3F3C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_3F368();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2BD68(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_62C4(&qword_539F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2BDD0(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_3EE48();
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
    uint64_t v5 = sub_3EE38();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2BE4C(char a1, int64_t a2, char a3, char *a4)
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
    sub_62C4(&qword_539F8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

unsigned char **sub_2BF9C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

void sub_2BFAC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_3F088();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_2C064(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2C08C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_3F088();
  *a1 = v5;
  return result;
}

void *sub_2C0E4(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5)
{
  uint64_t v30 = sub_3E5F8();
  os_log_type_t v31 = &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver;
  *(void *)&long long v29 = a5;
  uint64_t v10 = type metadata accessor for SiriConversationReader();
  v28[3] = v10;
  v28[4] = &off_4E098;
  v28[0] = a1;
  uint64_t v11 = type metadata accessor for ConversationDataProcessor();
  uint64_t v26 = v11;
  uint64_t v27 = &off_4EE28;
  v25[0] = a2;
  type metadata accessor for ConversationDataController();
  unint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = sub_2B524((uint64_t)v28, v10);
  __chkstk_darwin(v13);
  char v15 = (void *)((char *)&v25[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = sub_2B524((uint64_t)v25, v26);
  __chkstk_darwin(v17);
  os_log_type_t v19 = (void *)((char *)&v25[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = *v15;
  uint64_t v22 = *v19;
  v12[5] = v10;
  v12[6] = &off_4E098;
  v12[2] = v21;
  v12[10] = v11;
  v12[11] = &off_4EE28;
  v12[7] = v22;
  v12[23] = 0x405E000000000000;
  v12[12] = a3;
  sub_26094(a4, (uint64_t)(v12 + 13));
  sub_26094(&v29, (uint64_t)(v12 + 18));
  sub_66DC((uint64_t)v25);
  sub_66DC((uint64_t)v28);
  return v12;
}

uint64_t *sub_2C320(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2C388()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_19A90;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_19A90;
  return sub_28320(v2, v3);
}

void *sub_2C474(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  uint64_t v3 = (void *)a1[2];
  uint64_t v4 = (void *)a1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v5 = v2;
  id v6 = v3;
  id v7 = v4;
  return a1;
}

uint64_t sub_2C4CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_2C534(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  uint64_t v3 = (void *)a1[2];
  uint64_t v4 = (void *)a1[3];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

void sub_2C590(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v3 = a3;
  }
}

void sub_2C5D4(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2C618(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_13560(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2C660()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_2C6A8()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_19940;
  id v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *id v5 = v4;
  v5[1] = sub_19A90;
  return sub_28320(v2, v3);
}

uint64_t sub_2C794()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2C7CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *id v5 = v2;
  v5[1] = sub_19940;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_539E0 + dword_539E0);
  return v6(a1, v4);
}

uint64_t sub_2C884(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2C8CC(uint64_t a1)
{
  return sub_2C934(a1, (void (*)(void))&type metadata accessor for JSONDecoder, (uint64_t (*)(void))&JSONDecoder.init(), &qword_53A20);
}

uint64_t sub_2C900(uint64_t a1)
{
  return sub_2C934(a1, (void (*)(void))&type metadata accessor for JSONEncoder, (uint64_t (*)(void))&JSONEncoder.init(), &qword_53A28);
}

uint64_t sub_2C934(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for PhonemeDataParser()
{
  return self;
}

uint64_t sub_2C9AC(void *a1)
{
  uint64_t v2 = sub_3EDB8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_3EC68();
  uint64_t v7 = sub_60E8(v6, (uint64_t)qword_57CC8);
  id v8 = a1;
  int64_t v9 = sub_3EC48();
  os_log_type_t v10 = sub_3EFB8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v64 = (uint8_t *)v2;
    uint64_t v65 = v7;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    id v12 = [v8 phonemeData];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = sub_3ED78();
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v16 = 0;
    }
    uint64_t v66 = v14;
    uint64_t v67 = v16;
    sub_62C4(&qword_53AD0);
    uint64_t v17 = sub_3EDC8();
    uint64_t v66 = sub_2B8C8(v17, v18, &v68);
    sub_3F088();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "Begin parsing phonemeData: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v2 = (uint64_t)v64;
  }
  else
  {
  }
  id v19 = [v8 phonemeData];
  if (!v19) {
    goto LABEL_11;
  }
  uint64_t v20 = v19;
  sub_3ED78();

  sub_3EDA8();
  uint64_t v21 = sub_3ED88();
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v23 >> 60 == 15)
  {
LABEL_11:
    id v24 = v8;
    uint64_t v25 = sub_3EC48();
    os_log_type_t v26 = sub_3EFB8();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      id v28 = [v24 identifier];
      uint64_t v29 = sub_3ED78();
      unint64_t v31 = v30;

      uint64_t v68 = sub_2B8C8(v29, v31, &v66);
      sub_3F088();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v25, v26, "phonemeData string is empty for contact: %s", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return 0;
    }

    goto LABEL_23;
  }
  if (qword_52780 != -1) {
    swift_once();
  }
  sub_2D360();
  sub_3E3F8();
  uint64_t v32 = v66;
  int v33 = v67;
  id v34 = [self stringFromContact:v8 style:0];
  if (!v34
    || (unint64_t v35 = v34,
        uint64_t v36 = sub_3ED78(),
        unint64_t v38 = v37,
        v35,
        LODWORD(v35) = sub_12344(v36, v38),
        swift_bridgeObjectRelease(),
        v33 != v35))
  {
    swift_bridgeObjectRelease();
    id v24 = v8;
    uint64_t v53 = sub_3EC48();
    os_log_type_t v54 = sub_3EFC8();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)uint64_t v55 = 136315138;
      uint64_t v64 = v55 + 4;
      id v56 = [v24 identifier];
      uint64_t v57 = sub_3ED78();
      uint64_t v65 = v21;
      uint64_t v58 = v57;
      unint64_t v60 = v59;

      uint64_t v68 = sub_2B8C8(v58, v60, &v66);
      sub_3F088();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v53, v54, "phonemeData checksum is invalid for contact: %s", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      sub_2D3B4(v65, v23);

      return 0;
    }
    sub_2D3B4(v21, v23);

LABEL_23:
    return 0;
  }
  id v39 = v8;
  swift_bridgeObjectRetain_n();
  id v40 = v39;
  uint64_t v41 = sub_3EC48();
  os_log_type_t v42 = sub_3EFB8();
  int v43 = v42;
  unint64_t v44 = v41;
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v45 = swift_slowAlloc();
    LODWORD(v64) = v43;
    uint64_t v46 = v45;
    uint64_t v63 = swift_slowAlloc();
    uint64_t v68 = v63;
    *(_DWORD *)uint64_t v46 = 136315394;
    uint64_t v66 = v32;
    LODWORD(v67) = v33;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_3EDC8();
    uint64_t v65 = v21;
    uint64_t v66 = sub_2B8C8(v47, v48, &v68);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    id v49 = objc_msgSend(v40, "identifier", v46 + 14);
    uint64_t v50 = sub_3ED78();
    unint64_t v52 = v51;

    uint64_t v66 = sub_2B8C8(v50, v52, &v68);
    sub_3F088();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v44, (os_log_type_t)v64, "Parsed phonemeData: %s for contact: %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    sub_2D3B4(v65, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    sub_2D3B4(v21, v23);
  }
  return v32;
}

unint64_t sub_2D360()
{
  unint64_t result = qword_53AC8;
  if (!qword_53AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53AC8);
  }
  return result;
}

uint64_t sub_2D3B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2D3C8(a1, a2);
  }
  return a1;
}

uint64_t sub_2D3C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2D420()
{
  uint64_t v0 = sub_3EDB8();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_3E418();
  __chkstk_darwin(v1 - 8);
  if (qword_52788 != -1) {
    swift_once();
  }
  sub_3E408();
  sub_3E428();
  sub_2D730();
  uint64_t v2 = sub_3E438();
  unint64_t v4 = v3;
  sub_3EDA8();
  uint64_t v5 = sub_3ED98();
  sub_2D3C8(v2, v4);
  return v5;
}

unint64_t sub_2D730()
{
  unint64_t result = qword_53AD8;
  if (!qword_53AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53AD8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for P2PRunningError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DA5C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2D79C);
}

uint64_t sub_2D79C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for P2PRunningError(uint64_t a1)
{
  return sub_2D7C4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2D7C4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for P2PRunningError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DAD8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2D79C, (void (*)(uint64_t, uint64_t, uint64_t))sub_2D7C4);
}

uint64_t *assignWithTake for P2PRunningError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2DB5C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_2D7C4);
}

uint64_t getEnumTagSinglePayload for P2PRunningError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for P2PRunningError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2D8AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2D8B4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for P2PRunningError()
{
  return &type metadata for P2PRunningError;
}

uint64_t initializeBufferWithCopyOfBuffer for ASRLoggedTokenFetcherError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DA5C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2D8E4);
}

uint64_t sub_2D8E4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ASRLoggedTokenFetcherError(uint64_t a1)
{
  return sub_2D90C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2D90C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *assignWithCopy for ASRLoggedTokenFetcherError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DAD8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2D8E4, (void (*)(uint64_t, uint64_t, uint64_t))sub_2D90C);
}

uint64_t *assignWithTake for ASRLoggedTokenFetcherError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2DB5C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_2D90C);
}

uint64_t getEnumTagSinglePayload for ASRLoggedTokenFetcherError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRLoggedTokenFetcherError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASRLoggedTokenFetcherError()
{
  return &type metadata for ASRLoggedTokenFetcherError;
}

uint64_t initializeBufferWithCopyOfBuffer for TTSPhonemesGeneratingError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DA5C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2DA1C);
}

uint64_t sub_2DA1C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for TTSPhonemesGeneratingError(uint64_t a1)
{
  return sub_2DA44(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2DA44(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2DA5C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for TTSPhonemesGeneratingError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2DAD8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_2DA1C, (void (*)(uint64_t, uint64_t, uint64_t))sub_2DA44);
}

uint64_t *sub_2DAD8(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for TTSPhonemesGeneratingError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_2DB5C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_2DA44);
}

uint64_t *sub_2DB5C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSPhonemesGeneratingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSPhonemesGeneratingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSPhonemesGeneratingError()
{
  return &type metadata for TTSPhonemesGeneratingError;
}

__n128 initializeWithTake for TTSContactOverriderError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2DC5C()
{
  return 0;
}

ValueMetadata *type metadata accessor for TTSContactOverriderError()
{
  return &type metadata for TTSContactOverriderError;
}

ValueMetadata *type metadata accessor for ContactPronunciationInitialisationError()
{
  return &type metadata for ContactPronunciationInitialisationError;
}

ValueMetadata *type metadata accessor for ContactPronunciationControllerError()
{
  return &type metadata for ContactPronunciationControllerError;
}

uint64_t sub_2DC98()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for PhonemesMapperError()
{
  return sub_2DCB0();
}

uint64_t sub_2DCB0()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin19PhonemesMapperErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2DC98();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PhonemesMapperError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_2DC98();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2DCB0();
  return a1;
}

uint64_t assignWithTake for PhonemesMapperError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2DCB0();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemesMapperError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PhonemesMapperError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2DE30(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemesMapperError()
{
  return &type metadata for PhonemesMapperError;
}

void *initializeBufferWithCopyOfBuffer for TMDCCoreDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *_s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for TMDCCoreDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
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

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TMDCCoreDataStoreError()
{
  return &type metadata for TMDCCoreDataStoreError;
}

unint64_t destroy for TMDCLoggingError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *_s44SiriPrivateLearningTTSMispronunciationPlugin16TMDCLoggingErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for TMDCLoggingError(void *a1, void *a2)
{
  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = a1[1];
  }
  int v6 = v5 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v4 = a2[1];
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithTake for TMDCLoggingError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for TMDCLoggingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TMDCLoggingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_2E1FC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_2E220(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    void *result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TMDCLoggingError()
{
  return &type metadata for TMDCLoggingError;
}

uint64_t sub_2E27C(char a1, char a2)
{
  if (*(void *)&aNvasr_4[8 * a1] == *(void *)&aNvasr_4[8 * a2]
    && *(void *)&aPhoneset_3[8 * a1 + 8] == *(void *)&aPhoneset_3[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2E304(char a1, char a2)
{
  if (*(void *)&aFirst_2[8 * a1] == *(void *)&aFirst_2[8 * a2] && qword_42488[a1] == qword_42488[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2E38C(char a1, char a2)
{
  if (qword_424F0[a1] == qword_424F0[a2] && qword_42518[a1] == qword_42518[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2E414(char a1, unsigned __int8 a2)
{
  unint64_t v2 = 0x8000000000042850;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x8000000000042880;
    }
    else {
      unint64_t v3 = 0x80000000000428B0;
    }
    unint64_t v4 = 0xD000000000000025;
    int v5 = a2;
    if (a2)
    {
LABEL_6:
      if (v5 == 1) {
        unint64_t v2 = 0x8000000000042880;
      }
      else {
        unint64_t v2 = 0x80000000000428B0;
      }
      if (v4 != 0xD000000000000025) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v4 = 0xD000000000000026;
    unint64_t v3 = 0x8000000000042850;
    int v5 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  if (v4 != 0xD000000000000026)
  {
LABEL_15:
    char v6 = sub_3F5A8();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v2) {
    goto LABEL_15;
  }
  char v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

uint64_t sub_2E510(char a1, char a2)
{
  if (*(void *)&aNvasr_5[8 * a1] == *(void *)&aNvasr_5[8 * a2] && qword_42450[a1] == qword_42450[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_2E598()
{
  return sub_3F658();
}

Swift::Int sub_2E63C()
{
  return sub_3F658();
}

Swift::Int sub_2E6A8()
{
  return sub_3F658();
}

Swift::Int sub_2E714()
{
  return sub_3F658();
}

Swift::Int sub_2E780()
{
  return sub_3F658();
}

uint64_t sub_2E7EC()
{
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2E840()
{
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2E894()
{
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2E8E8()
{
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2E974()
{
  sub_3EDE8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_2E9C8()
{
  return sub_3F658();
}

Swift::Int sub_2EA30()
{
  return sub_3F658();
}

Swift::Int sub_2EAD0()
{
  return sub_3F658();
}

Swift::Int sub_2EB38()
{
  return sub_3F658();
}

Swift::Int sub_2EBA0()
{
  return sub_3F658();
}

NSObject *sub_2EC08(uint64_t a1, void *a2, void (*a3)(uint64_t, unint64_t, uint64_t), void *a4, int a5, NSObject *a6)
{
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  LODWORD(v110) = a5;
  uint64_t v90 = a3;
  uint64_t v91 = a4;
  uint64_t v93 = sub_3EA38();
  uint64_t v89 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  char v92 = ((char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_3EC68();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    sub_32654();
    swift_allocError();
    void *v29 = 0xD000000000000012;
    v29[1] = 0x8000000000043F70;
LABEL_9:
    swift_willThrow();
    return a6;
  }
  uint64_t v88 = a6;
  a6 = v9;
  id v18 = sub_2FCA8(a1, a2);
  if (!v7)
  {
    if (v18)
    {
      id v86 = v18;
      uint64_t v87 = sub_32034(v18, v110, (unint64_t)v88);
      if (qword_527A8 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_60E8(v14, (uint64_t)qword_57CC8);
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v19, v14);
      a6 = sub_3EC48();
      os_log_type_t v20 = sub_3EFB8();
      int v21 = v20;
      os_log_type_t v85 = a6;
      if (os_log_type_enabled(a6, v20))
      {
        unint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v84 = v23;
        LODWORD(v83) = v21;
        id v24 = v22;
        *(_DWORD *)unint64_t v22 = 136315138;
        uint64_t v25 = (char)v87;
        uint64_t v26 = qword_424F0[v25];
        uint64_t v105 = v23;
        unint64_t v27 = *(void *)((char *)&unk_42518 + v25 * 8);
        uint64_t v82 = (uint64_t)(v24 + 4);
        id v28 = v24;
        v104[0] = sub_2B8C8(v26, v27, (uint64_t *)&v105);
        sub_3F088();
        swift_bridgeObjectRelease();
        a6 = v85;
        _os_log_impl(&dword_0, v85, (os_log_type_t)v83, "Source of siri current pronunciation: %s", v28, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      if (v87 != 2)
      {
        if (!(_BYTE)v87)
        {
          sub_6280((void *)(v9 + 24), *(void *)(v9 + 48));
          uint64_t v34 = sub_3EA18();
          int v43 = sub_10090((uint64_t)v90, v91, v34, v35, 0);
          swift_bridgeObjectRelease();
          id v44 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
          a6 = sub_30638(v43, 0);

          return a6;
        }
        sub_32654();
        swift_allocError();
        *id v40 = 0xD00000000000001FLL;
        v40[1] = 0x8000000000043FC0;
        goto LABEL_56;
      }
      uint64_t v36 = v86;
      uint64_t v37 = sub_2C9AC(v86);
      if (!v37)
      {
        sub_32654();
        swift_allocError();
        *uint64_t v45 = 0xD000000000000035;
        v45[1] = 0x8000000000043FE0;
        swift_willThrow();

        return a6;
      }
      uint64_t v38 = v37;
      __chkstk_darwin(v37);
      sub_2F96C((uint64_t (*)(_OWORD *))sub_326A8, v38, (uint64_t)&v102);
      swift_bridgeObjectRelease();
      sub_24418((uint64_t)&v102, (uint64_t)v104, &qword_53CA8);
      sub_24418((uint64_t)v104, (uint64_t)&v105, &qword_53CA8);
      if (sub_326C8((uint64_t)&v105) == 1)
      {
        unint64_t v102 = 0;
        unint64_t v103 = 0xE000000000000000;
        sub_3F238(40);
        swift_bridgeObjectRelease();
        unint64_t v102 = 0xD000000000000026;
        unint64_t v103 = 0x8000000000044020;
        sub_3282C(&qword_53CB0, (void (*)(uint64_t))&type metadata accessor for Locale);
        v111._countAndFlagsBits = sub_3F598();
        sub_3EE18(v111);
        swift_bridgeObjectRelease();
        a6 = v102;
        unint64_t v39 = v103;
LABEL_55:
        sub_32654();
        swift_allocError();
        *uint64_t v64 = a6;
        v64[1] = v39;
LABEL_56:
        swift_willThrow();
LABEL_57:

        return a6;
      }
      if ((_BYTE)v110)
      {
        if (v110 == 1) {
          uint64_t v46 = v108;
        }
        else {
          uint64_t v46 = v109;
        }
      }
      else
      {
        uint64_t v46 = v107;
      }
      sub_11390((uint64_t)v46);
      sub_326E0(v104);
      if (v46)
      {
        if (v46[2])
        {
          unint64_t v48 = v46[6];
          uint64_t v47 = v46[7];
          swift_bridgeObjectRetain();
          sub_1148C((uint64_t)v46);
          goto LABEL_36;
        }
        sub_1148C((uint64_t)v46);
      }
      unint64_t v48 = 0;
      uint64_t v47 = 0;
LABEL_36:
      uint64_t v49 = (uint64_t)v92;
      if (qword_52778 != -1) {
        goto LABEL_64;
      }
      while (1)
      {
        uint64_t v50 = qword_57CC0;
        uint64_t v110 = *(void *)(qword_57CC0 + 16);
        if (!v110)
        {
          char v60 = 3;
          int v59 = 1;
          goto LABEL_51;
        }
        uint64_t v84 = (uint64_t)v48;
        os_log_type_t v85 = v8;
        uint64_t v51 = v89;
        unint64_t v52 = (*(unsigned __int8 *)(v51 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
        uint64_t v53 = v93;
        uint64_t v90 = *(void (**)(uint64_t, unint64_t, uint64_t))(v89 + 16);
        uint64_t v91 = (void *)(v89 + 16);
        v90(v49, qword_57CC0 + v52, v93);
        uint64_t v54 = sub_3282C((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
        swift_bridgeObjectRetain();
        uint64_t v87 = v54;
        char v55 = sub_3ED28();
        uint64_t v56 = v50;
        uint64_t v58 = *(void (**)(NSObject *, uint64_t))(v51 + 8);
        unint64_t v48 = (v51 + 8);
        uint64_t v57 = v58;
        v58(v49, v53);
        if (v55)
        {
          swift_bridgeObjectRelease();
          int v59 = 0;
          char v60 = 2;
          goto LABEL_43;
        }
        uint64_t v83 = v56;
        if (v110 == 1) {
          break;
        }
        uint64_t v82 = v47;
        uint64_t v89 = *(void *)(v89 + 72);
        unint64_t v61 = v83 + v89 + v52;
        uint64_t v49 = 1;
        uint64_t v8 = v92;
        uint64_t v62 = v93;
        while (1)
        {
          v90((uint64_t)v8, v61, v62);
          uint64_t v63 = v49 + 1;
          if (__OFADD__(v49, 1)) {
            break;
          }
          uint64_t v47 = sub_3ED28();
          v57(v8, v62);
          if (v47)
          {
            swift_bridgeObjectRelease();
            int v59 = 0;
            char v60 = 2;
            goto LABEL_50;
          }
          ++v49;
          v61 += v89;
          if (v63 == v110)
          {
            swift_bridgeObjectRelease();
            char v60 = 3;
            int v59 = 1;
LABEL_50:
            unint64_t v48 = v84;
            uint64_t v8 = v85;
            uint64_t v47 = v82;
            goto LABEL_51;
          }
        }
        __break(1u);
LABEL_64:
        swift_once();
      }
      swift_bridgeObjectRelease();
      char v60 = 3;
      int v59 = 1;
LABEL_43:
      unint64_t v48 = v84;
      uint64_t v8 = v85;
LABEL_51:
      if (!v47)
      {
        uint64_t v100 = 0;
        unint64_t v101 = 0xE000000000000000;
        sub_3F238(44);
        v113._countAndFlagsBits = 0x74276E646C756F43;
        v113._object = (void *)0xEE0020646E696620;
        sub_3EE18(v113);
        LOBYTE(v97) = v60;
        sub_3F348();
        v114._countAndFlagsBits = 0xD00000000000001CLL;
        v114._object = (void *)0x8000000000044050;
        sub_3EE18(v114);
        a6 = v100;
        unint64_t v39 = v101;
        goto LABEL_55;
      }
      if (v59)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v65 = sub_3F5A8();
        swift_bridgeObjectRelease();
        if ((v65 & 1) == 0)
        {
          uint64_t v74 = (objc_class *)type metadata accessor for PhonemeString();
          uint64_t v75 = objc_allocWithZone(v74);
          id v76 = (NSObject **)&v75[OBJC_IVAR___PhonemeString_symbols];
          NSObject *v76 = v48;
          v76[1] = v47;
          v75[OBJC_IVAR___PhonemeString_encoding] = 2;
          double v77 = &v75[OBJC_IVAR___PhonemeString_boundary];
          *double v77 = 32;
          v77[1] = 0xE100000000000000;
          v99.receiver = v75;
          v99.super_class = v74;
          uint64_t v73 = objc_msgSendSuper2(&v99, "init", v82);
LABEL_61:
          int v78 = v73;
          int v79 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
          int v80 = v78;
          a6 = v79;
          uint64_t v81 = sub_30638(v80, 2);
          if (!v8)
          {
            a6 = v81;

            return a6;
          }
          goto LABEL_57;
        }
      }
      uint64_t v100 = v48;
      unint64_t v101 = v47;
      uint64_t v97 = 32;
      unint64_t v98 = 0xE100000000000000;
      uint64_t v95 = 0;
      unint64_t v96 = 0xE000000000000000;
      sub_6688();
      uint64_t v66 = sub_3F0D8();
      uint64_t v68 = v67;
      swift_bridgeObjectRelease();
      uint64_t v69 = (objc_class *)type metadata accessor for PhonemeString();
      uint64_t v70 = objc_allocWithZone(v69);
      char v71 = (uint64_t *)&v70[OBJC_IVAR___PhonemeString_symbols];
      uint64_t *v71 = v66;
      v71[1] = v68;
      v70[OBJC_IVAR___PhonemeString_encoding] = 3;
      uint64_t v72 = &v70[OBJC_IVAR___PhonemeString_boundary];
      *uint64_t v72 = 0;
      v72[1] = 0xE000000000000000;
      v94.receiver = v70;
      v94.super_class = v69;
      uint64_t v73 = objc_msgSendSuper2(&v94, "init", v82);
      goto LABEL_61;
    }
    if (qword_527A8 != -1) {
      swift_once();
    }
    sub_60E8(v14, (uint64_t)qword_57CC8);
    swift_bridgeObjectRetain_n();
    unint64_t v31 = sub_3EC48();
    os_log_type_t v32 = sub_3EFC8();
    if (os_log_type_enabled(v31, v32))
    {
      int v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v105 = swift_slowAlloc();
      *(_DWORD *)int v33 = 136315138;
      swift_bridgeObjectRetain();
      v104[0] = sub_2B8C8(a1, (unint64_t)a2, (uint64_t *)&v105);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v31, v32, "Couldn't find contact for Siri's current pronunciation for contactID: %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v105 = 0;
    unint64_t v106 = 0xE000000000000000;
    sub_3F238(38);
    swift_bridgeObjectRelease();
    uint64_t v105 = 0xD000000000000024;
    unint64_t v106 = 0x8000000000043F90;
    v112._countAndFlagsBits = a1;
    v112._object = a2;
    sub_3EE18(v112);
    a6 = v105;
    unint64_t v41 = v106;
    sub_32654();
    swift_allocError();
    *os_log_type_t v42 = a6;
    v42[1] = v41;
    goto LABEL_9;
  }
  return a6;
}

uint64_t sub_2F94C(char a1)
{
  return qword_424F0[a1];
}

uint64_t sub_2F96C@<X0>(uint64_t (*a1)(_OWORD *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v33 = a2 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v34 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  int64_t v38 = v9;
  uint64_t v39 = v4;
  uint64_t v37 = (v7 - 1) & v7;
  for (unint64_t i = __clz(__rbit64(v7)) | (v9 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v12 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void *)(a2 + 56) + 120 * i;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void *)(v18 + 8);
    uint64_t v22 = *(void *)(v18 + 16);
    uint64_t v21 = *(void *)(v18 + 24);
    uint64_t v23 = *(void *)(v18 + 40);
    uint64_t v40 = *(void *)(v18 + 48);
    uint64_t v24 = *(void *)(v18 + 56);
    uint64_t v25 = *(void *)(v18 + 64);
    uint64_t v26 = *(void *)(v18 + 88);
    uint64_t v56 = *(void *)(v18 + 80);
    uint64_t v42 = *(void *)(v18 + 96);
    uint64_t v41 = *(void *)(v18 + 104);
    char v27 = *(unsigned char *)(v18 + 32);
    char v28 = *(unsigned char *)(v18 + 72);
    char v29 = *(unsigned char *)(v18 + 112);
    *(void *)&long long v47 = v17;
    *((void *)&v47 + 1) = v16;
    *(void *)&long long v48 = v19;
    *((void *)&v48 + 1) = v20;
    *(void *)&long long v49 = v22;
    *((void *)&v49 + 1) = v21;
    LOBYTE(v50) = v27;
    *((void *)&v50 + 1) = v23;
    *(void *)&long long v51 = v40;
    *((void *)&v51 + 1) = v24;
    *(void *)&long long v52 = v25;
    BYTE8(v52) = v28;
    *(void *)&long long v53 = v56;
    *((void *)&v53 + 1) = v26;
    *(void *)&long long v54 = v42;
    *((void *)&v54 + 1) = v41;
    char v55 = v29;
    v45[6] = v53;
    v45[7] = v54;
    char v46 = v29;
    v45[2] = v49;
    v45[3] = v50;
    v45[4] = v51;
    v45[5] = v52;
    v45[0] = v47;
    v45[1] = v48;
    swift_bridgeObjectRetain();
    sub_11390(v19);
    sub_11390(v23);
    sub_11390(v56);
    char v30 = a1(v45);
    uint64_t v4 = v39;
    if (v39)
    {
      sub_328C8(&v47);
      return swift_release();
    }
    if (v30)
    {
      swift_release();
      v43[6] = v53;
      v43[7] = v54;
      char v44 = v55;
      v43[2] = v49;
      v43[3] = v50;
      v43[4] = v51;
      void v43[5] = v52;
      v43[0] = v47;
      v43[1] = v48;
      nullsub_1(v43);
      unint64_t v31 = v43;
      return sub_24418((uint64_t)v31, a3, &qword_53CA8);
    }
    uint64_t result = (uint64_t)sub_328C8(&v47);
    unint64_t v7 = v37;
    int64_t v9 = v38;
    if (v37) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v11 = __OFADD__(v9, 1);
    int64_t v12 = v9 + 1;
    if (v11) {
      break;
    }
    if (v12 >= v34) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v33 + 8 * v12);
    if (!v13)
    {
      int64_t v14 = v12 + 1;
      if (v12 + 1 >= v34) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v14);
      if (v13) {
        goto LABEL_16;
      }
      int64_t v14 = v12 + 2;
      if (v12 + 2 >= v34) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v14);
      if (v13) {
        goto LABEL_16;
      }
      int64_t v14 = v12 + 3;
      if (v12 + 3 >= v34) {
        goto LABEL_28;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v14);
      if (v13)
      {
LABEL_16:
        int64_t v12 = v14;
        goto LABEL_17;
      }
      int64_t v14 = v12 + 4;
      if (v12 + 4 < v34)
      {
        unint64_t v13 = *(void *)(v33 + 8 * v14);
        if (!v13)
        {
          while (1)
          {
            int64_t v12 = v14 + 1;
            if (__OFADD__(v14, 1)) {
              goto LABEL_31;
            }
            if (v12 >= v34) {
              goto LABEL_28;
            }
            unint64_t v13 = *(void *)(v33 + 8 * v12);
            ++v14;
            if (v13) {
              goto LABEL_17;
            }
          }
        }
        goto LABEL_16;
      }
LABEL_28:
      swift_release();
      sub_32998((uint64_t)&v47);
      unint64_t v31 = &v47;
      return sub_24418((uint64_t)v31, a3, &qword_53CA8);
    }
LABEL_17:
    int64_t v38 = v12;
    uint64_t v39 = v4;
    uint64_t v37 = (v13 - 1) & v13;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

id sub_2FCA8(uint64_t a1, id a2)
{
  uint64_t v3 = v2;
  sub_62C4(&qword_52BE0);
  unint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_41AB0;
  unint64_t v7 = (void *)CNContactPhonemeDataKey;
  *(void *)(v6 + 32) = CNContactPhonemeDataKey;
  *(void *)(v6 + 40) = CNContactGivenNameKey;
  *(void *)(v6 + 48) = CNContactFamilyNameKey;
  *(void *)(v6 + 56) = CNContactNicknameKey;
  uint64_t v8 = self;
  id v9 = v7;
  uint64_t v10 = CNContactGivenNameKey;
  BOOL v11 = CNContactFamilyNameKey;
  int64_t v12 = CNContactNicknameKey;
  *(void *)(v6 + 64) = [v8 descriptorForRequiredKeysForStyle:0];
  uint64_t v42 = v6;
  sub_3EED8();
  unint64_t v13 = (void *)CNContactPronunciationGivenNameKey;
  int64_t v14 = (void *)CNContactPronunciationFamilyNameKey;
  if (v6 >> 62)
  {
    id v33 = CNContactPronunciationGivenNameKey;
    id v34 = v14;
    swift_bridgeObjectRetain();
    id v15 = (id)sub_3F378();
    swift_bridgeObjectRelease();
    uint64_t v18 = (uint64_t)v15 + 2;
    if (!__OFADD__(v15, 2))
    {
LABEL_3:
      sub_31974(v18);
      sub_3EED8();
      id v15 = v13;
      sub_3EE98();
      if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) < *(void *)((char *)&dword_18
                                                                                   + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    id v15 = *(id *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8));
    id v16 = CNContactPronunciationGivenNameKey;
    id v17 = v14;
    uint64_t v18 = (uint64_t)v15 + 2;
    if (!__OFADD__(v15, 2)) {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_15:
  sub_3EEE8();
LABEL_4:
  sub_3EF08();
  sub_3EED8();
  swift_unknownObjectRetain();
  sub_3EE98();
  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_3EEE8();
  sub_3EF08();
  sub_3EED8();

  uint64_t v19 = self;
  sub_62C4((uint64_t *)&unk_536F0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_40160;
  *(void *)(v20 + 32) = a1;
  *(void *)(v20 + 40) = a2;
  swift_bridgeObjectRetain();
  Class isa = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  id v22 = [v19 predicateForContactsWithIdentifiers:isa];

  uint64_t v23 = *(void **)(v3 + 16);
  sub_62C4((uint64_t *)&unk_53C90);
  Class v24 = sub_3EEA8().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v42 = 0;
  id v25 = [v23 unifiedContactsMatchingPredicate:v22 keysToFetch:v24 error:&v42];

  id v26 = (id)v42;
  if (!v25)
  {
    id v32 = (id)v42;
    sub_3E488();

    goto LABEL_11;
  }
  sub_BA34(0, (unint64_t *)&qword_53700);
  unint64_t v27 = sub_3EEB8();
  id v28 = v26;

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_3F378();
    swift_bridgeObjectRelease();
    if (v35 >= 2) {
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    unint64_t v29 = sub_3F378();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v29 = *(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8));
    if (v29 > 1)
    {
LABEL_9:
      swift_bridgeObjectRelease();
      uint64_t v42 = 0;
      unint64_t v43 = 0xE000000000000000;
      sub_3F238(42);
      swift_bridgeObjectRelease();
      uint64_t v42 = 0xD000000000000028;
      unint64_t v43 = 0x8000000000043F40;
      v44._countAndFlagsBits = a1;
      v44._object = a2;
      sub_3EE18(v44);
      uint64_t v30 = v42;
      a2 = (id)v43;
      sub_32654();
      swift_allocError();
      uint64_t *v31 = v30;
      v31[1] = (uint64_t)a2;
LABEL_11:
      swift_willThrow();

      return a2;
    }
  }
  if (v29)
  {
    if ((v27 & 0xC000000000000001) != 0)
    {
      a2 = (id)sub_3F278();
      goto LABEL_22;
    }
    a1 = v41;
    if (*(void *)((char *)&dword_10 + (v27 & 0xFFFFFFFFFFFFFF8)))
    {
      a2 = *(id *)(v27 + 32);
LABEL_22:

      swift_bridgeObjectRelease();
      return a2;
    }
    __break(1u);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
LABEL_31:
  }
    swift_once();
  uint64_t v36 = sub_3EC68();
  sub_60E8(v36, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain_n();
  uint64_t v37 = sub_3EC48();
  os_log_type_t v38 = sub_3EFC8();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315138;
    swift_bridgeObjectRetain();
    sub_2B8C8(a1, (unint64_t)a2, &v42);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v37, v38, "No matching contacts found for Siri current pronunciation for %s", v39, 0xCu);
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

uint64_t sub_30310(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v2 == _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0()
    && v1 == v3)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = sub_3F5A8();
  }
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_3038C()
{
  sub_66DC(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for ContactPronunciationController()
{
  return self;
}

void sub_30408()
{
  unk_53AF6 = -4864;
}

void sub_30438()
{
  qword_53AF8 = 0x656372756F73;
  unk_53B00 = 0xE600000000000000;
}

id sub_30458(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for PhonemeString();
  uint64_t v4 = qword_52790;
  char v5 = v2;
  if (v4 != -1) {
    swift_once();
  }
  unint64_t v6 = (void *)sub_3F048();
  sub_BA34(0, (unint64_t *)&unk_53520);
  if (qword_52798 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_3F048();
  if (!v7)
  {
    if (v6)
    {
LABEL_11:

LABEL_13:
      type metadata accessor for ContactPronunciation();
      swift_deallocPartialClassInstance();
      return 0;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = sub_3ED78();
  BOOL v11 = v10;

  if (!v6) {
    goto LABEL_12;
  }
  if (!v11) {
    goto LABEL_11;
  }
  char v12 = sub_32560(v9, v11);
  if (v12 == 5) {
    goto LABEL_11;
  }
  *(void *)&v5[OBJC_IVAR___ContactPronunciation_phonemeString] = v6;
  v5[OBJC_IVAR___ContactPronunciation_source] = v12;

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for ContactPronunciation();
  id v13 = objc_msgSendSuper2(&v15, "init");

  return v13;
}

char *sub_30638(unsigned char *a1, char a2)
{
  if (a2 == 2)
  {
    uint64_t v5 = OBJC_IVAR___PhonemeString_encoding;
    switch(a1[OBJC_IVAR___PhonemeString_encoding])
    {
      case 3:
LABEL_10:
        id v13 = v2;
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_12;
      default:
        char v11 = sub_3F5A8();
        char v12 = v2;
        swift_bridgeObjectRelease();
        if (v11) {
          goto LABEL_12;
        }
        switch(a1[v5])
        {
          case 2:
            goto LABEL_11;
          default:
            char v16 = sub_3F5A8();
            swift_bridgeObjectRelease();
            if (v16) {
              goto LABEL_12;
            }

            sub_32874();
            swift_allocError();
            *uint64_t v9 = 0xD000000000000029;
            uint64_t v10 = "TMDC pronunciation is not in L&H or sampa";
            break;
        }
        break;
    }
    goto LABEL_16;
  }
  if (!a2)
  {
    switch(a1[OBJC_IVAR___PhonemeString_encoding])
    {
      case 2:
        goto LABEL_10;
      default:
        char v7 = sub_3F5A8();
        uint64_t v8 = v2;
        swift_bridgeObjectRelease();
        if (v7) {
          goto LABEL_12;
        }

        sub_32874();
        swift_allocError();
        *uint64_t v9 = 0xD000000000000021;
        uint64_t v10 = "TTS pronunciation is not in sampa";
        break;
    }
LABEL_16:
    v9[1] = (unint64_t)(v10 - 32) | 0x8000000000000000;
    swift_willThrow();

    type metadata accessor for ContactPronunciation();
    swift_deallocPartialClassInstance();
    return v2;
  }
  unint64_t v6 = v2;
LABEL_12:
  *(void *)&v2[OBJC_IVAR___ContactPronunciation_phonemeString] = a1;
  v2[OBJC_IVAR___ContactPronunciation_source] = a2;
  int64_t v14 = a1;

  v17.receiver = v2;
  v17.super_class = (Class)type metadata accessor for ContactPronunciation();
  uint64_t v2 = (char *)objc_msgSendSuper2(&v17, "init");

  return v2;
}

uint64_t sub_309F4()
{
  uint64_t v1 = v0;
  BYTE8(v8) = 0;
  sub_3F238(33);
  v9._object = (void *)0x8000000000043F20;
  v9._countAndFlagsBits = 0xD000000000000011;
  sub_3EE18(v9);
  id v2 = *(id *)(v0 + OBJC_IVAR___ContactPronunciation_phonemeString);
  id v3 = [v2 description];
  uint64_t v4 = sub_3ED78();
  unint64_t v6 = v5;

  v10._countAndFlagsBits = v4;
  v10._object = v6;
  sub_3EE18(v10);

  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0x656372756F73202CLL;
  v11._object = (void *)0xEA0000000000203ALL;
  sub_3EE18(v11);
  *(void *)&long long v8 = *(unsigned __int8 *)(v1 + OBJC_IVAR___ContactPronunciation_source);
  sub_3F348();
  v12._countAndFlagsBits = 32032;
  v12._object = (void *)0xE200000000000000;
  sub_3EE18(v12);
  return *(void *)((char *)&v8 + 1);
}

uint64_t sub_30B28(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_AC94(a1, (uint64_t)v8);
  if (!v9)
  {
    sub_AC34((uint64_t)v8);
    goto LABEL_7;
  }
  type metadata accessor for ContactPronunciation();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    char v5 = 0;
    return v5 & 1;
  }
  sub_BA34(0, &qword_52D80);
  id v3 = *(id *)&v7[OBJC_IVAR___ContactPronunciation_phonemeString];
  char v4 = sub_3F068();

  if ((v4 & 1) == 0)
  {

    goto LABEL_7;
  }
  char v5 = sub_2E38C(*(unsigned char *)(v2 + OBJC_IVAR___ContactPronunciation_source), v7[OBJC_IVAR___ContactPronunciation_source]);

  return v5 & 1;
}

void sub_30C98(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___ContactPronunciation_phonemeString);
  if (qword_52790 != -1) {
    swift_once();
  }
  NSString v4 = sub_3ED48();
  [a1 encodeObject:v3 forKey:v4];

  NSString v5 = sub_3ED48();
  swift_bridgeObjectRelease();
  if (qword_52798 != -1) {
    swift_once();
  }
  NSString v6 = sub_3ED48();
  [a1 encodeObject:v5 forKey:v6];
}

uint64_t sub_30E80(char a1)
{
  if (a1) {
    return 0x656372756F73;
  }
  else {
    return 0x53656D656E6F6870;
  }
}

uint64_t sub_30EC0()
{
  return sub_30E80(*v0);
}

uint64_t sub_30EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_32C14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_30EF0(uint64_t a1)
{
  unint64_t v2 = sub_318CC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_30F2C(uint64_t a1)
{
  unint64_t v2 = sub_318CC();

  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_30F68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactPronunciation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContactPronunciation()
{
  return self;
}

uint64_t sub_30FD0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_62C4((uint64_t *)&unk_53C70);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_6280(a1, a1[3]);
  sub_318CC();
  sub_3F688();
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR___ContactPronunciation_phonemeString);
  v10[7] = 0;
  type metadata accessor for PhonemeString();
  sub_3282C(&qword_52C28, (void (*)(uint64_t))type metadata accessor for PhonemeString);
  sub_3F558();
  if (!v2)
  {
    v10[6] = *(unsigned char *)(v3 + OBJC_IVAR___ContactPronunciation_source);
    v10[5] = 1;
    sub_32600();
    sub_3F558();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_311A8(void *a1)
{
  uint64_t v4 = sub_62C4(&qword_53C48);
  uint64_t v15 = *(void *)(v4 - 8);
  uint64_t v16 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_6280(a1, a1[3]);
  sub_318CC();
  long long v8 = v1;
  id v9 = v7;
  sub_3F678();
  if (v2)
  {
    sub_66DC((uint64_t)a1);

    type metadata accessor for ContactPronunciation();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v10 = v15;
    type metadata accessor for PhonemeString();
    char v18 = 0;
    sub_3282C(&qword_52BF8, (void (*)(uint64_t))type metadata accessor for PhonemeString);
    uint64_t v11 = v16;
    sub_3F498();
    *(void *)&v8[OBJC_IVAR___ContactPronunciation_phonemeString] = v19;
    char v18 = 1;
    sub_31920();
    sub_3F498();
    v8[OBJC_IVAR___ContactPronunciation_source] = v19;

    id v13 = (objc_class *)type metadata accessor for ContactPronunciation();
    v17.receiver = v8;
    v17.super_class = v13;
    id v9 = objc_msgSendSuper2(&v17, "init");
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v11);
    sub_66DC((uint64_t)a1);
  }
  return v9;
}

id sub_3144C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
  id result = sub_311A8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_314A0(void *a1)
{
  return sub_30FD0(a1);
}

uint64_t sub_314C4(char *a1, char *a2)
{
  return sub_2E38C(*a1, *a2);
}

Swift::Int sub_314D0()
{
  return sub_2E714();
}

uint64_t sub_314D8()
{
  return sub_2E894();
}

Swift::Int sub_314E0()
{
  return sub_2EAD0();
}

uint64_t sub_314E8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_32560(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_31518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2F94C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_31544()
{
  return sub_3EE88();
}

uint64_t sub_315A4()
{
  return sub_3EE78();
}

uint64_t type metadata accessor for ContactPronunciationValueTransformer()
{
  return self;
}

uint64_t getEnumTagSinglePayload for ContactPronunciationSource(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactPronunciationSource(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x3183CLL);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPronunciationSource()
{
  return &type metadata for ContactPronunciationSource;
}

unint64_t sub_31878()
{
  unint64_t result = qword_53C40;
  if (!qword_53C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53C40);
  }
  return result;
}

unint64_t sub_318CC()
{
  unint64_t result = qword_53C50;
  if (!qword_53C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53C50);
  }
  return result;
}

unint64_t sub_31920()
{
  unint64_t result = qword_53C60;
  if (!qword_53C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53C60);
  }
  return result;
}

uint64_t sub_31974(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_3F378();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_3F288();
    uint64_t *v1 = result;
  }
  return result;
}

uint64_t sub_31A34(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_3EA38();
  unint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = (void (*)(char *, unint64_t, uint64_t))sub_3E478();
  unint64_t v12 = *((void *)v11 - 1);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24418(a1, (uint64_t)v40, (uint64_t *)&unk_53CC0);
  if (*((void *)&v40[0] + 1) == 1) {
    return 0;
  }
  v40[4] = v40[0];
  v41[0] = v40[1];
  v41[1] = v40[2];
  v41[2] = v40[3];
  sub_24418((uint64_t)v41, (uint64_t)v42, &qword_53AD0);
  sub_24418((uint64_t)v42, (uint64_t)&v43, &qword_53AD0);
  unint64_t v15 = v44;
  if (!v44) {
    return 0;
  }
  uint64_t v33 = v43;
  uint64_t v38 = v43;
  unint64_t v39 = v44;
  if (qword_527A0 != -1) {
    goto LABEL_32;
  }
  while (1)
  {
    sub_60E8((uint64_t)v11, (uint64_t)qword_53CF0);
    sub_3E468();
    sub_6688();
    sub_3F0B8();
    char v17 = v16;
    (*(void (**)(char *, void (*)(char *, unint64_t, uint64_t)))(v12 + 8))(v14, v11);
    unint64_t v12 = v5 + 16;
    uint64_t v11 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v11(v10, a2, v4);
    if (v17)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return 2;
    }
    if (qword_52778 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_57CC0;
    uint64_t v36 = *(void *)(qword_57CC0 + 16);
    if (!v36)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      goto LABEL_20;
    }
    unint64_t v32 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v11(v8, qword_57CC0 + v32, v4);
    uint64_t v19 = sub_3282C((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
    swift_bridgeObjectRetain();
    uint64_t v35 = v19;
    char v20 = sub_3ED28();
    uint64_t v21 = v18;
    a2 = v5 + 8;
    uint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
    v37(v8, v4);
    if (v20) {
      break;
    }
    uint64_t v31 = v21;
    if (v36 == 1)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      v37(v10, v4);
      goto LABEL_20;
    }
    v29[1] = a2 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    unint64_t v30 = v15;
    uint64_t v34 = *(void *)(v5 + 72);
    uint64_t v14 = (char *)(v31 + v34 + v32);
    unint64_t v15 = 1;
    while (1)
    {
      v11(v8, (unint64_t)v14, v4);
      unint64_t v5 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      char v23 = sub_3ED28();
      v37(v8, v4);
      if (v23)
      {
        swift_bridgeObjectRelease();
        unint64_t v15 = v30;
        goto LABEL_26;
      }
      ++v15;
      v14 += v34;
      if (v5 == v36) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_32:
    swift_once();
  }
  swift_bridgeObjectRelease();
LABEL_26:
  if ((v15 & 0x2000000000000000) != 0) {
    uint64_t v28 = HIBYTE(v15) & 0xF;
  }
  else {
    uint64_t v28 = v33 & 0xFFFFFFFFFFFFLL;
  }
  v37(v10, v4);
  if (v28) {
    return 2;
  }
LABEL_20:
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_3EC68();
  sub_60E8(v24, (uint64_t)qword_57CC8);
  id v25 = sub_3EC48();
  os_log_type_t v26 = sub_3EFC8();
  if (os_log_type_enabled(v25, v26))
  {
    unint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v27 = 0;
    _os_log_impl(&dword_0, v25, v26, "Source is unknown since ttsData in phonemeData doesn't have LNH phonemes", v27, 2u);
    swift_slowDealloc();
  }

  return 4;
}

uint64_t sub_32034(void *a1, char a2, unint64_t a3)
{
  if (sub_21C48())
  {
    uint64_t v6 = sub_2C9AC(a1);
    if (!v6) {
      return 0;
    }
    uint64_t v7 = v6;
    __chkstk_darwin(v6);
    sub_2F96C((uint64_t (*)(_OWORD *))sub_32D10, v7, (uint64_t)v48);
    swift_bridgeObjectRelease();
    sub_24418((uint64_t)v48, (uint64_t)v49, &qword_53CA8);
    sub_24418((uint64_t)v49, (uint64_t)v50, &qword_53CA8);
    if (sub_326C8((uint64_t)v50) == 1) {
      return 0;
    }
    swift_bridgeObjectRelease();
    uint64_t v18 = v51;
    uint64_t v19 = v52;
    uint64_t v20 = v53;
    if (a2)
    {
      if (a2 == 1)
      {
        unint64_t v47 = a3;
        if (v52 && *(void *)(v52 + 16))
        {
          uint64_t v22 = *(void *)(v52 + 32);
          uint64_t v21 = *(void *)(v52 + 40);
          uint64_t v23 = *(void *)(v52 + 56);
          uint64_t v43 = *(unsigned __int8 *)(v52 + 72);
          uint64_t v45 = *(void *)(v52 + 64);
          uint64_t v41 = *(void *)(v52 + 80);
          uint64_t v35 = *(void *)(v52 + 48);
          uint64_t v37 = *(void *)(v52 + 88);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v39 = v23;
          swift_bridgeObjectRetain();
          uint64_t v24 = v21;
          uint64_t v25 = v35;
        }
        else
        {
          uint64_t v22 = 0;
          uint64_t v25 = 0;
          uint64_t v39 = 0;
          uint64_t v41 = 0;
          uint64_t v43 = 0;
          uint64_t v45 = 0;
          uint64_t v37 = 0;
          uint64_t v24 = 1;
        }
        sub_1148C(v18);
        sub_1148C(v19);
        sub_1148C(v20);
        uint64_t v54 = v22;
        uint64_t v55 = v24;
        uint64_t v56 = v25;
        uint64_t v57 = v39;
        uint64_t v58 = v45;
        uint64_t v59 = v43;
        uint64_t v60 = v41;
        uint64_t v61 = v37;
        uint64_t v8 = sub_31A34((uint64_t)&v54, v47);
        uint64_t v32 = v22;
        uint64_t v33 = v24;
        goto LABEL_26;
      }
      if (v53 && *(void *)(v53 + 16))
      {
        uint64_t v27 = *(void *)(v53 + 32);
        uint64_t v26 = *(void *)(v53 + 40);
        uint64_t v28 = *(void *)(v53 + 56);
        uint64_t v36 = *(void *)(v53 + 48);
        uint64_t v44 = *(unsigned __int8 *)(v53 + 72);
        uint64_t v46 = *(void *)(v53 + 64);
        uint64_t v30 = *(void *)(v53 + 80);
        uint64_t v29 = *(void *)(v53 + 88);
        goto LABEL_21;
      }
    }
    else if (v51 && *(void *)(v51 + 16))
    {
      uint64_t v27 = *(void *)(v51 + 32);
      uint64_t v26 = *(void *)(v51 + 40);
      uint64_t v28 = *(void *)(v51 + 56);
      uint64_t v36 = *(void *)(v51 + 48);
      uint64_t v44 = *(unsigned __int8 *)(v51 + 72);
      uint64_t v46 = *(void *)(v51 + 64);
      uint64_t v30 = *(void *)(v51 + 80);
      uint64_t v29 = *(void *)(v51 + 88);
LABEL_21:
      uint64_t v42 = v30;
      uint64_t v38 = v29;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v40 = v28;
      swift_bridgeObjectRetain();
      uint64_t v31 = v36;
LABEL_23:
      sub_1148C(v18);
      sub_1148C(v19);
      sub_1148C(v20);
      uint64_t v54 = v27;
      uint64_t v55 = v26;
      uint64_t v56 = v31;
      uint64_t v57 = v40;
      uint64_t v58 = v46;
      uint64_t v59 = v44;
      uint64_t v60 = v42;
      uint64_t v61 = v38;
      uint64_t v8 = sub_31A34((uint64_t)&v54, a3);
      uint64_t v32 = v27;
      uint64_t v33 = v26;
LABEL_26:
      sub_329B4(v32, v33);
      return v8;
    }
    uint64_t v27 = 0;
    uint64_t v31 = 0;
    uint64_t v40 = 0;
    uint64_t v42 = 0;
    uint64_t v44 = 0;
    uint64_t v46 = 0;
    uint64_t v38 = 0;
    uint64_t v26 = 1;
    goto LABEL_23;
  }
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_3EC68();
  sub_60E8(v9, (uint64_t)qword_57CC8);
  id v10 = a1;
  uint64_t v11 = sub_3EC48();
  os_log_type_t v12 = sub_3EFB8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    v50[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    id v14 = [v10 identifier];
    uint64_t v15 = sub_3ED78();
    unint64_t v17 = v16;

    v49[0] = sub_2B8C8(v15, v17, v50);
    sub_3F088();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "User has overridden the pronunciation in the UI for contactID: %s", v13, 0xCu);
    uint64_t v8 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    return 1;
  }
  return v8;
}

uint64_t sub_32560(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4D730;
  v6._object = a2;
  unint64_t v4 = sub_3F3F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

unint64_t sub_325AC()
{
  unint64_t result = qword_53C68;
  if (!qword_53C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53C68);
  }
  return result;
}

unint64_t sub_32600()
{
  unint64_t result = qword_53C80;
  if (!qword_53C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53C80);
  }
  return result;
}

unint64_t sub_32654()
{
  unint64_t result = qword_53CA0;
  if (!qword_53CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53CA0);
  }
  return result;
}

uint64_t sub_326A8(uint64_t *a1)
{
  return sub_30310(a1) & 1;
}

uint64_t sub_326C8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t *sub_326E0(uint64_t *a1)
{
  return a1;
}

void sub_32744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    sub_1148C(a3);
    sub_1148C(a8);
    sub_1148C(a13);
  }
}

uint64_t sub_3282C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_32874()
{
  unint64_t result = qword_53CB8;
  if (!qword_53CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53CB8);
  }
  return result;
}

void *sub_328C8(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[12];
  swift_bridgeObjectRelease();
  sub_1148C(v2);
  sub_1148C(v4);
  sub_1148C(v5);
  return a1;
}

double sub_32998(uint64_t a1)
{
  *(unsigned char *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_329B4(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ContactPronunciation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x32AD4);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPronunciation.CodingKeys()
{
  return &type metadata for ContactPronunciation.CodingKeys;
}

unint64_t sub_32B10()
{
  unint64_t result = qword_53CD0;
  if (!qword_53CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53CD0);
  }
  return result;
}

unint64_t sub_32B68()
{
  unint64_t result = qword_53CD8;
  if (!qword_53CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53CD8);
  }
  return result;
}

unint64_t sub_32BC0()
{
  unint64_t result = qword_53CE0;
  if (!qword_53CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53CE0);
  }
  return result;
}

uint64_t sub_32C14(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x53656D656E6F6870 && a2 == 0xED0000676E697274;
  if (v3 || (sub_3F5A8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656372756F73 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_3F5A8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_32D10(uint64_t *a1)
{
  return sub_326A8(a1) & 1;
}

uint64_t sub_32D2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_3F5A8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_3F5A8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void *sub_32DF4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_3A758(0, v1, 0);
    uint64_t v3 = a1 + 56;
    do
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_3EDD8();
      uint64_t v6 = v5;
      swift_bridgeObjectRelease();
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_3A758(v7 > 1, v8 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v8 + 1;
      uint64_t v9 = &_swiftEmptyArrayStorage[2 * v8];
      v9[4] = v4;
      v9[5] = v6;
      v3 += 32;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_32EF4(char a1)
{
  return *(void *)&aNvasr_6[8 * a1];
}

uint64_t sub_32F14(char *a1, char *a2)
{
  return sub_2E27C(*a1, *a2);
}

Swift::Int sub_32F20()
{
  return sub_2E780();
}

uint64_t sub_32F28()
{
  return sub_2E7EC();
}

Swift::Int sub_32F30()
{
  return sub_2EBA0();
}

uint64_t sub_32F38@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_3A568(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_32F68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_32EF4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_32F94(void *a1@<X8>)
{
  *a1 = &off_4D860;
}

uint64_t sub_32FA4(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
LABEL_50:
    uint64_t result = sub_3F368();
    __break(1u);
  }
  else
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = _swiftEmptyArrayStorage;
    uint64_t v9 = swift_allocObject();
    uint64_t v10 = v9;
    *(void *)(v9 + 16) = 15;
    uint64_t v11 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      uint64_t v12 = (a4 & 0x2000000000000000) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        uint64_t v41 = a1;
        unint64_t v45 = 4 * v12;
        uint64_t v13 = _swiftEmptyArrayStorage;
        unint64_t v14 = 15;
        unint64_t v15 = 15;
        uint64_t v42 = (void *)a3;
        uint64_t v43 = v9;
        while (1)
        {
          uint64_t v16 = sub_3EE58();
          unint64_t v18 = v17;
          if (!((v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : v16 & 0xFFFFFFFFFFFFLL)) {
            break;
          }
          if ((v17 & 0x1000000000000000) != 0)
          {
            uint64_t v20 = sub_3F228();
          }
          else
          {
            if ((v17 & 0x2000000000000000) == 0 && (v16 & 0x1000000000000000) == 0) {
              sub_3F2B8();
            }
            uint64_t v20 = sub_3F2C8();
          }
          uint64_t v4 = v20;
          swift_bridgeObjectRelease();
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || v4 == 133)
          {
            if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
            {
              unint64_t v14 = sub_3EE08();
              *(void *)(v10 + 16) = v14;
              unint64_t v15 = v14;
            }
            else
            {
              if (v14 >> 14 < v15 >> 14) {
                goto LABEL_49;
              }
              unint64_t v21 = a4;
              uint64_t v22 = sub_3EE68();
              uint64_t v24 = v23;
              uint64_t v26 = v25;
              uint64_t v4 = v27;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v13 = sub_17E9C(0, v13[2] + 1, 1, v13);
              }
              uint64_t v28 = v13;
              unint64_t v29 = v13[2];
              uint64_t v30 = v28;
              unint64_t v31 = v28[3];
              if (v29 >= v31 >> 1) {
                uint64_t v30 = sub_17E9C((void *)(v31 > 1), v29 + 1, 1, v30);
              }
              v30[2] = v29 + 1;
              uint64_t v32 = &v30[4 * v29];
              uint64_t v13 = v30;
              v32[4] = v22;
              v32[5] = v24;
              v32[6] = v26;
              _OWORD v32[7] = v4;
              *(void *)(v8 + 16) = v30;
              a4 = v21;
              a3 = (unint64_t)v42;
              unint64_t v15 = sub_3EE08();
              uint64_t v10 = v43;
              *(void *)(v43 + 16) = v15;
              unint64_t v14 = v15;
              if (v13[2] == v41)
              {
LABEL_38:
                if (v45 == v15 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                if (v45 < v15 >> 14)
                {
LABEL_49:
                  sub_3F368();
                  __break(1u);
                  goto LABEL_50;
                }
                a3 = (unint64_t)v13;
                unint64_t v15 = sub_3EE68();
                unint64_t v18 = v34;
                uint64_t v13 = v35;
                uint64_t v4 = v36;
                swift_bridgeObjectRelease();
                if (swift_isUniquelyReferenced_nonNull_native())
                {
LABEL_43:
                  unint64_t v38 = *(void *)(a3 + 16);
                  unint64_t v37 = *(void *)(a3 + 24);
                  if (v38 >= v37 >> 1) {
                    a3 = (unint64_t)sub_17E9C((void *)(v37 > 1), v38 + 1, 1, (void *)a3);
                  }
                  *(void *)(a3 + 16) = v38 + 1;
                  uint64_t v39 = (void *)(a3 + 32 * v38);
                  v39[4] = v15;
                  v39[5] = v18;
                  v39[6] = v13;
                  v39[7] = v4;
                  uint64_t v13 = (void *)a3;
                  *(void *)(v8 + 16) = a3;
                  goto LABEL_46;
                }
LABEL_48:
                a3 = (unint64_t)sub_17E9C(0, *(void *)(a3 + 16) + 1, 1, (void *)a3);
                goto LABEL_43;
              }
            }
          }
          else
          {
            unint64_t v14 = sub_3EE08();
          }
          if (v45 == v14 >> 14) {
            goto LABEL_38;
          }
        }
        __break(1u);
        goto LABEL_48;
      }
    }
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v11 = a3 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v33 = 7;
    if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
      uint64_t v33 = 11;
    }
    sub_34890(v33 | (v11 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v8 + 16);
LABEL_46:
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  return result;
}

uint64_t sub_33478(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  BOOL v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_3F5A8() & 1) != 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a3 + 7;
  uint64_t v11 = 1;
  while (1)
  {
    if (v3 == v11) {
      return 0;
    }
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2) {
      break;
    }
    char v13 = sub_3F5A8();
    uint64_t result = v11++;
    v10 += 2;
    if (v13) {
      return result;
    }
  }
  return v9;
}

uint64_t sub_33560(long long *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a1 + 2);
  long long v39 = *a1;
  uint64_t v40 = v5;
  sub_3A334();
  uint64_t v6 = sub_3F108();
  BOOL v7 = sub_32DF4(v6);
  swift_bridgeObjectRelease();
  uint64_t v8 = *a2;
  uint64_t v38 = *a2 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(*a2 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(*a2 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v35 = v7;
  uint64_t v33 = v7 + 4;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  uint64_t v34 = v8;
  int64_t v36 = v12;
  while (1)
  {
    while (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      if (*(void *)(a3 + 16))
      {
LABEL_23:
        char v20 = *(unsigned char *)(*(void *)(v8 + 48) + v16);
        uint64_t result = sub_34A40(v20);
        if (v21)
        {
          unint64_t v22 = *(void *)(*(void *)(a3 + 56) + 8 * result);
          uint64_t result = (uint64_t)sub_338B0(&v39, v20);
          uint64_t v24 = (uint64_t (*)(long long *, void))result;
          uint64_t v25 = *v23;
          if (*v23)
          {
            if ((v22 & 0x8000000000000000) != 0) {
              goto LABEL_38;
            }
            if (v22 >= v35[2]) {
              goto LABEL_39;
            }
            uint64_t v26 = v23;
            uint64_t v27 = &v33[2 * v22];
            uint64_t v28 = v27[1];
            uint64_t v37 = *v27;
            swift_bridgeObjectRetain();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *uint64_t v26 = v25;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              uint64_t v25 = sub_180BC(0, v25[2] + 1, 1, v25);
              *uint64_t v26 = v25;
            }
            unint64_t v31 = v25[2];
            unint64_t v30 = v25[3];
            if (v31 >= v30 >> 1)
            {
              uint64_t v25 = sub_180BC((void *)(v30 > 1), v31 + 1, 1, v25);
              *uint64_t v26 = v25;
            }
            v25[2] = v31 + 1;
            uint64_t v32 = &v25[2 * v31];
            v32[4] = v37;
            v32[5] = v28;
            uint64_t result = v24(&v39, 0);
            uint64_t v8 = v34;
            int64_t v12 = v36;
          }
          else
          {
            uint64_t result = ((uint64_t (*)(long long *, void))result)(&v39, 0);
            int64_t v12 = v36;
          }
        }
      }
    }
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v14 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v38 + 8 * v14);
    if (!v18) {
      break;
    }
LABEL_22:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
    if (*(void *)(a3 + 16)) {
      goto LABEL_23;
    }
  }
  int64_t v19 = v14 + 1;
  if (v14 + 1 >= v12) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v38 + 8 * v19);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v14 + 2;
  if (v14 + 2 >= v12) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v38 + 8 * v19);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v14 + 3;
  if (v14 + 3 >= v12) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v38 + 8 * v19);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v14 + 4;
  if (v14 + 4 >= v12) {
    goto LABEL_36;
  }
  unint64_t v18 = *(void *)(v38 + 8 * v19);
  if (v18) {
    goto LABEL_21;
  }
  int64_t v19 = v14 + 5;
  if (v14 + 5 >= v12)
  {
LABEL_36:
    swift_bridgeObjectRelease();
    return swift_release();
  }
  unint64_t v18 = *(void *)(v38 + 8 * v19);
  if (v18)
  {
LABEL_21:
    int64_t v14 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v38 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_338B0(void *a1, char a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_386A0(v4, a2);
  return sub_33910;
}

void sub_33910(void *a1)
{
  int64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

void *sub_3395C(uint64_t a1, void *a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  if (!*(void *)(a6 + 16)) {
    goto LABEL_27;
  }
  unint64_t v10 = sub_34A40(a3);
  if ((v11 & 1) == 0 || !*(void *)(a6 + 16)) {
    goto LABEL_27;
  }
  int64_t v12 = *(void **)(*(void *)(a6 + 56) + 8 * v10);
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_34A40(a4);
  if ((v14 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_27:
    sub_3F238(28);
    v43._countAndFlagsBits = 0x74276E646C756F43;
    v43._object = (void *)0xEE0020646E696620;
    sub_3EE18(v43);
    sub_3F348();
    v44._countAndFlagsBits = 0x6E6F6870206E6920;
    v44._object = (void *)0xEC00000074657365;
    sub_3EE18(v44);
LABEL_28:
    unint64_t v29 = (void *)0xE000000000000000;
    sub_349EC();
    swift_allocError();
    *(void *)uint64_t v30 = 0;
    *(void *)(v30 + 8) = 0xE000000000000000;
    *(unsigned char *)(v30 + 16) = 1;
    swift_willThrow();
    return v29;
  }
  uint64_t v15 = *(void *)(*(void *)(a6 + 56) + 8 * v13);
  if ((sub_32D2C(a1, (uint64_t)a2, v12) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_3F238(41);
    v45._countAndFlagsBits = 0x74276E646C756F43;
    v45._object = (void *)0xEE0020646E696620;
    sub_3EE18(v45);
    v46._countAndFlagsBits = a1;
    v46._object = a2;
    sub_3EE18(v46);
    v47._object = (void *)0x8000000000044210;
    v47._countAndFlagsBits = 0xD000000000000017;
    sub_3EE18(v47);
    sub_3F348();
    goto LABEL_28;
  }
  uint64_t v41 = v12[2];
  if (!v41)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    int64_t v32 = _swiftEmptyArrayStorage[2];
    if (v32) {
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  uint64_t v39 = v15;
  swift_bridgeObjectRetain();
  uint64_t v16 = 0;
  unint64_t v17 = (void **)(v12 + 5);
  uint64_t v40 = a1;
  do
  {
    uint64_t v19 = (uint64_t)*(v17 - 1);
    unint64_t v18 = *v17;
    if (a5)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v20 = v19;
      char v21 = v18;
    }
    else
    {
      sub_6688();
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_3F0D8();
      char v21 = v22;
    }
    uint64_t v23 = a5;
    if (v20 == a1 && v21 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v25 = sub_3F5A8();
      swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_3A7B8(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v27 = _swiftEmptyArrayStorage[2];
    unint64_t v26 = _swiftEmptyArrayStorage[3];
    if (v27 >= v26 >> 1) {
      sub_3A7B8(v26 > 1, v27 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v27 + 1;
    uint64_t v28 = &_swiftEmptyArrayStorage[3 * v27];
    v28[4] = v16;
    void v28[5] = v19;
    v28[6] = v18;
    a1 = v40;
LABEL_10:
    v17 += 2;
    ++v16;
    a5 = v23;
  }
  while (v41 != v16);
  swift_bridgeObjectRelease();
  uint64_t v15 = v39;
  int64_t v32 = _swiftEmptyArrayStorage[2];
  if (v32)
  {
LABEL_32:
    sub_3A778(0, v32, 0);
    unint64_t v33 = _swiftEmptyArrayStorage[2];
    uint64_t v34 = 4;
    do
    {
      uint64_t v35 = _swiftEmptyArrayStorage[v34];
      unint64_t v36 = _swiftEmptyArrayStorage[3];
      if (v33 >= v36 >> 1) {
        sub_3A778(v36 > 1, v33 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v33 + 1;
      _swiftEmptyArrayStorage[v33 + 4] = v35;
      v34 += 3;
      ++v33;
      --v32;
    }
    while (v32);
  }
LABEL_38:
  swift_release();
  swift_bridgeObjectRetain();
  sub_38BDC((uint64_t)_swiftEmptyArrayStorage, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  uint64_t v37 = swift_bridgeObjectRetain();
  uint64_t v38 = sub_38D20(v37);
  swift_bridgeObjectRelease();
  unint64_t v29 = sub_354F8(v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t sub_33E9C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if ((*(void *)result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(void *)result >= *(void *)(a2 + 16))
  {
LABEL_9:
    __break(1u);
    return result;
  }
  sub_6688();
  uint64_t result = sub_3F0D8();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    unint64_t v4 = 0;
  }
  *a3 = result;
  a3[1] = v4;
  return result;
}

uint64_t sub_33F70()
{
  uint64_t v0 = sub_3E478();
  sub_39420(v0, qword_53CF0);
  sub_60E8(v0, (uint64_t)qword_53CF0);
  return sub_3E458();
}

uint64_t sub_33FD4(unsigned char *a1, uint64_t a2, char a3)
{
  uint64_t v5 = v4;
  uint64_t v9 = sub_3EC68();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  int64_t v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v13 = a1[OBJC_IVAR___PhonemeString_encoding];
  if (sub_2E510(v13, a2))
  {
    uint64_t v81 = a1;
    char v14 = a2;
    uint64_t v74 = v4;
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_60E8(v9, (uint64_t)qword_57CC8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
    uint64_t v16 = sub_3EC48();
    os_log_type_t v17 = sub_3EFB8();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = (void *)swift_slowAlloc();
      uint64_t v80 = (uint64_t)v19;
      *(_DWORD *)unint64_t v18 = 136315138;
      uint64_t v20 = 8 * v14;
      uint64_t v21 = *(void *)&aNvasr_7[v20];
      uint64_t v83 = v19;
      uint64_t v85 = sub_2B8C8(v21, *(void *)((char *)&unk_426B0 + v20), (uint64_t *)&v83);
      sub_3F088();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v16, v17, "Source encoding is same as target phoneme format: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    sub_62C4(&qword_52BE0);
    uint64_t inited = (void *)swift_initStackObject();
    *((_OWORD *)inited + 1) = xmmword_40170;
    uint64_t v23 = v81;
    inited[4] = v81;
    uint64_t v83 = inited;
    sub_3EED8();
    unint64_t v24 = (unint64_t)v83;
    id v25 = v23;
    uint64_t v5 = sub_392A4(v24);
    goto LABEL_7;
  }
  uint64_t v26 = *(void *)(v3 + 16);
  if (!v26)
  {
    sub_349EC();
    swift_allocError();
    *(void *)uint64_t v32 = 0xD000000000000023;
    *(void *)(v32 + 8) = 0x8000000000044120;
    *(unsigned char *)(v32 + 16) = 0;
LABEL_13:
    swift_willThrow();
    return v5;
  }
  unint64_t v27 = sub_1A094();
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_38DB8((uint64_t)v27, v26, v13, a2, a3 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4) {
    return v5;
  }
  if (!v28[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v83 = 0;
    unint64_t v84 = 0xE000000000000000;
    sub_3F238(53);
    v86._countAndFlagsBits = 0xD000000000000025;
    v86._object = (void *)0x8000000000044150;
    sub_3EE18(v86);
    LOBYTE(v85) = v13;
    sub_3F348();
    v87._countAndFlagsBits = 32;
    v87._object = (void *)0xE100000000000000;
    sub_3EE18(v87);
    id v33 = [a1 description];
    uint64_t v34 = sub_3ED78();
    unint64_t v36 = v35;

    v88._countAndFlagsBits = v34;
    v88._object = v36;
    sub_3EE18(v88);
    swift_bridgeObjectRelease();
    v89._countAndFlagsBits = 0x3A74656772617420;
    v89._object = (void *)0xE900000000000020;
    sub_3EE18(v89);
    LOBYTE(v85) = a2;
    sub_3F348();
    uint64_t v37 = v83;
    unint64_t v38 = v84;
    sub_349EC();
    swift_allocError();
    *(void *)uint64_t v39 = v37;
    *(void *)(v39 + 8) = v38;
    *(unsigned char *)(v39 + 16) = 1;
    goto LABEL_13;
  }
  unint64_t v29 = (void *)v28[4];
  swift_bridgeObjectRetain();
  uint64_t result = sub_38F2C(a2, v26);
  uint64_t v40 = v31;
  uint64_t v70 = v28 + 4;
  uint64_t v41 = v28[2];
  uint64_t v74 = 0;
  uint64_t v80 = result;
  uint64_t v81 = v31;
  if (v41 == 1)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    uint64_t v58 = v29[2];
    if (v58)
    {
      uint64_t v83 = _swiftEmptyArrayStorage;
      sub_3F2F8();
      uint64_t v59 = (objc_class *)type metadata accessor for PhonemeString();
      char v71 = v29;
      uint64_t v60 = v29 + 5;
      uint64_t v61 = v80;
      do
      {
        uint64_t v63 = *(v60 - 1);
        uint64_t v62 = *v60;
        uint64_t v64 = objc_allocWithZone(v59);
        char v65 = &v64[OBJC_IVAR___PhonemeString_symbols];
        void *v65 = v63;
        v65[1] = v62;
        v64[OBJC_IVAR___PhonemeString_encoding] = a2;
        uint64_t v66 = (uint64_t *)&v64[OBJC_IVAR___PhonemeString_boundary];
        *uint64_t v66 = v61;
        v66[1] = (uint64_t)v40;
        v82.receiver = v64;
        v82.super_class = v59;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        objc_msgSendSuper2(&v82, "init");
        sub_3F2D8();
        sub_3F308();
        uint64_t v40 = v81;
        sub_3F318();
        sub_3F2E8();
        v60 += 2;
        --v58;
      }
      while (v58);
      uint64_t v67 = v83;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v67 = _swiftEmptyArrayStorage;
    }
    uint64_t v5 = sub_392A4((unint64_t)v67);
LABEL_7:
    swift_bridgeObjectRelease();
    return v5;
  }
  uint64_t v72 = v28;
  if (v41)
  {
    unint64_t v42 = 1;
    Swift::String v43 = v70;
    uint64_t v68 = a2;
    uint64_t v69 = v41;
    while (v42 != v41)
    {
      if (v42 >= v72[2]) {
        goto LABEL_44;
      }
      uint64_t v44 = v43[v42];
      if (*(void *)(v44 + 16))
      {
        unint64_t v73 = v42;
        uint64_t v78 = v29[2];
        if (v78)
        {
          id v76 = v29 + 4;
          swift_bridgeObjectRetain();
          char v71 = v29;
          swift_bridgeObjectRetain();
          uint64_t v45 = 0;
          uint64_t v75 = (void **)(v44 + 40);
          unint64_t v29 = _swiftEmptyArrayStorage;
          uint64_t v77 = v44;
          do
          {
            uint64_t v46 = *(void *)(v44 + 16);
            if (v46)
            {
              uint64_t v79 = v45;
              Swift::String v47 = &v76[2 * v45];
              long long v48 = (void *)*v47;
              unint64_t v49 = v47[1];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              long long v50 = v75;
              do
              {
                uint64_t v52 = (uint64_t)*(v50 - 1);
                uint64_t v51 = *v50;
                uint64_t v83 = v48;
                unint64_t v84 = v49;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v90._countAndFlagsBits = v80;
                v90._object = v40;
                sub_3EE18(v90);
                v91._countAndFlagsBits = v52;
                v91._object = v51;
                sub_3EE18(v91);
                swift_bridgeObjectRelease();
                uint64_t v53 = v83;
                unint64_t v54 = v84;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  unint64_t v29 = sub_180BC(0, v29[2] + 1, 1, v29);
                }
                unint64_t v56 = v29[2];
                unint64_t v55 = v29[3];
                if (v56 >= v55 >> 1) {
                  unint64_t v29 = sub_180BC((void *)(v55 > 1), v56 + 1, 1, v29);
                }
                v50 += 2;
                void v29[2] = v56 + 1;
                uint64_t v57 = &v29[2 * v56];
                v57[4] = v53;
                v57[5] = v54;
                --v46;
                uint64_t v40 = v81;
              }
              while (v46);
              swift_bridgeObjectRelease();
              uint64_t v44 = v77;
              swift_bridgeObjectRelease();
              uint64_t v45 = v79;
            }
            ++v45;
          }
          while (v45 != v78);
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease_n();
          LOBYTE(a2) = v68;
        }
        else
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v29 = _swiftEmptyArrayStorage;
        }
        Swift::String v43 = v70;
        uint64_t v41 = v69;
        unint64_t v42 = v73;
      }
      if (++v42 == v41) {
        goto LABEL_37;
      }
    }
    __break(1u);
LABEL_44:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_34824()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for PhonemesMapper()
{
  return self;
}

ValueMetadata *type metadata accessor for Phoneset()
{
  return &type metadata for Phoneset;
}

uint64_t sub_34890(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_3EE68();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    char v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v14 = sub_17E9C(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      char v14 = sub_17E9C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    unint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_3F368();
  __break(1u);
  return result;
}

unint64_t sub_349EC()
{
  unint64_t result = qword_53DC0;
  if (!qword_53DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53DC0);
  }
  return result;
}

unint64_t sub_34A40(char a1)
{
  sub_3F628();
  sub_3EDE8();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_3F658();

  return sub_34D0C(a1, v2);
}

unint64_t sub_34AD0(uint64_t a1, uint64_t a2)
{
  sub_3F628();
  sub_3EDE8();
  Swift::Int v4 = sub_3F658();

  return sub_34E20(a1, a2, v4);
}

unint64_t sub_34B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_3F628();
  sub_1B2AC((uint64_t)v10, a1, a2, a3, a4);
  Swift::Int v8 = sub_3F658();

  return sub_34F04(a1, a2, a3, a4, v8);
}

unint64_t sub_34BE0(uint64_t a1)
{
  sub_3ED78();
  sub_3F628();
  sub_3EDE8();
  Swift::Int v2 = sub_3F658();
  swift_bridgeObjectRelease();

  return sub_351C0(a1, v2);
}

unint64_t sub_34C74(uint64_t a1)
{
  sub_3EA38();
  sub_3A2EC(&qword_53DF0, (void (*)(uint64_t))&type metadata accessor for Locale);
  uint64_t v2 = sub_3ECC8();

  return sub_35338(a1, v2);
}

unint64_t sub_34D0C(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8 * a1;
    uint64_t v7 = *(void *)&aNvasr_6[v6];
    uint64_t v8 = *(void *)&aPhoneset_4[v6 + 8];
    while (*(void *)&aNvasr_6[8 * *(char *)(*(void *)(v2 + 48) + v4)] != v7
         || *(void *)&aPhoneset_4[8 * *(char *)(*(void *)(v2 + 48) + v4) + 8] != v8)
    {
      char v10 = sub_3F5A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

unint64_t sub_34E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_3F5A8() & 1) == 0)
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
      while (!v14 && (sub_3F5A8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_34F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v7 = a5 & ~v6;
  uint64_t v19 = v5 + 64;
  if ((*(void *)(v5 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v18 = ~v6;
    do
    {
      uint64_t v8 = (uint64_t *)(*(void *)(v24 + 48) + 32 * v7);
      uint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      uint64_t v11 = v8[2];
      uint64_t v12 = v8[3];
      sub_3F628();
      sub_62C4((uint64_t *)&unk_536F0);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_40A20;
      *(void *)(v13 + 32) = v9;
      *(void *)(v13 + 40) = v10;
      *(void *)(v13 + 48) = v11;
      *(void *)(v13 + 56) = v12;
      uint64_t v25 = v13;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_355E0(&v25);
      swift_bridgeObjectRelease();
      sub_62C4(&qword_53308);
      sub_2C618((unint64_t *)&qword_53510, &qword_53308);
      sub_3ECE8();
      swift_release();
      sub_3EDE8();
      swift_bridgeObjectRelease();
      Swift::Int v14 = sub_3F658();
      sub_3F628();
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_40A20;
      *(void *)(v15 + 32) = a1;
      *(void *)(v15 + 40) = a2;
      *(void *)(v15 + 48) = a3;
      *(void *)(v15 + 56) = a4;
      uint64_t v25 = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_355E0(&v25);
      swift_bridgeObjectRelease();
      sub_3ECE8();
      swift_release();
      sub_3EDE8();
      swift_bridgeObjectRelease();
      Swift::Int v16 = sub_3F658();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14 == v16) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v18;
    }
    while (((*(void *)(v19 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_351C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_3ED78();
    uint64_t v8 = v7;
    if (v6 == sub_3ED78() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_3F5A8();
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
          uint64_t v13 = sub_3ED78();
          uint64_t v15 = v14;
          if (v13 == sub_3ED78() && v15 == v16) {
            break;
          }
          char v18 = sub_3F5A8();
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

unint64_t sub_35338(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_3EA38();
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
    char v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_3A2EC((unint64_t *)&qword_536E0, (void (*)(uint64_t))&type metadata accessor for Locale);
      char v15 = sub_3ED28();
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

void *sub_354F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_62C4((uint64_t *)&unk_536F0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_389DC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_39418();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

Swift::Int sub_355E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_389C8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_3564C(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_3564C(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_3F588(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_35D38(0, v3, 1, a1);
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
  unint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      char v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_118:
      objc_super v94 = v11;
      uint64_t v104 = v8;
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
          sub_35E08((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_3625C((uint64_t)v97);
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
          objc_super v94 = v97;
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
    uint64_t v104 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_3EEF8();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  char v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
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
      int v19 = sub_3F5A8();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_3F5A8()))
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
      char v11 = sub_360A4(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      char v11 = sub_360A4((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v42 = v11 + 32;
    Swift::String v43 = &v11[16 * v41 + 32];
    *(void *)Swift::String v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v49 = &v42[16 * v12];
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
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
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
        uint64_t v75 = &v42[16 * v44];
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
        Swift::String v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        Swift::String v88 = v42;
        unint64_t v89 = v44;
        Swift::String v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_35E08((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)Swift::String v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        char v11 = v85;
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
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        unint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_3F5A8() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)unint64_t v38 = *((_OWORD *)v38 - 1);
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
  Swift::Int result = sub_3F368();
  __break(1u);
  return result;
}

uint64_t sub_35D38(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      if (v13 || (Swift::Int result = sub_3F5A8(), (result & 1) == 0))
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

uint64_t sub_35E08(char *__src, char *a2, unint64_t a3, char *__dst)
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
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_3F5A8() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
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
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
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
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_3F5A8() & 1) == 0)
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
    sub_361A0((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

char *sub_360A4(char *result, int64_t a2, char a3, char *a4)
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
    sub_62C4(&qword_53DE8);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

char *sub_361A0(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_3F3C8();
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

char *sub_3625C(uint64_t a1)
{
  return sub_360A4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_36270(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_3F128();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_3F628();
        sub_3EDE8();
        swift_bridgeObjectRelease();
        uint64_t result = sub_3F658();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          int64_t v11 = (unsigned char *)(v10 + v3);
          uint64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *int64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          BOOL v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *uint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_36458(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_34A40(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_1DAD8();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      void v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_1D484(result, a3 & 1);
  uint64_t result = sub_34A40(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_3F5C8();
  __break(1u);
  return result;
}

uint64_t sub_36584(void *a1, void *a2)
{
  int64_t v3 = v2;
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
    uint64_t v9 = sub_3F1A8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for PhonemeString();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_3F198();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_36AF0(v7, result + 1);
    Swift::Int v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_36CD8();
      BOOL v23 = v28;
    }
    else
    {
      BOOL v23 = (void *)v22;
      id v24 = v8;
    }
    sub_37504((uint64_t)v8, v23);
    *int64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_3F058(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for PhonemeString();
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_3F068();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_3F068();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *int64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_37588((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *int64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_36804(unsigned char *a1, char a2)
{
  int64_t v3 = v2;
  Swift::Int v6 = a2 & 1;
  uint64_t v7 = *v3;
  sub_3F628();
  sub_3F638(a2 & 1);
  Swift::Int v8 = sub_3F658();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *int64_t v3 = 0x8000000000000000;
    sub_37700(v6, v10, isUniquelyReferenced_nonNull_native);
    *int64_t v3 = v15;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v7 + 48);
  if ((((v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while ((((v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0);
  }
  uint64_t result = 0;
  LOBYTE(v6) = *(unsigned char *)(*(void *)(*v3 + 48) + v10);
LABEL_8:
  *a1 = v6;
  return result;
}

uint64_t sub_36940(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_3F628();
  swift_bridgeObjectRetain();
  sub_3EDE8();
  Swift::Int v8 = sub_3F658();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_3F5A8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_3F5A8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_37868(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_36AF0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_62C4(&qword_53DC8);
    uint64_t v2 = sub_3F218();
    uint64_t v14 = v2;
    sub_3F158();
    if (sub_3F1C8())
    {
      type metadata accessor for PhonemeString();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_36CD8();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_3F058(*(void *)(v2 + 40));
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
      while (sub_3F1C8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_36CD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DC8);
  uint64_t v3 = sub_3F208();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    Swift::Int v28 = v0;
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
                  *unint64_t v6 = -1 << v27;
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
      uint64_t result = sub_3F058(*(void *)(v4 + 40));
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_36F78()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DE0);
  uint64_t result = sub_3F208();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    unint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
      sub_3F628();
      sub_3F638(v18);
      uint64_t result = sub_3F658();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_37224()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DD0);
  uint64_t v3 = sub_3F208();
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_3F628();
      sub_3EDE8();
      uint64_t result = sub_3F658();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_37504(uint64_t a1, void *a2)
{
  sub_3F058(a2[5]);
  unint64_t result = sub_3F138();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_37588(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_36CD8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_37A04();
      goto LABEL_14;
    }
    sub_37EF8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_3F058(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for PhonemeString();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_3F068();

    if (v12)
    {
LABEL_13:
      sub_3F5B8();
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
        char v15 = sub_3F068();

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

Swift::Int sub_37700(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result & 1;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_36F78();
  }
  else
  {
    if (v7 > v6)
    {
      unint64_t result = (Swift::Int)sub_37BB0();
      goto LABEL_14;
    }
    sub_38174();
  }
  uint64_t v8 = *v3;
  sub_3F628();
  sub_3F638(v5);
  unint64_t result = sub_3F658();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2)))
    {
LABEL_13:
      unint64_t result = sub_3F5B8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (((v5 == 0) ^ *(unsigned __int8 *)(v10 + a2))) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v12 + 48) + a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

Swift::Int sub_37868(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  Swift::UInt v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_37224();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_37D44();
      goto LABEL_22;
    }
    sub_383F0();
  }
  uint64_t v11 = *v4;
  sub_3F628();
  sub_3EDE8();
  unint64_t result = sub_3F658();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_3F5A8(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_3F5B8();
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
        BOOL v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_3F5A8();
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

id sub_37A04()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53DC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F1F8();
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

void *sub_37BB0()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53DE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F1F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
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

void *sub_37D44()
{
  uint64_t v1 = v0;
  sub_62C4(&qword_53DD0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3F1F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_37EF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DC8);
  uint64_t v3 = sub_3F208();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_3F058(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
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

uint64_t sub_38174()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DE0);
  uint64_t result = sub_3F208();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    Swift::UInt v18 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v14);
    sub_3F628();
    sub_3F638(v18);
    uint64_t result = sub_3F658();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(unsigned char *)(*(void *)(v4 + 48) + v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_383F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_62C4(&qword_53DD0);
  uint64_t v3 = sub_3F208();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_3F628();
    swift_bridgeObjectRetain();
    sub_3EDE8();
    uint64_t result = sub_3F658();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

void (*sub_386A0(void *a1, char a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_3898C(v4);
  v4[9] = sub_38790((uint64_t)(v4 + 4), a2, isUniquelyReferenced_nonNull_native);
  return sub_38730;
}

void sub_38730(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  v2(v1, 0);

  free(v1);
}

unint64_t (*sub_38790(uint64_t a1, char a2, char a3))(unint64_t result, char a2)
{
  uint64_t v4 = v3;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 24) = a2;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_34A40(a2);
  *(unsigned char *)(a1 + 25) = v9 & 1;
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    char v14 = v9;
    uint64_t v15 = *(void *)(v8 + 24);
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      *(void *)(a1 + 16) = v10;
      if (v14)
      {
LABEL_8:
        uint64_t v16 = *(void *)(*(void *)(*v4 + 56) + 8 * v10);
LABEL_12:
        *(void *)a1 = v16;
        return sub_388B4;
      }
LABEL_11:
      uint64_t v16 = 0;
      goto LABEL_12;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1D934();
      goto LABEL_7;
    }
    sub_1D168(v13, a3 & 1);
    unint64_t v17 = sub_34A40(a2);
    if ((v14 & 1) == (v18 & 1))
    {
      unint64_t v10 = v17;
      *(void *)(a1 + 16) = v17;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (unint64_t (*)(unint64_t, char))sub_3F5C8();
  __break(1u);
  return result;
}

unint64_t sub_388B4(unint64_t result, char a2)
{
  uint64_t v2 = *(void *)result;
  LOBYTE(v3) = *(unsigned char *)(result + 25);
  if (a2)
  {
    if (!v2) {
      goto LABEL_10;
    }
    unint64_t v4 = *(void *)(result + 16);
    uint64_t v5 = **(void ***)(result + 8);
    if (*(unsigned char *)(result + 25))
    {
LABEL_9:
      *(void *)(v5[7] + 8 * v4) = v2;
      return result;
    }
    char v6 = *(unsigned char *)(result + 24);
    v5[(v4 >> 6) + 8] |= 1 << v4;
    *(unsigned char *)(v5[6] + v4) = v6;
    uint64_t v3 = v5[7];
    *(void *)(v3 + 8 * v4) = v2;
    uint64_t v7 = v5[2];
    BOOL v8 = __OFADD__(v7, 1);
    uint64_t v2 = v7 + 1;
    if (!v8) {
      goto LABEL_14;
    }
    __break(1u);
  }
  if (!v2)
  {
LABEL_10:
    if (v3) {
      return sub_36270(*(void *)(result + 16), **(void **)(result + 8));
    }
    return result;
  }
  unint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = **(void ***)(result + 8);
  if (v3) {
    goto LABEL_9;
  }
  char v9 = *(unsigned char *)(result + 24);
  v5[(v4 >> 6) + 8] |= 1 << v4;
  *(unsigned char *)(v5[6] + v4) = v9;
  *(void *)(v5[7] + 8 * v4) = v2;
  uint64_t v10 = v5[2];
  BOOL v8 = __OFADD__(v10, 1);
  uint64_t v2 = v10 + 1;
  if (!v8)
  {
LABEL_14:
    uint64_t v5[2] = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_3898C(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_389BC;
}

uint64_t sub_389BC(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_389C8(uint64_t a1)
{
  return sub_3A7D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_389DC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v5[2] = ~v7;
    _OWORD v5[3] = v12;
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
  uint64_t v11 = a2;
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
    *uint64_t v11 = *v20;
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

void *sub_38BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v16 = *(void *)(a1 + 8 * v5 + 32);
    sub_33E9C((uint64_t)&v16, a2, &v14);
    if (v2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6;
    }
    uint64_t v8 = v15;
    if (v15)
    {
      uint64_t v9 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v6 = sub_180BC(0, v6[2] + 1, 1, v6);
      }
      unint64_t v11 = v6[2];
      unint64_t v10 = v6[3];
      if (v11 >= v10 >> 1) {
        uint64_t v6 = sub_180BC((void *)(v10 > 1), v11 + 1, 1, v6);
      }
      _OWORD v6[2] = v11 + 1;
      uint64_t v7 = &v6[2 * v11];
      v7[4] = v9;
      v7[5] = v8;
    }
    ++v5;
  }
  while (v3 != v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_38D20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_3EF88();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_36940(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_38DB8(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7) {
    return _swiftEmptyArrayStorage;
  }
  unint64_t v10 = (void **)(swift_bridgeObjectRetain() + 40);
  unint64_t v11 = _swiftEmptyArrayStorage;
  uint64_t v12 = a5 & 1;
  do
  {
    uint64_t v13 = (uint64_t)*(v10 - 1);
    uint64_t v14 = *v10;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_3395C(v13, v14, a3, a4, v12, a2);
    if (v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v11;
    }
    uint64_t v16 = v15;
    uint64_t v17 = v15[2];
    swift_bridgeObjectRelease();
    if (v17)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v11 = sub_174F8(0, v11[2] + 1, 1, v11);
      }
      unint64_t v19 = v11[2];
      unint64_t v18 = v11[3];
      if (v19 >= v18 >> 1) {
        unint64_t v11 = sub_174F8((void *)(v18 > 1), v19 + 1, 1, v11);
      }
      v11[2] = v19 + 1;
      v11[v19 + 4] = v16;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v10 += 2;
    --v7;
  }
  while (v7);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_38F2C(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    goto LABEL_11;
  }
  unint64_t v4 = sub_34A40(4);
  if ((v5 & 1) == 0 || !*(void *)(a2 + 16)) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void **)(*(void *)(a2 + 56) + 8 * v4);
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_34A40(a1);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_3F238(28);
    v22._countAndFlagsBits = 0x74276E646C756F43;
    v22._object = (void *)0xEE0020646E696620;
    sub_3EE18(v22);
    sub_3F348();
    v15._countAndFlagsBits = 0x6E6F6870206E6920;
    v15._object = (void *)0xEC00000074657365;
LABEL_12:
    sub_3EE18(v15);
LABEL_13:
    unint64_t v14 = v21;
    sub_349EC();
    swift_allocError();
    *(void *)uint64_t v16 = v20;
    *(void *)(v16 + 8) = v21;
    *(unsigned char *)(v16 + 16) = 1;
    swift_willThrow();
    return v14;
  }
  uint64_t v9 = *(void *)(*(void *)(a2 + 56) + 8 * v7);
  uint64_t v10 = sub_33478(0x6F625F656E6F6870, 0xEE00797261646E75, v6);
  if (v11)
  {
    sub_3F238(21);
    uint64_t v17 = sub_3EEC8();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v20 = v17;
    unint64_t v21 = v19;
    v23._object = (void *)0x80000000000441A0;
    v23._countAndFlagsBits = 0xD000000000000011;
    sub_3EE18(v23);
    v15._countAndFlagsBits = 0x6F625F656E6F6870;
    v15._object = (void *)0xEE00797261646E75;
    goto LABEL_12;
  }
  uint64_t v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (v12 >= *(void *)(v9 + 16))
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_3F238(66);
    v24._countAndFlagsBits = 0xD000000000000014;
    v24._object = (void *)0x80000000000441C0;
    sub_3EE18(v24);
    v25._countAndFlagsBits = sub_3F598();
    sub_3EE18(v25);
    swift_bridgeObjectRelease();
    v26._countAndFlagsBits = 0xD00000000000002ALL;
    v26._object = (void *)0x80000000000441E0;
    sub_3EE18(v26);
    swift_bridgeObjectRelease();
    v27._countAndFlagsBits = sub_3F598();
    sub_3EE18(v27);
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if ((v12 & 0x8000000000000000) == 0)
  {
    unint64_t v14 = *(void *)(v9 + 16 * v12 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_392A4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_3F378();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for PhonemeString();
  sub_3A2EC(&qword_53710, (void (*)(uint64_t))type metadata accessor for PhonemeString);
  uint64_t result = sub_3EF88();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_3F378();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
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
        uint64_t v6 = (void *)sub_3F278();
        sub_36584(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        char v8 = *v7++;
        sub_36584(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_39418()
{
  return swift_release();
}

uint64_t *sub_39420(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_39484(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_394F8();
  uint64_t result = sub_3EF88();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (char *)(a1 + 32);
    do
    {
      char v5 = *v4++;
      sub_36804(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

unint64_t sub_394F8()
{
  unint64_t result = qword_53DD8;
  if (!qword_53DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53DD8);
  }
  return result;
}

uint64_t sub_3954C(char *a1, unint64_t a2)
{
  uint64_t v4 = (void *)sub_3EA38();
  uint64_t v5 = *(v4 - 1);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_52770 != -1) {
LABEL_69:
  }
    swift_once();
  uint64_t v8 = qword_57CB8;
  if (!*(void *)(qword_57CB8 + 16) || (unint64_t v9 = sub_34C74(a2), (v10 & 1) == 0))
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_3EC68();
    sub_60E8(v25, (uint64_t)qword_57CC8);
    (*(void (**)(char *, unint64_t, void *))(v5 + 16))(v7, a2, v4);
    Swift::String v26 = sub_3EC48();
    os_log_type_t v27 = sub_3EFC8();
    if (os_log_type_enabled(v26, v27))
    {
      id v96 = a1;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      unint64_t v97 = a2;
      *(void *)&long long v100 = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      sub_3A2EC(&qword_53CB0, (void (*)(uint64_t))&type metadata accessor for Locale);
      uint64_t v30 = sub_3F598();
      uint64_t v98 = sub_2B8C8(v30, v31, (uint64_t *)&v100);
      sub_3F088();
      swift_bridgeObjectRelease();
      Swift::Int v32 = *(void (**)(char *, void *))(v5 + 8);
      v32(v7, v4);
      _os_log_impl(&dword_0, v26, v27, "Phoneset couldn't load the file for locale %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v32((char *)v97, v4);
    }
    else
    {

      id v33 = *(void (**)(char *, void *))(v5 + 8);
      v33(v7, v4);
      v33((char *)a2, v4);
    }
    return 0;
  }
  char v11 = (uint64_t *)(*(void *)(v8 + 56) + 16 * v9);
  uint64_t v13 = *v11;
  unint64_t v12 = v11[1];
  swift_bridgeObjectRetain();
  NSString v14 = sub_3ED48();
  NSString v15 = sub_3ED48();
  id v16 = [a1 pathForResource:v14 ofType:v15];

  if (!v16)
  {
    if (qword_527A8 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_3EC68();
    sub_60E8(v35, (uint64_t)qword_57CC8);
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_3EC48();
    os_log_type_t v37 = sub_3EFC8();
    if (os_log_type_enabled(v36, v37))
    {
      id v96 = a1;
      unint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      unint64_t v97 = a2;
      *(void *)&long long v100 = v39;
      *(_DWORD *)unint64_t v38 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_2B8C8(v13, v12, (uint64_t *)&v100);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v36, v37, "Phoneset couldn't load %s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unint64_t, void *))(v5 + 8))(v97, v4);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(unint64_t, void *))(v5 + 8))(a2, v4);
    }
    return 0;
  }
  unint64_t v97 = a2;
  swift_bridgeObjectRelease();
  *(void *)&long long v95 = sub_3ED78();
  unint64_t v18 = v17;

  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_3EC68();
  uint64_t v20 = sub_60E8(v19, (uint64_t)qword_57CC8);
  swift_bridgeObjectRetain_n();
  uint64_t v91 = v20;
  unint64_t v21 = sub_3EC48();
  os_log_type_t v22 = sub_3EFB8();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v92 = v4;
  uint64_t v93 = v5;
  id v96 = a1;
  unint64_t v94 = v18;
  if (v23)
  {
    Swift::String v24 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v100 = swift_slowAlloc();
    *(_DWORD *)Swift::String v24 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v98 = sub_2B8C8(v95, v18, (uint64_t *)&v100);
    sub_3F088();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v21, v22, "Phoneset is using the map found at path=%s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  a1 = 0;
  unint64_t v40 = &_swiftEmptyDictionarySingleton;
  uint64_t v4 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v7 = (char *)*((unsigned __int8 *)&off_4D6E0 + (void)a1 + 32);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v100 = v40;
    a2 = sub_34A40((char)v7);
    uint64_t v44 = v40[2];
    BOOL v45 = (v43 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (__OFADD__(v44, v45))
    {
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    char v47 = v43;
    if (v40[3] >= v46)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        unint64_t v40 = (void *)v100;
        if (v43) {
          goto LABEL_21;
        }
      }
      else
      {
        sub_1D934();
        unint64_t v40 = (void *)v100;
        if (v47) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      sub_1D168(v46, isUniquelyReferenced_nonNull_native);
      unint64_t v48 = sub_34A40((char)v7);
      if ((v47 & 1) != (v49 & 1)) {
        goto LABEL_71;
      }
      a2 = v48;
      unint64_t v40 = (void *)v100;
      if (v47)
      {
LABEL_21:
        uint64_t v41 = v40[7];
        uint64_t v5 = 8 * a2;
        swift_bridgeObjectRelease();
        *(void *)(v41 + 8 * a2) = _swiftEmptyArrayStorage;
        goto LABEL_22;
      }
    }
    v40[(a2 >> 6) + 8] |= 1 << a2;
    *(unsigned char *)(v40[6] + a2) = (_BYTE)v7;
    *(void *)(v40[7] + 8 * a2) = _swiftEmptyArrayStorage;
    uint64_t v50 = v40[2];
    BOOL v51 = __OFADD__(v50, 1);
    uint64_t v52 = v50 + 1;
    if (v51) {
      goto LABEL_68;
    }
    v40[2] = v52;
LABEL_22:
    ++a1;
    swift_bridgeObjectRelease();
  }
  while (a1 != (unsigned char *)&dword_4 + 1);
  uint64_t v103 = v40;
  unint64_t v53 = v94;
  uint64_t v54 = v95;
  unint64_t v55 = sub_3ED38();
  uint64_t v57 = sub_32FA4(0x7FFFFFFFFFFFFFFFLL, 1, v55, v56);
  if (!*(void *)(v57 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v78 = sub_3EC48();
    os_log_type_t v79 = sub_3EFC8();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v80 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v100 = swift_slowAlloc();
      *(_DWORD *)uint64_t v80 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v98 = sub_2B8C8(v54, v53, (uint64_t *)&v100);
      sub_3F088();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v78, v79, "Phoneset couldn't read rows from %s", v80, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(unint64_t, void *))(v93 + 8))(v97, v92);
    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v89 = *(void *)(v57 + 16);
  long long v95 = *(_OWORD *)(v57 + 32);
  uint64_t v58 = *(void *)(v57 + 48);
  uint64_t v59 = *(void *)(v57 + 56);
  uint64_t v90 = v57;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v100 = v95;
  uint64_t v101 = v58;
  uint64_t v102 = v59;
  uint64_t v98 = 44;
  unint64_t v99 = 0xE100000000000000;
  sub_3A334();
  sub_6688();
  uint64_t v60 = (void *)sub_3F0A8();
  swift_bridgeObjectRelease();
  uint64_t v61 = 0;
  *(void *)&long long v95 = v60 + 7;
  uint64_t v62 = &_swiftEmptyDictionarySingleton;
  do
  {
    uint64_t v63 = *((char *)&off_4D708 + v61 + 32);
    uint64_t v64 = *(void *)&aPhoneset_4[8 * v63 + 8];
    uint64_t v65 = v60[2];
    if (v65)
    {
      uint64_t v66 = *(void *)&aNvasr_6[8 * v63];
      BOOL v67 = v60[4] == v66 && v64 == v60[5];
      if (v67 || (sub_3F5A8() & 1) != 0)
      {
        uint64_t v68 = 0;
LABEL_44:
        swift_bridgeObjectRelease();
        char v69 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v100 = v62;
        sub_36458(v68, v63, v69);
        uint64_t v62 = (void *)v100;
      }
      else
      {
        uint64_t v70 = (void *)v95;
        uint64_t v71 = 1;
        while (v65 != v71)
        {
          uint64_t v68 = v71;
          if (*(v70 - 1) != v66 || v64 != *v70)
          {
            char v73 = sub_3F5A8();
            uint64_t v71 = v68 + 1;
            v70 += 2;
            if ((v73 & 1) == 0) {
              continue;
            }
          }
          goto LABEL_44;
        }
      }
    }
    swift_bridgeObjectRelease();
    ++v61;
  }
  while (v61 != 5);
  swift_bridgeObjectRelease();
  uint64_t v74 = v90;
  if (*(void *)(v90 + 16) < v89)
  {
    __break(1u);
LABEL_71:
    uint64_t result = sub_3F5C8();
    __break(1u);
  }
  else
  {
    unint64_t v75 = v89 - 1;
    uint64_t v76 = v93;
    unint64_t v77 = v97;
    if (v89 != 1)
    {
      swift_unknownObjectRetain();
      uint64_t v81 = (uint64_t *)(v74 + 88);
      do
      {
        uint64_t v82 = *(v81 - 1);
        uint64_t v83 = *v81;
        long long v100 = *(_OWORD *)(v81 - 3);
        uint64_t v101 = v82;
        uint64_t v102 = v83;
        swift_bridgeObjectRetain();
        sub_33560(&v100, (uint64_t *)&v103, (uint64_t)v62);
        swift_bridgeObjectRelease();
        v81 += 4;
        --v75;
      }
      while (v75);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v84 = sub_3EC48();
    os_log_type_t v85 = sub_3EFB8();
    BOOL v86 = os_log_type_enabled(v84, v85);
    id v87 = v96;
    if (v86)
    {
      Swift::String v88 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v88 = 0;
      _os_log_impl(&dword_0, v84, v85, "Completed initialization of Phoneset map", v88, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(unint64_t, void *))(v76 + 8))(v77, v92);
    return (uint64_t)v103;
  }
  return result;
}

uint64_t sub_3A2EC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_3A334()
{
  unint64_t result = qword_53DF8;
  if (!qword_53DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53DF8);
  }
  return result;
}

uint64_t sub_3A388()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_3A3C0()
{
  return _swift_deallocObject(v0, 24, 7);
}

unsigned char *storeEnumTagSinglePayload for Phoneset.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x3A49CLL);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Phoneset.Key()
{
  return &type metadata for Phoneset.Key;
}

uint64_t sub_3A4D4()
{
  return sub_2C618(&qword_53E00, &qword_53E08);
}

unint64_t sub_3A514()
{
  unint64_t result = qword_53E10;
  if (!qword_53E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53E10);
  }
  return result;
}

uint64_t sub_3A568(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4D7C8;
  v6._object = a2;
  unint64_t v4 = sub_3F3F8(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t sub_3A5B4(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for TMDCGroundTruth();
    return a2;
  }
  return result;
}

uint64_t type metadata accessor for TMDCCoreDataLogger()
{
  return self;
}

void sub_3A660(uint64_t a1)
{
}

void *sub_3A684(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_3F3C8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_3A728@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_3A758(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3A7D8(a1, a2, a3, *v3);
  *Swift::OpaquePointer v3 = (char *)result;
  return result;
}

uint64_t sub_3A778(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3A944(a1, a2, a3, *v3);
  *Swift::OpaquePointer v3 = (char *)result;
  return result;
}

uint64_t sub_3A798(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3AAA4(a1, a2, a3, (void *)*v3);
  *Swift::OpaquePointer v3 = result;
  return result;
}

uint64_t sub_3A7B8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3ACE4(a1, a2, a3, (void *)*v3);
  *Swift::OpaquePointer v3 = result;
  return result;
}

uint64_t sub_3A7D8(char a1, int64_t a2, char a3, char *a4)
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
    sub_62C4((uint64_t *)&unk_536F0);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  NSString v14 = a4 + 32;
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
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_3A944(char a1, int64_t a2, char a3, char *a4)
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
    sub_62C4(&qword_53F00);
    char v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  NSString v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_3AAA4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_62C4(&qword_53EE8);
  uint64_t v10 = *(void *)(sub_3E558() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_3E558() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_3ACE4(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_62C4(&qword_53EF0);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    sub_62C4(&qword_53EF8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_3F3C8();
  __break(1u);
  return result;
}

void sub_3AE8C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = type metadata accessor for TMDCGroundTruth();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3E558();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  NSString v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    if (qword_527A8 == -1)
    {
LABEL_18:
      uint64_t v31 = sub_3EC68();
      sub_60E8(v31, (uint64_t)qword_57CC8);
      Swift::Int v32 = sub_3EC48();
      os_log_type_t v33 = sub_3EFC8();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_21:

        return;
      }
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      uint64_t v35 = "Skipping CoreData storage because overriddenContactIdentifier is nil";
      uint64_t v36 = v32;
      os_log_type_t v37 = v33;
      unint64_t v38 = v34;
      uint32_t v39 = 2;
LABEL_20:
      _os_log_impl(&dword_0, v36, v37, v35, v38, v39);
      swift_slowDealloc();
      goto LABEL_21;
    }
LABEL_31:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v54 = v13;
  uint64_t v49 = v8;
  uint64_t v16 = (void *)sub_3E768();
  __chkstk_darwin(v16);
  *(&v45 - 4) = v17;
  *(&v45 - 3) = a3;
  *(&v45 - 2) = a1;
  sub_62C4(&qword_53EE0);
  sub_3F028();

  if (!v3)
  {
    unint64_t v18 = v55[2];
    uint64_t v19 = (void *)(v18 - 2);
    if (v18 <= 2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v48 = a1;
      uint64_t v47 = sub_3A5B4(v18 - 2, (uint64_t)v55);
      uint64_t v52 = v21;
      int64_t v53 = v22 >> 1;
      uint64_t v23 = (v22 >> 1) - v20;
      if (__OFSUB__(v22 >> 1, v20))
      {
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      uint64_t v24 = v54;
      BOOL v45 = v19;
      if (v23)
      {
        uint64_t v25 = v20;
        uint64_t v46 = 0;
        unint64_t v55 = _swiftEmptyArrayStorage;
        sub_3A798(0, v23 & ~(v23 >> 63), 0);
        if ((v23 & 0x8000000000000000) == 0)
        {
          uint64_t v26 = v53;
          if (v25 > v53) {
            uint64_t v26 = v25;
          }
          uint64_t v50 = v12 + 32;
          uint64_t v51 = v26;
          uint64_t v27 = v49;
          while (v51 != v25)
          {
            sub_BB18(v52 + *(void *)(v27 + 72) * v25, (uint64_t)v10);
            (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v10, v24);
            sub_BB7C((uint64_t)v10);
            uint64_t v28 = v55;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_3A798(0, v28[2] + 1, 1);
              uint64_t v27 = v49;
              uint64_t v28 = v55;
            }
            unint64_t v30 = v28[2];
            unint64_t v29 = v28[3];
            if (v30 >= v29 >> 1)
            {
              sub_3A798(v29 > 1, v30 + 1, 1);
              uint64_t v27 = v49;
              uint64_t v28 = v55;
            }
            _DWORD v28[2] = v30 + 1;
            uint64_t v24 = v54;
            (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))((unint64_t)v28+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * v30, v15, v54);
            unint64_t v55 = v28;
            if (v53 == ++v25)
            {
              swift_unknownObjectRelease();
              uint64_t v4 = v46;
              goto LABEL_24;
            }
          }
          __break(1u);
          goto LABEL_31;
        }
        goto LABEL_33;
      }
      swift_unknownObjectRelease();
      uint64_t v28 = _swiftEmptyArrayStorage;
LABEL_24:
      unint64_t v40 = v48;
      uint64_t v41 = (void *)sub_3E768();
      __chkstk_darwin(v41);
      *(&v45 - 2) = v40;
      *(&v45 - 1) = v28;
      sub_3F028();
      if (!v4)
      {
        swift_bridgeObjectRelease();

        if (qword_527A8 == -1)
        {
LABEL_28:
          uint64_t v42 = sub_3EC68();
          sub_60E8(v42, (uint64_t)qword_57CC8);
          Swift::Int v32 = sub_3EC48();
          os_log_type_t v43 = sub_3EFB8();
          if (!os_log_type_enabled(v32, v43)) {
            goto LABEL_21;
          }
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = 134217984;
          unint64_t v55 = v45;
          sub_3F088();
          uint64_t v35 = "Deleted %ld ground truths";
          uint64_t v36 = v32;
          os_log_type_t v37 = v43;
          unint64_t v38 = v44;
          uint32_t v39 = 12;
          goto LABEL_20;
        }
LABEL_34:
        swift_once();
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
    }
  }
}

void sub_3B414(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1;
    swift_retain();
    unint64_t v6 = (void *)sub_3E768();
    __chkstk_darwin(v6);
    sub_3F028();
    if (v2)
    {
      swift_release();
    }
    else
    {

      uint64_t v8 = type metadata accessor for TMDCGroundTruth();
      if (*(unsigned char *)(v4 + 24))
      {
        swift_release();
      }
      else
      {
        sub_3AE8C(v3, *(void *)(a1 + *(int *)(v8 + 52)), *(void **)(a1 + *(int *)(v8 + 52) + 8));
        uint64_t v9 = (void *)sub_3E768();
        sub_3F028();
        swift_release();
      }
    }
  }
  else
  {
    sub_AB40();
    swift_allocError();
    *uint64_t v7 = 0;
    v7[1] = 0;
    swift_willThrow();
  }
}

void sub_3B598()
{
}

void sub_3B5B4()
{
}

void sub_3B5D0(void *a1@<X8>)
{
  sub_157A8(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void sub_3B5F0()
{
  sub_15D38(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_3B60C(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_3EBB8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_527C0 != -1) {
    swift_once();
  }
  int v11 = byte_57D10;
  uint64_t v12 = sub_3EBD8();
  int v13 = sub_3EFE8();
  uint64_t result = sub_3F078();
  if (v11 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
LABEL_24:
      sub_3EC28();
      swift_allocObject();
      return sub_3EC18();
    }
    int v21 = v13;
    if (a3)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (a1 >> 16 > 0x10) {
        goto LABEL_27;
      }
      a1 = &v22;
    }
    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }
    NSString v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v15(v10, a4, v7);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_3EBA8();
    os_signpost_type_t v18 = v21;
    uint64_t v19 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, v12, v18, v17, a1, v19, v16, 2u);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v15(v10, a4, v7);
    goto LABEL_24;
  }
LABEL_8:
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  int v21 = v13;
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  if ((unint64_t)a1 >> 32) {
    goto LABEL_26;
  }
  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v23;
LABEL_22:
      NSString v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v15(v10, a4, v7);
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = sub_3EBA8();
      os_signpost_type_t v18 = v21;
      uint64_t v19 = "enableTelemetry=YES";
      goto LABEL_23;
    }
    goto LABEL_28;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_3B900(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_3EBB8();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_527C0 != -1) {
    swift_once();
  }
  int v11 = byte_57D10;
  uint64_t v20 = sub_3EBD8();
  os_signpost_type_t v12 = sub_3EFF8();
  char v13 = sub_3F078();
  if (v11 == 1)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
    if (a3)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (a1 >> 11 == 27)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      if (a1 >> 16 > 0x10) {
        goto LABEL_28;
      }
      a1 = &v21;
    }
    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
    NSString v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v15 = 0;
    os_signpost_id_t v16 = sub_3EBA8();
    os_signpost_type_t v17 = v12;
    os_signpost_type_t v18 = "";
LABEL_25:
    _os_signpost_emit_with_name_impl(&dword_0, v20, v17, v16, a1, v18, v15, 2u);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return;
  }
LABEL_8:
  if (v13)
  {
    if ((a3 & 1) == 0)
    {
      if (!a1)
      {
        __break(1u);
        goto LABEL_12;
      }
      goto LABEL_24;
    }
    if (!((unint64_t)a1 >> 32))
    {
      if (a1 >> 11 == 27)
      {
LABEL_31:
        __break(1u);
        return;
      }
      if (a1 >> 16 <= 0x10)
      {
        a1 = &v22;
LABEL_24:
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
        NSString v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v15 = 0;
        os_signpost_id_t v16 = sub_3EBA8();
        os_signpost_type_t v17 = v12;
        os_signpost_type_t v18 = "enableTelemetry=YES";
        goto LABEL_25;
      }
      goto LABEL_29;
    }
    goto LABEL_27;
  }
LABEL_12:
  uint64_t v14 = v20;
}

uint64_t sub_3BBC4(uint64_t a1)
{
  return sub_3BC0C(a1, qword_57CC8);
}

uint64_t sub_3BBE8(uint64_t a1)
{
  return sub_3BC0C(a1, qword_57CE0);
}

uint64_t sub_3BC0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3EC68();
  sub_39420(v3, a2);
  sub_60E8(v3, (uint64_t)a2);
  return sub_3EC58();
}

uint64_t sub_3BC84()
{
  uint64_t v0 = sub_3EC68();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3EBE8();
  sub_39420(v4, qword_57CF8);
  sub_60E8(v4, (uint64_t)qword_57CF8);
  if (qword_527B0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_60E8(v0, (uint64_t)qword_57CE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_3EBC8();
}

void sub_3BDC0()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_3ED48();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_57D10 = v2;
}

void *sub_3BE50()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_3BE5C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t result = sub_3F258();
  *a1 = result;
  return result;
}

uint64_t sub_3BEA0()
{
  uint64_t v47 = sub_62C4(&qword_53F08);
  __chkstk_darwin(v47);
  uint64_t v49 = (uint64_t)&v42 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = sub_62C4(&qword_53F10);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v43 = (uint64_t)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v48 = (char *)&v42 - v5;
  __chkstk_darwin(v4);
  uint64_t v44 = (char *)&v42 - v6;
  uint64_t v7 = sub_3EA38();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v42 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  os_signpost_type_t v12 = (char *)&v42 - v11;
  uint64_t v13 = sub_3E7D8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  os_signpost_type_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v42 - v18;
  if (qword_52768 != -1) {
    swift_once();
  }
  uint64_t v20 = qword_57CB0;
  sub_3E898();
  sub_3E7B8();
  BOOL v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  v45(v19, v13);
  uint64_t v21 = *(void *)(v20 + 16);
  uint64_t v46 = v13;
  if (v21 && (unint64_t v22 = sub_34C74((uint64_t)v12), (v23 & 1) != 0))
  {
    uint64_t v24 = (uint64_t)v44;
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v44, *(void *)(v20 + 56) + *(void *)(v8 + 72) * v22, v7);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v26 = v8;
    v25(v24, 0, 1, v7);
  }
  else
  {
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v26 = v8;
    uint64_t v24 = (uint64_t)v44;
    v25((uint64_t)v44, 1, 1, v7);
  }
  uint64_t v44 = *(char **)(v26 + 8);
  ((void (*)(char *, uint64_t))v44)(v12, v7);
  sub_3E898();
  uint64_t v27 = (uint64_t)v48;
  sub_3E7C8();
  uint64_t v28 = v17;
  uint64_t v29 = v27;
  v45(v28, v46);
  v25(v27, 0, 1, v7);
  uint64_t v30 = v49;
  uint64_t v31 = v49 + *(int *)(v47 + 48);
  sub_3C428(v24, v49);
  sub_3C428(v27, v31);
  uint64_t v32 = v26;
  os_log_type_t v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
  if (v33(v30, 1, v7) == 1)
  {
    sub_DCD4(v29, &qword_53F10);
    sub_DCD4(v24, &qword_53F10);
    int v34 = v33(v31, 1, v7);
    if (v34 == 1) {
      uint64_t v35 = &qword_53F10;
    }
    else {
      uint64_t v35 = &qword_53F08;
    }
    if (v34 == 1) {
      char v36 = -1;
    }
    else {
      char v36 = 0;
    }
  }
  else
  {
    uint64_t v37 = v43;
    sub_3C428(v30, v43);
    if (v33(v31, 1, v7) == 1)
    {
      sub_DCD4(v29, &qword_53F10);
      sub_DCD4(v24, &qword_53F10);
      ((void (*)(uint64_t, uint64_t))v44)(v37, v7);
      char v36 = 0;
      uint64_t v35 = &qword_53F08;
    }
    else
    {
      unint64_t v38 = v42;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 32))(v42, v31, v7);
      sub_3C490();
      char v36 = sub_3ED28();
      uint32_t v39 = v38;
      unint64_t v40 = v44;
      ((void (*)(char *, uint64_t))v44)(v39, v7);
      uint64_t v35 = &qword_53F10;
      sub_DCD4(v29, &qword_53F10);
      sub_DCD4(v24, &qword_53F10);
      ((void (*)(uint64_t, uint64_t))v40)(v37, v7);
    }
  }
  sub_DCD4(v30, v35);
  return v36 & 1;
}

uint64_t sub_3C428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_3C490()
{
  unint64_t result = qword_536E0;
  if (!qword_536E0)
  {
    sub_3EA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_536E0);
  }
  return result;
}

void *sub_3C4E8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53838);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v57 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v42 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  os_signpost_type_t v12 = (char *)&v42 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v48 = (uint64_t)&v42 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = sub_3EA98();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  BOOL v45 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  __chkstk_darwin(v24);
  uint64_t v44 = (char *)&v42 - v26;
  unint64_t v52 = *(void *)(a1 + 16);
  if (!v52) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v62 = v25;
  unint64_t v65 = a2;
  uint64_t v43 = v19;
  if (a2 >> 62) {
    goto LABEL_37;
  }
  uint64_t v27 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
LABEL_4:
  unint64_t v28 = 0;
  uint64_t v29 = v21 + 16;
  int64_t v53 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
  unint64_t v42 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v47 = a1 + v42;
  uint64_t v49 = *(void *)(v21 + 72);
  uint64_t v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  unint64_t v64 = a2 & 0xC000000000000001;
  v21 += 48;
  uint64_t v61 = (void (**)(uint64_t, char *, uint64_t))(v29 + 16);
  unint64_t v56 = v52 - 1;
  uint64_t v54 = v29;
  uint64_t v58 = (void (**)(uint64_t, uint64_t))(v29 - 8);
  uint64_t v46 = _swiftEmptyArrayStorage;
  uint64_t v63 = v12;
  uint64_t v59 = v27;
  do
  {
    unint64_t v55 = v28 + 1;
    BOOL v30 = __OFADD__(v28, 1);
    BOOL v51 = v30;
    a1 = v48;
    unint64_t v60 = v28;
    v53(v48, v47 + v49 * v28, v20);
    uint64_t v31 = *v66;
    (*v66)((char *)a1, 0, 1, v20);
    sub_24678(a1, (uint64_t)v15, &qword_53838);
    if (v27)
    {
      if (v27 < 1) {
        goto LABEL_36;
      }
      unint64_t v50 = v47 + v55 * v49;
      swift_bridgeObjectRetain();
      a1 = 0;
      while (1)
      {
        if (v64) {
          sub_3F278();
        }
        else {
          swift_retain();
        }
        sub_24678((uint64_t)v15, (uint64_t)v9, &qword_53838);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v21)(v9, 1, v20) == 1)
        {
          sub_DCD4((uint64_t)v9, &qword_53838);
          v31(v12, 1, 1, v20);
        }
        else
        {
          uint64_t v32 = v62;
          (*v61)(v62, v9, v20);
          if (v60 == v56)
          {
            os_log_type_t v33 = v57;
            v31(v57, 1, 1, v20);
          }
          else
          {
            if (v51)
            {
              __break(1u);
LABEL_35:
              __break(1u);
LABEL_36:
              __break(1u);
LABEL_37:
              swift_bridgeObjectRetain();
              a2 = v65;
              uint64_t v27 = sub_3F378();
              swift_bridgeObjectRelease();
              goto LABEL_4;
            }
            if (v55 >= v52) {
              goto LABEL_35;
            }
            os_log_type_t v33 = v57;
            v53((uint64_t)v57, v50, v20);
            v31(v33, 0, 1, v20);
            uint64_t v32 = v62;
          }
          sub_3EAE8();
          uint64_t v34 = (uint64_t)v33;
          os_signpost_type_t v12 = v63;
          sub_DCD4(v34, &qword_53838);
          (*v58)(v32, v20);
          uint64_t v27 = v59;
        }
        swift_release();
        ++a1;
        sub_DCD4((uint64_t)v15, &qword_53838);
        sub_3E2D4((uint64_t)v12, (uint64_t)v15);
        if (v27 == a1)
        {
          swift_bridgeObjectRelease();
          break;
        }
      }
    }
    uint64_t v35 = (uint64_t)v43;
    sub_3E2D4((uint64_t)v15, (uint64_t)v43);
    sub_DCD4(v48, &qword_53838);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v21)(v35, 1, v20) == 1)
    {
      sub_DCD4(v35, &qword_53838);
    }
    else
    {
      char v36 = *v61;
      uint64_t v37 = v44;
      (*v61)((uint64_t)v44, (char *)v35, v20);
      v53((uint64_t)v45, (unint64_t)v37, v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v46 = (void *)sub_1796C(0, v46[2] + 1, 1, (unint64_t)v46);
      }
      unint64_t v39 = v46[2];
      unint64_t v38 = v46[3];
      uint64_t v27 = v59;
      if (v39 >= v38 >> 1) {
        uint64_t v46 = (void *)sub_1796C(v38 > 1, v39 + 1, 1, (unint64_t)v46);
      }
      unint64_t v40 = v46;
      void v46[2] = v39 + 1;
      v36((uint64_t)v40 + v42 + v39 * v49, v45, v20);
      (*v58)((uint64_t)v44, v20);
    }
    unint64_t v28 = v55;
  }
  while (v55 != v52);
  return v46;
}

void sub_3CBB8(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_62C4(&qword_53838);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_3E558();
  __chkstk_darwin(v91);
  uint64_t v90 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 + 16);
  if (v11)
  {
    uint64_t v82 = v8;
    uint64_t v78 = a3;
    int v81 = a1 & 1;
    unint64_t v99 = (void *)(v100 + 16);
    uint64_t v79 = a2 + 32;
    unint64_t v89 = (void (**)(char *, uint64_t))(v9 + 8);
    swift_bridgeObjectRetain();
    unint64_t v94 = 0;
    uint64_t v95 = 0;
    uint64_t v92 = 0;
    uint64_t v93 = 0;
    uint64_t v12 = 32;
    *(void *)&long long v13 = 136315138;
    long long v88 = v13;
    uint64_t v83 = (char *)&type metadata for Any + 8;
    uint64_t v80 = v11;
    uint64_t v98 = a2;
    do
    {
      sub_6280(v99, *(void *)(v100 + 40));
      uint64_t v14 = swift_retain();
      sub_DD58(v14);
      uint64_t v19 = v15;
      if (v15)
      {
        uint64_t v20 = v16;
        uint64_t v21 = v18;
        id v97 = v17;
        unint64_t v22 = *(void *)(v15 + 16);
        if (v22 > 1)
        {
          id v96 = v18;
          if (qword_527A8 != -1) {
            swift_once();
          }
          uint64_t v23 = sub_3EC68();
          sub_60E8(v23, (uint64_t)qword_57CC8);
          swift_retain_n();
          uint64_t v24 = sub_3EC48();
          os_log_type_t v25 = sub_3EFB8();
          int v26 = v25;
          if (os_log_type_enabled(v24, v25))
          {
            uint64_t v27 = (_DWORD *)swift_slowAlloc();
            os_log_type_t v85 = v27;
            uint64_t v28 = swift_slowAlloc();
            os_log_t v86 = v24;
            uint64_t v87 = v28;
            v101[0] = v28;
            *uint64_t v27 = v88;
            uint64_t v29 = v90;
            sub_3E9D8();
            sub_DB78();
            uint64_t v30 = v91;
            uint64_t v31 = sub_3F598();
            int v84 = v26;
            unint64_t v33 = v32;
            (*v89)(v29, v30);
            uint64_t v34 = sub_2B8C8(v31, v33, v101);
            uint64_t v35 = (uint8_t *)v85;
            *(void *)(v85 + 1) = v34;
            swift_release_n();
            swift_bridgeObjectRelease();
            os_log_t v36 = v86;
            _os_log_impl(&dword_0, v86, (os_log_type_t)v84, "[%s]: More than 1 contact names found in the turn", v35, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_release_n();
          }
          uint64_t v21 = v96;
          unint64_t v22 = *(void *)(v19 + 16);
        }
        if (v22)
        {
          sub_3E3A0(v95, v94, v93, v92);
          swift_release();
          unint64_t v94 = v20;
          uint64_t v95 = v19;
          uint64_t v92 = v21;
          uint64_t v93 = v97;
        }
        else
        {
          id v96 = v21;
          if (qword_527A8 != -1) {
            swift_once();
          }
          uint64_t v48 = sub_3EC68();
          sub_60E8(v48, (uint64_t)qword_57CC8);
          swift_retain_n();
          uint64_t v49 = sub_3EC48();
          os_log_type_t v50 = sub_3EFB8();
          int v51 = v50;
          if (os_log_type_enabled(v49, v50))
          {
            unint64_t v52 = (_DWORD *)swift_slowAlloc();
            os_log_type_t v85 = v52;
            uint64_t v53 = swift_slowAlloc();
            os_log_t v86 = v49;
            uint64_t v87 = v53;
            v101[0] = v53;
            _DWORD *v52 = v88;
            uint64_t v54 = v90;
            sub_3E9D8();
            sub_DB78();
            uint64_t v55 = v91;
            uint64_t v56 = sub_3F598();
            int v84 = v51;
            unint64_t v58 = v57;
            (*v89)(v54, v55);
            uint64_t v59 = sub_2B8C8(v56, v58, v101);
            unint64_t v60 = (uint8_t *)v85;
            *(void *)(v85 + 1) = v59;
            swift_release_n();
            swift_bridgeObjectRelease();
            os_log_t v61 = v86;
            _os_log_impl(&dword_0, v86, (os_log_type_t)v84, "[%s]: No contacts found in the turn", v60, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {

            swift_bridgeObjectRelease();
            swift_release_n();
          }
        }
      }
      else
      {
        if (qword_527A8 != -1) {
          swift_once();
        }
        uint64_t v37 = sub_3EC68();
        sub_60E8(v37, (uint64_t)qword_57CC8);
        swift_retain_n();
        unint64_t v38 = sub_3EC48();
        os_log_type_t v39 = sub_3EFB8();
        if (os_log_type_enabled(v38, v39))
        {
          unint64_t v40 = (char *)swift_slowAlloc();
          id v96 = v40;
          id v97 = (id)swift_slowAlloc();
          v101[0] = (uint64_t)v97;
          *(_DWORD *)unint64_t v40 = v88;
          uint64_t v41 = v90;
          sub_3E9D8();
          sub_DB78();
          uint64_t v42 = v91;
          uint64_t v43 = sub_3F598();
          unint64_t v45 = v44;
          (*v89)(v41, v42);
          uint64_t v46 = sub_2B8C8(v43, v45, v101);
          unint64_t v47 = (uint8_t *)v96;
          *(void *)(v96 + 4) = v46;
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v38, v39, "[%s]: No asrLoggedContactToken was fetched for this turn. Continuing.", v47, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
        }
        else
        {

          swift_release_n();
        }
      }
      v12 += 16;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v62 = *(void *)(v79 + 16 * v80 - 8);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v63 = v90;
    sub_3E9D8();
    uint64_t v64 = (uint64_t)v82;
    sub_3D59C(v63, v62, (uint64_t)v82);
    uint64_t v65 = sub_252C0(v63, v64, v81);
    uint64_t v67 = v66;
    char v69 = v68;
    swift_bridgeObjectRelease();
    swift_release();
    sub_DCD4(v64, &qword_53838);
    (*v89)(v63, v91);
    uint64_t v70 = v95;
    if (v95)
    {
      a3 = v78;
      BOOL v72 = v93;
      uint64_t v71 = v94;
      char v73 = v92;
      goto LABEL_33;
    }
    swift_bridgeObjectRelease();
    a3 = v78;
  }
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v74 = sub_3EC68();
  sub_60E8(v74, (uint64_t)qword_57CC8);
  unint64_t v75 = sub_3EC48();
  os_log_type_t v76 = sub_3EFB8();
  if (os_log_type_enabled(v75, v76))
  {
    unint64_t v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v77 = 0;
    _os_log_impl(&dword_0, v75, v76, "No ASR logged contact token exists", v77, 2u);
    swift_slowDealloc();
  }

  uint64_t v70 = 0;
  uint64_t v71 = 0;
  BOOL v72 = 0;
  char v73 = 0;
  uint64_t v65 = 0;
  uint64_t v67 = 0;
  char v69 = 0;
LABEL_33:
  *(void *)a3 = v70;
  *(void *)(a3 + 8) = v71;
  *(void *)(a3 + 16) = v72;
  *(void *)(a3 + 24) = v73;
  *(void *)(a3 + 32) = v65;
  *(void *)(a3 + 40) = v67;
  *(unsigned char *)(a3 + 48) = v69;
}

uint64_t sub_3D59C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v45 = a3;
  uint64_t v6 = sub_3E558();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v44 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v38 - v10;
  swift_retain();
  uint64_t v12 = sub_3DDB0(a2, v3);
  swift_release();
  long long v13 = sub_3C4E8((uint64_t)v12, *(void *)(v3 + 72));
  swift_bridgeObjectRelease();
  if (qword_527A8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_3EC68();
  uint64_t v15 = sub_60E8(v14, (uint64_t)qword_57CC8);
  uint64_t v16 = *(void (**)(char *, void *, uint64_t))(v7 + 16);
  v16(v11, a1, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_3EC48();
  os_log_type_t v18 = sub_3EFA8();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v42 = a1;
  uint64_t v43 = v7;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    unint64_t v40 = v16;
    uint64_t v41 = v15;
    uint64_t v21 = v20;
    uint64_t v39 = swift_slowAlloc();
    v47[0] = v39;
    *(_DWORD *)uint64_t v21 = 136315394;
    v38[1] = v21 + 4;
    sub_DB78();
    uint64_t v22 = sub_3F598();
    uint64_t v46 = sub_2B8C8(v22, v23, v47);
    sub_3F088();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
    v24(v11, v6);
    *(_WORD *)(v21 + 12) = 2048;
    uint64_t v25 = v13[2];
    swift_bridgeObjectRelease();
    uint64_t v46 = v25;
    sub_3F088();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, v18, "[%s]: Coalesced %ld Intent events for the current turn", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v16 = v40;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void (**)(char *, uint64_t))(v7 + 8);
    v24(v11, v6);

    swift_bridgeObjectRelease();
  }
  unint64_t v26 = v13[2];
  uint64_t v27 = v44;
  if (v26 < 2)
  {
    uint64_t v33 = v45;
  }
  else
  {
    v16(v44, v42, v6);
    swift_bridgeObjectRetain_n();
    uint64_t v28 = sub_3EC48();
    os_log_type_t v29 = sub_3EFC8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      v47[0] = v41;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v42 = v13;
      sub_DB78();
      uint64_t v31 = sub_3F598();
      uint64_t v46 = sub_2B8C8(v31, v32, v47);
      long long v13 = v42;
      sub_3F088();
      swift_bridgeObjectRelease();
      v24(v27, v6);
      *(_WORD *)(v30 + 12) = 2048;
      swift_bridgeObjectRelease();
      uint64_t v46 = v26;
      sub_3F088();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v28, v29, "[%s]: Coalesced %ld Intent events for the current turn. Using only the first one.", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
      v24(v27, v6);

      swift_bridgeObjectRelease();
    }
    uint64_t v33 = v45;
    unint64_t v26 = v13[2];
  }
  uint64_t v34 = sub_3EA98();
  uint64_t v35 = *(void *)(v34 - 8);
  if (v26)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v33, (unint64_t)v13+ ((*(unsigned __int8 *)(*(void *)(v34 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v34 - 8) + 80)), v34);
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v33, v36, 1, v34);
  return swift_bridgeObjectRelease();
}

void *sub_3DB3C(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v6 = _swiftEmptyArrayStorage;
  while (1)
  {
    a1(&v21, v5);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6;
    }
    uint64_t v7 = v21;
    uint64_t v8 = *(void *)(v21 + 16);
    int64_t v9 = v6[2];
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v10 <= v6[3] >> 1)
    {
      if (*(void *)(v7 + 16)) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v9 <= v10) {
        int64_t v12 = v9 + v8;
      }
      else {
        int64_t v12 = v9;
      }
      uint64_t v6 = sub_181CC(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        uint64_t v13 = v6[2];
        if ((v6[3] >> 1) - v13 < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[5 * v13 + 4];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_62C4(&qword_532F8);
        swift_arrayInitWithCopy();
        if (v8)
        {
          uint64_t v16 = v6[2];
          BOOL v17 = __OFADD__(v16, v8);
          uint64_t v18 = v16 + v8;
          if (v17) {
            goto LABEL_31;
          }
          _OWORD v6[2] = v18;
        }
        goto LABEL_4;
      }
    }
    if (v8) {
      goto LABEL_29;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v5 += 40;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  unint64_t result = (void *)sub_3F3C8();
  __break(1u);
  return result;
}

uint64_t sub_3DD3C()
{
  sub_66DC(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ConversationDataProcessor()
{
  return self;
}

void *sub_3DDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v38 = sub_3EA98();
  uint64_t v6 = *(void *)(v38 - 8);
  uint64_t v7 = __chkstk_darwin(v38);
  uint64_t v37 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v34 = (char *)&v31 - v10;
  __chkstk_darwin(v9);
  uint64_t v33 = (char *)&v31 - v11;
  uint64_t v42 = *(void *)(a1 + 16);
  if (v42)
  {
    uint64_t v12 = *(void *)(sub_3E798() - 8);
    uint64_t v41 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v13 = *(void *)(a2 + 64);
    uint64_t v40 = *(void *)(v12 + 72);
    uint64_t v32 = v6;
    uint64_t v36 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v31 = a1;
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    uint64_t v39 = _swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v16 = v41 + v40 * v15;
      __chkstk_darwin(v14);
      *(&v31 - 2) = v16;
      swift_bridgeObjectRetain();
      BOOL v17 = sub_3DB3C((void (*)(uint64_t *__return_ptr, uint64_t))sub_3E33C, (uint64_t)(&v31 - 4), v13);
      swift_bridgeObjectRelease();
      uint64_t v18 = v17[2];
      if (v18)
      {
        uint64_t v19 = (uint64_t)(v17 + 4);
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_26030(v19, (uint64_t)&v44);
          sub_26030((uint64_t)&v44, (uint64_t)v43);
          sub_62C4(&qword_532F8);
          sub_3EA58();
          if (swift_dynamicCast()) {
            break;
          }
          sub_66DC((uint64_t)&v44);
          v19 += 40;
          if (!--v18)
          {
            swift_bridgeObjectRelease();
            goto LABEL_11;
          }
        }
        swift_bridgeObjectRelease();
        swift_release();
        sub_26094(&v44, (uint64_t)v46);
      }
      else
      {
LABEL_11:
        uint64_t v47 = 0;
        memset(v46, 0, sizeof(v46));
      }
      sub_24678((uint64_t)v46, (uint64_t)&v44, &qword_53840);
      if (v45)
      {
        sub_62C4(&qword_532F8);
        sub_3EA58();
        if (swift_dynamicCast())
        {
          uint64_t v35 = v3;
          swift_retain();
          sub_3E8B8();
          swift_release_n();
          sub_DCD4((uint64_t)v46, &qword_53840);
          uint64_t v20 = (void *)sub_3E788();
          id v21 = [v20 identifier];

          sub_3ED78();
          uint64_t v22 = v34;
          sub_3EA68();
          unint64_t v23 = *v36;
          uint64_t v24 = v33;
          uint64_t v25 = v38;
          (*v36)(v33, v22, v38);
          v23(v37, v24, v25);
          if (swift_isUniquelyReferenced_nonNull_native()) {
            unint64_t v26 = (unint64_t)v39;
          }
          else {
            unint64_t v26 = sub_1796C(0, v39[2] + 1, 1, (unint64_t)v39);
          }
          unint64_t v28 = *(void *)(v26 + 16);
          unint64_t v27 = *(void *)(v26 + 24);
          uint64_t v3 = v35;
          if (v28 >= v27 >> 1) {
            unint64_t v26 = sub_1796C(v27 > 1, v28 + 1, 1, v26);
          }
          *(void *)(v26 + 16) = v28 + 1;
          unint64_t v29 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
          uint64_t v39 = (void *)v26;
          uint64_t v14 = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v26 + v29 + *(void *)(v32 + 72) * v28, v37, v38);
          goto LABEL_5;
        }
      }
      else
      {
        sub_DCD4((uint64_t)&v44, &qword_53840);
      }
      sub_DCD4((uint64_t)v46, &qword_53840);
      uint64_t v14 = swift_bridgeObjectRelease();
LABEL_5:
      if (++v15 == v42)
      {
        swift_bridgeObjectRelease();
        return v39;
      }
    }
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_3E2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_62C4(&qword_53838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_3E33C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_6280(a1, a1[3]);
  uint64_t result = sub_3E988();
  *a2 = result;
  return result;
}

void sub_3E3A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_3E3F8()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_3E408()
{
  return static JSONEncoder.OutputFormatting.prettyPrinted.getter();
}

uint64_t sub_3E418()
{
  return type metadata accessor for JSONEncoder.OutputFormatting();
}

uint64_t sub_3E428()
{
  return dispatch thunk of JSONEncoder.outputFormatting.setter();
}

uint64_t sub_3E438()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_3E448()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t sub_3E458()
{
  return CharacterSet.init(charactersIn:)();
}

uint64_t sub_3E468()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_3E478()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_3E488()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_3E498()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3E4A8()
{
  return URL.path.getter();
}

uint64_t sub_3E4B8()
{
  return type metadata accessor for URL();
}

uint64_t sub_3E4C8()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_3E4D8()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_3E4E8()
{
  return Date.init()();
}

uint64_t sub_3E4F8()
{
  return type metadata accessor for Date();
}

uint64_t sub_3E508()
{
  return UUID.uuidString.getter();
}

NSUUID sub_3E518()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_3E528()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_3E538()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3E548()
{
  return UUID.init()();
}

uint64_t sub_3E558()
{
  return type metadata accessor for UUID();
}

uint64_t sub_3E568()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3E578()
{
  return type metadata accessor for Locale();
}

uint64_t sub_3E588()
{
  return dispatch thunk of DaemonSession.textToPhoneme(request:didFinish:)();
}

uint64_t sub_3E598()
{
  return type metadata accessor for DaemonSession();
}

uint64_t sub_3E5A8()
{
  return PhonemeRequest.init(text:voice:phonemeSystem:)();
}

uint64_t sub_3E5B8()
{
  return type metadata accessor for PhonemeRequest();
}

uint64_t sub_3E5C8()
{
  return SynthesisVoice.init(language:name:)();
}

uint64_t sub_3E5D8()
{
  return type metadata accessor for SynthesisVoice();
}

uint64_t sub_3E5E8()
{
  return TrialSiriUnderstandingTMDCStatusResolver.init()();
}

uint64_t sub_3E5F8()
{
  return type metadata accessor for TrialSiriUnderstandingTMDCStatusResolver();
}

uint64_t sub_3E608()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.p2pThreshold()();
}

uint64_t sub_3E618()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeEnabled()();
}

uint64_t sub_3E628()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.asrConfidenceThreshold()();
}

uint64_t sub_3E638()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeCallEnabled()();
}

uint64_t sub_3E648()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeMessageEnabled()();
}

uint64_t sub_3E658()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeCorrectionsEnabled()();
}

uint64_t sub_3E668()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeLocalStorageEnabled()();
}

uint64_t sub_3E678()
{
  return dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.asrConfidenceThresholdForOnlyContactName()();
}

uint64_t sub_3E688()
{
  return PrivateLearningPluginError.init(message:)();
}

uint64_t sub_3E698()
{
  return type metadata accessor for PrivateLearningPluginError();
}

uint64_t sub_3E6A8()
{
  return type metadata accessor for PrivateLearningPluginResult();
}

uint64_t sub_3E6B8()
{
  return static PrivateLearningPluginRunContext.== infix(_:_:)();
}

uint64_t sub_3E6C8()
{
  return type metadata accessor for PrivateLearningPluginRunContext();
}

uint64_t sub_3E6D8()
{
  return static ORCHEvents.requestID(_:)();
}

uint64_t sub_3E6E8()
{
  return ASRLogLinks.postITNLinkID.getter();
}

uint64_t sub_3E6F8()
{
  return ASRLogLinks.rawRecognitionLinkId.getter();
}

uint64_t sub_3E708()
{
  return type metadata accessor for ASRLogLinks();
}

uint64_t sub_3E718()
{
  return Conversation.getConversationId()();
}

uint64_t sub_3E728()
{
  return Conversation.getTimestamp()();
}

uint64_t sub_3E738()
{
  return Conversation.allTurnsChronologically.getter();
}

uint64_t sub_3E748()
{
  return type metadata accessor for Conversation();
}

uint64_t sub_3E758()
{
  return CoreDataStore.init(path:modelFileName:)();
}

uint64_t sub_3E768()
{
  return dispatch thunk of CoreDataStore.context.getter();
}

uint64_t sub_3E778()
{
  return CoreDataStore.deinit();
}

uint64_t sub_3E788()
{
  return AppInteraction.interaction.getter();
}

uint64_t sub_3E798()
{
  return type metadata accessor for AppInteraction();
}

uint64_t sub_3E7A8()
{
  return CurrentLocales.init(deviceLocale:siriPreferences:)();
}

uint64_t sub_3E7B8()
{
  return CurrentLocales.siri.getter();
}

uint64_t sub_3E7C8()
{
  return CurrentLocales.siriVoice.getter();
}

uint64_t sub_3E7D8()
{
  return type metadata accessor for CurrentLocales();
}

uint64_t sub_3E7E8()
{
  return StreamBookmark.__allocating_init(name:)();
}

uint64_t sub_3E7F8()
{
  return type metadata accessor for StreamBookmark();
}

uint64_t sub_3E808()
{
  return PLLoggingReader.asyncSignalReader.getter();
}

uint64_t sub_3E818()
{
  return PLLoggingReader.interactionReader.getter();
}

uint64_t sub_3E828()
{
  return PLLoggingReader.streamBookmarkStore.getter();
}

uint64_t sub_3E838()
{
  return static PLLoggingReader.shared.getter();
}

uint64_t sub_3E848()
{
  return type metadata accessor for PLLoggingReader();
}

uint64_t sub_3E858()
{
  return InteractionReader.appInteractions(since:intentTypes:until:)();
}

uint64_t sub_3E868()
{
  return dispatch thunk of LocalesController.isSiriCurrentLocaleSupported()();
}

uint64_t sub_3E878()
{
  return dispatch thunk of LocalesController.isSiriVoiceCurrentLocaleSupported()();
}

uint64_t sub_3E888()
{
  return LocalesController.init(currentLocales:supportedLocalesStore:)();
}

uint64_t sub_3E898()
{
  return LocalesController.currentLocales.getter();
}

uint64_t sub_3E8A8()
{
  return type metadata accessor for LocalesController();
}

uint64_t sub_3E8B8()
{
  return TypedNamedFeature.value.getter();
}

uint64_t sub_3E8C8()
{
  return dispatch thunk of ASRFeatureExtractor.extract(from:)();
}

uint64_t sub_3E8D8()
{
  return ASRFeatureExtractor.init()();
}

uint64_t sub_3E8E8()
{
  return type metadata accessor for ASRFeatureExtractor();
}

uint64_t sub_3E8F8()
{
  return dispatch thunk of StreamBookmarkStore.read(name:)();
}

uint64_t sub_3E908()
{
  return dispatch thunk of StreamBookmarkStore.write(bookmark:)();
}

uint64_t sub_3E918()
{
  return EnvironmentFeatureFlags.init()();
}

uint64_t sub_3E928()
{
  return type metadata accessor for EnvironmentFeatureFlags();
}

uint64_t sub_3E938()
{
  return SupportedLocalesStorePath.init(bundle:fileName:)();
}

uint64_t sub_3E948()
{
  return type metadata accessor for SupportedLocalesStorePath();
}

uint64_t sub_3E958()
{
  return SupportedLocalesPListStore.init(storePath:)();
}

uint64_t sub_3E968()
{
  return type metadata accessor for SupportedLocalesPListStore();
}

uint64_t sub_3E978()
{
  return dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)();
}

uint64_t sub_3E988()
{
  return dispatch thunk of AppInteractionFeatureExtractor.extract(from:)();
}

uint64_t sub_3E998()
{
  return dispatch thunk of DebugModeFlagUserDefaultsStore.debugModeEnabled.getter();
}

uint64_t sub_3E9A8()
{
  return DebugModeFlagUserDefaultsStore.init()();
}

uint64_t sub_3E9B8()
{
  return type metadata accessor for DebugModeFlagUserDefaultsStore();
}

uint64_t sub_3E9C8()
{
  return Turn.events.getter();
}

uint64_t sub_3E9D8()
{
  return Turn.turnID.getter();
}

uint64_t sub_3E9E8()
{
  return type metadata accessor for Turn();
}

uint64_t sub_3E9F8()
{
  return static Config.groundTruthDir.getter();
}

uint64_t _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0()
{
  return Locale.stringFormat.getter();
}

uint64_t sub_3EA18()
{
  return Locale.stringDashFormat.getter();
}

uint64_t sub_3EA28()
{
  return Locale.init(language:region:)();
}

uint64_t sub_3EA38()
{
  return type metadata accessor for Locale();
}

uint64_t sub_3EA48()
{
  return type metadata accessor for CommonFeature.IntentHandlingStatus();
}

uint64_t sub_3EA58()
{
  return type metadata accessor for CommonFeature.EventType();
}

uint64_t sub_3EA68()
{
  return CoreDuetEvent.init(eventId:features:eventType:)();
}

uint64_t sub_3EA78()
{
  return CoreDuetEvent.eventId.getter();
}

uint64_t sub_3EA88()
{
  return CoreDuetEvent.features.getter();
}

uint64_t sub_3EA98()
{
  return type metadata accessor for CoreDuetEvent();
}

uint64_t sub_3EAA8()
{
  return static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)();
}

uint64_t sub_3EAB8()
{
  return type metadata accessor for PhoneCallEventFeature.CallDuration();
}

uint64_t sub_3EAC8()
{
  return CommonContactReference.contactIdentifier.getter();
}

uint64_t sub_3EAD8()
{
  return type metadata accessor for CommonContactReference();
}

uint64_t sub_3EAE8()
{
  return dispatch thunk of CoreDuetEventCoalescing.process(_:next:)();
}

uint64_t sub_3EAF8()
{
  return PhoneCallEventCoalescer.init()();
}

uint64_t sub_3EB08()
{
  return type metadata accessor for PhoneCallEventCoalescer();
}

uint64_t sub_3EB18()
{
  return SendMessageEventCoalescer.init()();
}

uint64_t sub_3EB28()
{
  return type metadata accessor for SendMessageEventCoalescer();
}

uint64_t sub_3EB38()
{
  return CommonInteractionFeatureExtractor.init()();
}

uint64_t sub_3EB48()
{
  return type metadata accessor for CommonInteractionFeatureExtractor();
}

uint64_t sub_3EB58()
{
  return INStartCallIntentFeatureExtractor.init()();
}

uint64_t sub_3EB68()
{
  return type metadata accessor for INStartCallIntentFeatureExtractor();
}

uint64_t sub_3EB78()
{
  return INSendMessageIntentFeatureExtractor.init()();
}

uint64_t sub_3EB88()
{
  return type metadata accessor for INSendMessageIntentFeatureExtractor();
}

uint64_t sub_3EB98()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_3EBA8()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_3EBB8()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_3EBC8()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_3EBD8()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_3EBE8()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_3EBF8()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_3EC08()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_3EC18()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_3EC28()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_3EC38()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_3EC48()
{
  return Logger.logObject.getter();
}

uint64_t sub_3EC58()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_3EC68()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3EC78()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t sub_3EC88()
{
  return static DispatchTime.now()();
}

uint64_t sub_3EC98()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_3ECA8()
{
  return + infix(_:_:)();
}

uint64_t sub_3ECB8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3ECC8()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_3ECD8()
{
  return Character.write<A>(to:)();
}

uint64_t sub_3ECE8()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_3ECF8()
{
  return static Comparable.> infix(_:_:)();
}

uint64_t sub_3ED08()
{
  return static Comparable.>= infix(_:_:)();
}

uint64_t sub_3ED18()
{
  return static Comparable.<= infix(_:_:)();
}

uint64_t sub_3ED28()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_3ED38()
{
  return String.init(contentsOfFile:)();
}

NSString sub_3ED48()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3ED58()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3ED68()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3ED78()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3ED88()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_3ED98()
{
  return String.init(data:encoding:)();
}

uint64_t sub_3EDA8()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_3EDB8()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_3EDC8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_3EDD8()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_3EDE8()
{
  return String.hash(into:)();
}

uint64_t sub_3EDF8()
{
  return String.count.getter();
}

uint64_t sub_3EE08()
{
  return String.index(after:)();
}

void sub_3EE18(Swift::String a1)
{
}

Swift::Int sub_3EE28()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3EE38()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_3EE48()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_3EE58()
{
  return String.subscript.getter();
}

uint64_t sub_3EE68()
{
  return String.subscript.getter();
}

uint64_t sub_3EE78()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_3EE88()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_3EE98()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_3EEA8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_3EEB8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3EEC8()
{
  return Array.description.getter();
}

uint64_t sub_3EED8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_3EEE8()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_3EEF8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_3EF08()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_3EF18()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_3EF38()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_3EF48()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_3EF58()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_3EF68()
{
  return Double.write<A>(to:)();
}

uint64_t sub_3EF78()
{
  return Set.description.getter();
}

uint64_t sub_3EF88()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_3EF98()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_3EFA8()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_3EFB8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3EFC8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_3EFD8()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_3EFE8()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_3EFF8()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_3F008()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_3F018()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_3F028()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_3F038()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_3F048()
{
  return NSCoder.decodeObject<A>(of:forKey:)();
}

Swift::Int sub_3F058(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_3F068()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_3F078()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3F088()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3F098()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3F0A8()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_3F0B8()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_3F0C8()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_3F0D8()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_3F0E8()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_3F0F8()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_3F108()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t sub_3F118()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_3F128()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_3F138()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_3F148()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_3F158()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_3F168()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_3F178()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_3F188()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_3F198()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_3F1A8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_3F1B8()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_3F1C8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_3F1D8()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_3F1E8()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_3F1F8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_3F208()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_3F218()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_3F228()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

void sub_3F238(Swift::Int a1)
{
}

uint64_t sub_3F248()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_3F258()
{
  return Identifiable<>.id.getter();
}

void sub_3F268(Swift::Int a1)
{
}

uint64_t sub_3F278()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_3F288()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_3F298()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_3F2A8()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_3F2B8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3F2C8()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t sub_3F2D8()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_3F2E8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_3F2F8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_3F308()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_3F318()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_3F328()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_3F338()
{
  return dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
}

uint64_t sub_3F348()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_3F358()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t sub_3F368()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3F378()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_3F388()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_3F398()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_3F3A8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_3F3B8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_3F3C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_3F3D8()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_3F3F8(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_3F408()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_3F418()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_3F428()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3F438()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3F448()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_3F458()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3F468()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3F478()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3F488()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3F498()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_3F4A8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3F4B8()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3F4C8()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_3F4D8()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_3F4E8()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_3F4F8()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_3F508()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_3F518()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_3F528()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3F538()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3F548()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3F558()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_3F568()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3F578()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_3F588(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_3F598()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_3F5A8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_3F5B8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_3F5C8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_3F5D8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_3F5E8()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_3F5F8()
{
  return Error._code.getter();
}

uint64_t sub_3F608()
{
  return Error._domain.getter();
}

uint64_t sub_3F618()
{
  return Error._userInfo.getter();
}

uint64_t sub_3F628()
{
  return Hasher.init(_seed:)();
}

void sub_3F638(Swift::UInt a1)
{
}

Swift::Int sub_3F648()
{
  return Hasher.finalize()();
}

Swift::Int sub_3F658()
{
  return Hasher._finalize()();
}

uint64_t sub_3F668()
{
  return Hasher.init()();
}

uint64_t sub_3F678()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_3F688()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}