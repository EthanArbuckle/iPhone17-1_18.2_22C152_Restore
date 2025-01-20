uint64_t variable initialization expression of SiriInferenceBridge.delegate()
{
  return 0;
}

id variable initialization expression of SiriInferenceBridge.xpcListener()
{
  return sub_5370();
}

unint64_t sub_5330()
{
  unint64_t result = qword_10358;
  if (!qword_10358)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10358);
  }
  return result;
}

id sub_5370()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_AA00();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

double variable initialization expression of SiriInferenceBridge.siriRemembersEntityExtractorProvider@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t SiriInferenceBridge.__allocating_init()()
{
  return sub_9418((uint64_t)sub_5408);
}

uint64_t sub_5408()
{
  sub_9424();
  uint64_t v1 = sub_A770();
  uint64_t v2 = sub_A760();
  v0[5] = v1;
  v0[6] = &protocol witness table for OSFeatureFlagProvider;
  v0[2] = v2;
  type metadata accessor for SiriInferenceBridge();
  swift_allocObject();
  v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  void *v3 = v0;
  v3[1] = sub_54D0;
  return SiriInferenceBridge.init(featureFlagProvider:)();
}

uint64_t sub_54D0()
{
  sub_9424();
  uint64_t v3 = v2;
  sub_93B4();
  sub_940C();
  *uint64_t v5 = v4;
  uint64_t v6 = *v1;
  sub_93FC();
  void *v7 = v6;
  *(void *)(v8 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_9454();
    return _swift_task_switch(v9, v10, v11);
  }
  else
  {
    sub_94B8();
    return v12(v3);
  }
}

uint64_t sub_55D0()
{
  sub_9520();
  return v0();
}

uint64_t SiriInferenceBridge.__allocating_init(featureFlagProvider:)()
{
  sub_9424();
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_5690;
  return SiriInferenceBridge.init(featureFlagProvider:)();
}

uint64_t sub_5690()
{
  sub_9424();
  uint64_t v3 = v2;
  sub_93B4();
  uint64_t v4 = *v1;
  sub_93FC();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_94B8();
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t type metadata accessor for SiriInferenceBridge()
{
  return self;
}

uint64_t SiriInferenceBridge.init(featureFlagProvider:)()
{
  sub_9424();
  v1[62] = v2;
  v1[63] = v0;
  sub_6640(&qword_10378);
  v1[64] = sub_943C();
  uint64_t v3 = sub_A600();
  v1[65] = v3;
  sub_93E4(v3);
  v1[66] = v4;
  v1[67] = *(void *)(v5 + 64);
  v1[68] = swift_task_alloc();
  v1[69] = swift_task_alloc();
  uint64_t v6 = sub_A540();
  v1[70] = v6;
  sub_93E4(v6);
  v1[71] = v7;
  v1[72] = sub_943C();
  sub_A7B0();
  v1[73] = sub_943C();
  uint64_t v8 = sub_A9E0();
  v1[74] = v8;
  sub_93E4(v8);
  v1[75] = v9;
  v1[76] = sub_943C();
  uint64_t v10 = sub_A9C0();
  v1[77] = v10;
  sub_93E4(v10);
  v1[78] = v11;
  v1[79] = sub_943C();
  sub_9454();
  return _swift_task_switch(v12, v13, v14);
}

uint64_t sub_5908()
{
  uint64_t v1 = v0[63];
  *(void *)(v1 + 16) = 0;
  sub_5330();
  sub_A670();
  sub_A660();
  *(void *)(v1 + 24) = sub_5370();
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(void *)(v1 + 64) = 0;
  uint64_t v2 = (void *)sub_A820();
  sub_A800();

  sub_A710();
  uint64_t v3 = (void *)sub_A820();
  sub_A830();

  sub_A7E0();
  uint64_t v4 = (void *)sub_A9D0();
  os_log_type_t v5 = sub_AA50();
  if (sub_94EC(v5))
  {
    *(_WORD *)sub_94C4() = 0;
    sub_954C(&dword_0, v6, v7, "starting suggestions xpc service..");
    sub_9460();
  }
  uint64_t v8 = v0[76];
  uint64_t v9 = v0[75];
  uint64_t v10 = v0[74];
  uint64_t v11 = v0[72];
  uint64_t v12 = v0[71];
  uint64_t v37 = v0[70];
  uint64_t v38 = v0[69];
  uint64_t v39 = v0[66];
  uint64_t v31 = v0[65];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_A7D0();
  sub_6640(&qword_10380);
  sub_6640(&qword_10388);
  sub_A9F0();
  sub_A7C0();
  sub_A7A0();
  sub_A560();
  sub_94A0();
  v0[80] = sub_A550();
  uint64_t v34 = sub_A690();
  uint64_t v33 = sub_A680();
  v0[81] = v33;
  uint64_t v13 = sub_A9B0();
  uint64_t v14 = sub_A9A0();
  v0[82] = v14;
  type metadata accessor for DefaultFeatureServiceFactory();
  v32 = (void *)swift_allocObject();
  v0[83] = (uint64_t)v32;
  v32[5] = v13;
  v32[6] = &protocol witness table for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider;
  v32[2] = v14;
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v11, enum case for TrialUseCase.suggestionServiceStarting(_:), v37);
  uint64_t v36 = sub_A5D0();
  swift_allocObject();
  swift_retain();
  uint64_t v15 = sub_A5C0();
  v0[84] = v15;
  uint64_t v30 = v15;
  sub_A730();
  v0[85] = sub_A720();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_A5E0();
  v0[12] = v31;
  v0[13] = (uint64_t)&protocol witness table for DefaultBookkeepingXPCClient;
  uint64_t v16 = sub_877C(v0 + 9);
  v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v39 + 16);
  v0[86] = (uint64_t)v17;
  v0[87] = (v39 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v17(v16, v38, v31);
  sub_A990();
  sub_9098((uint64_t)(v0 + 9));
  v0[17] = v31;
  uint64_t v18 = sub_9148(&qword_10390, 255, (void (*)(uint64_t))&type metadata accessor for DefaultBookkeepingXPCClient);
  v0[18] = v18;
  v19 = sub_877C(v0 + 14);
  v17(v19, v38, v31);
  sub_A940();
  sub_94A0();
  v0[88] = sub_A930();
  uint64_t v35 = sub_A510();
  sub_A5B0();
  sub_A5A0();
  sub_9148(&qword_10398, 255, (void (*)(uint64_t))&type metadata accessor for AppUtilsService);
  sub_9148(&qword_103A0, 255, (void (*)(uint64_t))&type metadata accessor for InternalXPCSuggestionsLoggerFactory);
  sub_90E8((uint64_t)(v0 + 29), (uint64_t)(v0 + 19));
  v0[27] = v31;
  v0[28] = v18;
  v20 = sub_877C(v0 + 24);
  v17(v20, v38, v31);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v21 = sub_A500();
  v0[89] = v21;
  type metadata accessor for SiriInferenceBridge();
  v0[37] = v35;
  v0[38] = (uint64_t)&protocol witness table for TrialSuggestionsServiceFactory;
  v0[34] = v21;
  v0[42] = v34;
  v0[43] = (uint64_t)&protocol witness table for DefaultSELFLogger;
  v0[39] = v33;
  uint64_t v22 = sub_A8E0();
  sub_94A0();
  swift_retain();
  swift_retain();
  uint64_t v23 = sub_A8D0();
  v0[47] = v22;
  v0[48] = (uint64_t)&protocol witness table for NewUUIDRequestIdProvider;
  v0[44] = v23;
  v0[52] = v36;
  v0[53] = (uint64_t)&protocol witness table for TrialRuntimeConfigProvider;
  v0[49] = v30;
  swift_retain();
  swift_task_alloc();
  sub_9508();
  v0[90] = (uint64_t)v26;
  void *v26 = v27;
  v26[1] = sub_5FF8;
  uint64_t v28 = v0[62];
  return sub_6684((uint64_t)(v0 + 2), (uint64_t)(v0 + 34), (uint64_t)(v0 + 29), (uint64_t)(v0 + 39), v24, v25, (uint64_t)(v0 + 44), v28);
}

