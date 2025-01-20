uint64_t sub_2848()
{
  uint64_t result;
  uint64_t v1;

  result = sub_FE50();
  qword_18B78 = result;
  unk_18B80 = v1;
  return result;
}

uint64_t sub_2878()
{
  uint64_t result = sub_FE50();
  qword_18B90 = result;
  *(void *)algn_18B98 = v1;
  return result;
}

uint64_t sub_28A8()
{
  uint64_t result = sub_FE50();
  qword_18BA8 = result;
  unk_18BB0 = v1;
  return result;
}

uint64_t sub_28D8()
{
  uint64_t result = sub_FE50();
  qword_18BC0 = result;
  *(void *)algn_18BC8 = v1;
  return result;
}

id sub_2908(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_89AC((uint64_t *)&unk_18BF0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [self sharedServiceManager];
  if (result)
  {
    v8 = result;
    NSString v9 = sub_FE20();
    [v8 beginTransactionWithIdentifier:v9 forService:a2];

    uint64_t v10 = sub_FF00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
    v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = a1;
    v11[5] = a2;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_3F48((uint64_t)v6, (uint64_t)&unk_18CE8, (uint64_t)v11);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  sub_89AC(&qword_18CB0);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v6 = sub_FC60();
  v5[13] = v6;
  v5[14] = *(void *)(v6 - 8);
  v5[15] = swift_task_alloc();
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  v5[20] = swift_task_alloc();
  return _swift_task_switch(sub_2BF4, 0, 0);
}

uint64_t sub_2BF4()
{
  uint64_t v146 = v0;
  id v1 = [self defaultManager];
  v144 = (void *)v0;
  *(unsigned char *)(v0 + 168) = 1;
  v2 = (unint64_t *)(v0 + 168);
  id v3 = (id)CLFAppIconsDirectory();
  sub_FC30();

  id v4 = (id)CLFLegacyAppIconsDirectory();
  sub_FC30();

  sub_FC40();
  NSString v5 = sub_FE20();
  swift_bridgeObjectRelease();
  unint64_t v6 = (unint64_t)&AXUIService__prots;
  id v137 = v1;
  unsigned int v7 = [v1 fileExistsAtPath:v5 isDirectory:v0 + 168];

  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = (void (*)(uint64_t, void, uint64_t, uint64_t))(v0 + 48);
  if (qword_18BD8 != -1) {
    goto LABEL_65;
  }
  while (1)
  {
    uint64_t v9 = sub_FC80();
    sub_89F0(v9, (uint64_t)qword_19040);
    uint64_t v10 = sub_FC70();
    os_log_type_t v11 = sub_FF60();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "Found Legacy App icons directory. Removing.", v12, 2u);
      swift_slowDealloc();
    }

    sub_FC20(v13);
    v15 = v14;
    v144[6] = 0;
    unsigned int v16 = [v137 removeItemAtURL:v14 error:v8];

    v17 = (void *)v144[6];
    if (v16)
    {
      id v18 = v17;
    }
    else
    {
      id v19 = v17;
      sub_FBF0();

      swift_willThrow();
      v20 = sub_FC70();
      os_log_type_t v21 = sub_FF40();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_0, v20, v21, "Legacy App icons directory could not be deleted", v22, 2u);
        swift_slowDealloc();
      }
      swift_errorRelease();
    }
LABEL_10:
    v23 = v144;
    sub_FC40();
    NSString v24 = sub_FE20();
    swift_bridgeObjectRelease();
    unsigned int v25 = objc_msgSend(v137, *(SEL *)(v6 + 2096), v24, v2);

    if (!v25) {
      goto LABEL_60;
    }
    v26 = (unsigned __int8 *)(v2 - 16);
    v27 = (NSURL *)*(unsigned __int8 *)v2;
    if ((v27 & 1) == 0)
    {
      if (qword_18BD8 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_FC80();
      sub_89F0(v39, (uint64_t)qword_19040);
      v40 = sub_FC70();
      os_log_type_t v41 = sub_FF40();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_0, v40, v41, "App icons directory was not a directory. Removing.", v42, 2u);
        v23 = v144;
        swift_slowDealloc();
      }

      sub_FC20(v43);
      v45 = v44;
      v23[3] = 0;
      unsigned int v46 = [v137 removeItemAtURL:v44 error:v2 - 18];

      v47 = (void *)v23[3];
      if (v46)
      {
        id v48 = v47;
        goto LABEL_60;
      }
      id v104 = v47;
      sub_FBF0();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      v105 = sub_FC70();
      os_log_type_t v106 = sub_FF40();
      if (os_log_type_enabled(v105, v106))
      {
        v107 = (uint8_t *)swift_slowAlloc();
        v108 = (void *)swift_slowAlloc();
        *(_DWORD *)v107 = 138412290;
        swift_errorRetain();
        uint64_t v109 = _swift_stdlib_bridgeErrorToNSError();
        *(v2 - 17) = v109;
        sub_FF80();
        void *v108 = v109;
        swift_errorRelease();
        swift_errorRelease();
        v110 = "Unable to remove file at location of app icons directory: %@";
        v111 = v105;
        os_log_type_t v112 = v106;
LABEL_55:
        _os_log_impl(&dword_0, v111, v112, v110, v107, 0xCu);
        sub_89AC(&qword_18FF0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        v23 = v144;
        goto LABEL_60;
      }
      goto LABEL_56;
    }
    uint64_t v28 = v144[9];
    int64_t v29 = *(void *)(v28 + 16);
    v30 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (v29)
    {
      v141 = (unsigned __int8 *)(v2 - 16);
      v143 = v2;
      uint64_t v31 = v144[14];
      v145 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_695C(0, v29, 0);
      v30 = v145;
      uint64_t v32 = v28 + 40;
      do
      {
        swift_bridgeObjectRetain();
        NSString v33 = sub_FE20();
        v34 = v30;
        id v35 = (id)CLFAppIconURLForBundleIdentifier();

        sub_FC30();
        v30 = v34;
        swift_bridgeObjectRelease();
        v145 = v34;
        unint64_t v6 = v34[2];
        unint64_t v36 = v34[3];
        if (v6 >= v36 >> 1)
        {
          sub_695C(v36 > 1, v6 + 1, 1);
          v30 = v145;
        }
        uint64_t v37 = v144[18];
        uint64_t v38 = v144[13];
        v30[2] = v6 + 1;
        (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))((char *)v30+ ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v31 + 72) * v6, v37, v38);
        v32 += 16;
        --v29;
      }
      while (v29);
      v26 = v141;
      v2 = v143;
    }
    sub_FC20(v27);
    v50 = v49;
    type metadata accessor for URLResourceKey(0);
    Class isa = sub_FE90().super.isa;
    v144[5] = 0;
    id v52 = [v137 contentsOfDirectoryAtURL:v50 includingPropertiesForKeys:isa options:0 error:v26];

    v53 = (void *)v144[5];
    if (!v52)
    {
      id v113 = v53;
      swift_bridgeObjectRelease();
      sub_FBF0();

      swift_willThrow();
      if (qword_18BD8 != -1) {
        swift_once();
      }
      uint64_t v114 = sub_FC80();
      sub_89F0(v114, (uint64_t)qword_19040);
      swift_errorRetain();
      swift_errorRetain();
      v105 = sub_FC70();
      os_log_type_t v115 = sub_FF40();
      if (os_log_type_enabled(v105, v115))
      {
        v107 = (uint8_t *)swift_slowAlloc();
        v116 = (void *)swift_slowAlloc();
        *(_DWORD *)v107 = 138412290;
        swift_errorRetain();
        uint64_t v117 = _swift_stdlib_bridgeErrorToNSError();
        *(v2 - 19) = v117;
        sub_FF80();
        void *v116 = v117;
        swift_errorRelease();
        swift_errorRelease();
        v110 = "Unable to list files in ClarityBoard app icons directory: %@";
        v111 = v105;
        os_log_type_t v112 = v115;
        goto LABEL_55;
      }
LABEL_56:
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();

      v23 = v144;
      goto LABEL_60;
    }
    uint64_t v54 = v144[20];
    uint64_t v55 = sub_FEA0();
    id v56 = v53;

    uint64_t v57 = swift_task_alloc();
    *(void *)(v57 + 16) = v54;
    uint64_t v8 = 0;
    v58 = sub_3C58((void (*)(uint64_t))sub_AFA8, v57, v55);
    v23 = v144;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v59 = v144[14];
    unint64_t v134 = v58[2];
    if (!v134) {
      break;
    }
    unint64_t v60 = 0;
    v130 = (unsigned __int8 *)(v2 - 13);
    unint64_t v61 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    v133 = (char *)v58 + v61;
    v139 = (void (**)(uint64_t, void, uint64_t))(v59 + 32);
    v129 = (char *)v30 + v61;
    v140 = (void (**)(uint64_t, uint64_t))(v59 + 8);
    v2 = v58;
    v131 = v30;
    uint64_t v132 = v144[14];
    v135 = v58;
    while (v60 < v2[2])
    {
      uint64_t v64 = v23[12];
      uint64_t v65 = v23[13];
      unint64_t v136 = v60;
      uint64_t v138 = *(void *)(v59 + 72);
      v142 = *(void (**)(uint64_t, char *, uint64_t))(v59 + 16);
      v142(v64, &v133[v138 * v60], v65);
      uint64_t v8 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v59 + 56);
      v8(v64, 0, 1, v65);
      unint64_t v6 = *(void *)(v59 + 48);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v6)(v64, 1, v65) == 1) {
        goto LABEL_59;
      }
      v66 = *v139;
      (*v139)(v23[17], v23[12], v23[13]);
      unint64_t v67 = v30[2];
      swift_bridgeObjectRetain();
      if (v67)
      {
        v68 = v129;
        while (1)
        {
          uint64_t v69 = v23[13];
          uint64_t v70 = v23[11];
          v142(v70, v68, v69);
          v8(v70, 0, 1, v69);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v6)(v70, 1, v69) == 1) {
            break;
          }
          v71 = v8;
          uint64_t v72 = v23[16];
          uint64_t v73 = v23[13];
          v66(v72, v23[11], v73);
          sub_AFC8(&qword_18CF8, (void (*)(uint64_t))&type metadata accessor for URL);
          char v74 = sub_FE10();
          v75 = *v140;
          (*v140)(v72, v73);
          if (v74)
          {
            v23 = v144;
            uint64_t v100 = v144[17];
            uint64_t v101 = v144[13];
            v30 = v131;
            swift_bridgeObjectRelease();
            v75(v100, v101);
            v2 = v135;
            unint64_t v88 = v136;
            uint64_t v8 = v71;
            goto LABEL_29;
          }
          v68 += v138;
          --v67;
          v23 = v144;
          uint64_t v8 = v71;
          if (!v67) {
            goto LABEL_37;
          }
        }
      }
      else
      {
LABEL_37:
        v8(v23[11], 1, 1, v23[13]);
      }
      v30 = v131;
      swift_bridgeObjectRelease();
      if (qword_18BD8 != -1) {
        swift_once();
      }
      v76 = (char *)v23[17];
      uint64_t v77 = v23[15];
      uint64_t v78 = v23[13];
      uint64_t v79 = sub_FC80();
      sub_89F0(v79, (uint64_t)qword_19040);
      v142(v77, v76, v78);
      unint64_t v6 = sub_FC70();
      os_log_type_t v80 = sub_FF60();
      BOOL v81 = os_log_type_enabled((os_log_t)v6, v80);
      uint64_t v82 = v23[15];
      uint64_t v83 = v23[13];
      if (v81)
      {
        uint64_t v84 = swift_slowAlloc();
        v145 = (unint64_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v84 = 136315138;
        sub_AFC8(&qword_18CF0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v85 = sub_10090();
        *(void *)(v84 + 4) = sub_D8D8(v85, v86, (uint64_t *)&v145);
        swift_bridgeObjectRelease();
        v87 = *v140;
        (*v140)(v82, v83);
        _os_log_impl(&dword_0, (os_log_t)v6, v80, "Removing unused app icon file: %s", (uint8_t *)v84, 0xCu);
        swift_arrayDestroy();
        v23 = v144;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v87 = *v140;
        (*v140)(v23[15], v23[13]);
      }

      unint64_t v88 = v136;
      sub_FC20(v89);
      v91 = v90;
      v23[8] = 0;
      unsigned int v92 = [v137 removeItemAtURL:v90 error:v130];

      id v93 = (id)v23[8];
      v2 = v135;
      if (v92)
      {
        uint64_t v62 = v23[17];
        uint64_t v63 = v23[13];
      }
      else
      {
        v94 = v93;
        unint64_t v6 = sub_FBF0();

        swift_willThrow();
        swift_errorRetain();
        swift_errorRetain();
        v95 = sub_FC70();
        int v96 = sub_FF40();
        if (os_log_type_enabled(v95, (os_log_type_t)v96))
        {
          uint64_t v97 = swift_slowAlloc();
          v98 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v97 = 138412290;
          swift_errorRetain();
          uint64_t v99 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v97 + 4) = v99;
          void *v98 = v99;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v95, (os_log_type_t)v96, "Unable to remove file: %@", (uint8_t *)v97, 0xCu);
          sub_89AC(&qword_18FF0);
          swift_arrayDestroy();
          swift_slowDealloc();
          v2 = v135;
          swift_slowDealloc();
        }
        else
        {

          swift_errorRelease();
          swift_errorRelease();
        }
        v23 = v144;
        uint64_t v102 = v144[17];
        uint64_t v103 = v144[13];
        swift_errorRelease();
        uint64_t v62 = v102;
        uint64_t v63 = v103;
      }
      v87(v62, v63);
