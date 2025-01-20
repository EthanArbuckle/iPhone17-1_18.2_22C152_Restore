uint64_t getEnumTagSinglePayload for ReadArticleInformation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0AC4120);
}

uint64_t sub_1E0AB1570(uint64_t a1)
{
  v3 = (void *)(v1 + qword_1EBF0F378);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t sub_1E0AB15C4@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGeneratorPipeline.domain.getter(a1);
}

uint64_t ArticlesGeneratorPipeline.domain.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_1EBF0F370;
  uint64_t v4 = sub_1E0AC4590();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_1E0AB165C()
{
  sub_1E0AB16B8();
  return swift_retain();
}

uint64_t sub_1E0AB1684()
{
  sub_1E0AB16B8();
  return swift_retain();
}

uint64_t sub_1E0AB16B8()
{
  uint64_t v1 = v0 + qword_1EBF0F378;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t ArticlesGeneratorPipeline.init(context:managedArticles:)(uint64_t a1, uint64_t a2)
{
  uint64_t v93 = a1;
  uint64_t v4 = *v2;
  sub_1E0AB25A8();
  uint64_t v88 = *(void *)(v5 - 8);
  uint64_t v89 = v5;
  MEMORY[0x1F4188790](v5);
  v87 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AB263C();
  uint64_t v79 = v7;
  uint64_t v78 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v77 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AB22EC(0, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  v82 = (char *)&v71 - v10;
  uint64_t v11 = sub_1E0AC45D0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v76 = v13;
  v14 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AB22EC(0, &qword_1EBF0F1B8, (uint64_t (*)(uint64_t))sub_1E0AB3054, MEMORY[0x1E4F1AC08]);
  uint64_t v83 = *(void *)(v15 - 8);
  uint64_t v84 = v15;
  MEMORY[0x1F4188790](v15);
  v81 = (char *)&v71 - v16;
  uint64_t v17 = sub_1E0AC4790();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC4760();
  v21 = sub_1E0AC4780();
  os_log_type_t v22 = sub_1E0AC4980();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v91 = v12;
  uint64_t v92 = v11;
  v85 = v14;
  uint64_t v86 = a2;
  uint64_t v90 = v4;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = v4;
    uint64_t v27 = v25;
    uint64_t v96 = v25;
    *(_DWORD *)v24 = 136446210;
    v98[0] = v26;
    swift_getMetatypeMetadata();
    uint64_t v28 = sub_1E0AC48A0();
    v98[0] = sub_1E0AB26E8(v28, v29, &v96);
    sub_1E0AC49E0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1E0AAF000, v21, v22, "[%{public}s]: Initializing ArticlesGeneratorPipeline", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E4E3B040](v27, -1, -1);
    MEMORY[0x1E4E3B040](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (qword_1EBF0F358 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1E0AC4590();
  uint64_t v31 = __swift_project_value_buffer(v30, (uint64_t)qword_1EBF0F228);
  uint64_t v32 = v94;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v94 + qword_1EBF0F370, v31, v30);
  uint64_t v33 = v93;
  sub_1E0AC45A0();
  __swift_project_boxed_opaque_existential_1(v98, v99);
  v34 = (void *)sub_1E0AC4530();
  v35 = (objc_class *)type metadata accessor for ArticleChangeDetector();
  v36 = (char *)objc_allocWithZone(v35);
  uint64_t v37 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1E0AB24D8();
  uint64_t v75 = v38;
  swift_allocObject();
  v39 = v36;
  *(void *)&v36[v37] = sub_1E0AC47F0();
  *(void *)&v39[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  id v40 = objc_msgSend(self, sel_healthArticlesDefaultsDomainWithHealthStore_, v34);
  *(void *)&v39[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v40;

  v97.receiver = v39;
  v97.super_class = v35;
  id v41 = objc_msgSendSuper2(&v97, sel_init);
  sub_1E0AB2AA8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  *(void *)(v32 + qword_1EBF0F368) = v41;
  uint64_t v42 = v86;
  *(void *)(v32 + qword_1EBF0F360) = v86;
  sub_1E0AB22EC(0, &qword_1EBF0F200, (uint64_t (*)(uint64_t))sub_1E0AB2540, MEMORY[0x1E4FBBE00]);
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1E0AC5310;
  uint64_t v44 = *(void *)(v90 + 88);
  uint64_t v74 = *(void *)(v90 + 80);
  uint64_t v73 = v44;
  uint64_t v45 = type metadata accessor for ArticlesGenerator();
  uint64_t v46 = (uint64_t)v85;
  uint64_t v47 = v33;
  v72 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 16);
  v72(v85, v33, v92);
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  uint64_t v49 = (uint64_t)v82;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(ArticleInformation - 8) + 56))(v82, 1, 1, ArticleInformation);
  swift_bridgeObjectRetain_n();
  v50 = (char *)v41;
  uint64_t v51 = ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(v46, v42, v49);
  uint64_t v99 = v45;
  uint64_t WitnessTable = swift_getWitnessTable();
  v98[0] = v51;
  sub_1E0AB3054();
  v52 = v81;
  sub_1E0AC4810();
  sub_1E0AB2450();
  uint64_t v53 = v84;
  uint64_t v54 = sub_1E0AC4850();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v53);
  *(void *)(v43 + 32) = v54;
  v98[0] = v43;
  sub_1E0AC4900();
  uint64_t v55 = v98[0];
  uint64_t v96 = v98[0];
  char v56 = sub_1E0AC45B0();
  id v80 = v50;
  if (v56)
  {
    v59 = (uint64_t *)&v50[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher];
    swift_beginAccess();
    uint64_t v95 = *v59;
    uint64_t v57 = v92;
    v72((char *)v46, v47, v92);
    uint64_t v58 = v91;
    unint64_t v60 = (*(unsigned __int8 *)(v91 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
    unint64_t v61 = (v76 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v62 = swift_allocObject();
    uint64_t v63 = v73;
    *(void *)(v62 + 16) = v74;
    *(void *)(v62 + 24) = v63;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v58 + 32))(v62 + v60, v46, v57);
    *(void *)(v62 + v61) = v42;
    *(void *)(v62 + ((v61 + 15) & 0xFFFFFFFFFFFFFFF8)) = v90;
    sub_1E0AB2350(&qword_1EBF0F300, (void (*)(uint64_t))sub_1E0AB24D8);
    swift_retain();
    v64 = v77;
    sub_1E0AC4860();
    swift_release();
    swift_release();
    sub_1E0AB2350(&qword_1EBF0F2E0, (void (*)(uint64_t))sub_1E0AB263C);
    uint64_t v65 = v79;
    sub_1E0AC4850();
    uint64_t v66 = (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v64, v65);
    MEMORY[0x1E4E3A8F0](v66);
    if (*(void *)(v96 + 16) >= *(void *)(v96 + 24) >> 1) {
      sub_1E0AC4910();
    }
    sub_1E0AC4920();
    sub_1E0AC4900();
    uint64_t v55 = v96;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v58 = v91;
    uint64_t v57 = v92;
  }
  uint64_t v95 = v55;
  sub_1E0AB2540();
  sub_1E0AB22EC(0, &qword_1EBF0F1E0, (uint64_t (*)(uint64_t))sub_1E0AB2540, MEMORY[0x1E4FBB320]);
  sub_1E0AB2350(&qword_1EBF0F2F0, (void (*)(uint64_t))sub_1E0AB2540);
  sub_1E0AB23C8();
  v67 = v87;
  sub_1E0AC47C0();
  sub_1E0AB2350(&qword_1EBF0F2E8, (void (*)(uint64_t))sub_1E0AB25A8);
  uint64_t v68 = v89;
  uint64_t v69 = sub_1E0AC4850();

  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v93, v57);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v67, v68);
  uint64_t result = v94;
  *(void *)(v94 + qword_1EBF0F378) = v69;
  return result;
}

void sub_1E0AB2288(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_1E0AB22EC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1E0AB2350(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t sub_1E0AB23C8()
{
  unint64_t result = qword_1EBF0F320;
  if (!qword_1EBF0F320)
  {
    sub_1E0AB22EC(255, &qword_1EBF0F1E0, (uint64_t (*)(uint64_t))sub_1E0AB2540, MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0F320);
  }
  return result;
}

unint64_t sub_1E0AB2450()
{
  unint64_t result = qword_1EBF0F308;
  if (!qword_1EBF0F308)
  {
    sub_1E0AB22EC(255, &qword_1EBF0F1B8, (uint64_t (*)(uint64_t))sub_1E0AB3054, MEMORY[0x1E4F1AC08]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0F308);
  }
  return result;
}

void sub_1E0AB24D8()
{
  if (!qword_1EBF0F1B0)
  {
    unint64_t v0 = sub_1E0AC4800();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F1B0);
    }
  }
}

void sub_1E0AB2540()
{
  if (!qword_1EBF0F1A0)
  {
    sub_1E0AB3054();
    unint64_t v0 = sub_1E0AC47D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F1A0);
    }
  }
}

void sub_1E0AB25A8()
{
  if (!qword_1EBF0F198)
  {
    sub_1E0AB2540();
    sub_1E0AB2350(&qword_1EBF0F2F0, (void (*)(uint64_t))sub_1E0AB2540);
    unint64_t v0 = sub_1E0AC47B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F198);
    }
  }
}

void sub_1E0AB263C()
{
  if (!qword_1EBF0F190)
  {
    sub_1E0AB24D8();
    sub_1E0AB3054();
    sub_1E0AB2350(&qword_1EBF0F300, (void (*)(uint64_t))sub_1E0AB24D8);
    unint64_t v0 = sub_1E0AC47A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F190);
    }
  }
}

uint64_t sub_1E0AB26E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1E0AB2868(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1E0AB280C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1E0AB280C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1E0AB280C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1E0AB2868(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1E0AC49F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1E0AB4C78(a5, a6);
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
  uint64_t v8 = sub_1E0AC4AC0();
  if (!v8)
  {
    sub_1E0AC4AD0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1E0AC4AE0();
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

uint64_t storeEnumTagSinglePayload for ReadArticleInformation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0AC41D0);
}

uint64_t type metadata accessor for ReadArticleInformation()
{
  uint64_t result = qword_1EBF0F248;
  if (!qword_1EBF0F248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for ArticleChangeDetector()
{
  return self;
}

void sub_1E0AB2AA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1E0AC4790();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC4760();
  uint64_t v6 = sub_1E0AC4780();
  os_log_type_t v7 = sub_1E0AC4980();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1E0AAF000, v6, v7, "ArticleChangeDetector subscribed to article status updates.", v8, 2u);
    MEMORY[0x1E4E3B040](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v9 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v10 = (void *)sub_1E0AC49A0();
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v1, sel_articleStatusDidChange_, v10, 0);
}

uint64_t type metadata accessor for ArticlesGenerator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t ArticlesGenerator.init(context:managedArticles:readArticleInfo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  *(void *)(v4 + qword_1EBF0F240) = 0;
  if (qword_1EBF0F358 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1E0AC4590();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EBF0F228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v4 + qword_1EBF0F3A0, v9, v8);
  sub_1E0AB2F68(a3, v4 + qword_1EBF0F388);
  *(void *)(v4 + qword_1EBF0F380) = a2;
  uint64_t v10 = v4 + qword_1EBF0F398;
  uint64_t v11 = sub_1E0AC45D0();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, a1, v11);
  uint64_t v13 = self;
  sub_1E0AC45A0();
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  v14 = (void *)sub_1E0AC4530();
  id v15 = objc_msgSend(v13, sel_healthArticlesDefaultsDomainWithHealthStore_, v14);

  sub_1E0AB2EDC(a3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *(void *)(v4 + qword_1EBF0F390) = v15;
  return v4;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1E0AB2EDC(uint64_t a1)
{
  sub_1E0AB2288(0, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E0AB2F68(uint64_t a1, uint64_t a2)
{
  sub_1E0AB2288(0, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  ArticlesGenerator.init(context:managedArticles:readArticleInfo:)(a1, a2, a3);
  return v6;
}

unint64_t sub_1E0AB3054()
{
  unint64_t result = qword_1EBF0F100;
  if (!qword_1EBF0F100)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBF0F100);
  }
  return result;
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t ArticlesGenerator.domain.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AB36FC(&qword_1EBF0F3A0, MEMORY[0x1E4F671B0], a1);
}

uint64_t sub_1E0AB3114@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1E0AB316C();
  *a1 = result;
  return result;
}

uint64_t sub_1E0AB3140()
{
  uint64_t v0 = swift_retain();
  return sub_1E0AB3664(v0);
}

uint64_t sub_1E0AB316C()
{
  uint64_t v1 = qword_1EBF0F240;
  if (*(uint64_t *)((char *)v0 + qword_1EBF0F240))
  {
    uint64_t v2 = *(uint64_t *)((char *)v0 + qword_1EBF0F240);
  }
  else
  {
    uint64_t v2 = sub_1E0AB31D4(v0);
    *(uint64_t *)((char *)v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_1E0AB31D4(uint64_t *a1)
{
  uint64_t v1 = *a1;
  sub_1E0AB3EDC();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = *(void *)(v1 + 80);
  v8[3] = *(void *)(v1 + 88);
  v8[4] = v7;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1E4F1AAE0];
  sub_1E0AB40BC(0, &qword_1EBF0F1A8, MEMORY[0x1E4F1AAE0]);
  sub_1E0AB412C(&qword_1EBF0F2F8, &qword_1EBF0F1A8, v9);
  sub_1E0AC4830();
  sub_1E0AB4064();
  uint64_t v10 = sub_1E0AC4850();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v10;
}

uint64_t sub_1E0AB33A8@<X0>(uint64_t *a1@<X8>)
{
  sub_1E0AB2288(0, &qword_1EBF0F1C0, (uint64_t (*)(uint64_t))sub_1E0AB3F90, MEMORY[0x1E4F1AC08]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v16 - v5;
  sub_1E0AB40BC(0, &qword_1EBF0F1C8, MEMORY[0x1E4F1AC18]);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v16 - v10;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v16 = (void *)Strong;
    uint64_t v13 = (void *)type metadata accessor for ArticlesGenerator();
    uint64_t v16 = sub_1E0AB84C0(v13, (uint64_t)&off_1F3B8BF50);
    sub_1E0AB3F90();
    sub_1E0AC4810();
    sub_1E0AB4170();
    uint64_t v14 = sub_1E0AC4850();
    swift_release();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_1E0AB3F90();
    sub_1E0AC4820();
    sub_1E0AB412C(&qword_1EAD61B00, &qword_1EBF0F1C8, MEMORY[0x1E4F1AC18]);
    uint64_t v14 = sub_1E0AC4850();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  *a1 = v14;
  return result;
}

uint64_t sub_1E0AB3664(uint64_t a1)
{
  *(void *)(v1 + qword_1EBF0F240) = a1;
  return swift_release();
}

uint64_t (*sub_1E0AB367C(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = sub_1E0AB316C();
  return sub_1E0AB36C4;
}

uint64_t sub_1E0AB36C4(void *a1)
{
  *(void *)(a1[1] + qword_1EBF0F240) = *a1;
  return swift_release();
}

uint64_t ArticlesGenerator.generatorContext.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AB36FC(&qword_1EBF0F398, MEMORY[0x1E4F671B8], a1);
}

uint64_t sub_1E0AB36FC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  return v7(a3, v5, v6);
}

uint64_t sub_1E0AB3770()
{
  return sub_1E0AC45A0();
}

uint64_t sub_1E0AB379C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AB2F68(v1 + qword_1EBF0F388, a1);
}

uint64_t ArticlesGenerator.managedArticles.getter()
{
  sub_1E0AB3C78();
  return swift_bridgeObjectRetain();
}

void sub_1E0AB37D8(uint64_t a1, uint64_t a2)
{
  v7[0] = a1;
  v7[1] = a2;
  uint64_t v2 = sub_1E0AC43E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC46F0();
  sub_1E0AC46E0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F66FF8], v2);
  uint64_t v6 = (void *)sub_1E0AC45C0();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_1E0AC4400();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t ArticlesGenerator.deinit()
{
  uint64_t v1 = v0 + qword_1EBF0F3A0;
  uint64_t v2 = sub_1E0AC4590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = v0 + qword_1EBF0F398;
  uint64_t v4 = sub_1E0AC45D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1E0AB2EDC(v0 + qword_1EBF0F388);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ArticlesGenerator.__deallocating_deinit()
{
  ArticlesGenerator.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E0AB3B14()
{
  return sub_1E0AB316C();
}

uint64_t sub_1E0AB3B38@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGenerator.domain.getter(a1);
}

uint64_t sub_1E0AB3B5C()
{
  return sub_1E0AB3770();
}

uint64_t sub_1E0AB3B80@<X0>(uint64_t a1@<X8>)
{
  return ArticlesGenerator.generatorContext.getter(a1);
}

uint64_t sub_1E0AB3BA4@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0AB379C(a1);
}

uint64_t sub_1E0AB3BC8()
{
  sub_1E0AB3C78();
  return swift_bridgeObjectRetain();
}

id sub_1E0AB3BFC()
{
  uint64_t v0 = (void *)sub_1E0AB3ECC();
  return v0;
}

uint64_t sub_1E0AB3C34()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 184))();
}

uint64_t sub_1E0AB3C78()
{
  return *(void *)(v0 + qword_1EBF0F380);
}

uint64_t sub_1E0AB3C88()
{
  return 16;
}

