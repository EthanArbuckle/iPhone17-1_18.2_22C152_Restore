uint64_t sub_100004210()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  v1 = v0;
  v2 = [(id)BiomeLibrary() Safari];
  swift_unknownObjectRelease();
  v3 = [v2 Browsing];
  swift_unknownObjectRelease();
  v4 = [v3 Assistant];
  swift_unknownObjectRelease();
  *(void *)(v1 + 16) = v4;
  v5 = [v4 description];
  v6 = sub_100046B20();
  v8 = v7;

  if (qword_100058CA8 != -1) {
    swift_once();
  }
  v9 = sub_100046AC0();
  sub_100004C10(v9, (uint64_t)qword_100061EC8);
  swift_bridgeObjectRetain();
  v10 = sub_100046AA0();
  v11 = sub_100046D50();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    *(_DWORD *)v12 = 136446210;
    swift_bridgeObjectRetain();
    sub_1000422B4(v6, v8, &v14);
    sub_100046D80();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Stream - %{public}s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v1;
}

id sub_100004464(uint64_t a1)
{
  uint64_t v5 = sub_10000488C(&qword_100058E18);
  __chkstk_darwin(v5 - 8);
  sub_100004FBC();
  __chkstk_darwin(v6);
  sub_100004FF8();
  NSString v7 = sub_100004FD8();
  sub_1000048D0(a1, v2);
  uint64_t v8 = sub_100046780();
  sub_100004938(v1, 1, 1, v8);
  id v9 = objc_allocWithZone((Class)BMPublisherOptions);
  id v10 = sub_100004F94();
  id v11 = [v3 publisherWithUseCase:v7 options:v10];

  return v11;
}

id sub_100004560(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = sub_10000488C(&qword_100058E18);
  __chkstk_darwin(v7 - 8);
  sub_100004FBC();
  __chkstk_darwin(v8);
  sub_100004FF8();
  NSString v9 = sub_100004FD8();
  sub_1000048D0(a1, v3);
  sub_1000048D0(a2, v2);
  id v10 = objc_allocWithZone((Class)BMPublisherOptions);
  id v11 = sub_100004F94();
  id v12 = [v4 publisherWithUseCase:v9 options:v11];

  return v12;
}

unint64_t sub_100004658@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v4 = objc_allocWithZone((Class)sub_10000488C(&qword_100058E20));
  id v5 = a1;
  id v6 = sub_100004960(0);
  [v5 subscribe:v6];

  a2[3] = sub_10000488C(&qword_100058E28);
  unint64_t result = sub_100004B74();
  a2[4] = result;
  *a2 = v6;
  return result;
}

uint64_t sub_1000046E8(void *a1)
{
  id v3 = [a1 eventBody];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = v3;
  uint64_t v5 = sub_1000432E4();
  if (v6 >> 60 == 15)
  {

LABEL_4:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v7 = v5;
  id v8 = [v4 webpageViewStarted];

  if (v8) {
LABEL_7:
  }
  return v7;
}

uint64_t sub_1000047B4(void *a1)
{
  id v3 = [a1 eventBodyData];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_1000466F0();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

uint64_t sub_100004830()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SBABiomeEventSource()
{
  return self;
}

uint64_t sub_10000488C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000048D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000488C(&qword_100058E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

id sub_100004960(char a1)
{
  sub_10000488C(&qword_100058E38);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &_swiftEmptyArrayStorage;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  *(unsigned char *)(v3 + 48) = a1;
  sub_10000488C(&qword_100058E40);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 24) = 0;
  *(void *)(v4 + 16) = v3;
  *(void *)&v1[qword_10005A240] = v4;
  v6.receiver = v1;
  v6.super_class = (Class)sub_10000488C(&qword_100058E20);
  return objc_msgSendSuper2(&v6, "init");
}

id sub_100004A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_super v6 = v5;
  uint64_t v12 = sub_100046780();
  Class isa = 0;
  if (sub_100004B4C(a1, 1, v12) != 1)
  {
    Class isa = sub_100046750().super.isa;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  if (sub_100004B4C(a2, 1, v12) == 1)
  {
    Class v14 = 0;
  }
  else
  {
    Class v14 = sub_100046750().super.isa;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a2, v12);
  }
  id v15 = [v6 initWithStartDate:isa endDate:v14 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v15;
}

uint64_t sub_100004B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

unint64_t sub_100004B74()
{
  unint64_t result = qword_100058E30;
  if (!qword_100058E30)
  {
    sub_100004BC8(&qword_100058E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100058E30);
  }
  return result;
}

uint64_t sub_100004BC8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004C10(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100004C4C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100046CC0();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_100004CA0(uint64_t a1, uint64_t a2)
{
  char v3 = sub_100046CD0();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_100004CFC()
{
  return sub_100004C48(*v0);
}

uint64_t sub_100004D0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100004CF8();
  *a1 = result;
  return result;
}

void *sub_100004D34@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100004D44(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004D50()
{
  return sub_100046E20();
}

void sub_100004DF4(uint64_t a1, Swift::UInt a2)
{
}

uint64_t sub_100004E20()
{
  return sub_100004DF0(*v0);
}

void sub_100004E28(uint64_t a1)
{
  sub_100004DF4(a1, *v1);
}

uint64_t sub_100004E30(uint64_t a1)
{
  return sub_100004E1C(a1, *v1);
}

BOOL sub_100004E38(uint64_t *a1, uint64_t *a2)
{
  return sub_100018BA0(*a1, *a2);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for BPSDemand(uint64_t a1)
{
}

void sub_100004E6C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004EB4()
{
  return sub_100004F1C(&qword_100058E58);
}

uint64_t sub_100004EE8()
{
  return sub_100004F1C(&qword_100058E60);
}

uint64_t sub_100004F1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BPSDemand(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004F60()
{
  return sub_100004F1C(&qword_100058E68);
}

id sub_100004F94()
{
  return sub_100004A10(v1, v0, 50000, 0, 0);
}

NSString sub_100004FD8()
{
  return sub_100046B10();
}

uint64_t sub_10000500C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000488C(&qword_100059228);
  uint64_t v4 = sub_100030DA4(v3);
  __chkstk_darwin(v4);
  sub_100031504();
  sub_100019520(v1, v1, &qword_100059228);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  sub_100030D2C(v1, 1, v5);
  if (v6)
  {
    sub_1000194CC(v1, &qword_100059228);
  }
  else
  {
    sub_1000314D8();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1) {
      return sub_100018AE4(v1, a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
    }
    sub_100018A8C(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  return sub_100005110(a1);
}

uint64_t sub_100005110@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100047890;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xE000000000000000;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0xE000000000000000;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0xE000000000000000;
  *(void *)(a1 + 96) = 0;
  *(_WORD *)(a1 + 104) = 1;
  *(void *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 120) = 1;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0xE000000000000000;
  *(void *)(a1 + 144) = &_swiftEmptyArrayStorage;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
  return sub_100046860();
}

uint64_t sub_10000518C@<X0>(void (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_100047890;
  a1(0);
  return sub_100031330();
}

uint64_t sub_1000051CC()
{
  uint64_t v0 = sub_100031708((__n128)xmmword_100047890);
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(v0);
  return sub_1000316F0();
}

uint64_t sub_100005200()
{
  uint64_t v1 = sub_100031708((__n128)xmmword_100047890);
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(v1);
  uint64_t v2 = sub_1000316E4();
  uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(v2);
  sub_100004938(v0, 1, 1, v3);
  return sub_100046860();
}

uint64_t sub_100005268@<X0>(_OWORD *a1@<X8>)
{
  *a1 = xmmword_100047890;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  uint64_t v1 = sub_1000316E4();
  uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(v1);
  sub_1000316C4(v2);
  sub_100046860();
  uint64_t v3 = sub_100031698();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(v3);
  uint64_t v4 = sub_100030F78();

  return sub_100004938(v4, v5, v6, v7);
}

uint64_t sub_1000052E4@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_100047890;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  sub_1000316F0();
  uint64_t v1 = sub_1000316E4();
  uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(v1);
  sub_1000316C4(v2);
  uint64_t v3 = sub_100031698();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(v3);
  uint64_t v4 = sub_100030F78();

  return sub_100004938(v4, v5, v6, v7);
}

void sub_100005364()
{
  sub_100030EB8();
  uint64_t v90 = v2;
  uint64_t v91 = v3;
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  uint64_t v5 = sub_100030DA4(v4);
  __chkstk_darwin(v5);
  sub_100030D90();
  uint64_t v86 = v6;
  uint64_t v7 = sub_100030F20();
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(v7);
  uint64_t v9 = sub_100030DA4(v8);
  __chkstk_darwin(v9);
  sub_100030D90();
  uint64_t v85 = v10;
  uint64_t v11 = sub_100030F20();
  uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(v11);
  uint64_t v13 = sub_100030DA4(v12);
  __chkstk_darwin(v13);
  sub_100030D90();
  uint64_t v83 = v14;
  uint64_t v15 = sub_100030F20();
  v79[1] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(v15);
  sub_100030C24();
  __chkstk_darwin(v16);
  uint64_t v87 = (uint64_t)v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100030F20();
  v79[3] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(v18);
  sub_100030C24();
  __chkstk_darwin(v19);
  sub_100030D90();
  uint64_t v84 = v20;
  uint64_t v21 = sub_100030F20();
  v79[2] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(v21);
  sub_100030C24();
  __chkstk_darwin(v22);
  uint64_t v82 = (uint64_t)v79 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100030F20();
  uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(v24);
  uint64_t v26 = sub_100030DA4(v25);
  __chkstk_darwin(v26);
  uint64_t v81 = (uint64_t)v79 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100030F20();
  v79[0] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(v28);
  sub_100030C24();
  __chkstk_darwin(v29);
  sub_100030D90();
  uint64_t v80 = v30;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  sub_100030C24();
  __chkstk_darwin(v31);
  sub_10003138C();
  uint64_t v33 = __chkstk_darwin(v32);
  v35 = (char *)v79 - v34;
  uint64_t v36 = __chkstk_darwin(v33);
  v38 = (char *)v79 - v37;
  __chkstk_darwin(v36);
  uint64_t v89 = (uint64_t)v79 - v39;
  sub_100030F3C();
  __chkstk_darwin(v40);
  uint64_t v88 = (uint64_t)v79 - v41;
  sub_100030F3C();
  __chkstk_darwin(v42);
  sub_1000312A4();
  uint64_t v44 = __chkstk_darwin(v43);
  v46 = (char *)v79 - v45;
  __chkstk_darwin(v44);
  v48 = (char *)v79 - v47;
  uint64_t v49 = sub_10000488C(&qword_100059290);
  uint64_t v50 = sub_100030DA4(v49);
  __chkstk_darwin(v50);
  sub_1000314F4();
  uint64_t v53 = v52 - v51;
  uint64_t v55 = v52 - v51 + *(int *)(v54 + 56);
  sub_100019364(v90, v52 - v51, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  sub_100019364(v91, v55, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100019364(v53, (uint64_t)v46, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() == 1)
      {
        uint64_t v58 = v81;
        sub_100018AE4(v55, v81, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
        sub_10000B97C();
        v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext;
        sub_100018A8C(v58, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
        uint64_t v60 = (uint64_t)v46;
        goto LABEL_29;
      }
      v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext;
      uint64_t v57 = (uint64_t)v46;
      goto LABEL_40;
    case 2u:
      sub_100019364(v53, v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() != 2)
      {
        v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed;
        uint64_t v57 = v1;
        goto LABEL_40;
      }
      uint64_t v61 = v82;
      sub_100018AE4(v55, v82, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      if (sub_1000466E0())
      {
        sub_100046870();
        sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        if (sub_100031104())
        {
          v62 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed;
          sub_100018A8C(v61, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
          uint64_t v60 = v1;
          goto LABEL_24;
        }
      }
      v76 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed;
      sub_100018A8C(v61, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      uint64_t v60 = v1;
      goto LABEL_45;
    case 3u:
      uint64_t v63 = v88;
      sub_100019364(v53, v88, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() != 3)
      {
        v74 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible;
        goto LABEL_36;
      }
      uint64_t v64 = v84;
      sub_100018AE4(v55, v84, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
      if (sub_1000466E0())
      {
        sub_100046870();
        sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        if (sub_100031104())
        {
          v65 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible;
          goto LABEL_23;
        }
      }
      v75 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible;
      goto LABEL_44;
    case 4u:
      uint64_t v63 = v89;
      sub_100019364(v53, v89, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() != 4)
      {
        v74 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
LABEL_36:
        v56 = v74;
        uint64_t v57 = v63;
        goto LABEL_40;
      }
      uint64_t v64 = v87;
      sub_100018AE4(v55, v87, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      if ((sub_1000466E0() & 1) != 0
        && (*(void *)(v63 + 16) == *(void *)(v64 + 16)
          ? (BOOL v66 = *(void *)(v63 + 24) == *(void *)(v64 + 24))
          : (BOOL v66 = 0),
            (v66 || (sub_100046EB0() & 1) != 0)
         && (sub_100046870(),
             sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage),
             (sub_100031104() & 1) != 0)))
      {
        v65 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
LABEL_23:
        v62 = v65;
        sub_100018A8C(v64, (void (*)(void))v65);
        uint64_t v60 = v63;
LABEL_24:
        v67 = v62;
      }
      else
      {
        v75 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
LABEL_44:
        v76 = v75;
        sub_100018A8C(v64, (void (*)(void))v75);
        uint64_t v60 = v63;
LABEL_45:
        v67 = v76;
      }
      goto LABEL_46;
    case 5u:
      uint64_t v68 = sub_1000315C8();
      sub_100019364(v68, v69, v70);
      if (sub_100031184() == 5)
      {
        uint64_t v71 = v83;
        sub_100018AE4(v55, v83, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
        sub_10000E56C();
        v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext;
        sub_100018A8C(v71, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
        uint64_t v60 = (uint64_t)v38;
        goto LABEL_29;
      }
      v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext;
      uint64_t v57 = (uint64_t)v38;
      goto LABEL_40;
    case 6u:
      sub_100019364(v53, (uint64_t)v35, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() != 6)
      {
        v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext;
        uint64_t v57 = (uint64_t)v35;
        goto LABEL_40;
      }
      uint64_t v72 = v85;
      sub_100018AE4(v55, v85, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      sub_10000FD78();
      v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext;
      sub_100018A8C(v72, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      uint64_t v60 = (uint64_t)v35;
LABEL_29:
      v67 = v59;
      goto LABEL_46;
    case 7u:
      sub_100019364(v53, v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184() == 7)
      {
        uint64_t v73 = v86;
        sub_100018AE4(v55, v86, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
        sub_100010F10();
        sub_100018A8C(v73, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
        uint64_t v60 = sub_1000314D8();
        goto LABEL_46;
      }
      v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected;
      uint64_t v57 = v0;
      goto LABEL_40;
    default:
      sub_100019364(v53, (uint64_t)v48, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      if (sub_100031184())
      {
        v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted;
        uint64_t v57 = (uint64_t)v48;
LABEL_40:
        sub_100018A8C(v57, (void (*)(void))v56);
        sub_1000194CC(v53, &qword_100059290);
      }
      else
      {
        uint64_t v77 = v55;
        uint64_t v78 = v80;
        sub_100018AE4(v77, v80, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
        if (sub_1000466E0())
        {
          sub_100046870();
          sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          sub_1000314D8();
          sub_100046B00();
        }
        sub_100018A8C(v78, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
        uint64_t v60 = sub_100031030();
LABEL_46:
        sub_100018A8C(v60, (void (*)(void))v67);
        sub_100018A8C(v53, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      }
      sub_1000313F8();
      sub_100030E78();
      return;
  }
}

uint64_t sub_100005EE8@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v2 = sub_100030F78();
  sub_100004938(v2, v3, v4, v5);
  *(void *)(a1 + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(0) + 20)) = 0;
  return sub_1000316F0();
}

uint64_t sub_100005F2C@<X0>(void *a1@<X8>)
{
  uint64_t v1 = sub_100031788(a1);
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(v1);
  sub_100031330();
  uint64_t v2 = sub_100031698();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(v2);
  uint64_t v3 = sub_100030F78();

  return sub_100004938(v3, v4, v5, v6);
}

void sub_100005F78()
{
  sub_100030EB8();
  uint64_t v41 = v3;
  uint64_t v5 = v4;
  v39[1] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
  sub_100030C24();
  __chkstk_darwin(v6);
  sub_100030D90();
  uint64_t v40 = (unsigned __int8 *)v7;
  uint64_t v8 = sub_100030F20();
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(v8);
  uint64_t v10 = sub_100030DA4(v9);
  __chkstk_darwin(v10);
  sub_1000314F4();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
  uint64_t v15 = sub_100030DA4(v14);
  __chkstk_darwin(v15);
  sub_10003151C();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  sub_100030C24();
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (unsigned __int8 *)v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  sub_1000312A4();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v39 - v21;
  uint64_t v23 = sub_10000488C(&qword_1000592A8);
  uint64_t v24 = sub_100030DA4(v23);
  __chkstk_darwin(v24);
  sub_1000313A8();
  uint64_t v26 = v0 + v25;
  sub_100019364(v5, v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  sub_100019364(v41, v26, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v30 = sub_10003168C();
    sub_100019364(v30, v31, v32);
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v36 = sub_10003171C();
      sub_100018AE4(v36, v37, v38);
      sub_100014C7C();
      sub_100018A8C(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
      uint64_t v28 = (uint64_t)v22;
      uint64_t v29 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted;
      goto LABEL_15;
    }
    uint64_t v33 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted;
    uint64_t v34 = (uint64_t)v22;
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_100019364(v0, v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018AE4(v26, v13, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      sub_1000155AC();
      sub_100018A8C(v13, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      uint64_t v28 = v2;
      uint64_t v29 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded;
LABEL_15:
      sub_100018A8C(v28, (void (*)(void))v29);
      sub_100018A8C(v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
      goto LABEL_16;
    }
    uint64_t v33 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded;
    uint64_t v34 = v2;
    goto LABEL_13;
  }
  sub_100019364(v0, (uint64_t)v19, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    uint64_t v33 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed;
    uint64_t v34 = (uint64_t)v19;
LABEL_13:
    sub_100018A8C(v34, (void (*)(void))v33);
    sub_1000194CC(v0, &qword_1000592A8);
    goto LABEL_16;
  }
  v35 = v40;
  sub_100018AE4(v26, (uint64_t)v40, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
  if (*v19 == *v35)
  {
    sub_100046870();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_1000314D8();
    sub_100046B00();
  }
  sub_100018A8C((uint64_t)v35, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
  sub_100031770();
  sub_100018A8C(v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
LABEL_16:
  sub_100030E78();
}

uint64_t sub_100006450@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  sub_100031330();
  uint64_t v2 = sub_1000316E4();
  uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(v2);
  sub_100004938(v1, 1, 1, v3);
  uint64_t v4 = sub_100031698();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(v4);
  uint64_t v5 = sub_100030F78();

  return sub_100004938(v5, v6, v7, v8);
}

uint64_t sub_1000064CC@<X0>(void (*a1)(void)@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 0;
  a1(0);
  return sub_100031330();
}

uint64_t sub_100006504@<X0>(uint64_t a1@<X8>)
{
  sub_10003179C(a1);
  v1(0);
  return sub_100031330();
}

void sub_100006538()
{
  sub_100030EB8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
  uint64_t v7 = sub_100030DA4(v6);
  __chkstk_darwin(v7);
  sub_100031504();
  v24[1] = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
  sub_100030C24();
  __chkstk_darwin(v8);
  sub_1000314F4();
  uint64_t v11 = (unsigned __int8 *)(v10 - v9);
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  sub_100030C24();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (unsigned __int8 *)v24 - v16;
  uint64_t v18 = sub_10000488C(&qword_100059300);
  uint64_t v19 = sub_100030DA4(v18);
  __chkstk_darwin(v19);
  sub_1000313A8();
  uint64_t v21 = v0 + v20;
  sub_100019364(v5, v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  sub_100019364(v3, v21, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100019364(v0, (uint64_t)v15, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018AE4(v21, v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100012520();
      sub_100018A8C(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100018A8C((uint64_t)v15, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100018A8C(v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
      goto LABEL_11;
    }
    uint64_t v22 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded;
    uint64_t v23 = (uint64_t)v15;
LABEL_7:
    sub_100018A8C(v23, (void (*)(void))v22);
    sub_1000194CC(v0, &qword_100059300);
    goto LABEL_11;
  }
  sub_100019364(v0, (uint64_t)v17, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v22 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted;
    uint64_t v23 = (uint64_t)v17;
    goto LABEL_7;
  }
  sub_100018AE4(v21, (uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
  if (*v17 == *v11)
  {
    sub_100046870();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100046B00();
  }
  sub_100018A8C((uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
  sub_100031770();
  sub_100018A8C(v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
LABEL_11:
  sub_100030E78();
}

uint64_t sub_100006924@<X0>(void *a1@<X8>)
{
  sub_100031534(a1);
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  return sub_100046860();
}

uint64_t sub_100006964@<X0>(void *a1@<X8>)
{
  sub_100031534(a1);
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = 0;
  *(void *)(v1 + 56) = 0;
  *(unsigned char *)(v1 + 64) = 1;
  *(_DWORD *)(v1 + 68) = 0;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(0);
  return sub_100046860();
}

uint64_t sub_1000069B0@<X0>(uint64_t a1@<X8>)
{
  sub_10003179C(a1);
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 40) = v2;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  return sub_100046860();
}

uint64_t sub_1000069F4@<X0>(void *a1@<X8>)
{
  sub_100031534(a1);
  *(void *)(v1 + 16) = 0;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  return sub_1000316F0();
}

uint64_t sub_100006A24@<X0>(void *a1@<X8>)
{
  uint64_t v1 = sub_100031788(a1);
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(v1);
  return sub_100031330();
}

uint64_t sub_100006A4C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061B70);
  sub_100004C10(v0, (uint64_t)qword_100061B70);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478A0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "webpageViewStarted";
  *(void *)(v6 + 8) = 18;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "dimensionContext";
  *(void *)(v10 + 8) = 16;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "bloomFilterPassed";
  *((void *)v12 + 1) = 17;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "eligible";
  *((void *)v14 + 1) = 8;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "webpageUrlSent";
  *((void *)v16 + 1) = 14;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "serverRequestContext";
  *((void *)v18 + 1) = 20;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)uint64_t v20 = "visualComponentPresentationContext";
  *((void *)v20 + 1) = 34;
  v20[16] = 2;
  v9();
  uint64_t v21 = (void *)(v5 + 7 * v2);
  uint64_t v22 = (char *)v21 + v1[14];
  *uint64_t v21 = 8;
  *(void *)uint64_t v22 = "userInteractionDetected";
  *((void *)v22 + 1) = 23;
  v22[16] = 2;
  v9();
  uint64_t v23 = (void *)(v5 + 8 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 100;
  *(void *)uint64_t v24 = "timestamp";
  *((void *)v24 + 1) = 9;
  v24[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100006DBC(uint64_t a1, uint64_t a2)
{
  sub_100030E04(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 1:
        uint64_t v5 = sub_100030C94();
        sub_100006ED8(v5, v6, v7, v8);
        break;
      case 2:
        uint64_t v9 = sub_100030C94();
        sub_100007378(v9, v10, v11, v12);
        break;
      case 3:
        uint64_t v13 = sub_100030C94();
        sub_10000781C(v13, v14, v15, v16);
        break;
      case 4:
        uint64_t v17 = sub_100030C94();
        sub_100007CC0(v17, v18, v19, v20);
        break;
      case 5:
        uint64_t v21 = sub_100030C94();
        sub_100008164(v21, v22, v23, v24);
        break;
      case 6:
        uint64_t v25 = sub_100030C94();
        sub_100008608(v25, v26, v27, v28);
        break;
      case 7:
        uint64_t v29 = sub_100030C94();
        sub_100008AAC(v29, v30, v31, v32);
        break;
      case 8:
        uint64_t v33 = sub_100030C94();
        sub_100008F50(v33, v34, v35, v36);
        break;
      default:
        if (result == 100)
        {
          sub_100030CE0();
          sub_1000093F4();
        }
        break;
    }
    sub_1000312D8();
  }
  return result;
}

uint64_t sub_100006ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059230);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload())
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
    else
    {
      sub_1000194CC((uint64_t)v24, &qword_100059230);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_1000591E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059230);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059230);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059230);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059230);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059230);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100007378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059238);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059238);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_1000591C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059238);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059238);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059238);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059238);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059238);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_10000781C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059240);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059240);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_1000591A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059240);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059240);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059240);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059240);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059240);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100007CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059248);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059248);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_100059188, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059248);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059248);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059248);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059248);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059248);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100008164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059250);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059250);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_100059168, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059250);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059250);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059250);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059250);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059250);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100008608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059258);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059258);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_100059148, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059258);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059258);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059258);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059258);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059258);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100008AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059260);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 6)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059260);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_100059128, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059260);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059260);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059260);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059260);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059260);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_100008F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v35 = a2;
  uint64_t v37 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059268);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v31 - v23;
  sub_100004938((uint64_t)&v31 - v23, 1, 1, v5);
  uint64_t v31 = a1;
  sub_100019520(a1, (uint64_t)v12, &qword_100059228);
  int v32 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v32 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_100059228);
    uint64_t v25 = v13;
  }
  else
  {
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    uint64_t v25 = v13;
    if (swift_getEnumCaseMultiPayload() == 7)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059268);
      sub_100018AE4((uint64_t)v16, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
      sub_100018AE4((uint64_t)v9, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    }
  }
  uint64_t v26 = v34;
  sub_1000171D4(&qword_100059108, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
  sub_100046970();
  if (v26)
  {
    uint64_t v27 = (uint64_t)v24;
    return sub_1000194CC(v27, &qword_100059268);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059268);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059268);
    uint64_t v27 = (uint64_t)v22;
    return sub_1000194CC(v27, &qword_100059268);
  }
  uint64_t v29 = v33;
  sub_100018AE4((uint64_t)v22, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
  if (v32 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059268);
  uint64_t v30 = v31;
  sub_1000194CC(v31, &qword_100059228);
  sub_100018AE4(v29, v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v30, 0, 1, v25);
}

uint64_t sub_1000093F4()
{
  return sub_100046950();
}

uint64_t sub_100009458()
{
  sub_100031638();
  uint64_t v4 = sub_10000488C(&qword_100059228);
  uint64_t v5 = sub_100030DA4(v4);
  __chkstk_darwin(v5);
  sub_10003151C();
  uint64_t v6 = sub_10003171C();
  sub_100019520(v6, v7, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C(v3, 1, v8) != 1)
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = sub_100030D14();
        sub_10000986C(v10);
        goto LABEL_10;
      case 2u:
        uint64_t v11 = sub_100030D14();
        sub_100009A6C(v11);
        goto LABEL_10;
      case 3u:
        uint64_t v12 = sub_100030D14();
        sub_100009C6C(v12);
        goto LABEL_10;
      case 4u:
        uint64_t v13 = sub_100030D14();
        sub_100009E6C(v13);
        goto LABEL_10;
      case 5u:
        uint64_t v14 = sub_100030D14();
        sub_10000A06C(v14);
        goto LABEL_10;
      case 6u:
        uint64_t v15 = sub_100030D14();
        sub_10000A26C(v15);
        goto LABEL_10;
      case 7u:
        uint64_t v17 = sub_100030D14();
        sub_10000A46C(v17);
        uint64_t v1 = v0;
        if (v0) {
          return sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
        }
        sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
        break;
      default:
        uint64_t v9 = sub_100030D14();
        sub_100009670(v9);
LABEL_10:
        uint64_t v1 = v0;
        uint64_t result = sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
        if (!v0) {
          break;
        }
        return result;
    }
  }
  if (!*(void *)(v2 + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(0) + 20))) {
    return sub_100046850();
  }
  uint64_t result = sub_100046A40();
  if (!v1) {
    return sub_100046850();
  }
  return result;
}

uint64_t sub_100009670(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
      sub_1000171D4(&qword_1000591E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000986C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
      sub_1000171D4(&qword_1000591C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009A6C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      sub_1000171D4(&qword_1000591A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009C6C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
      sub_1000171D4(&qword_100059188, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009E6C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      sub_1000171D4(&qword_100059168, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A06C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      sub_1000171D4(&qword_100059148, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A26C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 6)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      sub_1000171D4(&qword_100059128, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A46C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059228);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100019520(a1, (uint64_t)v4, &qword_100059228);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)v4, 1, v8) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_100059228);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 7)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
      sub_1000171D4(&qword_100059108, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  }
  __break(1u);
  return result;
}

void sub_10000A66C()
{
  sub_100030EB8();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v38 = sub_100046870();
  sub_100030C08();
  uint64_t v41 = v8;
  __chkstk_darwin(v9);
  sub_100030E64();
  uint64_t v40 = v10;
  sub_100030F3C();
  __chkstk_darwin(v11);
  sub_1000315F4();
  uint64_t v39 = v12;
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  sub_100030C24();
  __chkstk_darwin(v14);
  sub_100030E30();
  uint64_t v15 = sub_10000488C(&qword_100059280);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15);
  sub_100030ED0();
  uint64_t v17 = sub_10000488C(&qword_100059228);
  uint64_t v18 = sub_100030DA4(v17);
  __chkstk_darwin(v18);
  sub_100031370();
  __chkstk_darwin(v19);
  sub_100030D44();
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v38 - v21;
  uint64_t v42 = v7;
  sub_100019520(v7, (uint64_t)&v38 - v21, &qword_100059228);
  uint64_t v43 = v5;
  sub_100019520(v5, v0, &qword_100059228);
  uint64_t v23 = v1 + *(int *)(v16 + 56);
  sub_100019520((uint64_t)v22, v1, &qword_100059228);
  uint64_t v24 = sub_10003168C();
  sub_100019520(v24, v25, &qword_100059228);
  sub_100030D2C(v1, 1, v13);
  if (!v26)
  {
    sub_100019520(v1, v3, &qword_100059228);
    sub_100030D2C(v23, 1, v13);
    if (!v26)
    {
      sub_100018AE4(v23, v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      sub_100005364();
      char v28 = v27;
      sub_100018A8C(v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      sub_1000194CC(v0, &qword_100059228);
      sub_1000194CC((uint64_t)v22, &qword_100059228);
      uint64_t v29 = sub_1000315C8();
      sub_100018A8C(v29, v30);
      sub_1000194CC(v1, &qword_100059228);
      if ((v28 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_11;
    }
    sub_100031674();
    sub_100031240();
    sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
LABEL_9:
    sub_1000194CC(v1, &qword_100059280);
    goto LABEL_13;
  }
  sub_1000194CC(v0, &qword_100059228);
  sub_1000194CC((uint64_t)v22, &qword_100059228);
  sub_100030D2C(v23, 1, v13);
  if (!v26) {
    goto LABEL_9;
  }
  sub_1000194CC(v1, &qword_100059228);
LABEL_11:
  uint64_t v31 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(0);
  uint64_t v32 = v43;
  if (*(void *)(v42 + *(int *)(v31 + 20)) == *(void *)(v43 + *(int *)(v31 + 20)))
  {
    uint64_t v33 = v31;
    uint64_t v34 = v41;
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
    uint64_t v36 = v38;
    v35(v39, v42 + *(int *)(v31 + 24), v38);
    v35(v40, v32 + *(int *)(v33 + 24), v36);
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100046B00();
    uint64_t v37 = *(void (**)(void))(v34 + 8);
    sub_100031018();
    v37();
    sub_100031018();
    v37();
  }
LABEL_13:
  sub_1000313F8();
  sub_100030E78();
}

unint64_t sub_10000AA64()
{
  return 0xD000000000000033;
}

uint64_t (*sub_10000AA8C())()
{
  return nullsub_1;
}

uint64_t sub_10000AAB4(uint64_t a1, uint64_t a2)
{
  return sub_100006DBC(a1, a2);
}

uint64_t sub_10000AACC()
{
  return sub_100009458();
}

uint64_t sub_10000AAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059220, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000AB68(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B50, (uint64_t)qword_100061B70);
}

uint64_t sub_10000AB8C(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059208, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000ABF8()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload, &qword_100059210, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
}

uint64_t sub_10000AC54()
{
  sub_1000171D4(&qword_100059208, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);

  return sub_1000469D0();
}

uint64_t sub_10000ACD8(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061B88, (uint64_t)"webpageViewIdentifier", 21);
}

BOOL sub_10000ACF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

uint64_t sub_10000AD54@<X0>(_OWORD *a1@<X8>)
{
  return sub_10000518C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted, a1);
}

unint64_t sub_10000AD80()
{
  return 0xD00000000000003BLL;
}

uint64_t (*sub_10000ADA4())()
{
  return nullsub_1;
}

uint64_t sub_10000ADC8(uint64_t a1, uint64_t a2)
{
  return sub_100015CCC(a1, a2);
}

uint64_t sub_10000ADF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BF00(a1, a2, a3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t sub_10000AE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059318, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000AE9C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B58, (uint64_t)qword_100061B88);
}

uint64_t sub_10000AEC0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_1000169CC(a3, a4);
  sub_100046A90();
  sub_100030C24();
  uint64_t v4 = sub_100031030();

  return v5(v4);
}

uint64_t sub_10000AF30(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000591E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000AF9C()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted, &qword_1000591F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t sub_10000AFF8()
{
  sub_1000171D4(&qword_1000591E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);

  return sub_1000469D0();
}

uint64_t sub_10000B074()
{
  sub_10000C28C();
  return v0 & 1;
}

uint64_t sub_10000B0A4()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061BA0);
  sub_100004C10(v0, (uint64_t)qword_100061BA0);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478B0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "webpageViewIdentifier";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "systemLocale";
  *(void *)(v10 + 8) = 12;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "currentCountry";
  *((void *)v12 + 1) = 14;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "build";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "osType";
  *((void *)v16 + 1) = 6;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "productType";
  *((void *)v18 + 1) = 11;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)uint64_t v20 = "buildType";
  *((void *)v20 + 1) = 9;
  v20[16] = 2;
  v9();
  uint64_t v21 = (void *)(v5 + 7 * v2);
  uint64_t v22 = (char *)v21 + v1[14];
  *uint64_t v21 = 8;
  *(void *)uint64_t v22 = "duEnabled";
  *((void *)v22 + 1) = 9;
  v22[16] = 2;
  v9();
  uint64_t v23 = (void *)(v5 + 8 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 9;
  *(void *)uint64_t v24 = "searchBarPosition";
  *((void *)v24 + 1) = 17;
  v24[16] = 2;
  v9();
  uint64_t v25 = (void *)(v5 + 9 * v2);
  char v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 10;
  *(void *)char v26 = "prefixStoreVersion";
  *((void *)v26 + 1) = 18;
  v26[16] = 2;
  v9();
  char v27 = (void *)(v5 + 10 * v2);
  char v28 = (char *)v27 + v1[14];
  *char v27 = 11;
  *(void *)char v28 = "trialExperiment";
  *((void *)v28 + 1) = 15;
  v28[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_10000B480()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_1000310C4();
          break;
        case 2:
          uint64_t v4 = v0 + 16;
          goto LABEL_15;
        case 3:
          uint64_t v4 = v0 + 32;
          goto LABEL_15;
        case 4:
          uint64_t v4 = v0 + 48;
          goto LABEL_15;
        case 5:
          uint64_t v4 = v0 + 64;
          goto LABEL_15;
        case 6:
          uint64_t v4 = v0 + 80;
          goto LABEL_15;
        case 7:
          sub_100030CE0();
          sub_10000B5E0();
          break;
        case 8:
          sub_1000468F0();
          break;
        case 9:
          sub_100030CE0();
          sub_10000B644();
          break;
        case 10:
          uint64_t v4 = v0 + 128;
LABEL_15:
          sub_100031258(v4);
          break;
        case 11:
          sub_100030CE0();
          sub_10000B6A8();
          break;
        default:
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_10000B5E0()
{
  return sub_100046900();
}

uint64_t sub_10000B644()
{
  return sub_100046900();
}

uint64_t sub_10000B6A8()
{
  return sub_100046960();
}

uint64_t sub_10000B744()
{
  sub_1000313E0();
  if (sub_10000ACF0(*(void *)v1, *(void *)(v1 + 8)) || (v0 = v2, uint64_t result = sub_100046A00(), !v2))
  {
    sub_100030C80();
    if (!v4 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
    {
      sub_100030C80();
      if (!v5 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
      {
        sub_100030C80();
        if (!v6 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
        {
          sub_100030C80();
          if (!v7 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
          {
            sub_100030C80();
            if (!v8 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
            {
              if (!*(void *)(v1 + 96)
                || (sub_10003113C(),
                    unint64_t v9 = sub_100019434(),
                    uint64_t result = sub_100031568((uint64_t)v12, 7, (uint64_t)&unk_100055860, v9),
                    (uint64_t v2 = v0) == 0))
              {
                if (*(unsigned char *)(v1 + 105) != 1 || (sub_1000312C8(), result = sub_1000469E0(), (uint64_t v2 = v0) == 0))
                {
                  if (!*(void *)(v1 + 112)
                    || (sub_10003113C(),
                        unint64_t v10 = sub_100019480(),
                        uint64_t result = sub_100031568((uint64_t)v12, 9, (uint64_t)&unk_1000557D0, v10),
                        (uint64_t v2 = v0) == 0))
                  {
                    sub_100030C80();
                    if (!v11 || (result = sub_100030EE8(), (uint64_t v2 = v0) == 0))
                    {
                      if (!*(void *)(*(void *)(v1 + 144) + 16)
                        || (type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(0),
                            sub_1000171D4(&qword_1000590E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment), uint64_t result = sub_100046A50(), !v2))
                      {
                        type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
                        return sub_100031348();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_10000B97C()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  if (sub_100031068())
  {
    sub_1000312B8();
    BOOL v9 = v9 && v7 == v8;
    if (v9 || (sub_100046EB0() & 1) != 0)
    {
      BOOL v10 = *(void *)(v1 + 32) == *(void *)(v0 + 32) && *(void *)(v1 + 40) == *(void *)(v0 + 40);
      if (v10 || (sub_100046EB0() & 1) != 0)
      {
        BOOL v11 = *(void *)(v1 + 48) == *(void *)(v0 + 48) && *(void *)(v1 + 56) == *(void *)(v0 + 56);
        if (v11 || (sub_100046EB0() & 1) != 0)
        {
          BOOL v12 = *(void *)(v1 + 64) == *(void *)(v0 + 64) && *(void *)(v1 + 72) == *(void *)(v0 + 72);
          if (v12 || (sub_100046EB0() & 1) != 0)
          {
            BOOL v13 = *(void *)(v1 + 80) == *(void *)(v0 + 80) && *(void *)(v1 + 88) == *(void *)(v0 + 88);
            if (v13 || (sub_100046EB0())
              && sub_100018BAC(*(void *)(v1 + 96), *(unsigned __int8 *)(v1 + 104), *(void *)(v0 + 96))
              && *(unsigned __int8 *)(v1 + 105) == *(unsigned __int8 *)(v0 + 105)
              && sub_100018BAC(*(void *)(v1 + 112), *(unsigned __int8 *)(v1 + 120), *(void *)(v0 + 112)))
            {
              BOOL v14 = *(void *)(v1 + 128) == *(void *)(v0 + 128) && *(void *)(v1 + 136) == *(void *)(v0 + 136);
              if (v14 || (sub_100046EB0())
                && (sub_100019038(*(void *)(v1 + 144), *(void *)(v0 + 144)) & 1) != 0)
              {
                type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
                uint64_t v15 = sub_100030C34();
                ((void (*)(uint64_t))v2)(v15);
                sub_100030C70();
                v2();
                sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
                sub_100030CF4();
                uint64_t v16 = *(void (**)(void))(v4 + 8);
                sub_100030CA8();
                v16();
                sub_100030CA8();
                v16();
              }
            }
          }
        }
      }
    }
  }
  sub_100031324();
  sub_10003108C();
}

unint64_t sub_10000BBB0()
{
  return 0xD000000000000039;
}

uint64_t sub_10000BBCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 60);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_10000BC3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 60);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_10000BCAC())()
{
  return nullsub_1;
}

uint64_t sub_10000BCD0()
{
  return sub_10000B480();
}

uint64_t sub_10000BCE8()
{
  return sub_10000B744();
}

uint64_t sub_10000BD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059320, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000BD7C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B60, (uint64_t)qword_100061BA0);
}

uint64_t sub_10000BDA0(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000591C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000BE0C()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext, &qword_1000591D0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
}

uint64_t sub_10000BE68()
{
  sub_1000171D4(&qword_1000591C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);

  return sub_1000469D0();
}

uint64_t sub_10000BEE8(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061BB8, (uint64_t)"webpageViewIdentifier", 21);
}

uint64_t sub_10000BF00(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v6 = *v4;
  unint64_t v7 = v4[1];
  switch(v7 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (int)v6;
      uint64_t v10 = v6 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v9 = *(void *)(v6 + 16);
      uint64_t v10 = *(void *)(v6 + 24);
LABEL_6:
      if (v9 != v10) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v7 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_100046A00();
      if (!v5)
      {
LABEL_8:
        a4(0);
        return sub_100030DE8();
      }
      return result;
  }
}

uint64_t sub_10000BFEC@<X0>(_OWORD *a1@<X8>)
{
  return sub_10000518C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed, a1);
}

unint64_t sub_10000C018()
{
  return 0xD00000000000003ALL;
}

uint64_t sub_10000C034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BF00(a1, a2, a3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t sub_10000C060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059338, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000C0DC(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B68, (uint64_t)qword_100061BB8);
}

uint64_t sub_10000C100(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000591A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000C16C()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed, &qword_1000591B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t sub_10000C1C8()
{
  sub_1000171D4(&qword_1000591A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);

  return sub_1000469D0();
}

uint64_t sub_10000C244()
{
  sub_10000C28C();
  return v0 & 1;
}

uint64_t sub_10000C274(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061BD0, (uint64_t)"webpageViewIdentifier", 21);
}

void sub_10000C28C()
{
  sub_100031128();
  uint64_t v2 = v1;
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  if (sub_100031068())
  {
    v2(0);
    uint64_t v7 = sub_100030C34();
    ((void (*)(uint64_t))v0)(v7);
    sub_100030C70();
    v0();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    uint64_t v8 = *(void (**)(void))(v4 + 8);
    sub_100030CA8();
    v8();
    sub_100030CA8();
    v8();
  }
  sub_100031480();
  sub_10003108C();
}

uint64_t sub_10000C3A4@<X0>(_OWORD *a1@<X8>)
{
  return sub_10000518C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible, a1);
}

unint64_t sub_10000C3D0()
{
  return 0xD000000000000031;
}

uint64_t sub_10000C3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000BF00(a1, a2, a3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t sub_10000C418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059340, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000C494(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B70, (uint64_t)qword_100061BD0);
}

uint64_t sub_10000C4B8(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059188, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000C524()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible, &qword_100059190, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t sub_10000C580()
{
  sub_1000171D4(&qword_100059188, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);

  return sub_1000469D0();
}

uint64_t sub_10000C5FC()
{
  sub_10000C28C();
  return v0 & 1;
}

uint64_t sub_10000C62C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061BE8);
  sub_100004C10(v0, (uint64_t)qword_100061BE8);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478C0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "webpageViewIdentifier";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "url";
  *((void *)v10 + 1) = 3;
  v10[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_10000C7E4()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      if (result == 2)
      {
        sub_100031258(v0 + 16);
      }
      else if (result == 1)
      {
        sub_1000310C4();
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_10000C854()
{
  if (sub_1000311B4() || (uint64_t result = sub_100031214(), (v0 = v1) == 0))
  {
    sub_100030C80();
    if (!v3 || (uint64_t result = sub_100046A20(), !v0))
    {
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0);
      return sub_100030DE8();
    }
  }
  return result;
}

void sub_10000C8E8()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100030C54();
  __chkstk_darwin(v4);
  if (sub_100031068())
  {
    sub_1000312B8();
    BOOL v7 = v7 && v5 == v6;
    if (v7 || (sub_100046EB0() & 1) != 0)
    {
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0);
      uint64_t v8 = sub_100030C34();
      ((void (*)(uint64_t))v0)(v8);
      sub_100030C70();
      v0();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_100030CF4();
      uint64_t v9 = *(void (**)(void))(v2 + 8);
      sub_100030CA8();
      v9();
      sub_100030CA8();
      v9();
    }
  }
  sub_100031324();
  sub_10003108C();
}

unint64_t sub_10000CA18()
{
  return 0xD000000000000037;
}

uint64_t sub_10000CA34()
{
  return sub_10000C7E4();
}

uint64_t sub_10000CA4C()
{
  return sub_10000C854();
}

uint64_t sub_10000CA64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059348, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000CAE0(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B78, (uint64_t)qword_100061BE8);
}

uint64_t sub_10000CB04(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059168, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000CB70()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent, &qword_100059170, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
}

uint64_t sub_10000CBCC()
{
  sub_1000171D4(&qword_100059168, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);

  return sub_1000469D0();
}

uint64_t sub_10000CC4C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061C00);
  sub_100004C10(v0, (uint64_t)qword_100061C00);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "webpageViewIdentifier";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "requestIdentifier";
  *(void *)(v10 + 8) = 17;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  BOOL v11 = (void *)(v5 + 2 * v2);
  BOOL v12 = (char *)v11 + v1[14];
  *BOOL v11 = 3;
  *(void *)BOOL v12 = "started";
  *((void *)v12 + 1) = 7;
  unsigned char v12[16] = 2;
  v9();
  BOOL v13 = (void *)(v5 + 3 * v2);
  BOOL v14 = (char *)v13 + v1[14];
  *BOOL v13 = 4;
  *(void *)BOOL v14 = "ended";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "failed";
  *((void *)v16 + 1) = 6;
  v16[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_10000CEBC()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_1000310C4();
          break;
        case 2:
          sub_100031258(v0 + 16);
          break;
        case 3:
          uint64_t v4 = sub_100030C94();
          sub_10000CF8C(v4, v5, v6, v7);
          break;
        case 4:
          uint64_t v8 = sub_100030C94();
          sub_10000D43C(v8, v9, v10, v11);
          break;
        case 5:
          uint64_t v12 = sub_100030C94();
          sub_10000D8F0(v12, v13, v14, v15);
          break;
        default:
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_10000CF8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v36 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059358);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v34 - v23;
  sub_100004938((uint64_t)&v34 - v23, 1, 1, v5);
  uint64_t v35 = a1 + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0) + 24);
  sub_100019520(v35, (uint64_t)v12, &qword_1000592A0);
  int v25 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v25 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_1000592A0);
    uint64_t v26 = v13;
  }
  else
  {
    uint64_t v34 = v9;
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    uint64_t v26 = v13;
    if (swift_getEnumCaseMultiPayload())
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    }
    else
    {
      sub_1000194CC((uint64_t)v24, &qword_100059358);
      uint64_t v27 = (uint64_t)v34;
      sub_100018AE4((uint64_t)v16, (uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
      sub_100018AE4(v27, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
  }
  uint64_t v28 = v37;
  sub_1000171D4(&qword_100059028, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
  sub_100046970();
  if (v28)
  {
    uint64_t v29 = (uint64_t)v24;
    return sub_1000194CC(v29, &qword_100059358);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059358);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059358);
    uint64_t v29 = (uint64_t)v22;
    return sub_1000194CC(v29, &qword_100059358);
  }
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = v36;
  sub_100018AE4(v31, v36, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
  if (v25 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059358);
  uint64_t v33 = v35;
  sub_1000194CC(v35, &qword_1000592A0);
  sub_100018AE4(v32, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v33, 0, 1, v26);
}

uint64_t sub_10000D43C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v36 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059360);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v34 - v23;
  sub_100004938((uint64_t)&v34 - v23, 1, 1, v5);
  uint64_t v35 = a1 + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0) + 24);
  sub_100019520(v35, (uint64_t)v12, &qword_1000592A0);
  int v25 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v25 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_1000592A0);
    uint64_t v26 = v13;
  }
  else
  {
    uint64_t v34 = v9;
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    uint64_t v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059360);
      uint64_t v27 = (uint64_t)v34;
      sub_100018AE4((uint64_t)v16, (uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      sub_100018AE4(v27, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    }
  }
  uint64_t v28 = v37;
  sub_1000171D4(&qword_100059008, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
  sub_100046970();
  if (v28)
  {
    uint64_t v29 = (uint64_t)v24;
    return sub_1000194CC(v29, &qword_100059360);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059360);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059360);
    uint64_t v29 = (uint64_t)v22;
    return sub_1000194CC(v29, &qword_100059360);
  }
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = v36;
  sub_100018AE4(v31, v36, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
  if (v25 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059360);
  uint64_t v33 = v35;
  sub_1000194CC(v35, &qword_1000592A0);
  sub_100018AE4(v32, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v33, 0, 1, v26);
}

uint64_t sub_10000D8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v36 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059368);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v34 - v23;
  sub_100004938((uint64_t)&v34 - v23, 1, 1, v5);
  uint64_t v35 = a1 + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0) + 24);
  sub_100019520(v35, (uint64_t)v12, &qword_1000592A0);
  int v25 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v25 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_1000592A0);
    uint64_t v26 = v13;
  }
  else
  {
    uint64_t v34 = v9;
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    uint64_t v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059368);
      uint64_t v27 = (uint64_t)v34;
      sub_100018AE4((uint64_t)v16, (uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
      sub_100018AE4(v27, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    }
  }
  uint64_t v28 = v37;
  sub_1000171D4(&qword_100058FC8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
  sub_100046970();
  if (v28)
  {
    uint64_t v29 = (uint64_t)v24;
    return sub_1000194CC(v29, &qword_100059368);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059368);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059368);
    uint64_t v29 = (uint64_t)v22;
    return sub_1000194CC(v29, &qword_100059368);
  }
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = v36;
  sub_100018AE4(v31, v36, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
  if (v25 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059368);
  uint64_t v33 = v35;
  sub_1000194CC(v35, &qword_1000592A0);
  sub_100018AE4(v32, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v33, 0, 1, v26);
}

uint64_t sub_10000DDA4()
{
  sub_100031638();
  uint64_t v4 = sub_10000488C(&qword_1000592A0);
  uint64_t v5 = sub_100030DA4(v4);
  __chkstk_darwin(v5);
  if (sub_1000311E4() || (sub_1000315B4(), v0 = v1, uint64_t result = sub_100046A00(), !v1))
  {
    sub_100030C80();
    if (!v7 || (v0 = v1, uint64_t result = sub_100046A20(), !v1))
    {
      uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
      sub_100019520(v2 + *(int *)(v8 + 24), v3, &qword_1000592A0);
      uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
      if (sub_100004B4C(v3, 1, v9) == 1) {
        return sub_100046850();
      }
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload == 1)
        {
          sub_100030E20();
          sub_10000E154(v11);
        }
        else
        {
          sub_100030E20();
          sub_10000E360(v13);
        }
      }
      else
      {
        sub_100030E20();
        sub_10000DF4C(v12);
      }
      uint64_t result = sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
      if (!v0) {
        return sub_100046850();
      }
    }
  }
  return result;
}

uint64_t sub_10000DF4C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  sub_100019520(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1000592A0);
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v4, 1, v9) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_1000592A0);
  }
  else
  {
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
      sub_1000171D4(&qword_100059028, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E154(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  sub_100019520(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1000592A0);
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v4, 1, v9) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_1000592A0);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      sub_1000171D4(&qword_100059008, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E360(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  sub_100019520(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1000592A0);
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v4, 1, v9) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_1000592A0);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
      sub_1000171D4(&qword_100058FC8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  }
  __break(1u);
  return result;
}

void sub_10000E56C()
{
  sub_100030EB8();
  uint64_t v7 = sub_100030D54();
  sub_100030C08();
  uint64_t v36 = v8;
  __chkstk_darwin(v9);
  sub_100030E64();
  v35[4] = v10;
  sub_100030F3C();
  __chkstk_darwin(v11);
  v35[3] = (uint64_t)v35 - v12;
  uint64_t v13 = sub_100030F20();
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(v13);
  sub_100030C24();
  __chkstk_darwin(v15);
  sub_100030E30();
  uint64_t v16 = sub_10000488C(&qword_100059298);
  sub_100030C24();
  __chkstk_darwin(v17);
  sub_100030ED0();
  uint64_t v18 = sub_10000488C(&qword_1000592A0);
  uint64_t v19 = sub_100030DA4(v18);
  __chkstk_darwin(v19);
  sub_100031370();
  __chkstk_darwin(v20);
  sub_100030D44();
  __chkstk_darwin(v21);
  sub_1000315E0();
  if ((sub_1000466E0() & 1) == 0) {
    goto LABEL_18;
  }
  v35[2] = v7;
  sub_1000312B8();
  BOOL v24 = v24 && v22 == v23;
  if (!v24 && (sub_100046EB0() & 1) == 0) {
    goto LABEL_18;
  }
  v35[0] = v4;
  uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
  uint64_t v26 = (void (*)(void))&qword_1000592A0;
  sub_100019520(v2 + *(int *)(v25 + 24), v6, &qword_1000592A0);
  v35[1] = v25;
  sub_100019520(v1 + *(int *)(v25 + 24), v0, &qword_1000592A0);
  uint64_t v27 = v3 + *(int *)(v16 + 48);
  sub_100019520(v6, v3, &qword_1000592A0);
  uint64_t v28 = sub_10003168C();
  sub_100019520(v28, v29, &qword_1000592A0);
  sub_100030D2C(v3, 1, v14);
  if (v24)
  {
    sub_100031674();
    sub_100031240();
    sub_100030D2C(v27, 1, v14);
    if (v24)
    {
      sub_1000194CC(v3, &qword_1000592A0);
LABEL_17:
      uint64_t v33 = v36;
      sub_1000315D4();
      sub_100030FB8();
      v26();
      sub_100030FB8();
      v26();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_1000310E0();
      uint64_t v34 = *(void (**)(void))(v33 + 8);
      sub_100030FA8();
      v34();
      sub_100030FA8();
      v34();
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  sub_100019520(v3, v5, &qword_1000592A0);
  sub_100030D2C(v27, 1, v14);
  if (v30)
  {
    sub_100031674();
    sub_100031240();
    sub_100018A8C(v5, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
LABEL_15:
    sub_1000194CC(v3, &qword_100059298);
    goto LABEL_18;
  }
  uint64_t v31 = v35[0];
  sub_100018AE4(v27, v35[0], (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  sub_100005F78();
  uint64_t v26 = v32;
  sub_100018A8C(v31, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  sub_1000194CC(v0, &qword_1000592A0);
  sub_1000194CC(v6, &qword_1000592A0);
  sub_100018A8C(v5, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  sub_1000194CC(v3, &qword_1000592A0);
  if (v26) {
    goto LABEL_17;
  }
LABEL_18:
  sub_100030E78();
}

unint64_t sub_10000E938()
{
  return 0xD00000000000003DLL;
}

uint64_t (*sub_10000E95C())()
{
  return nullsub_1;
}

uint64_t sub_10000E980()
{
  return sub_10000CEBC();
}

uint64_t sub_10000E998()
{
  return sub_10000DDA4();
}

uint64_t sub_10000E9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059350, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10000EA2C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B80, (uint64_t)qword_100061C00);
}

uint64_t sub_10000EA50(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059148, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10000EABC()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext, &qword_100059150, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
}

uint64_t sub_10000EB18()
{
  sub_1000171D4(&qword_100059148, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);

  return sub_1000469D0();
}

uint64_t sub_10000EB98()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061C18);
  sub_100004C10(v0, (uint64_t)qword_100061C18);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478E0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "webpageViewIdentifier";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "visualComponent";
  *(void *)(v10 + 8) = 15;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "started";
  *((void *)v12 + 1) = 7;
  unsigned char v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "ended";
  *((void *)v14 + 1) = 5;
  v14[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_10000EDCC(uint64_t a1, uint64_t a2)
{
  sub_100030E04(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v2 || (v4 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        sub_1000310C4();
        break;
      case 2:
        sub_100031728(result, v4, v5, v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
        break;
      case 3:
        uint64_t v7 = sub_100030C94();
        sub_10000EE8C(v7, v8, v9, v10);
        break;
      case 4:
        uint64_t v11 = sub_100030C94();
        sub_10000F340(v11, v12, v13, v14);
        break;
      default:
        break;
    }
    sub_1000312D8();
  }
}

uint64_t sub_10000EE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v36 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_10000488C(&qword_1000592C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059378);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  BOOL v24 = (char *)&v34 - v23;
  sub_100004938((uint64_t)&v34 - v23, 1, 1, v5);
  uint64_t v35 = a1
      + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0)
               + 20);
  sub_100019520(v35, (uint64_t)v12, &qword_1000592C8);
  int v25 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v25 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_1000592C8);
    uint64_t v26 = v13;
  }
  else
  {
    uint64_t v34 = v9;
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    uint64_t v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    }
    else
    {
      sub_1000194CC((uint64_t)v24, &qword_100059378);
      uint64_t v27 = (uint64_t)v34;
      sub_100018AE4((uint64_t)v16, (uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
      sub_100018AE4(v27, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
  }
  uint64_t v28 = v37;
  sub_1000171D4(&qword_1000590C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
  sub_100046970();
  if (v28)
  {
    uint64_t v29 = (uint64_t)v24;
    return sub_1000194CC(v29, &qword_100059378);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059378);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059378);
    uint64_t v29 = (uint64_t)v22;
    return sub_1000194CC(v29, &qword_100059378);
  }
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = v36;
  sub_100018AE4(v31, v36, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
  if (v25 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059378);
  uint64_t v33 = v35;
  sub_1000194CC(v35, &qword_1000592C8);
  sub_100018AE4(v32, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v33, 0, 1, v26);
}

uint64_t sub_10000F340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = a2;
  uint64_t v40 = a4;
  uint64_t v39 = a3;
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v36 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = sub_10000488C(&qword_1000592C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v34 - v17;
  uint64_t v19 = sub_10000488C(&qword_100059380);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  BOOL v24 = (char *)&v34 - v23;
  sub_100004938((uint64_t)&v34 - v23, 1, 1, v5);
  uint64_t v35 = a1
      + *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0)
               + 20);
  sub_100019520(v35, (uint64_t)v12, &qword_1000592C8);
  int v25 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v25 == 1)
  {
    sub_1000194CC((uint64_t)v12, &qword_1000592C8);
    uint64_t v26 = v13;
  }
  else
  {
    uint64_t v34 = v9;
    sub_100018AE4((uint64_t)v12, (uint64_t)v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    sub_100018AE4((uint64_t)v18, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    uint64_t v26 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1000194CC((uint64_t)v24, &qword_100059380);
      uint64_t v27 = (uint64_t)v34;
      sub_100018AE4((uint64_t)v16, (uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100018AE4(v27, (uint64_t)v24, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100004938((uint64_t)v24, 0, 1, v5);
    }
    else
    {
      sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    }
  }
  uint64_t v28 = v37;
  sub_1000171D4(&qword_1000590A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
  sub_100046970();
  if (v28)
  {
    uint64_t v29 = (uint64_t)v24;
    return sub_1000194CC(v29, &qword_100059380);
  }
  sub_100019520((uint64_t)v24, (uint64_t)v22, &qword_100059380);
  if (sub_100004B4C((uint64_t)v22, 1, v5) == 1)
  {
    sub_1000194CC((uint64_t)v24, &qword_100059380);
    uint64_t v29 = (uint64_t)v22;
    return sub_1000194CC(v29, &qword_100059380);
  }
  uint64_t v31 = (uint64_t)v22;
  uint64_t v32 = v36;
  sub_100018AE4(v31, v36, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
  if (v25 != 1) {
    sub_1000468E0();
  }
  sub_1000194CC((uint64_t)v24, &qword_100059380);
  uint64_t v33 = v35;
  sub_1000194CC(v35, &qword_1000592C8);
  sub_100018AE4(v32, v33, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
  swift_storeEnumTagMultiPayload();
  return sub_100004938(v33, 0, 1, v26);
}

uint64_t sub_10000F7F4()
{
  sub_100031660();
  uint64_t v4 = sub_10000488C(&qword_1000592C8);
  uint64_t v5 = sub_100030DA4(v4);
  __chkstk_darwin(v5);
  if (sub_1000311E4() || (sub_1000315B4(), uint64_t v1 = v0, result = sub_100046A00(), !v0))
  {
    uint64_t v7 = sub_100031050();
    uint64_t result = sub_100010BA8(v7, v8, v9, v10, v11);
    if (!v1)
    {
      uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
      sub_100019520(v2 + *(int *)(v12 + 20), v3, &qword_1000592C8);
      uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
      if (sub_100004B4C(v3, 1, v13) != 1)
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v14 = sub_100031050();
          sub_10000FB6C(v14);
        }
        else
        {
          uint64_t v15 = sub_100031050();
          sub_10000F960(v15);
        }
        sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
      }
      return sub_100030DE8();
    }
  }
  return result;
}

uint64_t sub_10000F960(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  sub_100019520(a1 + *(int *)(v8 + 20), (uint64_t)v4, &qword_1000592C8);
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v4, 1, v9) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_1000592C8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
      sub_1000171D4(&qword_1000590C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000FB6C(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592C8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  sub_100019520(a1 + *(int *)(v8 + 20), (uint64_t)v4, &qword_1000592C8);
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v4, 1, v9) == 1)
  {
    uint64_t result = sub_1000194CC((uint64_t)v4, &qword_1000592C8);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_1000171D4(&qword_1000590A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
      sub_100046A60();
      return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
    }
    uint64_t result = sub_100018A8C((uint64_t)v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  }
  __break(1u);
  return result;
}

void sub_10000FD78()
{
  sub_100030EB8();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  sub_100046870();
  sub_100030C08();
  uint64_t v73 = v8;
  uint64_t v74 = v7;
  __chkstk_darwin(v7);
  sub_100030E64();
  uint64_t v71 = v9;
  sub_100030F3C();
  __chkstk_darwin(v10);
  uint64_t v72 = (char *)&v65 - v11;
  uint64_t v12 = sub_100030F20();
  uint64_t v77 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(v12);
  sub_100030C24();
  __chkstk_darwin(v13);
  sub_100030FE4(v14, v65);
  uint64_t v80 = sub_10000488C(&qword_1000592C0);
  sub_100030C24();
  __chkstk_darwin(v15);
  sub_100030D90();
  uint64_t v78 = v16;
  uint64_t v17 = sub_10000488C(&qword_1000592C8);
  uint64_t v18 = sub_100030DA4(v17);
  __chkstk_darwin(v18);
  uint64_t v75 = (uint64_t)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100030F3C();
  __chkstk_darwin(v20);
  uint64_t v76 = (uint64_t)&v65 - v21;
  sub_100030F3C();
  __chkstk_darwin(v22);
  BOOL v24 = (char *)&v65 - v23;
  uint64_t v79 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  sub_100030C24();
  __chkstk_darwin(v25);
  sub_100031148();
  uint64_t v26 = sub_10000488C(&qword_1000592D0);
  sub_100030C24();
  __chkstk_darwin(v27);
  sub_100030E30();
  uint64_t v28 = sub_10000488C(&qword_1000592D8);
  uint64_t v29 = sub_100030DA4(v28);
  __chkstk_darwin(v29);
  sub_100030FC8();
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v65 - v32;
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v65 - v34;
  if ((sub_1000466E0() & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v69 = v1;
  uint64_t v66 = v0;
  v67 = v24;
  uint64_t v36 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  uint64_t v37 = *(int *)(v36 + 28);
  uint64_t v68 = v6;
  sub_100019520(v6 + v37, (uint64_t)v35, &qword_1000592D8);
  uint64_t v38 = v4;
  sub_100019520(v4 + *(int *)(v36 + 28), (uint64_t)v33, &qword_1000592D8);
  uint64_t v39 = v2 + *(int *)(v26 + 48);
  sub_100019520((uint64_t)v35, v2, &qword_1000592D8);
  sub_100019520((uint64_t)v33, v39, &qword_1000592D8);
  uint64_t v40 = sub_1000315A8();
  uint64_t v41 = v79;
  sub_100030D2C(v40, v42, v79);
  if (v45)
  {
    sub_1000194CC((uint64_t)v33, &qword_1000592D8);
    sub_100031584();
    sub_100030D2C(v39, 1, v41);
    uint64_t v43 = v80;
    if (v45)
    {
      sub_1000194CC(v2, &qword_1000592D8);
      goto LABEL_12;
    }
LABEL_10:
    v46 = &qword_1000592D0;
    uint64_t v47 = v2;
LABEL_21:
    sub_1000194CC(v47, v46);
    goto LABEL_22;
  }
  uint64_t v44 = v69;
  sub_100019520(v2, v69, &qword_1000592D8);
  sub_100030D2C(v39, 1, v41);
  uint64_t v43 = v80;
  if (v45)
  {
    sub_1000194CC((uint64_t)v33, &qword_1000592D8);
    sub_100031584();
    sub_100018A8C(v44, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
    goto LABEL_10;
  }
  uint64_t v48 = v66;
  sub_100018AE4(v39, v66, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_100013174();
  char v50 = v49;
  sub_100018A8C(v48, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_1000194CC((uint64_t)v33, &qword_1000592D8);
  sub_1000194CC((uint64_t)v35, &qword_1000592D8);
  sub_100018A8C(v44, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_1000194CC(v2, &qword_1000592D8);
  if ((v50 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v51 = (uint64_t)v67;
  sub_100019520(v68 + *(int *)(v36 + 20), (uint64_t)v67, &qword_1000592C8);
  uint64_t v52 = v76;
  sub_100019520(v38 + *(int *)(v36 + 20), v76, &qword_1000592C8);
  uint64_t v53 = v78;
  uint64_t v54 = (void (*)(void))(v78 + *(int *)(v43 + 48));
  uint64_t v55 = sub_10003159C();
  sub_100019520(v55, v56, &qword_1000592C8);
  sub_100019520(v52, (uint64_t)v54, &qword_1000592C8);
  uint64_t v57 = v77;
  sub_100030D2C(v53, 1, v77);
  if (v45)
  {
    sub_1000312E4();
    sub_1000194CC(v51, &qword_1000592C8);
    sub_100030D2C((uint64_t)v54, 1, v57);
    if (v45)
    {
      sub_1000194CC(v53, &qword_1000592C8);
LABEL_24:
      uint64_t v63 = v73;
      sub_1000315D4();
      sub_100030FB8();
      v54();
      sub_100030FB8();
      v54();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_1000310E0();
      uint64_t v64 = *(void (**)(void))(v63 + 8);
      sub_100030FA8();
      v64();
      sub_100030FA8();
      v64();
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t v58 = v75;
  sub_100019520(v53, v75, &qword_1000592C8);
  sub_100030D2C((uint64_t)v54, 1, v57);
  if (v59)
  {
    sub_1000312E4();
    sub_1000194CC(v51, &qword_1000592C8);
    sub_100018A8C(v58, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
LABEL_20:
    v46 = &qword_1000592C0;
    uint64_t v47 = v53;
    goto LABEL_21;
  }
  uint64_t v60 = v70;
  sub_100018AE4((uint64_t)v54, v70, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  sub_100006538();
  char v62 = v61;
  uint64_t v54 = (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent;
  sub_100018A8C(v60, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  sub_1000194CC(v52, &qword_1000592C8);
  sub_1000194CC(v51, &qword_1000592C8);
  sub_100018A8C(v58, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  sub_1000194CC(v53, &qword_1000592C8);
  if (v62) {
    goto LABEL_24;
  }
LABEL_22:
  sub_1000313F8();
  sub_100030E78();
}

unint64_t sub_100010420()
{
  return 0xD00000000000004BLL;
}

uint64_t sub_10001043C(uint64_t a1, uint64_t a2)
{
  return sub_10000EDCC(a1, a2);
}

uint64_t sub_100010454()
{
  return sub_10000F7F4();
}

uint64_t sub_10001046C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059370, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000104E8(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B88, (uint64_t)qword_100061C18);
}

uint64_t sub_10001050C(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059128, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100010578()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext, &qword_100059130, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
}

uint64_t sub_1000105D4()
{
  sub_1000171D4(&qword_100059128, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);

  return sub_1000469D0();
}

uint64_t sub_100010654()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061C30);
  sub_100004C10(v0, (uint64_t)qword_100061C30);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478E0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "webpageViewIdentifier";
  *(void *)(v6 + 8) = 21;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "visualComponent";
  *(void *)(v10 + 8) = 15;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "userInteractionType";
  *((void *)v12 + 1) = 19;
  unsigned char v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "visualComponentInteractionInfo";
  *((void *)v14 + 1) = 30;
  v14[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100010888()
{
  uint64_t result = sub_100030CB8();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_1000310C4();
          break;
        case 2:
          sub_100031728(result, v2, v3, v4, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
          break;
        case 3:
          sub_1000314B4(result, v2, v3, v4, (void (*)(void))sub_100019578);
          break;
        case 4:
          sub_100030CE0();
          sub_100010A18();
          break;
        default:
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_100010968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_100046970();
}

uint64_t sub_100010A18()
{
  return sub_100046970();
}

uint64_t sub_100010AC8()
{
  if (sub_1000311B4() || (uint64_t result = sub_100031214(), !v0))
  {
    uint64_t v3 = sub_100031404();
    uint64_t result = sub_100010BA8(v3, v4, v5, v6, v7);
    if (!v0)
    {
      if (*(void *)(v1 + 16))
      {
        sub_10003113C();
        unint64_t v8 = sub_100019578();
        sub_100030F8C((uint64_t)&v10, 3, (uint64_t)&unk_100055980, v8);
      }
      uint64_t v9 = sub_100031404();
      sub_100010D44(v9);
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
      return sub_100030DE8();
    }
  }
  return result;
}

uint64_t sub_100010BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v9 = sub_10000488C(&qword_1000592D8);
  uint64_t v10 = sub_100030DA4(v9);
  __chkstk_darwin(v10);
  uint64_t v11 = sub_1000313C4();
  uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(v11);
  sub_100030C24();
  __chkstk_darwin(v13);
  sub_100030ED0();
  uint64_t v14 = a5(0);
  sub_100019520(a1 + *(int *)(v14 + 28), v6, &qword_1000592D8);
  uint64_t v15 = sub_1000315A8();
  if (sub_100004B4C(v15, v16, v12) == 1) {
    return sub_1000194CC(v6, &qword_1000592D8);
  }
  uint64_t v18 = sub_10003159C();
  sub_100018AE4(v18, v19, v20);
  sub_1000171D4(&qword_100059088, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_100046A60();
  return sub_100018A8C(v5, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t sub_100010D44(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100059310);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  sub_100019520(a1 + *(int *)(v8 + 32), (uint64_t)v4, &qword_100059310);
  if (sub_100004B4C((uint64_t)v4, 1, v5) == 1) {
    return sub_1000194CC((uint64_t)v4, &qword_100059310);
  }
  sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
  sub_1000171D4(&qword_100058FA8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
  sub_100046A60();
  return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

void sub_100010F10()
{
  sub_100030EB8();
  uint64_t v6 = sub_100030D54();
  sub_100030C08();
  uint64_t v74 = v7;
  __chkstk_darwin(v8);
  sub_100030E64();
  uint64_t v73 = v9;
  sub_100030F3C();
  __chkstk_darwin(v10);
  uint64_t v72 = (char *)v68 - v11;
  uint64_t v12 = sub_100030F20();
  uint64_t v79 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(v12);
  sub_100030C24();
  __chkstk_darwin(v13);
  sub_100030FE4(v14, v68[0]);
  uint64_t v76 = sub_10000488C(&qword_100059308);
  sub_100030C24();
  __chkstk_darwin(v15);
  sub_100030D90();
  uint64_t v80 = v16;
  uint64_t v17 = sub_10000488C(&qword_100059310);
  uint64_t v18 = sub_100030DA4(v17);
  __chkstk_darwin(v18);
  uint64_t v75 = (uint64_t)v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100030F3C();
  __chkstk_darwin(v20);
  uint64_t v77 = (uint64_t)v68 - v21;
  sub_100030F3C();
  __chkstk_darwin(v22);
  uint64_t v78 = (uint64_t)v68 - v23;
  uint64_t v24 = sub_100030F20();
  uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(v24);
  sub_100030C24();
  __chkstk_darwin(v26);
  sub_100030ED0();
  uint64_t v27 = sub_10000488C(&qword_1000592D0);
  sub_100030C24();
  __chkstk_darwin(v28);
  sub_100030E30();
  uint64_t v29 = sub_10000488C(&qword_1000592D8);
  uint64_t v30 = sub_100030DA4(v29);
  __chkstk_darwin(v30);
  sub_10003138C();
  __chkstk_darwin(v31);
  sub_1000312A4();
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)v68 - v33;
  if ((sub_1000466E0() & 1) == 0) {
    goto LABEL_25;
  }
  v68[1] = v6;
  uint64_t v35 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
  uint64_t v71 = v1;
  uint64_t v36 = v35;
  sub_100019520(v2 + *(int *)(v35 + 28), (uint64_t)v34, &qword_1000592D8);
  uint64_t v69 = v36;
  uint64_t v37 = *(int *)(v36 + 28);
  uint64_t v38 = v71;
  sub_100019520(v71 + v37, v5, &qword_1000592D8);
  uint64_t v39 = v4 + *(int *)(v27 + 48);
  sub_100019520((uint64_t)v34, v4, &qword_1000592D8);
  sub_100019520(v5, v39, &qword_1000592D8);
  uint64_t v40 = sub_1000315A8();
  sub_100030D2C(v40, v41, v25);
  if (v42)
  {
    sub_100031240();
    sub_1000194CC((uint64_t)v34, &qword_1000592D8);
    sub_100030D2C(v39, 1, v25);
    if (v42)
    {
      sub_1000194CC(v4, &qword_1000592D8);
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v43 = &qword_1000592D0;
    uint64_t v44 = v4;
LABEL_11:
    sub_1000194CC(v44, v43);
    goto LABEL_25;
  }
  sub_100019520(v4, v0, &qword_1000592D8);
  sub_100030D2C(v39, 1, v25);
  if (v42)
  {
    sub_1000194CC(v5, &qword_1000592D8);
    sub_1000194CC((uint64_t)v34, &qword_1000592D8);
    sub_100018A8C(v0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
    goto LABEL_10;
  }
  sub_100018AE4(v39, v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_100013174();
  char v46 = v45;
  sub_100018A8C(v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
  sub_1000194CC(v5, &qword_1000592D8);
  sub_1000194CC((uint64_t)v34, &qword_1000592D8);
  uint64_t v47 = sub_1000314D8();
  sub_100018A8C(v47, v48);
  uint64_t v49 = sub_10003159C();
  sub_1000194CC(v49, v50);
  if ((v46 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  if (!sub_100018BAC(*(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void *)(v38 + 16))) {
    goto LABEL_25;
  }
  uint64_t v51 = v38;
  uint64_t v52 = v69;
  uint64_t v53 = (void (*)(void))&qword_100059310;
  uint64_t v54 = v78;
  sub_100019520(v2 + *(int *)(v69 + 32), v78, &qword_100059310);
  uint64_t v55 = v77;
  sub_100019520(v51 + *(int *)(v52 + 32), v77, &qword_100059310);
  uint64_t v56 = v80;
  uint64_t v57 = v80 + *(int *)(v76 + 48);
  uint64_t v58 = sub_10003159C();
  sub_100019520(v58, v59, &qword_100059310);
  sub_100019520(v55, v57, &qword_100059310);
  uint64_t v60 = v79;
  sub_100030D2C(v56, 1, v79);
  if (v42)
  {
    sub_1000194CC(v55, &qword_100059310);
    sub_1000194CC(v54, &qword_100059310);
    sub_100030D2C(v57, 1, v60);
    if (v42)
    {
      sub_1000194CC(v56, &qword_100059310);
LABEL_24:
      uint64_t v66 = v74;
      sub_1000315D4();
      sub_100030FB8();
      v53();
      sub_100030FB8();
      v53();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_1000310E0();
      v67 = *(void (**)(void))(v66 + 8);
      sub_100030FA8();
      v67();
      sub_100030FA8();
      v67();
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v61 = v75;
  sub_100019520(v56, v75, &qword_100059310);
  sub_100030D2C(v57, 1, v60);
  if (v62)
  {
    sub_1000312E4();
    sub_1000194CC(v54, &qword_100059310);
    sub_100018A8C(v61, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
LABEL_22:
    uint64_t v43 = &qword_100059308;
    uint64_t v44 = v56;
    goto LABEL_11;
  }
  uint64_t v63 = v70;
  sub_100018AE4(v57, v70, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
  sub_100016BE4();
  char v65 = v64;
  uint64_t v53 = (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo;
  sub_100018A8C(v63, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
  sub_1000194CC(v55, &qword_100059310);
  sub_1000194CC(v54, &qword_100059310);
  sub_100018A8C(v61, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
  sub_1000194CC(v56, &qword_100059310);
  if (v65) {
    goto LABEL_24;
  }
LABEL_25:
  sub_1000313F8();
  sub_100030E78();
}

unint64_t sub_1000115BC()
{
  return 0xD000000000000040;
}

uint64_t sub_1000115D8()
{
  return sub_100010888();
}

uint64_t sub_1000115F0()
{
  return sub_100010AC8();
}

uint64_t sub_100011608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059388, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100011684(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B90, (uint64_t)qword_100061C30);
}

uint64_t sub_1000116A8(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059108, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100011714()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected, &qword_100059110, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
}

uint64_t sub_100011770()
{
  sub_1000171D4(&qword_100059108, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);

  return sub_1000469D0();
}

uint64_t sub_1000117F0()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061C48);
  sub_100004C10(v0, (uint64_t)qword_100061C48);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478F0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "experimentNamespace";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "experimentId";
  *(void *)(v10 + 8) = 12;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "treatmentId";
  *((void *)v12 + 1) = 11;
  unsigned char v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "deploymentId";
  *((void *)v14 + 1) = 12;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "allocationStatus";
  *((void *)v16 + 1) = 16;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "CompatibilityVersion";
  *((void *)v18 + 1) = 20;
  v18[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100011AA0()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v4 = v0;
          goto LABEL_8;
        case 2:
          uint64_t v4 = v0 + 16;
          goto LABEL_8;
        case 3:
          uint64_t v4 = v0 + 32;
LABEL_8:
          sub_100031258(v4);
          break;
        case 4:
          sub_100046920();
          break;
        case 5:
          sub_100030CE0();
          sub_100011B9C();
          break;
        case 6:
          sub_100046940();
          break;
        default:
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_100011B9C()
{
  return sub_100046900();
}

uint64_t sub_100011C00()
{
  sub_1000313E0();
  sub_100030C80();
  if (!v2 || (uint64_t result = sub_100030EE8(), !v0))
  {
    sub_100030C80();
    if (!v4 || (uint64_t result = sub_100030EE8(), !v0))
    {
      sub_100030C80();
      if (!v5 || (uint64_t result = sub_100030EE8(), !v0))
      {
        if (!*(void *)(v1 + 48) || (sub_1000312C8(), uint64_t result = sub_100046A10(), !v0))
        {
          if (!*(void *)(v1 + 56)
            || (sub_10003113C(),
                unint64_t v6 = sub_1000195C4(),
                uint64_t result = sub_100031568((uint64_t)&v7, 5, (uint64_t)&unk_100055740, v6),
                !v0))
          {
            if (!*(_DWORD *)(v1 + 68) || (sub_1000312C8(), uint64_t result = sub_100046A30(), !v0))
            {
              type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(0);
              return sub_100031348();
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100011D10()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  sub_100030F04();
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (sub_100046EB0() & 1) != 0)
  {
    sub_1000312B8();
    BOOL v12 = v9 && v10 == v11;
    if (v12 || (sub_100046EB0() & 1) != 0)
    {
      BOOL v13 = *(void *)(v1 + 32) == *(void *)(v0 + 32) && *(void *)(v1 + 40) == *(void *)(v0 + 40);
      if (v13 || (sub_100046EB0())
        && *(void *)(v1 + 48) == *(void *)(v0 + 48)
        && sub_100018BAC(*(void *)(v1 + 56), *(unsigned __int8 *)(v1 + 64), *(void *)(v0 + 56))
        && *(_DWORD *)(v1 + 68) == *(_DWORD *)(v0 + 68))
      {
        type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(0);
        uint64_t v14 = sub_100030C34();
        ((void (*)(uint64_t))v2)(v14);
        sub_100030C70();
        v2();
        sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        sub_100030CF4();
        uint64_t v15 = *(void (**)(void))(v4 + 8);
        sub_100030CA8();
        v15();
        sub_100030CA8();
        v15();
      }
    }
  }
  sub_100031324();
  sub_10003108C();
}

unint64_t sub_100011EB0()
{
  return 0xD000000000000038;
}

uint64_t sub_100011ECC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100011F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 40);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t (*sub_100011FAC())()
{
  return nullsub_1;
}

uint64_t sub_100011FD0()
{
  return sub_100011AA0();
}

uint64_t sub_100011FE8()
{
  return sub_100011C00();
}

uint64_t sub_100012000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059398, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10001207C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058B98, (uint64_t)qword_100061C48);
}

uint64_t sub_1000120A0(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000590E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_10001210C()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment, &qword_1000590F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
}

uint64_t sub_100012168()
{
  sub_1000171D4(&qword_1000590E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);

  return sub_1000469D0();
}

uint64_t sub_1000121E8(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061C60, (uint64_t)"exists", 6);
}

uint64_t sub_100012200@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000064CC((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted, a1);
}

unint64_t sub_10001222C()
{
  return 0xD00000000000004BLL;
}

uint64_t sub_100012248(uint64_t a1, uint64_t a2)
{
  return sub_100016280(a1, a2);
}

uint64_t sub_100012260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000162D8(a1, a2, a3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t sub_10001228C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100012308(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BA0, (uint64_t)qword_100061C60);
}

uint64_t sub_10001232C(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000590C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100012398()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted, &qword_1000590D0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t sub_1000123F4()
{
  sub_1000171D4(&qword_1000590C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);

  return sub_1000469D0();
}

uint64_t sub_100012470()
{
  sub_10001636C();
  return v0 & 1;
}

uint64_t sub_1000124A0(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061C78, (uint64_t)"hideReason", 10);
}

uint64_t sub_1000124B8()
{
  return sub_100046900();
}

void sub_100012520()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_100030C54();
  __chkstk_darwin(v5);
  sub_10003145C();
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    switch(v7)
    {
      case 1:
        if (v6 == 1) {
          goto LABEL_6;
        }
        break;
      case 2:
        if (v6 == 2) {
          goto LABEL_6;
        }
        break;
      case 3:
        if (v6 == 3) {
          goto LABEL_6;
        }
        break;
      default:
        if (!v6) {
          goto LABEL_6;
        }
        break;
    }
  }
  else if (v6 == v7)
  {
LABEL_6:
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
    uint64_t v8 = sub_100030C34();
    ((void (*)(uint64_t))v1)(v8);
    sub_100030C70();
    v1();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    BOOL v9 = *(void (**)(void))(v3 + 8);
    sub_100030CA8();
    v9();
    uint64_t v10 = sub_1000314E4();
    ((void (*)(uint64_t))v9)(v10);
  }
  sub_100031480();
  sub_10003108C();
}

uint64_t sub_100012698@<X0>(uint64_t a1@<X8>)
{
  return sub_100006504(a1);
}

unint64_t sub_1000126C4()
{
  return 0xD000000000000049;
}

uint64_t sub_1000126E0(uint64_t a1, uint64_t a2)
{
  return sub_100014AF4(a1, a2);
}

uint64_t sub_10001270C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014BC8(a1, a2, a3, (uint64_t)sub_100019610, (uint64_t)&unk_1000558F0, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t sub_100012754(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000127D0(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BA8, (uint64_t)qword_100061C78);
}

uint64_t sub_1000127F4(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_1000590A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100012860()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded, &qword_1000590B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t sub_1000128BC()
{
  sub_1000171D4(&qword_1000590A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);

  return sub_1000469D0();
}

uint64_t sub_10001293C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061C90);
  sub_100004C10(v0, (uint64_t)qword_100061C90);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "visualComponentAttribute";
  *(void *)(v6 + 8) = 24;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  BOOL v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "visualComponentData";
  *((void *)v10 + 1) = 19;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  BOOL v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)BOOL v12 = "identifier";
  *((void *)v12 + 1) = 10;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100012B34(uint64_t a1, uint64_t a2)
{
  sub_100030E04(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    switch(result)
    {
      case 3:
        sub_100046950();
        break;
      case 2:
        sub_100030CE0();
        sub_100012C6C();
        break;
      case 1:
        sub_100030CE0();
        sub_100012BBC();
        break;
    }
    sub_1000312D8();
  }
  return result;
}

uint64_t sub_100012BBC()
{
  return sub_100046970();
}

uint64_t sub_100012C6C()
{
  return sub_100046970();
}

uint64_t sub_100012D1C()
{
  uint64_t v2 = sub_10003171C();
  uint64_t result = sub_100012DDC(v2);
  if (!v1)
  {
    sub_100012FA8((uint64_t)v0);
    if (*v0)
    {
      sub_1000312C8();
      sub_100046A40();
    }
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
    return sub_100046850();
  }
  return result;
}

uint64_t sub_100012DDC(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592F8);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  sub_100019520(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1000592F8);
  if (sub_100004B4C((uint64_t)v4, 1, v5) == 1) {
    return sub_1000194CC((uint64_t)v4, &qword_1000592F8);
  }
  sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
  sub_1000171D4(&qword_100059068, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
  sub_100046A60();
  return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t sub_100012FA8(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592E8);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  sub_100019520(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_1000592E8);
  if (sub_100004B4C((uint64_t)v4, 1, v5) == 1) {
    return sub_1000194CC((uint64_t)v4, &qword_1000592E8);
  }
  sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
  sub_1000171D4(&qword_100059048, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
  sub_100046A60();
  return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

void sub_100013174()
{
  sub_100030EB8();
  uint64_t v78 = v3;
  uint64_t v5 = v4;
  sub_100046870();
  sub_100030C08();
  uint64_t v67 = v7;
  uint64_t v68 = v6;
  __chkstk_darwin(v6);
  sub_100030E64();
  v66[1] = v8;
  sub_100030F3C();
  __chkstk_darwin(v9);
  sub_1000315F4();
  v66[0] = v10;
  uint64_t v11 = sub_100030F20();
  uint64_t v74 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(v11);
  sub_100030C24();
  __chkstk_darwin(v12);
  uint64_t v69 = (void *)((char *)v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v71 = sub_10000488C(&qword_1000592E0);
  sub_100030C24();
  __chkstk_darwin(v14);
  sub_100030D90();
  uint64_t v75 = v15;
  uint64_t v16 = sub_10000488C(&qword_1000592E8);
  uint64_t v17 = sub_100030DA4(v16);
  __chkstk_darwin(v17);
  sub_100030E64();
  uint64_t v70 = (void *)v18;
  sub_100030F3C();
  __chkstk_darwin(v19);
  uint64_t v72 = (uint64_t)v66 - v20;
  sub_100030F3C();
  __chkstk_darwin(v21);
  sub_1000315F4();
  uint64_t v73 = v22;
  uint64_t v23 = sub_100030F20();
  uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(v23);
  sub_100030C24();
  __chkstk_darwin(v25);
  sub_100030E30();
  uint64_t v26 = sub_10000488C(&qword_1000592F0);
  uint64_t v27 = v26 - 8;
  __chkstk_darwin(v26);
  sub_100031148();
  uint64_t v28 = sub_10000488C(&qword_1000592F8);
  uint64_t v29 = sub_100030DA4(v28);
  __chkstk_darwin(v29);
  sub_100030FC8();
  uint64_t v31 = __chkstk_darwin(v30);
  uint64_t v33 = (char *)v66 - v32;
  __chkstk_darwin(v31);
  uint64_t v35 = (char *)v66 - v34;
  uint64_t v36 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  uint64_t v37 = *(int *)(v36 + 24);
  uint64_t v76 = v5;
  sub_100019520((uint64_t)v5 + v37, (uint64_t)v35, &qword_1000592F8);
  uint64_t v77 = v36;
  sub_100019520((uint64_t)v78 + *(int *)(v36 + 24), (uint64_t)v33, &qword_1000592F8);
  uint64_t v38 = v0 + *(int *)(v27 + 56);
  uint64_t v39 = sub_1000315C8();
  sub_100019520(v39, v40, &qword_1000592F8);
  sub_100019520((uint64_t)v33, v38, &qword_1000592F8);
  sub_100030D2C(v0, 1, v24);
  if (v41)
  {
    sub_100031584();
    sub_1000312E4();
    sub_100030D2C(v38, 1, v24);
    if (v41)
    {
      sub_1000194CC(v0, &qword_1000592F8);
      goto LABEL_11;
    }
LABEL_9:
    char v42 = &qword_1000592F0;
    uint64_t v43 = v0;
    goto LABEL_31;
  }
  sub_100019520(v0, v1, &qword_1000592F8);
  sub_100030D2C(v38, 1, v24);
  if (v41)
  {
    sub_100031584();
    sub_1000312E4();
    sub_100018A8C(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
    goto LABEL_9;
  }
  sub_100018AE4(v38, v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
  sub_100013FE8();
  char v45 = v44;
  sub_100018A8C(v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
  sub_1000194CC((uint64_t)v33, &qword_1000592F8);
  sub_1000194CC((uint64_t)v35, &qword_1000592F8);
  sub_100018A8C(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
  sub_1000194CC(v0, &qword_1000592F8);
  if ((v45 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_11:
  uint64_t v47 = v76;
  uint64_t v46 = v77;
  uint64_t v48 = v73;
  sub_100019520((uint64_t)v76 + *(int *)(v77 + 28), v73, &qword_1000592E8);
  uint64_t v49 = v78;
  uint64_t v50 = v72;
  sub_100019520((uint64_t)v78 + *(int *)(v46 + 28), v72, &qword_1000592E8);
  uint64_t v51 = v75;
  uint64_t v52 = v75 + *(int *)(v71 + 48);
  sub_100019520(v48, v75, &qword_1000592E8);
  sub_100019520(v50, v52, &qword_1000592E8);
  uint64_t v53 = v74;
  sub_100030D2C(v51, 1, v74);
  if (!v41)
  {
    uint64_t v57 = v70;
    sub_100019520(v51, (uint64_t)v70, &qword_1000592E8);
    sub_100030D2C(v52, 1, v53);
    if (!v58)
    {
      uint64_t v59 = v69;
      sub_100018AE4(v52, (uint64_t)v69, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      BOOL v60 = *v57 == *v59 && v57[1] == v59[1];
      if (v60 || (sub_100046EB0()) && v57[2] == v59[2])
      {
        sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        sub_100031030();
        char v61 = sub_100046B00();
        uint64_t v54 = (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData;
        sub_100018A8C((uint64_t)v59, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
        sub_1000194CC(v50, &qword_1000592E8);
        uint64_t v62 = sub_1000315C8();
        sub_1000194CC(v62, v63);
        sub_100018A8C((uint64_t)v57, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
        uint64_t v64 = sub_1000312D8();
        sub_1000194CC(v64, v65);
        if ((v61 & 1) == 0) {
          goto LABEL_32;
        }
        goto LABEL_16;
      }
      sub_100018A8C((uint64_t)v59, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      sub_100031240();
      sub_1000194CC(v48, &qword_1000592E8);
      sub_100018A8C((uint64_t)v57, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      uint64_t v43 = v51;
      char v42 = &qword_1000592E8;
LABEL_31:
      sub_1000194CC(v43, v42);
      goto LABEL_32;
    }
    sub_1000194CC(v50, &qword_1000592E8);
    sub_1000312E4();
    sub_100018A8C((uint64_t)v57, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
LABEL_21:
    char v42 = &qword_1000592E0;
    uint64_t v43 = v51;
    goto LABEL_31;
  }
  uint64_t v54 = (void (*)(void))&qword_1000592E8;
  sub_100031240();
  sub_1000194CC(v48, &qword_1000592E8);
  sub_100030D2C(v52, 1, v53);
  if (!v41) {
    goto LABEL_21;
  }
  sub_1000194CC(v51, &qword_1000592E8);
LABEL_16:
  if (*v47 == *v49)
  {
    uint64_t v55 = v67;
    sub_1000315D4();
    sub_100031024();
    v54();
    sub_100031024();
    v54();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100046B00();
    uint64_t v56 = *(void (**)(void))(v55 + 8);
    sub_100031018();
    v56();
    sub_100031018();
    v56();
  }
LABEL_32:
  sub_1000313F8();
  sub_100030E78();
}

unint64_t sub_1000138D8()
{
  return 0xD000000000000038;
}

uint64_t sub_1000138F4(uint64_t a1, uint64_t a2)
{
  return sub_100012B34(a1, a2);
}

uint64_t sub_10001390C()
{
  return sub_100012D1C();
}

uint64_t sub_100013924(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593C0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_1000139A0(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BB0, (uint64_t)qword_100061C90);
}

uint64_t sub_1000139C4(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059088, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100013A30()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent, &qword_100059090, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t sub_100013A8C()
{
  sub_1000171D4(&qword_100059088, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);

  return sub_1000469D0();
}

uint64_t sub_100013B0C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061CA8);
  sub_100004C10(v0, (uint64_t)qword_100061CA8);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "componentType";
  *(void *)(v6 + 8) = 13;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "cardType";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "entityType";
  *((void *)v12 + 1) = 10;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100013D04()
{
  uint64_t result = sub_100030CB8();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_100030CE0();
          sub_100013E74();
          break;
        case 2:
          sub_1000314B4(2, v2, v3, v4, (void (*)(void))sub_1000196A8);
          break;
        case 1:
          sub_100030CE0();
          sub_100013DA4();
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_100013DA4()
{
  return sub_100046900();
}

uint64_t sub_100013E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_100046900();
}

uint64_t sub_100013E74()
{
  return sub_100046900();
}

uint64_t sub_100013ED8()
{
  if (!*v0
    || (sub_10003113C(), unint64_t v2 = sub_10001965C(),
                         uint64_t result = sub_100030F8C((uint64_t)v6, 1, (uint64_t)&unk_100055AA0, v2),
                         !v1))
  {
    if (!v0[2]
      || (sub_10003113C(),
          unint64_t v4 = sub_1000196A8(),
          uint64_t result = sub_100030F8C((uint64_t)v6, 2, (uint64_t)&unk_100055B30, v4),
          !v1))
    {
      if (!v0[4]
        || (sub_10003113C(),
            unint64_t v5 = sub_1000196F4(),
            uint64_t result = sub_100030F8C((uint64_t)v6, 3, (uint64_t)&unk_100055BC0, v5),
            !v1))
      {
        type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        return sub_100030DE8();
      }
    }
  }
  return result;
}

void sub_100013FE8()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  sub_10003145C();
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    switch(v8)
    {
      case 1:
        if (v7 == 1) {
          goto LABEL_12;
        }
        break;
      case 2:
        if (v7 == 2) {
          goto LABEL_12;
        }
        break;
      case 3:
        if (v7 == 3) {
          goto LABEL_12;
        }
        break;
      default:
        if (!v7) {
          goto LABEL_12;
        }
        break;
    }
  }
  else
  {
    if (v7 != v8) {
      goto LABEL_24;
    }
LABEL_12:
    uint64_t v9 = *(void *)(v1 + 16);
    uint64_t v10 = *(void *)(v0 + 16);
    if (*(unsigned char *)(v0 + 24) == 1)
    {
      if (v10)
      {
        if (v10 == 1)
        {
          if (v9 != 1) {
            goto LABEL_24;
          }
        }
        else if (v9 != 2)
        {
          goto LABEL_24;
        }
      }
      else if (v9)
      {
        goto LABEL_24;
      }
    }
    else if (v9 != v10)
    {
      goto LABEL_24;
    }
    if (sub_100018BAC(*(void *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), *(void *)(v0 + 32)))
    {
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      uint64_t v11 = sub_100030C34();
      ((void (*)(uint64_t))v2)(v11);
      sub_100030C70();
      v2();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_100030CF4();
      uint64_t v12 = *(void (**)(void))(v4 + 8);
      sub_100030CA8();
      v12();
      sub_100030CA8();
      v12();
    }
  }
LABEL_24:
  sub_100031480();
  sub_10003108C();
}

unint64_t sub_1000141C8()
{
  return 0xD000000000000041;
}

uint64_t sub_1000141E4()
{
  return sub_100013D04();
}

uint64_t sub_1000141FC()
{
  return sub_100013ED8();
}

uint64_t sub_100014214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100014290(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BB8, (uint64_t)qword_100061CA8);
}

uint64_t sub_1000142B4(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059068, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100014320()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute, &qword_100059070, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t sub_10001437C()
{
  sub_1000171D4(&qword_100059068, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);

  return sub_1000469D0();
}

uint64_t sub_1000143FC()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061CC0);
  sub_100004C10(v0, (uint64_t)qword_100061CC0);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478C0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "summaryText";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "tableOfContentsArrayLength";
  *((void *)v10 + 1) = 26;
  v10[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000145B4()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      if (result == 2)
      {
        sub_100046950();
      }
      else if (result == 1)
      {
        sub_100031258(v0);
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_100014630()
{
  sub_100030C80();
  if (!v2 || (uint64_t result = sub_100030F48(), !v1))
  {
    if (!*(void *)(v0 + 16) || (uint64_t result = sub_100031544(), !v1))
    {
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      return sub_100030DE8();
    }
  }
  return result;
}

void sub_1000146BC()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  sub_100030F04();
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (sub_100046EB0()) && *(void *)(v1 + 16) == *(void *)(v0 + 16))
  {
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    uint64_t v10 = sub_100030C34();
    ((void (*)(uint64_t))v2)(v10);
    sub_100030C70();
    v2();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    uint64_t v11 = *(void (**)(void))(v4 + 8);
    sub_100030CA8();
    v11();
    sub_100030CA8();
    v11();
  }
  sub_100031324();
  sub_10003108C();
}

unint64_t sub_1000147F4()
{
  return 0xD00000000000003CLL;
}

uint64_t sub_100014810()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031030();

  return v1(v0);
}

uint64_t sub_10001486C()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031434();

  return v1(v0);
}

uint64_t sub_1000148C4()
{
  return sub_1000145B4();
}

uint64_t sub_1000148DC()
{
  return sub_100014630();
}

uint64_t sub_1000148F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100014970(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BC0, (uint64_t)qword_100061CC0);
}

uint64_t sub_100014994(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059048, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100014A00()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData, &qword_100059050, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

uint64_t sub_100014A5C()
{
  sub_1000171D4(&qword_100059048, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);

  return sub_1000469D0();
}

uint64_t sub_100014ADC(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061CD8, (uint64_t)"requestType", 11);
}

uint64_t sub_100014AF4(uint64_t a1, uint64_t a2)
{
  sub_100031270(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v4 || (v9 & 1) != 0) {
      break;
    }
    if (result == 1) {
      v2(v3, v5, v7, v6);
    }
  }
  return result;
}

uint64_t sub_100014B60()
{
  return sub_100046900();
}

uint64_t sub_100014BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  if (!*v6 || (sub_10003113C(), uint64_t v11 = v10(), result = sub_100030F8C((uint64_t)&v13, 1, a5, v11), !v7))
  {
    a6(0);
    return sub_100030DE8();
  }
  return result;
}

void sub_100014C7C()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  uint64_t v7 = *v1;
  uint64_t v8 = *v0;
  if (*((unsigned char *)v0 + 8) == 1)
  {
    if (v8)
    {
      if (v8 == 1)
      {
        if (v7 != 1) {
          goto LABEL_9;
        }
      }
      else if (v7 != 2)
      {
        goto LABEL_9;
      }
    }
    else if (v7)
    {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (v7 == v8)
  {
LABEL_7:
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
    uint64_t v9 = sub_100030C34();
    ((void (*)(uint64_t))v2)(v9);
    sub_100030C70();
    v2();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    uint64_t v10 = *(void (**)(void))(v4 + 8);
    sub_100030CA8();
    v10();
    sub_100030CA8();
    v10();
  }
LABEL_9:
  sub_100031480();
  sub_10003108C();
}

uint64_t sub_100014DD4@<X0>(uint64_t a1@<X8>)
{
  return sub_100006504(a1);
}

unint64_t sub_100014E00()
{
  return 0xD000000000000044;
}

uint64_t sub_100014E1C(uint64_t a1, uint64_t a2)
{
  return sub_100014AF4(a1, a2);
}

uint64_t sub_100014E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100014BC8(a1, a2, a3, (uint64_t)sub_100019740, (uint64_t)&unk_100055A10, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t sub_100014E90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_1000593F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100014F0C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BC8, (uint64_t)qword_100061CD8);
}

uint64_t sub_100014F30(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059028, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100014F9C()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted, &qword_100059030, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t sub_100014FF8()
{
  sub_1000171D4(&qword_100059028, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);

  return sub_1000469D0();
}

uint64_t sub_100015078()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061CF0);
  sub_100004C10(v0, (uint64_t)qword_100061CF0);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478C0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "serverReleaseVersion";
  *(void *)(v6 + 8) = 20;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "responseData";
  *((void *)v10 + 1) = 12;
  v10[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100015230(uint64_t a1, uint64_t a2)
{
  sub_100030E04(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v3 || (v5 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_100030CE0();
      sub_100015298();
    }
    else if (result == 1)
    {
      sub_100031258(v2);
    }
    sub_1000312D8();
  }
  return result;
}

uint64_t sub_100015298()
{
  return sub_100046970();
}

uint64_t sub_100015348()
{
  uint64_t v2 = v1;
  sub_100030C80();
  if (!v3 || (result = sub_100030F48(), (uint64_t v2 = v1) == 0))
  {
    uint64_t result = sub_1000153E0(v0);
    if (!v2)
    {
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      return sub_100030DE8();
    }
  }
  return result;
}

uint64_t sub_1000153E0(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_1000592B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
  sub_100019520(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1000592B8);
  if (sub_100004B4C((uint64_t)v4, 1, v5) == 1) {
    return sub_1000194CC((uint64_t)v4, &qword_1000592B8);
  }
  sub_100018AE4((uint64_t)v4, (uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
  sub_1000171D4(&qword_100058FE8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
  sub_100046A60();
  return sub_100018A8C((uint64_t)v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

void sub_1000155AC()
{
  sub_100030EB8();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_100046870();
  sub_100030C08();
  uint64_t v42 = v10;
  __chkstk_darwin(v11);
  sub_100030E64();
  uint64_t v41 = v12;
  sub_100030F3C();
  __chkstk_darwin(v13);
  sub_1000315F4();
  uint64_t v40 = v14;
  uint64_t v15 = sub_100030F20();
  uint64_t v16 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(v15);
  sub_100030C24();
  __chkstk_darwin(v17);
  sub_100030E30();
  uint64_t v18 = sub_10000488C(&qword_1000592B0);
  sub_100030C24();
  __chkstk_darwin(v19);
  sub_100030ED0();
  uint64_t v20 = sub_10000488C(&qword_1000592B8);
  uint64_t v21 = sub_100030DA4(v20);
  __chkstk_darwin(v21);
  sub_100030FC8();
  __chkstk_darwin(v22);
  sub_100030D44();
  __chkstk_darwin(v23);
  uint64_t v43 = v6;
  BOOL v25 = sub_1000315E0() == *v6 && v24 == v6[1];
  if (v25 || (sub_100046EB0() & 1) != 0)
  {
    uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
    sub_100019520(v8 + *(int *)(v26 + 24), v4, &qword_1000592B8);
    sub_100019520((uint64_t)v43 + *(int *)(v26 + 24), v0, &qword_1000592B8);
    uint64_t v27 = v1 + *(int *)(v18 + 48);
    sub_100019520(v4, v1, &qword_1000592B8);
    uint64_t v28 = sub_100031030();
    sub_100019520(v28, v29, &qword_1000592B8);
    sub_100030D2C(v1, 1, v16);
    if (v25)
    {
      sub_1000194CC(v0, &qword_1000592B8);
      sub_1000194CC(v4, &qword_1000592B8);
      sub_100030D2C(v27, 1, v16);
      if (v25)
      {
        sub_1000194CC(v1, &qword_1000592B8);
        uint64_t v30 = v9;
LABEL_23:
        uint64_t v36 = *(void (**)(void))(v42 + 16);
        sub_100031024();
        v36();
        sub_100031024();
        v36();
        sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        sub_100046B00();
        uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
        v37(v41, v30);
        v37(v40, v30);
        goto LABEL_24;
      }
    }
    else
    {
      sub_100019520(v1, (uint64_t)v2, &qword_1000592B8);
      sub_100030D2C(v27, 1, v16);
      if (!v31)
      {
        sub_100018AE4(v27, (uint64_t)v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
        BOOL v34 = *v2 == *v3 && v2[1] == v3[1];
        if (v34 || (sub_100046EB0() & 1) != 0)
        {
          sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
          uint64_t v30 = v9;
          char v35 = sub_100046B00();
          sub_100018A8C((uint64_t)v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
          sub_1000194CC(v0, &qword_1000592B8);
          sub_1000194CC(v4, &qword_1000592B8);
          sub_100018A8C((uint64_t)v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
          sub_1000194CC(v1, &qword_1000592B8);
          if ((v35 & 1) == 0) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        sub_100018A8C((uint64_t)v3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
        uint64_t v38 = sub_10003168C();
        sub_1000194CC(v38, v39);
        sub_1000194CC(v4, &qword_1000592B8);
        sub_100018A8C((uint64_t)v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
        uint64_t v33 = v1;
        uint64_t v32 = &qword_1000592B8;
LABEL_15:
        sub_1000194CC(v33, v32);
        goto LABEL_24;
      }
      sub_100031674();
      sub_100031240();
      sub_100018A8C((uint64_t)v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
    }
    uint64_t v32 = &qword_1000592B0;
    uint64_t v33 = v1;
    goto LABEL_15;
  }
LABEL_24:
  sub_100030E78();
}

unint64_t sub_100015A80()
{
  return 0xD000000000000042;
}

uint64_t sub_100015A9C(uint64_t a1, uint64_t a2)
{
  return sub_100015230(a1, a2);
}

uint64_t sub_100015AB4()
{
  return sub_100015348();
}

uint64_t sub_100015ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059400, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100015B48(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BD0, (uint64_t)qword_100061CF0);
}

uint64_t sub_100015B6C(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100059008, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100015BD8()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded, &qword_100059010, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
}

uint64_t sub_100015C34()
{
  sub_1000171D4(&qword_100059008, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);

  return sub_1000469D0();
}

uint64_t sub_100015CB4(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061D08, (uint64_t)"summaryText", 11);
}

uint64_t sub_100015CCC(uint64_t a1, uint64_t a2)
{
  sub_100031270(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v3 || (v8 & 1) != 0) {
      break;
    }
    if (result == 1) {
      v2(v4, v6, v5);
    }
  }
  return result;
}

uint64_t sub_100015D34()
{
  sub_100030C80();
  if (!v1 || (uint64_t result = sub_100030F48(), !v0))
  {
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    return sub_100030DE8();
  }
  return result;
}

void sub_100015DAC()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  sub_100030C54();
  __chkstk_darwin(v4);
  sub_100030F04();
  BOOL v7 = v7 && v5 == v6;
  if (v7 || (sub_100046EB0() & 1) != 0)
  {
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    uint64_t v8 = sub_100030C34();
    ((void (*)(uint64_t))v0)(v8);
    sub_100030C70();
    v0();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    uint64_t v9 = *(void (**)(void))(v2 + 8);
    sub_100030CA8();
    v9();
    uint64_t v10 = sub_1000314E4();
    ((void (*)(uint64_t))v9)(v10);
  }
  sub_100031324();
  sub_10003108C();
}

unint64_t sub_100015ECC()
{
  return 0xD000000000000035;
}

uint64_t sub_100015EE8(uint64_t a1, uint64_t a2)
{
  return sub_100015CCC(a1, a2);
}

uint64_t sub_100015F14()
{
  return sub_100015D34();
}

uint64_t sub_100015F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059408, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100015FA8(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BD8, (uint64_t)qword_100061D08);
}

uint64_t sub_100015FCC(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100058FE8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100016038()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData, &qword_100058FF0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

uint64_t sub_100016094()
{
  sub_1000171D4(&qword_100058FE8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);

  return sub_1000469D0();
}

uint64_t sub_100016114(uint64_t a1)
{
  return sub_10001612C(a1, qword_100061D20, (uint64_t)"exists", 6);
}

uint64_t sub_10001612C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100046A90();
  sub_100018B3C(v7, a2);
  sub_100004C10(v7, (uint64_t)a2);
  sub_10000488C(&qword_100059270);
  uint64_t v8 = (int *)(sub_10000488C(&qword_100059278) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100047910;
  unint64_t v11 = v10 + v9 + v8[14];
  *(void *)(v10 + v9) = 1;
  *(void *)unint64_t v11 = a3;
  *(void *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = enum case for _NameMap.NameDescription.same(_:);
  sub_100046A70();
  sub_100030C24();
  (*(void (**)(unint64_t, uint64_t))(v13 + 104))(v11, v12);
  return sub_100046A80();
}

uint64_t sub_100016280(uint64_t a1, uint64_t a2)
{
  sub_100030E04(a1, a2);
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v2 || (v4 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_1000468F0();
    }
    sub_1000312D8();
  }
  return result;
}

uint64_t sub_1000162D8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  sub_100031660();
  if (*v5 != 1 || (uint64_t result = sub_1000469E0(), !v4))
  {
    a4(0);
    return sub_100030DE8();
  }
  return result;
}

void sub_10001636C()
{
  sub_100031128();
  uint64_t v4 = v3;
  sub_100030D54();
  sub_100030C08();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_100030C54();
  __chkstk_darwin(v8);
  if (*v1 == *v0)
  {
    v4(0);
    uint64_t v9 = sub_100030C34();
    ((void (*)(uint64_t))v2)(v9);
    sub_100030C70();
    v2();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    sub_100030CF4();
    uint64_t v10 = *(void (**)(void))(v6 + 8);
    sub_100030CA8();
    v10();
    uint64_t v11 = sub_1000314E4();
    ((void (*)(uint64_t))v10)(v11);
  }
  sub_100031480();
  sub_10003108C();
}

uint64_t sub_100016498@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000064CC((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed, a1);
}

unint64_t sub_1000164C4()
{
  return 0xD000000000000043;
}

uint64_t sub_1000164E0()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031030();

  return v1(v0);
}

uint64_t sub_10001653C()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031434();

  return v1(v0);
}

uint64_t sub_100016594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000162D8(a1, a2, a3, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t sub_1000165C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059410, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_10001663C(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BE0, (uint64_t)qword_100061D20);
}

uint64_t sub_100016660(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100058FC8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000166CC()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed, &qword_100058FD0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t sub_100016728()
{
  sub_1000171D4(&qword_100058FC8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);

  return sub_1000469D0();
}

uint64_t sub_1000167A4()
{
  sub_10001636C();
  return v0 & 1;
}

uint64_t sub_1000167D4()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061D38);
  sub_100004C10(v0, (uint64_t)qword_100061D38);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "tableOfContentsText";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "tableOfContentsTextIndex";
  *((void *)v10 + 1) = 24;
  v10[16] = 2;
  v9();
  uint64_t v11 = (void *)((char *)v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "hideShowButton";
  *((void *)v12 + 1) = 14;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000169CC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_100046A90();

  return sub_100004C10(v3, a2);
}

uint64_t sub_100016A20()
{
  uint64_t result = sub_100030CB8();
  if (!v1)
  {
    while ((v3 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          sub_100030CE0();
          sub_100016AB4();
          break;
        case 2:
          sub_100046950();
          break;
        case 1:
          sub_100031258(v0);
          break;
      }
      uint64_t result = sub_10003116C();
    }
  }
  return result;
}

uint64_t sub_100016AB4()
{
  return sub_100046900();
}

uint64_t sub_100016B18()
{
  sub_100030C80();
  if (!v2 || (uint64_t result = sub_100030F48(), !v1))
  {
    if (!*(void *)(v0 + 16) || (uint64_t result = sub_100031544(), !v1))
    {
      if (!*(void *)(v0 + 24)
        || (sub_10003113C(),
            unint64_t v4 = sub_10001978C(),
            uint64_t result = sub_100030F8C((uint64_t)&v5, 3, (uint64_t)&unk_100055CE0, v4),
            !v1))
      {
        type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        return sub_100030DE8();
      }
    }
  }
  return result;
}

void sub_100016BE4()
{
  sub_100031128();
  sub_100030D54();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100030C54();
  __chkstk_darwin(v6);
  sub_100030F04();
  BOOL v9 = v9 && v7 == v8;
  if (v9 || (sub_100046EB0()) && *(void *)(v1 + 16) == *(void *)(v0 + 16))
  {
    uint64_t v10 = *(void *)(v1 + 24);
    uint64_t v11 = *(void *)(v0 + 24);
    if (*(unsigned char *)(v0 + 32) == 1)
    {
      if (v11)
      {
        if (v11 == 1)
        {
          if (v10 != 1) {
            goto LABEL_15;
          }
        }
        else if (v10 != 2)
        {
          goto LABEL_15;
        }
      }
      else if (v10)
      {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    if (v10 == v11)
    {
LABEL_13:
      type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
      uint64_t v12 = sub_100030C34();
      ((void (*)(uint64_t))v2)(v12);
      sub_100030C70();
      v2();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      sub_100030CF4();
      uint64_t v13 = *(void (**)(void))(v4 + 8);
      sub_100030CA8();
      v13();
      sub_100030CA8();
      v13();
    }
  }
LABEL_15:
  sub_100031324();
  sub_10003108C();
}

Swift::Int sub_100016D5C(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_100046F50();
}

unint64_t sub_100016DE8()
{
  return 0xD000000000000047;
}

uint64_t sub_100016E04()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031030();

  return v1(v0);
}

uint64_t sub_100016E60()
{
  sub_100031000();
  sub_100030C24();
  uint64_t v0 = sub_100031434();

  return v1(v0);
}

uint64_t sub_100016EB8()
{
  return sub_100016A20();
}

uint64_t sub_100016ED0()
{
  return sub_100016B18();
}

uint64_t sub_100016EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000171D4(&qword_100059418, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100016F64(uint64_t a1, uint64_t a2)
{
  return sub_10000AEC0(a1, a2, &qword_100058BE8, (uint64_t)qword_100061D38);
}

uint64_t sub_100016F88(uint64_t a1)
{
  uint64_t v2 = sub_1000171D4(&qword_100058FA8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);

  return Message.debugDescription.getter(a1, v2);
}

Swift::Int sub_100016FF4()
{
  return sub_100016D5C((void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo, &qword_100058FB0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

uint64_t sub_100017050()
{
  sub_1000171D4(&qword_100058FA8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);

  return sub_1000469D0();
}

Swift::Int sub_1000170CC()
{
  return sub_100046F50();
}

uint64_t sub_100017124()
{
  return sub_1000171D4(&qword_100058FA0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(uint64_t a1)
{
  return sub_100019400(a1, qword_100059D08);
}

uint64_t sub_10001718C()
{
  return sub_1000171D4(&qword_100058FA8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

uint64_t sub_1000171D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001721C()
{
  return sub_1000171D4(&qword_100058FB0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

uint64_t sub_100017264()
{
  return sub_1000171D4(&qword_100058FB8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
}

uint64_t sub_1000172AC()
{
  return sub_1000171D4(&qword_100058FC0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(uint64_t a1)
{
  return sub_100019400(a1, qword_100059C78);
}

uint64_t sub_100017314()
{
  return sub_1000171D4(&qword_100058FC8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t sub_10001735C()
{
  return sub_1000171D4(&qword_100058FD0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t sub_1000173A4()
{
  return sub_1000171D4(&qword_100058FD8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed);
}

uint64_t sub_1000173EC()
{
  return sub_1000171D4(&qword_100058FE0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(uint64_t a1)
{
  return sub_100019400(a1, qword_100059BE8);
}

uint64_t sub_100017454()
{
  return sub_1000171D4(&qword_100058FE8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

uint64_t sub_10001749C()
{
  return sub_1000171D4(&qword_100058FF0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

uint64_t sub_1000174E4()
{
  return sub_1000171D4(&qword_100058FF8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
}

uint64_t sub_10001752C()
{
  return sub_1000171D4(&qword_100059000, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_100059B48);
}

uint64_t sub_100017594()
{
  return sub_1000171D4(&qword_100059008, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
}

uint64_t sub_1000175DC()
{
  return sub_1000171D4(&qword_100059010, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
}

uint64_t sub_100017624()
{
  return sub_1000171D4(&qword_100059018, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
}

uint64_t sub_10001766C()
{
  return sub_1000171D4(&qword_100059020, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(uint64_t a1)
{
  return sub_100019400(a1, qword_100059AB8);
}

uint64_t sub_1000176D4()
{
  return sub_1000171D4(&qword_100059028, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t sub_10001771C()
{
  return sub_1000171D4(&qword_100059030, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t sub_100017764()
{
  return sub_1000171D4(&qword_100059038, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted);
}

uint64_t sub_1000177AC()
{
  return sub_1000171D4(&qword_100059040, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(uint64_t a1)
{
  return sub_100019400(a1, qword_100059A20);
}

uint64_t sub_100017814()
{
  return sub_1000171D4(&qword_100059048, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

uint64_t sub_10001785C()
{
  return sub_1000171D4(&qword_100059050, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

uint64_t sub_1000178A4()
{
  return sub_1000171D4(&qword_100059058, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
}

uint64_t sub_1000178EC()
{
  return sub_1000171D4(&qword_100059060, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(uint64_t a1)
{
  return sub_100019400(a1, qword_100059988);
}

uint64_t sub_100017954()
{
  return sub_1000171D4(&qword_100059068, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t sub_10001799C()
{
  return sub_1000171D4(&qword_100059070, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t sub_1000179E4()
{
  return sub_1000171D4(&qword_100059078, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
}

uint64_t sub_100017A2C()
{
  return sub_1000171D4(&qword_100059080, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_1000598E0);
}

uint64_t sub_100017A94()
{
  return sub_1000171D4(&qword_100059088, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t sub_100017ADC()
{
  return sub_1000171D4(&qword_100059090, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t sub_100017B24()
{
  return sub_1000171D4(&qword_100059098, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
}

uint64_t sub_100017B6C()
{
  return sub_1000171D4(&qword_1000590A0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(uint64_t a1)
{
  return sub_100019400(a1, qword_100059850);
}

uint64_t sub_100017BD4()
{
  return sub_1000171D4(&qword_1000590A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t sub_100017C1C()
{
  return sub_1000171D4(&qword_1000590B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t sub_100017C64()
{
  return sub_1000171D4(&qword_1000590B8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded);
}

uint64_t sub_100017CAC()
{
  return sub_1000171D4(&qword_1000590C0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(uint64_t a1)
{
  return sub_100019400(a1, qword_1000597C0);
}

uint64_t sub_100017D14()
{
  return sub_1000171D4(&qword_1000590C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t sub_100017D5C()
{
  return sub_1000171D4(&qword_1000590D0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t sub_100017DA4()
{
  return sub_1000171D4(&qword_1000590D8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted);
}

uint64_t sub_100017DEC()
{
  return sub_1000171D4(&qword_1000590E0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(uint64_t a1)
{
  return sub_100019400(a1, qword_100059718);
}

uint64_t sub_100017E54()
{
  return sub_1000171D4(&qword_1000590E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
}

uint64_t sub_100017E9C()
{
  return sub_1000171D4(&qword_1000590F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
}

uint64_t sub_100017EE4()
{
  return sub_1000171D4(&qword_1000590F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
}

uint64_t sub_100017F2C()
{
  return sub_1000171D4(&qword_100059100, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_10005A1E8);
}

uint64_t sub_100017F94()
{
  return sub_1000171D4(&qword_100059108, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
}

uint64_t sub_100017FDC()
{
  return sub_1000171D4(&qword_100059110, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
}

uint64_t sub_100018024()
{
  return sub_1000171D4(&qword_100059118, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
}

uint64_t sub_10001806C()
{
  return sub_1000171D4(&qword_100059120, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_10005A140);
}

uint64_t sub_1000180D4()
{
  return sub_1000171D4(&qword_100059128, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
}

uint64_t sub_10001811C()
{
  return sub_1000171D4(&qword_100059130, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
}

uint64_t sub_100018164()
{
  return sub_1000171D4(&qword_100059138, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
}

uint64_t sub_1000181AC()
{
  return sub_1000171D4(&qword_100059140, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_10005A0A0);
}

uint64_t sub_100018214()
{
  return sub_1000171D4(&qword_100059148, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
}

uint64_t sub_10001825C()
{
  return sub_1000171D4(&qword_100059150, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
}

uint64_t sub_1000182A4()
{
  return sub_1000171D4(&qword_100059158, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
}

uint64_t sub_1000182EC()
{
  return sub_1000171D4(&qword_100059160, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(uint64_t a1)
{
  return sub_100019400(a1, qword_10005A008);
}

uint64_t sub_100018354()
{
  return sub_1000171D4(&qword_100059168, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
}

uint64_t sub_10001839C()
{
  return sub_1000171D4(&qword_100059170, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
}

uint64_t sub_1000183E4()
{
  return sub_1000171D4(&qword_100059178, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
}

uint64_t sub_10001842C()
{
  return sub_1000171D4(&qword_100059180, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(uint64_t a1)
{
  return sub_100019400(a1, qword_100059F78);
}

uint64_t sub_100018494()
{
  return sub_1000171D4(&qword_100059188, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t sub_1000184DC()
{
  return sub_1000171D4(&qword_100059190, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t sub_100018524()
{
  return sub_1000171D4(&qword_100059198, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible);
}

uint64_t sub_10001856C()
{
  return sub_1000171D4(&qword_1000591A0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(uint64_t a1)
{
  return sub_100019400(a1, qword_100059EE8);
}

uint64_t sub_1000185D4()
{
  return sub_1000171D4(&qword_1000591A8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t sub_10001861C()
{
  return sub_1000171D4(&qword_1000591B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t sub_100018664()
{
  return sub_1000171D4(&qword_1000591B8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed);
}

uint64_t sub_1000186AC()
{
  return sub_1000171D4(&qword_1000591C0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(uint64_t a1)
{
  return sub_100019400(a1, qword_100059E30);
}

uint64_t sub_100018714()
{
  return sub_1000171D4(&qword_1000591C8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
}

uint64_t sub_10001875C()
{
  return sub_1000171D4(&qword_1000591D0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
}

uint64_t sub_1000187A4()
{
  return sub_1000171D4(&qword_1000591D8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
}

uint64_t sub_1000187EC()
{
  return sub_1000171D4(&qword_1000591E0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(uint64_t a1)
{
  return sub_100019400(a1, qword_100059DA0);
}

uint64_t sub_100018854()
{
  return sub_1000171D4(&qword_1000591E8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t sub_10001889C()
{
  return sub_1000171D4(&qword_1000591F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t sub_1000188E4()
{
  return sub_1000171D4(&qword_1000591F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted);
}

uint64_t sub_10001892C()
{
  return sub_1000171D4(&qword_100059200, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(uint64_t a1)
{
  return sub_100019400(a1, (uint64_t *)&unk_100059678);
}

uint64_t sub_100018994()
{
  return sub_1000171D4(&qword_100059208, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
}

uint64_t sub_1000189DC()
{
  return sub_1000171D4(&qword_100059210, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
}

uint64_t sub_100018A24()
{
  return sub_1000171D4(&qword_100059218, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(uint64_t a1)
{
  return sub_100019400(a1, qword_1000595E8);
}

uint64_t sub_100018A8C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100030C24();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100018AE4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100030C24();
  uint64_t v4 = sub_10003148C();
  v5(v4);
  return a2;
}

uint64_t *sub_100018B3C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

BOOL sub_100018BA0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_100018BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

uint64_t sub_100018BB8()
{
  uint64_t v0 = sub_100031030();
  sub_1000197D8(v0, v1);
  return sub_100031030();
}

void sub_100018BE4()
{
  sub_100030EB8();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  sub_100030C24();
  __chkstk_darwin(v7);
  uint64_t v41 = (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10000488C(&qword_100059228);
  uint64_t v10 = sub_100030DA4(v9);
  __chkstk_darwin(v10);
  sub_100031148();
  uint64_t v43 = sub_10000488C(&qword_100059280);
  sub_100030C24();
  __chkstk_darwin(v11);
  uint64_t v12 = sub_1000313C4();
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(v12);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v38 - v18;
  uint64_t v44 = v5;
  uint64_t v45 = v3;
  uint64_t v20 = *(void *)(v5 + 16);
  if (v20 != *(void *)(v3 + 16) || !v20 || v44 == v45) {
    goto LABEL_23;
  }
  uint64_t v39 = v0;
  uint64_t v40 = v6;
  unint64_t v21 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v22 = *(void *)(v17 + 72);
  uint64_t v23 = v20 - 1;
  uint64_t v42 = v1;
  uint64_t v38 = (char *)&v38 - v18;
  while (1)
  {
    sub_100019364(v44 + v21, (uint64_t)v19, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    sub_100019364(v45 + v21, (uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    uint64_t v24 = v1 + *(int *)(v43 + 48);
    sub_100019520((uint64_t)v19, v1, &qword_100059228);
    sub_100019520((uint64_t)v16, v24, &qword_100059228);
    uint64_t v25 = sub_1000315A8();
    sub_100030D2C(v25, v26, v6);
    if (!v31) {
      break;
    }
    sub_100030D2C(v24, 1, v6);
    if (!v31) {
      goto LABEL_21;
    }
    sub_1000194CC(v1, &qword_100059228);
LABEL_12:
    if (*(void *)&v19[*(int *)(v13 + 20)] != *(void *)&v16[*(int *)(v13 + 20)]) {
      goto LABEL_22;
    }
    sub_100046870();
    sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v35 = sub_100046B00();
    sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    sub_100018A8C((uint64_t)v19, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    BOOL v37 = v23-- != 0;
    if (v35)
    {
      v21 += v22;
      uint64_t v6 = v40;
      uint64_t v1 = v42;
      if (v37) {
        continue;
      }
    }
    goto LABEL_23;
  }
  uint64_t v27 = v16;
  uint64_t v28 = v13;
  uint64_t v29 = v22;
  uint64_t v30 = v39;
  sub_100019520(v1, v39, &qword_100059228);
  sub_100030D2C(v24, 1, v6);
  if (!v31)
  {
    uint64_t v32 = v41;
    sub_100018AE4(v24, v41, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100005364();
    char v34 = v33;
    sub_100018A8C(v32, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_100018A8C(v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    sub_1000194CC(v42, &qword_100059228);
    uint64_t v22 = v29;
    uint64_t v13 = v28;
    uint64_t v16 = v27;
    uint64_t v19 = v38;
    if ((v34 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  sub_100018A8C(v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  uint64_t v16 = v27;
  uint64_t v19 = v38;
LABEL_21:
  sub_1000194CC(v1, &qword_100059280);
LABEL_22:
  sub_100018A8C((uint64_t)v16, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  sub_100018A8C((uint64_t)v19, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
LABEL_23:
  sub_100030E78();
}

uint64_t sub_100019038(uint64_t a1, uint64_t a2)
{
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment(0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v18 = 1;
      return v18 & 1;
    }
    unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v23 = *(void *)(v7 + 72);
    uint64_t v12 = v10 - 1;
    while (1)
    {
      sub_100019364(a1 + v11, (uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
      sub_100019364(a2 + v11, (uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
      BOOL v13 = *(void *)v9 == *(void *)v6 && *((void *)v9 + 1) == *((void *)v6 + 1);
      if (!v13 && (sub_100046EB0() & 1) == 0) {
        break;
      }
      BOOL v14 = *((void *)v9 + 2) == *((void *)v6 + 2) && *((void *)v9 + 3) == *((void *)v6 + 3);
      if (!v14 && (sub_100046EB0() & 1) == 0) {
        break;
      }
      BOOL v15 = *((void *)v9 + 4) == *((void *)v6 + 4) && *((void *)v9 + 5) == *((void *)v6 + 5);
      if (!v15 && (sub_100046EB0() & 1) == 0 || *((void *)v9 + 6) != *((void *)v6 + 6)) {
        break;
      }
      uint64_t v16 = *((void *)v9 + 7);
      uint64_t v17 = *((void *)v6 + 7);
      if (v6[64] == 1)
      {
        switch(v17)
        {
          case 1:
            if (v16 != 1) {
              goto LABEL_38;
            }
            goto LABEL_26;
          case 2:
            if (v16 != 2) {
              goto LABEL_38;
            }
            goto LABEL_26;
          case 3:
            if (v16 != 3) {
              goto LABEL_38;
            }
            goto LABEL_26;
          default:
            if (v16) {
              goto LABEL_38;
            }
            goto LABEL_26;
        }
      }
      if (v16 != v17) {
        break;
      }
LABEL_26:
      if (*((_DWORD *)v9 + 17) != *((_DWORD *)v6 + 17)) {
        break;
      }
      sub_100046870();
      sub_1000171D4(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v18 = sub_100046B00();
      sub_100018A8C((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
      sub_100018A8C((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
      BOOL v20 = v12-- != 0;
      if (v18)
      {
        v11 += v23;
        if (v20) {
          continue;
        }
      }
      return v18 & 1;
    }
LABEL_38:
    sub_100018A8C((uint64_t)v6, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
    sub_100018A8C((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TrialExperiment);
  }
  char v18 = 0;
  return v18 & 1;
}

uint64_t sub_100019364(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100030C24();
  sub_100031160();
  v4();
  return a2;
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(uint64_t a1)
{
  return sub_100019400(a1, qword_100059540);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(uint64_t a1)
{
  return sub_100019400(a1, qword_100059498);
}

uint64_t sub_100019400(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100019434()
{
  unint64_t result = qword_100059328;
  if (!qword_100059328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059328);
  }
  return result;
}

unint64_t sub_100019480()
{
  unint64_t result = qword_100059330;
  if (!qword_100059330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059330);
  }
  return result;
}

uint64_t sub_1000194CC(uint64_t a1, uint64_t *a2)
{
  sub_10000488C(a2);
  sub_100030C24();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_100019520(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000488C(a3);
  sub_100030C24();
  sub_100031160();
  v4();
  return a2;
}

unint64_t sub_100019578()
{
  unint64_t result = qword_100059390;
  if (!qword_100059390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059390);
  }
  return result;
}

unint64_t sub_1000195C4()
{
  unint64_t result = qword_1000593A0;
  if (!qword_1000593A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593A0);
  }
  return result;
}

unint64_t sub_100019610()
{
  unint64_t result = qword_1000593B8;
  if (!qword_1000593B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593B8);
  }
  return result;
}

unint64_t sub_10001965C()
{
  unint64_t result = qword_1000593D0;
  if (!qword_1000593D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593D0);
  }
  return result;
}

unint64_t sub_1000196A8()
{
  unint64_t result = qword_1000593D8;
  if (!qword_1000593D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593D8);
  }
  return result;
}

unint64_t sub_1000196F4()
{
  unint64_t result = qword_1000593E0;
  if (!qword_1000593E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593E0);
  }
  return result;
}

unint64_t sub_100019740()
{
  unint64_t result = qword_1000593F8;
  if (!qword_1000593F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000593F8);
  }
  return result;
}

unint64_t sub_10001978C()
{
  unint64_t result = qword_100059420;
  if (!qword_100059420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100059420);
  }
  return result;
}

uint64_t sub_1000197D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100019830(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)a1 = *a2;
      *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
      uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                  + 20);
    }
    else
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                  + 20);
    }
    uint64_t v7 = a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    uint64_t v9 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1000199A0(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
  }
  else {
    uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
  }
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = sub_100046870();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(v3, v4);
}

uint64_t sub_100019A2C(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                + 20);
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                + 20);
  }
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100019B4C(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = *a2;
      *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
      *(void *)a1 = v4;
      uint64_t v5 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                  + 20);
    }
    else
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v5 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                  + 20);
    }
    uint64_t v6 = a1 + v5;
    uint64_t v7 = (uint64_t)a2 + v5;
    uint64_t v8 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100019C90(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                + 20);
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                + 20);
  }
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_100019DB0(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
      uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                  + 20);
    }
    else
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                  + 20);
    }
    uint64_t v5 = a1 + v4;
    uint64_t v6 = a2 + v4;
    uint64_t v7 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100019F00()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100019F10()
{
  uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_100019FD4(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                   + 20);
      unint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      uint64_t v23 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (char *)a1 + v9;
      unint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_100046870();
      BOOL v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      uint64_t v14 = *(int *)(v8 + 24);
      BOOL v15 = (void *)((char *)a1 + v14);
      uint64_t v16 = (void *)((char *)a2 + v14);
      uint64_t v17 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (sub_100004B4C((uint64_t)v16, 1, v17))
      {
        uint64_t v18 = sub_10000488C(&qword_1000592B8);
        memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        uint64_t v28 = v16[1];
        *BOOL v15 = *v16;
        v15[1] = v28;
        uint64_t v29 = *(int *)(v17 + 20);
        uint64_t v30 = (char *)v15 + v29;
        char v31 = (char *)v16 + v29;
        swift_bridgeObjectRetain();
        v13(v30, v31, v12);
        sub_100004938((uint64_t)v15, 0, 1, v17);
      }
    }
    else
    {
      *a1 = *a2;
      *((unsigned char *)a1 + 8) = *((unsigned char *)a2 + 8);
      uint64_t v24 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                   + 20);
      uint64_t v25 = (char *)a1 + v24;
      uint64_t v26 = (char *)a2 + v24;
      uint64_t v27 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10001A27C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
LABEL_6:
    uint64_t v4 = a1 + *(int *)(v3 + 20);
    uint64_t v5 = sub_100046870();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    uint64_t v7 = v5;
    uint64_t v8 = v4;
    goto LABEL_7;
  }
  if (result != 1)
  {
    if (result) {
      return result;
    }
    uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
  uint64_t v10 = a1 + *(int *)(v9 + 20);
  uint64_t v11 = sub_100046870();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v14(v10, v11);
  uint64_t v12 = a1 + *(int *)(v9 + 24);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  uint64_t result = sub_100004B4C(v12, 1, v13);
  if (result) {
    return result;
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = v12 + *(int *)(v13 + 20);
  uint64_t v7 = v11;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))v14;
LABEL_7:

  return v6(v8, v7);
}

uint64_t sub_10001A3D8(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v17 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0) + 20);
    uint64_t v18 = a1 + v17;
    uint64_t v19 = a2 + v17;
    uint64_t v20 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
    uint64_t v7 = *(int *)(v6 + 20);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = a2 + v7;
    uint64_t v10 = sub_100046870();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    uint64_t v12 = *(int *)(v6 + 24);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (void *)(a2 + v12);
    uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    if (sub_100004B4C((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = sub_10000488C(&qword_1000592B8);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      uint64_t v25 = v14[1];
      *uint64_t v13 = *v14;
      v13[1] = v25;
      uint64_t v26 = *(int *)(v15 + 20);
      uint64_t v27 = (char *)v13 + v26;
      uint64_t v28 = (char *)v14 + v26;
      swift_bridgeObjectRetain();
      v11((uint64_t)v27, (uint64_t)v28, v10);
      sub_100004938((uint64_t)v13, 0, 1, v15);
    }
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
    uint64_t v21 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                 + 20);
    uint64_t v22 = a1 + v21;
    uint64_t v23 = a2 + v21;
    uint64_t v24 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10001A630(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                   + 20);
      uint64_t v17 = a1 + v16;
      uint64_t v18 = (uint64_t)a2 + v16;
      uint64_t v19 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = a2[1];
      uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v6 = *(int *)(v5 + 20);
      uint64_t v7 = a1 + v6;
      uint64_t v8 = (uint64_t)a2 + v6;
      uint64_t v9 = sub_100046870();
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
      swift_bridgeObjectRetain();
      v10(v7, v8, v9);
      uint64_t v11 = *(int *)(v5 + 24);
      uint64_t v12 = (void *)(a1 + v11);
      uint64_t v13 = (uint64_t *)((char *)a2 + v11);
      uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (sub_100004B4C((uint64_t)v13, 1, v14))
      {
        uint64_t v15 = sub_10000488C(&qword_1000592B8);
        memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        *uint64_t v12 = *v13;
        v12[1] = v13[1];
        uint64_t v25 = *(int *)(v14 + 20);
        uint64_t v26 = (char *)v12 + v25;
        uint64_t v27 = (char *)v13 + v25;
        swift_bridgeObjectRetain();
        v10((uint64_t)v26, (uint64_t)v27, v9);
        sub_100004938((uint64_t)v12, 0, 1, v14);
      }
    }
    else
    {
      uint64_t v20 = *a2;
      *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
      *(void *)a1 = v20;
      uint64_t v21 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                   + 20);
      uint64_t v22 = a1 + v21;
      uint64_t v23 = (uint64_t)a2 + v21;
      uint64_t v24 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_10001A8BC(unsigned char *a1, unsigned char *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *a1 = *a2;
    uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0) + 20);
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    uint64_t v19 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
    uint64_t v6 = *(int *)(v5 + 20);
    uint64_t v7 = &a1[v6];
    uint64_t v8 = &a2[v6];
    uint64_t v9 = sub_100046870();
    uint64_t v10 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32);
    v10(v7, v8, v9);
    uint64_t v11 = *(int *)(v5 + 24);
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    if (sub_100004B4C((uint64_t)v13, 1, v14))
    {
      uint64_t v15 = sub_10000488C(&qword_1000592B8);
      memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      *uint64_t v12 = *v13;
      v10((unsigned char *)v12 + *(int *)(v14 + 20), (unsigned char *)v13 + *(int *)(v14 + 20), v9);
      sub_100004938((uint64_t)v12, 0, 1, v14);
    }
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    a1[8] = a2[8];
    uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                 + 20);
    uint64_t v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *sub_10001AB00(unsigned char *a1, unsigned char *a2)
{
  if (a1 != a2)
  {
    sub_100018A8C((uint64_t)a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                   + 20);
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      uint64_t v19 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v6 = *(int *)(v5 + 20);
      uint64_t v7 = &a1[v6];
      uint64_t v8 = &a2[v6];
      uint64_t v9 = sub_100046870();
      uint64_t v10 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32);
      v10(v7, v8, v9);
      uint64_t v11 = *(int *)(v5 + 24);
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (sub_100004B4C((uint64_t)v13, 1, v14))
      {
        uint64_t v15 = sub_10000488C(&qword_1000592B8);
        memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        *uint64_t v12 = *v13;
        v10((unsigned char *)v12 + *(int *)(v14 + 20), (unsigned char *)v13 + *(int *)(v14 + 20), v9);
        sub_100004938((uint64_t)v12, 0, 1, v14);
      }
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      a1[8] = a2[8];
      uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                   + 20);
      uint64_t v21 = &a1[v20];
      uint64_t v22 = &a2[v20];
      uint64_t v23 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10001AD68()
{
  uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_10001AE68(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v13 = *(void *)a2;
        unint64_t v14 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v14);
        *(void *)a1 = v13;
        *(void *)(a1 + 8) = v14;
        uint64_t v15 = *(void *)(a2 + 24);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = v15;
        uint64_t v16 = *(void *)(a2 + 40);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = v16;
        uint64_t v17 = *(void *)(a2 + 56);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = v17;
        uint64_t v18 = *(void *)(a2 + 72);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = v18;
        uint64_t v19 = *(void *)(a2 + 88);
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = v19;
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
        *(void *)(a1 + 112) = *(void *)(a2 + 112);
        *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
        uint64_t v20 = *(void *)(a2 + 136);
        *(void *)(a1 + 128) = *(void *)(a2 + 128);
        *(void *)(a1 + 136) = v20;
        *(void *)(a1 + 144) = *(void *)(a2 + 144);
        uint64_t v21 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v158 = a2 + v21;
        uint64_t v162 = a1 + v21;
        uint64_t v22 = sub_100046870();
        v156 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v156(v162, v158, v22);
        goto LABEL_48;
      case 2u:
        uint64_t v23 = *(void *)a2;
        unint64_t v24 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v24);
        *(void *)a1 = v23;
        *(void *)(a1 + 8) = v24;
        uint64_t v25 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v26 = a1 + v25;
        uint64_t v27 = a2 + v25;
        uint64_t v28 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
        goto LABEL_48;
      case 3u:
        uint64_t v29 = *(void *)a2;
        unint64_t v30 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v30);
        *(void *)a1 = v29;
        *(void *)(a1 + 8) = v30;
        uint64_t v31 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v32 = a1 + v31;
        uint64_t v33 = a2 + v31;
        uint64_t v34 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
        goto LABEL_48;
      case 4u:
        uint64_t v35 = *(void *)a2;
        unint64_t v36 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v36);
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        uint64_t v37 = *(void *)(a2 + 24);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = v37;
        uint64_t v38 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v39 = a1 + v38;
        uint64_t v40 = a2 + v38;
        uint64_t v41 = sub_100046870();
        uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16);
        swift_bridgeObjectRetain();
        v42(v39, v40, v41);
        goto LABEL_48;
      case 5u:
        uint64_t v43 = *(void *)a2;
        unint64_t v44 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v44);
        *(void *)a1 = v43;
        *(void *)(a1 + 8) = v44;
        uint64_t v45 = *(void *)(a2 + 24);
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = v45;
        uint64_t v46 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v47 = *(int *)(v46 + 24);
        uint64_t v48 = (void *)(a1 + v47);
        uint64_t v49 = (void *)(a2 + v47);
        uint64_t v50 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        swift_bridgeObjectRetain();
        if (sub_100004B4C((uint64_t)v49, 1, v50))
        {
          uint64_t v51 = sub_10000488C(&qword_1000592A0);
          memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
LABEL_47:
          uint64_t v148 = *(int *)(v46 + 28);
          uint64_t v149 = a1 + v148;
          uint64_t v150 = a2 + v148;
          uint64_t v151 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v151 - 8) + 16))(v149, v150, v151);
LABEL_48:
          swift_storeEnumTagMultiPayload();
          return a1;
        }
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          *(unsigned char *)uint64_t v48 = *(unsigned char *)v49;
          uint64_t v140 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
        }
        else
        {
          if (EnumCaseMultiPayload == 1)
          {
            uint64_t v81 = v49[1];
            void *v48 = *v49;
            v48[1] = v81;
            uint64_t v82 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v83 = *(int *)(v82 + 20);
            v157 = (char *)v48 + v83;
            uint64_t v160 = v82;
            v155 = (char *)v49 + v83;
            uint64_t v84 = sub_100046870();
            v153 = *(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16);
            swift_bridgeObjectRetain();
            v153(v157, v155, v84);
            uint64_t v85 = *(int *)(v160 + 24);
            uint64_t v86 = (void *)((char *)v48 + v85);
            uint64_t v87 = (void *)((char *)v49 + v85);
            uint64_t v88 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v87, 1, v88))
            {
              uint64_t v89 = sub_10000488C(&qword_1000592B8);
              memcpy(v86, v87, *(void *)(*(void *)(v89 - 8) + 64));
            }
            else
            {
              uint64_t v145 = v87[1];
              *uint64_t v86 = *v87;
              v86[1] = v145;
              uint64_t v146 = *(int *)(v88 + 20);
              v161 = (char *)v86 + v146;
              v147 = (char *)v87 + v146;
              swift_bridgeObjectRetain();
              v153(v161, v147, v84);
              sub_100004938((uint64_t)v86, 0, 1, v88);
            }
            goto LABEL_46;
          }
          void *v48 = *v49;
          *((unsigned char *)v48 + 8) = *((unsigned char *)v49 + 8);
          uint64_t v140 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        }
        uint64_t v141 = *(int *)(v140 + 20);
        v142 = (char *)v48 + v141;
        v143 = (char *)v49 + v141;
        uint64_t v144 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 16))(v142, v143, v144);
LABEL_46:
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v48, 0, 1, v50);
        goto LABEL_47;
      case 6u:
        uint64_t v52 = *(void *)a2;
        unint64_t v53 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v53);
        *(void *)a1 = v52;
        *(void *)(a1 + 8) = v53;
        uint64_t v54 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v55 = v54[5];
        uint64_t v56 = (unsigned char *)(a1 + v55);
        uint64_t v57 = (unsigned char *)(a2 + v55);
        uint64_t v58 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v57, 1, v58))
        {
          uint64_t v59 = sub_10000488C(&qword_1000592C8);
          memcpy(v56, v57, *(void *)(*(void *)(v59 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            *(void *)uint64_t v56 = *(void *)v57;
            v56[8] = v57[8];
            uint64_t v90 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                         + 20);
          }
          else
          {
            *uint64_t v56 = *v57;
            uint64_t v90 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                         + 20);
          }
          uint64_t v91 = &v56[v90];
          v92 = &v57[v90];
          uint64_t v93 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v93 - 8) + 16))(v91, v92, v93);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v56, 0, 1, v58);
        }
        uint64_t v94 = v54[6];
        uint64_t v95 = a1 + v94;
        uint64_t v96 = a2 + v94;
        uint64_t v97 = sub_100046870();
        v98 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 16);
        v98(v95, v96, v97);
        uint64_t v99 = v54[7];
        v100 = (void *)(a1 + v99);
        v101 = (void *)(a2 + v99);
        v102 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v101, 1, (uint64_t)v102))
        {
          uint64_t v103 = sub_10000488C(&qword_1000592D8);
          memcpy(v100, v101, *(void *)(*(void *)(v103 - 8) + 64));
        }
        else
        {
          void *v100 = *v101;
          v98((uint64_t)v100 + v102[5], (uint64_t)v101 + v102[5], v97);
          uint64_t v104 = v102[6];
          v105 = (void *)((char *)v100 + v104);
          v164 = (void (*)(char *, char *, uint64_t))v98;
          v106 = (void *)((char *)v101 + v104);
          uint64_t v107 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v106, 1, v107))
          {
            uint64_t v108 = sub_10000488C(&qword_1000592F8);
            memcpy(v105, v106, *(void *)(*(void *)(v108 - 8) + 64));
          }
          else
          {
            void *v105 = *v106;
            *((unsigned char *)v105 + 8) = *((unsigned char *)v106 + 8);
            v105[2] = v106[2];
            *((unsigned char *)v105 + 24) = *((unsigned char *)v106 + 24);
            v105[4] = v106[4];
            *((unsigned char *)v105 + 40) = *((unsigned char *)v106 + 40);
            v164((char *)v105 + *(int *)(v107 + 28), (char *)v106 + *(int *)(v107 + 28), v97);
            sub_100004938((uint64_t)v105, 0, 1, v107);
          }
          uint64_t v131 = v102[7];
          v132 = (void *)((char *)v100 + v131);
          v133 = (void *)((char *)v101 + v131);
          uint64_t v134 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v133, 1, v134))
          {
            uint64_t v135 = sub_10000488C(&qword_1000592E8);
            memcpy(v132, v133, *(void *)(*(void *)(v135 - 8) + 64));
          }
          else
          {
            uint64_t v136 = v133[1];
            void *v132 = *v133;
            v132[1] = v136;
            v132[2] = v133[2];
            uint64_t v137 = *(int *)(v134 + 24);
            v138 = (char *)v132 + v137;
            v139 = (char *)v133 + v137;
            swift_bridgeObjectRetain();
            v164(v138, v139, v97);
            sub_100004938((uint64_t)v132, 0, 1, v134);
          }
          sub_100004938((uint64_t)v100, 0, 1, (uint64_t)v102);
        }
        goto LABEL_48;
      case 7u:
        uint64_t v60 = *(void *)a2;
        unint64_t v61 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v61);
        *(void *)a1 = v60;
        *(void *)(a1 + 8) = v61;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
        uint64_t v62 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v63 = *(int *)(v62 + 24);
        uint64_t v64 = a1 + v63;
        uint64_t v65 = a2 + v63;
        uint64_t v66 = sub_100046870();
        uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16);
        uint64_t v68 = v64;
        uint64_t v69 = v62;
        v67(v68, v65, v66);
        uint64_t v70 = *(int *)(v62 + 28);
        uint64_t v71 = (void *)(a1 + v70);
        uint64_t v72 = (void *)(a2 + v70);
        uint64_t v73 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v72, 1, (uint64_t)v73))
        {
          uint64_t v74 = sub_10000488C(&qword_1000592D8);
          memcpy(v71, v72, *(void *)(*(void *)(v74 - 8) + 64));
        }
        else
        {
          uint64_t v154 = v69;
          *uint64_t v71 = *v72;
          v67((uint64_t)v71 + v73[5], (uint64_t)v72 + v73[5], v66);
          uint64_t v75 = v73[6];
          uint64_t v159 = v66;
          v163 = (void (*)(char *, char *, uint64_t))v67;
          uint64_t v76 = (void *)((char *)v71 + v75);
          uint64_t v77 = (void *)((char *)v72 + v75);
          uint64_t v78 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v77, 1, v78))
          {
            uint64_t v79 = sub_10000488C(&qword_1000592F8);
            memcpy(v76, v77, *(void *)(*(void *)(v79 - 8) + 64));
            uint64_t v66 = v159;
          }
          else
          {
            *uint64_t v76 = *v77;
            *((unsigned char *)v76 + 8) = *((unsigned char *)v77 + 8);
            v76[2] = v77[2];
            *((unsigned char *)v76 + 24) = *((unsigned char *)v77 + 24);
            v76[4] = v77[4];
            *((unsigned char *)v76 + 40) = *((unsigned char *)v77 + 40);
            uint64_t v109 = *(int *)(v78 + 28);
            v110 = (char *)v77 + v109;
            uint64_t v66 = v159;
            v163((char *)v76 + v109, v110, v159);
            sub_100004938((uint64_t)v76, 0, 1, v78);
          }
          uint64_t v111 = v73[7];
          v112 = (void *)((char *)v71 + v111);
          v113 = (void *)((char *)v72 + v111);
          uint64_t v114 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v113, 1, v114))
          {
            uint64_t v115 = sub_10000488C(&qword_1000592E8);
            memcpy(v112, v113, *(void *)(*(void *)(v115 - 8) + 64));
          }
          else
          {
            uint64_t v116 = v113[1];
            void *v112 = *v113;
            v112[1] = v116;
            v112[2] = v113[2];
            uint64_t v117 = *(int *)(v114 + 24);
            v118 = (char *)v112 + v117;
            v119 = (char *)v113 + v117;
            swift_bridgeObjectRetain();
            v120 = v118;
            uint64_t v66 = v159;
            v163(v120, v119, v159);
            sub_100004938((uint64_t)v112, 0, 1, v114);
          }
          uint64_t v69 = v154;
          sub_100004938((uint64_t)v71, 0, 1, (uint64_t)v73);
          uint64_t v67 = (void (*)(uint64_t, uint64_t, uint64_t))v163;
        }
        uint64_t v121 = *(int *)(v69 + 32);
        v122 = (void *)(a1 + v121);
        v123 = (void *)(a2 + v121);
        uint64_t v124 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v123, 1, v124))
        {
          uint64_t v125 = sub_10000488C(&qword_100059310);
          memcpy(v122, v123, *(void *)(*(void *)(v125 - 8) + 64));
        }
        else
        {
          uint64_t v126 = v123[1];
          void *v122 = *v123;
          v122[1] = v126;
          uint64_t v127 = v123[3];
          v122[2] = v123[2];
          v122[3] = v127;
          *((unsigned char *)v122 + 32) = *((unsigned char *)v123 + 32);
          uint64_t v128 = *(int *)(v124 + 28);
          v129 = (char *)v122 + v128;
          v130 = (char *)v123 + v128;
          swift_bridgeObjectRetain();
          v67((uint64_t)v129, (uint64_t)v130, v66);
          sub_100004938((uint64_t)v122, 0, 1, v124);
        }
        goto LABEL_48;
      default:
        uint64_t v6 = *(void *)a2;
        unint64_t v7 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v7);
        *(void *)a1 = v6;
        *(void *)(a1 + 8) = v7;
        uint64_t v8 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v9 = a1 + v8;
        uint64_t v10 = a2 + v8;
        uint64_t v11 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
        goto LABEL_48;
    }
  }
  uint64_t v12 = *(void *)a2;
  *(void *)a1 = *(void *)a2;
  a1 = v12 + ((v5 + 16) & ~(unint64_t)v5);
  swift_retain();
  return a1;
}

uint64_t sub_10001BC48(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0);
      goto LABEL_6;
    case 1:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
      goto LABEL_37;
    case 2:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0);
      goto LABEL_6;
    case 3:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v3 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0);
LABEL_6:
      uint64_t v4 = *(int *)(v3 + 20);
      goto LABEL_37;
    case 4:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      swift_bridgeObjectRelease();
      uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
      goto LABEL_37;
    case 5:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      swift_bridgeObjectRelease();
      uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
      uint64_t v6 = a1 + *(int *)(v5 + 24);
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
      if (sub_100004B4C(v6, 1, v7)) {
        goto LABEL_36;
      }
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
LABEL_33:
        uint64_t v38 = v6 + *(int *)(v9 + 20);
        uint64_t v39 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v38, v39);
        goto LABEL_36;
      }
      if (EnumCaseMultiPayload != 1)
      {
        if (EnumCaseMultiPayload) {
          goto LABEL_36;
        }
        uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        goto LABEL_33;
      }
      swift_bridgeObjectRelease();
      uint64_t v40 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v41 = v6 + *(int *)(v40 + 20);
      uint64_t v42 = sub_100046870();
      uint64_t v43 = *(void (**)(uint64_t, uint64_t))(*(void *)(v42 - 8) + 8);
      v43(v41, v42);
      uint64_t v44 = v6 + *(int *)(v40 + 24);
      uint64_t v45 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (!sub_100004B4C(v44, 1, v45))
      {
        swift_bridgeObjectRelease();
        v43(v44 + *(int *)(v45 + 20), v42);
      }
LABEL_36:
      uint64_t v4 = *(int *)(v5 + 28);
LABEL_37:
      uint64_t v46 = a1 + v4;
      uint64_t v47 = sub_100046870();
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v47 - 8) + 8);
      uint64_t v26 = v47;
      uint64_t v25 = v46;
LABEL_38:
      return v37(v25, v26);
    case 6:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v10 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
      uint64_t v11 = a1 + v10[5];
      uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
      if (!sub_100004B4C(v11, 1, v12))
      {
        if (swift_getEnumCaseMultiPayload() == 1) {
          uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
        }
        else {
          uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
        }
        uint64_t v27 = v11 + *(int *)(v13 + 20);
        uint64_t v28 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v27, v28);
      }
      uint64_t v29 = a1 + v10[6];
      uint64_t v30 = sub_100046870();
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8);
      v48(v29, v30);
      uint64_t v31 = a1 + v10[7];
      uint64_t v32 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      uint64_t result = sub_100004B4C(v31, 1, (uint64_t)v32);
      if (result) {
        return result;
      }
      v48(v31 + v32[5], v30);
      uint64_t v33 = v31 + v32[6];
      uint64_t v34 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      if (!sub_100004B4C(v33, 1, v34)) {
        v48(v33 + *(int *)(v34 + 28), v30);
      }
      uint64_t v35 = v31 + v32[7];
      uint64_t v36 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      uint64_t result = sub_100004B4C(v35, 1, v36);
      if (result) {
        return result;
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = v35 + *(int *)(v36 + 24);
      uint64_t v26 = v30;
      goto LABEL_31;
    case 7:
      sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
      unint64_t v14 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
      uint64_t v15 = a1 + v14[6];
      uint64_t v16 = sub_100046870();
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
      v48(v15, v16);
      uint64_t v17 = a1 + v14[7];
      uint64_t v18 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      if (!sub_100004B4C(v17, 1, (uint64_t)v18))
      {
        v48(v17 + v18[5], v16);
        uint64_t v19 = v17 + v18[6];
        uint64_t v20 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        if (!sub_100004B4C(v19, 1, v20)) {
          v48(v19 + *(int *)(v20 + 28), v16);
        }
        uint64_t v21 = v17 + v18[7];
        uint64_t v22 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        if (!sub_100004B4C(v21, 1, v22))
        {
          swift_bridgeObjectRelease();
          v48(v21 + *(int *)(v22 + 24), v16);
        }
      }
      uint64_t v23 = a1 + v14[8];
      uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
      uint64_t result = sub_100004B4C(v23, 1, v24);
      if (result) {
        return result;
      }
      swift_bridgeObjectRelease();
      uint64_t v25 = v23 + *(int *)(v24 + 28);
      uint64_t v26 = v16;
LABEL_31:
      uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t))v48;
      goto LABEL_38;
    default:
      return result;
  }
}

uint64_t sub_10001C274(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001C2CC(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v10 = *(void *)a2;
      unint64_t v11 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v11);
      *(void *)a1 = v10;
      *(void *)(a1 + 8) = v11;
      uint64_t v12 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v12;
      uint64_t v13 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v13;
      uint64_t v14 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = v14;
      uint64_t v15 = *(void *)(a2 + 72);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = v15;
      uint64_t v16 = *(void *)(a2 + 88);
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = v16;
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
      *(void *)(a1 + 112) = *(void *)(a2 + 112);
      *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
      uint64_t v17 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = *(void *)(a2 + 128);
      *(void *)(a1 + 136) = v17;
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      uint64_t v18 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
      uint64_t v160 = a2 + v18;
      uint64_t v162 = a1 + v18;
      uint64_t v19 = sub_100046870();
      v156 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v156(v162, v160, v19);
      goto LABEL_46;
    case 2u:
      uint64_t v20 = *(void *)a2;
      unint64_t v21 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v21);
      *(void *)a1 = v20;
      *(void *)(a1 + 8) = v21;
      uint64_t v22 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
      uint64_t v23 = a1 + v22;
      uint64_t v24 = a2 + v22;
      uint64_t v25 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      goto LABEL_46;
    case 3u:
      uint64_t v26 = *(void *)a2;
      unint64_t v27 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v27);
      *(void *)a1 = v26;
      *(void *)(a1 + 8) = v27;
      uint64_t v28 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
      uint64_t v29 = a1 + v28;
      uint64_t v30 = a2 + v28;
      uint64_t v31 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
      goto LABEL_46;
    case 4u:
      uint64_t v32 = *(void *)a2;
      unint64_t v33 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v33);
      *(void *)a1 = v32;
      *(void *)(a1 + 8) = v33;
      uint64_t v34 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v34;
      uint64_t v35 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
      uint64_t v36 = a1 + v35;
      uint64_t v37 = a2 + v35;
      uint64_t v38 = sub_100046870();
      uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16);
      swift_bridgeObjectRetain();
      v39(v36, v37, v38);
      goto LABEL_46;
    case 5u:
      uint64_t v40 = *(void *)a2;
      unint64_t v41 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v41);
      *(void *)a1 = v40;
      *(void *)(a1 + 8) = v41;
      uint64_t v42 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(void *)(a1 + 24) = v42;
      uint64_t v43 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
      uint64_t v44 = *(int *)(v43 + 24);
      uint64_t v45 = (void *)(a1 + v44);
      uint64_t v46 = (void *)(a2 + v44);
      uint64_t v47 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
      swift_bridgeObjectRetain();
      if (sub_100004B4C((uint64_t)v46, 1, v47))
      {
        uint64_t v48 = sub_10000488C(&qword_1000592A0);
        memcpy(v45, v46, *(void *)(*(void *)(v48 - 8) + 64));
LABEL_45:
        uint64_t v150 = *(int *)(v43 + 28);
        uint64_t v151 = a1 + v150;
        uint64_t v152 = a2 + v150;
        uint64_t v153 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v153 - 8) + 16))(v151, v152, v153);
        goto LABEL_46;
      }
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
        uint64_t v141 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
      }
      else
      {
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v80 = v46[1];
          *uint64_t v45 = *v46;
          v45[1] = v80;
          uint64_t v81 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
          uint64_t v82 = *(int *)(v81 + 20);
          uint64_t v158 = (char *)v45 + v82;
          uint64_t v161 = v81;
          v155 = (char *)v46 + v82;
          uint64_t v83 = sub_100046870();
          uint64_t v84 = *(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 16);
          swift_bridgeObjectRetain();
          uint64_t v85 = v158;
          uint64_t v159 = v83;
          v84(v85, v155, v83);
          uint64_t v86 = *(int *)(v161 + 24);
          uint64_t v87 = (void *)((char *)v45 + v86);
          uint64_t v88 = (void *)((char *)v46 + v86);
          uint64_t v89 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
          if (sub_100004B4C((uint64_t)v88, 1, v89))
          {
            uint64_t v90 = sub_10000488C(&qword_1000592B8);
            memcpy(v87, v88, *(void *)(*(void *)(v90 - 8) + 64));
          }
          else
          {
            uint64_t v146 = v88[1];
            *uint64_t v87 = *v88;
            v87[1] = v146;
            uint64_t v147 = *(int *)(v89 + 20);
            uint64_t v148 = (char *)v87 + v147;
            uint64_t v149 = (char *)v88 + v147;
            swift_bridgeObjectRetain();
            v84(v148, v149, v159);
            sub_100004938((uint64_t)v87, 0, 1, v89);
          }
          goto LABEL_44;
        }
        *uint64_t v45 = *v46;
        *((unsigned char *)v45 + 8) = *((unsigned char *)v46 + 8);
        uint64_t v141 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
      }
      uint64_t v142 = *(int *)(v141 + 20);
      v143 = (char *)v45 + v142;
      uint64_t v144 = (char *)v46 + v142;
      uint64_t v145 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v145 - 8) + 16))(v143, v144, v145);
LABEL_44:
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v45, 0, 1, v47);
      goto LABEL_45;
    case 6u:
      uint64_t v49 = *(void *)a2;
      unint64_t v50 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v50);
      *(void *)a1 = v49;
      *(void *)(a1 + 8) = v50;
      uint64_t v51 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
      uint64_t v52 = v51[5];
      unint64_t v53 = (unsigned char *)(a1 + v52);
      uint64_t v54 = (unsigned char *)(a2 + v52);
      uint64_t v55 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
      if (sub_100004B4C((uint64_t)v54, 1, v55))
      {
        uint64_t v56 = sub_10000488C(&qword_1000592C8);
        memcpy(v53, v54, *(void *)(*(void *)(v56 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          *(void *)unint64_t v53 = *(void *)v54;
          v53[8] = v54[8];
          uint64_t v91 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                       + 20);
        }
        else
        {
          *unint64_t v53 = *v54;
          uint64_t v91 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                       + 20);
        }
        v92 = &v53[v91];
        uint64_t v93 = &v54[v91];
        uint64_t v94 = sub_100046870();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v94 - 8) + 16))(v92, v93, v94);
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v53, 0, 1, v55);
      }
      uint64_t v95 = v51[6];
      uint64_t v96 = a1 + v95;
      uint64_t v97 = a2 + v95;
      uint64_t v98 = sub_100046870();
      uint64_t v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 16);
      v99(v96, v97, v98);
      uint64_t v100 = v51[7];
      v101 = (void *)(a1 + v100);
      v102 = (void *)(a2 + v100);
      uint64_t v103 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      if (sub_100004B4C((uint64_t)v102, 1, (uint64_t)v103))
      {
        uint64_t v104 = sub_10000488C(&qword_1000592D8);
        memcpy(v101, v102, *(void *)(*(void *)(v104 - 8) + 64));
      }
      else
      {
        void *v101 = *v102;
        v99((uint64_t)v101 + v103[5], (uint64_t)v102 + v103[5], v98);
        uint64_t v105 = v103[6];
        v106 = v99;
        uint64_t v107 = (void *)((char *)v101 + v105);
        uint64_t v108 = (void *)((char *)v102 + v105);
        uint64_t v109 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        v164 = (void (*)(char *, char *, uint64_t))v106;
        if (sub_100004B4C((uint64_t)v108, 1, v109))
        {
          uint64_t v110 = sub_10000488C(&qword_1000592F8);
          memcpy(v107, v108, *(void *)(*(void *)(v110 - 8) + 64));
        }
        else
        {
          *uint64_t v107 = *v108;
          *((unsigned char *)v107 + 8) = *((unsigned char *)v108 + 8);
          v107[2] = v108[2];
          *((unsigned char *)v107 + 24) = *((unsigned char *)v108 + 24);
          v107[4] = v108[4];
          *((unsigned char *)v107 + 40) = *((unsigned char *)v108 + 40);
          v106((uint64_t)v107 + *(int *)(v109 + 28), (uint64_t)v108 + *(int *)(v109 + 28), v98);
          sub_100004938((uint64_t)v107, 0, 1, v109);
        }
        uint64_t v132 = v103[7];
        v133 = (void *)((char *)v101 + v132);
        uint64_t v134 = (void *)((char *)v102 + v132);
        uint64_t v135 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        if (sub_100004B4C((uint64_t)v134, 1, v135))
        {
          uint64_t v136 = sub_10000488C(&qword_1000592E8);
          memcpy(v133, v134, *(void *)(*(void *)(v136 - 8) + 64));
        }
        else
        {
          uint64_t v137 = v134[1];
          void *v133 = *v134;
          v133[1] = v137;
          v133[2] = v134[2];
          uint64_t v138 = *(int *)(v135 + 24);
          v139 = (char *)v133 + v138;
          uint64_t v140 = (char *)v134 + v138;
          swift_bridgeObjectRetain();
          v164(v139, v140, v98);
          sub_100004938((uint64_t)v133, 0, 1, v135);
        }
        sub_100004938((uint64_t)v101, 0, 1, (uint64_t)v103);
      }
      goto LABEL_46;
    case 7u:
      uint64_t v57 = *(void *)a2;
      unint64_t v58 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v58);
      *(void *)a1 = v57;
      *(void *)(a1 + 8) = v58;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      uint64_t v59 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
      uint64_t v60 = v59[6];
      uint64_t v61 = a1 + v60;
      uint64_t v62 = a2 + v60;
      uint64_t v63 = sub_100046870();
      uint64_t v64 = v61;
      uint64_t v65 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 16);
      uint64_t v66 = v62;
      uint64_t v67 = *v65;
      (*v65)(v64, v66, v63);
      uint64_t v68 = v59[7];
      uint64_t v69 = (void *)(a1 + v68);
      uint64_t v70 = (void *)(a2 + v68);
      uint64_t v71 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      if (sub_100004B4C((uint64_t)v70, 1, (uint64_t)v71))
      {
        uint64_t v72 = sub_10000488C(&qword_1000592D8);
        memcpy(v69, v70, *(void *)(*(void *)(v72 - 8) + 64));
      }
      else
      {
        *uint64_t v69 = *v70;
        v67((uint64_t)v69 + v71[5], (uint64_t)v70 + v71[5], v63);
        uint64_t v73 = v71[6];
        uint64_t v74 = (void *)((char *)v69 + v73);
        uint64_t v157 = v63;
        uint64_t v75 = (void *)((char *)v70 + v73);
        uint64_t v76 = v67;
        uint64_t v77 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        v163 = v76;
        if (sub_100004B4C((uint64_t)v75, 1, v77))
        {
          uint64_t v78 = sub_10000488C(&qword_1000592F8);
          memcpy(v74, v75, *(void *)(*(void *)(v78 - 8) + 64));
          uint64_t v63 = v157;
        }
        else
        {
          *uint64_t v74 = *v75;
          *((unsigned char *)v74 + 8) = *((unsigned char *)v75 + 8);
          v74[2] = v75[2];
          *((unsigned char *)v74 + 24) = *((unsigned char *)v75 + 24);
          v74[4] = v75[4];
          *((unsigned char *)v74 + 40) = *((unsigned char *)v75 + 40);
          uint64_t v111 = *(int *)(v77 + 28);
          v112 = (char *)v75 + v111;
          uint64_t v63 = v157;
          v76((uint64_t)v74 + v111, (uint64_t)v112, v157);
          sub_100004938((uint64_t)v74, 0, 1, v77);
        }
        uint64_t v113 = v71[7];
        uint64_t v114 = (void *)((char *)v69 + v113);
        uint64_t v115 = (void *)((char *)v70 + v113);
        uint64_t v116 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        if (sub_100004B4C((uint64_t)v115, 1, v116))
        {
          uint64_t v117 = sub_10000488C(&qword_1000592E8);
          memcpy(v114, v115, *(void *)(*(void *)(v117 - 8) + 64));
        }
        else
        {
          uint64_t v118 = v115[1];
          *uint64_t v114 = *v115;
          v114[1] = v118;
          v114[2] = v115[2];
          uint64_t v119 = *(int *)(v116 + 24);
          v120 = (char *)v114 + v119;
          uint64_t v121 = (char *)v115 + v119;
          swift_bridgeObjectRetain();
          v163((uint64_t)v120, (uint64_t)v121, v63);
          sub_100004938((uint64_t)v114, 0, 1, v116);
        }
        sub_100004938((uint64_t)v69, 0, 1, (uint64_t)v71);
        uint64_t v67 = v163;
      }
      uint64_t v122 = v59[8];
      v123 = (void *)(a1 + v122);
      uint64_t v124 = (void *)(a2 + v122);
      uint64_t v125 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
      if (sub_100004B4C((uint64_t)v124, 1, v125))
      {
        uint64_t v126 = sub_10000488C(&qword_100059310);
        memcpy(v123, v124, *(void *)(*(void *)(v126 - 8) + 64));
      }
      else
      {
        uint64_t v127 = v124[1];
        void *v123 = *v124;
        v123[1] = v127;
        uint64_t v128 = v124[3];
        v123[2] = v124[2];
        v123[3] = v128;
        *((unsigned char *)v123 + 32) = *((unsigned char *)v124 + 32);
        uint64_t v129 = *(int *)(v125 + 28);
        v130 = (char *)v123 + v129;
        uint64_t v131 = (char *)v124 + v129;
        swift_bridgeObjectRetain();
        v67((uint64_t)v130, (uint64_t)v131, v63);
        sub_100004938((uint64_t)v123, 0, 1, v125);
      }
      goto LABEL_46;
    default:
      uint64_t v4 = *(void *)a2;
      unint64_t v5 = *(void *)(a2 + 8);
      sub_1000197D8(*(void *)a2, v5);
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
      uint64_t v7 = a1 + v6;
      uint64_t v8 = a2 + v6;
      uint64_t v9 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
LABEL_46:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t sub_10001D070(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = *(void *)a2;
        unint64_t v11 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v11);
        *(void *)a1 = v10;
        *(void *)(a1 + 8) = v11;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        uint64_t v12 = *(void *)(a2 + 96);
        *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
        *(void *)(a1 + 96) = v12;
        *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
        uint64_t v13 = *(void *)(a2 + 112);
        *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
        *(void *)(a1 + 112) = v13;
        *(void *)(a1 + 128) = *(void *)(a2 + 128);
        *(void *)(a1 + 136) = *(void *)(a2 + 136);
        *(void *)(a1 + 144) = *(void *)(a2 + 144);
        uint64_t v14 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v158 = a2 + v14;
        uint64_t v160 = a1 + v14;
        uint64_t v15 = sub_100046870();
        uint64_t v154 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v154(v160, v158, v15);
        goto LABEL_47;
      case 2u:
        uint64_t v16 = *(void *)a2;
        unint64_t v17 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v17);
        *(void *)a1 = v16;
        *(void *)(a1 + 8) = v17;
        uint64_t v18 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v19 = a1 + v18;
        uint64_t v20 = a2 + v18;
        uint64_t v21 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
        goto LABEL_47;
      case 3u:
        uint64_t v22 = *(void *)a2;
        unint64_t v23 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v23);
        *(void *)a1 = v22;
        *(void *)(a1 + 8) = v23;
        uint64_t v24 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v25 = a1 + v24;
        uint64_t v26 = a2 + v24;
        uint64_t v27 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        goto LABEL_47;
      case 4u:
        uint64_t v28 = *(void *)a2;
        unint64_t v29 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v29);
        *(void *)a1 = v28;
        *(void *)(a1 + 8) = v29;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v30 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v31 = a1 + v30;
        uint64_t v32 = a2 + v30;
        uint64_t v33 = sub_100046870();
        uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16);
        swift_bridgeObjectRetain();
        v34(v31, v32, v33);
        goto LABEL_47;
      case 5u:
        uint64_t v35 = *(void *)a2;
        unint64_t v36 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v36);
        *(void *)a1 = v35;
        *(void *)(a1 + 8) = v36;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v37 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v38 = *(int *)(v37 + 24);
        uint64_t v39 = (void *)(a1 + v38);
        uint64_t v40 = (void *)(a2 + v38);
        uint64_t v41 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        swift_bridgeObjectRetain();
        if (sub_100004B4C((uint64_t)v40, 1, v41))
        {
          uint64_t v42 = sub_10000488C(&qword_1000592A0);
          memcpy(v39, v40, *(void *)(*(void *)(v42 - 8) + 64));
LABEL_46:
          uint64_t v148 = *(int *)(v37 + 28);
          uint64_t v149 = a1 + v148;
          uint64_t v150 = a2 + v148;
          uint64_t v151 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v151 - 8) + 16))(v149, v150, v151);
LABEL_47:
          swift_storeEnumTagMultiPayload();
          return a1;
        }
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          *(unsigned char *)uint64_t v39 = *(unsigned char *)v40;
          uint64_t v139 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
        }
        else
        {
          if (EnumCaseMultiPayload == 1)
          {
            *uint64_t v39 = *v40;
            v39[1] = v40[1];
            uint64_t v75 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v76 = *(int *)(v75 + 20);
            v156 = (char *)v39 + v76;
            uint64_t v159 = v75;
            uint64_t v153 = (char *)v40 + v76;
            uint64_t v77 = sub_100046870();
            uint64_t v78 = *(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16);
            swift_bridgeObjectRetain();
            uint64_t v79 = v156;
            uint64_t v157 = v77;
            v78(v79, v153, v77);
            uint64_t v80 = *(int *)(v159 + 24);
            uint64_t v81 = (void *)((char *)v39 + v80);
            uint64_t v82 = (void *)((char *)v40 + v80);
            uint64_t v83 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v82, 1, v83))
            {
              uint64_t v84 = sub_10000488C(&qword_1000592B8);
              memcpy(v81, v82, *(void *)(*(void *)(v84 - 8) + 64));
            }
            else
            {
              *uint64_t v81 = *v82;
              v81[1] = v82[1];
              uint64_t v145 = *(int *)(v83 + 20);
              uint64_t v146 = (char *)v81 + v145;
              uint64_t v147 = (char *)v82 + v145;
              swift_bridgeObjectRetain();
              v78(v146, v147, v157);
              sub_100004938((uint64_t)v81, 0, 1, v83);
            }
            goto LABEL_45;
          }
          uint64_t v140 = *v40;
          *((unsigned char *)v39 + 8) = *((unsigned char *)v40 + 8);
          *uint64_t v39 = v140;
          uint64_t v139 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        }
        uint64_t v141 = *(int *)(v139 + 20);
        uint64_t v142 = (char *)v39 + v141;
        v143 = (char *)v40 + v141;
        uint64_t v144 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 16))(v142, v143, v144);
LABEL_45:
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v39, 0, 1, v41);
        goto LABEL_46;
      case 6u:
        uint64_t v43 = *(void *)a2;
        unint64_t v44 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v44);
        *(void *)a1 = v43;
        *(void *)(a1 + 8) = v44;
        uint64_t v45 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v46 = v45[5];
        uint64_t v47 = (unsigned char *)(a1 + v46);
        uint64_t v48 = (unsigned char *)(a2 + v46);
        uint64_t v49 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v48, 1, v49))
        {
          uint64_t v50 = sub_10000488C(&qword_1000592C8);
          memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v85 = *(void *)v48;
            v47[8] = v48[8];
            *(void *)uint64_t v47 = v85;
            uint64_t v86 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                         + 20);
          }
          else
          {
            *uint64_t v47 = *v48;
            uint64_t v86 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                         + 20);
          }
          uint64_t v87 = &v47[v86];
          uint64_t v88 = &v48[v86];
          uint64_t v89 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v89 - 8) + 16))(v87, v88, v89);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v47, 0, 1, v49);
        }
        uint64_t v90 = v45[6];
        uint64_t v91 = a1 + v90;
        uint64_t v92 = a2 + v90;
        uint64_t v93 = sub_100046870();
        uint64_t v94 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 16);
        v94(v91, v92, v93);
        uint64_t v95 = v45[7];
        uint64_t v96 = (void *)(a1 + v95);
        uint64_t v97 = (void *)(a2 + v95);
        uint64_t v98 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v97, 1, (uint64_t)v98))
        {
          uint64_t v99 = sub_10000488C(&qword_1000592D8);
          memcpy(v96, v97, *(void *)(*(void *)(v99 - 8) + 64));
        }
        else
        {
          *uint64_t v96 = *v97;
          v94((uint64_t)v96 + v98[5], (uint64_t)v97 + v98[5], v93);
          uint64_t v100 = v98[6];
          v101 = v94;
          v102 = (void *)((char *)v96 + v100);
          uint64_t v103 = (void *)((char *)v97 + v100);
          uint64_t v104 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          uint64_t v162 = (void (*)(char *, char *, uint64_t))v101;
          if (sub_100004B4C((uint64_t)v103, 1, v104))
          {
            uint64_t v105 = sub_10000488C(&qword_1000592F8);
            memcpy(v102, v103, *(void *)(*(void *)(v105 - 8) + 64));
          }
          else
          {
            uint64_t v128 = *v103;
            *((unsigned char *)v102 + 8) = *((unsigned char *)v103 + 8);
            void *v102 = v128;
            uint64_t v129 = v103[2];
            *((unsigned char *)v102 + 24) = *((unsigned char *)v103 + 24);
            v102[2] = v129;
            uint64_t v130 = v103[4];
            *((unsigned char *)v102 + 40) = *((unsigned char *)v103 + 40);
            v102[4] = v130;
            v101((uint64_t)v102 + *(int *)(v104 + 28), (uint64_t)v103 + *(int *)(v104 + 28), v93);
            sub_100004938((uint64_t)v102, 0, 1, v104);
          }
          uint64_t v131 = v98[7];
          uint64_t v132 = (void *)((char *)v96 + v131);
          v133 = (void *)((char *)v97 + v131);
          uint64_t v134 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v133, 1, v134))
          {
            uint64_t v135 = sub_10000488C(&qword_1000592E8);
            memcpy(v132, v133, *(void *)(*(void *)(v135 - 8) + 64));
          }
          else
          {
            void *v132 = *v133;
            v132[1] = v133[1];
            v132[2] = v133[2];
            uint64_t v136 = *(int *)(v134 + 24);
            uint64_t v137 = (char *)v132 + v136;
            uint64_t v138 = (char *)v133 + v136;
            swift_bridgeObjectRetain();
            v162(v137, v138, v93);
            sub_100004938((uint64_t)v132, 0, 1, v134);
          }
          sub_100004938((uint64_t)v96, 0, 1, (uint64_t)v98);
        }
        goto LABEL_47;
      case 7u:
        uint64_t v51 = *(void *)a2;
        unint64_t v52 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v52);
        *(void *)a1 = v51;
        *(void *)(a1 + 8) = v52;
        uint64_t v53 = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
        *(void *)(a1 + 16) = v53;
        uint64_t v54 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v55 = v54[6];
        uint64_t v56 = a1 + v55;
        uint64_t v57 = a2 + v55;
        uint64_t v58 = sub_100046870();
        uint64_t v59 = v56;
        uint64_t v60 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 16);
        uint64_t v61 = v57;
        uint64_t v62 = *v60;
        (*v60)(v59, v61, v58);
        uint64_t v63 = v54[7];
        uint64_t v64 = (void *)(a1 + v63);
        uint64_t v65 = (void *)(a2 + v63);
        uint64_t v66 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v65, 1, (uint64_t)v66))
        {
          uint64_t v67 = sub_10000488C(&qword_1000592D8);
          memcpy(v64, v65, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          *uint64_t v64 = *v65;
          v62((uint64_t)v64 + v66[5], (uint64_t)v65 + v66[5], v58);
          uint64_t v68 = v66[6];
          uint64_t v69 = (void *)((char *)v64 + v68);
          uint64_t v155 = v58;
          uint64_t v70 = (void *)((char *)v65 + v68);
          uint64_t v71 = v62;
          uint64_t v72 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          uint64_t v161 = v71;
          if (sub_100004B4C((uint64_t)v70, 1, v72))
          {
            uint64_t v73 = sub_10000488C(&qword_1000592F8);
            memcpy(v69, v70, *(void *)(*(void *)(v73 - 8) + 64));
            uint64_t v58 = v155;
          }
          else
          {
            uint64_t v106 = *v70;
            *((unsigned char *)v69 + 8) = *((unsigned char *)v70 + 8);
            *uint64_t v69 = v106;
            uint64_t v107 = v70[2];
            *((unsigned char *)v69 + 24) = *((unsigned char *)v70 + 24);
            v69[2] = v107;
            uint64_t v108 = v70[4];
            *((unsigned char *)v69 + 40) = *((unsigned char *)v70 + 40);
            v69[4] = v108;
            uint64_t v109 = *(int *)(v72 + 28);
            uint64_t v110 = (char *)v70 + v109;
            uint64_t v58 = v155;
            v71((uint64_t)v69 + v109, (uint64_t)v110, v155);
            sub_100004938((uint64_t)v69, 0, 1, v72);
          }
          uint64_t v111 = v66[7];
          v112 = (void *)((char *)v64 + v111);
          uint64_t v113 = (void *)((char *)v65 + v111);
          uint64_t v114 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v113, 1, v114))
          {
            uint64_t v115 = sub_10000488C(&qword_1000592E8);
            memcpy(v112, v113, *(void *)(*(void *)(v115 - 8) + 64));
          }
          else
          {
            void *v112 = *v113;
            v112[1] = v113[1];
            v112[2] = v113[2];
            uint64_t v116 = *(int *)(v114 + 24);
            uint64_t v117 = (char *)v112 + v116;
            uint64_t v118 = (char *)v113 + v116;
            swift_bridgeObjectRetain();
            v161((uint64_t)v117, (uint64_t)v118, v58);
            sub_100004938((uint64_t)v112, 0, 1, v114);
          }
          sub_100004938((uint64_t)v64, 0, 1, (uint64_t)v66);
          uint64_t v62 = v161;
        }
        uint64_t v119 = v54[8];
        v120 = (void *)(a1 + v119);
        uint64_t v121 = (void *)(a2 + v119);
        uint64_t v122 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v121, 1, v122))
        {
          uint64_t v123 = sub_10000488C(&qword_100059310);
          memcpy(v120, v121, *(void *)(*(void *)(v123 - 8) + 64));
        }
        else
        {
          void *v120 = *v121;
          v120[1] = v121[1];
          v120[2] = v121[2];
          uint64_t v124 = v121[3];
          *((unsigned char *)v120 + 32) = *((unsigned char *)v121 + 32);
          v120[3] = v124;
          uint64_t v125 = *(int *)(v122 + 28);
          uint64_t v126 = (char *)v120 + v125;
          uint64_t v127 = (char *)v121 + v125;
          swift_bridgeObjectRetain();
          v62((uint64_t)v126, (uint64_t)v127, v58);
          sub_100004938((uint64_t)v120, 0, 1, v122);
        }
        goto LABEL_47;
      default:
        uint64_t v4 = *(void *)a2;
        unint64_t v5 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v5);
        *(void *)a1 = v4;
        *(void *)(a1 + 8) = v5;
        uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v7 = a1 + v6;
        uint64_t v8 = a2 + v6;
        uint64_t v9 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
        goto LABEL_47;
    }
  }
  return a1;
}

uint64_t sub_10001DEB0(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      long long v8 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      long long v9 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v9;
      long long v10 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 80) = v10;
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
      uint64_t v11 = *(void *)(a2 + 112);
      *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
      *(void *)(a1 + 112) = v11;
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      uint64_t v12 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
      uint64_t v13 = a1 + v12;
      uint64_t v14 = a2 + v12;
      uint64_t v15 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      goto LABEL_45;
    case 2u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
      uint64_t v17 = a1 + v16;
      uint64_t v18 = a2 + v16;
      uint64_t v19 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      goto LABEL_45;
    case 3u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      uint64_t v23 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
      goto LABEL_45;
    case 4u:
      long long v24 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v24;
      uint64_t v25 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
      uint64_t v26 = a1 + v25;
      uint64_t v27 = a2 + v25;
      uint64_t v28 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
      goto LABEL_45;
    case 5u:
      long long v29 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v29;
      uint64_t v30 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
      uint64_t v31 = *(int *)(v30 + 24);
      uint64_t v32 = (unsigned char *)(a1 + v31);
      uint64_t v33 = (unsigned char *)(a2 + v31);
      uint64_t v34 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
      if (sub_100004B4C((uint64_t)v33, 1, v34))
      {
        uint64_t v35 = sub_10000488C(&qword_1000592A0);
        memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
LABEL_44:
        uint64_t v111 = *(int *)(v30 + 28);
        uint64_t v112 = a1 + v111;
        uint64_t v113 = a2 + v111;
        uint64_t v114 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 32))(v112, v113, v114);
        goto LABEL_45;
      }
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        *uint64_t v32 = *v33;
        uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
      }
      else
      {
        if (EnumCaseMultiPayload == 1)
        {
          *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
          uint64_t v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
          uint64_t v60 = *(int *)(v59 + 20);
          uint64_t v61 = &v32[v60];
          uint64_t v119 = &v33[v60];
          uint64_t v62 = sub_100046870();
          uint64_t v63 = v119;
          uint64_t v118 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32);
          uint64_t v120 = v62;
          ((void (*)(unsigned char *, unsigned char *))v118)(v61, v63);
          uint64_t v64 = *(int *)(v59 + 24);
          uint64_t v65 = &v32[v64];
          uint64_t v66 = &v33[v64];
          uint64_t v67 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
          if (sub_100004B4C((uint64_t)v66, 1, v67))
          {
            uint64_t v68 = sub_10000488C(&qword_1000592B8);
            memcpy(v65, v66, *(void *)(*(void *)(v68 - 8) + 64));
          }
          else
          {
            *uint64_t v65 = *v66;
            v118((char *)v65 + *(int *)(v67 + 20), (char *)v66 + *(int *)(v67 + 20), v120);
            sub_100004938((uint64_t)v65, 0, 1, v67);
          }
          goto LABEL_43;
        }
        *(void *)uint64_t v32 = *(void *)v33;
        v32[8] = v33[8];
        uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
      }
      uint64_t v107 = *(int *)(v106 + 20);
      uint64_t v108 = &v32[v107];
      uint64_t v109 = &v33[v107];
      uint64_t v110 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v110 - 8) + 32))(v108, v109, v110);
LABEL_43:
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v32, 0, 1, v34);
      goto LABEL_44;
    case 6u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      unint64_t v36 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
      uint64_t v37 = v36[5];
      uint64_t v38 = (unsigned char *)(a1 + v37);
      uint64_t v39 = (unsigned char *)(a2 + v37);
      uint64_t v40 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
      if (sub_100004B4C((uint64_t)v39, 1, v40))
      {
        uint64_t v41 = sub_10000488C(&qword_1000592C8);
        memcpy(v38, v39, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          *(void *)uint64_t v38 = *(void *)v39;
          v38[8] = v39[8];
          uint64_t v69 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                       + 20);
        }
        else
        {
          unsigned char *v38 = *v39;
          uint64_t v69 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                       + 20);
        }
        uint64_t v70 = &v38[v69];
        uint64_t v71 = &v39[v69];
        uint64_t v72 = sub_100046870();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v38, 0, 1, v40);
      }
      uint64_t v73 = v36[6];
      uint64_t v74 = a1 + v73;
      uint64_t v75 = a2 + v73;
      uint64_t v76 = sub_100046870();
      uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 32);
      v77(v74, v75, v76);
      uint64_t v78 = v36[7];
      uint64_t v79 = (void *)(a1 + v78);
      uint64_t v80 = (void *)(a2 + v78);
      uint64_t v81 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      if (sub_100004B4C((uint64_t)v80, 1, (uint64_t)v81))
      {
        uint64_t v82 = sub_10000488C(&qword_1000592D8);
        memcpy(v79, v80, *(void *)(*(void *)(v82 - 8) + 64));
      }
      else
      {
        *uint64_t v79 = *v80;
        v77((uint64_t)v79 + v81[5], (uint64_t)v80 + v81[5], v76);
        uint64_t v83 = v81[6];
        uint64_t v84 = (void *)((char *)v79 + v83);
        uint64_t v121 = (void (*)(char *, char *, uint64_t))v77;
        uint64_t v85 = (void *)((char *)v80 + v83);
        uint64_t v86 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        if (sub_100004B4C((uint64_t)v85, 1, v86))
        {
          uint64_t v87 = sub_10000488C(&qword_1000592F8);
          memcpy(v84, v85, *(void *)(*(void *)(v87 - 8) + 64));
        }
        else
        {
          *uint64_t v84 = *v85;
          *((unsigned char *)v84 + 8) = *((unsigned char *)v85 + 8);
          v84[2] = v85[2];
          *((unsigned char *)v84 + 24) = *((unsigned char *)v85 + 24);
          v84[4] = v85[4];
          *((unsigned char *)v84 + 40) = *((unsigned char *)v85 + 40);
          v121((char *)v84 + *(int *)(v86 + 28), (char *)v85 + *(int *)(v86 + 28), v76);
          sub_100004938((uint64_t)v84, 0, 1, v86);
        }
        uint64_t v101 = v81[7];
        v102 = (void *)((char *)v79 + v101);
        uint64_t v103 = (void *)((char *)v80 + v101);
        uint64_t v104 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        if (sub_100004B4C((uint64_t)v103, 1, v104))
        {
          uint64_t v105 = sub_10000488C(&qword_1000592E8);
          memcpy(v102, v103, *(void *)(*(void *)(v105 - 8) + 64));
        }
        else
        {
          *(_OWORD *)v102 = *(_OWORD *)v103;
          v102[2] = v103[2];
          v121((char *)v102 + *(int *)(v104 + 24), (char *)v103 + *(int *)(v104 + 24), v76);
          sub_100004938((uint64_t)v102, 0, 1, v104);
        }
        sub_100004938((uint64_t)v79, 0, 1, (uint64_t)v81);
      }
      goto LABEL_45;
    case 7u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
      uint64_t v42 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
      uint64_t v43 = v42[6];
      uint64_t v44 = a1 + v43;
      uint64_t v45 = a2 + v43;
      uint64_t v46 = sub_100046870();
      uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32);
      v47(v44, v45, v46);
      uint64_t v48 = v42[7];
      uint64_t v49 = (void *)(a1 + v48);
      uint64_t v50 = (void *)(a2 + v48);
      uint64_t v51 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
      if (sub_100004B4C((uint64_t)v50, 1, (uint64_t)v51))
      {
        uint64_t v52 = sub_10000488C(&qword_1000592D8);
        memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        *uint64_t v49 = *v50;
        v47((uint64_t)v49 + v51[5], (uint64_t)v50 + v51[5], v46);
        uint64_t v53 = v51[6];
        uint64_t v116 = v46;
        uint64_t v117 = (void (*)(char *, char *, uint64_t))v47;
        uint64_t v54 = (void *)((char *)v49 + v53);
        uint64_t v55 = (void *)((char *)v50 + v53);
        uint64_t v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        if (sub_100004B4C((uint64_t)v55, 1, v56))
        {
          uint64_t v57 = sub_10000488C(&qword_1000592F8);
          memcpy(v54, v55, *(void *)(*(void *)(v57 - 8) + 64));
          uint64_t v46 = v116;
        }
        else
        {
          *uint64_t v54 = *v55;
          *((unsigned char *)v54 + 8) = *((unsigned char *)v55 + 8);
          v54[2] = v55[2];
          *((unsigned char *)v54 + 24) = *((unsigned char *)v55 + 24);
          v54[4] = v55[4];
          *((unsigned char *)v54 + 40) = *((unsigned char *)v55 + 40);
          uint64_t v88 = *(int *)(v56 + 28);
          uint64_t v89 = (char *)v55 + v88;
          uint64_t v46 = v116;
          v117((char *)v54 + v88, v89, v116);
          sub_100004938((uint64_t)v54, 0, 1, v56);
        }
        uint64_t v90 = v51[7];
        uint64_t v91 = (void *)((char *)v49 + v90);
        uint64_t v92 = (void *)((char *)v50 + v90);
        uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        if (sub_100004B4C((uint64_t)v92, 1, v93))
        {
          uint64_t v94 = sub_10000488C(&qword_1000592E8);
          memcpy(v91, v92, *(void *)(*(void *)(v94 - 8) + 64));
        }
        else
        {
          *(_OWORD *)uint64_t v91 = *(_OWORD *)v92;
          v91[2] = v92[2];
          v117((char *)v91 + *(int *)(v93 + 24), (char *)v92 + *(int *)(v93 + 24), v46);
          sub_100004938((uint64_t)v91, 0, 1, v93);
        }
        sub_100004938((uint64_t)v49, 0, 1, (uint64_t)v51);
        uint64_t v47 = (void (*)(uint64_t, uint64_t, uint64_t))v117;
      }
      uint64_t v95 = v42[8];
      uint64_t v96 = (_OWORD *)(a1 + v95);
      uint64_t v97 = (_OWORD *)(a2 + v95);
      uint64_t v98 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
      if (sub_100004B4C((uint64_t)v97, 1, v98))
      {
        uint64_t v99 = sub_10000488C(&qword_100059310);
        memcpy(v96, v97, *(void *)(*(void *)(v99 - 8) + 64));
      }
      else
      {
        *uint64_t v96 = *v97;
        uint64_t v100 = *((void *)v97 + 3);
        *((void *)v96 + 2) = *((void *)v97 + 2);
        *((void *)v96 + 3) = v100;
        *((unsigned char *)v96 + 32) = *((unsigned char *)v97 + 32);
        v47((uint64_t)v96 + *(int *)(v98 + 28), (uint64_t)v97 + *(int *)(v98 + 28), v46);
        sub_100004938((uint64_t)v96, 0, 1, v98);
      }
      goto LABEL_45;
    default:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
      uint64_t v5 = a1 + v4;
      uint64_t v6 = a2 + v4;
      uint64_t v7 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
LABEL_45:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

uint64_t sub_10001EB10(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        long long v8 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v8;
        long long v9 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v9;
        long long v10 = *(_OWORD *)(a2 + 80);
        *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
        *(_OWORD *)(a1 + 80) = v10;
        *(void *)(a1 + 96) = *(void *)(a2 + 96);
        *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
        uint64_t v11 = *(void *)(a2 + 112);
        *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
        *(void *)(a1 + 112) = v11;
        *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
        *(void *)(a1 + 144) = *(void *)(a2 + 144);
        uint64_t v12 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v13 = a1 + v12;
        uint64_t v14 = a2 + v12;
        uint64_t v15 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
        goto LABEL_46;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v17 = a1 + v16;
        uint64_t v18 = a2 + v16;
        uint64_t v19 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
        goto LABEL_46;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v21 = a1 + v20;
        uint64_t v22 = a2 + v20;
        uint64_t v23 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
        goto LABEL_46;
      case 4u:
        long long v24 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v24;
        uint64_t v25 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v26 = a1 + v25;
        uint64_t v27 = a2 + v25;
        uint64_t v28 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
        goto LABEL_46;
      case 5u:
        long long v29 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v29;
        uint64_t v30 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v31 = *(int *)(v30 + 24);
        uint64_t v32 = (unsigned char *)(a1 + v31);
        uint64_t v33 = (unsigned char *)(a2 + v31);
        uint64_t v34 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v33, 1, v34))
        {
          uint64_t v35 = sub_10000488C(&qword_1000592A0);
          memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
LABEL_45:
          uint64_t v111 = *(int *)(v30 + 28);
          uint64_t v112 = a1 + v111;
          uint64_t v113 = a2 + v111;
          uint64_t v114 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 32))(v112, v113, v114);
LABEL_46:
          swift_storeEnumTagMultiPayload();
          return a1;
        }
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          *uint64_t v32 = *v33;
          uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
        }
        else
        {
          if (EnumCaseMultiPayload == 1)
          {
            *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
            uint64_t v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v60 = *(int *)(v59 + 20);
            uint64_t v61 = &v32[v60];
            uint64_t v119 = &v33[v60];
            uint64_t v62 = sub_100046870();
            uint64_t v63 = v119;
            uint64_t v118 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32);
            uint64_t v120 = v62;
            ((void (*)(unsigned char *, unsigned char *))v118)(v61, v63);
            uint64_t v64 = *(int *)(v59 + 24);
            uint64_t v65 = &v32[v64];
            uint64_t v66 = &v33[v64];
            uint64_t v67 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v66, 1, v67))
            {
              uint64_t v68 = sub_10000488C(&qword_1000592B8);
              memcpy(v65, v66, *(void *)(*(void *)(v68 - 8) + 64));
            }
            else
            {
              *uint64_t v65 = *v66;
              v118((char *)v65 + *(int *)(v67 + 20), (char *)v66 + *(int *)(v67 + 20), v120);
              sub_100004938((uint64_t)v65, 0, 1, v67);
            }
            goto LABEL_44;
          }
          *(void *)uint64_t v32 = *(void *)v33;
          v32[8] = v33[8];
          uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        }
        uint64_t v107 = *(int *)(v106 + 20);
        uint64_t v108 = &v32[v107];
        uint64_t v109 = &v33[v107];
        uint64_t v110 = sub_100046870();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v110 - 8) + 32))(v108, v109, v110);
LABEL_44:
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v32, 0, 1, v34);
        goto LABEL_45;
      case 6u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        unint64_t v36 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v37 = v36[5];
        uint64_t v38 = (unsigned char *)(a1 + v37);
        uint64_t v39 = (unsigned char *)(a2 + v37);
        uint64_t v40 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v39, 1, v40))
        {
          uint64_t v41 = sub_10000488C(&qword_1000592C8);
          memcpy(v38, v39, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            *(void *)uint64_t v38 = *(void *)v39;
            v38[8] = v39[8];
            uint64_t v69 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                         + 20);
          }
          else
          {
            unsigned char *v38 = *v39;
            uint64_t v69 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                         + 20);
          }
          uint64_t v70 = &v38[v69];
          uint64_t v71 = &v39[v69];
          uint64_t v72 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v38, 0, 1, v40);
        }
        uint64_t v73 = v36[6];
        uint64_t v74 = a1 + v73;
        uint64_t v75 = a2 + v73;
        uint64_t v76 = sub_100046870();
        uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 32);
        v77(v74, v75, v76);
        uint64_t v78 = v36[7];
        uint64_t v79 = (void *)(a1 + v78);
        uint64_t v80 = (void *)(a2 + v78);
        uint64_t v81 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v80, 1, (uint64_t)v81))
        {
          uint64_t v82 = sub_10000488C(&qword_1000592D8);
          memcpy(v79, v80, *(void *)(*(void *)(v82 - 8) + 64));
        }
        else
        {
          *uint64_t v79 = *v80;
          v77((uint64_t)v79 + v81[5], (uint64_t)v80 + v81[5], v76);
          uint64_t v83 = v81[6];
          uint64_t v84 = (void *)((char *)v79 + v83);
          uint64_t v121 = (void (*)(char *, char *, uint64_t))v77;
          uint64_t v85 = (void *)((char *)v80 + v83);
          uint64_t v86 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v85, 1, v86))
          {
            uint64_t v87 = sub_10000488C(&qword_1000592F8);
            memcpy(v84, v85, *(void *)(*(void *)(v87 - 8) + 64));
          }
          else
          {
            *uint64_t v84 = *v85;
            *((unsigned char *)v84 + 8) = *((unsigned char *)v85 + 8);
            v84[2] = v85[2];
            *((unsigned char *)v84 + 24) = *((unsigned char *)v85 + 24);
            v84[4] = v85[4];
            *((unsigned char *)v84 + 40) = *((unsigned char *)v85 + 40);
            v121((char *)v84 + *(int *)(v86 + 28), (char *)v85 + *(int *)(v86 + 28), v76);
            sub_100004938((uint64_t)v84, 0, 1, v86);
          }
          uint64_t v101 = v81[7];
          v102 = (void *)((char *)v79 + v101);
          uint64_t v103 = (void *)((char *)v80 + v101);
          uint64_t v104 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v103, 1, v104))
          {
            uint64_t v105 = sub_10000488C(&qword_1000592E8);
            memcpy(v102, v103, *(void *)(*(void *)(v105 - 8) + 64));
          }
          else
          {
            *(_OWORD *)v102 = *(_OWORD *)v103;
            v102[2] = v103[2];
            v121((char *)v102 + *(int *)(v104 + 24), (char *)v103 + *(int *)(v104 + 24), v76);
            sub_100004938((uint64_t)v102, 0, 1, v104);
          }
          sub_100004938((uint64_t)v79, 0, 1, (uint64_t)v81);
        }
        goto LABEL_46;
      case 7u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
        uint64_t v42 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v43 = v42[6];
        uint64_t v44 = a1 + v43;
        uint64_t v45 = a2 + v43;
        uint64_t v46 = sub_100046870();
        uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32);
        v47(v44, v45, v46);
        uint64_t v48 = v42[7];
        uint64_t v49 = (void *)(a1 + v48);
        uint64_t v50 = (void *)(a2 + v48);
        uint64_t v51 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v50, 1, (uint64_t)v51))
        {
          uint64_t v52 = sub_10000488C(&qword_1000592D8);
          memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
        }
        else
        {
          *uint64_t v49 = *v50;
          v47((uint64_t)v49 + v51[5], (uint64_t)v50 + v51[5], v46);
          uint64_t v53 = v51[6];
          uint64_t v116 = v46;
          uint64_t v117 = (void (*)(char *, char *, uint64_t))v47;
          uint64_t v54 = (void *)((char *)v49 + v53);
          uint64_t v55 = (void *)((char *)v50 + v53);
          uint64_t v56 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v55, 1, v56))
          {
            uint64_t v57 = sub_10000488C(&qword_1000592F8);
            memcpy(v54, v55, *(void *)(*(void *)(v57 - 8) + 64));
            uint64_t v46 = v116;
          }
          else
          {
            *uint64_t v54 = *v55;
            *((unsigned char *)v54 + 8) = *((unsigned char *)v55 + 8);
            v54[2] = v55[2];
            *((unsigned char *)v54 + 24) = *((unsigned char *)v55 + 24);
            v54[4] = v55[4];
            *((unsigned char *)v54 + 40) = *((unsigned char *)v55 + 40);
            uint64_t v88 = *(int *)(v56 + 28);
            uint64_t v89 = (char *)v55 + v88;
            uint64_t v46 = v116;
            v117((char *)v54 + v88, v89, v116);
            sub_100004938((uint64_t)v54, 0, 1, v56);
          }
          uint64_t v90 = v51[7];
          uint64_t v91 = (void *)((char *)v49 + v90);
          uint64_t v92 = (void *)((char *)v50 + v90);
          uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v92, 1, v93))
          {
            uint64_t v94 = sub_10000488C(&qword_1000592E8);
            memcpy(v91, v92, *(void *)(*(void *)(v94 - 8) + 64));
          }
          else
          {
            *(_OWORD *)uint64_t v91 = *(_OWORD *)v92;
            v91[2] = v92[2];
            v117((char *)v91 + *(int *)(v93 + 24), (char *)v92 + *(int *)(v93 + 24), v46);
            sub_100004938((uint64_t)v91, 0, 1, v93);
          }
          sub_100004938((uint64_t)v49, 0, 1, (uint64_t)v51);
          uint64_t v47 = (void (*)(uint64_t, uint64_t, uint64_t))v117;
        }
        uint64_t v95 = v42[8];
        uint64_t v96 = (_OWORD *)(a1 + v95);
        uint64_t v97 = (_OWORD *)(a2 + v95);
        uint64_t v98 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v97, 1, v98))
        {
          uint64_t v99 = sub_10000488C(&qword_100059310);
          memcpy(v96, v97, *(void *)(*(void *)(v99 - 8) + 64));
        }
        else
        {
          *uint64_t v96 = *v97;
          uint64_t v100 = *((void *)v97 + 3);
          *((void *)v96 + 2) = *((void *)v97 + 2);
          *((void *)v96 + 3) = v100;
          *((unsigned char *)v96 + 32) = *((unsigned char *)v97 + 32);
          v47((uint64_t)v96 + *(int *)(v98 + 28), (uint64_t)v97 + *(int *)(v98 + 28), v46);
          sub_100004938((uint64_t)v96, 0, 1, v98);
        }
        goto LABEL_46;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v4 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v5 = a1 + v4;
        uint64_t v6 = a2 + v4;
        uint64_t v7 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
        goto LABEL_46;
    }
  }
  return a1;
}

uint64_t sub_10001F794()
{
  uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(319);
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(319);
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(319);
            if (v6 <= 0x3F)
            {
              uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(319);
              if (v7 <= 0x3F)
              {
                uint64_t result = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(319);
                if (v8 <= 0x3F)
                {
                  swift_initEnumMetadataMultiPayload();
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001F9C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
    if (sub_100004B4C((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = sub_10000488C(&qword_100059228);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = *a2;
          unint64_t v17 = a2[1];
          sub_1000197D8(*a2, v17);
          *a1 = v16;
          a1[1] = v17;
          uint64_t v18 = a2[3];
          a1[2] = a2[2];
          a1[3] = v18;
          uint64_t v19 = a2[5];
          a1[4] = a2[4];
          a1[5] = v19;
          uint64_t v20 = a2[7];
          a1[6] = a2[6];
          a1[7] = v20;
          uint64_t v21 = a2[9];
          a1[8] = a2[8];
          a1[9] = v21;
          uint64_t v22 = a2[11];
          a1[10] = a2[10];
          a1[11] = v22;
          a1[12] = a2[12];
          *((_WORD *)a1 + 52) = *((_WORD *)a2 + 52);
          a1[14] = a2[14];
          *((unsigned char *)a1 + 120) = *((unsigned char *)a2 + 120);
          uint64_t v23 = a2[17];
          a1[16] = a2[16];
          a1[17] = v23;
          a1[18] = a2[18];
          uint64_t v24 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
          uint64_t v159 = (char *)a2 + v24;
          uint64_t v162 = (char *)a1 + v24;
          uint64_t v25 = sub_100046870();
          uint64_t v157 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v157(v162, v159, v25);
          break;
        case 2u:
          uint64_t v26 = *a2;
          unint64_t v27 = a2[1];
          sub_1000197D8(*a2, v27);
          *a1 = v26;
          a1[1] = v27;
          uint64_t v28 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
          long long v29 = (char *)a1 + v28;
          uint64_t v30 = (char *)a2 + v28;
          uint64_t v31 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
          break;
        case 3u:
          uint64_t v32 = *a2;
          unint64_t v33 = a2[1];
          sub_1000197D8(*a2, v33);
          *a1 = v32;
          a1[1] = v33;
          uint64_t v34 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
          uint64_t v35 = (char *)a1 + v34;
          unint64_t v36 = (char *)a2 + v34;
          uint64_t v37 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
          break;
        case 4u:
          uint64_t v38 = *a2;
          unint64_t v39 = a2[1];
          sub_1000197D8(*a2, v39);
          *a1 = v38;
          a1[1] = v39;
          uint64_t v40 = a2[3];
          a1[2] = a2[2];
          a1[3] = v40;
          uint64_t v41 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
          uint64_t v42 = (char *)a1 + v41;
          uint64_t v43 = (char *)a2 + v41;
          uint64_t v44 = sub_100046870();
          uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
          swift_bridgeObjectRetain();
          v45(v42, v43, v44);
          break;
        case 5u:
          uint64_t v46 = *a2;
          unint64_t v47 = a2[1];
          sub_1000197D8(*a2, v47);
          *a1 = v46;
          a1[1] = v47;
          uint64_t v48 = a2[3];
          a1[2] = a2[2];
          a1[3] = v48;
          uint64_t v49 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
          uint64_t v50 = *(int *)(v49 + 24);
          uint64_t v51 = (uint64_t *)((char *)a1 + v50);
          uint64_t v52 = (uint64_t *)((char *)a2 + v50);
          uint64_t v53 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
          swift_bridgeObjectRetain();
          if (sub_100004B4C((uint64_t)v52, 1, v53))
          {
            uint64_t v54 = sub_10000488C(&qword_1000592A0);
            memcpy(v51, v52, *(void *)(*(void *)(v54 - 8) + 64));
          }
          else
          {
            int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
            if (EnumCaseMultiPayload == 2)
            {
              *(unsigned char *)uint64_t v51 = *(unsigned char *)v52;
              uint64_t v136 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                            + 20);
              uint64_t v137 = (char *)v51 + v136;
              uint64_t v138 = (char *)v52 + v136;
              uint64_t v139 = sub_100046870();
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 16))(v137, v138, v139);
            }
            else if (EnumCaseMultiPayload == 1)
            {
              uint64_t v83 = v52[1];
              *uint64_t v51 = *v52;
              v51[1] = v83;
              uint64_t v163 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
              uint64_t v84 = *(int *)(v163 + 20);
              v156 = (char *)v52 + v84;
              uint64_t v158 = (char *)v51 + v84;
              uint64_t v85 = sub_100046870();
              v169 = *(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16);
              swift_bridgeObjectRetain();
              uint64_t v161 = v85;
              v169(v158, v156, v85);
              uint64_t v86 = *(int *)(v163 + 24);
              uint64_t v87 = (void *)((char *)v51 + v86);
              uint64_t v88 = (void *)((char *)v52 + v86);
              uint64_t v89 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
              if (sub_100004B4C((uint64_t)v88, 1, v89))
              {
                uint64_t v90 = sub_10000488C(&qword_1000592B8);
                memcpy(v87, v88, *(void *)(*(void *)(v90 - 8) + 64));
              }
              else
              {
                uint64_t v144 = v88[1];
                *uint64_t v87 = *v88;
                v87[1] = v144;
                uint64_t v145 = *(int *)(v89 + 20);
                v166 = (char *)v87 + v145;
                uint64_t v146 = (char *)v88 + v145;
                swift_bridgeObjectRetain();
                v169(v166, v146, v161);
                sub_100004938((uint64_t)v87, 0, 1, v89);
              }
            }
            else
            {
              *uint64_t v51 = *v52;
              *((unsigned char *)v51 + 8) = *((unsigned char *)v52 + 8);
              uint64_t v140 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                            + 20);
              uint64_t v141 = (char *)v51 + v140;
              uint64_t v142 = (char *)v52 + v140;
              uint64_t v143 = sub_100046870();
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v143 - 8) + 16))(v141, v142, v143);
            }
            swift_storeEnumTagMultiPayload();
            sub_100004938((uint64_t)v51, 0, 1, v53);
          }
          uint64_t v147 = *(int *)(v49 + 28);
          uint64_t v148 = (char *)a1 + v147;
          uint64_t v149 = (char *)a2 + v147;
          uint64_t v150 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v150 - 8) + 16))(v148, v149, v150);
          break;
        case 6u:
          uint64_t v55 = *a2;
          unint64_t v56 = a2[1];
          sub_1000197D8(*a2, v56);
          *a1 = v55;
          a1[1] = v56;
          uint64_t v57 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
          uint64_t v58 = v57[5];
          uint64_t v59 = (char *)a1 + v58;
          uint64_t v60 = (char *)a2 + v58;
          uint64_t v61 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
          if (sub_100004B4C((uint64_t)v60, 1, v61))
          {
            uint64_t v62 = sub_10000488C(&qword_1000592C8);
            memcpy(v59, v60, *(void *)(*(void *)(v62 - 8) + 64));
          }
          else
          {
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              *(void *)uint64_t v59 = *(void *)v60;
              v59[8] = v60[8];
              uint64_t v91 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                           + 20);
            }
            else
            {
              *uint64_t v59 = *v60;
              uint64_t v91 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                           + 20);
            }
            uint64_t v92 = &v59[v91];
            uint64_t v93 = &v60[v91];
            uint64_t v94 = sub_100046870();
            (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v94 - 8) + 16))(v92, v93, v94);
            swift_storeEnumTagMultiPayload();
            sub_100004938((uint64_t)v59, 0, 1, v61);
          }
          uint64_t v95 = v57[6];
          uint64_t v96 = (char *)a1 + v95;
          uint64_t v97 = (char *)a2 + v95;
          uint64_t v98 = sub_100046870();
          uint64_t v99 = *(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 16);
          v99(v96, v97, v98);
          uint64_t v100 = v57[7];
          uint64_t v101 = (uint64_t *)((char *)a1 + v100);
          v102 = (uint64_t *)((char *)a2 + v100);
          uint64_t v103 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          if (sub_100004B4C((uint64_t)v102, 1, (uint64_t)v103))
          {
            uint64_t v104 = sub_10000488C(&qword_1000592D8);
            memcpy(v101, v102, *(void *)(*(void *)(v104 - 8) + 64));
          }
          else
          {
            void *v101 = *v102;
            v99((char *)v101 + v103[5], (char *)v102 + v103[5], v98);
            uint64_t v105 = v103[6];
            v170 = v99;
            uint64_t v106 = (void *)((char *)v101 + v105);
            uint64_t v107 = (void *)((char *)v102 + v105);
            uint64_t v164 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            if (sub_100004B4C((uint64_t)v107, 1, v164))
            {
              uint64_t v108 = sub_10000488C(&qword_1000592F8);
              memcpy(v106, v107, *(void *)(*(void *)(v108 - 8) + 64));
            }
            else
            {
              void *v106 = *v107;
              *((unsigned char *)v106 + 8) = *((unsigned char *)v107 + 8);
              v106[2] = v107[2];
              *((unsigned char *)v106 + 24) = *((unsigned char *)v107 + 24);
              v106[4] = v107[4];
              *((unsigned char *)v106 + 40) = *((unsigned char *)v107 + 40);
              v170((char *)v106 + *(int *)(v164 + 28), (char *)v107 + *(int *)(v164 + 28), v98);
              sub_100004938((uint64_t)v106, 0, 1, v164);
            }
            uint64_t v128 = v103[7];
            uint64_t v129 = (void *)((char *)v101 + v128);
            uint64_t v130 = (void *)((char *)v102 + v128);
            uint64_t v131 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v130, 1, v131))
            {
              uint64_t v132 = sub_10000488C(&qword_1000592E8);
              memcpy(v129, v130, *(void *)(*(void *)(v132 - 8) + 64));
            }
            else
            {
              uint64_t v133 = v130[1];
              void *v129 = *v130;
              v129[1] = v133;
              v129[2] = v130[2];
              uint64_t v134 = *(int *)(v131 + 24);
              v165 = (char *)v129 + v134;
              uint64_t v135 = (char *)v130 + v134;
              swift_bridgeObjectRetain();
              v170(v165, v135, v98);
              sub_100004938((uint64_t)v129, 0, 1, v131);
            }
            sub_100004938((uint64_t)v101, 0, 1, (uint64_t)v103);
          }
          break;
        case 7u:
          uint64_t v63 = *a2;
          unint64_t v64 = a2[1];
          sub_1000197D8(*a2, v64);
          *a1 = v63;
          a1[1] = v64;
          a1[2] = a2[2];
          *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
          uint64_t v65 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
          uint64_t v66 = *(int *)(v65 + 24);
          uint64_t v67 = (char *)a1 + v66;
          uint64_t v68 = (char *)a2 + v66;
          uint64_t v69 = sub_100046870();
          uint64_t v70 = v67;
          uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16);
          v71(v70, v68, v69);
          uint64_t v168 = v65;
          uint64_t v72 = *(int *)(v65 + 28);
          uint64_t v73 = (uint64_t *)((char *)a1 + v72);
          uint64_t v74 = (uint64_t *)((char *)a2 + v72);
          uint64_t v75 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          v167 = v71;
          if (sub_100004B4C((uint64_t)v74, 1, (uint64_t)v75))
          {
            uint64_t v76 = sub_10000488C(&qword_1000592D8);
            memcpy(v73, v74, *(void *)(*(void *)(v76 - 8) + 64));
          }
          else
          {
            *uint64_t v73 = *v74;
            v71((char *)v73 + v75[5], (char *)v74 + v75[5], v69);
            uint64_t v77 = v75[6];
            uint64_t v160 = v69;
            uint64_t v78 = (void *)((char *)v73 + v77);
            uint64_t v79 = (void *)((char *)v74 + v77);
            uint64_t v80 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            if (sub_100004B4C((uint64_t)v79, 1, v80))
            {
              uint64_t v81 = sub_10000488C(&qword_1000592F8);
              memcpy(v78, v79, *(void *)(*(void *)(v81 - 8) + 64));
            }
            else
            {
              *uint64_t v78 = *v79;
              *((unsigned char *)v78 + 8) = *((unsigned char *)v79 + 8);
              v78[2] = v79[2];
              *((unsigned char *)v78 + 24) = *((unsigned char *)v79 + 24);
              v78[4] = v79[4];
              *((unsigned char *)v78 + 40) = *((unsigned char *)v79 + 40);
              v167((char *)v78 + *(int *)(v80 + 28), (char *)v79 + *(int *)(v80 + 28), v160);
              sub_100004938((uint64_t)v78, 0, 1, v80);
            }
            uint64_t v109 = v75[7];
            uint64_t v110 = (void *)((char *)v73 + v109);
            uint64_t v111 = (void *)((char *)v74 + v109);
            uint64_t v112 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v111, 1, v112))
            {
              uint64_t v113 = sub_10000488C(&qword_1000592E8);
              memcpy(v110, v111, *(void *)(*(void *)(v113 - 8) + 64));
            }
            else
            {
              uint64_t v114 = v111[1];
              void *v110 = *v111;
              v110[1] = v114;
              v110[2] = v111[2];
              uint64_t v115 = *(int *)(v112 + 24);
              uint64_t v116 = (char *)v110 + v115;
              uint64_t v117 = (char *)v111 + v115;
              swift_bridgeObjectRetain();
              v167(v116, v117, v160);
              sub_100004938((uint64_t)v110, 0, 1, v112);
            }
            sub_100004938((uint64_t)v73, 0, 1, (uint64_t)v75);
            uint64_t v69 = v160;
          }
          uint64_t v118 = *(int *)(v168 + 32);
          uint64_t v119 = (uint64_t *)((char *)a1 + v118);
          uint64_t v120 = (uint64_t *)((char *)a2 + v118);
          uint64_t v121 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
          if (sub_100004B4C((uint64_t)v120, 1, v121))
          {
            uint64_t v122 = sub_10000488C(&qword_100059310);
            memcpy(v119, v120, *(void *)(*(void *)(v122 - 8) + 64));
          }
          else
          {
            uint64_t v123 = v120[1];
            void *v119 = *v120;
            v119[1] = v123;
            uint64_t v124 = v120[3];
            v119[2] = v120[2];
            v119[3] = v124;
            *((unsigned char *)v119 + 32) = *((unsigned char *)v120 + 32);
            uint64_t v125 = *(int *)(v121 + 28);
            uint64_t v126 = (char *)v119 + v125;
            uint64_t v127 = (char *)v120 + v125;
            swift_bridgeObjectRetain();
            v167(v126, v127, v69);
            sub_100004938((uint64_t)v119, 0, 1, v121);
          }
          break;
        default:
          uint64_t v10 = *a2;
          unint64_t v11 = a2[1];
          sub_1000197D8(*a2, v11);
          *a1 = v10;
          a1[1] = v11;
          uint64_t v12 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
          uint64_t v13 = (char *)a1 + v12;
          uint64_t v14 = (char *)a2 + v12;
          uint64_t v15 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
          break;
      }
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v151 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v152 = (char *)a1 + v151;
    uint64_t v153 = (char *)a2 + v151;
    uint64_t v154 = sub_100046870();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v154 - 8) + 16))(v152, v153, v154);
  }
  return a1;
}

uint64_t sub_1000208A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (!sub_100004B4C(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0);
        goto LABEL_7;
      case 1u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        goto LABEL_36;
      case 2u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0);
        goto LABEL_7;
      case 3u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0);
LABEL_7:
        uint64_t v6 = *(int *)(v5 + 20);
        goto LABEL_36;
      case 4u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        swift_bridgeObjectRelease();
        uint64_t v6 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        goto LABEL_36;
      case 5u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        swift_bridgeObjectRelease();
        uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v8 = a1 + *(int *)(v7 + 24);
        uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        if (sub_100004B4C(v8, 1, v9)) {
          goto LABEL_35;
        }
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          uint64_t v11 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
LABEL_32:
          uint64_t v39 = v8 + *(int *)(v11 + 20);
          uint64_t v40 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v39, v40);
          goto LABEL_35;
        }
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload) {
            goto LABEL_35;
          }
          uint64_t v11 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
        uint64_t v41 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
        uint64_t v42 = v8 + *(int *)(v41 + 20);
        uint64_t v43 = sub_100046870();
        uint64_t v44 = *(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8);
        v44(v42, v43);
        uint64_t v45 = v8 + *(int *)(v41 + 24);
        uint64_t v46 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
        if (!sub_100004B4C(v45, 1, v46))
        {
          swift_bridgeObjectRelease();
          v44(v45 + *(int *)(v46 + 20), v43);
        }
LABEL_35:
        uint64_t v6 = *(int *)(v7 + 28);
LABEL_36:
        uint64_t v47 = a1 + v6;
        uint64_t v48 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v48 - 8) + 8))(v47, v48);
        break;
      case 6u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v12 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v13 = a1 + v12[5];
        uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (!sub_100004B4C(v13, 1, v14))
        {
          if (swift_getEnumCaseMultiPayload() == 1) {
            uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
          }
          else {
            uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
          }
          uint64_t v28 = v13 + *(int *)(v15 + 20);
          uint64_t v29 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
        }
        uint64_t v30 = a1 + v12[6];
        uint64_t v31 = sub_100046870();
        uint64_t v32 = *(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8);
        v32(v30, v31);
        uint64_t v33 = a1 + v12[7];
        uint64_t v34 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (!sub_100004B4C(v33, 1, (uint64_t)v34))
        {
          v32(v33 + v34[5], v31);
          uint64_t v35 = v33 + v34[6];
          uint64_t v36 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (!sub_100004B4C(v35, 1, v36)) {
            v32(v35 + *(int *)(v36 + 28), v31);
          }
          uint64_t v37 = v33 + v34[7];
          uint64_t v38 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (!sub_100004B4C(v37, 1, v38))
          {
            swift_bridgeObjectRelease();
            v32(v37 + *(int *)(v38 + 24), v31);
          }
        }
        break;
      case 7u:
        sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v16 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v17 = a1 + v16[6];
        uint64_t v18 = sub_100046870();
        uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
        v19(v17, v18);
        uint64_t v20 = a1 + v16[7];
        uint64_t v21 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (!sub_100004B4C(v20, 1, (uint64_t)v21))
        {
          v19(v20 + v21[5], v18);
          uint64_t v22 = v20 + v21[6];
          uint64_t v23 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (!sub_100004B4C(v22, 1, v23)) {
            v19(v22 + *(int *)(v23 + 28), v18);
          }
          uint64_t v24 = v20 + v21[7];
          uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (!sub_100004B4C(v24, 1, v25))
          {
            swift_bridgeObjectRelease();
            v19(v24 + *(int *)(v25 + 24), v18);
          }
        }
        uint64_t v26 = a1 + v16[8];
        uint64_t v27 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (!sub_100004B4C(v26, 1, v27))
        {
          swift_bridgeObjectRelease();
          v19(v26 + *(int *)(v27 + 28), v18);
        }
        break;
      default:
        break;
    }
  }
  uint64_t v49 = a1 + *(int *)(a2 + 24);
  uint64_t v50 = sub_100046870();
  uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v50 - 8) + 8);

  return v51(v49, v50);
}

void *sub_100020F14(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (sub_100004B4C((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_10000488C(&qword_100059228);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v14 = *a2;
        unint64_t v15 = a2[1];
        sub_1000197D8(*a2, v15);
        *a1 = v14;
        a1[1] = v15;
        uint64_t v16 = a2[3];
        a1[2] = a2[2];
        a1[3] = v16;
        uint64_t v17 = a2[5];
        a1[4] = a2[4];
        a1[5] = v17;
        uint64_t v18 = a2[7];
        a1[6] = a2[6];
        a1[7] = v18;
        uint64_t v19 = a2[9];
        a1[8] = a2[8];
        a1[9] = v19;
        uint64_t v20 = a2[11];
        a1[10] = a2[10];
        a1[11] = v20;
        a1[12] = a2[12];
        *((_WORD *)a1 + 52) = *((_WORD *)a2 + 52);
        a1[14] = a2[14];
        *((unsigned char *)a1 + 120) = *((unsigned char *)a2 + 120);
        uint64_t v21 = a2[17];
        a1[16] = a2[16];
        a1[17] = v21;
        a1[18] = a2[18];
        uint64_t v22 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v157 = (char *)a2 + v22;
        uint64_t v160 = (char *)a1 + v22;
        uint64_t v23 = sub_100046870();
        uint64_t v155 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v155(v160, v157, v23);
        break;
      case 2u:
        uint64_t v24 = *a2;
        unint64_t v25 = a2[1];
        sub_1000197D8(*a2, v25);
        *a1 = v24;
        a1[1] = v25;
        uint64_t v26 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v27 = (char *)a1 + v26;
        uint64_t v28 = (char *)a2 + v26;
        uint64_t v29 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
        break;
      case 3u:
        uint64_t v30 = *a2;
        unint64_t v31 = a2[1];
        sub_1000197D8(*a2, v31);
        *a1 = v30;
        a1[1] = v31;
        uint64_t v32 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v33 = (char *)a1 + v32;
        uint64_t v34 = (char *)a2 + v32;
        uint64_t v35 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        break;
      case 4u:
        uint64_t v36 = *a2;
        unint64_t v37 = a2[1];
        sub_1000197D8(*a2, v37);
        *a1 = v36;
        a1[1] = v37;
        uint64_t v38 = a2[3];
        a1[2] = a2[2];
        a1[3] = v38;
        uint64_t v39 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v40 = (char *)a1 + v39;
        uint64_t v41 = (char *)a2 + v39;
        uint64_t v42 = sub_100046870();
        uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16);
        swift_bridgeObjectRetain();
        v43(v40, v41, v42);
        break;
      case 5u:
        uint64_t v44 = *a2;
        unint64_t v45 = a2[1];
        sub_1000197D8(*a2, v45);
        *a1 = v44;
        a1[1] = v45;
        uint64_t v46 = a2[3];
        a1[2] = a2[2];
        a1[3] = v46;
        uint64_t v47 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v48 = *(int *)(v47 + 24);
        uint64_t v49 = (void *)((char *)a1 + v48);
        uint64_t v50 = (uint64_t *)((char *)a2 + v48);
        uint64_t v51 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        swift_bridgeObjectRetain();
        if (sub_100004B4C((uint64_t)v50, 1, v51))
        {
          uint64_t v52 = sub_10000488C(&qword_1000592A0);
          memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
        }
        else
        {
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload == 2)
          {
            *(unsigned char *)uint64_t v49 = *(unsigned char *)v50;
            uint64_t v134 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                          + 20);
            uint64_t v135 = (char *)v49 + v134;
            uint64_t v136 = (char *)v50 + v134;
            uint64_t v137 = sub_100046870();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
          }
          else if (EnumCaseMultiPayload == 1)
          {
            uint64_t v81 = v50[1];
            *uint64_t v49 = *v50;
            v49[1] = v81;
            uint64_t v161 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v82 = *(int *)(v161 + 20);
            uint64_t v154 = (char *)v50 + v82;
            v156 = (char *)v49 + v82;
            uint64_t v83 = sub_100046870();
            v167 = *(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 16);
            swift_bridgeObjectRetain();
            uint64_t v159 = v83;
            v167(v156, v154, v83);
            uint64_t v84 = *(int *)(v161 + 24);
            uint64_t v85 = (void *)((char *)v49 + v84);
            uint64_t v86 = (void *)((char *)v50 + v84);
            uint64_t v87 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v86, 1, v87))
            {
              uint64_t v88 = sub_10000488C(&qword_1000592B8);
              memcpy(v85, v86, *(void *)(*(void *)(v88 - 8) + 64));
            }
            else
            {
              uint64_t v142 = v86[1];
              *uint64_t v85 = *v86;
              v85[1] = v142;
              uint64_t v143 = *(int *)(v87 + 20);
              uint64_t v164 = (char *)v85 + v143;
              uint64_t v144 = (char *)v86 + v143;
              swift_bridgeObjectRetain();
              v167(v164, v144, v159);
              sub_100004938((uint64_t)v85, 0, 1, v87);
            }
          }
          else
          {
            *uint64_t v49 = *v50;
            *((unsigned char *)v49 + 8) = *((unsigned char *)v50 + 8);
            uint64_t v138 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                          + 20);
            uint64_t v139 = (char *)v49 + v138;
            uint64_t v140 = (char *)v50 + v138;
            uint64_t v141 = sub_100046870();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v141 - 8) + 16))(v139, v140, v141);
          }
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v49, 0, 1, v51);
        }
        uint64_t v145 = *(int *)(v47 + 28);
        uint64_t v146 = (char *)a1 + v145;
        uint64_t v147 = (char *)a2 + v145;
        uint64_t v148 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v148 - 8) + 16))(v146, v147, v148);
        break;
      case 6u:
        uint64_t v53 = *a2;
        unint64_t v54 = a2[1];
        sub_1000197D8(*a2, v54);
        *a1 = v53;
        a1[1] = v54;
        uint64_t v55 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v56 = v55[5];
        uint64_t v57 = (char *)a1 + v56;
        uint64_t v58 = (char *)a2 + v56;
        uint64_t v59 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v58, 1, v59))
        {
          uint64_t v60 = sub_10000488C(&qword_1000592C8);
          memcpy(v57, v58, *(void *)(*(void *)(v60 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            *(void *)uint64_t v57 = *(void *)v58;
            v57[8] = v58[8];
            uint64_t v89 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                         + 20);
          }
          else
          {
            *uint64_t v57 = *v58;
            uint64_t v89 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                         + 20);
          }
          uint64_t v90 = &v57[v89];
          uint64_t v91 = &v58[v89];
          uint64_t v92 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v92 - 8) + 16))(v90, v91, v92);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v57, 0, 1, v59);
        }
        uint64_t v93 = v55[6];
        uint64_t v94 = (char *)a1 + v93;
        uint64_t v95 = (char *)a2 + v93;
        uint64_t v96 = sub_100046870();
        uint64_t v97 = *(void (**)(char *, char *, uint64_t))(*(void *)(v96 - 8) + 16);
        v97(v94, v95, v96);
        uint64_t v98 = v55[7];
        uint64_t v99 = (void *)((char *)a1 + v98);
        uint64_t v100 = (uint64_t *)((char *)a2 + v98);
        uint64_t v101 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v100, 1, (uint64_t)v101))
        {
          uint64_t v102 = sub_10000488C(&qword_1000592D8);
          memcpy(v99, v100, *(void *)(*(void *)(v102 - 8) + 64));
        }
        else
        {
          *uint64_t v99 = *v100;
          v97((char *)v99 + v101[5], (char *)v100 + v101[5], v96);
          uint64_t v103 = v101[6];
          uint64_t v168 = v97;
          uint64_t v104 = (void *)((char *)v99 + v103);
          uint64_t v105 = (void *)((char *)v100 + v103);
          uint64_t v162 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v105, 1, v162))
          {
            uint64_t v106 = sub_10000488C(&qword_1000592F8);
            memcpy(v104, v105, *(void *)(*(void *)(v106 - 8) + 64));
          }
          else
          {
            *uint64_t v104 = *v105;
            *((unsigned char *)v104 + 8) = *((unsigned char *)v105 + 8);
            v104[2] = v105[2];
            *((unsigned char *)v104 + 24) = *((unsigned char *)v105 + 24);
            v104[4] = v105[4];
            *((unsigned char *)v104 + 40) = *((unsigned char *)v105 + 40);
            v168((char *)v104 + *(int *)(v162 + 28), (char *)v105 + *(int *)(v162 + 28), v96);
            sub_100004938((uint64_t)v104, 0, 1, v162);
          }
          uint64_t v126 = v101[7];
          uint64_t v127 = (void *)((char *)v99 + v126);
          uint64_t v128 = (void *)((char *)v100 + v126);
          uint64_t v129 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v128, 1, v129))
          {
            uint64_t v130 = sub_10000488C(&qword_1000592E8);
            memcpy(v127, v128, *(void *)(*(void *)(v130 - 8) + 64));
          }
          else
          {
            uint64_t v131 = v128[1];
            *uint64_t v127 = *v128;
            v127[1] = v131;
            v127[2] = v128[2];
            uint64_t v132 = *(int *)(v129 + 24);
            uint64_t v163 = (char *)v127 + v132;
            uint64_t v133 = (char *)v128 + v132;
            swift_bridgeObjectRetain();
            v168(v163, v133, v96);
            sub_100004938((uint64_t)v127, 0, 1, v129);
          }
          sub_100004938((uint64_t)v99, 0, 1, (uint64_t)v101);
        }
        break;
      case 7u:
        uint64_t v61 = *a2;
        unint64_t v62 = a2[1];
        sub_1000197D8(*a2, v62);
        *a1 = v61;
        a1[1] = v62;
        a1[2] = a2[2];
        *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
        uint64_t v63 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v64 = *(int *)(v63 + 24);
        uint64_t v65 = (char *)a1 + v64;
        uint64_t v66 = (char *)a2 + v64;
        uint64_t v67 = sub_100046870();
        uint64_t v68 = v65;
        uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 16);
        v69(v68, v66, v67);
        uint64_t v166 = v63;
        uint64_t v70 = *(int *)(v63 + 28);
        uint64_t v71 = (void *)((char *)a1 + v70);
        uint64_t v72 = (uint64_t *)((char *)a2 + v70);
        uint64_t v73 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        v165 = v69;
        if (sub_100004B4C((uint64_t)v72, 1, (uint64_t)v73))
        {
          uint64_t v74 = sub_10000488C(&qword_1000592D8);
          memcpy(v71, v72, *(void *)(*(void *)(v74 - 8) + 64));
        }
        else
        {
          *uint64_t v71 = *v72;
          v69((char *)v71 + v73[5], (char *)v72 + v73[5], v67);
          uint64_t v75 = v73[6];
          uint64_t v158 = v67;
          uint64_t v76 = (void *)((char *)v71 + v75);
          uint64_t v77 = (void *)((char *)v72 + v75);
          uint64_t v78 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v77, 1, v78))
          {
            uint64_t v79 = sub_10000488C(&qword_1000592F8);
            memcpy(v76, v77, *(void *)(*(void *)(v79 - 8) + 64));
          }
          else
          {
            *uint64_t v76 = *v77;
            *((unsigned char *)v76 + 8) = *((unsigned char *)v77 + 8);
            v76[2] = v77[2];
            *((unsigned char *)v76 + 24) = *((unsigned char *)v77 + 24);
            v76[4] = v77[4];
            *((unsigned char *)v76 + 40) = *((unsigned char *)v77 + 40);
            v165((char *)v76 + *(int *)(v78 + 28), (char *)v77 + *(int *)(v78 + 28), v158);
            sub_100004938((uint64_t)v76, 0, 1, v78);
          }
          uint64_t v107 = v73[7];
          uint64_t v108 = (void *)((char *)v71 + v107);
          uint64_t v109 = (void *)((char *)v72 + v107);
          uint64_t v110 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v109, 1, v110))
          {
            uint64_t v111 = sub_10000488C(&qword_1000592E8);
            memcpy(v108, v109, *(void *)(*(void *)(v111 - 8) + 64));
          }
          else
          {
            uint64_t v112 = v109[1];
            *uint64_t v108 = *v109;
            v108[1] = v112;
            v108[2] = v109[2];
            uint64_t v113 = *(int *)(v110 + 24);
            uint64_t v114 = (char *)v108 + v113;
            uint64_t v115 = (char *)v109 + v113;
            swift_bridgeObjectRetain();
            v165(v114, v115, v158);
            sub_100004938((uint64_t)v108, 0, 1, v110);
          }
          sub_100004938((uint64_t)v71, 0, 1, (uint64_t)v73);
          uint64_t v67 = v158;
        }
        uint64_t v116 = *(int *)(v166 + 32);
        uint64_t v117 = (void *)((char *)a1 + v116);
        uint64_t v118 = (uint64_t *)((char *)a2 + v116);
        uint64_t v119 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v118, 1, v119))
        {
          uint64_t v120 = sub_10000488C(&qword_100059310);
          memcpy(v117, v118, *(void *)(*(void *)(v120 - 8) + 64));
        }
        else
        {
          uint64_t v121 = v118[1];
          *uint64_t v117 = *v118;
          v117[1] = v121;
          uint64_t v122 = v118[3];
          v117[2] = v118[2];
          v117[3] = v122;
          *((unsigned char *)v117 + 32) = *((unsigned char *)v118 + 32);
          uint64_t v123 = *(int *)(v119 + 28);
          uint64_t v124 = (char *)v117 + v123;
          uint64_t v125 = (char *)v118 + v123;
          swift_bridgeObjectRetain();
          v165(v124, v125, v67);
          sub_100004938((uint64_t)v117, 0, 1, v119);
        }
        break;
      default:
        uint64_t v8 = *a2;
        unint64_t v9 = a2[1];
        sub_1000197D8(*a2, v9);
        *a1 = v8;
        a1[1] = v9;
        uint64_t v10 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
        break;
    }
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v149 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v150 = (char *)a1 + v149;
  uint64_t v151 = (char *)a2 + v149;
  uint64_t v152 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v152 - 8) + 16))(v150, v151, v152);
  return a1;
}

uint64_t sub_100021DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  int v7 = sub_100004B4C(a1, 1, v6);
  int v8 = sub_100004B4C(a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v22 = *(void *)a2;
          unint64_t v23 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v23);
          *(void *)a1 = v22;
          *(void *)(a1 + 8) = v23;
          *(void *)(a1 + 16) = *(void *)(a2 + 16);
          *(void *)(a1 + 24) = *(void *)(a2 + 24);
          *(void *)(a1 + 32) = *(void *)(a2 + 32);
          *(void *)(a1 + 40) = *(void *)(a2 + 40);
          *(void *)(a1 + 48) = *(void *)(a2 + 48);
          *(void *)(a1 + 56) = *(void *)(a2 + 56);
          *(void *)(a1 + 64) = *(void *)(a2 + 64);
          *(void *)(a1 + 72) = *(void *)(a2 + 72);
          *(void *)(a1 + 80) = *(void *)(a2 + 80);
          *(void *)(a1 + 88) = *(void *)(a2 + 88);
          uint64_t v24 = *(void *)(a2 + 96);
          *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
          *(void *)(a1 + 96) = v24;
          *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
          uint64_t v25 = *(void *)(a2 + 112);
          *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
          *(void *)(a1 + 112) = v25;
          *(void *)(a1 + 128) = *(void *)(a2 + 128);
          *(void *)(a1 + 136) = *(void *)(a2 + 136);
          *(void *)(a1 + 144) = *(void *)(a2 + 144);
          uint64_t v26 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
          uint64_t v305 = a2 + v26;
          uint64_t v310 = a1 + v26;
          uint64_t v27 = sub_100046870();
          v300 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v300(v310, v305, v27);
          goto LABEL_92;
        case 2u:
          uint64_t v28 = *(void *)a2;
          unint64_t v29 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v29);
          *(void *)a1 = v28;
          *(void *)(a1 + 8) = v29;
          uint64_t v30 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
          uint64_t v31 = a1 + v30;
          uint64_t v32 = a2 + v30;
          uint64_t v33 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
          goto LABEL_92;
        case 3u:
          uint64_t v34 = *(void *)a2;
          unint64_t v35 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v35);
          *(void *)a1 = v34;
          *(void *)(a1 + 8) = v35;
          uint64_t v36 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
          uint64_t v37 = a1 + v36;
          uint64_t v38 = a2 + v36;
          uint64_t v39 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
          goto LABEL_92;
        case 4u:
          uint64_t v40 = *(void *)a2;
          unint64_t v41 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v41);
          *(void *)a1 = v40;
          *(void *)(a1 + 8) = v41;
          *(void *)(a1 + 16) = *(void *)(a2 + 16);
          *(void *)(a1 + 24) = *(void *)(a2 + 24);
          uint64_t v42 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
          uint64_t v43 = a1 + v42;
          uint64_t v44 = a2 + v42;
          uint64_t v45 = sub_100046870();
          uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 16);
          swift_bridgeObjectRetain();
          v46(v43, v44, v45);
          goto LABEL_92;
        case 5u:
          uint64_t v47 = *(void *)a2;
          unint64_t v48 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v48);
          *(void *)a1 = v47;
          *(void *)(a1 + 8) = v48;
          *(void *)(a1 + 16) = *(void *)(a2 + 16);
          *(void *)(a1 + 24) = *(void *)(a2 + 24);
          uint64_t v49 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
          uint64_t v50 = *(int *)(v49 + 24);
          uint64_t v51 = (void *)(a1 + v50);
          uint64_t v52 = (void *)(a2 + v50);
          uint64_t v53 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
          swift_bridgeObjectRetain();
          if (sub_100004B4C((uint64_t)v52, 1, v53))
          {
            uint64_t v54 = sub_10000488C(&qword_1000592A0);
            memcpy(v51, v52, *(void *)(*(void *)(v54 - 8) + 64));
LABEL_91:
            uint64_t v272 = *(int *)(v49 + 28);
            uint64_t v273 = a1 + v272;
            uint64_t v274 = a2 + v272;
            uint64_t v275 = sub_100046870();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v275 - 8) + 16))(v273, v274, v275);
LABEL_92:
            swift_storeEnumTagMultiPayload();
            sub_100004938(a1, 0, 1, v6);
            goto LABEL_100;
          }
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload == 2)
          {
            *(unsigned char *)uint64_t v51 = *(unsigned char *)v52;
            uint64_t v220 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
          }
          else
          {
            if (EnumCaseMultiPayload == 1)
            {
              uint64_t v323 = a3;
              *uint64_t v51 = *v52;
              v51[1] = v52[1];
              uint64_t v138 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
              uint64_t v139 = *(int *)(v138 + 20);
              v307 = (char *)v51 + v139;
              uint64_t v313 = v138;
              v302 = (char *)v52 + v139;
              uint64_t v140 = sub_100046870();
              v298 = *(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 16);
              swift_bridgeObjectRetain();
              v298(v307, v302, v140);
              uint64_t v141 = *(int *)(v313 + 24);
              uint64_t v142 = (void *)((char *)v51 + v141);
              uint64_t v143 = (void *)((char *)v52 + v141);
              uint64_t v144 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
              if (sub_100004B4C((uint64_t)v143, 1, v144))
              {
                uint64_t v145 = sub_10000488C(&qword_1000592B8);
                memcpy(v142, v143, *(void *)(*(void *)(v145 - 8) + 64));
              }
              else
              {
                void *v142 = *v143;
                v142[1] = v143[1];
                uint64_t v270 = *(int *)(v144 + 20);
                v318 = (char *)v142 + v270;
                v271 = (char *)v143 + v270;
                swift_bridgeObjectRetain();
                v298(v318, v271, v140);
                sub_100004938((uint64_t)v142, 0, 1, v144);
              }
              a3 = v323;
              goto LABEL_90;
            }
            uint64_t v221 = *v52;
            *((unsigned char *)v51 + 8) = *((unsigned char *)v52 + 8);
            *uint64_t v51 = v221;
            uint64_t v220 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
          }
          uint64_t v222 = *(int *)(v220 + 20);
          v223 = (char *)v51 + v222;
          v224 = (char *)v52 + v222;
          uint64_t v225 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v225 - 8) + 16))(v223, v224, v225);
LABEL_90:
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v51, 0, 1, v53);
          goto LABEL_91;
        case 6u:
          uint64_t v55 = *(void *)a2;
          unint64_t v56 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v56);
          *(void *)a1 = v55;
          *(void *)(a1 + 8) = v56;
          uint64_t v57 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
          uint64_t v58 = v57[5];
          uint64_t v59 = (unsigned char *)(a1 + v58);
          uint64_t v60 = (unsigned char *)(a2 + v58);
          uint64_t v61 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
          if (sub_100004B4C((uint64_t)v60, 1, v61))
          {
            uint64_t v62 = sub_10000488C(&qword_1000592C8);
            memcpy(v59, v60, *(void *)(*(void *)(v62 - 8) + 64));
          }
          else
          {
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              uint64_t v146 = *(void *)v60;
              v59[8] = v60[8];
              *(void *)uint64_t v59 = v146;
              uint64_t v147 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                            + 20);
            }
            else
            {
              *uint64_t v59 = *v60;
              uint64_t v147 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                            + 20);
            }
            uint64_t v148 = &v59[v147];
            uint64_t v149 = &v60[v147];
            uint64_t v150 = sub_100046870();
            (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v150 - 8) + 16))(v148, v149, v150);
            swift_storeEnumTagMultiPayload();
            sub_100004938((uint64_t)v59, 0, 1, v61);
          }
          uint64_t v155 = v57[6];
          uint64_t v156 = a1 + v155;
          uint64_t v157 = a2 + v155;
          uint64_t v158 = sub_100046870();
          uint64_t v159 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v158 - 8) + 16);
          v159(v156, v157, v158);
          uint64_t v160 = v57[7];
          uint64_t v161 = (void *)(a1 + v160);
          uint64_t v162 = (void *)(a2 + v160);
          uint64_t v163 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          if (sub_100004B4C((uint64_t)v162, 1, (uint64_t)v163))
          {
            uint64_t v164 = sub_10000488C(&qword_1000592D8);
            memcpy(v161, v162, *(void *)(*(void *)(v164 - 8) + 64));
          }
          else
          {
            uint64_t v325 = a3;
            void *v161 = *v162;
            v159((uint64_t)v161 + v163[5], (uint64_t)v162 + v163[5], v158);
            uint64_t v165 = v163[6];
            uint64_t v166 = v159;
            v167 = (void *)((char *)v161 + v165);
            uint64_t v168 = (void *)((char *)v162 + v165);
            uint64_t v314 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            v308 = (void (*)(char *, char *, uint64_t))v166;
            if (sub_100004B4C((uint64_t)v168, 1, v314))
            {
              uint64_t v169 = sub_10000488C(&qword_1000592F8);
              memcpy(v167, v168, *(void *)(*(void *)(v169 - 8) + 64));
            }
            else
            {
              uint64_t v209 = *v168;
              *((unsigned char *)v167 + 8) = *((unsigned char *)v168 + 8);
              void *v167 = v209;
              uint64_t v210 = v168[2];
              *((unsigned char *)v167 + 24) = *((unsigned char *)v168 + 24);
              v167[2] = v210;
              uint64_t v211 = v168[4];
              *((unsigned char *)v167 + 40) = *((unsigned char *)v168 + 40);
              v167[4] = v211;
              v166((uint64_t)v167 + *(int *)(v314 + 28), (uint64_t)v168 + *(int *)(v314 + 28), v158);
              sub_100004938((uint64_t)v167, 0, 1, v314);
            }
            uint64_t v212 = v163[7];
            v213 = (void *)((char *)v161 + v212);
            v214 = (void *)((char *)v162 + v212);
            uint64_t v215 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v214, 1, v215))
            {
              uint64_t v216 = sub_10000488C(&qword_1000592E8);
              memcpy(v213, v214, *(void *)(*(void *)(v216 - 8) + 64));
            }
            else
            {
              void *v213 = *v214;
              v213[1] = v214[1];
              v213[2] = v214[2];
              uint64_t v217 = *(int *)(v215 + 24);
              v218 = (char *)v213 + v217;
              v219 = (char *)v214 + v217;
              swift_bridgeObjectRetain();
              v308(v218, v219, v158);
              sub_100004938((uint64_t)v213, 0, 1, v215);
            }
            a3 = v325;
            sub_100004938((uint64_t)v161, 0, 1, (uint64_t)v163);
          }
          goto LABEL_92;
        case 7u:
          uint64_t v63 = *(void *)a2;
          unint64_t v64 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v64);
          *(void *)a1 = v63;
          *(void *)(a1 + 8) = v64;
          uint64_t v65 = *(void *)(a2 + 16);
          *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
          *(void *)(a1 + 16) = v65;
          uint64_t v66 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
          uint64_t v67 = v66[6];
          uint64_t v68 = a1 + v67;
          uint64_t v69 = a2 + v67;
          uint64_t v70 = sub_100046870();
          uint64_t v71 = v68;
          uint64_t v72 = v69;
          uint64_t v73 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 16);
          uint64_t v74 = *v73;
          uint64_t v320 = v70;
          (*v73)(v71, v72, v70);
          uint64_t v75 = v66[7];
          uint64_t v76 = (void *)(a1 + v75);
          uint64_t v77 = (void *)(a2 + v75);
          uint64_t v78 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          v311 = v74;
          if (sub_100004B4C((uint64_t)v77, 1, (uint64_t)v78))
          {
            uint64_t v79 = sub_10000488C(&qword_1000592D8);
            memcpy(v76, v77, *(void *)(*(void *)(v79 - 8) + 64));
          }
          else
          {
            uint64_t v324 = a3;
            *uint64_t v76 = *v77;
            v74((uint64_t)v76 + v78[5], (uint64_t)v77 + v78[5], v320);
            uint64_t v151 = v78[6];
            uint64_t v152 = (void *)((char *)v76 + v151);
            uint64_t v153 = (void *)((char *)v77 + v151);
            uint64_t v303 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            if (sub_100004B4C((uint64_t)v153, 1, v303))
            {
              uint64_t v154 = sub_10000488C(&qword_1000592F8);
              memcpy(v152, v153, *(void *)(*(void *)(v154 - 8) + 64));
            }
            else
            {
              uint64_t v175 = *v153;
              *((unsigned char *)v152 + 8) = *((unsigned char *)v153 + 8);
              *uint64_t v152 = v175;
              uint64_t v176 = v153[2];
              *((unsigned char *)v152 + 24) = *((unsigned char *)v153 + 24);
              v152[2] = v176;
              uint64_t v177 = v153[4];
              *((unsigned char *)v152 + 40) = *((unsigned char *)v153 + 40);
              v152[4] = v177;
              v74((uint64_t)v152 + *(int *)(v303 + 28), (uint64_t)v153 + *(int *)(v303 + 28), v320);
              sub_100004938((uint64_t)v152, 0, 1, v303);
            }
            uint64_t v178 = v78[7];
            v179 = (void *)((char *)v76 + v178);
            v180 = (void *)((char *)v77 + v178);
            uint64_t v181 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v180, 1, v181))
            {
              uint64_t v182 = sub_10000488C(&qword_1000592E8);
              memcpy(v179, v180, *(void *)(*(void *)(v182 - 8) + 64));
            }
            else
            {
              void *v179 = *v180;
              v179[1] = v180[1];
              v179[2] = v180[2];
              uint64_t v183 = *(int *)(v181 + 24);
              v184 = (char *)v179 + v183;
              v185 = (char *)v180 + v183;
              swift_bridgeObjectRetain();
              v311((uint64_t)v184, (uint64_t)v185, v320);
              sub_100004938((uint64_t)v179, 0, 1, v181);
            }
            sub_100004938((uint64_t)v76, 0, 1, (uint64_t)v78);
            a3 = v324;
          }
          uint64_t v186 = v66[8];
          v187 = (void *)(a1 + v186);
          v188 = (void *)(a2 + v186);
          uint64_t v189 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
          if (sub_100004B4C((uint64_t)v188, 1, v189))
          {
            uint64_t v190 = sub_10000488C(&qword_100059310);
            memcpy(v187, v188, *(void *)(*(void *)(v190 - 8) + 64));
          }
          else
          {
            void *v187 = *v188;
            v187[1] = v188[1];
            v187[2] = v188[2];
            uint64_t v191 = v188[3];
            *((unsigned char *)v187 + 32) = *((unsigned char *)v188 + 32);
            v187[3] = v191;
            uint64_t v192 = *(int *)(v189 + 28);
            v193 = (char *)v187 + v192;
            v194 = (char *)v188 + v192;
            swift_bridgeObjectRetain();
            v311((uint64_t)v193, (uint64_t)v194, v320);
            sub_100004938((uint64_t)v187, 0, 1, v189);
          }
          goto LABEL_92;
        default:
          uint64_t v9 = *(void *)a2;
          unint64_t v10 = *(void *)(a2 + 8);
          sub_1000197D8(*(void *)a2, v10);
          *(void *)a1 = v9;
          *(void *)(a1 + 8) = v10;
          uint64_t v11 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
          uint64_t v12 = a1 + v11;
          uint64_t v13 = a2 + v11;
          uint64_t v14 = sub_100046870();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
          goto LABEL_92;
      }
    }
    goto LABEL_7;
  }
  if (v8)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
LABEL_7:
    uint64_t v15 = sub_10000488C(&qword_100059228);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_100;
  }
  if (a1 != a2)
  {
    sub_100018A8C(a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v80 = *(void *)a2;
        unint64_t v81 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v81);
        *(void *)a1 = v80;
        *(void *)(a1 + 8) = v81;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        *(void *)(a1 + 40) = *(void *)(a2 + 40);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(void *)(a1 + 72) = *(void *)(a2 + 72);
        *(void *)(a1 + 80) = *(void *)(a2 + 80);
        *(void *)(a1 + 88) = *(void *)(a2 + 88);
        uint64_t v82 = *(void *)(a2 + 96);
        *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
        *(void *)(a1 + 96) = v82;
        *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
        uint64_t v83 = *(void *)(a2 + 112);
        *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
        *(void *)(a1 + 112) = v83;
        *(void *)(a1 + 128) = *(void *)(a2 + 128);
        *(void *)(a1 + 136) = *(void *)(a2 + 136);
        *(void *)(a1 + 144) = *(void *)(a2 + 144);
        uint64_t v84 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v301 = a2 + v84;
        uint64_t v306 = a1 + v84;
        uint64_t v85 = sub_100046870();
        v297 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v85 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v297(v306, v301, v85);
        break;
      case 2u:
        uint64_t v86 = *(void *)a2;
        unint64_t v87 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v87);
        *(void *)a1 = v86;
        *(void *)(a1 + 8) = v87;
        uint64_t v88 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v89 = a1 + v88;
        uint64_t v90 = a2 + v88;
        uint64_t v91 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v91 - 8) + 16))(v89, v90, v91);
        break;
      case 3u:
        uint64_t v92 = *(void *)a2;
        unint64_t v93 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v93);
        *(void *)a1 = v92;
        *(void *)(a1 + 8) = v93;
        uint64_t v94 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v95 = a1 + v94;
        uint64_t v96 = a2 + v94;
        uint64_t v97 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 16))(v95, v96, v97);
        break;
      case 4u:
        uint64_t v98 = *(void *)a2;
        unint64_t v99 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v99);
        *(void *)a1 = v98;
        *(void *)(a1 + 8) = v99;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v100 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v101 = a1 + v100;
        uint64_t v102 = a2 + v100;
        uint64_t v103 = sub_100046870();
        uint64_t v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 16);
        swift_bridgeObjectRetain();
        v104(v101, v102, v103);
        break;
      case 5u:
        uint64_t v105 = *(void *)a2;
        unint64_t v106 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v106);
        *(void *)a1 = v105;
        *(void *)(a1 + 8) = v106;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        *(void *)(a1 + 24) = *(void *)(a2 + 24);
        uint64_t v107 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v108 = *(int *)(v107 + 24);
        uint64_t v109 = (void *)(a1 + v108);
        uint64_t v110 = (void *)(a2 + v108);
        uint64_t v111 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        swift_bridgeObjectRetain();
        if (sub_100004B4C((uint64_t)v110, 1, v111))
        {
          uint64_t v112 = sub_10000488C(&qword_1000592A0);
          memcpy(v109, v110, *(void *)(*(void *)(v112 - 8) + 64));
        }
        else
        {
          int v195 = swift_getEnumCaseMultiPayload();
          if (v195 == 2)
          {
            *(unsigned char *)uint64_t v109 = *(unsigned char *)v110;
            uint64_t v276 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                          + 20);
            v277 = (char *)v109 + v276;
            v278 = (char *)v110 + v276;
            uint64_t v279 = sub_100046870();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v279 - 8) + 16))(v277, v278, v279);
          }
          else if (v195 == 1)
          {
            uint64_t v327 = a3;
            *uint64_t v109 = *v110;
            v109[1] = v110[1];
            uint64_t v196 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v197 = *(int *)(v196 + 20);
            v309 = (char *)v109 + v197;
            uint64_t v315 = v196;
            v304 = (char *)v110 + v197;
            uint64_t v198 = sub_100046870();
            v299 = *(void (**)(char *, char *, uint64_t))(*(void *)(v198 - 8) + 16);
            swift_bridgeObjectRetain();
            v299(v309, v304, v198);
            uint64_t v199 = *(int *)(v315 + 24);
            v200 = (void *)((char *)v109 + v199);
            v201 = (void *)((char *)v110 + v199);
            uint64_t v202 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v201, 1, v202))
            {
              uint64_t v203 = sub_10000488C(&qword_1000592B8);
              memcpy(v200, v201, *(void *)(*(void *)(v203 - 8) + 64));
            }
            else
            {
              void *v200 = *v201;
              v200[1] = v201[1];
              uint64_t v286 = *(int *)(v202 + 20);
              v319 = (char *)v200 + v286;
              v287 = (char *)v201 + v286;
              swift_bridgeObjectRetain();
              v299(v319, v287, v198);
              sub_100004938((uint64_t)v200, 0, 1, v202);
            }
            a3 = v327;
          }
          else
          {
            uint64_t v280 = a3;
            uint64_t v281 = *v110;
            *((unsigned char *)v109 + 8) = *((unsigned char *)v110 + 8);
            *uint64_t v109 = v281;
            uint64_t v282 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                          + 20);
            v283 = (char *)v109 + v282;
            v284 = (char *)v110 + v282;
            uint64_t v285 = sub_100046870();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v285 - 8) + 16))(v283, v284, v285);
            a3 = v280;
          }
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v109, 0, 1, v111);
        }
        uint64_t v288 = *(int *)(v107 + 28);
        uint64_t v289 = a1 + v288;
        uint64_t v290 = a2 + v288;
        uint64_t v291 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v291 - 8) + 16))(v289, v290, v291);
        break;
      case 6u:
        uint64_t v113 = *(void *)a2;
        unint64_t v114 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v114);
        *(void *)a1 = v113;
        *(void *)(a1 + 8) = v114;
        uint64_t v115 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v116 = v115[5];
        uint64_t v117 = (unsigned char *)(a1 + v116);
        uint64_t v118 = (unsigned char *)(a2 + v116);
        uint64_t v119 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v118, 1, v119))
        {
          uint64_t v120 = sub_10000488C(&qword_1000592C8);
          memcpy(v117, v118, *(void *)(*(void *)(v120 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            uint64_t v204 = *(void *)v118;
            v117[8] = v118[8];
            *(void *)uint64_t v117 = v204;
            uint64_t v205 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                          + 20);
          }
          else
          {
            *uint64_t v117 = *v118;
            uint64_t v205 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                          + 20);
          }
          v206 = &v117[v205];
          v207 = &v118[v205];
          uint64_t v208 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v208 - 8) + 16))(v206, v207, v208);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v117, 0, 1, v119);
        }
        uint64_t v226 = v115[6];
        uint64_t v227 = a1 + v226;
        uint64_t v228 = a2 + v226;
        uint64_t v229 = sub_100046870();
        v230 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v229 - 8) + 16);
        v230(v227, v228, v229);
        uint64_t v231 = v115[7];
        v232 = (void *)(a1 + v231);
        v233 = (void *)(a2 + v231);
        v234 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v233, 1, (uint64_t)v234))
        {
          uint64_t v235 = sub_10000488C(&qword_1000592D8);
          memcpy(v232, v233, *(void *)(*(void *)(v235 - 8) + 64));
        }
        else
        {
          uint64_t v328 = a3;
          void *v232 = *v233;
          v230((uint64_t)v232 + v234[5], (uint64_t)v233 + v234[5], v229);
          uint64_t v236 = v234[6];
          v322 = (void (*)(char *, char *, uint64_t))v230;
          v237 = (void *)((char *)v232 + v236);
          v238 = (void *)((char *)v233 + v236);
          uint64_t v316 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v238, 1, v316))
          {
            uint64_t v239 = sub_10000488C(&qword_1000592F8);
            memcpy(v237, v238, *(void *)(*(void *)(v239 - 8) + 64));
          }
          else
          {
            uint64_t v260 = *v238;
            *((unsigned char *)v237 + 8) = *((unsigned char *)v238 + 8);
            void *v237 = v260;
            uint64_t v261 = v238[2];
            *((unsigned char *)v237 + 24) = *((unsigned char *)v238 + 24);
            v237[2] = v261;
            uint64_t v262 = v238[4];
            *((unsigned char *)v237 + 40) = *((unsigned char *)v238 + 40);
            v237[4] = v262;
            v322((char *)v237 + *(int *)(v316 + 28), (char *)v238 + *(int *)(v316 + 28), v229);
            sub_100004938((uint64_t)v237, 0, 1, v316);
          }
          uint64_t v263 = v234[7];
          v264 = (void *)((char *)v232 + v263);
          v265 = (void *)((char *)v233 + v263);
          uint64_t v266 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v265, 1, v266))
          {
            uint64_t v267 = sub_10000488C(&qword_1000592E8);
            memcpy(v264, v265, *(void *)(*(void *)(v267 - 8) + 64));
          }
          else
          {
            void *v264 = *v265;
            v264[1] = v265[1];
            v264[2] = v265[2];
            uint64_t v268 = *(int *)(v266 + 24);
            v317 = (char *)v264 + v268;
            v269 = (char *)v265 + v268;
            swift_bridgeObjectRetain();
            v322(v317, v269, v229);
            sub_100004938((uint64_t)v264, 0, 1, v266);
          }
          a3 = v328;
          sub_100004938((uint64_t)v232, 0, 1, (uint64_t)v234);
        }
        break;
      case 7u:
        uint64_t v121 = *(void *)a2;
        unint64_t v122 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v122);
        *(void *)a1 = v121;
        *(void *)(a1 + 8) = v122;
        uint64_t v123 = *(void *)(a2 + 16);
        *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
        *(void *)(a1 + 16) = v123;
        uint64_t v124 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v125 = *(int *)(v124 + 24);
        uint64_t v126 = a1 + v125;
        uint64_t v127 = a2 + v125;
        uint64_t v128 = sub_100046870();
        uint64_t v129 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v128 - 8) + 16);
        uint64_t v130 = v126;
        uint64_t v131 = v128;
        v129(v130, v127, v128);
        uint64_t v321 = v124;
        uint64_t v132 = *(int *)(v124 + 28);
        uint64_t v133 = (void *)(a1 + v132);
        uint64_t v134 = (void *)(a2 + v132);
        uint64_t v135 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        uint64_t v312 = v131;
        if (sub_100004B4C((uint64_t)v134, 1, (uint64_t)v135))
        {
          uint64_t v136 = sub_10000488C(&qword_1000592D8);
          memcpy(v133, v134, *(void *)(*(void *)(v136 - 8) + 64));
        }
        else
        {
          uint64_t v326 = a3;
          void *v133 = *v134;
          v129((uint64_t)v133 + v135[5], (uint64_t)v134 + v135[5], v131);
          uint64_t v170 = v135[6];
          v171 = (void *)((char *)v133 + v170);
          v172 = (void *)((char *)v134 + v170);
          uint64_t v173 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v172, 1, v173))
          {
            uint64_t v174 = sub_10000488C(&qword_1000592F8);
            memcpy(v171, v172, *(void *)(*(void *)(v174 - 8) + 64));
          }
          else
          {
            uint64_t v240 = *v172;
            *((unsigned char *)v171 + 8) = *((unsigned char *)v172 + 8);
            void *v171 = v240;
            uint64_t v241 = v172[2];
            *((unsigned char *)v171 + 24) = *((unsigned char *)v172 + 24);
            v171[2] = v241;
            uint64_t v242 = v172[4];
            *((unsigned char *)v171 + 40) = *((unsigned char *)v172 + 40);
            v171[4] = v242;
            v129((uint64_t)v171 + *(int *)(v173 + 28), (uint64_t)v172 + *(int *)(v173 + 28), v312);
            sub_100004938((uint64_t)v171, 0, 1, v173);
          }
          uint64_t v243 = v135[7];
          v244 = (void *)((char *)v133 + v243);
          v245 = (void *)((char *)v134 + v243);
          uint64_t v246 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v245, 1, v246))
          {
            uint64_t v247 = sub_10000488C(&qword_1000592E8);
            memcpy(v244, v245, *(void *)(*(void *)(v247 - 8) + 64));
          }
          else
          {
            void *v244 = *v245;
            v244[1] = v245[1];
            v244[2] = v245[2];
            uint64_t v248 = *(int *)(v246 + 24);
            v249 = (char *)v244 + v248;
            v250 = (char *)v245 + v248;
            swift_bridgeObjectRetain();
            v129((uint64_t)v249, (uint64_t)v250, v312);
            sub_100004938((uint64_t)v244, 0, 1, v246);
          }
          sub_100004938((uint64_t)v133, 0, 1, (uint64_t)v135);
          a3 = v326;
        }
        uint64_t v251 = *(int *)(v321 + 32);
        v252 = (void *)(a1 + v251);
        v253 = (void *)(a2 + v251);
        uint64_t v254 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v253, 1, v254))
        {
          uint64_t v255 = sub_10000488C(&qword_100059310);
          memcpy(v252, v253, *(void *)(*(void *)(v255 - 8) + 64));
        }
        else
        {
          void *v252 = *v253;
          v252[1] = v253[1];
          v252[2] = v253[2];
          uint64_t v256 = v253[3];
          *((unsigned char *)v252 + 32) = *((unsigned char *)v253 + 32);
          v252[3] = v256;
          uint64_t v257 = *(int *)(v254 + 28);
          v258 = (char *)v252 + v257;
          v259 = (char *)v253 + v257;
          swift_bridgeObjectRetain();
          v129((uint64_t)v258, (uint64_t)v259, v312);
          sub_100004938((uint64_t)v252, 0, 1, v254);
        }
        break;
      default:
        uint64_t v16 = *(void *)a2;
        unint64_t v17 = *(void *)(a2 + 8);
        sub_1000197D8(*(void *)a2, v17);
        *(void *)a1 = v16;
        *(void *)(a1 + 8) = v17;
        uint64_t v18 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v19 = a1 + v18;
        uint64_t v20 = a2 + v18;
        uint64_t v21 = sub_100046870();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_100:
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v292 = *(int *)(a3 + 24);
  uint64_t v293 = a1 + v292;
  uint64_t v294 = a2 + v292;
  uint64_t v295 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v295 - 8) + 24))(v293, v294, v295);
  return a1;
}

_OWORD *sub_100023B14(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  if (!sub_100004B4C((uint64_t)a2, 1, v6))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        long long v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        long long v13 = a2[3];
        a1[2] = a2[2];
        a1[3] = v13;
        long long v14 = a2[5];
        a1[4] = a2[4];
        a1[5] = v14;
        *((void *)a1 + 12) = *((void *)a2 + 12);
        *((_WORD *)a1 + 52) = *((_WORD *)a2 + 52);
        uint64_t v15 = *((void *)a2 + 14);
        *((unsigned char *)a1 + 120) = *((unsigned char *)a2 + 120);
        *((void *)a1 + 14) = v15;
        a1[8] = a2[8];
        *((void *)a1 + 18) = *((void *)a2 + 18);
        uint64_t v16 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        unint64_t v17 = (char *)a1 + v16;
        uint64_t v18 = (char *)a2 + v16;
        uint64_t v19 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
        goto LABEL_47;
      case 2u:
        *a1 = *a2;
        uint64_t v20 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        uint64_t v23 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
        goto LABEL_47;
      case 3u:
        *a1 = *a2;
        uint64_t v24 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v25 = (char *)a1 + v24;
        uint64_t v26 = (char *)a2 + v24;
        uint64_t v27 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
        goto LABEL_47;
      case 4u:
        long long v28 = a2[1];
        *a1 = *a2;
        a1[1] = v28;
        uint64_t v29 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v30 = (char *)a1 + v29;
        uint64_t v31 = (char *)a2 + v29;
        uint64_t v32 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
        goto LABEL_47;
      case 5u:
        long long v33 = a2[1];
        *a1 = *a2;
        a1[1] = v33;
        uint64_t v34 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v35 = *(int *)(v34 + 24);
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v38 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v37, 1, v38))
        {
          uint64_t v39 = sub_10000488C(&qword_1000592A0);
          memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
LABEL_46:
          uint64_t v111 = *(int *)(v34 + 28);
          uint64_t v112 = (char *)a1 + v111;
          uint64_t v113 = (char *)a2 + v111;
          uint64_t v114 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v114 - 8) + 32))(v112, v113, v114);
LABEL_47:
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)a1, 0, 1, v6);
          goto LABEL_48;
        }
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 2)
        {
          *uint64_t v36 = *v37;
          uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
        }
        else
        {
          if (EnumCaseMultiPayload == 1)
          {
            *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
            uint64_t v64 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v65 = *(int *)(v64 + 20);
            uint64_t v126 = &v37[v65];
            uint64_t v128 = &v36[v65];
            uint64_t v66 = sub_100046870();
            uint64_t v67 = v126;
            uint64_t v123 = *(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32);
            uint64_t v127 = v66;
            ((void (*)(unsigned char *, unsigned char *))v123)(v128, v67);
            uint64_t v68 = *(int *)(v64 + 24);
            uint64_t v69 = &v36[v68];
            uint64_t v70 = &v37[v68];
            uint64_t v129 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v70, 1, v129))
            {
              uint64_t v71 = sub_10000488C(&qword_1000592B8);
              memcpy(v69, v70, *(void *)(*(void *)(v71 - 8) + 64));
            }
            else
            {
              *uint64_t v69 = *v70;
              v123((char *)v69 + *(int *)(v129 + 20), (char *)v70 + *(int *)(v129 + 20), v127);
              sub_100004938((uint64_t)v69, 0, 1, v129);
            }
            goto LABEL_45;
          }
          *(void *)uint64_t v36 = *(void *)v37;
          v36[8] = v37[8];
          uint64_t v106 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        }
        uint64_t v107 = *(int *)(v106 + 20);
        uint64_t v108 = &v36[v107];
        uint64_t v109 = &v37[v107];
        uint64_t v110 = sub_100046870();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v110 - 8) + 32))(v108, v109, v110);
LABEL_45:
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v36, 0, 1, v38);
        goto LABEL_46;
      case 6u:
        *a1 = *a2;
        uint64_t v40 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v41 = v40[5];
        uint64_t v42 = (char *)a1 + v41;
        uint64_t v43 = (char *)a2 + v41;
        uint64_t v44 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v43, 1, v44))
        {
          uint64_t v45 = sub_10000488C(&qword_1000592C8);
          memcpy(v42, v43, *(void *)(*(void *)(v45 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            *(void *)uint64_t v42 = *(void *)v43;
            v42[8] = v43[8];
            uint64_t v72 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                         + 20);
          }
          else
          {
            *uint64_t v42 = *v43;
            uint64_t v72 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                         + 20);
          }
          uint64_t v73 = &v42[v72];
          uint64_t v74 = &v43[v72];
          uint64_t v75 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v75 - 8) + 32))(v73, v74, v75);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v42, 0, 1, v44);
        }
        uint64_t v76 = v40[6];
        uint64_t v77 = (char *)a1 + v76;
        uint64_t v78 = (char *)a2 + v76;
        uint64_t v79 = sub_100046870();
        uint64_t v80 = *(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32);
        v80(v77, v78, v79);
        uint64_t v81 = v40[7];
        uint64_t v82 = (void *)((char *)a1 + v81);
        uint64_t v83 = (void *)((char *)a2 + v81);
        uint64_t v84 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v83, 1, (uint64_t)v84))
        {
          uint64_t v85 = sub_10000488C(&qword_1000592D8);
          memcpy(v82, v83, *(void *)(*(void *)(v85 - 8) + 64));
        }
        else
        {
          *uint64_t v82 = *v83;
          v80((char *)v82 + v84[5], (char *)v83 + v84[5], v79);
          uint64_t v86 = v84[6];
          uint64_t v130 = v80;
          unint64_t v87 = (void *)((char *)v82 + v86);
          uint64_t v88 = (void *)((char *)v83 + v86);
          uint64_t v124 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v88, 1, v124))
          {
            uint64_t v89 = sub_10000488C(&qword_1000592F8);
            memcpy(v87, v88, *(void *)(*(void *)(v89 - 8) + 64));
          }
          else
          {
            *unint64_t v87 = *v88;
            *((unsigned char *)v87 + 8) = *((unsigned char *)v88 + 8);
            v87[2] = v88[2];
            *((unsigned char *)v87 + 24) = *((unsigned char *)v88 + 24);
            v87[4] = v88[4];
            *((unsigned char *)v87 + 40) = *((unsigned char *)v88 + 40);
            v130((char *)v87 + *(int *)(v124 + 28), (char *)v88 + *(int *)(v124 + 28), v79);
            sub_100004938((uint64_t)v87, 0, 1, v124);
          }
          uint64_t v101 = v84[7];
          uint64_t v102 = (void *)((char *)v82 + v101);
          uint64_t v103 = (void *)((char *)v83 + v101);
          uint64_t v104 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v103, 1, v104))
          {
            uint64_t v105 = sub_10000488C(&qword_1000592E8);
            memcpy(v102, v103, *(void *)(*(void *)(v105 - 8) + 64));
          }
          else
          {
            *(_OWORD *)uint64_t v102 = *(_OWORD *)v103;
            v102[2] = v103[2];
            v130((char *)v102 + *(int *)(v104 + 24), (char *)v103 + *(int *)(v104 + 24), v79);
            sub_100004938((uint64_t)v102, 0, 1, v104);
          }
          sub_100004938((uint64_t)v82, 0, 1, (uint64_t)v84);
        }
        goto LABEL_47;
      case 7u:
        *a1 = *a2;
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
        uint64_t v46 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v47 = *(int *)(v46 + 24);
        unint64_t v48 = (char *)a1 + v47;
        uint64_t v49 = (char *)a2 + v47;
        uint64_t v50 = sub_100046870();
        uint64_t v51 = (void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32);
        uint64_t v52 = v48;
        uint64_t v53 = *v51;
        (*v51)(v52, v49, v50);
        uint64_t v125 = v46;
        uint64_t v54 = *(int *)(v46 + 28);
        uint64_t v55 = (void *)((char *)a1 + v54);
        unint64_t v56 = (void *)((char *)a2 + v54);
        uint64_t v57 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        unint64_t v122 = v53;
        if (sub_100004B4C((uint64_t)v56, 1, (uint64_t)v57))
        {
          uint64_t v58 = sub_10000488C(&qword_1000592D8);
          memcpy(v55, v56, *(void *)(*(void *)(v58 - 8) + 64));
        }
        else
        {
          *uint64_t v55 = *v56;
          v53((char *)v55 + v57[5], (char *)v56 + v57[5], v50);
          uint64_t v59 = v57[6];
          uint64_t v121 = v50;
          uint64_t v60 = (void *)((char *)v55 + v59);
          uint64_t v61 = (void *)((char *)v56 + v59);
          uint64_t v120 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v61, 1, v120))
          {
            uint64_t v62 = sub_10000488C(&qword_1000592F8);
            memcpy(v60, v61, *(void *)(*(void *)(v62 - 8) + 64));
          }
          else
          {
            *uint64_t v60 = *v61;
            *((unsigned char *)v60 + 8) = *((unsigned char *)v61 + 8);
            v60[2] = v61[2];
            *((unsigned char *)v60 + 24) = *((unsigned char *)v61 + 24);
            v60[4] = v61[4];
            *((unsigned char *)v60 + 40) = *((unsigned char *)v61 + 40);
            v122((char *)v60 + *(int *)(v120 + 28), (char *)v61 + *(int *)(v120 + 28), v121);
            sub_100004938((uint64_t)v60, 0, 1, v120);
          }
          uint64_t v90 = v57[7];
          uint64_t v91 = (void *)((char *)v55 + v90);
          uint64_t v92 = (void *)((char *)v56 + v90);
          uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v92, 1, v93))
          {
            uint64_t v94 = sub_10000488C(&qword_1000592E8);
            memcpy(v91, v92, *(void *)(*(void *)(v94 - 8) + 64));
          }
          else
          {
            *(_OWORD *)uint64_t v91 = *(_OWORD *)v92;
            v91[2] = v92[2];
            v122((char *)v91 + *(int *)(v93 + 24), (char *)v92 + *(int *)(v93 + 24), v121);
            sub_100004938((uint64_t)v91, 0, 1, v93);
          }
          sub_100004938((uint64_t)v55, 0, 1, (uint64_t)v57);
          uint64_t v50 = v121;
        }
        uint64_t v95 = *(int *)(v125 + 32);
        uint64_t v96 = (_OWORD *)((char *)a1 + v95);
        uint64_t v97 = (_OWORD *)((char *)a2 + v95);
        uint64_t v98 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v97, 1, v98))
        {
          uint64_t v99 = sub_10000488C(&qword_100059310);
          memcpy(v96, v97, *(void *)(*(void *)(v99 - 8) + 64));
        }
        else
        {
          *uint64_t v96 = *v97;
          uint64_t v100 = *((void *)v97 + 3);
          *((void *)v96 + 2) = *((void *)v97 + 2);
          *((void *)v96 + 3) = v100;
          *((unsigned char *)v96 + 32) = *((unsigned char *)v97 + 32);
          v122((char *)v96 + *(int *)(v98 + 28), (char *)v97 + *(int *)(v98 + 28), v50);
          sub_100004938((uint64_t)v96, 0, 1, v98);
        }
        goto LABEL_47;
      default:
        *a1 = *a2;
        uint64_t v8 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v9 = (char *)a1 + v8;
        unint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
        goto LABEL_47;
    }
  }
  uint64_t v7 = sub_10000488C(&qword_100059228);
  memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
LABEL_48:
  uint64_t v115 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v116 = (char *)a1 + v115;
  uint64_t v117 = (char *)a2 + v115;
  uint64_t v118 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v118 - 8) + 32))(v116, v117, v118);
  return a1;
}

_OWORD *sub_100024830(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  int v7 = sub_100004B4C((uint64_t)a1, 1, v6);
  int v8 = sub_100004B4C((uint64_t)a2, 1, v6);
  if (v7)
  {
    if (!v8)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          long long v18 = a2[1];
          *a1 = *a2;
          a1[1] = v18;
          long long v19 = a2[3];
          a1[2] = a2[2];
          a1[3] = v19;
          long long v20 = a2[5];
          a1[4] = a2[4];
          a1[5] = v20;
          *((void *)a1 + 12) = *((void *)a2 + 12);
          *((_WORD *)a1 + 52) = *((_WORD *)a2 + 52);
          uint64_t v21 = *((void *)a2 + 14);
          *((unsigned char *)a1 + 120) = *((unsigned char *)a2 + 120);
          *((void *)a1 + 14) = v21;
          a1[8] = a2[8];
          *((void *)a1 + 18) = *((void *)a2 + 18);
          uint64_t v22 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
          uint64_t v23 = (char *)a1 + v22;
          uint64_t v24 = (char *)a2 + v22;
          uint64_t v25 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
          goto LABEL_71;
        case 2u:
          *a1 = *a2;
          uint64_t v26 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
          uint64_t v27 = (char *)a1 + v26;
          long long v28 = (char *)a2 + v26;
          uint64_t v29 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
          goto LABEL_71;
        case 3u:
          *a1 = *a2;
          uint64_t v30 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
          uint64_t v31 = (char *)a1 + v30;
          uint64_t v32 = (char *)a2 + v30;
          uint64_t v33 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
          goto LABEL_71;
        case 4u:
          long long v34 = a2[1];
          *a1 = *a2;
          a1[1] = v34;
          uint64_t v35 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
          uint64_t v36 = (char *)a1 + v35;
          uint64_t v37 = (char *)a2 + v35;
          uint64_t v38 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
          goto LABEL_71;
        case 5u:
          long long v39 = a2[1];
          *a1 = *a2;
          a1[1] = v39;
          uint64_t v40 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
          uint64_t v41 = *(int *)(v40 + 24);
          uint64_t v42 = (char *)a1 + v41;
          uint64_t v43 = (char *)a2 + v41;
          uint64_t v44 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
          if (sub_100004B4C((uint64_t)v43, 1, v44))
          {
            uint64_t v45 = sub_10000488C(&qword_1000592A0);
            memcpy(v42, v43, *(void *)(*(void *)(v45 - 8) + 64));
LABEL_70:
            uint64_t v181 = *(int *)(v40 + 28);
            uint64_t v182 = (char *)a1 + v181;
            uint64_t v183 = (char *)a2 + v181;
            uint64_t v184 = sub_100046870();
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v182, v183, v184);
LABEL_71:
            swift_storeEnumTagMultiPayload();
            sub_100004938((uint64_t)a1, 0, 1, v6);
            goto LABEL_98;
          }
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload == 2)
          {
            *uint64_t v42 = *v43;
            uint64_t v176 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
          }
          else
          {
            if (EnumCaseMultiPayload == 1)
            {
              *(_OWORD *)uint64_t v42 = *(_OWORD *)v43;
              uint64_t v113 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
              uint64_t v114 = *(int *)(v113 + 20);
              uint64_t v240 = &v43[v114];
              v245 = &v42[v114];
              uint64_t v115 = sub_100046870();
              uint64_t v116 = v240;
              v233 = *(void (**)(char *, char *, uint64_t))(*(void *)(v115 - 8) + 32);
              uint64_t v241 = v115;
              ((void (*)(unsigned char *, unsigned char *))v233)(v245, v116);
              uint64_t v117 = *(int *)(v113 + 24);
              uint64_t v118 = &v42[v117];
              uint64_t v119 = &v43[v117];
              uint64_t v246 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
              if (sub_100004B4C((uint64_t)v119, 1, v246))
              {
                uint64_t v120 = sub_10000488C(&qword_1000592B8);
                memcpy(v118, v119, *(void *)(*(void *)(v120 - 8) + 64));
              }
              else
              {
                _OWORD *v118 = *v119;
                v233((char *)v118 + *(int *)(v246 + 20), (char *)v119 + *(int *)(v246 + 20), v241);
                sub_100004938((uint64_t)v118, 0, 1, v246);
              }
              goto LABEL_69;
            }
            *(void *)uint64_t v42 = *(void *)v43;
            v42[8] = v43[8];
            uint64_t v176 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
          }
          uint64_t v177 = *(int *)(v176 + 20);
          uint64_t v178 = &v42[v177];
          v179 = &v43[v177];
          uint64_t v180 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v180 - 8) + 32))(v178, v179, v180);
LABEL_69:
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v42, 0, 1, v44);
          goto LABEL_70;
        case 6u:
          *a1 = *a2;
          uint64_t v46 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
          uint64_t v47 = v46[5];
          unint64_t v48 = (char *)a1 + v47;
          uint64_t v49 = (char *)a2 + v47;
          uint64_t v50 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
          if (sub_100004B4C((uint64_t)v49, 1, v50))
          {
            uint64_t v51 = sub_10000488C(&qword_1000592C8);
            memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
          }
          else
          {
            if (swift_getEnumCaseMultiPayload() == 1)
            {
              *(void *)unint64_t v48 = *(void *)v49;
              v48[8] = v49[8];
              uint64_t v121 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                            + 20);
            }
            else
            {
              unsigned char *v48 = *v49;
              uint64_t v121 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                            + 20);
            }
            unint64_t v122 = &v48[v121];
            uint64_t v123 = &v49[v121];
            uint64_t v124 = sub_100046870();
            (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v124 - 8) + 32))(v122, v123, v124);
            swift_storeEnumTagMultiPayload();
            sub_100004938((uint64_t)v48, 0, 1, v50);
          }
          uint64_t v129 = v46[6];
          uint64_t v130 = (char *)a1 + v129;
          uint64_t v131 = (char *)a2 + v129;
          uint64_t v132 = sub_100046870();
          uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 32);
          v133(v130, v131, v132);
          uint64_t v134 = v46[7];
          uint64_t v135 = (void *)((char *)a1 + v134);
          uint64_t v136 = (void *)((char *)a2 + v134);
          uint64_t v137 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          if (sub_100004B4C((uint64_t)v136, 1, (uint64_t)v137))
          {
            uint64_t v138 = sub_10000488C(&qword_1000592D8);
            memcpy(v135, v136, *(void *)(*(void *)(v138 - 8) + 64));
          }
          else
          {
            *uint64_t v135 = *v136;
            v133((char *)v135 + v137[5], (char *)v136 + v137[5], v132);
            uint64_t v139 = v137[6];
            uint64_t v247 = v133;
            uint64_t v140 = (void *)((char *)v135 + v139);
            uint64_t v141 = (void *)((char *)v136 + v139);
            uint64_t v235 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            if (sub_100004B4C((uint64_t)v141, 1, v235))
            {
              uint64_t v142 = sub_10000488C(&qword_1000592F8);
              memcpy(v140, v141, *(void *)(*(void *)(v142 - 8) + 64));
            }
            else
            {
              *uint64_t v140 = *v141;
              *((unsigned char *)v140 + 8) = *((unsigned char *)v141 + 8);
              v140[2] = v141[2];
              *((unsigned char *)v140 + 24) = *((unsigned char *)v141 + 24);
              v140[4] = v141[4];
              *((unsigned char *)v140 + 40) = *((unsigned char *)v141 + 40);
              v247((char *)v140 + *(int *)(v235 + 28), (char *)v141 + *(int *)(v235 + 28), v132);
              sub_100004938((uint64_t)v140, 0, 1, v235);
            }
            uint64_t v171 = v137[7];
            v172 = (void *)((char *)v135 + v171);
            uint64_t v173 = (void *)((char *)v136 + v171);
            uint64_t v174 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v173, 1, v174))
            {
              uint64_t v175 = sub_10000488C(&qword_1000592E8);
              memcpy(v172, v173, *(void *)(*(void *)(v175 - 8) + 64));
            }
            else
            {
              *(_OWORD *)v172 = *(_OWORD *)v173;
              v172[2] = v173[2];
              v247((char *)v172 + *(int *)(v174 + 24), (char *)v173 + *(int *)(v174 + 24), v132);
              sub_100004938((uint64_t)v172, 0, 1, v174);
            }
            sub_100004938((uint64_t)v135, 0, 1, (uint64_t)v137);
          }
          goto LABEL_71;
        case 7u:
          *a1 = *a2;
          *((void *)a1 + 2) = *((void *)a2 + 2);
          *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
          uint64_t v52 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
          uint64_t v53 = *(int *)(v52 + 24);
          uint64_t v54 = (char *)a1 + v53;
          uint64_t v55 = (char *)a2 + v53;
          uint64_t v56 = sub_100046870();
          uint64_t v57 = (void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32);
          uint64_t v58 = v54;
          uint64_t v59 = *v57;
          (*v57)(v58, v55, v56);
          uint64_t v244 = v52;
          uint64_t v60 = *(int *)(v52 + 28);
          uint64_t v61 = (void *)((char *)a1 + v60);
          uint64_t v62 = (void *)((char *)a2 + v60);
          uint64_t v63 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
          v238 = v59;
          if (sub_100004B4C((uint64_t)v62, 1, (uint64_t)v63))
          {
            uint64_t v64 = sub_10000488C(&qword_1000592D8);
            memcpy(v61, v62, *(void *)(*(void *)(v64 - 8) + 64));
          }
          else
          {
            *uint64_t v61 = *v62;
            v59((char *)v61 + v63[5], (char *)v62 + v63[5], v56);
            uint64_t v125 = v63[6];
            uint64_t v234 = v56;
            uint64_t v126 = (void *)((char *)v61 + v125);
            uint64_t v127 = (void *)((char *)v62 + v125);
            uint64_t v229 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
            if (sub_100004B4C((uint64_t)v127, 1, v229))
            {
              uint64_t v128 = sub_10000488C(&qword_1000592F8);
              memcpy(v126, v127, *(void *)(*(void *)(v128 - 8) + 64));
            }
            else
            {
              *uint64_t v126 = *v127;
              *((unsigned char *)v126 + 8) = *((unsigned char *)v127 + 8);
              v126[2] = v127[2];
              *((unsigned char *)v126 + 24) = *((unsigned char *)v127 + 24);
              v126[4] = v127[4];
              *((unsigned char *)v126 + 40) = *((unsigned char *)v127 + 40);
              v238((char *)v126 + *(int *)(v229 + 28), (char *)v127 + *(int *)(v229 + 28), v234);
              sub_100004938((uint64_t)v126, 0, 1, v229);
            }
            uint64_t v147 = v63[7];
            uint64_t v148 = (void *)((char *)v61 + v147);
            uint64_t v149 = (void *)((char *)v62 + v147);
            uint64_t v150 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
            if (sub_100004B4C((uint64_t)v149, 1, v150))
            {
              uint64_t v151 = sub_10000488C(&qword_1000592E8);
              memcpy(v148, v149, *(void *)(*(void *)(v151 - 8) + 64));
            }
            else
            {
              *(_OWORD *)uint64_t v148 = *(_OWORD *)v149;
              v148[2] = v149[2];
              v238((char *)v148 + *(int *)(v150 + 24), (char *)v149 + *(int *)(v150 + 24), v234);
              sub_100004938((uint64_t)v148, 0, 1, v150);
            }
            sub_100004938((uint64_t)v61, 0, 1, (uint64_t)v63);
            uint64_t v56 = v234;
          }
          uint64_t v152 = *(int *)(v244 + 32);
          uint64_t v153 = (_OWORD *)((char *)a1 + v152);
          uint64_t v154 = (_OWORD *)((char *)a2 + v152);
          uint64_t v155 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
          if (sub_100004B4C((uint64_t)v154, 1, v155))
          {
            uint64_t v156 = sub_10000488C(&qword_100059310);
            memcpy(v153, v154, *(void *)(*(void *)(v156 - 8) + 64));
          }
          else
          {
            *uint64_t v153 = *v154;
            uint64_t v157 = *((void *)v154 + 3);
            *((void *)v153 + 2) = *((void *)v154 + 2);
            *((void *)v153 + 3) = v157;
            *((unsigned char *)v153 + 32) = *((unsigned char *)v154 + 32);
            v238((char *)v153 + *(int *)(v155 + 28), (char *)v154 + *(int *)(v155 + 28), v56);
            sub_100004938((uint64_t)v153, 0, 1, v155);
          }
          goto LABEL_71;
        default:
          *a1 = *a2;
          uint64_t v9 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
          unint64_t v10 = (char *)a1 + v9;
          uint64_t v11 = (char *)a2 + v9;
          uint64_t v12 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
          goto LABEL_71;
      }
    }
    goto LABEL_7;
  }
  if (!v8)
  {
    if (a1 == a2) {
      goto LABEL_98;
    }
    sub_100018A8C((uint64_t)a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        long long v65 = a2[1];
        *a1 = *a2;
        a1[1] = v65;
        long long v66 = a2[3];
        a1[2] = a2[2];
        a1[3] = v66;
        long long v67 = a2[5];
        a1[4] = a2[4];
        a1[5] = v67;
        *((void *)a1 + 12) = *((void *)a2 + 12);
        *((_WORD *)a1 + 52) = *((_WORD *)a2 + 52);
        uint64_t v68 = *((void *)a2 + 14);
        *((unsigned char *)a1 + 120) = *((unsigned char *)a2 + 120);
        *((void *)a1 + 14) = v68;
        a1[8] = a2[8];
        *((void *)a1 + 18) = *((void *)a2 + 18);
        uint64_t v69 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0) + 60);
        uint64_t v70 = (char *)a1 + v69;
        uint64_t v71 = (char *)a2 + v69;
        uint64_t v72 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
        goto LABEL_97;
      case 2u:
        *a1 = *a2;
        uint64_t v73 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0) + 20);
        uint64_t v74 = (char *)a1 + v73;
        uint64_t v75 = (char *)a2 + v73;
        uint64_t v76 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
        goto LABEL_97;
      case 3u:
        *a1 = *a2;
        uint64_t v77 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0) + 20);
        uint64_t v78 = (char *)a1 + v77;
        uint64_t v79 = (char *)a2 + v77;
        uint64_t v80 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 32))(v78, v79, v80);
        goto LABEL_97;
      case 4u:
        long long v81 = a2[1];
        *a1 = *a2;
        a1[1] = v81;
        uint64_t v82 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0) + 24);
        uint64_t v83 = (char *)a1 + v82;
        uint64_t v84 = (char *)a2 + v82;
        uint64_t v85 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 32))(v83, v84, v85);
        goto LABEL_97;
      case 5u:
        long long v86 = a2[1];
        *a1 = *a2;
        a1[1] = v86;
        uint64_t v87 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
        uint64_t v88 = *(int *)(v87 + 24);
        uint64_t v89 = (char *)a1 + v88;
        uint64_t v90 = (char *)a2 + v88;
        uint64_t v91 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v90, 1, v91))
        {
          uint64_t v92 = sub_10000488C(&qword_1000592A0);
          memcpy(v89, v90, *(void *)(*(void *)(v92 - 8) + 64));
LABEL_96:
          uint64_t v220 = *(int *)(v87 + 28);
          uint64_t v221 = (char *)a1 + v220;
          uint64_t v222 = (char *)a2 + v220;
          uint64_t v223 = sub_100046870();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v223 - 8) + 32))(v221, v222, v223);
LABEL_97:
          swift_storeEnumTagMultiPayload();
          goto LABEL_98;
        }
        int v158 = swift_getEnumCaseMultiPayload();
        if (v158 == 2)
        {
          *uint64_t v89 = *v90;
          uint64_t v215 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
        }
        else
        {
          if (v158 == 1)
          {
            *(_OWORD *)uint64_t v89 = *(_OWORD *)v90;
            uint64_t v159 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
            uint64_t v160 = *(int *)(v159 + 20);
            uint64_t v242 = &v90[v160];
            uint64_t v248 = &v89[v160];
            uint64_t v161 = sub_100046870();
            uint64_t v162 = v242;
            uint64_t v236 = *(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 32);
            uint64_t v243 = v161;
            ((void (*)(unsigned char *, unsigned char *))v236)(v248, v162);
            uint64_t v163 = *(int *)(v159 + 24);
            uint64_t v164 = &v89[v163];
            uint64_t v165 = &v90[v163];
            uint64_t v249 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
            if (sub_100004B4C((uint64_t)v165, 1, v249))
            {
              uint64_t v166 = sub_10000488C(&qword_1000592B8);
              memcpy(v164, v165, *(void *)(*(void *)(v166 - 8) + 64));
            }
            else
            {
              *uint64_t v164 = *v165;
              v236((char *)v164 + *(int *)(v249 + 20), (char *)v165 + *(int *)(v249 + 20), v243);
              sub_100004938((uint64_t)v164, 0, 1, v249);
            }
            goto LABEL_95;
          }
          *(void *)uint64_t v89 = *(void *)v90;
          v89[8] = v90[8];
          uint64_t v215 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
        }
        uint64_t v216 = *(int *)(v215 + 20);
        uint64_t v217 = &v89[v216];
        v218 = &v90[v216];
        uint64_t v219 = sub_100046870();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v219 - 8) + 32))(v217, v218, v219);
LABEL_95:
        swift_storeEnumTagMultiPayload();
        sub_100004938((uint64_t)v89, 0, 1, v91);
        goto LABEL_96;
      case 6u:
        *a1 = *a2;
        uint64_t v93 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
        uint64_t v94 = v93[5];
        uint64_t v95 = (char *)a1 + v94;
        uint64_t v96 = (char *)a2 + v94;
        uint64_t v97 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
        if (sub_100004B4C((uint64_t)v96, 1, v97))
        {
          uint64_t v98 = sub_10000488C(&qword_1000592C8);
          memcpy(v95, v96, *(void *)(*(void *)(v98 - 8) + 64));
        }
        else
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            *(void *)uint64_t v95 = *(void *)v96;
            v95[8] = v96[8];
            uint64_t v167 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                          + 20);
          }
          else
          {
            *uint64_t v95 = *v96;
            uint64_t v167 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                          + 20);
          }
          uint64_t v168 = &v95[v167];
          uint64_t v169 = &v96[v167];
          uint64_t v170 = sub_100046870();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v170 - 8) + 32))(v168, v169, v170);
          swift_storeEnumTagMultiPayload();
          sub_100004938((uint64_t)v95, 0, 1, v97);
        }
        uint64_t v185 = v93[6];
        uint64_t v186 = (char *)a1 + v185;
        v187 = (char *)a2 + v185;
        uint64_t v188 = sub_100046870();
        uint64_t v189 = *(void (**)(char *, char *, uint64_t))(*(void *)(v188 - 8) + 32);
        v189(v186, v187, v188);
        uint64_t v190 = v93[7];
        uint64_t v191 = (void *)((char *)a1 + v190);
        uint64_t v192 = (void *)((char *)a2 + v190);
        v193 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        if (sub_100004B4C((uint64_t)v192, 1, (uint64_t)v193))
        {
          uint64_t v194 = sub_10000488C(&qword_1000592D8);
          memcpy(v191, v192, *(void *)(*(void *)(v194 - 8) + 64));
        }
        else
        {
          *uint64_t v191 = *v192;
          v189((char *)v191 + v193[5], (char *)v192 + v193[5], v188);
          uint64_t v195 = v193[6];
          v250 = v189;
          uint64_t v196 = (void *)((char *)v191 + v195);
          uint64_t v197 = (void *)((char *)v192 + v195);
          uint64_t v237 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v197, 1, v237))
          {
            uint64_t v198 = sub_10000488C(&qword_1000592F8);
            memcpy(v196, v197, *(void *)(*(void *)(v198 - 8) + 64));
          }
          else
          {
            *uint64_t v196 = *v197;
            *((unsigned char *)v196 + 8) = *((unsigned char *)v197 + 8);
            v196[2] = v197[2];
            *((unsigned char *)v196 + 24) = *((unsigned char *)v197 + 24);
            v196[4] = v197[4];
            *((unsigned char *)v196 + 40) = *((unsigned char *)v197 + 40);
            v250((char *)v196 + *(int *)(v237 + 28), (char *)v197 + *(int *)(v237 + 28), v188);
            sub_100004938((uint64_t)v196, 0, 1, v237);
          }
          uint64_t v210 = v193[7];
          uint64_t v211 = (void *)((char *)v191 + v210);
          uint64_t v212 = (void *)((char *)v192 + v210);
          uint64_t v213 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v212, 1, v213))
          {
            uint64_t v214 = sub_10000488C(&qword_1000592E8);
            memcpy(v211, v212, *(void *)(*(void *)(v214 - 8) + 64));
          }
          else
          {
            *(_OWORD *)uint64_t v211 = *(_OWORD *)v212;
            v211[2] = v212[2];
            v250((char *)v211 + *(int *)(v213 + 24), (char *)v212 + *(int *)(v213 + 24), v188);
            sub_100004938((uint64_t)v211, 0, 1, v213);
          }
          sub_100004938((uint64_t)v191, 0, 1, (uint64_t)v193);
        }
        goto LABEL_97;
      case 7u:
        *a1 = *a2;
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
        uint64_t v99 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
        uint64_t v100 = *(int *)(v99 + 24);
        uint64_t v101 = (char *)a1 + v100;
        uint64_t v102 = (char *)a2 + v100;
        uint64_t v103 = sub_100046870();
        uint64_t v104 = (void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 32);
        uint64_t v105 = v101;
        uint64_t v106 = *v104;
        (*v104)(v105, v102, v103);
        uint64_t v239 = v99;
        uint64_t v107 = *(int *)(v99 + 28);
        uint64_t v108 = (void *)((char *)a1 + v107);
        uint64_t v109 = (void *)((char *)a2 + v107);
        uint64_t v110 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
        v232 = v106;
        if (sub_100004B4C((uint64_t)v109, 1, (uint64_t)v110))
        {
          uint64_t v111 = sub_10000488C(&qword_1000592D8);
          memcpy(v108, v109, *(void *)(*(void *)(v111 - 8) + 64));
        }
        else
        {
          *uint64_t v108 = *v109;
          v106((char *)v108 + v110[5], (char *)v109 + v110[5], v103);
          uint64_t v143 = v110[6];
          uint64_t v231 = v103;
          uint64_t v144 = (void *)((char *)v108 + v143);
          uint64_t v145 = (void *)((char *)v109 + v143);
          uint64_t v230 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
          if (sub_100004B4C((uint64_t)v145, 1, v230))
          {
            uint64_t v146 = sub_10000488C(&qword_1000592F8);
            memcpy(v144, v145, *(void *)(*(void *)(v146 - 8) + 64));
          }
          else
          {
            *uint64_t v144 = *v145;
            *((unsigned char *)v144 + 8) = *((unsigned char *)v145 + 8);
            v144[2] = v145[2];
            *((unsigned char *)v144 + 24) = *((unsigned char *)v145 + 24);
            v144[4] = v145[4];
            *((unsigned char *)v144 + 40) = *((unsigned char *)v145 + 40);
            v232((char *)v144 + *(int *)(v230 + 28), (char *)v145 + *(int *)(v230 + 28), v231);
            sub_100004938((uint64_t)v144, 0, 1, v230);
          }
          uint64_t v199 = v110[7];
          v200 = (void *)((char *)v108 + v199);
          v201 = (void *)((char *)v109 + v199);
          uint64_t v202 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
          if (sub_100004B4C((uint64_t)v201, 1, v202))
          {
            uint64_t v203 = sub_10000488C(&qword_1000592E8);
            memcpy(v200, v201, *(void *)(*(void *)(v203 - 8) + 64));
          }
          else
          {
            *(_OWORD *)v200 = *(_OWORD *)v201;
            v200[2] = v201[2];
            v232((char *)v200 + *(int *)(v202 + 24), (char *)v201 + *(int *)(v202 + 24), v231);
            sub_100004938((uint64_t)v200, 0, 1, v202);
          }
          sub_100004938((uint64_t)v108, 0, 1, (uint64_t)v110);
          uint64_t v103 = v231;
        }
        uint64_t v204 = *(int *)(v239 + 32);
        uint64_t v205 = (_OWORD *)((char *)a1 + v204);
        v206 = (_OWORD *)((char *)a2 + v204);
        uint64_t v207 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
        if (sub_100004B4C((uint64_t)v206, 1, v207))
        {
          uint64_t v208 = sub_10000488C(&qword_100059310);
          memcpy(v205, v206, *(void *)(*(void *)(v208 - 8) + 64));
        }
        else
        {
          *uint64_t v205 = *v206;
          uint64_t v209 = *((void *)v206 + 3);
          *((void *)v205 + 2) = *((void *)v206 + 2);
          *((void *)v205 + 3) = v209;
          *((unsigned char *)v205 + 32) = *((unsigned char *)v206 + 32);
          v232((char *)v205 + *(int *)(v207 + 28), (char *)v206 + *(int *)(v207 + 28), v103);
          sub_100004938((uint64_t)v205, 0, 1, v207);
        }
        goto LABEL_97;
      default:
        *a1 = *a2;
        uint64_t v14 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0) + 20);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (char *)a2 + v14;
        uint64_t v17 = sub_100046870();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
        goto LABEL_97;
    }
  }
  sub_100018A8C((uint64_t)a1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
LABEL_7:
  uint64_t v13 = sub_10000488C(&qword_100059228);
  memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_98:
  uint64_t v224 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v225 = (char *)a1 + v224;
  uint64_t v226 = (char *)a2 + v224;
  uint64_t v227 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 40))(v225, v226, v227);
  return a1;
}

uint64_t sub_1000261C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000261D4);
}

uint64_t sub_1000261D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000488C(&qword_100059228);
  sub_100030BF4();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v8 = sub_100046870();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }

  return sub_100004B4C(v9, a2, v8);
}

uint64_t sub_100026258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002626C);
}

uint64_t sub_10002626C()
{
  sub_10003164C();
  sub_10000488C(&qword_100059228);
  sub_100030BF4();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v1;
  }
  else
  {
    uint64_t v6 = sub_100046870();
    uint64_t v7 = v1 + *(int *)(v2 + 24);
  }

  return sub_100004938(v7, v0, v0, v6);
}

void sub_1000262EC()
{
  sub_100027BBC(319, (unint64_t *)&unk_100059688, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
  if (v0 <= 0x3F)
  {
    sub_100046870();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void *sub_1000263DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    void *v3 = *a2;
    int v3 = (void *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = a2[7];
    *(void *)(a1 + 48) = a2[6];
    *(void *)(a1 + 56) = v8;
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v9 = *(int *)(a3 + 40);
    uint64_t v10 = (uint64_t)a2 + v9;
    uint64_t v11 = a1 + v9;
    *(_DWORD *)(a1 + 68) = *((_DWORD *)a2 + 17);
    uint64_t v12 = sub_100046870();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v11, v10, v12);
  }
  return v3;
}

uint64_t sub_100026504(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10002658C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(int *)(a3 + 40);
  uint64_t v9 = a2 + v8;
  uint64_t v10 = a1 + v8;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  uint64_t v11 = sub_100046870();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v10, v9, v11);
  return a1;
}

uint64_t sub_100026664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = v6;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  uint64_t v7 = *(int *)(a3 + 40);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100026760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v6 = *(int *)(a3 + 40);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  uint64_t v9 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_1000267FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_1000268C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000268D4);
}

uint64_t sub_1000268D4()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 8));
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v1 + 40));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_100026938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002694C);
}

void sub_10002694C()
{
  sub_100030DD4();
  if (v1)
  {
    sub_100031474();
  }
  else
  {
    sub_10003119C();
    uint64_t v2 = sub_100030DB0(*(int *)(v0 + 40));
    sub_100004938(v2, v3, v4, v5);
  }
}

uint64_t sub_1000269AC()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100026A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026A98);
}

uint64_t sub_100026A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026AB0);
}

uint64_t sub_100026AB4()
{
  return sub_10002AD2C();
}

uint64_t sub_100026AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026AE8);
}

uint64_t sub_100026AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100026B00);
}

uint64_t sub_100026B04()
{
  return sub_10002AD2C();
}

uint64_t *sub_100026B10(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_100046870();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    v11(v8, v9, v10);
    uint64_t v12 = a3[6];
    uint64_t v13 = (uint64_t *)((char *)v4 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (sub_100004B4C((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = sub_10000488C(&qword_1000592F8);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      *uint64_t v13 = *v14;
      *((unsigned char *)v13 + 8) = *((unsigned char *)v14 + 8);
      v13[2] = v14[2];
      *((unsigned char *)v13 + 24) = *((unsigned char *)v14 + 24);
      v13[4] = v14[4];
      *((unsigned char *)v13 + 40) = *((unsigned char *)v14 + 40);
      v11((char *)v13 + *(int *)(v15 + 28), (char *)v14 + *(int *)(v15 + 28), v10);
      sub_100004938((uint64_t)v13, 0, 1, v15);
    }
    uint64_t v18 = a3[7];
    long long v19 = (uint64_t *)((char *)v4 + v18);
    long long v20 = (uint64_t *)((char *)a2 + v18);
    uint64_t v21 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    if (sub_100004B4C((uint64_t)v20, 1, v21))
    {
      uint64_t v22 = sub_10000488C(&qword_1000592E8);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      uint64_t v23 = v20[1];
      *long long v19 = *v20;
      v19[1] = v23;
      v19[2] = v20[2];
      uint64_t v24 = *(int *)(v21 + 24);
      uint64_t v25 = (char *)v19 + v24;
      uint64_t v26 = (char *)v20 + v24;
      swift_bridgeObjectRetain();
      v11(v25, v26, v10);
      sub_100004938((uint64_t)v19, 0, 1, v21);
    }
  }
  return v4;
}

uint64_t sub_100026D64(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_100046870();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v12(v4, v5);
  uint64_t v6 = a1 + a2[6];
  uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  if (!sub_100004B4C(v6, 1, v7)) {
    v12(v6 + *(int *)(v7 + 28), v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  uint64_t result = sub_100004B4C(v8, 1, v9);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = v8 + *(int *)(v9 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v11, v5);
  }
  return result;
}

void *sub_100026E9C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  if (sub_100004B4C((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_10000488C(&qword_1000592F8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    *((unsigned char *)v12 + 8) = *((unsigned char *)v13 + 8);
    v12[2] = v13[2];
    *((unsigned char *)v12 + 24) = *((unsigned char *)v13 + 24);
    v12[4] = v13[4];
    *((unsigned char *)v12 + 40) = *((unsigned char *)v13 + 40);
    v10((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v9);
    sub_100004938((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  if (sub_100004B4C((uint64_t)v18, 1, v19))
  {
    uint64_t v20 = sub_10000488C(&qword_1000592E8);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v21 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v21;
    v17[2] = v18[2];
    uint64_t v22 = *(int *)(v19 + 24);
    uint64_t v23 = (char *)v17 + v22;
    uint64_t v24 = (char *)v18 + v22;
    swift_bridgeObjectRetain();
    v10(v23, v24, v9);
    sub_100004938((uint64_t)v17, 0, 1, v19);
  }
  return a1;
}

void *sub_1000270A0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v36(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t)a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  int v15 = sub_100004B4C(v12, 1, v14);
  int v16 = sub_100004B4C(v13, 1, v14);
  if (v15)
  {
    if (!v16)
    {
      uint64_t v17 = *(void *)v13;
      *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
      *(void *)uint64_t v12 = v17;
      uint64_t v18 = *(void *)(v13 + 16);
      *(unsigned char *)(v12 + 24) = *(unsigned char *)(v13 + 24);
      *(void *)(v12 + 16) = v18;
      uint64_t v19 = *(void *)(v13 + 32);
      *(unsigned char *)(v12 + 40) = *(unsigned char *)(v13 + 40);
      *(void *)(v12 + 32) = v19;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12 + *(int *)(v14 + 28), v13 + *(int *)(v14 + 28), v9);
      sub_100004938(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_100018A8C(v12, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
LABEL_6:
    uint64_t v20 = sub_10000488C(&qword_1000592F8);
    memcpy((void *)v12, (const void *)v13, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v33 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = v33;
  uint64_t v34 = *(void *)(v13 + 16);
  *(unsigned char *)(v12 + 24) = *(unsigned char *)(v13 + 24);
  *(void *)(v12 + 16) = v34;
  uint64_t v35 = *(void *)(v13 + 32);
  *(unsigned char *)(v12 + 40) = *(unsigned char *)(v13 + 40);
  *(void *)(v12 + 32) = v35;
  v36((char *)(v12 + *(int *)(v14 + 28)), (char *)(v13 + *(int *)(v14 + 28)), v9);
LABEL_7:
  uint64_t v21 = a3[7];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  int v25 = sub_100004B4C((uint64_t)v22, 1, v24);
  int v26 = sub_100004B4C((uint64_t)v23, 1, v24);
  if (!v25)
  {
    if (!v26)
    {
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v22 + 2) = *((void *)v23 + 2);
      v36(&v22[*(int *)(v24 + 24)], &v23[*(int *)(v24 + 24)], v9);
      return a1;
    }
    sub_100018A8C((uint64_t)v22, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    uint64_t v31 = sub_10000488C(&qword_1000592E8);
    memcpy(v22, v23, *(void *)(*(void *)(v31 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  *((void *)v22 + 2) = *((void *)v23 + 2);
  uint64_t v27 = *(int *)(v24 + 24);
  long long v28 = &v22[v27];
  uint64_t v29 = &v23[v27];
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  v30(v28, v29, v9);
  sub_100004938((uint64_t)v22, 0, 1, v24);
  return a1;
}

void *sub_1000273EC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  if (sub_100004B4C((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_10000488C(&qword_1000592F8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    *((unsigned char *)v12 + 8) = *((unsigned char *)v13 + 8);
    v12[2] = v13[2];
    *((unsigned char *)v12 + 24) = *((unsigned char *)v13 + 24);
    v12[4] = v13[4];
    *((unsigned char *)v12 + 40) = *((unsigned char *)v13 + 40);
    v10((char *)v12 + *(int *)(v14 + 28), (char *)v13 + *(int *)(v14 + 28), v9);
    sub_100004938((uint64_t)v12, 0, 1, v14);
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  if (sub_100004B4C((uint64_t)v18, 1, v19))
  {
    uint64_t v20 = sub_10000488C(&qword_1000592E8);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    v17[2] = v18[2];
    v10((char *)v17 + *(int *)(v19 + 24), (char *)v18 + *(int *)(v19 + 24), v9);
    sub_100004938((uint64_t)v17, 0, 1, v19);
  }
  return a1;
}

void *sub_1000275E4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v27(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (uint64_t)a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  int v15 = sub_100004B4C(v12, 1, v14);
  int v16 = sub_100004B4C(v13, 1, v14);
  if (v15)
  {
    if (!v16)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
      *(void *)(v12 + 16) = *(void *)(v13 + 16);
      *(unsigned char *)(v12 + 24) = *(unsigned char *)(v13 + 24);
      *(void *)(v12 + 32) = *(void *)(v13 + 32);
      *(unsigned char *)(v12 + 40) = *(unsigned char *)(v13 + 40);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v12 + *(int *)(v14 + 28), v13 + *(int *)(v14 + 28), v9);
      sub_100004938(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    sub_100018A8C(v12, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
LABEL_6:
    uint64_t v17 = sub_10000488C(&qword_1000592F8);
    memcpy((void *)v12, (const void *)v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)(v12 + 16) = *(void *)(v13 + 16);
  *(unsigned char *)(v12 + 24) = *(unsigned char *)(v13 + 24);
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  *(unsigned char *)(v12 + 40) = *(unsigned char *)(v13 + 40);
  v27((char *)(v12 + *(int *)(v14 + 28)), (char *)(v13 + *(int *)(v14 + 28)), v9);
LABEL_7:
  uint64_t v18 = a3[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  int v22 = sub_100004B4C((uint64_t)v19, 1, v21);
  int v23 = sub_100004B4C((uint64_t)v20, 1, v21);
  if (!v22)
  {
    if (!v23)
    {
      uint64_t v26 = *((void *)v20 + 1);
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = v26;
      swift_bridgeObjectRelease();
      *((void *)v19 + 2) = *((void *)v20 + 2);
      v27(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v9);
      return a1;
    }
    sub_100018A8C((uint64_t)v19, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = sub_10000488C(&qword_1000592E8);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
  *((void *)v19 + 2) = *((void *)v20 + 2);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[*(int *)(v21 + 24)], &v20[*(int *)(v21 + 24)], v9);
  sub_100004938((uint64_t)v19, 0, 1, v21);
  return a1;
}

uint64_t sub_10002790C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100027920);
}

uint64_t sub_100027920(uint64_t a1, int a2, uint64_t a3)
{
  sub_100046870();
  sub_100030BF4();
  if (*(_DWORD *)(v5 + 84) == a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
  }
  else
  {
    sub_10000488C(&qword_1000592F8);
    sub_100030BF4();
    if (*(_DWORD *)(v7 + 84) == a2)
    {
      sub_100031450();
    }
    else
    {
      sub_10000488C(&qword_1000592E8);
      sub_100031444();
    }
  }
  uint64_t v8 = sub_100030F6C(v6);

  return sub_100004B4C(v8, v9, v10);
}

uint64_t sub_1000279C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000279D8);
}

uint64_t sub_1000279D8()
{
  sub_10003164C();
  sub_100046870();
  sub_100030BF4();
  if (*(_DWORD *)(v1 + 84) == v0)
  {
    sub_1000316A4();
  }
  else
  {
    sub_10000488C(&qword_1000592F8);
    sub_100030BF4();
    if (*(_DWORD *)(v3 + 84) == v0)
    {
      sub_1000314A8();
    }
    else
    {
      sub_10000488C(&qword_1000592E8);
      sub_10003149C();
    }
  }
  uint64_t v4 = sub_100030DB0(v2);

  return sub_100004938(v4, v5, v6, v7);
}

void sub_100027A70()
{
  sub_100046870();
  if (v0 <= 0x3F)
  {
    sub_100027BBC(319, &qword_1000598F0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
    if (v1 <= 0x3F)
    {
      sub_100027BBC(319, (unint64_t *)&unk_1000598F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_100027BBC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_100046D60();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_100027C10(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 32) = a2[4];
    uint64_t v5 = *(int *)(a3 + 28);
    uint64_t v6 = (uint64_t)a2 + v5;
    uint64_t v7 = a1 + v5;
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    uint64_t v8 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v7, v6, v8);
  }
  return v3;
}

uint64_t sub_100027D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = sub_100046870();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

uint64_t sub_100027D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v6, v5, v7);
  return a1;
}

uint64_t sub_100027E10(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = a2[4];
  *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t)a2 + v7;
  uint64_t v10 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100027EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v6, v5, v7);
  return a1;
}

uint64_t sub_100027F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a2 + v4;
  uint64_t v6 = a1 + v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(v6, v5, v7);
  return a1;
}

uint64_t sub_100027FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100028010);
}

uint64_t sub_100028010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031620();

  return sub_100004B4C(v2, a2, v4);
}

uint64_t sub_100028054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028068);
}

uint64_t sub_100028068()
{
  sub_100031620();
  uint64_t v0 = sub_1000316B0();

  return sub_100004938(v0, v1, v2, v3);
}

uint64_t sub_1000280A4()
{
  return sub_100029F60();
}

uint64_t *sub_1000280B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100046870();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1000281A4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10002821C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100046870();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_1000282BC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_100028360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1000283E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100028478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002848C);
}

uint64_t sub_10002848C()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 8));
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v1 + 24));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_1000284F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028504);
}

void sub_100028504()
{
  sub_100030DD4();
  if (v1)
  {
    sub_100031474();
  }
  else
  {
    sub_10003119C();
    uint64_t v2 = sub_100030DB0(*(int *)(v0 + 24));
    sub_100004938(v2, v3, v4, v5);
  }
}

uint64_t sub_100028564()
{
  return sub_10002B2D8();
}

uint64_t sub_10002857C(uint64_t a1)
{
  sub_100030BF4();
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    sub_1000310A0(*(void *)v2);
  }
  else
  {
    *(void *)a1 = *(void *)v2;
    *(unsigned char *)(a1 + 8) = *(unsigned char *)(v2 + 8);
    sub_100031600();
    sub_100030C24();
    uint64_t v4 = sub_10003103C();
    v5(v4);
  }
  return a1;
}

uint64_t sub_1000285F8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_10003103C();
  v4(v3);
  return a1;
}

uint64_t sub_100028658(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  sub_100030D70();
  sub_100030C24();
  uint64_t v4 = sub_10003175C();
  v5(v4);
  return a1;
}

uint64_t sub_1000286B8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_100031290();
  v4(v3);
  return a1;
}

uint64_t sub_100028718(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_100031748();
  v4(v3);
  return a1;
}

uint64_t sub_100028778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002878C);
}

uint64_t sub_100028790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100031620();

  return sub_100004B4C(v2, a2, v4);
}

uint64_t sub_1000287D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000287E8);
}

uint64_t sub_1000287EC()
{
  sub_100031620();
  uint64_t v0 = sub_1000316B0();

  return sub_100004938(v0, v1, v2, v3);
}

uint64_t *sub_100028828(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100046870();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    int v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    if (sub_100004B4C((uint64_t)v15, 1, v16))
    {
      uint64_t v17 = sub_10000488C(&qword_1000592B8);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v19 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v19;
      uint64_t v20 = *(int *)(v16 + 20);
      uint64_t v21 = (char *)v14 + v20;
      int v22 = (char *)v15 + v20;
      swift_bridgeObjectRetain();
      v12(v21, v22, v11);
      sub_100004938((uint64_t)v14, 0, 1, v16);
    }
  }
  return v4;
}

uint64_t sub_1000289C0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100046870();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v10(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  uint64_t result = sub_100004B4C(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v9, v5);
  }
  return result;
}

void *sub_100028AB0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100046870();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  if (sub_100004B4C((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = sub_10000488C(&qword_1000592B8);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v17;
    uint64_t v18 = *(int *)(v15 + 20);
    uint64_t v19 = (char *)v13 + v18;
    uint64_t v20 = (char *)v14 + v18;
    swift_bridgeObjectRetain();
    v11(v19, v20, v10);
    sub_100004938((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

void *sub_100028BF8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  LODWORD(v8) = sub_100004B4C((uint64_t)v13, 1, v15);
  int v16 = sub_100004B4C((uint64_t)v14, 1, v15);
  if (!v8)
  {
    if (!v16)
    {
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11(&v13[*(int *)(v15 + 20)], &v14[*(int *)(v15 + 20)], v9);
      return a1;
    }
    sub_100018A8C((uint64_t)v13, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v21 = sub_10000488C(&qword_1000592B8);
    memcpy(v13, v14, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  uint64_t v17 = *(int *)(v15 + 20);
  uint64_t v18 = &v13[v17];
  uint64_t v19 = &v14[v17];
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  v20(v18, v19, v9);
  sub_100004938((uint64_t)v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_100028DEC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  if (sub_100004B4C((uint64_t)v13, 1, v14))
  {
    uint64_t v15 = sub_10000488C(&qword_1000592B8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 20), (char *)v13 + *(int *)(v14 + 20), v9);
    sub_100004938((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

void *sub_100028F18(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100046870();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
  LODWORD(v9) = sub_100004B4C((uint64_t)v14, 1, v16);
  int v17 = sub_100004B4C((uint64_t)v15, 1, v16);
  if (!v9)
  {
    if (!v17)
    {
      uint64_t v20 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = v20;
      swift_bridgeObjectRelease();
      v12(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v10);
      return a1;
    }
    sub_100018A8C((uint64_t)v14, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = sub_10000488C(&qword_1000592B8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[*(int *)(v16 + 20)], &v15[*(int *)(v16 + 20)], v10);
  sub_100004938((uint64_t)v14, 0, 1, v16);
  return a1;
}

uint64_t sub_1000290D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000290EC);
}

uint64_t sub_1000290EC()
{
  sub_100030F2C();
  if (v3) {
    return sub_100030DC0(*(void *)(v1 + 8));
  }
  sub_100030E48();
  sub_100030BF4();
  if (*(_DWORD *)(v5 + 84) == v0)
  {
    uint64_t v6 = *(int *)(v2 + 20);
  }
  else
  {
    sub_10000488C(&qword_1000592B8);
    sub_100031450();
  }
  uint64_t v7 = sub_100030F6C(v6);

  return sub_100004B4C(v7, v8, v9);
}

uint64_t sub_100029178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002918C);
}

void sub_10002918C()
{
  sub_100030DD4();
  if (v1)
  {
    sub_100031474();
  }
  else
  {
    int v2 = v0;
    sub_100046870();
    sub_100030BF4();
    if (*(_DWORD *)(v3 + 84) == v2)
    {
      sub_1000316A4();
    }
    else
    {
      sub_10000488C(&qword_1000592B8);
      sub_1000314A8();
    }
    uint64_t v5 = sub_100030DB0(v4);
    sub_100004938(v5, v6, v7, v8);
  }
}

void sub_10002921C()
{
  sub_100046870();
  if (v0 <= 0x3F)
  {
    sub_100027BBC(319, (unint64_t *)&unk_100059B58, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_10002930C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100046870();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1000293F4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10002946C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100046870();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_100029504(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_1000295A4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_100029630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100029644);
}

uint64_t sub_100029644()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 8));
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v1 + 20));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_1000296A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000296BC);
}

void sub_1000296BC()
{
  sub_100030DD4();
  if (v1)
  {
    sub_100031474();
  }
  else
  {
    sub_10003119C();
    uint64_t v2 = sub_100030DB0(*(int *)(v0 + 20));
    sub_100004938(v2, v3, v4, v5);
  }
}

uint64_t sub_10002971C()
{
  return sub_10002AD2C();
}

unsigned char *sub_100029728(unsigned char *a1)
{
  sub_100030BF4();
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    sub_1000310A0(*v2);
  }
  else
  {
    *a1 = *(unsigned char *)v2;
    sub_100031600();
    sub_100030C24();
    uint64_t v4 = sub_10003103C();
    v5(v4);
  }
  return a1;
}

uint64_t sub_10002979C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  sub_100046870();
  sub_100030C24();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);

  return v5(v2, v3);
}

unsigned char *sub_1000297FC(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_10003103C();
  v4(v3);
  return a1;
}

unsigned char *sub_100029854(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_10003175C();
  v4(v3);
  return a1;
}

unsigned char *sub_1000298AC(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_100031290();
  v4(v3);
  return a1;
}

unsigned char *sub_100029904(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_100031748();
  v4(v3);
  return a1;
}

uint64_t sub_10002995C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100029970);
}

uint64_t sub_100029974(unsigned __int8 *a1, int a2)
{
  if (a2 == 254)
  {
    unsigned int v3 = *a1;
    BOOL v4 = v3 >= 2;
    int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
    if (v4) {
      return (v5 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_100030E48();
    uint64_t v7 = sub_100030F6C(*(int *)(v2 + 20));
    return sub_100004B4C(v7, v8, v9);
  }
}

uint64_t sub_1000299EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100029A00);
}

unsigned char *sub_100029A04(unsigned char *result, char a2, int a3)
{
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    sub_10003119C();
    uint64_t v4 = sub_100030DB0(*(int *)(v3 + 20));
    return (unsigned char *)sub_100004938(v4, v5, v6, v7);
  }
  return result;
}

void *sub_100029A70(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v10 = sub_100046870();
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_100029B68(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_100029BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_100029C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_100029D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_100029DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_100029E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100029E78);
}

uint64_t sub_100029E78()
{
  sub_100030F2C();
  if (v1) {
    return sub_100030DC0(*(void *)(v0 + 8));
  }
  sub_100030E48();
  sub_100031444();
  uint64_t v4 = sub_100030F6C(v3);

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_100029ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100029EEC);
}

void sub_100029EEC()
{
  sub_100030DD4();
  if (v0)
  {
    sub_100031474();
  }
  else
  {
    sub_10003119C();
    sub_10003149C();
    uint64_t v2 = sub_100030DB0(v1);
    sub_100004938(v2, v3, v4, v5);
  }
}

uint64_t sub_100029F48()
{
  return sub_100029F60();
}

uint64_t sub_100029F60()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10002A010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A024);
}

uint64_t sub_10002A028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A03C);
}

uint64_t sub_10002A040()
{
  return sub_10002AD2C();
}

unint64_t sub_10002A04C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    sub_1000197D8(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v9;
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    *(void *)(a1 + 40) = v10;
    uint64_t v11 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v11;
    uint64_t v12 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = v12;
    uint64_t v13 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = v13;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
    uint64_t v14 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = *(void *)(a2 + 128);
    *(void *)(a1 + 136) = v14;
    uint64_t v15 = *(int *)(a3 + 60);
    uint64_t v20 = a2 + v15;
    uint64_t v21 = a1 + v15;
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    uint64_t v16 = sub_100046870();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19(v21, v20, v16);
  }
  return a1;
}

uint64_t sub_10002A1E8(uint64_t a1, uint64_t a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 60);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10002A29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_1000197D8(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  uint64_t v14 = *(int *)(a3 + 60);
  uint64_t v18 = a2 + v14;
  uint64_t v19 = a1 + v14;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v15 = sub_100046870();
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v19, v18, v15);
  return a1;
}

uint64_t sub_10002A3E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_1000197D8(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  sub_10001C274(v8, v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 96) = v10;
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  uint64_t v11 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v11;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 60);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t sub_10002A588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v8 = *(int *)(a3 + 60);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v11 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_10002A644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001C274(v6, v7);
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 60);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_100046870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_10002A76C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A780);
}

uint64_t sub_10002A780()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 24));
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v1 + 60));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_10002A7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A7F8);
}

void sub_10002A7F8()
{
  sub_100030DD4();
  if (v3)
  {
    *(void *)(v1 + 24) = (v0 - 1);
  }
  else
  {
    sub_10003119C();
    uint64_t v4 = sub_100030DB0(*(int *)(v2 + 60));
    sub_100004938(v4, v5, v6, v7);
  }
}

uint64_t sub_10002A85C()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_10002A92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002A940);
}

uint64_t sub_10002A944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002A958);
}

uint64_t *sub_10002A95C(uint64_t *a1, uint64_t *a2)
{
  sub_100030BF4();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    sub_1000310A0(*a2);
  }
  else
  {
    uint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    sub_1000197D8(*a2, v6);
    *a1 = v5;
    a1[1] = v6;
    sub_100031000();
    sub_100030C24();
    sub_100031160();
    v7();
  }
  return a1;
}

uint64_t sub_10002A9FC(uint64_t a1, uint64_t a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_100046870();
  sub_100030C24();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);

  return v7(v4, v5);
}

void *sub_10002AA70(uint64_t a1, uint64_t *a2)
{
  sub_1000312FC(a1, a2);
  *uint64_t v2 = v3;
  v2[1] = v4;
  sub_100031000();
  sub_100030C24();
  sub_100031160();
  v5();
  return v2;
}

uint64_t *sub_10002AADC(uint64_t a1, uint64_t *a2)
{
  sub_1000312FC(a1, a2);
  uint64_t v5 = *v2;
  unint64_t v6 = v2[1];
  *uint64_t v2 = v3;
  v2[1] = v4;
  sub_10001C274(v5, v6);
  sub_100031000();
  sub_100030C24();
  uint64_t v7 = sub_10003148C();
  v8(v7);
  return v2;
}

_OWORD *sub_10002AB4C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  sub_100030D70();
  sub_100030C24();
  uint64_t v3 = sub_100031290();
  v4(v3);
  return a1;
}

uint64_t *sub_10002ABA4(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_10001C274(v4, v5);
  sub_100031000();
  sub_100030C24();
  uint64_t v6 = sub_10003148C();
  v7(v6);
  return a1;
}

uint64_t sub_10002AC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002AC30);
}

uint64_t sub_10002AC34(uint64_t a1, int a2)
{
  if (a2 == 12) {
    return sub_100030E90();
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v2 + 20));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_10002AC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002ACAC);
}

void *sub_10002ACB0(void *result, uint64_t a2, int a3)
{
  uint64_t v4 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    sub_10003119C();
    sub_1000316A4();
    return (void *)sub_100004938((uint64_t)v4 + v6, a2, a2, v5);
  }
  return result;
}

uint64_t sub_10002AD2C()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10002ADBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1000197D8(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_100046870();
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_10002AEC0(uint64_t a1, uint64_t a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t *sub_10002AF44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_100046870();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  return a1;
}

uint64_t *sub_10002AFF8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_10001C274(v8, v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_10002B0B8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  unint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t *sub_10002B134(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001C274(v6, v7);
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_100046870();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_10002B1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002B1E8);
}

uint64_t sub_10002B1E8()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 24));
  }
  sub_100030E48();
  uint64_t v4 = sub_100030F6C(*(int *)(v1 + 24));

  return sub_100004B4C(v4, v5, v6);
}

uint64_t sub_10002B24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002B260);
}

void sub_10002B260()
{
  sub_100030DD4();
  if (v3)
  {
    *(void *)(v1 + 24) = (v0 - 1);
  }
  else
  {
    sub_10003119C();
    uint64_t v4 = sub_100030DB0(*(int *)(v2 + 24));
    sub_100004938(v4, v5, v6, v7);
  }
}

uint64_t sub_10002B2C4()
{
  return sub_10002B2D8();
}

uint64_t sub_10002B2D8()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10002B368(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1000197D8(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
    swift_bridgeObjectRetain();
    if (sub_100004B4C((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = sub_10000488C(&qword_1000592A0);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
LABEL_14:
      uint64_t v37 = *(int *)(a3 + 28);
      uint64_t v38 = (char *)a1 + v37;
      long long v39 = (char *)a2 + v37;
      uint64_t v40 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
      return a1;
    }
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(unsigned char *)uint64_t v11 = *(unsigned char *)v12;
      uint64_t v28 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v17 = v12[1];
        *uint64_t v11 = *v12;
        v11[1] = v17;
        uint64_t v18 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
        uint64_t v19 = *(int *)(v18 + 20);
        uint64_t v43 = (char *)v11 + v19;
        uint64_t v45 = v18;
        uint64_t v42 = (char *)v12 + v19;
        uint64_t v20 = sub_100046870();
        uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        swift_bridgeObjectRetain();
        int v22 = v43;
        uint64_t v44 = v20;
        v21(v22, v42, v20);
        uint64_t v23 = *(int *)(v45 + 24);
        uint64_t v24 = (void *)((char *)v11 + v23);
        int v25 = (void *)((char *)v12 + v23);
        uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
        if (sub_100004B4C((uint64_t)v25, 1, v26))
        {
          uint64_t v27 = sub_10000488C(&qword_1000592B8);
          memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          uint64_t v33 = v25[1];
          *uint64_t v24 = *v25;
          v24[1] = v33;
          uint64_t v34 = *(int *)(v26 + 20);
          uint64_t v35 = (char *)v24 + v34;
          uint64_t v36 = (char *)v25 + v34;
          swift_bridgeObjectRetain();
          v21(v35, v36, v44);
          sub_100004938((uint64_t)v24, 0, 1, v26);
        }
        goto LABEL_13;
      }
      *uint64_t v11 = *v12;
      *((unsigned char *)v11 + 8) = *((unsigned char *)v12 + 8);
      uint64_t v28 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
    }
    uint64_t v29 = *(int *)(v28 + 20);
    uint64_t v30 = (char *)v11 + v29;
    uint64_t v31 = (char *)v12 + v29;
    uint64_t v32 = sub_100046870();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
LABEL_13:
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)v11, 0, 1, v13);
    goto LABEL_14;
  }
  uint64_t v15 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t sub_10002B6AC(uint64_t a1, uint64_t a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  if (!sub_100004B4C(v4, 1, v5))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
LABEL_7:
      uint64_t v8 = v4 + *(int *)(v7 + 20);
      uint64_t v9 = sub_100046870();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload != 1)
    {
      if (EnumCaseMultiPayload) {
        goto LABEL_10;
      }
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
    uint64_t v10 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
    uint64_t v11 = v4 + *(int *)(v10 + 20);
    uint64_t v12 = sub_100046870();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    v13(v11, v12);
    uint64_t v14 = v4 + *(int *)(v10 + 24);
    uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
    if (!sub_100004B4C(v14, 1, v15))
    {
      swift_bridgeObjectRelease();
      v13(v14 + *(int *)(v15 + 20), v12);
    }
  }
LABEL_10:
  uint64_t v16 = a1 + *(int *)(a2 + 28);
  uint64_t v17 = sub_100046870();
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);

  return v18(v16, v17);
}

uint64_t *sub_10002B888(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  swift_bridgeObjectRetain();
  if (!sub_100004B4C((uint64_t)v11, 1, v12))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *uint64_t v10 = *v11;
      uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v15 = *((void *)v11 + 1);
        *(void *)uint64_t v10 = *(void *)v11;
        *((void *)v10 + 1) = v15;
        uint64_t v16 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
        uint64_t v17 = *(int *)(v16 + 20);
        uint64_t v41 = &v10[v17];
        uint64_t v43 = v16;
        uint64_t v40 = &v11[v17];
        uint64_t v18 = sub_100046870();
        uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
        swift_bridgeObjectRetain();
        uint64_t v20 = v41;
        uint64_t v42 = v18;
        v19(v20, v40, v18);
        uint64_t v21 = *(int *)(v43 + 24);
        int v22 = &v10[v21];
        uint64_t v23 = &v11[v21];
        uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
        if (sub_100004B4C((uint64_t)v23, 1, v24))
        {
          uint64_t v25 = sub_10000488C(&qword_1000592B8);
          memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          uint64_t v31 = *((void *)v23 + 1);
          *(void *)int v22 = *(void *)v23;
          *((void *)v22 + 1) = v31;
          uint64_t v32 = *(int *)(v24 + 20);
          uint64_t v33 = &v22[v32];
          uint64_t v34 = &v23[v32];
          swift_bridgeObjectRetain();
          v19(v33, v34, v42);
          sub_100004938((uint64_t)v22, 0, 1, v24);
        }
        goto LABEL_11;
      }
      *(void *)uint64_t v10 = *(void *)v11;
      v10[8] = v11[8];
      uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
    }
    uint64_t v27 = *(int *)(v26 + 20);
    uint64_t v28 = &v10[v27];
    uint64_t v29 = &v11[v27];
    uint64_t v30 = sub_100046870();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
LABEL_11:
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)v10, 0, 1, v12);
    goto LABEL_12;
  }
  uint64_t v13 = sub_10000488C(&qword_1000592A0);
  memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
LABEL_12:
  uint64_t v35 = *(int *)(a3 + 28);
  uint64_t v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)a2 + v35;
  uint64_t v38 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
  return a1;
}

uint64_t *sub_10002BB7C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_10001C274(v8, v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (uint64_t *)((char *)a1 + v10);
  uint64_t v12 = (uint64_t *)((char *)a2 + v10);
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  int v14 = sub_100004B4C((uint64_t)v11, 1, v13);
  int v15 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v14)
  {
    if (!v15)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        *(unsigned char *)uint64_t v11 = *(unsigned char *)v12;
        uint64_t v39 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
      }
      else
      {
        if (EnumCaseMultiPayload == 1)
        {
          *uint64_t v11 = *v12;
          v11[1] = v12[1];
          uint64_t v17 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
          uint64_t v18 = *(int *)(v17 + 20);
          long long v66 = (char *)v11 + v18;
          uint64_t v69 = v17;
          long long v65 = (char *)v12 + v18;
          uint64_t v19 = sub_100046870();
          uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
          swift_bridgeObjectRetain();
          uint64_t v21 = v66;
          uint64_t v67 = v19;
          v20(v21, v65, v19);
          uint64_t v22 = *(int *)(v69 + 24);
          uint64_t v23 = (void *)((char *)v11 + v22);
          uint64_t v24 = (void *)((char *)v12 + v22);
          uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
          if (sub_100004B4C((uint64_t)v24, 1, v25))
          {
            uint64_t v26 = sub_10000488C(&qword_1000592B8);
            memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
          }
          else
          {
            *uint64_t v23 = *v24;
            v23[1] = v24[1];
            uint64_t v45 = *(int *)(v25 + 20);
            uint64_t v46 = (char *)v23 + v45;
            uint64_t v47 = (char *)v24 + v45;
            swift_bridgeObjectRetain();
            v20(v46, v47, v67);
            sub_100004938((uint64_t)v23, 0, 1, v25);
          }
          goto LABEL_19;
        }
        uint64_t v40 = *v12;
        *((unsigned char *)v11 + 8) = *((unsigned char *)v12 + 8);
        *uint64_t v11 = v40;
        uint64_t v39 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
      }
      uint64_t v41 = *(int *)(v39 + 20);
      uint64_t v42 = (char *)v11 + v41;
      uint64_t v43 = (char *)v12 + v41;
      uint64_t v44 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
LABEL_19:
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v11, 0, 1, v13);
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  if (v15)
  {
    sub_100018A8C((uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
LABEL_9:
    uint64_t v27 = sub_10000488C(&qword_1000592A0);
    memcpy(v11, v12, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_24;
  }
  if (a1 != a2)
  {
    sub_100018A8C((uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    int v28 = swift_getEnumCaseMultiPayload();
    if (v28 == 2)
    {
      *(unsigned char *)uint64_t v11 = *(unsigned char *)v12;
      uint64_t v48 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                   + 20);
      uint64_t v49 = (char *)v11 + v48;
      uint64_t v50 = (char *)v12 + v48;
      uint64_t v51 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else if (v28 == 1)
    {
      *uint64_t v11 = *v12;
      v11[1] = v12[1];
      uint64_t v29 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v30 = *(int *)(v29 + 20);
      uint64_t v70 = (char *)v11 + v30;
      uint64_t v72 = v29;
      uint64_t v68 = (char *)v12 + v30;
      uint64_t v31 = sub_100046870();
      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
      swift_bridgeObjectRetain();
      uint64_t v33 = v70;
      uint64_t v71 = v32;
      v32(v33, v68, v31);
      uint64_t v34 = *(int *)(v72 + 24);
      uint64_t v35 = (void *)((char *)v11 + v34);
      uint64_t v36 = (void *)((char *)v12 + v34);
      uint64_t v37 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (sub_100004B4C((uint64_t)v36, 1, v37))
      {
        uint64_t v38 = sub_10000488C(&qword_1000592B8);
        memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        void *v35 = *v36;
        v35[1] = v36[1];
        uint64_t v57 = *(int *)(v37 + 20);
        uint64_t v58 = (char *)v35 + v57;
        uint64_t v59 = (char *)v36 + v57;
        swift_bridgeObjectRetain();
        v71(v58, v59, v31);
        sub_100004938((uint64_t)v35, 0, 1, v37);
      }
    }
    else
    {
      uint64_t v52 = *v12;
      *((unsigned char *)v11 + 8) = *((unsigned char *)v12 + 8);
      *uint64_t v11 = v52;
      uint64_t v53 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                   + 20);
      uint64_t v54 = (char *)v11 + v53;
      uint64_t v55 = (char *)v12 + v53;
      uint64_t v56 = sub_100046870();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16))(v54, v55, v56);
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_24:
  uint64_t v60 = *(int *)(a3 + 28);
  uint64_t v61 = (char *)a1 + v60;
  uint64_t v62 = (char *)a2 + v60;
  uint64_t v63 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 24))(v61, v62, v63);
  return a1;
}

_OWORD *sub_10002C120(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  unint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  if (!sub_100004B4C((uint64_t)v9, 1, v10))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *uint64_t v8 = *v9;
      uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
        uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
        uint64_t v14 = *(int *)(v13 + 20);
        int v15 = &v8[v14];
        uint64_t v16 = &v9[v14];
        uint64_t v17 = sub_100046870();
        uint64_t v18 = v16;
        uint64_t v19 = v17;
        uint64_t v35 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32);
        v35(v15, v18, v17);
        uint64_t v20 = *(int *)(v13 + 24);
        uint64_t v21 = &v8[v20];
        uint64_t v22 = &v9[v20];
        uint64_t v23 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
        if (sub_100004B4C((uint64_t)v22, 1, v23))
        {
          uint64_t v24 = sub_10000488C(&qword_1000592B8);
          memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
        }
        else
        {
          *uint64_t v21 = *v22;
          v35((unsigned char *)v21 + *(int *)(v23 + 20), (unsigned char *)v22 + *(int *)(v23 + 20), v19);
          sub_100004938((uint64_t)v21, 0, 1, v23);
        }
        goto LABEL_10;
      }
      *(void *)uint64_t v8 = *(void *)v9;
      v8[8] = v9[8];
      uint64_t v25 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
    }
    uint64_t v26 = *(int *)(v25 + 20);
    uint64_t v27 = &v8[v26];
    int v28 = &v9[v26];
    uint64_t v29 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)v8, 0, 1, v10);
    goto LABEL_11;
  }
  uint64_t v11 = sub_10000488C(&qword_1000592A0);
  memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
LABEL_11:
  uint64_t v30 = *(int *)(a3 + 28);
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  uint64_t v33 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
  return a1;
}

uint64_t *sub_10002C3DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001C274(v6, v7);
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
  int v13 = sub_100004B4C((uint64_t)v10, 1, v12);
  int v14 = sub_100004B4C((uint64_t)v11, 1, v12);
  if (v13)
  {
    if (!v14)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        *uint64_t v10 = *v11;
        uint64_t v42 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0);
      }
      else
      {
        if (EnumCaseMultiPayload == 1)
        {
          *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
          uint64_t v16 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
          uint64_t v17 = *(int *)(v16 + 20);
          uint64_t v18 = &v10[v17];
          uint64_t v19 = &v11[v17];
          uint64_t v20 = sub_100046870();
          uint64_t v21 = v19;
          uint64_t v22 = v20;
          uint64_t v60 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 32);
          v60(v18, v21, v20);
          uint64_t v23 = *(int *)(v16 + 24);
          uint64_t v24 = &v10[v23];
          uint64_t v25 = &v11[v23];
          uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
          if (sub_100004B4C((uint64_t)v25, 1, v26))
          {
            uint64_t v27 = sub_10000488C(&qword_1000592B8);
            memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
          }
          else
          {
            *uint64_t v24 = *v25;
            v60((unsigned char *)v24 + *(int *)(v26 + 20), (unsigned char *)v25 + *(int *)(v26 + 20), v22);
            sub_100004938((uint64_t)v24, 0, 1, v26);
          }
          goto LABEL_18;
        }
        *(void *)uint64_t v10 = *(void *)v11;
        v10[8] = v11[8];
        uint64_t v42 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0);
      }
      uint64_t v43 = *(int *)(v42 + 20);
      uint64_t v44 = &v10[v43];
      uint64_t v45 = &v11[v43];
      uint64_t v46 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
LABEL_18:
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v10, 0, 1, v12);
      goto LABEL_24;
    }
    goto LABEL_9;
  }
  if (v14)
  {
    sub_100018A8C((uint64_t)v10, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
LABEL_9:
    uint64_t v28 = sub_10000488C(&qword_1000592A0);
    memcpy(v10, v11, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_24;
  }
  if (a1 != a2)
  {
    sub_100018A8C((uint64_t)v10, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
    int v29 = swift_getEnumCaseMultiPayload();
    if (v29 == 2)
    {
      *uint64_t v10 = *v11;
      uint64_t v47 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextFailed(0)
                   + 20);
      uint64_t v48 = &v10[v47];
      uint64_t v49 = &v11[v47];
      uint64_t v50 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
    }
    else if (v29 == 1)
    {
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
      uint64_t v30 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(0);
      uint64_t v31 = *(int *)(v30 + 20);
      uint64_t v32 = &v10[v31];
      uint64_t v33 = &v11[v31];
      uint64_t v34 = sub_100046870();
      uint64_t v35 = v33;
      uint64_t v36 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v34 - 8) + 32);
      v36(v32, v35, v34);
      uint64_t v37 = *(int *)(v30 + 24);
      uint64_t v38 = &v10[v37];
      uint64_t v39 = &v11[v37];
      uint64_t v40 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      if (sub_100004B4C((uint64_t)v39, 1, v40))
      {
        uint64_t v41 = sub_10000488C(&qword_1000592B8);
        memcpy(v38, v39, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        _OWORD *v38 = *v39;
        v36((unsigned char *)v38 + *(int *)(v40 + 20), (unsigned char *)v39 + *(int *)(v40 + 20), v34);
        sub_100004938((uint64_t)v38, 0, 1, v40);
      }
    }
    else
    {
      *(void *)uint64_t v10 = *(void *)v11;
      v10[8] = v11[8];
      uint64_t v51 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextStarted(0)
                   + 20);
      uint64_t v52 = &v10[v51];
      uint64_t v53 = &v11[v51];
      uint64_t v54 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_24:
  uint64_t v55 = *(int *)(a3 + 28);
  uint64_t v56 = (char *)a1 + v55;
  uint64_t v57 = (char *)a2 + v55;
  uint64_t v58 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 40))(v56, v57, v58);
  return a1;
}

uint64_t sub_10002C918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002C92C);
}

uint64_t sub_10002C92C()
{
  sub_100030F2C();
  if (v2) {
    return sub_100030DC0(*(void *)(v0 + 24));
  }
  int v4 = v1;
  sub_10000488C(&qword_1000592A0);
  sub_100030BF4();
  if (*(_DWORD *)(v5 + 84) == v4)
  {
    sub_100031450();
  }
  else
  {
    sub_100046870();
    sub_100031444();
  }
  uint64_t v7 = sub_100030F6C(v6);

  return sub_100004B4C(v7, v8, v9);
}

uint64_t sub_10002C9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002C9D4);
}

void sub_10002C9D4()
{
  sub_100030DD4();
  if (v3)
  {
    *(void *)(v1 + 24) = (v0 - 1);
  }
  else
  {
    int v4 = v2;
    sub_10000488C(&qword_1000592A0);
    sub_100030BF4();
    if (*(_DWORD *)(v5 + 84) == v4)
    {
      sub_1000314A8();
    }
    else
    {
      sub_100046870();
      sub_10003149C();
    }
    uint64_t v7 = sub_100030DB0(v6);
    sub_100004938(v7, v8, v9, v10);
  }
}

void sub_10002CA68()
{
  sub_100027BBC(319, (unint64_t *)&unk_10005A0B0, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
  if (v0 <= 0x3F)
  {
    sub_100046870();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_10002CB60(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1000197D8(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
    if (sub_100004B4C((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = sub_10000488C(&qword_1000592C8);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        *(void *)uint64_t v10 = *(void *)v11;
        v10[8] = v11[8];
        uint64_t v15 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                     + 20);
      }
      else
      {
        *uint64_t v10 = *v11;
        uint64_t v15 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                     + 20);
      }
      uint64_t v16 = &v10[v15];
      uint64_t v17 = &v11[v15];
      uint64_t v18 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v10, 0, 1, v12);
    }
    uint64_t v19 = a3[6];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = sub_100046870();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
    v23(v20, v21, v22);
    uint64_t v24 = a3[7];
    uint64_t v25 = (uint64_t *)((char *)a1 + v24);
    uint64_t v26 = (uint64_t *)((char *)a2 + v24);
    uint64_t v27 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
    if (sub_100004B4C((uint64_t)v26, 1, (uint64_t)v27))
    {
      uint64_t v28 = sub_10000488C(&qword_1000592D8);
      memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      *uint64_t v25 = *v26;
      v23((char *)v25 + v27[5], (char *)v26 + v27[5], v22);
      uint64_t v29 = v27[6];
      uint64_t v30 = (void *)((char *)v25 + v29);
      uint64_t v31 = (void *)((char *)v26 + v29);
      uint64_t v32 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      if (sub_100004B4C((uint64_t)v31, 1, v32))
      {
        uint64_t v33 = sub_10000488C(&qword_1000592F8);
        memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        *uint64_t v30 = *v31;
        *((unsigned char *)v30 + 8) = *((unsigned char *)v31 + 8);
        v30[2] = v31[2];
        *((unsigned char *)v30 + 24) = *((unsigned char *)v31 + 24);
        v30[4] = v31[4];
        *((unsigned char *)v30 + 40) = *((unsigned char *)v31 + 40);
        v23((char *)v30 + *(int *)(v32 + 28), (char *)v31 + *(int *)(v32 + 28), v22);
        sub_100004938((uint64_t)v30, 0, 1, v32);
      }
      uint64_t v34 = v27[7];
      uint64_t v35 = (void *)((char *)v25 + v34);
      uint64_t v36 = (void *)((char *)v26 + v34);
      uint64_t v37 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      if (sub_100004B4C((uint64_t)v36, 1, v37))
      {
        uint64_t v38 = sub_10000488C(&qword_1000592E8);
        memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
      }
      else
      {
        uint64_t v39 = v36[1];
        void *v35 = *v36;
        v35[1] = v39;
        v35[2] = v36[2];
        uint64_t v40 = *(int *)(v37 + 24);
        uint64_t v41 = (char *)v35 + v40;
        uint64_t v42 = (char *)v36 + v40;
        swift_bridgeObjectRetain();
        v23(v41, v42, v22);
        sub_100004938((uint64_t)v35, 0, 1, v37);
      }
      sub_100004938((uint64_t)v25, 0, 1, (uint64_t)v27);
    }
  }
  return a1;
}

uint64_t sub_10002CFA8(uint64_t a1, int *a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  if (!sub_100004B4C(v4, 1, v5))
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0);
    }
    else {
      uint64_t v6 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0);
    }
    uint64_t v7 = v4 + *(int *)(v6 + 20);
    uint64_t v8 = sub_100046870();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  uint64_t v9 = a1 + a2[6];
  uint64_t v10 = sub_100046870();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  v19(v9, v10);
  uint64_t v11 = a1 + a2[7];
  uint64_t v12 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  uint64_t result = sub_100004B4C(v11, 1, (uint64_t)v12);
  if (!result)
  {
    v19(v11 + v12[5], v10);
    uint64_t v14 = v11 + v12[6];
    uint64_t v15 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (!sub_100004B4C(v14, 1, v15)) {
      v19(v14 + *(int *)(v15 + 28), v10);
    }
    uint64_t v16 = v11 + v12[7];
    uint64_t v17 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    uint64_t result = sub_100004B4C(v16, 1, v17);
    if (!result)
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = v16 + *(int *)(v17 + 24);
      return ((uint64_t (*)(uint64_t, uint64_t))v19)(v18, v10);
    }
  }
  return result;
}

uint64_t *sub_10002D1C0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_10000488C(&qword_1000592C8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)uint64_t v9 = *(void *)v10;
      v9[8] = v10[8];
      uint64_t v13 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                   + 20);
    }
    else
    {
      *uint64_t v9 = *v10;
      uint64_t v13 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                   + 20);
    }
    uint64_t v14 = &v9[v13];
    uint64_t v15 = &v10[v13];
    uint64_t v16 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v17 = a3[6];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_100046870();
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
  v21(v18, v19, v20);
  uint64_t v22 = a3[7];
  uint64_t v23 = (uint64_t *)((char *)a1 + v22);
  uint64_t v24 = (uint64_t *)((char *)a2 + v22);
  uint64_t v25 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  if (sub_100004B4C((uint64_t)v24, 1, (uint64_t)v25))
  {
    uint64_t v26 = sub_10000488C(&qword_1000592D8);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    *uint64_t v23 = *v24;
    v21((char *)v23 + v25[5], (char *)v24 + v25[5], v20);
    uint64_t v27 = v25[6];
    uint64_t v28 = (void *)((char *)v23 + v27);
    uint64_t v29 = (void *)((char *)v24 + v27);
    uint64_t v30 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (sub_100004B4C((uint64_t)v29, 1, v30))
    {
      uint64_t v31 = sub_10000488C(&qword_1000592F8);
      memcpy(v28, v29, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      *uint64_t v28 = *v29;
      *((unsigned char *)v28 + 8) = *((unsigned char *)v29 + 8);
      v28[2] = v29[2];
      *((unsigned char *)v28 + 24) = *((unsigned char *)v29 + 24);
      v28[4] = v29[4];
      *((unsigned char *)v28 + 40) = *((unsigned char *)v29 + 40);
      v21((char *)v28 + *(int *)(v30 + 28), (char *)v29 + *(int *)(v30 + 28), v20);
      sub_100004938((uint64_t)v28, 0, 1, v30);
    }
    uint64_t v32 = v25[7];
    uint64_t v33 = (void *)((char *)v23 + v32);
    uint64_t v34 = (void *)((char *)v24 + v32);
    uint64_t v35 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    if (sub_100004B4C((uint64_t)v34, 1, v35))
    {
      uint64_t v36 = sub_10000488C(&qword_1000592E8);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      uint64_t v37 = v34[1];
      *uint64_t v33 = *v34;
      v33[1] = v37;
      v33[2] = v34[2];
      uint64_t v38 = *(int *)(v35 + 24);
      uint64_t v39 = (char *)v33 + v38;
      uint64_t v40 = (char *)v34 + v38;
      swift_bridgeObjectRetain();
      v21(v39, v40, v20);
      sub_100004938((uint64_t)v33, 0, 1, v35);
    }
    sub_100004938((uint64_t)v23, 0, 1, (uint64_t)v25);
  }
  return a1;
}

uint64_t *sub_10002D5B8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1000197D8(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_10001C274(v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  int v14 = sub_100004B4C((uint64_t)v11, 1, v13);
  int v15 = sub_100004B4C((uint64_t)v12, 1, v13);
  if (v14)
  {
    if (!v15)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v16 = *(void *)v12;
        v11[8] = v12[8];
        *(void *)uint64_t v11 = v16;
        uint64_t v17 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                     + 20);
      }
      else
      {
        *uint64_t v11 = *v12;
        uint64_t v17 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                     + 20);
      }
      uint64_t v18 = &v11[v17];
      uint64_t v19 = &v12[v17];
      uint64_t v20 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v11, 0, 1, v13);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v21 = sub_10000488C(&qword_1000592C8);
    memcpy(v11, v12, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_15;
  }
  if (v15)
  {
    sub_100018A8C((uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100018A8C((uint64_t)v11, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = *(void *)v12;
      v11[8] = v12[8];
      *(void *)uint64_t v11 = v22;
      uint64_t v23 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                   + 20);
    }
    else
    {
      *uint64_t v11 = *v12;
      uint64_t v23 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                   + 20);
    }
    uint64_t v24 = &v11[v23];
    uint64_t v25 = &v12[v23];
    uint64_t v26 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    swift_storeEnumTagMultiPayload();
  }
LABEL_15:
  uint64_t v27 = a3[6];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = sub_100046870();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v31 + 24);
  v32(v28, v29, v30);
  uint64_t v33 = a3[7];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  LODWORD(v29) = sub_100004B4C((uint64_t)v34, 1, (uint64_t)v36);
  int v37 = sub_100004B4C((uint64_t)v35, 1, (uint64_t)v36);
  if (v29)
  {
    if (!v37)
    {
      *(void *)uint64_t v34 = *(void *)v35;
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
      v38(&v34[v36[5]], &v35[v36[5]], v30);
      uint64_t v39 = v36[6];
      uint64_t v40 = &v34[v39];
      uint64_t v41 = (uint64_t *)&v35[v39];
      uint64_t v42 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      if (sub_100004B4C((uint64_t)v41, 1, v42))
      {
        uint64_t v43 = sub_10000488C(&qword_1000592F8);
        memcpy(v40, v41, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        uint64_t v54 = *v41;
        v40[8] = *((unsigned char *)v41 + 8);
        *(void *)uint64_t v40 = v54;
        uint64_t v55 = v41[2];
        v40[24] = *((unsigned char *)v41 + 24);
        *((void *)v40 + 2) = v55;
        uint64_t v56 = v41[4];
        v40[40] = *((unsigned char *)v41 + 40);
        *((void *)v40 + 4) = v56;
        v38(&v40[*(int *)(v42 + 28)], (char *)v41 + *(int *)(v42 + 28), v30);
        sub_100004938((uint64_t)v40, 0, 1, v42);
      }
      uint64_t v57 = v36[7];
      uint64_t v58 = &v34[v57];
      uint64_t v59 = &v35[v57];
      uint64_t v60 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      if (sub_100004B4C((uint64_t)v59, 1, v60))
      {
        uint64_t v61 = sub_10000488C(&qword_1000592E8);
        memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v58 = *(void *)v59;
        *((void *)v58 + 1) = *((void *)v59 + 1);
        *((void *)v58 + 2) = *((void *)v59 + 2);
        uint64_t v62 = *(int *)(v60 + 24);
        uint64_t v63 = &v58[v62];
        uint64_t v64 = &v59[v62];
        swift_bridgeObjectRetain();
        v38(v63, v64, v30);
        sub_100004938((uint64_t)v58, 0, 1, v60);
      }
      uint64_t v65 = (uint64_t)v34;
      uint64_t v66 = (uint64_t)v36;
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  if (v37)
  {
    sub_100018A8C((uint64_t)v34, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
LABEL_21:
    size_t v44 = *(void *)(*(void *)(sub_10000488C(&qword_1000592D8) - 8) + 64);
    uint64_t v45 = v34;
    uint64_t v46 = v35;
    goto LABEL_22;
  }
  uint64_t v88 = v31;
  *(void *)uint64_t v34 = *(void *)v35;
  v32(&v34[v36[5]], &v35[v36[5]], v30);
  uint64_t v47 = v36[6];
  uint64_t v48 = (uint64_t)&v34[v47];
  uint64_t v49 = &v35[v47];
  uint64_t v50 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  uint64_t v87 = v48;
  LODWORD(v48) = sub_100004B4C(v48, 1, v50);
  int v51 = sub_100004B4C((uint64_t)v49, 1, v50);
  if (v48)
  {
    if (!v51)
    {
      uint64_t v69 = *(void *)v49;
      *(unsigned char *)(v87 + 8) = v49[8];
      *(void *)uint64_t v87 = v69;
      uint64_t v70 = *((void *)v49 + 2);
      *(unsigned char *)(v87 + 24) = v49[24];
      *(void *)(v87 + 16) = v70;
      uint64_t v71 = *((void *)v49 + 4);
      *(unsigned char *)(v87 + 40) = v49[40];
      *(void *)(v87 + 32) = v71;
      uint64_t v72 = *(int *)(v50 + 28);
      uint64_t v73 = &v49[v72];
      uint64_t v68 = v88;
      (*(void (**)(uint64_t, char *, uint64_t))(v88 + 16))(v87 + v72, v73, v30);
      sub_100004938(v87, 0, 1, v50);
      goto LABEL_38;
    }
    size_t v52 = *(void *)(*(void *)(sub_10000488C(&qword_1000592F8) - 8) + 64);
    uint64_t v53 = (void *)v87;
  }
  else
  {
    if (!v51)
    {
      uint64_t v84 = *(void *)v49;
      *(unsigned char *)(v87 + 8) = v49[8];
      *(void *)uint64_t v87 = v84;
      uint64_t v85 = *((void *)v49 + 2);
      *(unsigned char *)(v87 + 24) = v49[24];
      *(void *)(v87 + 16) = v85;
      uint64_t v86 = *((void *)v49 + 4);
      *(unsigned char *)(v87 + 40) = v49[40];
      *(void *)(v87 + 32) = v86;
      v32((char *)(v87 + *(int *)(v50 + 28)), &v49[*(int *)(v50 + 28)], v30);
      goto LABEL_36;
    }
    sub_100018A8C(v87, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
    size_t v52 = *(void *)(*(void *)(sub_10000488C(&qword_1000592F8) - 8) + 64);
    uint64_t v53 = (void *)v87;
  }
  memcpy(v53, v49, v52);
LABEL_36:
  uint64_t v68 = v88;
LABEL_38:
  uint64_t v74 = v36[7];
  uint64_t v75 = &v34[v74];
  uint64_t v76 = &v35[v74];
  uint64_t v77 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  int v78 = sub_100004B4C((uint64_t)v75, 1, v77);
  int v79 = sub_100004B4C((uint64_t)v76, 1, v77);
  if (v78)
  {
    if (!v79)
    {
      *(void *)uint64_t v75 = *(void *)v76;
      *((void *)v75 + 1) = *((void *)v76 + 1);
      *((void *)v75 + 2) = *((void *)v76 + 2);
      uint64_t v80 = *(int *)(v77 + 24);
      long long v81 = &v75[v80];
      uint64_t v82 = &v76[v80];
      uint64_t v83 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
      swift_bridgeObjectRetain();
      v83(v81, v82, v30);
      uint64_t v65 = (uint64_t)v75;
      uint64_t v66 = v77;
LABEL_31:
      sub_100004938(v65, 0, 1, v66);
      return a1;
    }
  }
  else
  {
    if (!v79)
    {
      *(void *)uint64_t v75 = *(void *)v76;
      *((void *)v75 + 1) = *((void *)v76 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v75 + 2) = *((void *)v76 + 2);
      v32(&v75[*(int *)(v77 + 24)], &v76[*(int *)(v77 + 24)], v30);
      return a1;
    }
    sub_100018A8C((uint64_t)v75, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
  }
  size_t v44 = *(void *)(*(void *)(sub_10000488C(&qword_1000592E8) - 8) + 64);
  uint64_t v45 = v75;
  uint64_t v46 = v76;
LABEL_22:
  memcpy(v45, v46, v44);
  return a1;
}

_OWORD *sub_10002DE78(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  if (sub_100004B4C((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = sub_10000488C(&qword_1000592C8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)unint64_t v7 = *(void *)v8;
      v7[8] = v8[8];
      uint64_t v11 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                   + 20);
    }
    else
    {
      *unint64_t v7 = *v8;
      uint64_t v11 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                   + 20);
    }
    uint64_t v12 = &v7[v11];
    uint64_t v13 = &v8[v11];
    uint64_t v14 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
    swift_storeEnumTagMultiPayload();
    sub_100004938((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_100046870();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32);
  v19(v16, v17, v18);
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  if (sub_100004B4C((uint64_t)v22, 1, (uint64_t)v23))
  {
    uint64_t v24 = sub_10000488C(&qword_1000592D8);
    memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    *uint64_t v21 = *v22;
    v19((char *)v21 + v23[5], (char *)v22 + v23[5], v18);
    uint64_t v25 = v23[6];
    uint64_t v26 = (void *)((char *)v21 + v25);
    uint64_t v27 = (void *)((char *)v22 + v25);
    uint64_t v28 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (sub_100004B4C((uint64_t)v27, 1, v28))
    {
      uint64_t v29 = sub_10000488C(&qword_1000592F8);
      memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      *uint64_t v26 = *v27;
      *((unsigned char *)v26 + 8) = *((unsigned char *)v27 + 8);
      v26[2] = v27[2];
      *((unsigned char *)v26 + 24) = *((unsigned char *)v27 + 24);
      v26[4] = v27[4];
      *((unsigned char *)v26 + 40) = *((unsigned char *)v27 + 40);
      v19((char *)v26 + *(int *)(v28 + 28), (char *)v27 + *(int *)(v28 + 28), v18);
      sub_100004938((uint64_t)v26, 0, 1, v28);
    }
    uint64_t v30 = v23[7];
    uint64_t v31 = (void *)((char *)v21 + v30);
    uint64_t v32 = (void *)((char *)v22 + v30);
    uint64_t v33 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    if (sub_100004B4C((uint64_t)v32, 1, v33))
    {
      uint64_t v34 = sub_10000488C(&qword_1000592E8);
      memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
      v31[2] = v32[2];
      v19((char *)v31 + *(int *)(v33 + 24), (char *)v32 + *(int *)(v33 + 24), v18);
      sub_100004938((uint64_t)v31, 0, 1, v33);
    }
    sub_100004938((uint64_t)v21, 0, 1, (uint64_t)v23);
  }
  return a1;
}

uint64_t *sub_10002E258(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001C274(v6, v7);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
  int v12 = sub_100004B4C((uint64_t)v9, 1, v11);
  int v13 = sub_100004B4C((uint64_t)v10, 1, v11);
  if (v12)
  {
    if (!v13)
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        *(void *)uint64_t v9 = *(void *)v10;
        v9[8] = v10[8];
        uint64_t v14 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                     + 20);
      }
      else
      {
        *uint64_t v9 = *v10;
        uint64_t v14 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                     + 20);
      }
      uint64_t v15 = &v9[v14];
      uint64_t v16 = &v10[v14];
      uint64_t v17 = sub_100046870();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
      swift_storeEnumTagMultiPayload();
      sub_100004938((uint64_t)v9, 0, 1, v11);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v18 = sub_10000488C(&qword_1000592C8);
    memcpy(v9, v10, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_15;
  }
  if (v13)
  {
    sub_100018A8C((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_100018A8C((uint64_t)v9, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)uint64_t v9 = *(void *)v10;
      v9[8] = v10[8];
      uint64_t v19 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationEnded(0)
                   + 20);
    }
    else
    {
      *uint64_t v9 = *v10;
      uint64_t v19 = *(int *)(type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationStarted(0)
                   + 20);
    }
    uint64_t v20 = &v9[v19];
    uint64_t v21 = &v10[v19];
    uint64_t v22 = sub_100046870();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
    swift_storeEnumTagMultiPayload();
  }
LABEL_15:
  uint64_t v23 = a3[6];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_100046870();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v27 + 40);
  v28(v24, v25, v26);
  uint64_t v29 = a3[7];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  LODWORD(v25) = sub_100004B4C((uint64_t)v30, 1, (uint64_t)v32);
  int v33 = sub_100004B4C((uint64_t)v31, 1, (uint64_t)v32);
  if (v25)
  {
    if (!v33)
    {
      *(void *)uint64_t v30 = *(void *)v31;
      uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
      v34(&v30[v32[5]], &v31[v32[5]], v26);
      uint64_t v35 = v32[6];
      uint64_t v36 = &v30[v35];
      int v37 = &v31[v35];
      uint64_t v38 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      if (sub_100004B4C((uint64_t)v37, 1, v38))
      {
        uint64_t v39 = sub_10000488C(&qword_1000592F8);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v36 = *(void *)v37;
        v36[8] = v37[8];
        *((void *)v36 + 2) = *((void *)v37 + 2);
        v36[24] = v37[24];
        *((void *)v36 + 4) = *((void *)v37 + 4);
        v36[40] = v37[40];
        v34(&v36[*(int *)(v38 + 28)], &v37[*(int *)(v38 + 28)], v26);
        sub_100004938((uint64_t)v36, 0, 1, v38);
      }
      uint64_t v50 = v32[7];
      int v51 = &v30[v50];
      size_t v52 = &v31[v50];
      uint64_t v53 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      if (sub_100004B4C((uint64_t)v52, 1, v53))
      {
        uint64_t v54 = sub_10000488C(&qword_1000592E8);
        memcpy(v51, v52, *(void *)(*(void *)(v54 - 8) + 64));
      }
      else
      {
        *(_OWORD *)int v51 = *(_OWORD *)v52;
        *((void *)v51 + 2) = *((void *)v52 + 2);
        v34(&v51[*(int *)(v53 + 24)], &v52[*(int *)(v53 + 24)], v26);
        sub_100004938((uint64_t)v51, 0, 1, v53);
      }
      uint64_t v55 = (uint64_t)v30;
      uint64_t v56 = (uint64_t)v32;
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  if (v33)
  {
    sub_100018A8C((uint64_t)v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
LABEL_21:
    size_t v40 = *(void *)(*(void *)(sub_10000488C(&qword_1000592D8) - 8) + 64);
    uint64_t v41 = v30;
    uint64_t v42 = v31;
    goto LABEL_22;
  }
  uint64_t v69 = v27;
  *(void *)uint64_t v30 = *(void *)v31;
  v28(&v30[v32[5]], &v31[v32[5]], v26);
  uint64_t v43 = v32[6];
  uint64_t v44 = (uint64_t)&v30[v43];
  uint64_t v45 = &v31[v43];
  uint64_t v46 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  uint64_t v68 = v44;
  LODWORD(v44) = sub_100004B4C(v44, 1, v46);
  int v47 = sub_100004B4C((uint64_t)v45, 1, v46);
  if (v44)
  {
    if (!v47)
    {
      *(void *)uint64_t v68 = *(void *)v45;
      *(unsigned char *)(v68 + 8) = v45[8];
      *(void *)(v68 + 16) = *((void *)v45 + 2);
      *(unsigned char *)(v68 + 24) = v45[24];
      *(void *)(v68 + 32) = *((void *)v45 + 4);
      *(unsigned char *)(v68 + 40) = v45[40];
      uint64_t v59 = *(int *)(v46 + 28);
      uint64_t v60 = &v45[v59];
      uint64_t v58 = v69;
      (*(void (**)(uint64_t, char *, uint64_t))(v69 + 32))(v68 + v59, v60, v26);
      sub_100004938(v68, 0, 1, v46);
      goto LABEL_38;
    }
    size_t v48 = *(void *)(*(void *)(sub_10000488C(&qword_1000592F8) - 8) + 64);
    uint64_t v49 = (void *)v68;
  }
  else
  {
    if (!v47)
    {
      *(void *)uint64_t v68 = *(void *)v45;
      *(unsigned char *)(v68 + 8) = v45[8];
      *(void *)(v68 + 16) = *((void *)v45 + 2);
      *(unsigned char *)(v68 + 24) = v45[24];
      *(void *)(v68 + 32) = *((void *)v45 + 4);
      *(unsigned char *)(v68 + 40) = v45[40];
      v28((char *)(v68 + *(int *)(v46 + 28)), &v45[*(int *)(v46 + 28)], v26);
      goto LABEL_36;
    }
    sub_100018A8C(v68, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
    size_t v48 = *(void *)(*(void *)(sub_10000488C(&qword_1000592F8) - 8) + 64);
    uint64_t v49 = (void *)v68;
  }
  memcpy(v49, v45, v48);
LABEL_36:
  uint64_t v58 = v69;
LABEL_38:
  uint64_t v61 = v32[7];
  uint64_t v62 = (uint64_t)&v30[v61];
  uint64_t v63 = (uint64_t)&v31[v61];
  uint64_t v64 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  int v65 = sub_100004B4C(v62, 1, v64);
  int v66 = sub_100004B4C(v63, 1, v64);
  if (v65)
  {
    if (!v66)
    {
      *(_OWORD *)uint64_t v62 = *(_OWORD *)v63;
      *(void *)(v62 + 16) = *(void *)(v63 + 16);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 32))(v62 + *(int *)(v64 + 24), v63 + *(int *)(v64 + 24), v26);
      uint64_t v55 = v62;
      uint64_t v56 = v64;
LABEL_31:
      sub_100004938(v55, 0, 1, v56);
      return a1;
    }
  }
  else
  {
    if (!v66)
    {
      uint64_t v67 = *(void *)(v63 + 8);
      *(void *)uint64_t v62 = *(void *)v63;
      *(void *)(v62 + 8) = v67;
      swift_bridgeObjectRelease();
      *(void *)(v62 + 16) = *(void *)(v63 + 16);
      v28((char *)(v62 + *(int *)(v64 + 24)), (char *)(v63 + *(int *)(v64 + 24)), v26);
      return a1;
    }
    sub_100018A8C(v62, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
  }
  size_t v40 = *(void *)(*(void *)(sub_10000488C(&qword_1000592E8) - 8) + 64);
  uint64_t v41 = (void *)v62;
  uint64_t v42 = (const void *)v63;
LABEL_22:
  memcpy(v41, v42, v40);
  return a1;
}

uint64_t sub_10002EAD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002EAE8);
}

uint64_t sub_10002EAE8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 12) {
    return sub_100030E90();
  }
  sub_10000488C(&qword_1000592C8);
  sub_100030BF4();
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
  }
  else
  {
    sub_100046870();
    sub_100030BF4();
    if (*(_DWORD *)(v8 + 84) == a2)
    {
      sub_100031450();
    }
    else
    {
      sub_10000488C(&qword_1000592D8);
      sub_100031444();
    }
  }
  uint64_t v9 = sub_100030F6C(v7);

  return sub_100004B4C(v9, v10, v11);
}

uint64_t sub_10002EBA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002EBBC);
}

void sub_10002EBBC(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 12)
  {
    sub_10003141C();
  }
  else
  {
    sub_10000488C(&qword_1000592C8);
    sub_100030BF4();
    if (*(_DWORD *)(v4 + 84) == a3)
    {
      sub_1000316A4();
    }
    else
    {
      sub_100046870();
      sub_100030BF4();
      if (*(_DWORD *)(v6 + 84) == a3)
      {
        sub_1000314A8();
      }
      else
      {
        sub_10000488C(&qword_1000592D8);
        sub_10003149C();
      }
    }
    uint64_t v7 = sub_100030DB0(v5);
    sub_100004938(v7, v8, v9, v10);
  }
}

void sub_10002EC7C()
{
  sub_100027BBC(319, &qword_10005A150, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent);
  if (v0 <= 0x3F)
  {
    sub_100046870();
    if (v1 <= 0x3F)
    {
      sub_100027BBC(319, (unint64_t *)&unk_10005A158, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

unint64_t sub_10002EDC4(unint64_t a1, uint64_t a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    sub_1000197D8(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
    uint64_t v9 = a3[6];
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = sub_100046870();
    int v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (void *)(a2 + v14);
    uint64_t v17 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
    if (sub_100004B4C((uint64_t)v16, 1, (uint64_t)v17))
    {
      uint64_t v18 = sub_10000488C(&qword_1000592D8);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      *uint64_t v15 = *v16;
      v13((uint64_t)v15 + v17[5], (uint64_t)v16 + v17[5], v12);
      uint64_t v20 = v17[6];
      uint64_t v21 = (void *)((char *)v15 + v20);
      uint64_t v22 = (void *)((char *)v16 + v20);
      uint64_t v46 = (void (*)(char *, char *, uint64_t))v13;
      uint64_t v23 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      if (sub_100004B4C((uint64_t)v22, 1, v23))
      {
        uint64_t v24 = sub_10000488C(&qword_1000592F8);
        memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        *uint64_t v21 = *v22;
        *((unsigned char *)v21 + 8) = *((unsigned char *)v22 + 8);
        v21[2] = v22[2];
        *((unsigned char *)v21 + 24) = *((unsigned char *)v22 + 24);
        v21[4] = v22[4];
        *((unsigned char *)v21 + 40) = *((unsigned char *)v22 + 40);
        v46((char *)v21 + *(int *)(v23 + 28), (char *)v22 + *(int *)(v23 + 28), v12);
        sub_100004938((uint64_t)v21, 0, 1, v23);
      }
      uint64_t v25 = v17[7];
      uint64_t v26 = (void *)((char *)v15 + v25);
      uint64_t v27 = (void *)((char *)v16 + v25);
      uint64_t v28 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      if (sub_100004B4C((uint64_t)v27, 1, v28))
      {
        uint64_t v29 = sub_10000488C(&qword_1000592E8);
        memcpy(v26, v27, *(void *)(*(void *)(v29 - 8) + 64));
        int v13 = (void (*)(uint64_t, uint64_t, uint64_t))v46;
      }
      else
      {
        uint64_t v30 = v27[1];
        *uint64_t v26 = *v27;
        v26[1] = v30;
        v26[2] = v27[2];
        uint64_t v31 = *(int *)(v28 + 24);
        uint64_t v32 = (char *)v26 + v31;
        int v33 = (char *)v27 + v31;
        swift_bridgeObjectRetain();
        uint64_t v34 = v32;
        int v13 = (void (*)(uint64_t, uint64_t, uint64_t))v46;
        v46(v34, v33, v12);
        sub_100004938((uint64_t)v26, 0, 1, v28);
      }
      sub_100004938((uint64_t)v15, 0, 1, (uint64_t)v17);
    }
    uint64_t v35 = a3[8];
    uint64_t v36 = (void *)(a1 + v35);
    int v37 = (void *)(a2 + v35);
    uint64_t v38 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
    if (sub_100004B4C((uint64_t)v37, 1, v38))
    {
      uint64_t v39 = sub_10000488C(&qword_100059310);
      memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      uint64_t v40 = v37[1];
      *uint64_t v36 = *v37;
      v36[1] = v40;
      uint64_t v41 = v37[3];
      v36[2] = v37[2];
      v36[3] = v41;
      *((unsigned char *)v36 + 32) = *((unsigned char *)v37 + 32);
      uint64_t v42 = *(int *)(v38 + 28);
      uint64_t v43 = (char *)v36 + v42;
      uint64_t v44 = (char *)v37 + v42;
      swift_bridgeObjectRetain();
      v13((uint64_t)v43, (uint64_t)v44, v12);
      sub_100004938((uint64_t)v36, 0, 1, v38);
    }
  }
  return a1;
}

uint64_t sub_10002F1A0(uint64_t a1, int *a2)
{
  sub_10001C274(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_100046870();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v16(v4, v5);
  uint64_t v6 = a1 + a2[7];
  uint64_t v7 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  if (!sub_100004B4C(v6, 1, (uint64_t)v7))
  {
    v16(v6 + v7[5], v5);
    uint64_t v8 = v6 + v7[6];
    uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (!sub_100004B4C(v8, 1, v9)) {
      v16(v8 + *(int *)(v9 + 28), v5);
    }
    uint64_t v10 = v6 + v7[7];
    uint64_t v11 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    if (!sub_100004B4C(v10, 1, v11))
    {
      swift_bridgeObjectRelease();
      v16(v10 + *(int *)(v11 + 24), v5);
    }
  }
  uint64_t v12 = a1 + a2[8];
  uint64_t v13 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  uint64_t result = sub_100004B4C(v12, 1, v13);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v15 = v12 + *(int *)(v13 + 28);
    return ((uint64_t (*)(uint64_t, uint64_t))v16)(v15, v5);
  }
  return result;
}

uint64_t sub_10002F380(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_1000197D8(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100046870();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  if (sub_100004B4C((uint64_t)v15, 1, (uint64_t)v16))
  {
    uint64_t v17 = sub_10000488C(&qword_1000592D8);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v45 = a3;
    *uint64_t v14 = *v15;
    v12((uint64_t)v14 + v16[5], (uint64_t)v15 + v16[5], v11);
    uint64_t v18 = v16[6];
    uint64_t v19 = (void *)((char *)v14 + v18);
    uint64_t v20 = (void *)((char *)v15 + v18);
    uint64_t v21 = v12;
    uint64_t v22 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    uint64_t v46 = v21;
    if (sub_100004B4C((uint64_t)v20, 1, v22))
    {
      uint64_t v23 = sub_10000488C(&qword_1000592F8);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      *uint64_t v19 = *v20;
      *((unsigned char *)v19 + 8) = *((unsigned char *)v20 + 8);
      v19[2] = v20[2];
      *((unsigned char *)v19 + 24) = *((unsigned char *)v20 + 24);
      v19[4] = v20[4];
      *((unsigned char *)v19 + 40) = *((unsigned char *)v20 + 40);
      v21((uint64_t)v19 + *(int *)(v22 + 28), (uint64_t)v20 + *(int *)(v22 + 28), v11);
      sub_100004938((uint64_t)v19, 0, 1, v22);
    }
    uint64_t v24 = v16[7];
    uint64_t v25 = (void *)((char *)v14 + v24);
    uint64_t v26 = (void *)((char *)v15 + v24);
    uint64_t v27 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    a3 = v45;
    if (sub_100004B4C((uint64_t)v26, 1, v27))
    {
      uint64_t v28 = sub_10000488C(&qword_1000592E8);
      memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
      uint64_t v12 = v46;
    }
    else
    {
      uint64_t v29 = v26[1];
      *uint64_t v25 = *v26;
      v25[1] = v29;
      v25[2] = v26[2];
      uint64_t v30 = *(int *)(v27 + 24);
      uint64_t v31 = (char *)v25 + v30;
      uint64_t v32 = (char *)v26 + v30;
      swift_bridgeObjectRetain();
      int v33 = v31;
      uint64_t v12 = v46;
      v46((uint64_t)v33, (uint64_t)v32, v11);
      sub_100004938((uint64_t)v25, 0, 1, v27);
    }
    sub_100004938((uint64_t)v14, 0, 1, (uint64_t)v16);
  }
  uint64_t v34 = a3[8];
  uint64_t v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  uint64_t v37 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  if (sub_100004B4C((uint64_t)v36, 1, v37))
  {
    uint64_t v38 = sub_10000488C(&qword_100059310);
    memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    uint64_t v39 = v36[1];
    void *v35 = *v36;
    v35[1] = v39;
    uint64_t v40 = v36[3];
    v35[2] = v36[2];
    v35[3] = v40;
    *((unsigned char *)v35 + 32) = *((unsigned char *)v36 + 32);
    uint64_t v41 = *(int *)(v37 + 28);
    uint64_t v42 = (char *)v35 + v41;
    uint64_t v43 = (char *)v36 + v41;
    swift_bridgeObjectRetain();
    v12((uint64_t)v42, (uint64_t)v43, v11);
    sub_100004938((uint64_t)v35, 0, 1, v37);
  }
  return a1;
}

uint64_t sub_10002F714(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  sub_1000197D8(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  sub_10001C274(v8, v9);
  uint64_t v10 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100046870();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 24);
  v83(v12, v13, v14);
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  int v20 = sub_100004B4C((uint64_t)v17, 1, (uint64_t)v19);
  int v21 = sub_100004B4C((uint64_t)v18, 1, (uint64_t)v19);
  if (!v20)
  {
    if (v21)
    {
      sub_100018A8C((uint64_t)v17, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      goto LABEL_7;
    }
    uint64_t v80 = a3;
    *uint64_t v17 = *v18;
    uint64_t v82 = v14;
    v83((uint64_t)v17 + v19[5], (uint64_t)v18 + v19[5], v14);
    uint64_t v29 = v19[6];
    uint64_t v30 = (char *)v17 + v29;
    uint64_t v31 = (char *)v18 + v29;
    uint64_t v32 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    int v33 = sub_100004B4C((uint64_t)v30, 1, v32);
    int v34 = sub_100004B4C((uint64_t)v31, 1, v32);
    if (v33)
    {
      if (!v34)
      {
        uint64_t v35 = *(void *)v31;
        v30[8] = v31[8];
        *(void *)uint64_t v30 = v35;
        uint64_t v36 = *((void *)v31 + 2);
        v30[24] = v31[24];
        *((void *)v30 + 2) = v36;
        uint64_t v37 = *((void *)v31 + 4);
        v30[40] = v31[40];
        *((void *)v30 + 4) = v37;
        uint64_t v14 = v82;
        (*(void (**)(unsigned char *, char *, uint64_t))(v15 + 16))(&v30[*(int *)(v32 + 28)], &v31[*(int *)(v32 + 28)], v82);
        sub_100004938((uint64_t)v30, 0, 1, v32);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v34)
      {
        uint64_t v76 = *(void *)v31;
        v30[8] = v31[8];
        *(void *)uint64_t v30 = v76;
        uint64_t v77 = *((void *)v31 + 2);
        v30[24] = v31[24];
        *((void *)v30 + 2) = v77;
        uint64_t v78 = *((void *)v31 + 4);
        v30[40] = v31[40];
        *((void *)v30 + 4) = v78;
        uint64_t v14 = v82;
        v83((uint64_t)&v30[*(int *)(v32 + 28)], (uint64_t)&v31[*(int *)(v32 + 28)], v82);
LABEL_19:
        uint64_t v51 = v19[7];
        size_t v52 = (void *)((char *)v17 + v51);
        uint64_t v53 = (void *)((char *)v18 + v51);
        uint64_t v54 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
        int v55 = sub_100004B4C((uint64_t)v52, 1, v54);
        int v56 = sub_100004B4C((uint64_t)v53, 1, v54);
        if (v55)
        {
          if (!v56)
          {
            *size_t v52 = *v53;
            v52[1] = v53[1];
            v52[2] = v53[2];
            uint64_t v57 = *(int *)(v54 + 24);
            uint64_t v58 = (char *)v52 + v57;
            uint64_t v59 = (char *)v53 + v57;
            uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
            swift_bridgeObjectRetain();
            v60(v58, v59, v14);
            sub_100004938((uint64_t)v52, 0, 1, v54);
LABEL_25:
            a3 = v80;
            goto LABEL_26;
          }
        }
        else
        {
          if (!v56)
          {
            *size_t v52 = *v53;
            v52[1] = v53[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v52[2] = v53[2];
            v83((uint64_t)v52 + *(int *)(v54 + 24), (uint64_t)v53 + *(int *)(v54 + 24), v14);
            goto LABEL_25;
          }
          sub_100018A8C((uint64_t)v52, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
        }
        uint64_t v61 = sub_10000488C(&qword_1000592E8);
        memcpy(v52, v53, *(void *)(*(void *)(v61 - 8) + 64));
        goto LABEL_25;
      }
      sub_100018A8C((uint64_t)v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
    }
    uint64_t v50 = sub_10000488C(&qword_1000592F8);
    memcpy(v30, v31, *(void *)(*(void *)(v50 - 8) + 64));
    uint64_t v14 = v82;
    goto LABEL_19;
  }
  if (v21)
  {
LABEL_7:
    uint64_t v28 = sub_10000488C(&qword_1000592D8);
    memcpy(v17, v18, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_26;
  }
  int v79 = a3;
  *uint64_t v17 = *v18;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v22((char *)v17 + v19[5], (char *)v18 + v19[5], v14);
  uint64_t v23 = v19[6];
  uint64_t v24 = (void *)((char *)v17 + v23);
  uint64_t v25 = (void *)((char *)v18 + v23);
  uint64_t v81 = v14;
  uint64_t v26 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  if (sub_100004B4C((uint64_t)v25, 1, v26))
  {
    uint64_t v27 = sub_10000488C(&qword_1000592F8);
    memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    uint64_t v38 = *v25;
    *((unsigned char *)v24 + 8) = *((unsigned char *)v25 + 8);
    *uint64_t v24 = v38;
    uint64_t v39 = v25[2];
    *((unsigned char *)v24 + 24) = *((unsigned char *)v25 + 24);
    void v24[2] = v39;
    uint64_t v40 = v25[4];
    *((unsigned char *)v24 + 40) = *((unsigned char *)v25 + 40);
    v24[4] = v40;
    v22((char *)v24 + *(int *)(v26 + 28), (char *)v25 + *(int *)(v26 + 28), v81);
    sub_100004938((uint64_t)v24, 0, 1, v26);
  }
  uint64_t v41 = v19[7];
  uint64_t v42 = (void *)((char *)v17 + v41);
  uint64_t v43 = (void *)((char *)v18 + v41);
  uint64_t v44 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  if (sub_100004B4C((uint64_t)v43, 1, v44))
  {
    uint64_t v45 = sub_10000488C(&qword_1000592E8);
    memcpy(v42, v43, *(void *)(*(void *)(v45 - 8) + 64));
    uint64_t v14 = v81;
  }
  else
  {
    *uint64_t v42 = *v43;
    v42[1] = v43[1];
    v42[2] = v43[2];
    uint64_t v46 = *(int *)(v44 + 24);
    int v47 = (char *)v42 + v46;
    size_t v48 = (char *)v43 + v46;
    swift_bridgeObjectRetain();
    uint64_t v49 = v47;
    uint64_t v14 = v81;
    v22(v49, v48, v81);
    sub_100004938((uint64_t)v42, 0, 1, v44);
  }
  a3 = v79;
  sub_100004938((uint64_t)v17, 0, 1, (uint64_t)v19);
LABEL_26:
  uint64_t v62 = a3[8];
  uint64_t v63 = a1 + v62;
  uint64_t v64 = a2 + v62;
  uint64_t v65 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  int v66 = sub_100004B4C(v63, 1, v65);
  int v67 = sub_100004B4C(v64, 1, v65);
  if (!v66)
  {
    if (!v67)
    {
      *(void *)uint64_t v63 = *(void *)v64;
      *(void *)(v63 + 8) = *(void *)(v64 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(v63 + 16) = *(void *)(v64 + 16);
      uint64_t v75 = *(void *)(v64 + 24);
      *(unsigned char *)(v63 + 32) = *(unsigned char *)(v64 + 32);
      *(void *)(v63 + 24) = v75;
      v83(v63 + *(int *)(v65 + 28), v64 + *(int *)(v65 + 28), v14);
      return a1;
    }
    sub_100018A8C(v63, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
    goto LABEL_31;
  }
  if (v67)
  {
LABEL_31:
    uint64_t v73 = sub_10000488C(&qword_100059310);
    memcpy((void *)v63, (const void *)v64, *(void *)(*(void *)(v73 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v63 = *(void *)v64;
  *(void *)(v63 + 8) = *(void *)(v64 + 8);
  *(void *)(v63 + 16) = *(void *)(v64 + 16);
  uint64_t v68 = *(void *)(v64 + 24);
  *(unsigned char *)(v63 + 32) = *(unsigned char *)(v64 + 32);
  *(void *)(v63 + 24) = v68;
  uint64_t v69 = *(int *)(v65 + 28);
  uint64_t v70 = v63 + v69;
  uint64_t v71 = v64 + v69;
  uint64_t v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  swift_bridgeObjectRetain();
  v72(v70, v71, v14);
  sub_100004938(v63, 0, 1, v65);
  return a1;
}

uint64_t sub_10002FEA4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = a3[6];
  unint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_100046870();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  if (sub_100004B4C((uint64_t)v13, 1, (uint64_t)v14))
  {
    uint64_t v15 = sub_10000488C(&qword_1000592D8);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    *uint64_t v12 = *v13;
    v10((char *)v12 + v14[5], (char *)v13 + v14[5], v9);
    uint64_t v16 = v14[6];
    uint64_t v17 = (void *)((char *)v12 + v16);
    uint64_t v18 = (void *)((char *)v13 + v16);
    int v33 = v10;
    uint64_t v19 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
    if (sub_100004B4C((uint64_t)v18, 1, v19))
    {
      uint64_t v20 = sub_10000488C(&qword_1000592F8);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      *uint64_t v17 = *v18;
      *((unsigned char *)v17 + 8) = *((unsigned char *)v18 + 8);
      v17[2] = v18[2];
      *((unsigned char *)v17 + 24) = *((unsigned char *)v18 + 24);
      v17[4] = v18[4];
      *((unsigned char *)v17 + 40) = *((unsigned char *)v18 + 40);
      v33((char *)v17 + *(int *)(v19 + 28), (char *)v18 + *(int *)(v19 + 28), v9);
      sub_100004938((uint64_t)v17, 0, 1, v19);
    }
    uint64_t v21 = v14[7];
    uint64_t v22 = (void *)((char *)v12 + v21);
    uint64_t v23 = (void *)((char *)v13 + v21);
    uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
    if (sub_100004B4C((uint64_t)v23, 1, v24))
    {
      uint64_t v25 = sub_10000488C(&qword_1000592E8);
      memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
      uint64_t v10 = v33;
    }
    else
    {
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      v22[2] = v23[2];
      uint64_t v10 = v33;
      v33((char *)v22 + *(int *)(v24 + 24), (char *)v23 + *(int *)(v24 + 24), v9);
      sub_100004938((uint64_t)v22, 0, 1, v24);
    }
    sub_100004938((uint64_t)v12, 0, 1, (uint64_t)v14);
  }
  uint64_t v26 = a3[8];
  uint64_t v27 = (_OWORD *)(a1 + v26);
  uint64_t v28 = (_OWORD *)(a2 + v26);
  uint64_t v29 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  if (sub_100004B4C((uint64_t)v28, 1, v29))
  {
    uint64_t v30 = sub_10000488C(&qword_100059310);
    memcpy(v27, v28, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    *uint64_t v27 = *v28;
    uint64_t v31 = *((void *)v28 + 3);
    *((void *)v27 + 2) = *((void *)v28 + 2);
    *((void *)v27 + 3) = v31;
    *((unsigned char *)v27 + 32) = *((unsigned char *)v28 + 32);
    v10((char *)v27 + *(int *)(v29 + 28), (char *)v28 + *(int *)(v29 + 28), v9);
    sub_100004938((uint64_t)v27, 0, 1, v29);
  }
  return a1;
}

uint64_t sub_10003020C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_10001C274(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_100046870();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  uint64_t v66 = a3;
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = (int *)type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(0);
  int v18 = sub_100004B4C((uint64_t)v15, 1, (uint64_t)v17);
  int v19 = sub_100004B4C((uint64_t)v16, 1, (uint64_t)v17);
  uint64_t v65 = v12;
  if (v18)
  {
    if (!v19)
    {
      uint64_t v62 = v13;
      *(void *)uint64_t v15 = *(void *)v16;
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v20(&v15[v17[5]], &v16[v17[5]], v11);
      uint64_t v21 = v17[6];
      uint64_t v22 = &v15[v21];
      uint64_t v23 = &v16[v21];
      uint64_t v63 = v11;
      uint64_t v24 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
      uint64_t v61 = v20;
      if (sub_100004B4C((uint64_t)v23, 1, v24))
      {
        uint64_t v25 = sub_10000488C(&qword_1000592F8);
        memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v22 = *(void *)v23;
        v22[8] = v23[8];
        *((void *)v22 + 2) = *((void *)v23 + 2);
        v22[24] = v23[24];
        *((void *)v22 + 4) = *((void *)v23 + 4);
        v22[40] = v23[40];
        v20(&v22[*(int *)(v24 + 28)], &v23[*(int *)(v24 + 28)], v63);
        sub_100004938((uint64_t)v22, 0, 1, v24);
      }
      uint64_t v35 = v17[7];
      uint64_t v36 = &v15[v35];
      uint64_t v37 = &v16[v35];
      uint64_t v38 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
      uint64_t v13 = v62;
      if (sub_100004B4C((uint64_t)v37, 1, v38))
      {
        uint64_t v39 = sub_10000488C(&qword_1000592E8);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
        uint64_t v11 = v63;
      }
      else
      {
        *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
        *((void *)v36 + 2) = *((void *)v37 + 2);
        uint64_t v11 = v63;
        v61(&v36[*(int *)(v38 + 24)], &v37[*(int *)(v38 + 24)], v63);
        sub_100004938((uint64_t)v36, 0, 1, v38);
      }
      uint64_t v40 = (uint64_t)v15;
      uint64_t v41 = (uint64_t)v17;
      goto LABEL_17;
    }
    goto LABEL_7;
  }
  if (v19)
  {
    sub_100018A8C((uint64_t)v15, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
LABEL_7:
    size_t v26 = *(void *)(*(void *)(sub_10000488C(&qword_1000592D8) - 8) + 64);
    uint64_t v27 = v15;
    uint64_t v28 = v16;
LABEL_8:
    memcpy(v27, v28, v26);
    goto LABEL_18;
  }
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v64 = v11;
  v13((uint64_t)&v15[v17[5]], (uint64_t)&v16[v17[5]], v11);
  uint64_t v29 = v17[6];
  uint64_t v30 = (uint64_t)&v15[v29];
  uint64_t v31 = (uint64_t)&v16[v29];
  uint64_t v32 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
  int v33 = sub_100004B4C(v30, 1, v32);
  int v34 = sub_100004B4C(v31, 1, v32);
  if (v33)
  {
    if (!v34)
    {
      *(void *)uint64_t v30 = *(void *)v31;
      *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
      *(void *)(v30 + 16) = *(void *)(v31 + 16);
      *(unsigned char *)(v30 + 24) = *(unsigned char *)(v31 + 24);
      *(void *)(v30 + 32) = *(void *)(v31 + 32);
      *(unsigned char *)(v30 + 40) = *(unsigned char *)(v31 + 40);
      uint64_t v11 = v64;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v30 + *(int *)(v32 + 28), v31 + *(int *)(v32 + 28), v64);
      sub_100004938(v30, 0, 1, v32);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v34)
  {
    sub_100018A8C(v30, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute);
LABEL_28:
    uint64_t v53 = sub_10000488C(&qword_1000592F8);
    memcpy((void *)v30, (const void *)v31, *(void *)(*(void *)(v53 - 8) + 64));
    uint64_t v11 = v64;
    goto LABEL_29;
  }
  *(void *)uint64_t v30 = *(void *)v31;
  *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
  *(void *)(v30 + 16) = *(void *)(v31 + 16);
  *(unsigned char *)(v30 + 24) = *(unsigned char *)(v31 + 24);
  *(void *)(v30 + 32) = *(void *)(v31 + 32);
  *(unsigned char *)(v30 + 40) = *(unsigned char *)(v31 + 40);
  uint64_t v11 = v64;
  v13(v30 + *(int *)(v32 + 28), v31 + *(int *)(v32 + 28), v64);
LABEL_29:
  uint64_t v54 = v17[7];
  uint64_t v55 = (uint64_t)&v15[v54];
  uint64_t v56 = (uint64_t)&v16[v54];
  uint64_t v57 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(0);
  int v58 = sub_100004B4C(v55, 1, v57);
  int v59 = sub_100004B4C(v56, 1, v57);
  if (v58)
  {
    if (!v59)
    {
      *(_OWORD *)uint64_t v55 = *(_OWORD *)v56;
      *(void *)(v55 + 16) = *(void *)(v56 + 16);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v55 + *(int *)(v57 + 24), v56 + *(int *)(v57 + 24), v11);
      uint64_t v40 = v55;
      uint64_t v41 = v57;
LABEL_17:
      sub_100004938(v40, 0, 1, v41);
      goto LABEL_18;
    }
    goto LABEL_34;
  }
  if (v59)
  {
    sub_100018A8C(v55, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
LABEL_34:
    size_t v26 = *(void *)(*(void *)(sub_10000488C(&qword_1000592E8) - 8) + 64);
    uint64_t v27 = (void *)v55;
    uint64_t v28 = (const void *)v56;
    goto LABEL_8;
  }
  uint64_t v60 = *(void *)(v56 + 8);
  *(void *)uint64_t v55 = *(void *)v56;
  *(void *)(v55 + 8) = v60;
  swift_bridgeObjectRelease();
  *(void *)(v55 + 16) = *(void *)(v56 + 16);
  v13(v55 + *(int *)(v57 + 24), v56 + *(int *)(v57 + 24), v11);
LABEL_18:
  uint64_t v42 = *(int *)(v66 + 32);
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  uint64_t v45 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(0);
  int v46 = sub_100004B4C(v43, 1, v45);
  int v47 = sub_100004B4C(v44, 1, v45);
  if (!v46)
  {
    if (!v47)
    {
      uint64_t v51 = *(void *)(v44 + 8);
      *(void *)uint64_t v43 = *(void *)v44;
      *(void *)(v43 + 8) = v51;
      swift_bridgeObjectRelease();
      uint64_t v52 = *(void *)(v44 + 24);
      *(void *)(v43 + 16) = *(void *)(v44 + 16);
      *(void *)(v43 + 24) = v52;
      *(unsigned char *)(v43 + 32) = *(unsigned char *)(v44 + 32);
      v13(v43 + *(int *)(v45 + 28), v44 + *(int *)(v45 + 28), v11);
      return a1;
    }
    sub_100018A8C(v43, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
    goto LABEL_23;
  }
  if (v47)
  {
LABEL_23:
    uint64_t v49 = sub_10000488C(&qword_100059310);
    memcpy((void *)v43, (const void *)v44, *(void *)(*(void *)(v49 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v43 = *(_OWORD *)v44;
  uint64_t v48 = *(void *)(v44 + 24);
  *(void *)(v43 + 16) = *(void *)(v44 + 16);
  *(void *)(v43 + 24) = v48;
  *(unsigned char *)(v43 + 32) = *(unsigned char *)(v44 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 32))(v43 + *(int *)(v45 + 28), v44 + *(int *)(v45 + 28), v11);
  sub_100004938(v43, 0, 1, v45);
  return a1;
}

uint64_t sub_1000308FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100030910);
}

uint64_t sub_100030910(uint64_t a1, int a2)
{
  if (a2 == 12) {
    return sub_100030E90();
  }
  sub_100030E48();
  sub_100030BF4();
  if (*(_DWORD *)(v5 + 84) == v2)
  {
    sub_100031450();
  }
  else
  {
    sub_10000488C(&qword_1000592D8);
    sub_100030BF4();
    if (*(_DWORD *)(v7 + 84) == v2)
    {
      sub_100031444();
    }
    else
    {
      sub_10000488C(&qword_100059310);
      uint64_t v6 = *(int *)(v3 + 32);
    }
  }
  uint64_t v8 = sub_100030F6C(v6);

  return sub_100004B4C(v8, v9, v10);
}

uint64_t sub_1000309C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000309D8);
}

void sub_1000309D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 12)
  {
    sub_10003141C();
  }
  else
  {
    sub_100046870();
    sub_100030BF4();
    if (*(_DWORD *)(v6 + 84) == a3)
    {
      sub_1000314A8();
    }
    else
    {
      sub_10000488C(&qword_1000592D8);
      sub_100030BF4();
      if (*(_DWORD *)(v8 + 84) == a3)
      {
        sub_10003149C();
      }
      else
      {
        sub_10000488C(&qword_100059310);
        uint64_t v7 = *(int *)(a4 + 32);
      }
    }
    uint64_t v9 = sub_100030DB0(v7);
    sub_100004938(v9, v10, v11, v12);
  }
}

void sub_100030A9C()
{
  sub_100046870();
  if (v0 <= 0x3F)
  {
    sub_100027BBC(319, (unint64_t *)&unk_10005A158, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
    if (v1 <= 0x3F)
    {
      sub_100027BBC(319, (unint64_t *)&unk_10005A1F8, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_100030C34()
{
  return v0;
}

uint64_t sub_100030C94()
{
  return v0;
}

uint64_t sub_100030CB8()
{
  return sub_1000468D0();
}

uint64_t sub_100030CE0()
{
  return v0;
}

uint64_t sub_100030CF4()
{
  return sub_100046B00();
}

uint64_t sub_100030D14()
{
  return v0;
}

uint64_t sub_100030D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004B4C(a1, a2, a3);
}

uint64_t sub_100030D54()
{
  return sub_100046870();
}

uint64_t sub_100030D70()
{
  return sub_100046870();
}

uint64_t sub_100030DA4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100030DB0@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_100030DC0@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t sub_100030DE8()
{
  return sub_100046850();
}

uint64_t sub_100030E04(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100030E48()
{
  return sub_100046870();
}

uint64_t sub_100030E90()
{
  uint64_t v1 = *(void *)(v0 + 8) >> 60;
  if (((4 * v1) & 0xC) != 0) {
    return 16 - ((4 * v1) & 0xC | (v1 >> 2));
  }
  else {
    return 0;
  }
}

uint64_t sub_100030EE8()
{
  return sub_100046A20();
}

uint64_t sub_100030F04()
{
  return *(void *)v0;
}

uint64_t sub_100030F20()
{
  return 0;
}

uint64_t sub_100030F48()
{
  return sub_100046A20();
}

uint64_t sub_100030F6C@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_100030F78()
{
  return v0;
}

uint64_t sub_100030F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)(a1, a2, a3, a4, v5, v4);
}

void sub_100030FE4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100031000()
{
  return sub_100046870();
}

uint64_t sub_100031030()
{
  return v0;
}

uint64_t sub_10003103C()
{
  return v0;
}

uint64_t sub_100031050()
{
  return v0;
}

uint64_t sub_100031068()
{
  return sub_1000466E0();
}

uint64_t sub_1000310A0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_retain();
}

uint64_t sub_1000310C4()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)(v0, v2, v1);
}

uint64_t sub_1000310E0()
{
  return sub_100046B00();
}

uint64_t sub_100031104()
{
  return sub_100046B00();
}

uint64_t sub_10003116C()
{
  return sub_1000468D0();
}

uint64_t sub_100031184()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_10003119C()
{
  return sub_100046870();
}

BOOL sub_1000311B4()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  return sub_10000ACF0(v2, v3);
}

BOOL sub_1000311E4()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  return sub_10000ACF0(v2, v3);
}

uint64_t sub_100031214()
{
  return sub_100046A00();
}

uint64_t sub_100031240()
{
  return sub_1000194CC(v1, v0);
}

uint64_t sub_100031258(uint64_t a1)
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)(a1, v2, v1);
}

uint64_t sub_100031270(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100031290()
{
  return v0;
}

uint64_t sub_1000312B8()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_1000312D8()
{
  return v0;
}

uint64_t sub_1000312E4()
{
  return sub_1000194CC(v1, v0);
}

uint64_t sub_1000312FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  return sub_1000197D8(v3, v4);
}

uint64_t sub_100031324()
{
  return v0 & 1;
}

uint64_t sub_100031330()
{
  return sub_100046860();
}

uint64_t sub_100031348()
{
  return sub_100046850();
}

uint64_t sub_1000313C4()
{
  return 0;
}

uint64_t sub_1000313F8()
{
  return v0 & 1;
}

uint64_t sub_100031404()
{
  return v0;
}

void sub_10003141C()
{
  *uint64_t v1 = 0;
  v1[1] = (unint64_t)(((-v0 >> 2) & 3) - 4 * v0) << 60;
}

uint64_t sub_100031434()
{
  return v0;
}

void sub_100031474()
{
  *(void *)(v1 + 8) = (v0 - 1);
}

uint64_t sub_100031480()
{
  return v0 & 1;
}

uint64_t sub_10003148C()
{
  return v0;
}

uint64_t sub_1000314B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_100013E0C(v6, v5, v8, v7, a5);
}

uint64_t sub_1000314D8()
{
  return v0;
}

uint64_t sub_1000314E4()
{
  return v0;
}

void sub_100031534(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_100031544()
{
  return sub_100046A40();
}

uint64_t sub_100031568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)(a1, a2, a3, a4, v5, v4);
}

uint64_t sub_100031584()
{
  return sub_1000194CC(v1, v0);
}

uint64_t sub_10003159C()
{
  return v0;
}

uint64_t sub_1000315A8()
{
  return v0;
}

uint64_t sub_1000315B4()
{
  return v0;
}

uint64_t sub_1000315C8()
{
  return v0;
}

uint64_t sub_1000315E0()
{
  return *(void *)v0;
}

uint64_t sub_100031600()
{
  return sub_100046870();
}

uint64_t sub_100031620()
{
  return sub_100046870();
}

uint64_t sub_100031674()
{
  return sub_1000194CC(v0, v1);
}

uint64_t sub_10003168C()
{
  return v0;
}

uint64_t sub_100031698()
{
  return 0;
}

uint64_t sub_1000316B0()
{
  return v0;
}

uint64_t sub_1000316C4(uint64_t a1)
{
  return sub_100004938(v1, 1, 1, a1);
}

uint64_t sub_1000316E4()
{
  return 0;
}

uint64_t sub_1000316F0()
{
  return sub_100046860();
}

uint64_t sub_100031708(__n128 a1)
{
  *uint64_t v1 = a1;
  v1[1].n128_u64[0] = 0;
  v1[1].n128_u64[1] = 0xE000000000000000;
  return 0;
}

uint64_t sub_10003171C()
{
  return v0;
}

uint64_t sub_100031728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_100010968(v6, v5, v8, v7, a5);
}

uint64_t sub_100031748()
{
  return v0;
}

uint64_t sub_10003175C()
{
  return v0;
}

uint64_t sub_100031770()
{
  return sub_100018A8C(v1, v0);
}

uint64_t sub_100031788@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return 0;
}

void sub_10003179C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_1000317B4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000317FC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return _swift_task_switch(sub_10003181C, 0, 0);
}

uint64_t sub_10003181C()
{
  uint64_t v2 = (void *)v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = swift_task_alloc();
  v0[5] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = swift_task_alloc();
  v0[6] = v4;
  *(void *)(v4 + 16) = v2;
  id v5 = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[7] = v6;
  uint64_t v7 = sub_100046D60();
  *uint64_t v6 = v0;
  v6[1] = sub_100031944;
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(v0 + 2, &unk_10005A5F0, v3, sub_100035244, v4, 0, 0, v7);
}

uint64_t sub_100031944()
{
  sub_100035308();
  sub_1000352B4();
  uint64_t v3 = v2;
  sub_1000352DC();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_1000352CC();
  *uint64_t v6 = v5;
  *(void *)(v3 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_100031A64;
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = sub_100031A48;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100031A48()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_100031A64()
{
  sub_100035314();

  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000352E8();
  return v1();
}

uint64_t sub_100031AD4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100031B70;
  return sub_100031C30(a1);
}

uint64_t sub_100031B70()
{
  sub_100035314();
  sub_1000352B4();
  uint64_t v1 = *v0;
  sub_1000352CC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1000352E8();
  return v3();
}

uint64_t sub_100031C30(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = swift_isaMask & *v1;
  return _swift_task_switch(sub_100031C88, 0, 0);
}

uint64_t sub_100031C88()
{
  sub_100035308();
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[5] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10005A600 + dword_10005A600);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  sub_100046D60();
  void *v3 = v0;
  v3[1] = sub_100031D7C;
  uint64_t v4 = v0[2];
  return v6(v4, 0, 0, (uint64_t)sub_100035268, v2);
}

uint64_t sub_100031D7C()
{
  sub_100035314();
  sub_1000352B4();
  uint64_t v3 = v2;
  sub_1000352DC();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_1000352CC();
  *uint64_t v6 = v5;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100031E80, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    sub_1000352E8();
    return v7();
  }
}

uint64_t sub_100031E80()
{
  sub_100035314();
  swift_task_dealloc();
  sub_1000352E8();
  return v0();
}

uint64_t sub_100031EDC()
{
  uint64_t v1 = *(void *)((char *)v0 + qword_10005A240);
  uint64_t v6 = *(void *)((swift_isaMask & *v0) + 0x50);
  uint64_t v2 = type metadata accessor for EventStateMachine();
  type metadata accessor for PostOpCommand();
  uint64_t v3 = sub_100046C50();
  sub_1000345FC((void (*)(uint64_t))sub_10003440C, (uint64_t)v5, v1, v2, v3);
  uint64_t v7 = v8;
  swift_getWitnessTable();
  sub_100046B90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100031FF4()
{
  return sub_100031EDC();
}

void sub_100032018(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  id v4 = v3;

  *a1 = v3;
}

uint64_t sub_10003204C(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = *v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 16);
  *uint64_t v6 = v3;
  v6[1] = sub_100035298;
  return sub_1000317FC(v5, v7);
}

uint64_t sub_1000320EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a4;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_1000321CC;
  return _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF(a1, a2, a3, a5, a6, v6 + 16);
}

uint64_t sub_1000321CC()
{
  sub_100035314();
  sub_1000352B4();
  uint64_t v3 = v2;
  sub_1000352DC();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_1000352CC();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v3 + 24) = *(void *)(v3 + 16);
  }
  sub_1000352E8();
  return v7();
}

void sub_1000322A0()
{
}

Swift::Int sub_1000322C8()
{
  return sub_100046F50();
}

uint64_t sub_10003230C(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = *v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 16);
  *uint64_t v6 = v3;
  v6[1] = sub_1000323AC;
  return sub_1000317FC(v5, v7);
}

uint64_t sub_1000323AC()
{
  sub_100035308();
  uint64_t v3 = v2;
  sub_1000352B4();
  uint64_t v5 = v4;
  sub_1000352DC();
  *uint64_t v6 = v5;
  uint64_t v7 = *v1;
  sub_1000352CC();
  *uint64_t v8 = v7;
  swift_task_dealloc();
  if (!v0) {
    **(void **)(v5 + 16) = v3;
  }
  uint64_t v9 = *(uint64_t (**)(void))(v7 + 8);
  return v9();
}

uint64_t sub_100032488()
{
  return sub_100031FF4();
}

uint64_t sub_100032490()
{
  return 1;
}

Swift::Int sub_1000324A0()
{
  return sub_100046F50();
}

id sub_1000324F0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_100031EDC();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "dealloc");
}

id sub_100032538(void *a1)
{
  id v1 = a1;
  return sub_1000324F0();
}

uint64_t sub_100032560()
{
  return swift_release();
}

uint64_t sub_100032570(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)v1 + qword_10005A240);
  v7[2] = *(void *)((swift_isaMask & *v1) + 0x50);
  v7[3] = a1;
  uint64_t v3 = type metadata accessor for EventStateMachine();
  uint64_t v4 = type metadata accessor for PostOpCommand();
  uint64_t v5 = sub_100046D60();
  sub_1000345FC((void (*)(uint64_t))sub_1000349B4, (uint64_t)v7, v2, v3, v5);
  if (v8[40] != 255)
  {
    sub_100032914(v4);
    uint64_t v5 = v4;
  }
  (*(void (**)(unsigned char *, uint64_t))(*(void *)(v5 - 8) + 8))(v8, v5);
  return BPSDemandNone;
}

void *sub_100032688@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned __int8 *)(v2 + 32) - 2 < 2)
  {
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    char v4 = -1;
LABEL_9:
    *(unsigned char *)(a2 + 40) = v4;
    return result;
  }
  uint64_t v5 = *(void **)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  if (!*(unsigned char *)(v2 + 32))
  {
    sub_100046D60();
    swift_bridgeObjectRetain();
    sub_100004BC8(&qword_10005A428);
    sub_100046C90();
    sub_100046C50();
    swift_getWitnessTable();
    if (sub_100046D00())
    {
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(unsigned char *)(a2 + 40) = -1;
      return sub_1000341CC(v5, v6, 0);
    }
    uint64_t v9 = sub_100046BF0();
    uint64_t v11 = *(void **)(v2 + 16);
    uint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v9;
    *(void *)(v2 + 24) = 0;
    char v12 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0;
    uint64_t result = sub_1000341CC(v11, v10, v12);
    *(void *)a2 = v5;
    char v4 = 2;
    goto LABEL_9;
  }
  uint64_t v7 = (uint64_t)result;
  uint64_t v16 = *(void *)(v2 + 24);
  sub_100046D60();
  id v8 = v5;
  swift_bridgeObjectRetain();
  sub_100004BC8(&qword_10005A428);
  sub_100046C90();
  sub_100046C50();
  swift_getWitnessTable();
  if (sub_100046D00())
  {

    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(unsigned char *)(a2 + 40) = -1;
  }
  else
  {
    swift_getWitnessTable();
    sub_100046D10();
    uint64_t v13 = *(void **)(v2 + 16);
    uint64_t v14 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v5;
    *(void *)(v2 + 24) = v6;
    char v15 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 1;
    sub_1000341CC(v13, v14, v15);
    *(void *)a2 = v16;
    uint64_t result = (void *)sub_100034850(v7, a2 + 8);
    *(unsigned char *)(a2 + 40) = 0;
  }
  return result;
}

void sub_100032914(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_100046D60();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  char v12 = (char *)&v29 - v11;
  uint64_t v13 = *(void *)(v4 - 8);
  __chkstk_darwin(v10);
  char v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void **, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(&v33, v2, a1);
  switch(v35)
  {
    case 1:
      uint64_t v17 = (uint64_t)v33;
      v32[0] = v34[0];
      uint64_t v18 = sub_10000488C(&qword_10005A428);
      sub_100034568((uint64_t)v32, v17, v5, v18);
      break;
    case 2:
      int v19 = v33;
      swift_bridgeObjectRetain();
      sub_100004BC8(&qword_10005A428);
      sub_100046C90();
      uint64_t v20 = sub_100046BB0();
      swift_bridgeObjectRelease();
      for (v32[0] = v20; v20 != sub_100046C30(); uint64_t v20 = v32[0])
      {
        BOOL v26 = sub_100046C00();
        sub_100046BE0();
        if (v26)
        {
          uint64_t v27 = v19[v20 + 4];
        }
        else
        {
          uint64_t v27 = sub_100046DD0();
          swift_unknownObjectRelease();
        }
        swift_bridgeObjectRetain();
        sub_100046C40(v32);
        swift_bridgeObjectRelease();
        sub_100004938((uint64_t)v9, 1, 1, v4);
        sub_1000344F0((uint64_t)v9, v27, v5);
      }
      swift_bridgeObjectRelease();
      break;
    case 3:
      uint64_t v21 = v33;
      Swift::Int v22 = v34[0];
      [v21 requestDemand:v22];
      uint64_t v24 = v23;
      goto LABEL_10;
    case 4:
      uint64_t v21 = v33;
      [v21 cancel];
      uint64_t v24 = v25;
LABEL_10:

      break;
    default:
      uint64_t v16 = (uint64_t)v33;
      sub_100034710((uint64_t)v34, (uint64_t)v32);
      sub_100034778((uint64_t)v32, (uint64_t)&v29);
      if (v30)
      {
        sub_100034840(&v29, v31);
        sub_100034850((uint64_t)v31, (uint64_t)&v29);
        if (swift_dynamicCast())
        {
          sub_100004938((uint64_t)v12, 0, 1, v4);
          (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, v4);
          (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v15, v4);
          sub_100004938((uint64_t)v9, 0, 1, v4);
          sub_10000488C(&qword_10005A428);
          sub_1000344F0((uint64_t)v9, v16, v5);
          (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v4);
        }
        else
        {
          sub_100004938((uint64_t)v12, 1, 1, v4);
          (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
          sub_1000348AC();
          *(void *)&long long v29 = swift_allocError();
          uint64_t v28 = sub_10000488C(&qword_10005A428);
          sub_100034568((uint64_t)&v29, v16, v5, v28);
        }
        sub_1000348F8((uint64_t)v31);
      }
      else
      {
        sub_1000347E0((uint64_t)&v29);
        sub_100004938((uint64_t)v9, 1, 1, v4);
        sub_10000488C(&qword_10005A428);
        sub_1000344F0((uint64_t)v9, v16, v5);
      }
      sub_1000347E0((uint64_t)v32);
      break;
  }
}

uint64_t sub_100032E6C(void *a1)
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_100046DA0();
  swift_unknownObjectRelease();
  uint64_t v3 = sub_100032570((uint64_t)v5);

  sub_1000348F8((uint64_t)v5);
  return v3;
}

uint64_t sub_100032ED8(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)v1 + qword_10005A240);
  v7[2] = *(void *)((swift_isaMask & *v1) + 0x50);
  v7[3] = a1;
  uint64_t v3 = type metadata accessor for EventStateMachine();
  uint64_t v4 = type metadata accessor for PostOpCommand();
  uint64_t v5 = sub_100046D60();
  sub_1000345FC((void (*)(uint64_t))sub_10003498C, (uint64_t)v7, v2, v3, v5);
  if (v8[40] != 255)
  {
    sub_100032914(v4);
    uint64_t v5 = v4;
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)(v5 - 8) + 8))(v8, v5);
}

id sub_100032FE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 32))
  {
    *(void *)a2 = a1;
    *(unsigned char *)(a2 + 40) = 4;
    return a1;
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 16);
    uint64_t v5 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = a1;
    *(void *)(v2 + 24) = v6;
    *(unsigned char *)(v2 + 32) = 1;
    sub_100034148(v6, v5, 0);
    sub_100034148(v6, v5, 0);
    id v7 = a1;
    sub_1000341CC(v6, v5, 0);
    sub_100046D60();
    sub_100004BC8(&qword_10005A428);
    sub_100046C90();
    sub_100046C50();
    swift_getWitnessTable();
    if (sub_100046D00())
    {
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(unsigned char *)(a2 + 40) = -1;
      return sub_1000341CC(v6, v5, 0);
    }
    else
    {
      id v8 = v7;
      uint64_t v9 = sub_100046C10();
      id result = sub_1000341CC(v6, v5, 0);
      *(void *)a2 = v8;
      *(void *)(a2 + 8) = v9;
      *(unsigned char *)(a2 + 40) = 3;
    }
  }
  return result;
}

void sub_1000331B4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100032ED8((uint64_t)v4);
}

uint64_t sub_10003321C(uint64_t a1)
{
  uint64_t v2 = *(void *)((char *)v1 + qword_10005A240);
  uint64_t v7 = *(void *)((swift_isaMask & *v1) + 0x50);
  uint64_t v8 = a1;
  uint64_t v3 = type metadata accessor for EventStateMachine();
  type metadata accessor for PostOpCommand();
  uint64_t v4 = sub_100046C50();
  sub_1000345FC((void (*)(uint64_t))sub_100034948, (uint64_t)v6, v2, v3, v4);
  uint64_t v9 = v10;
  swift_getWitnessTable();
  sub_100046B90();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100033330(void *a1)
{
  int v2 = *(unsigned __int8 *)(v1 + 32);
  if ((v2 - 2) < 2) {
    goto LABEL_17;
  }
  uint64_t v3 = v1;
  uint64_t v6 = (void *)(v1 + 16);
  id v5 = *(void **)(v1 + 16);
  if (v2 && (*(unsigned char *)(v3 + 48) & 1) != 0)
  {
    uint64_t v17 = *(void *)(v3 + 24);
    sub_100046D60();
    id v7 = v5;
    swift_bridgeObjectRetain();
    sub_100004BC8(&qword_10005A428);
    sub_100046C90();
    sub_100046C50();
    swift_getWitnessTable();
    if ((sub_100046D00() & 1) != 0 && objc_msgSend(a1, "state", v17))
    {
    }
    else
    {
      id v8 = sub_10003447C();

      *(void *)(v3 + 40) = v8;
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  id v9 = objc_msgSend(a1, "state", v17);
  if (v9)
  {
    id v9 = [a1 error];
    if (v9) {
      char v10 = 2;
    }
    else {
      char v10 = 3;
    }
  }
  else
  {
    char v10 = 3;
  }
  char v12 = *(void **)(v3 + 16);
  uint64_t v11 = *(void *)(v3 + 24);
  *(void *)(v3 + 16) = v9;
  *(void *)(v3 + 24) = 0;
  char v13 = *(unsigned char *)(v3 + 32);
  *(unsigned char *)(v3 + 32) = v10;
  sub_1000341CC(v12, v11, v13);
  sub_100046D60();
  sub_100004BC8(&qword_10005A428);
  sub_100046C90();
  sub_100046C50();
  swift_getWitnessTable();
  if (sub_100046D00())
  {
    swift_bridgeObjectRelease();
LABEL_17:
    type metadata accessor for PostOpCommand();
    return sub_100046BF0();
  }
  swift_getWitnessTable();
  sub_100046D10();
  type metadata accessor for PostOpCommand();
  uint64_t v18 = sub_100046BF0();
  if (*(unsigned char *)(v3 + 32) == 2)
  {
    char v15 = *(void **)(v3 + 16);
    uint64_t v16 = *(void *)(v3 + 24);
    *uint64_t v6 = 0;
    v6[1] = 0;
    *(unsigned char *)(v3 + 32) = 3;
    swift_errorRetain();
    sub_1000341CC(v15, v16, 2);
  }
  sub_100046C50();
  sub_100046C20();
  if (sub_100046D00())
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100046C50();
    sub_100046C20();
  }
  return v18;
}

void sub_1000336E4(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_10003321C((uint64_t)v4);
}

uint64_t sub_10003374C()
{
  if (*(unsigned __int8 *)(v0 + 32) - 2 < 2)
  {
LABEL_5:
    type metadata accessor for PostOpCommand();
    return sub_100046BF0();
  }
  int v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  if (!*(unsigned char *)(v0 + 32))
  {
    *(_OWORD *)(v0 + 16) = xmmword_100049BC0;
    *(unsigned char *)(v0 + 32) = 3;
    uint64_t v3 = (void *)swift_bridgeObjectRetain();
    sub_1000341CC(v3, v1, 0);
    sub_100046D60();
    sub_100004BC8(&qword_10005A428);
    sub_100046C90();
    sub_100046C50();
    swift_getWitnessTable();
    if ((sub_100046D00() & 1) == 0)
    {
      type metadata accessor for PostOpCommand();
      sub_100046EA0();
      swift_allocObject();
      uint64_t v4 = sub_100046BD0();
      *(void *)uint64_t v7 = v2;
      *(unsigned char *)(v7 + 40) = 2;
      sub_100046C50();
      return v4;
    }
    sub_1000341CC(v2, v1, 0);
    goto LABEL_5;
  }
  *(_OWORD *)(v0 + 16) = xmmword_100049BC0;
  *(unsigned char *)(v0 + 32) = 3;
  id v5 = v2;
  swift_bridgeObjectRetain();
  sub_1000341CC(v2, v1, 1);
  if (*(unsigned char *)(v0 + 48))
  {
    *(void *)(v0 + 40) = sub_10003447C();
    swift_unknownObjectRelease();
  }
  type metadata accessor for PostOpCommand();
  uint64_t v9 = sub_100046BF0();
  sub_100046C50();
  id v6 = v5;
  sub_100046C20();
  sub_100046D60();
  sub_100004BC8(&qword_10005A428);
  sub_100046C90();
  sub_100046C50();
  swift_getWitnessTable();
  if (sub_100046D00()) {
    swift_bridgeObjectRelease();
  }
  else {
    sub_100046C20();
  }

  return v9;
}

void sub_100033A44()
{
  uint64_t v0 = type metadata accessor for PostOpCommand();
  sub_100032914(v0);
}

void sub_100033A78(void *a1)
{
  id v1 = a1;
  sub_100031EDC();
}

uint64_t sub_100033AC0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)((char *)a2 + qword_10005A240);
  v7[2] = *(void *)((swift_isaMask & *a2) + 0x50);
  v7[3] = a1;
  uint64_t v3 = type metadata accessor for EventStateMachine();
  uint64_t v4 = type metadata accessor for PostOpCommand();
  uint64_t v5 = sub_100046D60();
  sub_1000345FC((void (*)(uint64_t))sub_100035270, (uint64_t)v7, v2, v3, v5);
  if (v8[40] != 255)
  {
    sub_100032914(v4);
    uint64_t v5 = v4;
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)(v5 - 8) + 8))(v8, v5);
}

void *sub_100033BCC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = (void *)(v2 + 16);
  id v6 = *(void **)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = *(unsigned __int8 *)(v2 + 32);
  uint64_t v9 = result;
  switch(v8)
  {
    case 1:
      uint64_t v19 = v7;
      sub_100046D60();
      id v14 = v6;
      swift_bridgeObjectRetain();
      sub_100004BC8(&qword_10005A428);
      sub_100046C90();
      sub_100046C50();
      sub_100046C20();
      char v15 = *(void **)(v3 + 16);
      uint64_t v16 = *(void *)(v3 + 24);
      *(void *)(v3 + 16) = v6;
      *(void *)(v3 + 24) = v19;
      char v17 = *(unsigned char *)(v3 + 32);
      *(unsigned char *)(v3 + 32) = 1;
      id v18 = v14;
      id result = sub_1000341CC(v15, v16, v17);
      *(void *)a2 = v18;
      *(void *)(a2 + 8) = 1;
      char v13 = 3;
      goto LABEL_6;
    case 2:
      *uint64_t v5 = 0;
      v5[1] = 0;
      *(unsigned char *)(v3 + 32) = 3;
      swift_errorRetain();
      id result = sub_1000341CC(v6, v7, 2);
      *(void *)a2 = v9;
      *(void *)(a2 + 8) = v6;
      char v13 = 1;
LABEL_6:
      *(unsigned char *)(a2 + 40) = v13;
      break;
    case 3:
      *(void *)a2 = result;
      *(_OWORD *)(a2 + 8) = 0u;
      *(_OWORD *)(a2 + 24) = 0u;
      *(unsigned char *)(a2 + 40) = 0;
      break;
    default:
      sub_100046D60();
      swift_bridgeObjectRetain();
      sub_100004BC8(&qword_10005A428);
      sub_100046C90();
      sub_100046C50();
      sub_100046C20();
      char v10 = *(void **)(v3 + 16);
      uint64_t v11 = *(void *)(v3 + 24);
      *(void *)(v3 + 16) = v6;
      *(void *)(v3 + 24) = 0;
      char v12 = *(unsigned char *)(v3 + 32);
      *(unsigned char *)(v3 + 32) = 0;
      id result = sub_1000341CC(v10, v11, v12);
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(unsigned char *)(a2 + 40) = -1;
      break;
  }
  return result;
}

uint64_t sub_100033DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v6 = sub_100046C60();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  return _swift_task_switch(sub_100033E84, v6, v8);
}

uint64_t sub_100033E84()
{
  sub_100035308();
  id v1 = (void (*)(uint64_t))v0[11];
  uint64_t v2 = v0[10];
  v0[2] = v0;
  v0[7] = v2;
  v0[3] = sub_100033F28;
  uint64_t v3 = swift_continuation_init();
  v1(v3);
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100033F28()
{
  sub_100035308();
  sub_1000352B4();
  uint64_t v1 = *v0;
  sub_1000352DC();
  *uint64_t v2 = v1;
  if (*(void *)(v3 + 48)) {
    swift_willThrow();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v1 + 8);
  return v4();
}

void sub_100034004()
{
}

void sub_100034034()
{
}

uint64_t type metadata accessor for AsyncEventConnector()
{
  return sub_1000349DC();
}

uint64_t sub_100034070()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000340C8()
{
  sub_1000341CC(*(void **)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_1000340F4()
{
  uint64_t v0 = sub_1000340C8();

  return _swift_deallocClassInstance(v0, 49, 7);
}

uint64_t type metadata accessor for EventStateMachine()
{
  return sub_1000349DC();
}

uint64_t sub_10003413C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

void *sub_100034148(void *result, uint64_t a2, char a3)
{
  if (a3 == 2)
  {
    return (void *)swift_errorRetain();
  }
  else
  {
    if (a3 == 1)
    {
      id v4 = result;
    }
    else
    {
      if (a3) {
        return result;
      }
    }
    return (void *)swift_bridgeObjectRetain();
  }
}

void *sub_1000341BC(uint64_t a1)
{
  return sub_1000341CC(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

void *sub_1000341CC(void *result, uint64_t a2, char a3)
{
  if (a3 == 2)
  {
    return (void *)swift_errorRelease();
  }
  else
  {
    if (a3 == 1)
    {
    }
    else
    {
      if (a3) {
        return result;
      }
    }
    return (void *)swift_bridgeObjectRelease();
  }
}

uint64_t sub_100034240(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100034148(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_10003428C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100034148(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000341CC(v6, v7, v8);
  return a1;
}

__n128 sub_1000342E4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_1000342F8(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000341CC(v4, v5, v6);
  return a1;
}

uint64_t sub_100034340(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100034380(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
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

uint64_t sub_1000343C4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1000343DC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t type metadata accessor for EventStateMachine.State()
{
  return sub_1000349DC();
}

uint64_t sub_10003440C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10003374C();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for PostOpCommand()
{
  return sub_1000349DC();
}

void sub_100034460()
{
}

id sub_10003447C()
{
  uint64_t v1 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v1) {
    id v2 = [v1 newBookmark];
  }
  else {
    id v2 = 0;
  }
  return v2;
}

uint64_t sub_1000344F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void, uint64_t))(*(void *)(a3 - 8) + 32))(*(void *)(*(void *)(a2 + 64) + 40), a1);

  return swift_continuation_throwingResume();
}

uint64_t sub_100034568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(v8, a1, a4);

  return _swift_continuation_throwingResumeWithError(a2, v7);
}

void sub_1000345FC(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100034688(a3 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_100034688(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7) {
    *a7 = v7;
  }
}

uint64_t sub_100034710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000488C(&qword_10005A430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000488C(&qword_10005A430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000347E0(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_10005A430);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_100034840(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100034850(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1000348AC()
{
  unint64_t result = qword_10005A438;
  if (!qword_10005A438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A438);
  }
  return result;
}

uint64_t sub_1000348F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100034948@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100033330(*(void **)(v1 + 24));
  *a1 = result;
  return result;
}

id sub_10003498C()
{
  uint64_t v0 = (void *)sub_1000352F4();
  return sub_100032FE4(v0, v1);
}

void *sub_1000349B4()
{
  uint64_t v0 = (void *)sub_1000352F4();
  return sub_100032688(v0, v1);
}

uint64_t sub_1000349DC()
{
  return swift_getGenericMetadata();
}

uint64_t getEnumTagSinglePayload for AsyncBPSPublisherError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AsyncBPSPublisherError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100034B00);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100034B28()
{
  return 0;
}

ValueMetadata *type metadata accessor for AsyncBPSPublisherError()
{
  return &type metadata for AsyncBPSPublisherError;
}

uint64_t sub_100034B40(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void sub_100034B74(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 5) {
    unsigned int v1 = *(_DWORD *)a1 + 5;
  }
  switch(v1)
  {
    case 1u:
      swift_errorRelease();
      break;
    case 2u:
      swift_bridgeObjectRelease();
      break;
    case 3u:
    case 4u:

      break;
    default:
      if (*(void *)(a1 + 32)) {
        sub_1000348F8(a1 + 8);
      }
      break;
  }
}

uint64_t sub_100034BEC(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 5) {
    unsigned int v3 = *(_DWORD *)a2 + 5;
  }
  switch(v3)
  {
    case 1u:
      uint64_t v6 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      swift_errorRetain();
      *(void *)(a1 + 8) = v6;
      *(unsigned char *)(a1 + 40) = 1;
      break;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 2;
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v7 = *(void **)a2;
      uint64_t v8 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v8;
      char v9 = 3;
      goto LABEL_10;
    case 4u:
      uint64_t v7 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      char v9 = 4;
LABEL_10:
      *(unsigned char *)(a1 + 40) = v9;
      id v10 = v7;
      break;
    default:
      *(void *)a1 = *(void *)a2;
      unsigned int v4 = (_OWORD *)(a1 + 8);
      uint64_t v5 = *(void *)(a2 + 32);
      if (v5)
      {
        *(void *)(a1 + 32) = v5;
        (**(void (***)(_OWORD *, uint64_t))(v5 - 8))(v4, a2 + 8);
      }
      else
      {
        long long v11 = *(_OWORD *)(a2 + 24);
        _OWORD *v4 = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a1 + 24) = v11;
      }
      *(unsigned char *)(a1 + 40) = 0;
      break;
  }
  return a1;
}

uint64_t sub_100034D14(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 5) {
      unsigned int v4 = *(_DWORD *)a1 + 5;
    }
    switch(v4)
    {
      case 1u:
        swift_errorRelease();
        break;
      case 2u:
        swift_bridgeObjectRelease();
        break;
      case 3u:
      case 4u:

        break;
      default:
        if (*(void *)(a1 + 32)) {
          sub_1000348F8(a1 + 8);
        }
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 5) {
      unsigned int v5 = *(_DWORD *)a2 + 5;
    }
    switch(v5)
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        uint64_t v9 = *(void *)(a2 + 8);
        swift_errorRetain();
        *(void *)(a1 + 8) = v9;
        *(unsigned char *)(a1 + 40) = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(unsigned char *)(a1 + 40) = 2;
        swift_bridgeObjectRetain();
        break;
      case 3u:
        id v10 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        *(void *)(a1 + 8) = *(void *)(a2 + 8);
        char v11 = 3;
        goto LABEL_19;
      case 4u:
        id v10 = *(void **)a2;
        *(void *)a1 = *(void *)a2;
        char v11 = 4;
LABEL_19:
        *(unsigned char *)(a1 + 40) = v11;
        id v12 = v10;
        break;
      default:
        *(void *)a1 = *(void *)a2;
        uint64_t v6 = (_OWORD *)(a1 + 8);
        uint64_t v7 = (_OWORD *)(a2 + 8);
        uint64_t v8 = *(void *)(a2 + 32);
        if (v8)
        {
          *(void *)(a1 + 32) = v8;
          (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
        }
        else
        {
          long long v13 = *(_OWORD *)(a2 + 24);
          *uint64_t v6 = *v7;
          *(_OWORD *)(a1 + 24) = v13;
        }
        *(unsigned char *)(a1 + 40) = 0;
        break;
    }
  }
  return a1;
}

__n128 sub_100034ED0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100034EE4(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 5) {
      unsigned int v4 = *(_DWORD *)a1 + 5;
    }
    switch(v4)
    {
      case 1u:
        swift_errorRelease();
        break;
      case 2u:
        swift_bridgeObjectRelease();
        break;
      case 3u:
      case 4u:

        break;
      default:
        if (*(void *)(a1 + 32)) {
          sub_1000348F8(a1 + 8);
        }
        break;
    }
    unsigned int v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 5) {
      unsigned int v5 = *(_DWORD *)a2 + 5;
    }
    switch(v5)
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v6 = 2;
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v6 = 3;
        break;
      case 4u:
        *(void *)a1 = *(void *)a2;
        char v6 = 4;
        break;
      default:
        char v6 = 0;
        long long v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(void *)(a1 + 32) = *(void *)(a2 + 32);
        break;
    }
    *(unsigned char *)(a1 + 40) = v6;
  }
  return a1;
}

uint64_t sub_100035038(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 5) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_100035074(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000350C0(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 5) {
    return (*(_DWORD *)a1 + 5);
  }
  return result;
}

uint64_t sub_1000350DC(uint64_t result, unsigned int a2)
{
  if (a2 > 4)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 5;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 40) = a2;
  return result;
}

uint64_t sub_100035104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t type metadata accessor for AsyncBPSPublisher()
{
  return sub_1000349DC();
}

void *sub_100035124()
{
  return &protocol self-conformance witness table for Error;
}

uint64_t sub_100035130()
{
  return swift_getWitnessTable();
}

unint64_t sub_100035150()
{
  unint64_t result = qword_10005A5B0;
  if (!qword_10005A5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A5B0);
  }
  return result;
}

uint64_t sub_10003519C()
{
  sub_100035308();
  uint64_t v2 = v1;
  unsigned int v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v3;
  void *v3 = v0;
  v3[1] = sub_100031B70;
  return sub_100031AD4(v2);
}

uint64_t sub_100035244()
{
  return sub_100031EDC();
}

uint64_t sub_100035268(uint64_t a1)
{
  return sub_100033AC0(a1, *(void **)(v1 + 16));
}

void *sub_100035270()
{
  uint64_t v0 = (void *)sub_1000352F4();
  return sub_100033BCC(v0, v1);
}

void sub_10003529C()
{
}

uint64_t sub_1000352E8()
{
  return v0 + 8;
}

uint64_t sub_1000352F4()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_100035320@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  if (a3 <= 0.0 || a2 + a3 <= 0.0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    sub_100046710();
    uint64_t v4 = 0;
  }
  uint64_t v5 = sub_100046780();

  return sub_100004938(a1, v4, 1, v5);
}

uint64_t sub_100035390(unint64_t a1, unint64_t a2, double a3, double a4)
{
  BOOL v4 = a1 < a2;
  if (a3 != a4) {
    BOOL v4 = 0;
  }
  return a3 < a4 || v4;
}

BOOL sub_1000353AC(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return a3 == a4 && a1 == a2;
}

uint64_t sub_1000353BC(uint64_t a1, uint64_t a2)
{
  return sub_100035390(*(void *)(a1 + 8), *(void *)(a2 + 8), *(double *)a1, *(double *)a2);
}

BOOL sub_1000353D0(uint64_t a1, uint64_t a2)
{
  return sub_1000353E4(*(void *)(a1 + 8), *(void *)(a2 + 8), *(double *)a1, *(double *)a2);
}

BOOL sub_1000353E4(unint64_t a1, unint64_t a2, double a3, double a4)
{
  BOOL v4 = a4 != a3 || a2 >= a1;
  return a4 >= a3 && v4;
}

BOOL sub_100035400(uint64_t a1, uint64_t a2)
{
  return sub_100035414(*(void *)(a1 + 8), *(void *)(a2 + 8), *(double *)a1, *(double *)a2);
}

BOOL sub_100035414(unint64_t a1, unint64_t a2, double a3, double a4)
{
  BOOL v4 = a3 != a4 || a1 >= a2;
  return a3 >= a4 && v4;
}

uint64_t sub_100035430(uint64_t a1, uint64_t a2)
{
  return sub_100035444(*(void *)(a1 + 8), *(void *)(a2 + 8), *(double *)a1, *(double *)a2);
}

uint64_t sub_100035444(unint64_t a1, unint64_t a2, double a3, double a4)
{
  BOOL v4 = a2 < a1;
  if (a4 != a3) {
    BOOL v4 = 0;
  }
  return a4 < a3 || v4;
}

BOOL sub_100035460(uint64_t a1, uint64_t a2)
{
  return sub_1000353AC(*(void *)(a1 + 8), *(void *)(a2 + 8), *(double *)a1, *(double *)a2);
}

uint64_t sub_100035474(uint64_t a1)
{
  uint64_t v2 = sub_100046780();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_100046DB0(28);
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "BM{timestamp: ");
  HIBYTE(v8[1]) = -18;
  sub_100046710();
  sub_100035674();
  v9._countAndFlagsBits = sub_100046E90();
  sub_100046B70(v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10._countAndFlagsBits = 0x3A7865646E69202CLL;
  v10._object = (void *)0xE900000000000020;
  sub_100046B70(v10);
  v7[1] = a1;
  v11._countAndFlagsBits = sub_100046E90();
  sub_100046B70(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 125;
  v12._object = (void *)0xE100000000000000;
  sub_100046B70(v12);
  return v8[0];
}

uint64_t sub_100035618()
{
  return sub_100035474(*(void *)(v0 + 8));
}

unint64_t sub_100035628()
{
  unint64_t result = qword_10005A610;
  if (!qword_10005A610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A610);
  }
  return result;
}

unint64_t sub_100035674()
{
  unint64_t result = qword_10005A618;
  if (!qword_10005A618)
  {
    sub_100046780();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A618);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for SBABookmark(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SBABookmark(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SBABookmark(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SBABookmark()
{
  return &type metadata for SBABookmark;
}

uint64_t sub_100035728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, sub_1000390AC);
}

uint64_t sub_100035740(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_1000390AC);
}

Swift::Int sub_100035758()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038DE4);
}

Swift::Int sub_100035794(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_100046F30();
  a3(v4);
  sub_100039118();
  return sub_100046F50();
}

uint64_t sub_1000357EC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000195C4();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100035838(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038DE4);
}

Swift::Int sub_100035874(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_100046F30();
  a4(v5);
  sub_100039118();
  return sub_100046F50();
}

BOOL sub_1000358C8(uint64_t a1)
{
  uint64_t v1 = sub_1000390D4(a1);
  return sub_100030BEC(v1, v2, v3);
}

void sub_1000358D8()
{
  qword_100061D50 = (uint64_t)&off_100054F10;
}

uint64_t *sub_1000358EC()
{
  if (qword_100058BF0 != -1) {
    swift_once();
  }
  return &qword_100061D50;
}

uint64_t sub_100035938@<X0>(void *a1@<X8>)
{
  sub_1000358EC();
  *a1 = qword_100061D50;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100035978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, sub_1000390B4);
}

uint64_t sub_100035990(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_1000390B4);
}

Swift::Int sub_1000359A8()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038F24);
}

uint64_t sub_1000359E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019480();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100035A30(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038F24);
}

void sub_100035A6C()
{
  qword_100061D58 = (uint64_t)&off_100054F70;
}

uint64_t *sub_100035A80()
{
  if (qword_100058BF8 != -1) {
    swift_once();
  }
  return &qword_100061D58;
}

uint64_t sub_100035ACC@<X0>(void *a1@<X8>)
{
  sub_100035A80();
  *a1 = qword_100061D58;

  return swift_bridgeObjectRetain();
}

void sub_100035B0C()
{
}

void sub_100035B18(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_100035B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, (uint64_t (*)(void))sub_100035B0C);
}

uint64_t sub_100035B40()
{
  return nullsub_1(*(void *)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_100035B4C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_100035B0C);
}

uint64_t sub_100035B64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*(void *)v1, *(unsigned __int8 *)(v1 + 8));
  *a1 = result;
  return result;
}

Swift::Int sub_100035B94()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038FC4);
}

uint64_t sub_100035BD0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019434();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100035C1C(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038FC4);
}

BOOL sub_100035C58(uint64_t a1)
{
  uint64_t v1 = sub_1000390D4(a1);
  return sub_100018BAC(v1, v2, v3);
}

void sub_100035C68()
{
  qword_100061D60 = (uint64_t)&off_100054FC0;
}

uint64_t *sub_100035C7C()
{
  if (qword_100058C00 != -1) {
    swift_once();
  }
  return &qword_100061D60;
}

uint64_t sub_100035CC8@<X0>(void *a1@<X8>)
{
  sub_100035C7C();
  *a1 = qword_100061D60;

  return swift_bridgeObjectRetain();
}

void sub_100035D08()
{
}

uint64_t sub_100035D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, (uint64_t (*)(void))sub_100035D08);
}

uint64_t sub_100035D2C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_100035D08);
}

Swift::Int sub_100035D44()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038D44);
}

uint64_t sub_100035D80(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019610();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100035DCC(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038D44);
}

void sub_100035E08()
{
  qword_100061D68 = (uint64_t)&off_100055030;
}

uint64_t *sub_100035E1C()
{
  if (qword_100058C08 != -1) {
    swift_once();
  }
  return &qword_100061D68;
}

uint64_t sub_100035E68@<X0>(void *a1@<X8>)
{
  sub_100035E1C();
  *a1 = qword_100061D68;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100035EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, (uint64_t (*)(void))sub_1000390B0);
}

uint64_t sub_100035EC0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_1000390B0);
}

Swift::Int sub_100035ED8()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038E84);
}

uint64_t sub_100035F14(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019578();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100035F60(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038E84);
}

void sub_100035F9C()
{
  qword_100061D70 = (uint64_t)&off_100055090;
}

uint64_t *sub_100035FB0()
{
  if (qword_100058C10 != -1) {
    swift_once();
  }
  return &qword_100061D70;
}

uint64_t sub_100035FFC@<X0>(void *a1@<X8>)
{
  sub_100035FB0();
  *a1 = qword_100061D70;

  return swift_bridgeObjectRetain();
}

void sub_10003603C()
{
}

uint64_t sub_100036048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100036788(a1, a2, a3, (uint64_t (*)(void))sub_10003603C);
}

uint64_t sub_100036060(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000367B4(a1, a2, a3, (uint64_t (*)(void))sub_10003603C);
}

Swift::Int sub_100036078()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038AC4);
}

uint64_t sub_1000360B4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100019740();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100036100(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038AC4);
}

void sub_10003613C()
{
  qword_100061D78 = (uint64_t)&off_100055100;
}

uint64_t *sub_100036150()
{
  if (qword_100058C18 != -1) {
    swift_once();
  }
  return &qword_100061D78;
}

uint64_t sub_10003619C@<X0>(void *a1@<X8>)
{
  sub_100036150();
  *a1 = qword_100061D78;

  return swift_bridgeObjectRetain();
}

Swift::Int sub_1000361DC()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038CA4);
}

uint64_t sub_100036218(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001965C();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100036264(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038CA4);
}

void sub_1000362A0()
{
  qword_100061D80 = (uint64_t)&off_100055150;
}

uint64_t *sub_1000362B4()
{
  if (qword_100058C20 != -1) {
    swift_once();
  }
  return &qword_100061D80;
}

uint64_t sub_100036300@<X0>(void *a1@<X8>)
{
  sub_1000362B4();
  *a1 = qword_100061D80;

  return swift_bridgeObjectRetain();
}

Swift::Int sub_100036340()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038C04);
}

uint64_t sub_10003637C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000196A8();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000363C8(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038C04);
}

void sub_100036404()
{
  qword_100061D88 = (uint64_t)&off_1000551B0;
}

uint64_t *sub_100036418()
{
  if (qword_100058C28 != -1) {
    swift_once();
  }
  return &qword_100061D88;
}

uint64_t sub_100036464@<X0>(void *a1@<X8>)
{
  sub_100036418();
  *a1 = qword_100061D88;

  return swift_bridgeObjectRetain();
}

Swift::Int sub_1000364A4()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038B64);
}

uint64_t sub_1000364E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000196F4();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10003652C(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038B64);
}

void sub_100036568()
{
  qword_100061D90 = (uint64_t)&off_100055200;
}

uint64_t *sub_10003657C()
{
  if (qword_100058C30 != -1) {
    swift_once();
  }
  return &qword_100061D90;
}

uint64_t sub_1000365C8@<X0>(void *a1@<X8>)
{
  sub_10003657C();
  *a1 = qword_100061D90;

  return swift_bridgeObjectRetain();
}

Swift::Int sub_100036608()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1000386B4);
}

uint64_t sub_100036644(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100039060();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100036690(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1000386B4);
}

BOOL sub_1000366CC(uint64_t a1, uint64_t *a2)
{
  return sub_100030BEC(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_1000366E8()
{
  qword_100061D98 = (uint64_t)&off_100055270;
}

uint64_t *sub_1000366FC()
{
  if (qword_100058C38 != -1) {
    swift_once();
  }
  return &qword_100061D98;
}

uint64_t sub_100036748@<X0>(void *a1@<X8>)
{
  sub_1000366FC();
  *a1 = qword_100061D98;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100036788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  return sub_100039104(v4, v5);
}

uint64_t sub_1000367B4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4(*a1);
  return sub_100039104(v4, v5);
}

Swift::Int sub_1000367E4()
{
  return sub_100035794(*(void *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_100038A24);
}

uint64_t sub_100036820(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10001978C();

  return Enum.hash(into:)(a1, a2, v4);
}

Swift::Int sub_10003686C(uint64_t a1)
{
  return sub_100035874(a1, *(void *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_100038A24);
}

void sub_1000368A8()
{
  qword_100061DA0 = (uint64_t)&off_1000552C0;
}

uint64_t *sub_1000368BC()
{
  if (qword_100058C40 != -1) {
    swift_once();
  }
  return &qword_100061DA0;
}

uint64_t sub_100036908@<X0>(void *a1@<X8>)
{
  sub_1000368BC();
  *a1 = qword_100061DA0;

  return swift_bridgeObjectRetain();
}

uint64_t sub_100036948()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061DA8);
  sub_100004C10(v0, (uint64_t)qword_100061DA8);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478E0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "TREATMENT_ALLOCATION_STATUS_UNKNOWN";
  *(void *)(v6 + 8) = 35;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "TREATMENT_ALLOCATION_STATUS_ALLOCATED";
  *(void *)(v10 + 8) = 37;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "TREATMENT_ALLOCATION_STATUS_ACTIVATED";
  *((void *)v12 + 1) = 37;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "TREATMENT_ALLOCATION_STATUS_DEACTIVATED";
  *((void *)v14 + 1) = 39;
  v14[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100036B74@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C48, (uint64_t)qword_100061DA8, a1);
}

uint64_t sub_100036B98()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061DC0);
  sub_100004C10(v0, (uint64_t)qword_100061DC0);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "SEARCH_BAR_POSITION_UNKNOWN";
  *(void *)(v6 + 8) = 27;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "SEARCH_BAR_POSITION_TOP";
  *((void *)v10 + 1) = 23;
  v10[16] = 2;
  v9();
  Swift::String v11 = (void *)((char *)v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "SEARCH_BAR_POSITION_BOTTOM";
  *((void *)v12 + 1) = 26;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100036D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C50, (uint64_t)qword_100061DC0, a1);
}

uint64_t sub_100036DB0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4 = sub_1000169CC(a1, a2);
  uint64_t v5 = sub_100046A90();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a3, v4, v5);
}

uint64_t sub_100036E2C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061DD8);
  sub_100004C10(v0, (uint64_t)qword_100061DD8);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "BUILD_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 18;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "BUILD_TYPE_DEV";
  *(void *)(v10 + 8) = 14;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "BUILD_TYPE_CARRY";
  *((void *)v12 + 1) = 16;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "BUILD_TYPE_SEED";
  *((void *)v14 + 1) = 15;
  v14[16] = 2;
  v9();
  char v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *char v15 = 4;
  *(void *)uint64_t v16 = "BUILD_TYPE_PROD";
  *((void *)v16 + 1) = 15;
  v16[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100037098@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C58, (uint64_t)qword_100061DD8, a1);
}

uint64_t sub_1000370BC()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061DF0);
  sub_100004C10(v0, (uint64_t)qword_100061DF0);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478E0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "HIDE_REASON_UNKNOWN";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "HIDE_REASON_USER_DISMISS";
  *(void *)(v10 + 8) = 24;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "HIDE_REASON_USER_INTERACTION_WITH_SBA";
  *((void *)v12 + 1) = 37;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "HIDE_REASON_USER_INTERACTION_WITH_OTHER_BUTTONS";
  *((void *)v14 + 1) = 47;
  v14[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000372EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C60, (uint64_t)qword_100061DF0, a1);
}

uint64_t sub_100037310()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E08);
  sub_100004C10(v0, (uint64_t)qword_100061E08);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "USER_INTERACTION_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 29;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "USER_INTERACTION_TYPE_TAP";
  *(void *)(v10 + 8) = 25;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "USER_INTERACTION_TYPE_CLICK";
  *((void *)v12 + 1) = 27;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "USER_INTERACTION_TYPE_LONGPRESS";
  *((void *)v14 + 1) = 31;
  v14[16] = 2;
  v9();
  char v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *char v15 = 4;
  *(void *)uint64_t v16 = "USER_INTERACTION_TYPE_SCROLL";
  *((void *)v16 + 1) = 28;
  v16[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100037580@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C68, (uint64_t)qword_100061E08, a1);
}

uint64_t sub_1000375A4()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E20);
  sub_100004C10(v0, (uint64_t)qword_100061E20);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "REQUEST_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 20;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "REQUEST_TYPE_BROWSING_ASSISTANT_ELIGIBILITY";
  *((void *)v10 + 1) = 43;
  v10[16] = 2;
  v9();
  Swift::String v11 = (void *)((char *)v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "REQUEST_TYPE_CONTENT";
  *((void *)v12 + 1) = 20;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100037798@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C70, (uint64_t)qword_100061E20, a1);
}

uint64_t sub_1000377BC()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E38);
  sub_100004C10(v0, (uint64_t)qword_100061E38);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478E0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "COMPONENT_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 22;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "COMPONENT_TYPE_HINT";
  *(void *)(v10 + 8) = 19;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "COMPONENT_TYPE_CARD";
  *((void *)v12 + 1) = 19;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "COMPONENT_TYPE_READER_VIEW_SECTION";
  *((void *)v14 + 1) = 34;
  v14[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000379E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C78, (uint64_t)qword_100061E38, a1);
}

uint64_t sub_100037A0C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E50);
  sub_100004C10(v0, (uint64_t)qword_100061E50);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "CARD_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 17;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "CARD_TYPE_SUMMARY";
  *((void *)v10 + 1) = 17;
  v10[16] = 2;
  v9();
  Swift::String v11 = (void *)((char *)v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "CARD_TYPE_ENTITY";
  *((void *)v12 + 1) = 16;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100037C00@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C80, (uint64_t)qword_100061E50, a1);
}

uint64_t sub_100037C24()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E68);
  sub_100004C10(v0, (uint64_t)qword_100061E68);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000478D0;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 0;
  *(void *)unint64_t v6 = "ENTITY_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 19;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 1;
  *(void *)unint64_t v10 = "ENTITY_TYPE_PEOPLE";
  *(void *)(v10 + 8) = 18;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  Swift::String v11 = (void *)(v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "ENTITY_TYPE_POI";
  *((void *)v12 + 1) = 15;
  unsigned char v12[16] = 2;
  v9();
  long long v13 = (void *)(v5 + 3 * v2);
  id v14 = (char *)v13 + v1[14];
  *long long v13 = 3;
  *(void *)id v14 = "ENTITY_TYPE_MOVIE_TV";
  *((void *)v14 + 1) = 20;
  v14[16] = 2;
  v9();
  char v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *char v15 = 4;
  *(void *)uint64_t v16 = "ENTITY_TYPE_MUSIC";
  *((void *)v16 + 1) = 17;
  v16[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_100037E94@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C88, (uint64_t)qword_100061E68, a1);
}

uint64_t sub_100037EB8()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E80);
  sub_100004C10(v0, (uint64_t)qword_100061E80);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "READER_VIEW_SECTION_TYPE_UNKNOWN";
  *(void *)(v6 + 8) = 32;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "READER_VIEW_SECTION_TYPE_SUMMARY";
  *((void *)v10 + 1) = 32;
  v10[16] = 2;
  v9();
  Swift::String v11 = (void *)((char *)v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "READER_VIEW_SECTION_TYPE_TABLE_OF_CONTENTS";
  *((void *)v12 + 1) = 42;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000380AC@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C90, (uint64_t)qword_100061E80, a1);
}

uint64_t sub_1000380D0()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061E98);
  sub_100004C10(v0, (uint64_t)qword_100061E98);
  sub_10000488C(&qword_100059270);
  uint64_t v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100047900;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *unint64_t v5 = 0;
  *(void *)unint64_t v6 = "HIDE_SHOW_BUTTON_UNKNOWN";
  *(void *)(v6 + 8) = 24;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v8 = sub_100046A70();
  Swift::String v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)unint64_t v10 = "HIDE_SHOW_BUTTON_HIDE";
  *((void *)v10 + 1) = 21;
  v10[16] = 2;
  v9();
  Swift::String v11 = (void *)((char *)v5 + 2 * v2);
  Swift::String v12 = (char *)v11 + v1[14];
  *Swift::String v11 = 2;
  *(void *)Swift::String v12 = "HIDE_SHOW_BUTTON_SHOW";
  *((void *)v12 + 1) = 21;
  unsigned char v12[16] = 2;
  v9();
  return sub_100046A80();
}

uint64_t sub_1000382C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100036DB0(&qword_100058C98, (uint64_t)qword_100061E98, a1);
}

uint64_t sub_1000382E4()
{
  return sub_10003849C(&qword_10005A620, &qword_10005A628);
}

uint64_t sub_10003830C()
{
  return sub_10003849C(&qword_10005A630, &qword_10005A638);
}

uint64_t sub_100038334()
{
  return sub_10003849C(&qword_10005A640, &qword_10005A648);
}

uint64_t sub_10003835C()
{
  return sub_10003849C(&qword_10005A650, &qword_10005A658);
}

uint64_t sub_100038384()
{
  return sub_10003849C(&qword_10005A660, &qword_10005A668);
}

uint64_t sub_1000383AC()
{
  return sub_10003849C(&qword_10005A670, &qword_10005A678);
}

uint64_t sub_1000383D4()
{
  return sub_10003849C(&qword_10005A680, &qword_10005A688);
}

uint64_t sub_1000383FC()
{
  return sub_10003849C(&qword_10005A690, &qword_10005A698);
}

uint64_t sub_100038424()
{
  return sub_10003849C(&qword_10005A6A0, &qword_10005A6A8);
}

uint64_t sub_10003844C()
{
  return sub_10003849C(&qword_10005A6B0, &qword_10005A6B8);
}

uint64_t sub_100038474()
{
  return sub_10003849C(&qword_10005A6C0, &qword_10005A6C8);
}

uint64_t sub_10003849C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004BC8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000384EC(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_TreatmentAllocationStatus()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SearchBarPosition()
{
}

uint64_t sub_100038518(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100038538(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_100038568(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100038584(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  *(unsigned char *)(result + 8) = v2;
  return result;
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BuildType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_HideReason()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_RequestType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ComponentType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_CardType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_EntityType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ReaderViewSectionType()
{
}

void type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_HideShowButton()
{
}

unint64_t sub_100038614()
{
  unint64_t result = qword_10005A6D0;
  if (!qword_10005A6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6D0);
  }
  return result;
}

unint64_t sub_100038664()
{
  unint64_t result = qword_10005A6D8;
  if (!qword_10005A6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6D8);
  }
  return result;
}

unint64_t sub_1000386B4()
{
  unint64_t result = qword_10005A6E0;
  if (!qword_10005A6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6E0);
  }
  return result;
}

unint64_t sub_100038704()
{
  unint64_t result = qword_10005A6E8;
  if (!qword_10005A6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6E8);
  }
  return result;
}

unint64_t sub_100038754()
{
  unint64_t result = qword_10005A6F0;
  if (!qword_10005A6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6F0);
  }
  return result;
}

unint64_t sub_1000387A4()
{
  unint64_t result = qword_10005A6F8;
  if (!qword_10005A6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A6F8);
  }
  return result;
}

unint64_t sub_1000387F4()
{
  unint64_t result = qword_10005A700;
  if (!qword_10005A700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A700);
  }
  return result;
}

unint64_t sub_100038844()
{
  unint64_t result = qword_10005A708;
  if (!qword_10005A708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A708);
  }
  return result;
}

unint64_t sub_100038894()
{
  unint64_t result = qword_10005A710;
  if (!qword_10005A710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A710);
  }
  return result;
}

unint64_t sub_1000388E4()
{
  unint64_t result = qword_10005A718;
  if (!qword_10005A718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A718);
  }
  return result;
}

unint64_t sub_100038934()
{
  unint64_t result = qword_10005A720;
  if (!qword_10005A720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A720);
  }
  return result;
}

unint64_t sub_100038984()
{
  unint64_t result = qword_10005A728;
  if (!qword_10005A728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A728);
  }
  return result;
}

unint64_t sub_1000389D4()
{
  unint64_t result = qword_10005A730;
  if (!qword_10005A730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A730);
  }
  return result;
}

unint64_t sub_100038A24()
{
  unint64_t result = qword_10005A738;
  if (!qword_10005A738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A738);
  }
  return result;
}

unint64_t sub_100038A74()
{
  unint64_t result = qword_10005A740;
  if (!qword_10005A740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A740);
  }
  return result;
}

unint64_t sub_100038AC4()
{
  unint64_t result = qword_10005A748;
  if (!qword_10005A748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A748);
  }
  return result;
}

unint64_t sub_100038B14()
{
  unint64_t result = qword_10005A750;
  if (!qword_10005A750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A750);
  }
  return result;
}

unint64_t sub_100038B64()
{
  unint64_t result = qword_10005A758;
  if (!qword_10005A758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A758);
  }
  return result;
}

unint64_t sub_100038BB4()
{
  unint64_t result = qword_10005A760;
  if (!qword_10005A760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A760);
  }
  return result;
}

unint64_t sub_100038C04()
{
  unint64_t result = qword_10005A768;
  if (!qword_10005A768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A768);
  }
  return result;
}

unint64_t sub_100038C54()
{
  unint64_t result = qword_10005A770;
  if (!qword_10005A770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A770);
  }
  return result;
}

unint64_t sub_100038CA4()
{
  unint64_t result = qword_10005A778;
  if (!qword_10005A778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A778);
  }
  return result;
}

unint64_t sub_100038CF4()
{
  unint64_t result = qword_10005A780;
  if (!qword_10005A780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A780);
  }
  return result;
}

unint64_t sub_100038D44()
{
  unint64_t result = qword_10005A788;
  if (!qword_10005A788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A788);
  }
  return result;
}

unint64_t sub_100038D94()
{
  unint64_t result = qword_10005A790;
  if (!qword_10005A790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A790);
  }
  return result;
}

unint64_t sub_100038DE4()
{
  unint64_t result = qword_10005A798;
  if (!qword_10005A798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A798);
  }
  return result;
}

unint64_t sub_100038E34()
{
  unint64_t result = qword_10005A7A0;
  if (!qword_10005A7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7A0);
  }
  return result;
}

unint64_t sub_100038E84()
{
  unint64_t result = qword_10005A7A8;
  if (!qword_10005A7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7A8);
  }
  return result;
}

unint64_t sub_100038ED4()
{
  unint64_t result = qword_10005A7B0;
  if (!qword_10005A7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7B0);
  }
  return result;
}

unint64_t sub_100038F24()
{
  unint64_t result = qword_10005A7B8;
  if (!qword_10005A7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7B8);
  }
  return result;
}

unint64_t sub_100038F74()
{
  unint64_t result = qword_10005A7C0;
  if (!qword_10005A7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7C0);
  }
  return result;
}

unint64_t sub_100038FC4()
{
  unint64_t result = qword_10005A7C8;
  if (!qword_10005A7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7C8);
  }
  return result;
}

unint64_t sub_100039014()
{
  unint64_t result = qword_10005A7D0;
  if (!qword_10005A7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A7D0);
  }
  return result;
}

unint64_t sub_100039060()
{
  unint64_t result = qword_10005A7D8;
  if (!qword_10005A7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10005A7D8);
  }
  return result;
}

uint64_t sub_1000390D4(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_100039104(uint64_t result, __int16 a2)
{
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = a2;
  *(unsigned char *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

uint64_t sub_100039118()
{
  return sub_100046AF0();
}

uint64_t sub_100039138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  *(void *)(v7 + 192) = a5;
  *(void *)(v7 + 200) = v6;
  *(void *)(v7 + 176) = a3;
  *(void *)(v7 + 184) = a4;
  *(double *)(v7 + 168) = a6;
  *(void *)(v7 + 152) = a1;
  *(void *)(v7 + 160) = a2;
  uint64_t v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent();
  *(void *)(v7 + 208) = v8;
  sub_100030DA4(v8);
  *(void *)(v7 + 216) = sub_10003BBC0();
  uint64_t v9 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  *(void *)(v7 + 224) = v9;
  sub_100030DA4(v9);
  *(void *)(v7 + 232) = sub_10003BBC0();
  uint64_t v10 = sub_10000488C(&qword_100059228);
  sub_100030DA4(v10);
  *(void *)(v7 + 240) = swift_task_alloc();
  *(void *)(v7 + 248) = swift_task_alloc();
  uint64_t v11 = sub_100046890();
  sub_100030DA4(v11);
  *(void *)(v7 + 256) = sub_10003BBC0();
  uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(0);
  *(void *)(v7 + 264) = v12;
  sub_10003BAC0(v12);
  *(void *)(v7 + 272) = v13;
  *(void *)(v7 + 280) = swift_task_alloc();
  *(void *)(v7 + 288) = swift_task_alloc();
  *(void *)(v7 + 296) = swift_task_alloc();
  uint64_t v14 = sub_100046AC0();
  *(void *)(v7 + 304) = v14;
  sub_10003BAC0(v14);
  *(void *)(v7 + 312) = v15;
  *(void *)(v7 + 320) = sub_10003BBC0();
  return _swift_task_switch(sub_1000392D0, 0, 0);
}

uint64_t sub_1000392D0()
{
  uint64_t v83 = v0;
  if (qword_100058CC0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 304);
  unint64_t v5 = *(void *)(v0 + 160);
  uint64_t v6 = sub_100004C10(v4, (uint64_t)qword_100061F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v6, v4);
  sub_10003B8C8(&qword_100059208, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  memset(v81, 0, sizeof(v81));
  uint64_t v82 = 0;
  sub_1000197D8(v1, v5);
  sub_100046880();
  sub_100046990();
  uint64_t v7 = *(void *)(v0 + 296);
  uint64_t v8 = *(void *)(v0 + 248);
  uint64_t v9 = *(void *)(v0 + 224);
  sub_10003B9F8(*(void *)(v0 + 288), v7, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  sub_10003B9A8(v7, v8, &qword_100059228);
  uint64_t v10 = sub_10003BB7C();
  sub_100030D2C(v10, v11, v9);
  if (!v12)
  {
    sub_10003B9A8(*(void *)(v0 + 248), *(void *)(v0 + 240), &qword_100059228);
    sub_10003BBB4();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v24 = *(void *)(v0 + 296);
    if (!EnumCaseMultiPayload)
    {
      uint64_t v46 = *(void *)(v0 + 264);
      uint64_t v47 = *(void *)(v0 + 240);
      *(void *)(v24 + *(int *)(v46 + 20)) = sub_10003C9E4();
      sub_10003BA58(v47, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      goto LABEL_28;
    }
    uint64_t v25 = *(void *)(v0 + 224);
    sub_10003BA58(*(void *)(v0 + 240), (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
    if (sub_100004B4C(v24, 1, v25)
      || (uint64_t v26 = *(void *)(v0 + 232),
          sub_10003B910(*(void *)(v0 + 296), v26, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType), sub_10003C744((uint64_t *)(v0 + 56)), sub_10003BA58(v26, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType), sub_10000488C(&qword_10005A808), (swift_dynamicCast() & 1) == 0))
    {
      *(void *)(v0 + 48) = 0;
      *(_OWORD *)(v0 + 16) = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    else
    {
      uint64_t v27 = *(void *)(v0 + 40);
      if (v27)
      {
        uint64_t v28 = *(void *)(v0 + 48);
        sub_10003B964((void *)(v0 + 16), *(void *)(v0 + 40));
        uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
        unint64_t v31 = v30;
        sub_1000348F8(v0 + 16);
        if (!sub_10000ACF0(v29, v31))
        {
          uint64_t v32 = *(void *)(v0 + 176);
          sub_1000197D8(v29, v31);
          double v33 = COERCE_DOUBLE(sub_10003A36C(v29, v31, v32));
          char v35 = v34;
          sub_10003BAD8();
          if ((v35 & 1) == 0)
          {
            double v36 = *(double *)(v0 + 168);
            uint64_t result = sub_10003BAD8();
            double v38 = (v36 - v33) * 1000000.0;
            if (v36 - v33 > 900.0) {
              double v38 = 900000000.0;
            }
            double v39 = 0.0;
            if (v36 - v33 > 0.0) {
              double v39 = v38;
            }
            if ((~*(void *)&v39 & 0x7FF0000000000000) != 0)
            {
              if (v39 > -1.0)
              {
                if (v39 < 1.84467441e19)
                {
                  *(void *)(*(void *)(v0 + 296) + *(int *)(*(void *)(v0 + 264) + 20)) = (unint64_t)v39;
LABEL_28:
                  uint64_t v48 = *(void *)(v0 + 296);
                  uint64_t v49 = *(void *)(v0 + 272);
                  uint64_t v50 = *(uint64_t **)(v0 + 216);
                  sub_1000194CC(*(void *)(v0 + 248), &qword_100059228);
                  sub_10003A3B4(v48);
                  sub_100046860();
                  sub_10000488C(&qword_10005A7F8);
                  unint64_t v51 = (*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
                  uint64_t v52 = swift_allocObject();
                  *(_OWORD *)(v52 + 16) = xmmword_100047910;
                  sub_10003B910(v48, v52 + v51, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
                  *uint64_t v50 = v52;
                  sub_10003B8C8(&qword_10005A800, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
                  uint64_t v53 = sub_1000469A0();
                  *(void *)(v0 + 328) = v53;
                  *(void *)(v0 + 336) = v54;
                  uint64_t v55 = v53;
                  unint64_t v56 = v54;
                  if (sub_100004B4C(*(void *)(v0 + 296), 1, *(void *)(v0 + 224)))
                  {
                    unint64_t v57 = 0xE700000000000000;
                    unint64_t v58 = 0x6E776F6E6B6E75;
                  }
                  else
                  {
                    uint64_t v59 = *(void *)(v0 + 232);
                    uint64_t v60 = sub_10003BBB4();
                    sub_10003B910(v60, v61, v62);
                    unint64_t v58 = sub_10003C4EC();
                    unint64_t v57 = v63;
                    sub_10003BA58(v59, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
                  }
                  sub_1000197D8(v55, v56);
                  sub_1000197D8(v55, v56);
                  swift_bridgeObjectRetain();
                  uint64_t v64 = sub_100046AA0();
                  os_log_type_t v65 = sub_100046D30();
                  if (os_log_type_enabled(v64, v65))
                  {
                    uint64_t v78 = v58;
                    uint64_t v66 = swift_slowAlloc();
                    *(void *)&v81[0] = swift_slowAlloc();
                    *(_DWORD *)uint64_t v66 = 136446466;
                    swift_bridgeObjectRetain();
                    *(void *)(v0 + 112) = sub_1000422B4(v78, v57, (uint64_t *)v81);
                    sub_100046D80();
                    swift_bridgeObjectRelease_n();
                    *(_WORD *)(v66 + 12) = 2048;
                    uint64_t v67 = sub_100046700();
                    sub_10003BB88();
                    *(void *)(v0 + 120) = v67;
                    sub_100046D80();
                    sub_10003BB88();
                    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Attempt to send event (%{public}s) data (%ld bytes)", (uint8_t *)v66, 0x16u);
                    swift_arrayDestroy();
                    sub_10003BAF0();
                    sub_10003BAF0();
                  }
                  else
                  {
                    sub_10003BB88();

                    swift_bridgeObjectRelease_n();
                    sub_10003BB88();
                  }
                  uint64_t v80 = (uint64_t (*)(uint64_t, unint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v0 + 192) + 8) + **(int **)(*(void *)(v0 + 192) + 8));
                  uint64_t v68 = (void *)swift_task_alloc();
                  *(void *)(v0 + 344) = v68;
                  *uint64_t v68 = v0;
                  v68[1] = sub_10003A008;
                  uint64_t v69 = *(void *)(v0 + 192);
                  uint64_t v70 = *(void *)(v0 + 184);
                  return v80(v55, v56, 0xD000000000000045, 0x800000010004CB70, v70, v69);
                }
LABEL_43:
                __break(1u);
                return result;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
            goto LABEL_43;
          }
          sub_10003CF44();
          sub_1000197D8(v29, v31);
          sub_1000197D8(v29, v31);
          uint64_t v71 = sub_100046AA0();
          os_log_type_t v72 = sub_100046D40();
          if (os_log_type_enabled(v71, v72))
          {
            uint64_t v73 = (uint8_t *)swift_slowAlloc();
            *(void *)&v81[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v73 = 136446210;
            uint64_t v74 = sub_1000466D0(0);
            *(void *)(v0 + 128) = sub_1000422B4(v74, v75, (uint64_t *)v81);
            sub_100046D80();
            swift_bridgeObjectRelease();
            sub_10003BAD8();
            sub_10003BAD8();
            _os_log_impl((void *)&_mh_execute_header, v71, v72, "Start event missing for %{public}s", v73, 0xCu);
            swift_arrayDestroy();
            sub_10003BAF0();
            sub_10003BAF0();
            sub_10003BAD8();

            goto LABEL_28;
          }
          sub_10003BAD8();

          sub_10003BAD8();
        }
        sub_10003BAD8();
        goto LABEL_28;
      }
    }
    sub_1000194CC(v0 + 16, &qword_10005A7F0);
    goto LABEL_28;
  }
  sub_10003CF44();
  uint64_t v13 = sub_100046AA0();
  os_log_type_t v14 = sub_100046D40();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v16 = *(void *)(v0 + 312);
  if (v15)
  {
    uint64_t v17 = *(void *)(v0 + 296);
    uint64_t v77 = *(void *)(v0 + 304);
    uint64_t v79 = *(void *)(v0 + 320);
    uint64_t v18 = *(void *)(v0 + 280);
    os_log_type_t type = v14;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(void *)&v81[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136642819;
    swift_beginAccess();
    sub_10003B910(v17, v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    uint64_t v20 = sub_1000469C0();
    unint64_t v22 = v21;
    sub_10003BA58(v18, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
    *(void *)(v0 + 144) = sub_1000422B4(v20, v22, (uint64_t *)v81);
    sub_100046D80();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v13, type, "Unknown oneof case %{sensitive}s", v19, 0xCu);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v79, v77);
  }
  else
  {

    uint64_t v40 = sub_10003BBB4();
    v42(v40, v41);
  }
  uint64_t v43 = *(void *)(v0 + 296);
  sub_1000194CC(*(void *)(v0 + 248), &qword_100059228);
  sub_10003BA58(v43, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  sub_10003BB18();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = sub_10003BB40();
  return v45(v44);
}

uint64_t sub_10003A008()
{
  *(void *)(*(void *)v1 + 352) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10003A238;
  }
  else {
    uint64_t v2 = sub_10003A11C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003A11C()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[27];
  sub_10001C274(v0[41], v0[42]);
  uint64_t v3 = sub_10003BBB4();
  v4(v3);
  sub_10003BA58(v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
  sub_10003BA58(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  sub_10003BB18();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(1);
}

uint64_t sub_10003A238()
{
  sub_10001C274(v0[41], v0[42]);
  uint64_t v1 = v0[37];
  uint64_t v2 = v0[27];
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  sub_10003BA58(v2, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
  sub_10003BA58(v1, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = sub_10003BB40();
  return v4(v3);
}

uint64_t sub_10003A36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (uint64_t v4 = sub_10003D564(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

uint64_t sub_10003A3B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
  uint64_t v3 = sub_100030DA4(v2);
  __chkstk_darwin(v3);
  sub_100030E64();
  uint64_t v208 = v4;
  sub_100030F3C();
  __chkstk_darwin(v5);
  sub_1000315F4();
  uint64_t v222 = v6;
  uint64_t v7 = sub_100030F20();
  uint64_t v215 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo(v7);
  sub_100030C24();
  __chkstk_darwin(v8);
  sub_100030D90();
  uint64_t v203 = v9;
  uint64_t v10 = sub_10000488C(&qword_100059310);
  uint64_t v11 = sub_100030DA4(v10);
  __chkstk_darwin(v11);
  sub_100030E64();
  sub_10003BAB0();
  __chkstk_darwin(v12);
  sub_1000315F4();
  uint64_t v212 = v13;
  uint64_t v14 = sub_100030F20();
  uint64_t v224 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(v14);
  sub_100030C24();
  __chkstk_darwin(v15);
  sub_100030E64();
  sub_10003BAB0();
  __chkstk_darwin(v16);
  sub_1000315F4();
  uint64_t v214 = v17;
  uint64_t v18 = sub_10000488C(&qword_1000592B8);
  uint64_t v19 = sub_100030DA4(v18);
  __chkstk_darwin(v19);
  sub_100030D90();
  uint64_t v221 = v20;
  uint64_t v21 = sub_10000488C(&qword_1000592A0);
  uint64_t v22 = sub_100030DA4(v21);
  __chkstk_darwin(v22);
  sub_100030E64();
  uint64_t v218 = v23;
  sub_100030F3C();
  __chkstk_darwin(v24);
  sub_1000315F4();
  uint64_t v220 = v25;
  uint64_t v26 = sub_100030F20();
  uint64_t v219 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded(v26);
  sub_100030C24();
  __chkstk_darwin(v27);
  sub_100030E64();
  uint64_t v210 = v28;
  sub_100030F3C();
  __chkstk_darwin(v29);
  sub_1000315F4();
  uint64_t v217 = (void *)v30;
  uint64_t v31 = sub_100030F20();
  uint64_t v225 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(v31);
  sub_100030C24();
  __chkstk_darwin(v32);
  sub_100030E64();
  uint64_t v209 = v33;
  sub_100030F3C();
  __chkstk_darwin(v34);
  sub_1000315F4();
  uint64_t v226 = v35;
  uint64_t v36 = sub_100030F20();
  uint64_t v216 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData(v36);
  sub_100030C24();
  __chkstk_darwin(v37);
  sub_100030D90();
  v200 = v38;
  uint64_t v39 = sub_10000488C(&qword_1000592E8);
  uint64_t v40 = sub_100030DA4(v39);
  __chkstk_darwin(v40);
  sub_100030E64();
  sub_10003BAB0();
  __chkstk_darwin(v41);
  sub_1000315F4();
  uint64_t v205 = v42;
  uint64_t v43 = sub_100030F20();
  uint64_t v223 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent(v43);
  sub_100030C24();
  __chkstk_darwin(v44);
  sub_100030E64();
  sub_10003BAB0();
  __chkstk_darwin(v45);
  sub_1000315F4();
  uint64_t v204 = v46;
  uint64_t v47 = sub_10000488C(&qword_1000592D8);
  uint64_t v48 = sub_100030DA4(v47);
  __chkstk_darwin(v48);
  sub_100030E64();
  sub_10003BAB0();
  uint64_t v50 = __chkstk_darwin(v49);
  uint64_t v52 = (char *)&v194 - v51;
  __chkstk_darwin(v50);
  unint64_t v54 = (char *)&v194 - v53;
  uint64_t v211 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
  sub_100030C24();
  __chkstk_darwin(v55);
  sub_100030E64();
  sub_10003BAB0();
  __chkstk_darwin(v56);
  sub_1000315F4();
  uint64_t v213 = (char *)v57;
  uint64_t v58 = sub_100030F20();
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(v58);
  sub_100030C24();
  uint64_t v60 = __chkstk_darwin(v59);
  uint64_t v62 = (char *)&v194 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v60);
  uint64_t v64 = (char *)&v194 - v63;
  uint64_t v65 = sub_10000488C(&qword_100059228);
  uint64_t v66 = sub_100030DA4(v65);
  uint64_t v67 = __chkstk_darwin(v66);
  uint64_t v69 = (char *)&v194 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v67);
  uint64_t v207 = (uint64_t)&v194 - v70;
  sub_100030F3C();
  __chkstk_darwin(v71);
  sub_10003BAB0();
  uint64_t v73 = __chkstk_darwin(v72);
  unint64_t v75 = (char *)&v194 - v74;
  uint64_t v76 = __chkstk_darwin(v73);
  uint64_t v78 = (char *)&v194 - v77;
  __chkstk_darwin(v76);
  uint64_t v227 = a1;
  uint64_t v79 = a1;
  uint64_t v81 = (char *)&v194 - v80;
  sub_10003B9A8(v79, (uint64_t)&v194 - v80, &qword_100059228);
  uint64_t v82 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  sub_100030D2C((uint64_t)v81, 1, v82);
  if (v83)
  {
    uint64_t v84 = 0;
    goto LABEL_83;
  }
  uint64_t v196 = v81;
  sub_10003B9A8((uint64_t)v81, (uint64_t)v78, &qword_100059228);
  uint64_t v195 = v82;
  int v85 = swift_getEnumCaseMultiPayload() - 1;
  switch(v85)
  {
    case 0:
      uint64_t v86 = v222;
      sub_10003B9F8((uint64_t)v78, v222, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
      if (*(unsigned char *)(v86 + 105) == 1)
      {
        uint64_t v87 = v208;
        uint64_t v88 = v227;
        sub_10000500C(v208);
        *(unsigned char *)(v87 + 105) = 0;
        sub_1000194CC(v88, &qword_100059228);
        sub_10003B9F8(v87, v88, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext);
        uint64_t v84 = 1;
        uint64_t v89 = v195;
        swift_storeEnumTagMultiPayload();
        uint64_t v90 = sub_10003BB6C();
        sub_100004938(v90, v91, v92, v89);
        uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext;
        uint64_t v94 = v86;
        goto LABEL_81;
      }
      uint64_t v126 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext;
      uint64_t v127 = v86;
      goto LABEL_44;
    case 3:
      sub_10003B9F8((uint64_t)v78, (uint64_t)v64, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      unint64_t v96 = *((void *)v64 + 3);
      uint64_t v97 = *((void *)v64 + 2) & 0xFFFFFFFFFFFFLL;
      if ((v96 & 0x2000000000000000) != 0) {
        uint64_t v97 = HIBYTE(v96) & 0xF;
      }
      if (!v97)
      {
        uint64_t v126 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
        uint64_t v127 = (uint64_t)v64;
        goto LABEL_44;
      }
      uint64_t v98 = v227;
      sub_10003B9A8(v227, (uint64_t)v75, &qword_100059228);
      uint64_t v99 = v195;
      sub_100030D2C((uint64_t)v75, 1, v195);
      uint64_t v81 = v196;
      if (v83)
      {
        sub_1000194CC((uint64_t)v75, &qword_100059228);
      }
      else
      {
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 4)
        {
          sub_10003B9F8((uint64_t)v75, (uint64_t)v62, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
          goto LABEL_52;
        }
        sub_10003BA58((uint64_t)v75, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      }
      *(_OWORD *)uint64_t v62 = xmmword_100047890;
      *((void *)v62 + 2) = 0;
      *((void *)v62 + 3) = 0xE000000000000000;
      sub_100046860();
LABEL_52:
      swift_bridgeObjectRelease();
      *((void *)v62 + 2) = 0;
      *((void *)v62 + 3) = 0xE000000000000000;
      sub_1000194CC(v98, &qword_100059228);
      sub_10003B9F8((uint64_t)v62, v98, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent);
      swift_storeEnumTagMultiPayload();
      uint64_t v84 = 1;
      uint64_t v156 = sub_10003BB08();
      sub_100004938(v156, v157, v158, v99);
      uint64_t v159 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
      uint64_t v160 = (uint64_t)v64;
      goto LABEL_69;
    case 4:
      uint64_t v100 = v226;
      sub_10003B9F8((uint64_t)v78, v226, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      uint64_t v101 = v100 + *(int *)(v225 + 24);
      uint64_t v102 = v220;
      sub_10003B9A8(v101, v220, &qword_1000592A0);
      uint64_t v103 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent(0);
      sub_100030D2C(v102, 1, v103);
      if (v83)
      {
        sub_1000194CC(v102, &qword_1000592A0);
        uint64_t v104 = v227;
        uint64_t v105 = v195;
        uint64_t v107 = v218;
        uint64_t v106 = v219;
        uint64_t v108 = v217;
      }
      else
      {
        int v128 = swift_getEnumCaseMultiPayload();
        uint64_t v104 = v227;
        uint64_t v105 = v195;
        uint64_t v107 = v218;
        uint64_t v106 = v219;
        uint64_t v108 = v217;
        if (v128 == 1)
        {
          sub_10003B9F8(v102, (uint64_t)v217, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
          goto LABEL_34;
        }
        sub_10003BA58(v102, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
      }
      *uint64_t v108 = 0;
      v108[1] = 0xE000000000000000;
      sub_100046860();
      uint64_t v132 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      sub_10003BBEC(v132);
LABEL_34:
      uint64_t v133 = v221;
      sub_10003B9A8((uint64_t)v108 + *(int *)(v106 + 24), v221, &qword_1000592B8);
      uint64_t v134 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ResponseData(0);
      int v135 = sub_100004B4C(v133, 1, v134);
      sub_1000194CC(v133, &qword_1000592B8);
      sub_10003BA58((uint64_t)v108, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      if (v135 == 1)
      {
        uint64_t v126 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext;
        uint64_t v127 = v226;
        goto LABEL_44;
      }
      uint64_t v136 = v207;
      sub_10003B9A8(v104, v207, &qword_100059228);
      sub_100030D2C(v136, 1, v105);
      if (v83)
      {
        sub_1000194CC(v136, &qword_100059228);
        uint64_t v137 = v210;
        uint64_t v138 = v225;
      }
      else
      {
        int v139 = swift_getEnumCaseMultiPayload();
        uint64_t v137 = v210;
        uint64_t v138 = v225;
        if (v139 == 5)
        {
          uint64_t v140 = v136;
          uint64_t v141 = v209;
          sub_10003B9F8(v140, (uint64_t)v209, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
          goto LABEL_55;
        }
        sub_10003BA58(v136, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      }
      uint64_t v141 = v209;
      *uint64_t v209 = xmmword_100047890;
      *((void *)v141 + 2) = 0;
      *((void *)v141 + 3) = 0xE000000000000000;
      sub_100004938((uint64_t)v141 + *(int *)(v138 + 24), 1, 1, v103);
      sub_100046860();
LABEL_55:
      uint64_t v161 = (uint64_t)v141 + *(int *)(v138 + 24);
      sub_10003B9A8(v161, v107, &qword_1000592A0);
      sub_100030D2C(v107, 1, v103);
      if (v83)
      {
        sub_1000194CC(v107, &qword_1000592A0);
      }
      else
      {
        int v162 = swift_getEnumCaseMultiPayload();
        if (v162 == 1)
        {
          sub_10003B9F8(v107, (uint64_t)v137, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
          goto LABEL_62;
        }
        sub_10003BA58(v107, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext.OneOf_ContextEvent);
      }
      *uint64_t v137 = 0;
      v137[1] = 0xE000000000000000;
      sub_100046860();
      sub_10003BB50((uint64_t)v137 + *(int *)(v106 + 24));
LABEL_62:
      uint64_t v163 = (uint64_t)v137 + *(int *)(v106 + 24);
      sub_1000194CC(v163, &qword_1000592B8);
      uint64_t v164 = (uint64_t)v137;
      uint64_t v84 = 1;
      sub_10003BB50(v163);
      sub_1000194CC(v161, &qword_1000592A0);
      sub_10003B9F8(v164, v161, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContextEnded);
      swift_storeEnumTagMultiPayload();
      uint64_t v165 = sub_10003BB08();
      sub_100004938(v165, v166, v167, v103);
      sub_1000194CC(v104, &qword_100059228);
      sub_10003B9F8((uint64_t)v141, v104, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext);
      swift_storeEnumTagMultiPayload();
      sub_100004938(v104, 0, 1, v105);
      uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext;
      uint64_t v94 = v226;
      goto LABEL_81;
    case 5:
      uint64_t v109 = (uint64_t)v78;
      uint64_t v78 = v213;
      sub_10003B9F8(v109, (uint64_t)v213, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      uint64_t v110 = v211;
      uint64_t v111 = (uint64_t)&v78[*(int *)(v211 + 28)];
      sub_10003B9A8(v111, (uint64_t)v54, &qword_1000592D8);
      uint64_t v112 = sub_10003BB7C();
      uint64_t v113 = v223;
      int v115 = sub_100004B4C(v112, v114, v223);
      sub_1000194CC((uint64_t)v54, &qword_1000592D8);
      uint64_t v116 = v195;
      uint64_t v117 = v216;
      if (v115 == 1) {
        goto LABEL_42;
      }
      sub_10003B9A8(v111, (uint64_t)v52, &qword_1000592D8);
      sub_100030D2C((uint64_t)v52, 1, v113);
      uint64_t v142 = v204;
      if (v83)
      {
        *uint64_t v204 = 0;
        sub_100046860();
        uint64_t v118 = (uint64_t)v142 + *(int *)(v113 + 24);
        uint64_t v119 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        sub_100004938(v118, 1, 1, v119);
        sub_100004938((uint64_t)v142 + *(int *)(v113 + 28), 1, 1, v117);
        sub_1000194CC((uint64_t)v52, &qword_1000592D8);
      }
      else
      {
        sub_10003B9F8((uint64_t)v52, (uint64_t)v204, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      }
      uint64_t v143 = v205;
      sub_10003B9A8((uint64_t)v142 + *(int *)(v113 + 28), v205, &qword_1000592E8);
      uint64_t v144 = sub_10003BB7C();
      int v146 = sub_100004B4C(v144, v145, v117);
      sub_1000194CC(v143, &qword_1000592E8);
      sub_10003BA58((uint64_t)v142, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      if (v146 == 1)
      {
LABEL_42:
        uint64_t v95 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext;
LABEL_43:
        uint64_t v126 = v95;
        uint64_t v127 = (uint64_t)v78;
        goto LABEL_44;
      }
      uint64_t v152 = v227;
      uint64_t v153 = v197;
      sub_10003B9A8(v227, v197, &qword_100059228);
      sub_100030D2C(v153, 1, v116);
      if (v83)
      {
        sub_1000194CC(v153, &qword_100059228);
        uint64_t v154 = v199;
        uint64_t v155 = v206;
      }
      else
      {
        int v176 = swift_getEnumCaseMultiPayload();
        uint64_t v154 = v199;
        uint64_t v155 = v206;
        if (v176 == 6)
        {
          sub_10003B9F8(v153, (uint64_t)v206, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
          goto LABEL_74;
        }
        sub_10003BA58(v153, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
      }
      _OWORD *v155 = xmmword_100047890;
      uint64_t v177 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext.OneOf_ContextEvent(0);
      sub_10003BBEC(v177);
      sub_100046860();
      sub_10003BB50((uint64_t)v155 + *(int *)(v110 + 28));
LABEL_74:
      uint64_t v178 = v201;
      uint64_t v179 = (uint64_t)v155 + *(int *)(v110 + 28);
      sub_10003B9A8(v179, v201, &qword_1000592D8);
      uint64_t v180 = sub_10003BB7C();
      sub_100030D2C(v180, v181, v113);
      if (v83)
      {
        *uint64_t v154 = 0;
        sub_100046860();
        uint64_t v182 = (uint64_t)v154 + *(int *)(v113 + 24);
        uint64_t v183 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentAttribute(0);
        sub_100004938(v182, 1, 1, v183);
        sub_100004938((uint64_t)v154 + *(int *)(v113 + 28), 1, 1, v117);
        sub_1000194CC(v178, &qword_1000592D8);
      }
      else
      {
        sub_10003B9F8(v178, (uint64_t)v154, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      }
      uint64_t v184 = v200;
      uint64_t v185 = (uint64_t)v154 + *(int *)(v113 + 28);
      uint64_t v186 = v198;
      sub_10003B9A8(v185, v198, &qword_1000592E8);
      sub_100030D2C(v186, 1, v117);
      if (v83)
      {
        void *v184 = 0;
        v184[1] = 0xE000000000000000;
        v184[2] = 0;
        sub_100046860();
        sub_1000194CC(v186, &qword_1000592E8);
      }
      else
      {
        sub_10003B9F8(v186, (uint64_t)v184, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      }
      swift_bridgeObjectRelease();
      void *v184 = 0;
      v184[1] = 0xE000000000000000;
      sub_1000194CC(v185, &qword_1000592E8);
      sub_10003B9F8((uint64_t)v184, v185, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentData);
      uint64_t v84 = 1;
      uint64_t v187 = sub_10003BB08();
      sub_100004938(v187, v188, v189, v117);
      sub_1000194CC(v179, &qword_1000592D8);
      sub_10003B9F8((uint64_t)v154, v179, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponent);
      uint64_t v190 = sub_10003BB6C();
      sub_100004938(v190, v191, v192, v113);
      sub_1000194CC(v152, &qword_100059228);
      sub_10003B9F8((uint64_t)v206, v152, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext);
      swift_storeEnumTagMultiPayload();
      sub_100004938(v152, 0, 1, v116);
      uint64_t v93 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext;
      uint64_t v94 = (uint64_t)v78;
LABEL_81:
      sub_10003BA58(v94, (void (*)(void))v93);
      goto LABEL_82;
    case 6:
      uint64_t v120 = v214;
      sub_10003B9F8((uint64_t)v78, v214, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
      uint64_t v121 = v212;
      sub_10003B9A8(v120 + *(int *)(v224 + 32), v212, &qword_100059310);
      uint64_t v122 = sub_10003BB7C();
      uint64_t v123 = v215;
      int v125 = sub_100004B4C(v122, v124, v215);
      sub_1000194CC(v121, &qword_100059310);
      if (v125 != 1)
      {
        uint64_t v129 = v227;
        sub_10003B9A8(v227, (uint64_t)v69, &qword_100059228);
        uint64_t v130 = v195;
        sub_100030D2C((uint64_t)v69, 1, v195);
        if (v83)
        {
          sub_1000194CC((uint64_t)v69, &qword_100059228);
        }
        else
        {
          int v147 = swift_getEnumCaseMultiPayload();
          if (v147 == 7)
          {
            uint64_t v148 = (uint64_t)v69;
            uint64_t v149 = v202;
            sub_10003B9F8(v148, v202, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
            uint64_t v150 = v203;
            sub_10003BBD8();
            uint64_t v151 = v224;
            goto LABEL_65;
          }
          sub_10003BA58((uint64_t)v69, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType);
        }
        uint64_t v168 = v223;
        uint64_t v151 = v224;
        uint64_t v150 = v203;
        uint64_t v149 = v202;
        sub_10003BBD8();
        *(_OWORD *)uint64_t v149 = xmmword_100047890;
        *(void *)(v149 + 16) = 0;
        *(unsigned char *)(v149 + 24) = 1;
        sub_100046860();
        sub_100004938(v149 + *(int *)(v151 + 28), 1, 1, v168);
        sub_100004938(v149 + *(int *)(v151 + 32), 1, 1, v123);
LABEL_65:
        uint64_t v169 = v149 + *(int *)(v151 + 32);
        sub_10003B9A8(v169, (uint64_t)v78, &qword_100059310);
        uint64_t v84 = 1;
        sub_100030D2C((uint64_t)v78, 1, v123);
        if (v83)
        {
          *(void *)uint64_t v150 = 0;
          *(void *)(v150 + 8) = 0xE000000000000000;
          *(void *)(v150 + 16) = 0;
          *(void *)(v150 + 24) = 0;
          *(unsigned char *)(v150 + 32) = 1;
          sub_100046860();
          sub_1000194CC((uint64_t)v78, &qword_100059310);
        }
        else
        {
          sub_10003B9F8((uint64_t)v78, v150, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
        }
        swift_bridgeObjectRelease();
        *(void *)uint64_t v150 = 0;
        *(void *)(v150 + 8) = 0xE000000000000000;
        sub_1000194CC(v169, &qword_100059310);
        sub_10003B9F8(v150, v169, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentInteractionInfo);
        uint64_t v170 = sub_10003BB6C();
        sub_100004938(v170, v171, v172, v123);
        sub_1000194CC(v129, &qword_100059228);
        sub_10003B9F8(v149, v129, (void (*)(void))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected);
        swift_storeEnumTagMultiPayload();
        uint64_t v173 = sub_10003BB08();
        sub_100004938(v173, v174, v175, v130);
        uint64_t v159 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected;
        uint64_t v160 = v120;
LABEL_69:
        sub_10003BA58(v160, (void (*)(void))v159);
        goto LABEL_83;
      }
      uint64_t v126 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected;
      uint64_t v127 = v120;
LABEL_44:
      sub_10003BA58(v127, (void (*)(void))v126);
      uint64_t v84 = 0;
LABEL_82:
      uint64_t v81 = v196;
LABEL_83:
      sub_1000194CC((uint64_t)v81, &qword_100059228);
      return v84;
    default:
      uint64_t v95 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType;
      goto LABEL_43;
  }
}

uint64_t sub_10003B8C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003B910(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100030C24();
  uint64_t v4 = sub_10003BBA0();
  v5(v4);
  return a2;
}

void *sub_10003B964(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10003B9A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000488C(a3);
  sub_100030C24();
  uint64_t v4 = sub_10003BBA0();
  v5(v4);
  return a2;
}

uint64_t sub_10003B9F8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_100030C24();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_10003BA58(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_100030C24();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void sub_10003BAB0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_10003BAC0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10003BAD8()
{
  return sub_10001C274(v1, v0);
}

uint64_t sub_10003BAF0()
{
  return swift_slowDealloc();
}

uint64_t sub_10003BB08()
{
  return v0;
}

uint64_t sub_10003BB18()
{
  return swift_task_dealloc();
}

uint64_t sub_10003BB40()
{
  return 0;
}

uint64_t sub_10003BB50(uint64_t a1)
{
  return sub_100004938(a1, 1, 1, v1);
}

uint64_t sub_10003BB6C()
{
  return v0;
}

uint64_t sub_10003BB7C()
{
  return v0;
}

uint64_t sub_10003BB88()
{
  return sub_10001C274(v0, v1);
}

uint64_t sub_10003BBA0()
{
  return v0;
}

uint64_t sub_10003BBB4()
{
  return v0;
}

uint64_t sub_10003BBC0()
{
  return swift_task_alloc();
}

uint64_t sub_10003BBEC(uint64_t a1)
{
  return sub_100004938(v1, 1, 1, a1);
}

uint64_t sub_10003BC0C()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  id v3 = sub_10003BF30(0xD000000000000011, 0x800000010004CBF0);
  if (!v3) {
    id v3 = [self standardUserDefaults];
  }
  id v4 = v3;
  sub_10000488C(&qword_10005A8B0);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *(void *)(v1 + 16) = v5;
  return v1;
}

uint64_t sub_10003BCAC()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  id v2 = (void **)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_10003BF14(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

void sub_10003BD10(void **a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  NSString v4 = sub_100046B10();
  id v5 = [v3 stringForKey:v4];

  if (v5)
  {
    uint64_t v6 = sub_100046B20();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a2 = v6;
  a2[1] = v8;
}

void sub_10003BDA8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  id v2 = (void **)&v1[4];
  id v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_10003BEF4(v2);
  os_unfair_lock_unlock(v3);
}

void sub_10003BE08(void **a1, uint64_t a2, uint64_t a3)
{
  id v3 = *a1;
  if (a3) {
    NSString v4 = sub_100046B10();
  }
  else {
    NSString v4 = 0;
  }
  NSString v5 = sub_100046B10();
  [v3 setObject:v4 forKey:v5];
  swift_unknownObjectRelease();
}

uint64_t sub_10003BE98()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for DefaultsKVStorage()
{
  return self;
}

void sub_10003BEF4(void **a1)
{
  sub_10003BE08(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_10003BF14(void **a1@<X0>, uint64_t *a2@<X8>)
{
}

id sub_10003BF30(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v3 = sub_100046B10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }
  id v4 = [v2 initWithSuiteName:v3];

  return v4;
}

uint64_t sub_10003BF94()
{
  uint64_t v1 = v0;
  sub_10003C4B0(0, &qword_10005A958);
  id v2 = sub_10003C2D0();
  id v3 = [self currentProcess];
  sub_10000488C(&qword_10005A960);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10004B100;
  *(void *)(v4 + 32) = v2;
  sub_100046BC0();
  objc_allocWithZone((Class)RBSAssertion);
  NSString v5 = v2;
  id v6 = sub_10003C408(0xD000000000000014, 0x800000010004CC90, v3);
  *(void *)(v0 + 16) = v6;
  id v16 = 0;
  if ([v6 acquireWithError:&v16])
  {
    id v7 = v16;
  }
  else
  {
    id v8 = v16;
    sub_1000466B0();

    swift_willThrow();
    if (qword_100058CA8 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_100046AC0();
    sub_100004C10(v9, (uint64_t)qword_100061EC8);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = sub_100046AA0();
    os_log_type_t v11 = sub_100046D40();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      swift_errorRetain();
      uint64_t v14 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v16 = v14;
      sub_100046D80();
      *uint64_t v13 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Error acquiring write assertion: %@", v12, 0xCu);
      sub_10000488C(&qword_10005A7E8);
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
      NSString v5 = v10;
    }
  }

  return v1;
}

id sub_10003C2D0()
{
  NSString v0 = sub_100046B10();
  swift_bridgeObjectRelease();
  NSString v1 = sub_100046B10();
  swift_bridgeObjectRelease();
  id v2 = [(id)swift_getObjCClassFromMetadata() attributeWithDomain:v0 name:v1];

  return v2;
}

uint64_t sub_10003C364()
{
  NSString v1 = *(void **)(v0 + 16);
  if ([v1 isValid]) {
    [v1 invalidate];
  }

  return v0;
}

uint64_t sub_10003C3B0()
{
  sub_10003C364();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for SBAKeepAliveSignal()
{
  return self;
}

id sub_10003C408(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v5 = sub_100046B10();
  swift_bridgeObjectRelease();
  sub_10003C4B0(0, &qword_10005A968);
  Class isa = sub_100046BA0().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v3 initWithExplanation:v5 target:a3 attributes:isa];

  return v7;
}

uint64_t sub_10003C4B0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_10003C4EC()
{
  uint64_t v1 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  __chkstk_darwin(v1);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C684(v0, (uint64_t)v3);
  unint64_t v4 = 0xD000000000000012;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unint64_t v4 = 0xD000000000000010;
      break;
    case 2u:
      unint64_t v4 = 0xD000000000000011;
      break;
    case 3u:
      unint64_t v4 = 0x656C626967696C65;
      break;
    case 4u:
      unint64_t v4 = 0x5565676170626577;
      break;
    case 5u:
      unint64_t v4 = 0xD000000000000014;
      break;
    case 6u:
      unint64_t v4 = 0xD000000000000022;
      break;
    case 7u:
      unint64_t v4 = 0xD000000000000017;
      break;
    default:
      break;
  }
  sub_10003C6E8((uint64_t)v3);
  return v4;
}

uint64_t sub_10003C684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003C6E8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003C744@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload.OneOf_EventType(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C684(v2, (uint64_t)v6);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_DimensionContext;
      break;
    case 2u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_BloomFilterPassed;
      break;
    case 3u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_Eligible;
      break;
    case 4u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageUrlSent;
      break;
    case 5u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_ServerRequestContext;
      break;
    case 6u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_VisualComponentPresentationContext;
      break;
    case 7u:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_UserInteractionDetected;
      break;
    default:
      uint64_t v7 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted(0);
      id v8 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_WebpageViewStarted;
      break;
  }
  uint64_t v9 = v8;
  a1[3] = v7;
  uint64_t v10 = sub_10003C918(a1);
  return sub_10003C97C((uint64_t)v6, (uint64_t)v10, v9);
}

uint64_t *sub_10003C918(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10003C97C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003C9E4()
{
  uint64_t v0 = sub_10000488C(&qword_100058E18);
  __chkstk_darwin(v0 - 8);
  sub_1000314F4();
  uint64_t v38 = v2 - v1;
  uint64_t v37 = sub_100046780();
  sub_100030C08();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_1000314F4();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_10000488C(&qword_10005A970);
  __chkstk_darwin(v9 - 8);
  sub_1000314F4();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_1000467E0();
  sub_100030C08();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_1000314F4();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_1000467C0();
  sub_100030C08();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  sub_1000314F4();
  uint64_t v26 = v25 - v24;
  sub_1000466A0();
  sub_100030C08();
  __chkstk_darwin(v27);
  sub_1000314F4();
  if (qword_100058CA0 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_100004C10(v20, (uint64_t)qword_100061EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v26, v28, v20);
  sub_1000467D0();
  uint64_t result = sub_100004B4C(v12, 1, v13);
  if (result == 1) {
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v19, v12, v13);
  sub_100046710();
  sub_1000467B0();
  uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v36(v8, v37);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v13);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v26, v20);
  sub_100046690();
  sub_100046670();
  sub_100046680();
  if (sub_100004B4C(v38, 1, v37) == 1)
  {
    uint64_t v30 = sub_10003CF2C();
    v31(v30);
    uint64_t result = sub_10003CECC(v38);
    double v32 = 0.0;
  }
  else
  {
    sub_100046720();
    double v32 = v33;
    uint64_t v34 = sub_10003CF2C();
    v35(v34);
    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v36)(v38, v37);
  }
  if ((~*(void *)&v32 & 0x7FF0000000000000) != 0)
  {
    if (v32 > -1.0)
    {
      if (v32 < 1.84467441e19) {
        return (unint64_t)v32;
      }
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_10003CDAC()
{
  uint64_t v0 = sub_100046790();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000467C0();
  sub_100018B3C(v4, qword_100061EB0);
  sub_100004C10(v4, (uint64_t)qword_100061EB0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Calendar.Identifier.gregorian(_:), v0);
  sub_1000467A0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10003CECC(uint64_t a1)
{
  uint64_t v2 = sub_10000488C(&qword_100058E18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003CF2C()
{
  return v0;
}

void sub_10003CF44()
{
  sub_10003D25C();
  sub_100046AE0();
  sub_100046CA0();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v0 = sub_10003E0B0();
  sub_10003DEF0(v0, 0x6E6F697461727564, 0xE800000000000000, v1);
  swift_bridgeObjectRelease();
  sub_100046840();
  sub_100046D70();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v2 = sub_10003E0B0();
  sub_10003DEF0(v2, 0x726574706F6461, 0xE700000000000000, v3);
  swift_bridgeObjectRelease();
  sub_100046D70();
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v4 = sub_10003E0B0();
  sub_10003DEF0(v4, 1701869940, 0xE400000000000000, v5);
  swift_bridgeObjectRelease();
  Class isa = sub_100046D70().super.super.isa;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10003DEF0((uint64_t)isa, 0x656D6F6374756FLL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 46;
  v11._object = (void *)0xE100000000000000;
  sub_100046B70(v11);
  v12._countAndFlagsBits = 0x656372756F736572;
  v12._object = (void *)0xEE00737365636341;
  sub_100046B70(v12);
  NSString v8 = sub_100046B10();
  swift_bridgeObjectRelease();
  Class v9 = sub_100046AD0().super.isa;
  AnalyticsSendEvent();
  swift_bridgeObjectRelease();
}

uint64_t sub_10003D174(uint64_t a1)
{
  return sub_10003D1E4(a1, qword_100061EC8);
}

uint64_t sub_10003D194(uint64_t a1)
{
  return sub_10003E0C4(a1, qword_100061EE0);
}

uint64_t sub_10003D1AC(uint64_t a1)
{
  return sub_10003E0C4(a1, qword_100061EF8);
}

uint64_t sub_10003D1C4(uint64_t a1)
{
  return sub_10003D1E4(a1, qword_100061F10);
}

uint64_t sub_10003D1E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100046AC0();
  sub_100018B3C(v3, a2);
  sub_100004C10(v3, (uint64_t)a2);
  return sub_100046AB0();
}

unint64_t sub_10003D25C()
{
  unint64_t result = qword_10005A978;
  if (!qword_10005A978)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10005A978);
  }
  return result;
}

uint64_t sub_10003D29C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, BOOL *a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v7 = a3;
  Class v9 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (a2 >> 32 < (int)a2) {
        __break(1u);
      }
      swift_retain();
      char v14 = sub_10003D4C4((int)a2, a2 >> 32, v7 & 0x3FFFFFFFFFFFFFFFLL, v9);
      if (v6) {
        goto LABEL_16;
      }
      BOOL v10 = v14;
      __s1 = sub_10001C274(a2, v7);
      break;
    case 2uLL:
      uint64_t v7 = a3 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a2 + 16);
      uint64_t v12 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      char v13 = sub_10003D4C4(v11, v12, v7, v9);
      if (v6) {
        goto LABEL_15;
      }
      BOOL v10 = v13;
      swift_release();
      __s1 = swift_release();
      break;
    case 3uLL:
      if (!__s1) {
        goto LABEL_14;
      }
      BOOL v10 = 1;
      break;
    default:
      uint64_t __s2 = a2;
      __int16 v16 = a3;
      char v17 = BYTE2(a3);
      char v18 = BYTE3(a3);
      char v19 = BYTE4(a3);
      char v20 = BYTE5(a3);
      if (!__s1)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        swift_release();
        swift_release();
        __break(1u);
LABEL_16:
        sub_10001C274(a2, v7);
        __break(1u);
        JUMPOUT(0x10003D4B4);
      }
      __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
      BOOL v10 = __s1 == 0;
      break;
  }
  *a4 = v10;
  return __s1;
}

uint64_t sub_10003D4C4(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t result = sub_100046640();
  NSString v8 = (char *)result;
  if (result)
  {
    uint64_t result = sub_100046660();
    if (__OFSUB__(a1, result))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    v8 += a1 - result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  int64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t result = sub_100046650();
  if (!a4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (result >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = result;
  }
  return memcmp(a4, v8, v11) == 0;
}

uint64_t sub_10003D564(uint64_t a1, uint64_t a2)
{
  return sub_10003D590(a1, a2, (void (*)(unsigned char *, uint64_t, uint64_t))&Data.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10003D708);
}

uint64_t sub_10003D590(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, Swift::Int))
{
  sub_100046F30();
  a3(v10, a1, a2);
  Swift::Int v7 = sub_100046F50();

  return a4(a1, a2, v7);
}

unint64_t sub_10003D624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100046EB0() & 1) == 0)
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
      while (!v14 && (sub_100046EB0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10003D708(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v5 = a3 & ~v4;
  uint64_t v57 = v3 + 64;
  if ((*(void *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = v3;
    unint64_t v49 = HIDWORD(a1);
    size_t v54 = HIDWORD(a1) - (int)a1;
    uint64_t v55 = ~v4;
    size_t __n = BYTE6(a2);
    BOOL v9 = __OFSUB__(HIDWORD(a1), a1);
    BOOL v53 = v9;
    unint64_t v51 = a2 >> 62;
    uint64_t v50 = (int)a1;
    uint64_t v48 = a1 >> 32;
    uint64_t v47 = (a1 >> 32) - (int)a1;
    unint64_t v56 = a2 >> 62;
    while (1)
    {
      int64_t v10 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v5);
      uint64_t v12 = *v10;
      unint64_t v11 = v10[1];
      uint64_t v13 = 0;
      unint64_t v14 = HIDWORD(*v10);
      switch(v11 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(v14, v12)) {
            goto LABEL_75;
          }
          uint64_t v13 = (int)v14 - (int)v12;
LABEL_11:
          sub_1000197D8(v12, v11);
          break;
        case 2uLL:
          uint64_t v16 = *(void *)(v12 + 16);
          uint64_t v15 = *(void *)(v12 + 24);
          uint64_t v13 = v15 - v16;
          if (!__OFSUB__(v15, v16)) {
            goto LABEL_11;
          }
          __break(1u);
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
          goto LABEL_82;
        case 3uLL:
          break;
        default:
          uint64_t v13 = BYTE6(v11);
          break;
      }
      size_t v17 = __n;
      switch(v56)
      {
        case 1uLL:
          size_t v17 = v54;
          if (v53) {
            goto LABEL_77;
          }
          goto LABEL_16;
        case 2uLL:
          uint64_t v19 = *(void *)(a1 + 16);
          uint64_t v18 = *(void *)(a1 + 24);
          BOOL v20 = __OFSUB__(v18, v19);
          size_t v17 = v18 - v19;
          if (!v20) {
            goto LABEL_16;
          }
          goto LABEL_76;
        case 3uLL:
          if (v13) {
            goto LABEL_28;
          }
          goto LABEL_72;
        default:
LABEL_16:
          if (v13 == v17)
          {
            if (v13 < 1)
            {
LABEL_72:
              sub_10001C274(v12, v11);
              return v5;
            }
            switch(v11 >> 62)
            {
              case 1uLL:
                if (v12 >> 32 < (int)v12) {
                  goto LABEL_78;
                }
                sub_1000197D8(a1, a2);
                sub_1000197D8(a1, a2);
                sub_1000197D8(v12, v11);
                sub_1000197D8(a1, a2);
                uint64_t v32 = sub_100046640();
                if (!v32) {
                  goto LABEL_49;
                }
                uint64_t v33 = sub_100046660();
                if (__OFSUB__((int)v12, v33)) {
                  goto LABEL_81;
                }
                v32 += (int)v12 - v33;
LABEL_49:
                sub_100046650();
                sub_10003D29C(v32, a1, a2, (BOOL *)__s1);
                sub_10001C274(a1, a2);
                sub_10001C274(v12, v11);
                sub_10001C274(v12, v11);
                char v28 = __s1[0];
                goto LABEL_50;
              case 2uLL:
                uint64_t v24 = *(void *)(v12 + 16);
                uint64_t v25 = *(void *)(v12 + 24);
                sub_1000197D8(a1, a2);
                sub_1000197D8(a1, a2);
                sub_1000197D8(a1, a2);
                swift_retain();
                swift_retain();
                uint64_t v26 = sub_100046640();
                if (!v26) {
                  goto LABEL_32;
                }
                uint64_t v27 = sub_100046660();
                if (__OFSUB__(v24, v27)) {
                  goto LABEL_80;
                }
                v26 += v24 - v27;
LABEL_32:
                if (__OFSUB__(v25, v24)) {
                  goto LABEL_79;
                }
                sub_100046650();
                sub_10003D29C(v26, a1, a2, (BOOL *)__s1);
                sub_10001C274(a1, a2);
                swift_release();
                swift_release();
                char v28 = __s1[0];
                sub_10001C274(v12, v11);
LABEL_50:
                sub_10001C274(a1, a2);
                sub_10001C274(a1, a2);
                uint64_t v6 = v52;
                if (v28) {
                  return v5;
                }
                break;
              case 3uLL:
                memset(__s1, 0, 14);
                if (!v51) {
                  goto LABEL_52;
                }
                if (v51 == 1)
                {
                  if (v48 < v50) {
                    goto LABEL_83;
                  }
                  sub_1000197D8(a1, a2);
                  sub_1000197D8(a1, a2);
                  uint64_t v21 = sub_100046640();
                  if (v21)
                  {
                    uint64_t v29 = sub_100046660();
                    if (__OFSUB__(v50, v29)) {
                      goto LABEL_89;
                    }
                    v21 += v50 - v29;
                  }
                  uint64_t v23 = sub_100046650();
                  if (!v21) {
                    goto LABEL_90;
                  }
                  goto LABEL_41;
                }
                uint64_t v35 = *(void *)(a1 + 16);
                uint64_t v36 = *(void *)(a1 + 24);
                sub_1000197D8(a1, a2);
                sub_1000197D8(a1, a2);
                swift_retain();
                swift_retain();
                uint64_t v37 = (char *)sub_100046640();
                if (v37)
                {
                  uint64_t v38 = sub_100046660();
                  if (__OFSUB__(v35, v38)) {
                    goto LABEL_86;
                  }
                  v37 += v35 - v38;
                }
                BOOL v20 = __OFSUB__(v36, v35);
                int64_t v39 = v36 - v35;
                if (v20) {
                  goto LABEL_84;
                }
                uint64_t v40 = sub_100046650();
                if (!v37) {
                  goto LABEL_91;
                }
                goto LABEL_66;
              default:
                LOWORD(__s1[0]) = v12;
                BYTE2(__s1[0]) = BYTE2(v12);
                BYTE3(__s1[0]) = BYTE3(v12);
                BYTE4(__s1[0]) = v14;
                BYTE5(__s1[0]) = BYTE5(v12);
                BYTE6(__s1[0]) = BYTE6(v12);
                HIBYTE(__s1[0]) = HIBYTE(v12);
                LOWORD(__s1[1]) = v11;
                BYTE2(__s1[1]) = BYTE2(v11);
                BYTE3(__s1[1]) = BYTE3(v11);
                BYTE4(__s1[1]) = BYTE4(v11);
                BYTE5(__s1[1]) = BYTE5(v11);
                if (!v51)
                {
LABEL_52:
                  __int16 __s2 = a1;
                  char v60 = BYTE2(a1);
                  char v61 = BYTE3(a1);
                  char v62 = v49;
                  char v63 = BYTE5(a1);
                  char v64 = BYTE6(a1);
                  char v65 = HIBYTE(a1);
                  __int16 v66 = a2;
                  char v67 = BYTE2(a2);
                  char v68 = BYTE3(a2);
                  char v69 = BYTE4(a2);
                  char v70 = BYTE5(a2);
                  sub_1000197D8(a1, a2);
                  sub_1000197D8(a1, a2);
                  p_s2 = &__s2;
                  size_t v30 = __n;
LABEL_53:
                  int v34 = memcmp(__s1, p_s2, v30);
                  sub_10001C274(v12, v11);
                  sub_10001C274(a1, a2);
                  sub_10001C274(a1, a2);
                  if (!v34) {
                    return v5;
                  }
                  break;
                }
                if (v51 == 1)
                {
                  if (v48 < v50)
                  {
LABEL_82:
                    __break(1u);
LABEL_83:
                    __break(1u);
LABEL_84:
                    __break(1u);
LABEL_85:
                    __break(1u);
LABEL_86:
                    __break(1u);
LABEL_87:
                    __break(1u);
LABEL_88:
                    __break(1u);
LABEL_89:
                    __break(1u);
                  }
                  sub_1000197D8(a1, a2);
                  sub_1000197D8(a1, a2);
                  uint64_t v21 = sub_100046640();
                  if (v21)
                  {
                    uint64_t v22 = sub_100046660();
                    if (__OFSUB__(v50, v22)) {
                      goto LABEL_88;
                    }
                    v21 += v50 - v22;
                  }
                  uint64_t v23 = sub_100046650();
                  if (!v21)
                  {
                    __break(1u);
LABEL_90:
                    __break(1u);
LABEL_91:
                    __break(1u);
LABEL_92:
                    __break(1u);
                    sub_10001C274(a1, a2);
                    sub_10001C274(a1, a2);
                    swift_release();
                    swift_release();
                    __break(1u);
                    sub_10001C274(a1, a2);
                    sub_10001C274(a1, a2);
                    sub_10001C274(v12, v11);
                    __break(1u);
                    JUMPOUT(0x10003DEC0);
                  }
LABEL_41:
                  if (v23 >= v47) {
                    size_t v30 = v47;
                  }
                  else {
                    size_t v30 = v23;
                  }
                  p_s2 = (__int16 *)v21;
                  goto LABEL_53;
                }
                uint64_t v41 = *(void *)(a1 + 16);
                uint64_t v42 = *(void *)(a1 + 24);
                sub_1000197D8(a1, a2);
                sub_1000197D8(a1, a2);
                swift_retain();
                swift_retain();
                uint64_t v37 = (char *)sub_100046640();
                if (v37)
                {
                  uint64_t v43 = sub_100046660();
                  if (__OFSUB__(v41, v43)) {
                    goto LABEL_87;
                  }
                  v37 += v41 - v43;
                }
                BOOL v20 = __OFSUB__(v42, v41);
                int64_t v39 = v42 - v41;
                if (v20) {
                  goto LABEL_85;
                }
                uint64_t v40 = sub_100046650();
                if (!v37) {
                  goto LABEL_92;
                }
LABEL_66:
                if (v40 >= v39) {
                  size_t v44 = v39;
                }
                else {
                  size_t v44 = v40;
                }
                int v45 = memcmp(__s1, v37, v44);
                swift_release();
                swift_release();
                sub_10001C274(v12, v11);
                sub_10001C274(a1, a2);
                sub_10001C274(a1, a2);
                uint64_t v6 = v52;
                if (!v45) {
                  return v5;
                }
                break;
            }
          }
          else
          {
LABEL_28:
            sub_10001C274(v12, v11);
          }
          unint64_t v5 = (v5 + 1) & v55;
          if (((*(void *)(v57 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
            return v5;
          }
          break;
      }
    }
  }
  return v5;
}

void sub_10003DEF0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  int64_t v10 = (void *)*v4;
  uint64_t v11 = sub_10003D590(a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10003D624);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_10000488C(&qword_10005A980);
  if (!sub_100046DF0(a4 & 1, v15)) {
    goto LABEL_5;
  }
  uint64_t v18 = sub_10003D590(a2, a3, (void (*)(unsigned char *, uint64_t, uint64_t))&String.hash(into:), (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10003D624);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    sub_100046ED0();
    __break(1u);
    return;
  }
  unint64_t v16 = v18;
LABEL_5:
  BOOL v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];

    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_10003E068(v16, a2, a3, a1, v20);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_10003E068(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  *unint64_t v5 = a2;
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

uint64_t sub_10003E0B0()
{
  return v0;
}

uint64_t sub_10003E0C4(uint64_t a1, uint64_t *a2)
{
  return sub_10003D1E4(a1, a2);
}

uint64_t sub_10003E0CC()
{
  return _swift_task_switch(sub_10003E0E8, 0, 0);
}

uint64_t sub_10003E0E8()
{
  sub_100035314();
  objc_allocWithZone((Class)sub_100046810());
  sub_100046800();
  sub_1000430FC();
  return v0();
}

uint64_t sub_10003E154()
{
  sub_100035314();
  v0[4] = v1;
  uint64_t v2 = sub_100046780();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  v0[8] = swift_task_alloc();
  return _swift_task_switch(sub_10003E220, 0, 0);
}

uint64_t sub_10003E220()
{
  sub_1000431A4();
  if (qword_100058CA8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[4];
  uint64_t v2 = sub_100046AC0();
  v0[9] = sub_100004C10(v2, (uint64_t)qword_100061EC8);
  id v3 = v1;
  uint64_t v4 = sub_100046AA0();
  os_log_type_t v5 = sub_100046D20();
  BOOL v6 = os_log_type_enabled(v4, v5);
  BOOL v7 = (void *)v0[4];
  if (v6)
  {
    uint64_t v8 = (_DWORD *)sub_100043128();
    BOOL v20 = (void *)sub_100043280();
    *uint64_t v8 = 138412290;
    v0[3] = v7;
    id v9 = v7;
    sub_100046D80();
    *BOOL v20 = v7;

    sub_100043248((void *)&_mh_execute_header, v10, v11, "Context: %@");
    sub_10000488C(&qword_10005A7E8);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();
  }
  else
  {
  }
  sub_100046770();
  type metadata accessor for DefaultsKVStorage();
  swift_allocObject();
  v0[10] = sub_10003BC0C();
  sub_1000430C0();
  v0[11] = sub_10003BCAC();
  v0[12] = v12;
  type metadata accessor for SBABiomeEventSource();
  swift_allocObject();
  sub_100004210();
  id v13 = objc_allocWithZone((Class)FLLogger);
  swift_retain();
  id v14 = [v13 initWithPersistenceConfiguration:1];
  sub_10000488C(&qword_10005A9B8);
  swift_allocObject();
  uint64_t v15 = sub_10003BBB4();
  v0[13] = sub_100042C7C(v15, v16, (uint64_t)v14, v17);
  uint64_t v21 = (uint64_t (__cdecl *)())((char *)&dword_10005A9C0 + dword_10005A9C0);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[14] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_10003E4C4;
  return v21();
}

uint64_t sub_10003E4C4()
{
  sub_100035308();
  char v3 = v2;
  sub_1000352B4();
  uint64_t v5 = v4;
  sub_1000352DC();
  *BOOL v6 = v5;
  uint64_t v7 = *v1;
  sub_1000352DC();
  *uint64_t v8 = v7;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v9 = sub_10003E758;
  }
  else
  {
    swift_release();
    *(unsigned char *)(v5 + 128) = v3 & 1;
    id v9 = sub_10003E5C8;
  }
  return _swift_task_switch(v9, 0, 0);
}

uint64_t sub_10003E5C8()
{
  int v1 = *(unsigned __int8 *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  sub_100046760();
  sub_100046740();
  uint64_t v5 = *(void (**)(void))(v4 + 8);
  ((void (*)(uint64_t, uint64_t))v5)(v2, v3);
  sub_10003CF44();
  uint64_t v6 = *(void *)(v0 + 96);
  if (v1 == 1) {
    goto LABEL_2;
  }
  uint64_t v7 = sub_100043090();
  if (!v6)
  {
    if (!v8) {
      goto LABEL_15;
    }
LABEL_2:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (!v8) {
    goto LABEL_2;
  }
  if (*(void *)(v0 + 88) != v7 || *(void *)(v0 + 96) != v8) {
    sub_100046EB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_15:
  id v10 = objc_allocWithZone((Class)sub_100043228());
  sub_100043208();
  swift_release();
  sub_10004311C();
  v5();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = sub_1000431B0();
  return v12(v11);
}

uint64_t sub_10003E758()
{
  sub_1000431A4();
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100046AA0();
  os_log_type_t v3 = sub_100046D40();
  if (sub_100043028(v3))
  {
    uint64_t v4 = (uint8_t *)sub_100043128();
    uint64_t v5 = (void *)sub_100043280();
    *(_DWORD *)uint64_t v4 = 138543362;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    v1[2] = v6;
    sub_100046D80();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Worker failed with error: %{public}@", v4, 0xCu);
    sub_10000488C(&qword_10005A7E8);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = v1[6];

  sub_100046760();
  sub_100046740();
  uint64_t v8 = *(void (**)(void))(v7 + 8);
  uint64_t v9 = sub_1000431FC();
  ((void (*)(uint64_t))v8)(v9);
  sub_10003CF44();
  swift_errorRelease();
  uint64_t v10 = v1[12];
  uint64_t v11 = sub_100043090();
  if (!v10)
  {
    if (!v12) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (!v12)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (v1[11] != v11 || v1[12] != v12) {
    sub_100046EB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_15:
  id v14 = objc_allocWithZone((Class)sub_100043228());
  sub_100043208();
  swift_release();
  sub_10004311C();
  v8();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = sub_1000431B0();
  return v16(v15);
}

uint64_t sub_10003E9E4()
{
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *int v1 = v0;
  v1[1] = sub_100042EB4;
  return sub_10003E0CC();
}

uint64_t sub_10003EA70()
{
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *int v1 = v0;
  v1[1] = sub_10003EB04;
  return sub_10003E154();
}

uint64_t sub_10003EB04()
{
  sub_100035314();
  sub_1000352B4();
  uint64_t v1 = *v0;
  sub_1000352DC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_1000431B0();
  return v4(v3);
}

uint64_t sub_10003EBCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_10003ECB0;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_10003ECB0()
{
  sub_100035314();
  sub_1000352B4();
  uint64_t v1 = *v0;
  sub_1000352DC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_10003ED78(uint64_t a1)
{
  unint64_t v2 = sub_10003EED4();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10003EE20()
{
  unint64_t result = qword_10005A988[0];
  if (!qword_10005A988[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10005A988);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafariAssistantWorker()
{
  return &type metadata for SafariAssistantWorker;
}

uint64_t sub_10003EE80()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10003EED4()
{
  unint64_t result = qword_10005A9A8;
  if (!qword_10005A9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10005A9A8);
  }
  return result;
}

uint64_t sub_10003EF20()
{
  v1[34] = v0;
  sub_10000488C(&qword_100058E18);
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  v1[41] = swift_task_alloc();
  uint64_t v2 = sub_100046AC0();
  v1[42] = v2;
  v1[43] = *(void *)(v2 - 8);
  v1[44] = swift_task_alloc();
  return _swift_task_switch(sub_10003F05C, v0, 0);
}

uint64_t sub_10003F05C()
{
  if (qword_100058CB0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 272);
  uint64_t v5 = sub_100004C10(v3, (uint64_t)qword_100061EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_100042D30(v4 + 120, v0 + 16);
  uint64_t v6 = *(void *)(v0 + 40);
  uint64_t v7 = sub_10003BBB4();
  sub_100042D94(v7, v8);
  uint64_t v9 = *(void *)(v6 - 8);
  swift_task_alloc();
  (*(void (**)(void))(v9 + 16))();
  uint64_t v10 = sub_1000430C0();
  *(void *)(v0 + 360) = sub_100042B3C(v10, v11, v12);
  sub_1000348F8(v0 + 16);
  swift_task_dealloc();
  uint64_t v13 = sub_100044AF4();
  double v15 = v14;
  uint64_t v16 = v13;
  *(double *)(v0 + 368) = v14;
  *(void *)(v0 + 376) = v13;
  uint64_t v17 = sub_100046AA0();
  os_log_type_t v18 = sub_100046D50();
  if (sub_100043028(v18))
  {
    char v19 = (uint8_t *)sub_100043128();
    *(_DWORD *)char v19 = 134349056;
    *(double *)(v0 + 264) = v15;
    sub_1000431FC();
    sub_100046D80();
    _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v1, "Starting Bookmark - %{public}f", v19, 0xCu);
    sub_10003BAF0();
  }

  if (v15 <= 0.0)
  {
    uint64_t v20 = 1;
  }
  else
  {
    sub_100046710();
    uint64_t v20 = 0;
  }
  uint64_t v22 = *(void *)(v0 + 320);
  uint64_t v21 = *(void *)(v0 + 328);
  uint64_t v23 = *(void *)(v0 + 272);
  uint64_t v24 = sub_100046780();
  sub_100004938(v21, v20, 1, v24);
  *(void *)(v0 + 384) = v24;
  sub_100004938(v22, 1, 1, v24);
  *(void *)(v0 + 392) = *(void *)(v23 + 112);
  uint64_t v25 = sub_1000431FC();
  id v27 = sub_100004560(v25, v26);
  *(void *)(v0 + 400) = v27;
  sub_10003CECC(v22);
  sub_10003CECC(v21);
  sub_100004658(v27, (void *)(v0 + 56));
  char v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v28;
  *char v28 = v0;
  v28[1] = sub_10003F354;
  return sub_1000402AC(v0 + 56, v16, v15);
}

uint64_t sub_10003F354()
{
  sub_100042FB8();
  char v3 = v2;
  uint64_t v4 = *v1;
  uint64_t v5 = *v1;
  sub_1000352DC();
  *uint64_t v6 = v5;
  *uint64_t v6 = *v1;
  *(void *)(v5 + 416) = v0;
  swift_task_dealloc();
  uint64_t v7 = *(void *)(v4 + 272);
  if (v0)
  {
    sub_1000348F8(v5 + 56);
    uint64_t v8 = sub_10003F680;
  }
  else
  {
    *(unsigned char *)(v5 + 504) = v3 & 1;
    sub_1000348F8(v5 + 56);
    uint64_t v8 = sub_10003F4A4;
  }
  return _swift_task_switch(v8, v7, 0);
}

uint64_t sub_10003F4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100042F9C();
  sub_10004314C();
  int v15 = *(unsigned __int8 *)(v14 + 504);

  if (v15 == 1)
  {
    uint64_t v16 = *(void *)(v14 + 320);
    sub_100035320(v16, -900.0, *(double *)(v14 + 368));
    id v17 = sub_100004464(v16);
    *(void *)(v14 + 424) = v17;
    sub_10003CECC(v16);
    os_log_type_t v18 = sub_100046AA0();
    os_log_type_t v19 = sub_100046D50();
    if (os_log_type_enabled(v18, v19))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_1000431D0((void *)&_mh_execute_header, v18, v20, "Reading events for timing data");
      sub_10003BAF0();
    }

    sub_100004658(v17, (void *)(v14 + 136));
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v14 + 432) = v21;
    *uint64_t v21 = v14;
    v21[1] = sub_10003F854;
    sub_100042F28();
    return sub_100040974(v22);
  }
  else
  {
    sub_10004305C();
    swift_release();
    uint64_t v25 = sub_10004318C();
    v26(v25);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_100043108();
    sub_100042F28();
    return v29(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_10003F680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100042F9C();
  sub_10004314C();

  sub_10003CF44();
  swift_errorRetain();
  swift_errorRetain();
  int v15 = sub_100046AA0();
  os_log_type_t v16 = sub_100046D40();
  if (os_log_type_enabled(v15, v16))
  {
    id v17 = (_DWORD *)sub_100043128();
    os_log_type_t v18 = (void *)sub_100043280();
    *id v17 = 138412290;
    swift_errorRetain();
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v14 + 216) = v19;
    sub_100046D80();
    *os_log_type_t v18 = v19;
    swift_errorRelease();
    swift_errorRelease();
    sub_100043248((void *)&_mh_execute_header, v20, v21, "Event stream could not be read - %@");
    sub_10000488C(&qword_10005A7E8);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10004305C();
  swift_release();
  uint64_t v22 = sub_10004318C();
  v23(v22);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_100043108();
  sub_100042F28();
  return v26(v24, v25, v26, v27, v28, v29, v30, v31, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_10003F854()
{
  sub_100035308();
  sub_100042EF0();
  sub_1000352DC();
  void *v3 = v2;
  uint64_t v4 = *v1;
  sub_1000352DC();
  *uint64_t v5 = v4;
  v7[55] = v6;
  v7[56] = v8;
  uint64_t v9 = (uint64_t)(v7 + 17);
  v7[57] = v10;
  v7[58] = v0;
  swift_task_dealloc();
  sub_1000348F8(v9);
  sub_100043298();
  sub_100043140();
  return _swift_task_switch(v11, v12, v13);
}

uint64_t sub_10003F964()
{
  uint64_t v48 = v1;
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100046AA0();
  os_log_type_t v3 = sub_100046D50();
  if (sub_100043170(v3))
  {
    uint64_t v4 = *(void *)(v1 + 456);
    uint64_t v5 = *(void *)(v1 + 440);
    uint64_t v6 = sub_100043268();
    *(_DWORD *)uint64_t v6 = 134349312;
    *(void *)(v1 + 248) = *(void *)(v5 + 16);
    sub_100046D80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2050;
    *(void *)(v1 + 256) = v4;
    sub_100046D80();
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Found - %{public}ld IDs from %{public}lu events.", (uint8_t *)v6, 0x16u);
    sub_10003BAF0();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  double v7 = *(double *)(v1 + 448);
  double v8 = *(double *)(v1 + 368);

  if (v8 >= v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    sub_100046710();
    uint64_t v9 = 0;
  }
  double v10 = *(double *)(v1 + 368);
  uint64_t v11 = 1;
  sub_100004938(*(void *)(v1 + 312), v9, 1, *(void *)(v1 + 384));
  if (v10 > 0.0)
  {
    sub_100046710();
    uint64_t v11 = 0;
  }
  uint64_t v13 = *(void *)(v1 + 304);
  uint64_t v12 = *(void *)(v1 + 312);
  uint64_t v14 = *(void *)(v1 + 296);
  sub_100004938(v13, v11, 1, *(void *)(v1 + 384));
  id v15 = sub_100004560(v13, v12);
  *(void *)(v1 + 472) = v15;
  sub_10003CECC(v13);
  sub_1000048D0(v12, v14);
  os_log_type_t v16 = sub_100046AA0();
  os_log_type_t v17 = sub_100046D50();
  if (os_log_type_enabled(v16, v17))
  {
    double v18 = *(double *)(v1 + 368);
    uint64_t v19 = sub_100043268();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136446466;
    uint64_t v20 = *(void *)(v1 + 384);
    id v46 = v15;
    if (v18 <= 0.0)
    {
      sub_100004938(*(void *)(v1 + 288), 1, 1, v20);
    }
    else
    {
      uint64_t v21 = *(void *)(v1 + 288);
      sub_100046710();
      sub_100004938(v21, 0, 1, v20);
      if (sub_100004B4C(v21, 1, v20) != 1)
      {
        uint64_t v22 = *(void *)(v1 + 384);
        uint64_t v23 = *(void *)(v1 + 288);
        uint64_t v24 = sub_100046730();
        unint64_t v26 = v25;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v23, v22);
LABEL_16:
        uint64_t v28 = *(void *)(v1 + 384);
        uint64_t v29 = *(void *)(v1 + 296);
        uint64_t v30 = *(void *)(v1 + 280);
        *(void *)(v1 + 232) = sub_1000422B4(v24, v26, &v47);
        sub_100046D80();
        swift_bridgeObjectRelease();
        *(_WORD *)(v19 + 12) = 2082;
        sub_1000048D0(v29, v30);
        if (sub_100004B4C(v30, 1, v28) == 1)
        {
          sub_10003CECC(*(void *)(v1 + 280));
          uint64_t v31 = 0;
          unint64_t v32 = 0xE000000000000000;
        }
        else
        {
          uint64_t v33 = *(void *)(v1 + 384);
          uint64_t v34 = *(void *)(v1 + 280);
          uint64_t v31 = sub_100046730();
          unint64_t v32 = v35;
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v34, v33);
        }
        id v15 = v46;
        uint64_t v36 = *(void *)(v1 + 296);
        *(void *)(v1 + 240) = sub_1000422B4(v31, v32, &v47);
        sub_100046D80();
        swift_bridgeObjectRelease();
        sub_10003CECC(v36);
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Reading events to report in range [%{public}s ... %{public}s]", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy();
        sub_10003BAF0();
        sub_10003BAF0();

        goto LABEL_20;
      }
    }
    sub_10003CECC(*(void *)(v1 + 288));
    uint64_t v24 = 0;
    unint64_t v26 = 0xE000000000000000;
    goto LABEL_16;
  }
  uint64_t v27 = *(void *)(v1 + 296);

  sub_10003CECC(v27);
LABEL_20:
  uint64_t v37 = *(void *)(v1 + 360);
  sub_100004658(v15, (void *)(v1 + 176));
  *(void *)(v1 + 120) = type metadata accessor for SBASyncedStreamPosition();
  *(void *)(v1 + 128) = &off_100055E78;
  *(void *)(v1 + 96) = v37;
  swift_retain();
  uint64_t v38 = (void *)swift_task_alloc();
  *(void *)(v1 + 480) = v38;
  void *v38 = v1;
  v38[1] = sub_10003FF00;
  sub_100042F08();
  return sub_100041044(v39, v40, v41, v42, v43);
}

uint64_t sub_10003FE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100042F9C();
  sub_10004314C();

  sub_100042FC4();
  swift_release();
  uint64_t v15 = sub_100043044();
  v16(v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000432D0();
  sub_100042F28();
  return v19(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_10003FF00()
{
  sub_100035308();
  sub_1000352B4();
  os_log_type_t v3 = v2;
  sub_1000352DC();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_1000352DC();
  *uint64_t v6 = v5;
  v3[61] = v7;
  v3[62] = v0;
  swift_task_dealloc();
  sub_1000348F8((uint64_t)(v3 + 22));
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v8 = v3[34];
    uint64_t v9 = sub_1000401D4;
  }
  else
  {
    uint64_t v10 = v3[34];
    sub_1000348F8((uint64_t)(v3 + 12));
    uint64_t v9 = sub_10004002C;
    uint64_t v8 = v10;
  }
  return _swift_task_switch(v9, v8, 0);
}

uint64_t sub_10004002C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100042F9C();
  sub_10004314C();
  os_log_type_t v16 = sub_100046AA0();
  os_log_type_t v17 = sub_100046D50();
  if (sub_100043170(v17))
  {
    uint64_t v18 = v15[61];
    uint64_t v19 = (uint8_t *)sub_100043128();
    *(_DWORD *)uint64_t v19 = 134349056;
    v15[28] = v18;
    sub_100046D80();
    _os_log_impl((void *)&_mh_execute_header, v16, v14, "Exiting process after sending %{public}lu events.", v19, 0xCu);
    sub_10003BAF0();
  }
  uint64_t v20 = v15[61];

  if (v20) {
    HIDWORD(a11) = 1;
  }
  else {
    HIDWORD(a11) = v15[57] != 0;
  }
  uint64_t v21 = v15[39];
  uint64_t v22 = (void *)v15[53];
  uint64_t v23 = (void *)v15[59];
  sub_10003CF44();

  sub_10003CECC(v21);
  uint64_t v35 = v15[36];
  uint64_t v36 = v15[35];
  sub_10004639C();
  swift_release();
  uint64_t v24 = sub_100043044();
  v25(v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000430FC();
  sub_100042F28();
  return v28(v26, v27, v28, v29, v30, v31, v32, v33, v35, v36, a11, a12, a13, a14);
}

uint64_t sub_1000401D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100042F9C();
  sub_10004314C();
  uint64_t v15 = *(void **)(v14 + 424);
  uint64_t v16 = *(void *)(v14 + 312);

  sub_10003CECC(v16);
  sub_1000348F8(v14 + 96);
  sub_100042FC4();
  swift_release();
  uint64_t v17 = sub_100043044();
  v18(v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1000432D0();
  sub_100042F28();
  return v21(v19, v20, v21, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_1000402AC(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v4 + 40) = a2;
  *(void *)(v4 + 48) = v3;
  *(double *)(v4 + 32) = a3;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = sub_100046AC0();
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = *(void *)(v5 - 8);
  *(void *)(v4 + 72) = swift_task_alloc();
  return _swift_task_switch(sub_100040374, v3, 0);
}

uint64_t sub_100040374()
{
  sub_100042FB8();
  if (qword_100058CB0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = sub_100004C10(v3, (uint64_t)qword_100061EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 0;
  sub_100042FFC(*(void **)(v0 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000404C4;
  uint64_t v6 = sub_100042F80();
  return v7(v6);
}

uint64_t sub_1000404C4()
{
  sub_100035308();
  sub_100042EF0();
  sub_1000352DC();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 104) = v0;
  swift_task_dealloc();
  sub_100043298();
  sub_100043140();
  return _swift_task_switch(v4, v5, v6);
}

void sub_1000405BC()
{
  sub_10004314C();
  uint64_t v1 = *(void **)(v0 + 16);
  if (!v1)
  {
    sub_10003CF44();
    uint64_t v9 = sub_100046AA0();
    os_log_type_t v10 = sub_100046D50();
    if (sub_100043028(v10))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_1000431D0((void *)&_mh_execute_header, v9, v11, "Event stream has no new events");
      sub_10003BAF0();
    }
    goto LABEL_24;
  }
  double v2 = *(double *)(v0 + 80);
  [v1 timestamp];
  double v5 = v4;
  double v6 = floor(v5 * 1000.0) / 1000.0;
  if (v2 <= v6)
  {
    double v8 = *(double *)(v0 + 80);
    if (v8 != v6)
    {
      double v30 = *(double *)(v0 + 32);
      if (v30 <= 0.0 || v6 > v30) {
        goto LABEL_21;
      }

      unint64_t v7 = 0;
      *(double *)(v0 + 80) = v6;
      goto LABEL_28;
    }
    uint64_t v12 = *(void *)(v0 + 88);
    unint64_t v7 = v12 + 1;
    if (v12 == -1)
    {
      __break(1u);
      return;
    }
  }
  else
  {
    unint64_t v7 = *(void *)(v0 + 88);
    double v8 = *(double *)(v0 + 80);
  }
  double v13 = *(double *)(v0 + 32);
  BOOL v15 = v8 == v13 && v7 > *(void *)(v0 + 40);
  if (v13 <= 0.0 || v8 > v13 || v15)
  {
LABEL_21:
    uint64_t v9 = sub_100046AA0();
    os_log_type_t v18 = sub_100046D50();
    if (sub_100043028(v18))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_1000431D0((void *)&_mh_execute_header, v9, v19, "Event stream has data to process");
      sub_10003BAF0();
    }

LABEL_24:
    uint64_t v21 = *(void *)(v0 + 64);
    uint64_t v20 = *(void *)(v0 + 72);
    uint64_t v22 = *(void *)(v0 + 56);
    uint64_t v23 = *(void **)(v0 + 24);

    uint64_t v24 = v23[3];
    uint64_t v25 = v23[4];
    sub_10003B964(v23, v24);
    (*(void (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    swift_task_dealloc();
    sub_1000430FC();
    v26(v1 != 0);
    return;
  }

LABEL_28:
  *(void *)(v0 + 88) = v7;
  sub_100042FFC(*(void **)(v0 + 24));
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_1000404C4;
  uint64_t v28 = sub_100042F80();
  v29(v28);
}

uint64_t sub_1000408D8()
{
  sub_100042FB8();
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = sub_100042EB8(*(void **)(v0 + 24));
  v5(v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  sub_1000430FC();
  return v6(0);
}

uint64_t sub_100040974(uint64_t a1)
{
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = v1;
  return _swift_task_switch(sub_100040994, v1, 0);
}

uint64_t sub_100040994()
{
  sub_100042FB8();
  sub_100042DFC();
  uint64_t v1 = sub_100046AE0();
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 48) = v1;
  sub_100042FFC(*(void **)(v0 + 32));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100040AA8;
  uint64_t v3 = sub_100042F80();
  return v4(v3);
}

uint64_t sub_100040AA8()
{
  sub_100035308();
  sub_100042EF0();
  sub_1000352DC();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  sub_100043298();
  sub_100043140();
  return _swift_task_switch(v4, v5, v6);
}

void sub_100040BA0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (!v1) {
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = v2 + 1;
  if (v2 == -1)
  {
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v4 = *(void *)(v0 + 80);
  sub_100046C80();
  if (v4)
  {

    uint64_t v5 = sub_100042EB8(*(void **)(v0 + 32));
    v6(v5);
    swift_bridgeObjectRelease();
    sub_100042F44();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v15 = sub_1000046E8(v1);
  if (v17 == 2) {
    goto LABEL_25;
  }
  uint64_t v18 = v15;
  unint64_t v19 = v16;
  char v20 = v17;
  [v1 timestamp];
  double v23 = v22;
  uint64_t v24 = *(void *)(v0 + 48);
  if ((v20 & 1) == 0)
  {
    if (*(void *)(v24 + 16))
    {
      sub_1000197D8(v18, v19);
      sub_10003D564(v18, v19);
      if (v25)
      {
        double v26 = *(double *)(v0 + 56);
        sub_100042E48(v18, v19, v20);
        sub_1000430E0();

        if (v26 >= v23) {
          double v23 = v26;
        }
        goto LABEL_38;
      }
      sub_1000430E0();
    }
    sub_1000430E0();
LABEL_25:

    goto LABEL_39;
  }
  sub_1000197D8(v18, v19);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v0 + 24) = v24;
  unint64_t v47 = sub_10003D564(v18, v19);
  uint64_t v28 = *(void *)(v24 + 16);
  BOOL v29 = (v27 & 1) == 0;
  Swift::Int v30 = v28 + v29;
  if (__OFADD__(v28, v29)) {
    goto LABEL_43;
  }
  char v31 = v27;
  sub_10000488C(&qword_10005A9F8);
  if (!sub_100046DF0(isUniquelyReferenced_nonNull_native, v30))
  {
LABEL_27:
    uint64_t v35 = *(void **)(v0 + 24);
    if (v31)
    {
      *(double *)(v35[7] + 8 * v47) = v23;
      goto LABEL_31;
    }
    v35[(v47 >> 6) + 8] |= 1 << v47;
    uint64_t v36 = (uint64_t *)(v35[6] + 16 * v47);
    *uint64_t v36 = v18;
    v36[1] = v19;
    *(double *)(v35[7] + 8 * v47) = v23;
    uint64_t v37 = v35[2];
    BOOL v38 = __OFADD__(v37, 1);
    uint64_t v39 = v37 + 1;
    if (!v38)
    {
      v35[2] = v39;
      sub_1000197D8(v18, v19);
LABEL_31:
      double v40 = *(double *)(v0 + 56);
      swift_bridgeObjectRelease();
      sub_100042E48(v18, v19, v20);
      sub_1000430E0();
      if (v40 >= v23 && v40 != 0.0) {
        double v23 = v40;
      }
      unint64_t v42 = v35[2];

      if (v42 >> 4 < 0x271)
      {
        *(void *)(v0 + 48) = v35;
LABEL_38:
        *(double *)(v0 + 56) = v23;
LABEL_39:
        *(void *)(v0 + 64) = v3;
        sub_1000432A4(*(void **)(v0 + 32));
        double v43 = (void *)swift_task_alloc();
        *(void *)(v0 + 72) = v43;
        *double v43 = v0;
        v43[1] = sub_100040AA8;
        sub_100043158();
        sub_100042F44();
        __asm { BRAA            X4, X16 }
      }
LABEL_7:
      uint64_t v9 = *(void **)(v0 + 32);
      uint64_t v10 = v9[3];
      uint64_t v11 = v9[4];
      sub_10003B964(v9, v10);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
      swift_bridgeObjectRetain();
      v12(v10, v11);
      swift_bridgeObjectRelease();
      sub_100042F44();
      __asm { BRAA            X3, X16 }
    }
LABEL_44:
    __break(1u);
    return;
  }
  uint64_t v32 = sub_10003D564(v18, v19);
  if ((v31 & 1) == (v33 & 1))
  {
    unint64_t v47 = v32;
    goto LABEL_27;
  }
  sub_100042F44();
  sub_100046ED0();
}

uint64_t sub_100040FC8()
{
  sub_100042FB8();
  uint64_t v1 = sub_100042EB8(*(void **)(v0 + 32));
  v2(v1);
  swift_bridgeObjectRelease();
  sub_1000431EC();
  return v3();
}

uint64_t sub_100041044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)(v6 + 176) = a4;
  *(void *)(v6 + 184) = v5;
  *(void *)(v6 + 160) = a2;
  *(void *)(v6 + 168) = a3;
  *(double *)(v6 + 152) = a5;
  *(void *)(v6 + 144) = a1;
  uint64_t v7 = sub_100046AC0();
  *(void *)(v6 + 192) = v7;
  *(void *)(v6 + 200) = *(void *)(v7 - 8);
  *(void *)(v6 + 208) = swift_task_alloc();
  return _swift_task_switch(sub_100041110, v5, 0);
}

uint64_t sub_100041110()
{
  sub_1000431A4();
  if (qword_100058CB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[19];
  uint64_t v6 = sub_100004C10(v3, (uint64_t)qword_100061EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  v0[11] = v5;
  v0[13] = 0;
  v0[14] = 0;
  v0[12] = v4;
  swift_beginAccess();
  v0[27] = 0;
  uint64_t v7 = (void *)v0[18];
  uint64_t v8 = v7[3];
  uint64_t v9 = v7[4];
  sub_10003B964(v7, v8);
  uint64_t v14 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v9 + 16) + **(int **)(v9 + 16));
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_1000431C0(v10);
  *uint64_t v11 = v12;
  v11[1] = sub_1000412C0;
  return v14(v0 + 15, v8, v9);
}

uint64_t sub_1000412C0()
{
  sub_100035308();
  sub_100042EF0();
  sub_1000352DC();
  void *v3 = v2;
  void *v3 = *v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();
  sub_100043298();
  sub_100043140();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1000413B8()
{
  uint64_t v44 = v0;
  uint64_t v1 = *(void **)(v0 + 120);
  *(void *)(v0 + 240) = v1;
  if (!v1)
  {
    uint64_t v9 = *(void **)(v0 + 144);
    sub_10004311C();
    v10();

    uint64_t v11 = v9[3];
    uint64_t v12 = v9[4];
    sub_10003B964(v9, v11);
    (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
    swift_task_dealloc();
    sub_1000430FC();
    sub_100042F08();
    __asm { BRAA            X2, X16 }
  }
  uint64_t v2 = *(void *)(v0 + 232);
  sub_100046C80();
  if (v2)
  {

    uint64_t v3 = sub_10003BBB4();
    v4(v3);
    uint64_t v5 = sub_100042EB8(*(void **)(v0 + 144));
    v6(v5);
    swift_task_dealloc();
    sub_100042F08();
    __asm { BRAA            X1, X16 }
  }
  type metadata accessor for SBAKeepAliveSignal();
  *(void *)(v0 + 248) = swift_initStackObject();
  *(void *)(v0 + 256) = sub_10003BF94();
  [v1 timestamp];
  double v17 = v16;
  swift_beginAccess();
  double v18 = floor(v17 * 1000.0);
  double v19 = *(double *)(v0 + 104);
  if (v19 <= v18 / 1000.0)
  {
    if (v19 == v18 / 1000.0)
    {
      uint64_t v20 = *(void *)(v0 + 112);
      BOOL v24 = __CFADD__(v20, 1);
      uint64_t v21 = v20 + 1;
      if (!v24) {
        goto LABEL_15;
      }
      __break(1u);
    }
    uint64_t v21 = 0;
    *(double *)(v0 + 104) = v18 / 1000.0;
    double v19 = v18 / 1000.0;
LABEL_15:
    *(void *)(v0 + 112) = v21;
  }
  swift_endAccess();
  double v22 = *(double *)(v0 + 88);
  if (v22 > 0.0 && v22 >= v19)
  {
    BOOL v24 = v22 != v19 || *(void *)(v0 + 96) >= *(void *)(v0 + 112);
    if (v24)
    {
      char v25 = sub_100046AA0();
      os_log_type_t v26 = sub_100046D30();
      if (os_log_type_enabled(v25, v26))
      {
        uint64_t v27 = sub_100043268();
        v43[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v27 = 136315394;
        uint64_t v28 = sub_100035474(*(void *)(v0 + 112));
        *(void *)(v0 + 128) = sub_1000422B4(v28, v29, v43);
        sub_100046D80();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 12) = 2080;
        uint64_t v30 = sub_100035474(*(void *)(v0 + 96));
        *(void *)(v0 + 136) = sub_1000422B4(v30, v31, v43);
        sub_100046D80();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Skipping - %s less than %s", (uint8_t *)v27, 0x16u);
        swift_arrayDestroy();
        sub_10003BAF0();
        sub_10003BAF0();
      }

      swift_release();
      sub_10003B964(*(void **)(v0 + 144), *(void *)(*(void *)(v0 + 144) + 24));
      uint64_t v32 = swift_task_alloc();
      char v33 = (void *)sub_1000431C0(v32);
      *char v33 = v34;
      v33[1] = sub_1000412C0;
      sub_100042F08();
      __asm { BRAA            X4, X16 }
    }
  }
  uint64_t v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v37;
  *uint64_t v37 = v0;
  v37[1] = sub_100041900;
  sub_100042F08();
  return sub_100041C2C(v38, v39, v40);
}

uint64_t sub_100041870()
{
  sub_100042FB8();
  sub_10004311C();
  v1();
  uint64_t v2 = sub_100042EB8(*(void **)(v0 + 144));
  v3(v2);
  swift_task_dealloc();
  sub_1000431EC();
  return v4();
}

uint64_t sub_100041900()
{
  sub_100042FB8();
  sub_100042F64();
  uint64_t v4 = v3;
  sub_1000352DC();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 272) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(unsigned char *)(v4 + 280) = v1 & 1;
  }
  sub_100043140();
  return _swift_task_switch(v6, v7, v8);
}

void sub_100041A0C()
{
  sub_1000431A4();
  uint64_t v1 = *(void *)(v0 + 216);
  if (*(unsigned char *)(v0 + 280) == 1 && (BOOL v2 = __CFADD__(v1, 1), ++v1, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 240);
    uint64_t v4 = *(void **)(v0 + 168);
    double v5 = *(double *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    *(double *)(v0 + 88) = v5;
    *(void *)(v0 + 96) = v6;
    uint64_t v7 = v4[3];
    uint64_t v8 = v4[4];
    sub_10003B964(v4, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, double))(v8 + 16))(v6, v7, v8, v5);

    swift_release();
    *(void *)(v0 + 216) = v1;
    sub_1000432A4(*(void **)(v0 + 144));
    uint64_t v9 = swift_task_alloc();
    uint64_t v10 = (void *)sub_1000431C0(v9);
    *uint64_t v10 = v11;
    v10[1] = sub_1000412C0;
    uint64_t v12 = sub_100043158();
    v13(v12);
  }
}

uint64_t sub_100041B7C()
{
  sub_100042FB8();
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  uint64_t v4 = sub_100042EB8(*(void **)(v0 + 144));
  v5(v4);
  swift_task_dealloc();
  sub_1000431EC();
  return v6();
}

uint64_t sub_100041C2C(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v4 + 56) = a2;
  *(void *)(v4 + 64) = v3;
  *(double *)(v4 + 48) = a3;
  *(void *)(v4 + 40) = a1;
  uint64_t v5 = sub_100046AC0();
  *(void *)(v4 + 72) = v5;
  *(void *)(v4 + 80) = *(void *)(v5 - 8);
  *(void *)(v4 + 88) = swift_task_alloc();
  return _swift_task_switch(sub_100041CF4, v3, 0);
}

uint64_t sub_100041CF4()
{
  sub_100042FB8();
  if (qword_100058CB0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = (void *)v0[5];
  uint64_t v5 = sub_100004C10(v3, (uint64_t)qword_100061EE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v0[12] = sub_1000047B4(v4);
  v0[13] = v6;
  if (v6 >> 60 == 15)
  {
    uint64_t v7 = sub_100046AA0();
    os_log_type_t v8 = sub_100046D40();
    if (sub_100043170(v8))
    {
      uint64_t v9 = v0[6];
      uint64_t v10 = (uint8_t *)sub_100043128();
      *(_DWORD *)uint64_t v10 = 134349056;
      v0[2] = v9;
      sub_100046D80();
      _os_log_impl((void *)&_mh_execute_header, v7, (os_log_type_t)v3, "Event with no data found in stream at bookmark: %{public}f", v10, 0xCu);
      sub_10003BAF0();
    }

    sub_10003CF44();
    sub_10004311C();
    v11();
    swift_task_dealloc();
    uint64_t v12 = sub_100043108();
    return v13(v12);
  }
  else
  {
    uint64_t v15 = (void *)v0[8];
    uint64_t v16 = v15[23];
    uint64_t v17 = v15[24];
    sub_10003B964(v15 + 20, v16);
    double v18 = (void *)swift_task_alloc();
    v0[14] = v18;
    *double v18 = v0;
    v18[1] = sub_100041F28;
    uint64_t v19 = sub_10003BBB4();
    return sub_100039138(v19, v20, v21, v16, v17, v22);
  }
}

uint64_t sub_100041F28()
{
  sub_100042FB8();
  sub_100042F64();
  uint64_t v4 = v3;
  sub_1000352DC();
  *uint64_t v5 = v4;
  *uint64_t v5 = *v2;
  *(void *)(v4 + 120) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(unsigned char *)(v4 + 128) = v1 & 1;
  }
  sub_100043140();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_100042034()
{
  sub_100035314();
  uint64_t v1 = *(void *)(v0 + 96);
  unint64_t v2 = *(void *)(v0 + 104);
  sub_10003CF44();
  sub_100042DE8(v1, v2);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 128);
  sub_10004311C();
  v4();
  swift_task_dealloc();
  sub_1000430FC();
  return v5(v3);
}

uint64_t sub_1000420CC()
{
  sub_1000431A4();
  sub_10003CF44();
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v2 = sub_100046AA0();
  os_log_type_t v3 = sub_100046D40();
  if (sub_100043028(v3))
  {
    uint64_t v4 = v1[6];
    uint64_t v5 = sub_100043268();
    uint64_t v6 = (void *)sub_100043280();
    *(_DWORD *)uint64_t v5 = 138412546;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v1[3] = v7;
    sub_100046D80();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v5 + 12) = 2050;
    v1[4] = v4;
    sub_100046D80();
    _os_log_impl((void *)&_mh_execute_header, v2, v0, "Send to consumer failed with error: %@ at bookmark: %{public}f", (uint8_t *)v5, 0x16u);
    sub_10000488C(&qword_10005A7E8);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = v1[12];
  unint64_t v9 = v1[13];
  swift_willThrow();
  sub_100042DE8(v8, v9);
  uint64_t v10 = sub_1000431FC();
  v11(v10);
  swift_task_dealloc();
  sub_1000430FC();
  return v12(0);
}

uint64_t sub_1000422B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100042388(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100034850((uint64_t)v12, *a3);
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
      sub_100034850((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000348F8((uint64_t)v12);
  return v7;
}

uint64_t sub_100042388(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000424E0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100046D90();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000425B8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_100046DE0();
    if (!v8)
    {
      uint64_t result = sub_100046E00();
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

void *sub_1000424E0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100046E10();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000425B8(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_100042650(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_10004282C(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_10004282C((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100042650(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_100046B80();
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
  unint64_t v3 = sub_1000427C4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100046DC0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100046E10();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100046E00();
  __break(1u);
  return result;
}

void *sub_1000427C4(uint64_t a1, uint64_t a2)
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
  sub_10000488C(&qword_10005A9E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10004282C(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000488C(&qword_10005A9E0);
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
  double v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000429DC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100042904(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100042904(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100046E10();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1000429DC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100046E10();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void *sub_100042A6C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v13 = type metadata accessor for DefaultsKVStorage();
  uint64_t v14 = &off_100055CF0;
  v12[0] = a3;
  sub_100042D30((uint64_t)v12, (uint64_t)(a4 + 3));
  a4[8] = a1;
  a4[9] = a2;
  sub_10003B964(v12, v13);
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_10003BCAC();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  type metadata accessor for SBAAtomicStreamPosition();
  swift_allocObject();
  a4[2] = sub_100045634(v8, v10);
  sub_1000348F8((uint64_t)v12);
  return a4;
}

void *sub_100042B3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = *a3;
  uint64_t v15 = &off_100055CF0;
  v13[0] = a3;
  type metadata accessor for SBASyncedStreamPosition();
  char v5 = (void *)swift_allocObject();
  uint64_t v6 = sub_100042D94((uint64_t)v13, v14);
  __chkstk_darwin(v6);
  uint64_t v8 = (void *)((char *)&v13[-1] - v7);
  (*(void (**)(char *))(v9 + 16))((char *)&v13[-1] - v7);
  uint64_t v10 = sub_100042A6C(a1, a2, *v8, v5);
  sub_1000348F8((uint64_t)v13);
  return v10;
}

uint64_t sub_100042C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = type metadata accessor for DefaultsKVStorage();
  uint64_t v17 = &off_100055CF0;
  *(void *)&long long v15 = a2;
  unint64_t v13 = sub_100042E5C();
  uint64_t v14 = &off_100055DA8;
  *(void *)&long long v12 = a3;
  uint64_t v10 = &type metadata for TaskCancellationTracker;
  size_t v11 = &off_100055F48;
  swift_defaultActor_initialize();
  sub_100042E9C(&v12, a4 + 160);
  *(void *)(a4 + 112) = a1;
  sub_100042E9C(&v15, a4 + 120);
  sub_100042E9C(&v9, a4 + 200);
  return a4;
}

uint64_t sub_100042D30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100042D94(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100042DE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10001C274(a1, a2);
  }
  return a1;
}

unint64_t sub_100042DFC()
{
  unint64_t result = qword_10005A9F0;
  if (!qword_10005A9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005A9F0);
  }
  return result;
}

uint64_t sub_100042E48(uint64_t a1, unint64_t a2, char a3)
{
  if (a3 != 2) {
    return sub_10001C274(a1, a2);
  }
  return a1;
}

unint64_t sub_100042E5C()
{
  unint64_t result = qword_10005AA00;
  if (!qword_10005AA00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_10005AA00);
  }
  return result;
}

uint64_t sub_100042E9C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100042EB8(void *a1)
{
  uint64_t v1 = a1[3];
  sub_10003B964(a1, v1);
  return v1;
}

uint64_t sub_100042F80()
{
  return v0;
}

void sub_100042FC4()
{
  sub_10004639C();
}

uint64_t sub_100042FFC(void *a1)
{
  uint64_t v1 = a1[4];
  sub_10003B964(a1, a1[3]);
  return v1 + 16;
}

BOOL sub_100043028(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100043044()
{
  return v0;
}

void sub_10004305C()
{
  sub_10004639C();
}

uint64_t sub_100043090()
{
  return sub_10003BCAC();
}

uint64_t sub_1000430C0()
{
  return 0x6D6B6F6F42414253;
}

uint64_t sub_1000430E0()
{
  return sub_100042E48(v2, v1, v0);
}

uint64_t sub_100043108()
{
  return 0;
}

uint64_t sub_100043128()
{
  return swift_slowAlloc();
}

uint64_t sub_100043158()
{
  return v0;
}

BOOL sub_100043170(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10004318C()
{
  return v0;
}

uint64_t sub_1000431B0()
{
  return v0;
}

uint64_t sub_1000431C0(uint64_t result)
{
  *(void *)(v1 + 224) = result;
  return result;
}

void sub_1000431D0(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t sub_1000431EC()
{
  return v0 + 8;
}

uint64_t sub_1000431FC()
{
  return v0;
}

uint64_t sub_100043208()
{
  return sub_100046800();
}

uint64_t sub_100043228()
{
  return sub_100046810();
}

void sub_100043248(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_100043268()
{
  return swift_slowAlloc();
}

uint64_t sub_100043280()
{
  return swift_slowAlloc();
}

uint64_t sub_1000432A4(void *a1)
{
  uint64_t v1 = a1[4];
  sub_10003B964(a1, a1[3]);
  return v1 + 16;
}

uint64_t sub_1000432D0()
{
  return 0;
}

uint64_t sub_1000432E4()
{
  id v1 = [v0 webpageViewStarted];
  if (!v1)
  {
    id v1 = [v0 bloomFilterPassed];
    if (!v1)
    {
      id v1 = [v0 dimensionContext];
      if (!v1)
      {
        id v1 = [v0 eligible];
        if (!v1)
        {
          id v1 = [v0 serverRequestContext];
          if (!v1)
          {
            id v1 = [v0 userInteractionDetected];
            if (!v1)
            {
              id v1 = [v0 visualComponentPresentationContext];
              if (!v1)
              {
                id v1 = [v0 webpageUrlSent];
                if (!v1) {
                  return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t v2 = v1;
  id v3 = [v1 webpageViewIdentifier];
  if (!v3)
  {

    return 0;
  }
  os_log_type_t v4 = v3;
  uint64_t v5 = sub_1000466F0();

  return v5;
}

uint64_t sub_1000434DC@<X0>(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
  type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent();
  return sub_100046860();
}

uint64_t sub_10004351C()
{
  uint64_t v0 = sub_100046A90();
  sub_100018B3C(v0, qword_100061F28);
  sub_100004C10(v0, (uint64_t)qword_100061F28);
  sub_10000488C(&qword_100059270);
  id v1 = (int *)(sub_10000488C(&qword_100059278) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100047910;
  unint64_t v4 = v3 + v2 + v1[14];
  *(void *)(v3 + v2) = 1;
  *(void *)unint64_t v4 = "safariBrowsingAssistantEvents";
  *(void *)(v4 + 8) = 29;
  *(unsigned char *)(v4 + 16) = 2;
  uint64_t v5 = enum case for _NameMap.NameDescription.same(_:);
  uint64_t v6 = sub_100046A70();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104))(v4, v5, v6);
  return sub_100046A80();
}

uint64_t sub_100043678()
{
  if (qword_100058CC8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100046A90();

  return sub_100004C10(v0, (uint64_t)qword_100061F28);
}

uint64_t sub_1000436DC()
{
  while (1)
  {
    uint64_t result = sub_1000468D0();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 1) {
      sub_100043750();
    }
  }
  return result;
}

uint64_t sub_100043750()
{
  return sub_100046960();
}

uint64_t sub_1000437F0()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload(0),
        sub_100043F90(&qword_100059208, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SBAPayload), uint64_t result = sub_100046A50(), !v1))
  {
    type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent();
    return sub_100046850();
  }
  return result;
}

uint64_t sub_1000438DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100046870();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - v9;
  sub_100018BE4();
  if (v11)
  {
    uint64_t v12 = type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent();
    unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, a1 + *(int *)(v12 + 20), v4);
    v13(v8, a2 + *(int *)(v12 + 20), v4);
    sub_100043F90(&qword_100059288, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v14 = sub_100046B00();
    long long v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
  }
  else
  {
    char v14 = 0;
  }
  return v14 & 1;
}

Swift::Int sub_100043A94()
{
  return sub_100046F50();
}

unint64_t sub_100043B20()
{
  return 0xD000000000000045;
}

uint64_t sub_100043B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_100043BAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);

  return v6(v4, a1, v5);
}

uint64_t sub_100043C1C()
{
  return sub_1000436DC();
}

uint64_t sub_100043C34()
{
  return sub_1000437F0();
}

uint64_t sub_100043C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100043F90(&qword_10005AA28, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);

  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t sub_100043CC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100043678();
  uint64_t v3 = sub_100046A90();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v2, v3);
}

uint64_t sub_100043D38(uint64_t a1)
{
  uint64_t v2 = sub_100043F90(&qword_10005A800, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);

  return Message.debugDescription.getter(a1, v2);
}

uint64_t sub_100043DA8()
{
  sub_100043F90(&qword_10005A800, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);

  return sub_1000469D0();
}

uint64_t sub_100043E28()
{
  return sub_100043F90(&qword_10005AA10, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
}

uint64_t type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent()
{
  uint64_t result = qword_10005AA88;
  if (!qword_10005AA88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100043EB8()
{
  return sub_100043F90(&qword_10005A800, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
}

uint64_t sub_100043F00()
{
  return sub_100043F90(&qword_10005AA18, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
}

uint64_t sub_100043F48()
{
  return sub_100043F90(&qword_10005AA20, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_SafariBrowsingAssistant_SafariBrowsingAssistantEvent);
}

uint64_t sub_100043F90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100043FD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_100046870();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_1000440BC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_100046870();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100044134(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100046870();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *sub_1000441CC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *sub_100044260(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1000442DC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100046870();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_100044368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004437C);
}

uint64_t sub_10004437C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100046870();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 20);
    return sub_100004B4C(v9, a2, v8);
  }
}

uint64_t sub_100044404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100044418);
}

void *sub_100044418(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100046870();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 20);
    return (void *)sub_100004938(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_100044498()
{
  uint64_t result = sub_100046870();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100044534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[18] = a4;
  v5[19] = v4;
  unsigned char v5[16] = a2;
  v5[17] = a3;
  v5[15] = a1;
  return _swift_task_switch(sub_10004455C, 0, 0);
}

uint64_t sub_10004455C()
{
  unint64_t v1 = (void *)v0[19];
  Class isa = sub_1000466C0().super.isa;
  v0[20] = isa;
  NSString v3 = sub_100046B10();
  v0[21] = v3;
  NSString v4 = sub_100046B10();
  v0[22] = v4;
  v0[2] = v0;
  v0[3] = sub_1000446BC;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_10004489C;
  v0[13] = &unk_100055DB8;
  v0[14] = v5;
  [v1 reportDataPlatformBatchedEvent:isa forBundleID:v3 ofSchema:v4 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000446BC()
{
  sub_1000352B4();
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v2 + 184) = v1;
  if (v1) {
    NSString v3 = sub_100044818;
  }
  else {
    NSString v3 = sub_1000447A8;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000447A8()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v2 = *(void **)(v0 + 160);

  NSString v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100044818()
{
  uint64_t v1 = (void *)v0[22];
  NSString v3 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_willThrow();

  NSString v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10004489C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = a2;
    return sub_1000448FC(v2, (uint64_t)v3);
  }
  else
  {
    return j__swift_continuation_throwingResume();
  }
}

uint64_t sub_1000448FC(uint64_t a1, uint64_t a2)
{
  sub_10000488C(&qword_10005A428);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;

  return _swift_continuation_throwingResumeWithError(a1, v4);
}

uint64_t sub_100044964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100044A24;
  return sub_100044534(a1, a2, a3, a4);
}

uint64_t sub_100044A24()
{
  sub_1000352B4();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100044AF4()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_100045E70(v2, (uint64_t)v5);
  os_unfair_lock_unlock(v3);
  return v5[1];
}

uint64_t sub_100044B58()
{
  sub_100044BC0();
  sub_10003B964((void *)(v0 + 24), *(void *)(v0 + 48));
  sub_100044C20();
  sub_10003BDA8();

  return swift_bridgeObjectRelease();
}

void sub_100044BC0()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_100045F88(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_100044C20()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 40);
  os_unfair_lock_lock(v1);
  sub_100045D28(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_100044C80()
{
  swift_release();
  sub_1000348F8(v0 + 24);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100044CB0()
{
  sub_100044C80();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for SBASyncedStreamPosition()
{
  return self;
}

uint64_t sub_100044D08()
{
  return sub_100044B58();
}

uint64_t sub_100044D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100046780();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_100046DB0(26);
  swift_bridgeObjectRelease();
  strcpy((char *)v9, "{timestamp: ");
  BYTE5(v9[1]) = 0;
  HIWORD(v9[1]) = -5120;
  sub_100046710();
  sub_100035674();
  v10._countAndFlagsBits = sub_100046E90();
  sub_100046B70(v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11._countAndFlagsBits = 0x3A7865646E69202CLL;
  v11._object = (void *)0xE900000000000020;
  sub_100046B70(v11);
  v8[1] = a2;
  v12._countAndFlagsBits = sub_100046E90();
  sub_100046B70(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 125;
  v13._object = (void *)0xE100000000000000;
  sub_100046B70(v13);
  return v9[0];
}

BOOL sub_100044ECC(char a1, char a2)
{
  return a1 == a2;
}

void sub_100044EDC(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_100044F04(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_100046EB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
    if (v6 || (sub_100046EB0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_100046EB0();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_100045058()
{
  return 3;
}

Swift::Int sub_100045060(unsigned __int8 a1)
{
  return sub_100046F50();
}

uint64_t sub_1000450A8()
{
  return 0;
}

uint64_t sub_1000450B4(char a1)
{
  if (!a1) {
    return 0x6E6F6973726576;
  }
  if (a1 == 1) {
    return 0x6D617473656D6974;
  }
  return 0x7865646E69;
}

BOOL sub_10004510C(char *a1, char *a2)
{
  return sub_100044ECC(*a1, *a2);
}

Swift::Int sub_100045118()
{
  return sub_100045060(*v0);
}

void sub_100045120(uint64_t a1)
{
  sub_100044EDC(a1, *v1);
}

Swift::Int sub_100045128()
{
  Swift::UInt v1 = *v0;
  sub_100046F30();
  sub_100046F40(v1);
  return sub_100046F50();
}

uint64_t sub_10004516C()
{
  return sub_1000450B4(*v0);
}

uint64_t sub_100045174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100044F04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10004519C()
{
  return sub_1000450A8();
}

uint64_t sub_1000451BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100045058();
  *a1 = result;
  return result;
}

uint64_t sub_1000451E4(uint64_t a1)
{
  unint64_t v2 = sub_100045F9C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100045220(uint64_t a1)
{
  unint64_t v2 = sub_100045F9C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10004525C(void *a1)
{
  uint64_t v3 = sub_10000488C(&qword_10005AC38);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  BOOL v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10003B964(a1, a1[3]);
  sub_100045F9C();
  sub_100046F70();
  v8[15] = 0;
  sub_100046E70();
  if (!v1)
  {
    v8[14] = 1;
    sub_100046E60();
    v8[13] = 2;
    sub_100046E80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_1000453FC(void *a1)
{
  uint64_t v2 = sub_10000488C(&qword_10005AC28);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003B964(a1, a1[3]);
  sub_100045F9C();
  sub_100046F60();
  char v12 = 0;
  sub_100046E40();
  char v11 = 1;
  sub_100046E30();
  double v8 = v7;
  char v10 = 2;
  sub_100046E50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_1000348F8((uint64_t)a1);
  return v8;
}

void sub_1000455CC(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v6 = sub_1000453FC(a1);
  if (!v2)
  {
    *(void *)a2 = v4;
    *(double *)(a2 + 8) = v6;
    *(void *)(a2 + 16) = v5;
  }
}

uint64_t sub_100045600(void *a1)
{
  return sub_10004525C(a1);
}

uint64_t sub_100045624()
{
  return sub_100044D2C(*v0, v0[2]);
}

uint64_t sub_100045634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100046B60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v39 = 1;
  if (!a2)
  {
    double v16 = 0.0;
    sub_10003CF44();
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  sub_100046B50();
  uint64_t v10 = sub_100046B30();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Swift::String v13 = &SBABiomeEventSource;
  char v14 = &unk_10004B000;
  if (v12 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    char v15 = v39;
    double v16 = 0.0;
    sub_10003CF44();
    uint64_t v17 = 0;
    a2 = 0;
    if (v15) {
      goto LABEL_17;
    }
  }
  else
  {
    if (qword_100058CB8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100046AC0();
    uint64_t v19 = sub_100004C10(v18, (uint64_t)qword_100061EF8);
    swift_bridgeObjectRetain_n();
    v37[1] = v19;
    uint64_t v20 = sub_100046AA0();
    os_log_type_t v21 = sub_100046D30();
    if (os_log_type_enabled(v20, v21))
    {
      double v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v37[0] = v3;
      v38[0] = v23;
      *(_DWORD *)double v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_1000422B4(a1, a2, v38);
      sub_1000462CC(v24);
      Swift::String v13 = &SBABiomeEventSource;
      char v14 = (void *)&unk_10004B000;
      sub_100046D80();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Found raw bookmark - %s", v22, 0xCu);
      swift_arrayDestroy();
      uint64_t v3 = v37[0];
      sub_10003BAF0();
      sub_10003BAF0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_100046600();
    swift_allocObject();
    sub_1000465F0();
    sub_100045FE8();
    sub_1000465E0();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v17 = v38[0];
    a2 = v38[2];
    char v39 = 0;
    double v25 = floor(*(double *)&v38[1] * 1000.0);
    sub_100042DE8(v10, v12);
    double v16 = v25 / 1000.0;
  }
  if (v13[45].ivar_lyt != (void *)-1) {
    swift_once();
  }
  uint64_t v26 = sub_100046AC0();
  sub_100004C10(v26, (uint64_t)qword_100061EF8);
  uint64_t v27 = sub_100046AA0();
  os_log_type_t v28 = sub_100046D50();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    v38[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v29 = v14[258];
    uint64_t v30 = sub_100044D2C(v17, a2);
    uint64_t v32 = sub_1000422B4(v30, v31, v38);
    sub_1000462CC(v32);
    sub_100046D80();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Starting state - %s", v29, 0xCu);
    swift_arrayDestroy();
    sub_10003BAF0();
    sub_10003BAF0();
  }

LABEL_17:
  if (v39) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v17;
  }
  if (v39)
  {
    double v16 = 0.0;
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = a2;
  }
  sub_10000488C(&qword_10005AC40);
  uint64_t v35 = swift_allocObject();
  *(_DWORD *)(v35 + 40) = 0;
  *(void *)(v35 + 16) = v33;
  *(double *)(v35 + 24) = v16;
  *(void *)(v35 + 32) = v34;
  *(void *)(v3 + 16) = v35;
  return v3;
}

uint64_t sub_100045D28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = sub_100046B60();
  __chkstk_darwin(v3 - 8);
  sub_100046630();
  swift_allocObject();
  sub_100046620();
  sub_100045F3C();
  uint64_t v4 = sub_100046610();
  if (v1)
  {
    swift_release();
    uint64_t result = swift_errorRelease();
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = v4;
    unint64_t v10 = v5;
    swift_release();
    sub_100046B50();
    uint64_t v7 = sub_100046B40();
    uint64_t v8 = v11;
    uint64_t result = sub_10001C274(v9, v10);
  }
  *a1 = v7;
  a1[1] = v8;
  return result;
}

double sub_100045E70@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = *(double *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *(double *)a2 = result;
  *(void *)(a2 + 8) = v3;
  return result;
}

uint64_t type metadata accessor for SBAAtomicStreamPosition()
{
  return self;
}

__n128 initializeBufferWithCopyOfBuffer for SBAAtomicStreamPosition.State(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SBAAtomicStreamPosition.State(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SBAAtomicStreamPosition.State(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SBAAtomicStreamPosition.State()
{
  return &type metadata for SBAAtomicStreamPosition.State;
}

void sub_100045F18()
{
}

unint64_t sub_100045F3C()
{
  unint64_t result = qword_10005AC20;
  if (!qword_10005AC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC20);
  }
  return result;
}

double sub_100045F88(uint64_t a1)
{
  double result = *(double *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  *(double *)(a1 + 8) = result;
  *(void *)(a1 + 16) = v3;
  return result;
}

unint64_t sub_100045F9C()
{
  unint64_t result = qword_10005AC30;
  if (!qword_10005AC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC30);
  }
  return result;
}

unint64_t sub_100045FE8()
{
  unint64_t result = qword_10005AC48;
  if (!qword_10005AC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC48);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for SBAAtomicStreamPosition.State.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SBAAtomicStreamPosition.State.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SBAAtomicStreamPosition.State.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x100046194);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_1000461BC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000461C4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SBAAtomicStreamPosition.State.CodingKeys()
{
  return &type metadata for SBAAtomicStreamPosition.State.CodingKeys;
}

unint64_t sub_1000461E0()
{
  unint64_t result = qword_10005AC50;
  if (!qword_10005AC50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC50);
  }
  return result;
}

unint64_t sub_100046230()
{
  unint64_t result = qword_10005AC58;
  if (!qword_10005AC58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005AC58);
  }
  return result;
}

unint64_t sub_100046280()
{
  unint64_t result = qword_10005AC60[0];
  if (!qword_10005AC60[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10005AC60);
  }
  return result;
}

uint64_t sub_1000462CC(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

ValueMetadata *type metadata accessor for TaskCancellationTracker()
{
  return &type metadata for TaskCancellationTracker;
}

uint64_t sub_1000462F0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10004639C()
{
  sub_100044AF4();
  oslog = sub_100046AA0();
  os_log_type_t v0 = sub_100046D50();
  if (os_log_type_enabled(oslog, v0))
  {
    unint64_t v1 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v1 = 134349056;
    sub_100046D80();
    _os_log_impl((void *)&_mh_execute_header, oslog, v0, "Ending Bookmark - %{public}f", v1, 0xCu);
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_1000464A8()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 104));
  sub_1000348F8(v0 + *(void *)(*(void *)v0 + 112));
  sub_1000348F8(v0 + *(void *)(*(void *)v0 + 120));
  sub_1000348F8(v0 + *(void *)(*(void *)v0 + 128));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_100046574()
{
  sub_1000464A8();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for SBADataProcessorActor()
{
  return sub_1000349DC();
}

uint64_t sub_1000465B8()
{
  return v0;
}

uint64_t sub_1000465C4()
{
  return sub_1000465B8();
}

uint64_t sub_1000465E0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_1000465F0()
{
  return JSONDecoder.init()();
}

uint64_t sub_100046600()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_100046610()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_100046620()
{
  return JSONEncoder.init()();
}

uint64_t sub_100046630()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_100046640()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_100046650()
{
  return __DataStorage._length.getter();
}

uint64_t sub_100046660()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_100046670()
{
  return DateComponents.nanosecond.setter();
}

uint64_t sub_100046680()
{
  return DateComponents.date.getter();
}

uint64_t sub_100046690()
{
  return DateComponents.second.setter();
}

uint64_t sub_1000466A0()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_1000466B0()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_1000466C0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000466D0(NSDataBase64EncodingOptions options)
{
  return Data.base64EncodedString(options:)(options)._countAndFlagsBits;
}

uint64_t sub_1000466E0()
{
  return static Data.== infix(_:_:)();
}

uint64_t sub_1000466F0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100046700()
{
  return Data.count.getter();
}

uint64_t sub_100046710()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_100046720()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_100046730()
{
  return Date.description.getter();
}

uint64_t sub_100046740()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_100046750()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100046760()
{
  return static Date.now.getter();
}

uint64_t sub_100046770()
{
  return Date.init()();
}

uint64_t sub_100046780()
{
  return type metadata accessor for Date();
}

uint64_t sub_100046790()
{
  return type metadata accessor for Calendar.Identifier();
}

uint64_t sub_1000467A0()
{
  return Calendar.init(identifier:)();
}

uint64_t sub_1000467B0()
{
  return Calendar.dateComponents(in:from:)();
}

uint64_t sub_1000467C0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_1000467D0()
{
  return TimeZone.init(secondsFromGMT:)();
}

uint64_t sub_1000467E0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_1000467F0()
{
  return static AppExtension.main()();
}

uint64_t sub_100046800()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100046810()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100046840()
{
  return ClientType.rawValue.getter();
}

uint64_t sub_100046850()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t sub_100046860()
{
  return UnknownStorage.init()();
}

uint64_t sub_100046870()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t sub_100046880()
{
  return BinaryDecodingOptions.init()();
}

uint64_t sub_100046890()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t sub_1000468A0()
{
  return _MessageImplementationBase._protobuf_generated_isEqualTo(other:)();
}

uint64_t sub_1000468D0()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t sub_1000468E0()
{
  return dispatch thunk of Decoder.handleConflictingOneOf()();
}

uint64_t sub_1000468F0()
{
  return dispatch thunk of Decoder.decodeSingularBoolField(value:)();
}

uint64_t sub_100046900()
{
  return dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
}

uint64_t sub_100046920()
{
  return dispatch thunk of Decoder.decodeSingularInt64Field(value:)();
}

uint64_t sub_100046940()
{
  return dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
}

uint64_t sub_100046950()
{
  return dispatch thunk of Decoder.decodeSingularUInt64Field(value:)();
}

uint64_t sub_100046960()
{
  return dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
}

uint64_t sub_100046970()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t sub_100046980()
{
  return Message.isInitialized.getter();
}

uint64_t sub_100046990()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t sub_1000469A0()
{
  return Message.serializedData(partial:)();
}

uint64_t sub_1000469C0()
{
  return Message.textFormatString()()._countAndFlagsBits;
}

uint64_t sub_1000469D0()
{
  return Message.hash(into:)();
}

uint64_t sub_1000469E0()
{
  return dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)();
}

uint64_t sub_100046A00()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t sub_100046A10()
{
  return dispatch thunk of Visitor.visitSingularInt64Field(value:fieldNumber:)();
}

uint64_t sub_100046A20()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t sub_100046A30()
{
  return dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)();
}

uint64_t sub_100046A40()
{
  return dispatch thunk of Visitor.visitSingularUInt64Field(value:fieldNumber:)();
}

uint64_t sub_100046A50()
{
  return dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)();
}

uint64_t sub_100046A60()
{
  return dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
}

uint64_t sub_100046A70()
{
  return type metadata accessor for _NameMap.NameDescription();
}

uint64_t sub_100046A80()
{
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t sub_100046A90()
{
  return type metadata accessor for _NameMap();
}

uint64_t sub_100046AA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100046AB0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100046AC0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_100046AD0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100046AE0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_100046AF0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100046B00()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_100046B10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100046B20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100046B30()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_100046B40()
{
  return String.init(data:encoding:)();
}

uint64_t sub_100046B50()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_100046B60()
{
  return type metadata accessor for String.Encoding();
}

void sub_100046B70(Swift::String a1)
{
}

Swift::Int sub_100046B80()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100046B90()
{
  return Sequence.forEach(_:)();
}

NSArray sub_100046BA0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100046BB0()
{
  return Array.startIndex.getter();
}

uint64_t sub_100046BC0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100046BD0()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t sub_100046BE0()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t sub_100046BF0()
{
  return static Array._allocateUninitialized(_:)();
}

BOOL sub_100046C00()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t sub_100046C10()
{
  return Array.count.getter();
}

uint64_t sub_100046C20()
{
  return Array.append(_:)();
}

uint64_t sub_100046C30()
{
  return Array.endIndex.getter();
}

void sub_100046C40(Swift::Int *after)
{
}

uint64_t sub_100046C50()
{
  return type metadata accessor for Array();
}

uint64_t sub_100046C60()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100046C80()
{
  return static Task<>.checkCancellation()();
}

uint64_t sub_100046C90()
{
  return type metadata accessor for UnsafeContinuation();
}

NSNumber sub_100046CA0()
{
  return Double._bridgeToObjectiveC()();
}

NSNumber sub_100046CB0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100046CC0()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100046CD0()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100046CE0()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100046CF0()
{
  return Int.hashValue.getter();
}

uint64_t sub_100046D00()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_100046D10()
{
  return RangeReplaceableCollection.removeFirst()();
}

uint64_t sub_100046D20()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100046D30()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100046D40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100046D50()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100046D60()
{
  return type metadata accessor for Optional();
}

NSNumber sub_100046D70()
{
  return UInt._bridgeToObjectiveC()();
}

uint64_t sub_100046D80()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100046D90()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100046DA0()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_100046DB0(Swift::Int a1)
{
}

uint64_t sub_100046DC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100046DD0()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100046DE0()
{
  return _StringObject.sharedUTF8.getter();
}

BOOL sub_100046DF0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_100046E00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100046E10()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100046E20()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_100046E30()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046E40()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046E50()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100046E60()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100046E70()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100046E80()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100046E90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100046EA0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_100046EB0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100046ED0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100046EE0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100046EF0()
{
  return Error._code.getter();
}

uint64_t sub_100046F00()
{
  return Error._domain.getter();
}

uint64_t sub_100046F10()
{
  return Error._userInfo.getter();
}

uint64_t sub_100046F20()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_100046F30()
{
  return Hasher.init(_seed:)();
}

void sub_100046F40(Swift::UInt a1)
{
}

Swift::Int sub_100046F50()
{
  return Hasher._finalize()();
}

uint64_t sub_100046F60()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100046F70()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}