LABEL_29:
      unint64_t v60 = v88 + 1;
      uint64_t v59 = v132;
      if (v60 == v134)
      {
        v8(v23[12], 1, 1, v23[13]);
        goto LABEL_59;
      }
    }
    __break(1u);
LABEL_65:
    swift_once();
  }
  (*(void (**)(void, uint64_t, uint64_t, void))(v59 + 56))(v144[12], 1, 1, v144[13]);
LABEL_59:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_60:
  id v118 = [self sharedServiceManager];
  if (!v118) {
    __break(1u);
  }
  v119 = v118;
  uint64_t v121 = v23[19];
  uint64_t v120 = v23[20];
  uint64_t v122 = v23[14];
  uint64_t v123 = v23[13];
  uint64_t v124 = v144[10];
  NSString v125 = sub_FE20();
  [v119 endTransactionWithIdentifier:v125 forService:v124];

  v126 = *(void (**)(uint64_t, uint64_t))(v122 + 8);
  v126(v121, v123);
  v126(v120, v123);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v127 = (uint64_t (*)(void))v144[1];
  return v127();
}

unint64_t *sub_3C58(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  os_log_type_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v20 = sub_FC60();
  uint64_t v6 = *(void *)(v20 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v9)
  {
    v23 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_695C(0, v9, 0);
    uint64_t v10 = v23;
    unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v11 = a3 + v19;
    uint64_t v18 = *(void *)(v6 + 72);
    uint64_t v12 = (void (**)(char *, char *, uint64_t))(v6 + 32);
    while (1)
    {
      v21(v11);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      v23 = v10;
      unint64_t v14 = v10[2];
      unint64_t v13 = v10[3];
      if (v14 >= v13 >> 1)
      {
        sub_695C(v13 > 1, v14 + 1, 1);
        uint64_t v10 = v23;
      }
      v10[2] = v14 + 1;
      uint64_t v15 = v18;
      (*v12)((char *)v10 + v19 + v14 * v18, v8, v20);
      v11 += v15;
      if (!--v9) {
        return v10;
      }
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_3E0C()
{
  uint64_t v0 = sub_FC00();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = sub_FC10();
  v6[1] = v4;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for URL.DirectoryHint.inferFromPath(_:), v0);
  sub_B010();
  sub_FC50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_3F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_FF00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_FEF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_ACA0(a1, (uint64_t *)&unk_18BF0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_FEC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_40F4()
{
  sub_89AC(&qword_18C90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10810;
  *(void *)(inited + 32) = sub_FE50();
  *(void *)(inited + 40) = v1;
  *(void *)(inited + 48) = sub_FE50();
  *(void *)(inited + 56) = v2;
  uint64_t v3 = sub_7E28(inited);
  swift_setDeallocating();
  uint64_t result = swift_arrayDestroy();
  qword_19038 = v3;
  return result;
}

unint64_t sub_41A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_89AC(&qword_18C50);
  uint64_t v2 = sub_10060();
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
    sub_AD94(v6, (uint64_t)v15, &qword_18CD8);
    unint64_t result = sub_6D28((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_8DA8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_42E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_89AC(&qword_18C98);
  uint64_t v2 = sub_10060();
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
    sub_AD94(v6, (uint64_t)&v15, &qword_18CA0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_6D6C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_8DA8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_4420(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_89AC(&qword_18CC8);
  uint64_t v2 = sub_10060();
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
    sub_AD94(v6, (uint64_t)&v13, &qword_18CD0);
    uint64_t v7 = v13;
    unint64_t result = sub_6DE4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_8DA8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

void sub_4550(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), NSObject *a5)
{
  uint64_t v63 = a3;
  uint64_t v9 = sub_89AC((uint64_t *)&unk_18BF0);
  __chkstk_darwin(v9 - 8);
  BOOL v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v12 = a1;
    id v13 = [v12 responseDictionary];
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = (char *)&type metadata for Any;
      uint64_t v16 = sub_FDF0();

      uint64_t v64 = 1635017060;
      unint64_t v65 = 0xE400000000000000;
      sub_FFC0();
      if (*(void *)(v16 + 16) && (unint64_t v17 = sub_6D28((uint64_t)&v66), (v18 & 1) != 0))
      {
        sub_8BE0(*(void *)(v16 + 56) + 32 * v17, (uint64_t)&v68);
      }
      else
      {
        long long v68 = 0u;
        long long v69 = 0u;
      }
      sub_8A8C((uint64_t)&v66);
      if (!*((void *)&v69 + 1))
      {
LABEL_23:
        sub_ACA0((uint64_t)&v68, &qword_18C00);
        goto LABEL_24;
      }
      sub_89AC(&qword_18C08);
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_24:
        if (qword_18BD8 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_FC80();
        sub_89F0(v40, (uint64_t)qword_19040);
        swift_bridgeObjectRetain();
        os_log_type_t v41 = sub_FC70();
        os_log_type_t v42 = sub_FF50();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = swift_slowAlloc();
          uint64_t v62 = a5;
          v44 = (uint8_t *)v43;
          uint64_t v45 = swift_slowAlloc();
          unint64_t v61 = a4;
          uint64_t v66 = v45;
          *(_DWORD *)v44 = 136315138;
          v60[1] = v44 + 4;
          swift_bridgeObjectRetain();
          v60[2] = v15 + 8;
          unsigned int v46 = v12;
          uint64_t v47 = sub_FE00();
          unint64_t v49 = v48;
          swift_bridgeObjectRelease();
          uint64_t v50 = v47;
          uint64_t v12 = v46;
          *(void *)&long long v68 = sub_D8D8(v50, v49, &v66);
          sub_FF80();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v41, v42, "Unexpected format for app icon response dictionary: %s.", v44, 0xCu);
          swift_arrayDestroy();
          a4 = v61;
          swift_slowDealloc();
          a5 = v62;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_89AC(&qword_18BE8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10820;
        uint64_t v66 = sub_FE50();
        uint64_t v67 = v55;
        sub_FFC0();
        *(void *)(inited + 96) = &type metadata for Bool;
        *(unsigned char *)(inited + 72) = 0;
        sub_41A4(inited);
        uint64_t v20 = a5;
        a4();

        swift_bridgeObjectRelease();
        id v33 = [self sharedServiceManager];
        if (v33) {
          goto LABEL_38;
        }
        __break(1u);
        goto LABEL_35;
      }
      NSString v24 = v12;
      uint64_t v12 = a5;
      swift_bridgeObjectRelease();
      uint64_t v25 = v64;
      v26 = self;
      id v27 = [v26 sharedServiceManager];
      if (!v27) {
        goto LABEL_40;
      }
      uint64_t v28 = v27;
      NSString v29 = sub_FE20();
      uint64_t v30 = v63;
      [v28 beginTransactionWithIdentifier:v29 forService:v63];

      uint64_t v31 = sub_FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v11, 1, 1, v31);
      uint64_t v32 = (void *)swift_allocObject();
      v32[2] = 0;
      v32[3] = 0;
      v32[4] = v30;
      v32[5] = v25;
      v32[6] = a4;
      v32[7] = v12;
      a5 = v12;
      swift_unknownObjectRetain();
      swift_retain();
      sub_3F48((uint64_t)v11, (uint64_t)&unk_18C18, (uint64_t)v32);

      swift_release();
      id v33 = [v26 sharedServiceManager];
      if (v33)
      {
LABEL_38:
        v58 = v33;
        NSString v59 = sub_FE20();
        [v58 endTransactionWithIdentifier:v59 forService:v63];

        return;
      }
      __break(1u);
    }
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_FC80();
    sub_89F0(v34, (uint64_t)qword_19040);
    id v35 = sub_FC70();
    os_log_type_t v36 = sub_FF40();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "Requested app icons, but received no response dictionary.", v37, 2u);
      swift_slowDealloc();
    }

    sub_89AC(&qword_18BE8);
    uint64_t v38 = swift_initStackObject();
    *(_OWORD *)(v38 + 16) = xmmword_10820;
    uint64_t v66 = sub_FE50();
    uint64_t v67 = v39;
    sub_FFC0();
    *(void *)(v38 + 96) = &type metadata for Bool;
    *(unsigned char *)(v38 + 72) = 1;
    uint64_t v15 = (char *)sub_41A4(v38);
    ((void (*)(char *, void))a4)(v15, 0);

    swift_bridgeObjectRelease();
    id v33 = [self sharedServiceManager];
    if (v33) {
      goto LABEL_38;
    }
    __break(1u);
    goto LABEL_23;
  }
  if (!a2)
  {
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v51 = sub_FC80();
    sub_89F0(v51, (uint64_t)qword_19040);
    uint64_t v20 = sub_FC70();
    os_log_type_t v52 = sub_FF40();
    if (os_log_type_enabled(v20, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_0, v20, v52, "Requested app icons, but received neither result nor error.", v53, 2u);
      swift_slowDealloc();
    }
    goto LABEL_36;
  }
  swift_errorRetain();
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_FC80();
  sub_89F0(v19, (uint64_t)qword_19040);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v20 = sub_FC70();
  os_log_type_t v21 = sub_FF40();
  if (!os_log_type_enabled(v20, v21))
  {
LABEL_35:
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v22 = (uint8_t *)swift_slowAlloc();
  uint64_t v62 = swift_slowAlloc();
  *(_DWORD *)uint64_t v22 = 138412290;
  swift_errorRetain();
  uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
  uint64_t v66 = v23;
  sub_FF80();
  v62->Class isa = (Class)v23;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl(&dword_0, v20, v21, "Error requesting app icons: %@", v22, 0xCu);
  sub_89AC(&qword_18FF0);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
LABEL_37:
  sub_89AC(&qword_18BE8);
  uint64_t v56 = swift_initStackObject();
  *(_OWORD *)(v56 + 16) = xmmword_10820;
  uint64_t v66 = sub_FE50();
  uint64_t v67 = v57;
  sub_FFC0();
  *(void *)(v56 + 96) = &type metadata for Bool;
  *(unsigned char *)(v56 + 72) = 1;
  sub_41A4(v56);
  a4();
  swift_bridgeObjectRelease();
  id v33 = [self sharedServiceManager];
  if (v33) {
    goto LABEL_38;
  }
  __break(1u);
LABEL_40:
  __break(1u);
}

uint64_t sub_4F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return _swift_task_switch(sub_4F84, 0, 0);
}

uint64_t sub_4F84()
{
  uint64_t v1 = sub_89AC(&qword_18C30);
  uint64_t v2 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v3 = sub_89AC(&qword_18C48);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_5098;
  return withTaskGroup<A, B>(of:returning:isolation:body:)(v0 + 16, v1, v3, 0, 0, &unk_18C40, v2, v1);
}

uint64_t sub_5098()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_51B0, 0, 0);
}

id sub_51B0()
{
  uint64_t v1 = (void (*)(uint64_t, void))v0[5];
  uint64_t v2 = sub_52B4(v0[2]);
  swift_bridgeObjectRelease();
  v1(v2, 0);
  swift_bridgeObjectRelease();
  id result = [self sharedServiceManager];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v0[3];
    NSString v6 = sub_FE20();
    [v4 endTransactionWithIdentifier:v6 forService:v5];

    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return (id)v7();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_52B4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_89AC(&qword_18C50);
    uint64_t v2 = (void *)sub_10060();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  NSString v6 = (char *)(v2 + 8);
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
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
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
    unint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_8BE0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_8DA8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_8DA8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_8DA8(v36, v37);
    sub_8DA8(v37, &v33);
    uint64_t result = sub_FFA0(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_8DA8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_8DB8();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
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
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_567C(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_5708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[30] = a3;
  v4[31] = a4;
  v4[28] = a1;
  v4[29] = a2;
  uint64_t v5 = sub_89AC(&qword_18C58);
  v4[32] = v5;
  v4[33] = *(void *)(v5 - 8);
  v4[34] = swift_task_alloc();
  sub_89AC((uint64_t *)&unk_18BF0);
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  return _swift_task_switch(sub_5810, 0, 0);
}

uint64_t sub_5810()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(v1 + 32);
    uint64_t v4 = sub_FF00();
    uint64_t v5 = *(void *)(v4 - 8);
    BOOL v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    unint64_t v24 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    char v23 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    uint64_t v26 = v4;
    while (1)
    {
      uint64_t v27 = v2;
      uint64_t v8 = *(void *)(v0 + 280);
      uint64_t v7 = *(void *)(v0 + 288);
      uint64_t v9 = *(void *)(v0 + 248);
      uint64_t v10 = *v3;
      v25(v7, 1, 1, v4);
      unint64_t v11 = (void *)swift_allocObject();
      v11[2] = 0;
      unint64_t v12 = v11 + 2;
      v11[3] = 0;
      v11[4] = v9;
      v11[5] = v10;
      sub_AD94(v7, v8, (uint64_t *)&unk_18BF0);
      LODWORD(v8) = (*v24)(v8, 1, v4);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      uint64_t v13 = *(void *)(v0 + 280);
      if (v8 == 1)
      {
        sub_ACA0(*(void *)(v0 + 280), (uint64_t *)&unk_18BF0);
        if (!*v12) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_FEF0();
        (*v23)(v13, v4);
        if (!*v12)
        {
LABEL_8:
          uint64_t v14 = 0;
          uint64_t v16 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_FEC0();
      uint64_t v16 = v15;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v17 = **(void **)(v0 + 232);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = &unk_18C70;
      *(void *)(v18 + 24) = v11;
      sub_89AC(&qword_18C30);
      uint64_t v19 = v16 | v14;
      if (v16 | v14)
      {
        uint64_t v19 = v0 + 144;
        *(void *)(v0 + 144) = 0;
        *(void *)(v0 + 152) = 0;
        *(void *)(v0 + 160) = v14;
        *(void *)(v0 + 168) = v16;
      }
      uint64_t v6 = *(void *)(v0 + 288);
      *(void *)(v0 + 176) = 1;
      *(void *)(v0 + 184) = v19;
      *(void *)(v0 + 192) = v17;
      swift_task_create();
      swift_release();
      sub_ACA0(v6, (uint64_t *)&unk_18BF0);
      ++v3;
      uint64_t v2 = v27 - 1;
      uint64_t v4 = v26;
      if (v27 == 1)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  sub_89AC(&qword_18C30);
  sub_FED0();
  *(void *)(v0 + 296) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 217) = 0;
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v20;
  void *v20 = v0;
  v20[1] = sub_5B7C;
  uint64_t v21 = *(void *)(v0 + 256);
  return TaskGroup.Iterator.next(isolation:)(v0 + 200, 0, 0, v21);
}

uint64_t sub_5B7C()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_5C78, 0, 0);
}

uint64_t sub_5C78()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  if (v1 == 1)
  {
    char v5 = *(unsigned char *)(v0 + 217);
    uint64_t v6 = *(void *)(v0 + 296);
    uint64_t v7 = *(unint64_t **)(v0 + 224);
    (*(void (**)(void, void))(*(void *)(v0 + 264) + 8))(*(void *)(v0 + 272), *(void *)(v0 + 256));
    sub_89AC(&qword_18C80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10810;
    *(void *)(inited + 32) = sub_FE50();
    *(void *)(inited + 40) = v9;
    *(void *)(inited + 72) = sub_89AC(&qword_18C88);
    *(void *)(inited + 48) = v6;
    *(void *)(inited + 80) = sub_FE50();
    *(void *)(inited + 88) = v10;
    *(void *)(inited + 120) = &type metadata for Bool;
    *(unsigned char *)(inited + 96) = v5;
    *uint64_t v7 = sub_42E8(inited);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    char v3 = *(unsigned char *)(v0 + 216);
    if (v1)
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v4 = *(char **)(v0 + 296);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v4 = sub_682C(0, *((void *)v4 + 2) + 1, 1, v4);
      }
      unint64_t v15 = *((void *)v4 + 2);
      unint64_t v14 = *((void *)v4 + 3);
      if (v15 >= v14 >> 1) {
        uint64_t v4 = sub_682C((char *)(v14 > 1), v15 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v15 + 1;
      uint64_t v16 = &v4[16 * v15];
      *((void *)v16 + 4) = v2;
      *((void *)v16 + 5) = v1;
    }
    else
    {
      uint64_t v4 = *(char **)(v0 + 296);
    }
    char v17 = *(unsigned char *)(v0 + 217) | v3;
    *(void *)(v0 + 296) = v4;
    *(unsigned char *)(v0 + 217) = v17 & 1;
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 304) = v18;
    *uint64_t v18 = v0;
    v18[1] = sub_5B7C;
    uint64_t v19 = *(void *)(v0 + 256);
    return TaskGroup.Iterator.next(isolation:)(v0 + 200, 0, 0, v19);
  }
}

uint64_t sub_5ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_5F64;
  return sub_91AC(a5);
}