__n128 sub_1E0AB3C94(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

void sub_1E0AB3CA4()
{
  sub_1E0AC4590();
  if (v0 <= 0x3F)
  {
    sub_1E0AC45D0();
    if (v1 <= 0x3F)
    {
      sub_1E0AB2288(319, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, MEMORY[0x1E4FBB718]);
      if (v2 <= 0x3F) {
        swift_initClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for ArticlesGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticlesGenerator);
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of ArticlesGenerator.publisher.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ArticlesGenerator.makeBasePluginArticleFeedItem(identifier:viewModel:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_1E0AB3ECC()
{
  return *(void *)(v0 + qword_1EBF0F390);
}

void sub_1E0AB3EDC()
{
  if (!qword_1EBF0F1D0)
  {
    uint64_t v0 = (uint64_t (*)(uint64_t, uint64_t, void, void))MEMORY[0x1E4F1AAE0];
    sub_1E0AB40BC(255, &qword_1EBF0F1A8, MEMORY[0x1E4F1AAE0]);
    sub_1E0AB412C(&qword_1EBF0F2F8, &qword_1EBF0F1A8, v0);
    unint64_t v1 = sub_1E0AC4840();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_1EBF0F1D0);
    }
  }
}

void sub_1E0AB3F90()
{
  if (!qword_1EBF0F1D8)
  {
    unint64_t v0 = sub_1E0AC4930();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F1D8);
    }
  }
}

uint64_t sub_1E0AB3FE8()
{
  swift_weakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1E0AB4020()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E0AB4058@<X0>(uint64_t *a1@<X8>)
{
  return sub_1E0AB33A8(a1);
}

unint64_t sub_1E0AB4064()
{
  unint64_t result = qword_1EBF0F318;
  if (!qword_1EBF0F318)
  {
    sub_1E0AB3EDC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0F318);
  }
  return result;
}

void sub_1E0AB40BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  if (!*a2)
  {
    sub_1E0AB3F90();
    unint64_t v7 = a3(a1, v6, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBC278]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_1E0AB412C(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, void, void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E0AB40BC(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1E0AB4170()
{
  unint64_t result = qword_1EBF0F310;
  if (!qword_1EBF0F310)
  {
    sub_1E0AB2288(255, &qword_1EBF0F1C0, (uint64_t (*)(uint64_t))sub_1E0AB3F90, MEMORY[0x1E4F1AC08]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBF0F310);
  }
  return result;
}

uint64_t static PluginFeedItem.makeArticleFeedItemWithMetadata(article:sourceProfile:pluginFeedItemConstructor:)@<X0>(void *a1@<X0>, void (*a2)(uint64_t, uint64_t, char *)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v62 = a3;
  uint64_t v59 = a4;
  uint64_t v5 = sub_1E0AC4790();
  uint64_t v57 = *(void *)(v5 - 8);
  uint64_t v58 = v5;
  MEMORY[0x1F4188790](v5);
  unint64_t v60 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E0AC45E0();
  uint64_t v50 = *(void *)(v7 - 8);
  uint64_t v51 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v54 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_1E0AC45F0();
  uint64_t v55 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790](v49);
  uint64_t v53 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_1E0AC4740();
  uint64_t v47 = *(void *)(v48 - 8);
  MEMORY[0x1F4188790](v48);
  uint64_t v46 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_1E0AC4710();
  uint64_t v11 = *(void *)(v61 - 8);
  MEMORY[0x1F4188790](v61);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_1E0AC4520();
  uint64_t v56 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  id v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v16 = sub_1E0AC46D0();
  uint64_t v18 = v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E0AC4670();
  sub_1E0AC4700();
  uint64_t v19 = v64;
  v63(v16, v18, v13);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v61);
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v61);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1E0AC4680();
    sub_1E0AC44A0();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1E0AC4680();
    sub_1E0AB4BB8();
    sub_1E0AC4950();
    swift_bridgeObjectRelease();
    sub_1E0AC4500();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1E0AC4660();
    sub_1E0AC4470();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1E0AC46A0();
    sub_1E0AC44E0();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1E0AC4690();
    os_log_type_t v22 = v15;
    uint64_t v24 = v50;
    uint64_t v23 = v51;
    uint64_t v25 = v49;
    if (v21)
    {
      if (v21 != 1) {
        goto LABEL_6;
      }
      uint64_t v26 = a1[3];
      uint64_t v64 = 0;
      __swift_project_boxed_opaque_existential_1(a1, v26);
      sub_1E0AC4680();
      uint64_t v27 = sub_1E0AC4950();
      swift_bridgeObjectRelease();
      sub_1E0AB4BF8(v27);
      uint64_t v29 = v28;
      swift_bridgeObjectRelease();
      if (v29)
      {
LABEL_6:
        uint64_t v30 = v46;
        sub_1E0AC4750();
        sub_1E0AB5074(qword_1EBF0F058, MEMORY[0x1E4F67668]);
        uint64_t v31 = v48;
        sub_1E0AC4430();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v31);
      }
    }
    (*(void (**)(char *, void, uint64_t))(v24 + 104))(v54, *MEMORY[0x1E4F67250], v23);
    uint64_t v32 = v53;
    sub_1E0AC4600();
    sub_1E0AC4430();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v25);
    uint64_t v33 = v60;
    sub_1E0AC4760();
    v34 = sub_1E0AC4780();
    os_log_type_t v35 = sub_1E0AC4980();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      v66[0] = v64;
      *(_DWORD *)uint64_t v36 = 136315394;
      uint64_t v37 = v52;
      uint64_t v65 = v52;
      sub_1E0AB5038();
      uint64_t v38 = sub_1E0AC48A0();
      uint64_t v65 = sub_1E0AB26E8(v38, v39, v66);
      uint64_t v40 = v37;
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2080;
      swift_beginAccess();
      sub_1E0AB5074(&qword_1EBF0F220, MEMORY[0x1E4F67110]);
      uint64_t v41 = sub_1E0AC4AF0();
      v66[5] = sub_1E0AB26E8(v41, v42, v66);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AAF000, v34, v35, "[%s] Making article feed item: %s", (uint8_t *)v36, 0x16u);
      uint64_t v43 = v64;
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v43, -1, -1);
      MEMORY[0x1E4E3B040](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v60, v58);
      uint64_t v44 = v59;
      uint64_t v45 = v56;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v57 + 8))(v33, v58);
      uint64_t v44 = v59;
      uint64_t v45 = v56;
      uint64_t v40 = v52;
    }
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v45 + 16))(v44, v22, v40);
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v22, v40);
  }
}

uint64_t static PluginFeedItem.mutualExclusionTagForArticle(_:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v2 = sub_1E0AC4690();
  if (!v3) {
    return 0;
  }
  if (v3 != 1) {
    return v2;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E0AC4680();
  sub_1E0AB4BB8();
  uint64_t v4 = sub_1E0AC4950();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_1E0AB4BF8(v4);
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_1E0AB4BB8()
{
  unint64_t result = qword_1EBF0F328;
  if (!qword_1EBF0F328)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBF0F328);
  }
  return result;
}

uint64_t sub_1E0AB4BF8(uint64_t a1)
{
  uint64_t result = sub_1E0AB50BC(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_1E0AB515C(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_1E0AB4C78(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1E0AB4D10(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E0AB4EEC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E0AB4EEC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1E0AB4D10(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1E0AB4E88(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1E0AC4AB0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1E0AC4AD0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1E0AC48C0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1E0AC4AE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1E0AC4AD0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1E0AB4E88(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1E0AB51B0();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E0AB4EEC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1E0AB51B0();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1E0AC4AE0();
  __break(1u);
  return result;
}

unint64_t sub_1E0AB5038()
{
  unint64_t result = qword_1EBF0F0F8;
  if (!qword_1EBF0F0F8)
  {
    sub_1E0AC4520();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBF0F0F8);
  }
  return result;
}

uint64_t sub_1E0AB5074(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E0AB50BC(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

uint64_t sub_1E0AB515C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_1E0AB51B0()
{
  if (!qword_1EBF0F210)
  {
    unint64_t v0 = sub_1E0AC4B00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F210);
    }
  }
}

uint64_t static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.articleActionForHighlightAlert(sourceIdentifier:dataProvider:healthStore:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1E0AB5500(a3, (uint64_t)v10);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(void *)(v7 + 32) = a4;
  sub_1E0AB55AC(v10, (_OWORD *)(v7 + 40));
  swift_bridgeObjectRetain();
  id v8 = a4;
  return sub_1E0AC4720();
}

uint64_t sub_1E0AB52B4(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  sub_1E0AB56B0();
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v15 = (char *)&v24 - v14;
  static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(a2, a3, a4, (uint64_t)&v24 - v14);
  uint64_t v16 = sub_1E0AC43D0();
  uint64_t v17 = *(void *)(v16 - 8);
  int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16);
  uint64_t result = sub_1E0AB5DBC((uint64_t)v15);
  if (v18 == 1)
  {
    uint64_t v20 = a5[3];
    id v25 = a1;
    __swift_project_boxed_opaque_existential_1(a5, v20);
    sub_1E0AC46C0();
    unint64_t v26 = a3;
    uint64_t v27 = a4;
    __swift_project_boxed_opaque_existential_1(a5, a5[3]);
    sub_1E0AC4650();
    id v21 = objc_allocWithZone((Class)sub_1E0AC4640());
    os_log_type_t v22 = (void *)sub_1E0AC4630();
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F67B70]), sel_initWithRootViewController_, v22);
    objc_msgSend(v23, sel_setDelegate_, v22);
    objc_msgSend(v25, sel_presentViewController_animated_completion_, v23, 1, 0);
    sub_1E0AC43C0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
    _s18HealthExperienceUI42DataTypeDetailViewControllerWithLoadActionC02OnjK0V0A18ArticlesGenerationE50setArticleDateDisplayedForHighlightAlertIdentifier__11healthStoreySS_10Foundation0Q0VSgSo08HKHealthX0CtFZ_0(a2, v26, (uint64_t)v13, v27);

    return sub_1E0AB5DBC((uint64_t)v13);
  }
  return result;
}

uint64_t sub_1E0AB5500(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1E0AB5564()
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x1F4186498](v0, 88, 7);
}

_OWORD *sub_1E0AB55AC(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_1E0AB55C4(void *a1)
{
  return sub_1E0AB52B4(a1, v1[2], v1[3], v1[4], v1 + 5);
}

BOOL static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.shouldDisplayArticleFromHighlightAlertIdentifier(_:healthStore:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_1E0AB56B0();
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(a1, a2, a3, (uint64_t)v8);
  uint64_t v9 = sub_1E0AC43D0();
  BOOL v10 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9) == 1;
  sub_1E0AB5DBC((uint64_t)v8);
  return v10;
}

void sub_1E0AB56B0()
{
  if (!qword_1EBF0F0E0)
  {
    sub_1E0AC43D0();
    unint64_t v0 = sub_1E0AC49D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBF0F0E0);
    }
  }
}

void static DataTypeDetailViewControllerWithLoadAction.OnLoadAction.getArticleDateDisplayedForHighlightAlertIdentifier(_:healthStore:)(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v39 = a4;
  uint64_t v7 = sub_1E0AC4790();
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  MEMORY[0x1F4188790](v8);
  BOOL v10 = (char *)&v33 - v9;
  sub_1E0AB56B0();
  uint64_t v35 = v11;
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  uint64_t v17 = (char *)&v33 - v16;
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v33 - v18;
  id v20 = objc_msgSend(self, sel_healthArticlesDefaultsDomainWithHealthStore_, a3);
  uint64_t v36 = a1;
  id v21 = (void *)sub_1E0AC4880();
  id v22 = HKArticlesKeyDisplayedFromHighlightAlert(v21);

  if (v22)
  {
    sub_1E0AC4890();

    sub_1E0AC4990();
    swift_bridgeObjectRelease();
    id v23 = v10;
    sub_1E0AC4760();
    sub_1E0AB662C((uint64_t)v19, (uint64_t)v17);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_1E0AC4780();
    os_log_type_t v25 = sub_1E0AC4980();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      v34 = v23;
      uint64_t v27 = v26;
      uint64_t v33 = swift_slowAlloc();
      v41[0] = v33;
      *(_DWORD *)uint64_t v27 = 136446722;
      uint64_t v40 = sub_1E0AC4730();
      sub_1E0AB6598();
      uint64_t v28 = sub_1E0AC48A0();
      uint64_t v40 = sub_1E0AB26E8(v28, v29, v41);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      sub_1E0AB662C((uint64_t)v17, (uint64_t)v14);
      uint64_t v30 = sub_1E0AC48A0();
      uint64_t v40 = sub_1E0AB26E8(v30, v31, v41);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      sub_1E0AB5DBC((uint64_t)v17);
      *(_WORD *)(v27 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_1E0AB26E8(v36, a2, v41);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1E0AAF000, v24, v25, "[%{public}s] Fetched last article launch from highlight alert date %s for identifier %s.", (uint8_t *)v27, 0x20u);
      uint64_t v32 = v33;
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v32, -1, -1);
      MEMORY[0x1E4E3B040](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v38);
    }
    else
    {
      sub_1E0AB5DBC((uint64_t)v17);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v23, v38);
    }
    sub_1E0AB6690((uint64_t)v19, v39);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E0AB5DBC(uint64_t a1)
{
  sub_1E0AB56B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s18HealthExperienceUI42DataTypeDetailViewControllerWithLoadActionC02OnjK0V0A18ArticlesGenerationE50setArticleDateDisplayedForHighlightAlertIdentifier__11healthStoreySS_10Foundation0Q0VSgSo08HKHealthX0CtFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v59 = a1;
  v61[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v7 = sub_1E0AC4790();
  uint64_t v57 = *(void *)(v7 - 8);
  uint64_t v58 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v56 = &v53[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = &v53[-v10];
  sub_1E0AB56B0();
  uint64_t v55 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  uint64_t v15 = &v53[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = &v53[-v17];
  MEMORY[0x1F4188790](v16);
  id v20 = &v53[-v19];
  id v21 = objc_msgSend(self, sel_healthArticlesDefaultsDomainWithHealthStore_, a4);
  sub_1E0AB662C(a3, (uint64_t)v20);
  uint64_t v22 = sub_1E0AC43D0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = 0;
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22) != 1)
  {
    uint64_t v24 = (void *)sub_1E0AC43B0();
    (*(void (**)(unsigned char *, uint64_t))(v23 + 8))(v20, v22);
  }
  os_log_type_t v25 = (void *)sub_1E0AC4880();
  id v26 = HKArticlesKeyDisplayedFromHighlightAlert(v25);

  if (!v26) {
    __break(1u);
  }
  v61[0] = 0;
  unsigned int v27 = objc_msgSend(v21, sel_setDate_forKey_error_, v24, v26, v61);

  id v28 = v61[0];
  if (v27)
  {
    sub_1E0AC4760();
    sub_1E0AB662C(a3, (uint64_t)v18);
    swift_bridgeObjectRetain_n();
    unint64_t v29 = sub_1E0AC4780();
    os_log_type_t v30 = sub_1E0AC4980();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v56 = (unsigned char *)swift_slowAlloc();
      v61[0] = v56;
      *(_DWORD *)uint64_t v32 = 136446722;
      int v54 = v31;
      uint64_t v60 = sub_1E0AC4730();
      sub_1E0AB6598();
      uint64_t v33 = sub_1E0AC48A0();
      uint64_t v60 = sub_1E0AB26E8(v33, v34, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      sub_1E0AB662C((uint64_t)v18, (uint64_t)v15);
      uint64_t v35 = sub_1E0AC48A0();
      uint64_t v60 = sub_1E0AB26E8(v35, v36, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      sub_1E0AB5DBC((uint64_t)v18);
      *(_WORD *)(v32 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_1E0AB26E8(v59, a2, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1E0AAF000, v29, (os_log_type_t)v54, "[%{public}s] Set last article launch from highlight alert date to %s for identifier %s.", (uint8_t *)v32, 0x20u);
      uint64_t v37 = v56;
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v37, -1, -1);
      MEMORY[0x1E4E3B040](v32, -1, -1);
    }
    else
    {
      sub_1E0AB5DBC((uint64_t)v18);

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v57 + 8))(v11, v58);
  }
  else
  {
    uint64_t v38 = v28;
    uint64_t v39 = (void *)sub_1E0AC43A0();

    swift_willThrow();
    uint64_t v40 = v56;
    sub_1E0AC4770();
    swift_bridgeObjectRetain();
    id v41 = v39;
    swift_bridgeObjectRetain();
    id v42 = v39;
    uint64_t v43 = sub_1E0AC4780();
    os_log_type_t v44 = sub_1E0AC4970();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v46 = (void *)swift_slowAlloc();
      v61[0] = v46;
      *(_DWORD *)uint64_t v45 = 136446722;
      uint64_t v60 = sub_1E0AC4730();
      sub_1E0AB6598();
      uint64_t v47 = sub_1E0AC48A0();
      uint64_t v60 = sub_1E0AB26E8(v47, v48, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v60 = sub_1E0AB26E8(v59, a2, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 22) = 2080;
      uint64_t v60 = (uint64_t)v39;
      id v49 = v39;
      sub_1E0AB65D4();
      uint64_t v50 = sub_1E0AC48A0();
      uint64_t v60 = sub_1E0AB26E8(v50, v51, (uint64_t *)v61);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1E0AAF000, v43, v44, "[%{public}s]: Encountered error while setting article %s HKArticlesKeyDisplayedFromHighlightAlert status: %s", (uint8_t *)v45, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v46, -1, -1);
      MEMORY[0x1E4E3B040](v45, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v57 + 8))(v40, v58);
  }
}

id HKArticlesKeyDisplayedFromHighlightAlert(void *a1)
{
  uint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  long long v3 = (void *)[[v1 alloc] initWithFormat:@"%@_%@", v2, @"ArticleDisplayedFromHighlightAlert"];

  return v3;
}

unint64_t sub_1E0AB6598()
{
  unint64_t result = qword_1EAD61B08;
  if (!qword_1EAD61B08)
  {
    sub_1E0AC4730();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD61B08);
  }
  return result;
}

unint64_t sub_1E0AB65D4()
{
  unint64_t result = qword_1EAD61B10;
  if (!qword_1EAD61B10)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD61B10);
  }
  return result;
}