uint64_t sub_5FF8()
{
  sub_9430();
  sub_93B4();
  uint64_t v3 = v2;
  sub_940C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_93FC();
  *uint64_t v6 = v5;
  *(void *)(v3 + 728) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_release();
  }
  else
  {
    sub_9098(v3 + 392);
    sub_9098(v3 + 352);
    sub_9098(v3 + 312);
    sub_9098(v3 + 272);
  }
  sub_9454();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_6110()
{
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 688);
  uint64_t v1 = *(void *)(v0 + 544);
  uint64_t v19 = *(void *)(v0 + 552);
  uint64_t v2 = *(void *)(v0 + 528);
  uint64_t v3 = *(void *)(v0 + 520);
  uint64_t v4 = *(void *)(v0 + 504);
  uint64_t v5 = *(void *)(v0 + 512);
  uint64_t v21 = *(void *)(v0 + 496);
  uint64_t v6 = *(void **)(v0 + 16);
  uint64_t v7 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v6;
  uint64_t v8 = v4 + 32;
  id v9 = v6;

  sub_90E8(v0 + 24, v0 + 432);
  swift_beginAccess();
  sub_87E4(v0 + 432, v8);
  swift_endAccess();
  sub_AA20();
  uint64_t v10 = sub_AA40();
  sub_884C(v5, 0, 1, v10);
  v20(v1, v19, v3);
  unint64_t v11 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v12 + v11, v1, v3);
  sub_7144(v5, (uint64_t)&unk_103C0, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_8A54(v5, &qword_10378);
  sub_8A00((id *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v3);
  sub_9098(v0 + 232);
  sub_A710();
  uint64_t v13 = (void *)sub_A820();
  sub_A810();

  sub_9098(v21);
  uint64_t v14 = sub_9538();
  v15(v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_94B8();
  uint64_t v17 = *(void *)(v0 + 504);
  return v16(v17);
}

uint64_t sub_6430()
{
  uint64_t v8 = v0[79];
  uint64_t v1 = v0[78];
  uint64_t v10 = v0[77];
  uint64_t v2 = v0[69];
  uint64_t v3 = v0[66];
  uint64_t v4 = v0[65];
  uint64_t v9 = v0[62];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_9098((uint64_t)(v0 + 29));
  sub_9098((uint64_t)(v0 + 49));
  sub_9098((uint64_t)(v0 + 44));
  sub_9098((uint64_t)(v0 + 39));
  sub_9098((uint64_t)(v0 + 34));
  sub_A710();
  uint64_t v5 = (void *)sub_A820();
  sub_A810();

  sub_9098(v9);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v8, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_9520();
  return v6();
}

uint64_t sub_6640(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[52] = v13;
  v8[53] = v14;
  v8[50] = a7;
  v8[51] = a8;
  v8[48] = a3;
  v8[49] = a4;
  v8[46] = a1;
  v8[47] = a2;
  sub_9454();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_66BC()
{
  sub_9514();
  uint64_t v1 = v0[53];
  uint64_t v2 = sub_A640();
  v0[54] = sub_A630();
  v0[45] = sub_A730();
  v0[42] = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[55] = v3;
  uint64_t v4 = sub_9148(&qword_105A0, 255, (void (*)(uint64_t))&type metadata accessor for DefaultGlobalLifeCycleContainer);
  v0[56] = v4;
  void *v3 = v0;
  v3[1] = sub_67E4;
  return GlobalLifeCycleContainer.addToLifeCycle(entity:)(v0 + 42, v2, v4);
}

uint64_t sub_67E4()
{
  sub_9514();
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = (void *)*v0;
  sub_93FC();
  void *v3 = v2;
  uint64_t v4 = (void *)*v0;
  void *v3 = *v0;
  swift_task_dealloc();
  sub_9098((uint64_t)(v2 + 42));
  sub_A620();
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[57] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_6990;
  uint64_t v6 = v1[56];
  uint64_t v7 = v2[54];
  uint64_t v8 = v1[48];
  uint64_t v9 = v1[47];
  return static SuggestionServiceAPIProviders.create(serviceFactory:lifecycleContainer:clock:)(v9, v7, v6, v8);
}

uint64_t sub_6990()
{
  sub_9424();
  sub_93B4();
  sub_940C();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_93FC();
  *uint64_t v4 = v3;
  *(void *)(v7 + 464) = v5;
  *(void *)(v7 + 472) = v6;
  swift_task_dealloc();
  swift_release();
  sub_9454();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_6A78()
{
  uint64_t v2 = *(void *)(v0 + 464);
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v12 = *(void *)(v0 + 416);
  uint64_t v13 = *(void *)(v0 + 408);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v16 = *(uint64_t **)(v0 + 368);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v15 = *(void *)(v1 + 16);
  uint64_t v5 = sub_A860();
  sub_90E8(v4, v0 + 56);
  sub_90E8(v3, v0 + 96);
  swift_unknownObjectRetain_n();
  uint64_t v6 = sub_A850();
  sub_A8A0();
  *(void *)(v0 + 40) = v5;
  *(void *)(v0 + 48) = sub_9148(&qword_105A8, 255, (void (*)(uint64_t))&type metadata accessor for EventDrivenSuggestionsClient);
  *(void *)(v0 + 16) = v6;
  swift_retain();
  sub_A890();
  sub_9098(v0 + 16);
  sub_A900();
  sub_90E8(v0 + 136, v0 + 216);
  swift_unknownObjectRetain();
  sub_A8F0();
  sub_A6B0();
  sub_A6A0();
  sub_A880();
  sub_9148(&qword_105B0, 255, (void (*)(uint64_t))&type metadata accessor for DispatchedServiceAPIProvider);
  sub_90E8(v12, v0 + 256);
  sub_90E8(v13, v0 + 296);
  swift_retain();
  swift_retain();
  sub_A870();
  sub_9148(&qword_105B8, 255, (void (*)(uint64_t))&type metadata accessor for EventDrivenSuggestionsClient);
  *(void *)&long long v17 = v6;
  id v7 = objc_allocWithZone((Class)sub_A8C0());
  swift_retain();
  uint64_t v8 = sub_A8B0();
  *(void *)(v0 + 200) = &type metadata for APISiriRemembersEntityExtractorProvider;
  *(void *)(v0 + 208) = sub_9190();
  uint64_t v9 = swift_allocObject();
  *(void *)(v0 + 176) = v9;
  *(void *)(v9 + 16) = v2;
  *(_OWORD *)(v9 + 24) = v17;
  *(void *)(v9 + 40) = ObjectType;
  *(void *)(v9 + 48) = v15;
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  sub_9098(v0 + 136);
  *uint64_t v16 = v8;
  sub_9214((long long *)(v0 + 176), (uint64_t)(v16 + 1));
  v16[6] = v6;
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_6E18()
{
  uint64_t v1 = sub_A9E0();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_6F0C;
  return DefaultBookkeepingXPCClient.buildAutoCompleteIndex(onStartUpEvent:)(1);
}

uint64_t sub_6F0C()
{
  sub_9430();
  sub_93B4();
  uint64_t v3 = v2;
  sub_940C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 56) = v6;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    id v7 = *(uint64_t (**)(void))(v5 + 8);
    return v7();
  }
  else
  {
    sub_9454();
    return _swift_task_switch(v9, v10, v11);
  }
}

uint64_t sub_702C()
{
  sub_9514();
  sub_A7F0();
  uint64_t v2 = sub_A9D0();
  os_log_type_t v3 = sub_AA60();
  if (sub_94EC(v3))
  {
    uint64_t v4 = v1[7];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134217984;
    v1[2] = v4;
    sub_AA80();
    _os_log_impl(&dword_0, v2, v0, "BuildAutoCompleteIndex on Suggestion startup. Added %ld phrases into the DB", v5, 0xCu);
    sub_9460();
  }

  (*(void (**)(void, void))(v1[4] + 8))(v1[5], v1[3]);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v1[1];
  return v6();
}

uint64_t sub_7144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_6640(&qword_10378);
  __chkstk_darwin();
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8FB8(a1, (uint64_t)v6, &qword_10378);
  uint64_t v7 = sub_AA40();
  if (sub_9018((uint64_t)v6, 1, v7) == 1)
  {
    sub_8A54((uint64_t)v6, &qword_10378);
  }
  else
  {
    sub_AA30();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    uint64_t v8 = sub_AA10();
    uint64_t v10 = v9;
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  if (v10 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v10;
  }
  return swift_task_create();
}

uint64_t sub_72E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_A740();
  sub_93CC();
  uint64_t v8 = v7;
  __chkstk_darwin();
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_90E8(a1, (uint64_t)v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v6);
  v14[3] = sub_A700();
  v14[4] = sub_9148(&qword_10598, 255, (void (*)(uint64_t))&type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState);
  sub_877C(v14);
  sub_952C();
  (*(void (**)(void))(v11 + 16))();
  uint64_t v12 = sub_A920();
  sub_94A0();
  uint64_t result = sub_A910();
  a3[3] = v12;
  a3[4] = (uint64_t)&protocol witness table for EventDrivenInteractionBuilder;
  *a3 = result;
  return result;
}

uint64_t static SiriInferenceBridge.getInstance()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_A9E0();
  sub_93CC();
  uint64_t v5 = v4;
  __chkstk_darwin();
  sub_9478();
  uint64_t v6 = sub_A9D0();
  os_log_type_t v7 = sub_AA70();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)sub_94C4();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "synchronous instance of SiriInferenceSuggestionsBridge no longer supported. Please call getInstanceAsync instead", v8, 2u);
    sub_9460();
  }

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  uint64_t v9 = type metadata accessor for NoopSuggestionsBridge();
  uint64_t inited = swift_initStaticObject();
  a1[3] = v9;
  uint64_t result = sub_9148(&qword_103C8, v11, (void (*)(uint64_t))type metadata accessor for NoopSuggestionsBridge);
  a1[4] = result;
  *a1 = inited;
  return result;
}