uint64_t sub_5F64(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 32) = a1;
  *(void *)(v4 + 40) = a2;
  *(unsigned char *)(v4 + 48) = a3;
  swift_task_dealloc();
  return _swift_task_switch(sub_6068, 0, 0);
}

uint64_t sub_6068()
{
  char v1 = *(unsigned char *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 16);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v0 + 32);
  *(unsigned char *)(v2 + 16) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_6090(uint64_t a1, uint64_t a2)
{
  return sub_64C0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_60B4(uint64_t a1, id *a2)
{
  uint64_t result = sub_FE30();
  *a2 = 0;
  return result;
}

uint64_t sub_612C(uint64_t a1, id *a2)
{
  char v3 = sub_FE40();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_61AC@<X0>(void *a1@<X8>)
{
  sub_FE50();
  NSString v2 = sub_FE20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_6200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_FE50();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_622C(uint64_t a1)
{
  uint64_t v2 = sub_AFC8(&qword_18DE0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_AFC8(&qword_18DE8, type metadata accessor for URLResourceKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_62E8(uint64_t a1)
{
  uint64_t v2 = sub_AFC8(&qword_18CC0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_AFC8((unint64_t *)&unk_18E00, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_63A4@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_FE20();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_63EC(uint64_t a1)
{
  uint64_t v2 = sub_AFC8(&qword_18DF0, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_AFC8(&qword_18DF8, type metadata accessor for FileProtectionType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_64A8(uint64_t a1, uint64_t a2)
{
  return sub_64C0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_64C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_FE50();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_6504()
{
  sub_FE50();
  sub_FE70();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_6558()
{
  sub_FE50();
  sub_10100();
  sub_FE70();
  Swift::Int v0 = sub_10120();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_65CC()
{
  uint64_t v0 = sub_FE50();
  uint64_t v2 = v1;
  if (v0 == sub_FE50() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100A0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_6658(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6734;
  return v6(a1);
}

uint64_t sub_6734()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_682C(char *result, int64_t a2, char a3, char *a4)
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
      sub_89AC(&qword_18C90);
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
    sub_90B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_693C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_697C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_695C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_6AE8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_697C(char a1, int64_t a2, char a3, char *a4)
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
    sub_89AC(&qword_18C90);
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
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_10070();
  __break(1u);
  return result;
}

uint64_t sub_6AE8(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_89AC(&qword_18D08);
  uint64_t v10 = *(void *)(sub_FC60() - 8);
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
  uint64_t v16 = *(void *)(sub_FC60() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
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
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_10070();
  __break(1u);
  return result;
}

unint64_t sub_6D28(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_FFA0(*(void *)(v2 + 40));

  return sub_6E78(a1, v4);
}

unint64_t sub_6D6C(uint64_t a1, uint64_t a2)
{
  sub_10100();
  sub_FE70();
  Swift::Int v4 = sub_10120();

  return sub_6F40(a1, a2, v4);
}

unint64_t sub_6DE4(uint64_t a1)
{
  sub_FE50();
  sub_10100();
  sub_FE70();
  Swift::Int v2 = sub_10120();
  swift_bridgeObjectRelease();

  return sub_7024(a1, v2);
}

unint64_t sub_6E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_AD38(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_FFB0();
      sub_8A8C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_6F40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100A0() & 1) == 0)
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
      while (!v14 && (sub_100A0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_7024(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_FE50();
    uint64_t v8 = v7;
    if (v6 == sub_FE50() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_100A0();
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
          uint64_t v13 = sub_FE50();
          uint64_t v15 = v14;
          if (v13 == sub_FE50() && v15 == v16) {
            break;
          }
          char v18 = sub_100A0();
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

uint64_t sub_719C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_10100();
  swift_bridgeObjectRetain();
  sub_FE70();
  Swift::Int v8 = sub_10120();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100A0() & 1) != 0)
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
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_100A0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_762C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_734C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_89AC(&qword_18D10);
  uint64_t v3 = sub_FFE0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    long long v30 = (void *)(v2 + 56);
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
                  void *v30 = -1 << v29;
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
      sub_10100();
      sub_FE70();
      uint64_t result = sub_10120();
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

Swift::Int sub_762C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_734C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_77C8();
      goto LABEL_22;
    }
    sub_797C();
  }
  uint64_t v11 = *v4;
  sub_10100();
  sub_FE70();
  uint64_t result = sub_10120();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100A0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100B0();
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
          uint64_t result = sub_100A0();
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

void *sub_77C8()
{
  uint64_t v1 = v0;
  sub_89AC(&qword_18D10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_FFD0();
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

uint64_t sub_797C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_89AC(&qword_18D10);
  uint64_t v3 = sub_FFE0();
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
    sub_10100();
    swift_bridgeObjectRetain();
    sub_FE70();
    uint64_t result = sub_10120();
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

uint64_t sub_7C2C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 40) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 48) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_7D0C;
  return v5(v2 + 16);
}

uint64_t sub_7D0C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 40);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  char v3 = *(unsigned char *)(v1 + 32);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(v1 + 16);
  *(unsigned char *)(v2 + 16) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_7E28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_FF20();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_719C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_7EC0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_693C(0, v1, 0);
    char v3 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      uint64_t v6 = qword_18B70;
      swift_bridgeObjectRetain();
      if (v6 != -1) {
        swift_once();
      }
      BOOL v7 = qword_18B78 == v5 && unk_18B80 == v4;
      if (v7 || (sub_100A0() & 1) != 0)
      {
        uint64_t v8 = &qword_18BA8;
        if (qword_18BA0 != -1)
        {
          swift_once();
          uint64_t v8 = &qword_18BA8;
        }
      }
      else
      {
        if (qword_18B88 != -1) {
          swift_once();
        }
        BOOL v13 = qword_18B90 == v5 && *(void *)algn_18B98 == v4;
        if (!v13 && (sub_100A0() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v8 = &qword_18BC0;
        if (qword_18BB8 != -1)
        {
          swift_once();
          uint64_t v8 = &qword_18BC0;
        }
      }
      uint64_t v5 = *v8;
      uint64_t v9 = v8[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v4 = v9;
LABEL_13:
      unint64_t v11 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v10 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v11 >= v10 >> 1) {
        sub_693C(v10 > 1, v11 + 1, 1);
      }
      v3 += 2;
      *((void *)&_swiftEmptyArrayStorage + 2) = v11 + 1;
      unint64_t v12 = (char *)&_swiftEmptyArrayStorage + 16 * v11;
      *((void *)v12 + 4) = v5;
      *((void *)v12 + 5) = v4;
      --v1;
    }
    while (v1);
  }
  return &_swiftEmptyArrayStorage;
}

void sub_80F0(uint64_t a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v6 = sub_FC60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v10;
  *(void *)(v10 + 16) = a3;
  aBlock = _swiftEmptyArrayStorage;
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v59 = a2;
  v58 = a3;
  if (!v12)
  {
    _Block_copy(a3);
    char v25 = _swiftEmptyArrayStorage;
    if (_swiftEmptyArrayStorage[2]) {
      goto LABEL_12;
    }
LABEL_18:
    swift_release();
    sub_89AC(&qword_18BE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10820;
    aBlock = (void *)sub_FE50();
    uint64_t v64 = v39;
    sub_FFC0();
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = 0;
    sub_41A4(inited);
    v40.super.Class isa = sub_FDE0().super.isa;
    ((void (**)(void, Class, void))v58)[2](v58, v40.super.isa, 0);
    swift_release();
    swift_bridgeObjectRelease();
LABEL_23:

    return;
  }
  uint64_t v57 = v10;
  id v61 = self;
  _Block_copy(a3);
  BOOL v13 = (void (**)(char *, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain();
  v56[1] = a1;
  unint64_t v14 = (uint64_t *)(a1 + 40);
  uint64_t v60 = v6;
  do
  {
    uint64_t v16 = *(v14 - 1);
    uint64_t v15 = *v14;
    swift_bridgeObjectRetain();
    id v17 = [v61 defaultManager];
    NSString v18 = sub_FE20();
    id v19 = (id)CLFAppIconURLForBundleIdentifier();

    sub_FC30();
    sub_FC40();
    (*v13)(v9, v6);
    NSString v20 = sub_FE20();
    swift_bridgeObjectRelease();
    LODWORD(v19) = [v17 fileExistsAtPath:v20];

    if (v19)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = aBlock;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_693C(0, v21[2] + 1, 1);
        uint64_t v21 = aBlock;
      }
      unint64_t v23 = v21[2];
      unint64_t v22 = v21[3];
      if (v23 >= v22 >> 1)
      {
        sub_693C(v22 > 1, v23 + 1, 1);
        uint64_t v21 = aBlock;
      }
      v21[2] = v23 + 1;
      unint64_t v24 = &v21[2 * v23];
      v24[4] = v16;
      v24[5] = v15;
      uint64_t v6 = v60;
    }
    v14 += 2;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  char v25 = aBlock;
  uint64_t v11 = v57;
  a2 = v59;
  if (!aBlock[2]) {
    goto LABEL_18;
  }
LABEL_12:
  id v26 = [self sharedServiceManager];
  if (!v26)
  {
    _Block_release(v58);
    __break(1u);
LABEL_25:
    _Block_release(v58);
    __break(1u);
    goto LABEL_26;
  }
  BOOL v27 = v26;
  NSString v28 = sub_FE20();
  [v27 beginTransactionWithIdentifier:v28 forService:a2];

  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_FC80();
  sub_89F0(v29, (uint64_t)qword_19040);
  swift_retain_n();
  long long v30 = sub_FC70();
  os_log_type_t v31 = sub_FF60();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    aBlock = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315138;
    swift_retain();
    uint64_t v33 = v11;
    uint64_t v34 = sub_FEB0();
    unint64_t v36 = v35;
    swift_release();
    uint64_t v37 = v34;
    uint64_t v11 = v33;
    uint64_t v62 = sub_D8D8(v37, v36, (uint64_t *)&aBlock);
    sub_FF80();
    swift_release_n();
    a2 = v59;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v30, v31, "Downloading missing app icons: %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  os_log_type_t v41 = self;
  id v42 = [v41 bagSubProfile];
  if (!v42) {
    goto LABEL_25;
  }
  uint64_t v43 = v42;
  sub_FE50();

  id v44 = [v41 bagSubProfileVersion];
  if (v44)
  {
    uint64_t v45 = v44;
    sub_FE50();

    NSString v46 = sub_FE20();
    swift_bridgeObjectRelease();
    NSString v47 = sub_FE20();
    swift_bridgeObjectRelease();
    id v48 = [self bagForProfile:v46 profileVersion:v47];

    id v49 = objc_allocWithZone((Class)AMSMediaTask);
    NSString v50 = sub_FE20();
    NSString v51 = sub_FE20();
    id v52 = [v49 initWithType:0 clientIdentifier:v50 clientVersion:v51 bag:v48];

    swift_unknownObjectRetain();
    sub_7EC0((uint64_t)v25);
    swift_release();
    swift_unknownObjectRelease();
    Class isa = sub_FE90().super.isa;
    swift_bridgeObjectRelease();
    [v52 setBundleIdentifiers:isa];

    v40.super.Class isa = (Class)[v52 perform];
    uint64_t v54 = (void *)swift_allocObject();
    v54[2] = a2;
    v54[3] = sub_89A4;
    v54[4] = v11;
    uint64_t v67 = sub_8A68;
    long long v68 = v54;
    aBlock = _NSConcreteStackBlock;
    uint64_t v64 = 1107296256;
    unint64_t v65 = sub_567C;
    uint64_t v66 = &unk_14B50;
    uint64_t v55 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    [(objc_class *)v40.super.isa addFinishBlock:v55];
    _Block_release(v55);
    swift_release();

    goto LABEL_23;
  }
LABEL_26:
  _Block_release(v58);
  __break(1u);
}

uint64_t sub_896C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_89A4(uint64_t a1, uint64_t a2)
{
  sub_C900(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_89AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_89F0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_8A28()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_8A68(void *a1, uint64_t a2)
{
  sub_4550(a1, a2, *(void *)(v2 + 16), *(void (**)(void))(v2 + 24), *(NSObject **)(v2 + 32));
}

uint64_t sub_8A74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_8A84()
{
  return swift_release();
}

uint64_t sub_8A8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_8AE0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_8B30()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_B344;
  *(_OWORD *)(v2 + 40) = v4;
  *(_OWORD *)(v2 + 24) = v3;
  return _swift_task_switch(sub_4F84, 0, 0);
}

uint64_t sub_8BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8C3C(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_B344;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_18C20 + dword_18C20);
  return v6(a1, v4);
}

uint64_t sub_8CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  void *v8 = v3;
  v8[1] = sub_B344;
  return sub_5708(a1, a2, v7, v6);
}

_OWORD *sub_8DA8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_8DB8()
{
  return swift_release();
}

uint64_t sub_8DC0()
{
  return sub_AE24((void (*)(void))&_swift_unknownObjectRelease, (void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_8DEC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_B344;
  v5[2] = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  v5[3] = v6;
  void *v6 = v5;
  v6[1] = sub_5F64;
  return sub_91AC(v4);
}

uint64_t sub_8ED0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8F08(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_8FC0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_18C68 + dword_18C68);
  return v6(a1, v4);
}

uint64_t sub_8FC0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_90B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_10070();
  __break(1u);
  return result;
}

uint64_t sub_91AC(uint64_t a1)
{
  v1[51] = a1;
  sub_89AC(&qword_18CB0);
  v1[52] = swift_task_alloc();
  uint64_t v2 = sub_FC60();
  v1[53] = v2;
  v1[54] = *(void *)(v2 - 8);
  v1[55] = swift_task_alloc();
  v1[56] = swift_task_alloc();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  v1[59] = swift_task_alloc();
  return _swift_task_switch(sub_92FC, 0, 0);
}

uint64_t sub_92FC()
{
  uint64_t v57 = v0;
  if (*(void *)(*(void *)(v0 + 408) + 16))
  {
    unint64_t v1 = sub_6D6C(0x7475626972747461, 0xEA00000000007365);
    if (v2)
    {
      sub_8BE0(*(void *)(*(void *)(v0 + 408) + 56) + 32 * v1, v0 + 120);
      sub_89AC(&qword_18C48);
      if (swift_dynamicCast())
      {
        uint64_t v3 = (_OWORD *)(v0 + 152);
        uint64_t v4 = *(void *)(v0 + 360);
        if (*(void *)(v4 + 16) && (unint64_t v5 = sub_6D6C(0xD000000000000012, 0x8000000000012230), (v6 & 1) != 0))
        {
          sub_8BE0(*(void *)(v4 + 56) + 32 * v5, v0 + 152);
        }
        else
        {
          *uint64_t v3 = 0u;
          *(_OWORD *)(v0 + 168) = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*(void *)(v0 + 176)) {
          goto LABEL_22;
        }
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_24;
        }
        uint64_t v3 = (_OWORD *)(v0 + 184);
        uint64_t v7 = *(void *)(v0 + 288);
        if (*(void *)(v7 + 16) && (unint64_t v8 = sub_6D6C(7565161, 0xE300000000000000), (v9 & 1) != 0))
        {
          sub_8BE0(*(void *)(v7 + 56) + 32 * v8, v0 + 184);
        }
        else
        {
          *uint64_t v3 = 0u;
          *(_OWORD *)(v0 + 200) = 0u;
        }
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 208))
        {
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_24;
          }
          uint64_t v10 = *(void *)(v0 + 280);
          if (!*(void *)(v10 + 16)) {
            goto LABEL_45;
          }
          unint64_t v11 = sub_6D6C(0x6449656C646E7562, 0xE800000000000000);
          if ((v12 & 1) == 0) {
            goto LABEL_45;
          }
          sub_8BE0(*(void *)(v10 + 56) + 32 * v11, v0 + 216);
          if ((swift_dynamicCast() & 1) == 0) {
            goto LABEL_45;
          }
          uint64_t v14 = *(void *)(v0 + 264);
          unint64_t v13 = *(void *)(v0 + 272);
          if (*(void *)(v10 + 16) && (unint64_t v15 = sub_6D6C(0x6B726F77747261, 0xE700000000000000), (v16 & 1) != 0))
          {
            sub_8BE0(*(void *)(v10 + 56) + 32 * v15, v0 + 88);
          }
          else
          {
            *(_OWORD *)(v0 + 88) = 0u;
            *(_OWORD *)(v0 + 104) = 0u;
          }
          swift_bridgeObjectRelease();
          if (*(void *)(v0 + 112))
          {
            if (swift_dynamicCast())
            {
              uint64_t v27 = *(void *)(v0 + 296);
              if (qword_18BA0 != -1) {
                swift_once();
              }
              if (qword_18BA8 == v14 && unk_18BB0 == v13 || (sub_100A0() & 1) != 0)
              {
                if (qword_18B70 != -1) {
                  swift_once();
                }
                NSString v28 = &qword_18B78;
              }
              else
              {
                if (qword_18BB8 != -1) {
                  swift_once();
                }
                if ((qword_18BC0 != v14 || *(void *)algn_18BC8 != v13) && (sub_100A0() & 1) == 0) {
                  goto LABEL_55;
                }
                if (qword_18B88 != -1) {
                  swift_once();
                }
                NSString v28 = &qword_18B90;
              }
              uint64_t v14 = *v28;
              unint64_t v29 = v28[1];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              unint64_t v13 = v29;
LABEL_55:
              *(void *)(v0 + 480) = v14;
              *(void *)(v0 + 488) = v13;
              sub_52B4(v27);
              swift_bridgeObjectRelease();
              id v30 = objc_allocWithZone((Class)AMSMediaArtwork);
              Class isa = sub_FDE0().super.isa;
              swift_bridgeObjectRelease();
              id v32 = [v30 initWithDictionary:isa];
              *(void *)(v0 + 496) = v32;

              [v32 artworkSize];
              double width = v59.width;
              double height = v59.height;
              v60.double width = 1024.0;
              v60.double height = 1024.0;
              uint64_t v55 = v32;
              if (!CGSizeEqualToSize(v59, v60))
              {
                if (qword_18BD8 != -1) {
                  swift_once();
                }
                uint64_t v35 = sub_FC80();
                sub_89F0(v35, (uint64_t)qword_19040);
                swift_bridgeObjectRetain_n();
                unint64_t v36 = sub_FC70();
                os_log_type_t v37 = sub_FF50();
                if (os_log_type_enabled(v36, v37))
                {
                  uint64_t v54 = v0 + 384;
                  uint64_t v38 = swift_slowAlloc();
                  uint64_t v56 = swift_slowAlloc();
                  *(_DWORD *)uint64_t v38 = 136315394;
                  swift_bridgeObjectRetain();
                  *(void *)(v0 + 384) = sub_D8D8(v14, v13, &v56);
                  sub_FF80();
                  swift_bridgeObjectRelease_n();
                  *(_WORD *)(v38 + 12) = 2080;
                  *(double *)(v0 + 248) = width;
                  *(double *)(v0 + 256) = height;
                  type metadata accessor for CGSize(0);
                  uint64_t v39 = sub_FE60();
                  *(void *)(v0 + 400) = sub_D8D8(v39, v40, &v56);
                  sub_FF80();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_0, v36, v37, "App icon for %s had unexpected size: %s", (uint8_t *)v38, 0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {
                  swift_bridgeObjectRelease_n();
                }
              }
              id v41 = objc_msgSend(v32, "URLWithSize:cropStyle:format:", AMSMediaArtworkCropStyleIconMask, AMSMediaArtworkFormatPNG, width, height, v54);
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)(v0 + 464);
                uint64_t v44 = *(void *)(v0 + 424);
                uint64_t v45 = *(void *)(v0 + 432);
                uint64_t v46 = *(void *)(v0 + 416);
                sub_FC30();

                NSString v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32);
                v47(v46, v43, v44);
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v46, 0, 1, v44);
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v44) != 1)
                {
                  v47(*(void *)(v0 + 472), *(void *)(v0 + 416), *(void *)(v0 + 424));
                  *(void *)(v0 + 504) = [self sharedSession];
                  id v48 = (void *)swift_task_alloc();
                  *(void *)(v0 + 512) = v48;
                  *id v48 = v0;
                  v48[1] = sub_9F08;
                  uint64_t v49 = *(void *)(v0 + 472);
                  uint64_t v50 = *(void *)(v0 + 456);
                  return NSURLSession.download(from:delegate:)(v50, v49, 0);
                }
              }
              else
              {
                (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 432) + 56))(*(void *)(v0 + 416), 1, 1, *(void *)(v0 + 424));
              }
              sub_ACA0(*(void *)(v0 + 416), &qword_18CB0);
              if (qword_18BD8 != -1) {
                swift_once();
              }
              uint64_t v51 = sub_FC80();
              sub_89F0(v51, (uint64_t)qword_19040);
              swift_bridgeObjectRetain();
              id v19 = sub_FC70();
              os_log_type_t v52 = sub_FF50();
              if (os_log_type_enabled(v19, v52))
              {
                v53 = (uint8_t *)swift_slowAlloc();
                uint64_t v56 = swift_slowAlloc();
                *(_DWORD *)v53 = 136315138;
                swift_bridgeObjectRetain();
                *(void *)(v0 + 304) = sub_D8D8(v14, v13, &v56);
                sub_FF80();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_0, v19, v52, "Unable to get artwork URL for app: %s", v53, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                goto LABEL_29;
              }

              goto LABEL_28;
            }
LABEL_45:
            swift_bridgeObjectRelease();
            goto LABEL_24;
          }
          swift_bridgeObjectRelease();
          uint64_t v17 = v0 + 88;
        }
        else
        {
LABEL_22:
          uint64_t v17 = (uint64_t)v3;
        }
        sub_ACA0(v17, &qword_18C00);
      }
    }
  }
LABEL_24:
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_FC80();
  sub_89F0(v18, (uint64_t)qword_19040);
  swift_bridgeObjectRetain_n();
  id v19 = sub_FC70();
  os_log_type_t v20 = sub_FF50();
  if (!os_log_type_enabled(v19, v20))
  {
LABEL_28:
    swift_bridgeObjectRelease_n();
    goto LABEL_29;
  }
  uint64_t v21 = (uint8_t *)swift_slowAlloc();
  uint64_t v56 = swift_slowAlloc();
  *(_DWORD *)uint64_t v21 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_FE00();
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 392) = sub_D8D8(v22, v24, &v56);
  sub_FF80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_0, v19, v20, "Unexpected format for app icon dictionary: %s.", v21, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();
LABEL_29:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v25 = *(uint64_t (**)(void, void, void))(v0 + 8);
  return v25(0, 0, 0);
}

uint64_t sub_9F08(void *a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 520) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v5 = sub_A924;
  }
  else
  {
    char v6 = *(void **)(v4 + 504);

    unint64_t v5 = sub_A060;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_A060()
{
  uint64_t v76 = v0;
  id v1 = (id)CLFAppIconsDirectory();
  sub_FC30();

  id v2 = [self defaultManager];
  sub_FC20(v3);
  unint64_t v5 = v4;
  *(void *)(v0 + 328) = 0;
  unsigned int v6 = [v2 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:v0 + 328];

  uint64_t v7 = *(void **)(v0 + 328);
  if (v6)
  {
    id v8 = v7;
    NSString v9 = sub_FE20();
    id v10 = (id)CLFAppIconURLForBundleIdentifier();

    sub_FC30();
    sub_FC20(v11);
    unint64_t v13 = v12;
    sub_FC20(v14);
    char v16 = v15;
    *(void *)(v0 + 352) = 0;
    unsigned int v17 = [v2 copyItemAtURL:v13 toURL:v15 error:v0 + 352];

    uint64_t v18 = *(void **)(v0 + 352);
    if (v17)
    {
      id v19 = v18;
      sub_FC40();
      sub_89AC(&qword_18CB8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10820;
      *(void *)(inited + 32) = NSFileProtectionKey;
      type metadata accessor for FileProtectionType(0);
      *(void *)(inited + 64) = v21;
      *(void *)(inited + 40) = NSFileProtectionNone;
      uint64_t v22 = NSFileProtectionKey;
      unint64_t v23 = NSFileProtectionNone;
      sub_4420(inited);
      type metadata accessor for FileAttributeKey(0);
      sub_AFC8(&qword_18CC0, type metadata accessor for FileAttributeKey);
      Class isa = sub_FDE0().super.isa;
      swift_bridgeObjectRelease();
      NSString v25 = sub_FE20();
      swift_bridgeObjectRelease();
      *(void *)(v0 + 368) = 0;
      unsigned int v26 = [v2 setAttributes:isa ofItemAtPath:v25 error:v0 + 368];

      uint64_t v27 = *(void **)(v0 + 368);
      if (v26)
      {
        NSString v28 = *(void **)(v0 + 496);
        id v29 = v27;
      }
      else
      {
        id v54 = v27;
        sub_FBF0();

        swift_willThrow();
        if (qword_18BD8 != -1) {
          swift_once();
        }
        uint64_t v55 = sub_FC80();
        sub_89F0(v55, (uint64_t)qword_19040);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v56 = sub_FC70();
        os_log_type_t v57 = sub_FF40();
        BOOL v58 = os_log_type_enabled(v56, v57);
        CGSize v59 = *(void **)(v0 + 496);
        if (v58)
        {
          char v74 = *(void **)(v0 + 496);
          CGSize v60 = (uint8_t *)swift_slowAlloc();
          id v61 = (void *)swift_slowAlloc();
          *(_DWORD *)CGSize v60 = 138412290;
          swift_errorRetain();
          uint64_t v62 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v0 + 376) = v62;
          sub_FF80();
          *id v61 = v62;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v56, v57, "Unable to set file protection class on app icon: %@", v60, 0xCu);
          sub_89AC(&qword_18FF0);
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
      }
      uint64_t v53 = *(void *)(v0 + 488);
      uint64_t v63 = *(void *)(v0 + 472);
      uint64_t v65 = *(void *)(v0 + 448);
      uint64_t v64 = *(void *)(v0 + 456);
      uint64_t v66 = *(void *)(v0 + 424);
      uint64_t v67 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 432) + 8);
      v67(*(void *)(v0 + 440), v66);
      v67(v65, v66);
      v67(v64, v66);
      v67(v63, v66);
      uint64_t v52 = *(void *)(v0 + 480);
      goto LABEL_20;
    }
    uint64_t v36 = *(void *)(v0 + 440);
    uint64_t v35 = *(void *)(v0 + 448);
    uint64_t v37 = *(void *)(v0 + 424);
    uint64_t v38 = *(void *)(v0 + 432);
    id v39 = v18;
    sub_FBF0();

    swift_willThrow();
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v34(v36, v37);
    v34(v35, v37);
  }
  else
  {
    uint64_t v30 = *(void *)(v0 + 448);
    uint64_t v31 = *(void *)(v0 + 424);
    uint64_t v32 = *(void *)(v0 + 432);
    id v33 = v7;
    sub_FBF0();

    swift_willThrow();
    uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v34(v30, v31);
  }
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_FC80();
  sub_89F0(v40, (uint64_t)qword_19040);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v41 = sub_FC70();
  os_log_type_t v42 = sub_FF40();
  BOOL v43 = os_log_type_enabled(v41, v42);
  unint64_t v44 = *(void *)(v0 + 488);
  if (v43)
  {
    uint64_t v45 = *(void *)(v0 + 480);
    uint64_t v72 = *(void *)(v0 + 456);
    uint64_t v73 = *(void *)(v0 + 472);
    uint64_t v71 = *(void *)(v0 + 424);
    uint64_t v70 = *(void **)(v0 + 496);
    uint64_t v46 = swift_slowAlloc();
    NSString v47 = (void *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 336) = sub_D8D8(v45, v44, &v75);
    sub_FF80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v46 + 12) = 2112;
    swift_errorRetain();
    uint64_t v48 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 344) = v48;
    sub_FF80();
    void *v47 = v48;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v41, v42, "Error copying artwork for app with bundle identifier %s: %@", (uint8_t *)v46, 0x16u);
    sub_89AC(&qword_18FF0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v34(v72, v71);
    v34(v73, v71);
  }
  else
  {
    uint64_t v49 = *(void *)(v0 + 472);
    uint64_t v50 = *(void *)(v0 + 456);
    uint64_t v51 = *(void *)(v0 + 424);

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    v34(v50, v51);
    v34(v49, v51);
  }
  uint64_t v52 = 0;
  uint64_t v53 = 0;
LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v68 = *(uint64_t (**)(uint64_t, uint64_t, void))(v0 + 8);
  return v68(v52, v53, 0);
}

uint64_t sub_A924()
{
  uint64_t v20 = v0;

  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_FC80();
  sub_89F0(v1, (uint64_t)qword_19040);
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v2 = sub_FC70();
  os_log_type_t v3 = sub_FF40();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 488);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 480);
    unint64_t v15 = *(void **)(v0 + 496);
    uint64_t v16 = *(void *)(v0 + 432);
    uint64_t v17 = *(void *)(v0 + 424);
    uint64_t v18 = *(void *)(v0 + 472);
    uint64_t v7 = swift_slowAlloc();
    id v8 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 312) = sub_D8D8(v6, v5, &v19);
    sub_FF80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 320) = v9;
    sub_FF80();
    void *v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "Error downloading artwork for app with bundle identifier %s: %@", (uint8_t *)v7, 0x16u);
    sub_89AC(&qword_18FF0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 472);
    uint64_t v11 = *(void *)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 432);

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = *(uint64_t (**)(void, void, uint64_t))(v0 + 8);
  return v13(0, 0, 1);
}

uint64_t sub_ACA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_89AC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_AD38(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_AD94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_89AC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_ADF8()
{
  return sub_AE24((void (*)(void))&_swift_bridgeObjectRelease, (void (*)(void))&_swift_unknownObjectRelease);
}

uint64_t sub_AE24(void (*a1)(void), void (*a2)(void))
{
  swift_unknownObjectRelease();
  a1(*(void *)(v2 + 32));
  a2(*(void *)(v2 + 40));

  return _swift_deallocObject(v2, 48, 7);
}

uint64_t sub_AE8C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_8FC0;
  return sub_2A88(a1, v4, v5, v7, v6);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_AF60(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_AFA8()
{
  return sub_3E0C();
}

uint64_t sub_AFC8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_B010()
{
  unint64_t result = qword_18D00;
  if (!qword_18D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18D00);
  }
  return result;
}

__n128 sub_B064(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_B074(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_B094(uint64_t result, int a2, int a3)
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

uint64_t sub_B0BC()
{
  return sub_AFC8(&qword_18D98, type metadata accessor for FileAttributeKey);
}

uint64_t sub_B104()
{
  return sub_AFC8(&qword_18DA0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_B14C()
{
  return sub_AFC8(&qword_18DA8, type metadata accessor for FileProtectionType);
}

uint64_t sub_B194()
{
  return sub_AFC8(&qword_18DB0, type metadata accessor for FileProtectionType);
}

uint64_t sub_B1DC()
{
  return sub_AFC8(&qword_18DB8, type metadata accessor for FileProtectionType);
}

uint64_t sub_B224()
{
  return sub_AFC8(&qword_18DC0, type metadata accessor for URLResourceKey);
}

uint64_t sub_B26C()
{
  return sub_AFC8(&qword_18DC8, type metadata accessor for URLResourceKey);
}

uint64_t sub_B2B4()
{
  return sub_AFC8(&qword_18DD0, type metadata accessor for URLResourceKey);
}

uint64_t sub_B2FC()
{
  return sub_AFC8(&qword_18DD8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_B354()
{
  uint64_t v0 = sub_FC80();
  sub_F720(v0, qword_19040);
  sub_89F0(v0, (uint64_t)qword_19040);
  id v1 = [self commonLog];
  return sub_FC90();
}

uint64_t sub_B3C4()
{
  return 1;
}

Swift::Int sub_B3CC()
{
  return sub_10120();
}

void sub_B410()
{
}

Swift::Int sub_B438()
{
  return sub_10120();
}

unint64_t sub_B478()
{
  return 0xD00000000000001ALL;
}

id sub_B570(uint64_t a1)
{
  return sub_B68C(a1, type metadata accessor for CLUIServer.SecureViewController);
}

uint64_t sub_B588()
{
  return 1;
}

void sub_B590(void *a1)
{
  UIAccessibilityNotifications v1 = UIAccessibilityScreenChangedNotification;
  id v2 = a1;
  id v3 = [v2 view];
  UIAccessibilityPostNotification(v1, v3);
}

id sub_B604(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_B620(a1, a2, a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for CLUIServer.SecureHostingController);
}

id sub_B620(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  v7.receiver = a1;
  v7.super_class = (Class)a5(a4);
  return objc_msgSendSuper2(&v7, "initWithCoder:", a3);
}

id sub_B670()
{
  return sub_B68C(0, type metadata accessor for CLUIServer.SecureHostingController);
}

id sub_B68C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_B6C4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CLUIServer.SecureHostingController());
  return sub_FD40();
}

uint64_t sub_B6F4()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CLUIServer.SecureHostingController());
  return sub_FD30();
}

uint64_t sub_B72C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v9 = a1;
  uint64_t v1 = sub_FD10();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  objc_super v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_FD20();
  sub_B984((uint64_t)v12);
  *(_OWORD *)&v14[103] = v12[6];
  *(_OWORD *)&v14[119] = v12[7];
  *(_OWORD *)&v14[135] = v12[8];
  *(_OWORD *)&v14[39] = v12[2];
  *(_OWORD *)&v14[55] = v12[3];
  *(_OWORD *)&v14[71] = v12[4];
  *(_OWORD *)&v14[87] = v12[5];
  *(_OWORD *)&v14[7] = v12[0];
  char v15 = 1;
  v14[151] = v13;
  *(_OWORD *)&v14[23] = v12[1];
  uint64_t v6 = sub_FDC0();
  char v7 = sub_FD60();
  *(_OWORD *)((char *)&v11[6] + 1) = *(_OWORD *)&v14[96];
  *(_OWORD *)((char *)&v11[7] + 1) = *(_OWORD *)&v14[112];
  *(_OWORD *)((char *)&v11[8] + 1) = *(_OWORD *)&v14[128];
  *(_OWORD *)((char *)&v11[2] + 1) = *(_OWORD *)&v14[32];
  *(_OWORD *)((char *)&v11[3] + 1) = *(_OWORD *)&v14[48];
  *(_OWORD *)((char *)&v11[4] + 1) = *(_OWORD *)&v14[64];
  *(_OWORD *)((char *)&v11[5] + 1) = *(_OWORD *)&v14[80];
  *(_OWORD *)((char *)v11 + 1) = *(_OWORD *)v14;
  long long v10 = (unint64_t)v5;
  LOBYTE(v11[0]) = 1;
  *(void *)((char *)&v11[9] + 1) = *(void *)&v14[144];
  *(_OWORD *)((char *)&v11[1] + 1) = *(_OWORD *)&v14[16];
  *(void *)&v11[10] = v6;
  BYTE8(v11[10]) = v7;
  BYTE9(v11[10]) = 1;
  sub_FD00();
  sub_89AC(&qword_18F80);
  sub_D670();
  sub_FDB0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v16[8] = v11[7];
  v16[9] = v11[8];
  v17[0] = v11[9];
  *(_OWORD *)((char *)v17 + 10) = *(_OWORD *)((char *)&v11[9] + 10);
  v16[4] = v11[3];
  v16[5] = v11[4];
  v16[6] = v11[5];
  v16[7] = v11[6];
  v16[0] = v10;
  v16[1] = v11[0];
  v16[2] = v11[1];
  v16[3] = v11[2];
  return sub_D850((uint64_t)v16);
}

uint64_t sub_B984@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = sub_FCE0();
  sub_BAF4((uint64_t)&v16);
  uint64_t v14 = v16;
  char v2 = v17;
  uint64_t v3 = v18;
  uint64_t v4 = v19;
  char v5 = v20;
  uint64_t v6 = v21;
  uint64_t v7 = v22;
  char v13 = v23;
  uint64_t v12 = v24;
  char v8 = v25;
  uint64_t v9 = sub_FDD0();
  uint64_t KeyPath = swift_getKeyPath();
  LOBYTE(v16) = 1;
  char v30 = 1;
  char v29 = v2;
  char v28 = v5;
  char v27 = v8;
  char v26 = 1;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = v14;
  *(unsigned char *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v4;
  *(unsigned char *)(a1 + 72) = v5;
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v7;
  *(unsigned char *)(a1 + 96) = v13;
  *(void *)(a1 + 104) = v12;
  *(unsigned char *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = KeyPath;
  *(void *)(a1 + 128) = v9;
  *(void *)(a1 + 136) = 0;
  *(unsigned char *)(a1 + 144) = 1;
  sub_DF88(v3, v4, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_D8C8(v3, v4, v5);
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_BAF4@<X0>(uint64_t a1@<X8>)
{
  sub_FCF0();
  type metadata accessor for CLUIServer();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  uint64_t v4 = sub_FD70();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v10;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = KeyPath;
  *(unsigned char *)(a1 + 56) = 1;
  *(void *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 72) = 1;
  sub_DF88(v4, v6, v10);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_D8C8(v4, v6, v10);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_BC50()
{
  return sub_FDA0();
}

id sub_BC70()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for CLUIServer()) init];
  qword_19058 = (uint64_t)result;
  return result;
}

void sub_BCFC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (_AXSClarityUIEnabled())
  {
    int v74 = -1;
    id v2 = [self sharedConnection];
    if (v2)
    {
      id v3 = v2;
      unsigned int v4 = [v2 unlockScreenTypeWithOutSimplePasscodeType:&v74];
      if ([v3 isPasscodeSet])
      {
        if (v4 || v74 == -1)
        {
          id v6 = [self sharedDisplayManager];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            char v9 = self;
            char v10 = (objc_class *)[v9 bundleForClass:ObjCClassFromMetadata];
            v63._countAndFlagsBits = 0xE000000000000000;
            v76._object = (void *)0x8000000000012660;
            v76._countAndFlagsBits = 0xD000000000000023;
            v82.value._countAndFlagsBits = 0;
            v82.value._object = 0;
            v11.super.Class isa = v10;
            v88._countAndFlagsBits = 0;
            v88._object = (void *)0xE000000000000000;
            sub_FBD0(v76, v82, v11, v88, v63);

            NSString v12 = sub_FE20();
            swift_bridgeObjectRelease();
            char v13 = (objc_class *)[v9 bundleForClass:ObjCClassFromMetadata];
            v77._countAndFlagsBits = 0xD00000000000002BLL;
            v64._countAndFlagsBits = 0xE000000000000000;
            v77._object = (void *)0x8000000000012690;
            v83.value._countAndFlagsBits = 0;
            v83.value._object = 0;
            v14.super.Class isa = v13;
            v89._countAndFlagsBits = 0;
            v89._object = (void *)0xE000000000000000;
            sub_FBD0(v77, v83, v14, v89, v64);

            NSString v15 = sub_FE20();
            swift_bridgeObjectRelease();
            id v16 = [v7 showAlertWithText:v12 subtitleText:v15 iconImage:0 type:4 forService:v1];
LABEL_18:

LABEL_36:
            return;
          }
          goto LABEL_39;
        }
      }
      if ((sub_E278() & 1) == 0)
      {
        uint64_t v37 = OBJC_IVAR___CLUIServer_presentingViewController;
        uint64_t v38 = *(void **)&v0[OBJC_IVAR___CLUIServer_presentingViewController];
        if (v38)
        {
          uint64_t v39 = qword_18BD8;
          id v40 = v38;
          if (v39 != -1) {
            swift_once();
          }
          uint64_t v41 = sub_FC80();
          sub_89F0(v41, (uint64_t)qword_19040);
          os_log_type_t v42 = sub_FC70();
          os_log_type_t v43 = sub_FF60();
          if (os_log_type_enabled(v42, v43))
          {
            unint64_t v44 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v44 = 0;
            _os_log_impl(&dword_0, v42, v43, "Passcode was already presented. Dismissing it.", v44, 2u);
            swift_slowDealloc();
          }

          uint64_t v45 = swift_allocObject();
          *(void *)(v45 + 16) = v40;
          *(void *)(v45 + 24) = v1;
          uint64_t v72 = sub_F870;
          uint64_t v73 = v45;
          aBlock = _NSConcreteStackBlock;
          uint64_t v69 = 1107296256;
          uint64_t v70 = sub_CA98;
          uint64_t v71 = &unk_14EC0;
          uint64_t v46 = _Block_copy(&aBlock);
          id v47 = v40;
          uint64_t v48 = v1;
          swift_release();
          [v47 dismissViewControllerAnimated:1 completion:v46];

          _Block_release(v46);
          id v3 = *(void **)&v1[v37];
          *(void *)&v1[v37] = 0;
          goto LABEL_36;
        }
        if (qword_18BD8 != -1) {
          swift_once();
        }
        uint64_t v49 = sub_FC80();
        sub_89F0(v49, (uint64_t)qword_19040);
        uint64_t v50 = sub_FC70();
        os_log_type_t v51 = sub_FF60();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl(&dword_0, v50, v51, "Presenting passcode.", v52, 2u);
          swift_slowDealloc();
        }

        type metadata accessor for CLUIServer.SecureViewController();
        id v53 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
        id v54 = *(void **)&v1[v37];
        *(void *)&v1[v37] = v53;
        id v55 = v53;

        id v56 = [self sharedDisplayManager];
        if (v56)
        {
          os_log_type_t v57 = v56;
          uint64_t v58 = swift_allocObject();
          *(void *)(v58 + 16) = v1;
          *(void *)(v58 + 24) = v55;
          uint64_t v72 = sub_F868;
          uint64_t v73 = v58;
          aBlock = _NSConcreteStackBlock;
          uint64_t v69 = 1107296256;
          uint64_t v70 = sub_CCC4;
          uint64_t v71 = &unk_14E70;
          CGSize v59 = _Block_copy(&aBlock);
          id v60 = v55;
          id v61 = v1;
          id v62 = v60;
          swift_release();
          [v57 addContentViewController:v62 withUserInteractionEnabled:1 forService:v61 context:0 completion:v59];

          _Block_release(v59);
          id v3 = v62;
          goto LABEL_36;
        }
        goto LABEL_40;
      }
      id v26 = [self sharedDisplayManager];
      if (v26)
      {
        uint64_t v7 = v26;
        uint64_t v27 = swift_getObjCClassFromMetadata();
        char v28 = self;
        char v29 = (objc_class *)[v28 bundleForClass:v27];
        v80._countAndFlagsBits = 0xD000000000000015;
        v63._countAndFlagsBits = 0xE000000000000000;
        v80._object = (void *)0x8000000000012620;
        v86.value._countAndFlagsBits = 0;
        v86.value._object = 0;
        v30.super.Class isa = v29;
        v92._countAndFlagsBits = 0;
        v92._object = (void *)0xE000000000000000;
        sub_FBD0(v80, v86, v30, v92, v63);

        NSString v12 = sub_FE20();
        swift_bridgeObjectRelease();
        uint64_t v31 = (objc_class *)[v28 bundleForClass:v27];
        v81._countAndFlagsBits = 0xD00000000000001DLL;
        v66._countAndFlagsBits = 0xE000000000000000;
        v81._object = (void *)0x8000000000012640;
        v87.value._countAndFlagsBits = 0;
        v87.value._object = 0;
        v32.super.Class isa = v31;
        v93._countAndFlagsBits = 0;
        v93._object = (void *)0xE000000000000000;
        sub_FBD0(v81, v87, v32, v93, v66);

        NSString v15 = sub_FE20();
        swift_bridgeObjectRelease();
        id v16 = [v7 showAlertWithText:v12 subtitleText:v15 iconImage:0 type:4 forService:v1];
        goto LABEL_18;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      return;
    }
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_FC80();
    sub_89F0(v33, (uint64_t)qword_19040);
    uint64_t v34 = sub_FC70();
    os_log_type_t v35 = sub_FF40();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_0, v34, v35, "Could not get profile connection", v36, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    id v17 = [self sharedDisplayManager];
    if (!v17)
    {
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v18 = v17;
    uint64_t v19 = swift_getObjCClassFromMetadata();
    char v20 = self;
    uint64_t v21 = (objc_class *)[v20 bundleForClass:v19];
    v78._countAndFlagsBits = 0xD00000000000001BLL;
    v63._countAndFlagsBits = 0xE000000000000000;
    v78._object = (void *)0x80000000000126C0;
    v84.value._countAndFlagsBits = 0;
    v84.value._object = 0;
    v22.super.Class isa = v21;
    v90._countAndFlagsBits = 0;
    v90._object = (void *)0xE000000000000000;
    sub_FBD0(v78, v84, v22, v90, v63);

    NSString v23 = sub_FE20();
    swift_bridgeObjectRelease();
    uint64_t v24 = (objc_class *)[v20 bundleForClass:v19];
    v65._countAndFlagsBits = 0xE000000000000000;
    v79._object = (void *)0x80000000000126E0;
    v79._countAndFlagsBits = 0xD000000000000023;
    v85.value._countAndFlagsBits = 0;
    v85.value._object = 0;
    v25.super.Class isa = v24;
    v91._countAndFlagsBits = 0;
    v91._object = (void *)0xE000000000000000;
    sub_FBD0(v79, v85, v25, v91, v65);

    NSString v67 = sub_FE20();
    swift_bridgeObjectRelease();
  }
}

void sub_C900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    v5.super.Class isa = sub_FDE0().super.isa;
    if (a2)
    {
LABEL_3:
      uint64_t v6 = sub_FBE0();
      goto LABEL_6;
    }
  }
  else
  {
    v5.super.Class isa = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

void sub_CA14(uint64_t a1, uint64_t a2)
{
  id v4 = [self sharedDisplayManager];
  if (v4)
  {
    id v5 = v4;
    [v4 removeContentViewController:a1 withUserInteractionEnabled:1 forService:a2];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_CA98(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_CADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [self currentDevice];
  uint64_t v6 = (char *)[v5 userInterfaceIdiom];

  if ((AXBackBoardServerClarityUIAdminPasscodeLength & 0x8000000000000000) != 0)
  {
    sub_10040();
    __break(1u);
  }
  else
  {
    id v12 = [objc_allocWithZone((Class)AXUIPasscodeViewController) initWithPresentationStyle:v6 == (unsigned char *)&dword_0 + 1 forSetup:0 pinLength:AXBackBoardServerClarityUIAdminPasscodeLength];
    type metadata accessor for CLUIServer();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v8 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    v11._countAndFlagsBits = 0xE000000000000000;
    v14._object = (void *)0x8000000000012710;
    v14._countAndFlagsBits = 0xD000000000000022;
    v15.value._countAndFlagsBits = 0;
    v15.value._object = 0;
    v9.super.Class isa = v8;
    v16._countAndFlagsBits = 0;
    v16._object = (void *)0xE000000000000000;
    sub_FBD0(v14, v15, v9, v16, v11);

    NSString v10 = sub_FE20();
    swift_bridgeObjectRelease();
    [v12 setPinViewTitle:v10];

    [v12 setDelegate:a2];
    [v12 presentPasscodeViewWithParentViewController:a3 animated:1];
  }
}

uint64_t sub_CCC4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_CD8C()
{
  _AXFeatureSupportsNonSightedUsage();
  v1[4] = sub_CE40;
  v1[5] = 0;
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 1107296256;
  v1[2] = sub_CA98;
  v1[3] = &unk_14DF8;
  id v0 = _Block_copy(v1);
  AXPerformBlockOnMainThreadAfterDelay();
  _Block_release(v0);
}

void sub_CE40()
{
  id v0 = [objc_allocWithZone((Class)AXSpringBoardServer) init];
  v2[4] = sub_CF04;
  v2[5] = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 1107296256;
  v2[2] = sub_CA98;
  v2[3] = &unk_14E20;
  uint64_t v1 = _Block_copy(v2);
  [v0 freezeClarityUILoadingScreenWithCompletion:v1];
  _Block_release(v1);
}

void sub_CF04()
{
  id v0 = [objc_allocWithZone((Class)CLFSystemShellSwitcher) init];
  id v11 = 0;
  unsigned int v1 = [v0 setClarityBoardEnabled:1 error:&v11];

  id v2 = v11;
  if (v1)
  {
    id v3 = v2;
  }
  else
  {
    id v4 = v11;
    sub_FBF0();

    swift_willThrow();
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_FC80();
    sub_89F0(v5, (uint64_t)qword_19040);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v6 = sub_FC70();
    os_log_type_t v7 = sub_FF50();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      id v11 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_errorRetain();
      sub_89AC(&qword_18FC8);
      uint64_t v9 = sub_FE60();
      sub_D8D8(v9, v10, (uint64_t *)&v11);
      sub_FF80();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v6, v7, "Unable to enter ClarityUI: %s", v8, 0xCu);
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
  }
}

uint64_t sub_D230(char a1, uint64_t (*a2)(void))
{
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_FC80();
  sub_89F0(v4, (uint64_t)qword_19040);
  uint64_t v5 = sub_FC70();
  os_log_type_t v6 = sub_FF60();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 67109120;
    sub_FF80();
    _os_log_impl(&dword_0, v5, v6, "Passcode is correct: %{BOOL}d", v7, 8u);
    swift_slowDealloc();
  }

  return a2(a1 & 1);
}

id sub_D520()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CLUIServer()
{
  return self;
}

uint64_t type metadata accessor for CLUIServer.SecureViewController()
{
  return self;
}

uint64_t type metadata accessor for CLUIServer.SecureHostingController()
{
  uint64_t result = qword_18F30;
  if (!qword_18F30) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_D5FC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_D63C()
{
  return type metadata accessor for CLUIServer.SecureHostingController();
}

ValueMetadata *type metadata accessor for CLUIServer.LoadingView()
{
  return &type metadata for CLUIServer.LoadingView;
}

uint64_t sub_D654(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_130F0, 1);
}

uint64_t sub_D670()
{
  return sub_FA38(&qword_18F88, &qword_18F80, (void (*)(void))sub_D6F4, (void (*)(void))sub_D7FC);
}

uint64_t sub_D6AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_D6F4()
{
  unint64_t result = qword_18F90;
  if (!qword_18F90)
  {
    sub_D6AC(&qword_18F98);
    sub_D7B8(&qword_18FA0, &qword_18FA8);
    sub_D7B8(&qword_18FB0, &qword_18FB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18F90);
  }
  return result;
}

uint64_t sub_D7B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_D6AC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_D7FC()
{
  unint64_t result = qword_18FC0;
  if (!qword_18FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18FC0);
  }
  return result;
}

uint64_t sub_D850(uint64_t a1)
{
  return a1;
}

uint64_t sub_D8C8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_D8D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_D9AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8BE0((uint64_t)v12, *a3);
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
      sub_8BE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_F784((uint64_t)v12);
  return v7;
}

