uint64_t sub_1000054EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_100017F18();
  swift_allocObject();
  sub_100017F28();
  sub_100017EE8();
  swift_allocObject();
  swift_retain();
  sub_100017EF8();
  sub_100005AFC(&qword_1000218D0);
  sub_100017E78();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100018970;
  sub_100005B40(&qword_1000218D8, (void (*)(uint64_t))&type metadata accessor for PRRenderingConfiguration);
  swift_retain();
  swift_retain();
  sub_100017E68();
  sub_100005B40(&qword_1000218E0, (void (*)(uint64_t))&type metadata accessor for PREditingConfiguration);
  swift_retain();
  sub_100017E68();
  swift_release_n();
  result = swift_release_n();
  *a1 = v2;
  return result;
}

id sub_100005714()
{
  return sub_100005744(type metadata accessor for EmojiPosterExtensionRenderingController);
}

id sub_10000572C()
{
  return sub_100005744(type metadata accessor for EmojiPosterExtensionEditorController);
}

id sub_100005744(uint64_t (*a1)(void))
{
  id v1 = objc_allocWithZone((Class)a1(0));
  return [v1 init];
}

uint64_t sub_100005788()
{
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000058E4()
{
  unint64_t result = qword_1000218A0;
  if (!qword_1000218A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000218A0);
  }
  return result;
}