uint64_t sub_1E0AB662C(uint64_t a1, uint64_t a2)
{
  sub_1E0AB56B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0AB6690(uint64_t a1, uint64_t a2)
{
  sub_1E0AB56B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1E0AB66F4(void **a1, void *a2)
{
  id v2 = *a1;
  long long v3 = (void **)(*a2 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = v2;
  id v5 = v2;
}

id sub_1E0AB6758()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  id v2 = *v1;
  return v2;
}

void sub_1E0AB67B0(void *a1)
{
  long long v3 = (void **)(v1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1E0AB6804())()
{
  return j__swift_endAccess;
}

uint64_t sub_1E0AB6864(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  long long v3 = (void *)(*a2 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  void *v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_1E0AB68D0()
{
  return swift_retain();
}

uint64_t sub_1E0AB691C(uint64_t a1)
{
  long long v3 = (void *)(v1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  void *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1E0AB6970())()
{
  return j_j__swift_endAccess;
}

BOOL sub_1E0AB69CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1E0AB69E4()
{
  return sub_1E0AC4B90();
}

uint64_t sub_1E0AB6A2C()
{
  return sub_1E0AC4B80();
}

uint64_t sub_1E0AB6A58()
{
  return sub_1E0AC4B90();
}

id sub_1E0AB6AAC()
{
  uint64_t v1 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers);
  }
  else
  {
    swift_getObjectType();
    sub_1E0AB8270();
    sub_1E0AC48A0();
    id v4 = (id)HKLogInfrastructure();
    id v5 = objc_allocWithZone(MEMORY[0x1E4F2B2D0]);
    uint64_t v6 = (void *)sub_1E0AC4880();
    swift_bridgeObjectRelease();
    id v7 = objc_msgSend(v5, sel_initWithName_loggingCategory_, v6, v4);

    uint64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id ArticleChangeDetector.__allocating_init(healthStore:)(void *a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1E0AB24D8();
  swift_allocObject();
  id v5 = v3;
  *(void *)&v3[v4] = sub_1E0AC47F0();
  *(void *)&v5[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  id v6 = objc_msgSend(self, sel_healthArticlesDefaultsDomainWithHealthStore_, a1);
  *(void *)&v5[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v6;

  v9.receiver = v5;
  v9.super_class = v1;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_1E0AB2AA8();

  return v7;
}

id ArticleChangeDetector.init(healthStore:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher;
  sub_1E0AB24D8();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_1E0AC47F0();
  *(void *)&v4[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers] = 0;
  id v5 = objc_msgSend(self, sel_healthArticlesDefaultsDomainWithHealthStore_, a1);
  *(void *)&v4[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain] = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for ArticleChangeDetector();
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  sub_1E0AB2AA8();

  return v6;
}

void sub_1E0AB6D5C(uint64_t a1)
{
}

void sub_1E0AB6D68(uint64_t a1)
{
}

void sub_1E0AB6D74(uint64_t a1, SEL *a2)
{
  id v4 = sub_1E0AB6AAC();
  objc_msgSend(v4, *a2, a1);
}

void sub_1E0AB6DD0()
{
  aBlock[9] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v0 = sub_1E0AC43D0();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v1 = MEMORY[0x1F4188790](v0);
  uint64_t v3 = &v64[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v1);
  uint64_t v73 = &v64[-v4];
  uint64_t v5 = sub_1E0AC4790();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  objc_super v9 = &v64[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v68 = &v64[-v11];
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = &v64[-v12];
  sub_1E0AC4760();
  uint64_t v14 = sub_1E0AC4780();
  os_log_type_t v15 = sub_1E0AC4980();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = v0;
    uint64_t v17 = v5;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_1E0AAF000, v14, v15, "ArticleChangeDetector received article status update.", v18, 2u);
    uint64_t v19 = v18;
    uint64_t v5 = v17;
    uint64_t v0 = v16;
    MEMORY[0x1E4E3B040](v19, -1, -1);
  }

  id v20 = *(unsigned char **)(v6 + 8);
  ((void (*)(unsigned char *, uint64_t))v20)(v13, v5);
  uint64_t v21 = sub_1E0AB7DF8();
  unint64_t v23 = v22;
  uint64_t v71 = v5;
  uint64_t v24 = v21;
  sub_1E0AC43C0();
  os_log_type_t v25 = (id *)&v72[OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain];
  swift_beginAccess();
  id v26 = *v25;
  unsigned int v27 = (void *)sub_1E0AC43B0();
  uint64_t v67 = v24;
  id v28 = (void *)sub_1E0AC4880();
  id v29 = HKArticlesKeyReadState(v28);

  if (v29)
  {
    aBlock[0] = 0;
    unsigned __int8 v30 = objc_msgSend(v26, sel_setDate_forKey_error_, v27, v29, aBlock);

    if (v30)
    {
      id v31 = aBlock[0];
      uint64_t v32 = v68;
      sub_1E0AC4760();
      uint64_t v33 = v69;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v69 + 16))(v3, v73, v0);
      swift_bridgeObjectRetain_n();
      unint64_t v34 = sub_1E0AC4780();
      os_log_type_t v35 = sub_1E0AC4980();
      int v36 = v35;
      uint64_t ObjectType = v34;
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v37 = swift_slowAlloc();
        int v65 = v36;
        uint64_t v38 = v37;
        uint64_t v66 = (void *)swift_slowAlloc();
        aBlock[0] = v66;
        *(_DWORD *)uint64_t v38 = 136315394;
        sub_1E0AB805C();
        uint64_t v39 = sub_1E0AC4AF0();
        v74[0] = sub_1E0AB26E8(v39, v40, (uint64_t *)aBlock);
        sub_1E0AC49E0();
        swift_bridgeObjectRelease();
        id v41 = *(void (**)(unsigned char *, uint64_t))(v33 + 8);
        uint64_t v69 = (v33 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v41(v3, v0);
        *(_WORD *)(v38 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v42 = v67;
        v74[0] = sub_1E0AB26E8(v67, v23, (uint64_t *)aBlock);
        uint64_t v43 = v41;
        sub_1E0AC49E0();
        swift_bridgeObjectRelease_n();
        os_log_type_t v44 = ObjectType;
        _os_log_impl(&dword_1E0AAF000, ObjectType, (os_log_type_t)v65, "ArticleChangeDetector set read state to %s for identifier %s.", (uint8_t *)v38, 0x16u);
        uint64_t v45 = v66;
        swift_arrayDestroy();
        MEMORY[0x1E4E3B040](v45, -1, -1);
        MEMORY[0x1E4E3B040](v38, -1, -1);

        ((void (*)(unsigned char *, uint64_t))v20)(v68, v71);
      }
      else
      {
        uint64_t v43 = *(void (**)(unsigned char *, uint64_t))(v33 + 8);
        uint64_t v69 = (v33 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v43(v3, v0);

        swift_bridgeObjectRelease_n();
        ((void (*)(unsigned char *, uint64_t))v20)(v32, v71);
        uint64_t v42 = v67;
      }
      uint64_t v60 = v72;
      id v61 = sub_1E0AB6AAC();
      uint64_t v62 = (void *)swift_allocObject();
      v62[2] = v42;
      v62[3] = v23;
      v62[4] = v60;
      aBlock[4] = sub_1E0AB7FE0;
      aBlock[5] = v62;
      aBlock[0] = (id)MEMORY[0x1E4F143A8];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1E0AB7694;
      aBlock[3] = &block_descriptor;
      uint64_t v63 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      v60;
      swift_release();
      objc_msgSend(v61, sel_notifyObservers_, v63);
      _Block_release(v63);

      swift_beginAccess();
      v74[0] = v42;
      v74[1] = v23;
      swift_retain();
      sub_1E0AC47E0();
      swift_release();
      v43(v73, v0);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v46 = aBlock[0];
      swift_bridgeObjectRelease();
      uint64_t v47 = (void *)sub_1E0AC43A0();

      swift_willThrow();
      (*(void (**)(unsigned char *, uint64_t))(v69 + 8))(v73, v0);
      uint64_t v48 = v71;
      sub_1E0AC4770();
      id v49 = v47;
      id v50 = v47;
      unint64_t v51 = sub_1E0AC4780();
      os_log_type_t v52 = sub_1E0AC4970();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        v74[0] = v54;
        *(_DWORD *)uint64_t v53 = 136315394;
        uint64_t v71 = v48;
        aBlock[0] = ObjectType;
        swift_getMetatypeMetadata();
        uint64_t v73 = v20;
        uint64_t v55 = sub_1E0AC48A0();
        aBlock[0] = (id)sub_1E0AB26E8(v55, v56, v74);
        sub_1E0AC49E0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        aBlock[0] = v47;
        id v57 = v47;
        sub_1E0AB65D4();
        uint64_t v58 = sub_1E0AC48A0();
        aBlock[0] = (id)sub_1E0AB26E8(v58, v59, v74);
        sub_1E0AC49E0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1E0AAF000, v51, v52, "[%s]: encountered error while processing notification %s", (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1E4E3B040](v54, -1, -1);
        MEMORY[0x1E4E3B040](v53, -1, -1);

        ((void (*)(unsigned char *, uint64_t))v73)(v9, v71);
      }
      else
      {

        ((void (*)(unsigned char *, uint64_t))v20)(v9, v48);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E0AB7694(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = swift_unknownObjectRetain();
  v3(v4);
  swift_release();
  return MEMORY[0x1F41867E0](a2);
}

id ArticleChangeDetector.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ArticleChangeDetector.init()()
{
}

id ArticleChangeDetector.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ArticleChangeDetector();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1E0AB78A4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_1E0AB790C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_publisher);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t method lookup function for ArticleChangeDetector(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticleChangeDetector);
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ArticleChangeDetector.articlesKVDomain.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ArticleChangeDetector.publisher.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ArticleChangeDetector.__allocating_init(healthStore:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ArticleChangeDetector.addObserver(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of ArticleChangeDetector.removeObserver(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

unint64_t sub_1E0AB7B90(uint64_t a1)
{
  uint64_t v2 = sub_1E0AC4A40();
  return sub_1E0AB7C4C(a1, v2);
}

unint64_t sub_1E0AB7BD4(uint64_t a1, uint64_t a2)
{
  sub_1E0AC4B70();
  sub_1E0AC48B0();
  uint64_t v4 = sub_1E0AC4B90();
  return sub_1E0AB7D14(a1, a2, v4);
}

unint64_t sub_1E0AB7C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1E0AB8214(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1E4E3AA60](v9, a1);
      sub_1E0AB8108((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1E0AB7D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E0AC4B10() & 1) == 0)
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
      while (!v14 && (sub_1E0AC4B10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1E0AB7DF8()
{
  uint64_t v0 = sub_1E0AC4350();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v7 = sub_1E0AC4330();
    sub_1E0AC4A60();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_1E0AB7B90((uint64_t)v8), (v3 & 1) != 0))
    {
      sub_1E0AB280C(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v9);
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1E0AB8108((uint64_t)v8);
    if (*((void *)&v10 + 1))
    {
      if (swift_dynamicCast()) {
        return v7;
      }
    }
    else
    {
      sub_1E0AB815C((uint64_t)&v9);
    }
    sub_1E0AB80B4();
    swift_allocError();
    char v6 = 1;
  }
  else
  {
    sub_1E0AB80B4();
    swift_allocError();
    char v6 = 0;
  }
  *uint64_t v5 = v6;
  return swift_willThrow();
}

id HKArticlesKeyReadState(void *a1)
{
  uint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  char v3 = (void *)[[v1 alloc] initWithFormat:@"%@_%@", v2, @"ArticleReadState"];

  return v3;
}

uint64_t sub_1E0AB7FA0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1E0AB7FE0(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  id v4 = (id)sub_1E0AC4880();
  objc_msgSend(a1, sel_readArticleWithIdentifier_detectedBy_, v4, v3);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1E0AB805C()
{
  unint64_t result = qword_1EAD61B30;
  if (!qword_1EAD61B30)
  {
    sub_1E0AC43D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD61B30);
  }
  return result;
}

unint64_t sub_1E0AB80B4()
{
  unint64_t result = qword_1EAD61B38;
  if (!qword_1EAD61B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD61B38);
  }
  return result;
}

uint64_t sub_1E0AB8108(uint64_t a1)
{
  return a1;
}

uint64_t sub_1E0AB815C(uint64_t a1)
{
  sub_1E0AB81B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1E0AB81B8()
{
  if (!qword_1EAD61B40)
  {
    unint64_t v0 = sub_1E0AC49D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD61B40);
    }
  }
}

uint64_t sub_1E0AB8214(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_1E0AB8270()
{
  unint64_t result = qword_1EAD61B48;
  if (!qword_1EAD61B48)
  {
    type metadata accessor for ArticleChangeDetector();
    unint64_t result = swift_getMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EAD61B48);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArticleChangeDetector.NotificationUserInfoError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ArticleChangeDetector.NotificationUserInfoError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0AB8414);
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

uint64_t sub_1E0AB843C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E0AB8448(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArticleChangeDetector.NotificationUserInfoError()
{
  return &type metadata for ArticleChangeDetector.NotificationUserInfoError;
}

unint64_t sub_1E0AB8468()
{
  unint64_t result = qword_1EAD61B50;
  if (!qword_1EAD61B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD61B50);
  }
  return result;
}

void *sub_1E0AB84C0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1E0AC4790();
  MEMORY[0x1F4188790](v4);
  sub_1E0AB8934((uint64_t)a1, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    swift_bridgeObjectRetain();
    BOOL v7 = sub_1E0ABEDDC(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v9 = v7[2];
    unint64_t v8 = v7[3];
    if (v9 >= v8 >> 1) {
      BOOL v7 = sub_1E0ABEDDC((void *)(v8 > 1), v9 + 1, 1, v7);
    }
    void v7[2] = v9 + 1;
    long long v10 = &v7[5 * v9];
    v10[4] = v6;
    v10[5] = 0;
    v10[6] = 0;
    v10[7] = 0;
    *((unsigned char *)v10 + 64) = 32;
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4FBC860];
    BOOL v7 = (void *)MEMORY[0x1E4FBC860];
  }
  BOOL v11 = sub_1E0AB9660(v6, a1, a2);
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    BOOL v7 = sub_1E0ABEDDC(0, v7[2] + 1, 1, v7);
  }
  unint64_t v13 = v7[2];
  unint64_t v12 = v7[3];
  if (v13 >= v12 >> 1) {
    BOOL v7 = sub_1E0ABEDDC((void *)(v12 > 1), v13 + 1, 1, v7);
  }
  void v7[2] = v13 + 1;
  BOOL v14 = &v7[5 * v13];
  v14[4] = v11;
  v14[5] = 0;
  v14[6] = 0;
  v14[7] = 0;
  *((unsigned char *)v14 + 64) = 0;
  return v7;
}

uint64_t sub_1E0AB8880()
{
  return 1;
}

uint64_t sub_1E0AB8888()
{
  return sub_1E0AC4B90();
}

uint64_t sub_1E0AB88CC()
{
  return sub_1E0AC4B80();
}

uint64_t sub_1E0AB88F4()
{
  return sub_1E0AC4B90();
}

void sub_1E0AB8934(uint64_t a1, uint64_t a2)
{
  v111 = (void *)sub_1E0AC43E0();
  uint64_t v5 = (void (**)(char *, void, void))*(v111 - 1);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v110 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v109 = (char *)&v90 - v8;
  uint64_t v112 = sub_1E0AC4520();
  uint64_t v105 = *(void *)(v112 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v112);
  v104 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v107 = (char *)&v90 - v12;
  MEMORY[0x1F4188790](v11);
  v108 = (char *)&v90 - v13;
  v106 = (void (**)(char *, char *, uint64_t))sub_1E0AC45D0();
  uint64_t v103 = (uint64_t)*(v106 - 1);
  uint64_t v14 = MEMORY[0x1F4188790](v106);
  v102 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1E0AC4790();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  unint64_t v23 = (char *)&v90 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  os_log_type_t v25 = (void (**)(char *, uint64_t))((char *)&v90 - v24);
  sub_1E0AC4760();
  id v26 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v98 = v2;
  v26(v18, v2, a1);
  unsigned int v27 = sub_1E0AC4780();
  os_log_type_t v28 = sub_1E0AC4980();
  unsigned int v101 = v28;
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v92 = v20;
  uint64_t v91 = v23;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    v100 = v5;
    uint64_t v31 = v30;
    uint64_t v95 = swift_slowAlloc();
    v118[0] = v95;
    *(_DWORD *)uint64_t v31 = 136446466;
    uint64_t v94 = v27;
    uint64_t v115 = a1;
    swift_getMetatypeMetadata();
    uint64_t v99 = v25;
    uint64_t v32 = sub_1E0AC48A0();
    uint64_t v115 = sub_1E0AB26E8(v32, v33, v118);
    sub_1E0AC49E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v90 = (void (*)(char *, uint64_t))(v31 + 14);
    uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, a1);
    unint64_t v35 = sub_1E0AC2690();
    uint64_t v36 = MEMORY[0x1E4E3A900](v34, v35);
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v115 = sub_1E0AB26E8(v36, v38, v118);
    sub_1E0AC49E0();
    swift_bridgeObjectRelease();
    uint64_t v39 = v94;
    _os_log_impl(&dword_1E0AAF000, v94, (os_log_type_t)v101, "[%{public}s]: Managed articles: %s", (uint8_t *)v31, 0x16u);
    uint64_t v40 = v95;
    swift_arrayDestroy();
    MEMORY[0x1E4E3B040](v40, -1, -1);
    uint64_t v41 = v31;
    uint64_t v5 = v100;
    MEMORY[0x1E4E3B040](v41, -1, -1);

    uint64_t v42 = *(void (**)(char *, uint64_t))(v20 + 8);
    v42((char *)v99, v19);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, a1);

    uint64_t v42 = *(void (**)(char *, uint64_t))(v20 + 8);
    v42((char *)v25, v19);
  }
  uint64_t v43 = v102;
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  os_log_type_t v44 = (void *)sub_1E0AC45C0();
  (*(void (**)(char *, void (**)(char *, char *, uint64_t)))(v103 + 8))(v43, v106);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(v118, a1, a2);
  __swift_project_boxed_opaque_existential_1(v118, v118[3]);
  uint64_t v45 = v44;
  uint64_t v95 = (uint64_t)v44;
  uint64_t v46 = sub_1E0AC4560();
  uint64_t v94 = v45;

  uint64_t v47 = MEMORY[0x1E4FBC860];
  v117 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v103 = *(void *)(v46 + 16);
  uint64_t v97 = a1;
  uint64_t v93 = v19;
  uint64_t v96 = a2;
  uint64_t v90 = v42;
  if (v103)
  {
    unint64_t v48 = 0;
    v102 = (char *)(v105 + 16);
    unsigned int v101 = *MEMORY[0x1E4F66FF8];
    v100 = v5 + 13;
    id v49 = (void (**)(char *, void *))(v5 + 1);
    uint64_t v99 = (void (**)(char *, uint64_t))(v105 + 8);
    v106 = (void (**)(char *, char *, uint64_t))(v105 + 32);
    while (1)
    {
      if (v48 >= *(void *)(v46 + 16))
      {
        __break(1u);
        return;
      }
      unint64_t v50 = (*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
      uint64_t v51 = *(void *)(v105 + 72);
      uint64_t v52 = v46;
      (*(void (**)(char *, unint64_t, uint64_t))(v105 + 16))(v108, v46 + v50 + v51 * v48, v112);
      sub_1E0AC4410();
      (*v100)(v110, v101, v111);
      sub_1E0AC26F0(&qword_1EBF0F218, MEMORY[0x1E4F67030]);
      sub_1E0AC48D0();
      sub_1E0AC48D0();
      if (v115 == v113 && v116 == v114) {
        break;
      }
      char v55 = sub_1E0AC4B10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v56 = *v49;
      id v57 = v111;
      (*v49)(v110, v111);
      v56(v109, v57);
      if (v55) {
        goto LABEL_13;
      }
      (*v99)(v108, v112);
LABEL_7:
      uint64_t v46 = v52;
      if (v103 == ++v48)
      {
        uint64_t v62 = v117;
        a1 = v97;
        a2 = v96;
        uint64_t v47 = MEMORY[0x1E4FBC860];
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease_n();
    uint64_t v53 = *v49;
    uint64_t v54 = v111;
    (*v49)(v110, v111);
    v53(v109, v54);
LABEL_13:
    uint64_t v58 = *v106;
    (*v106)(v107, v108, v112);
    unint64_t v59 = v117;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1E0AC0EDC(0, *((void *)v59 + 2) + 1, 1);
      unint64_t v59 = v117;
    }
    unint64_t v61 = *((void *)v59 + 2);
    unint64_t v60 = *((void *)v59 + 3);
    if (v61 >= v60 >> 1)
    {
      sub_1E0AC0EDC(v60 > 1, v61 + 1, 1);
      unint64_t v59 = v117;
    }
    *((void *)v59 + 2) = v61 + 1;
    v58(&v59[v50 + v61 * v51], v107, v112);
    v117 = v59;
    goto LABEL_7;
  }
  uint64_t v62 = (char *)MEMORY[0x1E4FBC860];
LABEL_20:
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v118);
  int64_t v63 = *((void *)v62 + 2);
  if (v63)
  {
    v118[0] = v47;
    sub_1E0AC0EBC(0, v63, 0);
    uint64_t v64 = *(void **)(v105 + 16);
    v110 = v62;
    v111 = v64;
    int v65 = &v62[(*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80)];
    uint64_t v66 = *(void *)(v105 + 72);
    uint64_t v67 = (void (**)(char *, uint64_t))(v105 + 8);
    do
    {
      uint64_t v68 = v104;
      uint64_t v69 = v112;
      ((void (*)(char *, char *, uint64_t))v111)(v104, v65, v112);
      uint64_t v70 = sub_1E0AC4480();
      uint64_t v72 = v71;
      (*v67)(v68, v69);
      uint64_t v47 = v118[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1E0AC0EBC(0, *(void *)(v47 + 16) + 1, 1);
        uint64_t v47 = v118[0];
      }
      unint64_t v74 = *(void *)(v47 + 16);
      unint64_t v73 = *(void *)(v47 + 24);
      if (v74 >= v73 >> 1)
      {
        sub_1E0AC0EBC(v73 > 1, v74 + 1, 1);
        uint64_t v47 = v118[0];
      }
      *(void *)(v47 + 16) = v74 + 1;
      uint64_t v75 = v47 + 16 * v74;
      *(void *)(v75 + 32) = v70;
      *(void *)(v75 + 40) = v72;
      v65 += v66;
      --v63;
    }
    while (v63);
    swift_release();
    a1 = v97;
    a2 = v96;
  }
  else
  {
    swift_release();
  }
  uint64_t v76 = sub_1E0AC1634(v47);
  swift_bridgeObjectRelease();
  uint64_t v77 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  uint64_t v78 = v94;
  uint64_t v79 = sub_1E0AC1B3C(v77);
  swift_bridgeObjectRelease();

  uint64_t v80 = sub_1E0AC1634(v79);
  swift_bridgeObjectRelease();
  if (*(void *)(v80 + 16) <= *(void *)(v76 + 16) >> 3)
  {
    v118[0] = v76;
    sub_1E0ABF1AC(v80);
    swift_bridgeObjectRelease();
    uint64_t v81 = v118[0];
  }
  else
  {
    uint64_t v81 = sub_1E0ABF354(v80, v76);
    swift_bridgeObjectRelease();
  }
  v82 = sub_1E0ABEF08(v81);
  swift_bridgeObjectRelease();
  if (v82[2])
  {
  }
  else
  {
    swift_release();
    uint64_t v83 = v91;
    sub_1E0AC4760();
    uint64_t v84 = sub_1E0AC4780();
    os_log_type_t v85 = sub_1E0AC4980();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      v118[0] = v87;
      *(_DWORD *)uint64_t v86 = 136446210;
      uint64_t v115 = a1;
      swift_getMetatypeMetadata();
      uint64_t v88 = sub_1E0AC48A0();
      uint64_t v115 = sub_1E0AB26E8(v88, v89, v118);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1E0AAF000, v84, v85, "[%{public}s]: No invalid feed items to purge.", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v87, -1, -1);
      MEMORY[0x1E4E3B040](v86, -1, -1);
    }
    else
    {
    }
    v90(v83, v93);
  }
}

uint64_t *sub_1E0AB9660(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v91 = a2;
  uint64_t v89 = a1;
  uint64_t v92 = sub_1E0AC45D0();
  uint64_t v88 = *(void (***)(char *, uint64_t))(v92 - 8);
  MEMORY[0x1F4188790](v92);
  uint64_t v7 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AC262C(0, &qword_1EBF0F0F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v87 = (char *)&v80 - v10;
  uint64_t v95 = sub_1E0AC4520();
  uint64_t v90 = *(void *)(v95 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v95);
  uint64_t v94 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v86 = (char *)&v80 - v13;
  sub_1E0AC262C(0, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, v8);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v80 - v15;
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  uint64_t v18 = *(void *)(ArticleInformation - 8);
  MEMORY[0x1F4188790](ArticleInformation);
  uint64_t v20 = (uint64_t *)((char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = v4;
  uint64_t v22 = v91;
  (*(void (**)(void *, uint64_t))(a3 + 24))(v91, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, ArticleInformation) == 1)
  {
    sub_1E0AC1D7C((uint64_t)v16, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation);
    unint64_t v23 = v21;
    (*(void (**)(void *, uint64_t))(a3 + 16))(v22, a3);
    uint64_t v24 = (void *)sub_1E0AC45C0();
    v88[1](v7, v92);
    os_log_type_t v25 = *(uint64_t (**)(void *, uint64_t))(a3 + 32);
    uint64_t v87 = (char *)(a3 + 32);
    os_log_type_t v85 = v25;
    uint64_t v26 = v25(v22, a3);
    unsigned int v27 = v22;
    id v28 = v24;
    uint64_t v88 = (void (**)(char *, uint64_t))v24;
    BOOL v29 = v93;
    uint64_t v30 = sub_1E0AC1B3C(v26);
    uint64_t v86 = v29;
    swift_bridgeObjectRelease();

    sub_1E0AC1634(v30);
    swift_bridgeObjectRelease();
    (*(void (**)(void *__return_ptr, void *, uint64_t))(a3 + 8))(v96, v27, a3);
    __swift_project_boxed_opaque_existential_1(v96, v96[3]);
    uint64_t v31 = sub_1E0AC4550();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v96);
    int64_t v32 = *(void *)(v31 + 16);
    uint64_t v33 = MEMORY[0x1E4FBC860];
    if (v32)
    {
      id v82 = v28;
      uint64_t v83 = a3;
      uint64_t v84 = v23;
      v96[0] = MEMORY[0x1E4FBC860];
      sub_1E0AC0EBC(0, v32, 0);
      uint64_t v34 = *(char **)(v90 + 16);
      uint64_t v35 = *(unsigned __int8 *)(v90 + 80);
      uint64_t v81 = v31;
      uint64_t v36 = v31 + ((v35 + 32) & ~v35);
      uint64_t v92 = *(void *)(v90 + 72);
      uint64_t v93 = v34;
      unint64_t v37 = (void (**)(char *, uint64_t))(v90 + 8);
      do
      {
        unint64_t v38 = v94;
        uint64_t v39 = v95;
        ((void (*)(char *, uint64_t, uint64_t))v93)(v94, v36, v95);
        uint64_t v40 = sub_1E0AC4480();
        uint64_t v42 = v41;
        (*v37)(v38, v39);
        uint64_t v33 = v96[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1E0AC0EBC(0, *(void *)(v33 + 16) + 1, 1);
          uint64_t v33 = v96[0];
        }
        unint64_t v44 = *(void *)(v33 + 16);
        unint64_t v43 = *(void *)(v33 + 24);
        if (v44 >= v43 >> 1)
        {
          sub_1E0AC0EBC(v43 > 1, v44 + 1, 1);
          uint64_t v33 = v96[0];
        }
        *(void *)(v33 + 16) = v44 + 1;
        uint64_t v45 = v33 + 16 * v44;
        *(void *)(v45 + 32) = v40;
        *(void *)(v45 + 40) = v42;
        v36 += v92;
        --v32;
      }
      while (v32);
      a3 = v83;
      unint64_t v23 = v84;
      unsigned int v27 = v91;
      uint64_t v31 = v81;
      id v28 = v82;
    }
    uint64_t v49 = sub_1E0AC1634(v33);
    swift_bridgeObjectRelease();
    unint64_t v50 = (char *)sub_1E0ABF7C4(v89, v49);
    uint64_t v51 = v85(v27, a3);
    uint64_t v47 = &v80;
    MEMORY[0x1F4188790](v51);
    *(&v80 - 4) = (uint64_t)v27;
    *(&v80 - 3) = a3;
    *(&v80 - 2) = (uint64_t)v88;
    *(&v80 - 1) = (uint64_t)v23;
    uint64_t v52 = (uint64_t)v86;
    uint64_t v53 = sub_1E0ABA068((void (*)(uint64_t, uint64_t *))sub_1E0AC1C70, (uint64_t)(&v80 - 6), v51);
    uint64_t v89 = v52;
    if (v52)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      uint64_t v56 = v53;
      uint64_t v87 = v50;
      swift_bridgeObjectRelease();
      int64_t v57 = *(void *)(v56 + 16);
      uint64_t v58 = MEMORY[0x1E4FBC860];
      uint64_t v88 = (void (**)(char *, uint64_t))v56;
      if (v57)
      {
        uint64_t v81 = v31;
        id v82 = v28;
        uint64_t v83 = a3;
        uint64_t v84 = v23;
        v96[0] = MEMORY[0x1E4FBC860];
        sub_1E0AC0EBC(0, v57, 0);
        uint64_t v59 = v90 + 16;
        unint64_t v60 = *(char **)(v90 + 16);
        unint64_t v61 = v56 + ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80));
        uint64_t v92 = *(void *)(v90 + 72);
        uint64_t v93 = v60;
        uint64_t v62 = (void (**)(char *, uint64_t))(v90 + 8);
        do
        {
          int64_t v63 = v94;
          uint64_t v64 = v95;
          uint64_t v65 = v59;
          ((void (*)(char *, unint64_t, uint64_t))v93)(v94, v61, v95);
          uint64_t v66 = sub_1E0AC4480();
          uint64_t v68 = v67;
          (*v62)(v63, v64);
          uint64_t v58 = v96[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1E0AC0EBC(0, *(void *)(v58 + 16) + 1, 1);
            uint64_t v58 = v96[0];
          }
          unint64_t v70 = *(void *)(v58 + 16);
          unint64_t v69 = *(void *)(v58 + 24);
          if (v70 >= v69 >> 1)
          {
            sub_1E0AC0EBC(v69 > 1, v70 + 1, 1);
            uint64_t v58 = v96[0];
          }
          *(void *)(v58 + 16) = v70 + 1;
          uint64_t v71 = v58 + 16 * v70;
          *(void *)(v71 + 32) = v66;
          *(void *)(v71 + 40) = v68;
          v61 += v92;
          --v57;
          uint64_t v59 = v65;
        }
        while (v57);
        a3 = v83;
        unint64_t v23 = v84;
        unsigned int v27 = v91;
        uint64_t v31 = v81;
        id v28 = v82;
      }
      uint64_t v72 = sub_1E0AC1634(v58);
      swift_bridgeObjectRelease();
      if (*((void *)v87 + 2) <= *(void *)(v72 + 16) >> 3)
      {
        v96[0] = v72;
        sub_1E0ABF1AC((uint64_t)v87);
        swift_release();
        uint64_t v73 = v96[0];
      }
      else
      {
        uint64_t v73 = sub_1E0ABF354((uint64_t)v87, v72);
        swift_release();
      }
      uint64_t v77 = sub_1E0ABEF08(v73);
      uint64_t v78 = swift_bridgeObjectRelease();
      MEMORY[0x1F4188790](v78);
      *(&v80 - 6) = (uint64_t)v27;
      *(&v80 - 5) = a3;
      *(&v80 - 4) = (uint64_t)v88;
      *(&v80 - 3) = v31;
      *(&v80 - 2) = (uint64_t)v23;
      uint64_t v47 = (uint64_t *)sub_1E0ABD4C0((void (*)(void))sub_1E0AC1C94, (uint64_t)(&v80 - 8), (uint64_t)v77);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1E0AC1CB8((uint64_t)v16, (uint64_t)v20);
    uint64_t v46 = v87;
    uint64_t v47 = v21;
    unint64_t v48 = v93;
    sub_1E0ABA218(v20, v22, a3, v87);
    if (v48)
    {
      sub_1E0AC1D1C((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ReadArticleInformation);
    }
    else
    {
      uint64_t v54 = v90;
      uint64_t v55 = v95;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v90 + 48))(v46, 1, v95) == 1)
      {
        sub_1E0AC1D7C((uint64_t)v46, &qword_1EBF0F0F0, MEMORY[0x1E4F67110]);
        sub_1E0AC1D1C((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ReadArticleInformation);
        return (uint64_t *)MEMORY[0x1E4FBC860];
      }
      else
      {
        unint64_t v74 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
        uint64_t v75 = v86;
        v74(v86, v46, v55);
        sub_1E0AC262C(0, &qword_1EBF0F1F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBBE00]);
        unint64_t v76 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
        uint64_t v47 = (uint64_t *)swift_allocObject();
        *((_OWORD *)v47 + 1) = xmmword_1E0AC5310;
        v74((char *)v47 + v76, v75, v55);
        sub_1E0AC1D1C((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ReadArticleInformation);
      }
    }
  }
  return v47;
}

uint64_t sub_1E0ABA068(void (*a1)(uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v16 = sub_1E0AC4520();
  uint64_t v6 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (v9)
  {
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_1E0AC0EDC(0, v9, 0);
    uint64_t v10 = v20;
    uint64_t v11 = a3 + 32;
    v15[1] = v6 + 32;
    while (1)
    {
      v17(v11, &v19);
      if (v4) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v20 = v10;
      unint64_t v13 = *(void *)(v10 + 16);
      unint64_t v12 = *(void *)(v10 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1E0AC0EDC(v12 > 1, v13 + 1, 1);
        uint64_t v10 = v20;
      }
      *(void *)(v10 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v13, v8, v16);
      v11 += 48;
      if (!--v9) {
        return v10;
      }
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_1E0ABA218@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AC262C(0, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v8 - 8);
  int64_t v32 = (char *)v30 - v9;
  uint64_t v41 = sub_1E0AC45D0();
  uint64_t v38 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC262C(0, &qword_1EBF0F0F0, MEMORY[0x1E4F67110], v7);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)v30 - v13;
  uint64_t v15 = sub_1E0AC4520();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v37 = v15;
  MEMORY[0x1F4188790](v15);
  uint64_t v31 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void *__return_ptr, void *, uint64_t))(a3 + 8))(v40, a2, a3);
  uint64_t v35 = v40[4];
  uint64_t v34 = __swift_project_boxed_opaque_existential_1(v40, v40[3]);
  v30[0] = a1;
  sub_1E0AB5500((uint64_t)a1, (uint64_t)v39);
  __swift_project_boxed_opaque_existential_1(v39, v39[3]);
  uint64_t v17 = *(void (**)(void *, uint64_t))(a3 + 16);
  v30[1] = a2;
  v30[2] = (void *)a3;
  v17(a2, a3);
  uint64_t v18 = (void *)sub_1E0AC45C0();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v41);
  uint64_t v19 = v36;
  sub_1E0AC46D0();

  sub_1E0AC4540();
  uint64_t v20 = v37;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v20) == 1)
  {
    sub_1E0AC1D7C((uint64_t)v14, &qword_1EBF0F0F0, MEMORY[0x1E4F67110]);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1E0AC1DEC();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    uint64_t v23 = (uint64_t)v31;
    v22(v31, v14, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    uint64_t v24 = (uint64_t)v32;
    sub_1E0AC44C0();
    uint64_t v25 = sub_1E0AC4620();
    int v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 48))(v24, 1, v25);
    sub_1E0AC1D7C(v24, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
    if (v26 == 1)
    {
      uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
      sub_1E0AC17C4(v23, (uint64_t)v30[0] + *(int *)(ArticleInformation + 20), v30[0]);
      id v28 = v33;
      v22(v33, (char *)v23, v20);
      uint64_t v29 = 0;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v20);
      uint64_t v29 = 1;
      id v28 = v33;
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v28, v29, 1, v20);
  }
}