uint64_t sub_D9AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_FF90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_DB68(a5, a6);
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
  uint64_t v8 = sub_10020();
  if (!v8)
  {
    sub_10040();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10070();
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

uint64_t sub_DB68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_DC00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_DDE0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_DDE0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_DC00(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_DD78(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10040();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_FE80();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10070();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10040();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_DD78(uint64_t a1, uint64_t a2)
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
  sub_89AC(&qword_18FD0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_DDE0(char a1, int64_t a2, char a3, char *a4)
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
    sub_89AC(&qword_18FD0);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_10070();
  __break(1u);
  return result;
}

uint64_t sub_DF30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_FCA0();
  *a1 = result;
  return result;
}

uint64_t sub_DF5C()
{
  return sub_FCB0();
}

uint64_t sub_DF88(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_DF98@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_FCC0();
  *a1 = result;
  return result;
}

uint64_t sub_DFC4()
{
  return sub_FCD0();
}

uint64_t sub_DFEC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_E024(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_E03C(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v2 = 0;
  unint64_t v3 = _swiftEmptyArrayStorage;
  uint64_t v24 = result + 32;
  do
  {
    NSString v23 = v3;
    if (v2 <= v1) {
      unint64_t v4 = v1;
    }
    else {
      unint64_t v4 = v2;
    }
    while (1)
    {
      if (v2 == v4)
      {
        __break(1u);
        return result;
      }
      size_t v5 = (uint64_t *)(v24 + 16 * v2);
      uint64_t v7 = *v5;
      uint64_t v6 = v5[1];
      uint64_t v8 = qword_18BD0;
      swift_bridgeObjectRetain();
      if (v8 != -1) {
        swift_once();
      }
      ++v2;
      uint64_t v9 = qword_19038;
      if (!*(void *)(qword_19038 + 16)) {
        break;
      }
      sub_10100();
      sub_FE70();
      Swift::Int v10 = sub_10120();
      uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v12 = v10 & ~v11;
      uint64_t v13 = v9 + 56;
      if (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        break;
      }
      uint64_t v14 = *(void *)(v9 + 48);
      Swift::String_optional v15 = (void *)(v14 + 16 * v12);
      BOOL v16 = *v15 == v7 && v15[1] == v6;
      if (!v16 && (sub_100A0() & 1) == 0)
      {
        uint64_t v17 = ~v11;
        do
        {
          unint64_t v12 = (v12 + 1) & v17;
          if (((*(void *)(v13 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
            goto LABEL_25;
          }
          uint64_t v18 = (void *)(v14 + 16 * v12);
          BOOL v19 = *v18 == v7 && v18[1] == v6;
        }
        while (!v19 && (sub_100A0() & 1) == 0);
      }
      uint64_t result = swift_bridgeObjectRelease();
      if (v2 == v1) {
        return (uint64_t)v23;
      }
    }
LABEL_25:
    unint64_t v3 = v23;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_693C(0, v23[2] + 1, 1);
      unint64_t v3 = v23;
    }
    unint64_t v21 = v3[2];
    unint64_t v20 = v3[3];
    if (v21 >= v20 >> 1)
    {
      uint64_t result = sub_693C(v20 > 1, v21 + 1, 1);
      unint64_t v3 = v23;
    }
    v3[2] = v21 + 1;
    NSBundle v22 = &v3[2 * v21];
    v22[4] = v7;
    v22[5] = v6;
  }
  while (v2 != v1);
  return (uint64_t)v3;
}

uint64_t sub_E278()
{
  sub_F878(0, &qword_18FE8);
  uint64_t v0 = (void *)sub_FF70();
  id v1 = [objc_allocWithZone((Class)CoreTelephonyClient) initWithQueue:v0];

  id v49 = 0;
  id v2 = [v1 getSubscriptionInfoWithError:&v49];
  if (!v2)
  {
    id v14 = v49;
    sub_FBF0();

    swift_willThrow();
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_FC80();
    sub_89F0(v15, (uint64_t)qword_19040);
    swift_errorRetain();
    swift_errorRetain();
    BOOL v16 = sub_FC70();
    os_log_type_t v17 = sub_FF60();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      BOOL v19 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 138412290;
      swift_errorRetain();
      unint64_t v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v49 = v20;
      sub_FF80();
      *BOOL v19 = v20;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v16, v17, "Unable to get info about SIMs: %@", v18, 0xCu);
      sub_89AC(&qword_18FF0);
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
    return 0;
  }
  unint64_t v3 = v2;
  id v4 = v49;
  id v5 = [v3 subscriptionsInUse];
  if (!v5)
  {
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_FC80();
    sub_89F0(v21, (uint64_t)qword_19040);
    NSBundle v22 = sub_FC70();
    os_log_type_t v23 = sub_FF60();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_0, v22, v23, "Found no SIMs.", v24, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v6 = v5;
  sub_F878(0, &qword_18FF8);
  unint64_t v7 = sub_FEA0();

  if (qword_18BD8 != -1) {
LABEL_38:
  }
    swift_once();
  uint64_t v8 = sub_FC80();
  sub_89F0(v8, (uint64_t)qword_19040);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_FC70();
  os_log_type_t v10 = sub_FF60();
  unint64_t v11 = v7 >> 62;
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 134217984;
    if (v11)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_10050();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void **)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();
    id v49 = v13;
    sub_FF80();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "Checking %ld SIMs...", v12, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v46 = v3;
  if (v11)
  {
    swift_bridgeObjectRetain();
    unint64_t v3 = (void *)sub_10050();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
  unint64_t v3 = *(void **)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
  if (!v3)
  {
LABEL_40:

    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_20:
  unint64_t v25 = v7 & 0xC000000000000001;
  uint64_t v26 = 4;
  uint64_t v27 = &AXUIService__prots;
  id v47 = v1;
  unint64_t v48 = v7;
  while (1)
  {
    if (v25) {
      id v28 = (id)sub_10010();
    }
    else {
      id v28 = *(id *)(v7 + 8 * v26);
    }
    char v29 = v28;
    NSBundle v30 = (void *)(v26 - 3);
    if (__OFADD__(v26 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    id v49 = 0;
    id v31 = objc_msgSend(v1, (SEL)v27[299].count, v28, &v49);
    if (!v31)
    {
      id v34 = v49;
      sub_FBF0();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      os_log_type_t v35 = sub_FC70();
      os_log_type_t v36 = sub_FF40();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        unint64_t v38 = v25;
        uint64_t v39 = v3;
        id v40 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 138412290;
        swift_errorRetain();
        uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v37 + 4) = v41;
        void *v40 = v41;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v35, v36, "Unable to fetch whether SIM had PIN: %@", (uint8_t *)v37, 0xCu);
        sub_89AC(&qword_18FF0);
        swift_arrayDestroy();
        unint64_t v3 = v39;
        unint64_t v25 = v38;
        swift_slowDealloc();
        id v1 = v47;
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      unint64_t v7 = v48;
      uint64_t v27 = &AXUIService__prots;
      goto LABEL_23;
    }
    NSBundle v32 = v31;
    id v33 = v49;
    if ([v32 BOOLValue]) {
      break;
    }

LABEL_23:
    ++v26;
    if (v30 == v3) {
      goto LABEL_40;
    }
  }
  swift_bridgeObjectRelease();
  os_log_type_t v42 = sub_FC70();
  os_log_type_t v43 = sub_FF60();
  if (os_log_type_enabled(v42, v43))
  {
    unint64_t v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v44 = 0;
    _os_log_impl(&dword_0, v42, v43, "Found SIM with PIN.", v44, 2u);
    swift_slowDealloc();
  }

  return 1;
}

void sub_EA44(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  if (CLFUpdateAppIconsMessageIdentifier == a1)
  {
    sub_F878(0, &qword_18FE0);
    uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    _Block_copy(a3);
    id v6 = a2;
    id v7 = [ObjCClassFromMetadata sharedInstance];
    id v8 = [v7 applicationBundleIdentifiers];

    uint64_t v9 = sub_FEA0();
    id v10 = v6;
    uint64_t v11 = sub_E03C(v9);
    swift_bridgeObjectRelease();

    sub_2908(v11, (uint64_t)v10);
    _Block_copy(a3);
    sub_80F0(v11, (uint64_t)v10, a3);
    _Block_release(a3);

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_F7D4();
    swift_allocError();
    _Block_copy(a3);
    unint64_t v12 = (void *)sub_FBE0();
    ((void (**)(void, void, void *))a3)[2](a3, 0, v12);

    swift_errorRelease();
  }

  _Block_release(a3);
}

Swift::Int sub_EBE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_89AC(&qword_19008);
    uint64_t v3 = sub_FFF0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_AD38(v6 + 40 * v4, (uint64_t)v21);
      Swift::Int result = sub_FFA0(*(void *)(v3 + 40));
      uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v9 = result & v8;
      unint64_t v10 = (result & (unint64_t)v8) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_AD38(*(void *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          char v13 = sub_FFB0();
          Swift::Int result = sub_8A8C((uint64_t)v20);
          if (v13) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v8;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_8;
          }
        }
        sub_8A8C((uint64_t)v21);
      }
      else
      {
LABEL_8:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        uint64_t v14 = *(void *)(v3 + 48) + 40 * v9;
        long long v15 = v21[0];
        long long v16 = v21[1];
        *(void *)(v14 + 32) = v22;
        *(_OWORD *)uint64_t v14 = v15;
        *(_OWORD *)(v14 + 16) = v16;
        uint64_t v17 = *(void *)(v3 + 16);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v19;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

Swift::Int sub_ED48(uint64_t a1)
{
  if (AXTripleClickAttemptToEnterClarityBoardMessageIdentifier == a1)
  {
    sub_89AC(&qword_19000);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10D20;
    sub_FFC0();
    sub_FFC0();
    sub_FFC0();
    sub_FFC0();
    sub_FFC0();
    sub_FFC0();
    Swift::Int v2 = sub_EBE0(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  else if (CLFUpdateAppIconsMessageIdentifier == a1)
  {
    sub_89AC(&qword_19000);
    uint64_t v3 = swift_initStackObject();
    *(_OWORD *)(v3 + 16) = xmmword_10820;
    sub_FFC0();
    Swift::Int v2 = sub_EBE0(v3);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  else
  {
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_FC80();
    sub_89F0(v4, (uint64_t)qword_19040);
    uint64_t v5 = sub_FC70();
    os_log_type_t v6 = sub_FF50();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v7 = 134217984;
      sub_FF80();
      _os_log_impl(&dword_0, v5, v6, "Asked for required entitlements for unknown message identifier: %ld", v7, 0xCu);
      swift_slowDealloc();
    }

    return 0;
  }
  return v2;
}

void sub_F088(char a1)
{
  if (a1)
  {
    if (qword_18BD8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_FC80();
    sub_89F0(v2, (uint64_t)qword_19040);
    oslog = sub_FC70();
    os_log_type_t v3 = sub_FF60();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, oslog, v3, "Passcode was shown.", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = oslog;
LABEL_16:

    return;
  }
  uint64_t v6 = v1;
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_FC80();
  sub_89F0(v7, (uint64_t)qword_19040);
  uint64_t v8 = sub_FC70();
  os_log_type_t v9 = sub_FF60();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&dword_0, v8, v9, "Passcode was hidden.", v10, 2u);
    swift_slowDealloc();
  }

  if ((*(unsigned char *)(v6 + OBJC_IVAR___CLUIServer_isShowingLoadingView) & 1) == 0)
  {
    id v11 = [self sharedDisplayManager];
    if (!v11)
    {
      __break(1u);
      return;
    }
    uint64_t v12 = v11;
    uint64_t v13 = OBJC_IVAR___CLUIServer_presentingViewController;
    [v11 removeContentViewController:*(void *)(v6 + OBJC_IVAR___CLUIServer_presentingViewController) withUserInteractionEnabled:1 forService:v6];

    uint64_t v5 = *(NSObject **)(v6 + v13);
    *(void *)(v6 + v13) = 0;
    goto LABEL_16;
  }
}

void sub_F2B4(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_18BD8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_FC80();
  sub_89F0(v4, (uint64_t)qword_19040);
  uint64_t v5 = sub_FC70();
  os_log_type_t v6 = sub_FF60();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    v18[0] = a1;
    sub_FF80();
    _os_log_impl(&dword_0, v5, v6, "Passcode was dismissed with reason: %ld", v7, 0xCu);
    swift_slowDealloc();
  }

  if (a1 == 2)
  {
    *(unsigned char *)(v2 + OBJC_IVAR___CLUIServer_isShowingLoadingView) = 1;
    id v8 = objc_allocWithZone((Class)type metadata accessor for CLUIServer.SecureHostingController());
    os_log_type_t v9 = sub_FD40();
    [v9 setModalPresentationStyle:0];
    unint64_t v10 = *(void **)(v2 + OBJC_IVAR___CLUIServer_presentingViewController);
    if (v10)
    {
      id v11 = v10;
      id v12 = [v11 view];
      if (!v12)
      {
        __break(1u);
        return;
      }
      uint64_t v13 = v12;
      id v14 = [self blackColor];
      [v13 setBackgroundColor:v14];

      v18[4] = sub_CD8C;
      v18[5] = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 1107296256;
      v18[2] = sub_CA98;
      v18[3] = &unk_14DD0;
      long long v15 = _Block_copy(v18);
      [v11 presentViewController:v9 animated:1 completion:v15];

      _Block_release(v15);
    }
    else
    {
      id v11 = sub_FC70();
      os_log_type_t v16 = sub_FF50();
      if (os_log_type_enabled(v11, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_0, v11, v16, "Tried to show loading screen, but had no presenting view controller.", v17, 2u);
        swift_slowDealloc();
      }
      else
      {

        id v11 = v9;
      }
    }
  }
}

void sub_F5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [objc_allocWithZone((Class)AXBackBoardServer) init];
  NSString v7 = sub_FE20();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  v10[4] = sub_F700;
  v10[5] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_CCC4;
  v10[3] = &unk_14DA8;
  os_log_type_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v6 validateClarityUIAdminPasscode:v7 completion:v9];
  _Block_release(v9);
}

uint64_t sub_F6C8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_F700(char a1)
{
  return sub_D230(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_F708(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_F718()
{
  return swift_release();
}

uint64_t *sub_F720(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_F784(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_F7D4()
{
  unint64_t result = qword_18FD8;
  if (!qword_18FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18FD8);
  }
  return result;
}

uint64_t sub_F828()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_F868(uint64_t a1)
{
  sub_CADC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_F870()
{
  sub_CA14(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_F878(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for CLUIServer.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CLUIServer.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0xF9A4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_F9CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CLUIServer.Error()
{
  return &type metadata for CLUIServer.Error;
}

uint64_t sub_F9E8()
{
  return sub_FA38(&qword_19010, &qword_19018, (void (*)(void))sub_D670, (void (*)(void))sub_FAC0);
}

uint64_t sub_FA38(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_D6AC(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_FAC0()
{
  unint64_t result = qword_19020;
  if (!qword_19020)
  {
    sub_FD50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19020);
  }
  return result;
}

unint64_t sub_FB20()
{
  unint64_t result = qword_19028;
  if (!qword_19028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19028);
  }
  return result;
}

uint64_t sub_FBA0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_FBB0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_FBC0()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_FBD0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_FBE0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_FBF0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_FC00()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_FC10()
{
  return URL.lastPathComponent.getter();
}

void sub_FC20(NSURL *retstr@<X8>)
{
}

uint64_t sub_FC30()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_FC40()
{
  return URL.path.getter();
}

uint64_t sub_FC50()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_FC60()
{
  return type metadata accessor for URL();
}

uint64_t sub_FC70()
{
  return Logger.logObject.getter();
}

uint64_t sub_FC80()
{
  return type metadata accessor for Logger();
}

uint64_t sub_FC90()
{
  return Logger.init(_:)();
}

uint64_t sub_FCA0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_FCB0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_FCC0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_FCD0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_FCE0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_FCF0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_FD00()
{
  return static AccessibilityTraits.isModal.getter();
}

uint64_t sub_FD10()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_FD20()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_FD30()
{
  return UIHostingController.init(coder:rootView:)();
}

uint64_t sub_FD40()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_FD50()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_FD60()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_FD70()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_FD80()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_FD90()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_FDA0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_FDB0()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_FDC0()
{
  return static Color.black.getter();
}

uint64_t sub_FDD0()
{
  return static Color.white.getter();
}

NSDictionary sub_FDE0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_FDF0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_FE00()
{
  return Dictionary.description.getter();
}

uint64_t sub_FE10()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_FE20()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_FE30()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_FE40()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_FE50()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_FE60()
{
  return String.init<A>(describing:)();
}

uint64_t sub_FE70()
{
  return String.hash(into:)();
}

Swift::Int sub_FE80()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_FE90()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_FEA0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_FEB0()
{
  return Array.description.getter();
}

uint64_t sub_FEC0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_FED0()
{
  return TaskGroup.makeAsyncIterator()();
}

uint64_t sub_FEF0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_FF00()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_FF10()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_FF20()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_FF40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_FF50()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_FF60()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_FF70()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_FF80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_FF90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_FFA0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_FFB0()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_FFC0()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_FFD0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_FFE0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_FFF0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_10000()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10010()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10020()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10040()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10050()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10060()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10070()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10090()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100A0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100B0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100C0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100D0()
{
  return Error._code.getter();
}

uint64_t sub_100E0()
{
  return Error._domain.getter();
}

uint64_t sub_100F0()
{
  return Error._userInfo.getter();
}

uint64_t sub_10100()
{
  return Hasher.init(_seed:)();
}

void sub_10110(Swift::UInt a1)
{
}

Swift::Int sub_10120()
{
  return Hasher._finalize()();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
}

uint64_t CLFAppIconURLForBundleIdentifier()
{
  return _CLFAppIconURLForBundleIdentifier();
}

uint64_t CLFAppIconsDirectory()
{
  return _CLFAppIconsDirectory();
}

uint64_t CLFLegacyAppIconsDirectory()
{
  return _CLFLegacyAppIconsDirectory();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXFeatureSupportsNonSightedUsage()
{
  return __AXFeatureSupportsNonSightedUsage();
}

uint64_t _AXSClarityUIEnabled()
{
  return __AXSClarityUIEnabled();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}