uint64_t sub_75B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NoopSuggestionsBridge();
  uint64_t inited = swift_initStaticObject();
  a1[3] = v2;
  uint64_t result = sub_9148(&qword_103C8, v4, (void (*)(uint64_t))type metadata accessor for NoopSuggestionsBridge);
  a1[4] = result;
  *a1 = inited;
  return result;
}

uint64_t static SiriInferenceBridge.getInstanceAsync()()
{
  sub_9424();
  v0[2] = v1;
  uint64_t v2 = sub_A9E0();
  v0[3] = v2;
  sub_93E4(v2);
  v0[4] = v3;
  v0[5] = sub_943C();
  sub_9454();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_76C0()
{
  sub_9430();
  sub_A7F0();
  uint64_t v1 = (void *)sub_A9D0();
  os_log_type_t v2 = sub_AA50();
  if (sub_94EC(v2))
  {
    *(_WORD *)sub_94C4() = 0;
    sub_954C(&dword_0, v3, v4, "Obtaining Async instance of SiriInferenceSuggestionsBridge");
    sub_9460();
  }
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[3];

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v0[6] = type metadata accessor for SiriInferenceBridge();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[7] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_77C4;
  return SiriInferenceBridge.__allocating_init()();
}

uint64_t sub_77C4()
{
  sub_9430();
  uint64_t v3 = v2;
  sub_93B4();
  uint64_t v5 = v4;
  sub_940C();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_93FC();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
    return v9();
  }
  else
  {
    *(void *)(v5 + 64) = v3;
    sub_9454();
    return _swift_task_switch(v11, v12, v13);
  }
}