uint64_t sub_1E0ABA6FC@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v10 = sub_1E0ABA790(a2, a3, a4);
  static PluginFeedItem.makeArticleFeedItemWithMetadata(article:sourceProfile:pluginFeedItemConstructor:)(a1, (void (*)(uint64_t, uint64_t, char *))v10, v11, a6);
  uint64_t result = swift_release();
  if (v6) {
    *a5 = v6;
  }
  return result;
}

uint64_t (*sub_1E0ABA790(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return sub_1E0AC2808;
}

uint64_t sub_1E0ABA8B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v82 = a5;
  uint64_t v84 = a3;
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AC262C(0, &qword_1EBF0F0F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v78 = (char *)&v71 - v16;
  sub_1E0AC262C(0, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8], v14);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v71 - v18;
  uint64_t v20 = sub_1E0AC4520();
  uint64_t v21 = MEMORY[0x1F4188790](a2);
  uint64_t v86 = (char *)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v24 = MEMORY[0x1F4188790](v23);
  uint64_t v25 = MEMORY[0x1F4188790](v24);
  unsigned int v27 = (char *)&v71 - v26;
  uint64_t v28 = MEMORY[0x1F4188790](v25);
  uint64_t v30 = (char *)&v71 - v29;
  uint64_t v31 = MEMORY[0x1F4188790](v28);
  os_log_type_t v85 = (char *)&v71 - v35;
  uint64_t v36 = *(void *)(v31 + 16);
  if (!v36) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(a7, 1, 1, v20);
  }
  uint64_t v76 = a6;
  uint64_t v77 = v30;
  uint64_t v71 = v34;
  uint64_t v72 = v19;
  uint64_t v74 = a4;
  uint64_t v75 = v33;
  uint64_t v79 = a7;
  uint64_t v80 = v8;
  uint64_t v38 = *a1;
  uint64_t v37 = a1[1];
  uint64_t v83 = v32;
  uint64_t v40 = *(void (**)(char *, unint64_t, uint64_t))(v32 + 16);
  uint64_t v39 = v32 + 16;
  unint64_t v73 = (*(unsigned __int8 *)(v39 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 64);
  unint64_t v41 = v31 + v73;
  uint64_t v87 = *(void *)(v39 + 56);
  uint64_t v88 = v40;
  uint64_t v89 = v39;
  uint64_t v42 = (void (**)(char *, uint64_t))(v39 - 8);
  uint64_t v81 = (void (*)(uint64_t, uint64_t, uint64_t))v31;
  swift_bridgeObjectRetain();
  while (1)
  {
    v88(v27, v41, v20);
    if (sub_1E0AC4480() == v38 && v43 == v37) {
      break;
    }
    char v44 = sub_1E0AC4B10();
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_10;
    }
    (*v42)(v27, v20);
    v41 += v87;
    if (!--v36)
    {
      swift_bridgeObjectRelease();
      a7 = v79;
      uint64_t v32 = v83;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(a7, 1, 1, v20);
    }
  }
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v83 + 32);
  uint64_t v47 = v77;
  v46(v77, v27, v20);
  uint64_t v81 = (void (*)(uint64_t, uint64_t, uint64_t))v46;
  v46(v85, v47, v20);
  uint64_t v48 = *(void *)(v84 + 16);
  uint64_t v49 = v86;
  if (v48)
  {
    unint64_t v50 = v84 + v73;
    swift_bridgeObjectRetain();
    while (1)
    {
      v88(v49, v50, v20);
      if (sub_1E0AC4480() == v38 && v51 == v37)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      char v52 = sub_1E0AC4B10();
      swift_bridgeObjectRelease();
      if (v52) {
        break;
      }
      uint64_t v49 = v86;
      (*v42)(v86, v20);
      v50 += v87;
      if (!--v48)
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    uint64_t v49 = v86;
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v55 = v71;
    uint64_t v56 = v49;
    int64_t v57 = v81;
    v81(v71, (uint64_t)v56, v20);
    v57(v75, v55, v20);
    uint64_t v58 = (uint64_t)v72;
    sub_1E0AC44C0();
    uint64_t v59 = sub_1E0AC4620();
    int v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 48))(v58, 1, v59);
    sub_1E0AC1D7C(v58, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
    uint64_t v61 = v83;
    uint64_t v62 = (uint64_t)v85;
    if (v60 == 1) {
      sub_1E0ABAF68((uint64_t)v85, v82, v76);
    }
    uint64_t v63 = (uint64_t)v78;
    uint64_t v64 = v75;
    v88(v78, v75, v20);
    uint64_t v65 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56);
    v65(v63, 0, 1, v20);
    char v66 = sub_1E0ABBCD0(v63);
    sub_1E0AC1D7C(v63, &qword_1EBF0F0F0, MEMORY[0x1E4F67110]);
    uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v67(v64, v20);
    if (v66)
    {
      v67(v62, v20);
      uint64_t v68 = v79;
      uint64_t v69 = 1;
    }
    else
    {
      uint64_t v70 = v79;
      v81(v79, v62, v20);
      uint64_t v68 = v70;
      uint64_t v69 = 0;
    }
    return v65(v68, v69, 1, v20);
  }
  else
  {
LABEL_17:
    uint64_t v53 = (uint64_t)v85;
    sub_1E0ABAF68((uint64_t)v85, v82, v76);
    uint64_t v54 = v79;
    v81(v79, v53, v20);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v83 + 56))(v54, 0, 1, v20);
  }
}

