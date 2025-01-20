void sub_3868()
{
  Swift::String v0;
  Swift::String v1;

  type metadata accessor for SiriPrivateLearningInferencePlugin();
  sub_3C6C(&qword_40E20);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_40B88 = 91;
  unk_40B90 = 0xE100000000000000;
}

uint64_t sub_38F0()
{
  sub_2F3CC();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_36B20;
  *(void *)(v0 + 32) = type metadata accessor for ContactsInferenceDomain();
  uint64_t result = type metadata accessor for MediaInferenceDomain();
  *(void *)(v0 + 40) = result;
  qword_40BA0 = v0;
  return result;
}

uint64_t SiriPrivateLearningInferencePlugin.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningInferencePlugin.init()();
  return v0;
}

void *SiriPrivateLearningInferencePlugin.init()()
{
  v1 = (void *)v0;
  sub_35020();
  sub_35010();
  sub_34FE0();
  swift_release();
  sub_3C54(&v16, (_OWORD *)(v0 + 136));
  sub_35010();
  sub_34FF0();
  swift_release();
  sub_7998(&v16, v0 + 184);
  sub_35010();
  sub_35000();
  swift_release();
  sub_7998(&v16, v0 + 224);
  sub_35210();
  uint64_t v2 = sub_351A0();
  swift_allocObject();
  uint64_t v3 = sub_351B0();
  if (v3)
  {
    *((void *)&v17 + 1) = v2;
    v18 = &protocol witness table for InferredGroundTruthStoreCoreData;
    *(void *)&long long v16 = v3;
  }
  else
  {
    v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_3CB0((uint64_t)&v16, v0 + 16, &qword_40C88);
  sub_351F0();
  uint64_t v4 = sub_35C70();
  swift_allocObject();
  uint64_t v5 = sub_35C80();
  if (v5)
  {
    *((void *)&v17 + 1) = v4;
    v18 = &protocol witness table for PICSStoreCoreData;
    *(void *)&long long v16 = v5;
  }
  else
  {
    v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_3CB0((uint64_t)&v16, v0 + 56, &qword_40C90);
  sub_35200();
  uint64_t v6 = sub_35C90();
  swift_allocObject();
  uint64_t v7 = sub_35CA0();
  if (v7)
  {
    *((void *)&v17 + 1) = v6;
    v18 = &protocol witness table for PIMSStoreCoreData;
    *(void *)&long long v16 = v7;
  }
  else
  {
    v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_3CB0((uint64_t)&v16, v0 + 96, &qword_40C98);
  uint64_t v8 = sub_35140();
  uint64_t v9 = sub_35130();
  v1[36] = v8;
  v1[37] = &protocol witness table for FlatFileStreamBookmarkStore;
  v1[33] = v9;
  uint64_t v10 = sub_352A0();
  swift_allocObject();
  uint64_t v11 = sub_35290();
  v1[46] = v10;
  v1[47] = &protocol witness table for FeatureManager;
  v1[43] = v11;
  sub_350C0();
  sub_7998(&v16, (uint64_t)(v1 + 38));
  v12 = (char *)v1
      + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v13 = enum case for UFLCoreAnalyticsLogLevel.release(_:);
  uint64_t v14 = sub_34EE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  return v1;
}

_OWORD *sub_3C54(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_3C6C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3CB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3C6C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t SiriPrivateLearningInferencePlugin.run(context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_34F20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin();
  sub_3C6C(&qword_40CA8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_36310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v14[v13], (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v15 = &v14[(v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)v15 = a2;
  *((void *)v15 + 1) = a3;
  swift_retain();
  swift_retain();
  sub_44F8((uint64_t)v11, (uint64_t)&unk_40CB8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_3F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a6;
  v7[3] = a7;
  uint64_t v9 = sub_34F00();
  v7[4] = v9;
  v7[5] = *(void *)(v9 - 8);
  v7[6] = swift_task_alloc();
  uint64_t v10 = sub_34F10();
  v7[7] = v10;
  v7[8] = *(void *)(v10 - 8);
  v7[9] = swift_task_alloc();
  v7[10] = sub_3C6C(&qword_40E08);
  v7[11] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v7[12] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v7[13] = v12;
  void *v12 = v7;
  v12[1] = sub_40BC;
  return sub_46A4(v11, a5);
}

uint64_t sub_40BC()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_41B8, 0, 0);
}

uint64_t sub_41B8()
{
  sub_8310(v0[12], v0[11], &qword_40E08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v2 = v0 + 6;
    uint64_t v1 = v0[6];
    uint64_t v4 = v0[8];
    uint64_t v3 = v0[9];
    uint64_t v5 = v0 + 5;
    uint64_t v6 = v0[5];
    uint64_t v8 = v0 + 4;
    uint64_t v7 = v0[4];
    uint64_t v9 = v0[7];
    v15 = (void (*)(uint64_t))v0[2];
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 32))(v1, v0[11], v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v3, v1, v7);
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for PrivateLearningPluginResult.failure(_:), v9);
    v15(v3);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v9);
  }
  else
  {
    long long v2 = v0 + 9;
    uint64_t v10 = v0[9];
    uint64_t v5 = v0 + 8;
    uint64_t v8 = v0 + 7;
    uint64_t v11 = (void (*)(uint64_t))v0[2];
    (*(void (**)(uint64_t, void, void))(v0[8] + 104))(v10, enum case for PrivateLearningPluginResult.success(_:), v0[7]);
    v11(v10);
  }
  uint64_t v12 = v0[12];
  (*(void (**)(void, void))(*v5 + 8))(*v2, *v8);
  sub_8374(v12, &qword_40E08);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_43BC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_34F20() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *unint64_t v13 = v2;
  v13[1] = sub_84B8;
  return sub_3F10(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_44F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_36310();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_36300();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_8374(a1, &qword_40CA8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_362E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_46A4(uint64_t a1, uint64_t a2)
{
  v3[95] = v2;
  v3[94] = a2;
  v3[93] = a1;
  uint64_t v4 = sub_36150();
  v3[96] = v4;
  v3[97] = *(void *)(v4 - 8);
  v3[98] = swift_task_alloc();
  v3[99] = swift_task_alloc();
  v3[100] = swift_task_alloc();
  uint64_t v5 = sub_34EE0();
  v3[101] = v5;
  v3[102] = *(void *)(v5 - 8);
  v3[103] = swift_task_alloc();
  uint64_t v6 = sub_34F20();
  v3[104] = v6;
  v3[105] = *(void *)(v6 - 8);
  v3[106] = swift_task_alloc();
  uint64_t v7 = sub_34E90();
  v3[107] = v7;
  v3[108] = *(void *)(v7 - 8);
  v3[109] = swift_task_alloc();
  uint64_t v8 = sub_36110();
  v3[110] = v8;
  v3[111] = *(void *)(v8 - 8);
  v3[112] = swift_task_alloc();
  v3[113] = swift_task_alloc();
  v3[114] = swift_task_alloc();
  v3[115] = swift_task_alloc();
  return _swift_task_switch(sub_4920, 0, 0);
}

uint64_t sub_4920()
{
  uint64_t v74 = v0;
  if (qword_40C20 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 920);
  uint64_t v2 = *(void *)(v0 + 888);
  uint64_t v3 = *(void *)(v0 + 880);
  uint64_t v4 = *(void *)(v0 + 848);
  uint64_t v5 = *(void *)(v0 + 840);
  uint64_t v6 = *(void *)(v0 + 832);
  uint64_t v7 = *(void *)(v0 + 752);
  uint64_t v8 = sub_36140();
  *(void *)(v0 + 928) = sub_7900(v8, (uint64_t)qword_426C8);
  sub_36130();
  sub_360F0();
  *(void *)(v0 + 936) = sub_F734("runInferencePlugin", 18, 2, v1);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(void *)(v0 + 944) = v9;
  *(void *)(v0 + 952) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v1, v3);
  sub_34E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v6);
  if (v10 == enum case for PrivateLearningPluginRunContext.eventBased(_:))
  {
    uint64_t v11 = *(void *)(v0 + 848);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 840) + 96))(v11, *(void *)(v0 + 832));
    uint64_t v12 = sub_34F30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  }
  else if (v10 != enum case for PrivateLearningPluginRunContext.maintenance(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 840) + 8))(*(void *)(v0 + 848), *(void *)(v0 + 832));
  }
  unint64_t v13 = (long long *)(v0 + 104);
  if (qword_40BA8 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_361C0();
  *(void *)(v0 + 960) = sub_7900(v14, (uint64_t)qword_40BB0);
  uint64_t v15 = sub_361A0();
  os_log_type_t v16 = sub_36360();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v73[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 136315394;
    if (qword_40B80 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_40B88;
    unint64_t v19 = unk_40B90;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 728) = sub_2F52C(v18, v19, v73);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v20 = sub_363B0();
    *(void *)(v0 + 736) = sub_2F52C(v20, v21, v73);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "%s SiriPrivateLearningInference trigger reason: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v13 = (long long *)(v0 + 104);
  }
  else
  {
  }
  uint64_t v22 = *(void *)(v0 + 760);
  sub_7DD0(v22 + 304, v0 + 264);
  sub_357A0();
  swift_allocObject();
  *(void *)(v0 + 968) = sub_35790();
  sub_35730();
  sub_8310(v22 + 16, (uint64_t)v13, &qword_40C88);
  if (*(void *)(v0 + 128))
  {
    uint64_t v23 = *(void *)(v0 + 760);
    sub_7998(v13, v0 + 64);
    sub_8310(v23 + 56, v0 + 464, &qword_40C90);
    if (*(void *)(v0 + 488))
    {
      uint64_t v24 = *(void *)(v0 + 760);
      sub_7998((long long *)(v0 + 464), v0 + 424);
      sub_8310(v24 + 96, v0 + 544, &qword_40C98);
      if (*(void *)(v0 + 568))
      {
        uint64_t v72 = *(void *)(v0 + 824);
        uint64_t v70 = *(void *)(v0 + 816);
        uint64_t v71 = *(void *)(v0 + 808);
        uint64_t v25 = *(void *)(v0 + 760);
        sub_7998((long long *)(v0 + 544), v0 + 504);
        sub_7DD0(v0 + 64, v0 + 584);
        sub_7DD0(v0 + 424, v0 + 624);
        sub_7DD0(v25 + 344, v0 + 384);
        sub_7DD0(v22 + 304, v0 + 344);
        sub_7DD0(v0 + 504, v0 + 304);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v72, v25+ OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel, v71);
        type metadata accessor for SiriPrivateLearningInferencePluginContext();
        uint64_t v26 = swift_allocObject();
        *(void *)(v0 + 976) = v26;
        sub_7998((long long *)(v0 + 584), v26 + 16);
        sub_7998((long long *)(v0 + 624), v26 + 56);
        sub_7998((long long *)(v0 + 344), v26 + 96);
        sub_7998((long long *)(v0 + 384), v26 + 136);
        sub_7998((long long *)(v0 + 304), v26 + 176);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 32))(v26+ OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel, v72, v71);
        sub_79B0(v25 + 136, v0 + 16);
        sub_7DD0(v25 + 184, v0 + 224);
        sub_7DD0(v25 + 224, v0 + 184);
        sub_7DD0(v25 + 264, v0 + 144);
        uint64_t v27 = qword_40B98;
        swift_retain();
        if (v27 != -1) {
          swift_once();
        }
        v28 = (char *)qword_40BA0;
        type metadata accessor for SiriPrivateLearningInferenceEngine();
        v29 = (uint64_t *)swift_allocObject();
        swift_bridgeObjectRetain();
        *(void *)(v0 + 984) = sub_73AC(v26, v0 + 16, v0 + 224, v0 + 184, v0 + 144, v28, v29);
        v30 = (void *)swift_task_alloc();
        *(void *)(v0 + 992) = v30;
        void *v30 = v0;
        v30[1] = sub_57E8;
        return sub_1340C();
      }
      sub_8374(v0 + 544, &qword_40C98);
      sub_7938();
      uint64_t v32 = swift_allocError();
      *(void *)uint64_t v35 = 4;
      *(unsigned char *)(v35 + 8) = 0;
      swift_willThrow();
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 424);
    }
    else
    {
      sub_8374(v0 + 464, &qword_40C90);
      sub_7938();
      uint64_t v32 = swift_allocError();
      *(void *)uint64_t v34 = 4;
      *(unsigned char *)(v34 + 8) = 0;
      swift_willThrow();
    }
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 64);
  }
  else
  {
    sub_8374((uint64_t)v13, &qword_40C88);
    sub_7938();
    uint64_t v32 = swift_allocError();
    *(void *)uint64_t v33 = 2;
    *(unsigned char *)(v33 + 8) = 0;
    swift_willThrow();
  }
  swift_errorRetain();
  swift_errorRetain();
  v36 = sub_361A0();
  os_log_type_t v37 = sub_36370();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    v73[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315394;
    if (qword_40B80 != -1) {
      swift_once();
    }
    uint64_t v40 = qword_40B88;
    unint64_t v39 = unk_40B90;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 688) = sub_2F52C(v40, v39, v73);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    *(void *)(v0 + 680) = v32;
    swift_errorRetain();
    sub_3C6C(&qword_40E00);
    uint64_t v41 = sub_36220();
    *(void *)(v0 + 712) = sub_2F52C(v41, v42, v73);
    sub_363D0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v36, v37, "%s Failed to run SiriPrivateLearningInference plugin, error=%s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  *(void *)(v0 + 720) = v32;
  swift_errorRetain();
  sub_3C6C(&qword_40E00);
  if (swift_dynamicCast())
  {
    uint64_t v43 = *(void *)(v0 + 664);
    int v44 = *(char *)(v0 + 672);
    sub_35720();
    if (v44 < 0)
    {
      swift_errorRetain();
      uint64_t v45 = v43;
    }
    else
    {
      sub_7938();
      uint64_t v45 = swift_allocError();
      *(void *)uint64_t v46 = v43;
      *(unsigned char *)(v46 + 8) = v44;
    }
    uint64_t v57 = *(void *)(v0 + 872);
    uint64_t v58 = *(void *)(v0 + 864);
    uint64_t v59 = *(void *)(v0 + 856);
    *(void *)(v0 + 696) = v45;
    sub_36220();
    sub_34EF0();
    swift_release();
    sub_798C(v43, v44);
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    sub_3C6C(&qword_40E08);
    swift_storeEnumTagMultiPayload();
    swift_errorRelease();
    v50 = sub_36130();
    sub_36160();
    os_signpost_type_t v51 = sub_36390();
    if (sub_363C0())
    {
      uint64_t v60 = *(void *)(v0 + 792);
      uint64_t v61 = *(void *)(v0 + 776);
      uint64_t v62 = *(void *)(v0 + 768);
      swift_retain();
      sub_36190();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v61 + 88))(v60, v62) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v55 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 792), *(void *)(v0 + 768));
        v55 = "";
      }
      v63 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
      uint64_t v64 = *(void *)(v0 + 920);
      uint64_t v65 = *(void *)(v0 + 904);
LABEL_48:
      uint64_t v66 = *(void *)(v0 + 880);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 888) + 16))(v64, v65, v66);
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      os_signpost_id_t v68 = sub_36100();
      _os_signpost_emit_with_name_impl(&dword_0, v50, v51, v68, "runInferencePlugin", v55, v67, 2u);
      swift_slowDealloc();

      v63(v65, v66);
      v56 = (void *)(v0 + 920);
      goto LABEL_49;
    }
    v56 = (void *)(v0 + 904);
  }
  else
  {
    uint64_t v47 = *(void *)(v0 + 872);
    uint64_t v48 = *(void *)(v0 + 864);
    uint64_t v49 = *(void *)(v0 + 856);
    swift_errorRelease();
    sub_35720();
    *(void *)(v0 + 704) = v32;
    swift_errorRetain();
    sub_36220();
    sub_34EF0();
    swift_release();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    sub_3C6C(&qword_40E08);
    swift_storeEnumTagMultiPayload();
    v50 = sub_36130();
    sub_36160();
    os_signpost_type_t v51 = sub_36390();
    if (sub_363C0())
    {
      uint64_t v52 = *(void *)(v0 + 784);
      uint64_t v53 = *(void *)(v0 + 776);
      uint64_t v54 = *(void *)(v0 + 768);
      swift_retain();
      sub_36190();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v53 + 88))(v52, v54) == enum case for OSSignpostError.doubleEnd(_:))
      {
        v55 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 784), *(void *)(v0 + 768));
        v55 = "";
      }
      v63 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
      uint64_t v64 = *(void *)(v0 + 920);
      uint64_t v65 = *(void *)(v0 + 896);
      goto LABEL_48;
    }
    v56 = (void *)(v0 + 896);
  }

LABEL_49:
  (*(void (**)(void, void))(v0 + 944))(*v56, *(void *)(v0 + 880));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v69 = *(uint64_t (**)(void))(v0 + 8);
  return v69();
}

uint64_t sub_57E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)*v3;
  v6[125] = v2;
  swift_task_dealloc();
  if (v2)
  {
    return _swift_task_switch(sub_5DB0, 0, 0);
  }
  else
  {
    v6[126] = a2;
    v6[127] = a1;
    uint64_t v7 = (void *)swift_task_alloc();
    v6[128] = v7;
    *uint64_t v7 = v6;
    v7[1] = sub_5970;
    return sub_15454();
  }
}

uint64_t sub_5970()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_5A6C, 0, 0);
}

uint64_t sub_5A6C()
{
  uint64_t v1 = v0[127];
  uint64_t v2 = v0[126];
  uint64_t v3 = v0[122];
  uint64_t v4 = v0[109];
  uint64_t v5 = v0[108];
  uint64_t v21 = v0[107];
  uint64_t v6 = v0[93];
  sub_35740();
  swift_release();
  *(void *)uint64_t v6 = v1;
  *(void *)(v6 + 8) = v2;
  *(unsigned char *)(v6 + 16) = 0;
  sub_3C6C(&qword_40E08);
  swift_storeEnumTagMultiPayload();
  sub_7A14(v3);
  swift_release();
  swift_release();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 63));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 53));
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 8));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v21);
  uint64_t v7 = sub_36130();
  sub_36160();
  os_signpost_type_t v8 = sub_36390();
  if (sub_363C0())
  {
    uint64_t v9 = v0[100];
    uint64_t v10 = v0[97];
    uint64_t v11 = v0[96];
    swift_retain();
    sub_36190();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v9, v11) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v12 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v0[97] + 8))(v0[100], v0[96]);
      uint64_t v12 = "";
    }
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[118];
    unint64_t v13 = v0 + 115;
    uint64_t v15 = v0[114];
    uint64_t v16 = v0[110];
    (*(void (**)(void, uint64_t, uint64_t))(v0[111] + 16))(v0[115], v15, v16);
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    os_signpost_id_t v18 = sub_36100();
    _os_signpost_emit_with_name_impl(&dword_0, v7, v8, v18, "runInferencePlugin", v12, v17, 2u);
    swift_slowDealloc();

    v14(v15, v16);
  }
  else
  {
    unint64_t v13 = v0 + 114;
  }
  ((void (*)(void, void))v0[118])(*v13, v0[110]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_5DB0()
{
  uint64_t v39 = v0;
  uint64_t v1 = *(void *)(v0 + 976);
  swift_release();
  sub_7A14(v1);
  swift_release();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 504);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 424);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 1000);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_361A0();
  os_log_type_t v4 = sub_36370();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    if (qword_40B80 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_40B88;
    unint64_t v6 = unk_40B90;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 688) = sub_2F52C(v7, v6, &v38);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    *(void *)(v0 + 680) = v2;
    swift_errorRetain();
    sub_3C6C(&qword_40E00);
    uint64_t v8 = sub_36220();
    *(void *)(v0 + 712) = sub_2F52C(v8, v9, &v38);
    sub_363D0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "%s Failed to run SiriPrivateLearningInference plugin, error=%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  *(void *)(v0 + 720) = v2;
  swift_errorRetain();
  sub_3C6C(&qword_40E00);
  if (!swift_dynamicCast())
  {
    uint64_t v14 = *(void *)(v0 + 872);
    uint64_t v15 = *(void *)(v0 + 864);
    uint64_t v16 = *(void *)(v0 + 856);
    swift_errorRelease();
    sub_35720();
    *(void *)(v0 + 704) = v2;
    swift_errorRetain();
    sub_36220();
    sub_34EF0();
    swift_release();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    sub_3C6C(&qword_40E08);
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = sub_36130();
    sub_36160();
    os_signpost_type_t v18 = sub_36390();
    if (sub_363C0())
    {
      uint64_t v19 = *(void *)(v0 + 784);
      uint64_t v20 = *(void *)(v0 + 776);
      uint64_t v21 = *(void *)(v0 + 768);
      swift_retain();
      sub_36190();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v19, v21) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v22 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 784), *(void *)(v0 + 768));
        uint64_t v22 = "";
      }
      v30 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
      uint64_t v23 = (void *)(v0 + 920);
      uint64_t v31 = *(void *)(v0 + 920);
      uint64_t v32 = *(void *)(v0 + 896);
      goto LABEL_23;
    }
    uint64_t v23 = (void *)(v0 + 896);
LABEL_18:

    goto LABEL_24;
  }
  uint64_t v10 = *(void *)(v0 + 664);
  int v11 = *(char *)(v0 + 672);
  sub_35720();
  if (v11 < 0)
  {
    swift_errorRetain();
    uint64_t v12 = v10;
  }
  else
  {
    sub_7938();
    uint64_t v12 = swift_allocError();
    *(void *)uint64_t v13 = v10;
    *(unsigned char *)(v13 + 8) = v11;
  }
  uint64_t v24 = *(void *)(v0 + 872);
  uint64_t v25 = *(void *)(v0 + 864);
  uint64_t v26 = *(void *)(v0 + 856);
  *(void *)(v0 + 696) = v12;
  sub_36220();
  sub_34EF0();
  swift_release();
  sub_798C(v10, v11);
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
  sub_3C6C(&qword_40E08);
  swift_storeEnumTagMultiPayload();
  swift_errorRelease();
  uint64_t v17 = sub_36130();
  sub_36160();
  os_signpost_type_t v18 = sub_36390();
  if ((sub_363C0() & 1) == 0)
  {
    uint64_t v23 = (void *)(v0 + 904);
    goto LABEL_18;
  }
  uint64_t v27 = *(void *)(v0 + 792);
  uint64_t v28 = *(void *)(v0 + 776);
  uint64_t v29 = *(void *)(v0 + 768);
  swift_retain();
  sub_36190();
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v28 + 88))(v27, v29) == enum case for OSSignpostError.doubleEnd(_:))
  {
    uint64_t v22 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 776) + 8))(*(void *)(v0 + 792), *(void *)(v0 + 768));
    uint64_t v22 = "";
  }
  v30 = *(void (**)(uint64_t, uint64_t))(v0 + 944);
  uint64_t v23 = (void *)(v0 + 920);
  uint64_t v31 = *(void *)(v0 + 920);
  uint64_t v32 = *(void *)(v0 + 904);
LABEL_23:
  uint64_t v33 = *(void *)(v0 + 880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 888) + 16))(v31, v32, v33);
  uint64_t v34 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v34 = 0;
  os_signpost_id_t v35 = sub_36100();
  _os_signpost_emit_with_name_impl(&dword_0, v17, v18, v35, "runInferencePlugin", v22, v34, 2u);
  swift_slowDealloc();

  v30(v32, v33);
LABEL_24:
  (*(void (**)(void, void))(v0 + 944))(*v23, *(void *)(v0 + 880));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t SiriPrivateLearningInferencePlugin.deinit()
{
  sub_8374(v0 + 16, &qword_40C88);
  sub_8374(v0 + 56, &qword_40C90);
  sub_8374(v0 + 96, &qword_40C98);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 136);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 184);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 224);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 264);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 304);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 344);
  uint64_t v1 = v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v2 = sub_34EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t SiriPrivateLearningInferencePlugin.__deallocating_deinit()
{
  sub_8374(v0 + 16, &qword_40C88);
  sub_8374(v0 + 56, &qword_40C90);
  sub_8374(v0 + 96, &qword_40C98);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 136);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 184);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 224);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 264);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 304);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 344);
  uint64_t v1 = v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin34SiriPrivateLearningInferencePlugin_coreAnalyticsLogLevel;
  uint64_t v2 = sub_34EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_6708()
{
  type metadata accessor for SiriPrivateLearningInferencePlugin();
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningInferencePlugin.init()();
  return v0;
}

uint64_t sub_6744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_34F20();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_3C6C(&qword_40CA8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_36310();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v15[v14], (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  uint64_t v16 = &v15[(v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)uint64_t v16 = a2;
  *((void *)v16 + 1) = a3;
  swift_retain();
  swift_retain();
  sub_44F8((uint64_t)v12, (uint64_t)&unk_40E28, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_6940()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_40BB0);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_40BB0);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_6A08(uint64_t a1)
{
  uint64_t v2 = sub_3C6C(&qword_40E30);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3C6C(&qword_40E38);
  uint64_t v6 = sub_36520();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_8310(v12, (uint64_t)v5, &qword_40E30);
    unint64_t result = sub_2FC00((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_34E90();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
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

unint64_t sub_6BFC(uint64_t a1)
{
  uint64_t v2 = sub_3C6C(&qword_40DE8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_3C6C(&qword_40DF0);
  uint64_t v6 = sub_36520();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v25 = &v5[*(int *)(v2 + 48)];
  uint64_t v9 = v6 + 64;
  uint64_t v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v11 = *(void *)(v3 + 72);
  v23[1] = a1;
  uint64_t v24 = v11;
  swift_retain();
  while (1)
  {
    sub_8310(v10, (uint64_t)v5, &qword_40DE8);
    unint64_t result = sub_2FC00((uint64_t)v5);
    if (v13) {
      break;
    }
    unint64_t v14 = result;
    *(void *)(v9 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v15 = v7[6];
    uint64_t v16 = sub_34E90();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(void (**)(unint64_t, char *, uint64_t))(v17 + 32);
    unint64_t v19 = *(void *)(v17 + 72) * v14;
    v18(v15 + v19, v5, v16);
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v18)(v7[7] + v19, v25, v16);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
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

void *sub_6E14(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  unint64_t result = &_swiftEmptyArrayStorage;
  unint64_t v11 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)(a3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v10 = *(void *)(a3 + 8 * i + 32);
      a1(&v9, &v10);
      if (v3)
      {
        swift_bridgeObjectRelease();
        return (void *)swift_bridgeObjectRelease();
      }
      if (v9)
      {
        sub_36260();
        if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v11 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_36290();
        sub_362D0();
        sub_36280();
      }
    }
    swift_bridgeObjectRelease();
    return (void *)v11;
  }
  return result;
}

unint64_t variable initialization expression of MessagesContactGroundTruthGenerator.generatedGroundTruth()
{
  return sub_6A08((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_6F4C()
{
  return type metadata accessor for SiriPrivateLearningInferencePlugin();
}

uint64_t type metadata accessor for SiriPrivateLearningInferencePlugin()
{
  uint64_t result = qword_40CE8;
  if (!qword_40CE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6FA0()
{
  uint64_t result = sub_34EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

Swift::Int sub_705C()
{
  Swift::UInt v1 = *v0;
  sub_365E0();
  sub_365F0(v1);
  return sub_36610();
}

void sub_70A4()
{
  sub_365F0(*v0);
}

Swift::Int sub_70D0()
{
  Swift::UInt v1 = *v0;
  sub_365E0();
  sub_365F0(v1);
  return sub_36610();
}

BOOL sub_7114(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_7128@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_7138(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_7144@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_7154(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_36100();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_71D8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_72B4;
  return v6(a1);
}

uint64_t sub_72B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  Swift::UInt v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *sub_73AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, uint64_t *a7)
{
  uint64_t v28 = *a7;
  sub_34EE0();
  __chkstk_darwin();
  uint64_t v33 = type metadata accessor for SiriPrivateLearningInferencePluginContext();
  uint64_t v34 = sub_8470(&qword_40E18, (void (*)(uint64_t))type metadata accessor for SiriPrivateLearningInferencePluginContext);
  v32[0] = a1;
  sub_7DD0((uint64_t)v32, (uint64_t)(a7 + 2));
  sub_79B0(a2, (uint64_t)(a7 + 7));
  sub_7DD0(a3, (uint64_t)(a7 + 13));
  sub_7DD0(a4, (uint64_t)(a7 + 18));
  uint64_t v29 = a5;
  sub_7DD0(a5, (uint64_t)(a7 + 23));
  sub_35460();
  swift_allocObject();
  a7[29] = sub_35450();
  sub_7E34(v32, v33);
  sub_35350();
  sub_35880();
  swift_allocObject();
  a7[30] = sub_35860();
  if (qword_40C38 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_361C0();
  sub_7900(v14, (uint64_t)qword_414B0);
  uint64_t v15 = sub_361A0();
  os_log_type_t v16 = sub_36380();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v26 = a4;
    uint64_t v27 = a3;
    uint64_t v17 = a2;
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    if (qword_40C30 != -1) {
      swift_once();
    }
    uint64_t v19 = qword_414A0;
    unint64_t v20 = qword_414A8;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2F52C(v19, v20, &v31);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "%s Initializing inference domains:", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a2 = v17;
    a4 = v26;
    a3 = v27;
  }
  else
  {
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    a6 = sub_2C2B4(0, *((void *)a6 + 2) + 1, 1, a6);
  }
  unint64_t v22 = *((void *)a6 + 2);
  unint64_t v21 = *((void *)a6 + 3);
  if (v22 >= v21 >> 1) {
    a6 = sub_2C2B4((char *)(v21 > 1), v22 + 1, 1, a6);
  }
  uint64_t v23 = type metadata accessor for CommonInferenceDomain();
  *((void *)a6 + 2) = v22 + 1;
  *(void *)&a6[8 * v22 + 32] = v23;
  __chkstk_darwin();
  *(&v26 - 2) = (uint64_t)v32;
  *(&v26 - 1) = v28;
  uint64_t v24 = sub_6E14((void (*)(uint64_t *__return_ptr, uint64_t *))sub_7E78, (uint64_t)(&v26 - 4), (uint64_t)a6);
  swift_bridgeObjectRelease();
  a7[28] = (uint64_t)v24;
  sub_13048();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v29);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a4);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a3);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a2);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v32);
  return a7;
}

unint64_t sub_7800(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_3C6C(&qword_40DE0);
  uint64_t v3 = (void *)sub_36520();
  Swift::UInt v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_2FB94(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    os_signpost_id_t v13 = v8 + 2;
    Swift::UInt v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2FB94(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_7900(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_7938()
{
  unint64_t result = qword_40DF8;
  if (!qword_40DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_40DF8);
  }
  return result;
}

uint64_t sub_798C(uint64_t a1, char a2)
{
  if (a2 < 0) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_7998(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_79B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_7A14(uint64_t a1)
{
  uint64_t v2 = sub_359C0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  Swift::UInt v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  sub_7DD0(a1 + 176, (uint64_t)v11);
  sub_3C6C(&qword_40E10);
  sub_35500();
  if (swift_dynamicCast())
  {
    sub_359B0();
    sub_359A0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_release();
  }
  else
  {
    if (qword_40BA8 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_361C0();
    sub_7900(v6, (uint64_t)qword_40BB0);
    char v7 = sub_361A0();
    os_log_type_t v8 = sub_36370();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "PIMS Store in context is not a CoreData store. Skipping store policies.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_7DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_7E34(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_7E78(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_12BCC(a1, *(void *)(v2 + 16), a2);
}

uint64_t *sub_7E94(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_7EFC()
{
  uint64_t v1 = sub_34F20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_7FF0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_34F20() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  os_signpost_id_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *os_signpost_id_t v13 = v2;
  v13[1] = sub_812C;
  return sub_3F10(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_812C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_8220()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_8258(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_812C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_40E40 + dword_40E40);
  return v6(a1, v4);
}

uint64_t sub_8310(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_3C6C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_8374(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3C6C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for KVItemType()
{
  if (!qword_40E50)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_40E50);
    }
  }
}

uint64_t sub_8428()
{
  return sub_8470(&qword_40E58, (void (*)(uint64_t))type metadata accessor for KVItemType);
}

uint64_t sub_8470(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_84BC()
{
  type metadata accessor for PhoneCallContactGroundTruthGenerator();
  sub_3C6C(&qword_40FB8);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_40E60 = 91;
  *(void *)algn_40E68 = 0xE100000000000000;
}

uint64_t sub_8540(uint64_t a1)
{
  uint64_t v3 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_34E90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  v100 = (uint64_t *)((char *)&v88 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (uint64_t *)((char *)&v88 - v14);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v88 - v16;
  sub_362A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1) {
    return sub_8374((uint64_t)v5, &qword_40F80);
  }
  uint64_t v92 = v1;
  v89 = v10;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v5, v6);
  if (qword_40BD0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_361C0();
  uint64_t v20 = sub_7900(v19, (uint64_t)qword_40E70);
  v94 = *(void (**)(uint64_t *, char *, uint64_t))(v7 + 16);
  uint64_t v95 = v7 + 16;
  v94(v15, v17, v6);
  uint64_t v98 = v20;
  unint64_t v21 = sub_361A0();
  LOBYTE(v22) = sub_36360();
  BOOL v23 = os_log_type_enabled(v21, (os_log_type_t)v22);
  uint64_t v99 = a1;
  uint64_t v93 = v7;
  v96 = v17;
  if (!v23)
  {
    v90 = *(void (**)(uint64_t *, uint64_t))(v7 + 8);
    v90(v15, v6);

    goto LABEL_9;
  }
  uint64_t v24 = swift_slowAlloc();
  v102[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v24 = 136315394;
  if (qword_40BC8 != -1) {
    goto LABEL_43;
  }
  while (1)
  {
    uint64_t v25 = qword_40E60;
    unint64_t v26 = *(void *)algn_40E68;
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_2F52C(v25, v26, v102);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v27 = sub_34E70();
    uint64_t v101 = sub_2F52C(v27, v28, v102);
    sub_363D0();
    swift_bridgeObjectRelease();
    v90 = *(void (**)(uint64_t *, uint64_t))(v93 + 8);
    v90(v15, v6);
    _os_log_impl(&dword_0, v21, (os_log_type_t)v22, "%s Reviewing session with id=%s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a1 = v99;
LABEL_9:
    uint64_t v29 = sub_361A0();
    os_log_type_t v30 = sub_36360();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      v102[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      if (qword_40BC8 != -1) {
        swift_once();
      }
      uint64_t v32 = qword_40E60;
      unint64_t v33 = *(void *)algn_40E68;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_2F52C(v32, v33, v102);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v29, v30, "%s Running classifiers on session features", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_3C6C(&qword_40F88);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_36CF0;
    uint64_t v35 = sub_35600();
    swift_allocObject();
    uint64_t v36 = sub_355F0();
    *(void *)(inited + 56) = v35;
    *(void *)(inited + 64) = &protocol witness table for PhoneCallClassifier;
    *(void *)(inited + 32) = v36;
    sub_35AA0();
    sub_3C6C(&qword_40F90);
    uint64_t v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = xmmword_36D00;
    *(void *)(v37 + 32) = sub_35250();
    *(void *)(v37 + 40) = v38;
    sub_32300(v37);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t v39 = sub_35D40();
    swift_allocObject();
    uint64_t v40 = sub_35D30();
    uint64_t v103 = v39;
    v104 = &protocol witness table for ContactEntityUtteranceComparator;
    v102[0] = v40;
    v102[0] = sub_35A90();
    sub_35A80();
    swift_release();
    uint64_t v41 = sub_358A0();
    swift_allocObject();
    uint64_t v42 = sub_35890();
    *(void *)(inited + 136) = v41;
    *(void *)(inited + 144) = &protocol witness table for EntityPromptClassifier;
    *(void *)(inited + 112) = v42;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_9CD0(inited);
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_3C6C(&qword_40F98);
    swift_arrayDestroy();
    int v44 = sub_361A0();
    os_log_type_t v45 = sub_36360();
    BOOL v46 = os_log_type_enabled(v44, v45);
    v97 = v43;
    if (v46)
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      v102[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v47 = 136315138;
      if (qword_40BC8 != -1) {
        swift_once();
      }
      uint64_t v48 = qword_40E60;
      unint64_t v49 = *(void *)algn_40E68;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_2F52C(v48, v49, v102);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v44, v45, "%s Classification Results:", v47, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v99;
      uint64_t v43 = v97;
    }
    else
    {
    }
    sub_122A4(8224, 0xE200000000000000, (uint64_t)v43);
    v50 = sub_361A0();
    os_log_type_t v51 = sub_36360();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      v102[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v52 = 136315138;
      if (qword_40BC8 != -1) {
        swift_once();
      }
      uint64_t v53 = qword_40E60;
      unint64_t v54 = *(void *)algn_40E68;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_2F52C(v53, v54, v102);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v50, v51, "%s Running ground truth generators with classification results.", v52, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a1 = v99;
      uint64_t v43 = v97;
    }
    else
    {
    }
    sub_35FE0();
    swift_allocObject();
    v102[0] = sub_35FD0();
    sub_9ECC(&qword_40FA0, 255, (void (*)(uint64_t))&type metadata accessor for PhoneCallInAppFollowupGroundTruthGenerator);
    uint64_t v55 = sub_35220();
    swift_release();
    v56 = sub_2D594(v55);
    swift_bridgeObjectRelease();
    sub_35B70();
    swift_allocObject();
    uint64_t v101 = sub_35B60();
    sub_9ECC(&qword_40FA8, 255, (void (*)(uint64_t))&type metadata accessor for SuccessfulPhoneCallDefinition);
    sub_35990();
    swift_release();
    sub_7E34(v102, v103);
    sub_35220();
    swift_getAssociatedTypeWitness();
    sub_3C6C(&qword_40FB0);
    uint64_t v57 = sub_364C0();
    swift_bridgeObjectRelease();
    uint64_t v101 = (uint64_t)v56;
    sub_2D804(v57);
    uint64_t v24 = v101;
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v102);
    sub_35DB0();
    swift_allocObject();
    sub_35DA0();
    uint64_t v58 = sub_35D90();
    swift_release();
    uint64_t v59 = sub_361A0();
    os_log_type_t v60 = sub_36360();
    BOOL v61 = os_log_type_enabled(v59, v60);
    uint64_t v91 = v24;
    if (v61)
    {
      uint64_t v62 = v6;
      v63 = (uint8_t *)swift_slowAlloc();
      v102[0] = swift_slowAlloc();
      *(_DWORD *)v63 = 136315138;
      if (qword_40BC8 != -1) {
        swift_once();
      }
      uint64_t v64 = qword_40E60;
      unint64_t v65 = *(void *)algn_40E68;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_2F52C(v64, v65, v102);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v59, v60, "%s Generated Phone Call Ground Truth:", v63, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v6 = v62;
      a1 = v99;
      uint64_t v43 = v97;
      uint64_t v24 = v91;
    }
    else
    {
    }
    sub_12298(8224, 0xE200000000000000, v24);
    uint64_t v66 = sub_361A0();
    os_log_type_t v67 = sub_36360();
    uint64_t v68 = v6;
    if (os_log_type_enabled(v66, v67))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      v102[0] = swift_slowAlloc();
      *(_DWORD *)v69 = 136315138;
      if (qword_40BC8 != -1) {
        swift_once();
      }
      uint64_t v70 = qword_40E60;
      unint64_t v71 = *(void *)algn_40E68;
      swift_bridgeObjectRetain();
      uint64_t v101 = sub_2F52C(v70, v71, v102);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v66, v67, "%s Generated Contact Prompt Ground Truth:", v69, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v24 = v91;
      uint64_t v72 = v92;
      a1 = v99;
      uint64_t v43 = v97;
    }
    else
    {

      uint64_t v72 = v92;
    }
    sub_1264C(8224, 0xE200000000000000, v58);
    v73 = sub_2D5DC(v58);
    swift_bridgeObjectRelease();
    v102[0] = v24;
    sub_2D804((uint64_t)v73);
    unint64_t v21 = v102[0];
    sub_9F14(a1, (uint64_t)v43);
    swift_bridgeObjectRelease();
    uint64_t v74 = v72;
    uint64_t v75 = (uint64_t)v100;
    uint64_t v6 = v68;
    v94(v100, v96, v68);
    uint64_t v15 = (uint64_t *)(v74 + 64);
    swift_beginAccess();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v101 = *(void *)(v74 + 64);
    uint64_t v77 = v101;
    *(void *)(v74 + 64) = 0x8000000000000000;
    unint64_t v22 = sub_2FC00(v75);
    uint64_t v79 = *(void *)(v77 + 16);
    BOOL v80 = (v78 & 1) == 0;
    uint64_t v81 = v79 + v80;
    if (!__OFADD__(v79, v80)) {
      break;
    }
    __break(1u);
LABEL_43:
    swift_once();
  }
  char v82 = v78;
  if (*(void *)(v77 + 24) >= v81)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_30DA4();
      uint64_t v77 = v101;
    }
  }
  else
  {
    sub_2FEFC(v81, isUniquelyReferenced_nonNull_native);
    uint64_t v77 = v101;
    unint64_t v83 = sub_2FC00((uint64_t)v100);
    if ((v82 & 1) != (v84 & 1))
    {
      uint64_t result = sub_36590();
      __break(1u);
      return result;
    }
    unint64_t v22 = v83;
  }
  uint64_t *v15 = v77;
  swift_bridgeObjectRelease();
  v85 = (void *)*v15;
  swift_bridgeObjectRetain();
  if ((v82 & 1) == 0)
  {
    uint64_t v86 = (uint64_t)v89;
    v94((uint64_t *)v89, (char *)v100, v6);
    sub_30C10(v22, v86, (uint64_t)_swiftEmptyArrayStorage, v85);
  }
  swift_bridgeObjectRelease();
  sub_2D804((uint64_t)v21);
  v87 = (uint64_t (*)(char *, uint64_t))v90;
  v90(v100, v6);
  swift_endAccess();
  return v87(v96, v6);
}

uint64_t sub_9538()
{
  uint64_t v62 = sub_3C6C(&qword_40F78);
  uint64_t v1 = __chkstk_darwin(v62);
  BOOL v61 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  os_log_type_t v60 = (char *)&v47 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v59 = (uint64_t)&v47 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v58 = (char *)&v47 - v8;
  __chkstk_darwin(v7);
  uint64_t v57 = (char *)&v47 - v9;
  uint64_t v56 = sub_35660();
  uint64_t v10 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v0 + 64);
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = _swiftEmptyArrayStorage;
  if (!v14) {
    return (uint64_t)v15;
  }
  uint64_t v66 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_316A4(0, v14, 0);
  uint64_t result = sub_32274(v13);
  uint64_t v18 = result;
  uint64_t v19 = 0;
  uint64_t v20 = v13 + 64;
  uint64_t v52 = v10 + 32;
  char v21 = *(unsigned char *)(v13 + 32);
  uint64_t v48 = v13 + 80;
  unint64_t v54 = v12;
  uint64_t v55 = v10;
  uint64_t v53 = v13;
  int64_t v49 = v14;
  uint64_t v50 = v17;
  uint64_t v51 = v13 + 64;
  while ((v18 & 0x8000000000000000) == 0 && v18 < 1 << v21)
  {
    unint64_t v23 = (unint64_t)v18 >> 6;
    if ((*(void *)(v20 + 8 * ((unint64_t)v18 >> 6)) & (1 << v18)) == 0) {
      goto LABEL_26;
    }
    if (*(_DWORD *)(v13 + 36) != v17) {
      goto LABEL_27;
    }
    uint64_t v63 = v19;
    uint64_t v64 = 1 << v18;
    uint64_t v24 = v62;
    uint64_t v25 = *(int *)(v62 + 48);
    uint64_t v26 = *(void *)(v13 + 48);
    uint64_t v27 = sub_34E90();
    uint64_t v65 = *(void *)(v27 - 8);
    unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
    uint64_t v29 = (uint64_t)v57;
    v28(v57, v26 + *(void *)(v65 + 72) * v18, v27);
    uint64_t v30 = *(void *)(*(void *)(v13 + 56) + 8 * v18);
    *(void *)(v29 + v25) = v30;
    uint64_t v31 = v58;
    v28(v58, v29, v27);
    *(void *)&v31[*(int *)(v24 + 48)] = v30;
    uint64_t v32 = (uint64_t)v31;
    uint64_t v33 = v59;
    sub_9C68(v32, v59);
    swift_bridgeObjectRetain_n();
    sub_8374(v29, &qword_40F78);
    uint64_t v34 = *(int *)(v24 + 48);
    uint64_t v35 = v60;
    v28(v60, v33, v27);
    uint64_t v36 = *(void *)(v33 + v34);
    *(void *)&v35[v34] = v36;
    uint64_t v37 = *(int *)(v24 + 48);
    uint64_t v38 = v61;
    v28(v61, v33, v27);
    uint64_t v39 = v54;
    *(void *)&v38[v37] = v36;
    swift_bridgeObjectRetain();
    sub_35650();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v27);
    sub_8374(v33, &qword_40F78);
    uint64_t v15 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_316A4(0, v15[2] + 1, 1);
      uint64_t v15 = v66;
    }
    unint64_t v41 = v15[2];
    unint64_t v40 = v15[3];
    if (v41 >= v40 >> 1)
    {
      sub_316A4(v40 > 1, v41 + 1, 1);
      uint64_t v15 = v66;
    }
    v15[2] = v41 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v55 + 32))((unint64_t)v15+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v41, v39, v56);
    uint64_t v66 = v15;
    uint64_t v13 = v53;
    char v21 = *(unsigned char *)(v53 + 32);
    unint64_t v22 = 1 << v21;
    if (v18 >= 1 << v21) {
      goto LABEL_28;
    }
    uint64_t v20 = v51;
    uint64_t v42 = *(void *)(v51 + 8 * v23);
    if ((v42 & v64) == 0) {
      goto LABEL_29;
    }
    LODWORD(v17) = v50;
    if (*(_DWORD *)(v53 + 36) != v50) {
      goto LABEL_30;
    }
    unint64_t v43 = v42 & (-2 << (v18 & 0x3F));
    if (v43)
    {
      unint64_t v22 = __clz(__rbit64(v43)) | v18 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v44 = v23 + 1;
      unint64_t v45 = (v22 + 63) >> 6;
      if (v23 + 1 < v45)
      {
        unint64_t v46 = *(void *)(v51 + 8 * v44);
        if (v46)
        {
LABEL_22:
          unint64_t v22 = __clz(__rbit64(v46)) + (v44 << 6);
        }
        else
        {
          while (v45 - 2 != v23)
          {
            unint64_t v46 = *(void *)(v48 + 8 * v23++);
            if (v46)
            {
              unint64_t v44 = v23 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v19 = v63 + 1;
    uint64_t v18 = v22;
    if (v63 + 1 == v49)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v15;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_9A9C()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PhoneCallContactGroundTruthGenerator()
{
  return self;
}

uint64_t sub_9B10()
{
  return sub_9538();
}

uint64_t sub_9B34(uint64_t a1)
{
  return sub_8540(a1);
}

uint64_t sub_9B58(uint64_t a1, uint64_t a2)
{
  return sub_9ECC(&qword_40F70, a2, (void (*)(uint64_t))type metadata accessor for PhoneCallContactGroundTruthGenerator);
}

uint64_t sub_9BA0()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_40E70);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_40E70);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_9C68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C6C(&qword_40F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_9CD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    sub_7E34(v2, v2[3]);
    uint64_t v4 = sub_35520();
    uint64_t v5 = *(void *)(v4 + 16);
    int64_t v6 = *((void *)v3 + 2);
    int64_t v7 = v6 + v5;
    if (__OFADD__(v6, v5)) {
      break;
    }
    uint64_t v8 = v4;
    int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v7 <= *((void *)v3 + 3) >> 1)
    {
      if (*(void *)(v8 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v6 <= v7) {
        int64_t v10 = v6 + v5;
      }
      else {
        int64_t v10 = v6;
      }
      uint64_t v3 = sub_2C6D8(isUniquelyReferenced_nonNull_native, v10, 1, v3);
      if (*(void *)(v8 + 16))
      {
LABEL_14:
        uint64_t v11 = *((void *)v3 + 2);
        if ((*((void *)v3 + 3) >> 1) - v11 < v5) {
          goto LABEL_28;
        }
        unint64_t v12 = (unint64_t)&v3[40 * v11 + 32];
        if (v8 + 32 < v12 + 40 * v5 && v12 < v8 + 32 + 40 * v5) {
          goto LABEL_30;
        }
        sub_3C6C(&qword_40FC0);
        swift_arrayInitWithCopy();
        if (v5)
        {
          uint64_t v14 = *((void *)v3 + 2);
          BOOL v15 = __OFADD__(v14, v5);
          uint64_t v16 = v14 + v5;
          if (v15) {
            goto LABEL_29;
          }
          *((void *)v3 + 2) = v16;
        }
        goto LABEL_4;
      }
    }
    if (v5) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRelease();
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_9ECC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_9F14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v27[2] = a2;
  uint64_t v5 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v5 - 8);
  int64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_34E90();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  __chkstk_darwin(v8);
  int64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BD0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_361C0();
  sub_7900(v11, (uint64_t)qword_40E70);
  unint64_t v12 = sub_361A0();
  os_log_type_t v13 = sub_36360();
  BOOL v14 = os_log_type_enabled(v12, v13);
  BOOL v15 = &SiriPrivateLearningInferencePlugin;
  uint64_t v28 = v2;
  if (v14)
  {
    v27[1] = a1;
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    if (qword_40BC8 != -1) {
      swift_once();
    }
    uint64_t v17 = qword_40E60;
    unint64_t v18 = *(void *)algn_40E68;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2F52C(v17, v18, v32);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v12, v13, "%s Logging inference results to SELF", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v3 = v28;
    BOOL v15 = &SiriPrivateLearningInferencePlugin;
  }
  else
  {
  }
  sub_34E80();
  uint64_t v19 = sub_361A0();
  os_log_type_t v20 = sub_36360();
  if (os_log_type_enabled(v19, v20))
  {
    char v21 = (uint8_t *)swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)char v21 = 136315138;
    if (v15[41].base_props != (__objc2_prop_list *)-1) {
      swift_once();
    }
    uint64_t v22 = qword_40E60;
    unint64_t v23 = *(void *)algn_40E68;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2F52C(v22, v23, v32);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v19, v20, "%s Extracting phone call metadata for SELF logging", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v3 = v28;
  }
  else
  {
  }
  sub_362B0();
  sub_35750();
  sub_8374((uint64_t)v7, &qword_40F80);
  if (!*(void *)(v3 + 56)) {
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v10, v30);
  }
  sub_7DD0(v3 + 16, (uint64_t)v32);
  uint64_t v24 = sub_35EE0();
  swift_allocObject();
  swift_retain();
  uint64_t v25 = sub_35ED0();
  void v32[3] = v24;
  v32[4] = (uint64_t)&protocol witness table for PhoneCallSuggestionOutcomeExtractor;
  v32[0] = v25;
  swift_retain();
  sub_36080();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
  return _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v32);
}

uint64_t initializeBufferWithCopyOfBuffer for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1 + 16);
}

uint64_t initializeWithCopy for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  int64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for AdaptiveMediaSuggestionGeneratorWrapper(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_A538(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *sub_A538(uint64_t *result, uint64_t *a2)
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
        *uint64_t v3 = v12;
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
          *uint64_t v3 = *a2;
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

__n128 initializeWithTake for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AdaptiveMediaSuggestionGeneratorWrapper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AdaptiveMediaSuggestionGeneratorWrapper()
{
  return &type metadata for AdaptiveMediaSuggestionGeneratorWrapper;
}

void *sub_A878(uint64_t a1)
{
  uint64_t v14 = sub_34E90();
  uint64_t v3 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  long long v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v13 = v1;
    BOOL v15 = _swiftEmptyArrayStorage;
    sub_315CC(0, v6, 0);
    uint64_t v7 = v15;
    uint64_t v8 = (void *)(a1 + 32);
    do
    {
      sub_7E34(v8, v8[3]);
      sub_354D0();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      BOOL v15 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_315CC(0, v7[2] + 1, 1);
        uint64_t v7 = v15;
      }
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_315CC(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v15;
      }
      v7[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v11, v5, v14);
      BOOL v15 = v7;
      v8 += 5;
      --v6;
    }
    while (v6);
  }
  return v7;
}

void sub_AA48()
{
  sub_3C6C(&qword_41010);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_40FC8 = 91;
  unk_40FD0 = 0xE100000000000000;
}

uint64_t sub_AAD0(uint64_t a1)
{
  uint64_t v70 = a1;
  uint64_t v1 = sub_34E90();
  uint64_t v57 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  int64_t v6 = (char *)&v45 - v5;
  uint64_t v7 = sub_356D0();
  uint64_t v49 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v56 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_35620();
  uint64_t v54 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v47 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3C6C(&qword_40FF0);
  uint64_t v10 = sub_35550();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v13 = (char *)(swift_allocObject() + v12);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for MediaSuggestionTag.domainMusic(_:), v10);
  uint64_t v14 = v70;
  v73 = _swiftEmptyArrayStorage;
  sub_B278(v13, v71, v70, &v72);
  sub_2D824(v72);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  BOOL v15 = v73;
  uint64_t v16 = sub_A878(v14);
  uint64_t v17 = sub_27CA4((uint64_t)v16);
  swift_bridgeObjectRelease();
  uint64_t v53 = v15[2];
  if (v53)
  {
    uint64_t v52 = (char *)v15 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    uint64_t v51 = v54 + 16;
    uint64_t v62 = v49 + 16;
    uint64_t v70 = v17 + 56;
    uint64_t v71 = v17;
    uint64_t v69 = v57 + 16;
    unint64_t v18 = (void (**)(char *, uint64_t))(v57 + 8);
    BOOL v61 = (void (**)(char *, uint64_t))(v49 + 8);
    uint64_t v50 = (void (**)(char *, uint64_t))(v54 + 8);
    swift_bridgeObjectRetain();
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    char v21 = v56;
    uint64_t v22 = v48;
    unint64_t v23 = v47;
    uint64_t v55 = v7;
    unint64_t v46 = v15;
    while (v20 < v15[2])
    {
      uint64_t v68 = v19;
      uint64_t v24 = *(void *)(v54 + 72);
      unint64_t v67 = v20;
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v23, &v52[v24 * v20], v22);
      uint64_t v25 = sub_35610();
      uint64_t v64 = *(void *)(v25 + 16);
      if (v64)
      {
        uint64_t v26 = 0;
        unint64_t v27 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
        uint64_t v63 = v25;
        unint64_t v28 = v25 + v27;
        uint64_t v29 = *(void *)(v49 + 72);
        uint64_t v30 = *(void (**)(void, void, void))(v49 + 16);
        uint64_t v59 = v29;
        unint64_t v60 = v28;
        uint64_t v58 = v30;
        while (1)
        {
          v30(v21, v28 + v29 * v26, v7);
          sub_356C0();
          uint64_t v31 = v71;
          uint64_t v32 = *(void *)(v71 + 16);
          uint64_t v66 = (unint64_t)v18 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          if (!v32) {
            break;
          }
          sub_C260(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
          uint64_t v33 = sub_361D0();
          uint64_t v34 = -1 << *(unsigned char *)(v31 + 32);
          unint64_t v35 = v33 & ~v34;
          if (((*(void *)(v70 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
            break;
          }
          uint64_t v36 = v6;
          uint64_t v65 = v26 + 1;
          uint64_t v37 = ~v34;
          uint64_t v38 = *(void *)(v57 + 72);
          uint64_t v39 = *(void (**)(char *, unint64_t, uint64_t))(v57 + 16);
          while (1)
          {
            v39(v4, *(void *)(v71 + 48) + v38 * v35, v1);
            sub_C260(&qword_41000, (void (*)(uint64_t))&type metadata accessor for UUID);
            char v40 = sub_361F0();
            unint64_t v41 = *v18;
            (*v18)(v4, v1);
            if (v40) {
              break;
            }
            unint64_t v35 = (v35 + 1) & v37;
            if (((*(void *)(v70 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
            {
              int64_t v6 = v36;
              uint64_t v7 = v55;
              char v21 = v56;
              goto LABEL_14;
            }
          }
          int64_t v6 = v36;
          v41(v36, v1);
          uint64_t v7 = v55;
          char v21 = v56;
          (*v61)(v56, v55);
          uint64_t v26 = v65;
          uint64_t v29 = v59;
          unint64_t v28 = v60;
          uint64_t v30 = v58;
          if (v65 == v64)
          {
            swift_bridgeObjectRelease();
            int v42 = 0;
            uint64_t v22 = v48;
            unint64_t v23 = v47;
            BOOL v15 = v46;
            goto LABEL_16;
          }
        }
        unint64_t v41 = *v18;
LABEL_14:
        BOOL v15 = v46;
        v41(v6, v1);
        (*v61)(v21, v7);
        swift_bridgeObjectRelease();
        int v42 = 1;
        uint64_t v22 = v48;
        unint64_t v23 = v47;
      }
      else
      {
        swift_bridgeObjectRelease();
        int v42 = 0;
      }
LABEL_16:
      (*v50)(v23, v22);
      if (__CFADD__(v68, v42)) {
        goto LABEL_25;
      }
      uint64_t v19 = (v68 + v42);
      unint64_t v20 = v67 + 1;
      if (v67 + 1 == v53)
      {
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
  }
  else
  {
    LODWORD(v19) = 0;
LABEL_21:
    swift_bridgeObjectRelease();
    unint64_t v43 = v15[2];
    swift_bridgeObjectRelease();
    if (HIDWORD(v43)) {
      goto LABEL_27;
    }
    if (v43 >= v19) {
      return 0;
    }
  }
  __break(1u);
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_27:
  uint64_t result = sub_364E0();
  __break(1u);
  return result;
}

uint64_t sub_B278@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v56 = a4;
  uint64_t v7 = sub_35550();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v51 - v12;
  if (qword_40BE0 != -1) {
    swift_once();
  }
  uint64_t v58 = a3;
  uint64_t v14 = sub_361C0();
  uint64_t v15 = sub_7900(v14, (uint64_t)qword_40FD8);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v55 = a1;
  uint64_t v59 = v8 + 16;
  uint64_t v57 = v16;
  v16(v13, a1, v7);
  uint64_t v60 = v15;
  uint64_t v17 = sub_361A0();
  int v18 = sub_36360();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    LODWORD(v53) = v18;
    uint64_t v54 = a2;
    uint64_t v19 = swift_slowAlloc();
    *(void *)&long long v52 = swift_slowAlloc();
    uint64_t v61 = v52;
    *(_DWORD *)uint64_t v19 = 136315394;
    if (qword_40BD8 != -1) {
      swift_once();
    }
    uint64_t v20 = qword_40FC8;
    unint64_t v21 = unk_40FD0;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v20, v21, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v57(v11, v13, v7);
    uint64_t v22 = sub_36220();
    uint64_t v63 = sub_2F52C(v22, v23, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _os_log_impl(&dword_0, v17, (os_log_type_t)v53, "%s Processing new ground truth for %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a2 = v54;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  sub_7E34((void *)(a2 + 16), *(void *)(a2 + 40));
  sub_35380();
  uint64_t v53 = sub_3C6C(&qword_40FF0);
  unint64_t v24 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v25 = swift_allocObject();
  long long v52 = xmmword_36D00;
  *(_OWORD *)(v25 + 16) = xmmword_36D00;
  uint64_t v26 = v55;
  unint64_t v27 = (void (*)(unint64_t, uint64_t, uint64_t))v57;
  v57((char *)(v25 + v24), v55, v7);
  v51[1] = sub_32830(v25);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v54 = sub_35F10();
  swift_allocObject();
  uint64_t v28 = sub_35EF0();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v52;
  v27(v29 + v24, (uint64_t)v26, v7);
  swift_retain();
  sub_32830(v29);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_35CF0();
  swift_allocObject();
  uint64_t v59 = v28;
  uint64_t v57 = (void (*)(char *, char *, uint64_t))sub_35CD0();
  uint64_t v30 = sub_35CE0();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_361A0();
  os_log_type_t v32 = sub_36360();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315650;
    if (qword_40BD8 != -1) {
      swift_once();
    }
    uint64_t v34 = qword_40FC8;
    unint64_t v35 = unk_40FD0;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v34, v35, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2048;
    uint64_t v63 = *(void *)(v58 + 16);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2048;
    if ((v30 & 0xC000000000000001) != 0) {
      uint64_t v36 = sub_36410();
    }
    else {
      uint64_t v36 = *(void *)(v30 + 16);
    }
    uint64_t v37 = &SiriPrivateLearningInferencePlugin;
    uint64_t v63 = v36;
    sub_363D0();
    _os_log_impl(&dword_0, v31, v32, "%s Updated candidate scores in %ld Ground Truth and %ld queries.", (uint8_t *)v33, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v37 = &SiriPrivateLearningInferencePlugin;
  }
  sub_35D20();
  uint64_t v61 = v59;
  sub_C260(&qword_41008, (void (*)(uint64_t))&type metadata accessor for MediaSuggestionStoreCandidateAdapter);
  swift_retain();
  uint64_t v38 = sub_35D00();
  sub_BE28(v30, (void (*)(void))&type metadata accessor for UsoEntity_common_MediaItem, &qword_41020, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_MediaItem);
  swift_bridgeObjectRelease();
  uint64_t v58 = v38;
  uint64_t v39 = sub_35D10();
  swift_release();
  char v40 = sub_361A0();
  os_log_type_t v41 = sub_36360();
  if (os_log_type_enabled(v40, v41))
  {
    int v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)int v42 = 136315138;
    if (*(void *)&v37[42].ivar_base_size != -1) {
      swift_once();
    }
    uint64_t v43 = qword_40FC8;
    unint64_t v44 = unk_40FD0;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v43, v44, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v40, v41, "%s Nominated Candidates:", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (*(void *)&v37[42].ivar_base_size != -1) {
    swift_once();
  }
  uint64_t v61 = qword_40FC8;
  unint64_t v62 = unk_40FD0;
  swift_bridgeObjectRetain();
  v64._countAndFlagsBits = 8224;
  v64._object = (void *)0xE200000000000000;
  sub_36240(v64);
  sub_12664(v61, v62, v39);
  swift_bridgeObjectRelease();
  uint64_t v45 = sub_361A0();
  os_log_type_t v46 = sub_36360();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v48 = qword_40FC8;
    unint64_t v49 = unk_40FD0;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v48, v49, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v45, v46, "%s Persisting updated candidates to the suggestion store", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_35F00();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  uint64_t *v56 = v39;
  return result;
}

uint64_t sub_BCC4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_BCF4()
{
  return 0;
}

uint64_t sub_BCFC(uint64_t a1)
{
  return 0;
}

uint64_t sub_BD18()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_40FD8);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_40FD8);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_BDE0(uint64_t a1)
{
  return sub_BE28(a1, (void (*)(void))&type metadata accessor for UsoEntity_common_Person, &qword_41028, (void (*)(uint64_t))&type metadata accessor for UsoEntity_common_Person);
}

void *sub_BE28(uint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t))
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = sub_36410();
    if (v8) {
      goto LABEL_3;
    }
    return _swiftEmptyArrayStorage;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    return _swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v8 <= 0)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
  }
  else
  {
    sub_3C6C(&qword_41018);
    uint64_t v9 = (void *)swift_allocObject();
    int64_t v10 = j__malloc_size(v9);
    uint64_t v11 = v10 - 32;
    if (v10 < 32) {
      uint64_t v11 = v10 - 25;
    }
    v9[2] = v8;
    v9[3] = (2 * (v11 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_BF54((uint64_t)&v14, v9 + 4, v8, a1, a2, a3, a4);
  uint64_t result = (void *)sub_C254();
  if (v12 == v8) {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_BF54(uint64_t result, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  uint64_t v7 = a4;
  uint64_t v9 = a2;
  uint64_t v30 = (void *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_36400();
    a5(0);
    sub_C260(a6, a7);
    uint64_t result = sub_36340();
    uint64_t v7 = v34;
    uint64_t v13 = v35;
    uint64_t v14 = v36;
    int64_t v15 = v37;
    unint64_t v16 = v38;
    if (v9) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v17 = 0;
    goto LABEL_38;
  }
  int64_t v15 = 0;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v13 = a4 + 56;
  uint64_t v14 = ~v25;
  uint64_t v26 = -v25;
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  else {
    uint64_t v27 = -1;
  }
  unint64_t v16 = v27 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v17 = 0;
LABEL_38:
    uint64_t v28 = v30;
LABEL_41:
    void *v28 = v7;
    v28[1] = v13;
    v28[2] = v14;
    v28[3] = v15;
    v28[4] = v16;
    return v17;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v17 = 0;
  int64_t v31 = (unint64_t)(v14 + 64) >> 6;
  uint64_t v29 = v14;
  while (1)
  {
    if (v7 < 0)
    {
      if (!sub_36420()) {
        goto LABEL_40;
      }
      a5(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v20 = v33;
      uint64_t result = swift_unknownObjectRelease();
      if (!v33) {
        goto LABEL_40;
      }
      goto LABEL_8;
    }
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v15 << 6);
      goto LABEL_7;
    }
    int64_t v21 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v21 >= v31)
    {
      unint64_t v16 = 0;
      goto LABEL_40;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v21);
    if (v22) {
      goto LABEL_23;
    }
    int64_t v23 = v15 + 2;
    if (v15 + 2 >= v31)
    {
      unint64_t v16 = 0;
      ++v15;
      goto LABEL_40;
    }
    unint64_t v22 = *(void *)(v13 + 8 * v23);
    if (!v22)
    {
      if (v15 + 3 >= v31) {
        goto LABEL_44;
      }
      unint64_t v22 = *(void *)(v13 + 8 * (v15 + 3));
      if (v22)
      {
        int64_t v21 = v15 + 3;
        goto LABEL_23;
      }
      int64_t v23 = v15 + 4;
      if (v15 + 4 >= v31)
      {
        unint64_t v16 = 0;
        v15 += 3;
        goto LABEL_40;
      }
      unint64_t v22 = *(void *)(v13 + 8 * v23);
      if (!v22)
      {
        int64_t v21 = v15 + 5;
        if (v15 + 5 >= v31)
        {
LABEL_44:
          unint64_t v16 = 0;
          int64_t v15 = v23;
          goto LABEL_40;
        }
        unint64_t v22 = *(void *)(v13 + 8 * v21);
        if (!v22)
        {
          int64_t v24 = v15 + 6;
          while (v31 != v24)
          {
            unint64_t v22 = *(void *)(v13 + 8 * v24++);
            if (v22)
            {
              int64_t v21 = v24 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v16 = 0;
          int64_t v15 = v31 - 1;
          goto LABEL_40;
        }
        goto LABEL_23;
      }
    }
    int64_t v21 = v23;
LABEL_23:
    unint64_t v16 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v21 << 6);
    int64_t v15 = v21;
LABEL_7:
    uint64_t v20 = *(void *)(*(void *)(v7 + 48) + 8 * v19);
    uint64_t result = swift_retain();
    if (!v20) {
      goto LABEL_40;
    }
LABEL_8:
    ++v17;
    *v9++ = v20;
    if (v17 == a3)
    {
      uint64_t v17 = a3;
LABEL_40:
      uint64_t v14 = v29;
      uint64_t v28 = v30;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_C254()
{
  return swift_release();
}

uint64_t sub_C260(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_C2A8(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_C2E8(a1);
  return v2;
}

uint64_t sub_C2E8(uint64_t a1)
{
  sub_7DD0(a1, (uint64_t)v7);
  sub_7DD0((uint64_t)v7, v1 + 32);
  uint64_t v3 = sub_35320();
  uint64_t v5 = v4;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v7);
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v5;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  return v1;
}

uint64_t sub_C380()
{
  sub_3C6C(&qword_41140);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_36E60;
  uint64_t v1 = sub_35050();
  swift_allocObject();
  uint64_t v2 = sub_35040();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = &protocol witness table for ASRFeatureExtractor;
  *(void *)(v0 + 32) = v2;
  uint64_t v3 = sub_35C20();
  swift_allocObject();
  uint64_t v4 = sub_35C10();
  *(void *)(v0 + 96) = v3;
  *(void *)(v0 + 104) = sub_C63C(&qword_41148, (void (*)(uint64_t))&type metadata accessor for USOTaskSummaryFeatureExtractor);
  *(void *)(v0 + 72) = v4;
  uint64_t v5 = sub_35100();
  swift_allocObject();
  uint64_t v6 = sub_350F0();
  *(void *)(v0 + 136) = v5;
  *(void *)(v0 + 144) = &protocol witness table for DismissalFeatureExtractor;
  *(void *)(v0 + 112) = v6;
  uint64_t v7 = sub_35090();
  swift_allocObject();
  uint64_t v8 = sub_35080();
  *(void *)(v0 + 176) = v7;
  *(void *)(v0 + 184) = &protocol witness table for UEIFeatureExtractor;
  *(void *)(v0 + 152) = v8;
  uint64_t v9 = sub_35190();
  swift_allocObject();
  uint64_t v10 = sub_35180();
  *(void *)(v0 + 216) = v9;
  *(void *)(v0 + 224) = &protocol witness table for FlowClientEventFeatureExtractor;
  *(void *)(v0 + 192) = v10;
  uint64_t v11 = sub_35120();
  swift_allocObject();
  uint64_t v12 = sub_35110();
  *(void *)(v0 + 256) = v11;
  *(void *)(v0 + 264) = &protocol witness table for RequestIdFeatureExtractor;
  *(void *)(v0 + 232) = v12;
  return v0;
}

uint64_t sub_C524()
{
  sub_3C6C(&qword_41130);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_36D00;
  uint64_t v1 = sub_35D80();
  swift_allocObject();
  uint64_t v2 = sub_35D70();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = sub_C63C(&qword_41138, (void (*)(uint64_t))&type metadata accessor for CommonInteractionFeatureExtractor);
  *(void *)(v0 + 32) = v2;
  return v0;
}

uint64_t sub_C5D8()
{
  swift_bridgeObjectRelease();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 32);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CommonInferenceDomain()
{
  return self;
}

uint64_t sub_C63C(unint64_t *a1, void (*a2)(uint64_t))
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

void *SiriPrivateLearningInferenceConstants.streamBookmarkName.unsafeMutableAddressor()
{
  return &static SiriPrivateLearningInferenceConstants.streamBookmarkName;
}

unint64_t static SiriPrivateLearningInferenceConstants.streamBookmarkName.getter()
{
  return 0xD000000000000027;
}

void *SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents.unsafeMutableAddressor()
{
  return &static SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents;
}

double static SiriPrivateLearningInferenceConstants.maximumTimeWindowForFollowupEvents.getter()
{
  return 120.0;
}

ValueMetadata *type metadata accessor for SiriPrivateLearningInferenceConstants()
{
  return &type metadata for SiriPrivateLearningInferenceConstants;
}

void sub_C6D4()
{
  type metadata accessor for MusicEntityGroundTruthGenerator();
  sub_3C6C(&qword_41280);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_41150 = 91;
  *(void *)algn_41158 = 0xE100000000000000;
}

char *sub_C758()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_35F80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v19 = xmmword_36CF0;
  uint64_t v14 = v20;
  uint64_t v6 = sub_35E10();
  swift_allocObject();
  uint64_t v7 = sub_35E00();
  v20[3] = v6;
  v20[4] = sub_F6EC(&qword_412B8, 255, (void (*)(uint64_t))&type metadata accessor for QuickSongStopGroundTruthGenerator);
  v20[0] = v7;
  sub_35B90();
  swift_allocObject();
  v18[0] = sub_35B80();
  sub_F6EC(&qword_412C0, 255, (void (*)(uint64_t))&type metadata accessor for SuccessfulPlayMediaDefinition);
  sub_35990();
  swift_release();
  if (*(unsigned char *)(v1 + 32) == 1)
  {
    sub_35F70();
    *((void *)&v22 + 1) = v2;
    uint64_t v23 = sub_F6EC(&qword_412D0, 255, (void (*)(uint64_t))&type metadata accessor for MediaInAppFollowupGroundTruthGenerator);
    uint64_t v8 = sub_F688((uint64_t *)&v21);
    (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  }
  else
  {
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  uint64_t v9 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 4; i != 19; i += 5)
  {
    sub_8310((uint64_t)&v18[i + 5], (uint64_t)v18, &qword_412C8);
    sub_3CB0((uint64_t)v18, (uint64_t)&v15, &qword_412C8);
    if (v16)
    {
      sub_7998(&v15, (uint64_t)v17);
      sub_7998(v17, (uint64_t)&v15);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_2C830(0, *((void *)v9 + 2) + 1, 1, v9);
      }
      unint64_t v12 = *((void *)v9 + 2);
      unint64_t v11 = *((void *)v9 + 3);
      if (v12 >= v11 >> 1) {
        uint64_t v9 = sub_2C830((char *)(v11 > 1), v12 + 1, 1, v9);
      }
      *((void *)v9 + 2) = v12 + 1;
      sub_7998(&v15, (uint64_t)&v9[40 * v12 + 32]);
    }
    else
    {
      sub_8374((uint64_t)&v15, &qword_412C8);
    }
  }
  sub_3C6C(&qword_412C8);
  swift_arrayDestroy();
  return v9;
}

uint64_t sub_CABC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_34E90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  v76 = (char *)&v68 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v68 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v68 - v15;
  sub_362A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_8374((uint64_t)v4, &qword_40F80);
  }
  uint64_t v68 = v9;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v16, v4, v5);
  if (qword_40BF0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_361C0();
  uint64_t v19 = sub_7900(v18, (uint64_t)qword_41160);
  uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v73 = v16;
  uint64_t v70 = v6 + 16;
  v72(v14, v16, v5);
  uint64_t isUniquelyReferenced_nonNull_native = sub_361A0();
  LOBYTE(v16) = sub_36360();
  BOOL v21 = os_log_type_enabled((os_log_t)isUniquelyReferenced_nonNull_native, (os_log_type_t)v16);
  uint64_t v74 = (char *)v19;
  uint64_t v75 = v1;
  uint64_t v71 = v6;
  if (!v21)
  {
    uint64_t v69 = *(void (**)(char *, uint64_t))(v6 + 8);
    v69(v14, v5);

    goto LABEL_9;
  }
  uint64_t v22 = swift_slowAlloc();
  v78[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v22 = 136315394;
  if (qword_40BE8 != -1) {
    goto LABEL_44;
  }
  while (1)
  {
    uint64_t v23 = qword_41150;
    unint64_t v24 = *(void *)algn_41158;
    swift_bridgeObjectRetain();
    uint64_t v77 = sub_2F52C(v23, v24, v78);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v25 = sub_34E70();
    uint64_t v77 = sub_2F52C(v25, v26, v78);
    sub_363D0();
    swift_bridgeObjectRelease();
    uint64_t v69 = *(void (**)(char *, uint64_t))(v71 + 8);
    v69(v14, v5);
    _os_log_impl(&dword_0, (os_log_t)isUniquelyReferenced_nonNull_native, (os_log_type_t)v16, "%s Reviewing session with id=%s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v75;
LABEL_9:
    uint64_t v27 = sub_361A0();
    os_log_type_t v28 = sub_36360();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      v78[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315138;
      if (qword_40BE8 != -1) {
        swift_once();
      }
      uint64_t v30 = qword_41150;
      unint64_t v31 = *(void *)algn_41158;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_2F52C(v30, v31, v78);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v27, v28, "%s Running classifiers on session features", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    os_log_type_t v32 = sub_E674();
    v78[0] = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v33 = *((void *)v32 + 2);
    if (v33)
    {
      uint64_t v34 = v32 + 32;
      do
      {
        sub_7E34(v34, v34[3]);
        uint64_t v35 = sub_35510();
        sub_2D87C(v35);
        v34 += 5;
        --v33;
      }
      while (v33);
      swift_bridgeObjectRelease();
      uint64_t v36 = (void *)v78[0];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v36 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRetain();
    int64_t v37 = sub_361A0();
    os_log_type_t v38 = sub_36360();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      v78[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315394;
      if (qword_40BE8 != -1) {
        swift_once();
      }
      uint64_t v40 = qword_41150;
      unint64_t v41 = *(void *)algn_41158;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_2F52C(v40, v41, v78);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2048;
      uint64_t v77 = v36[2];
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v37, v38, "%s Made %ld Classifications:", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v1 = v75;
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    sub_122A4(8224, 0xE200000000000000, (uint64_t)v36);
    int v42 = sub_361A0();
    os_log_type_t v43 = sub_36360();
    if (os_log_type_enabled(v42, v43))
    {
      unint64_t v44 = (uint8_t *)swift_slowAlloc();
      v78[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v44 = 136315138;
      if (qword_40BE8 != -1) {
        swift_once();
      }
      uint64_t v45 = qword_41150;
      unint64_t v46 = *(void *)algn_41158;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_2F52C(v45, v46, v78);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v42, v43, "%s Running ground truth generators with classification results.", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v1 = v75;
    }
    else
    {
    }
    uint64_t v47 = sub_C758();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_E920((uint64_t)v47);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = (char *)sub_EB58(v48);
    swift_bridgeObjectRelease();
    unint64_t v49 = sub_361A0();
    os_log_type_t v50 = sub_36360();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v74 = v14;
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      v78[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315138;
      if (qword_40BE8 != -1) {
        swift_once();
      }
      uint64_t v53 = qword_41150;
      unint64_t v52 = *(void *)algn_41158;
      swift_bridgeObjectRetain();
      uint64_t v77 = sub_2F52C(v53, v52, v78);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v49, v50, "%s Generated Media Ground Truth:", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v14 = v74;
      uint64_t v1 = v75;
    }
    else
    {
    }
    sub_12298(8224, 0xE200000000000000, (uint64_t)v14);
    sub_E260();
    swift_bridgeObjectRelease();
    uint64_t v54 = (uint64_t)v76;
    v72(v76, v73, v5);
    uint64_t v22 = v1 + 24;
    swift_beginAccess();
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v77 = *(void *)(v1 + 24);
    uint64_t v55 = v77;
    *(void *)(v1 + 24) = 0x8000000000000000;
    uint64_t v16 = (char *)sub_2FC00(v54);
    uint64_t v57 = *(void *)(v55 + 16);
    BOOL v58 = (v56 & 1) == 0;
    uint64_t v59 = v57 + v58;
    if (!__OFADD__(v57, v58)) {
      break;
    }
    __break(1u);
LABEL_44:
    swift_once();
  }
  char v60 = v56;
  if (*(void *)(v55 + 24) >= v59)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_30DA4();
      uint64_t v55 = v77;
    }
  }
  else
  {
    sub_2FEFC(v59, isUniquelyReferenced_nonNull_native);
    uint64_t v55 = v77;
    unint64_t v61 = sub_2FC00(v54);
    if ((v60 & 1) != (v62 & 1))
    {
      uint64_t result = sub_36590();
      __break(1u);
      return result;
    }
    uint64_t v16 = (char *)v61;
  }
  uint64_t v63 = v73;
  uint64_t v64 = (uint64_t)v14;
  *(void *)uint64_t v22 = v55;
  swift_bridgeObjectRelease();
  uint64_t v65 = *(void **)v22;
  swift_bridgeObjectRetain();
  if ((v60 & 1) == 0)
  {
    uint64_t v66 = (uint64_t)v68;
    v72(v68, (char *)v54, v5);
    sub_30C10((unint64_t)v16, v66, (uint64_t)_swiftEmptyArrayStorage, v65);
  }
  swift_bridgeObjectRelease();
  sub_2D804(v64);
  unint64_t v67 = (uint64_t (*)(char *, uint64_t))v69;
  v69((char *)v54, v5);
  swift_endAccess();
  return v67(v63, v5);
}

void *sub_D69C()
{
  uint64_t v1 = v0;
  uint64_t v61 = sub_3C6C(&qword_40F78);
  uint64_t v2 = __chkstk_darwin(v61);
  char v60 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v59 = (char *)&v47 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v58 = (uint64_t)&v47 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v57 = (char *)&v47 - v9;
  __chkstk_darwin(v8);
  char v56 = (char *)&v47 - v10;
  uint64_t v55 = sub_35660();
  uint64_t v62 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BF8 != -1) {
    goto LABEL_32;
  }
  while (1)
  {
    sub_35850();
    swift_beginAccess();
    uint64_t v13 = *(void *)(v1 + 24);
    int64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = _swiftEmptyArrayStorage;
    if (!v14) {
      return v15;
    }
    uint64_t v66 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_316A4(0, v14, 0);
    uint64_t v17 = sub_32274(v13);
    uint64_t v18 = 0;
    uint64_t v19 = v13 + 64;
    uint64_t v52 = v62 + 32;
    char v20 = *(unsigned char *)(v13 + 32);
    uint64_t v48 = v13 + 80;
    uint64_t v53 = v13;
    uint64_t v54 = v12;
    int64_t v49 = v14;
    uint64_t v50 = v16;
    uint64_t v51 = v13 + 64;
    while ((v17 & 0x8000000000000000) == 0 && v17 < 1 << v20)
    {
      unint64_t v23 = (unint64_t)v17 >> 6;
      if ((*(void *)(v19 + 8 * ((unint64_t)v17 >> 6)) & (1 << v17)) == 0) {
        goto LABEL_27;
      }
      if (*(_DWORD *)(v13 + 36) != v16) {
        goto LABEL_28;
      }
      uint64_t v63 = v18;
      uint64_t v64 = 1 << v17;
      uint64_t v24 = v61;
      uint64_t v25 = *(int *)(v61 + 48);
      uint64_t v26 = *(void *)(v13 + 48);
      uint64_t v27 = sub_34E90();
      uint64_t v65 = *(void *)(v27 - 8);
      os_log_type_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
      uint64_t v1 = v65 + 16;
      uint64_t v29 = (uint64_t)v56;
      v28(v56, v26 + *(void *)(v65 + 72) * v17, v27);
      uint64_t v30 = *(void *)(*(void *)(v13 + 56) + 8 * v17);
      *(void *)(v29 + v25) = v30;
      unint64_t v31 = v57;
      v28(v57, v29, v27);
      *(void *)&v31[*(int *)(v24 + 48)] = v30;
      uint64_t v32 = (uint64_t)v31;
      uint64_t v33 = v58;
      sub_3CB0(v32, v58, &qword_40F78);
      swift_bridgeObjectRetain_n();
      sub_8374(v29, &qword_40F78);
      uint64_t v34 = *(int *)(v24 + 48);
      uint64_t v35 = v59;
      v28(v59, v33, v27);
      uint64_t v36 = *(void *)(v33 + v34);
      *(void *)&v35[v34] = v36;
      uint64_t v37 = *(int *)(v24 + 48);
      os_log_type_t v38 = v60;
      v28(v60, v33, v27);
      uint64_t v12 = v54;
      *(void *)&v38[v37] = v36;
      swift_bridgeObjectRetain();
      sub_35650();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v27);
      sub_8374(v33, &qword_40F78);
      uint64_t v15 = v66;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_316A4(0, v15[2] + 1, 1);
        uint64_t v15 = v66;
      }
      unint64_t v40 = v15[2];
      unint64_t v39 = v15[3];
      if (v40 >= v39 >> 1)
      {
        sub_316A4(v39 > 1, v40 + 1, 1);
        uint64_t v15 = v66;
      }
      v15[2] = v40 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v62 + 32))((unint64_t)v15+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(void *)(v62 + 72) * v40, v12, v55);
      uint64_t v66 = v15;
      uint64_t v13 = v53;
      char v20 = *(unsigned char *)(v53 + 32);
      unint64_t v21 = 1 << v20;
      if (v17 >= 1 << v20) {
        goto LABEL_29;
      }
      uint64_t v19 = v51;
      uint64_t v41 = *(void *)(v51 + 8 * v23);
      if ((v41 & v64) == 0) {
        goto LABEL_30;
      }
      LODWORD(v16) = v50;
      if (*(_DWORD *)(v53 + 36) != v50) {
        goto LABEL_31;
      }
      unint64_t v42 = v41 & (-2 << (v17 & 0x3F));
      if (v42)
      {
        unint64_t v21 = __clz(__rbit64(v42)) | v17 & 0xFFFFFFFFFFFFFFC0;
        int64_t v22 = v49;
      }
      else
      {
        unint64_t v43 = v23 + 1;
        unint64_t v44 = (v21 + 63) >> 6;
        int64_t v22 = v49;
        if (v23 + 1 < v44)
        {
          unint64_t v45 = *(void *)(v51 + 8 * v43);
          if (v45)
          {
LABEL_23:
            unint64_t v21 = __clz(__rbit64(v45)) + (v43 << 6);
          }
          else
          {
            while (v44 - 2 != v23)
            {
              unint64_t v45 = *(void *)(v48 + 8 * v23++);
              if (v45)
              {
                unint64_t v43 = v23 + 1;
                goto LABEL_23;
              }
            }
          }
        }
      }
      uint64_t v18 = v63 + 1;
      uint64_t v17 = v21;
      if (v63 + 1 == v22)
      {
        swift_bridgeObjectRelease();
        return v15;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    swift_once();
  }
}

uint64_t sub_DC50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = (uint64_t *)a2;
  uint64_t v3 = sub_34E90();
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v51 = v3;
  __chkstk_darwin(v3);
  int64_t v49 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_35BD0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v39 - v10;
  uint64_t v12 = sub_3C6C(&qword_412A0);
  __chkstk_darwin(v12 - 8);
  int64_t v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_35960();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_7DD0(a1, (uint64_t)v54);
  sub_3C6C(&qword_40FB0);
  char v19 = swift_dynamicCast();
  char v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if ((v19 & 1) == 0)
  {
    v20(v14, 1, 1, v15);
    sub_8374((uint64_t)v14, &qword_412A0);
    return sub_7DD0(a1, (uint64_t)v52);
  }
  uint64_t v48 = a1;
  v20(v14, 0, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
  sub_35950();
  unint64_t v44 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  uint64_t v45 = v6 + 104;
  v44(v9, enum case for MediaFeedbackGroundTruthSource.successfulPlay(_:), v5);
  char v21 = sub_35BC0();
  unint64_t v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v6 + 8;
  v23(v9, v5);
  unint64_t v46 = v11;
  uint64_t v47 = v23;
  v23(v11, v5);
  if ((v21 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    a1 = v48;
    return sub_7DD0(a1, (uint64_t)v52);
  }
  uint64_t v43 = v16;
  if (qword_40BF0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_361C0();
  sub_7900(v24, (uint64_t)qword_41160);
  sub_7DD0(v48, (uint64_t)v54);
  uint64_t v25 = sub_361A0();
  os_log_type_t v26 = sub_36360();
  int v27 = v26;
  BOOL v28 = os_log_type_enabled(v25, v26);
  uint64_t v29 = v46;
  if (v28)
  {
    os_log_t v42 = v25;
    uint64_t v30 = swift_slowAlloc();
    int v41 = v27;
    unint64_t v31 = (uint8_t *)v30;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v55 = v40;
    uint64_t v48 = v22;
    *(_DWORD *)unint64_t v31 = 136315138;
    v39[2] = v31 + 4;
    v39[1] = v54[4];
    sub_7E34(v54, v54[3]);
    uint64_t v32 = v49;
    sub_354D0();
    uint64_t v33 = sub_34E70();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v50 + 8))(v32, v51);
    uint64_t v53 = sub_2F52C(v33, v35, &v55);
    sub_363D0();
    swift_bridgeObjectRelease();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v54);
    uint64_t v25 = v42;
    _os_log_impl(&dword_0, v42, (os_log_type_t)v41, "Updating 'successfulPlay' ground truth id=%s to extendedPlayWithInAppFollowup due to a detected in app followup", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v54);
  }

  uint64_t v37 = v43;
  v44(v29, enum case for MediaFeedbackGroundTruthSource.extendedPlayWithInAppFollowup(_:), v5);
  os_log_type_t v38 = v52;
  v52[3] = v15;
  v38[4] = sub_F6EC(&qword_412A8, 255, (void (*)(uint64_t))&type metadata accessor for MediaFeedbackGroundTruth);
  sub_F688(v38);
  sub_35940();
  v47(v29, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v18, v15);
}

void sub_E260()
{
  uint64_t v1 = v0;
  if (qword_40BF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_361C0();
  sub_7900(v2, (uint64_t)qword_41160);
  uint64_t v3 = sub_361A0();
  os_log_type_t v4 = sub_36360();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    if (qword_40BE8 != -1) {
      swift_once();
    }
    uint64_t v6 = qword_41150;
    unint64_t v7 = *(void *)algn_41158;
    swift_bridgeObjectRetain();
    sub_2F52C(v6, v7, &v8);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v3, v4, "%s Logging inference results to SELF", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (*(void *)(v1 + 16))
  {
    sub_35C60();
    swift_allocObject();
    swift_retain();
    sub_35C50();
    sub_36010();
    swift_release();
    swift_release();
  }
}

uint64_t sub_E478()
{
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MusicEntityGroundTruthGenerator()
{
  return self;
}

void *sub_E4DC()
{
  return sub_D69C();
}

uint64_t sub_E500()
{
  return sub_CABC();
}

uint64_t sub_E524(uint64_t a1, uint64_t a2)
{
  return sub_F6EC(&qword_41278, a2, (void (*)(uint64_t))type metadata accessor for MusicEntityGroundTruthGenerator);
}

uint64_t sub_E56C()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41160);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41160);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_E634()
{
  sub_35880();
  swift_allocObject();
  uint64_t result = sub_35870();
  qword_41178 = result;
  return result;
}

char *sub_E674()
{
  long long v14 = xmmword_36CF0;
  uint64_t v0 = sub_355D0();
  swift_allocObject();
  uint64_t v16 = v0;
  uint64_t v17 = &protocol witness table for MediaPlayClassifier;
  uint64_t v15 = sub_355C0();
  uint64_t v1 = sub_35B30();
  swift_allocObject();
  uint64_t v19 = v1;
  char v20 = &protocol witness table for MediaInAppFollowupClassifier;
  uint64_t v18 = sub_35B20();
  sub_35AA0();
  sub_3C6C(&qword_40F90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_36D00;
  *(void *)(inited + 32) = sub_35240();
  *(void *)(inited + 40) = v3;
  sub_32300(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v4 = sub_35B50();
  swift_allocObject();
  sub_35B40();
  v13[3] = v4;
  v13[4] = &protocol witness table for FullEntityUtteranceComparator;
  v13[0] = sub_35A90();
  sub_35A80();
  swift_release();
  uint64_t v5 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 4; i != 19; i += 5)
  {
    sub_8310((uint64_t)&v13[i + 5], (uint64_t)v13, &qword_412B0);
    sub_3CB0((uint64_t)v13, (uint64_t)&v10, &qword_412B0);
    if (v11)
    {
      sub_7998(&v10, (uint64_t)v12);
      sub_7998(v12, (uint64_t)&v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_2C81C(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v8 = *((void *)v5 + 2);
      unint64_t v7 = *((void *)v5 + 3);
      if (v8 >= v7 >> 1) {
        uint64_t v5 = sub_2C81C((char *)(v7 > 1), v8 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v8 + 1;
      sub_7998(&v10, (uint64_t)&v5[40 * v8 + 32]);
    }
    else
    {
      sub_8374((uint64_t)&v10, &qword_412B0);
    }
  }
  sub_3C6C(&qword_412B0);
  swift_arrayDestroy();
  return v5;
}

char *sub_E920(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    sub_7E34(v2, v2[3]);
    sub_35220();
    swift_getAssociatedTypeWitness();
    sub_3C6C(&qword_40FB0);
    uint64_t v4 = sub_364C0();
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v4 + 16);
    int64_t v6 = *((void *)v3 + 2);
    int64_t v7 = v6 + v5;
    if (__OFADD__(v6, v5)) {
      break;
    }
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v7 <= *((void *)v3 + 3) >> 1)
    {
      if (*(void *)(v4 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v6 <= v7) {
        int64_t v9 = v6 + v5;
      }
      else {
        int64_t v9 = v6;
      }
      uint64_t v3 = sub_2C2CC(isUniquelyReferenced_nonNull_native, v9, 1, v3);
      if (*(void *)(v4 + 16))
      {
LABEL_14:
        uint64_t v10 = *((void *)v3 + 2);
        if ((*((void *)v3 + 3) >> 1) - v10 < v5) {
          goto LABEL_28;
        }
        unint64_t v11 = (unint64_t)&v3[40 * v10 + 32];
        if (v4 + 32 < v11 + 40 * v5 && v11 < v4 + 32 + 40 * v5) {
          goto LABEL_30;
        }
        swift_arrayInitWithCopy();
        if (v5)
        {
          uint64_t v13 = *((void *)v3 + 2);
          BOOL v14 = __OFADD__(v13, v5);
          uint64_t v15 = v13 + v5;
          if (v14) {
            goto LABEL_29;
          }
          *((void *)v3 + 2) = v15;
        }
        goto LABEL_4;
      }
    }
    if (v5) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_EB58(void *a1)
{
  uint64_t v81 = sub_35D60();
  uint64_t v2 = *(void *)(v81 - 8);
  uint64_t v3 = __chkstk_darwin(v81);
  uint64_t v75 = (char *)v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v6 = (char *)v67 - v5;
  uint64_t v7 = sub_354C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  BOOL v80 = (char *)v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v87 = (char *)v67 - v11;
  uint64_t v12 = sub_3C6C(&qword_41288);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v84 = (uint64_t)v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v86 = (char *)v67 - v16;
  __chkstk_darwin(v15);
  uint64_t v85 = (uint64_t)v67 - v17;
  uint64_t v18 = sub_3C6C(&qword_41290);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v70 = (uint64_t)v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v69 = (uint64_t)v67 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)v67 - v24;
  __chkstk_darwin(v23);
  unint64_t v83 = (char *)v67 - v26;
  unint64_t v27 = a1[2];
  uint64_t v71 = (uint64_t)(a1 + 4);
  v90 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v94 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56);
  uint64_t v93 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48);
  v89 = (uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  uint64_t v88 = (void (**)(void))(v8 + 32);
  unsigned int v79 = enum case for MediaCorrectionGroundTruthSource.inAppFollowup(_:);
  char v82 = (void (**)(char *, void, uint64_t))(v2 + 104);
  v76 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v74 = (void (**)(char *, char *, uint64_t))(v8 + 16);
  unsigned int v72 = enum case for MediaCorrectionGroundTruthSource.inAppFollowupUnrelatedEntity(_:);
  char v78 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v68 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  v67[1] = 0;
  unint64_t v30 = 0;
  unint64_t v31 = v6;
  v73 = v25;
  unint64_t v77 = v27;
  uint64_t v92 = v18;
  while (1)
  {
    if (v30 == v27)
    {
      uint64_t v102 = 0;
      unint64_t v32 = v27;
      long long v100 = 0u;
      long long v101 = 0u;
      uint64_t v33 = v87;
      goto LABEL_7;
    }
    uint64_t v33 = v87;
    if (v30 >= v27) {
      break;
    }
    sub_7DD0(v71 + 40 * v30, (uint64_t)&v100);
    unint64_t v32 = v30 + 1;
LABEL_7:
    unint64_t v95 = v32;
    sub_3CB0((uint64_t)&v100, (uint64_t)&v98, &qword_41298);
    uint64_t v34 = (uint64_t)v86;
    if (v99)
    {
      sub_7998(&v98, (uint64_t)v97);
      sub_7DD0((uint64_t)v97, (uint64_t)v96);
      sub_3C6C(&qword_40FB0);
      int v35 = swift_dynamicCast();
      (*v90)(v34, v35 ^ 1u, 1, v7);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v97);
      uint64_t v36 = *v94;
      (*v94)(v34, 0, 1, v18);
    }
    else
    {
      uint64_t v36 = *v94;
      (*v94)((uint64_t)v86, 1, 1, v18);
    }
    uint64_t v37 = v18;
    os_log_type_t v38 = *v93;
    if ((*v93)(v34, 1, v37) == 1)
    {
      sub_8374(v34, &qword_41288);
      uint64_t v39 = 1;
      goto LABEL_14;
    }
    sub_3CB0(v34, (uint64_t)v25, &qword_41290);
    if ((*v89)(v25, 1, v7) == 1)
    {
      uint64_t result = sub_8374((uint64_t)v25, &qword_41290);
      uint64_t v18 = v92;
      unint64_t v30 = v95;
    }
    else
    {
      sub_3CB0((uint64_t)v25, v85, &qword_41290);
      uint64_t v39 = 0;
LABEL_14:
      uint64_t v40 = v85;
      uint64_t v41 = v92;
      v36(v85, v39, 1, v92);
      uint64_t v42 = v84;
      sub_3CB0(v40, v84, &qword_41288);
      if (v38(v42, 1, v41) == 1)
      {
        uint64_t v43 = v83;
        (*v90)((uint64_t)v83, 1, 1, v7);
        int v44 = (*v89)(v43, 1, v7);
      }
      else
      {
        uint64_t v45 = v69;
        sub_3CB0(v42, v69, &qword_41290);
        uint64_t v46 = v70;
        sub_8310(v45, v70, &qword_41290);
        uint64_t v47 = *v89;
        uint64_t result = (*v89)((char *)v46, 1, v7);
        if (result == 1) {
          goto LABEL_31;
        }
        uint64_t v43 = v83;
        (*v88)();
        sub_8374(v45, &qword_41290);
        (*v90)((uint64_t)v43, 0, 1, v7);
        int v44 = v47(v43, 1, v7);
      }
      uint64_t v48 = v82;
      if (v44 == 1)
      {
        char v56 = v68;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        return (uint64_t)v56;
      }
      ((void (*)(char *, char *, uint64_t))*v88)(v33, v43, v7);
      sub_354B0();
      uint64_t v49 = v81;
      uint64_t v50 = v75;
      uint64_t v51 = v80;
      uint64_t v52 = *v48;
      (*v48)(v75, v79, v81);
      int v91 = sub_35D50();
      uint64_t v53 = *v76;
      (*v76)(v50, v49);
      v53(v31, v49);
      (*v74)(v51, v33, v7);
      if (v91)
      {
        uint64_t v57 = *v78;
        (*v78)(v51, v7);
        v57(v33, v7);
        unint64_t v27 = v77;
LABEL_24:
        swift_bridgeObjectRelease();
        char v56 = _swiftEmptyArrayStorage;
        if (v27)
        {
          *(void *)&long long v98 = _swiftEmptyArrayStorage;
          sub_31644(0, v27, 0);
          char v56 = (void *)v98;
          uint64_t v58 = v71;
          do
          {
            sub_DC50(v58, (uint64_t)&v100);
            *(void *)&long long v98 = v56;
            unint64_t v60 = v56[2];
            unint64_t v59 = v56[3];
            if (v60 >= v59 >> 1) {
              sub_31644(v59 > 1, v60 + 1, 1);
            }
            uint64_t v61 = *((void *)&v101 + 1);
            uint64_t v62 = v102;
            uint64_t v63 = sub_F638((uint64_t)&v100, *((uint64_t *)&v101 + 1));
            __chkstk_darwin(v63);
            uint64_t v65 = (char *)v67 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
            (*(void (**)(char *))(v66 + 16))(v65);
            sub_24CA0(v60, (uint64_t)v65, (uint64_t *)&v98, v61, v62);
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v100);
            char v56 = (void *)v98;
            v58 += 40;
            --v27;
          }
          while (v27);
        }
        return (uint64_t)v56;
      }
      sub_354B0();
      v52(v50, v72, v49);
      char v54 = sub_35D50();
      v53(v50, v49);
      v53(v31, v49);
      uint64_t v55 = *v78;
      (*v78)(v51, v7);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v55)(v33, v7);
      uint64_t v18 = v92;
      uint64_t v25 = v73;
      unint64_t v27 = v77;
      unint64_t v30 = v95;
      if (v54) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_F638(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_F688(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_F6EC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_F734(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_36110();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40C00 != -1) {
    swift_once();
  }
  int v11 = byte_42680;
  uint64_t v12 = sub_36130();
  int v13 = sub_363A0();
  uint64_t result = sub_363C0();
  if (v11 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
LABEL_24:
      sub_36180();
      swift_allocObject();
      return sub_36170();
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
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v15(v10, a4, v7);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_36100();
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
      uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v15(v10, a4, v7);
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = sub_36100();
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

void sub_FA28()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_36200();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_42680 = v2;
}

void sub_FAB8()
{
  qword_42688 = 0x636E657265666E49;
  unk_42690 = 0xEF6E6967756C5065;
}

uint64_t sub_FAE8()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_42698);
  sub_7900(v0, (uint64_t)qword_42698);
  if (qword_40C08 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_361B0();
}

uint64_t sub_FBA4()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_426B0);
  sub_7900(v0, (uint64_t)qword_426B0);
  return sub_361B0();
}

uint64_t sub_FC28()
{
  uint64_t v0 = sub_361C0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_36140();
  sub_7E94(v4, qword_426C8);
  sub_7900(v4, (uint64_t)qword_426C8);
  if (qword_40C18 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_7900(v0, (uint64_t)qword_426B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_36120();
}

uint64_t sub_FD64()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_412D8);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_412D8);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_FE2C(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_FE6C(a1);
  return v2;
}

uint64_t sub_FE6C(void *a1)
{
  uint64_t v2 = v1;
  sub_7E34(a1, a1[3]);
  swift_retain();
  sub_35360();
  sub_360B0();
  swift_allocObject();
  *(void *)(v1 + 72) = sub_360A0();
  swift_release();
  sub_7DD0((uint64_t)a1, (uint64_t)v8);
  sub_7DD0((uint64_t)v8, v1 + 32);
  uint64_t v4 = sub_35320();
  uint64_t v6 = v5;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v8);
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = v6;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)a1);
  return v2;
}

char *sub_FF68()
{
  uint64_t v1 = v0;
  long long v17 = xmmword_36CF0;
  uint64_t v2 = sub_359E0();
  swift_allocObject();
  uint64_t v3 = sub_359D0();
  uint64_t v19 = v2;
  uint64_t v20 = sub_112EC(&qword_41480, (void (*)(uint64_t))&type metadata accessor for PhoneCallFeatureExtractor);
  uint64_t v18 = v3;
  uint64_t v4 = sub_35CB0();
  sub_7DD0(v1 + 32, (uint64_t)v16);
  uint64_t v5 = sub_35CC0();
  uint64_t v22 = v4;
  uint64_t v23 = sub_112EC(&qword_41488, (void (*)(uint64_t))&type metadata accessor for PlusClientEventFeatureExtractor);
  uint64_t v21 = v5;
  uint64_t v6 = sub_35AD0();
  swift_allocObject();
  uint64_t v7 = sub_35AC0();
  uint64_t v25 = v6;
  uint64_t v26 = sub_112EC(&qword_41490, (void (*)(uint64_t))&type metadata accessor for SendMessageFeatureExtractor);
  uint64_t v24 = v7;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 32; i != 152; i += 40)
  {
    sub_8310((uint64_t)&v16[i + 40], (uint64_t)v16, &qword_41498);
    sub_3CB0((uint64_t)v16, (uint64_t)&v13, &qword_41498);
    if (v14)
    {
      sub_7998(&v13, (uint64_t)v15);
      sub_7998(v15, (uint64_t)&v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_2C844(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v11 = *((void *)v8 + 2);
      unint64_t v10 = *((void *)v8 + 3);
      if (v11 >= v10 >> 1) {
        uint64_t v8 = sub_2C844((char *)(v10 > 1), v11 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v11 + 1;
      sub_7998(&v13, (uint64_t)&v8[40 * v11 + 32]);
    }
    else
    {
      sub_8374((uint64_t)&v13, &qword_41498);
    }
  }
  sub_3C6C(&qword_41498);
  swift_arrayDestroy();
  return v8;
}

uint64_t sub_101FC()
{
  sub_3C6C(&qword_41458);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_37000;
  uint64_t v1 = sub_356B0();
  uint64_t v2 = sub_112EC(&qword_41460, (void (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruth);
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = sub_35910();
  uint64_t v4 = sub_112EC(&qword_41468, (void (*)(uint64_t))&type metadata accessor for ContactPromptGroundTruth);
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_355E0();
  uint64_t v6 = sub_112EC(&qword_41470, (void (*)(uint64_t))&type metadata accessor for MessagesGroundTruth);
  *(void *)(v0 + 64) = v5;
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = sub_35EA0();
  uint64_t v8 = sub_112EC(&qword_41478, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionOutcomeGroundTruth);
  *(void *)(v0 + 80) = v7;
  *(void *)(v0 + 88) = v8;
  return v0;
}

char *sub_10354()
{
  long long v14 = xmmword_36B20;
  uint64_t v0 = sub_35DF0();
  swift_allocObject();
  uint64_t v1 = sub_35DE0();
  v15[3] = v0;
  v15[4] = sub_112EC(&qword_41440, (void (*)(uint64_t))&type metadata accessor for INStartCallIntentFeatureExtractor);
  v15[0] = v1;
  uint64_t v2 = sub_35EC0();
  swift_allocObject();
  uint64_t v3 = sub_35EB0();
  v16[3] = v2;
  v16[4] = sub_112EC(&qword_41448, (void (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor);
  v16[0] = v3;
  sub_8310((uint64_t)v15, (uint64_t)v13, &qword_41450);
  sub_3CB0((uint64_t)v13, (uint64_t)&v10, &qword_41450);
  if (v11)
  {
    sub_7998(&v10, (uint64_t)v12);
    sub_7998(v12, (uint64_t)&v10);
    uint64_t v4 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_2C858(0, _swiftEmptyArrayStorage[2] + 1, 1, (char *)_swiftEmptyArrayStorage);
    }
    unint64_t v6 = *((void *)v4 + 2);
    unint64_t v5 = *((void *)v4 + 3);
    if (v6 >= v5 >> 1) {
      uint64_t v4 = sub_2C858((char *)(v5 > 1), v6 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v6 + 1;
    sub_7998(&v10, (uint64_t)&v4[40 * v6 + 32]);
  }
  else
  {
    sub_8374((uint64_t)&v10, &qword_41450);
    uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  }
  sub_8310((uint64_t)v16, (uint64_t)v13, &qword_41450);
  sub_3CB0((uint64_t)v13, (uint64_t)&v10, &qword_41450);
  if (v11)
  {
    sub_7998(&v10, (uint64_t)v12);
    sub_7998(v12, (uint64_t)&v10);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_2C858(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v8 = *((void *)v4 + 2);
    unint64_t v7 = *((void *)v4 + 3);
    if (v8 >= v7 >> 1) {
      uint64_t v4 = sub_2C858((char *)(v7 > 1), v8 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v8 + 1;
    sub_7998(&v10, (uint64_t)&v4[40 * v8 + 32]);
  }
  else
  {
    sub_8374((uint64_t)&v10, &qword_41450);
  }
  sub_3C6C(&qword_41450);
  swift_arrayDestroy();
  return v4;
}

uint64_t sub_1063C()
{
  sub_3C6C(&qword_41018);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_37010;
  sub_35900();
  swift_allocObject();
  *(void *)(v0 + 32) = sub_358F0();
  sub_35A00();
  swift_allocObject();
  *(void *)(v0 + 40) = sub_359F0();
  sub_36280();
  return v0;
}

char *sub_106D8()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = v0 + 4;
  sub_7E34(v0 + 4, v0[7]);
  sub_35360();
  sub_357A0();
  swift_allocObject();
  uint64_t v3 = sub_35790();
  sub_7E34(v0 + 4, v0[7]);
  sub_35330();
  long long v22 = xmmword_37000;
  sub_7E34(v0 + 4, v0[7]);
  sub_35370();
  uint64_t v4 = v0[9];
  uint64_t v5 = type metadata accessor for PhoneCallContactGroundTruthGenerator();
  unint64_t v6 = (void *)swift_allocObject();
  swift_retain();
  swift_retain();
  unint64_t v7 = (char *)_swiftEmptyArrayStorage;
  v6[8] = sub_6A08((uint64_t)_swiftEmptyArrayStorage);
  sub_7998(&v18, (uint64_t)(v6 + 2));
  v6[7] = v4;
  v6[9] = v3;
  uint64_t v24 = v5;
  uint64_t v25 = sub_112EC(&qword_41420, (void (*)(uint64_t))type metadata accessor for PhoneCallContactGroundTruthGenerator);
  uint64_t v23 = v6;
  sub_7E34(v27, v27[3]);
  uint64_t v8 = sub_352F0();
  uint64_t v19 = sub_34F40();
  uint64_t v20 = &protocol witness table for AnyFeature;
  *(void *)&long long v18 = v8;
  LOBYTE(v5) = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v18);
  sub_2AC9C(v5 & 1, 0xD00000000000002BLL, 0x8000000000038400, v1, (uint64_t)v26);
  sub_7E34(v2, *(void *)(v1 + 56));
  sub_35370();
  uint64_t v9 = type metadata accessor for MessagesContactGroundTruthGenerator();
  uint64_t v10 = swift_allocObject();
  swift_retain();
  *(void *)(v10 + 64) = sub_6A08((uint64_t)_swiftEmptyArrayStorage);
  sub_7998(&v18, v10 + 16);
  *(void *)(v10 + 56) = v4;
  v26[8] = v9;
  v26[9] = sub_112EC(&qword_41428, (void (*)(uint64_t))type metadata accessor for MessagesContactGroundTruthGenerator);
  v26[5] = v10;
  sub_35FC0();
  swift_allocObject();
  *(void *)&long long v18 = sub_35FB0();
  sub_112EC(&qword_41430, (void (*)(uint64_t))&type metadata accessor for MessagesContactPartialRepetitionDefinition);
  sub_35AB0();
  swift_release();
  for (uint64_t i = 32; i != 192; i += 40)
  {
    sub_8310((uint64_t)&v21[i], (uint64_t)&v18, &qword_41438);
    sub_3CB0((uint64_t)&v18, (uint64_t)&v15, &qword_41438);
    if (v16)
    {
      sub_7998(&v15, (uint64_t)v17);
      sub_7998(v17, (uint64_t)&v15);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v7 = sub_2C86C(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v13 = *((void *)v7 + 2);
      unint64_t v12 = *((void *)v7 + 3);
      if (v13 >= v12 >> 1) {
        unint64_t v7 = sub_2C86C((char *)(v12 > 1), v13 + 1, 1, v7);
      }
      *((void *)v7 + 2) = v13 + 1;
      sub_7998(&v15, (uint64_t)&v7[40 * v13 + 32]);
    }
    else
    {
      sub_8374((uint64_t)&v15, &qword_41438);
    }
  }
  swift_release();
  sub_3C6C(&qword_41438);
  swift_arrayDestroy();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v27);
  return v7;
}

uint64_t sub_10B18()
{
  return sub_36090();
}

uint64_t sub_10B3C(void *a1)
{
  sub_7E34((void *)(v1 + 32), *(void *)(v1 + 56));
  sub_35330();
  uint64_t v3 = a1[3];
  sub_7E34(a1, v3);
  LOBYTE(a1) = sub_10C44(v3);
  sub_7DD0((uint64_t)v9, (uint64_t)v8);
  if (a1)
  {
    sub_7E34(v8, v8[3]);
    uint64_t v4 = sub_352F0();
    v7[3] = sub_34F40();
    v7[4] = &protocol witness table for AnyFeature;
    v7[0] = v4;
    char v5 = sub_34FD0();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v9);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v7);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v8);
    if ((v5 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v9);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v8);
  }
  return 1;
}

uint64_t sub_10C44(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_35A10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v39 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_3C6C(&qword_41400);
  uint64_t v7 = __chkstk_darwin(v41);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 - 8);
  __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_3C6C(&qword_41408);
  __chkstk_darwin(v13 - 8);
  long long v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_3C6C(&qword_41410);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v40 = (uint64_t)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v38 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v38 - v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v2, a1);
  uint64_t v24 = sub_356B0();
  int v25 = swift_dynamicCast();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  if (v25)
  {
    uint64_t v27 = *(void *)(v24 - 8);
    v26(v15, 0, 1, v24);
    sub_356A0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v24);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v28(v23, 0, 1, v4);
  }
  else
  {
    v26(v15, 1, 1, v24);
    sub_8374((uint64_t)v15, &qword_41408);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v28(v23, 1, 1, v4);
  }
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v21, enum case for PhoneCallGroundTruthSource.restatementAndSuccessfulPhoneCall(_:), v4);
  v28(v21, 0, 1, v4);
  uint64_t v29 = (uint64_t)&v9[*(int *)(v41 + 48)];
  unint64_t v30 = &qword_41410;
  sub_8310((uint64_t)v23, (uint64_t)v9, &qword_41410);
  sub_8310((uint64_t)v21, v29, &qword_41410);
  unint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v31((uint64_t)v9, 1, v4) == 1)
  {
    sub_8374((uint64_t)v21, &qword_41410);
    sub_8374((uint64_t)v23, &qword_41410);
    if (v31(v29, 1, v4) == 1)
    {
      char v32 = -1;
    }
    else
    {
      unint64_t v30 = &qword_41400;
      char v32 = 0;
    }
  }
  else
  {
    uint64_t v33 = v40;
    sub_8310((uint64_t)v9, v40, &qword_41410);
    if (v31(v29, 1, v4) == 1)
    {
      sub_8374((uint64_t)v21, &qword_41410);
      sub_8374((uint64_t)v23, &qword_41410);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v33, v4);
      char v32 = 0;
      unint64_t v30 = &qword_41400;
    }
    else
    {
      uint64_t v34 = v33;
      int v35 = v39;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v39, v29, v4);
      sub_112EC(&qword_41418, (void (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruthSource);
      char v32 = sub_361F0();
      uint64_t v36 = *(void (**)(char *, uint64_t))(v5 + 8);
      v36(v35, v4);
      unint64_t v30 = &qword_41410;
      sub_8374((uint64_t)v21, &qword_41410);
      sub_8374((uint64_t)v23, &qword_41410);
      v36((char *)v34, v4);
    }
  }
  sub_8374((uint64_t)v9, v30);
  return v32 & 1;
}

uint64_t sub_111F8()
{
  sub_3C6C(&qword_413F8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_36D00;
  uint64_t v1 = sub_35BB0();
  swift_allocObject();
  uint64_t v2 = sub_35BA0();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = &protocol witness table for FirstPartyEventStreamProcessor;
  *(void *)(v0 + 32) = v2;
  return v0;
}

uint64_t sub_11278()
{
  return swift_release();
}

uint64_t sub_11280()
{
  swift_bridgeObjectRelease();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 32);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactsInferenceDomain()
{
  return self;
}

uint64_t sub_112EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_11334(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_364F0())
  {
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = v4 - 4;
      if ((a1 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v6 = sub_36470();
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1)) {
        goto LABEL_29;
      }
LABEL_11:
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v6 + 120))();
      swift_release();
      uint64_t v9 = *(void *)(v8 + 16);
      int64_t v10 = *((void *)v3 + 2);
      int64_t v11 = v10 + v9;
      if (__OFADD__(v10, v9)) {
        goto LABEL_30;
      }
      uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && v11 <= *((void *)v3 + 3) >> 1)
      {
        if (*(void *)(v8 + 16)) {
          goto LABEL_20;
        }
      }
      else
      {
        if (v10 <= v11) {
          int64_t v13 = v10 + v9;
        }
        else {
          int64_t v13 = v10;
        }
        uint64_t v3 = sub_2C2E0(isUniquelyReferenced_nonNull_native, v13, 1, v3);
        if (*(void *)(v8 + 16))
        {
LABEL_20:
          uint64_t v14 = *((void *)v3 + 2);
          if ((*((void *)v3 + 3) >> 1) - v14 < v9) {
            goto LABEL_32;
          }
          long long v15 = &v3[16 * v14 + 32];
          if (v8 + 32 < (unint64_t)&v15[16 * v9] && (unint64_t)v15 < v8 + 32 + 16 * v9)
          {
            uint64_t result = sub_36530();
            __break(1u);
            return result;
          }
          memcpy(v15, (const void *)(v8 + 32), 16 * v9);
          if (v9)
          {
            uint64_t v17 = *((void *)v3 + 2);
            BOOL v18 = __OFADD__(v17, v9);
            uint64_t v19 = v17 + v9;
            if (v18) {
              goto LABEL_33;
            }
            *((void *)v3 + 2) = v19;
          }
          goto LABEL_5;
        }
      }
      if (v9) {
        goto LABEL_31;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      ++v4;
      if (v7 == v2) {
        goto LABEL_36;
      }
    }
    uint64_t v6 = *(void *)(a1 + 8 * v4);
    swift_retain();
    uint64_t v7 = v4 - 3;
    if (!__OFADD__(v5, 1)) {
      goto LABEL_11;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_36:
  swift_bridgeObjectRelease();
  return (uint64_t)v3;
}

char *sub_11578(void (*a1)(uint64_t *__return_ptr, long long *), uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *(void *)(a3 + 16);
  if (!v20) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    long long v22 = *(_OWORD *)(a3 + 16 * v5 + 32);
    a1(&v23, &v22);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v6;
    }
    uint64_t v7 = v23;
    uint64_t v8 = *(void *)(v23 + 16);
    int64_t v9 = *((void *)v6 + 2);
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v10 <= *((void *)v6 + 3) >> 1)
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
      uint64_t v6 = sub_2C2CC(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        uint64_t v13 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v13 < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[40 * v13 + 32];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_3C6C(&qword_40FB0);
        swift_arrayInitWithCopy();
        if (v8)
        {
          uint64_t v16 = *((void *)v6 + 2);
          BOOL v17 = __OFADD__(v16, v8);
          uint64_t v18 = v16 + v8;
          if (v17) {
            goto LABEL_31;
          }
          *((void *)v6 + 2) = v18;
        }
        goto LABEL_4;
      }
    }
    if (v8) {
      goto LABEL_29;
    }
LABEL_4:
    ++v5;
    swift_bridgeObjectRelease();
    if (v20 == v5)
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
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

char *sub_1178C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v3 = *(void *)(sub_35660() - 8);
  uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v5 = *(void *)(v3 + 72);
  swift_bridgeObjectRetain();
  uint64_t v6 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v7 = sub_35630();
    uint64_t v8 = *(void *)(v7 + 16);
    int64_t v9 = *((void *)v6 + 2);
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    uint64_t v11 = v7;
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v10 <= *((void *)v6 + 3) >> 1)
    {
      if (*(void *)(v11 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v9 <= v10) {
        int64_t v13 = v9 + v8;
      }
      else {
        int64_t v13 = v9;
      }
      uint64_t v6 = sub_2C2CC(isUniquelyReferenced_nonNull_native, v13, 1, v6);
      if (*(void *)(v11 + 16))
      {
LABEL_14:
        uint64_t v14 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v14 < v8) {
          goto LABEL_28;
        }
        unint64_t v15 = (unint64_t)&v6[40 * v14 + 32];
        if (v11 + 32 < v15 + 40 * v8 && v15 < v11 + 32 + 40 * v8) {
          goto LABEL_30;
        }
        sub_3C6C(&qword_40FB0);
        swift_arrayInitWithCopy();
        if (v8)
        {
          uint64_t v17 = *((void *)v6 + 2);
          BOOL v18 = __OFADD__(v17, v8);
          uint64_t v19 = v17 + v8;
          if (v18) {
            goto LABEL_29;
          }
          *((void *)v6 + 2) = v19;
        }
        goto LABEL_4;
      }
    }
    if (v8) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v4 += v5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_119B4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_364F0())
  {
    uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      uint64_t v5 = v4 - 4;
      if ((a1 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v6 = sub_36470();
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1)) {
        goto LABEL_29;
      }
LABEL_11:
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v6 + 168))();
      swift_release();
      uint64_t v9 = *(void *)(v8 + 16);
      int64_t v10 = *((void *)v3 + 2);
      int64_t v11 = v10 + v9;
      if (__OFADD__(v10, v9)) {
        goto LABEL_30;
      }
      uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && v11 <= *((void *)v3 + 3) >> 1)
      {
        if (*(void *)(v8 + 16)) {
          goto LABEL_20;
        }
      }
      else
      {
        if (v10 <= v11) {
          int64_t v13 = v10 + v9;
        }
        else {
          int64_t v13 = v10;
        }
        uint64_t v3 = sub_2C880(isUniquelyReferenced_nonNull_native, v13, 1, v3);
        if (*(void *)(v8 + 16))
        {
LABEL_20:
          uint64_t v14 = *((void *)v3 + 2);
          if ((*((void *)v3 + 3) >> 1) - v14 < v9) {
            goto LABEL_32;
          }
          unint64_t v15 = (unint64_t)&v3[40 * v14 + 32];
          if (v8 + 32 < v15 + 40 * v9 && v15 < v8 + 32 + 40 * v9)
          {
            uint64_t result = sub_36530();
            __break(1u);
            return result;
          }
          sub_3C6C(&qword_417E0);
          swift_arrayInitWithCopy();
          if (v9)
          {
            uint64_t v17 = *((void *)v3 + 2);
            BOOL v18 = __OFADD__(v17, v9);
            uint64_t v19 = v17 + v9;
            if (v18) {
              goto LABEL_33;
            }
            *((void *)v3 + 2) = v19;
          }
          goto LABEL_5;
        }
      }
      if (v9) {
        goto LABEL_31;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      ++v4;
      if (v7 == v2) {
        goto LABEL_36;
      }
    }
    uint64_t v6 = *(void *)(a1 + 8 * v4);
    swift_retain();
    uint64_t v7 = v4 - 3;
    if (!__OFADD__(v5, 1)) {
      goto LABEL_11;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
  }
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_36:
  swift_bridgeObjectRelease();
  return (uint64_t)v3;
}

char *sub_11C1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    sub_7E34(v2, v2[3]);
    uint64_t v4 = sub_35160();
    uint64_t v5 = *(void *)(v4 + 16);
    int64_t v6 = *((void *)v3 + 2);
    int64_t v7 = v6 + v5;
    if (__OFADD__(v6, v5)) {
      break;
    }
    uint64_t v8 = v4;
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v7 <= *((void *)v3 + 3) >> 1)
    {
      if (*(void *)(v8 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v6 <= v7) {
        int64_t v10 = v6 + v5;
      }
      else {
        int64_t v10 = v6;
      }
      uint64_t v3 = sub_2C894(isUniquelyReferenced_nonNull_native, v10, 1, v3);
      if (*(void *)(v8 + 16))
      {
LABEL_14:
        uint64_t v11 = *((void *)v3 + 2);
        if ((*((void *)v3 + 3) >> 1) - v11 < v5) {
          goto LABEL_28;
        }
        int64_t v12 = &v3[8 * v11 + 32];
        if (v8 + 32 < (unint64_t)&v12[8 * v5] && (unint64_t)v12 < v8 + 32 + 8 * v5) {
          goto LABEL_30;
        }
        memcpy(v12, (const void *)(v8 + 32), 8 * v5);
        if (v5)
        {
          uint64_t v14 = *((void *)v3 + 2);
          BOOL v15 = __OFADD__(v14, v5);
          uint64_t v16 = v14 + v5;
          if (v15) {
            goto LABEL_29;
          }
          *((void *)v3 + 2) = v16;
        }
        goto LABEL_4;
      }
    }
    if (v5) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

char *sub_11DDC(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = a3 + 32;
  swift_bridgeObjectRetain();
  int64_t v6 = (char *)_swiftEmptyArrayStorage;
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
    int64_t v9 = *((void *)v6 + 2);
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v10 <= *((void *)v6 + 3) >> 1)
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
      int64_t v6 = sub_2C9F8(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        uint64_t v13 = *((void *)v6 + 2);
        if ((*((void *)v6 + 3) >> 1) - v13 < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[40 * v13 + 32];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_3C6C(&qword_416E0);
        swift_arrayInitWithCopy();
        if (v8)
        {
          uint64_t v16 = *((void *)v6 + 2);
          BOOL v17 = __OFADD__(v16, v8);
          uint64_t v18 = v16 + v8;
          if (v17) {
            goto LABEL_31;
          }
          *((void *)v6 + 2) = v18;
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
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

char *sub_11FDC(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = a3;
  if (a3 >> 62) {
    goto LABEL_37;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_364F0())
  {
    unint64_t v26 = v5 & 0xC000000000000001;
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v8 = 4;
    uint64_t v25 = v5;
    while (1)
    {
      uint64_t v10 = v8 - 4;
      if (!v26) {
        break;
      }
      uint64_t v11 = sub_36470();
      uint64_t v5 = v8 - 3;
      if (__OFADD__(v10, 1)) {
        goto LABEL_32;
      }
LABEL_11:
      uint64_t v29 = v11;
      a1(&v28, &v29);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return v7;
      }
      swift_release();
      uint64_t v12 = v28;
      uint64_t v13 = *(void *)(v28 + 16);
      int64_t v14 = *((void *)v7 + 2);
      int64_t v15 = v14 + v13;
      if (__OFADD__(v14, v13)) {
        goto LABEL_33;
      }
      uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && v15 <= *((void *)v7 + 3) >> 1)
      {
        if (*(void *)(v12 + 16)) {
          goto LABEL_21;
        }
      }
      else
      {
        if (v14 <= v15) {
          int64_t v17 = v14 + v13;
        }
        else {
          int64_t v17 = v14;
        }
        uint64_t v7 = sub_2CA54(isUniquelyReferenced_nonNull_native, v17, 1, v7);
        if (*(void *)(v12 + 16))
        {
LABEL_21:
          uint64_t v18 = *((void *)v7 + 2);
          if ((*((void *)v7 + 3) >> 1) - v18 < v13) {
            goto LABEL_35;
          }
          unint64_t v19 = (unint64_t)&v7[40 * v18 + 32];
          if (v12 + 32 < v19 + 40 * v13 && v19 < v12 + 32 + 40 * v13)
          {
            uint64_t result = (char *)sub_36530();
            __break(1u);
            return result;
          }
          sub_3C6C(&qword_416C8);
          swift_arrayInitWithCopy();
          if (v13)
          {
            uint64_t v21 = *((void *)v7 + 2);
            BOOL v22 = __OFADD__(v21, v13);
            uint64_t v23 = v21 + v13;
            if (v22) {
              goto LABEL_36;
            }
            *((void *)v7 + 2) = v23;
          }
          goto LABEL_5;
        }
      }
      if (v13) {
        goto LABEL_34;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      ++v8;
      BOOL v9 = v5 == v6;
      uint64_t v5 = v25;
      if (v9)
      {
        swift_bridgeObjectRelease();
        return v7;
      }
    }
    uint64_t v11 = *(void *)(v5 + 8 * v8);
    swift_retain();
    uint64_t v5 = v8 - 3;
    if (!__OFADD__(v10, 1)) {
      goto LABEL_11;
    }
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (char *)&_swiftEmptyArrayStorage;
}

void sub_12280(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_12298(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_122A4(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_122B0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    uint64_t v6 = a3 + 32;
    uint64_t v7 = qword_40C28;
    swift_bridgeObjectRetain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_361C0();
    do
    {
      sub_7900(v8, (uint64_t)qword_412D8);
      sub_7DD0(v6, (uint64_t)v22);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_361A0();
      os_log_type_t v13 = sub_36360();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v9 = swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v9 + 4) = sub_2F52C(a1, a2, &v21);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v9 + 12) = 2080;
        sub_7DD0((uint64_t)v22, (uint64_t)v20);
        sub_3C6C(a4);
        uint64_t v10 = sub_36220();
        *(void *)(v9 + 14) = sub_2F52C(v10, v11, &v21);
        swift_bridgeObjectRelease();
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v22);
        _os_log_impl(&dword_0, v12, v13, "%s%s", (uint8_t *)v9, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v22);
        swift_bridgeObjectRelease_n();
      }
      v6 += 40;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_40C28 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_361C0();
    sub_7900(v14, (uint64_t)qword_412D8);
    swift_bridgeObjectRetain_n();
    int64_t v15 = sub_361A0();
    os_log_type_t v16 = sub_36360();
    if (os_log_type_enabled(v15, v16))
    {
      int64_t v17 = (uint8_t *)swift_slowAlloc();
      v22[0] = swift_slowAlloc();
      *(_DWORD *)int64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      v20[0] = sub_2F52C(a1, a2, v22);
      sub_363D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v15, v16, "%s<Empty>", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1264C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_12664(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_1267C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v36 = a1;
  uint64_t v6 = a4(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  int v35 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = *(void *)(a3 + 16);
  if (v11)
  {
    uint64_t v38 = (char *)v31 - v10;
    uint64_t v12 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v13 = qword_40C28;
    v31[0] = a3;
    swift_bridgeObjectRetain();
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v14 = *(void *)(v7 + 72);
    uint64_t v15 = sub_361C0();
    os_log_type_t v16 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v37 = (void (**)(char *, uint64_t))(v7 + 8);
    *(void *)&long long v17 = 136315394;
    long long v32 = v17;
    v31[1] = (char *)&type metadata for Any + 8;
    uint64_t v18 = v38;
    uint64_t v39 = (void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v33 = v15;
    uint64_t v34 = v14;
    do
    {
      sub_7900(v15, (uint64_t)qword_412D8);
      uint64_t v23 = *v16;
      (*v16)(v18, v12, v6);
      swift_bridgeObjectRetain_n();
      uint64_t v24 = sub_361A0();
      os_log_type_t v25 = sub_36360();
      if (os_log_type_enabled(v24, v25))
      {
        unint64_t v19 = a2;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = v32;
        swift_bridgeObjectRetain();
        *(void *)(v20 + 4) = sub_2F52C(v36, v19, &v41);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v20 + 12) = 2080;
        v23(v35, (uint64_t)v38, v6);
        uint64_t v18 = v38;
        uint64_t v21 = sub_36220();
        *(void *)(v20 + 14) = sub_2F52C(v21, v22, &v41);
        swift_bridgeObjectRelease();
        (*v37)(v18, v6);
        _os_log_impl(&dword_0, v24, v25, "%s%s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        uint64_t v14 = v34;
        swift_slowDealloc();
        a2 = v19;
        uint64_t v15 = v33;
        swift_slowDealloc();
      }
      else
      {

        (*v37)(v18, v6);
        swift_bridgeObjectRelease_n();
      }
      v12 += v14;
      --v11;
      os_log_type_t v16 = v39;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_40C28 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_361C0();
    sub_7900(v26, (uint64_t)qword_412D8);
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_361A0();
    os_log_type_t v28 = sub_36360();
    if (os_log_type_enabled(v27, v28))
    {
      unint64_t v29 = a2;
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(_DWORD *)unint64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_2F52C(v36, v29, &v41);
      sub_363D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v27, v28, "%s<Empty>", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_12B48()
{
  type metadata accessor for SiriPrivateLearningInferenceEngine();
  sub_3C6C(&qword_41708);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_414A0 = 91;
  qword_414A8 = 0xE100000000000000;
}

void sub_12BCC(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  sub_7DD0(a2, (uint64_t)v22);
  uint64_t v5 = (*(uint64_t (**)(uint64_t *))(v4 + 96))(v22);
  if ((*(uint64_t (**)(void))(*(void *)v5 + 104))())
  {
    if (qword_40C38 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_361C0();
    sub_7900(v6, (uint64_t)qword_414B0);
    uint64_t v7 = sub_361A0();
    os_log_type_t v8 = sub_36380();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      v22[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315394;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v11 = qword_414A0;
      unint64_t v10 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2F52C(v11, v10, v22);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      uint64_t v23 = v4;
      sub_3C6C(&qword_41800);
      uint64_t v12 = sub_36220();
      uint64_t v23 = sub_2F52C(v12, v13, v22);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v7, v8, "%s     - %s (enabled)", (uint8_t *)v9, 0x16u);
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
    if (qword_40C38 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_361C0();
    sub_7900(v14, (uint64_t)qword_414B0);
    uint64_t v15 = sub_361A0();
    os_log_type_t v16 = sub_36380();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      v22[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v19 = qword_414A0;
      unint64_t v18 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_2F52C(v19, v18, v22);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v23 = v4;
      sub_3C6C(&qword_41800);
      uint64_t v20 = sub_36220();
      uint64_t v23 = sub_2F52C(v20, v21, v22);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v15, v16, "%s     - %s (disabled)", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_release();
      uint64_t v5 = 0;
    }
    else
    {

      swift_release();
      uint64_t v5 = 0;
    }
  }
  *a3 = v5;
}

uint64_t sub_13048()
{
  uint64_t v1 = sub_360D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  __chkstk_darwin();
  uint64_t v26 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_35DD0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  uint64_t v25 = v5;
  __chkstk_darwin();
  uint64_t v23 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_35C40();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_35480();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v0;
  uint64_t v15 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  v15(v14, enum case for EventStreamType.nowPlayingStream(_:), v11);
  sub_7DD0(v0 + 144, (uint64_t)v29);
  sub_35C30();
  sub_35440();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  os_log_type_t v16 = *(void (**)(char *, uint64_t))(v12 + 8);
  v16(v14, v11);
  v15(v14, enum case for EventStreamType.playMediaIntentStream(_:), v11);
  sub_7DD0(v22 + 104, (uint64_t)v29);
  uint64_t v17 = v23;
  sub_35DC0();
  uint64_t v18 = v24;
  sub_35440();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v17, v18);
  v16(v14, v11);
  v15(v14, enum case for EventStreamType.playMediaIntentStreamWithAttachedNowPlayingEvents(_:), v11);
  swift_retain();
  uint64_t v19 = v26;
  sub_360C0();
  uint64_t v20 = v27;
  sub_35440();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v20);
  return ((uint64_t (*)(char *, uint64_t))v16)(v14, v11);
}

uint64_t sub_1340C()
{
  v1[99] = v0;
  sub_3C6C(&qword_417F0);
  v1[100] = swift_task_alloc();
  uint64_t v2 = sub_34E90();
  v1[101] = v2;
  v1[102] = *(void *)(v2 - 8);
  v1[103] = swift_task_alloc();
  uint64_t v3 = sub_35660();
  v1[104] = v3;
  v1[105] = *(void *)(v3 - 8);
  v1[106] = swift_task_alloc();
  v1[107] = swift_task_alloc();
  v1[108] = swift_task_alloc();
  return _swift_task_switch(sub_13574, 0, 0);
}

uint64_t sub_13574()
{
  uint64_t v11 = v0;
  if (qword_40C38 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_361C0();
  v0[109] = v1;
  v0[110] = sub_7900(v1, (uint64_t)qword_414B0);
  uint64_t v2 = sub_361A0();
  os_log_type_t v3 = sub_36350();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    if (qword_40C30 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_414A0;
    unint64_t v6 = qword_414A8;
    swift_bridgeObjectRetain();
    v0[98] = sub_2F52C(v5, v6, &v10);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v2, v3, "%s run() starting", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v0[111] = *(void *)(v0[99] + 240);
  sub_35820();
  uint64_t v9 = (uint64_t (*)(char))((char *)&dword_41858 + dword_41858);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[112] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_137D4;
  return v9(1);
}

uint64_t sub_137D4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 904) = a1;
  *(void *)(v3 + 912) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1) {
    uint64_t v4 = sub_153A8;
  }
  else {
    uint64_t v4 = sub_13914;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_13914()
{
  v194 = v0;
  v153 = v0 + 95;
  uint64_t v1 = v0[113];
  uint64_t v152 = v1;
  uint64_t v177 = *(void *)(v1 + 16);
  if (v177)
  {
    uint64_t v2 = (uint64_t)(v0 + 2);
    v165 = v0 + 7;
    uint64_t v3 = (uint64_t)(v0 + 87);
    uint64_t v4 = v0[105];
    uint64_t v161 = v0[99];
    uint64_t v6 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    v4 += 16;
    uint64_t v5 = v6;
    unint64_t v174 = v1 + ((*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64));
    uint64_t v172 = *(void *)(v4 + 56);
    v183 = (void (**)(uint64_t, uint64_t))(v4 - 8);
    v154 = (void (**)(uint64_t, uint64_t))(v0[102] + 8);
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    v163 = v0 + 87;
    v169 = v6;
    while (1)
    {
      uint64_t v186 = v7;
      v5(v0[108], v174 + v7 * v172, v0[104]);
      uint64_t v11 = *(void *)(sub_35630() + 16);
      swift_bridgeObjectRelease();
      uint64_t v12 = v0[108];
      uint64_t v13 = v0[104];
      if (v11)
      {
        v5(v0[107], v12, v13);
        uint64_t v14 = sub_361A0();
        os_log_type_t v15 = sub_36360();
        if (os_log_type_enabled(v14, v15))
        {
          log = v14;
          os_log_type_t v179 = v15;
          uint64_t v16 = swift_slowAlloc();
          v193[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v16 = 136315394;
          if (qword_40C30 != -1) {
            swift_once();
          }
          uint64_t v17 = v0[107];
          uint64_t v18 = v0[103];
          uint64_t v155 = v0[101];
          uint64_t v156 = v0[104];
          uint64_t v19 = qword_414A0;
          unint64_t v20 = qword_414A8;
          swift_bridgeObjectRetain();
          v0[96] = sub_2F52C(v19, v20, v193);
          sub_363D0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v16 + 12) = 2080;
          sub_35640();
          uint64_t v21 = sub_34E70();
          unint64_t v23 = v22;
          (*v154)(v18, v155);
          v0[97] = sub_2F52C(v21, v23, v193);
          sub_363D0();
          swift_bridgeObjectRelease();
          uint64_t v24 = *v183;
          (*v183)(v17, v156);
          uint64_t v14 = log;
          _os_log_impl(&dword_0, log, v179, "%s Persisting new ground truth for Session ID=%s", (uint8_t *)v16, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          uint64_t v24 = *v183;
          (*v183)(v0[107], v0[104]);
        }

        uint64_t v36 = sub_35630();
        uint64_t v37 = *(void *)(v36 + 16);
        v180 = v24;
        if (v37)
        {
          uint64_t v38 = v36 + 32;
          uint64_t v39 = qword_40C28;
          swift_bridgeObjectRetain();
          if (v39 != -1) {
            swift_once();
          }
          do
          {
            sub_7900(v0[109], (uint64_t)qword_412D8);
            sub_7DD0(v38, v2);
            uint64_t v40 = sub_361A0();
            os_log_type_t v41 = sub_36360();
            if (os_log_type_enabled(v40, v41))
            {
              uint64_t v42 = swift_slowAlloc();
              v193[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v42 = 136315394;
              *(void *)(v42 + 4) = sub_2F52C(8224, 0xE200000000000000, v193);
              *(_WORD *)(v42 + 12) = 2080;
              sub_7DD0(v2, v3);
              sub_3C6C(&qword_40FB0);
              uint64_t v43 = sub_36220();
              *(void *)(v42 + 14) = sub_2F52C(v43, v44, v193);
              swift_bridgeObjectRelease();
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
              _os_log_impl(&dword_0, v40, v41, "%s%s", (uint8_t *)v42, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
            }
            v38 += 40;
            --v37;
          }
          while (v37);
          swift_bridgeObjectRelease_n();
        }
        else
        {
          if (qword_40C28 != -1) {
            swift_once();
          }
          sub_7900(v0[109], (uint64_t)qword_412D8);
          uint64_t v45 = sub_361A0();
          os_log_type_t v46 = sub_36360();
          if (os_log_type_enabled(v45, v46))
          {
            uint64_t v47 = (uint8_t *)swift_slowAlloc();
            v193[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v47 = 136315138;
            uint64_t *v153 = sub_2F52C(8224, 0xE200000000000000, v193);
            sub_363D0();
            _os_log_impl(&dword_0, v45, v46, "%s<Empty>", v47, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v8 = v0[108];
        uint64_t v9 = v0[104];
        sub_7E34((void *)(v161 + 16), *(void *)(v161 + 40));
        sub_35340();
        sub_7E34(v165, v190[10]);
        v10._rawValue = (void *)sub_35630();
        sub_350D0(v10);
        swift_bridgeObjectRelease();
        v180(v8, v9);
        uint64_t v0 = v190;
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v165);
        uint64_t v3 = (uint64_t)v163;
      }
      else
      {
        v5(v0[106], v12, v13);
        uint64_t v25 = sub_361A0();
        os_log_type_t v26 = sub_36360();
        if (!os_log_type_enabled(v25, v26))
        {
          uint64_t v48 = v0[108];
          uint64_t v49 = v0[106];
          uint64_t v50 = v0[104];

          uint64_t v51 = (void (*)(uint64_t, os_log_t))*v183;
          (*v183)(v49, v50);
          v51(v48, (os_log_t)v50);
          goto LABEL_6;
        }
        uint64_t v27 = swift_slowAlloc();
        v193[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315394;
        if (qword_40C30 != -1) {
          swift_once();
        }
        uint64_t v167 = v0[108];
        uint64_t v28 = v0[106];
        os_log_t loga = (os_log_t)v0[104];
        uint64_t v29 = v0[103];
        uint64_t v157 = v0[101];
        uint64_t v30 = qword_414A0;
        unint64_t v31 = qword_414A8;
        swift_bridgeObjectRetain();
        *(void *)(v27 + 4) = sub_2F52C(v30, v31, v193);
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        sub_35640();
        uint64_t v32 = sub_34E70();
        unint64_t v34 = v33;
        (*v154)(v29, v157);
        *(void *)(v27 + 14) = sub_2F52C(v32, v34, v193);
        swift_bridgeObjectRelease();
        int v35 = (void (*)(uint64_t, os_log_t))*v183;
        (*v183)(v28, (uint64_t)loga);
        _os_log_impl(&dword_0, v25, v26, "%s Session ID=%s has no ground truth", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v35(v167, loga);
      }
      uint64_t v5 = v169;
LABEL_6:
      uint64_t v7 = v186 + 1;
      if (v186 + 1 == v177)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v0[113];
        break;
      }
    }
  }
  uint64_t v52 = v0 + 93;
  uint64_t v53 = sub_1178C(v1);
  if (*((void *)v53 + 2))
  {
    v187 = v0 + 94;
    uint64_t v170 = *((void *)v53 + 2);
    char v54 = v0 + 27;
    uint64_t v55 = v0[100];
    uint64_t v56 = v0[99];
    sub_35830();
    v164 = v0 + 12;
    sub_1ACE8(v0 + 12);
    v160 = (void *)(v56 + 16);
    uint64_t v162 = v56;
    sub_7E34((void *)(v56 + 16), *(void *)(v56 + 40));
    sub_35370();
    sub_7E34(v0 + 17, v0[20]);
    sub_35A20();
    uint64_t v57 = sub_35B10();
    uint64_t v58 = *(void *)(v57 - 8);
    int v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v55, 1, v57);
    uint64_t v60 = v0[100];
    if (v59 == 1)
    {
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 17));
      sub_8374(v60, &qword_417F0);
      unint64_t v61 = 0x8000000000038620;
      uint64_t v62 = 0xD00000000000001CLL;
    }
    else
    {
      uint64_t v62 = sub_35B00();
      unint64_t v61 = v68;
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v60, v57);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 17));
    }
    uint64_t v69 = v190[15];
    uint64_t v70 = v190[16];
    sub_7E34(v164, v69);
    v178 = v53;
    if (v62 == (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 8))(v69, v70) && v61 == v71)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v72 = sub_36570();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v72 & 1) == 0)
      {
        uint64_t v81 = v190 + 22;
        char v82 = sub_361A0();
        os_log_type_t v83 = sub_36360();
        if (os_log_type_enabled(v82, v83))
        {
          uint64_t v84 = (uint8_t *)swift_slowAlloc();
          v193[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v84 = 136315138;
          if (qword_40C30 != -1) {
            swift_once();
          }
          uint64_t v85 = qword_414A0;
          unint64_t v86 = qword_414A8;
          swift_bridgeObjectRetain();
          v190[92] = sub_2F52C(v85, v86, v193);
          sub_363D0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v82, v83, "%s Suggestion generator has been changed since the last run. Wiping the PICS store to maintain integrity.", v84, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }

        sub_7E34(v160, *(void *)(v162 + 40));
        sub_35370();
        v73 = v190;
        sub_7E34(v81, v190[25]);
        sub_35A30();
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v81);
        sub_7DD0((uint64_t)v164, (uint64_t)v54);
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v54);
LABEL_52:
        v87 = sub_361A0();
        os_log_type_t v88 = sub_36360();
        if (os_log_type_enabled(v87, v88))
        {
          v89 = (uint8_t *)swift_slowAlloc();
          v193[0] = swift_slowAlloc();
          *(_DWORD *)v89 = 136315138;
          if (qword_40C30 != -1) {
            swift_once();
          }
          uint64_t v90 = qword_414A0;
          unint64_t v91 = qword_414A8;
          swift_bridgeObjectRetain();
          uint64_t *v187 = sub_2F52C(v90, v91, v193);
          sub_363D0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_0, v87, v88, "%s Suggestion generation requires reloading old ground truth. Loading ground truth from store.", v89, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        uint64_t v92 = v190[99];
        sub_7E34(v160, *(void *)(v162 + 40));
        sub_35340();
        unint64_t v93 = *(void *)(v92 + 224);
        unint64_t v94 = swift_bridgeObjectRetain();
        uint64_t v95 = sub_11334(v94);
        swift_bridgeObjectRelease();
        uint64_t v96 = swift_task_alloc();
        *(void *)(v96 + 16) = v73 + 32;
        v97 = sub_11578((void (*)(uint64_t *__return_ptr, long long *))sub_285A8, v96, v95);
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        long long v98 = v97;
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v73 + 32));
        v192 = &_swiftEmptyArrayStorage;
        uint64_t v99 = *((void *)v97 + 2);
        swift_retain();
        uint64_t v181 = v99;
        if (!v99)
        {
          uint64_t v53 = (char *)&_swiftEmptyArrayStorage;
LABEL_86:
          swift_release();
          swift_bridgeObjectRelease();
          goto LABEL_87;
        }
        unint64_t v100 = 0;
        long long v101 = (long long *)(v190 + 37);
        uint64_t v188 = (uint64_t)(v190 + 52);
        v175 = v97 + 32;
        uint64_t v166 = (uint64_t)(v190 + 42);
        v168 = v97;
        while (1)
        {
          if (v100 >= *((void *)v98 + 2)) {
            goto LABEL_114;
          }
          sub_7DD0((uint64_t)&v175[40 * v100], (uint64_t)v101);
          unint64_t v191 = v100;
          if (v93 >> 62)
          {
            swift_bridgeObjectRetain_n();
            uint64_t v102 = sub_364F0();
            if (v102)
            {
LABEL_65:
              uint64_t v103 = 0;
              while (1)
              {
                if ((v93 & 0xC000000000000001) != 0)
                {
                  uint64_t v104 = sub_36470();
                  uint64_t v105 = v103 + 1;
                  if (__OFADD__(v103, 1)) {
                    goto LABEL_112;
                  }
                }
                else
                {
                  uint64_t v104 = *(void *)(v93 + 8 * v103 + 32);
                  swift_retain();
                  uint64_t v105 = v103 + 1;
                  if (__OFADD__(v103, 1))
                  {
LABEL_112:
                    __break(1u);
                    goto LABEL_113;
                  }
                }
                char v106 = (*(uint64_t (**)(long long *))(*(void *)v104 + 184))(v101);
                swift_release();
                if ((v106 & 1) == 0) {
                  break;
                }
                ++v103;
                if (v105 == v102) {
                  goto LABEL_73;
                }
              }
              swift_bridgeObjectRelease_n();
              sub_7DD0((uint64_t)v101, v166);
              v114 = sub_361A0();
              os_log_type_t v115 = sub_36360();
              if (os_log_type_enabled(v114, v115))
              {
                uint64_t v116 = swift_slowAlloc();
                v193[0] = swift_slowAlloc();
                *(_DWORD *)uint64_t v116 = 136315394;
                if (qword_40C30 != -1) {
                  swift_once();
                }
                uint64_t v118 = qword_414A0;
                unint64_t v117 = qword_414A8;
                swift_bridgeObjectRetain();
                *(void *)(v116 + 4) = sub_2F52C(v118, v117, v193);
                swift_bridgeObjectRelease();
                *(_WORD *)(v116 + 12) = 2080;
                sub_7DD0(v166, (uint64_t)(v190 + 47));
                sub_3C6C(&qword_40FB0);
                uint64_t v119 = sub_36220();
                *(void *)(v116 + 14) = sub_2F52C(v119, v120, v193);
                swift_bridgeObjectRelease();
                _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v166);
                _os_log_impl(&dword_0, v114, v115, "%s Ignoring %s", (uint8_t *)v116, 0x16u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();
              }
              else
              {
                _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v166);
              }
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v101);
              goto LABEL_61;
            }
          }
          else
          {
            uint64_t v102 = *(void *)((char *)&dword_10 + (v93 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain_n();
            if (v102) {
              goto LABEL_65;
            }
          }
LABEL_73:
          swift_bridgeObjectRelease_n();
          sub_7998(v101, v188);
          v107 = v192;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_31644(0, v107[2] + 1, 1);
            v107 = v192;
          }
          unint64_t v109 = v107[2];
          unint64_t v108 = v107[3];
          if (v109 >= v108 >> 1) {
            sub_31644(v108 > 1, v109 + 1, 1);
          }
          uint64_t v110 = v190[55];
          uint64_t v184 = v190[56];
          uint64_t v111 = sub_F638(v188, v110);
          uint64_t v112 = *(void *)(v110 - 8);
          uint64_t v113 = swift_task_alloc();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 16))(v113, v111, v110);
          sub_24CA0(v109, v113, (uint64_t *)&v192, v110, v184);
          _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v188);
          swift_task_dealloc();
          long long v98 = v168;
LABEL_61:
          unint64_t v100 = v191 + 1;
          if (v191 + 1 == v181)
          {
            uint64_t v53 = (char *)v192;
            goto LABEL_86;
          }
        }
      }
    }
    sub_7DD0((uint64_t)v164, (uint64_t)(v0 + 27));
    v73 = v190;
    uint64_t v74 = v190[30];
    uint64_t v75 = v190[31];
    sub_7E34(v54, v74);
    char v76 = (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 16))(v74, v75);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v54);
    if ((v76 & 1) == 0)
    {
      swift_bridgeObjectRetain();
LABEL_87:
      v121 = (long long *)(v190 + 67);
      uint64_t v122 = v190[15];
      uint64_t v123 = v190[16];
      LOBYTE(v64) = (_BYTE)v164;
      sub_7E34(v164, v122);
      unint64_t v124 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v123 + 24))(v53, v122, v123);
      unint64_t v126 = v125;
      swift_bridgeObjectRelease();
      unint64_t v185 = HIDWORD(v124);
      unint64_t v189 = v124;
      unsigned int v182 = v126;
      unint64_t v176 = HIDWORD(v126);
      sub_7E34(v160, *(void *)(v162 + 40));
      sub_35370();
      sub_7E34(v190 + 57, v190[60]);
      uint64_t v127 = v190[15];
      uint64_t v128 = v190[16];
      sub_7E34(v164, v127);
      (*(void (**)(uint64_t, uint64_t))(v128 + 8))(v127, v128);
      sub_35A40();
      swift_bridgeObjectRelease();
      v129 = v190;
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v190 + 57));
      sub_1B0E8((uint64_t)(v190 + 67));
      if (v190[70])
      {
        v130 = (long long *)(v190 + 72);
        uint64_t v131 = (uint64_t)(v190 + 77);
        v171 = v190 + 82;
        v173 = v190 + 62;
        sub_7998(v121, (uint64_t)(v190 + 62));
        sub_35840();
        v193[0] = (uint64_t)&_swiftEmptyArrayStorage;
        uint64_t v52 = (uint64_t *)v178;
        swift_bridgeObjectRetain();
        unint64_t v64 = 0;
        uint64_t v132 = (uint64_t)(v178 + 32);
        uint64_t v133 = v170;
        while (v64 < v52[2])
        {
          sub_7DD0(v132, (uint64_t)v130);
          uint64_t v134 = v129[75];
          sub_7E34(v130, v134);
          if (sub_2B2D8(v134))
          {
            sub_7998(v130, v131);
            uint64_t v135 = v193[0];
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_31644(0, *(void *)(v135 + 16) + 1, 1);
              uint64_t v135 = v193[0];
            }
            unint64_t v137 = *(void *)(v135 + 16);
            unint64_t v136 = *(void *)(v135 + 24);
            if (v137 >= v136 >> 1) {
              sub_31644(v136 > 1, v137 + 1, 1);
            }
            v129 = v190;
            uint64_t v138 = v190[80];
            uint64_t v139 = v190[81];
            uint64_t v140 = sub_F638(v131, v138);
            uint64_t v141 = *(void *)(v138 - 8);
            uint64_t v142 = swift_task_alloc();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 16))(v142, v140, v138);
            sub_24CA0(v137, v142, v193, v138, v139);
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v131);
            swift_task_dealloc();
            uint64_t v52 = (uint64_t *)v178;
            uint64_t v133 = v170;
            v130 = (long long *)(v190 + 72);
          }
          else
          {
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v130);
          }
          ++v64;
          v132 += 40;
          if (v133 == v64)
          {
            swift_bridgeObjectRelease();
            uint64_t v143 = v193[0];
            uint64_t v65 = v129[65];
            uint64_t v144 = v129[66];
            sub_7E34(v173, v65);
            uint64_t v145 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v144 + 24))(v143, v65, v144);
            unint64_t v63 = v146;
            swift_release();
            if (__CFADD__(v145, v189)) {
              goto LABEL_118;
            }
            if (__CFADD__(HIDWORD(v145), v185)) {
              goto LABEL_119;
            }
            if (__CFADD__(v63, v182)) {
              goto LABEL_120;
            }
            if (!__CFADD__(HIDWORD(v63), v176))
            {
              v182 += v63;
              LODWORD(v185) = HIDWORD(v145) + v185;
              unint64_t v176 = (HIDWORD(v63) + v176);
              sub_7E34(v160, *(void *)(v162 + 40));
              LOBYTE(v64) = (_BYTE)v190 - 112;
              sub_35380();
              sub_7E34(v171, v190[85]);
              uint64_t v147 = v190[65];
              uint64_t v148 = v190[66];
              sub_7E34(v173, v147);
              (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v147, v148);
              uint64_t v65 = (v145 + v189);
              sub_35970();
              swift_bridgeObjectRelease();
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v171);
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v173);
              goto LABEL_104;
            }
            goto LABEL_121;
          }
        }
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
        return sub_364E0();
      }
      sub_8374((uint64_t)v121, &qword_417F8);
      uint64_t v52 = (uint64_t *)v178;
      uint64_t v65 = v189;
LABEL_104:
      unint64_t v63 = *(void *)(v152 + 16);
      swift_bridgeObjectRelease();
      if (HIDWORD(v63)) {
        return sub_364E0();
      }
      unint64_t v149 = v52[2];
      swift_bridgeObjectRelease();
      if (HIDWORD(v149)) {
        return sub_364E0();
      }
      LODWORD(v77) = v65 + v63;
      if (__CFADD__(v65, v63))
      {
        __break(1u);
      }
      else
      {
        unint64_t v63 = (v185 + v149);
        if (!__CFADD__(v185, v149))
        {
          _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v164);
          sub_27F4C();
          unint64_t v78 = v63 << 32;
          unsigned int v79 = v182;
          unint64_t v80 = v176;
          goto LABEL_109;
        }
      }
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
      goto LABEL_122;
    }
    goto LABEL_52;
  }
  swift_bridgeObjectRelease();
  unint64_t v63 = sub_361A0();
  LOBYTE(v64) = sub_36360();
  if (os_log_type_enabled((os_log_t)v63, (os_log_type_t)v64))
  {
    uint64_t v65 = swift_slowAlloc();
    v193[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v65 = 136315138;
    if (qword_40C30 == -1)
    {
LABEL_36:
      uint64_t v66 = qword_414A0;
      unint64_t v67 = qword_414A8;
      swift_bridgeObjectRetain();
      *uint64_t v52 = sub_2F52C(v66, v67, v193);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, (os_log_t)v63, (os_log_type_t)v64, "%s No new ground truth generated", (uint8_t *)v65, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_45;
    }
LABEL_122:
    swift_once();
    goto LABEL_36;
  }

LABEL_45:
  unint64_t v77 = *(void *)(v152 + 16);
  swift_bridgeObjectRelease();
  if (HIDWORD(v77)) {
    return sub_364E0();
  }
  sub_27F4C();
  unint64_t v78 = 0;
  unsigned int v79 = 0;
  unint64_t v80 = 0;
LABEL_109:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v150 = (uint64_t (*)(unint64_t, unint64_t))v190[1];
  return v150(v78 | v77, v79 | (v80 << 32));
}

uint64_t sub_153A8()
{
  sub_27F4C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_15454()
{
  *(void *)(v1 + 120) = v0;
  return _swift_task_switch(sub_15474, 0, 0);
}

uint64_t sub_15474()
{
  sub_7DD0(*(void *)(v0 + 120) + 16, v0 + 72);
  type metadata accessor for DonationSourceProvider();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 128) = inited;
  sub_7998((long long *)(v0 + 72), inited + 16);
  unint64_t v2 = sub_34970();
  *(void *)(v0 + 136) = v2;
  char v3 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 184) = v3;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << v3;
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v2 + 64);
  if (v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = __clz(__rbit64(v6));
    uint64_t v9 = (v6 - 1) & v6;
LABEL_5:
    *(void *)(v0 + 144) = v7;
    *(void *)(v0 + 152) = v9;
    uint64_t v10 = *(void *)(*(void *)(v2 + 48) + 8 * v8);
    *(void *)(v0 + 160) = *(void *)(*(void *)(v2 + 56) + 8 * v8);
    uint64_t v11 = qword_40C38;
    swift_bridgeObjectRetain();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_361C0();
    sub_7900(v12, (uint64_t)qword_414B0);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_361A0();
    os_log_type_t v14 = sub_36360();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      *(void *)(v0 + 112) = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315394;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v16 = qword_414A0;
      unint64_t v17 = qword_414A8;
      swift_bridgeObjectRetain();
      *(void *)(v15 + 4) = sub_2F52C(v16, v17, (uint64_t *)(v0 + 112));
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      id v18 = (id)KVItemTypeName();
      uint64_t v19 = sub_36210();
      unint64_t v21 = v20;

      *(void *)(v15 + 14) = sub_2F52C(v19, v21, (uint64_t *)(v0 + 112));
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v13, v14, "%s Donating candidates with the type: %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_355B0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 168) = sub_355A0();
    unint64_t v31 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of KVSuggestionDonator.donateSuggestions(type:)
                                          + async function pointer to dispatch thunk of KVSuggestionDonator.donateSuggestions(type:));
    unint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v22;
    *unint64_t v22 = v0;
    v22[1] = sub_158EC;
    return v31(v10);
  }
  unint64_t v24 = 63 - v5;
  if (v24 > 0x7F)
  {
    unint64_t v25 = *(void *)(v2 + 72);
    if (v25)
    {
      uint64_t v7 = 1;
LABEL_18:
      uint64_t v9 = (v25 - 1) & v25;
      unint64_t v8 = __clz(__rbit64(v25)) + (v7 << 6);
      goto LABEL_5;
    }
    if (v24 >= 0xC0)
    {
      unint64_t v25 = *(void *)(v2 + 80);
      if (v25)
      {
        uint64_t v7 = 2;
        goto LABEL_18;
      }
      if (v24 >= 0x100)
      {
        unint64_t v25 = *(void *)(v2 + 88);
        if (v25)
        {
          uint64_t v7 = 3;
          goto LABEL_18;
        }
        if (v24 >= 0x140)
        {
          unint64_t v25 = *(void *)(v2 + 96);
          if (v25)
          {
            uint64_t v7 = 4;
            goto LABEL_18;
          }
          uint64_t v26 = 0;
          uint64_t v27 = v24 >> 6;
          if (v27 <= 5) {
            uint64_t v27 = 5;
          }
          uint64_t v28 = v27 - 5;
          while (v28 != v26)
          {
            unint64_t v25 = *(void *)(v2 + 104 + 8 * v26++);
            if (v25)
            {
              uint64_t v7 = v26 + 4;
              goto LABEL_18;
            }
          }
        }
      }
    }
  }
  uint64_t v29 = *(void *)(v0 + 128);
  swift_release();
  swift_setDeallocating();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v29 + 16);
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_158EC()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_15A04, 0, 0);
}

uint64_t sub_15A04()
{
  uint64_t result = swift_release();
  int64_t v2 = *(void *)(v0 + 144);
  unint64_t v3 = *(void *)(v0 + 152);
  if (v3)
  {
    unint64_t v4 = __clz(__rbit64(v3));
    uint64_t v5 = (v3 - 1) & v3;
    unint64_t v6 = v4 | (v2 << 6);
    uint64_t result = *(void *)(v0 + 136);
LABEL_3:
    *(void *)(v0 + 144) = v2;
    *(void *)(v0 + 152) = v5;
    uint64_t v7 = *(void *)(*(void *)(result + 48) + 8 * v6);
    *(void *)(v0 + 160) = *(void *)(*(void *)(result + 56) + 8 * v6);
    uint64_t v8 = qword_40C38;
    swift_bridgeObjectRetain();
    if (v8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_361C0();
    sub_7900(v9, (uint64_t)qword_414B0);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = sub_361A0();
    os_log_type_t v11 = sub_36360();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      *(void *)(v0 + 112) = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v13 = qword_414A0;
      unint64_t v14 = qword_414A8;
      swift_bridgeObjectRetain();
      *(void *)(v12 + 4) = sub_2F52C(v13, v14, (uint64_t *)(v0 + 112));
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      id v15 = (id)KVItemTypeName();
      uint64_t v16 = sub_36210();
      unint64_t v18 = v17;

      *(void *)(v12 + 14) = sub_2F52C(v16, v18, (uint64_t *)(v0 + 112));
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v10, v11, "%s Donating candidates with the type: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_355B0();
    swift_allocObject();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 168) = sub_355A0();
    uint64_t v27 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of KVSuggestionDonator.donateSuggestions(type:)
                                          + async function pointer to dispatch thunk of KVSuggestionDonator.donateSuggestions(type:));
    uint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v19;
    *uint64_t v19 = v0;
    v19[1] = sub_158EC;
    return v27(v7);
  }
  int64_t v20 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  int64_t v21 = (unint64_t)((1 << *(unsigned char *)(v0 + 184)) + 63) >> 6;
  uint64_t result = *(void *)(v0 + 136);
  if (v20 < v21)
  {
    uint64_t v22 = result + 64;
    unint64_t v23 = *(void *)(result + 64 + 8 * v20);
    ++v2;
    if (v23)
    {
LABEL_16:
      uint64_t v5 = (v23 - 1) & v23;
      unint64_t v6 = __clz(__rbit64(v23)) + (v2 << 6);
      goto LABEL_3;
    }
    int64_t v2 = v20 + 1;
    if (v20 + 1 < v21)
    {
      unint64_t v23 = *(void *)(v22 + 8 * v2);
      if (v23) {
        goto LABEL_16;
      }
      int64_t v2 = v20 + 2;
      if (v20 + 2 < v21)
      {
        unint64_t v23 = *(void *)(v22 + 8 * v2);
        if (v23) {
          goto LABEL_16;
        }
        int64_t v24 = v20 + 3;
        if (v24 < v21)
        {
          unint64_t v23 = *(void *)(v22 + 8 * v24);
          if (v23)
          {
            int64_t v2 = v24;
            goto LABEL_16;
          }
          while (1)
          {
            int64_t v2 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              break;
            }
            if (v2 >= v21) {
              goto LABEL_27;
            }
            unint64_t v23 = *(void *)(v22 + 8 * v2);
            ++v24;
            if (v23) {
              goto LABEL_16;
            }
          }
LABEL_31:
          __break(1u);
          return result;
        }
      }
    }
  }
LABEL_27:
  uint64_t v25 = *(void *)(v0 + 128);
  swift_release();
  swift_setDeallocating();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v25 + 16);
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

void sub_15E24(uint64_t a1@<X8>)
{
  int64_t v2 = v1;
  uint64_t v65 = a1;
  uint64_t v3 = sub_34E60();
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v62 = v3;
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v64 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)v50 - v6;
  uint64_t v63 = sub_34EC0();
  uint64_t v60 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  uint64_t v57 = (char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_34ED0();
  uint64_t v59 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3C6C(&qword_41680);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  unint64_t v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v50 - v15;
  sub_7E34(v1 + 23, v1[26]);
  uint64_t v17 = sub_35060();
  if (v17)
  {
    unint64_t v64 = (char *)v17;
    sub_7E34(v1 + 7, v1[10]);
    sub_35150();
    unint64_t v18 = v64;
  }
  else
  {
    uint64_t v51 = v10;
    uint64_t v52 = v8;
    int64_t v20 = v57;
    uint64_t v19 = v58;
    uint64_t v21 = v63;
    uint64_t v53 = "cePlugin21CommonInferenceDomain";
    char v54 = v14;
    uint64_t v55 = v1 + 23;
    uint64_t v56 = v16;
    if (qword_40C38 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_361C0();
    v50[1] = sub_7900(v22, (uint64_t)qword_414B0);
    unint64_t v23 = sub_361A0();
    os_log_type_t v24 = sub_36360();
    uint64_t v25 = v19;
    uint64_t v26 = v20;
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      v67[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      v50[0] = v2;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v28 = qword_414A0;
      unint64_t v29 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_2F52C(v28, v29, v67);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v23, v24, "%s No existing conversation bookmark found. A new bookmark will be created and only the last 24hrs of data will be reviewed.", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v31 = v62;
      uint64_t v30 = v63;
      uint64_t v32 = v60;
      uint64_t v33 = v52;
      unint64_t v34 = (void *)v50[0];
    }
    else
    {
      uint64_t v30 = v21;

      uint64_t v31 = v62;
      unint64_t v34 = v2;
      uint64_t v32 = v60;
      uint64_t v33 = v52;
    }
    int v35 = v51;
    sub_34EB0();
    (*(void (**)(char *, void, uint64_t))(v32 + 104))(v26, enum case for Calendar.Component.hour(_:), v30);
    sub_34E50();
    uint64_t v36 = (uint64_t)v56;
    sub_34EA0();
    uint64_t v37 = v61;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v25, v31);
    uint64_t v38 = v36;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v30);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v33);
    uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
    int v40 = v39(v36, 1, v31);
    os_log_type_t v41 = v64;
    if (v40 == 1)
    {
      uint64_t v42 = sub_361A0();
      os_log_type_t v43 = sub_36370();
      if (os_log_type_enabled(v42, v43))
      {
        unint64_t v44 = (uint8_t *)swift_slowAlloc();
        v67[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v44 = 136315138;
        if (qword_40C30 != -1) {
          swift_once();
        }
        uint64_t v45 = qword_414A0;
        unint64_t v46 = qword_414A8;
        swift_bridgeObjectRetain();
        uint64_t v66 = sub_2F52C(v45, v46, v67);
        sub_363D0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v42, v43, "%s Failed to calculate a new valid bookmark start date. Using the current date instead - all existing conversation data will be ignored.", v44, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        os_log_type_t v41 = v64;
        uint64_t v37 = v61;
        uint64_t v31 = v62;
        uint64_t v38 = (uint64_t)v56;
      }
      else
      {

        os_log_type_t v41 = v64;
      }
    }
    uint64_t v47 = (uint64_t)v54;
    sub_8310(v38, (uint64_t)v54, &qword_41680);
    if (v39(v47, 1, v31) == 1)
    {
      sub_34E50();
      sub_8374(v47, &qword_41680);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v41, v47, v31);
    }
    uint64_t v48 = v55;
    sub_34FB0();
    uint64_t v49 = (void *)sub_34FA0();
    sub_7E34(v48, v34[26]);
    sub_35070();
    sub_7E34(v34 + 7, v34[10]);
    sub_35150();

    sub_8374(v38, &qword_41680);
  }
}

uint64_t sub_165E8()
{
  v1[53] = v0;
  v1[54] = sub_3C6C(&qword_41710);
  v1[55] = swift_task_alloc();
  v1[56] = swift_task_alloc();
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  uint64_t v2 = sub_35660();
  v1[59] = v2;
  v1[60] = *(void *)(v2 - 8);
  v1[61] = swift_task_alloc();
  v1[62] = swift_task_alloc();
  uint64_t v3 = sub_353D0();
  v1[63] = v3;
  v1[64] = *(void *)(v3 - 8);
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  uint64_t v4 = sub_3C6C(&qword_41718);
  v1[67] = v4;
  v1[68] = *(void *)(v4 - 8);
  v1[69] = swift_task_alloc();
  sub_3C6C(&qword_41720);
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  uint64_t v5 = sub_34E90();
  v1[72] = v5;
  v1[73] = *(void *)(v5 - 8);
  v1[74] = swift_task_alloc();
  v1[75] = swift_task_alloc();
  v1[76] = swift_task_alloc();
  v1[77] = swift_task_alloc();
  v1[78] = swift_task_alloc();
  uint64_t v6 = sub_35420();
  v1[79] = v6;
  v1[80] = *(void *)(v6 - 8);
  v1[81] = swift_task_alloc();
  v1[82] = swift_task_alloc();
  sub_3C6C(&qword_41728);
  v1[83] = swift_task_alloc();
  v1[84] = swift_task_alloc();
  sub_3C6C(&qword_41680);
  v1[85] = swift_task_alloc();
  sub_3C6C(&qword_40F80);
  v1[86] = swift_task_alloc();
  v1[87] = swift_task_alloc();
  v1[88] = swift_task_alloc();
  v1[89] = swift_task_alloc();
  v1[90] = swift_task_alloc();
  sub_3C6C(&qword_41730);
  v1[91] = swift_task_alloc();
  v1[92] = swift_task_alloc();
  uint64_t v7 = sub_34F80();
  v1[93] = v7;
  v1[94] = *(void *)(v7 - 8);
  v1[95] = swift_task_alloc();
  uint64_t v8 = sub_3C6C(&qword_41738);
  v1[96] = v8;
  v1[97] = *(void *)(v8 - 8);
  v1[98] = swift_task_alloc();
  v1[99] = swift_task_alloc();
  sub_3C6C(&qword_41740);
  v1[100] = swift_task_alloc();
  uint64_t v9 = sub_3C6C(&qword_41748);
  v1[101] = v9;
  v1[102] = *(void *)(v9 - 8);
  v1[103] = swift_task_alloc();
  uint64_t v10 = sub_3C6C(&qword_41750);
  v1[104] = v10;
  v1[105] = *(void *)(v10 - 8);
  v1[106] = swift_task_alloc();
  v1[107] = sub_3C6C(&qword_41758);
  v1[108] = swift_task_alloc();
  uint64_t v11 = sub_3C6C(&qword_41760);
  v1[109] = v11;
  v1[110] = *(void *)(v11 - 8);
  v1[111] = swift_task_alloc();
  return _swift_task_switch(sub_16C80, 0, 0);
}

uint64_t sub_16C80()
{
  unint64_t v34 = v0;
  uint64_t v1 = v0[53];
  sub_15E24(v0[108]);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &unk_41770;
  *(void *)(v2 + 24) = v1;
  sub_28564(&qword_41788, &qword_41758);
  swift_retain();
  sub_364D0();
  v0[112] = *(void *)(v1 + 224);
  unint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_119B4(v3);
  v0[113] = v30;
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_1F040();
  v0[114] = v31;
  if (qword_40C38 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_361C0();
  v0[115] = v4;
  v0[116] = sub_7900(v4, (uint64_t)qword_414B0);
  uint64_t v5 = sub_361A0();
  os_log_type_t v6 = sub_36360();
  uint64_t v7 = sub_36000;
  uint64_t v8 = &SiriPrivateLearningInferencePlugin;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    if (qword_40C30 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_414A0;
    unint64_t v11 = qword_414A8;
    swift_bridgeObjectRetain();
    v0[52] = sub_2F52C(v10, v11, &v32);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v6, "%s Reviewing new conversations from Biome for ground truth generation.", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v7 = sub_36000;
    uint64_t v8 = &SiriPrivateLearningInferencePlugin;
  }
  else
  {
  }
  uint64_t v12 = sub_361A0();
  os_log_type_t v13 = sub_36360();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)unint64_t v14 = *((void *)v7 + 359);
    if (v8[43].name != (char *)-1) {
      swift_once();
    }
    uint64_t v15 = qword_414A0;
    unint64_t v16 = qword_414A8;
    swift_bridgeObjectRetain();
    v0[51] = sub_2F52C(v15, v16, &v32);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v12, v13, "%s Suggestion evaluation frameworks:", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v8 = &SiriPrivateLearningInferencePlugin;
  }
  else
  {
  }
  if (v8[43].name != (char *)-1) {
    swift_once();
  }
  uint64_t v32 = qword_414A0;
  unint64_t v33 = qword_414A8;
  swift_bridgeObjectRetain();
  v36._countAndFlagsBits = 0x202D20202020;
  v36._object = (void *)0xE600000000000000;
  sub_36240(v36);
  sub_122B0(v32, v33, v30, &qword_417E0);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_361A0();
  os_log_type_t v18 = sub_36360();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v21 = qword_414A0;
    unint64_t v20 = qword_414A8;
    swift_bridgeObjectRetain();
    v0[50] = sub_2F52C(v21, v20, &v32);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, v18, "%s Ground truth generators:", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v22 = v0[103];
  uint64_t v23 = v0[102];
  uint64_t v24 = v0[101];
  uint64_t v32 = qword_414A0;
  unint64_t v33 = qword_414A8;
  swift_bridgeObjectRetain();
  v37._countAndFlagsBits = 0x202D20202020;
  v37._object = (void *)0xE600000000000000;
  sub_36240(v37);
  sub_122B0(v32, v33, (uint64_t)v31, &qword_417D8);
  swift_bridgeObjectRelease();
  v0[42] = sub_6BFC((uint64_t)_swiftEmptyArrayStorage);
  sub_28564(&qword_41790, &qword_41760);
  sub_36320();
  sub_35270();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  v0[117] = _swiftEmptyArrayStorage;
  uint64_t v25 = sub_28564(&qword_41798, &qword_41750);
  uint64_t v26 = (void *)swift_task_alloc();
  v0[118] = v26;
  *uint64_t v26 = v0;
  v26[1] = sub_1737C;
  uint64_t v27 = v0[104];
  uint64_t v28 = v0[100];
  return dispatch thunk of AsyncIteratorProtocol.next()(v28, v27, v25);
}

uint64_t sub_1737C()
{
  *(void *)(*(void *)v1 + 952) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1851C;
  }
  else {
    uint64_t v2 = sub_17490;
  }
  return _swift_task_switch(v2, 0, 0);
}

unint64_t sub_17490()
{
  v151 = v0;
  uint64_t v1 = v0[100];
  uint64_t v2 = v0[96];
  unint64_t v149 = v0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[97] + 48))(v1, 1, v2) != 1)
  {
    uint64_t v20 = v0[99];
    uint64_t v21 = v0[98];
    uint64_t v22 = v0[94];
    uint64_t v23 = v0[93];
    uint64_t v141 = v0[95];
    uint64_t v143 = v0[92];
    uint64_t v24 = v0[73];
    uint64_t v145 = v0[90];
    uint64_t v147 = v0[72];
    uint64_t v25 = *(int *)(v2 + 48);
    uint64_t v26 = v20 + v25;
    uint64_t v139 = v1 + v25;
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
    v27(v20, v1, v23);
    sub_3CB0(v139, v26, &qword_41730);
    uint64_t v28 = v21 + *(int *)(v2 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v20, v23);
    sub_8310(v26, v28, &qword_41730);
    v27(v141, v21, v23);
    unint64_t v29 = v149;
    sub_3CB0(v28, v143, &qword_41730);
    sub_34F50();
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
    v149[120] = v30;
    v149[121] = (v24 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
    int v31 = v30(v145, 1, v147);
    uint64_t v32 = v149[90];
    if (v31 == 1)
    {
      sub_8374(v149[90], &qword_40F80);
      unint64_t v33 = 0x8000000000038580;
      unint64_t v34 = 0xD000000000000019;
    }
    else
    {
      uint64_t v35 = v149[73];
      uint64_t v36 = v149[72];
      unint64_t v34 = sub_34E70();
      unint64_t v33 = v37;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v32, v36);
    }
    v149[123] = v33;
    v149[122] = v34;
    swift_bridgeObjectRetain_n();
    uint64_t v38 = sub_361A0();
    os_log_type_t v39 = sub_36360();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      v150[0] = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 136315394;
      uint64_t v41 = qword_414A0;
      unint64_t v42 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t v43 = v41;
      unint64_t v29 = v149;
      *(void *)(v40 + 4) = sub_2F52C(v43, v42, (uint64_t *)v150);
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v40 + 14) = sub_2F52C(v34, v33, (uint64_t *)v150);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v38, v39, "%s Reviewing conversation with conversationId=%s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v44 = v29[94];
    uint64_t v45 = v29[93];
    uint64_t v46 = v29[91];
    sub_8310(v29[92], v46, &qword_41730);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v46, 1, v45) == 1)
    {
      uint64_t v47 = v29[85];
      sub_8374(v29[91], &qword_41730);
      uint64_t v48 = sub_34E60();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v47, 1, 1, v48);
    }
    else
    {
      uint64_t v49 = v29[94];
      uint64_t v50 = v29[93];
      uint64_t v51 = v29[91];
      sub_34F60();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v51, v50);
    }
    uint64_t v52 = (void *)swift_task_alloc();
    v29[124] = v52;
    *uint64_t v52 = v29;
    v52[1] = sub_18880;
    uint64_t v53 = v29[85];
    uint64_t v54 = v29[95];
    return sub_1B644(v54, v53);
  }
  uint64_t v3 = v0[113];
  (*(void (**)(void, void))(v0[105] + 8))(v0[106], v0[104]);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = 0;
    os_log_type_t v6 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      sub_7E34((void *)(v149[113] + v5 + 32), *(void *)(v149[113] + v5 + 56));
      uint64_t v7 = sub_35580();
      uint64_t v8 = *(void *)(v7 + 16);
      int64_t v9 = *((void *)v6 + 2);
      uint64_t v10 = (void *)(v9 + v8);
      if (__OFADD__(v9, v8)) {
        goto LABEL_47;
      }
      uint64_t v11 = v7;
      uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && (uint64_t)v10 <= *((void *)v6 + 3) >> 1)
      {
        if (*(void *)(v11 + 16)) {
          goto LABEL_15;
        }
      }
      else
      {
        if (v9 <= (uint64_t)v10) {
          int64_t v13 = v9 + v8;
        }
        else {
          int64_t v13 = v9;
        }
        os_log_type_t v6 = sub_2CA9C(isUniquelyReferenced_nonNull_native, v13, 1, v6);
        if (*(void *)(v11 + 16))
        {
LABEL_15:
          uint64_t v14 = *((void *)v6 + 2);
          if ((*((void *)v6 + 3) >> 1) - v14 < v8) {
            goto LABEL_48;
          }
          unint64_t v15 = (unint64_t)&v6[40 * v14 + 32];
          uint64_t v10 = (void *)(v11 + 32);
          if (v11 + 32 < v15 + 40 * v8 && v15 < v11 + 32 + 40 * v8) {
            return sub_36530();
          }
          sub_3C6C(&qword_417A0);
          swift_arrayInitWithCopy();
          if (v8)
          {
            uint64_t v17 = *((void *)v6 + 2);
            BOOL v18 = __OFADD__(v17, v8);
            uint64_t v19 = v17 + v8;
            if (v18) {
              goto LABEL_49;
            }
            *((void *)v6 + 2) = v19;
          }
          goto LABEL_5;
        }
      }
      if (v8)
      {
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
LABEL_5:
      swift_bridgeObjectRelease();
      v5 += 40;
      if (!--v4)
      {
        uint64_t v10 = v149;
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
    }
  }
  uint64_t v10 = v0;
LABEL_38:
  unint64_t v5 = v10[112];
  uint64_t v56 = v10[53];
  swift_bridgeObjectRelease();
  sub_7E34((void *)(v56 + 16), *(void *)(v56 + 40));
  sub_35360();
  sub_357A0();
  swift_allocObject();
  sub_35790();
  sub_35760();
  swift_bridgeObjectRelease();
  swift_release();
  if (v5 >> 62)
  {
LABEL_50:
    swift_bridgeObjectRetain();
    unint64_t result = sub_364F0();
    uint64_t v57 = result;
    if (result) {
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v57 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    unint64_t result = swift_bridgeObjectRetain();
    if (v57)
    {
LABEL_40:
      if (v57 < 1) {
        goto LABEL_124;
      }
      uint64_t v58 = 0;
      unint64_t v59 = v5 & 0xC000000000000001;
      uint64_t v60 = v10[112] + 32;
      do
      {
        if (v59)
        {
          uint64_t v61 = sub_36470();
        }
        else
        {
          uint64_t v61 = *(void *)(v60 + 8 * v58);
          swift_retain();
        }
        ++v58;
        (*(void (**)(void))(*(void *)v61 + 176))();
        swift_release();
      }
      while (v57 != v58);
    }
  }
  uint64_t v62 = v10[114];
  swift_bridgeObjectRelease();
  v150[0] = _swiftEmptyArrayStorage;
  uint64_t v63 = *(void *)(v62 + 16);
  if (v63)
  {
    swift_bridgeObjectRetain();
    uint64_t v64 = 32;
    do
    {
      sub_7DD0(v10[114] + v64, (uint64_t)(v10 + 12));
      sub_7E34(v10 + 12, v10[15]);
      uint64_t v65 = sub_35260();
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v10 + 12));
      sub_2DC50(v65);
      v64 += 40;
      --v63;
    }
    while (v63);
    swift_bridgeObjectRelease_n();
    uint64_t v66 = v150[0];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v66 = _swiftEmptyArrayStorage;
  }
  uint64_t v67 = v10[119];
  uint64_t v68 = v10[42];
  swift_bridgeObjectRetain();
  sub_1B230((uint64_t)v66, v68);
  swift_bridgeObjectRelease();
  uint64_t v69 = sub_25548((uint64_t)v66);
  uint64_t v128 = v67;
  swift_bridgeObjectRelease();
  int64_t v70 = *(void *)(v69 + 16);
  if (!v70)
  {
    swift_bridgeObjectRelease();
    unint64_t v109 = _swiftEmptyArrayStorage;
LABEL_104:
    uint64_t v120 = swift_bridgeObjectRetain();
    v121 = sub_1A810(v120);
    swift_bridgeObjectRelease();
    if (v121[2])
    {
      sub_3C6C(&qword_417A8);
      uint64_t v122 = (void *)sub_36520();
    }
    else
    {
      uint64_t v122 = &_swiftEmptyDictionarySingleton;
    }
    v150[0] = v122;
    sub_25950((uint64_t)v121, 1, (uint64_t)v150);
    swift_bridgeObjectRelease();
    uint64_t v123 = v150[0];
    if (v128) {
      return swift_release();
    }
    v150[0] = v109;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_27BBC(v150, (uint64_t)v123);
    uint64_t v124 = v10[111];
    uint64_t v125 = v10[110];
    uint64_t v126 = v10[109];
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v148 = v150[0];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v124, v126);
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v127 = (uint64_t (*)(void *))v10[1];
    return v127(v148);
  }
  uint64_t v71 = v10[60];
  uint64_t v133 = v10[54];
  v150[0] = _swiftEmptyArrayStorage;
  sub_316A4(0, v70, 0);
  unint64_t result = sub_32274(v69);
  uint64_t v73 = 0;
  uint64_t v74 = v69 + 64;
  uint64_t v75 = (void (**)(uint64_t, uint64_t))(v71 + 8);
  uint64_t v132 = v69;
  char v76 = *(unsigned char *)(v69 + 32);
  uint64_t v134 = v69 + 80;
  uint64_t v135 = v71;
  int64_t v129 = v70;
  int v130 = v72;
  uint64_t v131 = v69 + 64;
  while (1)
  {
    if ((result & 0x8000000000000000) != 0 || (uint64_t)result >= 1 << v76)
    {
      __break(1u);
LABEL_119:
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
      return result;
    }
    if ((*(void *)(v74 + 8 * (result >> 6)) & (1 << result)) == 0) {
      goto LABEL_119;
    }
    if (*(_DWORD *)(v69 + 36) != v72) {
      goto LABEL_120;
    }
    uint64_t v137 = 1 << result;
    unint64_t v138 = result >> 6;
    uint64_t v136 = v73;
    uint64_t v80 = v10[58];
    uint64_t v81 = v10;
    uint64_t v82 = v69;
    uint64_t v83 = v81[73];
    uint64_t v84 = v81[72];
    uint64_t v85 = v81[57];
    uint64_t v144 = *(int *)(v133 + 48);
    uint64_t v146 = v81[56];
    unint64_t v86 = *(void (**)(uint64_t, unint64_t, uint64_t))(v83 + 16);
    unint64_t v87 = result;
    v86(v80, *(void *)(v82 + 48) + *(void *)(v83 + 72) * result, v84);
    uint64_t v140 = v86;
    uint64_t v142 = v87;
    uint64_t v88 = *(void *)(*(void *)(v82 + 56) + 8 * v87);
    *(void *)(v80 + v144) = v88;
    v86(v85, v80, v84);
    *(void *)(v85 + *(int *)(v133 + 48)) = v88;
    sub_3CB0(v85, v146, &qword_41710);
    swift_bridgeObjectRetain_n();
    sub_8374(v80, &qword_41710);
    uint64_t v89 = *(void *)(v146 + *(int *)(v133 + 48));
    uint64_t v90 = *(void *)(v89 + 16);
    if (v90) {
      break;
    }
    uint64_t v10 = v81;
LABEL_88:
    uint64_t v108 = v10[56];
    v140(v10[55], v108, v10[72]);
    sub_35650();
    sub_8374(v108, &qword_41710);
    unint64_t v109 = v150[0];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_316A4(0, v150[0][2] + 1, 1);
      unint64_t v109 = v150[0];
    }
    uint64_t v69 = v132;
    unint64_t v111 = v109[2];
    unint64_t v110 = v109[3];
    if (v111 >= v110 >> 1)
    {
      sub_316A4(v110 > 1, v111 + 1, 1);
      unint64_t v109 = v150[0];
    }
    uint64_t v112 = v10[62];
    uint64_t v113 = v10[59];
    v109[2] = v111 + 1;
    unint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v135 + 32))((unint64_t)v109+ ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80))+ *(void *)(v135 + 72) * v111, v112, v113);
    v150[0] = v109;
    char v76 = *(unsigned char *)(v132 + 32);
    unint64_t v77 = 1 << v76;
    if (v142 >= 1 << v76) {
      goto LABEL_121;
    }
    uint64_t v74 = v131;
    unint64_t v114 = v138;
    uint64_t v115 = *(void *)(v131 + 8 * v138);
    if ((v115 & v137) == 0) {
      goto LABEL_122;
    }
    int v72 = v130;
    if (*(_DWORD *)(v132 + 36) != v130) {
      goto LABEL_123;
    }
    unint64_t v116 = v115 & (-2 << (v142 & 0x3F));
    if (v116)
    {
      unint64_t v77 = __clz(__rbit64(v116)) | v142 & 0xFFFFFFFFFFFFFFC0;
      int64_t v78 = v129;
      uint64_t v79 = v136;
    }
    else
    {
      unint64_t v117 = v138 + 1;
      unint64_t v118 = (v77 + 63) >> 6;
      int64_t v78 = v129;
      uint64_t v79 = v136;
      if (v138 + 1 < v118)
      {
        unint64_t v119 = *(void *)(v131 + 8 * v117);
        if (v119)
        {
LABEL_101:
          unint64_t v77 = __clz(__rbit64(v119)) + (v117 << 6);
        }
        else
        {
          while (v118 - 2 != v114)
          {
            unint64_t v119 = *(void *)(v134 + 8 * v114++);
            if (v119)
            {
              unint64_t v117 = v114 + 1;
              goto LABEL_101;
            }
          }
        }
      }
    }
    uint64_t v73 = v79 + 1;
    unint64_t result = v77;
    if (v73 == v78)
    {
      swift_bridgeObjectRelease();
      goto LABEL_104;
    }
  }
  uint64_t v91 = v89 + ((*(unsigned __int8 *)(v135 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80));
  uint64_t v92 = *(void *)(v135 + 72);
  unint64_t v93 = *(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16);
  swift_bridgeObjectRetain();
  unint64_t v94 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v95 = v149[61];
    uint64_t v96 = v149[59];
    v93(v95, v91, v96);
    uint64_t v97 = sub_35630();
    (*v75)(v95, v96);
    uint64_t v98 = *(void *)(v97 + 16);
    int64_t v99 = *((void *)v94 + 2);
    int64_t v100 = v99 + v98;
    if (__OFADD__(v99, v98)) {
      break;
    }
    long long v101 = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (v101 && v100 <= *((void *)v94 + 3) >> 1)
    {
      if (*(void *)(v97 + 16)) {
        goto LABEL_77;
      }
    }
    else
    {
      if (v99 <= v100) {
        int64_t v102 = v99 + v98;
      }
      else {
        int64_t v102 = v99;
      }
      unint64_t v94 = sub_2C2CC(v101, v102, 1, v94);
      if (*(void *)(v97 + 16))
      {
LABEL_77:
        uint64_t v103 = *((void *)v94 + 2);
        if ((*((void *)v94 + 3) >> 1) - v103 < v98) {
          goto LABEL_115;
        }
        unint64_t v104 = (unint64_t)&v94[40 * v103 + 32];
        if (v97 + 32 < v104 + 40 * v98 && v104 < v97 + 32 + 40 * v98) {
          return sub_36530();
        }
        sub_3C6C(&qword_40FB0);
        swift_arrayInitWithCopy();
        if (v98)
        {
          uint64_t v106 = *((void *)v94 + 2);
          BOOL v18 = __OFADD__(v106, v98);
          uint64_t v107 = v106 + v98;
          if (v18) {
            goto LABEL_116;
          }
          *((void *)v94 + 2) = v107;
        }
        goto LABEL_67;
      }
    }
    if (v98) {
      goto LABEL_114;
    }
LABEL_67:
    swift_bridgeObjectRelease();
    v91 += v92;
    if (!--v90)
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = v149;
      goto LABEL_88;
    }
  }
  __break(1u);
LABEL_114:
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  __break(1u);
  return sub_36530();
}

uint64_t sub_1851C()
{
  *(void *)(v0 + 360) = *(void *)(v0 + 952);
  sub_3C6C(&qword_40E00);
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_185DC, 0, 0);
}

uint64_t sub_185DC()
{
  uint64_t v1 = v0[111];
  uint64_t v2 = v0[110];
  uint64_t v3 = v0[109];
  (*(void (**)(void, void))(v0[105] + 8))(v0[106], v0[104]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_18880(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[125] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[85];
  if (v1)
  {
    sub_8374(v5, &qword_41680);
    uint64_t v6 = sub_1A08C;
  }
  else
  {
    v4[126] = a1;
    sub_8374(v5, &qword_41680);
    uint64_t v6 = sub_189D8;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_189D8()
{
  v197 = v0;
  uint64_t v1 = v0[126];
  if (v1)
  {
    uint64_t v176 = (uint64_t)(v0 + 7);
    uint64_t v191 = (uint64_t)(v0 + 17);
    uint64_t v2 = (uint64_t)(v0 + 22);
    v173 = v0 + 27;
    v169 = v0 + 41;
    v168 = v0 + 40;
    uint64_t v170 = v0 + 46;
    uint64_t v171 = (uint64_t)(v0 + 32);
    swift_bridgeObjectRelease();
    v0[38] = 0;
    v0[39] = 0;
    v0[37] = v1;
    swift_bridgeObjectRetain();
    uint64_t v194 = 136315394;
    uint64_t v178 = (uint64_t)(v0 + 2);
LABEL_4:
    uint64_t v5 = v0[84];
    uint64_t v6 = (void *)v0[83];
    sub_1A5F4(v6);
    sub_3CB0((uint64_t)v6, v5, &qword_41728);
    uint64_t v7 = sub_3C6C(&qword_417B0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1)
    {
      uint64_t v8 = (char *)v0[84];
      uint64_t v9 = v0[82];
      uint64_t v10 = v0[81];
      uint64_t v11 = v189[80];
      uint64_t v12 = v189[79];
      uint64_t v13 = *(void *)v8;
      (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v9, &v8[*(int *)(v7 + 48)], v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v9, v12);
      uint64_t v14 = v189;
      unint64_t v15 = sub_361A0();
      os_log_type_t v16 = sub_36360();
      BOOL v17 = os_log_type_enabled(v15, v16);
      uint64_t v18 = v189[80];
      uint64_t v177 = v13;
      if (v17)
      {
        uint64_t v19 = v189[78];
        uint64_t v174 = v189[73];
        uint64_t v20 = v189[72];
        uint64_t v183 = v189[79];
        uint64_t v172 = v189[81];
        uint64_t v21 = swift_slowAlloc();
        v196[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 136315650;
        os_log_type_t v179 = v15;
        os_log_type_t v181 = v16;
        uint64_t v22 = qword_414A0;
        unint64_t v23 = qword_414A8;
        swift_bridgeObjectRetain();
        v189[47] = sub_2F52C(v22, v23, v196);
        sub_363D0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        v189[48] = v13;
        sub_363D0();
        *(_WORD *)(v21 + 22) = 2080;
        sub_353F0();
        sub_285C4(&qword_417B8, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v24 = sub_36560();
        unint64_t v26 = v25;
        (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v19, v20);
        v189[49] = sub_2F52C(v24, v26, v196);
        sub_363D0();
        swift_bridgeObjectRelease();
        v175 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        v175(v172, v183);
        unint64_t v15 = v179;
        _os_log_impl(&dword_0, v179, v181, "%s Turn %ld (%s) Features:", (uint8_t *)v21, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v175 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
        v175(v189[81], v189[79]);
      }

      uint64_t v27 = sub_35410();
      uint64_t v28 = *(void *)(v27 + 16);
      if (v28)
      {
        uint64_t v29 = v27 + 32;
        uint64_t v30 = qword_40C28;
        swift_bridgeObjectRetain();
        if (v30 != -1) {
          swift_once();
        }
        do
        {
          sub_7900(v189[115], (uint64_t)qword_412D8);
          sub_7DD0(v29, v178);
          int v31 = sub_361A0();
          os_log_type_t v32 = sub_36360();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = swift_slowAlloc();
            v196[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v33 = 136315394;
            *(void *)(v33 + 4) = sub_2F52C(8224, 0xE200000000000000, v196);
            *(_WORD *)(v33 + 12) = 2080;
            sub_7DD0(v178, v176);
            sub_3C6C(&qword_416E0);
            uint64_t v34 = sub_36220();
            *(void *)(v33 + 14) = sub_2F52C(v34, v35, v196);
            swift_bridgeObjectRelease();
            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v178);
            _os_log_impl(&dword_0, v31, v32, "%s%s", (uint8_t *)v33, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v178);
          }
          v29 += 40;
          --v28;
        }
        while (v28);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        if (qword_40C28 != -1) {
          swift_once();
        }
        sub_7900(v189[115], (uint64_t)qword_412D8);
        uint64_t v36 = sub_361A0();
        os_log_type_t v37 = sub_36360();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = (uint8_t *)swift_slowAlloc();
          v196[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v38 = 136315138;
          *uint64_t v170 = sub_2F52C(8224, 0xE200000000000000, v196);
          sub_363D0();
          _os_log_impl(&dword_0, v36, v37, "%s<Empty>", v38, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v40 = sub_353E0();
      unint64_t v41 = 0;
      unint64_t v42 = *(void (**)(void, void, void))(v40 + 16);
      v180 = v42;
      uint64_t v182 = v40;
      while (1)
      {
        if ((void (*)(void, void, void))v41 == v42)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14[68] + 56))(v14[70], 1, 1, v14[67]);
          uint64_t v44 = v42;
        }
        else
        {
          if ((v41 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            uint64_t v133 = v14[78];
            uint64_t v134 = v14[74];
            uint64_t v135 = v14[73];
            uint64_t v136 = v14[72];
            v42(v133, v39, v136);
            uint64_t v137 = v14[42];
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v196[0] = v137;
            sub_24AB4(v133, v134, isUniquelyReferenced_nonNull_native);
            v14[42] = v196[0];
            swift_bridgeObjectRelease();
            uint64_t v131 = v14;
            uint64_t v132 = *(void (**)(uint64_t, uint64_t))(v135 + 8);
            v132(v134, v136);
            goto LABEL_61;
          }
          if (v41 >= *(void *)(v40 + 16)) {
            goto LABEL_59;
          }
          uint64_t v45 = (unint64_t *)v14[70];
          uint64_t v46 = v14[69];
          uint64_t v47 = v189[68];
          uint64_t v48 = v189[67];
          uint64_t v49 = v189[64];
          uint64_t v50 = v189[63];
          unint64_t v51 = v40
              + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))
              + *(void *)(v49 + 72) * v41;
          uint64_t v52 = v46 + *(int *)(v48 + 48);
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v49 + 16))(v52, v51, v50);
          uint64_t v53 = (char *)v45 + *(int *)(v48 + 48);
          *uint64_t v45 = v41;
          (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v53, v52, v50);
          (*(void (**)(unint64_t *, void, uint64_t, uint64_t))(v47 + 56))(v45, 0, 1, v48);
          uint64_t v44 = (void (*)(void, void, void))(v41 + 1);
          uint64_t v14 = v189;
        }
        uint64_t v54 = v14[71];
        uint64_t v55 = v14[70];
        uint64_t v56 = v14;
        uint64_t v57 = v14[68];
        uint64_t v58 = v56[67];
        sub_3CB0(v55, v54, &qword_41720);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v54, 1, v58) == 1)
        {
          uint64_t v3 = v56[82];
          uint64_t v4 = v56[79];
          swift_bridgeObjectRelease();
          v175(v3, v4);
          uint64_t v0 = v56;
          goto LABEL_4;
        }
        unint64_t v59 = (char *)v56[71];
        uint64_t v60 = v56[66];
        uint64_t v61 = v56[65];
        uint64_t v63 = v56[63];
        uint64_t v62 = v56[64];
        uint64_t v184 = *(void *)v59;
        (*(void (**)(uint64_t, char *, uint64_t))(v62 + 32))(v60, &v59[*(int *)(v56[67] + 48)], v63);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v61, v60, v63);
        uint64_t v64 = sub_361A0();
        os_log_type_t v65 = sub_36360();
        BOOL v66 = os_log_type_enabled(v64, v65);
        uint64_t v67 = v56[65];
        uint64_t v68 = v56[63];
        uint64_t v69 = (void (**)(uint64_t, uint64_t))(v56[64] + 8);
        v187 = v44;
        if (v66)
        {
          uint64_t v70 = swift_slowAlloc();
          v196[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v70 = 136315906;
          uint64_t v71 = qword_414A0;
          unint64_t v72 = qword_414A8;
          swift_bridgeObjectRetain();
          *(void *)(v70 + 4) = sub_2F52C(v71, v72, v196);
          swift_bridgeObjectRelease();
          *(_WORD *)(v70 + 12) = 2048;
          *(void *)(v70 + 14) = v177;
          *(_WORD *)(v70 + 22) = 2048;
          *(void *)(v70 + 24) = v184;
          *(_WORD *)(v70 + 32) = 2080;
          uint64_t v73 = sub_353A0();
          *(void *)(v70 + 34) = sub_2F52C(v73, v74, v196);
          swift_bridgeObjectRelease();
          unint64_t v185 = *v69;
          (*v69)(v67, v68);
          _os_log_impl(&dword_0, v64, v65, "%s Turn %ld, Event %ld (%s) Features:", (uint8_t *)v70, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          unint64_t v185 = *v69;
          (*v69)(v67, v68);
        }

        uint64_t v14 = v189;
        uint64_t v75 = sub_353C0();
        uint64_t v76 = *(void *)(v75 + 16);
        if (v76)
        {
          uint64_t v77 = v75 + 32;
          uint64_t v78 = qword_40C28;
          swift_bridgeObjectRetain();
          if (v78 != -1) {
            swift_once();
          }
          do
          {
            sub_7900(v189[115], (uint64_t)qword_412D8);
            sub_7DD0(v77, v2);
            uint64_t v79 = sub_361A0();
            os_log_type_t v80 = sub_36360();
            if (os_log_type_enabled(v79, v80))
            {
              uint64_t v81 = swift_slowAlloc();
              v196[0] = swift_slowAlloc();
              *(_DWORD *)uint64_t v81 = 136315394;
              *(void *)(v81 + 4) = sub_2F52C(8224, 0xE200000000000000, v196);
              *(_WORD *)(v81 + 12) = 2080;
              sub_7DD0(v2, v191);
              sub_3C6C(&qword_416E0);
              uint64_t v82 = sub_36220();
              *(void *)(v81 + 14) = sub_2F52C(v82, v83, v196);
              swift_bridgeObjectRelease();
              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
              _os_log_impl(&dword_0, v79, v80, "%s%s", (uint8_t *)v81, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {

              _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v2);
            }
            v77 += 40;
            --v76;
          }
          while (v76);
          swift_bridgeObjectRelease_n();
          uint64_t v40 = v182;
          uint64_t v43 = v185;
          unint64_t v41 = (unint64_t)v187;
        }
        else
        {
          if (qword_40C28 != -1) {
            swift_once();
          }
          sub_7900(v189[115], (uint64_t)qword_412D8);
          uint64_t v84 = sub_361A0();
          os_log_type_t v85 = sub_36360();
          uint64_t v40 = v182;
          uint64_t v43 = v185;
          unint64_t v41 = (unint64_t)v187;
          if (os_log_type_enabled(v84, v85))
          {
            uint64_t v86 = swift_slowAlloc();
            v196[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v86 = 136315138;
            *(void *)(v86 + 4) = sub_2F52C(8224, 0xE200000000000000, v196);
            _os_log_impl(&dword_0, v84, v85, "%s<Empty>", (uint8_t *)v86, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          swift_bridgeObjectRelease();
        }
        v43(v189[66], v189[63]);
        unint64_t v42 = v180;
      }
    }
    unint64_t v87 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[120];
    uint64_t v88 = v0[89];
    uint64_t v89 = v0[72];
    swift_bridgeObjectRelease();
    sub_362A0();
    if (v87(v88, 1, v89) == 1)
    {
      sub_8374(v0[89], &qword_40F80);
      uint64_t v194 = v0[117];
      uint64_t v90 = v0;
    }
    else
    {
      uint64_t v100 = v0[77];
      uint64_t v101 = v0[76];
      uint64_t v102 = v0[73];
      uint64_t v103 = v0[72];
      unint64_t v42 = *(void (**)(void, void, void))(v102 + 32);
      v42(v100, v0[89], v103);
      unint64_t v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(v102 + 16);
      v104(v101, v100, v103);
      char v105 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v106 = v0[117];
      v193 = v104;
      if ((v105 & 1) == 0) {
        unint64_t v106 = sub_2CAB0(0, *(void *)(v106 + 16) + 1, 1, v106);
      }
      unint64_t v108 = *(void *)(v106 + 16);
      unint64_t v107 = *(void *)(v106 + 24);
      if (v108 >= v107 >> 1) {
        unint64_t v106 = sub_2CAB0(v107 > 1, v108 + 1, 1, v106);
      }
      uint64_t v90 = v189;
      unint64_t v109 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v189[120];
      uint64_t v110 = v189[88];
      uint64_t v111 = v189[76];
      uint64_t v112 = v189[73];
      uint64_t v113 = v189[72];
      *(void *)(v106 + 16) = v108 + 1;
      uint64_t v194 = v106;
      v42(v106+ ((*(unsigned __int8 *)(v112 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80))+ *(void *)(v112 + 72) * v108, v111, v113);
      sub_362B0();
      if (v109(v110, 1, v113) == 1)
      {
        uint64_t v114 = v189[88];
        (*(void (**)(uint64_t, uint64_t))(v189[73] + 8))(v189[77], v189[72]);
        sub_8374(v114, &qword_40F80);
      }
      else
      {
        uint64_t v186 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v189[120];
        uint64_t v120 = v189[87];
        uint64_t v121 = v189[77];
        uint64_t v122 = v189[75];
        uint64_t v123 = v189[74];
        uint64_t v124 = v189[73];
        uint64_t v125 = v189[72];
        v42(v122, v189[88], v125);
        v193(v123, v121, v125);
        v193(v120, v122, v125);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v124 + 56))(v120, 0, 1, v125);
        int v126 = v186(v120, 1, v125);
        uint64_t v39 = v189[87];
        uint64_t v14 = v189;
        if (v126 != 1) {
          goto LABEL_60;
        }
        uint64_t v127 = v189[86];
        uint64_t v128 = v189[74];
        uint64_t v129 = v189[73];
        uint64_t v130 = v189[72];
        sub_8374(v39, &qword_40F80);
        sub_22054(v128, v127);
        uint64_t v131 = v189;
        uint64_t v132 = *(void (**)(uint64_t, uint64_t))(v129 + 8);
        v132(v128, v130);
        sub_8374(v127, &qword_40F80);
LABEL_61:
        uint64_t v139 = v131[77];
        uint64_t v140 = v131[72];
        v132(v131[75], v140);
        v132(v139, v140);
        uint64_t v90 = v131;
      }
    }
    uint64_t v141 = sub_361A0();
    os_log_type_t v142 = sub_36360();
    if (os_log_type_enabled(v141, v142))
    {
      uint64_t v143 = (uint8_t *)swift_slowAlloc();
      v196[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v143 = 136315138;
      uint64_t v90 = v189;
      uint64_t v144 = qword_414A0;
      unint64_t v145 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t *v169 = sub_2F52C(v144, v145, v196);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v141, v142, "%s Running evaluation frameworks on extracted features", v143, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v146 = *(void *)(v90[113] + 16);
    uint64_t v147 = (void *)v171;
    if (v146)
    {
      swift_bridgeObjectRetain();
      uint64_t v148 = 32;
      do
      {
        sub_7DD0(v90[113] + v148, (uint64_t)v147);
        sub_7E34(v147, v90[35]);
        sub_35590();
        uint64_t v147 = (void *)v171;
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v171);
        v148 += 40;
        --v146;
      }
      while (v146);
      swift_bridgeObjectRelease();
    }
    unint64_t v149 = sub_361A0();
    os_log_type_t v150 = sub_36360();
    if (os_log_type_enabled(v149, v150))
    {
      v151 = (uint8_t *)swift_slowAlloc();
      v196[0] = swift_slowAlloc();
      *(_DWORD *)v151 = 136315138;
      uint64_t v90 = v189;
      uint64_t v152 = qword_414A0;
      unint64_t v153 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t *v168 = sub_2F52C(v152, v153, v196);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v149, v150, "%s Running ground truth generators on extracted features", v151, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    v154 = v90;
    uint64_t v155 = *(void *)(v90[114] + 16);
    if (v155)
    {
      swift_bridgeObjectRetain();
      uint64_t v156 = 32;
      uint64_t v157 = (uint64_t)v173;
      do
      {
        sub_7DD0(v154[114] + v156, v157);
        sub_7E34(v173, v154[30]);
        uint64_t v157 = (uint64_t)v173;
        sub_35490();
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v173);
        v156 += 40;
        --v155;
      }
      while (v155);
      swift_bridgeObjectRelease();
    }
    uint64_t v158 = v154[99];
    uint64_t v159 = v154[95];
    uint64_t v160 = v154[94];
    uint64_t v161 = v154[93];
    uint64_t v162 = v154[92];
    swift_bridgeObjectRelease();
    sub_8374(v162, &qword_41730);
    (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v159, v161);
    sub_8374(v158, &qword_41738);
    v154[117] = v194;
    uint64_t v0 = v154;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v91 = sub_361A0();
    os_log_type_t v92 = sub_36370();
    BOOL v93 = os_log_type_enabled(v91, v92);
    unint64_t v94 = v0[123];
    if (v93)
    {
      uint64_t v95 = v0[122];
      uint64_t v192 = v0[95];
      uint64_t v195 = v0[99];
      uint64_t v96 = v0[94];
      uint64_t v188 = v0[92];
      uint64_t v190 = v0[93];
      uint64_t v97 = swift_slowAlloc();
      v196[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v97 = 136315394;
      uint64_t v98 = qword_414A0;
      unint64_t v99 = qword_414A8;
      swift_bridgeObjectRetain();
      *(void *)(v97 + 4) = sub_2F52C(v98, v99, v196);
      swift_bridgeObjectRelease();
      *(_WORD *)(v97 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v97 + 14) = sub_2F52C(v95, v94, v196);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v91, v92, "%s Failed to generate a featurised session for conversationId=%s", (uint8_t *)v97, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_8374(v188, &qword_41730);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v192, v190);
      sub_8374(v195, &qword_41738);
    }
    else
    {
      uint64_t v115 = v0[99];
      uint64_t v116 = v0[95];
      uint64_t v117 = v189[94];
      uint64_t v118 = v189[93];
      uint64_t v119 = v189[92];
      swift_bridgeObjectRelease_n();

      sub_8374(v119, &qword_41730);
      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v116, v118);
      uint64_t v0 = v189;
      sub_8374(v115, &qword_41738);
    }
  }
  uint64_t v163 = sub_28564(&qword_41798, &qword_41750);
  v164 = (void *)swift_task_alloc();
  v0[118] = (uint64_t)v164;
  void *v164 = v0;
  v164[1] = sub_1737C;
  uint64_t v165 = v0[104];
  uint64_t v166 = v0[100];
  return dispatch thunk of AsyncIteratorProtocol.next()(v166, v165, v163);
}

uint64_t sub_1A08C()
{
  uint64_t v28 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v1 = sub_361A0();
  os_log_type_t v2 = sub_36370();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[125];
    unint64_t v4 = v0[123];
    uint64_t v5 = v0[122];
    uint64_t v25 = v0[95];
    uint64_t v26 = v0[99];
    uint64_t v23 = v0[94];
    uint64_t v24 = v0[93];
    uint64_t v22 = v0[92];
    uint64_t v6 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315650;
    uint64_t v8 = qword_414A0;
    unint64_t v7 = qword_414A8;
    swift_bridgeObjectRetain();
    *(void *)(v6 + 4) = sub_2F52C(v8, v7, &v27);
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v6 + 14) = sub_2F52C(v5, v4, &v27);
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 22) = 2080;
    v0[43] = v3;
    swift_errorRetain();
    sub_3C6C(&qword_40E00);
    uint64_t v9 = sub_36220();
    *(void *)(v6 + 24) = sub_2F52C(v9, v10, &v27);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "%s Error generating features for conversationId=%s. Skipping ground truth generation. Error=%s", (uint8_t *)v6, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    sub_8374(v22, &qword_41730);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
    uint64_t v11 = v26;
  }
  else
  {
    uint64_t v12 = v0[99];
    uint64_t v13 = v0[95];
    uint64_t v14 = v0[94];
    uint64_t v15 = v0[93];
    uint64_t v16 = v0[92];

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    sub_8374(v16, &qword_41730);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    uint64_t v11 = v12;
  }
  sub_8374(v11, &qword_41738);
  uint64_t v17 = sub_28564(&qword_41798, &qword_41750);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[118] = v18;
  void *v18 = v0;
  v18[1] = sub_1737C;
  uint64_t v19 = v0[104];
  uint64_t v20 = v0[100];
  return dispatch thunk of AsyncIteratorProtocol.next()(v20, v19, v17);
}

uint64_t sub_1A3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_1A410, 0, 0);
}

uint64_t sub_1A410()
{
  uint64_t v1 = (void *)v0[4];
  if (v1)
  {
    sub_7E34((void *)(v0[5] + 184), *(void *)(v0[5] + 208));
    id v2 = v1;
    sub_35070();
  }
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = sub_34F80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v3, v4, v5);
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_1A4E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_3C6C(&qword_417E8) + 48));
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_84B8;
  return v10(a1, a2, v7);
}

uint64_t sub_1A5F4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_3C6C(&qword_417B0);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  unint64_t v8 = v1[1];
  unint64_t v10 = *(void *)(*v1 + 16);
  if (v8 == v10)
  {
    uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v11(a1, 1, 1, v3);
  }
  else
  {
    if (v8 >= v10)
    {
      __break(1u);
    }
    else
    {
      uint64_t v20 = v5;
      uint64_t v12 = sub_35420();
      uint64_t v13 = *(void *)(v12 - 8);
      uint64_t v14 = v13;
      unint64_t v15 = v9
          + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))
          + *(void *)(v13 + 72) * v8;
      v1[1] = v8 + 1;
      uint64_t v16 = &v7[*(int *)(v3 + 48)];
      uint64_t v17 = v1[2];
      uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v13 + 16))(v16, v15, v12);
      if (!__OFADD__(v17, 1))
      {
        v1[2] = v17 + 1;
        uint64_t v18 = (char *)a1 + *(int *)(v3 + 48);
        *a1 = v17;
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v16, v12);
        return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(a1, 0, 1, v3);
      }
    }
    __break(1u);
  }
  return result;
}

void *sub_1A810(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_3C6C(&qword_417C0);
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_34E90();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v53 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_3C6C(&qword_417C8);
  uint64_t v12 = __chkstk_darwin(v52);
  unint64_t v51 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v50 = (void *)((char *)v41 - v15);
  __chkstk_darwin(v14);
  uint64_t v49 = (void *)((char *)v41 - v16);
  unint64_t v59 = &_swiftEmptyArrayStorage;
  sub_3173C(0, 0, 0);
  uint64_t v17 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  uint64_t v48 = v17;
  v41[1] = a1;
  v41[2] = v2;
  if (v17)
  {
    uint64_t v18 = 0;
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v19 = v10 + 16;
    uint64_t v20 = v21;
    uint64_t v22 = a1 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v23 = *(void *)(v19 + 56);
    uint64_t v56 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v46 = v8;
    uint64_t v47 = (unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 32);
    uint64_t v43 = (void (**)(char *, char *, uint64_t))(v19 + 16);
    uint64_t v44 = v23;
    uint64_t v45 = v19;
    while (1)
    {
      v20(v8, v22, v9);
      uint64_t v24 = *v56;
      (*v56)(v8, 0, 1, v9);
      if ((*v47)(v8, 1, v9) == 1) {
        break;
      }
      uint64_t v57 = v22;
      unint64_t v42 = v24;
      uint64_t v25 = *v43;
      uint64_t v26 = v53;
      (*v43)(v53, v8, v9);
      uint64_t v27 = v52;
      uint64_t v28 = &v51[*(int *)(v52 + 48)];
      v25(v28, v26, v9);
      uint64_t v29 = v50;
      uint64_t v30 = (char *)v50 + *(int *)(v27 + 48);
      void *v50 = v18;
      v25(v30, v28, v9);
      uint64_t v31 = (uint64_t)v29;
      os_log_type_t v32 = v49;
      sub_3CB0(v31, (uint64_t)v49, &qword_417C8);
      uint64_t v33 = *v32;
      uint64_t v34 = (char *)v32 + *(int *)(v27 + 48);
      uint64_t v35 = *(int *)(v55 + 48);
      uint64_t v36 = (uint64_t)v58;
      v20(v58, (uint64_t)v34, v9);
      *(void *)(v36 + v35) = v33;
      sub_8374((uint64_t)v32, &qword_417C8);
      os_log_type_t v37 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_3173C(0, v37[2] + 1, 1);
        os_log_type_t v37 = v59;
      }
      unint64_t v39 = v37[2];
      unint64_t v38 = v37[3];
      if (v39 >= v38 >> 1)
      {
        sub_3173C(v38 > 1, v39 + 1, 1);
        os_log_type_t v37 = v59;
      }
      ++v18;
      v37[2] = v39 + 1;
      sub_3CB0((uint64_t)v58, (uint64_t)v37+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v39, &qword_417C0);
      uint64_t v22 = v57 + v44;
      unint64_t v8 = v46;
      if (v48 == v18)
      {
        v42(v46, 1, 1, v9);
        break;
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_8374((uint64_t)v8, &qword_40F80);
  swift_bridgeObjectRelease();
  return v59;
}

uint64_t sub_1ACE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_361C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1 + 16;
  sub_7E34((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_35330();
  sub_7E34(v29, v29[3]);
  uint64_t v8 = sub_352D0();
  v28[3] = sub_34F40();
  v28[4] = &protocol witness table for AnyFeature;
  v28[0] = v8;
  int v9 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v28);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v29);
  if (qword_40C38 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_7900(v3, (uint64_t)qword_414B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
  uint64_t v11 = sub_361A0();
  os_log_type_t v12 = sub_36360();
  if (os_log_type_enabled(v11, v12))
  {
    int v25 = v9;
    uint64_t v26 = v7;
    uint64_t v27 = a1;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v29[0] = v24;
    *(_DWORD *)uint64_t v13 = 136315394;
    if (qword_40C30 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_414A0;
    unint64_t v15 = qword_414A8;
    swift_bridgeObjectRetain();
    v28[0] = sub_2F52C(v14, v15, v29);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    char v16 = v25;
    if (v25) {
      uint64_t v17 = 0x6576697470616441;
    }
    else {
      uint64_t v17 = 0x73656C6574617453;
    }
    if (v25) {
      unint64_t v18 = 0xE800000000000000;
    }
    else {
      unint64_t v18 = 0xE900000000000073;
    }
    v28[0] = sub_2F52C(v17, v18, v29);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "%s Running %s PICS Generation", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = v26;
    a1 = v27;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = v19 + 16;
    uint64_t v21 = &off_3DD28;
    uint64_t v22 = &type metadata for AdaptiveContactSuggestionGeneratorWrapper;
    goto LABEL_16;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v9) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v19 + 16;
  uint64_t v21 = &off_3DAE0;
  uint64_t v22 = &type metadata for LegacyContactSuggestionGeneratorWrapper;
LABEL_16:
  uint64_t result = sub_7DD0(v7, v20);
  a1[3] = (uint64_t)v22;
  a1[4] = (uint64_t)v21;
  *a1 = v19;
  return result;
}

uint64_t sub_1B0E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 16;
  sub_7E34((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_35330();
  sub_7E34(&v8, *((uint64_t *)&v9[0] + 1));
  uint64_t v4 = sub_352C0();
  v11[3] = sub_34F40();
  v11[4] = &protocol witness table for AnyFeature;
  v11[0] = v4;
  char v5 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v11);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v8);
  if (v5)
  {
    sub_7DD0(v3, (uint64_t)v9);
    *(void *)&long long v8 = 0xD000000000000020;
    *((void *)&v8 + 1) = 0x8000000000038550;
    *(void *)(a1 + 24) = &type metadata for AdaptiveMediaSuggestionGeneratorWrapper;
    *(void *)(a1 + 32) = &off_3D970;
    uint64_t result = swift_allocObject();
    long long v7 = v9[0];
    *(_OWORD *)(result + 16) = v8;
    *(_OWORD *)(result + 32) = v7;
    *(_OWORD *)(result + 48) = v9[1];
    *(void *)(result + 64) = v10;
  }
  else
  {
    uint64_t result = 0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
  }
  *(void *)a1 = result;
  return result;
}

uint64_t sub_1B230(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v5 - 8);
  uint64_t v47 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_34E90();
  uint64_t v7 = *(void *)(v46 - 8);
  uint64_t v8 = __chkstk_darwin(v46);
  uint64_t v43 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v32 - v10;
  uint64_t v12 = sub_35660();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v2 + 40);
  uint64_t v44 = v2;
  unint64_t v42 = (void *)(v2 + 16);
  sub_7E34((void *)(v2 + 16), v16);
  sub_35360();
  sub_357A0();
  swift_allocObject();
  uint64_t v17 = sub_35790();
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    uint64_t v45 = v17;
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    uint64_t v19 = v13 + 16;
    uint64_t v21 = a1 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v36 = *(void *)(v19 + 56);
    os_log_type_t v37 = v20;
    uint64_t v22 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v32[2] = v7 + 16;
    uint64_t v33 = v7;
    uint64_t v23 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v34 = (void (**)(char *, uint64_t))(v19 - 8);
    uint64_t v35 = v22;
    v32[1] = a1;
    swift_bridgeObjectRetain();
    uint64_t v40 = v11;
    uint64_t v41 = a2;
    uint64_t v38 = v19;
    uint64_t v39 = v12;
    do
    {
      v37(v15, v21, v12);
      sub_35640();
      if (*(void *)(a2 + 16) && (unint64_t v29 = sub_2FC00((uint64_t)v11), (v30 & 1) != 0))
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(v47, *(void *)(a2 + 56) + *(void *)(v33 + 72) * v29, v46);
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v24 = 1;
      }
      uint64_t v26 = v46;
      uint64_t v25 = (uint64_t)v47;
      (*v35)(v47, v24, 1, v46);
      sub_35630();
      sub_7E34(v42, *(void *)(v44 + 40));
      sub_35370();
      uint64_t v27 = v43;
      sub_34E80();
      uint64_t v11 = v40;
      sub_35780();
      swift_bridgeObjectRelease();
      uint64_t v28 = *v23;
      (*v23)(v27, v26);
      _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v48);
      sub_8374(v25, &qword_40F80);
      v28(v11, v26);
      uint64_t v12 = v39;
      (*v34)(v15, v39);
      v21 += v36;
      --v18;
      a2 = v41;
    }
    while (v18);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1B644(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = *v2;
  uint64_t v4 = sub_35540();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  sub_3C6C(&qword_416F0);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_34E10();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  sub_3C6C(&qword_41680);
  v3[15] = swift_task_alloc();
  uint64_t v6 = sub_34E60();
  v3[16] = v6;
  v3[17] = *(void *)(v6 - 8);
  v3[18] = swift_task_alloc();
  return _swift_task_switch(sub_1B858, 0, 0);
}

uint64_t sub_1B858()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[15];
  sub_34F60();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    uint64_t v4 = v0[15];
    uint64_t v5 = &qword_41680;
LABEL_5:
    sub_8374(v4, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12(0);
  }
  uint64_t v6 = (char *)v0[18];
  uint64_t v7 = v0[11];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[4];
  (*(void (**)(char *, void, void))(v0[17] + 32))(v6, v0[15], v0[16]);
  sub_1C31C(v6, v10, v9);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
  {
    uint64_t v11 = v0[10];
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v5 = (uint64_t *)&unk_416F0;
    uint64_t v4 = v11;
    goto LABEL_5;
  }
  uint64_t v14 = (void *)v0[14];
  (*(void (**)(void *, void, void))(v0[12] + 32))(v14, v0[10], v0[11]);
  v0[19] = sub_1CAE0(v14);
  unint64_t v15 = (void *)swift_task_alloc();
  v0[20] = v15;
  void *v15 = v0;
  v15[1] = sub_1BB50;
  uint64_t v16 = v0[14];
  return sub_1D718(v16);
}

uint64_t sub_1BB50(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 168) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1C12C;
  }
  else
  {
    *(void *)(v4 + 176) = a1;
    uint64_t v5 = sub_1BC80;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1BC80()
{
  uint64_t v12 = v0;
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v11 = (void *)v0[19];
  sub_2DC24(v1);
  swift_bridgeObjectRetain();
  sub_2221C(&v11);
  if (v2)
  {
    return swift_release();
  }
  else
  {
    uint64_t v5 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v6 = v0[11];
    uint64_t v7 = v0[12];
    swift_bridgeObjectRelease();
    uint64_t v8 = v11;
    v0[23] = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v4, v6);
    sub_35530();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[24] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1BDF0;
    uint64_t v10 = v0[5];
    v9[8] = v0[9];
    v9[9] = v10;
    v9[7] = v8;
    return _swift_task_switch(sub_1D280, 0, 0);
  }
}

uint64_t sub_1BDF0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    uint64_t v5 = sub_1C218;
  }
  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = sub_1BF3C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1BF3C()
{
  uint64_t v1 = v0[17];
  uint64_t v15 = v0[16];
  uint64_t v16 = v0[18];
  uint64_t v2 = v0[12];
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[14];
  uint64_t v3 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v11 = v0[7];
  uint64_t v4 = v0[5];
  sub_34F70();
  sub_364B0();
  swift_release();
  sub_351E0();
  sub_353D0();
  uint64_t v5 = sub_35470();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = sub_1F17C();
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = v4;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = sub_25388(v5, (void (*)(uint64_t, uint64_t))sub_25380, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(unint64_t *))v0[1];
  return v9(v8);
}

uint64_t sub_1C12C()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1C218()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[12] + 8))(v0[14], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1C31C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v5 = sub_3C6C(&qword_41680);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_34E60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v59 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v55 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v58 = (char *)&v55 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v57 = (char *)&v55 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v55 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v55 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  uint64_t v27 = (char *)&v55 - v26;
  __chkstk_darwin(v25);
  unint64_t v29 = (char *)&v55 - v28;
  uint64_t v60 = a1;
  sub_34E30();
  sub_8310(a2, (uint64_t)v7, &qword_41680);
  int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  uint64_t v61 = v29;
  if (v30 == 1)
  {
    sub_8374((uint64_t)v7, &qword_41680);
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v31(v24, v29, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v27, v24, v8);
  }
  else
  {
    os_log_type_t v32 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    uint64_t v56 = v14;
    v32(v21, v7, v8);
    sub_285C4(&qword_416A8, (void (*)(uint64_t))&type metadata accessor for Date);
    char v33 = sub_361E0();
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    if (v33) {
      uint64_t v34 = v29;
    }
    else {
      uint64_t v34 = v21;
    }
    uint64_t v14 = v56;
    v31(v24, v34, v8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v8);
    v32(v27, v24, v8);
  }
  sub_285C4(&qword_416A8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v35 = v60;
  if (sub_361E0())
  {
    if (qword_40C38 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_361C0();
    sub_7900(v36, (uint64_t)qword_414B0);
    v31(v14, v35, v8);
    os_log_type_t v37 = v59;
    v31(v59, v27, v8);
    uint64_t v38 = sub_361A0();
    int v39 = sub_36370();
    if (os_log_type_enabled(v38, (os_log_type_t)v39))
    {
      LODWORD(v58) = v39;
      uint64_t v60 = v27;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v57 = (char *)swift_slowAlloc();
      uint64_t v64 = v57;
      *(_DWORD *)uint64_t v40 = 136315650;
      if (qword_40C30 != -1) {
        swift_once();
      }
      uint64_t v41 = qword_414A0;
      unint64_t v42 = qword_414A8;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_2F52C(v41, v42, (uint64_t *)&v64);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      sub_285C4(&qword_41700, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v43 = sub_36560();
      uint64_t v63 = sub_2F52C(v43, v44, (uint64_t *)&v64);
      sub_363D0();
      swift_bridgeObjectRelease();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
      v45(v14, v8);
      *(_WORD *)(v40 + 22) = 2080;
      uint64_t v46 = v59;
      uint64_t v47 = sub_36560();
      uint64_t v63 = sub_2F52C(v47, v48, (uint64_t *)&v64);
      sub_363D0();
      swift_bridgeObjectRelease();
      v45(v46, v8);
      _os_log_impl(&dword_0, v38, (os_log_type_t)v58, "%s Conversation timestamps out of order (conversationTimestamp: %s, nextTimestamp: %s)", (uint8_t *)v40, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v49 = v60;
    }
    else
    {

      uint64_t v45 = *(void (**)(char *, uint64_t))(v9 + 8);
      v45(v37, v8);
      v45(v14, v8);
      uint64_t v49 = v27;
    }
    v45(v49, v8);
    v45(v61, v8);
    uint64_t v54 = sub_34E10();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v62, 1, 1, v54);
  }
  else
  {
    v31(v57, v35, v8);
    v31(v58, v27, v8);
    uint64_t v50 = v62;
    sub_34DF0();
    unint64_t v51 = *(void (**)(char *, uint64_t))(v9 + 8);
    v51(v27, v8);
    v51(v61, v8);
    uint64_t v52 = sub_34E10();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v50, 0, 1, v52);
  }
}

uint64_t sub_1CAE0(void *a1)
{
  uint64_t v4 = sub_3C6C(&qword_41688);
  __chkstk_darwin(v4 - 8);
  uint64_t v62 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_353D0();
  uint64_t v61 = *(void *)(v70 - 8);
  uint64_t v6 = __chkstk_darwin(v70);
  uint64_t v69 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v60 = (char *)&v57 - v8;
  uint64_t v64 = sub_34F90();
  uint64_t v72 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v71 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_3C6C(&qword_416D0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v65 = (void (**)(void, void))sub_34E60();
  uint64_t v59 = (uint64_t)*(v65 - 1);
  uint64_t v13 = __chkstk_darwin(v65);
  uint64_t v67 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v68 = (char *)&v57 - v15;
  uint64_t v74 = v1;
  uint64_t v73 = sub_1F2B8();
  uint64_t v16 = sub_11C1C((uint64_t)v73);
  BOOL v66 = v2;
  uint64_t v77 = &_swiftEmptySetSingleton;
  unint64_t v17 = *((void *)v16 + 2);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v19 = 0;
  uint64_t v63 = _swiftEmptyArrayStorage;
LABEL_2:
  if (v19 <= v17) {
    unint64_t v20 = v17;
  }
  else {
    unint64_t v20 = v19;
  }
  while (v17 != v19)
  {
    if (v20 == v19)
    {
      __break(1u);
      return result;
    }
    Swift::Int v21 = *(void *)&v16[8 * v19++ + 32];
    Swift::Int v75 = v21;
    sub_3C6C(&qword_416D8);
    Swift::Int v22 = sub_36220();
    char v24 = sub_1FB20(&v75, v22, v23);
    uint64_t result = swift_bridgeObjectRelease();
    if (v24)
    {
      uint64_t v58 = a1;
      uint64_t v25 = v63;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v76 = v25;
      uint64_t v26 = v12;
      if ((result & 1) == 0)
      {
        uint64_t result = sub_316E0(0, v25[2] + 1, 1);
        uint64_t v25 = v76;
      }
      unint64_t v28 = v25[2];
      unint64_t v27 = v25[3];
      if (v28 >= v27 >> 1)
      {
        uint64_t result = sub_316E0(v27 > 1, v28 + 1, 1);
        uint64_t v25 = v76;
      }
      v25[2] = v28 + 1;
      uint64_t v63 = v25;
      v25[v28 + 4] = v21;
      uint64_t v12 = v26;
      a1 = v58;
      goto LABEL_2;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v29 = (char *)sub_7E34((void *)(v74 + 104), *(void *)(v74 + 128));
  int v30 = v68;
  sub_34E00();
  uint64_t v31 = v67;
  os_log_type_t v32 = v30;
  sub_34DE0();
  char v33 = v66;
  uint64_t v34 = sub_35030();
  if (v33)
  {
    uint64_t v35 = *(void (**)(char *, void))(v59 + 8);
    uint64_t v36 = v65;
    v35(v31, v65);
    v35(v32, v36);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    uint64_t v37 = v34;
    uint64_t v74 = 0;
    uint64_t v38 = *(void (**)(char *, void))(v59 + 8);
    int v39 = v65;
    v38(v31, v65);
    v38(v32, v39);
    swift_retain();
    sub_364A0();
    uint64_t v59 = v37;
    swift_release();
    sub_36540();
    uint64_t v40 = v72;
    uint64_t v41 = v64;
    uint64_t v67 = *(char **)(v72 + 48);
    uint64_t v68 = (char *)(v72 + 48);
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v67)(v12, 1, v64) == 1)
    {
      unint64_t v29 = (char *)_swiftEmptyArrayStorage;
    }
    else
    {
      unint64_t v42 = *(uint64_t (**)(void, void, void))(v40 + 32);
      uint64_t v72 = v40 + 32;
      os_log_type_t v65 = (void (**)(void, void))(v40 + 8);
      BOOL v66 = v42;
      uint64_t v43 = (uint64_t)v62;
      unint64_t v44 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
      uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v61 + 32);
      unint64_t v29 = (char *)_swiftEmptyArrayStorage;
      do
      {
        uint64_t v46 = v71;
        uint64_t v47 = v12;
        uint64_t v48 = v66(v71, v12, v41);
        __chkstk_darwin(v48);
        *(&v57 - 2) = (uint64_t)v46;
        uint64_t v49 = v74;
        sub_11DDC((void (*)(uint64_t *__return_ptr, uint64_t))sub_2531C, (uint64_t)(&v57 - 4), (uint64_t)v73);
        uint64_t v74 = v49;
        sub_353B0();
        (*v65)(v46, v41);
        uint64_t v50 = v70;
        if ((*v44)(v43, 1, v70) == 1)
        {
          sub_8374(v43, &qword_41688);
        }
        else
        {
          unint64_t v51 = *v45;
          uint64_t v52 = v60;
          (*v45)(v60, v43, v50);
          uint64_t v53 = v52;
          uint64_t v54 = v50;
          v51(v69, (uint64_t)v53, v50);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v29 = (char *)sub_2C9C4(0, *((void *)v29 + 2) + 1, 1, (unint64_t)v29);
          }
          unint64_t v56 = *((void *)v29 + 2);
          unint64_t v55 = *((void *)v29 + 3);
          if (v56 >= v55 >> 1) {
            unint64_t v29 = (char *)sub_2C9C4(v55 > 1, v56 + 1, 1, (unint64_t)v29);
          }
          *((void *)v29 + 2) = v56 + 1;
          v51(&v29[((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v56], (uint64_t)v69, v54);
          uint64_t v43 = (uint64_t)v62;
          uint64_t v41 = v64;
        }
        uint64_t v12 = v47;
        sub_36540();
      }
      while (((unsigned int (*)(char *, uint64_t, uint64_t))v67)(v47, 1, v41) != 1);
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return (uint64_t)v29;
}

uint64_t sub_1D25C(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return _swift_task_switch(sub_1D280, 0, 0);
}

uint64_t sub_1D280()
{
  uint64_t v1 = v0[8];
  unint64_t v2 = *(void *)(v0[9] + 224);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_11FDC((void (*)(uint64_t *__return_ptr, uint64_t *))sub_252B8, v3, v2);
  v0[10] = v4;
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v5 = *((void *)v4 + 2);
  v0[11] = v5;
  if (v5)
  {
    uint64_t v6 = v0[7];
    v0[12] = v6;
    v0[13] = 0;
    sub_7DD0(v0[10] + 32, (uint64_t)(v0 + 2));
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[6];
    sub_7E34(v0 + 2, v7);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[14] = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_1D418;
    return dispatch thunk of EventStreamProcessing.process(_:)(v6, v7, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v0[7];
    uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
    return v11(v10);
  }
}

uint64_t sub_1D418(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 120) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_1D6B4;
  }
  else
  {
    *(void *)(v4 + 128) = a1;
    uint64_t v5 = sub_1D570;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_1D570()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[13] + 1;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 2));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[16];
    uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
    return v4(v3);
  }
  else
  {
    uint64_t v6 = v0[16];
    uint64_t v7 = v0[13] + 1;
    v0[12] = v6;
    v0[13] = v7;
    sub_7DD0(v0[10] + 40 * v7 + 32, (uint64_t)(v0 + 2));
    uint64_t v8 = v0[5];
    uint64_t v9 = v0[6];
    sub_7E34(v0 + 2, v8);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[14] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_1D418;
    return dispatch thunk of EventStreamProcessing.process(_:)(v6, v8, v9);
  }
}

uint64_t sub_1D6B4()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1D718(uint64_t a1)
{
  v2[8] = a1;
  v2[9] = v1;
  sub_3C6C(&qword_41680);
  v2[10] = swift_task_alloc();
  uint64_t v3 = sub_353D0();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  sub_3C6C(&qword_41688);
  v2[15] = swift_task_alloc();
  uint64_t v4 = sub_3C6C(&qword_41690);
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v5 = sub_34E60();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v6 = sub_3C6C(&qword_41698);
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  return _swift_task_switch(sub_1D980, 0, 0);
}

uint64_t sub_1D980()
{
  unint64_t v1 = *(void *)(v0[9] + 224);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v3 = sub_364F0();
    uint64_t v2 = v3;
    if (!v3) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v3 = swift_bridgeObjectRetain_n();
    if (!v2) {
      goto LABEL_11;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v7 = 0;
  do
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = sub_36470();
    }
    else
    {
      uint64_t v8 = *(void *)(v1 + 8 * v7 + 32);
      swift_retain();
    }
    ++v7;
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v8 + 152))();
    swift_release();
    sub_2DA5C(v9);
  }
  while (v2 != v7);
LABEL_11:
  swift_bridgeObjectRelease_n();
  uint64_t v10 = v0[9];
  uint64_t v11 = sub_24D60((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v12 = sub_24EFC(v11, v10);
  v0[27] = v12;
  swift_release();
  uint64_t v3 = swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v12 + 16);
  v0[28] = v13;
  if (v13)
  {
    v0[29] = 0;
    v0[30] = _swiftEmptyArrayStorage;
    uint64_t v14 = v0[27];
    if (*(void *)(v14 + 16))
    {
      sub_7DD0(v14 + 32, (uint64_t)(v0 + 2));
      uint64_t v15 = v0[5];
      uint64_t v16 = v0[6];
      sub_7E34(v0 + 2, v15);
      sub_34E00();
      unint64_t v17 = (void *)swift_task_alloc();
      v0[31] = v17;
      *unint64_t v17 = v0;
      v17[1] = sub_1DCA4;
      uint64_t v3 = v0[26];
      uint64_t v4 = v0[23];
      uint64_t v5 = v15;
      uint64_t v6 = v16;
      return dispatch thunk of EventStreamDefinition.events(since:)(v3, v4, v5, v6);
    }
LABEL_20:
    __break(1u);
    return dispatch thunk of EventStreamDefinition.events(since:)(v3, v4, v5, v6);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void *))v0[1];
  return v18(_swiftEmptyArrayStorage);
}

uint64_t sub_1DCA4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[20] + 8))(v2[23], v2[19]);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_1E72C;
  }
  else
  {
    uint64_t v4 = v2[23];
    uint64_t v5 = v2[19];
    uint64_t v6 = v2[20];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v2[33] = v7;
    v2[34] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v7(v4, v5);
    uint64_t v3 = sub_1DE14;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1DE14()
{
  sub_354A0();
  v0[35] = v0[30];
  uint64_t v1 = sub_28564(&qword_416A0, &qword_41690);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[36] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1DEF8;
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_1DEF8()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1E554;
  }
  else {
    uint64_t v2 = sub_1E00C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1E00C()
{
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    goto LABEL_7;
  }
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[20];
  uint64_t v7 = v0[10];
  uint64_t v1 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32);
  v1(v0[14], v2, v3);
  sub_35390();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5) == 1)
  {
    uint64_t v8 = v0[10];
    sub_34E20();
    sub_8374(v8, &qword_41680);
  }
  else
  {
    (*(void (**)(void, void, void))(v0[20] + 32))(v0[22], v0[10], v0[19]);
  }
  uint64_t v9 = (void (*)(uint64_t, uint64_t))v0[33];
  uint64_t v10 = v0[21];
  uint64_t v11 = v0[19];
  sub_34DE0();
  sub_285C4(&qword_416A8, (void (*)(uint64_t))&type metadata accessor for Date);
  char v12 = sub_361E0();
  v9(v10, v11);
  uint64_t v13 = v0[11];
  uint64_t v14 = v0[12];
  if (v12)
  {
    uint64_t v15 = v0[14];
    ((void (*)(void, void))v0[33])(v0[22], v0[19]);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v13);
LABEL_7:
    uint64_t v16 = v0[28];
    uint64_t v18 = v0[25];
    unint64_t v17 = v0[26];
    uint64_t v19 = v0[24];
    uint64_t v20 = v0[29] + 1;
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    (*(void (**)(unint64_t, uint64_t))(v18 + 8))(v17, v19);
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 2));
    if (v20 == v16)
    {
      swift_bridgeObjectRelease();
      uint64_t v21 = v0[35];
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      Swift::Int v22 = (uint64_t (*)(uint64_t))v0[1];
      return v22(v21);
    }
    uint64_t v24 = v0[35];
    unint64_t v25 = v0[29] + 1;
    v0[29] = v25;
    v0[30] = v24;
    uint64_t v26 = v0[27];
    if (v25 < *(void *)(v26 + 16))
    {
      sub_7DD0(v26 + 40 * v25 + 32, (uint64_t)(v0 + 2));
      uint64_t v27 = v0[5];
      uint64_t v28 = v0[6];
      sub_7E34(v0 + 2, v27);
      sub_34E00();
      unint64_t v29 = (void *)swift_task_alloc();
      v0[31] = v29;
      void *v29 = v0;
      v29[1] = sub_1DCA4;
      uint64_t v30 = v0[26];
      uint64_t v31 = v0[23];
      return dispatch thunk of EventStreamDefinition.events(since:)(v30, v31, v27, v28);
    }
    __break(1u);
    goto LABEL_22;
  }
  (*(void (**)(void, void, void))(v14 + 16))(v0[13], v0[14], v0[11]);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v17 = v0[35];
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
LABEL_22:
  }
    unint64_t v17 = sub_2C9C4(0, *(void *)(v17 + 16) + 1, 1, v17);
  unint64_t v34 = *(void *)(v17 + 16);
  unint64_t v33 = *(void *)(v17 + 24);
  unint64_t v35 = v34 + 1;
  uint64_t v48 = v1;
  if (v34 >= v33 >> 1)
  {
    uint64_t v46 = sub_2C9C4(v33 > 1, v34 + 1, 1, v17);
    unint64_t v35 = v34 + 1;
    unint64_t v17 = v46;
  }
  uint64_t v36 = (void (*)(uint64_t, uint64_t))v0[33];
  uint64_t v37 = v0[22];
  uint64_t v38 = v0[19];
  uint64_t v39 = v0[13];
  uint64_t v47 = v0[14];
  uint64_t v41 = v0[11];
  uint64_t v40 = v0[12];
  *(void *)(v17 + 16) = v35;
  v48(v17+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v34, v39, v41);
  v36(v37, v38);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v47, v41);
  v0[35] = v17;
  uint64_t v42 = sub_28564(&qword_416A0, &qword_41690);
  uint64_t v43 = (void *)swift_task_alloc();
  v0[36] = v43;
  *uint64_t v43 = v0;
  v43[1] = sub_1DEF8;
  uint64_t v44 = v0[15];
  uint64_t v45 = v0[16];
  return dispatch thunk of AsyncIteratorProtocol.next()(v44, v45, v42);
}

uint64_t sub_1E554()
{
  *(void *)(v0 + 56) = *(void *)(v0 + 296);
  sub_3C6C(&qword_40E00);
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1E600, 0, 0);
}

uint64_t sub_1E600()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1E72C()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_3C6C(&qword_41680);
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_34E90();
  __chkstk_darwin(v7 - 8);
  uint64_t v8 = sub_1F3F4();
  sub_1E968(a2, (unint64_t)v8);
  swift_bridgeObjectRelease();
  swift_retain();
  sub_28124(a4);
  swift_release();
  sub_351D0();
  sub_351C0();
  return sub_35400();
}

char *sub_1E968(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_3C6C(&qword_41688);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v57 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v42 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  char v12 = (char *)&v42 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v48 = (uint64_t)&v42 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = sub_353D0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v45 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  __chkstk_darwin(v24);
  uint64_t v44 = (char *)&v42 - v26;
  unint64_t v52 = *(void *)(a1 + 16);
  if (!v52) {
    return (char *)&_swiftEmptyArrayStorage;
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
  uint64_t v53 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
  unint64_t v42 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v47 = a1 + v42;
  uint64_t v49 = *(void *)(v21 + 72);
  BOOL v66 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  unint64_t v64 = a2 & 0xC000000000000001;
  v21 += 48;
  uint64_t v61 = (void (**)(uint64_t, char *, uint64_t))(v29 + 16);
  unint64_t v56 = v52 - 1;
  uint64_t v54 = v29;
  uint64_t v58 = (void (**)(uint64_t, uint64_t))(v29 - 8);
  uint64_t v46 = (char *)&_swiftEmptyArrayStorage;
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
    sub_8310(a1, (uint64_t)v15, &qword_41688);
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
          sub_36470();
        }
        else {
          swift_retain();
        }
        sub_8310((uint64_t)v15, (uint64_t)v9, &qword_41688);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v21)(v9, 1, v20) == 1)
        {
          sub_8374((uint64_t)v9, &qword_41688);
          v31(v12, 1, 1, v20);
        }
        else
        {
          uint64_t v32 = v62;
          (*v61)(v62, v9, v20);
          if (v60 == v56)
          {
            unint64_t v33 = v57;
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
              uint64_t v27 = sub_364F0();
              swift_bridgeObjectRelease();
              goto LABEL_4;
            }
            if (v55 >= v52) {
              goto LABEL_35;
            }
            unint64_t v33 = v57;
            v53((uint64_t)v57, v50, v20);
            v31(v33, 0, 1, v20);
            uint64_t v32 = v62;
          }
          sub_358D0();
          uint64_t v34 = (uint64_t)v33;
          char v12 = v63;
          sub_8374(v34, &qword_41688);
          (*v58)(v32, v20);
          uint64_t v27 = v59;
        }
        swift_release();
        ++a1;
        sub_8374((uint64_t)v15, &qword_41688);
        sub_3CB0((uint64_t)v12, (uint64_t)v15, &qword_41688);
        if (v27 == a1)
        {
          swift_bridgeObjectRelease();
          break;
        }
      }
    }
    uint64_t v35 = (uint64_t)v43;
    sub_3CB0((uint64_t)v15, (uint64_t)v43, &qword_41688);
    sub_8374(v48, &qword_41688);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v21)(v35, 1, v20) == 1)
    {
      sub_8374(v35, &qword_41688);
    }
    else
    {
      uint64_t v36 = *v61;
      uint64_t v37 = v44;
      (*v61)((uint64_t)v44, (char *)v35, v20);
      v53((uint64_t)v45, (unint64_t)v37, v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v46 = (char *)sub_2C9C4(0, *((void *)v46 + 2) + 1, 1, (unint64_t)v46);
      }
      unint64_t v39 = *((void *)v46 + 2);
      unint64_t v38 = *((void *)v46 + 3);
      uint64_t v27 = v59;
      if (v39 >= v38 >> 1) {
        uint64_t v46 = (char *)sub_2C9C4(v38 > 1, v39 + 1, 1, (unint64_t)v46);
      }
      uint64_t v40 = v46;
      *((void *)v46 + 2) = v39 + 1;
      v36((uint64_t)&v40[v42 + v39 * v49], v45, v20);
      (*v58)((uint64_t)v44, v20);
    }
    unint64_t v28 = v55;
  }
  while (v55 != v52);
  return v46;
}

void *sub_1F040()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (void *)sub_364F0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_36470();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 160))();
      swift_release();
      sub_2DA1C(v6);
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1F17C()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (void *)sub_364F0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_36470();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 112))();
      swift_release();
      sub_2DA88(v6);
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1F2B8()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (void *)sub_364F0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_36470();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 128))();
      swift_release();
      sub_2DA3C(v6);
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1F3F4()
{
  unint64_t v1 = *(void *)(v0 + 224);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = (void *)swift_bridgeObjectRetain_n();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (void *)sub_364F0();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = sub_36470();
      }
      else
      {
        uint64_t v5 = *(void *)(v1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      unint64_t v6 = (*(uint64_t (**)(void))(*(void *)v5 + 136))();
      swift_release();
      sub_2DE38(v6);
    }
    while (v2 != v4);
    swift_bridgeObjectRelease_n();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1F530@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  sub_7E34(a1, a1[3]);
  sub_350E0();
  sub_3C6C(&qword_40FB0);
  uint64_t v3 = sub_364C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_1F5CC()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 56);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 104);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 144);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 184);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriPrivateLearningInferenceEngine()
{
  return self;
}

uint64_t sub_1F660()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_414B0);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_414B0);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_1F728(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_36530();
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

uint64_t sub_1F7CC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1F7FC(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_34E90();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_361D0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_285C4(&qword_41000, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_361F0();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_20ACC((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1FB20(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_365E0();
  swift_bridgeObjectRetain();
  sub_36230();
  Swift::Int v8 = sub_36610();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_36570() & 1) != 0)
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
      if (v19 || (sub_36570() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_20D88(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1FCD0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_35480();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_285C4(&qword_416B0, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_361D0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_285C4(&qword_416B8, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
      char v21 = sub_361F0();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_20F24((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_1FFF4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_34E90();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_3C6C(&qword_41808);
  uint64_t v5 = sub_36440();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_361D0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_203F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_3C6C(&qword_416E8);
  uint64_t v3 = sub_36440();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
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
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_365E0();
      sub_36230();
      uint64_t result = sub_36610();
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
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_206D0()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_35480();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_3C6C(&qword_416C0);
  uint64_t v5 = sub_36440();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      unint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_285C4(&qword_416B0, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
      uint64_t result = sub_361D0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_20ACC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_34E90();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_1FFF4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_21394((uint64_t (*)(void))&type metadata accessor for UUID, &qword_41808);
      goto LABEL_12;
    }
    sub_21644();
  }
  uint64_t v12 = *v3;
  sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = sub_361D0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_285C4(&qword_41000, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = sub_361F0();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_36580();
  __break(1u);
  return result;
}

Swift::Int sub_20D88(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_203F0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_211E0();
      goto LABEL_22;
    }
    sub_219F4();
  }
  uint64_t v11 = *v4;
  sub_365E0();
  sub_36230();
  uint64_t result = sub_36610();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_36570(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_36580();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_36570();
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
  char v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
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

uint64_t sub_20F24(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_35480();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_206D0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_21394((uint64_t (*)(void))&type metadata accessor for EventStreamType, &qword_416C0);
      goto LABEL_12;
    }
    sub_21CA4();
  }
  uint64_t v12 = *v3;
  sub_285C4(&qword_416B0, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
  uint64_t v13 = sub_361D0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_285C4(&qword_416B8, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
      char v21 = sub_361F0();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_36580();
  __break(1u);
  return result;
}

void *sub_211E0()
{
  uint64_t v1 = v0;
  sub_3C6C(&qword_416E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_36430();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
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

void *sub_21394(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - v7;
  sub_3C6C(a2);
  uint64_t v9 = *v2;
  uint64_t v10 = sub_36430();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }
  uint64_t result = (void *)(v10 + 56);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  BOOL v26 = v4;
  uint64_t v27 = (const void *)(v9 + 56);
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v13) {
    uint64_t result = memmove(result, v27, 8 * v13);
  }
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 56);
  int64_t v28 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v22);
    ++v15;
    if (!v23)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v23 = *((void *)v27 + v15);
      if (!v23)
      {
        int64_t v15 = v22 + 2;
        if (v22 + 2 >= v28) {
          goto LABEL_28;
        }
        unint64_t v23 = *((void *)v27 + v15);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_12:
    unint64_t v21 = *(void *)(v6 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v21, v5);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(void *)(v11 + 48) + v21, v8, v5);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v28)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v4 = v26;
    goto LABEL_30;
  }
  unint64_t v23 = *((void *)v27 + v24);
  if (v23)
  {
    int64_t v15 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v15);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_21644()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_34E90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_3C6C(&qword_41808);
  uint64_t v7 = sub_36440();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_361D0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_219F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_3C6C(&qword_416E8);
  uint64_t v3 = sub_36440();
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_365E0();
    swift_bridgeObjectRetain();
    sub_36230();
    uint64_t result = sub_36610();
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
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

uint64_t sub_21CA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_35480();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_3C6C(&qword_416C0);
  uint64_t v7 = sub_36440();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_285C4(&qword_416B0, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
    uint64_t result = sub_361D0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2FC00(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_312D0();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_34E90();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v20 = v12;
    unint64_t v13 = *(void *)(v12 + 72) * v6;
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v10 + v13, v11);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, *(void *)(v9 + 56) + v13, v11);
    sub_247B0(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v11;
  }
  else
  {
    uint64_t v18 = sub_34E90();
    unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

Swift::Int sub_2221C(void **a1)
{
  uint64_t v2 = *(void *)(sub_353D0() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_24D38(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_222C4(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_222C4(uint64_t *a1)
{
  uint64_t v2 = sub_3C6C(&qword_41680);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v187 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  v211 = (char *)&v187 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v187 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v13 = (char *)&v187 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v190 = (char *)&v187 - v15;
  __chkstk_darwin(v14);
  unint64_t v189 = (char *)&v187 - v16;
  uint64_t v219 = sub_34E60();
  uint64_t v17 = *(void *)(v219 - 8);
  uint64_t v18 = __chkstk_darwin(v219);
  uint64_t v20 = (char *)&v187 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  v226 = (char *)&v187 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v187 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  v204 = (char *)&v187 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v188 = (char *)&v187 - v29;
  __chkstk_darwin(v28);
  uint64_t v194 = (char *)&v187 - v30;
  uint64_t v221 = sub_353D0();
  uint64_t v31 = *(void *)(v221 - 8);
  uint64_t v32 = __chkstk_darwin(v221);
  v200 = (char *)&v187 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __chkstk_darwin(v32);
  v222 = (char *)&v187 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v230 = (char *)&v187 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  v225 = (char *)&v187 - v39;
  uint64_t v40 = __chkstk_darwin(v38);
  v207 = (char *)&v187 - v41;
  uint64_t v42 = __chkstk_darwin(v40);
  v203 = (char *)&v187 - v43;
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v195 = (char *)&v187 - v45;
  __chkstk_darwin(v44);
  v193 = (char *)&v187 - v46;
  v228 = a1;
  Swift::Int v47 = a1[1];
  Swift::Int result = sub_36550(v47);
  if (result >= v47)
  {
    if ((v47 & 0x8000000000000000) == 0)
    {
      if (v47) {
        return sub_23614(0, v47, 1, v228);
      }
      return result;
    }
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
LABEL_166:
    __break(1u);
LABEL_167:
    __break(1u);
LABEL_168:
    __break(1u);
LABEL_169:
    Swift::Int result = sub_364E0();
    __break(1u);
    return result;
  }
  if (v47 >= 0) {
    uint64_t v49 = v47;
  }
  else {
    uint64_t v49 = v47 + 1;
  }
  if (v47 < -1) {
    goto LABEL_169;
  }
  Swift::Int v50 = result;
  v199 = v10;
  v210 = v20;
  uint64_t v198 = v25;
  if (v47 < 2)
  {
    uint64_t v53 = v31;
    unint64_t v205 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
    if (v47 != 1)
    {
      unint64_t v57 = _swiftEmptyArrayStorage[2];
      unint64_t v56 = (char *)_swiftEmptyArrayStorage;
      uint64_t v176 = _swiftEmptyArrayStorage;
      if (v57 < 2)
      {
LABEL_138:
        swift_bridgeObjectRelease();
        v176[2] = 0;
        return swift_bridgeObjectRelease();
      }
LABEL_125:
      uint64_t v177 = *v228;
      while (1)
      {
        unint64_t v178 = v57 - 2;
        if (v57 < 2) {
          goto LABEL_156;
        }
        if (!v177) {
          goto LABEL_168;
        }
        os_log_type_t v179 = v56;
        v180 = v56 + 32;
        uint64_t v181 = *(void *)&v56[16 * v178 + 32];
        uint64_t v182 = *(void *)&v56[16 * v57 + 24];
        uint64_t v183 = v53;
        uint64_t v184 = v208;
        sub_23B3C(v177 + *(void *)(v53 + 72) * v181, v177 + *(void *)(v53 + 72) * *(void *)&v180[16 * v57 - 16], v177 + *(void *)(v53 + 72) * v182, v205);
        if (v184) {
          goto LABEL_123;
        }
        if (v182 < v181) {
          goto LABEL_157;
        }
        uint64_t v208 = 0;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          os_log_type_t v179 = sub_2479C((uint64_t)v179);
        }
        if (v178 >= *((void *)v179 + 2)) {
          goto LABEL_158;
        }
        unint64_t v185 = &v179[16 * v178 + 32];
        *(void *)unint64_t v185 = v181;
        *((void *)v185 + 1) = v182;
        unint64_t v186 = *((void *)v179 + 2);
        if (v57 > v186) {
          goto LABEL_159;
        }
        unint64_t v56 = v179;
        memmove(&v179[16 * v57 + 16], &v179[16 * v57 + 32], 16 * (v186 - v57));
        *((void *)v179 + 2) = v186 - 1;
        unint64_t v57 = v186 - 1;
        uint64_t v53 = v183;
        if (v186 <= 2) {
          goto LABEL_138;
        }
      }
    }
    v187 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v51 = v49 >> 1;
    uint64_t v52 = sub_362C0();
    *(void *)(v52 + 16) = v51;
    uint64_t v53 = v31;
    unint64_t v54 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    v187 = (void *)v52;
    unint64_t v205 = v52 + v54;
  }
  unint64_t v55 = 0;
  v229 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48);
  v217 = (void (**)(char *, uint64_t, uint64_t))(v17 + 32);
  uint64_t v218 = v53 + 16;
  v215 = (void (**)(char *, uint64_t))(v53 + 8);
  v216 = (void (**)(char *, uint64_t))(v17 + 8);
  v224 = (void (**)(char *, char *, uint64_t))(v53 + 32);
  unint64_t v56 = (char *)_swiftEmptyArrayStorage;
  uint64_t v206 = v53;
  v212 = v5;
  v202 = v13;
  Swift::Int v192 = v50;
  while (1)
  {
    Swift::Int v58 = (Swift::Int)v55;
    Swift::Int v59 = (Swift::Int)(v55 + 1);
    if ((uint64_t)(v55 + 1) >= v47)
    {
      uint64_t v70 = v221;
      uint64_t v71 = v208;
    }
    else
    {
      Swift::Int v223 = v47;
      unint64_t v60 = v55;
      uint64_t v61 = *v228;
      uint64_t v62 = *(void *)(v53 + 72);
      uint64_t v209 = (uint64_t)(v55 + 1);
      uint64_t v63 = *(void (**)(char *, uint64_t, uint64_t))(v53 + 16);
      uint64_t v64 = v221;
      v63(v193, v61 + v62 * v59, v221);
      uint64_t v196 = v61;
      uint64_t v227 = v62;
      uint64_t v65 = v61 + v62 * (void)v60;
      BOOL v66 = v60;
      v214 = v63;
      v63(v195, v65, v64);
      uint64_t v67 = (uint64_t)v189;
      sub_35390();
      uint64_t v68 = *v229;
      uint64_t v69 = v219;
      if ((*v229)(v67, 1, v219) == 1)
      {
        sub_34E20();
        sub_8374(v67, &qword_41680);
      }
      else
      {
        (*v217)(v194, v67, v69);
      }
      uint64_t v72 = (uint64_t)v190;
      sub_35390();
      unsigned int v73 = v68(v72, 1, v69);
      uint64_t v74 = v69;
      v213 = v68;
      Swift::Int v47 = v223;
      uint64_t v191 = v56;
      Swift::Int v58 = (Swift::Int)v66;
      Swift::Int v75 = v188;
      if (v73 == 1)
      {
        sub_34E20();
        sub_8374(v72, &qword_41680);
      }
      else
      {
        (*v217)(v188, v72, v74);
      }
      uint64_t v76 = v194;
      LODWORD(v220) = sub_34E40();
      uint64_t v77 = *v216;
      (*v216)(v75, v74);
      v77(v76, v74);
      uint64_t v78 = *v215;
      uint64_t v79 = v221;
      (*v215)(v195, v221);
      v78(v193, v79);
      Swift::Int v59 = (Swift::Int)(v66 + 2);
      if ((uint64_t)(v66 + 2) >= v47)
      {
        uint64_t v70 = v221;
      }
      else
      {
        v201 = v66;
        v209 *= v227;
        uint64_t v80 = v196;
        uint64_t v197 = v227 * v59;
        uint64_t v70 = v221;
        while (1)
        {
          Swift::Int v81 = v59;
          uint64_t v82 = v214;
          v214(v203, v80 + v197, v70);
          v82(v207, v80 + v209, v70);
          sub_35390();
          uint64_t v83 = v219;
          uint64_t v84 = v213;
          if (v213((uint64_t)v13, 1, v219) == 1)
          {
            sub_34E20();
            sub_8374((uint64_t)v13, &qword_41680);
          }
          else
          {
            (*v217)(v204, (uint64_t)v13, v83);
          }
          uint64_t v85 = (uint64_t)v199;
          sub_35390();
          uint64_t v86 = v83;
          if (v84(v85, 1, v83) == 1)
          {
            unint64_t v87 = v198;
            sub_34E20();
            sub_8374(v85, &qword_41680);
          }
          else
          {
            unint64_t v87 = v198;
            (*v217)(v198, v85, v86);
          }
          uint64_t v88 = v86;
          uint64_t v89 = v204;
          int v90 = sub_34E40();
          v77(v87, v88);
          v77(v89, v88);
          uint64_t v70 = v221;
          v78(v207, v221);
          v78(v203, v70);
          unint64_t v13 = v202;
          if ((v220 ^ v90)) {
            break;
          }
          Swift::Int v59 = v81 + 1;
          v80 += v227;
          if (v223 == v81 + 1)
          {
            Swift::Int v47 = v223;
            Swift::Int v59 = v223;
            Swift::Int v58 = (Swift::Int)v201;
            goto LABEL_37;
          }
        }
        Swift::Int v59 = v81;
        Swift::Int v58 = (Swift::Int)v201;
        Swift::Int v47 = v223;
      }
LABEL_37:
      uint64_t v5 = v212;
      unint64_t v56 = v191;
      Swift::Int v50 = v192;
      uint64_t v53 = v206;
      uint64_t v71 = v208;
      if (v220)
      {
        if (v59 < v58) {
          goto LABEL_162;
        }
        if (v58 < v59)
        {
          uint64_t v91 = 0;
          uint64_t v92 = v227 * (v59 - 1);
          uint64_t v93 = v59 * v227;
          Swift::Int v94 = v58;
          v201 = (char *)v58;
          uint64_t v95 = v58 * v227;
          do
          {
            if (v94 != v59 + v91 - 1)
            {
              uint64_t v97 = v196;
              if (!v196) {
                goto LABEL_167;
              }
              uint64_t v208 = v71;
              unint64_t v98 = v196 + v95;
              uint64_t v99 = v196 + v92;
              v220 = (void (*)(char *, uint64_t, uint64_t))*v224;
              v220(v200, v196 + v95, v221);
              if (v95 < v92 || v98 >= v97 + v93)
              {
                uint64_t v96 = v221;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                uint64_t v96 = v221;
                if (v95 != v92) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              v220((char *)v99, (uint64_t)v200, v96);
              uint64_t v53 = v206;
              unint64_t v13 = v202;
              uint64_t v71 = v208;
              Swift::Int v47 = v223;
            }
            ++v94;
            --v91;
            v92 -= v227;
            v93 -= v227;
            v95 += v227;
          }
          while (v94 < v59 + v91);
          uint64_t v5 = v212;
          uint64_t v70 = v221;
          unint64_t v56 = v191;
          Swift::Int v50 = v192;
          Swift::Int v58 = (Swift::Int)v201;
        }
      }
    }
    if (v59 < v47)
    {
      if (__OFSUB__(v59, v58)) {
        goto LABEL_160;
      }
      if (v59 - v58 < v50)
      {
        if (__OFADD__(v58, v50)) {
          goto LABEL_163;
        }
        if (v58 + v50 >= v47) {
          Swift::Int v100 = v47;
        }
        else {
          Swift::Int v100 = v58 + v50;
        }
        if (v100 < v58) {
          goto LABEL_164;
        }
        if (v59 != v100)
        {
          v201 = (char *)v58;
          uint64_t v191 = v56;
          uint64_t v208 = v71;
          uint64_t v101 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 72);
          uint64_t v209 = *(void *)(v53 + 16);
          uint64_t v227 = (void)v101 * (v59 - 1);
          v213 = v101;
          Swift::Int v102 = v59 * (void)v101;
          uint64_t v197 = v100;
          do
          {
            uint64_t v104 = 0;
            char v105 = v201;
            v220 = (void (*)(char *, uint64_t, uint64_t))v59;
            v214 = (void (*)(char *, uint64_t, uint64_t))v102;
            while (1)
            {
              uint64_t v106 = *v228;
              Swift::Int v223 = v102 + v104;
              uint64_t v107 = v102 + v104 + v106;
              unint64_t v108 = (void (*)(char *, uint64_t, uint64_t))v209;
              ((void (*)(char *, uint64_t, uint64_t))v209)(v225, v107, v70);
              v108(v230, v227 + v104 + v106, v70);
              unint64_t v109 = v211;
              sub_35390();
              uint64_t v110 = (uint64_t)v109;
              uint64_t v111 = *v229;
              uint64_t v112 = v219;
              if ((*v229)(v110, 1, v219) == 1)
              {
                sub_34E20();
                sub_8374(v110, &qword_41680);
              }
              else
              {
                (*v217)(v226, v110, v112);
              }
              sub_35390();
              if (v111((uint64_t)v5, 1, v112) == 1)
              {
                uint64_t v113 = v210;
                sub_34E20();
                sub_8374((uint64_t)v5, &qword_41680);
              }
              else
              {
                uint64_t v113 = v210;
                (*v217)(v210, (uint64_t)v5, v112);
              }
              uint64_t v114 = v226;
              char v115 = sub_34E40();
              uint64_t v116 = *v216;
              (*v216)(v113, v112);
              v116(v114, v112);
              uint64_t v117 = *v215;
              uint64_t v70 = v221;
              (*v215)(v230, v221);
              v117(v225, v70);
              if ((v115 & 1) == 0) {
                break;
              }
              uint64_t v118 = *v228;
              Swift::Int v102 = (Swift::Int)v214;
              if (!*v228) {
                goto LABEL_165;
              }
              uint64_t v119 = (char *)(v118 + v227 + v104);
              uint64_t v120 = *v224;
              (*v224)(v222, (char *)v214 + v118 + v104, v70);
              swift_arrayInitWithTakeFrontToBack();
              v120(v119, v222, v70);
              uint64_t v5 = v212;
              v104 -= (uint64_t)v213;
              ++v105;
              uint64_t v103 = v220;
              if ((char *)v220 == v105) {
                goto LABEL_62;
              }
            }
            uint64_t v5 = v212;
            uint64_t v103 = v220;
            Swift::Int v102 = (Swift::Int)v214;
LABEL_62:
            Swift::Int v59 = (Swift::Int)v103 + 1;
            v227 += (uint64_t)v213;
            v102 += (Swift::Int)v213;
          }
          while (v59 != v197);
          Swift::Int v59 = v197;
          uint64_t v71 = v208;
          unint64_t v13 = v202;
          unint64_t v56 = v191;
          Swift::Int v58 = (Swift::Int)v201;
        }
      }
    }
    if (v59 < v58)
    {
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
      goto LABEL_161;
    }
    uint64_t v208 = v71;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v220 = (void (*)(char *, uint64_t, uint64_t))v59;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v56 = sub_2455C(0, *((void *)v56 + 2) + 1, 1, v56);
    }
    unint64_t v123 = *((void *)v56 + 2);
    unint64_t v122 = *((void *)v56 + 3);
    unint64_t v57 = v123 + 1;
    uint64_t v53 = v206;
    if (v123 >= v122 >> 1)
    {
      v175 = sub_2455C((char *)(v122 > 1), v123 + 1, 1, v56);
      uint64_t v53 = v206;
      unint64_t v56 = v175;
    }
    *((void *)v56 + 2) = v57;
    uint64_t v124 = v56 + 32;
    uint64_t v125 = &v56[16 * v123 + 32];
    int v126 = v220;
    *(void *)uint64_t v125 = v58;
    *((void *)v125 + 1) = v126;
    if (v123) {
      break;
    }
    unint64_t v57 = 1;
LABEL_15:
    Swift::Int v47 = v228[1];
    unint64_t v55 = (char *)v220;
    uint64_t v5 = v212;
    Swift::Int v50 = v192;
    if ((uint64_t)v220 >= v47)
    {
      uint64_t v176 = v187;
      if (v57 < 2) {
        goto LABEL_138;
      }
      goto LABEL_125;
    }
  }
  while (1)
  {
    unint64_t v127 = v57 - 1;
    if (v57 >= 4)
    {
      uint64_t v132 = &v124[16 * v57];
      uint64_t v133 = *((void *)v132 - 8);
      uint64_t v134 = *((void *)v132 - 7);
      BOOL v138 = __OFSUB__(v134, v133);
      uint64_t v135 = v134 - v133;
      if (v138) {
        goto LABEL_144;
      }
      uint64_t v137 = *((void *)v132 - 6);
      uint64_t v136 = *((void *)v132 - 5);
      BOOL v138 = __OFSUB__(v136, v137);
      uint64_t v130 = v136 - v137;
      char v131 = v138;
      if (v138) {
        goto LABEL_145;
      }
      unint64_t v139 = v57 - 2;
      uint64_t v140 = &v124[16 * v57 - 32];
      uint64_t v142 = *(void *)v140;
      uint64_t v141 = *((void *)v140 + 1);
      BOOL v138 = __OFSUB__(v141, v142);
      uint64_t v143 = v141 - v142;
      if (v138) {
        goto LABEL_147;
      }
      BOOL v138 = __OFADD__(v130, v143);
      uint64_t v144 = v130 + v143;
      if (v138) {
        goto LABEL_150;
      }
      if (v144 >= v135)
      {
        uint64_t v162 = &v124[16 * v127];
        uint64_t v164 = *(void *)v162;
        uint64_t v163 = *((void *)v162 + 1);
        BOOL v138 = __OFSUB__(v163, v164);
        uint64_t v165 = v163 - v164;
        if (v138) {
          goto LABEL_154;
        }
        BOOL v155 = v130 < v165;
        goto LABEL_112;
      }
    }
    else
    {
      if (v57 != 3)
      {
        uint64_t v156 = *((void *)v56 + 4);
        uint64_t v157 = *((void *)v56 + 5);
        BOOL v138 = __OFSUB__(v157, v156);
        uint64_t v149 = v157 - v156;
        char v150 = v138;
        goto LABEL_106;
      }
      uint64_t v129 = *((void *)v56 + 4);
      uint64_t v128 = *((void *)v56 + 5);
      BOOL v138 = __OFSUB__(v128, v129);
      uint64_t v130 = v128 - v129;
      char v131 = v138;
    }
    if (v131) {
      goto LABEL_146;
    }
    unint64_t v139 = v57 - 2;
    unint64_t v145 = &v124[16 * v57 - 32];
    uint64_t v147 = *(void *)v145;
    uint64_t v146 = *((void *)v145 + 1);
    BOOL v148 = __OFSUB__(v146, v147);
    uint64_t v149 = v146 - v147;
    char v150 = v148;
    if (v148) {
      goto LABEL_149;
    }
    v151 = &v124[16 * v127];
    uint64_t v153 = *(void *)v151;
    uint64_t v152 = *((void *)v151 + 1);
    BOOL v138 = __OFSUB__(v152, v153);
    uint64_t v154 = v152 - v153;
    if (v138) {
      goto LABEL_152;
    }
    if (__OFADD__(v149, v154)) {
      goto LABEL_153;
    }
    if (v149 + v154 >= v130)
    {
      BOOL v155 = v130 < v154;
LABEL_112:
      if (v155) {
        unint64_t v127 = v139;
      }
      goto LABEL_114;
    }
LABEL_106:
    if (v150) {
      goto LABEL_148;
    }
    uint64_t v158 = &v124[16 * v127];
    uint64_t v160 = *(void *)v158;
    uint64_t v159 = *((void *)v158 + 1);
    BOOL v138 = __OFSUB__(v159, v160);
    uint64_t v161 = v159 - v160;
    if (v138) {
      goto LABEL_151;
    }
    if (v161 < v149) {
      goto LABEL_15;
    }
LABEL_114:
    unint64_t v166 = v127 - 1;
    if (v127 - 1 >= v57)
    {
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
LABEL_154:
      __break(1u);
      goto LABEL_155;
    }
    if (!*v228) {
      goto LABEL_166;
    }
    uint64_t v167 = v13;
    v168 = v56;
    v169 = &v124[16 * v166];
    uint64_t v170 = *(void *)v169;
    uint64_t v171 = &v124[16 * v127];
    uint64_t v172 = *((void *)v171 + 1);
    uint64_t v173 = v208;
    sub_23B3C(*v228 + *(void *)(v53 + 72) * *(void *)v169, *v228 + *(void *)(v53 + 72) * *(void *)v171, *v228 + *(void *)(v53 + 72) * v172, v205);
    if (v173) {
      break;
    }
    if (v172 < v170) {
      goto LABEL_141;
    }
    if (v127 > *((void *)v168 + 2)) {
      goto LABEL_142;
    }
    *(void *)v169 = v170;
    *(void *)&v124[16 * v166 + 8] = v172;
    unint64_t v174 = *((void *)v168 + 2);
    if (v127 >= v174) {
      goto LABEL_143;
    }
    unint64_t v56 = v168;
    uint64_t v208 = 0;
    unint64_t v57 = v174 - 1;
    memmove(&v124[16 * v127], v171 + 16, 16 * (v174 - 1 - v127));
    *((void *)v168 + 2) = v174 - 1;
    uint64_t v53 = v206;
    unint64_t v13 = v167;
    if (v174 <= 2) {
      goto LABEL_15;
    }
  }
  uint64_t v176 = v187;
LABEL_123:
  swift_bridgeObjectRelease();
  v176[2] = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v64 = a4;
  uint64_t v48 = a1;
  uint64_t v6 = sub_3C6C(&qword_41680);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  unint64_t v56 = &v46[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  unint64_t v57 = &v46[-v9];
  uint64_t v10 = sub_34E60();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v55 = &v46[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  BOOL v66 = &v46[-v14];
  uint64_t v15 = sub_353D0();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v62 = &v46[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v68 = &v46[-v19];
  uint64_t result = __chkstk_darwin(v18);
  uint64_t v65 = &v46[-v22];
  uint64_t v60 = a3;
  uint64_t v47 = a2;
  if (a3 != a2)
  {
    uint64_t v24 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v21 + 16);
    uint64_t v23 = v21 + 16;
    uint64_t v25 = *(void *)(v23 + 56);
    uint64_t v52 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    uint64_t v53 = v24;
    uint64_t v51 = (void (**)(unsigned char *, uint64_t))(v11 + 8);
    uint64_t v49 = (void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 32);
    Swift::Int v50 = (void (**)(unsigned char *, uint64_t))(v23 - 8);
    uint64_t v54 = v23;
    uint64_t v61 = (void (**)(unsigned char *, uint64_t, uint64_t))(v23 + 16);
    uint64_t v67 = v25 * (v60 - 1);
    uint64_t v58 = v25;
    uint64_t v26 = v25 * v60;
LABEL_5:
    uint64_t v27 = 0;
    uint64_t v28 = v48;
    uint64_t v59 = v26;
    while (1)
    {
      uint64_t v29 = *v64;
      uint64_t v63 = v26 + v27;
      uint64_t v30 = v26 + v27 + v29;
      uint64_t v31 = v10;
      uint64_t v32 = v53;
      v53(v65, v30, v15);
      v32(v68, v67 + v27 + v29, v15);
      uint64_t v10 = v31;
      uint64_t v33 = (uint64_t)v57;
      sub_35390();
      uint64_t v34 = *v52;
      if ((*v52)(v33, 1, v31) == 1)
      {
        sub_34E20();
        sub_8374(v33, &qword_41680);
      }
      else
      {
        (*v49)(v66, v33, v31);
      }
      uint64_t v35 = (uint64_t)v56;
      sub_35390();
      if (v34(v35, 1, v31) == 1)
      {
        uint64_t v36 = v55;
        sub_34E20();
        sub_8374(v35, &qword_41680);
      }
      else
      {
        uint64_t v36 = v55;
        (*v49)(v55, v35, v31);
      }
      uint64_t v37 = v66;
      char v38 = sub_34E40();
      uint64_t v39 = v36;
      char v40 = v38;
      uint64_t v41 = *v51;
      (*v51)(v39, v31);
      v41(v37, v31);
      uint64_t v42 = (uint64_t (*)(unsigned char *, uint64_t))*v50;
      (*v50)(v68, v15);
      uint64_t result = v42(v65, v15);
      uint64_t v26 = v59;
      if ((v40 & 1) == 0)
      {
LABEL_4:
        v67 += v58;
        v26 += v58;
        if (++v60 == v47) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v43 = *v64;
      if (!*v64) {
        break;
      }
      uint64_t v44 = v43 + v67 + v27;
      uint64_t v45 = (uint64_t (*)(uint64_t, unsigned char *, uint64_t))*v61;
      (*v61)(v62, v43 + v59 + v27, v15);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = v45(v44, v62, v15);
      v27 -= v58;
      if (v60 == ++v28) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23B3C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_3C6C(&qword_41680);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v92 = (void (*)(uint64_t, unint64_t, uint64_t))((char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v91 = (void (**)(char *, uint64_t, uint64_t))((char *)&v84 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v84 - v14;
  __chkstk_darwin(v13);
  int v90 = (char *)&v84 - v16;
  uint64_t v17 = sub_34E60();
  uint64_t v94 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v89 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  unint64_t v98 = (char *)&v84 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v88 = (char *)&v84 - v23;
  __chkstk_darwin(v22);
  uint64_t v97 = (char *)&v84 - v24;
  uint64_t v25 = sub_353D0();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v101 = (char *)&v84 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v96 = (char *)&v84 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v100 = (uint64_t)&v84 - v32;
  __chkstk_darwin(v31);
  uint64_t v95 = (char *)&v84 - v33;
  uint64_t v99 = *(void *)(v34 + 72);
  if (!v99)
  {
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if (a2 - a1 == 0x8000000000000000 && v99 == -1) {
    goto LABEL_74;
  }
  int64_t v35 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v99 == -1) {
    goto LABEL_75;
  }
  uint64_t v36 = (uint64_t)(a2 - a1) / v99;
  unint64_t v104 = a1;
  unint64_t v103 = a4;
  uint64_t v37 = v35 / v99;
  if (v36 >= v35 / v99)
  {
    if ((v37 & 0x8000000000000000) == 0)
    {
      uint64_t v39 = v37 * v99;
      if (a4 < a2 || a2 + v39 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v95 = (char *)a4;
      unint64_t v59 = a4 + v39;
      unint64_t v102 = a4 + v39;
      unint64_t v104 = a2;
      int v90 = (char *)a1;
      if (v39 >= 1 && a1 < a2)
      {
        uint64_t v61 = -v99;
        uint64_t v62 = *(char **)(v26 + 16);
        uint64_t v99 = v94 + 48;
        uint64_t v100 = v61;
        unint64_t v87 = (void (**)(char *, uint64_t, uint64_t))(v94 + 32);
        uint64_t v88 = v62;
        uint64_t v63 = (void (**)(char *, uint64_t))(v94 + 8);
        uint64_t v93 = v25;
        uint64_t v94 = v26 + 16;
        uint64_t v85 = (void (**)(char *, uint64_t))(v26 + 8);
        uint64_t v86 = v63;
        do
        {
          uint64_t v64 = v88;
          ((void (*)(char *, unint64_t, uint64_t))v88)(v96, v59 + v61, v25);
          uint64_t v65 = (char *)(a2 + v61);
          ((void (*)(char *, unint64_t, uint64_t))v64)(v101, a2 + v61, v25);
          uint64_t v66 = (uint64_t)v91;
          sub_35390();
          uint64_t v67 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v99;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v99)(v66, 1, v17) == 1)
          {
            sub_34E20();
            sub_8374(v66, &qword_41680);
          }
          else
          {
            (*v87)(v98, v66, v17);
          }
          uint64_t v68 = (uint64_t)v92;
          sub_35390();
          int v69 = v67(v68, 1, v17);
          uint64_t v97 = (char *)a2;
          uint64_t v70 = v89;
          if (v69 == 1)
          {
            sub_34E20();
            sub_8374(v68, &qword_41680);
          }
          else
          {
            (*v87)(v89, v68, v17);
          }
          uint64_t v71 = v17;
          uint64_t v72 = v100;
          unsigned int v73 = (char *)(a3 + v100);
          uint64_t v74 = v98;
          char v75 = sub_34E40();
          uint64_t v76 = v70;
          char v77 = v75;
          uint64_t v78 = (char *)a3;
          uint64_t v79 = *v86;
          (*v86)(v76, v71);
          v79(v74, v71);
          uint64_t v80 = *v85;
          uint64_t v81 = v93;
          (*v85)(v101, v93);
          v80(v96, v81);
          uint64_t v17 = v71;
          if (v77)
          {
            if (v78 < v97 || v73 >= v97)
            {
              uint64_t v25 = v93;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v25 = v93;
              if (v78 != v97) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v61 = v100;
            v104 += v100;
          }
          else
          {
            unint64_t v82 = v102;
            v102 += v72;
            if ((unint64_t)v78 < v82 || (unint64_t)v73 >= v82)
            {
              uint64_t v25 = v93;
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v65 = v97;
            }
            else
            {
              uint64_t v25 = v93;
              uint64_t v65 = v97;
              if (v78 != (char *)v82) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t v61 = v100;
          }
          unint64_t v59 = v102;
          if (v102 <= (unint64_t)v95) {
            break;
          }
          a2 = (unint64_t)v65;
          a3 = (unint64_t)v73;
        }
        while (v65 > v90);
      }
      goto LABEL_72;
    }
  }
  else if ((v36 & 0x8000000000000000) == 0)
  {
    uint64_t v38 = v36 * v99;
    uint64_t v101 = v15;
    if (a4 < a1 || a1 + v38 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v98 = (char *)(a4 + v38);
    unint64_t v102 = a4 + v38;
    uint64_t v96 = (char *)a3;
    if (v38 >= 1 && a2 < a3)
    {
      unint64_t v41 = a4;
      uint64_t v42 = *(void (**)(uint64_t, unint64_t, uint64_t))(v26 + 16);
      uint64_t v43 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48);
      uint64_t v91 = (void (**)(char *, uint64_t, uint64_t))(v94 + 32);
      uint64_t v92 = v42;
      uint64_t v89 = (char *)(v94 + 8);
      uint64_t v94 = v26 + 16;
      uint64_t v44 = (void (**)(char *, uint64_t))(v26 + 8);
      do
      {
        uint64_t v45 = v43;
        uint64_t v46 = v92;
        v92((uint64_t)v95, a2, v25);
        v46(v100, v41, v25);
        uint64_t v43 = v45;
        uint64_t v47 = (uint64_t)v90;
        sub_35390();
        uint64_t v48 = *v45;
        if ((*v45)(v47, 1, v17) == 1)
        {
          sub_34E20();
          sub_8374(v47, &qword_41680);
        }
        else
        {
          (*v91)(v97, v47, v17);
        }
        uint64_t v49 = (uint64_t)v101;
        sub_35390();
        if (v48(v49, 1, v17) == 1)
        {
          Swift::Int v50 = v88;
          sub_34E20();
          sub_8374(v49, &qword_41680);
        }
        else
        {
          Swift::Int v50 = v88;
          (*v91)(v88, v49, v17);
        }
        uint64_t v51 = v97;
        char v52 = sub_34E40();
        uint64_t v53 = v50;
        uint64_t v54 = *(void (**)(char *, uint64_t))v89;
        (*(void (**)(char *, uint64_t))v89)(v53, v17);
        v54(v51, v17);
        unint64_t v55 = *v44;
        (*v44)((char *)v100, v25);
        v55(v95, v25);
        unint64_t v56 = v104;
        if (v52)
        {
          unint64_t v57 = a2 + v99;
          if (v104 < a2 || v104 >= v57)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v104 == a2)
          {
            unint64_t v56 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          unint64_t v58 = v103 + v99;
          if (v104 < v103 || v104 >= v58)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v104 != v103)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v103 = v58;
          unint64_t v57 = a2;
        }
        unint64_t v104 = v56 + v99;
        if (v103 >= (unint64_t)v98) {
          break;
        }
        unint64_t v41 = v103;
        a2 = v57;
      }
      while (v57 < (unint64_t)v96);
    }
LABEL_72:
    sub_24658(&v104, &v103, (uint64_t *)&v102, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
    return 1;
  }
LABEL_76:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

char *sub_2455C(char *result, int64_t a2, char a3, char *a4)
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
    sub_3C6C(&qword_416F8);
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

uint64_t sub_24658(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = sub_36530();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2479C(uint64_t a1)
{
  return sub_2455C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_247B0(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_34E90();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v33 = a2 + 64;
    unint64_t result = sub_363F0();
    uint64_t v12 = v33;
    if ((*(void *)(v33 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v30 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v32 = v13;
      uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v30(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v18 = sub_361D0();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v19 < v31 || a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else if (v19 < v31 && a1 < (uint64_t)v19)
        {
          goto LABEL_6;
        }
        int64_t v22 = v15 * a1;
        if (v15 * a1 < v17 || *(void *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v17 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v22 != v17)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v23 = *(void *)(a2 + 56);
        unint64_t result = v23 + v22;
        if (v22 < v17 || result >= v23 + v17 + v15)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v22 == v17) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v33;
      }
      while (((*(void *)(v33 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v24 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v24 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << a1) - 1;
  }
  *uint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24AB4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_34E90();
  uint64_t v26 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_2FC00(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_312D0();
      goto LABEL_7;
    }
    sub_30768(v16, a3 & 1);
    unint64_t v23 = sub_2FC00(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      unint64_t v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v10, a2, v8);
      return sub_30CC8(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = sub_36590();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v26 + 40);
  unint64_t v21 = v19[7] + *(void *)(v26 + 72) * v13;

  return v20(v21, a1, v8);
}

uint64_t sub_24CA0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v9 = sub_F688((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v9, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_7998(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_24D38(void *a1)
{
  return sub_31A88(0, a1[2], 0, a1);
}

uint64_t sub_24D4C(void *a1)
{
  return sub_31904(0, a1[2], 0, a1);
}

uint64_t sub_24D60(uint64_t a1)
{
  uint64_t v2 = sub_35480();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_285C4(&qword_416B0, (void (*)(uint64_t))&type metadata accessor for EventStreamType);
  uint64_t result = sub_36330();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    long long v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_1FCD0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_24EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v3 = sub_35480();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v25 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t v28 = v4 + 32;
  uint64_t v29 = v4 + 16;
  int64_t v26 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v27 = v4 + 8;
  uint64_t v34 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  uint64_t v16 = (char *)_swiftEmptyArrayStorage;
  while (v13)
  {
    unint64_t v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    unint64_t v18 = v17 | (v15 << 6);
LABEL_22:
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, *(void *)(v34 + 48) + *(void *)(v4 + 72) * v18, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    sub_353D0();
    sub_35430();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    if (v32)
    {
      sub_7998(&v31, (uint64_t)v33);
      sub_7998(v33, (uint64_t)&v31);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v16 = sub_2CA0C(0, *((void *)v16 + 2) + 1, 1, v16);
      }
      unint64_t v23 = *((void *)v16 + 2);
      unint64_t v22 = *((void *)v16 + 3);
      if (v23 >= v22 >> 1) {
        uint64_t v16 = sub_2CA0C((char *)(v22 > 1), v23 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v23 + 1;
      uint64_t result = sub_7998(&v31, (uint64_t)&v16[40 * v23 + 32]);
    }
  }
  int64_t v19 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v19 >= v26) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v25 + 8 * v19);
  ++v15;
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 1;
  if (v19 + 1 >= v26) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v25 + 8 * v15);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 2;
  if (v19 + 2 >= v26) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v25 + 8 * v15);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v15 = v19 + 3;
  if (v19 + 3 >= v26) {
    goto LABEL_28;
  }
  unint64_t v20 = *(void *)(v25 + 8 * v15);
  if (v20)
  {
LABEL_21:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v15 << 6);
    goto LABEL_22;
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v26)
  {
LABEL_28:
    swift_release();
    return (uint64_t)v16;
  }
  unint64_t v20 = *(void *)(v25 + 8 * v21);
  if (v20)
  {
    int64_t v15 = v21;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v15 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *(void *)(v25 + 8 * v15);
    ++v21;
    if (v20) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25270(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_252B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))(*(void *)(v2 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_2531C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_7E34(a1, a1[3]);
  uint64_t result = sub_35170();
  *a2 = result;
  return result;
}

uint64_t sub_25380(uint64_t a1, uint64_t a2)
{
  return sub_1E81C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t *sub_25388(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  unint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v17 = sub_35420();
  uint64_t v5 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v16 = v3;
    unint64_t v20 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_31700(0, v8, 0);
    uint64_t v9 = v20;
    uint64_t v10 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      swift_retain();
      swift_bridgeObjectRetain();
      v18(v11, v12);
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v20 = v9;
      unint64_t v14 = v9[2];
      unint64_t v13 = v9[3];
      if (v14 >= v13 >> 1)
      {
        sub_31700(v13 > 1, v14 + 1, 1);
        uint64_t v9 = v20;
      }
      _OWORD v9[2] = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))((unint64_t)v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v14, v7, v17);
      v10 += 2;
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t sub_25548(uint64_t a1)
{
  uint64_t v2 = sub_34E90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_35660();
  uint64_t v6 = *(void *)(v54 - 8);
  uint64_t v7 = __chkstk_darwin(v54);
  uint64_t v51 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v53 = (char *)&v38 - v9;
  uint64_t v10 = &_swiftEmptyDictionarySingleton;
  unint64_t v55 = &_swiftEmptyDictionarySingleton;
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11) {
    return (uint64_t)v10;
  }
  unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v12 = v6 + 16;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 64);
  uint64_t v15 = (v14 + 32) & ~v14;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v12 + 56);
  uint64_t v49 = v15;
  Swift::Int v50 = v13;
  uint64_t v42 = v14 | 7;
  uint64_t v43 = v17 + v15;
  char v52 = (void (**)(char *, char *, uint64_t))(v12 + 16);
  char v40 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v41 = v3 + 32;
  long long v39 = xmmword_36D00;
  uint64_t v46 = v3;
  uint64_t v47 = v2;
  uint64_t v18 = v2;
  uint64_t v44 = v12;
  uint64_t v45 = v5;
  v13(v53, a1 + v15, v54);
  while (1)
  {
    sub_35640();
    unint64_t v20 = sub_2FC00((uint64_t)v5);
    uint64_t v21 = v10[2];
    BOOL v22 = (v19 & 1) == 0;
    uint64_t v23 = v21 + v22;
    if (__OFADD__(v21, v22)) {
      break;
    }
    char v24 = v19;
    if (v10[3] < v23)
    {
      sub_30330(v23, 1);
      uint64_t v10 = v55;
      unint64_t v25 = sub_2FC00((uint64_t)v5);
      if ((v24 & 1) != (v26 & 1)) {
        goto LABEL_20;
      }
      unint64_t v20 = v25;
    }
    if (v24)
    {
      (*v40)(v5, v18);
      uint64_t v10 = v55;
      uint64_t v27 = v55[7];
      uint64_t v28 = *v52;
      (*v52)(v51, v53, v54);
      unint64_t v29 = *(void *)(v27 + 8 * v20);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v27 + 8 * v20) = v29;
      uint64_t v48 = v28;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v29 = sub_2CA68(0, *(void *)(v29 + 16) + 1, 1, v29);
        *(void *)(v27 + 8 * v20) = v29;
      }
      unint64_t v32 = *(void *)(v29 + 16);
      unint64_t v31 = *(void *)(v29 + 24);
      if (v32 >= v31 >> 1)
      {
        unint64_t v29 = sub_2CA68(v31 > 1, v32 + 1, 1, v29);
        *(void *)(v27 + 8 * v20) = v29;
      }
      uint64_t v5 = v45;
      *(void *)(v29 + 16) = v32 + 1;
      v48((char *)(v29 + v49 + v32 * v17), v51, v54);
      uint64_t v18 = v47;
    }
    else
    {
      sub_3C6C(&qword_417D0);
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = v39;
      (*v52)((char *)(v33 + v49), v53, v54);
      v10[(v20 >> 6) + 8] |= 1 << v20;
      (*(void (**)(unint64_t, char *, uint64_t))(v46 + 32))(v10[6] + *(void *)(v46 + 72) * v20, v5, v18);
      *(void *)(v10[7] + 8 * v20) = v33;
      uint64_t v34 = v10[2];
      BOOL v35 = __OFADD__(v34, 1);
      uint64_t v36 = v34 + 1;
      if (v35) {
        goto LABEL_19;
      }
      v10[2] = v36;
    }
    v16 += v17;
    if (!--v11) {
      return (uint64_t)v10;
    }
    v50(v53, v16, v54);
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_36590();
  __break(1u);
  return result;
}

uint64_t sub_25950(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v7 = (void *)sub_34E90();
  uint64_t v8 = *(v7 - 1);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3C6C(&qword_417C0);
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void *)(a1 + 16);
  if (v16)
  {
    uint64_t v52 = v3;
    uint64_t v53 = a1;
    uint64_t v17 = *(int *)(result + 48);
    unint64_t v50 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v18 = a1 + v50;
    uint64_t v58 = *(void *)(v13 + 72);
    swift_bridgeObjectRetain();
    sub_8310(v18, (uint64_t)v15, &qword_417C0);
    uint64_t v55 = v8;
    char v19 = *(void (**)(unint64_t, char *, void *))(v8 + 32);
    uint64_t v60 = (void (**)(char *, uint64_t, void *))(v8 + 32);
    uint64_t v51 = v19;
    v19((unint64_t)v10, v15, v7);
    uint64_t v56 = v17;
    unint64_t v57 = v15;
    unint64_t v20 = *(void **)&v15[v17];
    uint64_t v61 = (void **)a3;
    uint64_t v21 = *(void *)a3;
    unint64_t v23 = sub_2FC00((uint64_t)v10);
    uint64_t v24 = *(void *)(v21 + 16);
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      goto LABEL_26;
    }
    LOBYTE(a3) = v22;
    if (*(void *)(v21 + 24) >= v26)
    {
      uint64_t v30 = v60;
      if ((a2 & 1) == 0) {
        goto LABEL_28;
      }
      unint64_t v29 = v20;
      goto LABEL_9;
    }
    sub_2FF08(v26, a2 & 1);
    unint64_t v27 = sub_2FC00((uint64_t)v10);
    if ((a3 & 1) != (v28 & 1))
    {
LABEL_29:
      uint64_t result = sub_36590();
      __break(1u);
      return result;
    }
    unint64_t v23 = v27;
    unint64_t v29 = v20;
    while (1)
    {
      uint64_t v30 = v60;
LABEL_9:
      unint64_t v31 = v61;
      unint64_t v20 = *v61;
      unint64_t v59 = v7;
      uint64_t v54 = (void (**)(char *, void *))(v30 - 3);
      if (a3)
      {
        uint64_t v32 = *(void *)(v20[7] + 8 * v23);
        ((void (*)(char *, void *))*(v30 - 3))(v10, v7);
        *(void *)(*(void *)(*v31 + 56) + 8 * v23) = v32;
        uint64_t v33 = v31;
        unint64_t v34 = v16 - 1;
        if (v16 == 1) {
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        v20[(v23 >> 6) + 8] |= 1 << v23;
        v51(v20[6] + *(void *)(v55 + 72) * v23, v10, v7);
        *(void *)(v20[7] + 8 * v23) = v29;
        uint64_t v35 = v20[2];
        BOOL v36 = __OFADD__(v35, 1);
        uint64_t v37 = v35 + 1;
        if (v36) {
          goto LABEL_27;
        }
        v20[2] = v37;
        uint64_t v33 = v61;
        uint64_t v7 = v59;
        unint64_t v34 = v16 - 1;
        if (v16 == 1) {
          return swift_bridgeObjectRelease();
        }
      }
      unint64_t v23 = v53 + v58 + v50;
      while (1)
      {
        a3 = (uint64_t)v57;
        sub_8310(v23, (uint64_t)v57, &qword_417C0);
        unint64_t v20 = *v60;
        (*v60)(v10, a3, v7);
        uint64_t v39 = *(void *)(a3 + v56);
        char v40 = (void *)*v33;
        unint64_t v16 = sub_2FC00((uint64_t)v10);
        uint64_t v42 = v40[2];
        BOOL v43 = (v41 & 1) == 0;
        uint64_t v44 = v42 + v43;
        if (__OFADD__(v42, v43)) {
          break;
        }
        LOBYTE(a3) = v41;
        if (v40[3] < v44)
        {
          sub_2FF08(v44, 1);
          unint64_t v45 = sub_2FC00((uint64_t)v10);
          if ((a3 & 1) != (v46 & 1)) {
            goto LABEL_29;
          }
          unint64_t v16 = v45;
        }
        uint64_t v33 = v61;
        uint64_t v7 = *v61;
        if (a3)
        {
          uint64_t v38 = *(void *)(v7[7] + 8 * v16);
          uint64_t v7 = v59;
          (*v54)(v10, v59);
          *(void *)(*(void *)(*v33 + 56) + 8 * v16) = v38;
        }
        else
        {
          v7[(v16 >> 6) + 8] |= 1 << v16;
          ((void (*)(unint64_t, char *, void *))v20)(v7[6] + *(void *)(v55 + 72) * v16, v10, v59);
          *(void *)(v7[7] + 8 * v16) = v39;
          uint64_t v47 = v7[2];
          BOOL v36 = __OFADD__(v47, 1);
          uint64_t v48 = v47 + 1;
          if (v36) {
            goto LABEL_27;
          }
          v7[2] = v48;
          uint64_t v33 = v61;
          uint64_t v7 = v59;
        }
        v23 += v58;
        if (!--v34) {
          return swift_bridgeObjectRelease();
        }
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      unint64_t v29 = v20;
      sub_3103C();
    }
  }
  return result;
}

uint64_t sub_25DF0(unint64_t a1, unint64_t a2, char *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v92 = sub_34E90();
  uint64_t v81 = *(void *)(v92 - 8);
  uint64_t v10 = __chkstk_darwin(v92);
  uint64_t v85 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v84 = (char *)&v77 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v86 = (char *)&v77 - v15;
  __chkstk_darwin(v14);
  uint64_t v83 = (char *)&v77 - v16;
  uint64_t v17 = sub_35660();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v91 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  unint64_t v82 = (char *)&v77 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  int v90 = (char *)&v77 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v77 - v25;
  uint64_t v87 = *(void *)(v27 + 72);
  if (!v87)
  {
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  if (a2 - a1 == 0x8000000000000000 && v87 == -1) {
    goto LABEL_79;
  }
  char v28 = &a3[-a2];
  if (&a3[-a2] == (char *)0x8000000000000000 && v87 == -1) {
    goto LABEL_80;
  }
  uint64_t v29 = (uint64_t)(a2 - a1) / v87;
  unint64_t v95 = a1;
  unint64_t v94 = a4;
  uint64_t v30 = (uint64_t)v28 / v87;
  unint64_t v88 = a4;
  uint64_t v89 = a5;
  if (v29 >= (uint64_t)v28 / v87)
  {
    if ((v30 & 0x8000000000000000) == 0)
    {
      uint64_t v83 = (char *)a1;
      uint64_t v32 = v30 * v87;
      if (a4 < a2 || a2 + v32 <= a4)
      {
        unint64_t v33 = a4;
        unint64_t v34 = (unint64_t)a3;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        unint64_t v33 = a4;
        unint64_t v34 = (unint64_t)a3;
        if (v33 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v53 = v33 + v32;
      unint64_t v93 = v33 + v32;
      unint64_t v95 = a2;
      if (v32 >= 1 && (unint64_t)v83 < a2)
      {
        uint64_t v55 = -v87;
        uint64_t v56 = *(void (**)(char *, unint64_t, uint64_t))(v18 + 16);
        int v90 = (char *)(v81 + 8);
        uint64_t v80 = v56;
        uint64_t v81 = v18 + 16;
        uint64_t v78 = v17;
        uint64_t v79 = (void (**)(char *, uint64_t))(v18 + 8);
        do
        {
          unint64_t v57 = v80;
          v80(v82, v53 + v55, v17);
          unint64_t v58 = a2 + v55;
          v57(v91, a2 + v55, v17);
          uint64_t v59 = (uint64_t)v84;
          sub_35640();
          if (*(void *)(a5 + 16) && (unint64_t v60 = sub_2FC00(v59), (v61 & 1) != 0))
          {
            uint64_t v62 = a5;
            unint64_t v63 = *(void *)(*(void *)(a5 + 56) + 8 * v60);
          }
          else
          {
            uint64_t v62 = a5;
            unint64_t v63 = 0x8000000000000000;
          }
          uint64_t v86 = (char *)v63;
          uint64_t v64 = (uint64_t)v85;
          uint64_t v65 = *(void (**)(char *, uint64_t))v90;
          (*(void (**)(char *, uint64_t))v90)(v84, v92);
          sub_35640();
          uint64_t v66 = *(void *)(v62 + 16);
          uint64_t v87 = a2;
          if (v66)
          {
            unint64_t v67 = sub_2FC00(v64);
            uint64_t v68 = v78;
            if (v69) {
              int64_t v70 = *(void *)(*(void *)(v62 + 56) + 8 * v67);
            }
            else {
              int64_t v70 = 0x8000000000000000;
            }
          }
          else
          {
            int64_t v70 = 0x8000000000000000;
            uint64_t v68 = v78;
          }
          unint64_t v71 = v34 + v55;
          v65(v85, v92);
          uint64_t v72 = *v79;
          (*v79)(v91, v68);
          uint64_t v73 = v68;
          v72(v82, v68);
          if ((uint64_t)v86 >= v70)
          {
            unint64_t v75 = v93;
            v93 += v55;
            a5 = v89;
            if (v34 < v75 || v71 >= v75)
            {
              uint64_t v17 = v68;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v17 = v68;
              if (v34 != v75) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            unint64_t v58 = v87;
            unint64_t v74 = v88;
          }
          else
          {
            a5 = v89;
            if (v34 < v87 || v71 >= v87)
            {
              uint64_t v17 = v68;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v74 = v88;
            }
            else
            {
              unint64_t v74 = v88;
              uint64_t v17 = v73;
              if (v34 != v87) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v95 += v55;
          }
          unint64_t v53 = v93;
          if (v93 <= v74) {
            break;
          }
          a2 = v58;
          v34 += v55;
        }
        while (v58 > (unint64_t)v83);
      }
      goto LABEL_77;
    }
  }
  else if ((v29 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = v29 * v87;
    if (a4 < a1 || a1 + v31 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v91 = (char *)(a4 + v31);
    unint64_t v93 = a4 + v31;
    uint64_t v85 = a3;
    BOOL v35 = v31 < 1 || a2 >= (unint64_t)a3;
    uint64_t v36 = (uint64_t)v86;
    if (!v35)
    {
      uint64_t v84 = *(char **)(v18 + 16);
      uint64_t v37 = (void (**)(char *, uint64_t))(v81 + 8);
      uint64_t v81 = v18 + 16;
      uint64_t v38 = (void (**)(char *, uint64_t))(v18 + 8);
      do
      {
        uint64_t v39 = v84;
        ((void (*)(char *, unint64_t, uint64_t))v84)(v26, a2, v17);
        ((void (*)(char *, unint64_t, uint64_t))v39)(v90, v88, v17);
        uint64_t v40 = (uint64_t)v83;
        sub_35640();
        if (*(void *)(a5 + 16) && (unint64_t v41 = sub_2FC00(v40), (v42 & 1) != 0)) {
          int64_t v43 = *(void *)(*(void *)(a5 + 56) + 8 * v41);
        }
        else {
          int64_t v43 = 0x8000000000000000;
        }
        uint64_t v44 = *v37;
        (*v37)(v83, v92);
        sub_35640();
        uint64_t v45 = v89;
        if (*(void *)(v89 + 16) && (unint64_t v46 = sub_2FC00(v36), (v47 & 1) != 0)) {
          int64_t v48 = *(void *)(*(void *)(v45 + 56) + 8 * v46);
        }
        else {
          int64_t v48 = 0x8000000000000000;
        }
        v44(v86, v92);
        uint64_t v49 = *v38;
        (*v38)(v90, v17);
        v49(v26, v17);
        unint64_t v50 = v95;
        if (v43 >= v48)
        {
          unint64_t v52 = v94 + v87;
          a5 = v89;
          if (v95 < v94 || v95 >= v52)
          {
            swift_arrayInitWithTakeFrontToBack();
            uint64_t v36 = (uint64_t)v86;
          }
          else
          {
            uint64_t v36 = (uint64_t)v86;
            if (v95 != v94) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v94 = v52;
          unint64_t v51 = a2;
        }
        else
        {
          unint64_t v51 = a2 + v87;
          a5 = v89;
          if (v95 < a2 || v95 >= v51)
          {
            swift_arrayInitWithTakeFrontToBack();
            uint64_t v36 = (uint64_t)v86;
          }
          else
          {
            uint64_t v36 = (uint64_t)v86;
            if (v95 == a2) {
              unint64_t v50 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        unint64_t v95 = v50 + v87;
        unint64_t v88 = v94;
        if (v94 >= (unint64_t)v91) {
          break;
        }
        a2 = v51;
      }
      while (v51 < (unint64_t)v85);
    }
LABEL_77:
    sub_24658(&v95, &v94, (uint64_t *)&v93, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
    return 1;
  }
LABEL_81:
  swift_bridgeObjectRelease();
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_26674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v60 = a5;
  uint64_t v55 = a4;
  uint64_t v45 = a1;
  uint64_t v59 = sub_34E90();
  uint64_t v7 = *(void *)(v59 - 8);
  uint64_t v8 = __chkstk_darwin(v59);
  unint64_t v58 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = sub_35660();
  uint64_t v13 = __chkstk_darwin(v12);
  unint64_t v53 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v62 = (char *)&v43 - v16;
  uint64_t result = __chkstk_darwin(v15);
  unint64_t v57 = (char *)&v43 - v19;
  uint64_t v51 = a3;
  uint64_t v44 = a2;
  if (a3 != a2)
  {
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
    uint64_t v20 = v18 + 16;
    uint64_t v22 = *(void *)(v20 + 56);
    uint64_t v56 = (void (**)(char *, uint64_t))(v7 + 8);
    unint64_t v46 = (void (**)(char *, uint64_t))(v20 - 8);
    char v47 = v21;
    uint64_t v48 = v20;
    uint64_t v49 = v22;
    unint64_t v52 = (void (**)(char *, uint64_t, uint64_t))(v20 + 16);
    uint64_t v61 = v22 * (v51 - 1);
    uint64_t v23 = v22 * v51;
LABEL_5:
    uint64_t v24 = 0;
    uint64_t v25 = v45;
    uint64_t v50 = v23;
    while (1)
    {
      uint64_t v26 = *v55;
      uint64_t v54 = v23 + v24;
      uint64_t v27 = v47;
      v47(v57, v23 + v24 + v26, v12);
      v27(v62, v61 + v24 + v26, v12);
      sub_35640();
      uint64_t v28 = v60;
      if (*(void *)(v60 + 16) && (unint64_t v29 = sub_2FC00((uint64_t)v11), (v30 & 1) != 0)) {
        int64_t v31 = *(void *)(*(void *)(v28 + 56) + 8 * v29);
      }
      else {
        int64_t v31 = 0x8000000000000000;
      }
      uint64_t v32 = *v56;
      unint64_t v33 = v11;
      (*v56)(v11, v59);
      uint64_t v34 = (uint64_t)v58;
      sub_35640();
      uint64_t v35 = v60;
      if (*(void *)(v60 + 16) && (unint64_t v36 = sub_2FC00(v34), (v37 & 1) != 0)) {
        int64_t v38 = *(void *)(*(void *)(v35 + 56) + 8 * v36);
      }
      else {
        int64_t v38 = 0x8000000000000000;
      }
      uint64_t v11 = v33;
      v32(v58, v59);
      uint64_t v39 = *v46;
      (*v46)(v62, v12);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v39)(v57, v12);
      uint64_t v23 = v50;
      if (v31 >= v38)
      {
LABEL_4:
        v61 += v49;
        v23 += v49;
        if (++v51 == v44) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v40 = *v55;
      if (!*v55) {
        break;
      }
      uint64_t v41 = v40 + v61 + v24;
      char v42 = *v52;
      (*v52)(v53, v40 + v50 + v24, v12);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v42)(v41, v53, v12);
      v24 -= v49;
      if (v51 == ++v25) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_26A88(uint64_t *a1, uint64_t a2)
{
  uint64_t v231 = sub_34E90();
  uint64_t v4 = *(void *)(v231 - 8);
  uint64_t v5 = __chkstk_darwin(v231);
  uint64_t v227 = (char *)&v197 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v197 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v208 = (char *)&v197 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v197 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  v201 = (char *)&v197 - v16;
  __chkstk_darwin(v15);
  v200 = (char *)&v197 - v17;
  uint64_t v234 = sub_35660();
  uint64_t v18 = *(void *)(v234 - 8);
  uint64_t v19 = __chkstk_darwin(v234);
  uint64_t v206 = (char *)&v197 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  Swift::Int v223 = (char *)&v197 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v233 = (char *)&v197 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v226 = (char *)&v197 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  v212 = (char *)&v197 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v209 = (char *)&v197 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  v202 = (char *)&v197 - v32;
  __chkstk_darwin(v31);
  v199 = (char *)&v197 - v33;
  v229 = a1;
  Swift::Int v34 = a1[1];
  uint64_t v232 = a2;
  swift_bridgeObjectRetain_n();
  Swift::Int v35 = sub_36550(v34);
  if (v35 >= v34)
  {
    if ((v34 & 0x8000000000000000) == 0)
    {
      if (v34)
      {
        uint64_t v40 = v232;
        swift_bridgeObjectRetain();
        sub_26674(0, v34, 1, v229, v40);
      }
      return swift_bridgeObjectRelease_n();
    }
LABEL_171:
    __break(1u);
LABEL_172:
    __break(1u);
LABEL_173:
    __break(1u);
LABEL_174:
    __break(1u);
LABEL_175:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_176:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_177:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_178:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_179:
    swift_bridgeObjectRelease_n();
    uint64_t result = sub_364E0();
    __break(1u);
    return result;
  }
  if (v34 >= 0) {
    uint64_t v36 = v34;
  }
  else {
    uint64_t v36 = v34 + 1;
  }
  if (v34 < -1) {
    goto LABEL_179;
  }
  uint64_t v211 = v18;
  Swift::Int v204 = v35;
  if (v34 < 2)
  {
    unint64_t v210 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    uint64_t v198 = _swiftEmptyArrayStorage;
    if (v34 != 1)
    {
      unint64_t v43 = _swiftEmptyArrayStorage[2];
      uint64_t v181 = (char *)_swiftEmptyArrayStorage;
      if (v43 < 2)
      {
LABEL_149:
        swift_bridgeObjectRelease();
        v198[2] = 0;
        swift_bridgeObjectRelease_n();
        return swift_bridgeObjectRelease();
      }
LABEL_136:
      uint64_t v182 = *v229;
      uint64_t v234 = *v229;
      uint64_t v183 = v232;
      while (1)
      {
        unint64_t v184 = v43 - 2;
        if (v43 < 2) {
          goto LABEL_166;
        }
        if (!v182) {
          goto LABEL_178;
        }
        unint64_t v185 = v181;
        unint64_t v186 = v181 + 32;
        uint64_t v187 = *(void *)&v181[16 * v184 + 32];
        uint64_t v188 = *(void *)&v186[16 * v43 - 8];
        uint64_t v189 = *(void *)(v211 + 72);
        unint64_t v190 = v182 + v189 * v187;
        unint64_t v191 = v182 + v189 * *(void *)&v186[16 * v43 - 16];
        Swift::Int v192 = (char *)(v182 + v189 * v188);
        swift_bridgeObjectRetain();
        unint64_t v193 = v190;
        uint64_t v194 = v215;
        sub_25DF0(v193, v191, v192, v210, v183);
        uint64_t v215 = v194;
        if (v194)
        {
          v180 = v198;
          goto LABEL_133;
        }
        swift_bridgeObjectRelease();
        if (v188 < v187) {
          goto LABEL_167;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v185 = sub_2479C((uint64_t)v185);
        }
        if (v184 >= *((void *)v185 + 2)) {
          goto LABEL_168;
        }
        uint64_t v195 = &v185[16 * v184 + 32];
        *(void *)uint64_t v195 = v187;
        *((void *)v195 + 1) = v188;
        unint64_t v196 = *((void *)v185 + 2);
        if (v43 > v196) {
          goto LABEL_169;
        }
        uint64_t v181 = v185;
        memmove(&v185[16 * v43 + 16], &v185[16 * v43 + 32], 16 * (v196 - v43));
        *((void *)v185 + 2) = v196 - 1;
        unint64_t v43 = v196 - 1;
        uint64_t v182 = v234;
        if (v196 <= 2) {
          goto LABEL_149;
        }
      }
    }
  }
  else
  {
    uint64_t v37 = v36 >> 1;
    uint64_t v38 = sub_362C0();
    *(void *)(v38 + 16) = v37;
    unint64_t v39 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v198 = (void *)v38;
    unint64_t v210 = v38 + v39;
  }
  uint64_t v42 = 0;
  v230 = (void (**)(char *, uint64_t))(v4 + 8);
  v220 = (void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v221 = v18 + 16;
  v225 = (void (**)(char *, char *, uint64_t))(v18 + 32);
  v213 = v14;
  v214 = (char *)_swiftEmptyArrayStorage;
  v217 = v9;
  while (1)
  {
    Swift::Int v44 = v42;
    Swift::Int v45 = v42 + 1;
    Swift::Int v207 = v42;
    if (v42 + 1 >= v34)
    {
      uint64_t v57 = v234;
      Swift::Int v58 = v204;
    }
    else
    {
      uint64_t v46 = *v229;
      uint64_t v47 = v18;
      uint64_t v48 = *(void *)(v18 + 72);
      uint64_t v216 = v42 + 1;
      uint64_t v49 = v46 + v48 * v45;
      uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
      uint64_t v51 = v234;
      v50(v199, v49, v234);
      uint64_t v203 = v46;
      uint64_t v228 = v48;
      uint64_t v219 = v50;
      v50(v202, v46 + v48 * v44, v51);
      uint64_t v52 = (uint64_t)v200;
      sub_35640();
      uint64_t v53 = v232;
      if (*(void *)(v232 + 16) && (unint64_t v54 = sub_2FC00(v52), (v55 & 1) != 0)) {
        unint64_t v56 = *(void *)(*(void *)(v53 + 56) + 8 * v54);
      }
      else {
        unint64_t v56 = 0x8000000000000000;
      }
      v224 = (char *)v56;
      uint64_t v59 = (uint64_t)v201;
      uint64_t v60 = *v230;
      (*v230)(v200, v231);
      sub_35640();
      uint64_t v61 = v232;
      if (*(void *)(v232 + 16) && (unint64_t v62 = sub_2FC00(v59), (v63 & 1) != 0)) {
        unint64_t v64 = *(void *)(*(void *)(v61 + 56) + 8 * v62);
      }
      else {
        unint64_t v64 = 0x8000000000000000;
      }
      uint64_t v222 = v64;
      uint64_t v57 = v234;
      v60(v201, v231);
      uint64_t v65 = *v220;
      (*v220)(v202, v57);
      uint64_t v218 = v65;
      v65(v199, v57);
      Swift::Int v44 = v207;
      if (v207 + 2 >= v34)
      {
        Swift::Int v67 = v207 + 2;
      }
      else
      {
        v216 *= v228;
        uint64_t v66 = v203;
        Swift::Int v67 = v207 + 2;
        uint64_t v205 = v228 * (v207 + 2);
        while (1)
        {
          uint64_t v68 = v60;
          char v69 = v219;
          v219(v209, v66 + v205, v57);
          v69(v212, v66 + v216, v57);
          sub_35640();
          uint64_t v70 = v232;
          if (*(void *)(v232 + 16))
          {
            unint64_t v71 = sub_2FC00((uint64_t)v14);
            uint64_t v60 = v68;
            int64_t v73 = (v72 & 1) != 0 ? *(void *)(*(void *)(v70 + 56) + 8 * v71) : 0x8000000000000000;
            unint64_t v74 = v208;
            v68(v14, v231);
          }
          else
          {
            int64_t v73 = 0x8000000000000000;
            unint64_t v74 = v208;
            uint64_t v60 = v68;
            v68(v14, v231);
          }
          uint64_t v75 = (uint64_t)v74;
          sub_35640();
          uint64_t v76 = v232;
          if (*(void *)(v232 + 16) && (unint64_t v77 = sub_2FC00(v75), (v78 & 1) != 0)) {
            int64_t v79 = *(void *)(*(void *)(v76 + 56) + 8 * v77);
          }
          else {
            int64_t v79 = 0x8000000000000000;
          }
          BOOL v80 = (uint64_t)v224 < v222;
          v60(v208, v231);
          BOOL v81 = v73 >= v79;
          uint64_t v82 = v234;
          uint64_t v83 = v218;
          v218(v212, v234);
          v83(v209, v82);
          if (((v80 ^ v81) & 1) == 0) {
            break;
          }
          v66 += v228;
          ++v67;
          uint64_t v14 = v213;
          uint64_t v57 = v234;
          if (v34 == v67)
          {
            Swift::Int v67 = v34;
            Swift::Int v44 = v207;
            goto LABEL_43;
          }
        }
        uint64_t v14 = v213;
        uint64_t v57 = v234;
        Swift::Int v44 = v207;
      }
LABEL_43:
      uint64_t v9 = v217;
      Swift::Int v58 = v204;
      if ((uint64_t)v224 >= v222) {
        goto LABEL_56;
      }
      if (v67 < v44) {
        goto LABEL_172;
      }
      if (v44 >= v67)
      {
LABEL_56:
        Swift::Int v45 = v67;
        uint64_t v18 = v211;
      }
      else
      {
        uint64_t v222 = v34;
        uint64_t v84 = 0;
        uint64_t v85 = v228 * (v67 - 1);
        uint64_t v86 = v67 * v228;
        uint64_t v87 = v44 * v228;
        do
        {
          if (v44 != v67 + v84 - 1)
          {
            uint64_t v88 = v203;
            if (!v203) {
              goto LABEL_177;
            }
            unint64_t v89 = v203 + v87;
            uint64_t v90 = v203 + v85;
            v224 = (char *)*v225;
            ((void (*)(char *, uint64_t, uint64_t))v224)(v206, v203 + v87, v234);
            if (v87 < v85 || v89 >= v88 + v86)
            {
              uint64_t v57 = v234;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v57 = v234;
              if (v87 != v85) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            ((void (*)(uint64_t, char *, uint64_t))v224)(v90, v206, v57);
            uint64_t v14 = v213;
            Swift::Int v58 = v204;
          }
          ++v44;
          --v84;
          v85 -= v228;
          v86 -= v228;
          v87 += v228;
        }
        while (v44 < v67 + v84);
        Swift::Int v45 = v67;
        uint64_t v18 = v211;
        uint64_t v9 = v217;
        Swift::Int v44 = v207;
        Swift::Int v34 = v222;
      }
    }
    uint64_t v222 = v45;
    if (v45 < v34)
    {
      if (__OFSUB__(v45, v44)) {
        goto LABEL_170;
      }
      if (v45 - v44 < v58)
      {
        if (__OFADD__(v44, v58)) {
          goto LABEL_173;
        }
        if (v44 + v58 >= v34) {
          Swift::Int v91 = v34;
        }
        else {
          Swift::Int v91 = v44 + v58;
        }
        if (v91 < v44) {
          goto LABEL_174;
        }
        if (v222 != v91)
        {
          uint64_t v92 = *(char **)(v18 + 72);
          uint64_t v216 = *(void *)(v18 + 16);
          uint64_t v228 = (void)v92 * (v222 - 1);
          uint64_t v218 = (void (*)(char *, uint64_t))v92;
          uint64_t v93 = v222 * (void)v92;
          uint64_t v94 = v222;
          uint64_t v205 = v91;
          do
          {
            uint64_t v96 = 0;
            Swift::Int v97 = v44;
            uint64_t v222 = v94;
            uint64_t v219 = (void (*)(char *, uint64_t, uint64_t))v93;
            while (1)
            {
              uint64_t v98 = *v229;
              v224 = (char *)(v93 + v96);
              uint64_t v99 = v93 + v96 + v98;
              uint64_t v100 = (uint64_t)v9;
              uint64_t v101 = (void (*)(char *, uint64_t, uint64_t))v216;
              ((void (*)(char *, uint64_t, uint64_t))v216)(v226, v99, v57);
              v101(v233, v228 + v96 + v98, v57);
              sub_35640();
              uint64_t v102 = v232;
              if (!*(void *)(v232 + 16)) {
                goto LABEL_75;
              }
              unint64_t v103 = sub_2FC00(v100);
              if (v104) {
                int64_t v105 = *(void *)(*(void *)(v102 + 56) + 8 * v103);
              }
              else {
LABEL_75:
              }
                int64_t v105 = 0x8000000000000000;
              uint64_t v106 = v227;
              uint64_t v107 = *v230;
              (*v230)((char *)v100, v231);
              uint64_t v108 = (uint64_t)v106;
              sub_35640();
              uint64_t v109 = v232;
              if (*(void *)(v232 + 16) && (unint64_t v110 = sub_2FC00(v108), (v111 & 1) != 0)) {
                int64_t v112 = *(void *)(*(void *)(v109 + 56) + 8 * v110);
              }
              else {
                int64_t v112 = 0x8000000000000000;
              }
              v107(v227, v231);
              uint64_t v113 = *v220;
              uint64_t v114 = v234;
              (*v220)(v233, v234);
              v113(v226, v114);
              uint64_t v9 = v217;
              if (v105 >= v112) {
                break;
              }
              uint64_t v115 = *v229;
              uint64_t v93 = (uint64_t)v219;
              if (!*v229) {
                goto LABEL_175;
              }
              uint64_t v116 = v115 + v228 + v96;
              uint64_t v117 = (char *)*v225;
              (*v225)(v223, (char *)v219 + v115 + v96, v234);
              swift_arrayInitWithTakeFrontToBack();
              uint64_t v57 = v234;
              ((void (*)(uint64_t, char *, uint64_t))v117)(v116, v223, v234);
              v96 -= (uint64_t)v218;
              ++v97;
              uint64_t v95 = v222;
              if (v222 == v97) {
                goto LABEL_69;
              }
            }
            uint64_t v57 = v234;
            uint64_t v95 = v222;
            uint64_t v93 = (uint64_t)v219;
LABEL_69:
            uint64_t v94 = v95 + 1;
            v228 += (uint64_t)v218;
            v93 += (uint64_t)v218;
            Swift::Int v44 = v207;
          }
          while (v94 != v205);
          uint64_t v222 = v205;
          uint64_t v18 = v211;
          uint64_t v14 = v213;
        }
      }
    }
    if (v222 < v44)
    {
LABEL_165:
      __break(1u);
LABEL_166:
      __break(1u);
LABEL_167:
      __break(1u);
LABEL_168:
      __break(1u);
LABEL_169:
      __break(1u);
LABEL_170:
      __break(1u);
      goto LABEL_171;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v214 = sub_2455C(0, *((void *)v214 + 2) + 1, 1, v214);
    }
    unint64_t v119 = *((void *)v214 + 2);
    unint64_t v118 = *((void *)v214 + 3);
    unint64_t v43 = v119 + 1;
    if (v119 >= v118 >> 1) {
      v214 = sub_2455C((char *)(v118 > 1), v119 + 1, 1, v214);
    }
    uint64_t v120 = v214;
    *((void *)v214 + 2) = v43;
    uint64_t v121 = v120 + 32;
    unint64_t v122 = &v120[16 * v119 + 32];
    uint64_t v123 = v222;
    *(void *)unint64_t v122 = v44;
    *((void *)v122 + 1) = v123;
    if (v119) {
      break;
    }
    unint64_t v43 = 1;
LABEL_15:
    Swift::Int v34 = v229[1];
    uint64_t v42 = v222;
    uint64_t v9 = v217;
    if (v222 >= v34)
    {
      uint64_t v181 = v214;
      if (v43 < 2) {
        goto LABEL_149;
      }
      goto LABEL_136;
    }
  }
  uint64_t v228 = (uint64_t)v121;
  while (1)
  {
    unint64_t v124 = v43 - 1;
    if (v43 >= 4)
    {
      uint64_t v129 = &v121[16 * v43];
      uint64_t v130 = *((void *)v129 - 8);
      uint64_t v131 = *((void *)v129 - 7);
      BOOL v135 = __OFSUB__(v131, v130);
      uint64_t v132 = v131 - v130;
      if (v135) {
        goto LABEL_154;
      }
      uint64_t v134 = *((void *)v129 - 6);
      uint64_t v133 = *((void *)v129 - 5);
      BOOL v135 = __OFSUB__(v133, v134);
      uint64_t v127 = v133 - v134;
      char v128 = v135;
      if (v135) {
        goto LABEL_155;
      }
      unint64_t v136 = v43 - 2;
      uint64_t v137 = &v121[16 * v43 - 32];
      uint64_t v139 = *(void *)v137;
      uint64_t v138 = *((void *)v137 + 1);
      BOOL v135 = __OFSUB__(v138, v139);
      uint64_t v140 = v138 - v139;
      if (v135) {
        goto LABEL_157;
      }
      BOOL v135 = __OFADD__(v127, v140);
      uint64_t v141 = v127 + v140;
      if (v135) {
        goto LABEL_160;
      }
      if (v141 >= v132)
      {
        uint64_t v159 = &v121[16 * v124];
        uint64_t v161 = *(void *)v159;
        uint64_t v160 = *((void *)v159 + 1);
        BOOL v135 = __OFSUB__(v160, v161);
        uint64_t v162 = v160 - v161;
        if (v135) {
          goto LABEL_164;
        }
        BOOL v152 = v127 < v162;
        goto LABEL_122;
      }
    }
    else
    {
      if (v43 != 3)
      {
        uint64_t v153 = *((void *)v214 + 4);
        uint64_t v154 = *((void *)v214 + 5);
        BOOL v135 = __OFSUB__(v154, v153);
        uint64_t v146 = v154 - v153;
        char v147 = v135;
        goto LABEL_116;
      }
      uint64_t v126 = *((void *)v214 + 4);
      uint64_t v125 = *((void *)v214 + 5);
      BOOL v135 = __OFSUB__(v125, v126);
      uint64_t v127 = v125 - v126;
      char v128 = v135;
    }
    if (v128) {
      goto LABEL_156;
    }
    unint64_t v136 = v43 - 2;
    uint64_t v142 = &v121[16 * v43 - 32];
    uint64_t v144 = *(void *)v142;
    uint64_t v143 = *((void *)v142 + 1);
    BOOL v145 = __OFSUB__(v143, v144);
    uint64_t v146 = v143 - v144;
    char v147 = v145;
    if (v145) {
      goto LABEL_159;
    }
    BOOL v148 = &v121[16 * v124];
    uint64_t v150 = *(void *)v148;
    uint64_t v149 = *((void *)v148 + 1);
    BOOL v135 = __OFSUB__(v149, v150);
    uint64_t v151 = v149 - v150;
    if (v135) {
      goto LABEL_162;
    }
    if (__OFADD__(v146, v151)) {
      goto LABEL_163;
    }
    if (v146 + v151 >= v127)
    {
      BOOL v152 = v127 < v151;
LABEL_122:
      if (v152) {
        unint64_t v124 = v136;
      }
      goto LABEL_124;
    }
LABEL_116:
    if (v147) {
      goto LABEL_158;
    }
    BOOL v155 = &v121[16 * v124];
    uint64_t v157 = *(void *)v155;
    uint64_t v156 = *((void *)v155 + 1);
    BOOL v135 = __OFSUB__(v156, v157);
    uint64_t v158 = v156 - v157;
    if (v135) {
      goto LABEL_161;
    }
    if (v158 < v146) {
      goto LABEL_15;
    }
LABEL_124:
    unint64_t v163 = v124 - 1;
    if (v124 - 1 >= v43)
    {
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
      goto LABEL_165;
    }
    uint64_t v164 = *v229;
    if (!*v229) {
      goto LABEL_176;
    }
    uint64_t v165 = &v121[16 * v163];
    unint64_t v166 = v121;
    uint64_t v167 = *(void *)v165;
    unint64_t v168 = v124;
    v169 = &v166[16 * v124];
    uint64_t v170 = *((void *)v169 + 1);
    uint64_t v171 = *(void *)(v18 + 72);
    unint64_t v172 = v164 + v171 * *(void *)v165;
    unint64_t v173 = v164 + v171 * *(void *)v169;
    unint64_t v174 = (char *)(v164 + v171 * v170);
    uint64_t v175 = v232;
    swift_bridgeObjectRetain();
    unint64_t v176 = v172;
    uint64_t v177 = v215;
    sub_25DF0(v176, v173, v174, v210, v175);
    if (v177) {
      break;
    }
    swift_bridgeObjectRelease();
    unint64_t v178 = v214;
    if (v170 < v167) {
      goto LABEL_151;
    }
    if (v168 > *((void *)v214 + 2)) {
      goto LABEL_152;
    }
    *(void *)uint64_t v165 = v167;
    uint64_t v121 = (char *)v228;
    *(void *)(v228 + 16 * v163 + 8) = v170;
    unint64_t v179 = *((void *)v178 + 2);
    if (v168 >= v179) {
      goto LABEL_153;
    }
    uint64_t v215 = 0;
    unint64_t v43 = v179 - 1;
    memmove(v169, v169 + 16, 16 * (v179 - 1 - v168));
    *((void *)v178 + 2) = v179 - 1;
    uint64_t v18 = v211;
    uint64_t v14 = v213;
    if (v179 <= 2) {
      goto LABEL_15;
    }
  }
  v180 = v198;
LABEL_133:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v180[2] = 0;
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease();
}

uint64_t sub_27BBC(void **a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(sub_35660() - 8);
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)sub_24D4C(v5);
  }
  uint64_t v6 = v5[2];
  v8[0] = (uint64_t)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_26A88(v8, a2);
  swift_bridgeObjectRelease();
  *a1 = v5;
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_27CA4(uint64_t a1)
{
  uint64_t v2 = sub_34E90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v28 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v27 = (char *)v21 - v6;
  uint64_t v7 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  sub_285C4(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v29 = sub_36330();
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = v11 + 40;
    uint64_t v24 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v25 = v12;
    uint64_t v22 = (void (**)(char *, char *, uint64_t))(v11 + 16);
    uint64_t v23 = v14;
    uint64_t v26 = v11;
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    v21[1] = v15 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v18 = (uint64_t)v27;
    uint64_t v17 = v28;
    while (1)
    {
      v25(v9, v13, v2);
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v15;
      (*(void (**)(char *, void, uint64_t, uint64_t))v15)(v9, 0, 1, v2);
      if ((*v24)(v9, 1, v2) == 1) {
        break;
      }
      (*v22)(v17, v9, v2);
      sub_1F7FC(v18, v17);
      (*v16)(v18, v2);
      v13 += v23;
      if (!--v10) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v19(v9, 1, 1, v2);
  }
  return v29;
}

void sub_27F4C()
{
  if (qword_40C38 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_361C0();
  sub_7900(v0, (uint64_t)qword_414B0);
  oslog = sub_361A0();
  os_log_type_t v1 = sub_36350();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136315138;
    if (qword_40C30 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_414A0;
    unint64_t v4 = qword_414A8;
    swift_bridgeObjectRetain();
    sub_2F52C(v3, v4, &v6);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, oslog, v1, "%s run() finished", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

char *sub_28124(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v2 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    sub_7E34(v2, v2[3]);
    uint64_t v5 = sub_350A0();
    uint64_t v6 = *(void *)(v5 + 16);
    int64_t v7 = *((void *)v3 + 2);
    int64_t v8 = v7 + v6;
    if (__OFADD__(v7, v6)) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v8 <= *((void *)v3 + 3) >> 1)
    {
      if (*(void *)(v5 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v7 <= v8) {
        int64_t v10 = v7 + v6;
      }
      else {
        int64_t v10 = v7;
      }
      uint64_t v3 = sub_2C9F8(isUniquelyReferenced_nonNull_native, v10, 1, v3);
      if (*(void *)(v5 + 16))
      {
LABEL_14:
        uint64_t v11 = *((void *)v3 + 2);
        if ((*((void *)v3 + 3) >> 1) - v11 < v6) {
          goto LABEL_28;
        }
        unint64_t v12 = (unint64_t)&v3[40 * v11 + 32];
        if (v5 + 32 < v12 + 40 * v6 && v12 < v5 + 32 + 40 * v6) {
          goto LABEL_30;
        }
        sub_3C6C(&qword_416E0);
        swift_arrayInitWithCopy();
        if (v6)
        {
          uint64_t v14 = *((void *)v3 + 2);
          BOOL v15 = __OFADD__(v14, v6);
          uint64_t v16 = v14 + v6;
          if (v15) {
            goto LABEL_29;
          }
          *((void *)v3 + 2) = v16;
        }
        goto LABEL_4;
      }
    }
    if (v6) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 5;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_release();
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2832C()
{
  swift_bridgeObjectRelease();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 32);

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_2836C()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_283A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *int64_t v8 = v4;
  void v8[4] = a3;
  v8[5] = v3;
  uint64_t v8[2] = a1;
  v8[3] = a2;
  v8[1] = sub_84B8;
  return _swift_task_switch(sub_1A410, 0, 0);
}

uint64_t sub_28464()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2849C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_812C;
  int64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_41778 + dword_41778);
  return v8(a1, a2, v6);
}

uint64_t sub_28564(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25270(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_285A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1F530(*(void **)(v1 + 16), a1);
}

uint64_t sub_285C4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeWithCopy for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for LegacyContactSuggestionGeneratorWrapper(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, uint64_t a2)
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyContactSuggestionGeneratorWrapper(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyContactSuggestionGeneratorWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyContactSuggestionGeneratorWrapper()
{
  return &type metadata for LegacyContactSuggestionGeneratorWrapper;
}

void sub_28784()
{
  sub_3C6C(&qword_41840);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_41810 = 91;
  *(void *)algn_41818 = 0xE100000000000000;
}

uint64_t sub_2880C(void (*a1)(uint8_t *, char *, uint64_t))
{
  unint64_t v77 = a1;
  uint64_t v67 = sub_34E90();
  uint64_t v72 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v66 = (char *)v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_35810();
  uint64_t v71 = *(void *)(v69 - 8);
  uint64_t v2 = __chkstk_darwin(v69);
  unint64_t v74 = (uint8_t *)v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v68 = (char *)v60 - v4;
  sub_35C00();
  uint64_t v5 = sub_35BF0();
  uint64_t v76 = sub_3C6C(&qword_41838);
  uint64_t v6 = sub_35670();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  long long v75 = xmmword_36D00;
  *(_OWORD *)(v9 + 16) = xmmword_36D00;
  uint64_t v10 = *(void (**)(unint64_t, void, uint64_t))(v7 + 104);
  v10(v9 + v8, enum case for ContactSuggestionTag.domainPhoneCall(_:), v6);
  sub_32B50(v9);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v73 = sub_35BE0();
  swift_bridgeObjectRelease();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v75;
  v10(v11 + v8, enum case for ContactSuggestionTag.domainMessages(_:), v6);
  sub_32B50(v11);
  swift_setDeallocating();
  unint64_t v12 = v70;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v60[2] = v5;
  uint64_t v13 = sub_35BE0();
  swift_bridgeObjectRelease();
  v80[0] = v73;
  sub_2D850(v13);
  uint64_t v14 = v80[0];
  sub_7E34(v12, v12[3]);
  sub_35370();
  sub_7E34(v80, (uint64_t)v81);
  uint64_t v15 = sub_35A60();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v80);
  if (qword_40C48 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_361C0();
  uint64_t v73 = sub_7900(v16, (uint64_t)qword_41820);
  uint64_t v17 = sub_361A0();
  LOBYTE(v18) = sub_36360();
  BOOL v19 = os_log_type_enabled((os_log_t)v17, (os_log_type_t)v18);
  uint64_t v61 = v14;
  if (!v19)
  {

    uint64_t v22 = v68;
    goto LABEL_7;
  }
  uint64_t v20 = v15;
  uint64_t v21 = (uint8_t *)swift_slowAlloc();
  v80[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v21 = 136315138;
  uint64_t v22 = v68;
  if (qword_40C40 != -1) {
    goto LABEL_35;
  }
  while (1)
  {
    uint64_t v23 = qword_41810;
    unint64_t v24 = *(void *)algn_41818;
    swift_bridgeObjectRetain();
    unint64_t v79 = sub_2F52C(v23, v24, v80);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, (os_log_t)v17, (os_log_type_t)v18, "%s Generated Suggestions:", v21, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v12 = v70;
    uint64_t v15 = v20;
    uint64_t v14 = v61;
LABEL_7:
    sub_12280(8224, 0xE200000000000000, v14);
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_361A0();
    os_log_type_t v26 = sub_36360();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = v71;
    if (v27)
    {
      uint64_t v29 = v15;
      uint64_t v30 = swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315394;
      if (qword_40C40 != -1) {
        swift_once();
      }
      uint64_t v31 = qword_41810;
      unint64_t v32 = *(void *)algn_41818;
      swift_bridgeObjectRetain();
      unint64_t v79 = sub_2F52C(v31, v32, v80);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2048;
      uint64_t v33 = v29;
      unint64_t v79 = *(void *)(v29 + 16);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v25, v26, "%s Combining with %ld existing PLUS suggestions from disk:", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v12 = v70;
      uint64_t v28 = v71;
      uint64_t v14 = v61;
    }
    else
    {

      swift_bridgeObjectRelease();
      uint64_t v33 = v15;
    }
    sub_12280(8224, 0xE200000000000000, v33);
    sub_7E34(v12, v12[3]);
    sub_35360();
    sub_357A0();
    swift_allocObject();
    uint64_t v34 = sub_35790();
    unint64_t v79 = 0;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t v62 = sub_2A210(v14, v33, v34, &v79);
    swift_bridgeObjectRelease_n();
    v60[1] = v34;
    swift_release();
    Swift::Int v35 = sub_361A0();
    os_log_type_t v36 = sub_36360();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      if (qword_40C40 != -1) {
        swift_once();
      }
      uint64_t v38 = qword_41810;
      unint64_t v39 = *(void *)algn_41818;
      swift_bridgeObjectRetain();
      uint64_t v78 = sub_2F52C(v38, v39, v80);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v35, v36, "%s Writing combined suggestions to disk:", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      unint64_t v12 = v70;
      uint64_t v28 = v71;
    }
    else
    {
    }
    uint64_t v40 = v62;
    sub_12280(8224, 0xE200000000000000, (uint64_t)v62);
    sub_7E34(v12, v12[3]);
    sub_35370();
    uint64_t v21 = v81;
    LOBYTE(v18) = v82;
    uint64_t v17 = (uint64_t)sub_7E34(v80, (uint64_t)v81);
    sub_35A30();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v80);
    uint64_t v20 = v40[2];
    uint64_t v42 = v69;
    if (v20)
    {
      Swift::Int v45 = *(void (**)(uint8_t *, char *, uint64_t))(v28 + 16);
      uint64_t v43 = v28 + 16;
      Swift::Int v44 = v45;
      uint64_t v46 = (char *)v62 + ((*(unsigned __int8 *)(v43 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 64));
      uint64_t v76 = *(void *)(v43 + 56);
      *(void *)&long long v75 = v43 - 8;
      uint64_t v65 = (void (**)(char *, uint64_t))(v72 + 8);
      *(void *)&long long v41 = 136315394;
      long long v64 = v41;
      char v63 = (char *)&type metadata for Any + 8;
      unint64_t v77 = v45;
      uint64_t v71 = v43;
      v45((uint8_t *)v22, v46, v69);
      while (1)
      {
        sub_7E34(v12, v12[3]);
        sub_35370();
        uint64_t v21 = v81;
        LOBYTE(v18) = v82;
        sub_7E34(v80, (uint64_t)v81);
        uint64_t v17 = sub_35A50();
        _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v80);
        if (v17)
        {
          (*(void (**)(char *, uint64_t))v75)(v22, v42);
        }
        else
        {
          uint64_t v21 = v74;
          v44(v74, v22, v42);
          uint64_t v18 = sub_361A0();
          os_log_type_t v47 = sub_36360();
          if (os_log_type_enabled(v18, v47))
          {
            uint64_t v48 = swift_slowAlloc();
            uint64_t v72 = swift_slowAlloc();
            v80[0] = v72;
            *(_DWORD *)uint64_t v48 = v64;
            if (qword_40C40 != -1) {
              swift_once();
            }
            uint64_t v49 = qword_41810;
            unint64_t v50 = *(void *)algn_41818;
            swift_bridgeObjectRetain();
            *(void *)(v48 + 4) = sub_2F52C(v49, v50, v80);
            swift_bridgeObjectRelease();
            *(_WORD *)(v48 + 12) = 2080;
            uint64_t v51 = v66;
            uint64_t v52 = v74;
            sub_357F0();
            sub_2A3C0(&qword_417B8, (void (*)(uint64_t))&type metadata accessor for UUID);
            uint64_t v53 = v67;
            uint64_t v54 = sub_36560();
            unint64_t v56 = v55;
            (*v65)(v51, v53);
            *(void *)(v48 + 14) = sub_2F52C(v54, v56, v80);
            swift_bridgeObjectRelease();
            uint64_t v21 = (uint8_t *)v75;
            uint64_t v17 = *(void *)v75;
            uint64_t v42 = v69;
            (*(void (**)(uint8_t *, uint64_t))v75)(v52, v69);
            _os_log_impl(&dword_0, v18, v47, "%s Unable to save PICS with id = %s to storage", (uint8_t *)v48, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            uint64_t v22 = v68;
            ((void (*)(char *, uint64_t))v17)(v68, v42);
            unint64_t v12 = v70;
          }
          else
          {

            LOBYTE(v18) = v75;
            uint64_t v17 = *(void *)v75;
            (*(void (**)(uint8_t *, uint64_t))v75)(v21, v42);
            ((void (*)(char *, uint64_t))v17)(v22, v42);
          }
        }
        Swift::Int v44 = v77;
        v46 += v76;
        if (!--v20) {
          break;
        }
        v77((uint8_t *)v22, v46, v42);
      }
    }
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v57 = *(void *)(v61 + 16);
    swift_bridgeObjectRelease();
    unint64_t v58 = v57 - v79;
    if (!__OFSUB__(v57, v79)) {
      break;
    }
    __break(1u);
LABEL_35:
    swift_once();
  }
  if ((v58 & 0x8000000000000000) == 0 && !HIDWORD(v58) && (v79 & 0x8000000000000000) == 0 && !HIDWORD(v79)) {
    return 0;
  }
  uint64_t result = sub_364E0();
  __break(1u);
  return result;
}

uint64_t sub_29598@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  long long v75 = a4;
  Swift::Int v91 = a1;
  uint64_t v79 = a5;
  uint64_t v9 = sub_34E90();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_35810();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v82 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v67 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  BOOL v80 = (char *)&v67 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v22 = __chkstk_darwin(v21);
  __chkstk_darwin(v22);
  uint64_t v24 = __chkstk_darwin((char *)&v67 - v23);
  os_log_type_t v26 = (char *)&v67 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v67 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  uint64_t v35 = *(void *)(a2 + 16);
  if (!v35)
  {
LABEL_17:
    uint64_t v64 = v32;
    sub_34E80();
    uint64_t v65 = v12;
    uint64_t v66 = v91;
    sub_35770();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v65, v9);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v64 + 16))(v79, v66, v13);
  }
  unint64_t v74 = (char *)&v67 - v31;
  uint64_t v84 = v30;
  BOOL v81 = v18;
  uint64_t v68 = v34;
  uint64_t v69 = v33;
  uint64_t v70 = v12;
  uint64_t v71 = a3;
  uint64_t v72 = v10;
  uint64_t v73 = v9;
  uint64_t v76 = v6;
  uint64_t v77 = v32;
  os_log_type_t v36 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  uint64_t v88 = v32 + 16;
  unint64_t v89 = v36;
  uint64_t v37 = v35;
  uint64_t v38 = (char *)(a2 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)));
  uint64_t v87 = *(void *)(v32 + 72);
  unint64_t v39 = (void (**)(uint64_t, uint64_t))(v32 + 8);
  uint64_t v78 = a2;
  swift_bridgeObjectRetain();
  uint64_t v85 = v37;
  uint64_t v86 = v38;
  uint64_t v90 = v39;
  uint64_t v83 = v29;
  uint64_t v40 = v84;
  do
  {
    uint64_t v92 = v37;
    long long v41 = v89;
    v89(v29, v38, v13);
    uint64_t v42 = v91;
    char v43 = sub_357C0();
    v41(v26, v29, v13);
    v41((char *)v40, v42, v13);
    if (v43)
    {
      uint64_t v44 = sub_35800();
      uint64_t v45 = sub_35800();
      char v46 = sub_29CC4(v44, v45);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v46 = 0;
    }
    os_log_type_t v47 = *v90;
    (*v90)(v40, v13);
    v47((uint64_t)v26, v13);
    if (v46)
    {
      swift_bridgeObjectRelease();
      char v63 = v74;
      (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v74, v83, v13);
      sub_357B0();
      return ((uint64_t (*)(char *, uint64_t))v47)(v63, v13);
    }
    uint64_t v29 = v83;
    v47((uint64_t)v83, v13);
    v38 += v87;
    uint64_t v37 = v92 - 1;
  }
  while (v92 != 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v49 = v80;
  uint64_t v48 = v81;
  unint64_t v50 = v86;
  uint64_t v51 = (void (*)(char *))v89;
  while (1)
  {
    uint64_t v86 = v50;
    v51(v49);
    uint64_t v52 = v91;
    char v53 = sub_357D0();
    ((void (*)(char *, char *, uint64_t))v51)(v48, v49, v13);
    uint64_t v54 = v82;
    ((void (*)(char *, char *, uint64_t))v51)(v82, v52, v13);
    if (v53) {
      break;
    }
    v47((uint64_t)v54, v13);
    v47((uint64_t)v48, v13);
LABEL_10:
    v47((uint64_t)v49, v13);
    unint64_t v50 = &v86[v87];
    if (!--v85)
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = v77;
      uint64_t v10 = v72;
      uint64_t v9 = v73;
      unint64_t v12 = v70;
      goto LABEL_17;
    }
  }
  sub_35800();
  sub_35800();
  sub_35670();
  unint64_t v55 = v54;
  sub_2A3C0(&qword_41848, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionTag);
  char v56 = sub_360E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v57 = v55;
  uint64_t v49 = v80;
  v47((uint64_t)v57, v13);
  v47((uint64_t)v48, v13);
  if ((v56 & 1) == 0) {
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  unint64_t v58 = *(void (**)(uint64_t, char *, uint64_t))(v77 + 32);
  uint64_t v59 = v68;
  v58((uint64_t)v68, v49, v13);
  uint64_t v60 = v69;
  v58(v69, v59, v13);
  sub_357B0();
  uint64_t v61 = v70;
  sub_34E80();
  sub_35770();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v61, v73);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v47)(v60, v13);
  if (__OFADD__(*v75, 1)) {
    __break(1u);
  }
  else {
    ++*v75;
  }
  return result;
}

uint64_t sub_29CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_35670();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v45 = (char *)&v34 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - v12;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v14 = 0;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v38 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = v5 + 32;
  uint64_t v43 = a2 + 56;
  uint64_t v44 = v5 + 16;
  uint64_t v19 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v34 = v13;
  uint64_t v35 = v5;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    uint64_t v25 = *(void *)(v5 + 72);
    os_log_type_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v45, v13, v4);
    sub_2A3C0(&qword_41848, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionTag);
    uint64_t v27 = sub_361D0();
    uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v29 = v27 & ~v28;
    if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*v19)(v45, v4);
      return 0;
    }
    uint64_t v39 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v30 = a2;
    uint64_t v31 = ~v28;
    while (1)
    {
      v26(v8, *(void *)(v30 + 48) + v29 * v25, v4);
      sub_2A3C0(&qword_41850, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionTag);
      char v32 = sub_361F0();
      uint64_t v33 = *v19;
      (*v19)(v8, v4);
      if (v32) {
        break;
      }
      unint64_t v29 = (v29 + 1) & v31;
      if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v33(v45, v4);
        return 0;
      }
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v45, v4);
    a2 = v30;
    uint64_t v5 = v35;
    a1 = v36;
    uint64_t v13 = v34;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v21);
    int64_t v23 = v14 + 1;
    if (!v22)
    {
      int64_t v23 = v14 + 2;
      if (v14 + 2 >= v38) {
        return 1;
      }
      unint64_t v22 = *(void *)(v37 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v14 + 3;
        if (v14 + 3 >= v38) {
          return 1;
        }
        unint64_t v22 = *(void *)(v37 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v14 + 4;
          if (v14 + 4 >= v38) {
            return 1;
          }
          unint64_t v22 = *(void *)(v37 + 8 * v23);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v40 = (v22 - 1) & v22;
    int64_t v41 = v23;
  }
  uint64_t v24 = v14 + 5;
  if (v14 + 5 >= v38) {
    return 1;
  }
  unint64_t v22 = *(void *)(v37 + 8 * v24);
  if (v22)
  {
    int64_t v23 = v14 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v23 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v23 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v23);
    ++v24;
    if (v22) {
      goto LABEL_24;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

unint64_t sub_2A108()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_2A124()
{
  return 1;
}

uint64_t sub_2A12C(void (*a1)(uint8_t *, char *, uint64_t))
{
  return 0;
}

uint64_t sub_2A148()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41820);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41820);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *sub_2A210(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v21 = a3;
  unint64_t v22 = a4;
  uint64_t v20 = a2;
  uint64_t v19 = sub_35810();
  uint64_t v7 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    int64_t v23 = _swiftEmptyArrayStorage;
    sub_31608(0, v10, 0);
    uint64_t v11 = v23;
    unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v12 = (char *)(a1 + v18);
    uint64_t v13 = *(void *)(v7 + 72);
    while (1)
    {
      sub_29598(v12, v20, v21, v22, (uint64_t)v9);
      if (v5) {
        break;
      }
      uint64_t v5 = 0;
      int64_t v23 = v11;
      unint64_t v15 = v11[2];
      unint64_t v14 = v11[3];
      if (v15 >= v14 >> 1)
      {
        sub_31608(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v23;
      }
      v11[2] = v15 + 1;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v11 + v18 + v15 * v13, v9, v19);
      v12 += v13;
      if (!--v10) {
        return v11;
      }
    }
    swift_release();
  }
  return v11;
}

uint64_t sub_2A3C0(unint64_t *a1, void (*a2)(uint64_t))
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

Swift::Int sub_2A408()
{
  Swift::UInt32 v1 = *v0;
  sub_365E0();
  sub_36600(v1);
  return sub_36610();
}

void sub_2A450()
{
  sub_36600(*v0);
}

Swift::Int sub_2A47C()
{
  Swift::UInt32 v1 = *v0;
  sub_365E0();
  sub_36600(v1);
  return sub_36610();
}

uint64_t sub_2A4C0@<X0>(unsigned int *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_2AC00(*a1);
  *a2 = result;
  return result;
}

void sub_2A4EC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_2A4F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2A51C(char a1)
{
  *(unsigned char *)(v1 + 25) = a1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2A5B0;
  return sub_165E8();
}

uint64_t sub_2A5B0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return _swift_task_switch(sub_2A6EC, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t sub_2A6EC()
{
  *(void *)(v0 + 32) = *(void *)(v0 + 48);
  swift_errorRetain();
  sub_3C6C(&qword_40E00);
  if (swift_dynamicCast())
  {
    sub_798C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 48);
    char v2 = *(unsigned char *)(v0 + 25) | 0x80;
    sub_7938();
    swift_allocError();
    *(void *)uint64_t v3 = v1;
    *(unsigned char *)(v3 + 8) = v2;
  }
  swift_willThrow();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t initializeBufferWithCopyOfBuffer for InferencePluginError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2A824(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_2A824(uint64_t a1, char a2)
{
  if (a2 < 0) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t destroy for InferencePluginError(uint64_t a1)
{
  return sub_798C(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for InferencePluginError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2A824(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_798C(v5, v6);
  return a1;
}

uint64_t initializeWithTake for InferencePluginError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for InferencePluginError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_798C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for InferencePluginError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x1FF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 511);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 8) >> 7) | (2
                                             * ((*(void *)a1 >> 60) & 0xF | (16
                                                                             * ((*(unsigned __int8 *)(a1 + 8) >> 3) & 0xF))))) ^ 0x1FF;
  if (v3 >= 0x1FE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for InferencePluginError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 511;
    if (a3 >= 0x1FF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1FF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1);
      *(void *)uint64_t result = v3 << 60;
      *(unsigned char *)(result + 8) = ((v3 - (a2 << 8)) >> 1) & 0xF8;
    }
  }
  return result;
}

uint64_t sub_2A9A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_2A9B0(uint64_t result)
{
  *(unsigned char *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_2A9C0(uint64_t result, char a2)
{
  char v2 = *(unsigned char *)(result + 8) & 7 | (a2 << 7);
  *(void *)result &= 0xFFFFFFFFFFFFFFFuLL;
  *(unsigned char *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for InferencePluginError()
{
  return &type metadata for InferencePluginError;
}

unsigned char *initializeBufferWithCopyOfBuffer for InferencePluginErrorReason(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InferencePluginErrorReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InferencePluginErrorReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x2AB5CLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_2AB84(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2AB90(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InferencePluginErrorReason()
{
  return &type metadata for InferencePluginErrorReason;
}

unint64_t sub_2ABAC()
{
  unint64_t result = qword_41860;
  if (!qword_41860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41860);
  }
  return result;
}

uint64_t sub_2AC00(uint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  else {
    return result;
  }
}

uint64_t sub_2AC14(uint64_t a1)
{
  sub_7DD0(a1, v1 + 32);
  uint64_t v3 = sub_35320();
  uint64_t v5 = v4;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(a1);
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = v5;
  return v1;
}

void *sub_2AC90()
{
  return &_swiftEmptyArrayStorage;
}

double sub_2AC9C@<D0>(char a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  if (a1)
  {
    if (qword_40C50 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_361C0();
    sub_7900(v9, (uint64_t)qword_41868);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    int64_t v10 = sub_361A0();
    os_log_type_t v11 = sub_36360();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315394;
      uint64_t v13 = a2;
      uint64_t v15 = *(void *)(a4 + 16);
      unint64_t v14 = *(void *)(a4 + 24);
      swift_bridgeObjectRetain();
      sub_2F52C(v15, v14, &v23);
      sub_363D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2F52C(v13, a3, &v23);
      sub_363D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v10, v11, "%s %s enabled", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    sub_36000();
    swift_allocObject();
    uint64_t v23 = sub_35FF0();
    sub_2B21C();
    sub_35AB0();
    swift_release();
  }
  else
  {
    if (qword_40C50 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_361C0();
    sub_7900(v16, (uint64_t)qword_41868);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v17 = sub_361A0();
    os_log_type_t v18 = sub_36360();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 136315394;
      uint64_t v20 = *(void *)(a4 + 16);
      unint64_t v21 = *(void *)(a4 + 24);
      swift_bridgeObjectRetain();
      sub_2F52C(v20, v21, &v23);
      sub_363D0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_2F52C(a2, a3, &v23);
      sub_363D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v17, v18, "%s %s disabled", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    *(void *)(a5 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2B0F0(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_2AC14(a1);
  return v2;
}

uint64_t type metadata accessor for InferenceDomain()
{
  return self;
}

uint64_t sub_2B154()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41868);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41868);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_2B21C()
{
  unint64_t result = qword_41980;
  if (!qword_41980)
  {
    sub_36000();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41980);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for PluginRunSummary(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PluginRunSummary(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PluginRunSummary(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PluginRunSummary()
{
  return &type metadata for PluginRunSummary;
}

uint64_t sub_2B2D8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_354E0();
  uint64_t v8 = v7;
  sub_354C0();
  sub_2CE0C(&qword_41B40, (void (*)(uint64_t))&type metadata accessor for MediaGroundTruth);
  if (v6 == sub_354F0() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
    goto LABEL_13;
  }
  char v11 = sub_36570();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  if (v11)
  {
LABEL_13:
    char v17 = 1;
    goto LABEL_14;
  }
  uint64_t v12 = sub_354E0();
  uint64_t v14 = v13;
  sub_35960();
  sub_2CE0C(&qword_412A8, (void (*)(uint64_t))&type metadata accessor for MediaFeedbackGroundTruth);
  if (v12 == sub_354F0() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_13;
  }
  char v17 = sub_36570();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_14:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
  return v17 & 1;
}

uint64_t sub_2B540(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_2B580(a1);
  return v2;
}

uint64_t sub_2B580(void *a1)
{
  uint64_t v2 = v1;
  sub_7E34(a1, a1[3]);
  swift_retain();
  sub_35360();
  sub_36040();
  swift_allocObject();
  *(void *)(v1 + 72) = sub_36030();
  swift_release();
  sub_7DD0((uint64_t)a1, (uint64_t)v8);
  sub_7DD0((uint64_t)v8, v1 + 32);
  uint64_t v4 = sub_35320();
  uint64_t v6 = v5;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v8);
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = v6;
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)a1);
  return v2;
}

uint64_t sub_2B67C()
{
  sub_7E34((void *)(v0 + 32), *(void *)(v0 + 56));
  sub_35330();
  sub_7E34(v5, v5[3]);
  uint64_t v1 = sub_352C0();
  v4[3] = sub_34F40();
  v4[4] = &protocol witness table for AnyFeature;
  v4[0] = v1;
  char v2 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v4);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v5);
  return v2 & 1;
}

uint64_t sub_2B728()
{
  sub_3C6C(&qword_41140);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_36D00;
  uint64_t v1 = sub_35710();
  swift_allocObject();
  uint64_t v2 = sub_35700();
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = sub_2CE0C(&qword_41AF0, (void (*)(uint64_t))&type metadata accessor for MediaFeatureExtractor);
  *(void *)(v0 + 32) = v2;
  return v0;
}

char *sub_2B7DC()
{
  uint64_t v1 = v0;
  uint64_t v38 = sub_350B0();
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v35 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_361C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v40 = (void *)(v0 + 32);
  sub_7E34((void *)(v0 + 32), v7);
  sub_35330();
  sub_7E34(&v49, v50);
  uint64_t v8 = sub_352B0();
  uint64_t v47 = sub_34F40();
  uint64_t v48 = &protocol witness table for AnyFeature;
  uint64_t v39 = v47;
  *(void *)&long long v46 = v8;
  int v9 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v46);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v49);
  if (qword_40C58 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_7900(v3, (uint64_t)qword_41988);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v10, v3);
  char v11 = sub_361A0();
  os_log_type_t v12 = sub_36360();
  BOOL v13 = os_log_type_enabled(v11, v12);
  int v37 = v9;
  if (v13)
  {
    uint64_t v34 = v3;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v49 = v15;
    if (v9) {
      uint64_t v16 = 0x44454C42414E45;
    }
    else {
      uint64_t v16 = 0x44454C4241534944;
    }
    if (v9) {
      unint64_t v17 = 0xE700000000000000;
    }
    else {
      unint64_t v17 = 0xE800000000000000;
    }
    *(void *)&long long v46 = sub_2F52C(v16, v17, &v49);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "Media In App Followup is %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v34);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  os_log_type_t v18 = v40;
  sub_7E34(v40, *(void *)(v1 + 56));
  sub_35330();
  sub_7E34(&v49, v50);
  uint64_t v19 = v35;
  sub_35310();
  sub_34FC0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v38);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v49);
  sub_7E34(v18, *(void *)(v1 + 56));
  sub_35330();
  sub_7E34(&v49, v50);
  uint64_t v20 = sub_352E0();
  uint64_t v21 = v39;
  uint64_t v47 = v39;
  uint64_t v48 = &protocol witness table for AnyFeature;
  *(void *)&long long v46 = v20;
  sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v46);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v49);
  sub_7E34(v18, *(void *)(v1 + 56));
  sub_35330();
  sub_7E34(&v49, v50);
  uint64_t v22 = sub_35300();
  uint64_t v47 = v21;
  uint64_t v48 = &protocol witness table for AnyFeature;
  *(void *)&long long v46 = v22;
  sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v46);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)&v49);
  long long v43 = xmmword_36B20;
  sub_35F60();
  swift_allocObject();
  uint64_t v49 = sub_35F50();
  sub_2CE0C(&qword_41AD8, (void (*)(uint64_t))&type metadata accessor for MediaEntityPartialRepetitionDefinition);
  sub_35AB0();
  swift_release();
  uint64_t v23 = *(void *)(v1 + 72);
  uint64_t v24 = type metadata accessor for MusicEntityGroundTruthGenerator();
  uint64_t v25 = swift_allocObject();
  swift_retain();
  unint64_t v26 = sub_6A08((uint64_t)_swiftEmptyArrayStorage);
  *(unsigned char *)(v25 + 32) = v37 & 1;
  *(void *)(v25 + 16) = v23;
  *(void *)(v25 + 24) = v26;
  v45[3] = v24;
  v45[4] = sub_2CE0C(&qword_41AE0, (void (*)(uint64_t))type metadata accessor for MusicEntityGroundTruthGenerator);
  v45[0] = v25;
  sub_2CAE4((uint64_t)&v44, (uint64_t)&v49);
  sub_2CB4C((uint64_t)&v49, (uint64_t)&v41);
  if (v42)
  {
    sub_7998(&v41, (uint64_t)&v46);
    sub_7998(&v46, (uint64_t)&v41);
    uint64_t v27 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v27 = sub_2C6EC(0, _swiftEmptyArrayStorage[2] + 1, 1, (char *)_swiftEmptyArrayStorage, &qword_41AE8, &qword_417D8);
    }
    unint64_t v29 = *((void *)v27 + 2);
    unint64_t v28 = *((void *)v27 + 3);
    if (v29 >= v28 >> 1) {
      uint64_t v27 = sub_2C6EC((char *)(v28 > 1), v29 + 1, 1, v27, &qword_41AE8, &qword_417D8);
    }
    *((void *)v27 + 2) = v29 + 1;
    sub_7998(&v41, (uint64_t)&v27[40 * v29 + 32]);
  }
  else
  {
    sub_2CBB4((uint64_t)&v41);
    uint64_t v27 = (char *)_swiftEmptyArrayStorage;
  }
  sub_2CAE4((uint64_t)v45, (uint64_t)&v49);
  sub_2CB4C((uint64_t)&v49, (uint64_t)&v41);
  if (v42)
  {
    sub_7998(&v41, (uint64_t)&v46);
    sub_7998(&v46, (uint64_t)&v41);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v27 = sub_2C6EC(0, *((void *)v27 + 2) + 1, 1, v27, &qword_41AE8, &qword_417D8);
    }
    unint64_t v31 = *((void *)v27 + 2);
    unint64_t v30 = *((void *)v27 + 3);
    if (v31 >= v30 >> 1) {
      uint64_t v27 = sub_2C6EC((char *)(v30 > 1), v31 + 1, 1, v27, &qword_41AE8, &qword_417D8);
    }
    *((void *)v27 + 2) = v31 + 1;
    sub_7998(&v41, (uint64_t)&v27[40 * v31 + 32]);
  }
  else
  {
    sub_2CBB4((uint64_t)&v41);
  }
  sub_3C6C(&qword_41438);
  swift_arrayDestroy();
  return v27;
}

uint64_t sub_2C008()
{
  return sub_36020();
}

uint64_t sub_2C02C()
{
  sub_3C6C(&qword_41AD0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_36D00;
  sub_7DD0(v0 + 32, (uint64_t)v5);
  uint64_t v2 = sub_35920();
  swift_allocObject();
  uint64_t v3 = sub_35930();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = &protocol witness table for MediaEvaluationFramework;
  *(void *)(v1 + 32) = v3;
  return v1;
}

uint64_t sub_2C0C4()
{
  sub_3C6C(&qword_41AC8);
  uint64_t v0 = sub_35480();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_36B20;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for EventStreamType.nowPlayingStream(_:), v0);
  v6(v5 + v2, enum case for EventStreamType.playMediaIntentStreamWithAttachedNowPlayingEvents(_:), v0);
  return v4;
}

uint64_t type metadata accessor for MediaInferenceDomain()
{
  return self;
}

uint64_t sub_2C1EC()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41988);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41988);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

char *sub_2C2B4(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C8AC(a1, a2, a3, a4, (void (*)(void))sub_2F3CC);
}

char *sub_2C2CC(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B30, &qword_40FB0);
}

char *sub_2C2E0(char *result, int64_t a2, char a3, char *a4)
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
      sub_3C6C(&qword_41458);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_2CE54(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2C3F0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_41B60, (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion, (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion);
}

uint64_t sub_2C424(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_41B68, (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion, (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
}

uint64_t sub_2C458(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    os_log_type_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3C6C(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  os_log_type_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_364E0();
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
    sub_2CF40(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *sub_2C6D8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B48, &qword_40FC0);
}

char *sub_2C6EC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = *((void *)a4 + 3);
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
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_3C6C(a5);
      uint64_t v13 = (char *)swift_allocObject();
      size_t v14 = j__malloc_size(v13);
      *((void *)v13 + 2) = v11;
      *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 32;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[40 * v11 + 32]) {
          memmove(v15, a4 + 32, 40 * v11);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v15 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2CD00(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

char *sub_2C81C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_40F88, &qword_40F98);
}

char *sub_2C830(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B50, &qword_41B58);
}

char *sub_2C844(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41140, &qword_41B00);
}

char *sub_2C858(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41130, &qword_41AF8);
}

char *sub_2C86C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41AE8, &qword_417D8);
}

char *sub_2C880(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41AD0, &qword_417E0);
}

char *sub_2C894(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C8AC(a1, a2, a3, a4, (void (*)(void))sub_2F42C);
}

char *sub_2C8AC(char *result, int64_t a2, char a3, char *a4, void (*a5)(void))
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = *((void *)a4 + 3);
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = *((void *)a4 + 2);
    if (v8 <= v9) {
      uint64_t v10 = *((void *)a4 + 2);
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      a5();
      uint64_t v11 = (char *)swift_allocObject();
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      *((void *)v11 + 2) = v9;
      *((void *)v11 + 3) = 2 * (v13 >> 3);
      size_t v14 = v11 + 32;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      size_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v9 + 32]) {
          memmove(v14, a4 + 32, 8 * v9);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_2CC14(0, v9, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2C9C4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_41B08, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

char *sub_2C9F8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B20, &qword_416E0);
}

char *sub_2CA0C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B10, &qword_41B18);
}

uint64_t sub_2CA20(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_41AC8, (uint64_t (*)(void))&type metadata accessor for EventStreamType, (uint64_t (*)(void))&type metadata accessor for EventStreamType);
}

char *sub_2CA54(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_413F8, &qword_416C8);
}

uint64_t sub_2CA68(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_417D0, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

char *sub_2CA9C(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2C6EC(a1, a2, a3, a4, &qword_41B38, &qword_417A0);
}

uint64_t sub_2CAB0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2C458(a1, a2, a3, a4, &qword_41B28, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&type metadata accessor for UUID);
}

uint64_t sub_2CAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C6C(&qword_41438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2CB4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C6C(&qword_41438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2CBB4(uint64_t a1)
{
  uint64_t v2 = sub_3C6C(&qword_41438);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_2CC14(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2CD00(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_3C6C(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2CE0C(unint64_t *a1, void (*a2)(uint64_t))
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

char *sub_2CE54(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2CF40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2D09C()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 56);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 96);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 136);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 176);
  uint64_t v1 = v0
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel;
  uint64_t v2 = sub_34EE0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2D164()
{
  return type metadata accessor for SiriPrivateLearningInferencePluginContext();
}

uint64_t type metadata accessor for SiriPrivateLearningInferencePluginContext()
{
  uint64_t result = qword_41B98;
  if (!qword_41B98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2D1B8()
{
  uint64_t result = sub_34EE0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2D25C@<X0>(uint64_t a1@<X8>)
{
  return sub_7DD0(*v1 + 16, a1);
}

uint64_t sub_2D280@<X0>(uint64_t a1@<X8>)
{
  return sub_7DD0(*v1 + 56, a1);
}

uint64_t sub_2D2A4@<X0>(uint64_t a1@<X8>)
{
  return sub_7DD0(*v1 + 96, a1);
}

uint64_t sub_2D2C8@<X0>(uint64_t a1@<X8>)
{
  return sub_7DD0(*v1 + 136, a1);
}

uint64_t sub_2D2EC@<X0>(uint64_t a1@<X8>)
{
  return sub_7DD0(*v1 + 176, a1);
}

uint64_t sub_2D310@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1
     + OBJC_IVAR____TtC34SiriPrivateLearningInferencePlugin41SiriPrivateLearningInferencePluginContext_uflCoreAnalyticsLogLevel;
  uint64_t v4 = sub_34EE0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

unint64_t *sub_2D388(uint64_t a1)
{
  return sub_2D3C8(a1, (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion, (uint64_t)&protocol witness table for PlusContactSuggestion);
}

unint64_t *sub_2D3A8(uint64_t a1)
{
  return sub_2D3C8(a1, (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion, (uint64_t)&protocol witness table for PlusMediaSuggestion);
}

unint64_t *sub_2D3C8(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v4 = a2(0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v19 - v6;
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v24 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_31674(0, v8, 0);
    uint64_t v9 = v24;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v10 = v5 + 16;
    uint64_t v11 = v12;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v19 = *(void *)(v10 + 56);
    do
    {
      v11(v7, v13, v4);
      uint64_t v24 = v9;
      unint64_t v15 = v9[2];
      unint64_t v14 = v9[3];
      if (v15 >= v14 >> 1) {
        sub_31674(v14 > 1, v15 + 1, 1);
      }
      uint64_t v22 = v4;
      uint64_t v23 = v20;
      uint64_t v16 = sub_F688((uint64_t *)&v21);
      v11((char *)v16, (uint64_t)v7, v4);
      unint64_t v17 = v24;
      v24[2] = v15 + 1;
      sub_7998(&v21, (uint64_t)&v17[5 * v15 + 4]);
      (*(void (**)(char *, uint64_t))(v10 - 8))(v7, v4);
      uint64_t v9 = v24;
      v13 += v19;
      --v8;
    }
    while (v8);
  }
  return v9;
}

void *sub_2D594(uint64_t a1)
{
  return sub_2D624(a1, (uint64_t (*)(void))&type metadata accessor for PhoneCallGroundTruth, &qword_41460, (void (*)(uint64_t))&type metadata accessor for PhoneCallGroundTruth, (uint64_t)&protocol conformance descriptor for PhoneCallGroundTruth);
}

void *sub_2D5DC(uint64_t a1)
{
  return sub_2D624(a1, (uint64_t (*)(void))&type metadata accessor for ContactPromptGroundTruth, &qword_41468, (void (*)(uint64_t))&type metadata accessor for ContactPromptGroundTruth, (uint64_t)&protocol conformance descriptor for ContactPromptGroundTruth);
}

void *sub_2D624(uint64_t a1, uint64_t (*a2)(void), unint64_t *a3, void (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v22 = a3;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - v8;
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = _swiftEmptyArrayStorage;
  if (v10)
  {
    unint64_t v28 = _swiftEmptyArrayStorage;
    sub_31644(0, v10, 0);
    uint64_t v11 = v28;
    unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v13 = v7 + 16;
    unint64_t v12 = v14;
    uint64_t v15 = a1 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v21 = *(void *)(v13 + 56);
    do
    {
      v12(v9, v15, v6);
      unint64_t v28 = v11;
      unint64_t v17 = v11[2];
      unint64_t v16 = v11[3];
      if (v17 >= v16 >> 1) {
        sub_31644(v16 > 1, v17 + 1, 1);
      }
      uint64_t v26 = v6;
      uint64_t v27 = sub_32E70(v22, 255, v23);
      os_log_type_t v18 = sub_F688((uint64_t *)&v25);
      v12((char *)v18, (uint64_t)v9, v6);
      uint64_t v19 = v28;
      v28[2] = v17 + 1;
      sub_7998(&v25, (uint64_t)&v19[5 * v17 + 4]);
      (*(void (**)(char *, uint64_t))(v13 - 8))(v9, v6);
      uint64_t v11 = v28;
      v15 += v21;
      --v10;
    }
    while (v10);
  }
  return v11;
}

uint64_t sub_2D804(uint64_t a1)
{
  return sub_2D89C(a1, (uint64_t (*)(void))sub_2C2CC, &qword_40FB0);
}

uint64_t sub_2D824(uint64_t a1)
{
  return sub_2DC7C(a1, (uint64_t (*)(void))sub_2C3F0, (uint64_t (*)(void))&type metadata accessor for PlusMediaSuggestion);
}

uint64_t sub_2D850(uint64_t a1)
{
  return sub_2DC7C(a1, (uint64_t (*)(void))sub_2C424, (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
}

uint64_t sub_2D87C(uint64_t a1)
{
  return sub_2D89C(a1, (uint64_t (*)(void))sub_2C6D8, &qword_40FC0);
}

uint64_t sub_2D89C(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  unint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  if (swift_isUniquelyReferenced_nonNull_native()
    && (int64_t)(v6 + v4) <= *(void *)(v5 + 24) >> 1)
  {
    unint64_t v10 = *(void *)(a1 + 16);
    if (v10) {
      goto LABEL_5;
    }
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
  uint64_t v5 = a2();
  unint64_t v10 = *(void *)(a1 + 16);
  if (!v10) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v11 = *(void *)(v5 + 16);
  if ((*(void *)(v5 + 24) >> 1) - v11 < (uint64_t)v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v12 = v5 + 40 * v11 + 32;
  if (a1 + 32 < v12 + 40 * v10 && v12 < a1 + 32 + 40 * v10) {
    goto LABEL_21;
  }
  sub_3C6C(a3);
  swift_arrayInitWithCopy();
  if (v10 < v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v14 = *(void *)(v5 + 16);
  BOOL v15 = __OFADD__(v14, v10);
  uint64_t v16 = v14 + v10;
  if (!v15)
  {
    *(void *)(v5 + 16) = v16;
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
    return result;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2DA1C(uint64_t a1)
{
  return sub_2DAA8(a1, (uint64_t (*)(void))sub_2C86C, &qword_417D8);
}

uint64_t sub_2DA3C(uint64_t a1)
{
  return sub_2DAA8(a1, (uint64_t (*)(void))sub_2C858, &qword_41AF8);
}

uint64_t sub_2DA5C(uint64_t a1)
{
  return sub_2DC7C(a1, (uint64_t (*)(void))sub_2CA20, (uint64_t (*)(void))&type metadata accessor for EventStreamType);
}

uint64_t sub_2DA88(uint64_t a1)
{
  return sub_2DAA8(a1, (uint64_t (*)(void))sub_2C844, &qword_41B00);
}

uint64_t sub_2DAA8(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v6 + v4 <= *(void *)(v5 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  uint64_t v5 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v10 = *(void *)(v5 + 16);
  if ((*(void *)(v5 + 24) >> 1) - v10 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v11 = v5 + 40 * v10 + 32;
  if (a1 + 32 < v11 + 40 * v4 && v11 < a1 + 32 + 40 * v4) {
    goto LABEL_21;
  }
  sub_3C6C(a3);
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
    return result;
  }
  uint64_t v13 = *(void *)(v5 + 16);
  BOOL v14 = __OFADD__(v13, v4);
  uint64_t v15 = v13 + v4;
  if (!v14)
  {
    *(void *)(v5 + 16) = v15;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2DC24(uint64_t a1)
{
  return sub_2DC7C(a1, (uint64_t (*)(void))sub_2C9C4, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

uint64_t sub_2DC50(uint64_t a1)
{
  return sub_2DC7C(a1, (uint64_t (*)(void))sub_2CA68, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

uint64_t sub_2DC7C(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v6 + v4 <= *(void *)(v5 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  uint64_t v5 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v10 = *(void *)(v5 + 16);
  uint64_t v11 = (*(void *)(v5 + 24) >> 1) - v10;
  uint64_t v12 = *(void *)(a3(0) - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  if (v11 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v15 = v5 + v14 + v13 * v10;
  unint64_t v16 = a1 + v14;
  uint64_t v17 = v13 * v4;
  unint64_t v18 = v15 + v17;
  unint64_t v19 = v16 + v17;
  if (v16 < v18 && v15 < v19) {
    goto LABEL_21;
  }
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v5;
    return result;
  }
  uint64_t v21 = *(void *)(v5 + 16);
  BOOL v22 = __OFADD__(v21, v4);
  uint64_t v23 = v21 + v4;
  if (!v22)
  {
    *(void *)(v5 + 16) = v23;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_2DE38(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_364F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_364F0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_36480();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_31F38(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_364F0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_36280();
}

void sub_2E004()
{
  type metadata accessor for MessagesContactGroundTruthGenerator();
  sub_3C6C(&qword_41DB8);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_41C48 = 91;
  unk_41C50 = 0xE100000000000000;
}

Swift::Void __swiftcall MessagesContactGroundTruthGenerator.reviewSession(session:)(Swift::OpaquePointer session)
{
  uint64_t v3 = sub_3C6C(&qword_40F80);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_34E90();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v80 = (uint64_t)v73 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v73 - v13;
  sub_362A0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_8374((uint64_t)v5, &qword_40F80);
    return;
  }
  uint64_t v15 = v1;
  v73[0] = v10;
  uint64_t v76 = v7;
  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v78 = v14;
  uint64_t v79 = v6;
  v16(v14, v5, v6);
  sub_3C6C(&qword_40F88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_36CF0;
  uint64_t v18 = sub_35570();
  swift_allocObject();
  uint64_t v19 = sub_35560();
  *(void *)(inited + 56) = v18;
  *(void *)(inited + 64) = &protocol witness table for MessagesClassifier;
  *(void *)(inited + 32) = v19;
  uint64_t v20 = sub_358A0();
  swift_allocObject();
  uint64_t v21 = sub_35890();
  *(void *)(inited + 96) = v20;
  *(void *)(inited + 104) = &protocol witness table for EntityPromptClassifier;
  *(void *)(inited + 72) = v21;
  sub_35AA0();
  sub_3C6C(&qword_40F90);
  uint64_t v22 = swift_initStackObject();
  *(_OWORD *)(v22 + 16) = xmmword_36D00;
  *(void *)(v22 + 32) = sub_35230();
  *(void *)(v22 + 40) = v23;
  sub_32300(v22);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v24 = sub_35690();
  swift_allocObject();
  uint64_t v25 = sub_35680();
  uint64_t v83 = v24;
  uint64_t v84 = &protocol witness table for EntityNodeComparator;
  v82[0] = v25;
  v82[0] = sub_35A90();
  sub_35A80();
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_9CD0(inited);
  rawValue = session._rawValue;
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  sub_3C6C(&qword_40F98);
  swift_arrayDestroy();
  if (qword_40C68 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_361C0();
  uint64_t v28 = sub_7900(v27, (uint64_t)qword_41C58);
  swift_bridgeObjectRetain_n();
  unint64_t v29 = sub_361A0();
  LOBYTE(v30) = sub_36360();
  BOOL v31 = os_log_type_enabled(v29, (os_log_type_t)v30);
  char v32 = v26;
  unint64_t v74 = (void (*)(void, void, void))v28;
  uint64_t v75 = v15;
  if (!v31)
  {
    uint64_t v39 = v15;

    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  uint64_t v33 = swift_slowAlloc();
  v82[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v33 = 136315394;
  if (qword_40C60 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v34 = qword_41C48;
    unint64_t v35 = unk_41C50;
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_2F52C(v34, v35, v82);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_3C6C(&qword_40FC0);
    uint64_t v36 = sub_36270();
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    uint64_t v81 = sub_2F52C(v36, v38, v82);
    sub_363D0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v29, (os_log_type_t)v30, "[%s] Classification Results: %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v39 = v75;
LABEL_9:
    sub_35FA0();
    swift_allocObject();
    v82[0] = sub_35F90();
    sub_32E70(&qword_41C70, 255, (void (*)(uint64_t))&type metadata accessor for MessagesInAppFollowupGroundTruthGenerator);
    uint64_t v40 = sub_35220();
    swift_release();
    long long v41 = sub_2D624(v40, (uint64_t (*)(void))&type metadata accessor for MessagesGroundTruth, &qword_41470, (void (*)(uint64_t))&type metadata accessor for MessagesGroundTruth, (uint64_t)&protocol conformance descriptor for MessagesGroundTruth);
    swift_bridgeObjectRelease();
    sub_35AF0();
    swift_allocObject();
    uint64_t v81 = sub_35AE0();
    sub_32E70(&qword_41C78, 255, (void (*)(uint64_t))&type metadata accessor for SuccessfulMessageDefinition);
    sub_35990();
    swift_release();
    sub_7E34(v82, v83);
    sub_35220();
    swift_getAssociatedTypeWitness();
    v73[1] = sub_3C6C(&qword_40FB0);
    uint64_t v42 = sub_364C0();
    swift_bridgeObjectRelease();
    uint64_t v81 = (uint64_t)v41;
    sub_2D89C(v42, (uint64_t (*)(void))sub_2C2CC, &qword_40FB0);
    uint64_t v43 = v81;
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v82);
    sub_7DD0(v39 + 16, (uint64_t)v82);
    sub_36070();
    swift_allocObject();
    sub_36050();
    uint64_t v44 = sub_36060();
    swift_release();
    uint64_t v45 = v39;
    long long v46 = sub_2D624(v44, (uint64_t (*)(void))&type metadata accessor for ContactSuggestionOutcomeGroundTruth, &qword_41478, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionOutcomeGroundTruth, (uint64_t)&protocol conformance descriptor for ContactSuggestionOutcomeGroundTruth);
    swift_bridgeObjectRelease();
    v82[0] = v43;
    sub_2D89C((uint64_t)v46, (uint64_t (*)(void))sub_2C2CC, &qword_40FB0);
    uint64_t v33 = v82[0];
    swift_bridgeObjectRetain_n();
    uint64_t v47 = sub_361A0();
    os_log_type_t v48 = sub_36360();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v74 = (void (*)(void, void, void))v32;
      uint64_t v49 = swift_slowAlloc();
      v82[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 136315394;
      if (qword_40C60 != -1) {
        swift_once();
      }
      uint64_t v50 = qword_41C48;
      unint64_t v51 = unk_41C50;
      swift_bridgeObjectRetain();
      uint64_t v81 = sub_2F52C(v50, v51, v82);
      sub_363D0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_36270();
      unint64_t v54 = v53;
      swift_bridgeObjectRelease();
      uint64_t v81 = sub_2F52C(v52, v54, v82);
      sub_363D0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v47, v48, "[%s] Generated Messages Ground Truth: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v55 = v79;
      uint64_t v45 = v75;
      uint64_t v56 = v76;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v56 = v76;
      uint64_t v55 = v79;
    }
    uint64_t v57 = v78;
    sub_324A4();
    swift_bridgeObjectRelease();
    char v32 = *(char **)(v56 + 16);
    uint64_t v58 = v80;
    ((void (*)(uint64_t, char *, uint64_t))v32)(v80, v57, v55);
    uint64_t v59 = (NSObject **)(v45 + 64);
    swift_beginAccess();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v81 = *(void *)(v45 + 64);
    unint64_t v29 = v81;
    *(void *)(v45 + 64) = 0x8000000000000000;
    unint64_t v30 = sub_2FC00(v58);
    Class isa = v29[2].isa;
    BOOL v63 = (v61 & 1) == 0;
    uint64_t v64 = (uint64_t)isa + v63;
    if (!__OFADD__(isa, v63)) {
      break;
    }
    __break(1u);
LABEL_24:
    swift_once();
  }
  char v65 = v61;
  if ((uint64_t)v29[3].isa >= v64)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_30DA4();
      unint64_t v29 = v81;
    }
  }
  else
  {
    sub_3033C(v64, isUniquelyReferenced_nonNull_native, &qword_40E38);
    unint64_t v29 = v81;
    unint64_t v66 = sub_2FC00(v80);
    if ((v65 & 1) != (v67 & 1))
    {
      sub_36590();
      __break(1u);
      return;
    }
    unint64_t v30 = v66;
  }
  uint64_t v68 = v78;
  *uint64_t v59 = v29;
  swift_bridgeObjectRelease();
  uint64_t v69 = *v59;
  swift_bridgeObjectRetain();
  if ((v65 & 1) == 0)
  {
    uint64_t v70 = v73[0];
    ((void (*)(void, uint64_t, uint64_t))v32)(v73[0], v80, v79);
    sub_30C10(v30, v70, (uint64_t)_swiftEmptyArrayStorage, v69);
  }
  swift_bridgeObjectRelease();
  sub_2D89C(v33, (uint64_t (*)(void))sub_2C2CC, &qword_40FB0);
  uint64_t v71 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  uint64_t v72 = v79;
  v71(v80, v79);
  swift_endAccess();
  v71((uint64_t)v68, v72);
}

uint64_t MessagesContactGroundTruthGenerator.reviewedSessionGroundTruth()()
{
  uint64_t v62 = sub_3C6C(&qword_40F78);
  uint64_t v1 = __chkstk_darwin(v62);
  char v61 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v60 = (char *)&v47 - v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v59 = (uint64_t)&v47 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v58 = (char *)&v47 - v8;
  __chkstk_darwin(v7);
  uint64_t v57 = (char *)&v47 - v9;
  uint64_t v56 = sub_35660();
  uint64_t v10 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v0 + 64);
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = _swiftEmptyArrayStorage;
  if (!v14) {
    return (uint64_t)v15;
  }
  unint64_t v66 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain();
  sub_316A4(0, v14, 0);
  uint64_t result = sub_32278(v13);
  uint64_t v18 = result;
  uint64_t v19 = 0;
  uint64_t v20 = v13 + 64;
  uint64_t v52 = v10 + 32;
  char v21 = *(unsigned char *)(v13 + 32);
  uint64_t v48 = v13 + 80;
  unint64_t v54 = v12;
  uint64_t v55 = v10;
  uint64_t v53 = v13;
  int64_t v49 = v14;
  uint64_t v50 = v17;
  uint64_t v51 = v13 + 64;
  while ((v18 & 0x8000000000000000) == 0 && v18 < 1 << v21)
  {
    unint64_t v23 = (unint64_t)v18 >> 6;
    if ((*(void *)(v20 + 8 * ((unint64_t)v18 >> 6)) & (1 << v18)) == 0) {
      goto LABEL_26;
    }
    if (*(_DWORD *)(v13 + 36) != v17) {
      goto LABEL_27;
    }
    uint64_t v63 = v19;
    uint64_t v64 = 1 << v18;
    uint64_t v24 = v62;
    uint64_t v25 = *(int *)(v62 + 48);
    uint64_t v26 = *(void *)(v13 + 48);
    uint64_t v27 = sub_34E90();
    uint64_t v65 = *(void *)(v27 - 8);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
    uint64_t v29 = (uint64_t)v57;
    v28(v57, v26 + *(void *)(v65 + 72) * v18, v27);
    uint64_t v30 = *(void *)(*(void *)(v13 + 56) + 8 * v18);
    *(void *)(v29 + v25) = v30;
    BOOL v31 = v58;
    v28(v58, v29, v27);
    *(void *)&v31[*(int *)(v24 + 48)] = v30;
    uint64_t v32 = (uint64_t)v31;
    uint64_t v33 = v59;
    sub_9C68(v32, v59);
    swift_bridgeObjectRetain_n();
    sub_8374(v29, &qword_40F78);
    uint64_t v34 = *(int *)(v24 + 48);
    unint64_t v35 = v60;
    v28(v60, v33, v27);
    uint64_t v36 = *(void *)(v33 + v34);
    *(void *)&v35[v34] = v36;
    uint64_t v37 = *(int *)(v24 + 48);
    unint64_t v38 = v61;
    v28(v61, v33, v27);
    uint64_t v39 = v54;
    *(void *)&v38[v37] = v36;
    swift_bridgeObjectRetain();
    sub_35650();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v27);
    sub_8374(v33, &qword_40F78);
    uint64_t v15 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_316A4(0, v15[2] + 1, 1);
      uint64_t v15 = v66;
    }
    unint64_t v41 = v15[2];
    unint64_t v40 = v15[3];
    if (v41 >= v40 >> 1)
    {
      sub_316A4(v40 > 1, v41 + 1, 1);
      uint64_t v15 = v66;
    }
    long long v15[2] = v41 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v55 + 32))((unint64_t)v15+ ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80))+ *(void *)(v55 + 72) * v41, v39, v56);
    unint64_t v66 = v15;
    uint64_t v13 = v53;
    char v21 = *(unsigned char *)(v53 + 32);
    unint64_t v22 = 1 << v21;
    if (v18 >= 1 << v21) {
      goto LABEL_28;
    }
    uint64_t v20 = v51;
    uint64_t v42 = *(void *)(v51 + 8 * v23);
    if ((v42 & v64) == 0) {
      goto LABEL_29;
    }
    LODWORD(v17) = v50;
    if (*(_DWORD *)(v53 + 36) != v50) {
      goto LABEL_30;
    }
    unint64_t v43 = v42 & (-2 << (v18 & 0x3F));
    if (v43)
    {
      unint64_t v22 = __clz(__rbit64(v43)) | v18 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v44 = v23 + 1;
      unint64_t v45 = (v22 + 63) >> 6;
      if (v23 + 1 < v45)
      {
        unint64_t v46 = *(void *)(v51 + 8 * v44);
        if (v46)
        {
LABEL_22:
          unint64_t v22 = __clz(__rbit64(v46)) + (v44 << 6);
        }
        else
        {
          while (v45 - 2 != v23)
          {
            unint64_t v46 = *(void *)(v48 + 8 * v23++);
            if (v46)
            {
              unint64_t v44 = v23 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v19 = v63 + 1;
    uint64_t v18 = v22;
    if (v63 + 1 == v49)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v15;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t MessagesContactGroundTruthGenerator.deinit()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MessagesContactGroundTruthGenerator.__deallocating_deinit()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_2F270()
{
  return MessagesContactGroundTruthGenerator.reviewedSessionGroundTruth()();
}

void sub_2F294(Swift::OpaquePointer a1)
{
}

uint64_t sub_2F2B8()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41C58);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41C58);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_2F380(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2F390(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2F3CC()
{
  uint64_t v0 = sub_3C6C(&qword_41800);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_41018;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_41DA8;
  }

  return sub_3C6C(v2);
}

uint64_t sub_2F42C()
{
  uint64_t v0 = sub_3C6C(&qword_416D8);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_41018;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_41D88;
  }

  return sub_3C6C(v2);
}

uint64_t sub_2F48C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2F4B4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2F52C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_363D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2F52C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2F600(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_327D4((uint64_t)v12, *a3);
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
      sub_327D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2F600(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_363E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2F7BC(a5, a6);
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
  uint64_t v8 = sub_36490();
  if (!v8)
  {
    sub_364E0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_36530();
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

uint64_t sub_2F7BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_2F854(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2FA34(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2FA34(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_2F854(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2F9CC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_36460();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_364E0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_36250();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_36530();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_364E0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_2F9CC(uint64_t a1, uint64_t a2)
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
  sub_3C6C(&qword_41DB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2FA34(char a1, int64_t a2, char a3, char *a4)
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
    sub_3C6C(&qword_41DB0);
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
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

unsigned char **sub_2FB84(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_2FB94(Swift::UInt a1)
{
  sub_365E0();
  sub_365F0(a1);
  Swift::Int v2 = sub_36610();

  return sub_2FC9C(a1, v2);
}

unint64_t sub_2FC00(uint64_t a1)
{
  sub_34E90();
  sub_32E70(&qword_40FF8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v2 = sub_361D0();

  return sub_2FD38(a1, v2);
}

unint64_t sub_2FC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_2FD38(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_34E90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
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
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_32E70(&qword_41000, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = sub_361F0();
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

uint64_t sub_2FEFC(uint64_t a1, int a2)
{
  return sub_3033C(a1, a2, &qword_40E38);
}

uint64_t sub_2FF08(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = sub_34E90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_3C6C(&qword_417A8);
  int v42 = a2;
  uint64_t v10 = sub_36510();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    uint64_t v37 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v39 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v38 = (unint64_t)(v12 + 63) >> 6;
    unint64_t v40 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    unint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v44 = v5;
    for (i = v6; ; uint64_t v6 = i)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38) {
          goto LABEL_34;
        }
        unint64_t v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v38) {
            goto LABEL_34;
          }
          unint64_t v23 = v39[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              unint64_t v3 = v37;
              if (v42)
              {
                uint64_t v36 = 1 << *(unsigned char *)(v9 + 32);
                if (v36 >= 64) {
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v39 = -1 << v36;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v38) {
                  goto LABEL_34;
                }
                unint64_t v23 = v39[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = *(void *)(v6 + 72);
      unint64_t v26 = *(void *)(v9 + 48) + v25 * v21;
      if (v42) {
        (*v43)(v8, v26, v44);
      }
      else {
        (*v40)(v8, v26, v44);
      }
      uint64_t v27 = v9;
      uint64_t v28 = *(void *)(*(void *)(v9 + 56) + 8 * v21);
      sub_32E70(&qword_40FF8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = sub_361D0();
      uint64_t v29 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v30) & ~*(void *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v29) >> 6;
        do
        {
          if (++v31 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v34 = v31 == v33;
          if (v31 == v33) {
            unint64_t v31 = 0;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v16 + 8 * v31);
        }
        while (v35 == -1);
        unint64_t v19 = __clz(__rbit64(~v35)) + (v31 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v43)(*(void *)(v11 + 48) + v25 * v19, v8, v44);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v28;
      ++*(void *)(v11 + 16);
      uint64_t v9 = v27;
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

uint64_t sub_30330(uint64_t a1, int a2)
{
  return sub_3033C(a1, a2, &qword_41DA0);
}

uint64_t sub_3033C(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_34E90();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  sub_3C6C(a3);
  int v48 = a2;
  uint64_t v12 = sub_36510();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  int v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  unint64_t v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  unint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    uint64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_bridgeObjectRetain();
    }
    sub_32E70(&qword_40FF8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_361D0();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  uint64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

uint64_t sub_30768(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v50 = sub_34E90();
  uint64_t v5 = *(void *)(v50 - 8);
  uint64_t v6 = __chkstk_darwin(v50);
  uint64_t v55 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v51 = (char *)&v44 - v8;
  uint64_t v9 = *v2;
  sub_3C6C(&qword_40DF0);
  int v52 = a2;
  uint64_t v10 = sub_36510();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16)) {
    goto LABEL_41;
  }
  uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v13 = *(void *)(v9 + 64);
  unint64_t v46 = (void *)(v9 + 64);
  if (v12 < 64) {
    uint64_t v14 = ~(-1 << v12);
  }
  else {
    uint64_t v14 = -1;
  }
  unint64_t v15 = v14 & v13;
  uint64_t v44 = v3;
  int64_t v45 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v47 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  uint64_t v16 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v17 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v19 = 0;
  uint64_t v48 = v5;
  uint64_t v49 = v9;
  while (1)
  {
    if (v15)
    {
      unint64_t v23 = __clz(__rbit64(v15));
      uint64_t v24 = (v15 - 1) & v15;
      unint64_t v25 = v23 | (v19 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v45) {
      break;
    }
    uint64_t v27 = v46;
    unint64_t v28 = v46[v26];
    ++v19;
    if (!v28)
    {
      int64_t v19 = v26 + 1;
      if (v26 + 1 >= v45) {
        goto LABEL_34;
      }
      unint64_t v28 = v46[v19];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v45)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v44;
          if ((v52 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v46[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v19 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v19 >= v45) {
              goto LABEL_34;
            }
            unint64_t v28 = v46[v19];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v19 = v29;
      }
    }
LABEL_21:
    uint64_t v24 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v19 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v5 + 72);
    unint64_t v31 = v30 * v25;
    unint64_t v32 = *(void *)(v9 + 48) + v30 * v25;
    unint64_t v53 = v24;
    int64_t v54 = v19;
    if (v52)
    {
      uint64_t v33 = *v16;
      uint64_t v35 = v50;
      unint64_t v34 = v51;
      (*v16)(v51, v32, v50);
    }
    else
    {
      uint64_t v33 = *v47;
      uint64_t v35 = v50;
      unint64_t v34 = v51;
      (*v47)(v51, v32, v50);
    }
    v33(v55, *(void *)(v9 + 56) + v31, v35);
    sub_32E70(&qword_40FF8, 255, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = sub_361D0();
    uint64_t v36 = -1 << *(unsigned char *)(v11 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v17 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1 << v37) & ~*(void *)(v17 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v17 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v20 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    unint64_t v21 = v30 * v20;
    int64_t v22 = *v16;
    (*v16)((char *)(*(void *)(v11 + 48) + v30 * v20), (unint64_t)v34, v35);
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v22)(*(void *)(v11 + 56) + v21, v55, v35);
    ++*(void *)(v11 + 16);
    uint64_t v5 = v48;
    uint64_t v9 = v49;
    unint64_t v15 = v53;
    int64_t v19 = v54;
  }
  swift_release();
  unint64_t v3 = v44;
  uint64_t v27 = v46;
  if ((v52 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v9 + 32);
  if (v43 >= 64) {
    bzero(v27, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v27 = -1 << v43;
  }
  *(void *)(v9 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v11;
  return result;
}

uint64_t sub_30C10(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_34E90();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_30CC8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_34E90();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  uint64_t v12 = *(void *)(v10 + 72) * a1;
  v11(v8 + v12, a2, v9);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a4[7] + v12, a3, v9);
  uint64_t v14 = a4[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a4[2] = v16;
  }
  return result;
}

void *sub_30DA4()
{
  uint64_t v1 = sub_34E90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3C6C(&qword_40E38);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_36500();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_3103C()
{
  uint64_t v1 = sub_34E90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3C6C(&qword_417A8);
  unint64_t v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_36500();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v24 = v5 + 64;
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v27 = v2 + 16;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + v17);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_312D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_34E90();
  uint64_t v3 = *(void **)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v35 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v34 = (char *)&v30 - v6;
  sub_3C6C(&qword_40DF0);
  uint64_t v7 = *v0;
  uint64_t v8 = sub_36500();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v9;
    return result;
  }
  uint64_t v30 = v1;
  uint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v12 = 0;
  uint64_t v13 = *(void *)(v7 + 16);
  uint64_t v36 = v7;
  uint64_t v37 = v9;
  *(void *)(v9 + 16) = v13;
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v31 = v7 + 64;
  int64_t v32 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v33 = v3 + 2;
  uint64_t v17 = v34;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v27 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v32) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v27);
    ++v12;
    if (!v28)
    {
      int64_t v12 = v27 + 1;
      if (v27 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v28 = *(void *)(v31 + 8 * v12);
      if (!v28) {
        break;
      }
    }
LABEL_22:
    unint64_t v16 = (v28 - 1) & v28;
    unint64_t v19 = __clz(__rbit64(v28)) + (v12 << 6);
LABEL_9:
    uint64_t v20 = v36;
    unint64_t v21 = v3[9] * v19;
    uint64_t v22 = (void (*)(char *, unint64_t, uint64_t))v3[2];
    v22(v17, *(void *)(v36 + 48) + v21, v2);
    unint64_t v23 = *(void *)(v20 + 56) + v21;
    uint64_t v24 = v35;
    v22(v35, v23, v2);
    uint64_t v25 = v37;
    uint64_t v26 = (void (*)(unint64_t, char *, uint64_t))v3[4];
    v26(*(void *)(v37 + 48) + v21, v17, v2);
    uint64_t result = (void *)((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v25 + 56) + v21, v24, v2);
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v30;
    uint64_t v9 = v37;
    goto LABEL_25;
  }
  unint64_t v28 = *(void *)(v31 + 8 * v29);
  if (v28)
  {
    int64_t v12 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v12 >= v32) {
      goto LABEL_23;
    }
    unint64_t v28 = *(void *)(v31 + 8 * v12);
    ++v29;
    if (v28) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_315CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31AA8(a1, a2, a3, (void *)*v3, &qword_41B28, (uint64_t (*)(void))&type metadata accessor for UUID);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_31608(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31AA8(a1, a2, a3, (void *)*v3, &qword_41B68, (uint64_t (*)(void))&type metadata accessor for PlusContactSuggestion);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_31644(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3175C(a1, a2, a3, (void *)*v3, &qword_41B30, &qword_40FB0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_31674(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_3175C(a1, a2, a3, (void *)*v3, &qword_41D68, &qword_41D70);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_316A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31AA8(a1, a2, a3, (void *)*v3, &qword_417D0, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_316E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31924(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_31700(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31AA8(a1, a2, a3, (void *)*v3, &qword_41D90, (uint64_t (*)(void))&type metadata accessor for FeaturisedTurn);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3173C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_31CF0(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_3175C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_3C6C(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    sub_3C6C(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_31904(char a1, int64_t a2, char a3, void *a4)
{
  return sub_31AA8(a1, a2, a3, a4, &qword_417D0, (uint64_t (*)(void))&type metadata accessor for SessionGroundTruths);
}

uint64_t sub_31924(char a1, int64_t a2, char a3, char *a4)
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
    sub_2F42C();
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_31A88(char a1, int64_t a2, char a3, void *a4)
{
  return sub_31AA8(a1, a2, a3, a4, &qword_41B08, (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

uint64_t sub_31AA8(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_3C6C(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_31CF0(char a1, int64_t a2, char a3, void *a4)
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
  sub_3C6C(&qword_41D98);
  uint64_t v10 = *(void *)(sub_3C6C(&qword_417C0) - 8);
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
  uint64_t v16 = *(void *)(sub_3C6C(&qword_417C0) - 8);
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
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

uint64_t sub_31F38(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_364F0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_364F0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_32778();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_3C6C(&qword_41D78);
          unint64_t v12 = sub_3213C(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_358E0();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_36530();
  __break(1u);
  return result;
}

void (*sub_3213C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_321EC(v6, a2, a3);
  return sub_321A4;
}

void sub_321A4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_321EC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_36470();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_3226C;
  }
  __break(1u);
  return result;
}

uint64_t sub_3226C()
{
  return swift_release();
}

uint64_t sub_32278(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
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
  uint64_t v9 = (unint64_t *)(a1 + 80);
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

Swift::Int sub_32300(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_3C6C(&qword_416E8);
    uint64_t v3 = sub_36450();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_365E0();
      swift_bridgeObjectRetain();
      sub_36230();
      Swift::Int result = sub_36610();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = sub_36570(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = sub_36570();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

void sub_324A4()
{
  if (*(void *)(v0 + 56))
  {
    sub_7DD0(v0 + 16, (uint64_t)v9);
    uint64_t v1 = sub_35E90();
    swift_allocObject();
    swift_retain();
    uint64_t v2 = sub_35E80();
    v9[3] = v1;
    v9[4] = (uint64_t)&protocol witness table for MessagesSuggestionOutcomeExtractor;
    v9[0] = v2;
    swift_retain();
    sub_36080();
    swift_release();
    swift_release();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v9);
  }
  else
  {
    if (qword_40C68 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_361C0();
    sub_7900(v3, (uint64_t)qword_41C58);
    oslog = sub_361A0();
    os_log_type_t v4 = sub_36370();
    if (os_log_type_enabled(oslog, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      v9[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      if (qword_40C60 != -1) {
        swift_once();
      }
      uint64_t v6 = qword_41C48;
      unint64_t v7 = unk_41C50;
      swift_bridgeObjectRetain();
      v9[5] = sub_2F52C(v6, v7, v9);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, oslog, v4, "[%s] No outcome emitter available - no PICS outcomes will be derived or logged", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_3270C(uint64_t a1, uint64_t a2)
{
  return sub_32E70(&qword_41C80, a2, (void (*)(uint64_t))type metadata accessor for MessagesContactGroundTruthGenerator);
}

uint64_t type metadata accessor for MessagesContactGroundTruthGenerator()
{
  return self;
}

unint64_t sub_32778()
{
  unint64_t result = qword_41D80;
  if (!qword_41D80)
  {
    sub_25270(&qword_41D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_41D80);
  }
  return result;
}

uint64_t sub_327D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_32830(uint64_t a1)
{
  uint64_t v2 = sub_35550();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_3C6C(&qword_41DC0);
    uint64_t v9 = sub_36450();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_32E70(&qword_41DC8, 255, (void (*)(uint64_t))&type metadata accessor for MediaSuggestionTag);
      uint64_t v16 = sub_361D0();
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
          sub_32E70(&qword_41DD0, 255, (void (*)(uint64_t))&type metadata accessor for MediaSuggestionTag);
          char v23 = sub_361F0();
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
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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

void *sub_32B50(uint64_t a1)
{
  uint64_t v2 = sub_35670();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_3C6C(&qword_41DD8);
    uint64_t v9 = sub_36450();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_32E70(&qword_41848, 255, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionTag);
      uint64_t v16 = sub_361D0();
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
          sub_32E70(&qword_41850, 255, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionTag);
          char v23 = sub_361F0();
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
        unint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
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

uint64_t sub_32E70(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for AdaptiveContactSuggestionGeneratorWrapper()
{
  return &type metadata for AdaptiveContactSuggestionGeneratorWrapper;
}

void *sub_32EC8(uint64_t a1)
{
  uint64_t v14 = sub_34E90();
  uint64_t v3 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v13 = v1;
    uint64_t v15 = _swiftEmptyArrayStorage;
    sub_315CC(0, v6, 0);
    uint64_t v7 = v15;
    uint64_t v8 = (void *)(a1 + 32);
    do
    {
      sub_7E34(v8, v8[3]);
      sub_354D0();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v15 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_315CC(0, v7[2] + 1, 1);
        uint64_t v7 = v15;
      }
      unint64_t v11 = v7[2];
      unint64_t v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        sub_315CC(v10 > 1, v11 + 1, 1);
        uint64_t v7 = v15;
      }
      v7[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v11, v5, v14);
      uint64_t v15 = v7;
      v8 += 5;
      --v6;
    }
    while (v6);
  }
  return v7;
}

void sub_33098()
{
  sub_3C6C(&qword_41E10);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_41DE0 = 91;
  *(void *)algn_41DE8 = 0xE100000000000000;
}

uint64_t sub_33120()
{
  uint64_t v1 = sub_3C6C(&qword_417F0);
  uint64_t v2 = __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)&v20[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  int64_t v6 = (char *)&v20[-1] - v5;
  sub_7E34(v0, v0[3]);
  sub_35370();
  sub_7E34(v20, v20[3]);
  sub_35A20();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v20);
  sub_34824((uint64_t)v6, (uint64_t)v4);
  uint64_t v7 = sub_35B10();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v4, 1, v7) == 1)
  {
    sub_3488C((uint64_t)v4);
  }
  else
  {
    uint64_t v14 = sub_35B00();
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    if (v14 == 0xD00000000000001BLL && v16 == 0x8000000000038A60)
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = 0;
      goto LABEL_12;
    }
    char v17 = sub_36570();
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    if (v17) {
      goto LABEL_12;
    }
  }
  if (qword_40C78 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_361C0();
  sub_7900(v9, (uint64_t)qword_41DF0);
  unint64_t v10 = sub_361A0();
  os_log_type_t v11 = sub_36360();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "Suggestion generation was not last performed by adaptive generation. Requesting all prior ground truth.", v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = 1;
LABEL_12:
  sub_3488C((uint64_t)v6);
  return v13;
}

uint64_t sub_333E0(uint64_t a1)
{
  uint64_t v85 = a1;
  uint64_t v1 = sub_34E90();
  uint64_t v70 = *(void *)(v1 - 8);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  int64_t v6 = (char *)&v57 - v5;
  uint64_t v7 = sub_358C0();
  uint64_t v59 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v69 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_35810();
  uint64_t v66 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v81 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3C6C(&qword_41838);
  uint64_t v10 = sub_35670();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v82 = swift_allocObject();
  uint64_t v14 = (char *)(v82 + v13);
  uint64_t v15 = *(void (**)(char *, void, uint64_t))(v11 + 104);
  v15(v14, enum case for ContactSuggestionTag.domainPhoneCall(_:), v10);
  uint64_t v16 = &v14[v12];
  uint64_t v84 = v10;
  uint64_t v17 = v10;
  unint64_t v18 = v83;
  v15(&v14[v12], enum case for ContactSuggestionTag.domainMessages(_:), v17);
  uint64_t v86 = _swiftEmptyArrayStorage;
  uint64_t v19 = v85;
  sub_33CD0(v14, v18, v85, &v87);
  sub_2D850(v87);
  uint64_t v20 = v16;
  uint64_t v21 = v18;
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  sub_33CD0(v20, v22, v19, &v87);
  sub_2D850(v87);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v24 = v86;
  uint64_t v25 = sub_32EC8(v23);
  uint64_t v26 = sub_27CA4((uint64_t)v25);
  swift_bridgeObjectRelease();
  sub_7E34(v21, v21[3]);
  sub_35360();
  sub_357A0();
  swift_allocObject();
  uint64_t v27 = v24;
  uint64_t v67 = sub_35790();
  uint64_t v65 = v24[2];
  if (v65)
  {
    uint64_t v64 = (char *)v24 + ((*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80));
    uint64_t v63 = v66 + 16;
    uint64_t v75 = v59 + 16;
    uint64_t v84 = v26 + 56;
    uint64_t v83 = (void *)(v70 + 16);
    BOOL v28 = (void (**)(char *, uint64_t))(v70 + 8);
    unint64_t v74 = (void (**)(char *, uint64_t))(v59 + 8);
    char v61 = (void (**)(char *, uint64_t))(v66 + 8);
    swift_bridgeObjectRetain();
    uint64_t v82 = 0;
    unint64_t v29 = 0;
    uint64_t v30 = v69;
    uint64_t v31 = v58;
    uint64_t v85 = v26;
    uint64_t v68 = v7;
    uint64_t v62 = v24;
    uint64_t v60 = v6;
    while (v29 < v27[2])
    {
      uint64_t v32 = *(void *)(v66 + 72);
      unint64_t v80 = v29;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v81, &v64[v32 * v29], v31);
      uint64_t v33 = sub_357E0();
      uint64_t v77 = *(void *)(v33 + 16);
      if (v77)
      {
        uint64_t v34 = 0;
        unint64_t v35 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
        uint64_t v76 = v33;
        unint64_t v36 = v33 + v35;
        uint64_t v37 = *(void *)(v59 + 72);
        unint64_t v38 = *(void (**)(void, void, void))(v59 + 16);
        unint64_t v73 = v36;
        uint64_t v72 = v37;
        uint64_t v71 = v38;
        while (1)
        {
          v38(v30, v36 + v37 * v34, v7);
          sub_358B0();
          uint64_t v39 = *(void *)(v26 + 16);
          uint64_t v79 = (unint64_t)v28 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          if (!v39) {
            break;
          }
          sub_347DC(&qword_40FF8, (void (*)(uint64_t))&type metadata accessor for UUID);
          uint64_t v40 = sub_361D0();
          uint64_t v41 = -1 << *(unsigned char *)(v26 + 32);
          unint64_t v42 = v40 & ~v41;
          if (((*(void *)(v84 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42) & 1) == 0) {
            break;
          }
          uint64_t v43 = v6;
          uint64_t v78 = v34 + 1;
          uint64_t v44 = ~v41;
          uint64_t v45 = *(void *)(v70 + 72);
          unint64_t v46 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
          while (1)
          {
            v46(v4, *(void *)(v85 + 48) + v45 * v42, v1);
            sub_347DC(&qword_41000, (void (*)(uint64_t))&type metadata accessor for UUID);
            char v47 = sub_361F0();
            uint64_t v48 = *v28;
            (*v28)(v4, v1);
            if (v47) {
              break;
            }
            unint64_t v42 = (v42 + 1) & v44;
            if (((*(void *)(v84 + ((v42 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v42) & 1) == 0)
            {
              int64_t v6 = v43;
              uint64_t v7 = v68;
              uint64_t v30 = v69;
              goto LABEL_14;
            }
          }
          int64_t v6 = v43;
          v48(v43, v1);
          uint64_t v30 = v69;
          uint64_t v7 = v68;
          (*v74)(v69, v68);
          uint64_t v34 = v78;
          uint64_t v26 = v85;
          unint64_t v36 = v73;
          uint64_t v37 = v72;
          unint64_t v38 = v71;
          if (v78 == v77)
          {
            uint64_t v49 = v7;
            swift_bridgeObjectRelease();
            int v50 = 0;
            uint64_t v31 = v58;
            goto LABEL_16;
          }
        }
        uint64_t v48 = *v28;
LABEL_14:
        uint64_t v31 = v58;
        v48(v6, v1);
        uint64_t v49 = v7;
        (*v74)(v30, v7);
        swift_bridgeObjectRelease();
        int v50 = 1;
        uint64_t v26 = v85;
      }
      else
      {
        uint64_t v49 = v7;
        swift_bridgeObjectRelease();
        int v50 = 0;
      }
LABEL_16:
      BOOL v51 = __CFADD__(v82, v50);
      uint64_t v82 = (v82 + v50);
      if (v51) {
        goto LABEL_26;
      }
      unint64_t v52 = v80 + 1;
      sub_34E80();
      unint64_t v53 = v81;
      sub_35770();
      (*v28)(v4, v1);
      (*v61)(v53, v31);
      unint64_t v29 = v52;
      BOOL v54 = v52 == v65;
      uint64_t v27 = v62;
      uint64_t v7 = v49;
      int64_t v6 = v60;
      if (v54) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v82 = 0;
LABEL_22:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v55 = v27[2];
    swift_bridgeObjectRelease();
    if (HIDWORD(v55)) {
      goto LABEL_28;
    }
    if (v55 >= v82) {
      return 0;
    }
  }
  __break(1u);
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_28:
  uint64_t result = sub_364E0();
  __break(1u);
  return result;
}

uint64_t sub_33CD0@<X0>(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v56 = a4;
  uint64_t v7 = sub_35670();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  unint64_t v13 = (char *)v51 - v12;
  if (qword_40C78 != -1) {
    swift_once();
  }
  uint64_t v58 = a3;
  uint64_t v14 = sub_361C0();
  uint64_t v15 = sub_7900(v14, (uint64_t)qword_41DF0);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  unint64_t v55 = a1;
  uint64_t v59 = v8 + 16;
  uint64_t v57 = v16;
  v16(v13, a1, v7);
  uint64_t v60 = v15;
  uint64_t v17 = sub_361A0();
  int v18 = sub_36360();
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    LODWORD(v53) = v18;
    uint64_t v54 = (uint64_t)a2;
    uint64_t v19 = swift_slowAlloc();
    *(void *)&long long v52 = swift_slowAlloc();
    uint64_t v61 = v52;
    *(_DWORD *)uint64_t v19 = 136315394;
    if (qword_40C70 != -1) {
      swift_once();
    }
    uint64_t v20 = qword_41DE0;
    unint64_t v21 = *(void *)algn_41DE8;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v20, v21, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v57(v11, v13, v7);
    uint64_t v22 = sub_36220();
    uint64_t v63 = sub_2F52C(v22, v23, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    _os_log_impl(&dword_0, v17, (os_log_type_t)v53, "%s Processing new ground truth for %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a2 = (void *)v54;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  sub_7E34(a2, a2[3]);
  sub_35370();
  uint64_t v53 = sub_3C6C(&qword_41838);
  unint64_t v24 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v25 = swift_allocObject();
  long long v52 = xmmword_36D00;
  *(_OWORD *)(v25 + 16) = xmmword_36D00;
  uint64_t v26 = v55;
  uint64_t v27 = (void (*)(unint64_t, uint64_t, uint64_t))v57;
  v57((char *)(v25 + v24), v55, v7);
  v51[1] = sub_32B50(v25);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v54 = sub_35F40();
  swift_allocObject();
  uint64_t v28 = sub_35F20();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v52;
  v27(v29 + v24, (uint64_t)v26, v7);
  swift_retain();
  sub_32B50(v29);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_35E40();
  swift_allocObject();
  uint64_t v59 = v28;
  uint64_t v57 = (void (*)(char *, char *, uint64_t))sub_35E20();
  uint64_t v30 = sub_35E30();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_361A0();
  os_log_type_t v32 = sub_36360();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315650;
    if (qword_40C70 != -1) {
      swift_once();
    }
    uint64_t v34 = qword_41DE0;
    unint64_t v35 = *(void *)algn_41DE8;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v34, v35, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2048;
    uint64_t v63 = *(void *)(v58 + 16);
    sub_363D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2048;
    if ((v30 & 0xC000000000000001) != 0) {
      uint64_t v36 = sub_36410();
    }
    else {
      uint64_t v36 = *(void *)(v30 + 16);
    }
    uint64_t v37 = &SiriPrivateLearningInferencePlugin;
    uint64_t v63 = v36;
    sub_363D0();
    _os_log_impl(&dword_0, v31, v32, "%s Updated candidate scores in %ld Ground Truth and %ld queries.", (uint8_t *)v33, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
    uint64_t v37 = &SiriPrivateLearningInferencePlugin;
  }
  sub_35E70();
  uint64_t v61 = v59;
  sub_347DC(&qword_41E08, (void (*)(uint64_t))&type metadata accessor for ContactSuggestionStoreCandidateAdapter);
  swift_retain();
  uint64_t v38 = sub_35E50();
  sub_BDE0(v30);
  swift_bridgeObjectRelease();
  uint64_t v58 = v38;
  uint64_t v39 = sub_35E60();
  swift_release();
  uint64_t v40 = sub_361A0();
  os_log_type_t v41 = sub_36360();
  if (os_log_type_enabled(v40, v41))
  {
    unint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)unint64_t v42 = 136315138;
    if (v37[44].ivar_lyt != (void *)-1) {
      swift_once();
    }
    uint64_t v43 = qword_41DE0;
    unint64_t v44 = *(void *)algn_41DE8;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v43, v44, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v40, v41, "%s Nominated Candidates:", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  if (v37[44].ivar_lyt != (void *)-1) {
    swift_once();
  }
  uint64_t v61 = qword_41DE0;
  unint64_t v62 = *(void *)algn_41DE8;
  swift_bridgeObjectRetain();
  v64._countAndFlagsBits = 8224;
  v64._object = (void *)0xE200000000000000;
  sub_36240(v64);
  sub_12280(v61, v62, v39);
  swift_bridgeObjectRelease();
  uint64_t v45 = sub_361A0();
  os_log_type_t v46 = sub_36360();
  if (os_log_type_enabled(v45, v46))
  {
    char v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    *(_DWORD *)char v47 = 136315138;
    uint64_t v48 = qword_41DE0;
    unint64_t v49 = *(void *)algn_41DE8;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_2F52C(v48, v49, &v61);
    sub_363D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v45, v46, "%s Persisting updated candidates to the suggestion store", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_35F30();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  uint64_t *v56 = v39;
  return result;
}

unint64_t sub_346D8()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_346F8(uint64_t a1)
{
  return 0;
}

uint64_t sub_34714()
{
  uint64_t v0 = sub_361C0();
  sub_7E94(v0, qword_41DF0);
  uint64_t v1 = sub_7900(v0, (uint64_t)qword_41DF0);
  if (qword_40C10 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_7900(v0, (uint64_t)qword_42698);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_347DC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_34824(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3C6C(&qword_417F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3488C(uint64_t a1)
{
  uint64_t v2 = sub_3C6C(&qword_417F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_348EC()
{
  type metadata accessor for DonationSourceProvider();
  sub_3C6C((uint64_t *)&unk_41EE0);
  v0._countAndFlagsBits = sub_36220();
  sub_36240(v0);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 93;
  v1._object = (void *)0xE100000000000000;
  sub_36240(v1);
  qword_41E18 = 91;
  unk_41E20 = 0xE100000000000000;
}

unint64_t sub_34970()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)(v0 + 16);
  sub_7E34((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_35330();
  sub_7E34(v24, v25);
  uint64_t v3 = sub_35280();
  uint64_t v4 = sub_34F40();
  uint64_t v22 = v4;
  unint64_t v23 = &protocol witness table for AnyFeature;
  v21[0] = v3;
  char v5 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v21);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v24);
  if (v5)
  {
    sub_7E34(v2, *(void *)(v1 + 40));
    sub_35370();
    sub_7E34(v24, v25);
    uint64_t v6 = sub_35A70();
    uint64_t v7 = sub_2D388(v6);
    swift_bridgeObjectRelease();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v24);
  }
  else
  {
    if (qword_40C10 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_361C0();
    sub_7900(v8, (uint64_t)qword_42698);
    uint64_t v9 = sub_361A0();
    os_log_type_t v10 = sub_36360();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      v24[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      if (qword_40C80 != -1) {
        swift_once();
      }
      uint64_t v12 = qword_41E18;
      unint64_t v13 = unk_41E20;
      swift_bridgeObjectRetain();
      v21[0] = sub_2F52C(v12, v13, v24);
      sub_363D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v9, v10, "%s PICS donations are blocked since PICSRuntimeInSiriVocab is disabled", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    else
    {

      uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
  }
  sub_7E34(v2, *(void *)(v1 + 40));
  sub_35330();
  sub_7E34(v24, v25);
  uint64_t v14 = sub_352C0();
  uint64_t v22 = v4;
  unint64_t v23 = &protocol witness table for AnyFeature;
  v21[0] = v14;
  char v15 = sub_34FD0();
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v21);
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v24);
  if (v15)
  {
    sub_7E34(v2, *(void *)(v1 + 40));
    sub_35380();
    sub_7E34(v24, v25);
    uint64_t v16 = sub_35980();
    uint64_t v17 = sub_2D3A8(v16);
    swift_bridgeObjectRelease();
    _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0((uint64_t)v24);
  }
  else
  {
    uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  sub_3C6C(&qword_41ED0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_36B20;
  *(void *)(inited + 32) = 22;
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 48) = 23;
  *(void *)(inited + 56) = v17;
  unint64_t v19 = sub_7800((void *)inited);
  swift_setDeallocating();
  sub_3C6C(&qword_41ED8);
  swift_arrayDestroy();
  return v19;
}

uint64_t sub_34D84()
{
  _s34SiriPrivateLearningInferencePlugin39LegacyContactSuggestionGeneratorWrapperVwxx_0(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DonationSourceProvider()
{
  return self;
}

uint64_t sub_34DE0()
{
  return DateInterval.end.getter();
}

uint64_t sub_34DF0()
{
  return DateInterval.init(start:end:)();
}

uint64_t sub_34E00()
{
  return DateInterval.start.getter();
}

uint64_t sub_34E10()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_34E20()
{
  return static Date.distantPast.getter();
}

uint64_t sub_34E30()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t sub_34E40()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_34E50()
{
  return static Date.now.getter();
}

uint64_t sub_34E60()
{
  return type metadata accessor for Date();
}

uint64_t sub_34E70()
{
  return UUID.uuidString.getter();
}

uint64_t sub_34E80()
{
  return UUID.init()();
}

uint64_t sub_34E90()
{
  return type metadata accessor for UUID();
}

uint64_t sub_34EA0()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_34EB0()
{
  return static Calendar.current.getter();
}

uint64_t sub_34EC0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_34ED0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_34EE0()
{
  return type metadata accessor for UFLCoreAnalyticsLogLevel();
}

uint64_t sub_34EF0()
{
  return PrivateLearningPluginError.init(message:)();
}

uint64_t sub_34F00()
{
  return type metadata accessor for PrivateLearningPluginError();
}

uint64_t sub_34F10()
{
  return type metadata accessor for PrivateLearningPluginResult();
}

uint64_t sub_34F20()
{
  return type metadata accessor for PrivateLearningPluginRunContext();
}

uint64_t sub_34F30()
{
  return type metadata accessor for PrivateLearningPluginRunScenario();
}

uint64_t sub_34F40()
{
  return type metadata accessor for AnyFeature();
}

uint64_t sub_34F50()
{
  return Conversation.getConversationId()();
}

uint64_t sub_34F60()
{
  return Conversation.getTimestamp()();
}

uint64_t sub_34F70()
{
  return Conversation.allTurnsChronologically.getter();
}

uint64_t sub_34F80()
{
  return type metadata accessor for Conversation();
}

uint64_t sub_34F90()
{
  return type metadata accessor for AppInteraction();
}

uint64_t sub_34FA0()
{
  return StreamBookmark.__allocating_init(name:date:)();
}

uint64_t sub_34FB0()
{
  return type metadata accessor for StreamBookmark();
}

uint64_t sub_34FC0()
{
  return dispatch thunk of FeatureManaging.getFeatureParameter(_:)();
}

uint64_t sub_34FD0()
{
  return dispatch thunk of FeatureManaging.isActive(_:)();
}

uint64_t sub_34FE0()
{
  return PLLoggingReader.asyncSignalReader.getter();
}

uint64_t sub_34FF0()
{
  return PLLoggingReader.interactionReader.getter();
}

uint64_t sub_35000()
{
  return PLLoggingReader.biomeReader.getter();
}

uint64_t sub_35010()
{
  return static PLLoggingReader.shared.getter();
}

uint64_t sub_35020()
{
  return type metadata accessor for PLLoggingReader();
}

uint64_t sub_35030()
{
  return dispatch thunk of InteractionReader.appInteractions(since:intentTypes:until:)();
}

uint64_t sub_35040()
{
  return ASRFeatureExtractor.init()();
}

uint64_t sub_35050()
{
  return type metadata accessor for ASRFeatureExtractor();
}

uint64_t sub_35060()
{
  return dispatch thunk of StreamBookmarkStore.read(name:)();
}

uint64_t sub_35070()
{
  return dispatch thunk of StreamBookmarkStore.write(bookmark:)();
}

uint64_t sub_35080()
{
  return UEIFeatureExtractor.init()();
}

uint64_t sub_35090()
{
  return type metadata accessor for UEIFeatureExtractor();
}

uint64_t sub_350A0()
{
  return dispatch thunk of SELFFeatureExtractor.extract(from:)();
}

uint64_t sub_350B0()
{
  return type metadata accessor for DoubleFeatureParameter();
}

uint64_t sub_350C0()
{
  return makePLUSEventLogTarget()();
}

void sub_350D0(Swift::OpaquePointer groundTruths)
{
}

uint64_t sub_350E0()
{
  return InferredGroundTruthStore.readTypedGroundTruth<A>(_:)();
}

uint64_t sub_350F0()
{
  return DismissalFeatureExtractor.init()();
}

uint64_t sub_35100()
{
  return type metadata accessor for DismissalFeatureExtractor();
}

uint64_t sub_35110()
{
  return RequestIdFeatureExtractor.init()();
}

uint64_t sub_35120()
{
  return type metadata accessor for RequestIdFeatureExtractor();
}

uint64_t sub_35130()
{
  return static FlatFileStreamBookmarkStore.shared.getter();
}

uint64_t sub_35140()
{
  return type metadata accessor for FlatFileStreamBookmarkStore();
}

uint64_t sub_35150()
{
  return dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)();
}

uint64_t sub_35160()
{
  return dispatch thunk of AppInteractionFeatureExtractor.intentTypes.getter();
}

uint64_t sub_35170()
{
  return dispatch thunk of AppInteractionFeatureExtractor.extract(from:)();
}

uint64_t sub_35180()
{
  return FlowClientEventFeatureExtractor.init()();
}

uint64_t sub_35190()
{
  return type metadata accessor for FlowClientEventFeatureExtractor();
}

uint64_t sub_351A0()
{
  return type metadata accessor for InferredGroundTruthStoreCoreData();
}

uint64_t sub_351B0()
{
  return InferredGroundTruthStoreCoreData.init(_:)();
}

uint64_t sub_351C0()
{
  return Turn.getTimestamp()();
}

uint64_t sub_351D0()
{
  return Turn.turnID.getter();
}

uint64_t sub_351E0()
{
  return type metadata accessor for Turn();
}

uint64_t sub_351F0()
{
  return static Config.PICSDBLocation.getter();
}

uint64_t sub_35200()
{
  return static Config.PIMSDBLocation.getter();
}

uint64_t sub_35210()
{
  return static Config.groundTruthDBLocation.getter();
}

uint64_t sub_35220()
{
  return dispatch thunk of GroundTruthInference.generate(session:classifications:)();
}

uint64_t sub_35230()
{
  return static SiriKitTaskType.sendMessage.getter();
}

uint64_t sub_35240()
{
  return static SiriKitTaskType.playMedia.getter();
}

uint64_t sub_35250()
{
  return static SiriKitTaskType.startCall.getter();
}

uint64_t sub_35260()
{
  return dispatch thunk of InferenceGroundTruthGenerator.reviewedSessionGroundTruth()();
}

uint64_t sub_35270()
{
  return InferenceCombinedSessionAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_35280()
{
  return static InferenceFeatures.PICSRuntimeInSiriVocab.getter();
}

uint64_t sub_35290()
{
  return InferenceFeatures.InferenceFeatureManager.init()();
}

uint64_t sub_352A0()
{
  return type metadata accessor for InferenceFeatures.InferenceFeatureManager();
}

uint64_t sub_352B0()
{
  return static InferenceFeatures.PIMSInAppFollowup.getter();
}

uint64_t sub_352C0()
{
  return static InferenceFeatures.PIMSShadowLogging.getter();
}

uint64_t sub_352D0()
{
  return static InferenceFeatures.AdaptivePICSGeneration.getter();
}

uint64_t sub_352E0()
{
  return static InferenceFeatures.pimsWakeWordTrimmingEnabled.getter();
}

uint64_t sub_352F0()
{
  return static InferenceFeatures.PartialRepetitionsInPhoneCall.getter();
}

uint64_t sub_35300()
{
  return static InferenceFeatures.pimsPhantomTurnRemovalEnabled.getter();
}

uint64_t sub_35310()
{
  return static InferenceFeatures.pimsPartialRepetitionSimilarityThreshold.getter();
}

uint64_t sub_35320()
{
  return static InferenceLogUtils.loggerTag<A>(_:)();
}

uint64_t sub_35330()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.featureManager.getter();
}

uint64_t sub_35340()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.groundTruthStore.getter();
}

uint64_t sub_35350()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.uflCoreAnalyticsLogLevel.getter();
}

uint64_t sub_35360()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.logTarget.getter();
}

uint64_t sub_35370()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.picsStore.getter();
}

uint64_t sub_35380()
{
  return dispatch thunk of SiriPrivateLearningInferenceContext.pimsStore.getter();
}

uint64_t sub_35390()
{
  return CoreDuetEvent.getTimestamp()();
}

uint64_t sub_353A0()
{
  return CoreDuetEvent.eventId.getter();
}

uint64_t sub_353B0()
{
  return CoreDuetEvent.init(features:)();
}

uint64_t sub_353C0()
{
  return CoreDuetEvent.features.getter();
}

uint64_t sub_353D0()
{
  return type metadata accessor for CoreDuetEvent();
}

uint64_t sub_353E0()
{
  return FeaturisedTurn.coreDuetEvents.getter();
}

uint64_t sub_353F0()
{
  return FeaturisedTurn.turnId.getter();
}

uint64_t sub_35400()
{
  return FeaturisedTurn.init(turnId:features:coreDuetEvents:timestamp:)();
}

uint64_t sub_35410()
{
  return FeaturisedTurn.features.getter();
}

uint64_t sub_35420()
{
  return type metadata accessor for FeaturisedTurn();
}

uint64_t sub_35430()
{
  return dispatch thunk of StreamRegistry.resolveStream<A>(identifier:type:)();
}

uint64_t sub_35440()
{
  return dispatch thunk of StreamRegistry.registerStream<A>(identifier:stream:)();
}

uint64_t sub_35450()
{
  return StreamRegistry.init()();
}

uint64_t sub_35460()
{
  return type metadata accessor for StreamRegistry();
}

uint64_t sub_35470()
{
  return static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)();
}

uint64_t sub_35480()
{
  return type metadata accessor for EventStreamType();
}

uint64_t sub_35490()
{
  return dispatch thunk of SessionReviewer.reviewSession(session:)();
}

uint64_t sub_354A0()
{
  return AsyncEventStream.makeAsyncIterator()();
}

uint64_t sub_354B0()
{
  return MediaGroundTruth.source.getter();
}

uint64_t sub_354C0()
{
  return type metadata accessor for MediaGroundTruth();
}

uint64_t sub_354D0()
{
  return dispatch thunk of TypedGroundTruth.id.getter();
}

uint64_t sub_354E0()
{
  return dispatch thunk of TypedGroundTruth.type.getter();
}

uint64_t sub_354F0()
{
  return static TypedGroundTruth.type.getter();
}

uint64_t sub_35500()
{
  return type metadata accessor for PIMSStoreCoreData();
}

uint64_t sub_35510()
{
  return dispatch thunk of SessionClassifier.classify(_:classifications:)();
}

uint64_t sub_35520()
{
  return SessionClassifier.classify(session:)();
}

uint64_t sub_35530()
{
  return EventStreamContext.init(dateRange:)();
}

uint64_t sub_35540()
{
  return type metadata accessor for EventStreamContext();
}

uint64_t sub_35550()
{
  return type metadata accessor for MediaSuggestionTag();
}

uint64_t sub_35560()
{
  return MessagesClassifier.init()();
}

uint64_t sub_35570()
{
  return type metadata accessor for MessagesClassifier();
}

uint64_t sub_35580()
{
  return dispatch thunk of EvaluationFramework.reviewedSessionEvaluation()();
}

uint64_t sub_35590()
{
  return dispatch thunk of EvaluationFramework.evaluateSession(session:)();
}

uint64_t sub_355A0()
{
  return KVSuggestionDonator.init(donationCandidates:)();
}

uint64_t sub_355B0()
{
  return type metadata accessor for KVSuggestionDonator();
}

uint64_t sub_355C0()
{
  return MediaPlayClassifier.init()();
}

uint64_t sub_355D0()
{
  return type metadata accessor for MediaPlayClassifier();
}

uint64_t sub_355E0()
{
  return type metadata accessor for MessagesGroundTruth();
}

uint64_t sub_355F0()
{
  return PhoneCallClassifier.init()();
}

uint64_t sub_35600()
{
  return type metadata accessor for PhoneCallClassifier();
}

uint64_t sub_35610()
{
  return PlusMediaSuggestion.contributingGroundTruth.getter();
}

uint64_t sub_35620()
{
  return type metadata accessor for PlusMediaSuggestion();
}

uint64_t sub_35630()
{
  return SessionGroundTruths.groundTruth.getter();
}

uint64_t sub_35640()
{
  return SessionGroundTruths.sessionId.getter();
}

uint64_t sub_35650()
{
  return SessionGroundTruths.init(sessionId:groundTruth:)();
}

uint64_t sub_35660()
{
  return type metadata accessor for SessionGroundTruths();
}

uint64_t sub_35670()
{
  return type metadata accessor for ContactSuggestionTag();
}

uint64_t sub_35680()
{
  return EntityNodeComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:)();
}

uint64_t sub_35690()
{
  return type metadata accessor for EntityNodeComparator();
}

uint64_t sub_356A0()
{
  return PhoneCallGroundTruth.source.getter();
}

uint64_t sub_356B0()
{
  return type metadata accessor for PhoneCallGroundTruth();
}

uint64_t sub_356C0()
{
  return ThinMediaGroundTruth.id.getter();
}

uint64_t sub_356D0()
{
  return type metadata accessor for ThinMediaGroundTruth();
}

uint64_t sub_35700()
{
  return MediaFeatureExtractor.init()();
}

uint64_t sub_35710()
{
  return type metadata accessor for MediaFeatureExtractor();
}

uint64_t sub_35720()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginFailed(failureReason:plusId:)();
}

uint64_t sub_35730()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginStarted(triggerReason:plusId:)();
}

uint64_t sub_35740()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logInferencePluginCompleted(conversationsReviewed:groundTruthsGenerated:contactSuggestionsGenerated:contactSuggestionsUpdated:plusId:)();
}

uint64_t sub_35750()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logPhoneCallMetadata(session:originalPlusId:plusId:)();
}

uint64_t sub_35760()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logSessionEvaluations(evaluations:)();
}

uint64_t sub_35770()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logContactSuggestionGenerated(suggestion:plusId:isSuggestionUpdated:)();
}

uint64_t sub_35780()
{
  return dispatch thunk of PLUSOfflineLogHelpers.logSessionGroundTruthDataToSELF(sessionId:originalPlusId:groundTruths:picsStore:plusId:)();
}

uint64_t sub_35790()
{
  return PLUSOfflineLogHelpers.init(logTarget:)();
}

uint64_t sub_357A0()
{
  return type metadata accessor for PLUSOfflineLogHelpers();
}

uint64_t sub_357B0()
{
  return PlusContactSuggestion.updateWith(with:)();
}

uint64_t sub_357C0()
{
  return PlusContactSuggestion.hasSameContent(as:)();
}

uint64_t sub_357D0()
{
  return PlusContactSuggestion.hasSameMapping(as:)();
}

uint64_t sub_357E0()
{
  return PlusContactSuggestion.contributingGroundTruth.getter();
}

uint64_t sub_357F0()
{
  return PlusContactSuggestion.id.getter();
}

uint64_t sub_35800()
{
  return PlusContactSuggestion.tags.getter();
}

uint64_t sub_35810()
{
  return type metadata accessor for PlusContactSuggestion();
}

uint64_t sub_35820()
{
  return dispatch thunk of CoreAnalyticsLogHelper.logInferencePluginRun()();
}

uint64_t sub_35830()
{
  return dispatch thunk of CoreAnalyticsLogHelper.logGroundTruthState()();
}

uint64_t sub_35840()
{
  return dispatch thunk of CoreAnalyticsLogHelper.logMediaSuggestionGenerationTrigger()();
}

uint64_t sub_35850()
{
  return dispatch thunk of CoreAnalyticsLogHelper.logMediaGroundTruthGenerationTrigger()();
}

uint64_t sub_35860()
{
  return CoreAnalyticsLogHelper.init(logLevel:)();
}

uint64_t sub_35870()
{
  return CoreAnalyticsLogHelper.init()();
}

uint64_t sub_35880()
{
  return type metadata accessor for CoreAnalyticsLogHelper();
}

uint64_t sub_35890()
{
  return EntityPromptClassifier.init()();
}

uint64_t sub_358A0()
{
  return type metadata accessor for EntityPromptClassifier();
}

uint64_t sub_358B0()
{
  return ThinContactGroundTruth.id.getter();
}

uint64_t sub_358C0()
{
  return type metadata accessor for ThinContactGroundTruth();
}

uint64_t sub_358D0()
{
  return dispatch thunk of CoreDuetEventCoalescing.process(_:next:)();
}

uint64_t sub_358E0()
{
  return type metadata accessor for CoreDuetEventCoalescing();
}

uint64_t sub_358F0()
{
  return PhoneCallEventCoalescer.init()();
}

uint64_t sub_35900()
{
  return type metadata accessor for PhoneCallEventCoalescer();
}

uint64_t sub_35910()
{
  return type metadata accessor for ContactPromptGroundTruth();
}

uint64_t sub_35920()
{
  return type metadata accessor for MediaEvaluationFramework();
}

uint64_t sub_35930()
{
  return MediaEvaluationFramework.init(_:)();
}

uint64_t sub_35940()
{
  return MediaFeedbackGroundTruth.with(source:)();
}

uint64_t sub_35950()
{
  return MediaFeedbackGroundTruth.source.getter();
}

uint64_t sub_35960()
{
  return type metadata accessor for MediaFeedbackGroundTruth();
}

uint64_t sub_35970()
{
  return dispatch thunk of PlusMediaSuggestionStore.recordStoreUpdate(source:)();
}

uint64_t sub_35980()
{
  return PlusMediaSuggestionStore.readAllNominated()();
}

uint64_t sub_35990()
{
  return SuccessfulTaskDefinition.generator()();
}

uint64_t sub_359A0()
{
  return PIMSCoreDataStorePolicies.runPolicy(store:)();
}

uint64_t sub_359B0()
{
  return PIMSCoreDataStorePolicies.init()();
}

uint64_t sub_359C0()
{
  return type metadata accessor for PIMSCoreDataStorePolicies();
}

uint64_t sub_359D0()
{
  return PhoneCallFeatureExtractor.init()();
}

uint64_t sub_359E0()
{
  return type metadata accessor for PhoneCallFeatureExtractor();
}

uint64_t sub_359F0()
{
  return SendMessageEventCoalescer.init()();
}

uint64_t sub_35A00()
{
  return type metadata accessor for SendMessageEventCoalescer();
}

uint64_t sub_35A10()
{
  return type metadata accessor for PhoneCallGroundTruthSource();
}

uint64_t sub_35A20()
{
  return dispatch thunk of PlusContactSuggestionStore.mostRecentStoreUpdate()();
}

uint64_t sub_35A30()
{
  return dispatch thunk of PlusContactSuggestionStore.resetStore()();
}

uint64_t sub_35A40()
{
  return dispatch thunk of PlusContactSuggestionStore.recordStoreUpdate(source:)();
}

uint64_t sub_35A50()
{
  return dispatch thunk of PlusContactSuggestionStore.insert(pics:)();
}

uint64_t sub_35A60()
{
  return dispatch thunk of PlusContactSuggestionStore.readAll()();
}

uint64_t sub_35A70()
{
  return PlusContactSuggestionStore.readAllNominated()();
}

uint64_t sub_35A80()
{
  return FeaturisedSessionClassifier.asSessionClassifier()();
}

uint64_t sub_35A90()
{
  return PartialRepetitionClassifier.__allocating_init(turnComparator:)();
}

uint64_t sub_35AA0()
{
  return type metadata accessor for PartialRepetitionClassifier();
}

uint64_t sub_35AB0()
{
  return PartialRepetitionDefinition.generator()();
}

uint64_t sub_35AC0()
{
  return SendMessageFeatureExtractor.init()();
}

uint64_t sub_35AD0()
{
  return type metadata accessor for SendMessageFeatureExtractor();
}

uint64_t sub_35AE0()
{
  return SuccessfulMessageDefinition.init()();
}

uint64_t sub_35AF0()
{
  return type metadata accessor for SuccessfulMessageDefinition();
}

uint64_t sub_35B00()
{
  return ContactSuggestionStoreUpdate.source.getter();
}

uint64_t sub_35B10()
{
  return type metadata accessor for ContactSuggestionStoreUpdate();
}

uint64_t sub_35B20()
{
  return MediaInAppFollowupClassifier.init()();
}

uint64_t sub_35B30()
{
  return type metadata accessor for MediaInAppFollowupClassifier();
}

uint64_t sub_35B40()
{
  return FullEntityUtteranceComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:useTrimmedUtterance:)();
}

uint64_t sub_35B50()
{
  return type metadata accessor for FullEntityUtteranceComparator();
}

uint64_t sub_35B60()
{
  return SuccessfulPhoneCallDefinition.init()();
}

uint64_t sub_35B70()
{
  return type metadata accessor for SuccessfulPhoneCallDefinition();
}

uint64_t sub_35B80()
{
  return SuccessfulPlayMediaDefinition.init()();
}

uint64_t sub_35B90()
{
  return type metadata accessor for SuccessfulPlayMediaDefinition();
}

uint64_t sub_35BA0()
{
  return FirstPartyEventStreamProcessor.init()();
}

uint64_t sub_35BB0()
{
  return type metadata accessor for FirstPartyEventStreamProcessor();
}

uint64_t sub_35BC0()
{
  return static MediaFeedbackGroundTruthSource.== infix(_:_:)();
}

uint64_t sub_35BD0()
{
  return type metadata accessor for MediaFeedbackGroundTruthSource();
}

uint64_t sub_35BE0()
{
  return dispatch thunk of PlusContactSuggestionGenerator.generate(groundTruths:suggestionTags:)();
}

uint64_t sub_35BF0()
{
  return PlusContactSuggestionGenerator.__allocating_init()();
}

uint64_t sub_35C00()
{
  return type metadata accessor for PlusContactSuggestionGenerator();
}

uint64_t sub_35C10()
{
  return USOTaskSummaryFeatureExtractor.init()();
}

uint64_t sub_35C20()
{
  return type metadata accessor for USOTaskSummaryFeatureExtractor();
}

uint64_t sub_35C30()
{
  return FeaturisedNowPlayingEventStream.init(eventReader:)();
}

uint64_t sub_35C40()
{
  return type metadata accessor for FeaturisedNowPlayingEventStream();
}

uint64_t sub_35C50()
{
  return MediaSuggestionOutcomeExtractor.init()();
}

uint64_t sub_35C60()
{
  return type metadata accessor for MediaSuggestionOutcomeExtractor();
}

uint64_t sub_35C70()
{
  return type metadata accessor for PICSStoreCoreDataWithMigrations();
}

uint64_t sub_35C80()
{
  return PICSStoreCoreDataWithMigrations.init(_:)();
}

uint64_t sub_35C90()
{
  return type metadata accessor for PIMSStoreCoreDataWithMigrations();
}

uint64_t sub_35CA0()
{
  return PIMSStoreCoreDataWithMigrations.init(_:)();
}

uint64_t sub_35CB0()
{
  return type metadata accessor for PlusClientEventFeatureExtractor();
}

uint64_t sub_35CC0()
{
  return PlusClientEventFeatureExtractor.__allocating_init(_:)();
}

uint64_t sub_35CD0()
{
  return AdaptiveMediaSuggestionGenerator.init(candidateProvider:domainTags:)();
}

uint64_t sub_35CE0()
{
  return dispatch thunk of AdaptiveMediaSuggestionGenerator.processGroundTruths(groundTruthList:)();
}

uint64_t sub_35CF0()
{
  return type metadata accessor for AdaptiveMediaSuggestionGenerator();
}

uint64_t sub_35D00()
{
  return AdaptiveMediaSuggestionNominator.__allocating_init<A>(candidateProvider:)();
}

uint64_t sub_35D10()
{
  return dispatch thunk of AdaptiveMediaSuggestionNominator.nominate(queries:)();
}

uint64_t sub_35D20()
{
  return type metadata accessor for AdaptiveMediaSuggestionNominator();
}

uint64_t sub_35D30()
{
  return ContactEntityUtteranceComparator.init(taskNamesOfInterest:restatementThreshold:allowsIdenticalUtterances:)();
}

uint64_t sub_35D40()
{
  return type metadata accessor for ContactEntityUtteranceComparator();
}

uint64_t sub_35D50()
{
  return static MediaCorrectionGroundTruthSource.== infix(_:_:)();
}

uint64_t sub_35D60()
{
  return type metadata accessor for MediaCorrectionGroundTruthSource();
}

uint64_t sub_35D70()
{
  return CommonInteractionFeatureExtractor.init()();
}

uint64_t sub_35D80()
{
  return type metadata accessor for CommonInteractionFeatureExtractor();
}

uint64_t sub_35D90()
{
  return dispatch thunk of ContactPromptGroundTruthGenerator.generate(session:classifications:)();
}

uint64_t sub_35DA0()
{
  return ContactPromptGroundTruthGenerator.init()();
}

uint64_t sub_35DB0()
{
  return type metadata accessor for ContactPromptGroundTruthGenerator();
}

uint64_t sub_35DC0()
{
  return INPlayMediaIntentStreamDefinition.init(eventReader:)();
}

uint64_t sub_35DD0()
{
  return type metadata accessor for INPlayMediaIntentStreamDefinition();
}

uint64_t sub_35DE0()
{
  return INStartCallIntentFeatureExtractor.init()();
}

uint64_t sub_35DF0()
{
  return type metadata accessor for INStartCallIntentFeatureExtractor();
}

uint64_t sub_35E00()
{
  return QuickSongStopGroundTruthGenerator.init()();
}

uint64_t sub_35E10()
{
  return type metadata accessor for QuickSongStopGroundTruthGenerator();
}

uint64_t sub_35E20()
{
  return AdaptiveContactSuggestionGenerator.init(candidateProvider:domainTags:)();
}

uint64_t sub_35E30()
{
  return dispatch thunk of AdaptiveContactSuggestionGenerator.processGroundTruths(groundTruthList:)();
}

uint64_t sub_35E40()
{
  return type metadata accessor for AdaptiveContactSuggestionGenerator();
}

uint64_t sub_35E50()
{
  return AdaptiveContactSuggestionNominator.__allocating_init<A>(candidateProvider:)();
}

uint64_t sub_35E60()
{
  return dispatch thunk of AdaptiveContactSuggestionNominator.nominate(queries:)();
}

uint64_t sub_35E70()
{
  return type metadata accessor for AdaptiveContactSuggestionNominator();
}

uint64_t sub_35E80()
{
  return MessagesSuggestionOutcomeExtractor.init(picsStore:)();
}

uint64_t sub_35E90()
{
  return type metadata accessor for MessagesSuggestionOutcomeExtractor();
}

uint64_t sub_35EA0()
{
  return type metadata accessor for ContactSuggestionOutcomeGroundTruth();
}

uint64_t sub_35EB0()
{
  return INSendMessageIntentFeatureExtractor.init()();
}

uint64_t sub_35EC0()
{
  return type metadata accessor for INSendMessageIntentFeatureExtractor();
}

uint64_t sub_35ED0()
{
  return PhoneCallSuggestionOutcomeExtractor.init(picsStore:)();
}

uint64_t sub_35EE0()
{
  return type metadata accessor for PhoneCallSuggestionOutcomeExtractor();
}

uint64_t sub_35EF0()
{
  return MediaSuggestionStoreCandidateAdapter.init(store:requiredTags:)();
}

uint64_t sub_35F00()
{
  return dispatch thunk of MediaSuggestionStoreCandidateAdapter.persist()();
}

uint64_t sub_35F10()
{
  return type metadata accessor for MediaSuggestionStoreCandidateAdapter();
}

uint64_t sub_35F20()
{
  return ContactSuggestionStoreCandidateAdapter.init(store:requiredTags:)();
}

uint64_t sub_35F30()
{
  return dispatch thunk of ContactSuggestionStoreCandidateAdapter.persist()();
}

uint64_t sub_35F40()
{
  return type metadata accessor for ContactSuggestionStoreCandidateAdapter();
}

uint64_t sub_35F50()
{
  return MediaEntityPartialRepetitionDefinition.init(restatementThreshold:useTrimmedUtterance:wakeWordAndEmptyTurnRemoval:)();
}

uint64_t sub_35F60()
{
  return type metadata accessor for MediaEntityPartialRepetitionDefinition();
}

uint64_t sub_35F70()
{
  return MediaInAppFollowupGroundTruthGenerator.init(timeToFollowup:)();
}

uint64_t sub_35F80()
{
  return type metadata accessor for MediaInAppFollowupGroundTruthGenerator();
}

uint64_t sub_35F90()
{
  return MessagesInAppFollowupGroundTruthGenerator.init()();
}

uint64_t sub_35FA0()
{
  return type metadata accessor for MessagesInAppFollowupGroundTruthGenerator();
}

uint64_t sub_35FB0()
{
  return MessagesContactPartialRepetitionDefinition.init()();
}

uint64_t sub_35FC0()
{
  return type metadata accessor for MessagesContactPartialRepetitionDefinition();
}

uint64_t sub_35FD0()
{
  return PhoneCallInAppFollowupGroundTruthGenerator.init()();
}

uint64_t sub_35FE0()
{
  return type metadata accessor for PhoneCallInAppFollowupGroundTruthGenerator();
}

uint64_t sub_35FF0()
{
  return PhoneCallContactPartialRepetitionDefinition.init()();
}

uint64_t sub_36000()
{
  return type metadata accessor for PhoneCallContactPartialRepetitionDefinition();
}

uint64_t sub_36010()
{
  return dispatch thunk of MediaSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)();
}

uint64_t sub_36020()
{
  return dispatch thunk of MediaSuggestionOutcomeReportedOfflineEmitter.flush()();
}

uint64_t sub_36030()
{
  return MediaSuggestionOutcomeReportedOfflineEmitter.init(logTarget:)();
}

uint64_t sub_36040()
{
  return type metadata accessor for MediaSuggestionOutcomeReportedOfflineEmitter();
}

uint64_t sub_36050()
{
  return MessagesContactSuggestionGroundTruthGenerator.init(suggestionStore:)();
}

uint64_t sub_36060()
{
  return dispatch thunk of MessagesContactSuggestionGroundTruthGenerator.generate(session:classifications:)();
}

uint64_t sub_36070()
{
  return type metadata accessor for MessagesContactSuggestionGroundTruthGenerator();
}

uint64_t sub_36080()
{
  return dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.reviewSessionSuggestionOutcomes(session:classifications:outcomeExtractor:)();
}

uint64_t sub_36090()
{
  return dispatch thunk of ContactSuggestionOutcomeReportedOfflineEmitter.flush()();
}

uint64_t sub_360A0()
{
  return ContactSuggestionOutcomeReportedOfflineEmitter.init(logTarget:)();
}

uint64_t sub_360B0()
{
  return type metadata accessor for ContactSuggestionOutcomeReportedOfflineEmitter();
}

uint64_t sub_360C0()
{
  return PlayMediaIntentWithAttachedNowPlayingEventStreamDefinition.init(streamRegistry:)();
}

uint64_t sub_360D0()
{
  return type metadata accessor for PlayMediaIntentWithAttachedNowPlayingEventStreamDefinition();
}

uint64_t sub_360E0()
{
  return static SetUtils.haveSameDomainTags<A>(_:_:)();
}

uint64_t sub_360F0()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_36100()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_36110()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_36120()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_36130()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_36140()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_36150()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_36160()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_36170()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_36180()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_36190()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_361A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_361B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_361C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_361D0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_361E0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_361F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_36200()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_36210()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_36220()
{
  return String.init<A>(describing:)();
}

uint64_t sub_36230()
{
  return String.hash(into:)();
}

void sub_36240(Swift::String a1)
{
}

Swift::Int sub_36250()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_36260()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_36270()
{
  return Array.description.getter();
}

uint64_t sub_36280()
{
  return specialized Array._endMutation()();
}

uint64_t sub_36290()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_362A0()
{
  return Array<A>.getSessionId()();
}

uint64_t sub_362B0()
{
  return Array<A>.getOriginalPlusId()();
}

uint64_t sub_362C0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_362D0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_362E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_36300()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_36310()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_36320()
{
  return AsyncSequence<>.windowSquished()();
}

uint64_t sub_36330()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_36340()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_36350()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_36360()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_36370()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_36380()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_36390()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_363A0()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_363B0()
{
  return PLUSSchemaPLUSInferencePluginTriggerReason.description.getter();
}

uint64_t sub_363C0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_363D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_363E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_363F0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_36400()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_36410()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_36420()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_36430()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_36440()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_36450()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_36460()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_36470()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_36480()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_36490()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_364A0()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t sub_364B0()
{
  return dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
}

uint64_t sub_364C0()
{
  return _arrayForceCast<A, B>(_:)();
}

uint64_t sub_364D0()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t sub_364E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_364F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_36500()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_36510()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_36520()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_36530()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_36540()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int sub_36550(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_36560()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_36570()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_36580()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_36590()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_365A0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_365B0()
{
  return Error._code.getter();
}

uint64_t sub_365C0()
{
  return Error._domain.getter();
}

uint64_t sub_365D0()
{
  return Error._userInfo.getter();
}

uint64_t sub_365E0()
{
  return Hasher.init(_seed:)();
}

void sub_365F0(Swift::UInt a1)
{
}

void sub_36600(Swift::UInt32 a1)
{
}

Swift::Int sub_36610()
{
  return Hasher._finalize()();
}

uint64_t KVItemTypeName()
{
  return _KVItemTypeName();
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}