uint64_t sub_1F50(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  long long v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (**v33)(void);
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(void);
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void);
  void (*v50)(void);
  Class isa;
  id v52;
  void (*v53)(uint64_t, uint64_t);
  id v54;
  NSObject *v55;
  char *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  Swift::Int v69;
  unint64_t v70;
  char v71;
  BOOL v72;
  void (**v73)(uint64_t, uint64_t);
  unint64_t v74;
  char v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t);
  uint64_t v85;
  int64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  SEL v90;
  void *v91;
  SEL v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t result;
  int64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  uint64_t v105;
  int64_t v106;
  long long v107;
  void (**v108)(void);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  void (**v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  char *v117;
  id v118;
  uint64_t v119;
  int64_t v120;
  uint64_t v121;
  id v122;

  v2 = sub_6A30();
  sub_6530();
  v4 = v3;
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v96 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  sub_6700();
  v121 = v8;
  __chkstk_darwin(v9);
  v11 = (char *)&v96 - v10;
  v12 = sub_5424(&qword_C6C0);
  v13 = __chkstk_darwin(v12 - 8);
  v15 = (char *)&v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v96 - v16;
  v102 = sub_6AB0();
  sub_6530();
  v101 = v18;
  __chkstk_darwin(v19);
  v21 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6A40();
  v117 = v21;
  sub_6760();
  sub_6AA0();
  v22 = [a1 matchingRecordSet];
  v103 = a1;
  v23 = [a1 recipe];
  v24 = [v23 recipeUserInfo];

  v100 = sub_6AD0();
  sub_64E8(&qword_C6C8, (void (*)(uint64_t))&type metadata accessor for UUID);
  v104 = (id)sub_6AE0();
  v118 = v22;
  v25 = [v22 nativeRecordInfo];
  sub_5424(&qword_C618);
  v26 = sub_6AD0();

  v28 = 0;
  v29 = *(void *)(v26 + 64);
  v105 = v26 + 64;
  v109 = v4;
  v110 = v26;
  v30 = 1 << *(unsigned char *)(v26 + 32);
  v31 = -1;
  if (v30 < 64) {
    v31 = ~(-1 << v30);
  }
  v32 = v31 & v29;
  v33 = (void (**)(void))(v4 + 16);
  v115 = v4 + 32;
  v116 = 0;
  v114 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  v34 = (uint64_t)v17;
  v106 = (unint64_t)(v30 + 63) >> 6;
  v96 = v106 - 1;
  *(void *)&v27 = 136315138;
  v107 = v27;
  v112 = v17;
  v113 = v15;
  v108 = v33;
  v111 = v2;
  if (!v32) {
    goto LABEL_6;
  }
LABEL_4:
  v119 = (v32 - 1) & v32;
  v120 = v28;
  v35 = __clz(__rbit64(v32)) | (v28 << 6);
LABEL_5:
  v36 = v110;
  sub_67A8();
  v37();
  v38 = *(void *)(v36 + 56);
  v39 = sub_5424(&qword_C6D0);
  *(void *)&v15[*(int *)(v39 + 48)] = *(void *)(v38 + 8 * v35);
  sub_54CC((uint64_t)v15, 0, 1, v39);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_6488((uint64_t)v15, v34, &qword_C6C0);
    v48 = sub_5424(&qword_C6D0);
    if (sub_554C(v34, 1, v48) == 1) {
      break;
    }
    swift_bridgeObjectRelease();
    sub_687C();
    v49();
    v50 = *v33;
    sub_67A8();
    v50();
    isa = sub_6A20().super.isa;
    v122 = 0;
    v52 = [v118 nativeRecordDataForRecordUUID:isa error:&v122];

    if (v52)
    {
      v97 = v11;
      v61 = v122;
      v98 = sub_6A00();
      v99 = v62;

      v63 = v104;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v122 = v63;
      sub_5E44(v121);
      sub_68A0();
      v69 = v67 + v68;
      if (__OFADD__(v67, v68)) {
        goto LABEL_50;
      }
      v70 = v65;
      v71 = v66;
      sub_5424(&qword_C6D8);
      v72 = sub_6C00(isUniquelyReferenced_nonNull_native, v69);
      v11 = v97;
      v73 = v114;
      if (v72)
      {
        v74 = sub_5E44(v121);
        if ((v71 & 1) != (v75 & 1))
        {
          result = sub_6C70();
          __break(1u);
          return result;
        }
        v70 = v74;
      }
      v76 = v122;
      v104 = v122;
      if (v71)
      {
        v77 = *((void *)v122 + 7) + 16 * v70;
        sub_5574(*(void *)v77, *(void *)(v77 + 8));
        v78 = v99;
        *(void *)v77 = v98;
        *(void *)(v77 + 8) = v78;
        v33 = v108;
      }
      else
      {
        sub_68D4((uint64_t)v122 + 8 * (v70 >> 6));
        v33 = v108;
        sub_67A8();
        v50();
        v79 = (uint64_t *)(v76[7] + 16 * v70);
        v80 = v99;
        *v79 = v98;
        v79[1] = v80;
        v81 = v76[2];
        v82 = __OFADD__(v81, 1);
        v83 = v81 + 1;
        if (v82) {
          goto LABEL_51;
        }
        v76[2] = v83;
      }
      swift_bridgeObjectRelease();
      v84 = *v73;
      (*v73)(v121, v2);
      v84((uint64_t)v11, v2);
      v15 = v113;
    }
    else
    {
      v53 = *v114;
      v54 = v122;
      v53(v121, v2);
      sub_69E0();

      swift_willThrow();
      sub_67A8();
      v50();
      v55 = sub_6A90();
      v56 = v11;
      v57 = sub_6B80();
      if (os_log_type_enabled(v55, v57))
      {
        v58 = swift_slowAlloc();
        v122 = (id)swift_slowAlloc();
        *(_DWORD *)v58 = v107;
        v59 = sub_6A10();
        *(void *)(v58 + 4) = sub_55CC(v59, v60, (uint64_t *)&v122);
        swift_bridgeObjectRelease();
        v53((uint64_t)v7, v111);
        _os_log_impl(&dword_0, v55, v57, "failure retrieving native record data for %s; skipping from collection",
          (uint8_t *)v58,
          0xCu);
        swift_arrayDestroy();
        v2 = v111;
        swift_slowDealloc();
        v33 = v108;
        swift_slowDealloc();
      }
      else
      {
        v53((uint64_t)v7, v2);
      }
      swift_errorRelease();

      v53((uint64_t)v56, v2);
      v116 = 0;
      v11 = v56;
      v34 = (uint64_t)v112;
      v15 = v113;
    }
    v32 = v119;
    v28 = v120;
    if (v119) {
      goto LABEL_4;
    }
LABEL_6:
    v40 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
    }
    if (v40 >= v106)
    {
      v120 = v28;
      goto LABEL_11;
    }
    if (*(void *)(v105 + 8 * v40)) {
      goto LABEL_9;
    }
    if (v28 + 2 < v106)
    {
      if (*(void *)(v105 + 8 * (v28 + 2))) {
        goto LABEL_9;
      }
      if (v28 + 3 >= v106)
      {
        v120 = v28 + 2;
        goto LABEL_11;
      }
      if (*(void *)(v105 + 8 * (v28 + 3))) {
        goto LABEL_9;
      }
      v85 = v28 + 4;
      if (v28 + 4 >= v106)
      {
        v120 = v28 + 3;
        goto LABEL_11;
      }
      if (*(void *)(v105 + 8 * v85))
      {
LABEL_9:
        sub_6780();
        v119 = v42;
        v120 = v41;
        v35 = v43 + (v41 << 6);
        goto LABEL_5;
      }
      while (1)
      {
        v86 = v85 + 1;
        if (__OFADD__(v85, 1)) {
          goto LABEL_52;
        }
        if (v86 >= v106) {
          break;
        }
        ++v85;
        if (*(void *)(v105 + 8 * v86)) {
          goto LABEL_9;
        }
      }
      v40 = v96;
    }
    v120 = v40;