void sub_1E0ABAF68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E0AC4790();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v77 = v6;
  uint64_t v78 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v67 - v10;
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  uint64_t v68 = (char *)&v67 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v70 = (char *)&v67 - v14;
  sub_1E0AC262C(0, (unint64_t *)&qword_1EBF0F0E0, MEMORY[0x1E4F27928], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)&v67 - v16;
  uint64_t v75 = sub_1E0AC43D0();
  uint64_t v72 = *(void *)(v75 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v75);
  uint64_t v69 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v73 = (uint64_t)&v67 - v20;
  uint64_t v74 = sub_1E0AC4480();
  unint64_t v22 = v21;
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 40);
  uint64_t v76 = a2;
  uint64_t v71 = a3;
  uint64_t v24 = (void *)v23(a2, a3);
  sub_1E0AC4480();
  uint64_t v25 = (void *)sub_1E0AC4880();
  swift_bridgeObjectRelease();
  id v26 = HKArticlesKeyReadState(v25);

  if (v26)
  {
    sub_1E0AC4890();

    sub_1E0AC4990();
    swift_bridgeObjectRelease();
    uint64_t v27 = v72;
    uint64_t v28 = v75;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v17, 1, v75) == 1)
    {
      sub_1E0AC1D7C((uint64_t)v17, (unint64_t *)&qword_1EBF0F0E0, MEMORY[0x1E4F27928]);
      sub_1E0AC4760();
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1E0AC4780();
      os_log_type_t v30 = sub_1E0AC4970();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        *(void *)&v84[0] = v32;
        *(_DWORD *)uint64_t v31 = 136315394;
        *(void *)&long long v81 = v76;
        swift_getMetatypeMetadata();
        uint64_t v33 = sub_1E0AC48A0();
        *(void *)&long long v81 = sub_1E0AB26E8(v33, v34, (uint64_t *)v84);
        sub_1E0AC49E0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)&long long v81 = sub_1E0AB26E8(v74, v22, (uint64_t *)v84);
        sub_1E0AC49E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1E0AAF000, v29, v30, "[%s] Identifier %s is not in the system yet, which means it is has not been read yet", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1E4E3B040](v32, -1, -1);
        MEMORY[0x1E4E3B040](v31, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v11, v77);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v73, v17, v28);
      uint64_t v35 = v76;
      uint64_t v36 = (*(uint64_t (**)(uint64_t))(v71 + 32))(v76);
      uint64_t v37 = *(void *)(v36 + 16);
      if (v37)
      {
        uint64_t v38 = v36 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_1E0AB5500(v38, (uint64_t)&v79);
          __swift_project_boxed_opaque_existential_1(&v79, v80);
          uint64_t v39 = (void *)sub_1E0AC4440();
          uint64_t v40 = sub_1E0AC46D0();
          uint64_t v42 = v41;

          if (v40 == sub_1E0AC4480() && v42 == v43) {
            break;
          }
          char v45 = sub_1E0AC4B10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v45) {
            goto LABEL_18;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v79);
          v38 += 48;
          if (!--v37)
          {
            swift_bridgeObjectRelease();
            uint64_t v35 = v76;
            uint64_t v28 = v75;
            uint64_t v27 = v72;
            goto LABEL_14;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_18:
        uint64_t v35 = v76;
        uint64_t v46 = v70;
        swift_bridgeObjectRelease();
        sub_1E0AB55AC(&v79, &v81);
        swift_bridgeObjectRelease();
        uint64_t v28 = v75;
        uint64_t v27 = v72;
      }
      else
      {
LABEL_14:
        long long v82 = 0u;
        long long v83 = 0u;
        long long v81 = 0u;
        swift_bridgeObjectRelease();
        uint64_t v46 = v70;
      }
      uint64_t v47 = v69;
      if (*((void *)&v82 + 1))
      {
        sub_1E0AB55AC(&v81, v84);
        sub_1E0AC4760();
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v47, v73, v28);
        swift_bridgeObjectRetain();
        uint64_t v48 = sub_1E0AC4780();
        os_log_type_t v49 = sub_1E0AC4980();
        int v50 = v49;
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t v51 = swift_slowAlloc();
          uint64_t v72 = swift_slowAlloc();
          *(void *)&long long v81 = v72;
          *(_DWORD *)uint64_t v51 = 136315650;
          LODWORD(v69) = v50;
          *(void *)&long long v79 = v35;
          swift_getMetatypeMetadata();
          uint64_t v52 = sub_1E0AC48A0();
          *(void *)&long long v79 = sub_1E0AB26E8(v52, v53, (uint64_t *)&v81);
          sub_1E0AC49E0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v51 + 12) = 2080;
          sub_1E0AC26F0((unint64_t *)&qword_1EAD61B30, MEMORY[0x1E4F27928]);
          uint64_t v54 = sub_1E0AC4AF0();
          *(void *)&long long v79 = sub_1E0AB26E8(v54, v55, (uint64_t *)&v81);
          sub_1E0AC49E0();
          swift_bridgeObjectRelease();
          uint64_t v56 = *(void (**)(char *, uint64_t))(v27 + 8);
          v56(v47, v75);
          *(_WORD *)(v51 + 22) = 2080;
          swift_bridgeObjectRetain();
          *(void *)&long long v79 = sub_1E0AB26E8(v74, v22, (uint64_t *)&v81);
          sub_1E0AC49E0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1E0AAF000, v48, (os_log_type_t)v69, "[%s] Adding read date of %s to article %s", (uint8_t *)v51, 0x20u);
          uint64_t v57 = v72;
          swift_arrayDestroy();
          MEMORY[0x1E4E3B040](v57, -1, -1);
          uint64_t v58 = v51;
          uint64_t v28 = v75;
          MEMORY[0x1E4E3B040](v58, -1, -1);

          (*(void (**)(char *, uint64_t))(v78 + 8))(v70, v77);
        }
        else
        {
          uint64_t v56 = *(void (**)(char *, uint64_t))(v27 + 8);
          v56(v47, v28);

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v46, v77);
        }
        uint64_t v66 = v73;
        sub_1E0AC17C4(a1, v73, v84);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
        v56((char *)v66, v28);
      }
      else
      {
        sub_1E0AC1D7C((uint64_t)&v81, &qword_1EAD61B78, (uint64_t (*)(uint64_t))sub_1E0AC2690);
        uint64_t v59 = v68;
        sub_1E0AC4760();
        swift_bridgeObjectRetain();
        int v60 = sub_1E0AC4780();
        os_log_type_t v61 = sub_1E0AC4970();
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          *(void *)&v84[0] = v63;
          *(_DWORD *)uint64_t v62 = 136315394;
          *(void *)&long long v81 = v35;
          swift_getMetatypeMetadata();
          uint64_t v64 = sub_1E0AC48A0();
          *(void *)&long long v81 = sub_1E0AB26E8(v64, v65, (uint64_t *)v84);
          sub_1E0AC49E0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v62 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)&long long v81 = sub_1E0AB26E8(v74, v22, (uint64_t *)v84);
          sub_1E0AC49E0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1E0AAF000, v60, v61, "[%s] Identifier %s is not a managed article", (uint8_t *)v62, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1E4E3B040](v63, -1, -1);
          MEMORY[0x1E4E3B040](v62, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        (*(void (**)(char *, uint64_t))(v78 + 8))(v59, v77);
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v73, v75);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E0ABBCD0(uint64_t a1)
{
  uint64_t v168 = sub_1E0AC43E0();
  uint64_t v167 = *(void *)(v168 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v168);
  v171 = (char *)&v163 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  v170 = (char *)&v163 - v4;
  uint64_t v175 = sub_1E0AC4620();
  uint64_t v174 = *(void *)(v175 - 8);
  MEMORY[0x1F4188790](v175);
  v166 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0AC2000();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v176 = (uint64_t)&v163 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4FBB718];
  sub_1E0AC262C(0, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8], MEMORY[0x1E4FBB718]);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v169 = (uint64_t)&v163 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v172 = (uint64_t)&v163 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v173 = (uint64_t)&v163 - v15;
  uint64_t v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F67110];
  sub_1E0AC262C(0, &qword_1EBF0F0F0, MEMORY[0x1E4F67110], v9);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (char *)&v163 - v18;
  uint64_t v20 = sub_1E0AC4520();
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  v179 = (char *)&v163 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v183 = (char *)&v163 - v24;
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  v178 = (char *)&v163 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  uint64_t v29 = (char *)&v163 - v28;
  uint64_t v30 = MEMORY[0x1F4188790](v27);
  v184 = (char *)&v163 - v31;
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v191 = (uint64_t)&v163 - v33;
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  v185 = (char *)&v163 - v35;
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  v180 = (char *)&v163 - v37;
  uint64_t v38 = MEMORY[0x1F4188790](v36);
  v181 = (char *)&v163 - v39;
  uint64_t v40 = MEMORY[0x1F4188790](v38);
  v192 = (char *)&v163 - v41;
  uint64_t v42 = MEMORY[0x1F4188790](v40);
  v186 = (char *)&v163 - v43;
  uint64_t v44 = MEMORY[0x1F4188790](v42);
  v187 = (char *)&v163 - v45;
  uint64_t v46 = MEMORY[0x1F4188790](v44);
  v188 = (char *)&v163 - v47;
  uint64_t v48 = MEMORY[0x1F4188790](v46);
  v189 = (char *)&v163 - v49;
  uint64_t v50 = MEMORY[0x1F4188790](v48);
  v182 = (char *)&v163 - v51;
  uint64_t v52 = MEMORY[0x1F4188790](v50);
  uint64_t v54 = (char *)&v163 - v53;
  uint64_t v55 = MEMORY[0x1F4188790](v52);
  uint64_t v57 = (char *)&v163 - v56;
  MEMORY[0x1F4188790](v55);
  uint64_t v59 = (char *)&v163 - v58;
  uint64_t v60 = a1;
  uint64_t v62 = v61;
  sub_1E0AC2094(v60, (uint64_t)v19, &qword_1EBF0F0F0, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v19, 1, v20) != 1)
  {
    uint64_t v193 = v62;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v59, v19, v20);
    uint64_t v64 = sub_1E0AC4480();
    uint64_t v66 = v65;
    uint64_t v190 = (uint64_t)v59;
    if (v64 == sub_1E0AC4480() && v66 == v67) {
      char v68 = 1;
    }
    else {
      char v68 = sub_1E0AC4B10();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v69 = v193;
    uint64_t v70 = v193 + 16;
    uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v193 + 16);
    v71(v57, v195, v20);
    uint64_t v177 = v70;
    v71(v54, v190, v20);
    v194 = v71;
    v164 = v29;
    uint64_t v163 = v7;
    if (v68)
    {
      uint64_t v72 = sub_1E0AC4450();
      uint64_t v74 = v73;
      uint64_t v76 = v75;
      uint64_t v77 = sub_1E0AC4450();
      uint64_t v79 = v78;
      unsigned __int8 v81 = v80;
      int v165 = MEMORY[0x1E4E3A400](v72, v74, v76, v77, v78, v80);
      unsigned __int8 v82 = v81;
      uint64_t v71 = v194;
      sub_1E0AC2614(v77, v79, v82);
      uint64_t v83 = v74;
      uint64_t v69 = v193;
      sub_1E0AC2614(v72, v83, v76);
    }
    else
    {
      int v165 = 0;
    }
    uint64_t v85 = v191;
    uint64_t v84 = (uint64_t)v192;
    uint64_t v88 = *(void (**)(char *, uint64_t))(v69 + 8);
    uint64_t v87 = v69 + 8;
    uint64_t v86 = v88;
    v88(v54, v20);
    v88(v57, v20);
    uint64_t v89 = v182;
    v71(v182, v195, v20);
    uint64_t v91 = v189;
    uint64_t v90 = v190;
    v71(v189, v190, v20);
    if (v165)
    {
      uint64_t v193 = v87;
      uint64_t v92 = sub_1E0AC4510();
      unint64_t v94 = v93;
      uint64_t v96 = sub_1E0AC4510();
      unint64_t v97 = v95;
      unint64_t v98 = v95 >> 60;
      uint64_t v99 = v91;
      v100 = v188;
      if (v94 >> 60 == 15)
      {
        v86(v99, v20);
        v86(v89, v20);
        uint64_t v90 = v190;
        if (v98 > 0xE)
        {
          sub_1E0AC2114(v92, v94);
          unsigned int v101 = v194;
          v194(v100, v195, v20);
          v102 = v187;
          v101(v187, v90, v20);
LABEL_32:
          uint64_t v118 = v173;
          sub_1E0AC44C0();
          uint64_t v119 = v172;
          sub_1E0AC44C0();
          uint64_t v120 = v176;
          uint64_t v121 = v176 + *(int *)(v163 + 48);
          v122 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F672E8];
          sub_1E0AC2094(v118, v176, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
          uint64_t v190 = v121;
          sub_1E0AC2094(v119, v121, &qword_1EBF0F0E8, v122);
          v123 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v174 + 48);
          uint64_t v124 = v175;
          if (v123(v120, 1, v175) == 1)
          {
            v125 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F672E8];
            sub_1E0AC1D7C(v119, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
            sub_1E0AC1D7C(v118, &qword_1EBF0F0E8, v125);
            v86(v102, v20);
            v86(v188, v20);
            int v126 = v123(v190, 1, v175);
            uint64_t v85 = v191;
            uint64_t v105 = v90;
            if (v126 == 1)
            {
              sub_1E0AC1D7C(v176, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
              v127 = (void (*)(uint64_t, uint64_t, uint64_t))v194;
              v194(v186, v195, v20);
              v127((uint64_t)v192, v90, v20);
              v106 = v178;
LABEL_39:
              sub_1E0AC4410();
              sub_1E0AC4410();
              sub_1E0AC26F0(&qword_1EBF0F218, MEMORY[0x1E4F67030]);
              uint64_t v137 = v168;
              sub_1E0AC48D0();
              sub_1E0AC48D0();
              if (v198 == v196 && v199 == v197) {
                LODWORD(v193) = 1;
              }
              else {
                LODWORD(v193) = sub_1E0AC4B10();
              }
              uint64_t v138 = v167;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v139 = *(void (**)(char *, uint64_t))(v138 + 8);
              v139(v171, v137);
              v139(v170, v137);
              v86(v192, v20);
              v86(v186, v20);
              v107 = v181;
              uint64_t v103 = v194;
              v194(v181, v195, v20);
              v108 = v180;
              v103(v180, v105, v20);
              if (v193)
              {
                uint64_t v191 = sub_1E0AC4490();
                v192 = (char *)sub_1E0AC4490();
                sub_1E0ABD81C(v191, (uint64_t)v192);
                LODWORD(v193) = v140;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v86(v108, v20);
                v86(v107, v20);
                v109 = v185;
                v103(v185, v195, v20);
                v103((char *)v85, v105, v20);
                if (v193)
                {
                  uint64_t v141 = sub_1E0AC44F0();
                  uint64_t v142 = sub_1E0AC44F0();
                  char v143 = sub_1E0ABDB44(v141, v142);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v86((char *)v85, v20);
                  v86(v185, v20);
                  v110 = v184;
                  v103(v184, v195, v20);
                  v111 = v164;
                  v103(v164, v105, v20);
                  if (v143)
                  {
                    uint64_t v144 = sub_1E0AC4460();
                    uint64_t v146 = v145;
                    uint64_t v147 = sub_1E0AC4460();
                    uint64_t v149 = v148;
                    if (!v146)
                    {
                      v86(v111, v20);
                      v86(v110, v20);
                      uint64_t v114 = v179;
                      if (!v149) {
                        goto LABEL_53;
                      }
                      swift_bridgeObjectRelease();
                      uint64_t v112 = v183;
                      uint64_t v113 = v194;
                      v194(v106, v195, v20);
                      goto LABEL_26;
                    }
                    if (v148)
                    {
                      uint64_t v114 = v179;
                      if (v144 == v147 && v146 == v148)
                      {
                        swift_bridgeObjectRelease();
                        v86(v111, v20);
                        v86(v184, v20);
                        swift_bridgeObjectRelease();
LABEL_53:
                        v150 = v194;
                        v194(v106, v195, v20);
                        uint64_t v112 = v183;
                        v150(v183, v105, v20);
                        goto LABEL_56;
                      }
                      char v151 = sub_1E0AC4B10();
                      swift_bridgeObjectRelease();
                      v86(v111, v20);
                      v86(v184, v20);
                      swift_bridgeObjectRelease();
                      v152 = v194;
                      v194(v106, v195, v20);
                      uint64_t v112 = v183;
                      v152(v183, v105, v20);
                      if (v151)
                      {
LABEL_56:
                        uint64_t v153 = sub_1E0AC44B0();
                        v154 = v112;
                        uint64_t v156 = v155;
                        uint64_t v157 = sub_1E0AC44B0();
                        uint64_t v159 = v158;
                        if (v156)
                        {
                          if (v158)
                          {
                            if (v153 == v157 && v156 == v158)
                            {
                              swift_bridgeObjectRelease();
                              v86(v183, v20);
                              v86(v106, v20);
                              swift_bridgeObjectRelease();
LABEL_63:
                              v194(v114, v195, v20);
LABEL_66:
                              uint64_t v161 = sub_1E0AC4420();
                              uint64_t v162 = sub_1E0AC4420();
                              char v63 = sub_1E0ABDDE8(v161, v162);
                              swift_bridgeObjectRelease();
                              swift_bridgeObjectRelease();
                              goto LABEL_29;
                            }
                            char v160 = sub_1E0AC4B10();
                            swift_bridgeObjectRelease();
                            v86(v183, v20);
                            v86(v106, v20);
                            swift_bridgeObjectRelease();
                            v194(v114, v195, v20);
                            char v63 = 0;
                            if (v160) {
                              goto LABEL_66;
                            }
LABEL_29:
                            v86(v114, v20);
                            v86((char *)v105, v20);
                            return v63 & 1;
                          }
                          swift_bridgeObjectRetain();
                          v86(v183, v20);
                          v86(v106, v20);
                          swift_bridgeObjectRelease_n();
                        }
                        else
                        {
                          v86(v154, v20);
                          v86(v106, v20);
                          if (!v159) {
                            goto LABEL_63;
                          }
                          swift_bridgeObjectRelease();
                        }
LABEL_28:
                        v194(v114, v195, v20);
                        char v63 = 0;
                        goto LABEL_29;
                      }
LABEL_27:
                      v86(v112, v20);
                      v86(v106, v20);
                      goto LABEL_28;
                    }
                    swift_bridgeObjectRetain();
                    v86(v111, v20);
                    v86(v184, v20);
                    swift_bridgeObjectRelease_n();
                    uint64_t v112 = v183;
LABEL_25:
                    uint64_t v113 = v194;
                    uint64_t v114 = v179;
                    v194(v106, v195, v20);
LABEL_26:
                    v113(v112, v105, v20);
                    goto LABEL_27;
                  }
LABEL_24:
                  v86(v111, v20);
                  v86(v110, v20);
                  uint64_t v112 = v183;
                  goto LABEL_25;
                }
LABEL_23:
                v86((char *)v85, v20);
                v86(v109, v20);
                v110 = v184;
                v103(v184, v195, v20);
                v111 = v164;
                v103(v164, v105, v20);
                goto LABEL_24;
              }
LABEL_22:
              v86(v108, v20);
              v86(v107, v20);
              v109 = v185;
              v103(v185, v195, v20);
              v103((char *)v85, v105, v20);
              goto LABEL_23;
            }
          }
          else
          {
            uint64_t v128 = v169;
            sub_1E0AC2094(v120, v169, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
            uint64_t v129 = v190;
            if (v123(v190, 1, v124) != 1)
            {
              uint64_t v131 = v120;
              uint64_t v132 = v174;
              v133 = v166;
              (*(void (**)(char *, uint64_t, uint64_t))(v174 + 32))(v166, v129, v124);
              sub_1E0AC26F0(&qword_1EAD61B70, MEMORY[0x1E4F672E8]);
              LODWORD(v190) = sub_1E0AC4870();
              v134 = *(void (**)(char *, uint64_t))(v132 + 8);
              v134(v133, v124);
              uint64_t v135 = v124;
              v136 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F672E8];
              sub_1E0AC1D7C(v172, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
              sub_1E0AC1D7C(v173, &qword_1EBF0F0E8, v136);
              v86(v187, v20);
              v86(v188, v20);
              v134((char *)v128, v135);
              sub_1E0AC1D7C(v131, &qword_1EBF0F0E8, v136);
              v104 = v186;
              uint64_t v103 = v194;
              v194(v186, v195, v20);
              uint64_t v84 = (uint64_t)v192;
              uint64_t v105 = v90;
              v103(v192, v90, v20);
              v106 = v178;
              uint64_t v85 = v191;
              if (v190) {
                goto LABEL_39;
              }
LABEL_21:
              v86((char *)v84, v20);
              v86(v104, v20);
              v107 = v181;
              v103(v181, v195, v20);
              v108 = v180;
              v103(v180, v105, v20);
              goto LABEL_22;
            }
            v130 = (uint64_t (*)(uint64_t))MEMORY[0x1E4F672E8];
            sub_1E0AC1D7C(v172, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8]);
            sub_1E0AC1D7C(v173, &qword_1EBF0F0E8, v130);
            v86(v187, v20);
            v86(v188, v20);
            (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v128, v124);
            uint64_t v85 = v191;
            uint64_t v105 = v90;
          }
          sub_1E0AC1D1C(v176, (uint64_t (*)(void))sub_1E0AC2000);
          v106 = v178;
          uint64_t v103 = v194;
          v104 = v186;
          uint64_t v84 = (uint64_t)v192;
          v194(v186, v195, v20);
LABEL_20:
          v103((char *)v84, v105, v20);
          goto LABEL_21;
        }
      }
      else
      {
        if (v95 >> 60 != 15)
        {
          sub_1E0AC2600(v92, v94);
          char v116 = sub_1E0AC2368(v92, v94, v96, v97);
          sub_1E0AC2114(v96, v97);
          sub_1E0AC2114(v92, v94);
          v86(v189, v20);
          v86(v89, v20);
          sub_1E0AC2114(v92, v94);
          v117 = v194;
          v194(v100, v195, v20);
          v102 = v187;
          v117(v187, v90, v20);
          uint64_t v85 = v191;
          uint64_t v84 = (uint64_t)v192;
          if (v116) {
            goto LABEL_32;
          }
LABEL_19:
          v86(v102, v20);
          v86(v100, v20);
          uint64_t v103 = v194;
          v104 = v186;
          uint64_t v105 = v90;
          v106 = v178;
          v194(v186, v195, v20);
          goto LABEL_20;
        }
        sub_1E0AC2180(v92, v94);
        v86(v189, v20);
        v86(v89, v20);
        sub_1E0AC2114(v92, v94);
      }
      sub_1E0AC2114(v92, v94);
      sub_1E0AC2114(v96, v97);
      uint64_t v71 = v194;
      uint64_t v85 = v191;
      uint64_t v84 = (uint64_t)v192;
    }
    else
    {
      v86(v91, v20);
      v86(v89, v20);
      v100 = v188;
    }
    v71(v100, v195, v20);
    v102 = v187;
    v71(v187, v90, v20);
    goto LABEL_19;
  }
  sub_1E0AC1D7C((uint64_t)v19, &qword_1EBF0F0F0, MEMORY[0x1E4F67110]);
  char v63 = 0;
  return v63 & 1;
}