uint64_t sub_78E0()
{
  sub_9430();
  uint64_t v1 = v0[8];
  uint64_t v2 = (void *)v0[2];
  v2[3] = v0[6];
  v2[4] = sub_9148(&qword_103D8, v3, (void (*)(uint64_t))type metadata accessor for SiriInferenceBridge);
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

Swift::Void __swiftcall SiriInferenceBridge.startSiriSuggestionsService()()
{
  uint64_t v1 = v0;
  sub_A9E0();
  sub_93CC();
  __chkstk_darwin();
  sub_94DC();
  sub_A6F0();
  __chkstk_darwin();
  sub_94DC();
  uint64_t v14 = sub_A6D0();
  sub_93CC();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_94DC();
  uint64_t v6 = v5 - v4;
  sub_A780();
  sub_A590();
  sub_94A0();
  sub_A580();
  id v7 = [self processInfo];
  [v7 operatingSystemVersion];

  sub_A6E0();
  sub_A6C0();
  sub_A7D0();
  sub_A570();
  sub_9098((uint64_t)&v15);
  uint64_t v8 = *(void **)(v1 + 24);
  [v8 setDelegate:*(void *)(v1 + 16)];
  [v8 resume];
  sub_A7E0();
  uint64_t v9 = sub_A9D0();
  os_log_type_t v10 = sub_AA50();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)sub_94C4();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_0, v9, v10, "suggestions xpc service started and is listening for connections", v11, 2u);
    sub_9460();
  }

  swift_release();
  uint64_t v12 = sub_9538();
  v13(v12);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v14);
}