uint64_t sub_100005938(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of EmojiAssetUpdater.logger()
{
  return sub_100017EC8();
}

uint64_t variable initialization expression of EmojiAssetUpdater.maxDescriptorCount()
{
  return 20;
}

uint64_t variable initialization expression of EmojiAssetUpdater.currentVersion()
{
  return 6;
}

uint64_t variable initialization expression of EmojiAssetUpdater.configurationProvider()
{
  return sub_100005A20((void (*)(void))&type metadata accessor for ConfigurationProvider, (uint64_t (*)(void))&ConfigurationProvider.init());
}

uint64_t variable initialization expression of EmojiAssetUpdater.serializer()
{
  return sub_100005A20((void (*)(void))&type metadata accessor for PropertyListEncoder, (uint64_t (*)(void))&PropertyListEncoder.init());
}

uint64_t sub_100005A20(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for ATXPosterDescriptorFocus(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for EmojiPosterExtension()
{
  return &type metadata for EmojiPosterExtension;
}

void *sub_100005AA0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_100005AB0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005AC4()
{
  return *(void *)(*(void *)(swift_getOpaqueTypeConformance2() + 8) + 8);
}

uint64_t sub_100005AFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005B40(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100005B88(void *a1@<X8>)
{
  *a1 = *v1;
}

__n128 sub_100005B94(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100005BA4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005BC4(uint64_t result, int a2, int a3)
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

void sub_100005C00(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005C48()
{
  return sub_100005C7C((unint64_t *)&unk_1000218F0);
}

uint64_t sub_100005C7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005938(&qword_1000218B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id EmojiAssetUpdater.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id EmojiAssetUpdater.init()()
{
  id v1 = v0;
  sub_100017EC8();
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_maxDescriptorCount] = 20;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_currentVersion] = 6;
  uint64_t v2 = OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_configurationProvider;
  sub_100017E18();
  swift_allocObject();
  *(void *)&v1[v2] = sub_100017E08();
  uint64_t v3 = OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_serializer;
  sub_100017B18();
  swift_allocObject();
  *(void *)&v1[v3] = sub_100017B08();
  swift_retain();
  sub_100017AE8();
  swift_release();

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EmojiAssetUpdater();
  return objc_msgSendSuper2(&v5, "init");
}

uint64_t type metadata accessor for EmojiAssetUpdater()
{
  uint64_t result = qword_100021990;
  if (!qword_100021990) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void EmojiAssetUpdater.updateDescriptors(_:completion:)(uint64_t a1, void (*a2)(unint64_t, void), uint64_t a3)
{
  uint64_t v150 = a3;
  uint64_t v165 = sub_100005AFC(&qword_100021900);
  uint64_t v147 = *(void *)(v165 - 8);
  uint64_t v6 = __chkstk_darwin(v165);
  v163 = (char *)v145 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v157 = (uint64_t)v145 - v9;
  __chkstk_darwin(v8);
  uint64_t v162 = (uint64_t)v145 - v10;
  uint64_t v11 = sub_100017D28();
  *(void *)&long long v153 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  v14 = (char *)v145 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  v166 = (char *)v145 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)v145 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v159 = (char *)v145 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  v24 = (char *)v145 - v23;
  __chkstk_darwin(v22);
  v26 = (char *)v145 - v25;
  uint64_t v170 = v3;
  uint64_t v156 = v3 + OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_logger;
  v27 = sub_100017EB8();
  os_log_type_t v28 = sub_100018078();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Updating descriptors...", v29, 2u);
    swift_slowDealloc();
  }

  unint64_t v175 = (unint64_t)&_swiftEmptyArrayStorage;
  v176 = &_swiftEmptySetSingleton;
  v30 = *(char **)(v170 + OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_configurationProvider);
  uint64_t v158 = sub_100017DE8();
  uint64_t v31 = *(void *)(a1 + 16);
  uint64_t v164 = v11;
  v155 = v14;
  v154 = a2;
  v149 = v30;
  v146 = v19;
  if (!v31 || (unint64_t v32 = sub_100008F3C(1869768040, 0xE400000000000000), (v33 & 1) == 0))
  {
    id v148 = 0;
    goto LABEL_14;
  }
  id v148 = *(id *)(*(void *)(a1 + 56) + 8 * v32);
  id v34 = v148;
  unint64_t v35 = sub_100007434(v34);
  if (!v35)
  {

    goto LABEL_14;
  }
  unint64_t v36 = v35;
  if (!*(void *)(v35 + 16) || (unint64_t v37 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000), (v38 & 1) == 0))
  {

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v39 = v24;
  uint64_t v40 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v174 = v40;
  if ((swift_dynamicCast() & 1) == 0)
  {

    v24 = v39;
    goto LABEL_14;
  }
  if (v173 != 6)
  {
    v24 = v39;

LABEL_14:
    sub_100017DD8();
    id v48 = sub_100009C34(1869768040, 0xE400000000000000, 0, 1);
    id v49 = sub_100007D8C(1869768040, 0xE400000000000000, (uint64_t)v26, v48);
    if (v49)
    {
      id v50 = v49;
      sub_100017FD8();
      if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      id v51 = [v50 identifier];
      Swift::Int v52 = sub_100017F88();
      Swift::Int v54 = v53;

      sub_100008FF8(&v174, v52, v54);
      swift_bridgeObjectRelease();
      uint64_t v47 = v153;
      uint64_t v11 = v164;
      (*(void (**)(char *, uint64_t))(v153 + 8))(v26, v164);
    }
    else
    {
      uint64_t v55 = v153;
      (*(void (**)(char *, char *, uint64_t))(v153 + 16))(v24, v26, v11);
      v56 = sub_100017EB8();
      os_log_type_t v57 = sub_100018088();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v172 = swift_slowAlloc();
        uint64_t v174 = v172;
        os_log_t v171 = v56;
        *(_DWORD *)v58 = 136315138;
        uint64_t v59 = sub_100017CC8();
        uint64_t v173 = sub_1000088D4(v59, v60, &v174);
        sub_1000180E8();
        swift_bridgeObjectRelease();
        v61 = *(void (**)(char *, uint64_t))(v55 + 8);
        v61(v24, v164);
        os_log_t v62 = v171;
        _os_log_impl((void *)&_mh_execute_header, v171, v57, "Couldn't create hero descriptor, configuration %s, skipping it", v58, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v11 = v164;
        swift_slowDealloc();
      }
      else
      {

        v61 = *(void (**)(char *, uint64_t))(v55 + 8);
        v61(v24, v11);
      }
      v61(v26, v11);
      uint64_t v47 = v55;
    }
    goto LABEL_22;
  }
  id v41 = v34;
  sub_100017FD8();
  if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_100018008();
  }
  sub_100018018();
  sub_100017FF8();
  id v42 = [v41 identifier];
  Swift::Int v43 = sub_100017F88();
  Swift::Int v45 = v44;

  sub_100008FF8(&v174, v43, v45);
  swift_bridgeObjectRelease();
  uint64_t v47 = v153;
LABEL_22:
  v168 = *(void (***)(char *, uint64_t, uint64_t))(v158 + 16);
  uint64_t v169 = a1;
  if (v168)
  {
    uint64_t v63 = 0;
    v65 = *(NSObject **)(v47 + 16);
    uint64_t v64 = v47 + 16;
    os_log_t v171 = v65;
    v167 = (void (*)(char *, uint64_t, uint64_t))(v158
                                                         + ((*(unsigned __int8 *)(v64 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 64)));
    v160 = (void (**)(char *, uint64_t))(v64 - 8);
    uint64_t v172 = v64;
    uint64_t v161 = *(void *)(v64 + 56);
    *(void *)&long long v46 = 136315138;
    long long v152 = v46;
    v151 = (char *)&type metadata for Any + 8;
    v145[1] = (char *)&type metadata for Swift.AnyObject + 8;
    v66 = v146;
    uint64_t v67 = (uint64_t)v159;
    ((void (*)(char *, void, uint64_t))v65)(v159, v167, v11);
    while (1)
    {
      uint64_t v69 = sub_100017CC8();
      uint64_t v71 = v70;
      v72 = v176;
      if (v176[2])
      {
        v73 = v66;
        sub_100018238();
        swift_bridgeObjectRetain();
        sub_100017FA8();
        Swift::Int v74 = sub_100018248();
        uint64_t v75 = -1 << *((unsigned char *)v72 + 32);
        unint64_t v76 = v74 & ~v75;
        if ((*(void *)((char *)v72 + ((v76 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v76))
        {
          uint64_t v77 = v72[6];
          v78 = (void *)(v77 + 16 * v76);
          BOOL v79 = *v78 == v69 && v78[1] == v71;
          if (v79 || (sub_1000181F8() & 1) != 0)
          {
LABEL_24:
            swift_bridgeObjectRelease();
            v68 = v159;
            (*v160)(v159, v11);
            swift_bridgeObjectRelease();
            a1 = v169;
            v66 = v73;
            uint64_t v67 = (uint64_t)v68;
            goto LABEL_25;
          }
          uint64_t v80 = ~v75;
          while (1)
          {
            unint64_t v76 = (v76 + 1) & v80;
            if (((*(void *)((char *)v72 + ((v76 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v76) & 1) == 0) {
              break;
            }
            v81 = (void *)(v77 + 16 * v76);
            BOOL v82 = *v81 == v69 && v81[1] == v71;
            if (v82 || (sub_1000181F8() & 1) != 0) {
              goto LABEL_24;
            }
          }
        }
        swift_bridgeObjectRelease();
        a1 = v169;
        v66 = v73;
        uint64_t v67 = (uint64_t)v159;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_57;
      }
      swift_bridgeObjectRetain();
      unint64_t v83 = sub_100008F3C(v69, v71);
      if ((v84 & 1) == 0) {
        goto LABEL_56;
      }
      id v85 = *(id *)(*(void *)(a1 + 56) + 8 * v83);
      swift_bridgeObjectRelease();
      unint64_t v86 = sub_100007434(v85);
      if (v86)
      {
        unint64_t v87 = v86;
        if (!*(void *)(v86 + 16) || (unint64_t v88 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000), (v89 & 1) == 0))
        {

LABEL_56:
          swift_bridgeObjectRelease();
          goto LABEL_57;
        }
        uint64_t v90 = *(void *)(*(void *)(v87 + 56) + 8 * v88);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v174 = v90;
        if ((swift_dynamicCast() & 1) != 0 && v173 == 6)
        {
          id v91 = v85;
          sub_100017FD8();
          if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100018008();
          }
          sub_100018018();
          sub_100017FF8();
          sub_100008FF8(&v174, v69, v71);
          goto LABEL_61;
        }
      }

LABEL_57:
      id v91 = sub_100009C34(v69, v71, 0, 1);
      swift_bridgeObjectRetain();
      id v92 = sub_100007D8C(v69, v71, v67, v91);
      swift_bridgeObjectRelease();
      if (!v92)
      {
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t, uint64_t))v171)(v66, v67, v11);
        v95 = sub_100017EB8();
        os_log_type_t v96 = sub_100018088();
        if (os_log_type_enabled(v95, v96))
        {
          uint64_t v97 = swift_slowAlloc();
          uint64_t v174 = swift_slowAlloc();
          *(_DWORD *)uint64_t v97 = v152;
          uint64_t v98 = sub_100017CC8();
          *(void *)(v97 + 4) = sub_1000088D4(v98, v99, &v174);
          swift_bridgeObjectRelease();
          v100 = *v160;
          (*v160)(v66, v164);
          _os_log_impl((void *)&_mh_execute_header, v95, v96, "Couldn't create descriptor for configuration %s, skipping it", (uint8_t *)v97, 0xCu);
          swift_arrayDestroy();
          uint64_t v11 = v164;
          swift_slowDealloc();
          swift_slowDealloc();

          v100((char *)v67, v11);
          a1 = v169;
        }
        else
        {

          v101 = *v160;
          (*v160)(v66, v11);

          v101((char *)v67, v11);
        }
        goto LABEL_25;
      }
      id v93 = v92;
      sub_100017FD8();
      if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      sub_100008FF8(&v174, v69, v71);

LABEL_61:
      swift_bridgeObjectRelease();
      uint64_t v11 = v164;
      if (v175 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v94 = sub_100018198();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v94 = *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      (*v160)((char *)v67, v11);
      if (v94 == 20) {
        break;
      }
LABEL_25:
      if ((void (**)(char *, uint64_t, uint64_t))++v63 == v168) {
        break;
      }
      ((void (*)(uint64_t, char *, uint64_t))v171)(v67, (char *)v167 + v161 * v63, v11);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v102 = sub_100017DF8();
  uint64_t v104 = *(void *)(v102 + 16);
  v105 = v154;
  if (!v104)
  {
    swift_bridgeObjectRelease();
    goto LABEL_100;
  }
  uint64_t v161 = *(int *)(v165 + 48);
  unint64_t v106 = (*(unsigned __int8 *)(v147 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v147 + 80);
  v151 = (char *)v102;
  v107 = (v102 + v106);
  v160 = *(void (***)(char *, uint64_t))(v147 + 72);
  v159 = (char *)(v153 + 32);
  v168 = (void (**)(char *, uint64_t, uint64_t))(v153 + 16);
  uint64_t v158 = v153 + 8;
  *(void *)&long long v103 = 136315138;
  long long v153 = v103;
  *(void *)&long long v152 = (char *)&type metadata for Any + 8;
  v149 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v108 = v157;
  do
  {
    os_log_t v171 = v107;
    uint64_t v172 = v104;
    uint64_t v109 = v162;
    sub_10000A220((uint64_t)v107, v162);
    uint64_t v110 = *(void *)(v109 + v161);
    uint64_t v111 = v165;
    uint64_t v112 = *(int *)(v165 + 48);
    v113 = *(void (**)(char *, char *, uint64_t))v159;
    (*(void (**)(uint64_t, uint64_t, uint64_t))v159)(v108, v109, v11);
    *(void *)(v108 + v112) = v110;
    v114 = *v168;
    v115 = v163;
    (*v168)(v163, v108, v11);
    v116 = v166;
    v113(v166, v115, v11);
    uint64_t v117 = *(int *)(v111 + 48);
    v167 = v114;
    v114(v115, v108, v11);
    uint64_t v118 = v110;
    *(void *)&v115[v117] = v110;
    v119 = *(void (**)(char *, uint64_t))v158;
    (*(void (**)(char *, uint64_t))v158)(v115, v11);
    uint64_t v120 = sub_100017CC8();
    uint64_t v122 = v121;
    uint64_t v123 = (uint64_t)v176;
    swift_bridgeObjectRetain();
    LOBYTE(v113) = sub_100007244(v120, v122, v123);
    swift_bridgeObjectRelease();
    if (v113)
    {
      swift_bridgeObjectRelease();
      v119(v116, v11);
LABEL_72:
      sub_10000B964(v108, &qword_100021900);
      goto LABEL_73;
    }
    uint64_t v124 = (uint64_t)v116;
    if (*(void *)(v169 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v125 = v169;
      unint64_t v126 = sub_100008F3C(v120, v122);
      if (v127)
      {
        id v128 = *(id *)(*(void *)(v125 + 56) + 8 * v126);
        swift_bridgeObjectRelease();
        unint64_t v129 = sub_100007434(v128);
        if (!v129) {
          goto LABEL_86;
        }
        unint64_t v130 = v129;
        if (*(void *)(v129 + 16))
        {
          unint64_t v131 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000);
          if (v132)
          {
            uint64_t v133 = *(void *)(*(void *)(v130 + 56) + 8 * v131);
            swift_unknownObjectRetain();
            swift_bridgeObjectRelease();
            uint64_t v174 = v133;
            if ((swift_dynamicCast() & 1) != 0 && v173 == 6)
            {
              id v134 = v128;
              sub_100017FD8();
              if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_100018008();
              }
              sub_100018018();
              sub_100017FF8();
              sub_100008FF8(&v174, v120, v122);
LABEL_93:

              swift_bridgeObjectRelease();
              uint64_t v11 = v164;
              v119((char *)v124, v164);
              uint64_t v108 = v157;
              goto LABEL_72;
            }
LABEL_86:

            goto LABEL_89;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
LABEL_89:
    id v134 = sub_100009C34(v120, v122, v118, 0);
    swift_bridgeObjectRetain();
    id v135 = sub_100007D8C(v120, v122, v124, v134);
    swift_bridgeObjectRelease();
    if (v135)
    {
      id v136 = v135;
      sub_100017FD8();
      if (*(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v175 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      sub_100008FF8(&v174, v120, v122);

      goto LABEL_93;
    }
    swift_bridgeObjectRelease();
    v137 = v155;
    uint64_t v138 = v164;
    v167(v155, v124, v164);
    uint64_t v139 = v124;
    v140 = sub_100017EB8();
    os_log_type_t v141 = sub_100018088();
    if (os_log_type_enabled(v140, v141))
    {
      uint64_t v142 = swift_slowAlloc();
      uint64_t v174 = swift_slowAlloc();
      *(_DWORD *)uint64_t v142 = v153;
      uint64_t v143 = sub_100017CC8();
      *(void *)(v142 + 4) = sub_1000088D4(v143, v144, &v174);
      swift_bridgeObjectRelease();
      v119(v137, v138);
      _os_log_impl((void *)&_mh_execute_header, v140, v141, "Couldn't create descriptor for configuration %s, skipping it", (uint8_t *)v142, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v119(v166, v138);
    }
    else
    {

      v119(v137, v138);
      v119((char *)v139, v138);
    }
    uint64_t v108 = v157;
    sub_10000B964(v157, &qword_100021900);
    uint64_t v11 = v138;
LABEL_73:
    v107 = ((char *)v160 + (void)v171);
    uint64_t v104 = v172 - 1;
  }
  while (v172 != 1);
  swift_bridgeObjectRelease();
  v105 = v154;
LABEL_100:
  swift_bridgeObjectRelease();
  v105(v175, 0);
  swift_bridgeObjectRelease();
}

uint64_t sub_100007244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_100018238();
    sub_100017FA8();
    Swift::Int v6 = sub_100018248();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1000181F8() & 1) != 0) {
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
          if (v17 || (sub_1000181F8() & 1) != 0) {
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

unint64_t sub_100007434(void *a1)
{
  id v18 = 0;
  id v2 = [a1 loadUserInfoWithError:&v18];
  id v3 = v18;
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = sub_100017F48();
    id v6 = v3;

    unint64_t v7 = sub_100007698(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = v18;
    sub_100017B28();

    swift_willThrow();
    id v9 = a1;
    uint64_t v10 = sub_100017EB8();
    os_log_type_t v11 = sub_100018088();
    if (os_log_type_enabled(v10, v11))
    {
      BOOL v12 = (uint8_t *)swift_slowAlloc();
      id v18 = (id)swift_slowAlloc();
      *(_DWORD *)BOOL v12 = 136315138;
      id v13 = [v9 identifier];
      uint64_t v14 = sub_100017F88();
      unint64_t v16 = v15;

      sub_1000088D4(v14, v16, (uint64_t *)&v18);
      sub_1000180E8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Unable to fetch user info for descriptor %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    return 0;
  }
  return v7;
}

unint64_t sub_100007698(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005AFC(&qword_1000219D0);
    id v2 = (void *)sub_1000181C8();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (v5) {
    goto LABEL_9;
  }
LABEL_10:
  int64_t v13 = v7 + 1;
  if (__OFADD__(v7, 1)) {
    goto LABEL_40;
  }
  if (v13 >= v22) {
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v23 + 8 * v13);
  int64_t v12 = v7 + 1;
  if (!v14)
  {
    int64_t v12 = v7 + 2;
    if (v7 + 2 >= v22) {
      goto LABEL_36;
    }
    unint64_t v14 = *(void *)(v23 + 8 * v12);
    if (!v14)
    {
      int64_t v12 = v7 + 3;
      if (v7 + 3 >= v22) {
        goto LABEL_36;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = v7 + 4;
        if (v7 + 4 >= v22) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v15 = v7 + 5;
          if (v7 + 5 < v22)
          {
            unint64_t v14 = *(void *)(v23 + 8 * v15);
            if (v14)
            {
              int64_t v12 = v7 + 5;
              goto LABEL_25;
            }
            while (1)
            {
              int64_t v12 = v15 + 1;
              if (__OFADD__(v15, 1)) {
                goto LABEL_41;
              }
              if (v12 >= v22) {
                break;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v12);
              ++v15;
              if (v14) {
                goto LABEL_25;
              }
            }
          }
LABEL_36:
          sub_10000B9C0();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_25:
  uint64_t v10 = (v14 - 1) & v14;
  unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
  while (1)
  {
    sub_10000A340(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v30);
    sub_10000B908(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v31 + 8);
    v28[0] = v31[0];
    v28[1] = v31[1];
    uint64_t v29 = v32;
    v27[0] = v30[0];
    v27[1] = v30[1];
    sub_10000A340((uint64_t)v27, (uint64_t)v26);
    if (!swift_dynamicCast())
    {
      sub_10000B964((uint64_t)v27, &qword_1000219D8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_10000B9C0();
      swift_release();
      return 0;
    }
    sub_10000B908((uint64_t)v28 + 8, (uint64_t)v26);
    sub_10000B964((uint64_t)v27, &qword_1000219D8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_35;
    }
    unint64_t v5 = v10;
    unint64_t result = sub_100008F3C(v24, v25);
    unint64_t v16 = result;
    if (v17)
    {
      id v8 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v8 = v24;
      v8[1] = v25;
      uint64_t v9 = v2[7];
      unint64_t result = swift_unknownObjectRelease();
      *(void *)(v9 + 8 * v16) = v24;
      int64_t v7 = v12;
      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v18 = (uint64_t *)(v2[6] + 16 * result);
    *id v18 = v24;
    v18[1] = v25;
    *(void *)(v2[7] + 8 * result) = v24;
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_39;
    }
    v2[2] = v21;
    int64_t v7 = v12;
    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    uint64_t v10 = (v5 - 1) & v5;
    unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
    int64_t v12 = v7;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

id sub_100007A78(void *a1, uint64_t a2)
{
  id v15 = 0;
  id v3 = [a1 storeGalleryOptions:a2 error:&v15];
  if (v3)
  {
    id v4 = v15;
  }
  else
  {
    id v5 = v15;
    sub_100017B28();

    swift_willThrow();
    id v6 = a1;
    int64_t v7 = sub_100017EB8();
    os_log_type_t v8 = sub_100018088();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      id v15 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      id v10 = [v6 identifier];
      uint64_t v11 = sub_100017F88();
      unint64_t v13 = v12;

      sub_1000088D4(v11, v13, (uint64_t *)&v15);
      sub_1000180E8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error storing poster gallery options to descriptor %s", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
  }
  return v3;
}

uint64_t sub_100007C9C()
{
  return sub_100017AF8();
}

id sub_100007D8C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v50 = a4;
  uint64_t v47 = a1;
  uint64_t v48 = a2;
  uint64_t v6 = sub_100017D28();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v51 = v6;
  uint64_t v52 = v7;
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v49 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = sub_100017D48();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100017DC8();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a3;
  uint64_t v21 = sub_100007C9C();
  if (v22 >> 60 == 15)
  {
    uint64_t v24 = v51;
    uint64_t v23 = v52;
    uint64_t v25 = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v49, v20, v51);
    v26 = sub_100017EB8();
    os_log_type_t v27 = sub_100018088();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v28 = 136315138;
      uint64_t v29 = sub_100017CC8();
      uint64_t v53 = sub_1000088D4(v29, v30, &v54);
      sub_1000180E8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v24);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Couldn't encode configuration %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v24);
    }
    return 0;
  }
  else
  {
    unint64_t v31 = v22;
    uint64_t v46 = v21;
    id v49 = v4;
    sub_100017CB8();
    sub_100017D78();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    Class isa = sub_100017D38().super.isa;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    sub_1000180B8();
    double v34 = v33;

    uint64_t v35 = v52;
    uint64_t v36 = v20;
    uint64_t v37 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v11, v36, v51);
    if (v48)
    {
      uint64_t v38 = v48;
      uint64_t v39 = v47;
    }
    else
    {
      uint64_t v39 = sub_100017CC8();
      uint64_t v38 = v41;
    }
    id v42 = *(void (**)(char *, uint64_t))(v35 + 8);
    swift_bridgeObjectRetain();
    v42(v11, v37);
    uint64_t v43 = v46;
    id v40 = sub_100008208(v34, v39, v38, v46, v31, v50);
    swift_bridgeObjectRelease();
    sub_10000BA1C(v43, v31);
  }
  return v40;
}

id sub_100008208(double a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, void *a6)
{
  swift_bridgeObjectRetain();
  NSString v10 = sub_100017F78();
  swift_bridgeObjectRelease();
  id v11 = [self mutableDescriptorWithIdentifier:v10];

  id v12 = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:PRTimeFontIdentifierRounded];
  sub_100005AFC(&qword_1000219A0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100018AB0;
  *(void *)(v13 + 32) = [self vibrantMonochromeColor];
  sub_100017FF8();
  sub_10000A4A0(0, &qword_1000219A8);
  Class isa = sub_100017FE8().super.isa;
  swift_bridgeObjectRelease();
  [v11 setPreferredTitleColors:isa];

  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100018AB0;
  *(void *)(v15 + 32) = v12;
  sub_100017FF8();
  sub_10000A4A0(0, (unint64_t *)&unk_1000219B0);
  id v16 = v12;
  Class v17 = sub_100017FE8().super.isa;
  swift_bridgeObjectRelease();
  [v11 setPreferredTimeFontConfigurations:v17];

  [v11 setLuminance:a1];
  sub_100005AFC(&qword_100021BE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100018970;
  sub_100018128();
  *(void *)(inited + 96) = &type metadata for Data;
  *(void *)(inited + 72) = a4;
  *(void *)(inited + 80) = a5;
  v27[1] = (id)0xE700000000000000;
  sub_10000A3F0(a4, a5);
  sub_100018128();
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = 6;
  sub_10000BA88(inited);
  Class v19 = sub_100017F38().super.isa;
  swift_bridgeObjectRelease();
  v27[0] = 0;
  LODWORD(a4) = [v11 storeUserInfo:v19 error:v27];

  if (a4)
  {
    id v20 = v27[0];
    if (a6)
    {
      id v21 = a6;
      sub_100007A78(v11, (uint64_t)v21);
    }
  }
  else
  {
    id v22 = v27[0];
    sub_100017B28();

    swift_willThrow();
    uint64_t v23 = sub_100017EB8();
    os_log_type_t v24 = sub_100018088();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Error storing user info", v25, 2u);
      swift_slowDealloc();
    }

    swift_errorRelease();
    return 0;
  }
  return v11;
}

uint64_t EmojiAssetUpdater.updateConfiguration(_:completion:)(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(a1, 0);
}

id EmojiAssetUpdater.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmojiAssetUpdater();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000087E8(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000087F8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100008834(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000885C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1000088D4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1000180E8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1000088D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000089A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B908((uint64_t)v12, *a3);
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
      sub_10000B908((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000B9C8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000089A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000180F8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100008B64(a5, a6);
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
  uint64_t v8 = sub_100018178();
  if (!v8)
  {
    sub_100018188();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000181D8();
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

uint64_t sub_100008B64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008BFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008DDC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008DDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008BFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100008D74(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100018158();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100018188();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100017FC8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000181D8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100018188();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100008D74(uint64_t a1, uint64_t a2)
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
  sub_100005AFC(&qword_1000219E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100008DDC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005AFC(&qword_1000219E8);
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
  uint64_t result = sub_1000181D8();
  __break(1u);
  return result;
}

unsigned char **sub_100008F2C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_100008F3C(uint64_t a1, uint64_t a2)
{
  sub_100018238();
  sub_100017FA8();
  Swift::Int v4 = sub_100018248();
  return sub_100009A88(a1, a2, v4);
}

unint64_t sub_100008FB4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100018108(*(void *)(v2 + 40));
  return sub_100009B6C(a1, v4);
}

uint64_t sub_100008FF8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100018238();
  swift_bridgeObjectRetain();
  sub_100017FA8();
  Swift::Int v8 = sub_100018248();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1000181F8() & 1) != 0)
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1000181F8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100009488(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000091A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005AFC(&qword_1000219E0);
  uint64_t v3 = sub_100018148();
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
      sub_100018238();
      sub_100017FA8();
      uint64_t result = sub_100018248();
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
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100009488(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_1000091A8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100009624();
      goto LABEL_22;
    }
    sub_1000097D8();
  }
  uint64_t v11 = *v4;
  sub_100018238();
  sub_100017FA8();
  uint64_t result = sub_100018248();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1000181F8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100018208();
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
          uint64_t result = sub_1000181F8();
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

void *sub_100009624()
{
  uint64_t v1 = v0;
  sub_100005AFC(&qword_1000219E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018138();
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
    void *v19 = *v17;
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

uint64_t sub_1000097D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005AFC(&qword_1000219E0);
  uint64_t v3 = sub_100018148();
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
    sub_100018238();
    swift_bridgeObjectRetain();
    sub_100017FA8();
    uint64_t result = sub_100018248();
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
    *int64_t v13 = v20;
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

unint64_t sub_100009A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000181F8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000181F8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100009B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000A340(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100018118();
      sub_10000A39C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_100009C34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  BOOL v6 = a1 == 1869768040 && a2 == 0xE400000000000000;
  if (v6 || (sub_1000181F8() & 1) != 0)
  {
    id v9 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
    [v9 setHero:1];
    if (a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ((a1 != 0x6F6C436568546E69 || a2 != 0xEB00000000736475)
    && (sub_1000181F8() & 1) == 0
    && (a1 != 0x7963697073 || a2 != 0xE500000000000000)
    && (sub_1000181F8() & 1) == 0
    && (a1 != 0x65727574616ELL || a2 != 0xE600000000000000)
    && (sub_1000181F8() & 1) == 0
    && (a1 != 0x73696E6E6574 || a2 != 0xE600000000000000)
    && (sub_1000181F8() & 1) == 0
    && (a1 != 0x77696B7265746177 || a2 != 0xEB000000006F6769)
    && (sub_1000181F8() & 1) == 0
    && (a1 != 0x7361666B61657262 || a2 != 0xE900000000000074)
    && (sub_1000181F8() & 1) == 0)
  {
    id v9 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
    if (a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v9 = [objc_allocWithZone((Class)ATXPosterDescriptorGalleryOptions) init];
  id v10 = objc_allocWithZone((Class)ATXComplication);
  NSString v11 = sub_100017F78();
  NSString v12 = sub_100017F78();
  NSString v13 = sub_100017F78();
  id v14 = [v10 initWithExtensionBundleIdentifier:v11 kind:v12 containerBundleIdentifier:v13 widgetFamily:12 intent:0 source:5];

  [v9 setInlineComplication:v14];
  if ((a4 & 1) == 0)
  {
LABEL_12:
    [v9 setFocus:a3];
    [v9 setOnlyEligibleForMadeForFocusSection:1];
  }
LABEL_13:
  [v9 setAllowsSystemSuggestedComplications:0];
  return v9;
}

uint64_t sub_10000A220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005AFC(&qword_100021900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A288()
{
  return type metadata accessor for EmojiAssetUpdater();
}

uint64_t sub_10000A290()
{
  uint64_t result = sub_100017ED8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000A340(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000A39C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000A3F0(uint64_t a1, unint64_t a2)
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

unint64_t sub_10000A448()
{
  unint64_t result = qword_1000219C0;
  if (!qword_1000219C0)
  {
    sub_100017D28();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000219C0);
  }
  return result;
}

uint64_t sub_10000A4A0(uint64_t a1, unint64_t *a2)
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

void sub_10000A4DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v169 = sub_100005AFC(&qword_100021900);
  long long v153 = *(char **)(v169 - 8);
  uint64_t v6 = __chkstk_darwin(v169);
  v167 = (char *)v151 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v161 = (uint64_t)v151 - v9;
  __chkstk_darwin(v8);
  uint64_t v166 = (uint64_t)v151 - v10;
  uint64_t v11 = sub_100017D28();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v151 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v165 = (uint64_t)v151 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v159 = (char *)v151 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v170 = (char *)v151 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  unint64_t v24 = (char *)v151 - v23;
  __chkstk_darwin(v22);
  unint64_t v26 = (char *)v151 - v25;
  uint64_t v174 = a2;
  uint64_t v160 = a2 + OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_logger;
  BOOL v27 = sub_100017EB8();
  os_log_type_t v28 = sub_100018078();
  if (os_log_type_enabled(v27, v28))
  {
    int64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Updating descriptors...", v29, 2u);
    swift_slowDealloc();
  }

  unint64_t v180 = (unint64_t)&_swiftEmptyArrayStorage;
  v181 = &_swiftEmptySetSingleton;
  uint64_t v162 = *(void (***)(char *, uint64_t))(v174
                                                 + OBJC_IVAR____TtC20EmojiPosterExtension17EmojiAssetUpdater_configurationProvider);
  *(void *)&long long v157 = sub_100017DE8();
  uint64_t v30 = *(void *)(a1 + 16);
  uint64_t v168 = v11;
  uint64_t v158 = a3;
  if (!v30 || (unint64_t v31 = sub_100008F3C(1869768040, 0xE400000000000000), (v32 & 1) == 0))
  {
    id v154 = 0;
    goto LABEL_14;
  }
  id v154 = *(id *)(*(void *)(a1 + 56) + 8 * v31);
  id v33 = v154;
  unint64_t v34 = sub_100007434(v33);
  if (!v34) {
    goto LABEL_102;
  }
  unint64_t v35 = v34;
  if (!*(void *)(v34 + 16) || (unint64_t v36 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000), (v37 & 1) == 0))
  {

    swift_bridgeObjectRelease();
LABEL_14:
    sub_100017DD8();
    id v47 = sub_100009C34(1869768040, 0xE400000000000000, 0, 1);
    id v48 = sub_100007D8C(1869768040, 0xE400000000000000, (uint64_t)v26, v47);
    if (v48)
    {
      uint64_t v49 = v12;
      id v50 = v15;
      uint64_t v51 = v26;
      id v52 = v48;
      sub_100017FD8();
      if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      id v53 = [v52 identifier];
      Swift::Int v54 = sub_100017F88();
      Swift::Int v56 = v55;

      sub_100008FF8(&v179, v54, v56);
      swift_bridgeObjectRelease();
      uint64_t v46 = v49;
      uint64_t v11 = v168;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v51, v168);
      unint64_t v15 = v50;
      a3 = v158;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v24, v26, v11);
      os_log_type_t v57 = sub_100017EB8();
      uint64_t v46 = v12;
      os_log_type_t v58 = sub_100018088();
      os_log_t v177 = v57;
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        uint64_t v175 = swift_slowAlloc();
        uint64_t v179 = v175;
        *(_DWORD *)uint64_t v59 = 136315138;
        v163 = v15;
        v176 = v26;
        uint64_t v60 = sub_100017CC8();
        uint64_t v178 = sub_1000088D4(v60, v61, &v179);
        sub_1000180E8();
        swift_bridgeObjectRelease();
        os_log_t v62 = *(void (**)(char *, uint64_t))(v46 + 8);
        v62(v24, v168);
        os_log_t v63 = v177;
        _os_log_impl((void *)&_mh_execute_header, v177, v58, "Couldn't create hero descriptor, configuration %s, skipping it", v59, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v11 = v168;
        swift_slowDealloc();

        uint64_t v64 = v163;
        v62(v176, v11);
        unint64_t v15 = v64;
      }
      else
      {

        v65 = *(void (**)(char *, uint64_t))(v46 + 8);
        v65(v24, v11);

        v65(v26, v11);
      }
    }
    goto LABEL_21;
  }
  uint64_t v38 = *(void *)(*(void *)(v35 + 56) + 8 * v36);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v179 = v38;
  if ((swift_dynamicCast() & 1) == 0 || v178 != 6)
  {
LABEL_102:

    goto LABEL_14;
  }
  uint64_t v39 = v12;
  id v40 = v33;
  sub_100017FD8();
  if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_100018008();
  }
  sub_100018018();
  sub_100017FF8();
  id v41 = [v40 identifier];
  Swift::Int v42 = sub_100017F88();
  Swift::Int v44 = v43;

  sub_100008FF8(&v179, v42, v44);
  swift_bridgeObjectRelease();
  uint64_t v46 = v39;
LABEL_21:
  uint64_t v66 = *(void *)(v157 + 16);
  uint64_t v173 = a1;
  uint64_t v164 = v66;
  if (v66)
  {
    v163 = v15;
    uint64_t v67 = 0;
    uint64_t v152 = v46;
    v68 = *(char **)(v46 + 16);
    uint64_t v175 = v157 + ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80));
    v176 = v68;
    os_log_t v177 = (os_log_t)(v46 + 16);
    uint64_t v69 = *(void (***)(char *, uint64_t, uint64_t))(v46 + 72);
    os_log_t v171 = (void (**)(char *, uint64_t))(v46 + 8);
    uint64_t v172 = v69;
    *(void *)&long long v45 = 136315138;
    long long v156 = v45;
    v155 = (char *)&type metadata for Any + 8;
    v151[1] = (char *)&type metadata for Swift.AnyObject + 8;
    uint64_t v70 = v165;
    uint64_t v71 = v164;
    ((void (*)(uint64_t, uint64_t, uint64_t))v68)(v165, v175, v11);
    while (1)
    {
      uint64_t v72 = sub_100017CC8();
      uint64_t v74 = v73;
      uint64_t v75 = v181;
      if (v181[2])
      {
        sub_100018238();
        swift_bridgeObjectRetain();
        sub_100017FA8();
        Swift::Int v76 = sub_100018248();
        uint64_t v77 = -1 << *((unsigned char *)v75 + 32);
        unint64_t v78 = v76 & ~v77;
        if ((*(void *)((char *)v75 + ((v78 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v78))
        {
          uint64_t v79 = v75[6];
          uint64_t v80 = (void *)(v79 + 16 * v78);
          BOOL v81 = *v80 == v72 && v80[1] == v74;
          if (v81 || (sub_1000181F8() & 1) != 0)
          {
LABEL_23:
            swift_bridgeObjectRelease();
            uint64_t v70 = v165;
            (*v171)((char *)v165, v11);
            swift_bridgeObjectRelease();
            a1 = v173;
            goto LABEL_24;
          }
          uint64_t v82 = ~v77;
          while (1)
          {
            unint64_t v78 = (v78 + 1) & v82;
            if (((*(void *)((char *)v75 + ((v78 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v78) & 1) == 0) {
              break;
            }
            unint64_t v83 = (void *)(v79 + 16 * v78);
            BOOL v84 = *v83 == v72 && v83[1] == v74;
            if (v84 || (sub_1000181F8() & 1) != 0) {
              goto LABEL_23;
            }
          }
        }
        swift_bridgeObjectRelease();
        a1 = v173;
        uint64_t v70 = v165;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_56;
      }
      swift_bridgeObjectRetain();
      unint64_t v85 = sub_100008F3C(v72, v74);
      if ((v86 & 1) == 0) {
        goto LABEL_55;
      }
      id v87 = *(id *)(*(void *)(a1 + 56) + 8 * v85);
      swift_bridgeObjectRelease();
      unint64_t v88 = sub_100007434(v87);
      if (v88)
      {
        unint64_t v89 = v88;
        if (!*(void *)(v88 + 16) || (unint64_t v90 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000), (v91 & 1) == 0))
        {

LABEL_55:
          swift_bridgeObjectRelease();
          goto LABEL_56;
        }
        uint64_t v92 = *(void *)(*(void *)(v89 + 56) + 8 * v90);
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v179 = v92;
        if ((swift_dynamicCast() & 1) != 0 && v178 == 6)
        {
          id v93 = v87;
          sub_100017FD8();
          if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100018008();
          }
          sub_100018018();
          sub_100017FF8();
          sub_100008FF8(&v179, v72, v74);
          goto LABEL_60;
        }
      }

LABEL_56:
      id v93 = sub_100009C34(v72, v74, 0, 1);
      swift_bridgeObjectRetain();
      id v94 = sub_100007D8C(v72, v74, v70, v93);
      swift_bridgeObjectRelease();
      if (!v94)
      {
        swift_bridgeObjectRelease();
        uint64_t v97 = v70;
        uint64_t v98 = v163;
        ((void (*)(void, uint64_t, uint64_t))v176)(v163, v97, v11);
        unint64_t v99 = sub_100017EB8();
        os_log_type_t v100 = sub_100018088();
        if (os_log_type_enabled(v99, v100))
        {
          uint64_t v101 = swift_slowAlloc();
          uint64_t v179 = swift_slowAlloc();
          *(_DWORD *)uint64_t v101 = v156;
          uint64_t v102 = sub_100017CC8();
          *(void *)(v101 + 4) = sub_1000088D4(v102, v103, &v179);
          swift_bridgeObjectRelease();
          uint64_t v104 = *v171;
          (*v171)((char *)v98, v168);
          _os_log_impl((void *)&_mh_execute_header, v99, v100, "Couldn't create descriptor for configuration %s, skipping it", (uint8_t *)v101, 0xCu);
          swift_arrayDestroy();
          uint64_t v11 = v168;
          swift_slowDealloc();
          swift_slowDealloc();

          v104((char *)v97, v11);
          a1 = v173;
        }
        else
        {

          v105 = *v171;
          (*v171)((char *)v98, v11);

          v105((char *)v97, v11);
        }
        uint64_t v70 = v97;
        uint64_t v71 = v164;
        goto LABEL_24;
      }
      id v95 = v94;
      sub_100017FD8();
      if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      sub_100008FF8(&v179, v72, v74);

LABEL_60:
      swift_bridgeObjectRelease();
      uint64_t v11 = v168;
      if (v180 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v96 = sub_100018198();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v96 = *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      (*v171)((char *)v70, v11);
      if (v96 == 20)
      {
LABEL_69:
        swift_bridgeObjectRelease();
        uint64_t v46 = v152;
        a3 = v158;
        goto LABEL_71;
      }
LABEL_24:
      if (++v67 == v71) {
        goto LABEL_69;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t))v176)(v70, v175 + (void)v172 * v67, v11);
    }
  }
  swift_bridgeObjectRelease();
LABEL_71:
  uint64_t v106 = sub_100017DF8();
  uint64_t v108 = *(NSObject **)(v106 + 16);
  if (!v108)
  {
    swift_bridgeObjectRelease();
    goto LABEL_101;
  }
  uint64_t v165 = *(int *)(v169 + 48);
  unint64_t v109 = (v153[80] + 32) & ~(unint64_t)v153[80];
  v155 = (char *)v106;
  uint64_t v110 = v106 + v109;
  uint64_t v164 = *((void *)v153 + 9);
  v163 = (void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
  uint64_t v172 = (void (**)(char *, uint64_t, uint64_t))(v46 + 16);
  uint64_t v162 = (void (**)(char *, uint64_t))(v46 + 8);
  *(void *)&long long v107 = 136315138;
  long long v157 = v107;
  *(void *)&long long v156 = (char *)&type metadata for Any + 8;
  long long v153 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v111 = v161;
  do
  {
    v176 = (char *)v110;
    os_log_t v177 = v108;
    uint64_t v112 = v166;
    sub_10000A220(v110, v166);
    uint64_t v175 = *(void *)(v112 + v165);
    uint64_t v113 = v175;
    uint64_t v114 = v169;
    uint64_t v115 = *(int *)(v169 + 48);
    v116 = *v163;
    (*v163)(v111, v112, v11);
    *(void *)(v111 + v115) = v113;
    uint64_t v117 = *v172;
    uint64_t v118 = v167;
    (*v172)(v167, v111, v11);
    v119 = v170;
    v116((uint64_t)v170, (uint64_t)v118, v11);
    uint64_t v120 = *(int *)(v114 + 48);
    os_log_t v171 = (void (**)(char *, uint64_t))v117;
    v117(v118, v111, v11);
    uint64_t v121 = v175;
    *(void *)&v118[v120] = v175;
    uint64_t v122 = *v162;
    (*v162)(v118, v11);
    uint64_t v123 = sub_100017CC8();
    uint64_t v125 = v124;
    uint64_t v126 = (uint64_t)v181;
    swift_bridgeObjectRetain();
    LOBYTE(v116) = sub_100007244(v123, v125, v126);
    swift_bridgeObjectRelease();
    if (v116)
    {
      swift_bridgeObjectRelease();
      v122(v119, v11);
LABEL_74:
      sub_10000B964(v111, &qword_100021900);
      goto LABEL_75;
    }
    uint64_t v127 = (uint64_t)v119;
    if (*(void *)(v173 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v128 = v173;
      unint64_t v129 = sub_100008F3C(v123, v125);
      if ((v130 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_90;
      }
      id v131 = *(id *)(*(void *)(v128 + 56) + 8 * v129);
      swift_bridgeObjectRelease();
      unint64_t v132 = sub_100007434(v131);
      if (!v132) {
        goto LABEL_88;
      }
      unint64_t v133 = v132;
      if (*(void *)(v132 + 16))
      {
        unint64_t v134 = sub_100008F3C(0x6E6F6973726576, 0xE700000000000000);
        if (v135)
        {
          uint64_t v136 = *(void *)(*(void *)(v133 + 56) + 8 * v134);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          uint64_t v179 = v136;
          if ((swift_dynamicCast() & 1) != 0 && v178 == 6)
          {
            id v137 = v131;
            sub_100017FD8();
            if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_100018008();
            }
            sub_100018018();
            sub_100017FF8();
            sub_100008FF8(&v179, v123, v125);
LABEL_94:

            swift_bridgeObjectRelease();
            uint64_t v11 = v168;
            v122((char *)v127, v168);
            uint64_t v111 = v161;
            goto LABEL_74;
          }
LABEL_88:

          goto LABEL_90;
        }
      }

      swift_bridgeObjectRelease();
    }
LABEL_90:
    id v137 = sub_100009C34(v123, v125, v121, 0);
    swift_bridgeObjectRetain();
    id v138 = sub_100007D8C(v123, v125, v127, v137);
    swift_bridgeObjectRelease();
    if (v138)
    {
      id v139 = v138;
      sub_100017FD8();
      if (*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100018008();
      }
      sub_100018018();
      sub_100017FF8();
      sub_100008FF8(&v179, v123, v125);

      goto LABEL_94;
    }
    swift_bridgeObjectRelease();
    v140 = v159;
    uint64_t v141 = v168;
    ((void (*)(char *, uint64_t, uint64_t))v171)(v159, v127, v168);
    uint64_t v142 = v127;
    uint64_t v143 = sub_100017EB8();
    os_log_type_t v144 = sub_100018088();
    if (os_log_type_enabled(v143, v144))
    {
      v145 = v122;
      v146 = v140;
      uint64_t v147 = swift_slowAlloc();
      uint64_t v179 = swift_slowAlloc();
      *(_DWORD *)uint64_t v147 = v157;
      uint64_t v148 = sub_100017CC8();
      *(void *)(v147 + 4) = sub_1000088D4(v148, v149, &v179);
      swift_bridgeObjectRelease();
      v145(v146, v141);
      _os_log_impl((void *)&_mh_execute_header, v143, v144, "Couldn't create descriptor for configuration %s, skipping it", (uint8_t *)v147, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v145(v170, v141);
    }
    else
    {

      v122(v140, v141);
      v122((char *)v142, v141);
    }
    uint64_t v111 = v161;
    sub_10000B964(v161, &qword_100021900);
    uint64_t v11 = v141;
LABEL_75:
    uint64_t v110 = (uint64_t)&v176[v164];
    uint64_t v108 = (os_log_t)((char *)v177 - 1);
  }
  while (v177 != (os_log_t)1);
  swift_bridgeObjectRelease();
  a3 = v158;
LABEL_101:
  swift_bridgeObjectRelease();
  sub_10000A4A0(0, &qword_1000219C8);
  Class isa = sub_100017FE8().super.isa;
  (*(void (**)(uint64_t, Class, void))(a3 + 16))(a3, isa, 0);
  swift_bridgeObjectRelease();
}

uint64_t sub_10000B908(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B964(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005AFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B9C0()
{
  return swift_release();
}

uint64_t sub_10000B9C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000BA1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000BA30(a1, a2);
  }
  return a1;
}

uint64_t sub_10000BA30(uint64_t a1, unint64_t a2)
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

unint64_t sub_10000BA88(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005AFC(&qword_100021BE8);
  uint64_t v2 = sub_1000181C8();
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
    sub_100014CC0(v6, (uint64_t)v15, &qword_100021BF0);
    unint64_t result = sub_100008FB4((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100014D24(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_10000BBCC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100017DC8();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100005AFC(&qword_100021B98);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  char v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void **)(v1
                + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v10 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration;
  swift_beginAccess();
  sub_100014CC0(v10, (uint64_t)v8, &qword_100021B98);
  id v11 = v9;
  sub_100017C08();

  uint64_t v12 = *(void **)(v1
                 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
  if (!v12)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  sub_100014CC0(v10, (uint64_t)v6, &qword_100021B98);
  uint64_t v13 = sub_100017D28();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, v13) != 1)
  {
    id v15 = v12;
    sub_100017CB8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v13);
    sub_100017E48();

    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_10000BDD8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005AFC(&qword_100021B98);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v11 = (char *)&v25 - v10;
  uint64_t v12 = *(void **)(v3 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer);
  *(void *)(v3 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer) = a1;
  id v13 = a1;

  sub_100017C78();
  swift_allocObject();
  uint64_t v14 = sub_100017C68();
  uint64_t v15 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emojiRenderer;
  *(void *)(v3 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emojiRenderer) = v14;
  uint64_t result = swift_release();
  if (*(void *)(v3 + v15))
  {
    id v17 = objc_allocWithZone((Class)sub_100017C48());
    swift_retain();
    uint64_t v18 = sub_100017C18();
    uint64_t v19 = *(void **)(v3
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
    *(void *)(v3
              + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController) = v18;

    sub_100017E58();
    id v20 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v21 = *(void **)(v3
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
    *(void *)(v3
              + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController) = v20;

    swift_getObjectType();
    *(void *)(v3
              + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_currentDeviceInterfaceOrientation) = sub_1000153A8();
    sub_10000C0AC(a2, (uint64_t)v11);
    uint64_t v22 = sub_100017D28();
    uint64_t v23 = *(void *)(v22 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v11, 0, 1, v22);
    uint64_t v24 = v3 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration;
    swift_beginAccess();
    sub_100017A34((uint64_t)v11, v24);
    swift_endAccess();
    sub_10000BBCC();
    sub_10000B964((uint64_t)v11, &qword_100021B98);
    sub_100014CC0(v24, (uint64_t)v9, &qword_100021B98);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v9, 1, v22);
    if (result != 1)
    {
      sub_10000C4DC((uint64_t)v9, v13, a2);
      return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v22);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C0AC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100017D28();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 contents];
  v25[0] = 0;
  id v9 = [v8 loadUserInfoWithError:v25];
  swift_unknownObjectRelease();
  id v10 = v25[0];
  if (v9)
  {
    uint64_t v11 = sub_100017F48();
    id v12 = v10;

    *(void *)&long long v23 = 0xD000000000000012;
    *((void *)&v23 + 1) = 0x8000000100018FA0;
    sub_100018128();
    if (*(void *)(v11 + 16) && (unint64_t v13 = sub_100008FB4((uint64_t)v25), (v14 & 1) != 0))
    {
      sub_10000B908(*(void *)(v11 + 56) + 32 * v13, (uint64_t)&v23);
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v24 + 1))
    {
      sub_10000A39C((uint64_t)v25);
      sub_100014D24(&v23, &v26);
      swift_dynamicCast();
      uint64_t v16 = v22[2];
      unint64_t v17 = v22[3];
      sub_100017AD8();
      swift_allocObject();
      sub_10000A3F0(v16, v17);
      sub_100017AC8();
      sub_100014C78(&qword_100021BF8, (void (*)(uint64_t))&type metadata accessor for EmojiPosterConfiguration);
      sub_100017AB8();
      sub_10000BA30(v16, v17);
      sub_10000BA30(v16, v17);
      swift_release();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v18 = v25[0];
    sub_100017B28();

    swift_willThrow();
    uint64_t v19 = sub_100017EB8();
    uint64_t v20 = sub_100018088();
    if (os_log_type_enabled(v19, (os_log_type_t)v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, (os_log_type_t)v20, "Error loading user info contents", v21, 2u);
      swift_slowDealloc();
    }

    sub_10000CAA8(a2);
    return swift_errorRelease();
  }
  return result;
}

void sub_10000C4DC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  id v63 = a3;
  uint64_t v7 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100017D28();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  uint64_t v12 = v4 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration;
  swift_beginAccess();
  sub_100017A34((uint64_t)v9, v12);
  swift_endAccess();
  sub_10000BBCC();
  sub_10000B964((uint64_t)v9, &qword_100021B98);
  id v13 = [a2 backgroundView];
  id v14 = [v13 window];

  uint64_t v15 = &selRef_solidColorHomeScreenColorPickerConfigurationForEditor_;
  if (v14
    && (id v16 = [v14 rootViewController], v14, v16))
  {
    uint64_t v17 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController;
    if (!*(void *)(v4
                    + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    objc_msgSend(v16, "addChildViewController:");
    id v18 = [a2 backgroundView];
    uint64_t v19 = *(void **)(v4 + v17);
    if (!v19)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    id v20 = [v19 view];
    if (!v20)
    {
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    uint64_t v21 = v20;
    [v18 addSubview:v20];

    uint64_t v22 = *(void **)(v4 + v17);
    if (!v22)
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    [v22 didMoveToParentViewController:v16];
    uint64_t v15 = &selRef_solidColorHomeScreenColorPickerConfigurationForEditor_;
  }
  else
  {
    id v23 = objc_msgSend(a2, "backgroundView", v63);
    long long v24 = *(void **)(v4
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
    if (!v24)
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    id v25 = [v24 view];
    if (!v25)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    id v16 = v25;
    [v23 addSubview:v25];
  }
  uint64_t v26 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController;
  BOOL v27 = *(void **)(v4
                 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
  if (!v27)
  {
    __break(1u);
    goto LABEL_32;
  }
  id v28 = [v27 view];
  if (!v28)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int64_t v29 = v28;
  id v30 = [a2 backgroundView];
  sub_100016A1C(v29, v30);

  id v31 = [a2 foregroundView];
  id v32 = [v31 window];

  if (!v32 || (id v33 = [v32 v15[84]], v32, !v33))
  {
    id v40 = objc_msgSend(a2, "foregroundView", v63);
    id v41 = *(void **)(v4
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
    if (!v41)
    {
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    id v42 = [v41 view];
    if (!v42)
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    id v33 = v42;
    [v40 addSubview:v42];

LABEL_23:
    uint64_t v43 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController;
    Swift::Int v44 = *(void **)(v4
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
    if (v44)
    {
      id v45 = [v44 view];
      if (v45)
      {
        uint64_t v46 = v45;
        id v47 = [a2 foregroundView];
        sub_100016A1C(v46, v47);

        id v48 = v63;
        [v63 backlightProgress];
        id v50 = *(void **)(v4 + v43);
        if (v50)
        {
          uint64_t v51 = v49;
          id v52 = v50;
          sub_100017BE8();

          id v53 = *(void **)(v4 + v26);
          if (v53)
          {
            id v54 = v53;
            sub_100017E28();

            *(void *)(v4 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_wakeProgress) = v51;
            [v48 unlockProgress];
            Swift::Int v56 = *(void **)(v4 + v43);
            if (v56)
            {
              uint64_t v57 = v55;
              id v58 = v56;
              sub_100017C28();

              uint64_t v59 = *(void **)(v4 + v26);
              if (v59)
              {
                id v60 = v59;
                sub_100017E38();

                *(void *)(v4
                          + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_unlockProgress) = v57;
                unint64_t v61 = *(void **)(v4 + v43);
                if (v61)
                {
                  id v62 = v61;
                  sub_100017C38();

                  return;
                }
                goto LABEL_39;
              }
LABEL_38:
              __break(1u);
LABEL_39:
              __break(1u);
              goto LABEL_40;
            }
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v34 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController;
  if (!*(void *)(v4
                  + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  objc_msgSend(v33, "addChildViewController:");
  id v35 = [a2 foregroundView];
  unint64_t v36 = *(void **)(v4 + v34);
  if (!v36)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  id v37 = [v36 view];
  if (!v37)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v38 = v37;
  [v35 addSubview:v37];

  uint64_t v39 = *(void **)(v4 + v34);
  if (v39)
  {
    [v39 didMoveToParentViewController:v33];
    goto LABEL_23;
  }
LABEL_51:
  __break(1u);
}

uint64_t sub_10000CAA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017E18();
  swift_allocObject();
  sub_100017E08();
  uint64_t v5 = sub_100017DE8();
  swift_release();
  uint64_t v6 = *(void *)(v5 + 16);
  uint64_t v7 = sub_100017D28();
  uint64_t v8 = *(void *)(v7 - 8);
  if (v6)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v4, v5 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v4, 1, 1, v7);
  }
  swift_bridgeObjectRelease();
  sub_100017D28();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a1, v4, v7);
  }
  __break(1u);
  return result;
}

id sub_10000CD78()
{
  uint64_t v1 = v0;
  sub_100017EC8();
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_currentDeviceInterfaceOrientation] = 1;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emojiRenderer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_wakeProgress] = 0x3FF0000000000000;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_unlockProgress] = 0;
  uint64_t v2 = &v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration];
  uint64_t v3 = sub_100017D28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer] = 0;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for EmojiPosterExtensionRenderingController(0);
  return objc_msgSendSuper2(&v5, "init");
}

id sub_10000CEDC()
{
  return sub_1000140B4(type metadata accessor for EmojiPosterExtensionRenderingController);
}

uint64_t sub_10000CFBC()
{
  return type metadata accessor for EmojiPosterExtensionRenderingController(0);
}

uint64_t type metadata accessor for EmojiPosterExtensionRenderingController(uint64_t a1)
{
  return sub_1000141F4(a1, (uint64_t *)&unk_100021AD8);
}

void sub_10000CFE4()
{
  sub_100017ED8();
  if (v0 <= 0x3F)
  {
    sub_10000D0D0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10000D0D0()
{
  if (!qword_100021AE8)
  {
    sub_100017D28();
    unint64_t v0 = sub_1000180D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100021AE8);
    }
  }
}

uint64_t sub_10000D128(void *a1, void *a2)
{
  uint64_t v3 = v2;
  objc_super v5 = *(void **)(v2 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor);
  *(void *)(v3 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor) = a1;
  id v6 = a1;

  sub_100017C78();
  swift_allocObject();
  *(void *)(v3 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_emojiRenderer) = sub_100017C68();
  swift_release();
  swift_getObjectType();
  *(void *)(v3
            + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_currentDeviceInterfaceOrientation) = sub_1000153A8();
  return sub_10000D3F4(a2);
}

void sub_10000D1EC(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a1;
  a5(v8, a4);

  swift_unknownObjectRelease();
}

void sub_10000D274(void *a1)
{
  id v2 = objc_msgSend(objc_msgSend(a1, "environment"), "sourceContents");
  swift_unknownObjectRelease();
  id v3 = [v2 descriptorIdentifier];
  swift_unknownObjectRelease();
  if (v3)
  {
    uint64_t v4 = sub_100017F88();
    uint64_t v6 = v5;

    if (v4 == 1869768040 && v6 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v8 = sub_1000181F8();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0) {
        return;
      }
    }
    sub_10000FB5C(a1);
  }
}

uint64_t sub_10000D3F4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100017D48();
  uint64_t v42 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v41 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100017DC8();
  uint64_t v39 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100017D28();
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  id v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v16 = (char *)&v37 - v15;
  id v17 = [a1 sourceContents];
  v48[0] = 0;
  id v18 = [v17 loadUserInfoWithError:v48];
  swift_unknownObjectRelease();
  id v19 = v48[0];
  if (v18)
  {
    uint64_t v43 = v2;
    uint64_t v20 = sub_100017F48();
    id v21 = v19;

    *(void *)&long long v46 = 0xD000000000000012;
    *((void *)&v46 + 1) = 0x8000000100018FA0;
    sub_100018128();
    if (*(void *)(v20 + 16) && (unint64_t v22 = sub_100008FB4((uint64_t)v48), (v23 & 1) != 0))
    {
      sub_10000B908(*(void *)(v20 + 56) + 32 * v22, (uint64_t)&v46);
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
    }
    uint64_t v37 = v4;
    uint64_t result = swift_bridgeObjectRelease();
    if (*((void *)&v47 + 1))
    {
      sub_10000A39C((uint64_t)v48);
      sub_100014D24(&v46, &v49);
      swift_dynamicCast();
      uint64_t v25 = v44;
      unint64_t v26 = v45;
      sub_100017AD8();
      swift_allocObject();
      sub_10000A3F0(v25, v26);
      sub_100017AC8();
      sub_100014C78(&qword_100021BF8, (void (*)(uint64_t))&type metadata accessor for EmojiPosterConfiguration);
      sub_100017AB8();
      sub_10000BA30(v25, v26);
      uint64_t v31 = v38;
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v16, v14, v11);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v10, v16, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v10, 0, 1, v11);
      uint64_t v32 = v43 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
      swift_beginAccess();
      sub_10001459C((uint64_t)v10, v32);
      swift_endAccess();
      sub_100017CB8();
      id v33 = v41;
      sub_100017D78();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v40);
      Class isa = sub_100017D38().super.isa;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v37);
      sub_1000180B8();
      uint64_t v36 = v35;
      sub_10000BA30(v25, v26);
      swift_release();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v16, v11);
      *(void *)(v43 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_luminance) = v36;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v27 = v48[0];
    sub_100017B28();

    swift_willThrow();
    id v28 = sub_100017EB8();
    uint64_t v29 = sub_100018088();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v29, "Error loading user info contents", v30, 2u);
      swift_slowDealloc();
    }

    sub_10000DB50();
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_10000DB50()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005AFC(&qword_100021B98);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v14 - v6;
  sub_100017E18();
  swift_allocObject();
  sub_100017E08();
  uint64_t v8 = sub_100017DE8();
  swift_release();
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = sub_100017D28();
  uint64_t v11 = *(void *)(v10 - 8);
  if (v9)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v5, v8 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_100017D28();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v7, v5, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    uint64_t v13 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
    swift_beginAccess();
    sub_10001459C((uint64_t)v7, v13);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_10000DE48(uint64_t a1)
{
  v2[32] = a1;
  v2[33] = v1;
  sub_100005AFC(&qword_100021B98);
  v2[34] = swift_task_alloc();
  uint64_t v3 = sub_100017D28();
  v2[35] = v3;
  v2[36] = *(void *)(v3 - 8);
  v2[37] = swift_task_alloc();
  return _swift_task_switch(sub_10000DF64, 0, 0);
}

uint64_t sub_10000DF64()
{
  uint64_t v39 = v0;
  v0[38] = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_logger;
  uint64_t v1 = sub_100017EB8();
  os_log_type_t v2 = sub_100018078();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Finalizing editor state, saving...", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void *)v0[32];
  uint64_t v5 = v0[33];

  id v6 = [v4 currentLook];
  id v7 = [v6 identifier];

  uint64_t v8 = sub_100017F88();
  uint64_t v10 = v9;

  uint64_t v11 = (uint64_t *)(v5 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
  swift_beginAccess();
  uint64_t v12 = *v11;
  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_100008F3C(v8, v10);
    if (v14)
    {
      uint64_t v15 = *(void *)(v12 + 56) + 16 * v13;
      id v16 = *(void **)v15;
      v0[39] = *(void *)v15;
      id v17 = *(void **)(v15 + 8);
      v0[40] = v17;
      id v18 = v16;
      id v19 = v17;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_100018048();
      id v20 = v18;
      v0[41] = sub_100018038();
      uint64_t v22 = sub_100018028();
      return _swift_task_switch(sub_10000E378, v22, v21);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  char v23 = (void *)v0[32];
  os_log_type_t v24 = sub_100018088();
  id v25 = v23;
  unint64_t v26 = sub_100017EB8();
  os_log_type_t v27 = v24;
  BOOL v28 = os_log_type_enabled(v26, v24);
  uint64_t v29 = (void *)v0[32];
  if (v28)
  {
    id v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)id v30 = 136315138;
    id v31 = [v29 currentLook];
    id v32 = [v31 identifier];

    uint64_t v33 = sub_100017F88();
    unint64_t v35 = v34;

    v0[26] = sub_1000088D4(v33, v35, &v38);
    sub_1000180E8();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Error finding view controller for current look %s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = (uint64_t (*)(void))v0[1];
  return v36();
}

uint64_t sub_10000E378()
{
  uint64_t v1 = *(void **)(v0 + 312);
  swift_release();
  sub_100017BF8();

  return _swift_task_switch(sub_10000E428, 0, 0);
}

uint64_t sub_10000E428()
{
  uint64_t v50 = v0;
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 272);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    uint64_t v4 = *(void **)(v0 + 320);

    sub_10000B964(v3, &qword_100021B98);
    uint64_t v5 = *(void **)(v0 + 256);
    LOBYTE(v4) = sub_100018088();
    id v6 = v5;
    id v7 = sub_100017EB8();
    os_log_type_t v8 = v4;
    BOOL v9 = os_log_type_enabled(v7, (os_log_type_t)v4);
    uint64_t v10 = *(void **)(v0 + 256);
    if (v9)
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      id v12 = [v10 currentLook];
      id v13 = [v12 identifier];

      uint64_t v14 = sub_100017F88();
      unint64_t v16 = v15;

      *(void *)(v0 + 208) = sub_1000088D4(v14, v16, v49);
      sub_1000180E8();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error finding view controller for current look %s", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v1 + 32))(*(void *)(v0 + 296), v3, v2);
    sub_100017B18();
    swift_allocObject();
    sub_100017B08();
    sub_100017AE8();
    sub_100014C78((unint64_t *)&qword_1000219C0, (void (*)(uint64_t))&type metadata accessor for EmojiPosterConfiguration);
    uint64_t v17 = sub_100017AF8();
    unint64_t v19 = v18;
    id v20 = *(void **)(v0 + 256);
    sub_10000A3F0(v17, v18);
    id v21 = objc_msgSend(objc_msgSend(v20, "environment"), "targetConfiguration");
    swift_unknownObjectRelease();
    sub_100005AFC(&qword_100021BE0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100018B10;
    *(void *)(v0 + 192) = 0xD000000000000012;
    *(void *)(v0 + 200) = 0x8000000100018FA0;
    sub_100018128();
    *(void *)(inited + 96) = &type metadata for Data;
    *(void *)(inited + 72) = v17;
    *(void *)(inited + 80) = v19;
    sub_10000BA88(inited);
    Class isa = sub_100017F38().super.isa;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 224) = 0;
    unsigned int v24 = [v21 storeUserInfo:isa error:v0 + 224];

    id v25 = *(void **)(v0 + 224);
    if (v24)
    {
      os_log_type_t v27 = *(void **)(v0 + 312);
      unint64_t v26 = *(void **)(v0 + 320);
      uint64_t v29 = *(void *)(v0 + 288);
      uint64_t v28 = *(void *)(v0 + 296);
      uint64_t v30 = *(void *)(v0 + 280);
      id v31 = v25;

      swift_release();
      sub_10000BA30(v17, v19);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    }
    else
    {
      id v32 = v25;
      sub_100017B28();

      swift_willThrow();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v33 = sub_100017EB8();
      os_log_type_t v34 = sub_100018088();
      log = v33;
      BOOL v35 = os_log_type_enabled(v33, v34);
      uint64_t v36 = *(void **)(v0 + 320);
      id v48 = *(void **)(v0 + 312);
      uint64_t v38 = *(void *)(v0 + 288);
      uint64_t v37 = *(void *)(v0 + 296);
      uint64_t v39 = *(void *)(v0 + 280);
      if (v35)
      {
        uint64_t v46 = *(void *)(v0 + 288);
        uint64_t v45 = *(void *)(v0 + 296);
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        v49[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 136315138;
        swift_getErrorValue();
        uint64_t v41 = sub_100018228();
        *(void *)(v0 + 248) = sub_1000088D4(v41, v42, v49);
        sub_1000180E8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, log, v34, "Error storing user info: %s", v40, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_release();
        swift_errorRelease();

        sub_10000BA30(v17, v19);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v39);
      }
      else
      {

        swift_release();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();

        sub_10000BA30(v17, v19);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t sub_10000EE58(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  id v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *id v7 = v3;
  v7[1] = sub_10000EF1C;
  return sub_10000DE48((uint64_t)v6);
}

uint64_t sub_10000EF1C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 32);
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v3 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10000F200@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v4 = sub_100017DC8();
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005AFC(&qword_100021B98);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v41 = (uint64_t)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v48 = (uint64_t)v37 - v11;
  __chkstk_darwin(v10);
  id v13 = (char *)v37 - v12;
  uint64_t v14 = sub_100017C98();
  uint64_t v46 = *(void *)(v14 - 8);
  uint64_t v47 = v14;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v43 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)v37 - v17;
  uint64_t v19 = sub_100017C88();
  uint64_t v44 = *(void *)(v19 - 8);
  uint64_t v45 = v19;
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v22 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  unsigned int v24 = (char *)v37 - v23;
  sub_10000F668(a1, (uint64_t)v37 - v23);
  unint64_t v42 = v18;
  sub_10000F88C(a1, (uint64_t)v18);
  uint64_t v25 = v2 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  sub_100014CC0(v25, (uint64_t)v13, &qword_100021B98);
  uint64_t v26 = sub_100017D28();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t result = v28(v13, 1, v26);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v39 = v6;
  sub_100017CB8();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v30(v13, v26);
  id v31 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  v37[1] = v22;
  uint64_t v38 = v24;
  v31(v22, v24, v45);
  id v32 = v42;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v43, v42, v47);
  uint64_t v33 = v48;
  sub_100014CC0(v25, v48, &qword_100021B98);
  uint64_t result = v28((char *)v33, 1, v26);
  if (result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v34 = v48;
  sub_100017D18();
  v30((char *)v34, v26);
  uint64_t v35 = v25;
  uint64_t v36 = v41;
  sub_100014CC0(v35, v41, &qword_100021B98);
  uint64_t result = v28((char *)v36, 1, v26);
  if (result != 1)
  {
    sub_100017CF8();
    v30((char *)v36, v26);
    sub_100017CA8();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v32, v47);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v38, v45);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000F668@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [a1 identifier];
  uint64_t v4 = sub_100017F88();
  uint64_t v6 = v5;

  BOOL v7 = v4 == 0x6C61726970734DLL && v6 == 0xE700000000000000;
  if (v7 || (sub_1000181F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    uint64_t v8 = (unsigned int *)&enum case for EmojiPosterLayoutStyle.spiral(_:);
    goto LABEL_22;
  }
  BOOL v9 = v4 == 0x6469726753 && v6 == 0xE500000000000000;
  if (v9
    || (sub_1000181F8() & 1) != 0
    || (v4 == 0x646972674DLL ? (BOOL v10 = v6 == 0xE500000000000000) : (BOOL v10 = 0),
        v10
     || (sub_1000181F8() & 1) != 0
     || v4 == 0x646972674CLL && v6 == 0xE500000000000000
     || (sub_1000181F8() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = (unsigned int *)&enum case for EmojiPosterLayoutStyle.offsetGrid(_:);
  }
  else
  {
    if (v4 == 0x616C756372696353 && v6 == 0xE900000000000072)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v15 = sub_1000181F8();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0) {
        goto LABEL_7;
      }
    }
    uint64_t v8 = (unsigned int *)&enum case for EmojiPosterLayoutStyle.circular(_:);
  }
LABEL_22:
  uint64_t v11 = *v8;
  uint64_t v12 = sub_100017C88();
  id v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);
  return v13(a2, v11, v12);
}

uint64_t sub_10000F88C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = [a1 identifier];
  uint64_t v4 = sub_100017F88();
  uint64_t v6 = v5;

  BOOL v7 = v4 == 0x6469726753 && v6 == 0xE500000000000000;
  if (v7
    || (sub_1000181F8() & 1) != 0
    || (v4 == 0x616C756372696353 ? (BOOL v8 = v6 == 0xE900000000000072) : (BOOL v8 = 0), v8 || (sub_1000181F8() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    BOOL v9 = (unsigned int *)&enum case for EmojiPosterSizeVariant.small(_:);
    goto LABEL_12;
  }
  BOOL v14 = v4 == 0x646972674DLL && v6 == 0xE500000000000000;
  if (v14
    || (sub_1000181F8() & 1) != 0
    || v4 == 0x6C61726970734DLL && v6 == 0xE700000000000000
    || (sub_1000181F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    BOOL v9 = (unsigned int *)&enum case for EmojiPosterSizeVariant.medium(_:);
    goto LABEL_12;
  }
  if (v4 == 0x646972674CLL && v6 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_1000181F8();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
  BOOL v9 = (unsigned int *)&enum case for EmojiPosterSizeVariant.large(_:);
LABEL_12:
  uint64_t v10 = *v9;
  uint64_t v11 = sub_100017C98();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);
  return v12(a2, v10, v11);
}

uint64_t sub_10000FAB0()
{
  uint64_t v0 = 0x4075E00000000000;
  swift_beginAccess();
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    id v3 = *(void **)&Strong[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC];
    if (v3)
    {
      id v4 = v3;
      sub_100017BB8();
      uint64_t v6 = v5;

      return v6;
    }
    else
    {
    }
  }
  return v0;
}

void sub_10000FB5C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005AFC(&qword_100021B98);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  BOOL v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  BOOL v9 = (char *)&v43 - v8;
  uint64_t v10 = sub_100017EB8();
  os_log_type_t v11 = sub_100018078();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Emoji picker presented", v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC;
  BOOL v14 = *(void **)(v2 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC);
  uint64_t v15 = v2 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  if (v14)
  {
    swift_beginAccess();
    sub_100014CC0(v15, (uint64_t)v7, &qword_100021B98);
    uint64_t v16 = sub_100017D28();
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v16) != 1)
    {
      id v18 = v14;
      sub_100017D18();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v16);
      sub_100017B88();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  swift_beginAccess();
  sub_100014CC0(v15, (uint64_t)v9, &qword_100021B98);
  uint64_t v19 = sub_100017D28();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1) {
    goto LABEL_17;
  }
  sub_100017D18();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v19);
  id v21 = objc_allocWithZone((Class)sub_100017BD8());
  uint64_t v22 = sub_100017BA8();
  sub_100014C78((unint64_t *)&unk_100021BD0, (void (*)(uint64_t))type metadata accessor for EmojiPosterExtensionEditorController);
  swift_unknownObjectRetain();
  sub_100017BC8();
  id v18 = *(id *)(v2 + v13);
  *(void *)(v2 + v13) = v22;
LABEL_8:

  id v23 = [self currentDevice];
  id v24 = [v23 userInterfaceIdiom];

  uint64_t v25 = *(void **)(v2 + v13);
  if (v25)
  {
    uint64_t v26 = *(void *)(v2
                    + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_currentDeviceInterfaceOrientation);
    id v27 = v25;
    uint64_t v28 = v27;
    if (v24 == (id)1)
    {
      [v27 setModalPresentationStyle:7];
      id v29 = [v28 popoverPresentationController];
      NSString v30 = sub_100017F78();
      sub_100017F88();

      NSString v31 = sub_100017F78();
      swift_bridgeObjectRelease();
      id v32 = [a1 viewForMenuElementIdentifier:v31];

      [v29 setSourceView:v32];
      [a1 presentViewController:v28 animated:1 completion:0];
    }
    else
    {
      id v33 = [v27 sheetPresentationController];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = swift_allocObject();
        swift_unknownObjectWeakInit();
        NSString v36 = sub_100017F78();
        sub_10000A4A0(0, &qword_100021BC8);
        uint64_t v37 = swift_allocObject();
        *(void *)(v37 + 16) = v35;
        *(void *)(v37 + 24) = v26;
        swift_retain();
        uint64_t v38 = (void *)sub_100018098();
        swift_release();

        swift_release();
        sub_100005AFC(&qword_1000219A0);
        uint64_t v39 = swift_allocObject();
        *(_OWORD *)(v39 + 16) = xmmword_100018AB0;
        *(void *)(v39 + 32) = v38;
        uint64_t v43 = v39;
        sub_100017FF8();
        id v40 = v38;
        Class isa = sub_100017FE8().super.isa;
        swift_bridgeObjectRelease();
        [v34 setDetents:isa];

        NSString v42 = sub_100017F78();
        [v34 setLargestUndimmedDetentIdentifier:v42];

        [v34 setPrefersScrollingExpandsWhenScrolledToEdge:0];
        [v34 setPrefersGrabberVisible:0];
        [v34 _setShouldAdjustDetentsToAvoidKeyboard:0];
      }
      [a1 presentViewController:v28 animated:1 completion:0];
    }
  }
}

uint64_t sub_1000101A0(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v2 = sub_100017B48();
  __chkstk_darwin(v2 - 8);
  NSString v42 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100017F68();
  __chkstk_darwin(v4 - 8);
  uint64_t v39 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100017D48();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  BOOL v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100017DC8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v40 = v1;
  uint64_t v17 = (uint64_t)v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  sub_100014CC0(v17, (uint64_t)v16, &qword_100021B98);
  uint64_t v18 = sub_100017D28();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18);
  if (result != 1)
  {
    sub_100017CB8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
    sub_100017D78();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    Class isa = sub_100017D38().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    id v22 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:isa preferredStyle:1];

    id v23 = [v22 color];
    if (!v23) {
      id v23 = [self blackColor];
    }
    id v24 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", 35.0, 35.0);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = v23;
    *(_OWORD *)(v25 + 24) = xmmword_100018B20;
    *(void *)(v25 + 40) = 0x403D000000000000;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = sub_100014680;
    *(void *)(v26 + 24) = v25;
    aBlock[4] = sub_1000146A0;
    aBlock[5] = v26;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100010A70;
    aBlock[3] = &unk_10001CCF0;
    id v27 = _Block_copy(aBlock);
    id v28 = v23;
    swift_retain();
    swift_release();
    id v29 = [v24 imageWithActions:v27];
    _Block_release(v27);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      sub_100017F58();
      id v38 = v28;
      sub_100017B38();
      sub_100017F98();
      sub_10000A4A0(0, (unint64_t *)&unk_100021BB0);
      id v37 = v29;
      sub_100017F78();
      uint64_t v31 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v32 = swift_allocObject();
      id v40 = v24;
      uint64_t v33 = v32;
      swift_unknownObjectWeakInit();
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = v31;
      *(void *)(v34 + 24) = v33;
      id v35 = (id)sub_1000180C8();
      sub_100017F58();
      sub_100017B38();
      sub_100017F98();
      NSString v36 = sub_100017F78();
      swift_bridgeObjectRelease();
      [v35 setAccessibilityLabel:v36];
      swift_release();

      return (uint64_t)v35;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100010884(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t v10 = (CGContext *)[a1 CGContext];
  uint64_t v11 = (CGColor *)[a2 CGColor];
  CGContextSetFillColorWithColor(v10, v11);

  uint64_t v12 = (CGContext *)[a1 CGContext];
  CGContextSetLineWidth(v12, a3);

  uint64_t v13 = (CGContext *)[a1 CGContext];
  id v14 = [self systemBackgroundColor];
  id v15 = [self traitCollectionWithUserInterfaceStyle:1];
  id v16 = [v14 resolvedColorWithTraitCollection:v15];

  uint64_t v17 = (CGColor *)[v16 CGColor];
  CGContextSetStrokeColorWithColor(v13, v17);

  uint64_t v18 = (CGContext *)[a1 CGContext];
  v21.origin.x = a3;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  CGContextAddEllipseInRect(v18, v21);

  uint64_t v19 = (CGContext *)[a1 CGContext];
  CGContextDrawPath(v19, kCGPathFillStroke);
}

void sub_100010A70(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

void sub_100010ABC(void *a1)
{
  uint64_t v2 = sub_100017D28();
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100017D48();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100017DC8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v12 - 8);
  id v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v16 = (id)Strong;
    swift_beginAccess();
    id v46 = (id)swift_unknownObjectWeakLoadStrong();
    if (v46)
    {
      id v45 = a1;
      uint64_t v17 = sub_100017EB8();
      os_log_type_t v18 = sub_100018078();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Background color picker presented", v19, 2u);
        swift_slowDealloc();
      }

      uint64_t v20 = (uint64_t)v16
          + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
      swift_beginAccess();
      sub_100014CC0(v20, (uint64_t)v14, &qword_100021B98);
      uint64_t v22 = v49;
      uint64_t v21 = v50;
      int v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48))(v14, 1, v50);
      id v44 = v16;
      if (v23 == 1)
      {
        __break(1u);
        return;
      }
      sub_100017CB8();
      id v24 = *(void (**)(char *, uint64_t))(v22 + 8);
      v24(v14, v21);
      sub_100017D78();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      uint64_t v25 = v21;
      Class isa = sub_100017D38().super.isa;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
      id v27 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:isa preferredStyle:1];

      sub_10000A4A0(0, (unint64_t *)&unk_100021BA0);
      id v28 = v46;
      id v29 = [v46 currentLook];
      NSString v30 = v44;
      sub_10000F200(v29, (uint64_t)v4);

      sub_100017D18();
      v24(v4, v25);
      uint64_t v31 = (void *)sub_1000180A8();
      swift_bridgeObjectRelease();
      id v16 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
      [v16 setSelectedColor:v27];
      sub_100017B78();
      uint64_t v32 = (void *)sub_100017B58();
      [v16 setColorPalette:v32];

      id v33 = [v45 identifier];
      sub_100017F88();

      NSString v34 = sub_100017F78();
      swift_bridgeObjectRelease();
      id v35 = [v28 viewForMenuElementIdentifier:v34];

      [v16 setColorPickerSourceItem:v35];
      if (v31)
      {
        id v36 = objc_allocWithZone((Class)PRPosterColor);
        id v37 = v31;
        id v38 = [v36 initWithColor:v37];
        [v16 setSuggestedColor:v38];
      }
      uint64_t v39 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v40 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = v39;
      *(void *)(v41 + 24) = v40;
      aBlock[4] = sub_100014718;
      aBlock[5] = v41;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100011470;
      aBlock[3] = &unk_10001CD68;
      NSString v42 = _Block_copy(aBlock);
      swift_release();
      [v28 presentColorPickerWithConfiguration:v16 changeHandler:v42];
      _Block_release(v42);
    }
  }
}

uint64_t sub_100011144(void *a1)
{
  v21[3] = sub_10000A4A0(0, (unint64_t *)&unk_100021BA0);
  v21[0] = a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    swift_beginAccess();
    uint64_t v4 = swift_unknownObjectWeakLoadStrong();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      sub_10000B908((uint64_t)v21, (uint64_t)v20);
      sub_10000A4A0(0, &qword_1000219A8);
      id v6 = a1;
      if (swift_dynamicCast())
      {
        id v7 = *(id *)&v19;
        uint64_t v8 = sub_100017EB8();
        os_log_type_t v9 = sub_100018078();
        if (os_log_type_enabled(v8, v9))
        {
          uint64_t v10 = (uint8_t *)swift_slowAlloc();
          uint64_t v17 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v10 = 138412290;
          v20[0] = v7;
          id v11 = v7;
          sub_1000180E8();
          *uint64_t v17 = v7;

          _os_log_impl((void *)&_mh_execute_header, v8, v9, "Background color updated:%@", v10, 0xCu);
          sub_100005AFC(&qword_100021BC0);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        sub_100012CA0(v7);
        [v5 updateActions];
        id v14 = [v7 color];
        if (v14)
        {
          id v15 = v14;
          double v19 = 0.0;
          v20[0] = 0;
          double v18 = 0.0;
          [v14 getHue:v20 saturation:&v19 brightness:&v18 alpha:0];
          *(double *)&v3[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_luminance] = v18 + v18 * v19 * -0.5;
          [*(id *)&v3[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor] updateLuminanceValuesForLooks];
        }
      }
      else
      {
      }
    }
    else
    {
      id v13 = a1;
    }
  }
  else
  {
    id v12 = a1;
  }
  return sub_10000B9C8((uint64_t)v21);
}

void sub_100011470(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1000114D8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    swift_beginAccess();
    uint64_t v2 = swift_unknownObjectWeakLoadStrong();
    if (v2)
    {
      uint64_t v3 = (void *)v2;
      sub_10000FB5C(v1);

      uint64_t v1 = v3;
    }
  }
}

uint64_t sub_100011564()
{
  uint64_t v0 = sub_100017B48();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100017F68();
  __chkstk_darwin(v1 - 8);
  sub_100005AFC(&qword_1000219A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100018AB0;
  sub_100017F58();
  sub_100017B38();
  uint64_t v11 = sub_100017F98();
  NSString v3 = sub_100017F78();
  id v4 = objc_msgSend(self, "_systemImageNamed:", v3, v11);

  sub_10000A4A0(0, (unint64_t *)&unk_100021BB0);
  sub_100017F78();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  id v8 = (id)sub_1000180C8();
  sub_100017F58();
  sub_100017B38();
  sub_100017F98();
  NSString v9 = sub_100017F78();
  swift_bridgeObjectRelease();
  [v8 setAccessibilityLabel:v9];

  *(void *)(v2 + 32) = v8;
  sub_100017FF8();
  return v2;
}

void sub_100011B0C(uint64_t a1)
{
  uint64_t v160 = a1;
  uint64_t v2 = sub_100017C98();
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v128 = (char *)&v125 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v149 = (char *)&v125 - v5;
  uint64_t v6 = sub_100017C88();
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  unint64_t v132 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v148 = (char *)&v125 - v9;
  uint64_t v10 = sub_100005AFC(&qword_100021B90);
  __chkstk_darwin(v10 - 8);
  id v139 = (char *)&v125 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100017D48();
  __chkstk_darwin(v12 - 8);
  id v138 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100017D68();
  __chkstk_darwin(v14 - 8);
  id v137 = (char *)&v125 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100017D28();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v147 = (char *)&v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v168 = (char *)&v125 - v20;
  uint64_t v21 = sub_100017DC8();
  int64_t v171 = *(void *)(v21 - 8);
  uint64_t v22 = __chkstk_darwin(v21);
  unint64_t v134 = (char *)&v125 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v136 = (char *)&v125 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  unint64_t v133 = (char *)&v125 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v169 = (char *)&v125 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v146 = (char *)&v125 - v31;
  __chkstk_darwin(v30);
  id v33 = (char *)&v125 - v32;
  uint64_t v34 = sub_100005AFC(&qword_100021B98);
  uint64_t v35 = __chkstk_darwin(v34 - 8);
  char v130 = (char *)&v125 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v127 = (uint64_t)&v125 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v129 = (uint64_t)&v125 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v43 = (char *)&v125 - v42;
  uint64_t v44 = __chkstk_darwin(v41);
  char v135 = (char *)&v125 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v145 = (char *)&v125 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  v159 = (char *)&v125 - v49;
  __chkstk_darwin(v48);
  uint64_t v51 = (char *)&v125 - v50;
  uint64_t v131 = v1;
  uint64_t v52 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  uint64_t v53 = v17;
  sub_100014CC0(v52, (uint64_t)v51, &qword_100021B98);
  Swift::Int v56 = *(unsigned int (**)(void, void, void))(v17 + 48);
  uint64_t v54 = v17 + 48;
  uint64_t v55 = v56;
  if (v56(v51, 1, v16) == 1) {
    goto LABEL_52;
  }
  sub_100017CB8();
  uint64_t v170 = v53;
  id v154 = *(void (**)(char *, uint64_t))(v53 + 8);
  uint64_t v155 = v53 + 8;
  v154(v51, v16);
  char v57 = sub_100017DA8();
  int64_t v58 = v171;
  uint64_t v59 = *(void (**)(char *, uint64_t))(v171 + 8);
  uint64_t v158 = v21;
  uint64_t v164 = v59;
  int64_t v165 = v171 + 8;
  v59(v33, v21);
  uint64_t v140 = v52;
  uint64_t v150 = v33;
  uint64_t v60 = v58;
  uint64_t v126 = v43;
  if (v57)
  {
    sub_10000A4A0(0, (unint64_t *)&unk_100021BA0);
    id v61 = (id)sub_1000180A8();
  }
  else
  {
    id v61 = 0;
  }
  uint64_t v62 = (uint64_t)v159;
  uint64_t v63 = v131;
  uint64_t v64 = (uint64_t *)(v131 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
  swift_beginAccess();
  uint64_t v65 = *v64;
  uint64_t v66 = *(void *)(*v64 + 64);
  uint64_t v161 = *v64 + 64;
  uint64_t v67 = 1 << *(unsigned char *)(v65 + 32);
  uint64_t v68 = -1;
  if (v67 < 64) {
    uint64_t v68 = ~(-1 << v67);
  }
  unint64_t v69 = v68 & v66;
  uint64_t v144 = v63 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_logger;
  int64_t v162 = (unint64_t)(v67 + 63) >> 6;
  uint64_t v143 = (void (**)(char *, uint64_t, uint64_t))(v170 + 32);
  long long v153 = (void (**)(char *, char *, uint64_t))(v60 + 32);
  uint64_t v70 = (void (**)(char *, char *, uint64_t))(v60 + 16);
  uint64_t v142 = (void (**)(char *, char *, uint64_t))(v170 + 16);
  v151 = (void (**)(char *, void, uint64_t, uint64_t))(v170 + 56);
  uint64_t v167 = v65;
  swift_bridgeObjectRetain();
  int64_t v71 = 0;
  uint64_t v163 = v16;
  id v152 = v61;
  uint64_t v157 = v54;
  long long v156 = v55;
  uint64_t v72 = v168;
  uint64_t v141 = (void (**)(char *, char *, uint64_t))(v60 + 16);
  if (v69) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v74 = v71 + 1;
  if (__OFADD__(v71, 1))
  {
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v75 = v140;
  if (v74 < v162)
  {
    unint64_t v76 = *(void *)(v161 + 8 * v74);
    int64_t v77 = v71 + 1;
    if (v76) {
      goto LABEL_26;
    }
    int64_t v77 = v71 + 2;
    if (v71 + 2 >= v162) {
      goto LABEL_38;
    }
    unint64_t v76 = *(void *)(v161 + 8 * v77);
    if (v76) {
      goto LABEL_26;
    }
    int64_t v77 = v71 + 3;
    if (v71 + 3 >= v162) {
      goto LABEL_38;
    }
    unint64_t v76 = *(void *)(v161 + 8 * v77);
    if (v76) {
      goto LABEL_26;
    }
    int64_t v77 = v71 + 4;
    if (v71 + 4 >= v162) {
      goto LABEL_38;
    }
    unint64_t v76 = *(void *)(v161 + 8 * v77);
    if (v76)
    {
LABEL_26:
      uint64_t v170 = (v76 - 1) & v76;
      int64_t v171 = v77;
      for (unint64_t i = __clz(__rbit64(v76)) + (v77 << 6); ; unint64_t i = __clz(__rbit64(v69)) | (v71 << 6))
      {
        uint64_t v79 = *(void *)(v167 + 56) + 16 * i;
        uint64_t v80 = *(void **)(v79 + 8);
        id v81 = *(id *)v79;
        id v82 = v80;
        sub_100017BF8();

        if (v55(v62, 1, v16) == 1)
        {
          unint64_t v83 = v70;
          BOOL v84 = v55;
          id v85 = v61;
          char v86 = v82;
          sub_10000B964(v62, &qword_100021B98);
          id v87 = sub_100017EB8();
          os_log_type_t v88 = sub_100018088();
          if (os_log_type_enabled(v87, v88))
          {
            unint64_t v89 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v89 = 0;
            _os_log_impl((void *)&_mh_execute_header, v87, v88, "Unable to fetch configuration for an editing look view controller", v89, 2u);
            uint64_t v16 = v163;
            swift_slowDealloc();
          }

          unint64_t v69 = v170;
          int64_t v71 = v171;
          id v61 = v85;
          uint64_t v55 = v84;
          uint64_t v70 = v83;
          uint64_t v72 = v168;
          if (!v170) {
            goto LABEL_11;
          }
        }
        else
        {
          id v166 = v82;
          (*v143)(v72, v62, v16);
          unint64_t v90 = v169;
          sub_100017CB8();
          char v91 = v153;
          if (v61)
          {
            id v92 = v61;
            sub_100017D98();
            id v93 = v92;
            sub_100017D58();
            sub_100017DB8();
            id v94 = v150;
            unint64_t v90 = v169;
            sub_100017D88();

            uint64_t v95 = v158;
            v164(v90, v158);
            uint64_t v96 = *v91;
            (*v91)(v90, v94, v95);
          }
          else
          {
            uint64_t v96 = *v153;
            uint64_t v95 = v158;
            id v94 = v150;
          }
          uint64_t v97 = v146;
          v96(v146, v90, v95);
          uint64_t v98 = *v70;
          (*v70)(v94, v97, v95);
          uint64_t v72 = v168;
          sub_100017CD8();
          sub_100017CE8();
          swift_bridgeObjectRetain();
          sub_100017CF8();
          unint64_t v99 = v147;
          sub_100017CA8();
          os_log_type_t v100 = v145;
          uint64_t v16 = v163;
          (*v142)(v145, v99, v163);
          (*v151)(v100, 0, 1, v16);
          id v101 = v81;
          sub_100017C08();

          if (sub_100017DA8())
          {
            uint64_t v70 = v141;
            v98(v94, v97, v95);
            id v102 = v166;
            sub_100017E48();

            unint64_t v103 = v154;
            v154(v99, v16);
            v164(v97, v95);
            v103(v72, v16);
            id v61 = v152;
            uint64_t v55 = v156;
            uint64_t v62 = (uint64_t)v159;
          }
          else
          {

            uint64_t v104 = v154;
            v154(v99, v16);
            v164(v97, v95);
            v104(v72, v16);
            id v61 = v152;
            uint64_t v55 = v156;
            uint64_t v62 = (uint64_t)v159;
            uint64_t v70 = v141;
          }
          unint64_t v69 = v170;
          int64_t v71 = v171;
          if (!v170) {
            goto LABEL_11;
          }
        }
LABEL_10:
        uint64_t v170 = (v69 - 1) & v69;
        int64_t v171 = v71;
      }
    }
    uint64_t v78 = v71 + 5;
    if (v71 + 5 < v162)
    {
      unint64_t v76 = *(void *)(v161 + 8 * v78);
      if (v76)
      {
        int64_t v77 = v71 + 5;
        goto LABEL_26;
      }
      while (1)
      {
        int64_t v77 = v78 + 1;
        if (__OFADD__(v78, 1)) {
          goto LABEL_51;
        }
        if (v77 >= v162) {
          break;
        }
        unint64_t v76 = *(void *)(v161 + 8 * v77);
        ++v78;
        if (v76) {
          goto LABEL_26;
        }
      }
    }
  }
LABEL_38:
  swift_release();
  uint64_t v105 = (uint64_t)v135;
  sub_100014CC0(v75, (uint64_t)v135, &qword_100021B98);
  if (v55(v105, 1, v16) == 1)
  {
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v106 = v136;
  sub_100017CB8();
  uint64_t v107 = v158;
  uint64_t v108 = (uint64_t)v130;
  if (v61)
  {
    id v109 = v61;
    sub_100017D98();
    id v110 = v109;
    sub_100017D58();
    sub_100017DB8();
    uint64_t v111 = v150;
    uint64_t v106 = v136;
    sub_100017D88();

    v164(v106, v107);
    uint64_t v112 = *v153;
    (*v153)(v106, v111, v107);
  }
  else
  {
    uint64_t v112 = *v153;
  }
  uint64_t v113 = v133;
  v112(v133, v106, v107);
  uint64_t v114 = v163;
  uint64_t v115 = (void (*)(uint64_t, uint64_t))v154;
  v154(v135, v163);
  (*v70)(v134, v113, v107);
  uint64_t v116 = v140;
  uint64_t v117 = v129;
  sub_100014CC0(v140, v129, &qword_100021B98);
  uint64_t v118 = v156;
  if (v156(v117, 1, v114) == 1) {
    goto LABEL_54;
  }
  sub_100017CD8();
  v115(v117, v114);
  uint64_t v119 = v127;
  sub_100014CC0(v116, v127, &qword_100021B98);
  if (v118(v119, 1, v114) == 1)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
  }
  sub_100017CE8();
  v115(v119, v114);
  sub_100014CC0(v116, v108, &qword_100021B98);
  if (v118(v108, 1, v114) == 1) {
    goto LABEL_56;
  }
  sub_100017CF8();
  v115(v108, v114);
  swift_bridgeObjectRetain();
  uint64_t v120 = (uint64_t)v126;
  sub_100017CA8();
  (*v151)((char *)v120, 0, 1, v114);
  swift_beginAccess();
  sub_10001459C(v120, v116);
  swift_endAccess();
  if (!v152) {
    goto LABEL_48;
  }
  double v173 = 0.0;
  uint64_t v174 = 0;
  double v172 = 0.0;
  id v121 = v152;
  [v121 getHue:&v174 saturation:&v173 brightness:&v172 alpha:0];
  uint64_t v122 = v131;
  *(double *)(v131 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_luminance) = v172 + v172 * v173 * -0.5;
  uint64_t v123 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor;
  [*(id *)(v122 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor) updateLuminanceValuesForLooks];
  uint64_t v124 = *(void **)(v122 + v123);
  if (v124)
  {
    [v124 updateActions];

LABEL_48:
    v164(v133, v107);
    return;
  }
  v164(v133, v107);
}

void sub_100012CA0(void *a1)
{
  v151 = a1;
  uint64_t v2 = sub_100017C98();
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v122 = (char *)&v111 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v133 = (char *)&v111 - v5;
  uint64_t v6 = sub_100017C88();
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v123 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v132 = (char *)&v111 - v9;
  uint64_t v10 = sub_100005AFC(&qword_100021B90);
  __chkstk_darwin(v10 - 8);
  uint64_t v140 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100017D48();
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v120 = (char *)&v111 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v131 = (char *)&v111 - v15;
  uint64_t v16 = sub_100017D68();
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v125 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v136 = (char *)&v111 - v19;
  uint64_t v143 = sub_100017DC8();
  uint64_t v20 = *(void *)(v143 - 8);
  uint64_t v21 = __chkstk_darwin(v143);
  uint64_t v117 = (char *)&v111 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v119 = (char *)&v111 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v124 = (char *)&v111 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  id v139 = (char *)&v111 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  unint64_t v149 = (char *)&v111 - v30;
  __chkstk_darwin(v29);
  id v152 = (char *)&v111 - v31;
  uint64_t v32 = sub_100005AFC(&qword_100021B98);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v115 = (char *)&v111 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v114 = (char *)&v111 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v113 = (uint64_t)&v111 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v116 = (uint64_t)&v111 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v112 = (char *)&v111 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v118 = (uint64_t)&v111 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  uint64_t v126 = (char *)&v111 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  char v130 = (char *)&v111 - v48;
  __chkstk_darwin(v47);
  uint64_t v50 = (char *)&v111 - v49;
  uint64_t v153 = sub_100017D28();
  uint64_t v51 = *(void *)(v153 - 8);
  uint64_t v52 = __chkstk_darwin(v153);
  uint64_t v128 = (char *)&v111 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v52);
  uint64_t v55 = (char *)&v111 - v54;
  Swift::Int v56 = (uint64_t *)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
  swift_beginAccess();
  uint64_t v57 = *v56;
  uint64_t v58 = *(void *)(*v56 + 64);
  uint64_t v145 = *v56 + 64;
  uint64_t v59 = 1 << *(unsigned char *)(v57 + 32);
  uint64_t v60 = -1;
  if (v59 < 64) {
    uint64_t v60 = ~(-1 << v59);
  }
  unint64_t v61 = v60 & v58;
  uint64_t v121 = v1;
  uint64_t v135 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_logger;
  int64_t v146 = (unint64_t)(v59 + 63) >> 6;
  uint64_t v62 = (unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  unint64_t v134 = (void (**)(char *, char *, uint64_t))(v51 + 32);
  id v138 = (void (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v127 = (void (**)(char *, char *, uint64_t))(v51 + 16);
  id v137 = (void (**)(char *, void, uint64_t, uint64_t))(v51 + 56);
  uint64_t v63 = (void (**)(uint64_t, uint64_t))(v51 + 8);
  uint64_t v64 = (id *)(v20 + 8);
  uint64_t v65 = v55;
  uint64_t v142 = v64;
  uint64_t v150 = v57;
  swift_bridgeObjectRetain();
  int64_t v66 = 0;
  uint64_t v141 = (unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  uint64_t v144 = (void (**)(uint64_t, uint64_t))(v51 + 8);
  uint64_t v129 = v50;
  if (v61) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v70 = v66 + 1;
  unint64_t v69 = v151;
  uint64_t v71 = (uint64_t)v126;
  if (__OFADD__(v66, 1))
  {
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v70 < v146)
  {
    unint64_t v72 = *(void *)(v145 + 8 * v70);
    ++v66;
    if (v72) {
      goto LABEL_22;
    }
    int64_t v66 = v70 + 1;
    if (v70 + 1 >= v146) {
      goto LABEL_29;
    }
    unint64_t v72 = *(void *)(v145 + 8 * v66);
    if (v72) {
      goto LABEL_22;
    }
    int64_t v66 = v70 + 2;
    if (v70 + 2 >= v146) {
      goto LABEL_29;
    }
    unint64_t v72 = *(void *)(v145 + 8 * v66);
    if (v72) {
      goto LABEL_22;
    }
    int64_t v66 = v70 + 3;
    if (v70 + 3 >= v146) {
      goto LABEL_29;
    }
    unint64_t v72 = *(void *)(v145 + 8 * v66);
    if (v72)
    {
LABEL_22:
      unint64_t v61 = (v72 - 1) & v72;
      unint64_t v68 = __clz(__rbit64(v72)) + (v66 << 6);
      while (1)
      {
        uint64_t v74 = *(void *)(v150 + 56) + 16 * v68;
        uint64_t v75 = *(void **)(v74 + 8);
        id v76 = *(id *)v74;
        id v154 = v75;
        sub_100017BF8();

        if ((*v62)(v50, 1, v153) == 1)
        {
          sub_10000B964((uint64_t)v50, &qword_100021B98);
          int64_t v77 = sub_100017EB8();
          os_log_type_t v78 = sub_100018088();
          if (os_log_type_enabled(v77, v78))
          {
            uint64_t v79 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v79 = 0;
            _os_log_impl((void *)&_mh_execute_header, v77, v78, "Unable to fetch configuration for an editing look view controller", v79, 2u);
            swift_slowDealloc();
          }

          if (!v61) {
            goto LABEL_7;
          }
        }
        else
        {
          unint64_t v147 = v61;
          int64_t v148 = v66;
          uint64_t v80 = v153;
          (*v134)(v65, v50, v153);
          sub_100017CB8();
          sub_100017D98();
          if (![v69 color]) {
            goto LABEL_39;
          }
          id v81 = v65;
          sub_100017D58();
          sub_100017DB8();
          [v69 isSuggested];
          id v82 = v149;
          sub_100017D88();
          uint64_t v83 = v143;
          (*v138)(v139, v82, v143);
          sub_100017CD8();
          sub_100017CE8();
          sub_100017D18();
          sub_100017CF8();
          BOOL v84 = v128;
          sub_100017CA8();
          id v85 = v130;
          uint64_t v86 = v80;
          (*v127)(v130, v84, v80);
          (*v137)(v85, 0, 1, v80);
          id v87 = v76;
          sub_100017C08();

          id v88 = v154;
          sub_100017CB8();
          sub_100017E48();

          uint64_t v63 = v144;
          unint64_t v89 = *v144;
          (*v144)((uint64_t)v84, v86);
          unint64_t v90 = (void (*)(char *, uint64_t))*v142;
          ((void (*)(char *, uint64_t))*v142)(v149, v83);
          v90(v152, v83);
          v89((uint64_t)v81, v86);
          uint64_t v62 = v141;
          uint64_t v50 = v129;
          uint64_t v65 = v81;
          unint64_t v61 = v147;
          int64_t v66 = v148;
          if (!v147) {
            goto LABEL_7;
          }
        }
LABEL_6:
        unint64_t v67 = __clz(__rbit64(v61));
        v61 &= v61 - 1;
        unint64_t v68 = v67 | (v66 << 6);
        unint64_t v69 = v151;
      }
    }
    int64_t v73 = v70 + 4;
    if (v73 < v146)
    {
      unint64_t v72 = *(void *)(v145 + 8 * v73);
      if (v72)
      {
        int64_t v66 = v73;
        goto LABEL_22;
      }
      while (1)
      {
        int64_t v66 = v73 + 1;
        if (__OFADD__(v73, 1)) {
          goto LABEL_38;
        }
        if (v66 >= v146) {
          break;
        }
        unint64_t v72 = *(void *)(v145 + 8 * v66);
        ++v73;
        if (v72) {
          goto LABEL_22;
        }
      }
    }
  }
LABEL_29:
  swift_release();
  uint64_t v91 = v121 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  sub_100014CC0(v91, v71, &qword_100021B98);
  id v92 = *v62;
  if ((*v62)((char *)v71, 1, v153) == 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  id v93 = v119;
  sub_100017CB8();
  id v94 = *v63;
  (*v63)(v71, v153);
  sub_100017D98();
  id v154 = *v142;
  ((void (*)(char *, uint64_t))v154)(v93, v143);
  if (![v69 color])
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  sub_100017D58();
  uint64_t v95 = v118;
  sub_100014CC0(v91, v118, &qword_100021B98);
  if (v92((char *)v95, 1, v153) == 1)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v96 = v139;
  sub_100017CB8();
  uint64_t v97 = v153;
  v94(v95, v153);
  sub_100017DB8();
  uint64_t v98 = v143;
  ((void (*)(char *, uint64_t))v154)(v96, v143);
  [v69 isSuggested];
  unint64_t v99 = v124;
  sub_100017D88();
  (*v138)(v117, v99, v98);
  uint64_t v100 = v116;
  sub_100014CC0(v91, v116, &qword_100021B98);
  if (v92((char *)v100, 1, v97) == 1)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  sub_100017CD8();
  uint64_t v101 = v153;
  v94(v100, v153);
  uint64_t v102 = v113;
  sub_100014CC0(v91, v113, &qword_100021B98);
  unsigned int v103 = v92((char *)v102, 1, v101);
  uint64_t v104 = (uint64_t)v115;
  uint64_t v105 = (uint64_t)v114;
  if (v103 == 1)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  sub_100017CE8();
  uint64_t v106 = v102;
  uint64_t v107 = v153;
  v94(v106, v153);
  sub_100014CC0(v91, v105, &qword_100021B98);
  if (v92((char *)v105, 1, v107) == 1)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  sub_100017D18();
  uint64_t v108 = v153;
  v94(v105, v153);
  sub_100014CC0(v91, v104, &qword_100021B98);
  if (v92((char *)v104, 1, v108) != 1)
  {
    sub_100017CF8();
    uint64_t v109 = v153;
    v94(v104, v153);
    uint64_t v110 = (uint64_t)v112;
    sub_100017CA8();
    (*v137)((char *)v110, 0, 1, v109);
    swift_beginAccess();
    sub_10001459C(v110, v91);
    swift_endAccess();
    ((void (*)(char *, uint64_t))v154)(v124, v143);
    return;
  }
LABEL_46:
  __break(1u);
}

id sub_100013C20(double a1)
{
  uint64_t v2 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC);
  if (!v3)
  {
    uint64_t v9 = 0;
    return (id)sub_10001435C((uint64_t)v9);
  }
  id v5 = [v3 sheetPresentationController];
  if (!v5)
  {
    uint64_t v9 = 0;
    uint64_t v13 = *(void **)(v1 + v2);
    if (v13) {
      goto LABEL_8;
    }
    return (id)sub_10001435C((uint64_t)v9);
  }
  uint64_t v6 = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = sub_10001453C;
  *(void *)(v8 + 16) = sub_10001453C;
  *(void *)(v8 + 24) = v7;
  v29[4] = sub_10001455C;
  v29[5] = v8;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 1107296256;
  v29[2] = sub_100013EEC;
  v29[3] = &unk_10001CC00;
  uint64_t v10 = _Block_copy(v29);
  id v11 = v6;
  swift_retain();
  swift_release();
  [v11 animateChanges:v10];

  _Block_release(v10);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  id result = (id)swift_release();
  if (v11)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v13 = *(void **)(v1 + v2);
  if (!v13) {
    return (id)sub_10001435C((uint64_t)v9);
  }
LABEL_8:
  id v14 = [v13 popoverPresentationController];
  if (!v14) {
    return (id)sub_10001435C((uint64_t)v9);
  }
  uint64_t v15 = v14;
  id v16 = [v14 presentedViewController];
  id v17 = [self currentDevice];
  id v18 = [v17 userInterfaceIdiom];

  if (v18 == (id)1)
  {
    double Width = 400.0;
LABEL_13:
    objc_msgSend(v16, "setPreferredContentSize:", Width, a1);

    return (id)sub_10001435C((uint64_t)v9);
  }
  id result = [v16 view];
  if (result)
  {
    uint64_t v20 = result;
    [result frame];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    v30.origin.x = v22;
    v30.origin.y = v24;
    v30.size.width = v26;
    v30.size.height = v28;
    double Width = CGRectGetWidth(v30);
    goto LABEL_13;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_100013EEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_100013F14()
{
  uint64_t v1 = v0;
  sub_100017EC8();
  uint64_t v2 = &v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration];
  uint64_t v3 = sub_100017D28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers] = &_swiftEmptyDictionarySingleton;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_emojiRenderer] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_currentDeviceInterfaceOrientation] = 1;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC] = 0;
  *(void *)&v1[OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_luminance] = 0x3FE0000000000000;
  uint64_t v4 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_initialTitleColor;
  *(void *)&v1[v4] = [self vibrantMonochromeColor];

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for EmojiPosterExtensionEditorController(0);
  return objc_msgSendSuper2(&v6, "init");
}

id sub_10001409C()
{
  return sub_1000140B4(type metadata accessor for EmojiPosterExtensionEditorController);
}

id sub_1000140B4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_1000141CC()
{
  return type metadata accessor for EmojiPosterExtensionEditorController(0);
}

uint64_t type metadata accessor for EmojiPosterExtensionEditorController(uint64_t a1)
{
  return sub_1000141F4(a1, (uint64_t *)&unk_100021B78);
}

uint64_t sub_1000141F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001422C()
{
  sub_100017ED8();
  if (v0 <= 0x3F)
  {
    sub_10000D0D0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

id sub_100014334()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor);
  if (result) {
    return [result dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

uint64_t sub_10001435C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

id sub_10001436C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSString v9 = sub_100017F78();
  swift_bridgeObjectRelease();
  NSString v10 = sub_100017F78();
  swift_bridgeObjectRelease();
  uint64_t v11 = a6[3];
  if (v11)
  {
    uint64_t v12 = sub_10001753C(a6, a6[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_1000181E8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10000B9C8((uint64_t)a6);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [v6 initWithIdentifier:v9 displayName:v10 initialTimeFontConfiguration:a5 initialTitleColor:v16];

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_100014504()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001453C()
{
  return [*(id *)(v0 + 16) invalidateDetents];
}

uint64_t sub_10001454C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001455C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100014584(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014594()
{
  return swift_release();
}

uint64_t sub_10001459C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005AFC(&qword_100021B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014604()
{
  swift_unknownObjectWeakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100014640()
{
}

uint64_t sub_100014648()
{
  return _swift_deallocObject(v0, 48, 7);
}

void sub_100014680(void *a1)
{
  sub_100010884(a1, *(void **)(v1 + 16), *(CGFloat *)(v1 + 24), *(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40));
}

uint64_t sub_100014690()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000146A0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1000146CC(void *a1)
{
}

uint64_t sub_1000146D8()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014718(void *a1)
{
  return sub_100011144(a1);
}

uint64_t sub_100014720(uint64_t a1, uint64_t a2, int *a3)
{
  objc_super v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100017AB4;
  return v6();
}

uint64_t sub_1000147EC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_100017AB4;
  return v7();
}

uint64_t sub_1000148B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100018068();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100018058();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000B964(a1, &qword_100021C28);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100018028();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100014A64(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100014B40;
  return v6(a1);
}

uint64_t sub_100014B40()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100014C38()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014C70()
{
  return sub_10000FAB0();
}

uint64_t sub_100014C78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100014CC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005AFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100014D24(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100014D34(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005AFC(&qword_100021C18);
  char v6 = a2;
  uint64_t v7 = sub_1000181B8();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v38 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v37) {
          goto LABEL_33;
        }
        unint64_t v24 = v38[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v37) {
            goto LABEL_33;
          }
          unint64_t v24 = v38[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v37)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
                if (v36 >= 64) {
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v36;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v38[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v37) {
                  goto LABEL_33;
                }
                unint64_t v24 = v38[v14];
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
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        id v34 = (id)v39;
        id v35 = *((id *)&v39 + 1);
      }
      sub_100018238();
      sub_100017FA8();
      uint64_t result = sub_100018248();
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
            goto LABEL_39;
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
      uint64_t v19 = 16 * v18;
      uint64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *uint64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v39;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

void sub_10001504C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100008F3C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1000151D8();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7] + 16 * v14;
      unint64_t v22 = *(void **)v21;

      *(void *)uint64_t v21 = a1;
      *(void *)(v21 + 8) = a2;
      return;
    }
    goto LABEL_11;
  }
  sub_100014D34(v17, a5 & 1);
  unint64_t v23 = sub_100008F3C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    sub_100018218();
    __break(1u);
    return;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *int64_t v25 = a3;
  v25[1] = a4;
  char v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  swift_bridgeObjectRetain();
}

id sub_1000151D8()
{
  uint64_t v1 = v0;
  sub_100005AFC(&qword_100021C18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000181A8();
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v25 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v20 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v25;
    swift_bridgeObjectRetain();
    id v21 = (id)v25;
    id result = *((id *)&v25 + 1);
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

unint64_t sub_1000153A8()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClass();
  if (!v0) {
    return 1;
  }
  unint64_t result = (unint64_t)[v0 deviceOrientation];
  if (result <= 1) {
    return 1;
  }
  return result;
}

void sub_100015400(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C0AC(a1, (uint64_t)v6);
  uint64_t v7 = sub_100017D28();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  uint64_t v8 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_configuration;
  swift_beginAccess();
  sub_100017A34((uint64_t)v6, v8);
  swift_endAccess();
  sub_10000BBCC();
  sub_10000B964((uint64_t)v6, &qword_100021B98);
  swift_getObjectType();
  [a1 backlightProgress];
  double v10 = v9;
  uint64_t v11 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_wakeProgress;
  if (v9 != *(double *)(v2
                       + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_wakeProgress))
  {
    unint64_t v12 = *(void **)(v2
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
    if (!v12)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    id v13 = v12;
    sub_100017BE8();

    unint64_t v14 = *(void **)(v2
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
    if (!v14)
    {
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    id v15 = v14;
    sub_100017E28();

    *(double *)(v2 + v11) = v10;
  }
  [a1 unlockProgress];
  uint64_t v16 = OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_unlockProgress;
  double v17 = *(double *)(v2 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_unlockProgress);
  if (v18 != v17)
  {
    if (v17 == 1.0) {
      [a1 unlockProgress];
    }
    [a1 unlockProgress];
    uint64_t v20 = *(void **)(v2
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
    if (!v20) {
      goto LABEL_18;
    }
    uint64_t v21 = v19;
    id v22 = v20;
    sub_100017C28();

    unint64_t v23 = *(void **)(v2
                   + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
    if (!v23)
    {
LABEL_19:
      __break(1u);
      return;
    }
    id v24 = v23;
    sub_100017E38();

    *(void *)(v2 + v16) = v21;
  }
  unint64_t v25 = sub_1000153A8();
  if (v25 == *(void *)(v2
                        + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_currentDeviceInterfaceOrientation))
    return;
  *(void *)(v2
            + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_currentDeviceInterfaceOrientation) = v25;
  char v26 = *(void **)(v2
                 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
  if (!v26)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v27 = v26;
  sub_100017C38();
}

void sub_1000156A4()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController);
  *(void *)(v0
            + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_emoijiLayersViewController) = 0;

  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController);
  *(void *)(v0
            + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_backgroundViewController) = 0;

  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer);
  *(void *)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension39EmojiPosterExtensionRenderingController_renderer) = 0;
}

uint64_t sub_100015700()
{
  uint64_t v1 = sub_100017C98();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100017C88();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)PRTimeFontConfiguration) initWithTimeFontIdentifier:PRTimeFontIdentifierRounded];
  sub_100005AFC(&qword_1000219A0);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_100018B30;
  LODWORD(v60) = enum case for EmojiPosterLayoutStyle.offsetGrid(_:);
  int64_t v66 = *(void (**)(char *))(v6 + 104);
  uint64_t v70 = v6 + 104;
  v66(v8);
  LODWORD(v57) = enum case for EmojiPosterSizeVariant.small(_:);
  uint64_t v10 = v2;
  uint64_t v64 = *(void (**)(char *))(v2 + 104);
  uint64_t v65 = v2 + 104;
  v64(v4);
  uint64_t v56 = sub_100017D08();
  uint64_t v12 = v11;
  id v13 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v68 = v10 + 8;
  unint64_t v69 = v13;
  v13(v4, v1);
  unint64_t v61 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v67 = v6 + 8;
  v61(v8, v5);
  unint64_t v14 = *(void **)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_initialTitleColor);
  uint64_t v15 = sub_10000A4A0(0, &qword_1000219A8);
  uint64_t v72 = v15;
  uint64_t v59 = v15;
  v71[0] = v14;
  id v16 = objc_allocWithZone((Class)PREditingLook);
  uint64_t v63 = v9;
  id v55 = v9;
  id v54 = v14;
  id v17 = sub_10001436C(0x6469726753, 0xE500000000000000, v56, v12, v9, v71);
  uint64_t v18 = v62;
  *(void *)(v62 + 32) = v17;
  uint64_t v19 = v66;
  ((void (*)(char *, void, uint64_t))v66)(v8, v60, v5);
  LODWORD(v56) = enum case for EmojiPosterSizeVariant.medium(_:);
  uint64_t v58 = v1;
  uint64_t v20 = v64;
  v64(v4);
  uint64_t v53 = sub_100017D08();
  uint64_t v22 = v21;
  v69(v4, v1);
  v61(v8, v5);
  uint64_t v72 = v15;
  unint64_t v23 = v54;
  v71[0] = v54;
  id v24 = objc_allocWithZone((Class)PREditingLook);
  id v55 = v55;
  id v54 = v23;
  *(void *)(v18 + 40) = sub_10001436C(0x646972674DLL, 0xE500000000000000, v53, v22, v63, v71);
  uint64_t v25 = v5;
  ((void (*)(char *, void, uint64_t))v19)(v8, v60, v5);
  uint64_t v26 = v58;
  ((void (*)(char *, void, uint64_t))v20)(v4, enum case for EmojiPosterSizeVariant.large(_:), v58);
  uint64_t v53 = sub_100017D08();
  uint64_t v28 = v27;
  uint64_t v29 = v69;
  v69(v4, v26);
  v61(v8, v25);
  uint64_t v72 = v59;
  uint64_t v30 = v54;
  v71[0] = v54;
  id v31 = objc_allocWithZone((Class)PREditingLook);
  id v60 = v55;
  id v55 = v30;
  id v32 = sub_10001436C(0x646972674CLL, 0xE500000000000000, v53, v28, v63, v71);
  *(void *)(v62 + 48) = v32;
  uint64_t v33 = v25;
  ((void (*)(char *, void, uint64_t))v66)(v8, enum case for EmojiPosterLayoutStyle.circular(_:), v25);
  uint64_t v34 = v58;
  ((void (*)(char *, void, uint64_t))v64)(v4, v57, v58);
  uint64_t v57 = sub_100017D08();
  uint64_t v36 = v35;
  v29(v4, v34);
  int64_t v37 = v61;
  v61(v8, v33);
  uint64_t v38 = v59;
  uint64_t v72 = v59;
  id v39 = v55;
  v71[0] = v55;
  id v40 = objc_allocWithZone((Class)PREditingLook);
  id v60 = v60;
  id v41 = v39;
  uint64_t v42 = v63;
  id v43 = sub_10001436C(0x616C756372696353, 0xE900000000000072, v57, v36, v63, v71);
  uint64_t v44 = v62;
  *(void *)(v62 + 56) = v43;
  ((void (*)(char *, void, uint64_t))v66)(v8, enum case for EmojiPosterLayoutStyle.spiral(_:), v33);
  ((void (*)(char *, void, uint64_t))v64)(v4, v56, v34);
  uint64_t v70 = sub_100017D08();
  uint64_t v46 = v45;
  v69(v4, v34);
  v37(v8, v33);
  uint64_t v72 = v38;
  v71[0] = v41;
  id v47 = objc_allocWithZone((Class)PREditingLook);
  id v48 = v60;
  id v49 = v41;
  *(void *)(v44 + 64) = sub_10001436C(0x6C61726970734DLL, 0xE700000000000000, v70, v46, v42, v71);
  v71[0] = v44;
  sub_100017FF8();
  uint64_t v50 = v71[0];

  return v50;
}

void *sub_100015DB0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100018198();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)sub_100018168();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        id v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, "identifier", v22);
        uint64_t v16 = sub_100017F88();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_1000181F8();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100015F58()
{
  uint64_t v1 = sub_100017C88();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  __chkstk_darwin(v1);
  id v41 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100017C98();
  uint64_t v46 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005AFC(&qword_100021B98);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v44 = v0;
  uint64_t v12 = v0 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  sub_100014CC0(v12, (uint64_t)v11, &qword_100021B98);
  uint64_t v13 = sub_100017D28();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  uint64_t result = v45(v11, 1, v13);
  if (result == 1)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  sub_100017CE8();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v14 + 8);
  v16(v11, v13);
  uint64_t v17 = v46;
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v46 + 88))(v5, v3);
  if (v18 == enum case for EmojiPosterSizeVariant.small(_:)) {
    goto LABEL_3;
  }
  if (v18 == enum case for EmojiPosterSizeVariant.medium(_:))
  {
    uint64_t v19 = 77;
  }
  else
  {
    if (v18 != enum case for EmojiPosterSizeVariant.large(_:))
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v3);
LABEL_3:
      uint64_t v19 = 83;
      goto LABEL_8;
    }
    uint64_t v19 = 76;
  }
LABEL_8:
  sub_100014CC0(v12, (uint64_t)v9, &qword_100021B98);
  uint64_t result = v45(v9, 1, v13);
  if (result == 1)
  {
LABEL_34:
    __break(1u);
    return result;
  }
  char v20 = v41;
  sub_100017CD8();
  v16(v9, v13);
  uint64_t v22 = v42;
  uint64_t v21 = v43;
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v20, v43);
  if (v23 == enum case for EmojiPosterLayoutStyle.offsetGrid(_:))
  {
    unint64_t v24 = (void *)0xE400000000000000;
    uint64_t v25 = 1684632167;
  }
  else if (v23 == enum case for EmojiPosterLayoutStyle.circular(_:))
  {
    unint64_t v24 = (void *)0xE800000000000000;
    uint64_t v25 = 0x72616C7563726963;
  }
  else
  {
    uint64_t v25 = 0x6C6172697073;
    if (v23 != enum case for EmojiPosterLayoutStyle.spiral(_:)) {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
    }
    unint64_t v24 = (void *)0xE600000000000000;
  }
  uint64_t v48 = v19;
  unint64_t v49 = 0xE100000000000000;
  v50._countAndFlagsBits = v25;
  v50._object = v24;
  sub_100017FB8(v50);
  swift_bridgeObjectRelease();
  uint64_t v26 = v48;
  uint64_t v27 = v49;
  unint64_t v28 = sub_100015700();
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_100015DB0(v28, v26, v27);
  uint64_t result = swift_bridgeObjectRelease_n();
  if (!v29)
  {
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_100018198();
      uint64_t result = swift_bridgeObjectRelease();
      if (v39)
      {
LABEL_20:
        if ((v28 & 0xC000000000000001) == 0)
        {
          if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v31 = *(id *)(v28 + 32);
LABEL_23:
            id v32 = v31;
            swift_bridgeObjectRelease();
            id v30 = [v32 identifier];

            goto LABEL_24;
          }
          __break(1u);
          goto LABEL_33;
        }
LABEL_31:
        id v31 = (id)sub_100018168();
        goto LABEL_23;
      }
    }
    else if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  id v30 = [v29 identifier];
LABEL_24:
  uint64_t v33 = sub_100017F88();
  unint64_t v35 = v34;

  swift_bridgeObjectRetain_n();
  uint64_t v36 = sub_100017EB8();
  os_log_type_t v37 = sub_100018078();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_1000088D4(v33, v35, &v48);
    sub_1000180E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Initial look: %s", v38, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return v33;
}

void sub_1000165D0(void *a1)
{
  swift_getObjectType();
  unint64_t v3 = sub_1000153A8();
  uint64_t v4 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_currentDeviceInterfaceOrientation;
  if (v3 == *(void *)(v1
                       + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_currentDeviceInterfaceOrientation))
    return;
  unint64_t v5 = v3;
  id v6 = [a1 currentLook];
  id v7 = [v6 identifier];

  uint64_t v8 = sub_100017F88();
  uint64_t v10 = v9;

  *(void *)(v1 + v4) = v5;
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC);
  if (v11)
  {
    uint64_t v12 = self;
    id v13 = v11;
    id v14 = [v12 currentDevice];
    id v15 = [v14 userInterfaceIdiom];

    if (v15 == (id)1) {
      [v13 dismissViewControllerAnimated:1 completion:0];
    }
  }
  uint64_t v16 = (uint64_t *)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
  swift_beginAccess();
  uint64_t v17 = *v16;
  uint64_t v18 = *v16 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(*v16 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & *(void *)(*v16 + 64);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v23 = 0;
  while (1)
  {
    if (v21)
    {
      unint64_t v25 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v26 = v25 | (v23 << 6);
      goto LABEL_26;
    }
    int64_t v27 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v27 >= v22) {
      goto LABEL_31;
    }
    unint64_t v28 = *(void *)(v18 + 8 * v27);
    ++v23;
    if (!v28)
    {
      int64_t v23 = v27 + 1;
      if (v27 + 1 >= v22) {
        goto LABEL_31;
      }
      unint64_t v28 = *(void *)(v18 + 8 * v23);
      if (!v28)
      {
        int64_t v23 = v27 + 2;
        if (v27 + 2 >= v22) {
          goto LABEL_31;
        }
        unint64_t v28 = *(void *)(v18 + 8 * v23);
        if (!v28) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v21 = (v28 - 1) & v28;
    unint64_t v26 = __clz(__rbit64(v28)) + (v23 << 6);
LABEL_26:
    uint64_t v30 = 16 * v26;
    id v31 = (void *)(*(void *)(v17 + 48) + v30);
    id v32 = *(void **)(*(void *)(v17 + 56) + v30);
    if (*v31 != v8 || v31[1] != v10) {
      sub_1000181F8();
    }
    id v24 = v32;
    sub_100017C38();
  }
  int64_t v29 = v27 + 3;
  if (v29 >= v22)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  unint64_t v28 = *(void *)(v18 + 8 * v29);
  if (v28)
  {
    int64_t v23 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v23 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v23 >= v22) {
      goto LABEL_31;
    }
    unint64_t v28 = *(void *)(v18 + 8 * v23);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_34:
  __break(1u);
}

void sub_100016894()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (*(void *)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_emojiRenderer))
  {
    swift_retain();
    sub_100017C58();
    swift_release();
    unint64_t v5 = (void *)(v0 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
    swift_beginAccess();
    *unint64_t v5 = &_swiftEmptyDictionarySingleton;
    swift_bridgeObjectRelease();
    uint64_t v6 = OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC;
    id v7 = *(void **)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_inputAccessoryVC);
    if (v7)
    {
      id v8 = v7;
      sub_100017B98();

      id v7 = *(void **)(v1 + v6);
    }
    *(void *)(v1 + v6) = 0;

    uint64_t v9 = sub_100017D28();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
    uint64_t v10 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
    swift_beginAccess();
    sub_10001459C((uint64_t)v4, v10);
    swift_endAccess();
    uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor);
    *(void *)(v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_editor) = 0;
  }
  else
  {
    __break(1u);
  }
}

void sub_100016A1C(void *a1, void *a2)
{
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = self;
  sub_100005AFC(&qword_1000219A0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100018B40;
  id v6 = [a2 leadingAnchor];
  id v7 = [a1 leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];

  *(void *)(v5 + 32) = v8;
  id v9 = [a2 trailingAnchor];
  id v10 = [a1 trailingAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v5 + 40) = v11;
  id v12 = [a2 topAnchor];
  id v13 = [a1 topAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v5 + 48) = v14;
  id v15 = [a2 bottomAnchor];
  id v16 = [a1 bottomAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];

  *(void *)(v5 + 56) = v17;
  sub_100017FF8();
  sub_10000A4A0(0, &qword_100021C10);
  Class isa = sub_100017FE8().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];
}

void sub_100016C8C(void *a1, void *a2)
{
  id v46 = a1;
  uint64_t v4 = sub_100017DC8();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100017D28();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [a2 identifier];
  uint64_t v13 = sub_100017F88();
  uint64_t v15 = v14;

  uint64_t v47 = v2;
  id v16 = (uint64_t *)(v2 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_viewControllers);
  swift_beginAccess();
  uint64_t v17 = *v16;
  if (*(void *)(*v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_100008F3C(v13, v15);
    if (v19)
    {
      uint64_t v20 = *(void *)(v17 + 56) + 16 * v18;
      unint64_t v21 = *(void **)(v20 + 8);
      id v22 = *(id *)v20;
      id v23 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = v47;
  sub_10000F200(a2, (uint64_t)v11);
  if (*(void *)(v24 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_emojiRenderer))
  {
    id v25 = objc_allocWithZone((Class)sub_100017C48());
    swift_retain();
    unint64_t v26 = (void *)sub_100017C18();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v7, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    id v22 = v26;
    sub_100017C08();
    sub_100017E58();
    id v23 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    sub_100017CB8();
    sub_100017E48();
    id v27 = [a2 identifier];
    uint64_t v28 = sub_100017F88();
    uint64_t v30 = v29;

    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v48 = *v16;
    *id v16 = 0x8000000000000000;
    sub_10001504C((uint64_t)v22, (uint64_t)v23, v28, v30, isUniquelyReferenced_nonNull_native);
    *id v16 = v48;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_8:
    id v32 = v46;
    id v33 = [v46 backgroundView];
    id v34 = [v23 view];
    if (v34)
    {
      unint64_t v35 = v34;
      [v33 addSubview:v34];

      id v36 = [v23 view];
      if (v36)
      {
        os_log_type_t v37 = v36;
        id v38 = [v32 backgroundView];
        sub_100016A1C(v37, v38);

        id v39 = [v32 foregroundView];
        id v40 = [v22 view];
        if (v40)
        {
          id v41 = v40;
          [v39 addSubview:v40];

          id v42 = [v22 view];
          if (v42)
          {
            uint64_t v43 = v42;
            id v44 = [v32 foregroundView];
            sub_100016A1C(v43, v44);

            sub_100017C38();
            return;
          }
          goto LABEL_16;
        }
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
}

uint64_t sub_100017190()
{
  uint64_t v1 = v0;
  uint64_t v23 = sub_100017D48();
  uint64_t v2 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100017DC8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005AFC(&qword_100021B98);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [objc_allocWithZone((Class)PREditorColorPickerConfiguration) init];
  sub_100017B78();
  uint64_t v13 = (void *)sub_100017B58();
  [v12 setColorPalette:v13];

  [v12 setColorWellDisplayMode:2];
  uint64_t v14 = v1 + OBJC_IVAR____TtC20EmojiPosterExtension36EmojiPosterExtensionEditorController_templateConfiguration;
  swift_beginAccess();
  sub_100014CC0(v14, (uint64_t)v11, &qword_100021B98);
  uint64_t v15 = sub_100017D28();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v11, 1, v15);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_100017CB8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
    sub_100017D78();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    Class isa = sub_100017D38().super.isa;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v23);
    id v19 = [objc_allocWithZone((Class)PRPosterColor) initWithColor:isa];

    sub_100005AFC(&qword_100021C00);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100018B10;
    *(void *)(v20 + 56) = sub_10000A4A0(0, &qword_1000219A8);
    *(void *)(v20 + 32) = v19;
    id v21 = v19;
    Class v22 = sub_100017FE8().super.isa;
    swift_bridgeObjectRelease();
    [v12 setSuggestedColors:v22];

    [v12 setSelectedColor:v21];
    return (uint64_t)v12;
  }
  return result;
}

void *sub_10001753C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100017580()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000175C8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10001767C;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_100021C30 + dword_100021C30);
  return v6(v2, v3, v4);
}

uint64_t sub_10001767C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100017774()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100017AB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100021C40 + dword_100021C40);
  return v6(v2, v3, v4);
}

uint64_t sub_100017838()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100017878(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100017AB4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100021C50 + dword_100021C50);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100017944()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001797C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001767C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100021C60 + dword_100021C60);
  return v6(a1, v4);
}

uint64_t sub_100017A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005AFC(&qword_100021B98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017AB8()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100017AC8()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100017AD8()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100017AE8()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_100017AF8()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_100017B08()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_100017B18()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_100017B28()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100017B38()
{
  return static Locale.current.getter();
}

uint64_t sub_100017B48()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100017B58()
{
  return static EmojiColorPalette.backgroundPalette(suggestedColor:)();
}

uint64_t sub_100017B68()
{
  return static EmojiColorPalette.titlePalette()();
}

uint64_t sub_100017B78()
{
  return type metadata accessor for EmojiColorPalette();
}

uint64_t sub_100017B88()
{
  return dispatch thunk of EmojiEditingInputViewController.updateForEditingEmoji(_:)();
}

uint64_t sub_100017B98()
{
  return dispatch thunk of EmojiEditingInputViewController.cleanupKeyboardResources()();
}

uint64_t sub_100017BA8()
{
  return EmojiEditingInputViewController.init(emoji:)();
}

uint64_t sub_100017BB8()
{
  return dispatch thunk of EmojiEditingInputViewController.height(forOrientation:)();
}

uint64_t sub_100017BC8()
{
  return dispatch thunk of EmojiEditingInputViewController.delegate.setter();
}

uint64_t sub_100017BD8()
{
  return type metadata accessor for EmojiEditingInputViewController();
}

uint64_t sub_100017BE8()
{
  return dispatch thunk of EmojiForegroundLayersViewController.wakeProgress.setter();
}

uint64_t sub_100017BF8()
{
  return dispatch thunk of EmojiForegroundLayersViewController.configuration.getter();
}

uint64_t sub_100017C08()
{
  return dispatch thunk of EmojiForegroundLayersViewController.configuration.setter();
}

uint64_t sub_100017C18()
{
  return EmojiForegroundLayersViewController.init(emojiRenderer:)();
}

uint64_t sub_100017C28()
{
  return dispatch thunk of EmojiForegroundLayersViewController.unlockProgress.setter();
}

uint64_t sub_100017C38()
{
  return dispatch thunk of EmojiForegroundLayersViewController.setDeviceInterfaceOrientation(_:animated:)();
}

uint64_t sub_100017C48()
{
  return type metadata accessor for EmojiForegroundLayersViewController();
}

uint64_t sub_100017C58()
{
  return dispatch thunk of EmojiRenderer.clearCache()();
}

uint64_t sub_100017C68()
{
  return EmojiRenderer.init()();
}

uint64_t sub_100017C78()
{
  return type metadata accessor for EmojiRenderer();
}

uint64_t sub_100017C88()
{
  return type metadata accessor for EmojiPosterLayoutStyle();
}

uint64_t sub_100017C98()
{
  return type metadata accessor for EmojiPosterSizeVariant();
}

uint64_t sub_100017CA8()
{
  return EmojiPosterConfiguration.init(backgroundConfiguration:layoutStyle:sizeVariant:emoji:usesParalax:)();
}

uint64_t sub_100017CB8()
{
  return EmojiPosterConfiguration.backgroundConfiguration.getter();
}

uint64_t sub_100017CC8()
{
  return EmojiPosterConfiguration.identifier()()._countAndFlagsBits;
}

uint64_t sub_100017CD8()
{
  return EmojiPosterConfiguration.layoutStyle.getter();
}

uint64_t sub_100017CE8()
{
  return EmojiPosterConfiguration.sizeVariant.getter();
}

uint64_t sub_100017CF8()
{
  return EmojiPosterConfiguration.usesParalax.getter();
}

uint64_t sub_100017D08()
{
  return static EmojiPosterConfiguration.localizedString(forStyle:sizeVariant:)();
}

uint64_t sub_100017D18()
{
  return EmojiPosterConfiguration.emoji.getter();
}

uint64_t sub_100017D28()
{
  return type metadata accessor for EmojiPosterConfiguration();
}

UIColor sub_100017D38()
{
  return EmojiPosterBackgroundColor.uiColor()();
}

uint64_t sub_100017D48()
{
  return type metadata accessor for EmojiPosterBackgroundColor();
}

uint64_t sub_100017D58()
{
  return EmojiPosterBackgroundColor.init(_:)();
}

uint64_t sub_100017D68()
{
  return type metadata accessor for EmojiPosterBackgroundStyle();
}

uint64_t sub_100017D78()
{
  return EmojiPosterBackgroundConfiguration.backgroundColor.getter();
}

uint64_t sub_100017D88()
{
  return EmojiPosterBackgroundConfiguration.init(backgroundStyle:backgroundColor:gradientProperties:isSuggestedColor:shouldRecalculateSuggestedColor:)();
}

uint64_t sub_100017D98()
{
  return EmojiPosterBackgroundConfiguration.backgroundStyle.getter();
}

uint64_t sub_100017DA8()
{
  return EmojiPosterBackgroundConfiguration.isSuggestedColor.getter();
}

uint64_t sub_100017DB8()
{
  return EmojiPosterBackgroundConfiguration.gradientProperties.getter();
}

uint64_t sub_100017DC8()
{
  return type metadata accessor for EmojiPosterBackgroundConfiguration();
}

uint64_t sub_100017DD8()
{
  return dispatch thunk of ConfigurationProvider.heroConfiguration()();
}

uint64_t sub_100017DE8()
{
  return dispatch thunk of ConfigurationProvider.stockConfigurations()();
}

uint64_t sub_100017DF8()
{
  return dispatch thunk of ConfigurationProvider.configurationsForFocus()();
}

uint64_t sub_100017E08()
{
  return ConfigurationProvider.init()();
}

uint64_t sub_100017E18()
{
  return type metadata accessor for ConfigurationProvider();
}

uint64_t sub_100017E28()
{
  return dispatch thunk of BackgroundViewController.wakeProgress.setter();
}

uint64_t sub_100017E38()
{
  return dispatch thunk of BackgroundViewController.unlockProgress.setter();
}

uint64_t sub_100017E48()
{
  return dispatch thunk of BackgroundViewController.backgroundConfiguration.setter();
}

uint64_t sub_100017E58()
{
  return type metadata accessor for BackgroundViewController();
}

uint64_t sub_100017E68()
{
  return _AnySceneConfiguration.init<A>(erasing:)();
}

uint64_t sub_100017E78()
{
  return type metadata accessor for _AnySceneConfiguration();
}

uint64_t sub_100017E88()
{
  return static _AppExtension<>.main()();
}

uint64_t sub_100017E98()
{
  return _AppExtension.hostAuditToken.getter();
}

uint64_t sub_100017EA8()
{
  return static _SceneBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100017EB8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100017EC8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100017ED8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100017EE8()
{
  return type metadata accessor for PREditingConfiguration();
}

uint64_t sub_100017EF8()
{
  return PREditingConfiguration.init(_:)();
}

uint64_t sub_100017F08()
{
  return PRProviderConfiguration.init(updatingDelegate:content:)();
}

uint64_t sub_100017F18()
{
  return type metadata accessor for PRRenderingConfiguration();
}

uint64_t sub_100017F28()
{
  return PRRenderingConfiguration.init(_:)();
}

NSDictionary sub_100017F38()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100017F48()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017F58()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100017F68()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100017F78()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100017F88()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017F98()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_100017FA8()
{
  return String.hash(into:)();
}

void sub_100017FB8(Swift::String a1)
{
}

Swift::Int sub_100017FC8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100017FD8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100017FE8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100017FF8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100018008()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100018018()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100018028()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100018038()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100018048()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100018058()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100018068()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100018078()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100018088()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100018098()
{
  return static UISheetPresentationControllerDetent.custom(identifier:resolver:)();
}

uint64_t sub_1000180A8()
{
  return static UIColor.emp_suggestedColorForEmoji(_:)();
}

uint64_t sub_1000180B8()
{
  return UIColor.luminance.getter();
}

uint64_t sub_1000180C8()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_1000180D8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000180E8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000180F8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100018108(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100018118()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100018128()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100018138()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100018148()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018158()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100018168()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100018178()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100018188()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018198()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000181A8()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000181B8()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000181C8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000181D8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000181E8()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000181F8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018208()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018218()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018228()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100018238()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100018248()
{
  return Hasher._finalize()();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
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

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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