unint64_t sub_1E0ABD4C0(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a2;
  sub_1E0AC262C(0, &qword_1EBF0F0F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = sub_1E0AC4520();
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v30 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v27 = (char *)&v24 - v13;
  uint64_t v14 = *(void *)(a3 + 16);
  if (!v14) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v25 = v12;
  uint64_t v28 = (void (**)(char *))(v12 + 32);
  uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  uint64_t v24 = a3;
  uint64_t v15 = (uint64_t *)(a3 + 40);
  unint64_t v33 = MEMORY[0x1E4FBC860];
  uint64_t v26 = a1;
  do
  {
    uint64_t v16 = v9;
    uint64_t v17 = *v15;
    v32[0] = *(v15 - 1);
    v32[1] = v17;
    swift_bridgeObjectRetain();
    a1(v32);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v33;
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v16;
    if ((*v29)(v8, 1, v16) == 1)
    {
      sub_1E0AC1D7C((uint64_t)v8, &qword_1EBF0F0F0, MEMORY[0x1E4F67110]);
    }
    else
    {
      uint64_t v18 = v27;
      uint64_t v19 = *v28;
      (*v28)(v27);
      ((void (*)(char *, char *, uint64_t))v19)(v30, v18, v16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v33 = sub_1E0ABEB48(0, *(void *)(v33 + 16) + 1, 1, v33);
      }
      unint64_t v21 = *(void *)(v33 + 16);
      unint64_t v20 = *(void *)(v33 + 24);
      if (v21 >= v20 >> 1) {
        unint64_t v33 = sub_1E0ABEB48(v20 > 1, v21 + 1, 1, v33);
      }
      unint64_t v22 = v33;
      *(void *)(v33 + 16) = v21 + 1;
      uint64_t v9 = v16;
      ((void (*)(unint64_t, char *, uint64_t))v19)(v22+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v21, v30, v16);
      a1 = v26;
    }
    v15 += 2;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v33;
}

void sub_1E0ABD81C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (a2 < 0) {
        unint64_t v6 = a2;
      }
      else {
        unint64_t v6 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_57;
    }
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v8 = a1;
LABEL_18:
    sub_1E0AC12E0(v7, v8);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v28 = a1 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  unint64_t v6 = sub_1E0AB4BB8();
  int64_t v12 = 0;
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = a2 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_46;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v16 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        return;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          return;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            return;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_45:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_46:
    id v19 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v20 = sub_1E0AC49B0();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_53;
    }
    int64_t v30 = v12;
    id v23 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
    char v24 = sub_1E0AC49C0();

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
        char v27 = sub_1E0AC49C0();

        if (v27) {
          goto LABEL_27;
        }
      }
LABEL_53:

      return;
    }
LABEL_27:

    int64_t v12 = v30;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29) {
    return;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_45;
    }
  }
LABEL_56:
  __break(1u);
LABEL_57:
  MEMORY[0x1F4184BB8](v6, v5);
}

uint64_t sub_1E0ABDB44(uint64_t result, uint64_t a2)
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
    unint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1E0AC4B70();
    swift_bridgeObjectRetain();
    sub_1E0AC48B0();
    uint64_t v18 = sub_1E0AC4B90();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_1E0AC4B10() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        char v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_1E0AC4B10() & 1) != 0) {
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

uint64_t sub_1E0ABDDE8(uint64_t a1, uint64_t a2)
{
  __s2[2] = *MEMORY[0x1E4F143B8];
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v90 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v91 = (unint64_t)(v5 + 63) >> 6;
  while (2)
  {
    if (v7)
    {
      unint64_t v8 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v93 = v4;
      unint64_t v9 = v8 | (v4 << 6);
    }
    else
    {
      int64_t v10 = v4 + 1;
      if (__OFADD__(v4, 1))
      {
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
        goto LABEL_149;
      }
      if (v10 >= v91) {
        return 1;
      }
      unint64_t v11 = *(void *)(v90 + 8 * v10);
      int64_t v12 = v4 + 1;
      if (!v11)
      {
        int64_t v12 = v4 + 2;
        if (v4 + 2 >= v91) {
          return 1;
        }
        unint64_t v11 = *(void *)(v90 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v4 + 3;
          if (v4 + 3 >= v91) {
            return 1;
          }
          unint64_t v11 = *(void *)(v90 + 8 * v12);
          if (!v11)
          {
            int64_t v12 = v4 + 4;
            if (v4 + 4 >= v91) {
              return 1;
            }
            unint64_t v11 = *(void *)(v90 + 8 * v12);
            if (!v11)
            {
              uint64_t v13 = v4 + 5;
              if (v4 + 5 >= v91) {
                return 1;
              }
              unint64_t v11 = *(void *)(v90 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  int64_t v12 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    break;
                  }
                  if (v12 >= v91) {
                    return 1;
                  }
                  unint64_t v11 = *(void *)(v90 + 8 * v12);
                  ++v13;
                  if (v11) {
                    goto LABEL_25;
                  }
                }
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
                __break(1u);
LABEL_161:
                __break(1u);
LABEL_162:
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
              }
              int64_t v12 = v4 + 5;
            }
          }
        }
      }
LABEL_25:
      unint64_t v7 = (v11 - 1) & v11;
      int64_t v93 = v12;
      unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    uint64_t v14 = 16 * v9;
    unint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    unint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    sub_1E0AC2180(v20, v19);
    unint64_t v21 = sub_1E0AB7BD4(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_139;
    }
    unint64_t v24 = v19 >> 62;
    uint64_t v25 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v21);
    uint64_t v27 = *v25;
    unint64_t v26 = v25[1];
    uint64_t v28 = 0;
    switch(v26 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v27), v27)) {
          goto LABEL_142;
        }
        uint64_t v28 = HIDWORD(v27) - (int)v27;