uint64_t SiriInferenceBridge.getSuggestionEntity(interaction:)(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return sub_9418((uint64_t)sub_7C2C);
}

uint64_t sub_7C2C()
{
  uint64_t v1 = v0[16] + 32;
  swift_beginAccess();
  sub_8FB8(v1, (uint64_t)(v0 + 2), &qword_103B0);
  uint64_t v2 = v0[5];
  v0[17] = v2;
  if (v2)
  {
    uint64_t v3 = v0[6];
    sub_8AAC(v0 + 2, v2);
    sub_93CC();
    uint64_t v5 = v4;
    v0[18] = v4;
    v0[19] = sub_943C();
    (*(void (**)(void))(v5 + 16))();
    sub_8A54((uint64_t)(v0 + 2), &qword_103B0);
    swift_task_alloc();
    sub_9508();
    v0[20] = v6;
    *uint64_t v6 = v7;
    v6[1] = sub_7DE0;
    return dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter(v0 + 7, v2, v3);
  }
  else
  {
    sub_8A54((uint64_t)(v0 + 2), &qword_103B0);
    sub_94B8();
    return v8(0);
  }
}

uint64_t sub_7DE0()
{
  sub_9430();
  sub_93B4();
  uint64_t v2 = v1[19];
  uint64_t v3 = v1[18];
  uint64_t v4 = v1[17];
  uint64_t v5 = *v0;
  sub_93FC();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_9454();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_7F04()
{
  sub_9514();
  sub_8AAC((void *)(v0 + 56), *(void *)(v0 + 80));
  uint64_t v1 = sub_A520();
  sub_9098(v0 + 56);
  swift_task_dealloc();
  sub_94B8();
  return v2(v1);
}

uint64_t SiriInferenceBridge.deinit()
{
  sub_8A54(v0 + 32, &qword_103B0);
  return v0;
}

uint64_t SiriInferenceBridge.__deallocating_deinit()
{
  SiriInferenceBridge.deinit();

  return _swift_deallocClassInstance(v0, 72, 7);
}

void sub_801C()
{
}

uint64_t sub_8040@<X0>(uint64_t *a1@<X8>)
{
  return static SiriInferenceBridge.getInstance()(a1);
}

uint64_t sub_8058()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_93B0;
  return static SiriInferenceBridge.getInstanceAsync()();
}

uint64_t sub_80F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_93B0;
  return SiriInferenceSuggestionsBridge.onEvent<A>(event:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_81CC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return sub_9418((uint64_t)sub_81E4);
}

uint64_t sub_81E4()
{
  sub_9430();
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_8AAC(v1, v2);
  uint64_t v4 = *(void *)(v3 + 8);
  swift_task_alloc();
  sub_9508();
  v0[4] = v5;
  *uint64_t v5 = v6;
  v5[1] = sub_829C;
  uint64_t v7 = v0[2];
  return dispatch thunk of SiriRemembersEntityExtractorProvider.siriRemembersEntityExtractor.getter(v7, v2, v4);
}

uint64_t sub_829C()
{
  sub_9424();
  sub_93B4();
  uint64_t v1 = *v0;
  sub_93FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_9520();
  return v3();
}

uint64_t sub_835C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_93B0;
  return sub_81CC(a1);
}

uint64_t sub_83F4()
{
  uint64_t v1 = sub_A9E0();
  sub_93CC();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_9478();
  uint64_t v4 = sub_A9D0();
  os_log_type_t v5 = sub_AA70();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)sub_94C4();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "startSiriSuggestionsService: No suggestion bridge loaded", v6, 2u);
    sub_9460();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

uint64_t sub_84DC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_84EC()
{
  return sub_83F4();
}

uint64_t sub_8504@<X0>(uint64_t *a1@<X8>)
{
  return sub_75B4(a1);
}

uint64_t sub_851C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_85D0;
  return static SiriInferenceSuggestionsBridge.getInstanceAsync()(a1, a2, a3);
}

uint64_t sub_85D0()
{
  sub_9424();
  sub_93B4();
  uint64_t v1 = *v0;
  sub_93FC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_9520();
  return v3();
}