LABEL_11:
    sub_5424(&qword_C6D0);
    v44 = sub_6944();
    sub_54CC(v44, v45, v46, v47);
    v119 = 0;
  }
  swift_release();
  v87 = v116;
  sub_2990(v100, (uint64_t)v104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v87)
  {
    v88 = (void *)sub_69D0();
    v89 = (void *)sub_68C0();
    [v89 v90];

    swift_errorRelease();
  }
  else
  {
    v88 = sub_6AC0().super.isa;
    swift_bridgeObjectRelease();
    v91 = (void *)sub_68C0();
    [v91 v92];
  }
  v93 = v102;
  v94 = v101;

  return (*(uint64_t (**)(char *, uint64_t))(v94 + 8))(v117, v93);
}

uint64_t sub_2990(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v293 = a2;
  uint64_t v277 = sub_6A80();
  sub_6530();
  uint64_t v6 = v5;
  __chkstk_darwin();
  sub_6794();
  sub_654C();
  __chkstk_darwin();
  v8 = ((char *)v246 - v7);
  sub_5424(&qword_C630);
  __chkstk_darwin();
  sub_691C();
  sub_68B0(v9);
  uint64_t v10 = sub_6A70();
  sub_6530();
  uint64_t v12 = v11;
  __chkstk_darwin();
  sub_691C();
  sub_68B0(v13);
  uint64_t v294 = sub_6A30();
  sub_6530();
  uint64_t v292 = v14;
  __chkstk_darwin();
  sub_6794();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  *(void *)&long long v285 = (char *)v246 - v15;
  sub_5424(&qword_C638);
  __chkstk_darwin();
  sub_6794();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_6700();
  sub_654C();
  __chkstk_darwin();
  sub_68B0((uint64_t)v246 - v16);
  uint64_t v267 = sub_6AB0();
  sub_6530();
  uint64_t v266 = v17;
  __chkstk_darwin();
  v19 = (char *)v246 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6A40();
  v295 = v19;
  sub_6760();
  sub_6AA0();
  uint64_t v265 = a1;
  sub_4A2C(1701667182, 0xE400000000000000, a1, &v305);
  if (!*((void *)&v306 + 1))
  {
    sub_5F38((uint64_t)&v305, &qword_C640);
LABEL_10:
    uint64_t v286 = sub_5424(&qword_C618);
    uint64_t v22 = sub_6AE0();
    sub_6888(v22, (uint64_t)v304);
    sub_6594();
    unint64_t v297 = v23;
    v290 = (v24 + 32);
    v289 = (void (**)(void))(v24 + 8);
    uint64_t v284 = v25;
    uint64_t v273 = v25 - 1;
    uint64_t v26 = 0;
    uint64_t v274 = swift_bridgeObjectRetain() + 104;
    *(void *)&long long v27 = 136315138;
    long long v285 = v27;
    v278 = (char *)&type metadata for Any + 8;
    v276 = (void *)0x8000000000007450;
    long long v275 = xmmword_6FF0;
    uint64_t v28 = v294;
    v29 = v282;
LABEL_11:
    uint64_t v30 = v288;
    uint64_t v31 = v291;
    if (v2)
    {
LABEL_12:
      sub_67B8();
      uint64_t v299 = v2;
      uint64_t v33 = v32 | (v26 << 6);
LABEL_13:
      sub_66A0();
      v34(v30);
      v35 = (uint64_t *)(*((void *)v19 + 7) + 16 * v33);
      uint64_t v36 = sub_5424(&qword_C648);
      v37 = (uint64_t *)(v30 + *(int *)(v36 + 48));
      uint64_t v38 = *v35;
      unint64_t v39 = v35[1];
      uint64_t *v37 = v38;
      v37[1] = v39;
      sub_54CC(v30, 0, 1, v36);
      sub_54F4(v38, v39);
      goto LABEL_24;
    }
    while (1)
    {
      if (__OFADD__(v26, 1))
      {
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
LABEL_175:
        __break(1u);
LABEL_176:
        __break(1u);
      }
      sub_66F4();
      if (v40 != v41)
      {
        sub_6808();
        if (v43) {
          goto LABEL_18;
        }
        if (v42 + 1 >= v284)
        {
          uint64_t v26 = v42;
        }
        else
        {
          if (*(void *)(v280 + 8 * (v42 + 1))) {
            goto LABEL_18;
          }
          if (v42 + 2 >= v284)
          {
            uint64_t v26 = v42 + 1;
          }
          else
          {
            if (*(void *)(v280 + 8 * (v42 + 2))) {
              goto LABEL_18;
            }
            sub_66F4();
            if (v40 != v41)
            {
              sub_6808();
              if (v91)
              {
LABEL_18:
                sub_6780();
                uint64_t v299 = v44;
                uint64_t v33 = v46 + (v45 << 6);
                uint64_t v26 = v45;
                goto LABEL_13;
              }
              while (1)
              {
                sub_66F4();
                if (v40 == v41) {
                  break;
                }
                if (*(void *)(v274 + 8 * v26++)) {
                  goto LABEL_18;
                }
              }
              uint64_t v26 = v273;
            }
            else
            {
              uint64_t v26 = v90;
            }
          }
        }
      }
      sub_5424(&qword_C648);
      uint64_t v47 = sub_6944();
      sub_54CC(v47, v48, v49, v50);
      uint64_t v299 = 0;
LABEL_24:
      sub_6488(v30, v31, &qword_C638);
      uint64_t v51 = sub_5424(&qword_C648);
      if (sub_554C(v31, 1, v51) == 1)
      {
        swift_release();
        sub_66C4(&v305);
        if (*((void *)&v306 + 1))
        {
          int v108 = swift_dynamicCast();
          uint64_t v109 = v277;
          if (v108 && (v302 & 1) != 0)
          {
            uint64_t v110 = swift_bridgeObjectRetain();
            uint64_t v111 = sub_50C8(v110);
            if (v3)
            {
              swift_bridgeObjectRelease();
              uint64_t v112 = sub_6628();
              os_log_type_t v113 = sub_6B80();
              if (os_log_type_enabled((os_log_t)v112, v113))
              {
                *(_WORD *)sub_6958() = 0;
                sub_68E8(&dword_0, v114, v115, "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_657C();
              }

              sub_4DA4(v109, &qword_C618);
              sub_6970();
LABEL_166:
              swift_errorRelease();
            }
            else
            {
              uint64_t v112 = v111;
              swift_bridgeObjectRelease_n();
            }
LABEL_169:
            sub_6668();
            v244();
            return v112;
          }
        }
        else
        {
          sub_5F38((uint64_t)&v305, &qword_C640);
          uint64_t v109 = v277;
        }
        sub_4DA4(v109, &qword_C618);
        uint64_t v112 = v116;
LABEL_66:
        swift_bridgeObjectRelease();
        goto LABEL_169;
      }
      uint64_t v298 = v26;
      v52 = (uint64_t *)(v31 + *(int *)(v51 + 48));
      uint64_t v54 = *v52;
      unint64_t v53 = v52[1];
      sub_687C();
      v55();
      v56 = self;
      Class isa = sub_69F0().super.isa;
      *(void *)&long long v305 = 0;
      id v58 = [v56 JSONObjectWithData:isa options:0 error:&v305];

      if (v58)
      {
        unint64_t v296 = v53;
        id v59 = (id)v305;
        sub_6BC0();
        swift_unknownObjectRelease();
        if (!swift_dynamicCast())
        {
          sub_6690();
          v81();
          v82 = sub_6628();
          os_log_type_t v83 = sub_6B70();
          if (sub_6860(v83))
          {
            uint64_t v84 = sub_6838();
            uint64_t v85 = sub_6820();
            sub_67EC(v85);
            uint64_t v86 = sub_6A10();
            *(void *)(v84 + 4) = sub_55CC(v86, v87, (uint64_t *)&v305);
            swift_bridgeObjectRelease();
            v19 = (char *)*v289;
            sub_6754();
            ((void (*)(void))v19)();
            _os_log_impl(&dword_0, v82, (os_log_type_t)&qword_C648, "Couldn't decode data for %s into a record, skipping", (uint8_t *)v84, 0xCu);
            swift_arrayDestroy();
            uint64_t v3 = v28;
            uint64_t v28 = v294;
            sub_657C();
            uint64_t v30 = v288;
            sub_657C();
            sub_6674();

            sub_6754();
            ((void (*)(void))v19)();
          }
          else
          {
            sub_6674();
            v19 = (char *)v289;
            v89 = *v289;
            sub_67CC();
            v89();

            sub_67CC();
            v89();
          }
          goto LABEL_41;
        }
        uint64_t v60 = v302;
        if (!*(void *)(v302 + 16) || (unint64_t v61 = sub_5DCC(0x79546C616E676973, 0xEA00000000006570), (v62 & 1) == 0))
        {
          uint64_t v279 = v3;
          long long v305 = 0u;
          long long v306 = 0u;
          sub_5F38((uint64_t)&v305, &qword_C640);
          v93 = sub_6628();
          os_log_type_t v94 = sub_6B70();
          if (os_log_type_enabled(v93, v94))
          {
            v95 = (uint8_t *)sub_6958();
            *(_WORD *)v95 = 0;
            _os_log_impl(&dword_0, v93, v94, "SiriInference dodML plugin ran succesfully", v95, 2u);
            sub_657C();
          }

          sub_5D84(24);
          uint64_t v96 = sub_6A40();
          uint64_t v98 = v97;
          swift_bridgeObjectRelease();
          *(void *)&long long v305 = v96;
          *((void *)&v305 + 1) = v98;
          v308._countAndFlagsBits = 0xD000000000000016;
          v308._object = v276;
          sub_6B40(v308);
          NSString v99 = sub_6B10();
          swift_bridgeObjectRelease();
          sub_5424(&qword_C650);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = v275;
          *(void *)(inited + 32) = 0x656D6F6374756FLL;
          *(void *)(inited + 40) = 0xE700000000000000;
          sub_5F90(0, &qword_C658);
          *(void *)(inited + 48) = sub_6BA0();
          sub_5F90(0, &qword_C660);
          sub_6AE0();
          Class v101 = sub_6AC0().super.isa;
          swift_bridgeObjectRelease();
          AnalyticsSendEvent();

          uint64_t v102 = sub_6A10();
          uint64_t v104 = v103;
          uint64_t v105 = v277;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v305 = v105;
          v19 = (char *)&v305;
          sub_5FD4(v60, v102, v104, isUniquelyReferenced_nonNull_native, &qword_C6B0);
          uint64_t v277 = v305;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_6674();
          sub_6668();
          v107();
          uint64_t v3 = v279;
          uint64_t v26 = v298;
          uint64_t v2 = v299;
          goto LABEL_11;
        }
        sub_5EDC(*(void *)(v60 + 56) + 32 * v61, (uint64_t)&v305);
        swift_bridgeObjectRelease();
        sub_5F38((uint64_t)&v305, &qword_C640);
        sub_6814();
        v63 = v281;
        sub_6690();
        v64();
        v65 = sub_6628();
        os_log_type_t v66 = sub_6B70();
        if (sub_6860(v66))
        {
          v29 = v63;
          uint64_t v67 = sub_6838();
          uint64_t v68 = sub_6820();
          sub_67EC(v68);
          uint64_t v69 = sub_6A10();
          v19 = (char *)v70;
          *(void *)(v67 + 4) = sub_55CC(v69, v70, (uint64_t *)&v305);
          swift_bridgeObjectRelease();
          uint64_t v71 = sub_65D0();
          ((void (*)(uint64_t))v19)(v71);
          _os_log_impl(&dword_0, v65, (os_log_type_t)&qword_C648, "Record %s looks like a CustomSignal, skipping", (uint8_t *)v67, 0xCu);
          swift_arrayDestroy();
          uint64_t v3 = v28;
          uint64_t v28 = v294;
          sub_657C();
          sub_657C();
        }
        else
        {
          v19 = (char *)*v289;
          ((void (*)(NSObject *, uint64_t))*v289)(v63, v28);
        }
        sub_6674();

        ((void (*)(NSObject *, uint64_t))v19)(v29, v28);
      }
      else
      {
        id v72 = (id)v305;
        sub_69E0();

        swift_willThrow();
        sub_6814();
        v73 = v283;
        sub_6690();
        v74();
        v75 = sub_6628();
        os_log_type_t v76 = sub_6B80();
        if (sub_6860(v76))
        {
          v29 = v73;
          uint64_t v77 = sub_6838();
          *(void *)&long long v305 = sub_6820();
          *(_DWORD *)uint64_t v77 = v285;
          uint64_t v78 = sub_6A10();
          v19 = (char *)v79;
          *(void *)(v77 + 4) = sub_55CC(v78, v79, (uint64_t *)&v305);
          swift_bridgeObjectRelease();
          unint64_t v296 = v53;
          uint64_t v80 = sub_65D0();
          ((void (*)(uint64_t))v19)(v80);
          _os_log_impl(&dword_0, v75, (os_log_type_t)&qword_C648, "Unable to decode record %s, skipping", (uint8_t *)v77, 0xCu);
          swift_arrayDestroy();
          uint64_t v28 = v294;
          sub_657C();
          sub_657C();
          sub_6674();
          swift_errorRelease();

          sub_6754();
          ((void (*)(void))v19)();
        }
        else
        {
          sub_5574(v54, v53);
          v19 = (char *)v289;
          v88 = *v289;
          sub_67CC();
          v88();
          swift_errorRelease();

          ((void (*)(NSObject *, uint64_t))v88)(v29, v28);
        }
        uint64_t v3 = 0;
      }
      uint64_t v30 = v288;
LABEL_41:
      uint64_t v31 = v291;
      uint64_t v26 = v298;
      uint64_t v2 = v299;
      if (v299) {
        goto LABEL_12;
      }
    }
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  v289 = (void (**)(void))v10;
  v19 = (char *)*((void *)&v302 + 1);
  if ((void)v302 != 0x536F747541736D73 || *((void *)&v302 + 1) != 0xEB00000000646E65)
  {
    uint64_t v10 = sub_6C60();
    swift_bridgeObjectRelease();
    uint64_t v21 = v280;
    if (v10) {
      goto LABEL_68;
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = v280;
LABEL_68:
  v281 = v8;
  sub_69C0();
  v117 = swift_allocObject();
  uint64_t v288 = sub_69B0();
  sub_5424(&qword_C668);
  uint64_t v118 = sub_6AE0();
  sub_6888(v118, (uint64_t)&v280);
  sub_6594();
  uint64_t v291 = v119;
  v287 = v120 + 4;
  v283 = v120 + 1;
  *(void *)&long long v275 = v12 + 32;
  LODWORD(v274) = enum case for CustomSignalType.messagesAutoSend(_:);
  uint64_t v273 = v6 + 104;
  v272 = (void (**)(void))(v6 + 8);
  uint64_t v271 = v12 + 8;
  v282 = v121;
  uint64_t v249 = (uint64_t)&v121[-1].isa + 7;
  uint64_t v250 = swift_bridgeObjectRetain() + 104;
  *(void *)&long long v122 = 136315138;
  long long v269 = v122;
  v254 = (char *)&type metadata for Any + 8;
  v251 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v123 = v294;
  sub_6740();
  while (1)
  {
    while (1)
    {
      if (v2)
      {
        sub_67B8();
        uint64_t v298 = v2;
        uint64_t v299 = v125;
        uint64_t v127 = v126 | (v125 << 6);
LABEL_71:
        sub_66A0();
        v128(v21);
        v129 = (uint64_t *)((char *)v117[7].isa + 16 * v127);
        uint64_t v130 = sub_5424(&qword_C648);
        v131 = (uint64_t *)(v21 + *(int *)(v130 + 48));
        uint64_t v132 = *v129;
        unint64_t v133 = v129[1];
        uint64_t *v131 = v132;
        v131[1] = v133;
        sub_54CC(v21, 0, 1, v130);
        sub_54F4(v132, v133);
        v117 = v290;
        goto LABEL_78;
      }
      if (__OFADD__(v124, 1)) {
        goto LABEL_173;
      }
      sub_66F4();
      if (v40 != v41)
      {
        sub_6808();
        v117 = v290;
        if (v136) {
          goto LABEL_76;
        }
        if (v135 + 1 >= (uint64_t)v282) {
          goto LABEL_158;
        }
        if (*(void *)(v264 + 8 * (v135 + 1))) {
          goto LABEL_76;
        }
        if (v135 + 2 >= (uint64_t)v282)
        {
          uint64_t v299 = v135 + 1;
        }
        else
        {
          if (*(void *)(v264 + 8 * (v135 + 2))) {
            goto LABEL_76;
          }
          sub_66F4();
          if (v40 != v41)
          {
            sub_6808();
            if (v188)
            {
LABEL_76:
              sub_6780();
              uint64_t v298 = v137;
              uint64_t v127 = v139 + (v138 << 6);
              uint64_t v299 = v138;
              goto LABEL_71;
            }
            while (1)
            {
              sub_66F4();
              if (v40 == v41) {
                break;
              }
              if (*(void *)(v250 + 8 * v189)) {
                goto LABEL_76;
              }
            }
            uint64_t v135 = v249;
LABEL_158:
            uint64_t v299 = v135;
            goto LABEL_77;
          }
          uint64_t v299 = v187;
        }
      }
      else
      {
        uint64_t v299 = v134;
        v117 = v290;
      }
LABEL_77:
      uint64_t v140 = sub_5424(&qword_C648);
      sub_54CC(v21, 1, 1, v140);
      uint64_t v298 = 0;
LABEL_78:
      sub_6488(v21, (uint64_t)v117, &qword_C638);
      uint64_t v112 = sub_5424(&qword_C648);
      if (sub_554C((uint64_t)v117, 1, v112) == 1)
      {
        swift_release();
        sub_66C4(&v302);
        if (v303)
        {
          int v237 = swift_dynamicCast();
          uint64_t v238 = v253;
          if (v237 && (v300 & 1) != 0)
          {
            uint64_t v239 = swift_bridgeObjectRetain();
            unint64_t v240 = sub_4A90(v239);
            swift_bridgeObjectRelease();
            sub_50C8(v240);
            if (v3)
            {
              swift_bridgeObjectRelease();
              uint64_t v112 = sub_6628();
              os_log_type_t v241 = sub_6B80();
              if (os_log_type_enabled((os_log_t)v112, v241))
              {
                *(_WORD *)sub_6958() = 0;
                sub_68E8(&dword_0, v242, v243, "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_657C();
              }

              sub_4DA4(v238, &qword_C668);
              sub_6970();
              swift_release();
              goto LABEL_166;
            }
            sub_6970();
            swift_release();
            goto LABEL_66;
          }
        }
        else
        {
          sub_5F38((uint64_t)&v302, &qword_C640);
          uint64_t v238 = v253;
        }
        sub_4DA4(v238, &qword_C668);
        sub_6970();
        swift_release();
        goto LABEL_169;
      }
      v141 = (unint64_t *)((char *)v117 + *(int *)(v112 + 48));
      unint64_t v142 = *v141;
      unint64_t v143 = v141[1];
      sub_6814();
      uint64_t v144 = v285;
      sub_687C();
      v145();
      sub_64E8(&qword_C670, (void (*)(uint64_t))&type metadata accessor for CustomSignal);
      unint64_t v296 = v142;
      unint64_t v297 = v143;
      sub_69A0();
      if (!v3) {
        break;
      }
      swift_errorRelease();
      sub_54CC(v12, 1, 1, v10);
      sub_5F38(v12, &qword_C630);
      sub_6814();
      uint64_t v3 = (uint64_t)v278;
      sub_6690();
      v146();
      uint64_t v12 = v123;
      uint64_t v123 = sub_6628();
      os_log_type_t v147 = sub_6B70();
      uint64_t v10 = v147;
      uint64_t v21 = v144;
      if (os_log_type_enabled((os_log_t)v123, v147))
      {
        uint64_t v148 = v3;
        uint64_t v3 = sub_6838();
        uint64_t v149 = sub_6820();
        *(_DWORD *)uint64_t v3 = sub_6930(v149).n128_u32[0];
        uint64_t v150 = sub_6A10();
        *(void *)(v3 + 4) = sub_55CC(v150, v151, (uint64_t *)&v302);
        swift_bridgeObjectRelease();
        v117 = v283->isa;
        ((void (*)(uint64_t, uint64_t))v283->isa)(v148, v12);
        _os_log_impl(&dword_0, (os_log_t)v123, (os_log_type_t)v10, "Unable to decode %s to CustomSignal, so not an SMS record", (uint8_t *)v3, 0xCu);
        swift_arrayDestroy();
        sub_657C();
        sub_657C();
        sub_655C();

        ((void (*)(uint64_t, uint64_t))v117)(v21, v12);
        sub_670C();
        goto LABEL_102;
      }
      sub_655C();
      v117 = v283;
      v167 = (void (*)(void, void))v283->isa;
      ((void (*)(uint64_t, uint64_t))v283->isa)(v3, v12);

      v167(v21, v12);
      sub_670C();
      uint64_t v124 = v299;
      uint64_t v2 = v298;
    }
    uint64_t v279 = 0;
    sub_54CC(v12, 0, 1, v10);
    sub_687C();
    v152();
    v153 = v281;
    sub_6A50();
    sub_6814();
    uint64_t v154 = v277;
    v155(v276, v274, v277);
    sub_64E8(&qword_C678, (void (*)(uint64_t))&type metadata accessor for CustomSignalType);
    sub_6B60();
    sub_6B60();
    if ((void)v302 == v300 && *((void *)&v302 + 1) == v301)
    {
      swift_bridgeObjectRelease_n();
      v168 = *v272;
      sub_6850();
      v168();
      ((void (*)(NSObject *, uint64_t))v168)(v153, v154);
    }
    else
    {
      char v157 = sub_6C60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v158 = *v272;
      sub_6850();
      v158();
      sub_6850();
      v158();
      if ((v157 & 1) == 0)
      {
        sub_6814();
        uint64_t v10 = v268;
        uint64_t v123 = v294;
        sub_6690();
        v159();
        v160 = sub_6628();
        os_log_type_t v161 = sub_6B70();
        if (os_log_type_enabled(v160, v161))
        {
          uint64_t v10 = sub_6838();
          uint64_t v162 = sub_6820();
          *(_DWORD *)uint64_t v10 = sub_6930(v162).n128_u32[0];
          uint64_t v163 = sub_6A10();
          *(void *)(v10 + 4) = sub_55CC(v163, v164, (uint64_t *)&v302);
          swift_bridgeObjectRelease();
          v117 = v283->isa;
          sub_6754();
          ((void (*)(void))v117)();
          _os_log_impl(&dword_0, v160, v161, "Record %s was not an SMS auto-send record, skipping", (uint8_t *)v10, 0xCu);
          swift_arrayDestroy();
          sub_657C();
          sub_657C();
          sub_655C();

          uint64_t v165 = sub_65FC();
          v166(v165);
          sub_6754();
          ((void (*)(void))v117)();
        }
        else
        {
          uint64_t v179 = v144;
          sub_655C();

          v117 = v283;
          v180 = (void (*)(void))v283->isa;
          sub_67CC();
          v180();
          uint64_t v181 = sub_65FC();
          v182(v181);
          ((void (*)(uint64_t, uint64_t))v180)(v179, v123);
        }
        uint64_t v3 = v279;
        uint64_t v12 = v286;
        goto LABEL_102;
      }
    }
    uint64_t v10 = sub_5F90(0, &qword_C680);
    uint64_t v169 = sub_5F90(0, &qword_C658);
    uint64_t v12 = sub_5F90(0, &qword_C688);
    uint64_t v170 = sub_6A60();
    unint64_t v172 = v171;
    uint64_t v173 = v279;
    uint64_t v270 = sub_6B90();
    if (!v173) {
      break;
    }
    swift_errorRelease();
    sub_5574(v170, v172);
    uint64_t v3 = 0;
    sub_6740();
LABEL_94:
    v117 = sub_6628();
    os_log_type_t v174 = sub_6B80();
    uint64_t v123 = v174;
    if (os_log_type_enabled(v117, v174))
    {
      v175 = (uint8_t *)sub_6958();
      *(_WORD *)v175 = 0;
      _os_log_impl(&dword_0, v117, (os_log_type_t)v123, "SiriInference dodML plugin tried to decode smsAutoSend record but failed - skipping", v175, 2u);
      uint64_t v10 = (uint64_t)v289;
      sub_657C();
    }
    sub_655C();

    sub_6668();
    v176();
    uint64_t v177 = sub_6640();
    v178(v177);
LABEL_102:
    uint64_t v124 = v299;
    uint64_t v2 = v298;
  }
  uint64_t v262 = v12;
  uint64_t v263 = v169;
  sub_5574(v170, v172);
  uint64_t v3 = 0;
  sub_6740();
  if (!v270) {
    goto LABEL_94;
  }
  uint64_t v183 = sub_6AE0();
  if ((v270 & 0xC000000000000001) != 0)
  {
    uint64_t v184 = sub_6C10();
    uint64_t v248 = 0;
    uint64_t v185 = 0;
    id v257 = 0;
    unint64_t v258 = 0;
    unint64_t v186 = v184 | 0x8000000000000000;
  }
  else
  {
    sub_63EC(v270, &v305);
    uint64_t v248 = *((void *)&v305 + 1);
    unint64_t v186 = v305;
    id v257 = (id)*((void *)&v306 + 1);
    uint64_t v185 = v306;
    unint64_t v258 = v307;
  }
  v246[1] = v185;
  swift_bridgeObjectRetain();
  v246[2] = v186 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v247 = (unint64_t)(v185 + 64) >> 6;
  uint64_t v279 = 0;
  unint64_t v252 = v186;
  id v190 = v257;
  unint64_t v191 = v258;
  unint64_t v192 = v186;
  while (2)
  {
    uint64_t v261 = v183;
    if ((v192 & 0x8000000000000000) != 0)
    {
      unint64_t v258 = v191;
      uint64_t v195 = sub_6C20();
      if (!v195) {
        goto LABEL_157;
      }
      uint64_t v197 = v196;
      uint64_t v300 = v195;
      swift_unknownObjectRetain();
      id v257 = v190;
      swift_dynamicCast();
      id v198 = (id)v302;
      swift_unknownObjectRelease();
      uint64_t v300 = v197;
      swift_unknownObjectRetain();
      id v199 = v257;
      swift_dynamicCast();
      id v200 = (id)v302;
      swift_unknownObjectRelease();
      id v259 = v199;
      uint64_t v260 = v258;
    }
    else
    {
      if (v191)
      {
        unint64_t v193 = v192;
        uint64_t v260 = (v191 - 1) & v191;
        unint64_t v194 = __clz(__rbit64(v191)) | ((void)v190 << 6);
        id v259 = v190;
      }
      else
      {
        if (__OFADD__(v190, 1)) {
          goto LABEL_176;
        }
        sub_66F4();
        if (v40 == v41)
        {
LABEL_157:
          sub_5FCC();
          swift_bridgeObjectRelease();
          uint64_t v123 = sub_6A10();
          uint64_t v231 = v230;
          uint64_t v232 = v253;
          char v233 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)&long long v302 = v232;
          v117 = &v302;
          sub_5FD4(v261, v123, v231, v233, &qword_C698);
          uint64_t v253 = v302;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_655C();
          sub_6668();
          v234();
          uint64_t v235 = sub_6640();
          v236(v235);
          uint64_t v3 = v279;
          goto LABEL_102;
        }
        sub_6808();
        uint64_t v203 = v202;
        if (!v201)
        {
          sub_67DC();
          if (v40 == v41) {
            goto LABEL_157;
          }
          sub_6730();
          if (!v201)
          {
            sub_67DC();
            if (v40 == v41) {
              goto LABEL_157;
            }
            sub_6730();
            if (!v201)
            {
              sub_67DC();
              if (v40 == v41) {
                goto LABEL_157;
              }
              sub_6730();
              if (!v201)
              {
                sub_67DC();
                if (v40 == v41) {
                  goto LABEL_157;
                }
                sub_6730();
                if (!v201)
                {
                  uint64_t v203 = v204 + 5;
                  if (v204 + 5 >= v247) {
                    goto LABEL_157;
                  }
                  unint64_t v201 = *(void *)(v248 + 8 * v203);
                  if (!v201)
                  {
                    do
                    {
                      sub_66F4();
                      if (v40 == v41) {
                        goto LABEL_157;
                      }
                      sub_6808();
                      uint64_t v206 = v205 + 1;
                    }
                    while (!v201);
                    uint64_t v203 = v206 - 1;
                  }
                }
              }
            }
          }
        }
        unint64_t v193 = v192;
        uint64_t v260 = (v201 - 1) & v201;
        id v259 = (id)v203;
        unint64_t v194 = __clz(__rbit64(v201)) + (v203 << 6);
      }
      v207 = *(void **)(*(void *)(v193 + 56) + 8 * v194);
      id v198 = *(id *)(*(void *)(v193 + 48) + 8 * v194);
      id v200 = v207;
    }
    if (!v198) {
      goto LABEL_157;
    }
    id v256 = v198;
    uint64_t v208 = sub_6B20();
    uint64_t v210 = v209;
    id v255 = v200;
    id v257 = [v200 integerValue];
    uint64_t v211 = v261;
    char v212 = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v302 = v211;
    unint64_t v258 = v208;
    uint64_t v213 = v208;
    uint64_t v214 = v210;
    sub_5DCC(v213, v210);
    sub_68A0();
    Swift::Int v219 = v217 + v218;
    if (__OFADD__(v217, v218)) {
      goto LABEL_174;
    }
    unint64_t v220 = v215;
    char v221 = v216;
    sub_5424(&qword_C690);
    BOOL v222 = sub_6C00(v212, v219);
    uint64_t v10 = (uint64_t)v289;
    if (!v222)
    {
LABEL_152:
      unint64_t v225 = v260;
      uint64_t v183 = v302;
      if (v221)
      {
        sub_6908();
        uint64_t v12 = v286;
        unint64_t v192 = v252;
      }
      else
      {
        sub_68D4(v302 + 8 * (v220 >> 6));
        v227 = (unint64_t *)(v226 + 16 * v220);
        unint64_t *v227 = v258;
        v227[1] = v214;
        sub_6908();
        uint64_t v228 = *(void *)(v183 + 16);
        BOOL v41 = __OFADD__(v228, 1);
        uint64_t v229 = v228 + 1;
        unint64_t v192 = v252;
        if (v41) {
          goto LABEL_175;
        }
        *(void *)(v183 + 16) = v229;
        swift_bridgeObjectRetain();
        uint64_t v12 = v286;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v190 = v259;
      unint64_t v191 = v225;
      continue;
    }
    break;
  }
  unint64_t v223 = sub_5DCC(v258, v214);
  if ((v221 & 1) == (v224 & 1))
  {
    unint64_t v220 = v223;
    goto LABEL_152;
  }
  uint64_t result = sub_6C70();
  __break(1u);
  return result;
}

double sub_4A2C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_5DCC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_5EDC(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

unint64_t sub_4A90(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_5424(&qword_C6A0);
    uint64_t v2 = (void *)sub_6C40();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (uint64_t *)&unk_C668;
  uint64_t v9 = (uint64_t *)&unk_C618;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v10 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v11 = v10 | (v7 << 6);
      }
      else
      {
        int64_t v12 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v32)
        {
LABEL_31:
          sub_5FCC();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v33 + 8 * v12);
        int64_t v14 = v7 + 1;
        if (!v13)
        {
          int64_t v14 = v7 + 2;
          if (v7 + 2 >= v32) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v33 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v7 + 3;
            if (v7 + 3 >= v32) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v33 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v7 + 4;
              if (v7 + 4 >= v32) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v33 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v7 + 5;
                if (v7 + 5 >= v32) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v32) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v33 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v7 + 5;
              }
            }
          }
        }
LABEL_25:
        unint64_t v5 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v7 = v14;
      }
      uint64_t v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_5424(v8);
      sub_5424(v9);
      swift_dynamicCast();
      unint64_t result = sub_5DCC(v18, v17);
      unint64_t v19 = result;
      if ((v20 & 1) == 0) {
        break;
      }
      unint64_t v21 = v5;
      uint64_t v22 = v1;
      int64_t v23 = v7;
      uint64_t v24 = v9;
      uint64_t v25 = v8;
      uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v26 = v18;
      v26[1] = v17;
      uint64_t v8 = v25;
      uint64_t v9 = v24;
      int64_t v7 = v23;
      uint64_t v1 = v22;
      unint64_t v5 = v21;
      uint64_t v27 = v2[7];
      unint64_t result = swift_bridgeObjectRelease();
      *(void *)(v27 + 8 * v19) = v34;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v28 = v18;
    v28[1] = v17;
    *(void *)(v2[7] + 8 * result) = v34;
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_33;
    }
    v2[2] = v31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_4DA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_5424(&qword_C6A8);
    uint64_t v3 = (void *)sub_6C40();
  }
  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v36 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v35 = (unint64_t)(63 - v4) >> 6;
  int64_t v7 = &v41;
  uint64_t v8 = &v43;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  unint64_t v10 = (char *)&type metadata for Any + 8;
  while (1)
  {
    while (1)
    {
      if (v6)
      {
        sub_67B8();
        unint64_t v12 = v11 | (v9 << 6);
      }
      else
      {
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_38;
        }
        if (v13 >= v35)
        {
LABEL_35:
          sub_5FCC();
          return;
        }
        unint64_t v14 = *(void *)(v36 + 8 * v13);
        int64_t v15 = v9 + 1;
        if (!v14)
        {
          sub_6994();
          if (v16 == v17) {
            goto LABEL_35;
          }
          sub_6988();
          if (!v14)
          {
            sub_6994();
            if (v16 == v17) {
              goto LABEL_35;
            }
            sub_6988();
            if (!v14)
            {
              sub_6994();
              if (v16 == v17) {
                goto LABEL_35;
              }
              sub_6988();
              if (!v14)
              {
                int64_t v19 = v18 + 4;
                if (v19 >= v35) {
                  goto LABEL_35;
                }
                unint64_t v14 = *(void *)(v36 + 8 * v19);
                if (!v14)
                {
                  while (!__OFADD__(v19, 1))
                  {
                    sub_6994();
                    if (v16 == v17) {
                      goto LABEL_35;
                    }
                    sub_6988();
                    int64_t v19 = v20 + 1;
                    if (v14) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v15 = v19;
              }
            }
          }
        }
LABEL_29:
        uint64_t v6 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v9 = v15;
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v12);
      uint64_t v39 = *v21;
      uint64_t v40 = v21[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_5424(a2);
      swift_dynamicCast();
      sub_6424(v7, v8);
      sub_6424(v8, v44);
      sub_6424(v44, &v42);
      unint64_t v22 = sub_5DCC(v39, v40);
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      uint64_t v37 = v6;
      uint64_t v25 = v8;
      uint64_t v26 = v7;
      uint64_t v27 = v2;
      uint64_t v28 = v9;
      uint64_t v29 = v10;
      BOOL v30 = (uint64_t *)(v3[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *BOOL v30 = v39;
      v30[1] = v40;
      unint64_t v10 = v29;
      int64_t v9 = v28;
      uint64_t v2 = v27;
      int64_t v7 = v26;
      uint64_t v8 = v25;
      uint64_t v6 = v37;
      uint64_t v31 = (_OWORD *)(v3[7] + 32 * v23);
      sub_6434((uint64_t)v31);
      sub_6424(&v42, v31);
    }
    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    int64_t v32 = (uint64_t *)(v3[6] + 16 * v22);
    *int64_t v32 = v39;
    v32[1] = v40;
    sub_6424(&v42, (_OWORD *)(v3[7] + 32 * v22));
    uint64_t v33 = v3[2];
    BOOL v17 = __OFADD__(v33, 1);
    uint64_t v34 = v33 + 1;
    if (v17) {
      goto LABEL_37;
    }
    v3[2] = v34;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_50C8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_5424(&qword_C620);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_6FF0;
    *(void *)(inited + 32) = 0x73736572706D6F63;
    *(void *)(inited + 40) = 0xEA00000000006465;
    Class v3 = sub_51D0();
    if (v1)
    {
      swift_bridgeObjectRelease();
      *(void *)(inited + 16) = 0;
      swift_setDeallocating();
      return sub_5468();
    }
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v3;
    *(void *)(inited + 56) = v4;
  }
  return sub_6AE0();
}

Class sub_51D0()
{
  v0 = self;
  sub_5424(&qword_C618);
  v1.super.Class isa = sub_6AC0().super.isa;
  unint64_t v12 = 0;
  id v2 = [v0 dataWithJSONObject:v1.super.isa options:0 error:&v12];

  Class v3 = v12;
  if (v2)
  {
    unint64_t v12 = 0;
    uint64_t v4 = v3;
    id v5 = [v2 compressedDataUsingAlgorithm:3 error:&v12];
    v1.super.Class isa = v12;
    if (v5)
    {
      uint64_t v6 = v5;
      int64_t v7 = v12;
      id v8 = [v6 base64EncodedStringWithOptions:0];
      v1.super.Class isa = (Class)sub_6B20();
    }
    else
    {
      unint64_t v10 = v12;
      sub_69E0();

      swift_willThrow();
    }
  }
  else
  {
    int64_t v9 = v12;
    sub_69E0();

    swift_willThrow();
  }
  return v1.super.isa;
}

id sub_5374()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_53CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceDodMLPlugin()
{
  return self;
}

uint64_t sub_5424(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5468()
{
  sub_5424(&qword_C628);
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_54CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_54F4(uint64_t a1, unint64_t a2)
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

uint64_t sub_554C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_5574(uint64_t a1, unint64_t a2)
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

uint64_t sub_55CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_56A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_5EDC((uint64_t)v12, *a3);
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
      sub_5EDC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6434((uint64_t)v12);
  return v7;
}

uint64_t sub_56A0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_57F8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_6BB0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_58D0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_6BF0();
    if (!v8)
    {
      uint64_t result = sub_6C30();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_57F8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_6C50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_58D0(uint64_t a1, unint64_t a2)
{
  objc_super v2 = sub_5968(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_5B44(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_5B44((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_5968(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_6B50();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_5ADC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_6BE0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_6C50();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_6C30();
  __break(1u);
  return result;
}

void *sub_5ADC(uint64_t a1, uint64_t a2)
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
  sub_5424(&qword_C6B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_5B44(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_5424(&qword_C6B8);
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
  int64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_5CF4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5C1C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_5C1C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_6C50();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_5CF4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_6C50();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_5D84(Swift::Int a1)
{
  if (a1 < 16) {
    return 0;
  }
  sub_6BD0(a1);
  return 0;
}

unint64_t sub_5DCC(uint64_t a1, uint64_t a2)
{
  sub_6C80();
  sub_6B30();
  Swift::Int v4 = sub_6C90();

  return sub_6148(a1, a2, v4);
}

unint64_t sub_5E44(uint64_t a1)
{
  sub_6A30();
  sub_64E8(&qword_C6C8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_6AF0();

  return sub_622C(a1, v2);
}

uint64_t sub_5EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_5F38(uint64_t a1, uint64_t *a2)
{
  sub_5424(a2);
  sub_6668();
  v3();
  return a1;
}

uint64_t sub_5F90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_5FCC()
{
  return swift_release();
}

uint64_t sub_5FD4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  int64_t v7 = v5;
  sub_5DCC(a2, a3);
  sub_68A0();
  Swift::Int v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v17 = v12;
  char v18 = v13;
  sub_5424(a5);
  if (!sub_6C00(a4 & 1, v16)) {
    goto LABEL_5;
  }
  unint64_t v19 = sub_5DCC(a2, a3);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_11:
    uint64_t result = sub_6C70();
    __break(1u);
    return result;
  }
  unint64_t v17 = v19;
LABEL_5:
  unint64_t v21 = *v7;
  if (v18)
  {
    uint64_t v22 = v21[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v22 + 8 * v17) = a1;
  }
  else
  {
    sub_6100(v17, a2, a3, a1, v21);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_6100(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  char v5 = (void *)(a5[6] + 16 * result);
  *char v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_6148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_6C60() & 1) == 0)
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
      while (!v14 && (sub_6C60() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_622C(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_6A30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    char v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_64E8((unint64_t *)&unk_C6E0, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_6B00();
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

uint64_t sub_63EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

_OWORD *sub_6424(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_6434(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6488(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_5424(a3);
  sub_687C();
  v4();
  return a2;
}

uint64_t sub_64E8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_654C()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_655C()
{
  uint64_t v2 = *(void *)(v0 - 280);
  unint64_t v3 = *(void *)(v0 - 272);
  return sub_5574(v2, v3);
}

uint64_t sub_657C()
{
  return swift_slowDealloc();
}

void sub_6594()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_65D0()
{
  return v0;
}

uint64_t sub_65FC()
{
  return *(void *)(v0 - 392);
}

uint64_t sub_6628()
{
  return sub_6A90();
}

uint64_t sub_6640()
{
  return v0;
}

uint64_t sub_6674()
{
  unint64_t v3 = *(void *)(v1 - 280);
  return sub_5574(v0, v3);
}

double sub_66C4@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 - 576);
  return sub_4A2C(0x73736572706D6F63, 0xEA00000000006465, v3, a1);
}

__n128 sub_67EC(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  __n128 result = *(__n128 *)(v2 - 384);
  *uint64_t v1 = result.n128_u32[0];
  return result;
}

uint64_t sub_6820()
{
  return swift_slowAlloc();
}

uint64_t sub_6838()
{
  return swift_slowAlloc();
}

BOOL sub_6860(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  return *(void *)(v2 - 304);
}

uint64_t sub_68B0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_68C0()
{
  return *(void *)(v0 - 272);
}

void sub_68D4(uint64_t a1@<X8>)
{
  *(void *)(a1 + 64) |= v1;
}

void sub_68E8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_6908()
{
  *(void *)(*(void *)(v0 + 56) + 8 * v1) = *(void *)(v2 - 648);
}

__n128 sub_6930(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return *(__n128 *)(v1 - 544);
}

uint64_t sub_6944()
{
  return v0;
}

uint64_t sub_6958()
{
  return swift_slowAlloc();
}

uint64_t sub_6970()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_69A0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_69B0()
{
  return JSONDecoder.init()();
}

uint64_t sub_69C0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_69D0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_69E0()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_69F0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_6A00()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6A10()
{
  return UUID.uuidString.getter();
}

NSUUID sub_6A20()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_6A30()
{
  return type metadata accessor for UUID();
}

uint64_t sub_6A40()
{
  return static Constants.subsystem.getter();
}

uint64_t sub_6A50()
{
  return CustomSignal.signalType.getter();
}

uint64_t sub_6A60()
{
  return CustomSignal.item.getter();
}

uint64_t sub_6A70()
{
  return type metadata accessor for CustomSignal();
}

uint64_t sub_6A80()
{
  return type metadata accessor for CustomSignalType();
}

uint64_t sub_6A90()
{
  return Logger.logObject.getter();
}

uint64_t sub_6AA0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_6AB0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_6AC0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_6AD0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6AE0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_6AF0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_6B00()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_6B10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6B20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6B30()
{
  return String.hash(into:)();
}

void sub_6B40(Swift::String a1)
{
}

Swift::Int sub_6B50()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_6B60()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_6B70()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_6B80()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6B90()
{
  return static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)();
}

uint64_t sub_6BA0()
{
  return NSString.init(stringLiteral:)();
}

uint64_t sub_6BB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_6BC0()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_6BD0(Swift::Int a1)
{
}

uint64_t sub_6BE0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6BF0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_6C00(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_6C10()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_6C20()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_6C30()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_6C40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_6C50()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_6C60()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_6C70()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_6C80()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_6C90()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}