LABEL_32:
        sub_1E0AC2180(v27, v26);
        break;
      case 2uLL:
        uint64_t v30 = *(void *)(v27 + 16);
        uint64_t v29 = *(void *)(v27 + 24);
        uint64_t v28 = v29 - v30;
        if (!__OFSUB__(v29, v30)) {
          goto LABEL_32;
        }
        goto LABEL_143;
      case 3uLL:
        break;
      default:
        uint64_t v28 = BYTE6(v26);
        break;
    }
    switch((int)v24)
    {
      case 1:
        LODWORD(v31) = HIDWORD(v20) - v20;
        if (__OFSUB__(HIDWORD(v20), v20)) {
          goto LABEL_144;
        }
        uint64_t v31 = (int)v31;
LABEL_38:
        if (v28 == v31)
        {
          if (v28 < 1)
          {
LABEL_7:
            sub_1E0AC2128(v27, v26);
            sub_1E0AC2128(v20, v19);
            uint64_t v3 = a1;
            int64_t v4 = v93;
          }
          else
          {
            switch(v26 >> 62)
            {
              case 1uLL:
                if ((int)v27 > v27 >> 32) {
                  goto LABEL_146;
                }
                uint64_t v40 = (char *)sub_1E0AC4370();
                if (!v40) {
                  goto LABEL_52;
                }
                uint64_t v41 = sub_1E0AC4390();
                if (__OFSUB__((int)v27, v41)) {
                  goto LABEL_148;
                }
                v40 += (int)v27 - v41;
LABEL_52:
                uint64_t v2 = a2;
                sub_1E0AC4380();
                if (!v24)
                {
                  __s2[0] = v20;
                  LOWORD(__s2[1]) = v19;
                  BYTE2(__s2[1]) = BYTE2(v19);
                  BYTE3(__s2[1]) = BYTE3(v19);
                  BYTE4(__s2[1]) = BYTE4(v19);
                  BYTE5(__s2[1]) = BYTE5(v19);
                  if (!v40) {
                    goto LABEL_177;
                  }
                  size_t v58 = BYTE6(v19);
                  uint64_t v60 = __s2;
                  uint64_t v59 = v40;
LABEL_120:
                  int v46 = memcmp(v59, v60, v58);
                  goto LABEL_121;
                }
                if (v24 == 1)
                {
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_158;
                  }
                  swift_retain();
                  uint64_t v42 = (char *)sub_1E0AC4370();
                  if (v42)
                  {
                    uint64_t v43 = sub_1E0AC4390();
                    if (__OFSUB__((int)v20, v43)) {
                      goto LABEL_165;
                    }
                    v42 += (int)v20 - v43;
                  }
                  uint64_t v2 = a2;
                  uint64_t v44 = sub_1E0AC4380();
                  if (v44 >= (v20 >> 32) - (int)v20) {
                    size_t v45 = (v20 >> 32) - (int)v20;
                  }
                  else {
                    size_t v45 = v44;
                  }
                  if (!v40) {
                    goto LABEL_167;
                  }
                  uint64_t v3 = a1;
                  if (!v42) {
                    goto LABEL_168;
                  }
                  int v46 = memcmp(v40, v42, v45);
                  sub_1E0AC2128(v20, v19);
                  sub_1E0AC2128(v27, v26);
                  sub_1E0AC2128(v20, v19);
                  goto LABEL_123;
                }
                uint64_t v81 = *(void *)(v20 + 16);
                uint64_t v80 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                unsigned __int8 v82 = (char *)sub_1E0AC4370();
                if (v82)
                {
                  uint64_t v83 = sub_1E0AC4390();
                  if (__OFSUB__(v81, v83)) {
                    goto LABEL_164;
                  }
                  v82 += v81 - v83;
                }
                BOOL v34 = __OFSUB__(v80, v81);
                int64_t v84 = v80 - v81;
                if (v34) {
                  goto LABEL_159;
                }
                uint64_t v85 = sub_1E0AC4380();
                if (v85 >= v84) {
                  size_t v86 = v84;
                }
                else {
                  size_t v86 = v85;
                }
                uint64_t v3 = a1;
                if (!v40) {
                  goto LABEL_178;
                }
                uint64_t v2 = a2;
                if (!v82) {
                  goto LABEL_179;
                }
                int v71 = memcmp(v40, v82, v86);
                swift_release();
                swift_release();
                sub_1E0AC2128(v27, v26);
                sub_1E0AC2128(v20, v19);
LABEL_135:
                int64_t v4 = v93;
                if (v71) {
                  return 0;
                }
                continue;
              case 2uLL:
                uint64_t v47 = *(void *)(v27 + 16);
                swift_retain();
                swift_retain();
                uint64_t v48 = (char *)sub_1E0AC4370();
                if (!v48) {
                  goto LABEL_67;
                }
                uint64_t v49 = sub_1E0AC4390();
                if (__OFSUB__(v47, v49)) {
                  goto LABEL_147;
                }
                v48 += v47 - v49;
LABEL_67:
                uint64_t v2 = a2;
                sub_1E0AC4380();
                if (!v24)
                {
                  __s2[0] = v20;
                  LOWORD(__s2[1]) = v19;
                  BYTE2(__s2[1]) = BYTE2(v19);
                  BYTE3(__s2[1]) = BYTE3(v19);
                  BYTE4(__s2[1]) = BYTE4(v19);
                  BYTE5(__s2[1]) = BYTE5(v19);
                  if (!v48) {
                    goto LABEL_174;
                  }
                  int v46 = memcmp(v48, __s2, BYTE6(v19));
                  goto LABEL_106;
                }
                __s1 = v48;
                if (v24 == 1)
                {
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_152;
                  }
                  swift_retain();
                  uint64_t v50 = (char *)sub_1E0AC4370();
                  if (v50)
                  {
                    uint64_t v51 = sub_1E0AC4390();
                    if (__OFSUB__((int)v20, v51)) {
                      goto LABEL_163;
                    }
                    v50 += (int)v20 - v51;
                  }
                  uint64_t v2 = a2;
                  uint64_t v52 = sub_1E0AC4380();
                  if (v52 >= (v20 >> 32) - (int)v20) {
                    size_t v53 = (v20 >> 32) - (int)v20;
                  }
                  else {
                    size_t v53 = v52;
                  }
                  if (!v48) {
                    goto LABEL_169;
                  }
                  if (!v50) {
                    goto LABEL_170;
                  }
                  int v46 = memcmp(v48, v50, v53);
                  sub_1E0AC2128(v20, v19);
LABEL_106:
                  swift_release();
                  swift_release();
LABEL_121:
                  sub_1E0AC2128(v27, v26);
                  sub_1E0AC2128(v20, v19);
LABEL_122:
                  uint64_t v3 = a1;
LABEL_123:
                  int64_t v4 = v93;
                  if (v46) {
                    return 0;
                  }
                  continue;
                }
                uint64_t v73 = *(void *)(v20 + 16);
                uint64_t v72 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                uint64_t v74 = (char *)sub_1E0AC4370();
                if (v74)
                {
                  uint64_t v75 = sub_1E0AC4390();
                  if (__OFSUB__(v73, v75)) {
                    goto LABEL_162;
                  }
                  v74 += v73 - v75;
                }
                BOOL v34 = __OFSUB__(v72, v73);
                int64_t v76 = v72 - v73;
                if (v34) {
                  goto LABEL_157;
                }
                uint64_t v77 = sub_1E0AC4380();
                if (v77 >= v76) {
                  size_t v78 = v76;
                }
                else {
                  size_t v78 = v77;
                }
                if (!__s1) {
                  goto LABEL_175;
                }
                uint64_t v2 = a2;
                if (!v74) {
                  goto LABEL_176;
                }
                int v79 = memcmp(__s1, v74, v78);
                swift_release();
                swift_release();
                swift_release();
                swift_release();
                sub_1E0AC2128(v27, v26);
                sub_1E0AC2128(v20, v19);
                uint64_t v3 = a1;
                int64_t v4 = v93;
                if (v79) {
                  return 0;
                }
                break;
              case 3uLL:
                memset(__s2, 0, 14);
                if (!v24) {
                  goto LABEL_88;
                }
                if (v24 == 1)
                {
                  uint64_t v35 = (v20 >> 32) - (int)v20;
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_151;
                  }
                  sub_1E0AC2180(v20, v19);
                  uint64_t v54 = sub_1E0AC4370();
                  if (!v54) {
                    goto LABEL_171;
                  }
                  uint64_t v37 = v54;
                  uint64_t v55 = sub_1E0AC4390();
                  uint64_t v39 = (int)v20 - v55;
                  if (__OFSUB__((int)v20, v55)) {
                    goto LABEL_156;
                  }
LABEL_84:
                  uint64_t v56 = sub_1E0AC4380();
                  if (v56 >= v35) {
                    size_t v57 = v35;
                  }
                  else {
                    size_t v57 = v56;
                  }
                  int v46 = memcmp(__s2, (const void *)(v37 + v39), v57);
                  sub_1E0AC2128(v20, v19);
                  sub_1E0AC2128(v27, v26);
                  sub_1E0AC2128(v20, v19);
                  uint64_t v2 = a2;
                  goto LABEL_122;
                }
                uint64_t v67 = *(void *)(v20 + 16);
                uint64_t v68 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                char v63 = (char *)sub_1E0AC4370();
                if (v63)
                {
                  uint64_t v69 = sub_1E0AC4390();
                  if (__OFSUB__(v67, v69)) {
                    goto LABEL_161;
                  }
                  v63 += v67 - v69;
                }
                int64_t v65 = v68 - v67;
                if (__OFSUB__(v68, v67)) {
                  goto LABEL_154;
                }
                uint64_t v66 = sub_1E0AC4380();
                uint64_t v3 = a1;
                if (!v63) {
                  goto LABEL_173;
                }
LABEL_100:
                if (v66 >= v65) {
                  size_t v70 = v65;
                }
                else {
                  size_t v70 = v66;
                }
                int v71 = memcmp(__s2, v63, v70);
                swift_release();
                swift_release();
                sub_1E0AC2128(v27, v26);
                sub_1E0AC2128(v20, v19);
                uint64_t v2 = a2;
                goto LABEL_135;
              default:
                __s2[0] = v27;
                LOWORD(__s2[1]) = v26;
                BYTE2(__s2[1]) = BYTE2(v26);
                BYTE3(__s2[1]) = BYTE3(v26);
                BYTE4(__s2[1]) = BYTE4(v26);
                BYTE5(__s2[1]) = BYTE5(v26);
                if (!v24)
                {
LABEL_88:
                  uint64_t v94 = v20;
                  __int16 v95 = v19;
                  char v96 = BYTE2(v19);
                  char v97 = BYTE3(v19);
                  char v98 = BYTE4(v19);
                  size_t v58 = BYTE6(v19);
                  char v99 = BYTE5(v19);
                  uint64_t v59 = __s2;
                  uint64_t v60 = &v94;
                  goto LABEL_120;
                }
                if (v24 == 1)
                {
                  uint64_t v35 = (v20 >> 32) - (int)v20;
                  if (v20 >> 32 < (int)v20) {
                    goto LABEL_150;
                  }
                  sub_1E0AC2180(v20, v19);
                  uint64_t v36 = sub_1E0AC4370();
                  if (!v36)
                  {
                    sub_1E0AC4380();
                    __break(1u);
LABEL_167:
                    __break(1u);
LABEL_168:
                    __break(1u);
LABEL_169:
                    __break(1u);
LABEL_170:
                    __break(1u);
LABEL_171:
                    sub_1E0AC4380();
                    __break(1u);
LABEL_172:
                    __break(1u);
LABEL_173:
                    __break(1u);
LABEL_174:
                    __break(1u);
LABEL_175:
                    __break(1u);
LABEL_176:
                    __break(1u);
LABEL_177:
                    __break(1u);
LABEL_178:
                    __break(1u);
LABEL_179:
                    __break(1u);
                    JUMPOUT(0x1E0ABE8A4);
                  }
                  uint64_t v37 = v36;
                  uint64_t v38 = sub_1E0AC4390();
                  uint64_t v39 = (int)v20 - v38;
                  if (__OFSUB__((int)v20, v38)) {
                    goto LABEL_155;
                  }
                  goto LABEL_84;
                }
                uint64_t v61 = *(void *)(v20 + 16);
                uint64_t v62 = *(void *)(v20 + 24);
                swift_retain();
                swift_retain();
                char v63 = (char *)sub_1E0AC4370();
                if (v63)
                {
                  uint64_t v64 = sub_1E0AC4390();
                  if (__OFSUB__(v61, v64)) {
                    goto LABEL_160;
                  }
                  v63 += v61 - v64;
                }
                int64_t v65 = v62 - v61;
                if (__OFSUB__(v62, v61)) {
                  goto LABEL_153;
                }
                uint64_t v66 = sub_1E0AC4380();
                uint64_t v3 = a1;
                if (!v63) {
                  goto LABEL_172;
                }
                goto LABEL_100;
            }
          }
          continue;
        }
LABEL_138:
        sub_1E0AC2128(v27, v26);
LABEL_139:
        sub_1E0AC2128(v20, v19);
        return 0;
      case 2:
        uint64_t v33 = *(void *)(v20 + 16);
        uint64_t v32 = *(void *)(v20 + 24);
        BOOL v34 = __OFSUB__(v32, v33);
        uint64_t v31 = v32 - v33;
        if (!v34) {
          goto LABEL_38;
        }
        goto LABEL_145;
      case 3:
        if (!v28) {
          goto LABEL_7;
        }
        goto LABEL_138;
      default:
        uint64_t v31 = BYTE6(v19);
        goto LABEL_38;
    }
  }
}

uint64_t sub_1E0ABE8D4@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1E0AC2180(a2, a3);
      int64_t v10 = (char *)sub_1E0AC4370();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1E0AC4390();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1E0AC4380();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1E0ABEB38);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1E0AC2128(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1E0AC4370();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1E0AC4390();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1E0AC4380();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1E0ABEB48(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    size_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1E0AC262C(0, &qword_1EBF0F1F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = *(void *)(sub_1E0AC4520() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  size_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1E0AC4AD0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1E0AC4520() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1E0AC1EA8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_1E0ABEDDC(void *result, int64_t a2, char a3, void *a4)
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
      sub_1E0AC2738(0, &qword_1EBF0F1F8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      long long v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      unint64_t v12 = v10 + 4;
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
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      unint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1E0AC16CC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1E0ABEF08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  sub_1E0AC2738(0, &qword_1EBF0F208);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1E0AC1434((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1E0AC1E40();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t sub_1E0ABEFFC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1E0AC4B70();
  swift_bridgeObjectRetain();
  sub_1E0AC48B0();
  uint64_t v8 = sub_1E0AC4B90();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1E0AC4B10() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1E0AC4B10() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1E0AC0D20(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1E0ABF1AC(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1E0ABFAD8(v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_1E0ABF354(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v36 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v34 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v35 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v35) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v36 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v35) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v36 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v35) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v36 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v35) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v36 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v35)
                {
LABEL_47:
                  sub_1E0AC1E40();
                  return v2;
                }
                unint64_t v13 = *(void *)(v36 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v35) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v36 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      sub_1E0AC4B70();
      swift_bridgeObjectRetain();
      sub_1E0AC48B0();
      uint64_t v19 = sub_1E0AC4B90();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    int v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1E0AC4B10() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = a1;
      uint64_t v38 = v36;
      uint64_t v39 = v34;
      int64_t v40 = v9;
      unint64_t v41 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        __int16 v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1E0AC4B10() & 1) == 0);
      uint64_t v37 = a1;
      uint64_t v38 = v36;
      uint64_t v39 = v34;
      int64_t v40 = v9;
      unint64_t v41 = v7;
      swift_bridgeObjectRelease();
    }
    char v28 = *(unsigned char *)(v2 + 32);
    unint64_t v29 = (unint64_t)((1 << v28) + 63) >> 6;
    size_t v30 = 8 * v29;
    if ((v28 & 0x3Fu) < 0xE || swift_stdlib_isStackAllocationSafe())
    {
      MEMORY[0x1F4188790]();
      memcpy((char *)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v30);
      uint64_t v31 = sub_1E0ABFF44((uint64_t)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), v29, v2, v21, &v37);
      swift_release();
      sub_1E0AC1E40();
    }
    else
    {
      uint64_t v32 = (void *)swift_slowAlloc();
      memcpy(v32, (const void *)(v2 + 56), v30);
      uint64_t v31 = sub_1E0ABFF44((uint64_t)v32, v29, v2, v21, &v37);
      swift_release();
      sub_1E0AC1E40();
      MEMORY[0x1E4E3B040](v32, -1, -1);
    }
    return v31;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1E0ABF7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v26 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      sub_1E0AC4B70();
      swift_bridgeObjectRetain();
      sub_1E0AC48B0();
      uint64_t v9 = sub_1E0AC4B90();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        unint64_t v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1E0AC4B10() & 1) != 0)
        {
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          uint64_t v27 = v5;
LABEL_19:
          char v19 = *(unsigned char *)(v2 + 32);
          unint64_t v20 = (unint64_t)((1 << v19) + 63) >> 6;
          size_t v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            MEMORY[0x1F4188790](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_1E0AC023C((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            int v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            uint64_t v22 = sub_1E0AC023C((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1E4E3B040](v23, -1, -1);
          }
          return v22;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          int64_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1E0AC4B10() & 1) != 0)
          {
            uint64_t v27 = v5;
            uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1E0ABFAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_1E0AC4B70();
  swift_bridgeObjectRetain();
  sub_1E0AC48B0();
  uint64_t v6 = sub_1E0AC4B90();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1E0AC4B10() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1E0AC4B10() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1E0AC06FC();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_1E0AC0B58(v8);
  uint64_t *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1E0ABFC68()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1E0AC1E48();
  uint64_t v3 = sub_1E0AC4A80();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    size_t v30 = (void *)(v2 + 56);
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
                  *size_t v30 = -1 << v29;
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
      sub_1E0AC4B70();
      sub_1E0AC48B0();
      uint64_t result = sub_1E0AC4B90();
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
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1E0ABFF44(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1E0AC0468(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        uint64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1E0AC4B70();
        swift_bridgeObjectRetain();
        sub_1E0AC48B0();
        uint64_t v22 = sub_1E0AC4B90();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1E0AC4B10() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          uint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1E0AC4B10() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        uint64_t result = swift_bridgeObjectRelease();
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x1E4FBC870];
  }
}

uint64_t sub_1E0AC023C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  unint64_t v30 = (unint64_t *)result;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1E0AC0468(v30, a2, v31, a3);
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_29;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1E0AC4B70();
    swift_bridgeObjectRetain();
    sub_1E0AC48B0();
    uint64_t v14 = sub_1E0AC4B90();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_4;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    uint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1E0AC4B10() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1E0AC4B10() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_15:
    unint64_t v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_30;
      }
      --v31;
      if (!v23) {
        return MEMORY[0x1E4FBC870];
      }
    }
LABEL_5:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1E0AC0468(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x1E4FBC870];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_1E0AC1E48();
  uint64_t result = sub_1E0AC4A90();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_1E0AC4B70();
    swift_bridgeObjectRetain();
    sub_1E0AC48B0();
    uint64_t result = sub_1E0AC4B90();
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
          goto LABEL_38;
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
    BOOL v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void *sub_1E0AC06FC()
{
  uint64_t v1 = v0;
  sub_1E0AC1E48();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1E0AC4A70();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

uint64_t sub_1E0AC08AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1E0AC1E48();
  uint64_t v3 = sub_1E0AC4A80();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1E0AC4B70();
    swift_bridgeObjectRetain();
    sub_1E0AC48B0();
    uint64_t result = sub_1E0AC4B90();
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

unint64_t sub_1E0AC0B58(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_1E0AC4A00();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_1E0AC4B70();
        swift_bridgeObjectRetain();
        sub_1E0AC48B0();
        uint64_t v10 = sub_1E0AC4B90();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *int64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1E0AC0D20(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1E0ABFC68();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1E0AC06FC();
      goto LABEL_22;
    }
    sub_1E0AC08AC();
  }
  uint64_t v11 = *v4;
  sub_1E0AC4B70();
  sub_1E0AC48B0();
  uint64_t result = sub_1E0AC4B90();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1E0AC4B10(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1E0AC4B20();
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
          uint64_t result = sub_1E0AC4B10();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
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

uint64_t sub_1E0AC0EBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E0AC0EFC(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1E0AC0EDC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1E0AC1074(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_1E0AC0EFC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1E0AC2738(0, &qword_1EBF0F208);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1E0AC4AE0();
  __break(1u);
  return result;
}

uint64_t sub_1E0AC1074(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  sub_1E0AC262C(0, &qword_1EBF0F1F0, MEMORY[0x1E4F67110], MEMORY[0x1E4FBBE00]);
  uint64_t v10 = *(void *)(sub_1E0AC4520() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
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
  uint64_t v16 = *(void *)(sub_1E0AC4520() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  int64_t v18 = (char *)v13 + v17;
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
  uint64_t result = sub_1E0AC4AE0();
  __break(1u);
  return result;
}

void sub_1E0AC12E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_1E0AC4A10()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_6:
    id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v11);
    char v13 = sub_1E0AC4A30();

    if ((v13 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v4;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v4 = v14 + 1;
  if (v14 + 1 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_1E0AC1434(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
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

uint64_t sub_1E0AC1634(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_1E0AC4940();
  uint64_t v8 = result;
  if (v2)
  {
    int64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1E0ABEFFC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1E0AC16CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1E0AC4AE0();
  __break(1u);
  return result;
}

uint64_t sub_1E0AC17C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = a2;
  BOOL v23 = a3;
  uint64_t v20 = a1;
  uint64_t v21 = sub_1E0AC43D0();
  uint64_t v3 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1E0AC4320();
  MEMORY[0x1F4188790](v6 - 8);
  sub_1E0AC262C(0, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  unint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_1E0AC45E0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1E0AC45F0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  int64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x1E4F67248], v10);
  sub_1E0AC4600();
  sub_1E0AC4430();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v22, v21);
  sub_1E0AC4310();
  __swift_project_boxed_opaque_existential_1(v23, v23[3]);
  sub_1E0AC46B0();
  sub_1E0AC4610();
  uint64_t v18 = sub_1E0AC4620();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 0, 1, v18);
  return sub_1E0AC44D0();
}

uint64_t sub_1E0AC1B3C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v12 = MEMORY[0x1E4FBC860];
    sub_1E0AC0EBC(0, v1, 0);
    uint64_t v2 = v12;
    uint64_t v4 = a1 + 72;
    do
    {
      __swift_project_boxed_opaque_existential_1((void *)(v4 - 40), *(void *)(v4 - 16));
      uint64_t v5 = sub_1E0AC46D0();
      uint64_t v7 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_1E0AC0EBC(0, *(void *)(v12 + 16) + 1, 1);
      }
      unint64_t v9 = *(void *)(v12 + 16);
      unint64_t v8 = *(void *)(v12 + 24);
      if (v9 >= v8 >> 1) {
        sub_1E0AC0EBC(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v12 + 16) = v9 + 1;
      uint64_t v10 = v12 + 16 * v9;
      *(void *)(v10 + 32) = v5;
      *(void *)(v10 + 40) = v7;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1E0AC1C70@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1E0ABA6FC(a1, v3[5], v3[2], v3[3], a2, a3);
}

uint64_t sub_1E0AC1C94@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E0ABA8B0(a1, v2[4], v2[5], v2[6], v2[2], v2[3], a2);
}

uint64_t sub_1E0AC1CB8(uint64_t a1, uint64_t a2)
{
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ArticleInformation - 8) + 32))(a2, a1, ArticleInformation);
  return a2;
}

uint64_t sub_1E0AC1D1C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1E0AC1D7C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_1E0AC262C(0, a2, a3, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_1E0AC1DEC()
{
  unint64_t result = qword_1EAD61B58;
  if (!qword_1EAD61B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD61B58);
  }
  return result;
}

uint64_t sub_1E0AC1E40()
{
  return swift_release();
}

void sub_1E0AC1E48()
{
  if (!qword_1EAD61B60)
  {
    unint64_t v0 = sub_1E0AC4AA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EAD61B60);
    }
  }
}

uint64_t sub_1E0AC1EA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1E0AC4520() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1E0AC4AE0();
  __break(1u);
  return result;
}

void sub_1E0AC2000()
{
  if (!qword_1EAD61B68)
  {
    sub_1E0AC262C(255, &qword_1EBF0F0E8, MEMORY[0x1E4F672E8], MEMORY[0x1E4FBB718]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EAD61B68);
    }
  }
}