uint64_t sub_8690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_85D0;
  return SiriInferenceSuggestionsBridge.onEvent<A>(event:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_876C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t *sub_877C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_87E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6640(&qword_103B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_8874()
{
  uint64_t v1 = sub_A600();
  sub_93CC();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v9);
}

uint64_t sub_891C()
{
  sub_9430();
  sub_A600();
  swift_task_alloc();
  sub_9508();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v2;
  v1[1] = sub_85D0;
  return sub_6E18();
}

id *sub_8A00(id *a1)
{
  return a1;
}

uint64_t type metadata accessor for NoopSuggestionsBridge()
{
  return self;
}

uint64_t sub_8A54(uint64_t a1, uint64_t *a2)
{
  sub_6640(a2);
  sub_952C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void *sub_8AAC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriInferenceBridge.SuggestionsStartupComponents(id *a1)
{
  sub_9098((uint64_t)(a1 + 1));

  return swift_release();
}

uint64_t initializeWithCopy for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v5 = a1 + 8;
  uint64_t v6 = a2 + 8;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = v7;
  uint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  id v10 = v4;
  v9(v5, v6, v8);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  sub_8C70((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_8C70(uint64_t *result, uint64_t *a2)
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

__n128 initializeWithTake for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  sub_9098(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriInferenceBridge.SuggestionsStartupComponents(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriInferenceBridge.SuggestionsStartupComponents()
{
  return &type metadata for SiriInferenceBridge.SuggestionsStartupComponents;
}

uint64_t sub_8FB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_6640(a3);
  sub_952C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_9018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_9040()
{
  return sub_A840();
}

uint64_t sub_9098(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_90E8(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  sub_952C();
  (*v3)(a2);
  return a2;
}

uint64_t sub_9148(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_9190()
{
  unint64_t result = qword_105C0;
  if (!qword_105C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105C0);
  }
  return result;
}

uint64_t sub_91DC()
{
  sub_9098(v0 + 16);

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_9214(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t destroy for APISiriRemembersEntityExtractorProvider(uint64_t a1)
{
  return sub_9098(a1);
}

uint64_t initializeWithCopy for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for APISiriRemembersEntityExtractorProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for APISiriRemembersEntityExtractorProvider(uint64_t a1, uint64_t a2)
{
  sub_9098(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for APISiriRemembersEntityExtractorProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APISiriRemembersEntityExtractorProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for APISiriRemembersEntityExtractorProvider()
{
  return &type metadata for APISiriRemembersEntityExtractorProvider;
}

uint64_t sub_93E4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_9418(uint64_t a1)
{
  return _swift_task_switch(a1, 0, 0);
}

uint64_t sub_943C()
{
  return swift_task_alloc();
}

uint64_t sub_9460()
{
  return swift_slowDealloc();
}

uint64_t sub_9478()
{
  return sub_A7F0();
}

uint64_t sub_94A0()
{
  return swift_allocObject();
}

uint64_t sub_94C4()
{
  return swift_slowAlloc();
}

BOOL sub_94EC(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_9520()
{
  return v0 + 8;
}

uint64_t sub_9538()
{
  return v0;
}

void sub_954C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t DefaultSuggestionsLoggerFactory.__allocating_init(featureFlagProvider:siriRemembersLogger:)(long long *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_9214(a1, v4 + 16);
  *(void *)(v4 + 56) = a2;
  return v4;
}

uint64_t DefaultSuggestionsLoggerFactory.init(featureFlagProvider:siriRemembersLogger:)(long long *a1, uint64_t a2)
{
  sub_9214(a1, v2 + 16);
  *(void *)(v2 + 56) = a2;
  return v2;
}

uint64_t DefaultSuggestionsLoggerFactory.create(featureService:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_A9E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  uint64_t v12 = &v24[-v11 - 8];
  sub_8AAC((void *)(v2 + 16), *(void *)(v2 + 40));
  if (sub_A750())
  {
    sub_A7F0();
    uint64_t v13 = sub_A9D0();
    os_log_type_t v14 = sub_AA50();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_0, v13, v14, "Enabled feature extraction logger", v15, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_992C(a1, (uint64_t)v24);
    uint64_t v16 = sub_A960();
    swift_allocObject();
    uint64_t v17 = sub_A950();
    a2[3] = v16;
    uint64_t v18 = (void *)sub_9990();
  }
  else
  {
    sub_A7F0();
    uint64_t v19 = sub_A9D0();
    os_log_type_t v20 = sub_AA50();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "Feature Extraction disabled. Only using raw remembers logger", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v17 = *(void *)(v3 + 56);
    a2[3] = sub_A650();
    uint64_t v18 = &protocol witness table for SiriRemembersLogger;
  }
  a2[4] = (uint64_t)v18;
  *a2 = v17;
  return swift_retain();
}

uint64_t DefaultSuggestionsLoggerFactory.deinit()
{
  sub_9098(v0 + 16);
  swift_release();
  return v0;
}

uint64_t DefaultSuggestionsLoggerFactory.__deallocating_deinit()
{
  sub_9098(v0 + 16);
  swift_release();

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_9908@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return DefaultSuggestionsLoggerFactory.create(featureService:)(a1, a2);
}

uint64_t sub_992C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_9990()
{
  unint64_t result = qword_105D8;
  if (!qword_105D8)
  {
    sub_A960();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_105D8);
  }
  return result;
}

uint64_t type metadata accessor for DefaultSuggestionsLoggerFactory()
{
  return self;
}

uint64_t DefaultFeatureServiceFactory.__allocating_init(accountDetailsProvider:)(uint64_t a1)
{
  return sub_9A34(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_A224);
}

uint64_t DefaultFeatureServiceFactory.init(accountDetailsProvider:)(uint64_t a1)
{
  return sub_9A34(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_A384);
}

uint64_t sub_9A34(uint64_t a1, uint64_t (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = sub_A334(a1, v5);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  uint64_t v11 = a2(v9, v2, v5, v6);
  sub_9098(a1);
  return v11;
}

uint64_t DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[21] = a5;
  v6[22] = v5;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  uint64_t v7 = sub_A9E0();
  v6[23] = v7;
  v6[24] = *(void *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return _swift_task_switch(sub_9C00, 0, 0);
}

uint64_t sub_9C00()
{
  sub_8AAC(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
  if (sub_A750())
  {
    sub_A7F0();
    uint64_t v1 = sub_A9D0();
    os_log_type_t v2 = sub_AA50();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_0, v1, v2, "Enabled feature service", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = *(void *)(v0 + 208);
    uint64_t v5 = *(void *)(v0 + 184);
    uint64_t v6 = *(void *)(v0 + 192);
    uint64_t v7 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_A3F4(v7, v0 + 56);
    if (*(void *)(v0 + 80))
    {
      sub_9214((long long *)(v0 + 56), v0 + 16);
    }
    else
    {
      sub_992C(*(void *)(v0 + 176) + 16, v0 + 16);
      sub_A45C(v0 + 56);
    }
    sub_A7D0();
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_9EC0;
    uint64_t v17 = *(void *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 152);
    uint64_t v19 = *(void *)(v0 + 136);
    return static SiriSuggestionsIntelligence.createFeatureService(clock:configProvider:accountDetailsProvider:possibleOwners:)(v19, v0 + 96, v18, v0 + 16, v17);
  }
  else
  {
    sub_A7F0();
    uint64_t v8 = sub_A9D0();
    os_log_type_t v9 = sub_AA50();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "Feature Service disabled.", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v13 = *(void *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    sub_A980();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v14 = *(uint64_t (**)(void))(v0 + 8);
    return v14();
  }
}

uint64_t sub_9EC0()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *v0 + 96;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  sub_9098(v2);
  sub_9098(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t DefaultFeatureServiceFactory.deinit()
{
  sub_9098(v0 + 16);
  return v0;
}

uint64_t DefaultFeatureServiceFactory.__deallocating_deinit()
{
  sub_9098(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_A064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_A130;
  return DefaultFeatureServiceFactory.create(featureFlagProvider:configProvider:accountDetailsProviderOverride:possibleOwners:)(a1, a2, a3, a4, a5);
}

uint64_t sub_A130()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *sub_A224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  os_log_type_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  uint64_t v11 = sub_A384((uint64_t)v9, v10, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v11;
}

uint64_t sub_A334(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_A384(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  a2[5] = a3;
  a2[6] = a4;
  uint64_t v7 = sub_877C(a2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(v7, a1, a3);
  return a2;
}

uint64_t sub_A3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6640(&qword_10690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_A45C(uint64_t a1)
{
  uint64_t v2 = sub_6640(&qword_10690);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DefaultFeatureServiceFactory()
{
  return self;
}

uint64_t sub_A500()
{
  return TrialSuggestionsServiceFactory.__allocating_init(enabled:appUtils:selfLogger:suggestionsLoggerFactory:featureServiceFactory:trialRuntimeConfigProvider:clock:bookkeepingXPCClient:)();
}

uint64_t sub_A510()
{
  return type metadata accessor for TrialSuggestionsServiceFactory();
}

uint64_t sub_A520()
{
  return dispatch thunk of SiriRemembersEntityExtractor.extractActionEntity(from:)();
}

uint64_t sub_A540()
{
  return type metadata accessor for TrialUseCase();
}

uint64_t sub_A550()
{
  return AppUtilsService.init(cache:homescreenAppPicker:)();
}

uint64_t sub_A560()
{
  return type metadata accessor for AppUtilsService();
}

uint64_t sub_A570()
{
  return OSUpdateTracker.recordOSUpdate(osInfo:clockTime:)();
}

uint64_t sub_A580()
{
  return OSUpdateTracker.init(userDefaultsProvider:)();
}

uint64_t sub_A590()
{
  return type metadata accessor for OSUpdateTracker();
}

uint64_t sub_A5A0()
{
  return static SuggestionService.isEnabled()();
}

uint64_t sub_A5B0()
{
  return type metadata accessor for SuggestionService();
}

uint64_t sub_A5C0()
{
  return TrialRuntimeConfigProvider.init(trialUseCase:)();
}

uint64_t sub_A5D0()
{
  return type metadata accessor for TrialRuntimeConfigProvider();
}

uint64_t sub_A5E0()
{
  return DefaultBookkeepingXPCClient.init(featureConfigProvider:accountDetailsProvider:ownerProviders:)();
}

uint64_t sub_A600()
{
  return type metadata accessor for DefaultBookkeepingXPCClient();
}

uint64_t sub_A620()
{
  return type metadata accessor for SuggestionServiceAPIProviders();
}

uint64_t sub_A630()
{
  return DefaultGlobalLifeCycleContainer.__allocating_init()();
}

uint64_t sub_A640()
{
  return type metadata accessor for DefaultGlobalLifeCycleContainer();
}

uint64_t sub_A650()
{
  return type metadata accessor for SiriRemembersLogger();
}

uint64_t sub_A660()
{
  return static SiriSuggestionsXPCConstants.machServiceName.getter();
}

uint64_t sub_A670()
{
  return type metadata accessor for SiriSuggestionsXPCConstants();
}

uint64_t sub_A680()
{
  return DefaultSELFLogger.__allocating_init()();
}

uint64_t sub_A690()
{
  return type metadata accessor for DefaultSELFLogger();
}

uint64_t sub_A6A0()
{
  return static IFSalientEntitiesService.instance.getter();
}

uint64_t sub_A6B0()
{
  return type metadata accessor for IFSalientEntitiesService();
}

uint64_t sub_A6C0()
{
  return SuggestionsOSInfo.init(osVersion:)();
}

uint64_t sub_A6D0()
{
  return type metadata accessor for SuggestionsOSInfo();
}

uint64_t sub_A6E0()
{
  return SuggestionsOSVersion.init(from:)();
}

uint64_t sub_A6F0()
{
  return type metadata accessor for SuggestionsOSVersion();
}

uint64_t sub_A700()
{
  return type metadata accessor for SiriSuggestions.SiriRuntimeDeviceState();
}

uint64_t sub_A710()
{
  return static SiriSuggestionsSignpost.bridgeStartup.getter();
}

uint64_t sub_A720()
{
  return OwnerProviders.__allocating_init(owners:)();
}

uint64_t sub_A730()
{
  return type metadata accessor for OwnerProviders();
}

uint64_t sub_A740()
{
  return type metadata accessor for InAppIdentifier();
}

uint64_t sub_A750()
{
  return dispatch thunk of FeatureFlagProvider.isFeatureExtractionEnabled()();
}

uint64_t sub_A760()
{
  return OSFeatureFlagProvider.__allocating_init()();
}

uint64_t sub_A770()
{
  return type metadata accessor for OSFeatureFlagProvider();
}

uint64_t sub_A780()
{
  return static UserDefaultsProviders.getSuggestionsUserDefaultsProvider()();
}

uint64_t sub_A7A0()
{
  return ThirdPartyHomeScreenAppPicker.init(randSeed:)();
}

uint64_t sub_A7B0()
{
  return type metadata accessor for ThirdPartyHomeScreenAppPicker();
}

uint64_t sub_A7C0()
{
  return Cache.__allocating_init(store:)();
}

uint64_t sub_A7D0()
{
  return static Clocks.getSystemClock()();
}

uint64_t sub_A7E0()
{
  return static Logger.xpcCategory.getter();
}

uint64_t sub_A7F0()
{
  return static Logger.initCategory.getter();
}

uint64_t sub_A800()
{
  return static Logger.makeSignpostID(log:)();
}

uint64_t sub_A810()
{
  return static Logger.end(_:_:log:telemetry:)();
}

uint64_t sub_A820()
{
  return static Logger.log.getter();
}

uint64_t sub_A830()
{
  return static Logger.begin(_:_:log:telemetry:)();
}

uint64_t sub_A840()
{
  return static EventDrivenSuggestionsClient.getInteractionBuilder@Sendable (event:inAppIdentifier:deviceState:)();
}

uint64_t sub_A850()
{
  return EventDrivenSuggestionsClient.__allocating_init(clock:suggestionService:interactionBuilder:requestIdProvider:)();
}

uint64_t sub_A860()
{
  return type metadata accessor for EventDrivenSuggestionsClient();
}

uint64_t sub_A870()
{
  return StatefulSuggestionsClient.__allocating_init(suggestionService:salientEntityService:runtimeConfigProvider:featureFlagProvider:)();
}

uint64_t sub_A880()
{
  return type metadata accessor for StatefulSuggestionsClient();
}

uint64_t sub_A890()
{
  return static InServiceSuggestionsDispatcher.create(eventDispatcher:clock:selfLogger:)();
}

uint64_t sub_A8A0()
{
  return type metadata accessor for InServiceSuggestionsDispatcher();
}

uint64_t sub_A8B0()
{
  return SiriSuggestionsServiceDelegate.init(with:eventDrivenClient:)();
}

uint64_t sub_A8C0()
{
  return type metadata accessor for SiriSuggestionsServiceDelegate();
}

uint64_t sub_A8D0()
{
  return NewUUIDRequestIdProvider.init()();
}

uint64_t sub_A8E0()
{
  return type metadata accessor for NewUUIDRequestIdProvider();
}

uint64_t sub_A8F0()
{
  return DispatchedServiceAPIProvider.__allocating_init(provider:dispatcher:)();
}

uint64_t sub_A900()
{
  return type metadata accessor for DispatchedServiceAPIProvider();
}

uint64_t sub_A910()
{
  return EventDrivenInteractionBuilder.init(event:inAppIdentifier:deviceState:)();
}

uint64_t sub_A920()
{
  return type metadata accessor for EventDrivenInteractionBuilder();
}

uint64_t sub_A930()
{
  return InternalXPCSuggestionsLoggerFactory.init(bookkeepingXPCClient:)();
}

uint64_t sub_A940()
{
  return type metadata accessor for InternalXPCSuggestionsLoggerFactory();
}

uint64_t sub_A950()
{
  return SiriSuggestionsIntelligence.FeatureLogger.init(featureService:siriRemembersLogger:loggingPolicy:)();
}

uint64_t sub_A960()
{
  return type metadata accessor for SiriSuggestionsIntelligence.FeatureLogger();
}

uint64_t sub_A980()
{
  return static SiriSuggestionsIntelligence.getNoOpFeatureService()();
}

uint64_t sub_A990()
{
  return static SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.setAccountDetails(using:on:completion:)();
}

uint64_t sub_A9A0()
{
  return SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider.__allocating_init()();
}

uint64_t sub_A9B0()
{
  return type metadata accessor for SiriSuggestionsIntelligence.PreFetchedAccountDetailsProvider();
}

uint64_t sub_A9C0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_A9D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_A9E0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_A9F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_AA00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_AA10()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_AA20()
{
  return static TaskPriority.background.getter();
}

uint64_t sub_AA30()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_AA40()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_AA50()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_AA60()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_AA70()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_AA80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}