uint64_t sub_1E0AC2094(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  sub_1E0AC262C(0, a3, a4, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_1E0AC2114(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1E0AC2128(a1, a2);
  }
  return a1;
}

uint64_t sub_1E0AC2128(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E0AC2180(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E0AC21D8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1E0ABE8D4((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1E0AC22B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1E0AC4370();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1E0AC4390();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1E0AC4380();
  sub_1E0ABE8D4(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1E0AC2368(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1E0AC25D0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1E0AC2180(a3, a4);
                  sub_1E0AC2180(a1, a2);
                  char v17 = sub_1E0AC22B0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1E0AC2128(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1E0AC2180(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1E0AC22B0(v21, v22, v20, a3, a4);
                  sub_1E0AC2128(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1E0AC2180(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1E0AC2180(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1E0AC21D8(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1E0AC2128(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1E0AC2600(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1E0AC2180(a1, a2);
  }
  return a1;
}

uint64_t sub_1E0AC2614(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 5u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1E0AC262C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1E0AC2690()
{
  unint64_t result = qword_1EBF0F108[0];
  if (!qword_1EBF0F108[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1EBF0F108);
  }
  return result;
}

uint64_t sub_1E0AC26F0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1E0AC2738(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_1E0AC4B00();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_1E0AC2780()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t sub_1E0AC2808()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 48))();
}

uint64_t getEnumTagSinglePayload for GenerationError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerationError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1E0AC2964);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0AC298C()
{
  return 0;
}

ValueMetadata *type metadata accessor for GenerationError()
{
  return &type metadata for GenerationError;
}

unint64_t sub_1E0AC29A8()
{
  unint64_t result = qword_1EAD61B80;
  if (!qword_1EAD61B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAD61B80);
  }
  return result;
}

uint64_t sub_1E0AC29FC()
{
  uint64_t v0 = sub_1E0AC4570();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  int v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1E0AC4590();
  __swift_allocate_value_buffer(v4, qword_1EBF0F228);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EBF0F228);
  sub_1E0AB22EC(0, &qword_1EBF0F1E8, MEMORY[0x1E4F67030], MEMORY[0x1E4FBBE00]);
  uint64_t v5 = sub_1E0AC43E0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1E0AC5310;
  (*(void (**)(unint64_t, void, uint64_t))(v6 + 104))(v8 + v7, *MEMORY[0x1E4F66FF8], v5);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F67198], v0);
  return sub_1E0AC4580();
}

uint64_t static GeneratorDomain.articles.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBF0F358 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1E0AC4590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EBF0F228);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t (*sub_1E0AC2C9C())()
{
  return j__swift_endAccess;
}

uint64_t ArticlesGeneratorPipeline.managedArticles.getter()
{
  return swift_bridgeObjectRetain();
}

id ArticlesGeneratorPipeline.articleChangeDetector.getter()
{
  return *(id *)(v0 + qword_1EBF0F368);
}

uint64_t ArticlesGeneratorPipeline.__allocating_init(context:managedArticles:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  ArticlesGeneratorPipeline.init(context:managedArticles:)(a1, a2);
  return v4;
}

uint64_t sub_1E0AC2D68@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v64 = a4;
  uint64_t v60 = a3;
  sub_1E0AB22EC(0, &qword_1EBF0F280, (uint64_t (*)(uint64_t))type metadata accessor for ReadArticleInformation, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v59 = (uint64_t)&v50 - v11;
  uint64_t v56 = sub_1E0AC45D0();
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x1F4188790](v56);
  size_t v58 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  uint64_t v53 = *(void *)(ArticleInformation - 8);
  MEMORY[0x1F4188790](ArticleInformation);
  uint64_t v57 = (uint64_t)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1E0AC4790();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v50 - v19;
  sub_1E0AC4760();
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_1E0AC4780();
  os_log_type_t v22 = sub_1E0AC4960();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v62 = v18;
  uint64_t v63 = v15;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    *(void *)&v67[0] = v51;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v61 = v14;
    *(void *)&v68[0] = v6;
    swift_getMetatypeMetadata();
    uint64_t v52 = v6;
    uint64_t v25 = sub_1E0AC48A0();
    *(void *)&v68[0] = sub_1E0AB26E8(v25, v26, (uint64_t *)v67);
    uint64_t v14 = v61;
    sub_1E0AC49E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&v68[0] = sub_1E0AB26E8(a1, a2, (uint64_t *)v67);
    uint64_t v6 = v52;
    sub_1E0AC49E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1E0AAF000, v21, v22, "[%{public}s]: received read article update: %s", (uint8_t *)v24, 0x16u);
    uint64_t v27 = v51;
    swift_arrayDestroy();
    MEMORY[0x1E4E3B040](v27, -1, -1);
    MEMORY[0x1E4E3B040](v24, -1, -1);

    uint64_t v28 = *(void (**)(char *, uint64_t))(v63 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v15 + 8);
  }
  v28(v20, v14);
  uint64_t v29 = *(void *)(v64 + 16);
  if (v29)
  {
    uint64_t v52 = v28;
    uint64_t v30 = v64 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1E0AB5500(v30, (uint64_t)&v65);
      __swift_project_boxed_opaque_existential_1(&v65, v66);
      if (sub_1E0AC4670() == a1 && v31 == a2)
      {
        uint64_t v43 = v64;
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      char v33 = sub_1E0AC4B10();
      swift_bridgeObjectRelease();
      if (v33) {
        break;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v65);
      v30 += 48;
      if (!--v29)
      {
        swift_bridgeObjectRelease();
        uint64_t v28 = v52;
        goto LABEL_13;
      }
    }
    uint64_t v43 = v64;
LABEL_19:
    swift_bridgeObjectRelease();
    sub_1E0AB55AC(&v65, v67);
    sub_1E0AB55AC(v67, v68);
    uint64_t v44 = v57;
    sub_1E0AB5500((uint64_t)v68, v57);
    uint64_t v45 = ArticleInformation;
    sub_1E0AC43C0();
    uint64_t v46 = type metadata accessor for ArticlesGenerator();
    uint64_t v47 = (uint64_t)v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v58, v60, v56);
    uint64_t v48 = v59;
    sub_1E0AC37BC(v44, v59);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v53 + 56))(v48, 0, 1, v45);
    swift_bridgeObjectRetain();
    uint64_t v49 = ArticlesGenerator.__allocating_init(context:managedArticles:readArticleInfo:)(v47, v43, v48);
    *(void *)(a5 + 24) = v46;
    *(void *)(a5 + 32) = swift_getWitnessTable();
    *(void *)a5 = v49;
    sub_1E0AC3820(v44);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  }
  else
  {
LABEL_13:
    uint64_t v34 = v62;
    sub_1E0AC4760();
    swift_bridgeObjectRetain_n();
    BOOL v35 = sub_1E0AC4780();
    os_log_type_t v36 = sub_1E0AC4970();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v52 = v28;
      uint64_t v39 = v38;
      *(void *)&v67[0] = v38;
      *(_DWORD *)uint64_t v37 = 136446466;
      *(void *)&v68[0] = v6;
      swift_getMetatypeMetadata();
      uint64_t v40 = sub_1E0AC48A0();
      uint64_t v61 = v14;
      *(void *)&v68[0] = sub_1E0AB26E8(v40, v41, (uint64_t *)v67);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&v68[0] = sub_1E0AB26E8(a1, a2, (uint64_t *)v67);
      sub_1E0AC49E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1E0AAF000, v35, v36, "[%{public}s]: received read article identifier for nonexistent article: %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1E4E3B040](v39, -1, -1);
      MEMORY[0x1E4E3B040](v37, -1, -1);

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v52)(v62, v61);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v34, v14);
    }
    *(void *)(a5 + 32) = 0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t ArticlesGeneratorPipeline.deinit()
{
  uint64_t v1 = v0 + qword_1EBF0F370;
  uint64_t v2 = sub_1E0AC4590();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ArticlesGeneratorPipeline.__deallocating_deinit()
{
  ArticlesGeneratorPipeline.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1E0AC3664()
{
  uint64_t v1 = sub_1E0AC45D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_1E0AC3710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1E0AC45D0() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_1E0AC2D68(*(void *)a1, *(void *)(a1 + 8), v2 + v6, *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)), a2);
}

uint64_t sub_1E0AC37BC(uint64_t a1, uint64_t a2)
{
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(ArticleInformation - 8) + 16))(a2, a1, ArticleInformation);
  return a2;
}

uint64_t sub_1E0AC3820(uint64_t a1)
{
  uint64_t ArticleInformation = type metadata accessor for ReadArticleInformation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(ArticleInformation - 8) + 8))(a1, ArticleInformation);
  return a1;
}

uint64_t sub_1E0AC387C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1E0AB16B8();
  return swift_retain();
}

uint64_t sub_1E0AC38B8()
{
  uint64_t v0 = swift_retain();
  return sub_1E0AB1570(v0);
}

uint64_t sub_1E0AC38E4()
{
  return 16;
}

__n128 sub_1E0AC38F0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_1E0AC38FC()
{
  uint64_t result = sub_1E0AC4590();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ArticlesGeneratorPipeline()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ArticlesGeneratorPipeline(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ArticlesGeneratorPipeline);
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.publisher.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ArticlesGeneratorPipeline.__allocating_init(context:managedArticles:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static ArticlesGeneratorPipeline.makeGenerator(for:context:managedArticles:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t ReadArticleInformation.init(article:readDate:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_1E0AB55AC(a1, a3);
  uint64_t v5 = (char *)a3 + *(int *)(type metadata accessor for ReadArticleInformation() + 20);
  uint64_t v6 = sub_1E0AC43D0();
  unint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  return v7(v5, a2, v6);
}

void *initializeBufferWithCopyOfBuffer for ReadArticleInformation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[5];
    long long v8 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v8;
    *(void *)(a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v8 - 8))(a1, a2);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = sub_1E0AC43D0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return v4;
}

uint64_t destroy for ReadArticleInformation(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1E0AC43D0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for ReadArticleInformation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 40);
  long long v7 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v7;
  *(void *)(a1 + 40) = v6;
  (**(void (***)(void))(v7 - 8))();
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_1E0AC43D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t *assignWithCopy for ReadArticleInformation(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __swift_assign_boxed_opaque_existential_2(a1, a2);
  uint64_t v6 = *(int *)(a3 + 20);
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0AC43D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_2(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      result[5] = a2[5];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

_OWORD *initializeWithTake for ReadArticleInformation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1E0AC43D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_OWORD *assignWithTake for ReadArticleInformation(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  int v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E0AC43D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1E0AC4120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1E0AC43D0();
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1E0AC41D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1E0AC43D0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1E0AC4278()
{
  uint64_t result = sub_1E0AC43D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1E0AC4310()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1E0AC4320()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1E0AC4330()
{
  return MEMORY[0x1F411D0D8]();
}

uint64_t sub_1E0AC4340()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1E0AC4350()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1E0AC4360()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1E0AC4370()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1E0AC4380()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1E0AC4390()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1E0AC43A0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E0AC43B0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E0AC43C0()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1E0AC43D0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E0AC43E0()
{
  return MEMORY[0x1F411FF68]();
}

uint64_t sub_1E0AC43F0()
{
  return MEMORY[0x1F4120050]();
}

uint64_t sub_1E0AC4400()
{
  return MEMORY[0x1F411E108]();
}

uint64_t sub_1E0AC4410()
{
  return MEMORY[0x1F41200A0]();
}

uint64_t sub_1E0AC4420()
{
  return MEMORY[0x1F41200A8]();
}

uint64_t sub_1E0AC4430()
{
  return MEMORY[0x1F41200B8]();
}

uint64_t sub_1E0AC4440()
{
  return MEMORY[0x1F41200C8]();
}

uint64_t sub_1E0AC4450()
{
  return MEMORY[0x1F41200D0]();
}

uint64_t sub_1E0AC4460()
{
  return MEMORY[0x1F41200F0]();
}

uint64_t sub_1E0AC4470()
{
  return MEMORY[0x1F41200F8]();
}

uint64_t sub_1E0AC4480()
{
  return MEMORY[0x1F4120108]();
}

uint64_t sub_1E0AC4490()
{
  return MEMORY[0x1F4120110]();
}

uint64_t sub_1E0AC44A0()
{
  return MEMORY[0x1F4120118]();
}

uint64_t sub_1E0AC44B0()
{
  return MEMORY[0x1F4120120]();
}

uint64_t sub_1E0AC44C0()
{
  return MEMORY[0x1F4120128]();
}

uint64_t sub_1E0AC44D0()
{
  return MEMORY[0x1F4120130]();
}

uint64_t sub_1E0AC44E0()
{
  return MEMORY[0x1F4120188]();
}

uint64_t sub_1E0AC44F0()
{
  return MEMORY[0x1F4120198]();
}

uint64_t sub_1E0AC4500()
{
  return MEMORY[0x1F41201A0]();
}

uint64_t sub_1E0AC4510()
{
  return MEMORY[0x1F41201B0]();
}

uint64_t sub_1E0AC4520()
{
  return MEMORY[0x1F41201B8]();
}

uint64_t sub_1E0AC4530()
{
  return MEMORY[0x1F41201D8]();
}

uint64_t sub_1E0AC4540()
{
  return MEMORY[0x1F4120210]();
}

uint64_t sub_1E0AC4550()
{
  return MEMORY[0x1F4120218]();
}

uint64_t sub_1E0AC4560()
{
  return MEMORY[0x1F4120220]();
}

uint64_t sub_1E0AC4570()
{
  return MEMORY[0x1F4120248]();
}

uint64_t sub_1E0AC4580()
{
  return MEMORY[0x1F4120268]();
}

uint64_t sub_1E0AC4590()
{
  return MEMORY[0x1F4120288]();
}

uint64_t sub_1E0AC45A0()
{
  return MEMORY[0x1F4120298]();
}

uint64_t sub_1E0AC45B0()
{
  return MEMORY[0x1F41202A0]();
}

uint64_t sub_1E0AC45C0()
{
  return MEMORY[0x1F41202B8]();
}

uint64_t sub_1E0AC45D0()
{
  return MEMORY[0x1F41202D0]();
}

uint64_t sub_1E0AC45E0()
{
  return MEMORY[0x1F41205D8]();
}

uint64_t sub_1E0AC45F0()
{
  return MEMORY[0x1F4120720]();
}

uint64_t sub_1E0AC4600()
{
  return MEMORY[0x1F4120728]();
}

uint64_t sub_1E0AC4610()
{
  return MEMORY[0x1F4120758]();
}

uint64_t sub_1E0AC4620()
{
  return MEMORY[0x1F4120768]();
}

uint64_t sub_1E0AC4630()
{
  return MEMORY[0x1F411D0E0]();
}

uint64_t sub_1E0AC4640()
{
  return MEMORY[0x1F411D0E8]();
}

uint64_t sub_1E0AC4650()
{
  return MEMORY[0x1F411D0F0]();
}

uint64_t sub_1E0AC4660()
{
  return MEMORY[0x1F411D0F8]();
}

uint64_t sub_1E0AC4670()
{
  return MEMORY[0x1F411D100]();
}

uint64_t sub_1E0AC4680()
{
  return MEMORY[0x1F411D108]();
}

uint64_t sub_1E0AC4690()
{
  return MEMORY[0x1F411D110]();
}

uint64_t sub_1E0AC46A0()
{
  return MEMORY[0x1F411D118]();
}

uint64_t sub_1E0AC46B0()
{
  return MEMORY[0x1F411D120]();
}

uint64_t sub_1E0AC46C0()
{
  return MEMORY[0x1F411D128]();
}

uint64_t sub_1E0AC46D0()
{
  return MEMORY[0x1F411D130]();
}

uint64_t sub_1E0AC46E0()
{
  return MEMORY[0x1F411D138]();
}

uint64_t sub_1E0AC46F0()
{
  return MEMORY[0x1F411D140]();
}

uint64_t sub_1E0AC4700()
{
  return MEMORY[0x1F411D148]();
}

uint64_t sub_1E0AC4710()
{
  return MEMORY[0x1F411D150]();
}

uint64_t sub_1E0AC4720()
{
  return MEMORY[0x1F411ED60]();
}

uint64_t sub_1E0AC4730()
{
  return MEMORY[0x1F411ED68]();
}

uint64_t sub_1E0AC4740()
{
  return MEMORY[0x1F4121010]();
}

uint64_t sub_1E0AC4750()
{
  return MEMORY[0x1F4121018]();
}

uint64_t sub_1E0AC4760()
{
  return MEMORY[0x1F4120BF8]();
}

uint64_t sub_1E0AC4770()
{
  return MEMORY[0x1F4120C58]();
}

uint64_t sub_1E0AC4780()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E0AC4790()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E0AC47A0()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t sub_1E0AC47B0()
{
  return MEMORY[0x1F40D6878]();
}

uint64_t sub_1E0AC47C0()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t sub_1E0AC47D0()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1E0AC47E0()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1E0AC47F0()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1E0AC4800()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1E0AC4810()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t sub_1E0AC4820()
{
  return MEMORY[0x1F40D6B20]();
}

uint64_t sub_1E0AC4830()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_1E0AC4840()
{
  return MEMORY[0x1F40D6B78]();
}

uint64_t sub_1E0AC4850()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1E0AC4860()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1E0AC4870()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1E0AC4880()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E0AC4890()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E0AC48A0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E0AC48B0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E0AC48C0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E0AC48D0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1E0AC48E0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E0AC48F0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1E0AC4900()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E0AC4910()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E0AC4920()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E0AC4930()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E0AC4940()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1E0AC4950()
{
  return MEMORY[0x1F4121060]();
}

uint64_t sub_1E0AC4960()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1E0AC4970()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E0AC4980()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E0AC4990()
{
  return MEMORY[0x1F40E79A8]();
}

uint64_t sub_1E0AC49A0()
{
  return MEMORY[0x1F411D158]();
}

uint64_t sub_1E0AC49B0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1E0AC49C0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E0AC49D0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E0AC49E0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E0AC49F0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E0AC4A00()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1E0AC4A10()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1E0AC4A30()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1E0AC4A40()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1E0AC4A50()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1E0AC4A60()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1E0AC4A70()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1E0AC4A80()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1E0AC4A90()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1E0AC4AA0()
{
  return MEMORY[0x1F4184CB0]();
}

uint64_t sub_1E0AC4AB0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E0AC4AC0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E0AC4AD0()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E0AC4AE0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E0AC4AF0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E0AC4B00()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1E0AC4B10()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E0AC4B20()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1E0AC4B30()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E0AC4B40()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E0AC4B50()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E0AC4B60()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E0AC4B70()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E0AC4B80()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E0AC4B90()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x1F40E7DD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}