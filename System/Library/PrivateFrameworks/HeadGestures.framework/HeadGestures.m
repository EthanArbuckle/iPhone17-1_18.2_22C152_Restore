id HGSetTemporaryDirectorySuffix()
{
  NSObject *v0;

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v0 = _HGObjCLoggingFacility((uint64_t)kHGObjCLogCategoryFramework[0]);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      HGSetTemporaryDirectorySuffix_cold_1(v0);
    }
  }
  return NSTemporaryDirectory();
}

id HGGetTemporaryRawDataDirectory()
{
  v0 = NSTemporaryDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"RawData"];

  return v1;
}

id HGGetTemporaryNotificationDataDirectory()
{
  v0 = NSTemporaryDirectory();
  v1 = [v0 stringByAppendingPathComponent:@"NotificationData"];

  return v1;
}

id _HGObjCLoggingFacility(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___HGObjCLoggingFacility_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_HGObjCLoggingFacility_onceToken[0] != -1) {
    dispatch_once(_HGObjCLoggingFacility_onceToken, block);
  }
  v1 = (void *)_HGObjCLoggingFacility_oslog;
  return v1;
}

double sub_250BDBAB4()
{
  if ((*(unsigned char *)(v0 + 40) & 1) == 0) {
    return *(double *)(v0 + 32);
  }
  double result = (1.0 - *(double *)(v0 + 24)) / *(double *)(v0 + 16);
  *(double *)(v0 + 32) = result;
  *(unsigned char *)(v0 + 40) = 0;
  return result;
}

double sub_250BDBAE0()
{
  v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume);
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume
                 + 8) & 1) == 0)
    return *(double *)v1;
  double result = *(double *)(v0 + 24);
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

void sub_250BDBB0C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v37 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  v9 = (char *)&v35 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  v12 = (char *)&v35 - v11;
  MEMORY[0x270FA5388](v10);
  v14 = (char *)&v35 - v13;
  uint64_t v15 = sub_250C1D2F8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v21 = (char *)&v35 - v20;
  sub_250C1D2C8();
  if (*(unsigned char *)(v2 + 56))
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
LABEL_5:
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    uint64_t v24 = v37;
LABEL_6:
    uint64_t v25 = OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
    *(void *)(v2
              + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume) = *(void *)(v2 + 24);
    goto LABEL_7;
  }
  v36 = v6;
  uint64_t v22 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_250BDDB40(v22, (uint64_t)v14);
  v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v22) = v35(v14, 1, v15);
  sub_250BDDC78((uint64_t)v14);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  BOOL v23 = v22 == 1;
  v6 = v36;
  if (v23) {
    goto LABEL_5;
  }
  uint64_t v27 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_250BDDB40(v27, (uint64_t)v12);
  int v28 = v35(v12, 1, v15);
  if (v28 == 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  sub_250C1D2D8();
  double v30 = v29;
  v31 = *(void (**)(char *, uint64_t))(v16 + 8);
  v31(v19, v15);
  v31(v12, v15);
  uint64_t v24 = v37;
  if (v30 > 0.8) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(v2 + 56))
  {
LABEL_23:
    __break(1u);
    JUMPOUT(0x250BDBF64);
  }
  uint64_t v32 = *(void *)(v2 + 48);
  switch(v37)
  {
    case 1:
      if (v32 != 2) {
        goto LABEL_6;
      }
      break;
    case 2:
      if (v32 != 1) {
        goto LABEL_6;
      }
      break;
    case 3:
      if (v32 != 4) {
        goto LABEL_6;
      }
      break;
    case 4:
      if (v32 != 3) {
        goto LABEL_6;
      }
      break;
    default:
      goto LABEL_6;
  }
  double v33 = sub_250BDBAE0();
  double v34 = v33 + sub_250BDBAB4();
  if (v34 > 1.0) {
    double v34 = 1.0;
  }
  uint64_t v25 = OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
  *(double *)(v2
            + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume) = v34;
LABEL_7:
  *(unsigned char *)(v2 + v25 + 8) = 0;
  *(void *)(v2 + 48) = v24;
  *(unsigned char *)(v2 + 56) = 0;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v9, v21, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v15);
  sub_250BDDBA8((uint64_t)v9, (uint64_t)v6);
  uint64_t v26 = v2 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  swift_beginAccess();
  sub_250BDDC10((uint64_t)v6, v26);
  swift_endAccess();
  sub_250BDBAE0();
}

uint64_t sub_250BDBF74()
{
  sub_250BDDC78(v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime);
  return swift_deallocClassInstance();
}

uint64_t sub_250BDBFD8()
{
  return type metadata accessor for HGPartialGestureAudioProgress(0);
}

uint64_t type metadata accessor for HGPartialGestureAudioProgress(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF8F90);
}

void sub_250BDC000()
{
  sub_250BDC0AC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_250BDC0AC()
{
  if (!qword_269AF8FA0)
  {
    sub_250C1D2F8();
    unint64_t v0 = sub_250C1DA38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269AF8FA0);
    }
  }
}

uint64_t sub_250BDC104()
{
  if (qword_269AF8F78 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v2 = (void *)sub_250C1D6A8();
  objc_msgSend(v1, sel_doubleForKey_, v2);
  uint64_t v4 = v3;

  *(void *)(v0 + 16) = v4;
  uint64_t v5 = *(void **)(qword_269AFCA30 + 16);
  v6 = (void *)sub_250C1D6A8();
  objc_msgSend(v5, sel_doubleForKey_, v6);
  uint64_t v8 = v7;

  *(void *)(v0 + 24) = v8;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 40) = 1;
  *(void *)(v0 + 48) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  uint64_t v9 = v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress_lastPartialGestureTime;
  uint64_t v10 = sub_250C1D2F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC12HeadGestures29HGPartialGestureAudioProgress____lazy_storage___lastPartialGestureVolume;
  *(void *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 8) = 1;
  return v0;
}

uint64_t sub_250BDC274()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  swift_release();
  return v1;
}

id *sub_250BDC2E8()
{
  unsigned __int8 v1 = v0;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250C1D3A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269AFCA38);
  uint64_t v3 = sub_250C1D388();
  os_log_type_t v4 = sub_250C1D938();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_250BD9000, v3, v4, "[HGAudioPlayer] dealloc", v5, 2u);
    MEMORY[0x2533853C0](v5, -1, -1);
  }

  (*((void (**)(void))*v1 + 33))();
  swift_release();
  swift_release();
  v6 = (char *)v1 + OBJC_IVAR____TtC12HeadGestures13HGAudioPlayer__isFreeToStop;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  return v1;
}

uint64_t sub_250BDC460()
{
  sub_250BDC2E8();
  return swift_deallocClassInstance();
}

uint64_t sub_250BDC4B8()
{
  return type metadata accessor for HGAudioPlayer(0);
}

uint64_t type metadata accessor for HGAudioPlayer(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF8FB0);
}

uint64_t sub_250BDC4E0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_250BDC518()
{
  sub_250BDDFD4(319, (unint64_t *)&qword_269AF8FC0, MEMORY[0x263F8D4F8], MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_250BDC604(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9070);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v24 = v8;
  uint64_t v25 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9078);
  uint64_t v28 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9080);
  uint64_t v29 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = a1;
  uint64_t v16 = *(void **)(v2 + 16);
  swift_beginAccess();
  id v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  sub_250C1D438();
  swift_endAccess();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9088);
  sub_250BDDD60(&qword_269AF9090, &qword_269AF9088);
  sub_250BDDD60(&qword_269AF9098, &qword_269AF9068);
  sub_250C1D4C8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_250BDD9EC;
  *(void *)(v18 + 24) = v2;
  sub_250BDDD60(&qword_269AF90A0, &qword_269AF9070);
  swift_retain();
  uint64_t v19 = v24;
  sub_250C1D4F8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v19);
  sub_250BDDD60(&qword_269AF90A8, &qword_269AF9078);
  swift_retain();
  uint64_t v20 = v26;
  sub_250C1D4B8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v20);
  sub_250BDDD60(&qword_269AF90B0, &qword_269AF9080);
  uint64_t v21 = v27;
  uint64_t v22 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v21);
  return v22;
}

id sub_250BDCAEC@<X0>(id *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_250C1D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250C1D5F8();
  uint64_t v35 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v36 = *a1;
  uint64_t v13 = (char *)*(id *)(a2 + 16);
  id v14 = objc_msgSend(v36, sel_headGesture);
  uint64_t v15 = &v13[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture];
  swift_beginAccess();
  uint64_t v16 = *(void *)v15;
  swift_bridgeObjectRetain();

  if (!*(void *)(v16 + 16)
    || ((unint64_t)v14 >= 4 ? (uint64_t v17 = 4) : (uint64_t v17 = (uint64_t)v14), v18 = sub_250C1B034(v17), (v19 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_15;
  }
  char v20 = *(unsigned char *)(*(void *)(v16 + 56) + v18);
  swift_bridgeObjectRelease();
  if (v20)
  {
LABEL_10:
    uint64_t v34 = *(void *)(a2 + 24);
    uint64_t v28 = swift_allocObject();
    id v29 = v36;
    *(void *)(v28 + 16) = a2;
    *(void *)(v28 + 24) = v29;
    aBlock[4] = sub_250BDD93C;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250BFD1B4;
    aBlock[3] = &block_descriptor;
    uint64_t v30 = _Block_copy(aBlock);
    swift_retain();
    id v31 = v36;
    sub_250C1D5E8();
    uint64_t v37 = MEMORY[0x263F8EE78];
    sub_250BDDD18((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
    sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
    sub_250C1DA88();
    MEMORY[0x2533847D0](0, v12, v9, v30);
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v10);
    swift_release();
    goto LABEL_11;
  }
  uint64_t v21 = (char *)*(id *)(a2 + 16);
  unint64_t v22 = sub_250C00734((unint64_t)objc_msgSend(v36, sel_headGesturePart));
  BOOL v23 = &v21[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture];
  swift_beginAccess();
  uint64_t v24 = *(void *)v23;
  swift_bridgeObjectRetain();

  if (!*(void *)(v24 + 16) || (uint64_t v25 = sub_250C1B034(v22), (v26 & 1) == 0))
  {
LABEL_15:
    id result = (id)swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  int v27 = *(unsigned __int8 *)(*(void *)(v24 + 56) + v25);
  swift_bridgeObjectRelease();
  if (v27 == 1) {
    goto LABEL_10;
  }
LABEL_11:
  id v32 = v36;
  *a3 = v36;
  return v32;
}

void type metadata accessor for HGHeadGesture(uint64_t a1)
{
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
}

void type metadata accessor for AVAudio3DMixingRenderingAlgorithm(uint64_t a1)
{
}

void type metadata accessor for HGHeadGesturePart(uint64_t a1)
{
}

uint64_t sub_250BDCFB4(uint64_t a1, uint64_t a2)
{
  return sub_250BDD0AC(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_250BDCFCC()
{
  sub_250C1D6D8();
  sub_250C1D748();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250BDD020()
{
  sub_250C1D6D8();
  sub_250C1DD78();
  sub_250C1D748();
  uint64_t v0 = sub_250C1DD98();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_250BDD094(uint64_t a1, uint64_t a2)
{
  return sub_250BDD0AC(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_250BDD0AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_250C1D6D8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_250BDD0F0(uint64_t a1, id *a2)
{
  uint64_t result = sub_250C1D6B8();
  *a2 = 0;
  return result;
}

uint64_t sub_250BDD168(uint64_t a1, id *a2)
{
  char v3 = sub_250C1D6C8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_250BDD1E8@<X0>(uint64_t *a1@<X8>)
{
  sub_250C1D6D8();
  uint64_t v2 = sub_250C1D6A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_250BDD22C()
{
  return sub_250C1D378();
}

uint64_t sub_250BDD278()
{
  return sub_250C1D368();
}

uint64_t sub_250BDD2D0()
{
  return sub_250C1DD98();
}

void *sub_250BDD338@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_250BDD348(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_250BDD354(void *a1, void *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_250BDD368@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_250BDD378(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_250BDD400()
{
  uint64_t v0 = sub_250C1D6D8();
  uint64_t v2 = v1;
  if (v0 == sub_250C1D6D8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_250C1DCF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_250BDD48C()
{
  swift_getWitnessTable();
  return sub_250C1D358();
}

uint64_t sub_250BDD4F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_250C1D6A8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_250BDD540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_250C1D6D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_250BDD56C(uint64_t a1)
{
  uint64_t v2 = sub_250BDDD18(&qword_269AF9128, type metadata accessor for MLModelMetadataKey);
  uint64_t v3 = sub_250BDDD18(&qword_269AF9130, type metadata accessor for MLModelMetadataKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_250BDD628(void *a1)
{
  uint64_t v2 = v1;
  id v14 = a1;
  uint64_t v3 = sub_250C1D998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D968();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_250C1D5F8();
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v13 = sub_250BDDCD8();
  sub_250C1D5E8();
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_250BDDD18(&qword_269AF90C8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90D0);
  sub_250BDDD60(&qword_269AF90D8, &qword_269AF90D0);
  sub_250C1DA88();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v3);
  *(void *)(v1 + 24) = sub_250C1D9C8();
  *(void *)(v1 + 32) = 0;
  *(_DWORD *)(v1 + 40) = 1028443341;
  type metadata accessor for HGPartialGestureAudioProgress(0);
  uint64_t v9 = swift_allocObject();
  sub_250BDC104();
  *(void *)(v2 + 48) = v9;
  uint64_t v10 = v14;
  *(void *)(v2 + 16) = v14;
  swift_beginAccess();
  char v15 = 0;
  id v11 = v10;
  sub_250C1D428();
  swift_endAccess();
  return v2;
}

uint64_t sub_250BDD8FC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250BDD93C()
{
  return (*(uint64_t (**)(void))(**(void **)(v0 + 16) + 288))(*(void *)(v0 + 24));
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_250BDD9EC(unsigned __int8 a1, unsigned __int8 a2)
{
  char v3 = a1 & a2;
  uint64_t v4 = *v2;
  if (a1 & a2) {
    (*(void (**)(void))(v4 + 272))();
  }
  else {
    (*(void (**)(uint64_t (*)(), void))(v4 + 280))(nullsub_1, 0);
  }
  return v3 & 1;
}

uint64_t sub_250BDDA7C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250BDDAB4@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v2 + 16))(*a1, a1[1]);
  *a2 = result & 1;
  return result;
}

uint64_t sub_250BDDAF4()
{
  return (*(uint64_t (**)(uint64_t (*)(), void))(*(void *)v0 + 280))(nullsub_1, 0);
}

uint64_t sub_250BDDB40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BDDBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BDDC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BDDC78(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_250BDDCD8()
{
  unint64_t result = qword_269AF90C0;
  if (!qword_269AF90C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF90C0);
  }
  return result;
}

uint64_t sub_250BDDD18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250BDDD60(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
}

void type metadata accessor for CFNumber(uint64_t a1)
{
}

void type metadata accessor for CFBoolean(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_250BDDE44()
{
  return sub_250BDDD18(&qword_269AF9100, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_250BDDE8C()
{
  return sub_250BDDD18(&qword_269AF9108, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_250BDDED4()
{
  return sub_250BDDD18(&qword_269AF9110, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_250BDDF1C()
{
  return sub_250BDDD18(&qword_269AF9118, type metadata accessor for CFString);
}

uint64_t sub_250BDDF64()
{
  return sub_250BDDD18(&qword_269AF9120, type metadata accessor for CFString);
}

void type metadata accessor for e5rt_error_code_t(uint64_t a1)
{
}

void sub_250BDDFD4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_250BDE02C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9140);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9148);
  uint64_t v6 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9150);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v19 = v9;
  uint64_t v20 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9158);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9160);
  sub_250BDDD60(&qword_269AF9168, &qword_269AF9158);
  sub_250C1D568();
  swift_release();
  sub_250C1D3B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9170);
  sub_250BDDD60(&qword_269AF9178, &qword_269AF9140);
  sub_250BDDD60(&qword_269AF9180, &qword_269AF9170);
  sub_250C1D578();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_250BDDD60(&qword_269AF9188, &qword_269AF9148);
  sub_250BDE908();
  uint64_t v13 = v18;
  sub_250C1D5A8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v13);
  sub_250BDDD60(&qword_269AF9198, &qword_269AF9150);
  uint64_t v14 = v19;
  uint64_t v15 = sub_250C1D548();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v12, v14);
  uint64_t v21 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF91A0);
  sub_250BDDD60(&qword_269AF91A8, &qword_269AF91A0);
  uint64_t v16 = sub_250C1D498();
  swift_release();
  return v16;
}

uint64_t sub_250BDE46C@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  long long v5 = a1[5];
  long long v29 = a1[4];
  long long v30 = v5;
  v31[0] = a1[6];
  long long v6 = v31[0];
  *(_OWORD *)((char *)v31 + 9) = *(long long *)((char *)a1 + 105);
  long long v7 = a1[1];
  long long v25 = *a1;
  long long v26 = v7;
  long long v8 = a1[3];
  long long v27 = a1[2];
  long long v28 = v8;
  *(_OWORD *)((char *)v39 + 9) = *(_OWORD *)((char *)v31 + 9);
  long long v38 = v5;
  v39[0] = v6;
  long long v36 = v8;
  long long v37 = v29;
  long long v34 = v7;
  long long v35 = v27;
  long long v33 = v25;
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  uint64_t v10 = a2 + 16;
  uint64_t v24 = (void *)MEMORY[0x263F8EE78];
  sub_250BDE95C(a2 + 16, (uint64_t)v40);
  sub_250BDE95C((uint64_t)v40, (uint64_t)v41);
  if (sub_250BDE9C4((uint64_t)v41) != 1)
  {
    v31[6] = v41[4];
    v31[7] = v41[5];
    v32[0] = v42[0];
    *(_OWORD *)((char *)v32 + 9) = *(_OWORD *)((char *)v42 + 9);
    v31[2] = v41[0];
    v31[3] = v41[1];
    v31[4] = v41[2];
    v31[5] = v41[3];
    uint64_t v11 = sub_250BF9BC8((uint64_t)&v25, 0.04);
    if (v3)
    {
      sub_250BDE9E0((uint64_t)v22);
      sub_250BDE95C((uint64_t)v22, v10);
      return swift_willThrow();
    }
    sub_250BDE67C((uint64_t)v11);
    uint64_t v9 = v24;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v9 = sub_250BF140C(0, v9[2] + 1, 1, v9);
  }
  unint64_t v14 = v9[2];
  unint64_t v13 = v9[3];
  if (v14 >= v13 >> 1) {
    uint64_t v9 = sub_250BF140C((void *)(v13 > 1), v14 + 1, 1, v9);
  }
  v9[2] = v14 + 1;
  uint64_t v15 = &v9[16 * v14];
  long long v16 = v25;
  long long v17 = v26;
  long long v18 = v28;
  v15[4] = v27;
  v15[5] = v18;
  v15[2] = v16;
  v15[3] = v17;
  long long v19 = v29;
  long long v20 = v30;
  long long v21 = v31[0];
  *(_OWORD *)((char *)v15 + 137) = *(_OWORD *)((char *)v31 + 9);
  v15[7] = v20;
  v15[8] = v21;
  v15[6] = v19;
  v22[4] = v37;
  v22[5] = v38;
  v23[0] = v39[0];
  *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)((char *)v39 + 9);
  v22[0] = v33;
  v22[1] = v34;
  v22[2] = v35;
  v22[3] = v36;
  nullsub_1(v22);
  uint64_t result = sub_250BDE95C((uint64_t)v22, v10);
  *a3 = v9;
  return result;
}

uint64_t sub_250BDE67C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_250BF140C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[16 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[16 * v2] && (unint64_t)v9 < a1 + 32 + (v2 << 7)) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), v2 << 7);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250BDE7C4()
{
  return sub_250C1D7A8();
}

uint64_t sub_250BDE848@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF91B0);
  uint64_t result = swift_dynamicCast();
  if (result) {
    char v5 = v6;
  }
  else {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_250BDE8B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDataRegulator()
{
  return self;
}

uint64_t sub_250BDE8EC@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  return sub_250BDE46C(a1, v2, a2);
}

unint64_t sub_250BDE908()
{
  unint64_t result = qword_269AF9190;
  if (!qword_269AF9190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9190);
  }
  return result;
}

uint64_t sub_250BDE95C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF91C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BDE9C4(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 120);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

double sub_250BDE9E0(uint64_t a1)
{
  *(void *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 120) = 2;
  return result;
}

uint64_t sub_250BDEA04()
{
  return sub_250C1DD98();
}

uint64_t sub_250BDEA4C()
{
  return sub_250C1DD88();
}

uint64_t sub_250BDEA78()
{
  return sub_250C1DD98();
}

unint64_t sub_250BDEABC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_250BE2974(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_250BDEAF0()
{
  if (qword_269AF8F50 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_269AF8F48;
  id v1 = (id)qword_269AF91D8;
  if (v0 != -1) {
    swift_once();
  }
  BOOL v2 = (void *)qword_269AF91D0;
  id v3 = objc_allocWithZone((Class)type metadata accessor for HGConfiguration());
  id v4 = v2;
  id v5 = objc_msgSend(v3, sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, v1, v4, 0);

  qword_269AF91C8 = (uint64_t)v5;
}

id HGConfiguration.__allocating_init(withML:audioFeedbackConfig:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, a1, a2, 0);

  return v5;
}

id static HGConfiguration.defaultConfig.getter()
{
  return sub_250BE1934(&qword_269AF8F40, (void **)&qword_269AF91C8);
}

id sub_250BDECC0()
{
  id v1 = (void **)(v0 + OBJC_IVAR___HGConfigurationInternal_mlConfig);
  swift_beginAccess();
  BOOL v2 = *v1;
  return v2;
}

void sub_250BDED24(void *a1)
{
}

uint64_t (*sub_250BDED30())()
{
  return j_j__swift_endAccess;
}

id sub_250BDEDD8()
{
  id v1 = (void **)(v0 + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  BOOL v2 = *v1;
  return v2;
}

void sub_250BDEE3C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  char v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
}

void sub_250BDEE98(void *a1)
{
}

void sub_250BDEEA4(void *a1, void *a2)
{
  id v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  *id v4 = a1;
}

void sub_250BDEEF4(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = *a1;
  char v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  id v7 = *v6;
  void *v6 = v5;
  id v8 = v5;
}

uint64_t (*sub_250BDEF54())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250BDEFF8()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250BDF08C(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_250BDF0D8())()
{
  return j__swift_endAccess;
}

uint64_t sub_250BDF180()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_singleDelivery);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250BDF214(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___HGConfigurationInternal_singleDelivery);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_250BDF260())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250BDF304()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  return *v1;
}

void sub_250BDF3B4(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  *id v3 = a1;
  sub_250BDF40C();
}

void sub_250BDF40C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  if (*v1 == 1)
  {
    uint64_t v2 = NSUserName();
    uint64_t v3 = sub_250C1D6D8();
    uint64_t v5 = v4;

    if (v3 == 1953460082 && v5 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v6 = sub_250C1DCF8();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        HGSetTemporaryDirectorySuffix();
        if (qword_269AF8F78 != -1) {
          swift_once();
        }
        BOOL v12 = *(void **)(qword_269AFCA30 + 16);
        uint64_t v13 = (void *)sub_250C1D6A8();
        unsigned __int8 v11 = objc_msgSend(v12, sel_BOOLForKey_, v13);

        goto LABEL_14;
      }
    }
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_250C1D3A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
    id v8 = sub_250C1D388();
    os_log_type_t v9 = sub_250C1D948();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_250BD9000, v8, v9, "Raw Data logging will be disabled due to running as root", v10, 2u);
      MEMORY[0x2533853C0](v10, -1, -1);
    }

    unsigned __int8 v11 = 0;
LABEL_14:
    unsigned __int8 *v1 = v11;
  }
}

void (*sub_250BDF61C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_250BDF67C;
}

void sub_250BDF67C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_250BDF40C();
  }
}

id static HGMLConfiguration.defaultMLConfiguration.getter()
{
  return sub_250BE1934(&qword_269AF8F50, (void **)&qword_269AF91D8);
}

id static HGAudioFeedbackConfiguration.defaultAudioConfiguration.getter()
{
  return sub_250BE1934(&qword_269AF8F48, (void **)&qword_269AF91D0);
}

id HGConfiguration.__allocating_init(mlConfig:audioFeedbackConfig:requestPartGestures:)(void *a1, void *a2, char a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_250BE2FA4(a1, a2, a3);

  return v8;
}

id HGConfiguration.init(mlConfig:audioFeedbackConfig:requestPartGestures:)(void *a1, void *a2, char a3)
{
  id v5 = sub_250BE2FA4(a1, a2, a3);

  return v5;
}

id HGConfiguration.init(withML:audioFeedbackConfig:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(v2, sel_initWithMlConfig_audioFeedbackConfig_requestPartGestures_, a1, a2, 0);

  return v5;
}

uint64_t sub_250BDF8C8()
{
  sub_250C1DB08();
  sub_250C1D768();
  swift_beginAccess();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  swift_beginAccess();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  swift_beginAccess();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig);
  swift_beginAccess();
  id v2 = *v1;
  sub_250BE1464();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  return 0;
}

id HGConfiguration.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HGConfiguration.init()()
{
}

id HGConfiguration.__deallocating_deinit(uint64_t a1)
{
  return sub_250BE164C(a1, type metadata accessor for HGConfiguration);
}

id sub_250BDFBD8()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for HGAudioFeedbackConfiguration(0));
  id result = HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(1, 0, 0);
  qword_269AF91D0 = (uint64_t)result;
  return result;
}

id HGAudioFeedbackConfiguration.__allocating_init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(char a1, char a2, int a3)
{
  id v7 = objc_allocWithZone(v3);
  return HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(a1, a2, a3);
}

uint64_t sub_250BDFCD4()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250BDFD68(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_250BDFDB4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250BDFE58()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250BDFEEC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_250BDFF38())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250BE0014()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_250BE00F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_250C1D478();
}

uint64_t sub_250BE0164@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_250BE01E4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_250C1D478();
}

void (*sub_250BE0254(void *a1))(void *a1)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_250C1D458();
  return sub_250BE02E0;
}

void sub_250BE02E0(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_250BE0348()
{
  return swift_endAccess();
}

uint64_t sub_250BE03B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v11 - v7;
  os_log_type_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  sub_250C1D448();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_250BE0524()
{
  return swift_endAccess();
}

uint64_t sub_250BE0588(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  sub_250C1D448();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_250BE06B4(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___HGAudioFeedbackConfigurationInternal__enableWaitingTone;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  sub_250C1D438();
  swift_endAccess();
  return sub_250BE07C4;
}

void sub_250BE07C4(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_250C1D448();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_250C1D448();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t sub_250BE097C()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250BE0A10(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_250BE0A5C())()
{
  return j_j__swift_endAccess;
}

id HGAudioFeedbackConfiguration.init(enableAudioFeedback:enableWaitingTone:audioSessionID:)(char a1, char a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8EE80];
  *(void *)&v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture] = MEMORY[0x263F8EE80];
  *(void *)&v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture] = v6;
  v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode] = 0;
  v3[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback] = a1;
  swift_beginAccess();
  char v12 = a2;
  uint64_t v7 = v3;
  sub_250C1D428();
  swift_endAccess();
  *(_DWORD *)&v7[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID] = a3;

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HGAudioFeedbackConfiguration(0);
  id v8 = objc_msgSendSuper2(&v11, sel_init);
  sub_250BE2984((uint64_t)&unk_2701CCF40, (uint64_t)v8);

  swift_bridgeObjectRelease();
  id v9 = v8;
  sub_250BE2C94((uint64_t)&unk_2701CCF68, (uint64_t)v9);

  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_250BE0C30(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250C1D3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  objc_super v11 = sub_250C1D388();
  os_log_type_t v12 = sub_250C1D958();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v24 = v3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v28[0] = v23;
    *(_DWORD *)uint64_t v13 = 136315394;
    int v25 = a2;
    if (a2) {
      uint64_t v14 = 0x656C62616E45;
    }
    else {
      uint64_t v14 = 0x656C6261736944;
    }
    unint64_t v15 = 0xE700000000000000;
    unint64_t v26 = a1;
    if (a2) {
      unint64_t v16 = 0xE600000000000000;
    }
    else {
      unint64_t v16 = 0xE700000000000000;
    }
    uint64_t v27 = sub_250BE1D68(v14, v16, v28);
    sub_250C1DA48();
    unint64_t v17 = v26;
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (v17 > 2)
    {
      uint64_t v18 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v18 = *(void *)&aBackgrounod[8 * v17];
      unint64_t v15 = *(void *)&aNd[8 * v17];
    }
    uint64_t v27 = sub_250BE1D68(v18, v15, v28);
    sub_250C1DA48();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v11, v12, "[AudioFeedbackConfig] %s audio feedback for %s", (uint8_t *)v13, 0x16u);
    uint64_t v19 = v23;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v19, -1, -1);
    MEMORY[0x2533853C0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(a2) = v25;
    uint64_t v3 = v24;
    a1 = v26;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (a1 >= 4) {
    a1 = 4;
  }
  long long v20 = (uint64_t *)(v3 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v27 = *v20;
  *long long v20 = 0x8000000000000000;
  sub_250BE2514(a2 & 1, a1, isUniquelyReferenced_nonNull_native, sub_250C1B034, (uint64_t (*)(void))sub_250C12D78, (void (*)(void))sub_250C11598);
  *long long v20 = v27;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_250BE1048(unint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250C1D3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  objc_super v11 = sub_250C1D388();
  os_log_type_t v12 = sub_250C1D958();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v25 = v3;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    v29[0] = v24;
    *(_DWORD *)uint64_t v13 = 136315394;
    int v26 = a2;
    if (a2) {
      uint64_t v14 = 0x656C62616E45;
    }
    else {
      uint64_t v14 = 0x656C6261736944;
    }
    unint64_t v15 = 0xE700000000000000;
    unint64_t v27 = a1;
    if (a2) {
      unint64_t v16 = 0xE600000000000000;
    }
    else {
      unint64_t v16 = 0xE700000000000000;
    }
    uint64_t v28 = sub_250BE1D68(v14, v16, v29);
    sub_250C1DA48();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    if (v27 - 1 > 3)
    {
      uint64_t v18 = 0x6E776F6E6B6E75;
    }
    else
    {
      uint64_t v17 = 8 * (v27 - 1);
      uint64_t v18 = *(void *)&aNodup_0[v17];
      unint64_t v15 = *(void *)&aShakelefshaker[v17 + 16];
    }
    uint64_t v28 = sub_250BE1D68(v18, v15, v29);
    sub_250C1DA48();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v11, v12, "[AudioFeedbackConfig] %s audio feedback for %s", (uint8_t *)v13, 0x16u);
    uint64_t v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v19, -1, -1);
    MEMORY[0x2533853C0](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    LOBYTE(a2) = v26;
    uint64_t v3 = v25;
    a1 = v27;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  unint64_t v20 = sub_250C00734(a1);
  long long v21 = (uint64_t *)(v3 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v28 = *v21;
  uint64_t *v21 = 0x8000000000000000;
  sub_250BE2514(a2 & 1, v20, isUniquelyReferenced_nonNull_native, sub_250C1B034, (uint64_t (*)(void))sub_250C12D84, (void (*)(void))sub_250C115A4);
  uint64_t *v21 = v28;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_250BE1464()
{
  return 0;
}

void HGAudioFeedbackConfiguration.init()()
{
}

id HGAudioFeedbackConfiguration.__deallocating_deinit()
{
  return sub_250BE164C(0, (uint64_t (*)(void))type metadata accessor for HGAudioFeedbackConfiguration);
}

id sub_250BE164C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_250BE1718(uint64_t a1)
{
  return sub_250BE1784(0.6, 0.8, a1, 0, &qword_269AF91D8);
}

id sub_250BE1760(uint64_t a1)
{
  return sub_250BE1784(0.6, 0.8, a1, 1, &qword_269AF91E0);
}

id sub_250BE1784(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_250C1D198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  id v12 = objc_allocWithZone((Class)type metadata accessor for HGMLConfiguration(0));
  id result = sub_250BE19F4(30, 5, a4, 8, 4, 3, 8, 4, a1, a1, 0.25, a2, a2, 0.25, 3, (uint64_t)v10);
  *a5 = result;
  return result;
}

id static HGMLConfiguration.defaultEmptyMLConfiguration.getter()
{
  return sub_250BE1934(&qword_269AF8F58, (void **)&qword_269AF91E0);
}

id sub_250BE18F4(uint64_t a1)
{
  return sub_250BE1784(0.4, 0.4, a1, 0, &qword_269AF91E8);
}

id static HGMLConfiguration.defaultTestMLConfiguration.getter()
{
  return sub_250BE1934(&qword_269AF8F60, (void **)&qword_269AF91E8);
}

id sub_250BE1934(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

id sub_250BE19A4(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;
  return v5;
}

id sub_250BE19F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, double a13, double a14, uint64_t a15, uint64_t a16)
{
  uint64_t v29 = (uint64_t)&v16[OBJC_IVAR___HGMLConfigurationInternal_testModelURL];
  uint64_t v30 = sub_250C1D198();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_windowSize] = a1;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_stride] = a2;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_modelType] = a3;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGateOpenConfScoreThresholdNod] = a9;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGestureConfScoreThresholdNod] = a10;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numWindowsInPoolNod] = a4;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_maxNumBackgroundPredictionsNod] = a5;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numConsecutivePredictionsNod] = a6;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minTimeBetweenPoolsNod] = a11;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGateOpenConfScoreThresholdShake] = a12;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minGestureConfScoreThresholdShake] = a13;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numWindowsInPoolShake] = a7;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_maxNumBackgroundPredictionsShake] = a8;
  *(void *)&v16[OBJC_IVAR___HGMLConfigurationInternal_numConsecutivePredictionsShake] = a15;
  *(double *)&v16[OBJC_IVAR___HGMLConfigurationInternal_minTimeBetweenPoolsShake] = a14;
  swift_beginAccess();
  id v31 = v16;
  sub_250BE3FB8(a16, v29);
  swift_endAccess();

  v36.receiver = v31;
  v36.super_class = (Class)type metadata accessor for HGMLConfiguration(0);
  id v32 = objc_msgSendSuper2(&v36, sel_init);
  sub_250BE3F58(a16);
  return v32;
}

void HGMLConfiguration.init()()
{
}

id HGMLConfiguration.__deallocating_deinit()
{
  return sub_250BE164C(0, (uint64_t (*)(void))type metadata accessor for HGMLConfiguration);
}

uint64_t sub_250BE1C7C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_250BE1C8C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_250BE1CC8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_250BE1CF0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_250BE1D68(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_250C1DA48();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_250BE1D68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_250BE1E3C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_250BE4020((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_250BE4020((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_250BE1E3C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_250C1DA58();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_250BE1FF8(a5, a6);
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
  uint64_t v8 = sub_250C1DB58();
  if (!v8)
  {
    sub_250C1DB78();
    __break(1u);
LABEL_17:
    uint64_t result = sub_250C1DBD8();
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

uint64_t sub_250BE1FF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_250BE2090(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250BE2270(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_250BE2270(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_250BE2090(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_250BE2208(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_250C1DB18();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_250C1DB78();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_250C1D788();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_250C1DBD8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_250C1DB78();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_250BE2208(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9308);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_250BE2270(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9308);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

unsigned char **sub_250BE23C0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

_OWORD *sub_250BE23D0(_OWORD *a1, void *a2, char a3)
{
  unint64_t v4 = (void **)v3;
  int64_t v7 = (void *)*v3;
  unint64_t v9 = sub_250C1B0A0((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_250C12BB0();
      goto LABEL_7;
    }
    sub_250C1128C(v12, a3 & 1);
    unint64_t v18 = sub_250C1B0A0((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for CFString(0);
    uint64_t result = (_OWORD *)sub_250C1DD18();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_250BE3F48(a1, v16);
  }
LABEL_13:
  sub_250BE290C(v9, (uint64_t)a2, a1, v15);
  return a2;
}

uint64_t sub_250BE2514(char a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), void (*a6)(void))
{
  uint64_t v10 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = a4(a2);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= result && (a3 & 1) == 0)
  {
    uint64_t result = a5();
LABEL_7:
    unint64_t v22 = (void *)*v10;
    if (v20)
    {
LABEL_8:
      *(unsigned char *)(v22[7] + v16) = a1 & 1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(unsigned char *)(v22[6] + v16) = a2;
    *(unsigned char *)(v22[7] + v16) = a1 & 1;
    uint64_t v24 = v22[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v22[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  a6();
  uint64_t result = a4(a2);
  if ((v20 & 1) == (v23 & 1))
  {
    unint64_t v16 = result;
    unint64_t v22 = (void *)*v10;
    if (v20) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

uint64_t sub_250BE2674(char a1, char a2, double a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_250C1B1FC(a1);
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
  if (v15 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_250C13274();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a1;
    *(double *)(v16[7] + 8 * v10) = a3;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_250C11E8C(result, a2 & 1);
  uint64_t result = sub_250C1B1FC(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

uint64_t sub_250BE279C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  size_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_250C1AFBC(a2, a3);
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
    sub_250C13414();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_250C125D0(v15, a4 & 1);
  unint64_t v21 = sub_250C1AFBC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_250C1DD18();
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
  char v23 = (uint64_t *)(v18[6] + 16 * v12);
  *char v23 = a2;
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

_OWORD *sub_250BE290C(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_250BE3F48(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_250BE2974(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

uint64_t sub_250BE2984(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_250C04A04(0, v2, 0);
  uint64_t v3 = v41;
  uint64_t v6 = (unsigned __int8 *)(a1 + 32);
  BOOL v7 = (void *)(a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForPartGesture);
  while (1)
  {
    unsigned int v9 = *v6++;
    uint64_t v8 = v9;
    if (v9) {
      break;
    }
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v22 = (void *)*v7;
    v40 = (void *)*v7;
    *BOOL v7 = 0x8000000000000000;
    unint64_t v24 = sub_250C1B034(0);
    uint64_t v25 = v22[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      goto LABEL_32;
    }
    char v28 = v23;
    if (v22[3] >= v27)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v20 = v40;
        if ((v23 & 1) == 0) {
          goto LABEL_25;
        }
      }
      else
      {
        sub_250C12D84();
        uint64_t v20 = v40;
        if ((v28 & 1) == 0) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      sub_250C115A4(v27, isUniquelyReferenced_nonNull_native);
      uint64_t v29 = sub_250C1B034(0);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_35;
      }
      unint64_t v24 = v29;
      uint64_t v20 = v40;
      if ((v28 & 1) == 0)
      {
LABEL_25:
        v20[(v24 >> 6) + 8] |= 1 << v24;
        *(unsigned char *)(v20[6] + v24) = 0;
        *(unsigned char *)(v20[7] + v24) = 0;
        uint64_t v34 = v20[2];
        BOOL v32 = __OFADD__(v34, 1);
        uint64_t v33 = v34 + 1;
        if (v32) {
          goto LABEL_34;
        }
LABEL_26:
        v20[2] = v33;
        goto LABEL_27;
      }
    }
    *(unsigned char *)(v20[7] + v24) = 0;
LABEL_27:
    *BOOL v7 = v20;
    swift_bridgeObjectRelease();
    swift_endAccess();
    unint64_t v36 = *(void *)(v41 + 16);
    unint64_t v35 = *(void *)(v41 + 24);
    unint64_t v37 = v36 + 1;
    if (v36 >= v35 >> 1) {
      sub_250C04A04(v35 > 1, v36 + 1, 1);
    }
    *(void *)(v41 + 16) = v37;
    if (!--v2) {
      return v3;
    }
  }
  swift_beginAccess();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  char v11 = (void *)*v7;
  v39 = (void *)*v7;
  *BOOL v7 = 0x8000000000000000;
  unint64_t v13 = sub_250C1B034(v8);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (!__OFADD__(v14, v15))
  {
    char v17 = v12;
    if (v11[3] >= v16)
    {
      if (v10)
      {
        uint64_t v20 = v39;
        if ((v12 & 1) == 0) {
          goto LABEL_21;
        }
      }
      else
      {
        sub_250C12D84();
        uint64_t v20 = v39;
        if ((v17 & 1) == 0) {
          goto LABEL_21;
        }
      }
    }
    else
    {
      sub_250C115A4(v16, v10);
      uint64_t v18 = sub_250C1B034(v8);
      if ((v17 & 1) != (v19 & 1)) {
        goto LABEL_35;
      }
      unint64_t v13 = v18;
      uint64_t v20 = v39;
      if ((v17 & 1) == 0)
      {
LABEL_21:
        v20[(v13 >> 6) + 8] |= 1 << v13;
        *(unsigned char *)(v20[6] + v13) = v8;
        *(unsigned char *)(v20[7] + v13) = 1;
        uint64_t v31 = v20[2];
        BOOL v32 = __OFADD__(v31, 1);
        uint64_t v33 = v31 + 1;
        if (v32) {
          goto LABEL_33;
        }
        goto LABEL_26;
      }
    }
    *(unsigned char *)(v20[7] + v13) = 1;
    goto LABEL_27;
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

uint64_t sub_250BE2C94(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_250C04A04(0, v2, 0);
  uint64_t v3 = v41;
  uint64_t v6 = (unsigned __int8 *)(a1 + 32);
  BOOL v7 = (void *)(a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioFeedbackForGesture);
  while (1)
  {
    unsigned int v9 = *v6++;
    uint64_t v8 = v9;
    if ((v9 - 1) <= 1u)
    {
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      char v11 = (void *)*v7;
      v39 = (void *)*v7;
      *BOOL v7 = 0x8000000000000000;
      unint64_t v13 = sub_250C1B034(v8);
      uint64_t v14 = v11[2];
      BOOL v15 = (v12 & 1) == 0;
      uint64_t v16 = v14 + v15;
      if (__OFADD__(v14, v15)) {
        goto LABEL_32;
      }
      char v17 = v12;
      if (v11[3] >= v16)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v20 = v39;
          if ((v12 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          sub_250C12D78();
          uint64_t v20 = v39;
          if ((v17 & 1) == 0) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        sub_250C11598(v16, isUniquelyReferenced_nonNull_native);
        uint64_t v18 = sub_250C1B034(v8);
        if ((v17 & 1) != (v19 & 1)) {
          goto LABEL_35;
        }
        unint64_t v13 = v18;
        uint64_t v20 = v39;
        if ((v17 & 1) == 0)
        {
LABEL_21:
          v20[(v13 >> 6) + 8] |= 1 << v13;
          *(unsigned char *)(v20[6] + v13) = v8;
          *(unsigned char *)(v20[7] + v13) = 1;
          uint64_t v31 = v20[2];
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_33;
          }
          goto LABEL_26;
        }
      }
      *(unsigned char *)(v20[7] + v13) = 1;
      goto LABEL_27;
    }
    swift_beginAccess();
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    char v22 = (void *)*v7;
    v40 = (void *)*v7;
    *BOOL v7 = 0x8000000000000000;
    unint64_t v24 = sub_250C1B034(v8);
    uint64_t v25 = v22[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      break;
    }
    char v28 = v23;
    if (v22[3] >= v27)
    {
      if (v21)
      {
        uint64_t v20 = v40;
        if ((v23 & 1) == 0) {
          goto LABEL_25;
        }
      }
      else
      {
        sub_250C12D78();
        uint64_t v20 = v40;
        if ((v28 & 1) == 0) {
          goto LABEL_25;
        }
      }
    }
    else
    {
      sub_250C11598(v27, v21);
      uint64_t v29 = sub_250C1B034(v8);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_35;
      }
      unint64_t v24 = v29;
      uint64_t v20 = v40;
      if ((v28 & 1) == 0)
      {
LABEL_25:
        v20[(v24 >> 6) + 8] |= 1 << v24;
        *(unsigned char *)(v20[6] + v24) = v8;
        *(unsigned char *)(v20[7] + v24) = 0;
        uint64_t v34 = v20[2];
        BOOL v32 = __OFADD__(v34, 1);
        uint64_t v33 = v34 + 1;
        if (v32) {
          goto LABEL_34;
        }
LABEL_26:
        v20[2] = v33;
        goto LABEL_27;
      }
    }
    *(unsigned char *)(v20[7] + v24) = 0;
LABEL_27:
    *BOOL v7 = v20;
    swift_bridgeObjectRelease();
    swift_endAccess();
    unint64_t v36 = *(void *)(v41 + 16);
    unint64_t v35 = *(void *)(v41 + 24);
    unint64_t v37 = v36 + 1;
    if (v36 >= v35 >> 1) {
      sub_250C04A04(v35 > 1, v36 + 1, 1);
    }
    *(void *)(v41 + 16) = v37;
    if (!--v2) {
      return v3;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

id sub_250BE2FA4(void *a1, void *a2, char a3)
{
  v3[OBJC_IVAR___HGConfigurationInternal_singleDelivery] = 0;
  v3[OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging] = 0;
  uint64_t v7 = OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout;
  uint64_t v8 = qword_269AF8F78;
  unsigned int v9 = v3;
  if (v8 != -1) {
    swift_once();
  }
  char v10 = *(void **)(qword_269AFCA30 + 16);
  char v11 = (void *)sub_250C1D6A8();
  objc_msgSend(v10, sel_floatForKey_, v11);
  int v13 = v12;

  *(_DWORD *)&v9[v7] = v13;
  uint64_t v14 = OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity;
  BOOL v15 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v16 = (void *)sub_250C1D6A8();
  objc_msgSend(v15, sel_floatForKey_, v16);
  int v18 = v17;

  *(_DWORD *)&v9[v14] = v18;
  uint64_t v19 = OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity;
  uint64_t v20 = *(void **)(qword_269AFCA30 + 16);
  char v21 = (void *)sub_250C1D6A8();
  objc_msgSend(v20, sel_floatForKey_, v21);
  int v23 = v22;

  *(_DWORD *)&v9[v19] = v23;
  *(void *)&v9[OBJC_IVAR___HGConfigurationInternal_mlConfig] = a1;
  *(void *)&v9[OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig] = a2;
  v9[OBJC_IVAR___HGConfigurationInternal_requestPartGestures] = a3 & 1;
  id v24 = a1;
  id v25 = a2;

  v27.receiver = v9;
  v27.super_class = (Class)type metadata accessor for HGConfiguration();
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t type metadata accessor for HGConfiguration()
{
  return self;
}

uint64_t type metadata accessor for HGAudioFeedbackConfiguration(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9258);
}

uint64_t type metadata accessor for HGMLConfiguration(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF92E0);
}

id sub_250BE31F0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_8Tm(a1, &OBJC_IVAR___HGConfigurationInternal_mlConfig, a2);
}

void sub_250BE31FC(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_250BE321C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_8Tm(a1, &OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig, a2);
}

id keypath_get_8Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  unint64_t v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  size_t v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_250BE3288(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_250BE32A8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_12Tm(a1, &OBJC_IVAR___HGConfigurationInternal_requestPartGestures, a2);
}

uint64_t sub_250BE32B4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_13Tm(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_requestPartGestures);
}

uint64_t sub_250BE32C0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_12Tm(a1, &OBJC_IVAR___HGConfigurationInternal_singleDelivery, a2);
}

uint64_t sub_250BE32CC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_13Tm(a1, a2, a3, a4, &OBJC_IVAR___HGConfigurationInternal_singleDelivery);
}

uint64_t sub_250BE32D8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_12Tm(a1, &OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging, a2);
}

void sub_250BE32E4(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging);
  swift_beginAccess();
  *uint64_t v3 = v2;
  sub_250BDF40C();
}

uint64_t sub_250BE3340@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_12Tm(a1, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback, a2);
}

uint64_t sub_250BE334C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_13Tm(a1, a2, a3, a4, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
}

uint64_t sub_250BE3358@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_get_12Tm(a1, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode, a2);
}

uint64_t keypath_get_12Tm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  unint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_250BE33B4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_13Tm(a1, a2, a3, a4, &OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
}

uint64_t keypath_set_13Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  unsigned char *v6 = v5;
  return result;
}

uint64_t sub_250BE3414@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (_DWORD *)(*a1 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_250BE3468(int *a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = (_DWORD *)(*a2 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t method lookup function for HGConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HGConfiguration);
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HGConfiguration.mlConfig.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGConfiguration.audioFeedbackConfig.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HGConfiguration.requestPartGestures.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HGConfiguration.singleDelivery.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of HGConfiguration.enableRawDataLogging.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of HGConfiguration.__allocating_init(mlConfig:audioFeedbackConfig:requestPartGestures:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of HGConfiguration.description()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t sub_250BE3834()
{
  return type metadata accessor for HGAudioFeedbackConfiguration(0);
}

void sub_250BE383C()
{
  sub_250BE3D08();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for HGAudioFeedbackConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HGAudioFeedbackConfiguration);
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedback.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.invertedConfirmationAudioFeedbackMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableWaitingTone.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.$enableWaitingTone.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.audioSessionID.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.__allocating_init(enableAudioFeedback:enableWaitingTone:audioSessionID:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedbackForGesture(gesture:enable:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.enableAudioFeedbackForPartGesture(part:enable:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of HGAudioFeedbackConfiguration.description()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

void sub_250BE3D08()
{
  if (!qword_269AF8FC0)
  {
    unint64_t v0 = sub_250C1D488();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269AF8FC0);
    }
  }
}

uint64_t sub_250BE3D60()
{
  return type metadata accessor for HGMLConfiguration(0);
}

void sub_250BE3D68()
{
  sub_250BE3E38();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for HGMLConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HGMLConfiguration);
}

void sub_250BE3E38()
{
  if (!qword_269AF92F0)
  {
    sub_250C1D198();
    unint64_t v0 = sub_250C1DA38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269AF92F0);
    }
  }
}

ValueMetadata *type metadata accessor for HGMLModelType()
{
  return &type metadata for HGMLModelType;
}

unint64_t sub_250BE3EA4()
{
  unint64_t result = qword_269AF92F8;
  if (!qword_269AF92F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF92F8);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_OWORD *sub_250BE3F48(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_250BE3F58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250BE3FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BE4020(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_250BE408C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9360);
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x270FA5388](v2);
  BOOL v26 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[0] = sub_250C1D998();
  uint64_t v4 = *(void *)(v25[0] - 8);
  MEMORY[0x270FA5388](v25[0]);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D968();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_250C1D5F8();
  MEMORY[0x270FA5388](v8 - 8);
  v0[2] = MEMORY[0x263F8EE88];
  v25[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9368);
  swift_allocObject();
  v0[3] = sub_250C1D3F8();
  sub_250BE79C8(0, (unint64_t *)&qword_269AF90C0);
  v0[5] = 0;
  v0[6] = 0;
  v0[4] = 0;
  sub_250C1D5E8();
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_250BE7A04(&qword_269AF90C8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90D0);
  sub_250BDDD60(&qword_269AF90D8, &qword_269AF90D0);
  sub_250C1DA88();
  (*(void (**)(char *, void, void))(v4 + 104))(v6, *MEMORY[0x263F8F130], v25[0]);
  v0[7] = sub_250C1D9C8();
  if (qword_269AF8F78 != -1) {
    swift_once();
  }
  unsigned int v9 = *(void **)(qword_269AFCA30 + 16);
  char v10 = (void *)sub_250C1D6A8();
  objc_msgSend(v9, sel_doubleForKey_, v10);
  uint64_t v12 = v11;

  v1[8] = v12;
  int v13 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v14 = (void *)sub_250C1D6A8();
  objc_msgSend(v13, sel_doubleForKey_, v14);
  uint64_t v16 = v15;

  v1[9] = v16;
  int v17 = *(void **)(qword_269AFCA30 + 16);
  int v18 = (void *)sub_250C1D6A8();
  objc_msgSend(v17, sel_doubleForKey_, v18);
  uint64_t v20 = v19;

  v1[10] = v20;
  uint64_t v29 = v1[3];
  swift_allocObject();
  swift_weakInit();
  sub_250BE79C8(0, (unint64_t *)&qword_269AF9370);
  sub_250BDDD60(&qword_269AF9378, &qword_269AF9368);
  swift_retain();
  char v21 = v26;
  sub_250C1D4A8();
  swift_release();
  swift_release();
  sub_250BDDD60(&qword_269AF9380, &qword_269AF9360);
  uint64_t v22 = v28;
  uint64_t v23 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v22);
  v1[4] = v23;
  swift_release();
  return v1;
}

char *sub_250BE45E0@<X0>(void **a1@<X0>, char **a2@<X8>)
{
  uint64_t v4 = sub_250C1D2F8();
  uint64_t v61 = *(void *)(v4 - 8);
  uint64_t v62 = v4;
  MEMORY[0x270FA5388](v4);
  v60 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250C1D3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unsigned int v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250C1D348();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v64 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v16 = *a1;
  swift_beginAccess();
  unint64_t result = (char *)swift_weakLoadStrong();
  if (!result) {
    goto LABEL_4;
  }
  int v18 = result;
  v58 = v9;
  uint64_t v59 = v7;
  uint64_t v57 = v6;
  v63 = a2;
  swift_beginAccess();
  uint64_t v19 = *((void *)v18 + 2);
  swift_bridgeObjectRetain();
  id v20 = objc_msgSend(v16, sel_uuid);
  sub_250C1D328();

  LOBYTE(v20) = sub_250BEB40C((uint64_t)v15, v19);
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v22 = v11 + 8;
  char v21 = v23;
  v23(v15, v10);
  if (v20)
  {
    unint64_t result = (char *)swift_release();
    a2 = v63;
LABEL_4:
    *a2 = 0;
    return result;
  }
  id v24 = v16;
  id v25 = objc_msgSend(v16, sel_uuid);
  BOOL v26 = v64;
  sub_250C1D328();

  swift_beginAccess();
  sub_250BE650C((uint64_t)v15, v26);
  uint64_t v27 = v15;
  uint64_t v56 = v10;
  uint64_t v55 = v22;
  v21(v15, v10);
  swift_endAccess();
  uint64_t v28 = v24;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v29 = v57;
  uint64_t v30 = __swift_project_value_buffer(v57, (uint64_t)qword_269AFCA38);
  uint64_t v31 = v58;
  uint64_t v32 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v30, v29);
  v64 = v28;
  uint64_t v33 = sub_250C1D388();
  os_log_type_t v34 = sub_250C1D938();
  if (os_log_type_enabled(v33, v34))
  {
    os_log_t v54 = v33;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    v66[0] = v53;
    *(_DWORD *)uint64_t v35 = 136315650;
    unint64_t v36 = (unint64_t)objc_msgSend(v64, sel_headGesture);
    if (v36 > 2)
    {
      unint64_t v39 = 0xE700000000000000;
      uint64_t v38 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v37 = 8 * v36;
      uint64_t v38 = *(void *)&aBackgrounod_0[8 * v36];
      unint64_t v39 = *(void *)&aNd_0[v37];
    }
    uint64_t v65 = sub_250BE1D68(v38, v39, v66);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2080;
    id v40 = objc_msgSend(v64, sel_uuid, v35 + 14);
    sub_250C1D328();

    sub_250BE7A04((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
    uint64_t v41 = v56;
    uint64_t v42 = sub_250C1DCE8();
    unint64_t v44 = v43;
    v21(v27, v41);
    uint64_t v65 = sub_250BE1D68(v42, v44, v66);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 2048;
    id v45 = objc_msgSend(v64, sel_timestamp);
    v46 = v60;
    sub_250C1D2B8();

    sub_250C1D2A8();
    uint64_t v48 = v47;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v62);
    uint64_t v65 = v48;
    sub_250C1DA48();

    os_log_t v49 = v54;
    _os_log_impl(&dword_250BD9000, v54, v34, "[CR] Fired %s %s %f", (uint8_t *)v35, 0x20u);
    uint64_t v50 = v53;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v50, -1, -1);
    MEMORY[0x2533853C0](v35, -1, -1);
    swift_release();

    (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v29);
  }
  else
  {

    swift_release();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v29);
  }
  v51 = v64;
  *v63 = v64;
  return v51;
}

id sub_250BE4D1C@<X0>(void **a1@<X0>, id *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  v91 = a4;
  uint64_t v94 = sub_250C1D2F8();
  uint64_t v7 = *(void *)(v94 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v94);
  v89 = (char *)v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v93 = (char *)v78 - v10;
  uint64_t v11 = sub_250C1D348();
  uint64_t v84 = *(void *)(v11 - 8);
  uint64_t v85 = v11;
  MEMORY[0x270FA5388](v11);
  v83 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250C1D3A8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v92 = (char *)v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  int v18 = (char *)v78 - v17;
  uint64_t v19 = *a1;
  id v95 = *a2;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v88 = a3 + 16;
  uint64_t v20 = __swift_project_value_buffer(v13, (uint64_t)qword_269AFCA38);
  v81 = *(void (**)(char *))(v14 + 16);
  uint64_t v82 = v20;
  v81(v18);
  id v21 = v19;
  uint64_t v22 = sub_250C1D388();
  LODWORD(v80) = sub_250C1D938();
  BOOL v23 = os_log_type_enabled(v22, (os_log_type_t)v80);
  uint64_t v90 = v7;
  uint64_t v86 = v14;
  uint64_t v87 = v13;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v79 = swift_slowAlloc();
    v97[0] = v79;
    *(_DWORD *)uint64_t v24 = 136315650;
    unint64_t v25 = (unint64_t)objc_msgSend(v21, sel_headGesture);
    if (v25 > 2)
    {
      unint64_t v28 = 0xE700000000000000;
      uint64_t v27 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v26 = 8 * v25;
      uint64_t v27 = *(void *)&aBackgrounod_0[8 * v25];
      unint64_t v28 = *(void *)&aNd_0[v26];
    }
    uint64_t v96 = sub_250BE1D68(v27, v28, v97);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v78[1] = v24 + 14;
    id v30 = objc_msgSend(v21, sel_uuid);
    uint64_t v31 = v83;
    sub_250C1D328();

    sub_250BE7A04((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
    uint64_t v32 = v85;
    uint64_t v33 = sub_250C1DCE8();
    unint64_t v35 = v34;
    (*(void (**)(char *, uint64_t))(v84 + 8))(v31, v32);
    uint64_t v96 = sub_250BE1D68(v33, v35, v97);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2048;
    id v36 = objc_msgSend(v21, sel_timestamp);
    uint64_t v37 = v93;
    sub_250C1D2B8();

    sub_250C1D2A8();
    uint64_t v39 = v38;
    uint64_t v7 = v90;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v37, v94);
    uint64_t v96 = v39;
    sub_250C1DA48();

    _os_log_impl(&dword_250BD9000, v22, (os_log_type_t)v80, "[CR HR]:%s %s %f", (uint8_t *)v24, 0x20u);
    uint64_t v40 = v79;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v40, -1, -1);
    MEMORY[0x2533853C0](v24, -1, -1);

    uint64_t v13 = v87;
    uint64_t v29 = *(void (**)(char *, uint64_t))(v86 + 8);
    v29(v18, v87);
  }
  else
  {

    uint64_t v29 = *(void (**)(char *, uint64_t))(v14 + 8);
    v29(v18, v13);
  }
  uint64_t v41 = v92;
  ((void (*)(char *, uint64_t, uint64_t))v81)(v92, v82, v13);
  id v95 = v95;
  uint64_t v42 = sub_250C1D388();
  int v43 = sub_250C1D938();
  if (os_log_type_enabled(v42, (os_log_type_t)v43))
  {
    LODWORD(v82) = v43;
    uint64_t v44 = swift_slowAlloc();
    v81 = (void (*)(char *))swift_slowAlloc();
    v97[0] = (uint64_t)v81;
    *(_DWORD *)uint64_t v44 = 136315650;
    unint64_t v45 = (unint64_t)objc_msgSend(v95, sel_headGesture);
    uint64_t v46 = v94;
    v80 = v29;
    if (v45 > 2)
    {
      unint64_t v49 = 0xE700000000000000;
      uint64_t v48 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v47 = 8 * v45;
      uint64_t v48 = *(void *)&aBackgrounod_0[8 * v45];
      unint64_t v49 = *(void *)&aNd_0[v47];
    }
    uint64_t v96 = sub_250BE1D68(v48, v49, v97);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    id v52 = objc_msgSend(v95, sel_uuid);
    uint64_t v53 = v83;
    sub_250C1D328();

    sub_250BE7A04((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
    uint64_t v54 = v85;
    uint64_t v55 = sub_250C1DCE8();
    unint64_t v57 = v56;
    (*(void (**)(char *, uint64_t))(v84 + 8))(v53, v54);
    uint64_t v96 = sub_250BE1D68(v55, v57, v97);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 22) = 2048;
    unint64_t v51 = 0x265355000uLL;
    id v58 = objc_msgSend(v95, sel_timestamp);
    uint64_t v50 = v93;
    sub_250C1D2B8();

    sub_250C1D2A8();
    uint64_t v60 = v59;
    uint64_t v61 = v90;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v50, v46);
    uint64_t v96 = v60;
    uint64_t v7 = v61;
    sub_250C1DA48();

    _os_log_impl(&dword_250BD9000, v42, (os_log_type_t)v82, "[CR MR]:%s %s %f", (uint8_t *)v44, 0x20u);
    uint64_t v62 = v81;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v62, -1, -1);
    MEMORY[0x2533853C0](v44, -1, -1);

    v80(v92, v87);
  }
  else
  {

    v29(v41, v13);
    uint64_t v50 = v93;
    uint64_t v46 = v94;
    unint64_t v51 = 0x265355000;
  }
  id v63 = [v95 *(SEL *)(v51 + 3888)];
  sub_250C1D2B8();

  sub_250C1D2A8();
  double v65 = v64;
  v66 = *(void (**)(char *, uint64_t))(v7 + 8);
  v66(v50, v46);
  id v67 = [v21 *(SEL *)(v51 + 3888)];
  v68 = v89;
  sub_250C1D2B8();

  sub_250C1D2A8();
  double v70 = v69;
  v66(v68, v46);
  double v71 = vabdd_f64(v65, v70);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    double v73 = *(double *)(Strong + 80);
    swift_release();
    if (v71 < v73)
    {
LABEL_17:
      char v74 = 1;
      goto LABEL_20;
    }
  }
  else if (v71 < 0.8)
  {
    goto LABEL_17;
  }
  char v74 = 0;
LABEL_20:
  id v75 = v95;
  v76 = v91;
  void *v91 = v95;
  *((unsigned char *)v76 + 8) = v74;
  return v75;
}

uint64_t sub_250BE5770()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 40);
    if (v2)
    {
      swift_retain_n();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9348);
      sub_250BDDD60(&qword_269AF9350, &qword_269AF9348);
      uint64_t v2 = sub_250C1D508();
      swift_release_n();
      swift_release();
    }
    *(void *)(v1 + 48) = v2;
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_250BE588C()
{
  return swift_release();
}

uint64_t sub_250BE58D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250C1D5D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v70 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D5F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v68 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_250C1D618();
  uint64_t v69 = *(void *)(v71 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v71);
  uint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v67 = (char *)&v60 - v13;
  uint64_t v14 = sub_250C1D348();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t result = MEMORY[0x270FA5388](v14);
  int v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void **)a1;
  if (*(void *)a1)
  {
    uint64_t v65 = v5;
    uint64_t v66 = v4;
    int v20 = *(unsigned __int8 *)(a1 + 8);
    uint64_t v21 = qword_269AF8F80;
    id v22 = v19;
    uint64_t v63 = v8;
    uint64_t v64 = v7;
    if (v20 == 1)
    {
      if (v21 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_250C1D3A8();
      __swift_project_value_buffer(v23, (uint64_t)qword_269AFCA38);
      id v24 = v22;
      swift_retain_n();
      id v25 = v24;
      uint64_t v26 = sub_250C1D388();
      os_log_type_t v27 = sub_250C1D938();
      int v28 = v27;
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v29 = swift_slowAlloc();
        id v62 = (id)swift_slowAlloc();
        id aBlock = v62;
        *(_DWORD *)uint64_t v29 = 136315394;
        id v30 = objc_msgSend(v25, sel_uuid, v29 + 4);
        int v61 = v28;
        id v31 = v30;
        sub_250C1D328();

        sub_250BE7A04((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
        uint64_t v32 = sub_250C1DCE8();
        unint64_t v34 = v33;
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        uint64_t v72 = sub_250BE1D68(v32, v34, (uint64_t *)&aBlock);
        sub_250C1DA48();

        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2048;
        uint64_t v72 = *(void *)(a2 + 72);
        sub_250C1DA48();
        swift_release_n();
        _os_log_impl(&dword_250BD9000, v26, (os_log_type_t)v61, "[CR] Immediately firing %s after %fs", (uint8_t *)v29, 0x16u);
        id v35 = v62;
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v35, -1, -1);
        MEMORY[0x2533853C0](v29, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      id v62 = *(id *)(a2 + 56);
      sub_250C1D608();
      uint64_t v48 = v67;
      MEMORY[0x253384440](v12, *(double *)(a2 + 72));
      uint64_t v69 = *(void *)(v69 + 8);
      ((void (*)(char *, uint64_t))v69)(v12, v71);
      uint64_t v49 = swift_allocObject();
      swift_weakInit();
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = v25;
      *(void *)(v50 + 24) = v49;
      v77 = sub_250BE7A4C;
      uint64_t v78 = v50;
      id aBlock = (id)MEMORY[0x263EF8330];
      uint64_t v74 = 1107296256;
      unint64_t v51 = &block_descriptor_33;
    }
    else
    {
      if (v21 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_250C1D3A8();
      __swift_project_value_buffer(v36, (uint64_t)qword_269AFCA38);
      id v37 = v22;
      swift_retain_n();
      id v25 = v37;
      uint64_t v38 = sub_250C1D388();
      os_log_type_t v39 = sub_250C1D938();
      int v40 = v39;
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v41 = swift_slowAlloc();
        id v62 = (id)swift_slowAlloc();
        id aBlock = v62;
        *(_DWORD *)uint64_t v41 = 136315394;
        id v42 = objc_msgSend(v25, sel_uuid, v41 + 4);
        int v61 = v40;
        id v43 = v42;
        sub_250C1D328();

        sub_250BE7A04((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
        uint64_t v44 = sub_250C1DCE8();
        unint64_t v46 = v45;
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        uint64_t v72 = sub_250BE1D68(v44, v46, (uint64_t *)&aBlock);
        sub_250C1DA48();

        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 12) = 2048;
        uint64_t v72 = *(void *)(a2 + 64);
        sub_250C1DA48();
        swift_release_n();
        _os_log_impl(&dword_250BD9000, v38, (os_log_type_t)v61, "[CR] Postpone firing %s after %fs", (uint8_t *)v41, 0x16u);
        id v47 = v62;
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v47, -1, -1);
        MEMORY[0x2533853C0](v41, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      id v62 = *(id *)(a2 + 56);
      sub_250C1D608();
      uint64_t v48 = v67;
      MEMORY[0x253384440](v12, *(double *)(a2 + 64));
      uint64_t v69 = *(void *)(v69 + 8);
      ((void (*)(char *, uint64_t))v69)(v12, v71);
      uint64_t v52 = swift_allocObject();
      swift_weakInit();
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = v25;
      *(void *)(v53 + 24) = v52;
      v77 = sub_250BE7948;
      uint64_t v78 = v53;
      id aBlock = (id)MEMORY[0x263EF8330];
      uint64_t v74 = 1107296256;
      unint64_t v51 = &block_descriptor_0;
    }
    id v75 = sub_250BFD1B4;
    v76 = v51;
    uint64_t v54 = _Block_copy(&aBlock);
    id v55 = v25;
    swift_retain();
    unint64_t v56 = v68;
    sub_250C1D5E8();
    uint64_t v72 = MEMORY[0x263F8EE78];
    sub_250BE7A04((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
    sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
    unint64_t v57 = v70;
    uint64_t v58 = v66;
    sub_250C1DA88();
    uint64_t v59 = v62;
    MEMORY[0x253384790](v48, v56, v57, v54);
    _Block_release(v54);

    (*(void (**)(char *, uint64_t))(v65 + 8))(v57, v58);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v56, v64);
    ((void (*)(char *, uint64_t))v69)(v48, v71);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_250BE62CC(void *a1)
{
  uint64_t v2 = sub_250C1D2F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250C1D2C8();
  uint64_t v6 = (void *)sub_250C1D268();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(a1, sel_setTimestamp_, v6);

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    uint64_t v8 = a1;
    sub_250C1D3E8();
    return swift_release();
  }
  return result;
}

uint64_t sub_250BE6418()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (*(void *)(result + 48))
    {
      swift_retain();
      sub_250C1D3C8();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_250BE6488()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGConfirmationRegulator()
{
  return self;
}

uint64_t sub_250BE650C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250C1D348();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_250BE7A04((unint64_t *)&qword_269AF9388, MEMORY[0x263F07508]);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_250C1D668();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    int v28 = v2;
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
      int v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_250BE7A04(&qword_269AF9390, MEMORY[0x263F07508]);
      char v21 = sub_250C1D698();
      id v22 = *v17;
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
    id v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_250BE6C2C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_250BE6830()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_250C1D348();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9398);
  uint64_t v5 = sub_250C1DAD8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    id v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    id v35 = v0;
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
                  *id v37 = -1 << v34;
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
      sub_250BE7A04((unint64_t *)&qword_269AF9388, MEMORY[0x263F07508]);
      uint64_t result = sub_250C1D668();
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

uint64_t sub_250BE6C2C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_250C1D348();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
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
    sub_250BE6830();
  }
  else
  {
    if (v11 > v10)
    {
      sub_250BE6ECC();
      goto LABEL_12;
    }
    sub_250BE7170();
  }
  uint64_t v12 = *v3;
  sub_250BE7A04((unint64_t *)&qword_269AF9388, MEMORY[0x263F07508]);
  uint64_t v13 = sub_250C1D668();
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
      sub_250BE7A04(&qword_269AF9390, MEMORY[0x263F07508]);
      char v21 = sub_250C1D698();
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
  uint64_t result = sub_250C1DD08();
  __break(1u);
  return result;
}

void *sub_250BE6ECC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D348();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9398);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_250C1DAC8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_250BE7170()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D348();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9398);
  uint64_t v7 = sub_250C1DAD8();
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
    sub_250BE7A04((unint64_t *)&qword_269AF9388, MEMORY[0x263F07508]);
    uint64_t result = sub_250C1D668();
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

uint64_t sub_250BE7520(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9310);
  uint64_t v17 = *(void *)(v6 - 8);
  uint64_t v18 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9318);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9320);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9328);
  sub_250BDDD60(&qword_269AF9330, &qword_269AF9320);
  sub_250C1D4D8();
  swift_release();
  sub_250BDDD60(&qword_269AF9338, &qword_269AF9318);
  uint64_t v13 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)(v3 + 40) = v13;
  uint64_t result = swift_release();
  if (!*(void *)(v3 + 32))
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v20 = *(void *)(v3 + 32);
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_250C1D4B8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_250BDDD60(&qword_269AF9340, &qword_269AF9310);
  uint64_t v15 = v18;
  uint64_t v16 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v15);
  *(void *)(v3 + 32) = v16;
  swift_release();
  uint64_t result = *(void *)(v3 + 32);
  if (!result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_250BE78E4()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_250BE791C@<X0>(void **a1@<X0>, id *a2@<X1>, void *a3@<X8>)
{
  return sub_250BE4D1C(a1, a2, v3, a3);
}

uint64_t sub_250BE7924()
{
  return sub_250BE5770();
}

uint64_t sub_250BE792C()
{
  return sub_250BE6418();
}

uint64_t sub_250BE7934()
{
  return sub_250BE588C();
}

uint64_t sub_250BE793C(uint64_t a1)
{
  return sub_250BE58D4(a1, v1);
}

uint64_t sub_250BE7948()
{
  return sub_250BE62CC(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t objectdestroy_25Tm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

char *sub_250BE79C0@<X0>(void **a1@<X0>, char **a2@<X8>)
{
  return sub_250BE45E0(a1, a2);
}

uint64_t sub_250BE79C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_250BE7A04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250BE7A58()
{
  uint64_t v1 = sub_250C1D348();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 0x3A6E6F6973736553;
  v6[1] = 0xE800000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_id, v1);
  sub_250C1D308();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  return v6[0];
}

uint64_t sub_250BE7B88(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9478);
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
  swift_allocObject();
  sub_250C1D2C8();
  swift_beginAccess();
  uint64_t v12 = swift_retain();
  MEMORY[0x253384610](v12);
  if (*(void *)((*(void *)(v11 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v11 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_250C1D838();
  sub_250C1D858();
  sub_250C1D828();
  swift_endAccess();
  swift_release();
  sub_250BE8CEC(a1);
  uint64_t v13 = a1;
  if (*(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer))
  {
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
    sub_250C1D438();
    swift_endAccess();
    sub_250BDDD60(&qword_269AF9098, &qword_269AF9068);
    sub_250C1D5B8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_250BDDD60(&qword_269AF9480, &qword_269AF9478);
    uint64_t v14 = sub_250C1D498();
    uint64_t v24 = v4;
    uint64_t v15 = a1;
    uint64_t v16 = v14;
    uint64_t v17 = v8;
    uint64_t v18 = v25;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v17);
    uint64_t v19 = sub_250BDC604(v16);
    swift_release();
    uint64_t v26 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9088);
    sub_250BDDD60(&qword_269AF9090, &qword_269AF9088);
    uint64_t v13 = v15;
    uint64_t v4 = v24;
    uint64_t v20 = sub_250C1D5C8();
    swift_release();
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v17 = v8;
    uint64_t v18 = v25;
  }
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask) = v20;
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  sub_250C1D438();
  swift_endAccess();
  sub_250BDDD60(&qword_269AF9098, &qword_269AF9068);
  sub_250C1D5B8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)(swift_allocObject() + 16) = v13;
  sub_250BDDD60(&qword_269AF9480, &qword_269AF9478);
  swift_unknownObjectRetain();
  uint64_t v21 = sub_250C1D5C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v17);
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask) = v21;
  return swift_release();
}

void sub_250BE80B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v68 = (void (*)(uint64_t))a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9488);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v63 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9490);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v58 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_250C1DA28();
  uint64_t v9 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9498);
  uint64_t v56 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF94A0);
  uint64_t v61 = *(void *)(v14 - 8);
  uint64_t v62 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v60 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9068);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF94A8);
  uint64_t v65 = *(void *)(v18 - 8);
  uint64_t v66 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v64 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
  swift_allocObject();
  sub_250C1D2C8();
  swift_beginAccess();
  uint64_t v21 = swift_retain();
  MEMORY[0x253384610](v21);
  if (*(void *)((*(void *)(v20 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v20 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_250C1D838();
  sub_250C1D858();
  sub_250C1D828();
  swift_endAccess();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF94B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_250C1F660;
  uint64_t v23 = *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask);
  *(void *)(inited + 32) = v23;
  uint64_t v24 = v3;
  uint64_t v25 = *(void *)(v3 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask);
  *(void *)(inited + 40) = v25;
  uint64_t v69 = v24;
  uint64_t v26 = *(void *)(v24 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask);
  *(void *)(inited + 48) = v26;
  if (v23)
  {
    swift_retain();
    swift_retain_n();
    swift_retain();
    sub_250C1D3C8();
    swift_release();
    if (!v25) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  swift_retain();
  swift_retain();
  if (v25)
  {
LABEL_5:
    swift_retain();
    sub_250C1D3C8();
    swift_release();
  }
LABEL_6:
  if (v26)
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
  }
  uint64_t v27 = a2;
  uint64_t v28 = v69;
  swift_release();
  sub_250C101F0();
  char v29 = v68;
  if (v68)
  {
    uint64_t v30 = *(void *)(v28 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer);
    if (v30)
    {
      sub_250BEB02C((uint64_t)v68);
      uint64_t v31 = qword_269AF8F80;
      swift_retain();
      if (v31 != -1) {
        swift_once();
      }
      uint64_t v54 = v27;
      uint64_t v32 = sub_250C1D3A8();
      __swift_project_value_buffer(v32, (uint64_t)qword_269AFCA38);
      uint64_t v33 = sub_250C1D388();
      os_log_type_t v34 = sub_250C1D958();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_250BD9000, v33, v34, "[Session] Start waiting for FTS signal, will force release FTS after 2s.", v35, 2u);
        int64_t v36 = v35;
        char v29 = v68;
        MEMORY[0x2533853C0](v36, -1, -1);
      }

      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
      uint64_t v53 = v17;
      sub_250C1D438();
      swift_endAccess();
      LOBYTE(v70) = 1;
      sub_250C1D418();
      uint64_t v37 = v11;
      sub_250C1DA18();
      uint64_t v38 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v58, 1, 1, v67);
      id v70 = objc_msgSend(self, sel_mainRunLoop);
      uint64_t v39 = sub_250C1DA08();
      int64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56);
      v68 = (void (*)(uint64_t))v30;
      uint64_t v41 = (uint64_t)v63;
      v40(v63, 1, 1, v39);
      sub_250BE79C8(0, &qword_269AF94B8);
      sub_250BDDD60(&qword_269AF94C0, &qword_269AF9498);
      sub_250BEB03C();
      uint64_t v42 = v60;
      uint64_t v43 = v55;
      sub_250C1D518();
      sub_250BEB0A4(v41, &qword_269AF9488);

      sub_250BEB0A4(v38, &qword_269AF9490);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v67);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v13, v43);
      sub_250BDDD60(&qword_269AF9098, &qword_269AF9068);
      sub_250BDDD60(&qword_269AF94D0, &qword_269AF94A0);
      uint64_t v44 = v64;
      uint64_t v45 = v59;
      uint64_t v46 = v62;
      id v47 = v53;
      sub_250C1D528();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v46);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v47, v45);
      uint64_t v48 = swift_allocObject();
      uint64_t v49 = v54;
      *(void *)(v48 + 16) = v29;
      *(void *)(v48 + 24) = v49;
      sub_250BDDD60(&qword_269AF94D8, &qword_269AF94A8);
      swift_retain();
      uint64_t v50 = v66;
      uint64_t v51 = sub_250C1D5C8();
      swift_release();
      swift_release();
      sub_250BEB01C((uint64_t)v29);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v44, v50);
      *(void *)(v69 + OBJC_IVAR____TtC12HeadGestures9HGSession_cleanupTask) = v51;
      swift_release();
    }
    else
    {
      uint64_t v52 = swift_retain();
      v29(v52);
      sub_250BEB01C((uint64_t)v29);
    }
  }
}

void sub_250BE8A48(unsigned __int8 *a1, void (*a2)(void))
{
  int v3 = *a1;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_250C1D3A8();
  __swift_project_value_buffer(v4, (uint64_t)qword_269AFCA38);
  uint64_t v5 = sub_250C1D388();
  os_log_type_t v6 = sub_250C1D938();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v5, v6, "[Session] Current FTS signal: %{BOOL}d", v7, 8u);
    MEMORY[0x2533853C0](v7, -1, -1);
  }

  if (v3)
  {
    uint64_t v8 = sub_250C1D388();
    os_log_type_t v9 = sub_250C1D958();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_250BD9000, v8, v9, "[Session] audio finished playing, free to execute completion", v10, 2u);
      MEMORY[0x2533853C0](v10, -1, -1);
    }

    a2();
  }
}

uint64_t sub_250BE8BE8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_caManager);
  type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
  swift_allocObject();
  sub_250C1D2C8();
  swift_beginAccess();
  uint64_t v2 = swift_retain();
  MEMORY[0x253384610](v2);
  if (*(void *)((*(void *)(v1 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_250C1D838();
  sub_250C1D858();
  sub_250C1D828();
  swift_endAccess();
  swift_release();
  if (*(void *)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask))
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
  }
  return sub_250BE9878();
}

uint64_t sub_250BE8CEC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9460);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher))
  {
    v12[1] = *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9320);
    sub_250BDDD60(&qword_269AF9330, &qword_269AF9320);
    sub_250C1D4E8();
    swift_release();
    uint64_t v9 = swift_allocObject();
    swift_weakInit();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    *(void *)(v10 + 24) = a1;
    *(void *)(swift_allocObject() + 16) = a1;
    sub_250BDDD60(&qword_269AF9468, &qword_269AF9460);
    swift_unknownObjectRetain_n();
    uint64_t v11 = sub_250C1D508();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask) = v11;
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_250BE8F4C(void **a1, id *a2)
{
  uint64_t v4 = sub_250C1D348();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *a1;
  id v12 = objc_msgSend(*a2, sel_uuid);
  sub_250C1D328();

  id v13 = objc_msgSend(v11, sel_uuid);
  sub_250C1D328();

  LOBYTE(v13) = sub_250C1D318();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  v14(v10, v4);
  return v13 & 1;
}

void sub_250BE90B4(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  int v3 = *a1;
  if (v3 == 3)
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_250C1D3A8();
    __swift_project_value_buffer(v4, (uint64_t)qword_269AFCA38);
    oslog = sub_250C1D388();
    os_log_type_t v5 = sub_250C1D958();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_250BD9000, oslog, v5, "Pipeline finsihed", v6, 2u);
      MEMORY[0x2533853C0](v6, -1, -1);
    }
  }
  else
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_250C1D3A8();
    __swift_project_value_buffer(v8, (uint64_t)qword_269AFCA38);
    uint64_t v9 = sub_250C1D388();
    os_log_type_t v10 = sub_250C1D948();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      os_log_t osloga = a3;
      id v12 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 138412290;
      sub_250BDE908();
      swift_allocError();
      *id v13 = v3;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      sub_250C1DA48();
      void *v12 = v20;
      _os_log_impl(&dword_250BD9000, v9, v10, "Pipeline encountered an error %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9470);
      swift_arrayDestroy();
      uint64_t v14 = v12;
      a3 = osloga;
      MEMORY[0x2533853C0](v14, -1, -1);
      MEMORY[0x2533853C0](v11, -1, -1);
    }

    if (v3 == 1)
    {
      uint64_t v15 = sub_250C1D388();
      os_log_type_t v16 = sub_250C1D958();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_250BD9000, v15, v16, "Pipeline reseting", v17, 2u);
        MEMORY[0x2533853C0](v17, -1, -1);
      }

      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_250BE8BE8();
        swift_release();
      }
      swift_beginAccess();
      if (swift_weakLoadStrong())
      {
        sub_250BE8CEC(a3);
        swift_release();
      }
    }
  }
}

void sub_250BE9418(id *a1, void *a2)
{
  id v3 = *a1;
  unint64_t v4 = 0x265355000uLL;
  if (!objc_msgSend(*a1, sel_headGesture) && objc_msgSend(v3, sel_headGesturePart))
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_250C1D3A8();
    __swift_project_value_buffer(v17, (uint64_t)qword_269AFCA38);
    id v18 = v3;
    uint64_t v19 = sub_250C1D388();
    os_log_type_t v20 = sub_250C1D958();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = a2;
      int64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v27[0] = v23;
      *(_DWORD *)int64_t v22 = 136315138;
      Swift::String v24 = HGHeadGestureResult.description()();
      uint64_t v26 = sub_250BE1D68(v24._countAndFlagsBits, (unint64_t)v24._object, v27);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250BD9000, v19, v20, "[Part Result]: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v23, -1, -1);
      uint64_t v25 = v22;
      a2 = v21;
      MEMORY[0x2533853C0](v25, -1, -1);

      if (!v21) {
        return;
      }
    }
    else
    {

      if (!a2) {
        return;
      }
    }
LABEL_12:
    objc_msgSend(a2, sel_didDetectedWithHeadGesture_, v3, v26, v27[0]);
    return;
  }
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_250C1D3A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
  id v6 = v3;
  uint64_t v7 = sub_250C1D388();
  os_log_type_t v8 = sub_250C1D958();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = a2;
    os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v27[0] = v11;
    *(_DWORD *)os_log_type_t v10 = 136315138;
    Swift::String v12 = HGHeadGestureResult.description()();
    uint64_t v26 = sub_250BE1D68(v12._countAndFlagsBits, (unint64_t)v12._object, v27);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v7, v8, "[Gesture Result]: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v11, -1, -1);
    id v13 = v10;
    a2 = v9;
    unint64_t v4 = 0x265355000;
    MEMORY[0x2533853C0](v13, -1, -1);
  }
  else
  {
  }
  if (qword_269AF8F70 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_269AFCA00;
  id v15 = objc_msgSend(v6, *(SEL *)(v4 + 3816), v26, v27[0]);
  type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
  *(void *)(swift_allocObject()
            + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAGestureDetectionEvent_detectedGesture) = v15;
  sub_250C1D2C8();
  swift_beginAccess();
  uint64_t v16 = swift_retain();
  MEMORY[0x253384610](v16);
  if (*(void *)((*(void *)(v14 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v14 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_250C1D838();
  sub_250C1D858();
  sub_250C1D828();
  swift_endAccess();
  swift_release();
  if (a2) {
    goto LABEL_12;
  }
}

uint64_t sub_250BE9878()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93B0);
  uint64_t v103 = *(void *)(v2 - 8);
  uint64_t v104 = v2;
  MEMORY[0x270FA5388](v2);
  v102 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93B8);
  uint64_t v96 = *(void *)(v4 - 8);
  uint64_t v97 = v4;
  MEMORY[0x270FA5388](v4);
  id v95 = (char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93C0);
  uint64_t v93 = *(void *)(v6 - 8);
  uint64_t v94 = v6;
  MEMORY[0x270FA5388](v6);
  v92 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93C8);
  uint64_t v120 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  v107 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93D0);
  uint64_t v121 = *(void *)(v109 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v109);
  v91 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v100 = (char *)&v89 - v11;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93D8);
  uint64_t v116 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v114 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93E0);
  uint64_t v117 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  v115 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93E8);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v112 = v14;
  uint64_t v113 = v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = *(char **)(v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_config);
  uint64_t v19 = &v18[OBJC_IVAR___HGConfigurationInternal_mlConfig];
  swift_beginAccess();
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *(void *)(*(void *)v19 + OBJC_IVAR___HGMLConfigurationInternal_windowSize);
  uint64_t v22 = *(void *)(v20 + OBJC_IVAR___HGMLConfigurationInternal_stride);
  type metadata accessor for HGBuffer();
  swift_allocObject();
  uint64_t v23 = sub_250BFF93C(v21, v22);
  uint64_t v24 = OBJC_IVAR____TtC12HeadGestures9HGSession_buffer;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_buffer) = v23;
  swift_release();
  type metadata accessor for HGPredictionAggregator();
  swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v26 = sub_250C02508((uint64_t)&unk_2701CD080, MEMORY[0x263F8EE78]);
  uint64_t v27 = OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator) = v26;
  swift_release();
  type metadata accessor for HGPartGestureRecognizer();
  swift_allocObject();
  uint64_t v28 = v18;
  uint64_t v29 = sub_250C17884((uint64_t)v28);
  v123 = v28;

  uint64_t v99 = OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer) = v29;
  swift_release();
  type metadata accessor for HGMotionStateRecognizer();
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_250C1F670;
  sub_250BDE9E0((uint64_t)v127);
  *(void *)&v128[0] = 0;
  BYTE8(v128[0]) = 1;
  sub_250BDE95C((uint64_t)v127, (uint64_t)&v128[1]);
  memset(&v128[9], 0, 24);
  BYTE8(v128[10]) = 1;
  memset(&v128[11], 0, 24);
  BYTE8(v128[12]) = 1;
  memset(&v128[13], 0, 24);
  BYTE8(v128[14]) = 1;
  memset(&v128[15], 0, 48);
  LOBYTE(v128[18]) = 1;
  *((void *)&v128[18] + 1) = 0;
  LOBYTE(v128[19]) = 1;
  memcpy((void *)(v30 + 32), v128, 0x131uLL);
  *(void *)(v30 + 344) = v25;
  *(void *)(v30 + 352) = v25;
  *(void *)(v30 + 360) = v25;
  *(unsigned char *)(v30 + 368) = 1;
  uint64_t v111 = OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer) = v30;
  swift_release();
  type metadata accessor for HGDataRegulator();
  uint64_t v31 = swift_allocObject();
  sub_250BDE95C((uint64_t)v127, v31 + 16);
  uint64_t v32 = OBJC_IVAR____TtC12HeadGestures9HGSession_regulator;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_regulator) = v31;
  swift_release();
  type metadata accessor for HGHeuristicHeadGestureRecognizer();
  swift_allocObject();
  uint64_t v33 = sub_250BF98C0();
  uint64_t v34 = OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer) = v33;
  swift_release();
  swift_allocObject();
  uint64_t v35 = sub_250C16CD8(0.65, 0.25, 0.4);
  uint64_t v36 = OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer) = v35;
  swift_release();
  type metadata accessor for HGConfirmationRegulator();
  swift_allocObject();
  uint64_t v37 = sub_250BE408C();
  uint64_t v38 = OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator) = v37;
  swift_release();
  if (!*(void *)(v1 + v32))
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v101 = v38;
  if (!*(void *)(*(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionDataProvider)
                  + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    swift_release();
    __break(1u);
    goto LABEL_23;
  }
  swift_retain();
  uint64_t v39 = swift_retain();
  uint64_t v40 = sub_250BDE02C(v39);
  swift_release();
  swift_release();
  uint64_t v41 = &v123[OBJC_IVAR___HGConfigurationInternal_enableRawDataLogging];
  swift_beginAccess();
  int v42 = *v41;
  uint64_t v98 = v36;
  if (v42 == 1)
  {
    if (!*(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    swift_retain();
    swift_retain();
    uint64_t v43 = sub_250C14454(v40);
    swift_release();
    swift_release_n();
    uint64_t v40 = v43;
  }
  if (!*(void *)(v1 + v27)) {
    goto LABEL_22;
  }
  uint64_t v90 = v34;
  if (!*(void *)(v1 + v24))
  {
LABEL_23:
    swift_retain();
    swift_release();
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v110 = *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_mlRecognizer);
  uint64_t v122 = v40;
  uint64_t v126 = v40;
  swift_retain_n();
  swift_retain();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93F0);
  type metadata accessor for HGMLInput();
  uint64_t v45 = v17;
  uint64_t v105 = sub_250BDDD60(&qword_269AF93F8, &qword_269AF93F0);
  uint64_t v106 = v44;
  sub_250C1D4A8();
  swift_release();
  sub_250BDDD60(&qword_269AF9400, &qword_269AF93E8);
  uint64_t v46 = v112;
  uint64_t v47 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v45, v46);
  swift_release();
  uint64_t v48 = sub_250C014B8(v47);
  swift_release();
  uint64_t v126 = v48;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9408);
  uint64_t v49 = sub_250BE79C8(0, (unint64_t *)&qword_269AF9370);
  sub_250BDDD60(&qword_269AF9410, &qword_269AF9408);
  uint64_t v50 = v114;
  uint64_t v113 = v49;
  sub_250C1D4A8();
  swift_release();
  sub_250BDDD60(&qword_269AF9418, &qword_269AF93D8);
  uint64_t v51 = v115;
  uint64_t v52 = v118;
  sub_250C1D558();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v50, v52);
  sub_250BDDD60(&qword_269AF9420, &qword_269AF93E0);
  uint64_t v53 = v119;
  uint64_t v54 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v51, v53);
  swift_release();
  swift_release();
  uint64_t v126 = v54;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9320);
  uint64_t v119 = sub_250BDDD60(&qword_269AF9330, &qword_269AF9320);
  uint64_t v56 = sub_250C1D498();
  swift_release();
  uint64_t v57 = &v123[OBJC_IVAR___HGConfigurationInternal_requestPartGestures];
  swift_beginAccess();
  if (*v57)
  {
    uint64_t v58 = *(char **)(v1 + v101);
    if (v58)
    {
      uint64_t v59 = *(void *)(v1 + v90);
      if (v59)
      {
        if (*(void *)(v1 + v98))
        {
          uint64_t v117 = v55;
          if (*(void *)(v1 + v111))
          {
            uint64_t v125 = v122;
            swift_retain_n();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            swift_retain();
            v123 = v58;
            uint64_t v60 = v107;
            sub_250C1D4A8();
            swift_release();
            uint64_t v118 = v59;
            uint64_t v61 = sub_250BDDD60(&qword_269AF9430, &qword_269AF93C8);
            uint64_t v62 = v108;
            uint64_t v116 = v61;
            uint64_t v63 = sub_250C1D548();
            uint64_t v64 = *(char **)(v120 + 8);
            v120 += 8;
            v115 = v64;
            ((void (*)(char *, uint64_t))v64)(v60, v62);
            swift_release();
            swift_release();
            uint64_t v125 = v63;
            swift_retain();
            uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9438);
            uint64_t v66 = sub_250BDDD60(&qword_269AF9440, &qword_269AF9438);
            uint64_t v67 = v100;
            sub_250C1D4A8();
            swift_release();
            swift_release_n();
            uint64_t v68 = sub_250BDDD60(&qword_269AF9448, &qword_269AF93D0);
            uint64_t v69 = v109;
            uint64_t v70 = sub_250C1D498();
            uint64_t v71 = *(char **)(v121 + 8);
            v121 += 8;
            v114 = v71;
            ((void (*)(char *, uint64_t))v71)(v67, v69);
            uint64_t v72 = sub_250BF8080(v70);
            swift_release();
            swift_release();
            uint64_t v73 = sub_250BE7520(v56, v72);
            swift_retain();
            swift_release();
            swift_release();
            swift_release_n();
            if (*(void *)(v1 + v99))
            {
              uint64_t v112 = v68;
              uint64_t v118 = v66;
              v123 = (char *)v65;
              if (*(void *)(v1 + v111))
              {
                uint64_t v125 = v122;
                swift_retain_n();
                swift_retain();
                swift_retain();
                swift_retain();
                uint64_t v74 = v107;
                sub_250C1D4A8();
                swift_release();
                uint64_t v75 = v108;
                uint64_t v76 = sub_250C1D548();
                ((void (*)(char *, uint64_t))v115)(v74, v75);
                swift_release();
                swift_release();
                uint64_t v125 = v76;
                swift_retain();
                v77 = v91;
                sub_250C1D4A8();
                swift_release();
                swift_release_n();
                uint64_t v78 = v92;
                uint64_t v79 = v109;
                sub_250C1D4F8();
                ((void (*)(char *, uint64_t))v114)(v77, v79);
                sub_250BDDD60(&qword_269AF9450, &qword_269AF93C0);
                uint64_t v80 = v94;
                uint64_t v81 = sub_250C1D498();
                (*(void (**)(char *, uint64_t))(v93 + 8))(v78, v80);
                uint64_t v124 = v73;
                uint64_t v125 = v81;
                uint64_t v82 = v95;
                sub_250C1D538();
                swift_release();
                sub_250BDDD60(&qword_269AF9458, &qword_269AF93B8);
                uint64_t v83 = v97;
                uint64_t v56 = sub_250C1D498();
                swift_release();
                swift_release();
                (*(void (**)(char *, uint64_t))(v96 + 8))(v82, v83);
                goto LABEL_16;
              }
LABEL_30:
              swift_retain();
              swift_release();
              uint64_t result = swift_release();
              __break(1u);
              return result;
            }
LABEL_29:
            swift_release();
            swift_release();
            __break(1u);
            goto LABEL_30;
          }
LABEL_28:
          swift_retain();
          swift_retain();
          swift_retain();
          swift_release();
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        swift_retain();
        swift_retain();
        swift_release();
        __break(1u);
        goto LABEL_28;
      }
LABEL_26:
      swift_retain();
      swift_release();
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    swift_release();
    __break(1u);
    goto LABEL_26;
  }
LABEL_16:
  if (*(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer))
  {
    uint64_t v125 = v56;
    swift_retain();
    uint64_t v84 = v102;
    sub_250C1D4F8();
    swift_release();
    sub_250BDDD60(&qword_269AF9428, &qword_269AF93B0);
    uint64_t v85 = v104;
    uint64_t v86 = sub_250C1D498();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v84, v85);
    uint64_t v125 = v86;
    uint64_t v87 = sub_250C1D498();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v56 = v87;
  }
  else
  {
    swift_release();
  }
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher) = v56;
  return swift_release();
}

id sub_250BEAA5C@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  id result = sub_250C000E8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_250BEAA88()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12HeadGestures9HGSession_id;
  uint64_t v2 = sub_250C1D348();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_250BEAC1C()
{
  sub_250BEAA88();
  return swift_deallocClassInstance();
}

uint64_t sub_250BEAC74()
{
  return type metadata accessor for HGSession();
}

uint64_t type metadata accessor for HGSession()
{
  uint64_t result = qword_269AF93A0;
  if (!qword_269AF93A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250BEACC8()
{
  uint64_t result = sub_250C1D348();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_250BEAD98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC12HeadGestures9HGSession_id;
  uint64_t v4 = sub_250C1D348();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_250BEAE10()
{
  return sub_250BE7A58();
}

unint64_t sub_250BEAE38()
{
  unint64_t result = qword_269AF9388;
  if (!qword_269AF9388)
  {
    sub_250C1D348();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9388);
  }
  return result;
}

uint64_t sub_250BEAE90(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_250BEAEBC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_250BEAEE4@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_250BEAF14@<X0>(double *a1@<X0>, void *a2@<X8>)
{
  return sub_250BFF9C8(a1, v2, a2);
}

void sub_250BEAF1C(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
}

id sub_250BEAF24@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return sub_250BDCAEC(a1, v2, a2);
}

uint64_t sub_250BEAF2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_250BF61C4(a1, a2);
}

uint64_t sub_250BEAF34@<X0>(void *__src@<X0>, char *a2@<X8>)
{
  return sub_250C16D58(__src, a2);
}

uint64_t sub_250BEAF3C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250BEAF74()
{
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_250BEAFB4(unsigned __int8 *a1)
{
  sub_250BE90B4(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_250BEAFBC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250BEAFF4(id *a1)
{
  sub_250BE9418(a1, *(void **)(v1 + 16));
}

id sub_250BEAFFC(unsigned __int8 *a1)
{
  id result = *(id *)(v1 + 16);
  if (result) {
    return objc_msgSend(result, sel_didStartStreamingWithIsStreaming_, *a1);
  }
  return result;
}

uint64_t sub_250BEB01C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_250BEB02C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_250BEB03C()
{
  unint64_t result = qword_269AF94C8;
  if (!qword_269AF94C8)
  {
    sub_250BE79C8(255, &qword_269AF94B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF94C8);
  }
  return result;
}

uint64_t sub_250BEB0A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_250BEB100()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_250BEB138(unsigned __int8 *a1)
{
  sub_250BE8A48(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_250BEB140(void *a1)
{
  uint64_t v2 = v1;
  sub_250C1D338();
  uint64_t v4 = OBJC_IVAR____TtC12HeadGestures9HGSession_caManager;
  if (qword_269AF8F70 != -1) {
    swift_once();
  }
  *(void *)(v2 + v4) = qword_269AFCA00;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_aggregator) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_buffer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_regulator) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStateRecognizer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_partGesturesRecognizer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_confirmationRegulator) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_heuristicRecognizer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_sensitivePartGestureRecognizer) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_resultPublisher) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_headGesturesTask) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionStatusTask) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_waitingToneTask) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_cleanupTask) = 0;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_config) = a1;
  id v5 = objc_allocWithZone((Class)type metadata accessor for HGHeadphoneMotionDataProvider());
  swift_retain();
  id v6 = a1;
  id v7 = objc_msgSend(v5, sel_init);
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_motionDataProvider) = v7;
  type metadata accessor for HGMLHeadGesturesClassifier();
  swift_allocObject();
  uint64_t v8 = (char *)v6;
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_mlRecognizer) = sub_250C00E98(v8);
  uint64_t v9 = (void **)&v8[OBJC_IVAR___HGConfigurationInternal_audioFeedbackConfig];
  swift_beginAccess();
  uint64_t v10 = (char *)*v9;
  uint64_t v11 = (char *)*v9 + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback;
  swift_beginAccess();
  uint64_t v12 = 0;
  if (*v11 == 1)
  {
    uint64_t v13 = &v10[OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID];
    swift_beginAccess();
    if (*(_DWORD *)v13)
    {
      type metadata accessor for HGCustomizedAudioPlayer();
      swift_allocObject();
      uint64_t v12 = sub_250BF2384(v10);
    }
    else
    {
      type metadata accessor for HGSystemAudioPlayer();
      swift_allocObject();
      uint64_t v12 = sub_250BFD1F8(v10);
    }
  }
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer) = v12;
  type metadata accessor for HGDataCollector();
  swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC12HeadGestures9HGSession_recorder) = sub_250C1401C();
  swift_release();
  sub_250BE9878();
  return v2;
}

uint64_t sub_250BEB40C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_250C1D348();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_250BED120((unint64_t *)&qword_269AF9388, MEMORY[0x263F07508]),
        uint64_t v7 = sub_250C1D668(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_250BED120(&qword_269AF9390, MEMORY[0x263F07508]);
      char v15 = sub_250C1D698();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_250BEB620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_250C1DD78();
    sub_250C1D748();
    uint64_t v6 = sub_250C1DD98();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_250C1DCF8() & 1) != 0) {
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
          if (v17 || (sub_250C1DCF8() & 1) != 0) {
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

uint64_t sub_250BEB758()
{
  id v1 = objc_msgSend(v0, sel_modelDescription);
  id v2 = objc_msgSend(v1, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_250BED120(&qword_269AF9128, type metadata accessor for MLModelMetadataKey);
  uint64_t v3 = sub_250C1D648();

  if (!*(void *)(v3 + 16))
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  id v4 = (id)*MEMORY[0x263F00CF0];
  unint64_t v5 = sub_250C1B124((uint64_t)v4);
  if ((v6 & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;

    goto LABEL_10;
  }
  sub_250BE4020(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v12);

  swift_bridgeObjectRelease();
  if (!*((void *)&v13 + 1))
  {
LABEL_11:
    sub_250BEB0A4((uint64_t)&v12, &qword_269AF9508);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9510);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (!*(void *)(v11 + 16) || (unint64_t v7 = sub_250C1AFBC(0x64695F746C6F62, 0xE700000000000000), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(*(void *)(v11 + 56) + 16 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v9;
}

id sub_250BEB9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  char v6 = sub_250BEB620(a1, a2, v5);
  swift_bridgeObjectRelease();
  id v7 = 0;
  if (v6)
  {
    if (a1 == 0xD000000000000010 && a2 == 0x8000000250C22D50 || (sub_250C1DCF8() & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF94F0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_250C1F740;
      sub_250BE79C8(0, &qword_269AF94F8);
      sub_250C1DAB8();
      sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
      *(void *)(inited + 72) = sub_250C1D9F8();
      sub_250C074D4(inited);
      return sub_250C1A058();
    }
    else if (a1 == 0x62614C7373616C63 && a2 == 0xEA00000000006C65 || (sub_250C1DCF8() & 1) != 0)
    {
      uint64_t v9 = (void *)sub_250C1D6A8();
      id v7 = objc_msgSend(self, sel_featureValueWithString_, v9);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_250BEBC7C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

id sub_250BEBDB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FooModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FooModel()
{
  return self;
}

uint64_t type metadata accessor for FooModel.FooModelFeatureProvider()
{
  return self;
}

uint64_t sub_250BEBE2C(void *a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 16) = a1;
  *(void *)(v1 + 24) = 0;
  uint64_t v3 = qword_269AF8F80;
  id v4 = a1;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_250C1D3A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
  char v6 = sub_250C1D388();
  os_log_type_t v7 = sub_250C1D928();
  if (os_log_type_enabled(v6, v7))
  {
    char v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_250BD9000, v6, v7, "[HGModel] using v1 model", v8, 2u);
    MEMORY[0x2533853C0](v8, -1, -1);
  }

  return v2;
}

void sub_250BEBF24()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v4 + OBJC_IVAR___HGMLConfigurationInternal_modelType);
  if (v5 == 1)
  {
    *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FooModel()), sel_init);
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = v4 + OBJC_IVAR___HGMLConfigurationInternal_testModelURL;
      swift_beginAccess();
      sub_250BEC928(v6, (uint64_t)v3);
      id v7 = sub_250BECC34((uint64_t)v3);
      sub_250BEB0A4((uint64_t)v3, &qword_269AF9300);
      if (v7)
      {
        char v8 = *(void **)(v0 + 24);
        *(void *)(v0 + 24) = v7;

        return;
      }
    }
    sub_250C1DB88();
    __break(1u);
  }
  MEMORY[0x270F9A758]();
}

uint64_t sub_250BEC0C4()
{
  uint64_t v1 = sub_250C1D3A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + 16);
  if (*(void *)(v6 + OBJC_IVAR___HGMLConfigurationInternal_modelType) == 1) {
    return result;
  }
  id v7 = *(void **)(v0 + 24);
  if (!v7) {
    goto LABEL_26;
  }
  id v8 = v7;
  id v9 = objc_msgSend(v8, sel_modelDescription);
  id v10 = objc_msgSend(v9, sel_inputDescriptionsByName);

  sub_250BE79C8(0, &qword_269AF94E0);
  uint64_t v11 = sub_250C1D648();

  sub_250BEC638(v11);
  uint64_t v13 = v12;
  unint64_t v15 = v14;
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_26;
  }
  if (objc_msgSend(v15, sel_type) == (id)5)
  {
    id v16 = objc_msgSend(v15, sel_multiArrayConstraint);
    if (!v16) {
      goto LABEL_25;
    }
    BOOL v17 = v16;
    id v18 = objc_msgSend(v16, sel_shape);

    sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
    unint64_t v19 = sub_250C1D808();

    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_250C1DB98();
      swift_bridgeObjectRelease();
      if (v35)
      {
LABEL_8:
        if ((v19 & 0xC000000000000001) == 0)
        {
          if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v20 = *(id *)(v19 + 32);
            goto LABEL_11;
          }
          __break(1u);
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_23:
        id v20 = (id)MEMORY[0x253384940](0, v19);
LABEL_11:
        uint64_t v21 = v20;
        swift_bridgeObjectRelease();
        id v22 = objc_msgSend(v21, sel_integerValue);

        if (v22 == *(id *)(v6 + OBJC_IVAR___HGMLConfigurationInternal_windowSize)) {
          goto LABEL_12;
        }
LABEL_26:
        uint64_t result = sub_250C1DB88();
        __break(1u);
        return result;
      }
    }
    else if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_23;
  }
LABEL_12:
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v23 = __swift_project_value_buffer(v1, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v23, v1);
  id v24 = v8;
  uint64_t v25 = sub_250C1D388();
  os_log_type_t v26 = sub_250C1D958();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v38 = v13;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    uint64_t v39 = v1;
    uint64_t v30 = v2;
    uint64_t v31 = v29;
    uint64_t v41 = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v32 = sub_250BEB758();
    if (v33)
    {
      unint64_t v34 = v33;
    }
    else
    {
      uint64_t v32 = 0x6E776F6E6B6E55;
      unint64_t v34 = 0xE700000000000000;
    }
    id v37 = v15;
    uint64_t v40 = sub_250BE1D68(v32, v34, &v41);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v25, v26, "[HGEspressoV1Model] ML model version: %s loaded.", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v31, -1, -1);
    MEMORY[0x2533853C0](v28, -1, -1);

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v5, v39);
  }
  else
  {

    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

void *sub_250BEC638(uint64_t a1)
{
  uint64_t result = (void *)sub_250C05A98();
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
  if (result == (void *)(1 << *(unsigned char *)(a1 + 32))) {
    return 0;
  }
  else {
    return sub_250BEC898(&v5, (uint64_t)result, v3, 0, a1);
  }
}

uint64_t sub_250BEC6C4(uint64_t a1)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(v1 + 24);
  if (!v2) {
    return 0;
  }
  v10[0] = 0;
  id v4 = v2;
  id v5 = objc_msgSend(v4, sel_predictionFromFeatures_error_, a1, v10);
  if (v5)
  {
    id v6 = v5;
    id v7 = v10[0];

    type metadata accessor for HGMLOutput();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v6;
  }
  else
  {
    id v9 = v10[0];
    sub_250C1D128();

    swift_willThrow();
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_250BEC7C8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGEspressoV1Model()
{
  return self;
}

void sub_250BEC82C()
{
}

uint64_t sub_250BEC850()
{
  return sub_250BEC0C4();
}

uint64_t sub_250BEC874(uint64_t a1)
{
  return sub_250BEC6C4(a1);
}

void *sub_250BEC898(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    id v6 = *(void **)(*(void *)(a5 + 56) + 8 * a2);
    *uint64_t result = v6;
    swift_bridgeObjectRetain();
    id v7 = v6;
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_250BEC928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_250BEC990()
{
  type metadata accessor for HGMLInput();
  if (swift_dynamicCastClass())
  {
    type metadata accessor for FooModel.FooModelFeatureProvider();
    uint64_t v0 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9500);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_250C1F750;
    *(void *)(inited + 32) = 0x62614C7373616C63;
    *(void *)(inited + 40) = 0xEA00000000006C65;
    *(void *)(inited + 48) = 0xD000000000000010;
    *(void *)(inited + 56) = 0x8000000250C22D50;
    uint64_t v2 = sub_250C1CEA0(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    *(void *)(v0 + 16) = v2;
    return v0;
  }
  else
  {
    uint64_t result = sub_250C1DB88();
    __break(1u);
  }
  return result;
}

id sub_250BECAD4(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_250C1D158();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_250C1D198();
    id v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_250C1D128();

    swift_willThrow();
    uint64_t v11 = sub_250C1D198();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_250BECC34(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  id v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v36 - v6;
  uint64_t v8 = sub_250C1D198();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  id v37 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v38 = (char *)&v36 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v36 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v36 - v20;
  sub_250BEC928(a1, (uint64_t)v7);
  id v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v22(v7, 1, v8) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v21, v7, v8);
    sub_250BE79C8(0, &qword_269AF9518);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v19, v21, v8);
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
    id v35 = sub_250BECAD4((uint64_t)v19, (uint64_t)v33);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v8);
    return v35;
  }
  sub_250BEB0A4((uint64_t)v7, &qword_269AF9300);
  type metadata accessor for HGEspressoV1Model();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v24 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v25 = (void *)sub_250C1D6A8();
  os_log_type_t v26 = (void *)sub_250C1D6A8();
  id v27 = objc_msgSend(v24, sel_URLForResource_withExtension_, v25, v26);

  if (!v27)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, 1, 1, v8);
    goto LABEL_7;
  }
  sub_250C1D168();

  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v28(v5, v14, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
  if (v22(v5, 1, v8) == 1)
  {
LABEL_7:

    sub_250BEB0A4((uint64_t)v5, &qword_269AF9300);
    return 0;
  }
  uint64_t v29 = v38;
  v28(v38, v5, v8);
  sub_250BE79C8(0, &qword_269AF9518);
  uint64_t v30 = (uint64_t)v37;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v37, v29, v8);
  uint64_t v31 = v8;
  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  id v35 = sub_250BECAD4(v30, (uint64_t)v32);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v29, v31);
  return v35;
}

uint64_t sub_250BED120(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250BED168()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGFileUtil()
{
  return self;
}

uint64_t sub_250BED19C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_250BED1D4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_250BED1FC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_250C1DA48();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

id sub_250BED2B4(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, unint64_t a6)
{
  unint64_t v71 = a6;
  uint64_t v72 = a4;
  uint64_t v69 = a5;
  unint64_t v73 = a2;
  v75[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_250C1D138();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_250C1D198();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v69 - v17;
  sub_250C1D148();
  v75[0] = a3;
  v75[1] = v72;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06E38], v8);
  sub_250BEDD64();
  sub_250C1D188();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unint64_t v19 = *(void (**)(char *, uint64_t))(v13 + 8);
  v19(v16, v12);
  uint64_t v72 = (void *)sub_250C1D178();
  unint64_t v21 = v20;
  v19(v18, v12);
  id v22 = self;
  unint64_t v23 = 0x265355000uLL;
  id v24 = objc_msgSend(v22, sel_defaultManager, v69);
  uint64_t v70 = a1;
  unint64_t v25 = v73;
  os_log_type_t v26 = (void *)sub_250C1D6A8();
  v75[0] = 0;
  LODWORD(v18) = objc_msgSend(v24, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v26, 1, 0, v75);

  if (!v18)
  {
    id v35 = v75[0];
    swift_bridgeObjectRelease();
    uint64_t v36 = (void *)sub_250C1D128();

    swift_willThrow();
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_250C1D3A8();
    __swift_project_value_buffer(v37, (uint64_t)qword_269AFCA38);
    id v38 = v36;
    id v39 = v36;
    uint64_t v40 = sub_250C1D388();
    os_log_type_t v41 = sub_250C1D948();
    if (os_log_type_enabled(v40, v41))
    {
      int v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      v75[0] = v43;
      *(_DWORD *)int v42 = 136315138;
      swift_getErrorValue();
      uint64_t v44 = sub_250C1DD28();
      uint64_t v74 = sub_250BE1D68(v44, v45, (uint64_t *)v75);
      sub_250C1DA48();
      swift_bridgeObjectRelease();

      swift_arrayDestroy();
      MEMORY[0x2533853C0](v43, -1, -1);
      MEMORY[0x2533853C0](v42, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v27 = qword_269AF8F80;
  id v28 = v75[0];
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_250C1D3A8();
  __swift_project_value_buffer(v29, (uint64_t)qword_269AFCA38);
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_250C1D388();
  os_log_type_t v31 = sub_250C1D958();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    id v33 = (void *)swift_slowAlloc();
    v75[0] = v33;
    *(_DWORD *)id v32 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_250BE1D68(v70, v25, (uint64_t *)v75);
    sub_250C1DA48();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_250BD9000, v30, v31, "[HGFileUtil] Directory created at %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v33, -1, -1);
    unint64_t v34 = v32;
    unint64_t v23 = 0x265355000;
    MEMORY[0x2533853C0](v34, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v46 = (uint64_t)v72;
  id v47 = [v22 *(SEL *)(v23 + 4016)];
  unint64_t v48 = v23;
  uint64_t v49 = (void *)sub_250C1D6A8();
  unsigned __int8 v50 = objc_msgSend(v47, sel_fileExistsAtPath_, v49);

  if ((v50 & 1) == 0)
  {
    id v55 = [v22 (SEL)(v48 + 827)];
    uint64_t v56 = (void *)sub_250C1D6A8();
    if (v71 >> 60 == 15) {
      uint64_t v57 = 0;
    }
    else {
      uint64_t v57 = (void *)sub_250C1D1F8();
    }
    unsigned int v58 = objc_msgSend(v55, sel_createFileAtPath_contents_attributes_, v56, v57, 0);

    swift_bridgeObjectRetain();
    if (v58)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = sub_250C1D388();
      os_log_type_t v59 = sub_250C1D958();
      if (os_log_type_enabled(v51, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = (void *)swift_slowAlloc();
        v75[0] = v61;
        *(_DWORD *)uint64_t v60 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v74 = sub_250BE1D68(v46, v21, (uint64_t *)v75);
        sub_250C1DA48();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_250BD9000, v51, v59, "[HGFileUtil] Empty file created at %s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v61, -1, -1);
        MEMORY[0x2533853C0](v60, -1, -1);

        goto LABEL_25;
      }
LABEL_24:

      swift_bridgeObjectRelease_n();
      goto LABEL_25;
    }
    uint64_t v62 = sub_250C1D388();
    os_log_type_t v63 = sub_250C1D948();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = (void *)swift_slowAlloc();
      v75[0] = v65;
      *(_DWORD *)uint64_t v64 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v74 = sub_250BE1D68(v46, v21, (uint64_t *)v75);
      sub_250C1DA48();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250BD9000, v62, v63, "[HGFileUtil] Error creating file at %s", v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v65, -1, -1);
      MEMORY[0x2533853C0](v64, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v51 = sub_250C1D388();
  os_log_type_t v52 = sub_250C1D958();
  if (!os_log_type_enabled(v51, v52)) {
    goto LABEL_24;
  }
  uint64_t v53 = (uint8_t *)swift_slowAlloc();
  uint64_t v54 = (void *)swift_slowAlloc();
  v75[0] = v54;
  *(_DWORD *)uint64_t v53 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v74 = sub_250BE1D68(v46, v21, (uint64_t *)v75);
  sub_250C1DA48();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_250BD9000, v51, v52, "[HGFileUtil] File already exists at %s", v53, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2533853C0](v54, -1, -1);
  MEMORY[0x2533853C0](v53, -1, -1);

LABEL_25:
  uint64_t v66 = (void *)sub_250C1D6A8();
  swift_bridgeObjectRelease();
  id v67 = objc_msgSend(self, sel_fileHandleForWritingAtPath_, v66);

  return v67;
}

unint64_t sub_250BEDD64()
{
  unint64_t result = qword_269AF9520;
  if (!qword_269AF9520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9520);
  }
  return result;
}

void sub_250BEDDB8(void *a1, unint64_t a2, void *a3, char a4)
{
  v19[2] = *(id *)MEMORY[0x263EF8340];
  sub_250C1D918();
  if (a2 >> 60 != 15)
  {
    v19[0] = a1;
    v19[1] = (id)a2;
    sub_250BEE0B4((uint64_t)a1, a2);
    sub_250BEE10C();
    sub_250C1D908();
    sub_250BEE160((uint64_t)a1, a2);
  }
  if (a4)
  {
    v19[0] = 0;
    if (objc_msgSend(a3, sel_closeAndReturnError_, v19))
    {
      MEMORY[0x270F9A8A0]();
    }
    else
    {
      id v17 = v19[0];
      uint64_t v18 = (void *)sub_250C1D128();

      swift_willThrow();
      if (qword_269AF8F80 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_250C1D3A8();
      __swift_project_value_buffer(v8, (uint64_t)qword_269AFCA38);
      id v9 = v18;
      id v10 = v18;
      uint64_t v11 = sub_250C1D388();
      os_log_type_t v12 = sub_250C1D948();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 138412290;
        id v15 = v18;
        uint64_t v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v19[0] = v16;
        sub_250C1DA48();
        void *v14 = v16;

        _os_log_impl(&dword_250BD9000, v11, v12, "[HGDataCollector] Error when trying to write to file %@", v13, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9470);
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v14, -1, -1);
        MEMORY[0x2533853C0](v13, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t sub_250BEE0B4(uint64_t a1, unint64_t a2)
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

unint64_t sub_250BEE10C()
{
  unint64_t result = qword_269AF9528;
  if (!qword_269AF9528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9528);
  }
  return result;
}

uint64_t sub_250BEE160(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_250BEE174(a1, a2);
  }
  return a1;
}

uint64_t sub_250BEE174(uint64_t a1, unint64_t a2)
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

uint64_t sub_250BEE1CC()
{
  id v25 = self;
  id v0 = objc_msgSend(v25, sel_defaultManager);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  id v4 = objc_msgSend(v3, sel_bundlePath);

  sub_250C1D6D8();
  swift_bridgeObjectRetain();
  sub_250C1D798();
  sub_250C1D758();
  swift_bridgeObjectRelease();
  id v5 = (void *)sub_250C1D6A8();
  swift_bridgeObjectRelease();
  unsigned int v6 = objc_msgSend(v0, sel_fileExistsAtPath_, v5);

  id v7 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = v7;
  if (v6)
  {
LABEL_6:
    id v19 = objc_msgSend(v7, sel_bundlePath);

    sub_250C1D6D8();
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_250C1D798();
    sub_250C1D758();
    swift_bridgeObjectRelease();
    return v27;
  }
  id v9 = objc_msgSend(v7, sel_resourcePath);

  if (!v9)
  {
LABEL_5:
    id v14 = objc_msgSend(v25, sel_defaultManager);
    id v15 = objc_msgSend(v2, sel_mainBundle);
    id v16 = objc_msgSend(v15, sel_bundlePath);

    sub_250C1D6D8();
    swift_bridgeObjectRetain();
    sub_250C1D798();
    sub_250C1D758();
    swift_bridgeObjectRelease();
    id v17 = (void *)sub_250C1D6A8();
    swift_bridgeObjectRelease();
    unsigned int v18 = objc_msgSend(v14, sel_fileExistsAtPath_, v17);

    id v7 = objc_msgSend(v2, sel_mainBundle);
    uint64_t v8 = v7;
    if (!v18)
    {
      id v21 = objc_msgSend(v7, sel_resourcePath);

      if (v21)
      {
        sub_250C1D6D8();

        swift_bridgeObjectRetain();
        uint64_t v28 = sub_250C1D798();
        sub_250C1D758();
        swift_bridgeObjectRelease();
        uint64_t v10 = v28;
        id v22 = objc_msgSend(v25, sel_defaultManager);
        unint64_t v23 = (void *)sub_250C1D6A8();
        unsigned int v24 = objc_msgSend(v22, sel_fileExistsAtPath_, v23);

        if (v24) {
          return v10;
        }
        swift_bridgeObjectRelease();
      }
      return 0;
    }
    goto LABEL_6;
  }
  sub_250C1D6D8();

  swift_bridgeObjectRetain();
  uint64_t v26 = sub_250C1D798();
  sub_250C1D758();
  swift_bridgeObjectRelease();
  uint64_t v10 = v26;
  id v11 = objc_msgSend(v25, sel_defaultManager);
  os_log_type_t v12 = (void *)sub_250C1D6A8();
  unsigned int v13 = objc_msgSend(v11, sel_fileExistsAtPath_, v12);

  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  return v10;
}

unint64_t sub_250BEE790()
{
  sub_250C1DB08();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_isDeviceMotionActive);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  return 0xD00000000000001BLL;
}

id sub_250BEE8A8()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_setDelegate_, v0);
}

void sub_250BEE8C4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager);
  if (objc_msgSend(v1, sel_isDeviceMotionAvailable)
    && (objc_msgSend(v1, sel_isDeviceMotionActive) & 1) == 0)
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_250C1D3A8();
    __swift_project_value_buffer(v2, (uint64_t)qword_269AFCA38);
    id v3 = sub_250C1D388();
    os_log_type_t v4 = sub_250C1D958();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      aBlock[0] = v6;
      *(_DWORD *)id v5 = 136315138;
      sub_250BE1D68(0x29287472617473, 0xE700000000000000, aBlock);
      sub_250C1DA48();
      _os_log_impl(&dword_250BD9000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v6, -1, -1);
      MEMORY[0x2533853C0](v5, -1, -1);
    }

    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue);
    uint64_t v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = (uint64_t)sub_250BEF3FC;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_250C1C0C4;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    id v9 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v1, sel_startDeviceMotionUpdatesToQueue_withHandler_, v7, v9);
    _Block_release(v9);
    uint64_t v10 = sub_250C1D388();
    os_log_type_t v11 = sub_250C1D958();
    if (os_log_type_enabled(v10, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v12 = 0;
      _os_log_impl(&dword_250BD9000, v10, v11, "HGHeadphoneMotionManager: started", v12, 2u);
      MEMORY[0x2533853C0](v12, -1, -1);
    }
  }
}

void sub_250BEEBA8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250C1D2F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v10 = a2;
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_250C1D3A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269AFCA38);
    id v12 = a2;
    id v13 = a2;
    uint64_t v28 = sub_250C1D388();
    os_log_type_t v14 = sub_250C1D948();
    if (os_log_type_enabled(v28, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(void *)&v38[0] = v16;
      *(_DWORD *)id v15 = 136315138;
      swift_getErrorValue();
      uint64_t v17 = sub_250C1DD28();
      *(void *)&long long v31 = sub_250BE1D68(v17, v18, (uint64_t *)v38);
      sub_250C1DA48();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250BD9000, v28, v14, "HeadPhoneMotionError: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v16, -1, -1);
      MEMORY[0x2533853C0](v15, -1, -1);
    }
    else
    {

      uint64_t v26 = v28;
    }
  }
  else if (a1)
  {
    uint64_t v19 = a3 + 16;
    id v20 = a1;
    sub_250C1D2C8();
    sub_250C1D2A8();
    double v22 = v21;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_250BFAFB4(v20, (uint64_t)&v31, v22);

    swift_beginAccess();
    uint64_t v23 = MEMORY[0x253385440](v19);
    if (v23)
    {
      unsigned int v24 = (void *)v23;
      v38[4] = v35;
      v38[5] = v36;
      v39[0] = v37[0];
      *(_OWORD *)((char *)v39 + 9) = *(_OWORD *)((char *)v37 + 9);
      v38[0] = v31;
      v38[1] = v32;
      v38[2] = v33;
      v38[3] = v34;
      sub_250C1D3E8();
      v29[4] = v35;
      v29[5] = v36;
      v30[0] = v37[0];
      *(_OWORD *)((char *)v30 + 9) = *(_OWORD *)((char *)v37 + 9);
      v29[0] = v31;
      v29[1] = v32;
      v29[2] = v33;
      uint64_t v29[3] = v34;
      nullsub_1(v29);
      uint64_t v25 = (uint64_t)v24 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
      sub_250BDE95C((uint64_t)v24 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v38);
      sub_250BDE95C((uint64_t)v29, v25);
      sub_250BF0468((uint64_t)v38);
    }
  }
}

void sub_250BEEF78()
{
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_250C1D3A8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269AFCA38);
  uint64_t v2 = sub_250C1D388();
  os_log_type_t v3 = sub_250C1D958();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)os_log_type_t v4 = 136315138;
    sub_250BE1D68(0x2928706F7473, 0xE600000000000000, &v9);
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v2, v3, "HGHeadphoneMotionManager:%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v5, -1, -1);
    MEMORY[0x2533853C0](v4, -1, -1);
  }

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_cmMotionManager), sel_stopDeviceMotionUpdates);
  uint64_t v6 = sub_250C1D388();
  os_log_type_t v7 = sub_250C1D958();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_250BD9000, v6, v7, "HGHeadphoneMotionManager: stopped", v8, 2u);
    MEMORY[0x2533853C0](v8, -1, -1);
  }
}

void sub_250BEF2C8()
{
}

id sub_250BEF2D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGHeadphoneMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250BEF320()
{
  return type metadata accessor for HGHeadphoneMotionDataProvider();
}

uint64_t type metadata accessor for HGHeadphoneMotionDataProvider()
{
  uint64_t result = qword_269AF9598;
  if (!qword_269AF9598) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250BEF374()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250BEF3C4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250BEF3FC(void *a1, void *a2)
{
  sub_250BEEBA8(a1, a2, v2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_250BEF41C()
{
  uint64_t v1 = v0;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250C1D3A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269AFCA38);
  os_log_type_t v3 = sub_250C1D388();
  os_log_type_t v4 = sub_250C1D958();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_250BE1D68(0xD000000000000024, 0x8000000250C22EB0, &v7);
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v6, -1, -1);
    MEMORY[0x2533853C0](v5, -1, -1);
  }

  *(unsigned char *)(v1 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 1;
}

void sub_250BEF5AC()
{
  uint64_t v1 = v0;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250C1D3A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269AFCA38);
  os_log_type_t v3 = sub_250C1D388();
  os_log_type_t v4 = sub_250C1D958();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_250BE1D68(0xD000000000000027, 0x8000000250C22E80, &v7);
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v3, v4, "HGHeadphoneMotionManager:%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v6, -1, -1);
    MEMORY[0x2533853C0](v5, -1, -1);
  }

  *(unsigned char *)(v1 + OBJC_IVAR____TtC12HeadGestures29HGHeadphoneMotionDataProvider_headphoneConnected) = 0;
}

void *static HGUtils.getCurrentModelVersion()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_250C1D198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  os_log_type_t v4 = sub_250BECC34((uint64_t)v2);
  sub_250BE3F58((uint64_t)v2);
  if (v4)
  {
    id v5 = v4;
    os_log_type_t v4 = (void *)sub_250BEB758();
    uint64_t v7 = v6;

    if (!v7) {
      return 0;
    }
  }
  return v4;
}

uint64_t _s12HeadGestures7HGUtilsV19headGestureToString0dE0SSSo06HGHeadE0V_tFZ_0(unint64_t a1)
{
  if (a1 > 2) {
    return 0x6E776F6E6B6E55;
  }
  else {
    return *(void *)&aBackgrounod_1[8 * a1];
  }
}

uint64_t _s12HeadGestures7HGUtilsV23headGesturePartToString0deF0SSSo06HGHeadeF0V_tFZ_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return *(void *)&aNodup_1[8 * a1 - 8];
  }
}

ValueMetadata *type metadata accessor for HGUtils()
{
  return &type metadata for HGUtils;
}

uint64_t sub_250BEF8D0()
{
  uint64_t v1 = v0;
  sub_250C1DB08();
  sub_250C1D768();
  id v2 = v0[2];
  id v3 = objc_msgSend(v2, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v4 = v1[3];
  id v5 = objc_msgSend(v4, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v6 = v1[4];
  id v7 = objc_msgSend(v6, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v8 = v1[5];
  id v9 = objc_msgSend(v8, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v10 = v1[6];
  id v11 = objc_msgSend(v10, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v12 = v1[7];
  id v13 = objc_msgSend(v12, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  return 0;
}

id sub_250BEFBE4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E6F697461746F52 && a2 == 0xE900000000000058;
  if (v3 || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 2;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6E6F697461746F52 && a2 == 0xE900000000000059 || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 3;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6E6F697461746F52 && a2 == 0xE90000000000005ALL || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 4;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED0000586E6F6974 || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 5;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED0000596E6F6974 || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 6;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  if (a1 == 0x6172656C65636341 && a2 == 0xED00005A6E6F6974 || (sub_250C1DCF8() & 1) != 0)
  {
    id v6 = v2 + 7;
    return objc_msgSend(self, sel_featureValueWithMultiArray_, *v6);
  }
  return 0;
}

uint64_t sub_250BEFF04()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLInput()
{
  return self;
}

uint64_t sub_250BEFF88()
{
  return sub_250BEF8D0();
}

uint64_t sub_250BEFFAC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9500);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_250C1F8C0;
  *(void *)(inited + 32) = 0x6E6F697461746F52;
  *(void *)(inited + 40) = 0xE900000000000058;
  *(void *)(inited + 48) = 0x6E6F697461746F52;
  *(void *)(inited + 56) = 0xE900000000000059;
  *(void *)(inited + 64) = 0x6E6F697461746F52;
  *(void *)(inited + 72) = 0xE90000000000005ALL;
  strcpy((char *)(inited + 80), "AccelerationX");
  *(_WORD *)(inited + 94) = -4864;
  strcpy((char *)(inited + 96), "AccelerationY");
  *(_WORD *)(inited + 110) = -4864;
  strcpy((char *)(inited + 112), "AccelerationZ");
  *(_WORD *)(inited + 126) = -4864;
  uint64_t v1 = sub_250C1CEA0(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

uint64_t sub_250BF00A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_250BF00B8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_250BF00CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_250BF0140()
{
  unsigned __int8 v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9488);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor;
  if (*(void *)&v0[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor])
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
  }
  *(void *)&v0[v5] = 0;
  swift_release();
  sub_250BF2244();
  id v6 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v7 = sub_250C1DA08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
  uint64_t v8 = sub_250C1D9E8();

  sub_250BF2284((uint64_t)v4);
  uint64_t v14 = v8;
  sub_250C1D9D8();
  sub_250BF22E4();
  uint64_t v9 = sub_250C1D408();
  swift_release();
  uint64_t v14 = v9;
  *(void *)(swift_allocObject() + 16) = v1;
  id v10 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9688);
  sub_250BDDD60(&qword_269AF9690, &qword_269AF9688);
  uint64_t v11 = sub_250C1D5C8();
  swift_release();
  swift_release();
  *(void *)&v1[v5] = v11;
  return swift_release();
}

uint64_t sub_250BF0378@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_250BF03F8(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_250C1D478();
}

uint64_t sub_250BF0468(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_250BDE95C(a1, (uint64_t)v40);
  sub_250BDE95C((uint64_t)v40, (uint64_t)v42);
  sub_250BDE95C(a1, (uint64_t)v41);
  if (sub_250BDE9C4((uint64_t)v41) == 1)
  {
    sub_250BDE95C(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v38);
    sub_250BDE95C((uint64_t)v38, (uint64_t)v39);
    uint64_t result = sub_250BDE9C4((uint64_t)v39);
    if (result != 1)
    {
      if (qword_269AF8F80 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_250C1D3A8();
      __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
      id v6 = sub_250C1D388();
      os_log_type_t v7 = sub_250C1D958();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_250BD9000, v6, v7, "HGMotionDataProvider started receiving sensor data...", v8, 2u);
        MEMORY[0x2533853C0](v8, -1, -1);
      }

      if (qword_269AF8F70 != -1) {
        swift_once();
      }
      uint64_t v9 = qword_269AFCA00;
      type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
      swift_allocObject();
      sub_250C1D2C8();
      swift_beginAccess();
      uint64_t v10 = swift_retain();
      MEMORY[0x253384610](v10);
      if (*(void *)((*(void *)(v9 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v9 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
        sub_250C1D838();
      sub_250C1D858();
      sub_250C1D828();
      swift_endAccess();
      swift_release();
      return sub_250BF0140();
    }
    return result;
  }
  sub_250BDE95C(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v38);
  sub_250BDE95C((uint64_t)v38, (uint64_t)v39);
  if (sub_250BDE9C4((uint64_t)v39) == 1)
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_250C1D3A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269AFCA38);
    id v12 = sub_250C1D388();
    os_log_type_t v13 = sub_250C1D958();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_250BD9000, v12, v13, "HGMotionDataProvider data stream stopped...", v14, 2u);
      MEMORY[0x2533853C0](v14, -1, -1);
    }

    uint64_t v15 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor;
    if (*(void *)(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor))
    {
      swift_retain();
      sub_250C1D3C8();
      swift_release();
    }
    *(void *)(v2 + v15) = 0;
    return swift_release();
  }
  sub_250BDE95C((uint64_t)v42, (uint64_t)v34);
  sub_250BDE95C((uint64_t)v38, (uint64_t)v36);
  double v16 = v37 - v35;
  uint64_t v17 = (void **)(v2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_samplingRatePool);
  swift_beginAccess();
  unint64_t v18 = *v17;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v17 = v18;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v18 = sub_250BF151C(0, v18[2] + 1, 1, v18);
    *uint64_t v17 = v18;
  }
  unint64_t v21 = v18[2];
  unint64_t v20 = v18[3];
  double v22 = 1.0 / v16;
  if (v21 >= v20 >> 1)
  {
    unint64_t v18 = sub_250BF151C((void *)(v20 > 1), v21 + 1, 1, v18);
    *uint64_t v17 = v18;
  }
  v18[2] = v21 + 1;
  *(double *)&v18[v21 + 4] = v22;
  uint64_t v23 = *v17;
  uint64_t result = swift_endAccess();
  unint64_t v24 = v23[2];
  if (v24 >= 0xA)
  {
    uint64_t v25 = (double *)(v23 + 5);
    double v26 = 0.0;
    uint64_t v27 = v24 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      double v26 = v26 + *(v25 - 1) + *v25;
      v25 += 2;
      v27 -= 2;
    }
    while (v27);
    unint64_t v28 = v24 - (v24 & 0x7FFFFFFFFFFFFFFELL);
    if (v28)
    {
      uint64_t v29 = (double *)&v23[2 * (v24 >> 1) + 4];
      do
      {
        double v30 = *v29++;
        double v26 = v26 + v30;
        --v28;
      }
      while (v28);
    }
    double v31 = v26 / (double)(uint64_t)v24;
    *uint64_t v17 = (void *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    if (qword_269AF8F70 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_269AFCA00;
    type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
    *(double *)(swift_allocObject()
              + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate) = v31;
    sub_250C1D2C8();
    swift_beginAccess();
    uint64_t v33 = swift_retain();
    MEMORY[0x253384610](v33);
    if (*(void *)((*(void *)(v32 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v32 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_250C1D838();
    sub_250C1D858();
    sub_250C1D828();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

char *sub_250BF0A30()
{
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9658);
  uint64_t v1 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  id v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9048);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  os_log_type_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataSubject;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9660);
  swift_allocObject();
  uint64_t v9 = v0;
  *(void *)&v0[v8] = sub_250C1D3F8();
  uint64_t v10 = &v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider__isStreamingData];
  v25[0] = 0;
  sub_250C1D428();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v4);
  *(void *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher] = 0;
  uint64_t v11 = OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue;
  *(void *)&v9[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A48]), sel_init);
  *(void *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_streamingStatueMonitor] = 0;
  *(void *)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_samplingRatePool] = MEMORY[0x263F8EE78];
  uint64_t v12 = (uint64_t)&v9[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion];
  sub_250BDE9E0((uint64_t)v25);
  sub_250BDE95C((uint64_t)v25, v12);

  os_log_type_t v13 = (objc_class *)type metadata accessor for HGMotionDataProvider();
  v24.receiver = v9;
  v24.super_class = v13;
  uint64_t v14 = (char *)objc_msgSendSuper2(&v24, sel_init);
  uint64_t v15 = *(void **)&v14[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue];
  double v16 = v14;
  objc_msgSend(v15, sel_setMaxConcurrentOperationCount_, 1);
  uint64_t v23 = *(void *)&v16[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataSubject];
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_250BDDD60(&qword_269AF9668, &qword_269AF9660);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_250C1D4B8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_250BDDD60(&qword_269AF9670, &qword_269AF9658);
  uint64_t v17 = v22;
  uint64_t v18 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v17);
  *(void *)&v16[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_motionDataPublisher] = v18;
  uint64_t v19 = swift_release();
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v16) + 0x130))(v19);

  return v16;
}

void sub_250BF0E74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  id v3 = (void *)MEMORY[0x253385440](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x138))();
  }
}

void sub_250BF0F00(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = (void *)MEMORY[0x253385440](v1);
  if (v2)
  {
    id v3 = v2;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x140))();
  }
}

uint64_t sub_250BF0FB0(uint64_t a1, void *a2)
{
  uint64_t v3 = (uint64_t)a2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
  sub_250BDE95C((uint64_t)a2 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v11);
  sub_250BDE95C((uint64_t)v11, (uint64_t)v12);
  uint64_t result = sub_250BDE9C4((uint64_t)v12);
  if (result != 1)
  {
    double v5 = v13;
    sub_250C1D2A8();
    if (vabdd_f64(v5, v6) <= 1.0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v10[0] = 1;
      id v8 = a2;
    }
    else
    {
      sub_250BDE9E0((uint64_t)v9);
      sub_250BDE95C(v3, (uint64_t)v10);
      sub_250BDE95C((uint64_t)v9, v3);
      sub_250BF0468(v10);
      swift_getKeyPath();
      swift_getKeyPath();
      id v7 = a2;
    }
    return sub_250C1D478();
  }
  return result;
}

void sub_250BF10D8()
{
}

void sub_250BF1134()
{
}

void sub_250BF1190()
{
}

id sub_250BF11EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250BF12E8()
{
  return type metadata accessor for HGMotionDataProvider();
}

uint64_t type metadata accessor for HGMotionDataProvider()
{
  uint64_t result = qword_269AF9620;
  if (!qword_269AF9620) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_250BF133C()
{
  sub_250BE3D08();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *sub_250BF140C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96A8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 + 95;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 7);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 4]) {
          memmove(v13, a4 + 4, v8 << 7);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_250BF1C78(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_250BF151C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9630);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250BF1D64(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_250BF162C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9650);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250BF1E50(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_250BF173C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9648);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250BF1E50(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_250BF184C(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96A0);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      double v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      double v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_250BF1F3C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_250BF195C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9640);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250BF1D64(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_250BF1A6C(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9698);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      double v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      double v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250BF2028(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_250BF1B7C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9638);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_250BF2114(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_250BF1C78(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + (a1 << 7) + 32);
    size_t v6 = v4 << 7;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250BF1D64(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250BF1E50(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250BF1F3C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250BF2028(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250BF2114(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    size_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250BF21FC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250BF2234(uint64_t a1)
{
  sub_250BF0E74(a1, v1);
}

void sub_250BF223C()
{
  sub_250BF0F00(v0);
}

unint64_t sub_250BF2244()
{
  unint64_t result = qword_269AF9678;
  if (!qword_269AF9678)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF9678);
  }
  return result;
}

uint64_t sub_250BF2284(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9488);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_250BF22E4()
{
  unint64_t result = qword_269AF9680;
  if (!qword_269AF9680)
  {
    sub_250C1D9D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9680);
  }
  return result;
}

uint64_t sub_250BF233C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250BF2374(uint64_t a1)
{
  return sub_250BF0FB0(a1, *(void **)(v1 + 16));
}

uint64_t sub_250BF2384(void *a1)
{
  uint64_t v3 = sub_250C1D5D8();
  uint64_t v21 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250C1D5F8();
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine;
  id v10 = objc_allocWithZone(MEMORY[0x263EF9360]);
  swift_retain();
  *(void *)(v1 + v9) = objc_msgSend(v10, sel_init);
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo) = 3;
  swift_beginAccess();
  sub_250C19494(v24);
  uint64_t v11 = v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
  long long v12 = v24[1];
  *(_OWORD *)uint64_t v11 = v24[0];
  *(_OWORD *)(v11 + 16) = v12;
  *(void *)(v11 + 32) = v25;
  swift_release();
  id v13 = a1;
  uint64_t v14 = sub_250BDD628(v13);

  uint64_t v15 = *(void **)(v14 + 24);
  aBlock[4] = sub_250BF61A0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_57;
  double v16 = _Block_copy(aBlock);
  swift_retain_n();
  id v17 = v15;
  sub_250C1D5E8();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_250BF600C((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v8, v5, v16);
  swift_release();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
  swift_release();
  return v14;
}

id sub_250BF2728()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_, v0);

  id result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  objc_msgSend(result, sel_stop);
  id result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_msgSend(result, sel_stop);
  id result = *(id *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_stop);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  return objc_msgSend(v3, sel_stop);
}

void sub_250BF27F4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_250C1D348();
  Class isa = v4[-1].isa;
  MEMORY[0x270FA5388](v4);
  uint64_t v94 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250C1D3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v12 = (char *)&v85 - v11;
  id v13 = (unsigned char *)(*(void *)(v1 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  if (*v13 != 1) {
    return;
  }
  uint64_t v93 = v6;
  uint64_t v14 = (void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  double v16 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  id v17 = objc_msgSend(a1, sel_headGesture);
  if (v17 != (id)2)
  {
    if (v17 != (id)1) {
      goto LABEL_12;
    }
    double v16 = v15;
  }
  if (v16)
  {
    os_log_t v90 = v4;
    v91 = (id *)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
    uint64_t v18 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
    if (v18)
    {
      uint64_t v19 = swift_allocObject();
      swift_weakInit();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = a1;
      *(void *)(v20 + 24) = v19;
      aBlock[4] = (uint64_t)sub_250BF60CC;
      aBlock[5] = v20;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_250BF3B24;
      aBlock[3] = (uint64_t)&block_descriptor_47;
      uint64_t v21 = _Block_copy(aBlock);
      id v22 = v16;
      id v23 = v18;
      id v24 = a1;
      swift_release();
      id v92 = v22;
      objc_msgSend(v23, sel_scheduleBuffer_completionCallbackType_completionHandler_, v22, 2, v21);
      _Block_release(v21);

      if (qword_269AF8F80 != -1) {
        swift_once();
      }
      uint64_t v25 = v93;
      uint64_t v26 = __swift_project_value_buffer(v93, (uint64_t)qword_269AFCA38);
      uint64_t v27 = v7;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v26, v25);
      id v28 = v24;
      swift_retain_n();
      id v29 = v28;
      double v30 = sub_250C1D388();
      int v31 = sub_250C1D938();
      BOOL v32 = os_log_type_enabled(v30, (os_log_type_t)v31);
      os_log_t v33 = v90;
      if (!v32)
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v25);
LABEL_29:
        uint64_t v60 = v92;
        swift_getKeyPath();
        swift_getKeyPath();
        LOBYTE(aBlock[0]) = 0;
        swift_retain();
        sub_250C1D478();
        unint64_t v45 = v91;
LABEL_48:
        id v83 = *v45;
        id v84 = *v45;
        sub_250BF59AC(v2, v83);

        return;
      }
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      aBlock[0] = v35;
      *(_DWORD *)uint64_t v34 = 136315650;
      unint64_t v36 = (unint64_t)objc_msgSend(v29, sel_headGesture);
      os_log_t v88 = v30;
      int v87 = v31;
      uint64_t v86 = v35;
      if (v36 > 2)
      {
        uint64_t v38 = 0x6E776F6E6B6E55;
        unint64_t v39 = 0xE700000000000000;
      }
      else
      {
        uint64_t v37 = 8 * v36;
        uint64_t v38 = *(void *)&aBackgrounod_2[8 * v36];
        unint64_t v39 = *(void *)&aNd_2[v37];
      }
      double v97 = COERCE_DOUBLE(sub_250BE1D68(v38, v39, aBlock));
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      uint64_t v89 = v34 + 14;
      id v52 = objc_msgSend(v29, sel_uuid);
      uint64_t v53 = v94;
      sub_250C1D328();

      sub_250BF600C((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
      uint64_t v54 = sub_250C1DCE8();
      unint64_t v56 = v55;
      (*((void (**)(char *, os_log_t))isa + 1))(v53, v33);
      double v97 = COERCE_DOUBLE(sub_250BE1D68(v54, v56, aBlock));
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 2048;
      if (*v91)
      {
        objc_msgSend(*v91, sel_volume);
        double v97 = v57;
        sub_250C1DA48();
        swift_release_n();
        os_log_t v58 = v88;
        _os_log_impl(&dword_250BD9000, v88, (os_log_type_t)v87, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v34, 0x20u);
        uint64_t v59 = v86;
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v59, -1, -1);
        MEMORY[0x2533853C0](v34, -1, -1);

        (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v93);
        goto LABEL_29;
      }
      goto LABEL_53;
    }
    goto LABEL_51;
  }
LABEL_12:
  os_log_type_t v41 = *v14;
  uint64_t v40 = v14[1];
  int v42 = (char *)objc_msgSend(a1, sel_headGesturePart);
  if ((unint64_t)(v42 - 1) < 2)
  {
    uint64_t v40 = v41;
    uint64_t v44 = v7;
    uint64_t v43 = v93;
    if (!v40) {
      return;
    }
LABEL_18:
    unint64_t v45 = (id *)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
    uint64_t v46 = *(void **)(v2 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
    if (!v46)
    {
LABEL_52:
      __break(1u);
LABEL_53:
      swift_release();
      __break(1u);
LABEL_54:
      swift_release();
      __break(1u);
      return;
    }
    id v47 = v40;
    objc_msgSend(v46, sel_scheduleBuffer_atTime_options_completionHandler_, v47, 0, 2, 0);
    if (objc_msgSend(a1, sel_headGesturePart) == (id)2)
    {
      id v50 = *v45;
      if (*v45)
      {
        double v51 = 0.0;
        LODWORD(v48) = -1110651699;
LABEL_36:
        LODWORD(v49) = LODWORD(v48);
        objc_msgSend(v50, sel_setPosition_, v51, v48, v49);
LABEL_37:
        id v61 = *v45;
        if (*v45)
        {
          id v92 = v47;
          id v62 = v61;
          sub_250BDBB0C((uint64_t)objc_msgSend(a1, sel_headGesturePart));
          *(float *)&double v63 = v63;
          objc_msgSend(v62, sel_setVolume_, v63);

          if (qword_269AF8F80 != -1) {
            swift_once();
          }
          uint64_t v64 = __swift_project_value_buffer(v43, (uint64_t)qword_269AFCA38);
          (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v10, v64, v43);
          id v65 = a1;
          swift_retain_n();
          id v66 = v65;
          id v67 = sub_250C1D388();
          int v68 = sub_250C1D938();
          if (os_log_type_enabled(v67, (os_log_type_t)v68))
          {
            LODWORD(v89) = v68;
            os_log_t v90 = v67;
            uint64_t v69 = swift_slowAlloc();
            uint64_t v70 = swift_slowAlloc();
            aBlock[0] = (uint64_t)v70;
            *(_DWORD *)uint64_t v69 = 136315650;
            unint64_t v71 = (char *)objc_msgSend(v66, sel_headGesturePart);
            uint64_t v85 = v44;
            os_log_t v88 = v70;
            if ((unint64_t)(v71 - 1) > 3)
            {
              uint64_t v73 = 0x6E776F6E6B6E75;
              unint64_t v74 = 0xE700000000000000;
            }
            else
            {
              uint64_t v72 = 8 * (void)(v71 - 1);
              uint64_t v73 = *(void *)&aNodup_2[v72];
              unint64_t v74 = *(void *)&aShakelefshaker_1[v72 + 16];
            }
            double v97 = COERCE_DOUBLE(sub_250BE1D68(v73, v74, aBlock));
            sub_250C1DA48();

            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 12) = 2080;
            v91 = (id *)(v69 + 14);
            id v75 = objc_msgSend(v66, sel_uuid);
            uint64_t v76 = v94;
            sub_250C1D328();

            sub_250BF600C((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
            uint64_t v77 = sub_250C1DCE8();
            unint64_t v79 = v78;
            (*((void (**)(char *, NSObject *))isa + 1))(v76, v4);
            double v97 = COERCE_DOUBLE(sub_250BE1D68(v77, v79, aBlock));
            sub_250C1DA48();

            swift_bridgeObjectRelease();
            *(_WORD *)(v69 + 22) = 2048;
            if (!*v45) {
              goto LABEL_54;
            }
            objc_msgSend(*v45, sel_volume);
            double v97 = v80;
            sub_250C1DA48();
            swift_release_n();
            os_log_t v81 = v90;
            _os_log_impl(&dword_250BD9000, v90, (os_log_type_t)v89, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v69, 0x20u);
            os_log_t v82 = v88;
            swift_arrayDestroy();
            MEMORY[0x2533853C0](v82, -1, -1);
            MEMORY[0x2533853C0](v69, -1, -1);

            (*(void (**)(char *, uint64_t))(v85 + 8))(v10, v93);
          }
          else
          {

            swift_release_n();
            (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v43);
          }
          uint64_t v60 = v92;
          goto LABEL_48;
        }
      }
    }
    else if (objc_msgSend(a1, sel_headGesturePart) == (id)1)
    {
      id v50 = *v45;
      if (*v45)
      {
        double v51 = 0.0;
        LODWORD(v48) = 1036831949;
        goto LABEL_36;
      }
    }
    else if (objc_msgSend(a1, sel_headGesturePart) == (id)3)
    {
      id v50 = *v45;
      if (*v45)
      {
        double v48 = 0.0;
        LODWORD(v51) = -1.0;
        goto LABEL_36;
      }
    }
    else
    {
      if (objc_msgSend(a1, sel_headGesturePart) != (id)4) {
        goto LABEL_37;
      }
      id v50 = *v45;
      if (*v45)
      {
        double v48 = 0.0;
        LODWORD(v51) = 1.0;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v43 = v93;
  if (v42 == (char *)3 || v42 == (char *)4)
  {
    uint64_t v44 = v7;
    if (v40) {
      goto LABEL_18;
    }
  }
}

uint64_t sub_250BF33A0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250C1D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v48 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_250C1D5F8();
  uint64_t v47 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v46 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250C1D348();
  uint64_t v45 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  long long v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250C1D3A8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t result = MEMORY[0x270FA5388](v13);
  id v17 = (char *)v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 2)
  {
    uint64_t v42 = a3 + 16;
    uint64_t v43 = v7;
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v13, (uint64_t)qword_269AFCA38);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
    id v19 = a2;
    uint64_t v20 = sub_250C1D388();
    int v21 = sub_250C1D938();
    BOOL v22 = os_log_type_enabled(v20, (os_log_type_t)v21);
    uint64_t v44 = v6;
    if (v22)
    {
      int v41 = v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      aBlock[0] = v40;
      *(_DWORD *)uint64_t v23 = 136315394;
      unint64_t v24 = (unint64_t)objc_msgSend(v19, sel_headGesture);
      if (v24 > 2)
      {
        unint64_t v27 = 0xE700000000000000;
        uint64_t v26 = 0x6E776F6E6B6E55;
      }
      else
      {
        uint64_t v25 = 8 * v24;
        uint64_t v26 = *(void *)&aBackgrounod_2[8 * v24];
        unint64_t v27 = *(void *)&aNd_2[v25];
      }
      uint64_t v51 = sub_250BE1D68(v26, v27, aBlock);
      v39[1] = &v52;
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      id v28 = objc_msgSend(v19, sel_uuid, v23 + 14);
      sub_250C1D328();

      sub_250BF600C((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
      uint64_t v29 = sub_250C1DCE8();
      unint64_t v31 = v30;
      (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v10);
      uint64_t v51 = sub_250BE1D68(v29, v31, aBlock);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250BD9000, v20, (os_log_type_t)v41, "[Audio] Finished playing Audio feedback %s UUID: %s", (uint8_t *)v23, 0x16u);
      uint64_t v32 = v40;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v32, -1, -1);
      MEMORY[0x2533853C0](v23, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
    sub_250BE79C8(0, (unint64_t *)&qword_269AF90C0);
    os_log_t v33 = (void *)sub_250C1D9A8();
    uint64_t v34 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    aBlock[4] = (uint64_t)sub_250BF60D4;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_250BFD1B4;
    aBlock[3] = (uint64_t)&block_descriptor_51;
    uint64_t v35 = _Block_copy(aBlock);
    swift_release();
    unint64_t v36 = v46;
    sub_250C1D5E8();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_250BF600C((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
    sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
    uint64_t v37 = v48;
    uint64_t v38 = v44;
    sub_250C1DA88();
    MEMORY[0x2533847D0](0, v36, v37, v35);
    _Block_release(v35);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v37, v38);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v36, v49);
  }
  return result;
}

uint64_t sub_250BF3AA0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_250C1D478();
  }
  return result;
}

uint64_t sub_250BF3B24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_250BF3B78()
{
  uint64_t v1 = sub_250C1D5D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D5F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 24);
  aBlock[4] = sub_250BF59A4;
  uint64_t v13 = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_38;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_250C1D5E8();
  v11[1] = MEMORY[0x263F8EE78];
  sub_250BF600C((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

void sub_250BF3E1C(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (v2)
  {
    id v4 = v2;
    sub_250BF514C(v4, (uint64_t)nullsub_1, 0, 1.0);
    uint64_t v5 = *(void **)(a1 + v1);
    id v6 = v5;
    sub_250BF59AC(a1, v5);
  }
}

uint64_t sub_250BF3EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250C1D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250C1D5F8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(void *)(v3 + 24);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_250BF5980;
  void aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_2;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_250C1D5E8();
  v17[1] = MEMORY[0x263F8EE78];
  sub_250BF600C((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_250BF419C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (v3)
  {
    id v6 = v3;
    sub_250BF514C(v6, a2, a3, 0.0);
  }
}

void sub_250BF4224(uint64_t a1)
{
  v52[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  if (*(void *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode))
  {
    uint64_t v3 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
    if ((objc_msgSend(v3, sel_isRunning) & 1) == 0)
    {
      id v4 = *(void **)(a1 + v1);
      if (v4)
      {
        id v5 = v4;
        id v6 = objc_msgSend(v3, sel_mainMixerNode);
        id v7 = sub_250BF4F4C();
        objc_msgSend(v3, sel_connect_to_format_, v5, v6, v7);

        uint64_t v8 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
        uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
        if (v9)
        {
          uint64_t v10 = *(void **)(a1 + v1);
          if (v10)
          {
            uint64_t v11 = a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
            uint64_t v12 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
            if (v12)
            {
              id v13 = v9;
              id v14 = v10;
              id v15 = objc_msgSend(v12, sel_format);
              objc_msgSend(v3, sel_connect_to_format_, v13, v14, v15);

              uint64_t v16 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
              id v17 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
              if (v17)
              {
                uint64_t v18 = *(void **)(a1 + v1);
                if (v18)
                {
                  id v19 = *(void **)(v11 + 16);
                  if (v19)
                  {
                    id v20 = v17;
                    id v21 = v18;
                    id v22 = objc_msgSend(v19, sel_format);
                    objc_msgSend(v3, sel_connect_to_format_, v20, v21, v22);

                    uint64_t v23 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
                    unint64_t v24 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
                    if (v24)
                    {
                      id v25 = v24;
                      id v26 = objc_msgSend(v3, sel_mainMixerNode);
                      unint64_t v27 = *(void **)(v11 + 32);
                      if (v27)
                      {
                        id v28 = v26;
                        id v29 = objc_msgSend(*(id *)(v11 + 32), sel_format);
                        objc_msgSend(v3, sel_connect_to_format_, v25, v28, v29);

                        unint64_t v30 = *(void **)(a1 + v8);
                        if (v30)
                        {
                          objc_msgSend(v30, sel_setRenderingAlgorithm_, *(void *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo));
                          uint64_t v32 = *(void **)(a1 + v8);
                          if (v32)
                          {
                            LODWORD(v31) = 1050253722;
                            objc_msgSend(v32, sel_setReverbBlend_, v31);
                            os_log_t v33 = *(void **)(a1 + v1);
                            if (v33)
                            {
                              objc_msgSend(v33, sel_setListenerPosition_, 0.0, 0.0, 0.0);
                              uint64_t v34 = *(void **)(a1 + v16);
                              if (v34)
                              {
                                objc_msgSend(v34, sel_setPosition_, 0.0, 0.0, 0.0);
                                uint64_t v35 = *(void **)(a1 + v23);
                                if (v35)
                                {
                                  id v36 = v27;
                                  id v37 = v35;
                                  objc_msgSend(v37, sel_stop);
                                  objc_msgSend(v37, sel_scheduleBuffer_atTime_options_completionHandler_, v36, 0, 1, 0);
                                  objc_msgSend(v37, sel_setVolume_, 0.0);
                                }
                                if (qword_269AF8F80 != -1) {
                                  swift_once();
                                }
                                uint64_t v38 = sub_250C1D3A8();
                                __swift_project_value_buffer(v38, (uint64_t)qword_269AFCA38);
                                unint64_t v39 = sub_250C1D388();
                                os_log_type_t v40 = sub_250C1D928();
                                if (os_log_type_enabled(v39, v40))
                                {
                                  int v41 = (uint8_t *)swift_slowAlloc();
                                  *(_WORD *)int v41 = 0;
                                  _os_log_impl(&dword_250BD9000, v39, v40, "[HGAudioPlayer] Starting the audio engine", v41, 2u);
                                  MEMORY[0x2533853C0](v41, -1, -1);
                                }

                                objc_msgSend(v3, sel_prepare);
                                v52[0] = 0;
                                if (!objc_msgSend(v3, sel_startAndReturnError_, v52))
                                {
                                  id v42 = v52[0];
                                  uint64_t v43 = (void *)sub_250C1D128();

                                  swift_willThrow();
                                  id v44 = v43;
                                  id v45 = v43;
                                  uint64_t v46 = sub_250C1D388();
                                  os_log_type_t v47 = sub_250C1D948();
                                  if (os_log_type_enabled(v46, v47))
                                  {
                                    double v48 = (uint8_t *)swift_slowAlloc();
                                    uint64_t v49 = (void *)swift_slowAlloc();
                                    v52[0] = v49;
                                    *(_DWORD *)double v48 = 136315138;
                                    swift_getErrorValue();
                                    uint64_t v50 = sub_250C1DD28();
                                    sub_250BE1D68(v50, v51, (uint64_t *)v52);
                                    sub_250C1DA48();
                                    swift_bridgeObjectRelease();

                                    _os_log_impl(&dword_250BD9000, v46, v47, "[HGAudioPlayer] Unable to start the AudioEngine: %s", v48, 0xCu);
                                    swift_arrayDestroy();
                                    MEMORY[0x2533853C0](v49, -1, -1);
                                    MEMORY[0x2533853C0](v48, -1, -1);
                                  }
                                  else
                                  {
                                  }
                                  return;
                                }
_objc_retain_x1:
                                MEMORY[0x270F9A8A0]();
                                return;
                              }
LABEL_42:
                              __break(1u);
                              goto _objc_retain_x1;
                            }
LABEL_41:
                            __break(1u);
                            goto LABEL_42;
                          }
LABEL_40:
                          __break(1u);
                          goto LABEL_41;
                        }
LABEL_39:
                        __break(1u);
                        goto LABEL_40;
                      }
LABEL_38:
                      __break(1u);
                      goto LABEL_39;
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
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_32;
    }
  }
}

void sub_250BF484C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (unsigned int *)(*(void *)(v0 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (v3)
  {
    id v4 = objc_msgSend(self, sel_retrieveSessionWithID_, v3);
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine), sel_setAudioSession_, v4);
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_250C1D3A8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
    swift_retain();
    id v6 = sub_250C1D388();
    os_log_type_t v7 = sub_250C1D958();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109120;
      swift_beginAccess();
      sub_250C1DA48();
      swift_release();
      _os_log_impl(&dword_250BD9000, v6, v7, "[AudioSession] Attached session ID %u", v8, 8u);
      MEMORY[0x2533853C0](v8, -1, -1);
    }
    else
    {

      swift_release();
      id v6 = v4;
    }
  }
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93C8]), sel_init);
  uint64_t v10 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode) = v9;

  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93C8]), sel_init);
  uint64_t v13 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
  id v14 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode) = v12;

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93C8]), sel_init);
  uint64_t v16 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
  id v17 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode) = v15;

  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9370]), sel_init);
  uint64_t v19 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  id v20 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode);
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode) = v18;

  if (!*(void *)(v1 + v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  id v21 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  objc_msgSend(v21, sel_attachNode_);
  if (!*(void *)(v1 + v13))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_msgSend(v21, sel_attachNode_);
  if (!*(void *)(v1 + v16))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  objc_msgSend(v21, sel_attachNode_);
  if (*(void *)(v1 + v10))
  {
    objc_msgSend(v21, sel_attachNode_);
    sub_250BF4B94();
    sub_250BF4224(v1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_250C1D478();
    return;
  }
LABEL_16:
  __break(1u);
}

void sub_250BF4B94()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_handleAudioEngineConfigurationChangeWithNotification_, *MEMORY[0x263EF9020], *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine));
  uint64_t v2 = (unsigned int *)(*(void *)(v0 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_audioSessionID);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (v3)
  {
    id v4 = objc_msgSend(self, sel_retrieveSessionWithID_, v3);
    uint64_t v5 = *MEMORY[0x263EF90A0];
    id v6 = v4;
    objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_handleInterruptionWithNotification_, v5, v6);
  }
}

id sub_250BF4CB4(uint64_t a1)
{
  return sub_250BF4CE4(a1, "[HGAudioPlayer] Received Audio Session Interruption notification...");
}

id sub_250BF4CD8(uint64_t a1)
{
  return sub_250BF4CE4(a1, "[HGAudioPlayer] Received Audio Engine Configuration changed notification...");
}

id sub_250BF4CE4(uint64_t a1, const char *a2)
{
  uint64_t v4 = v2;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_250C1D3A8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
  id v6 = sub_250C1D388();
  os_log_type_t v7 = sub_250C1D958();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_250BD9000, v6, v7, a2, v8, 2u);
    MEMORY[0x2533853C0](v8, -1, -1);
  }

  id result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  objc_msgSend(result, sel_stop);
  id result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  objc_msgSend(result, sel_stop);
  id result = *(id *)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  objc_msgSend(result, sel_stop);
  uint64_t v10 = *(void **)(v4 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  return objc_msgSend(v10, sel_stop);
}

uint64_t sub_250BF4E58(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_250C1D0B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250C1D0A8();
  uint64_t v9 = swift_retain();
  a4(v9);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_250BF4F4C()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  id v2 = objc_msgSend(v1, sel_mainMixerNode);
  id v3 = objc_msgSend(v2, sel_outputFormatForBus_, 0);

  unsigned int v4 = objc_msgSend(v3, sel_channelCount);
  id v5 = objc_msgSend(v1, sel_mainMixerNode);
  id v6 = objc_msgSend(v5, sel_outputFormatForBus_, 0);

  objc_msgSend(v6, sel_sampleRate);
  double v8 = v7;

  if (v4 < 3)
  {
LABEL_3:
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9388]), sel_initStandardFormatWithSampleRate_channels_, 2, v8);
    if (!v10)
    {
      __break(1u);
LABEL_14:
      __break(1u);
      JUMPOUT(0x250BF5134);
    }
    id v11 = v10;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v9 = 7077892;
    switch(v4)
    {
      case 3u:
        goto LABEL_3;
      case 4u:
        goto LABEL_10;
      case 5u:
        uint64_t v9 = 7733253;
        goto LABEL_10;
      case 6u:
        uint64_t v9 = 9109510;
        goto LABEL_10;
      case 7u:
        uint64_t v9 = 9175047;
        goto LABEL_10;
      case 8u:
        uint64_t v9 = 7274504;
        goto LABEL_10;
      default:
        uint64_t v9 = 6619138;
LABEL_10:
        id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9328]), sel_initWithLayoutTag_, v9);
        if (!v13) {
          goto LABEL_14;
        }
        id v14 = v13;
        id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9388]), sel_initStandardFormatWithSampleRate_channelLayout_, v13, v8);

        uint64_t v12 = 3;
        break;
    }
  }
  *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo) = v12;
  return v11;
}

uint64_t sub_250BF514C(void *a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v5 = v4;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C0);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9488);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v4 + 32))
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
    *(void *)(v4 + 32) = 0;
    swift_release();
  }
  sub_250BE79C8(0, (unint64_t *)&qword_269AF9678);
  id v18 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v19 = sub_250C1DA08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
  uint64_t v20 = sub_250C1D9E8();

  sub_250BEB0A4((uint64_t)v13, &qword_269AF9488);
  uint64_t v34 = v20;
  sub_250C1D9D8();
  sub_250BF600C((unint64_t *)&qword_269AF9680, MEMORY[0x263F07CE8]);
  uint64_t v21 = sub_250C1D408();
  swift_release();
  uint64_t v34 = v21;
  id v33 = *(id *)(v5 + 24);
  id v22 = v33;
  uint64_t v23 = sub_250C1D988();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
  id v24 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9688);
  sub_250BE79C8(0, (unint64_t *)&qword_269AF90C0);
  sub_250BDDD60(&qword_269AF9690, &qword_269AF9688);
  sub_250BF60DC();
  sub_250C1D598();
  sub_250BEB0A4((uint64_t)v10, &qword_269AF96C0);

  swift_release();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a1;
  *(float *)(v25 + 24) = a4;
  uint64_t v26 = v31;
  uint64_t v27 = v32;
  *(void *)(v25 + 32) = v5;
  *(void *)(v25 + 40) = v26;
  *(void *)(v25 + 48) = v27;
  sub_250BDDD60(&qword_269AF96D8, &qword_269AF96C8);
  id v28 = a1;
  swift_retain();
  swift_retain();
  uint64_t v29 = sub_250C1D5C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  *(void *)(v5 + 32) = v29;
  return swift_release();
}

id sub_250BF55B4(int a1, id a2, float a3, uint64_t a4, void (*a5)(id))
{
  id v9 = objc_msgSend(a2, sel_volume);
  if (v10 == a3)
  {
    if (*(void *)(a4 + 32))
    {
      swift_retain();
      sub_250C1D3C8();
      swift_release();
      *(void *)(a4 + 32) = 0;
      id v9 = (id)swift_release();
    }
    a5(v9);
  }
  objc_msgSend(a2, sel_volume);
  float v12 = v11;
  objc_msgSend(a2, sel_volume);
  float v14 = *(float *)&v13 + -0.05;
  if ((float)(*(float *)&v13 + -0.05) <= a3) {
    float v14 = a3;
  }
  *(float *)&double v13 = *(float *)&v13 + 0.05;
  if (*(float *)&v13 > a3) {
    *(float *)&double v13 = a3;
  }
  if (v12 >= a3) {
    *(float *)&double v13 = v14;
  }
  return objc_msgSend(a2, sel_setVolume_, v13);
}

void sub_250BF56B8()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 8);
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 32);

  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode);
}

id *sub_250BF576C()
{
  uint64_t v0 = sub_250BDC2E8();
  id v1 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 8);
  id v2 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 16);
  id v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 24);
  uint64_t v4 = *(id *)((char *)v0 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager + 32);

  return v0;
}

uint64_t sub_250BF5820()
{
  sub_250BF576C();
  return swift_deallocClassInstance();
}

uint64_t sub_250BF5874()
{
  return type metadata accessor for HGCustomizedAudioPlayer();
}

uint64_t type metadata accessor for HGCustomizedAudioPlayer()
{
  uint64_t result = qword_269AF96B0;
  if (!qword_269AF96B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250BF58C8()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250BF5940()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_250BF5980()
{
  sub_250BF419C(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void sub_250BF59A4()
{
  sub_250BF3E1C(v0);
}

void sub_250BF59AC(uint64_t a1, void *a2)
{
  v56[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode;
  if (!*(void *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_environmentNode)) {
    return;
  }
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_audioEngine);
  if (objc_msgSend(v5, sel_isRunning))
  {
LABEL_24:
    objc_msgSend(a2, sel_play);
    return;
  }
  unint64_t v55 = a2;
  id v6 = *(void **)(a1 + v2);
  if (!v6)
  {

    __break(1u);
    goto LABEL_30;
  }
  id v7 = v6;
  id v8 = objc_msgSend(v5, sel_mainMixerNode);
  id v9 = sub_250BF4F4C();
  objc_msgSend(v5, sel_connect_to_format_, v7, v8, v9);

  uint64_t v10 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode;
  float v11 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_partGestureAudioNode);
  if (!v11)
  {
LABEL_30:

    __break(1u);
    goto LABEL_31;
  }
  float v12 = *(void **)(a1 + v2);
  if (!v12)
  {
LABEL_31:

    __break(1u);
    goto LABEL_32;
  }
  uint64_t v13 = a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager;
  float v14 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_assetManager);
  if (!v14)
  {
LABEL_32:

    __break(1u);
    goto LABEL_33;
  }
  id v15 = v12;
  id v16 = v11;
  id v17 = objc_msgSend(v14, sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v16, v15, v17);

  uint64_t v18 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode;
  uint64_t v19 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_headGestureAudioNode);
  if (!v19)
  {
LABEL_33:

    __break(1u);
    goto LABEL_34;
  }
  uint64_t v20 = *(void **)(a1 + v2);
  if (!v20)
  {
LABEL_34:

    __break(1u);
    goto LABEL_35;
  }
  uint64_t v21 = *(void **)(v13 + 16);
  if (!v21)
  {
LABEL_35:

    __break(1u);
    goto LABEL_36;
  }
  id v22 = v20;
  id v23 = v19;
  id v24 = objc_msgSend(v21, sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v23, v22, v24);

  uint64_t v25 = OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode;
  uint64_t v26 = *(void **)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_backgroundAudioNode);
  if (!v26)
  {
LABEL_36:

    __break(1u);
    goto LABEL_37;
  }
  id v27 = v26;
  id v28 = objc_msgSend(v5, sel_mainMixerNode);
  uint64_t v29 = *(void **)(v13 + 32);
  if (!v29)
  {
LABEL_37:

    __break(1u);
    goto LABEL_38;
  }
  unint64_t v30 = v28;
  id v31 = objc_msgSend(*(id *)(v13 + 32), sel_format);
  objc_msgSend(v5, sel_connect_to_format_, v27, v30, v31);

  uint64_t v32 = *(void **)(a1 + v10);
  if (!v32)
  {
LABEL_38:

    __break(1u);
    goto LABEL_39;
  }
  objc_msgSend(v32, sel_setRenderingAlgorithm_, *(void *)(a1 + OBJC_IVAR____TtC12HeadGestures23HGCustomizedAudioPlayer_renderAlgo));
  uint64_t v34 = *(void **)(a1 + v10);
  if (!v34)
  {
LABEL_39:

    __break(1u);
    goto LABEL_40;
  }
  LODWORD(v33) = 1050253722;
  objc_msgSend(v34, sel_setReverbBlend_, v33);
  uint64_t v35 = *(void **)(a1 + v2);
  if (!v35)
  {
LABEL_40:

    __break(1u);
    goto LABEL_41;
  }
  objc_msgSend(v35, sel_setListenerPosition_, 0.0, 0.0, 0.0);
  id v36 = *(void **)(a1 + v18);
  if (!v36)
  {
LABEL_41:

    __break(1u);
    return;
  }
  objc_msgSend(v36, sel_setPosition_, 0.0, 0.0, 0.0);
  id v37 = *(void **)(a1 + v25);
  if (v37)
  {
    id v38 = v29;
    id v39 = v37;
    objc_msgSend(v39, sel_stop);
    objc_msgSend(v39, sel_scheduleBuffer_atTime_options_completionHandler_, v38, 0, 1, 0);
    objc_msgSend(v39, sel_setVolume_, 0.0);
  }
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_250C1D3A8();
  __swift_project_value_buffer(v40, (uint64_t)qword_269AFCA38);
  int v41 = sub_250C1D388();
  os_log_type_t v42 = sub_250C1D928();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl(&dword_250BD9000, v41, v42, "[HGAudioPlayer] Starting the audio engine", v43, 2u);
    MEMORY[0x2533853C0](v43, -1, -1);
  }

  objc_msgSend(v5, sel_prepare);
  v56[0] = 0;
  if (objc_msgSend(v5, sel_startAndReturnError_, v56))
  {
    id v44 = v56[0];
    a2 = v55;
    goto LABEL_24;
  }
  id v45 = v56[0];
  uint64_t v46 = (void *)sub_250C1D128();

  swift_willThrow();
  id v47 = v46;
  id v48 = v46;
  uint64_t v49 = sub_250C1D388();
  os_log_type_t v50 = sub_250C1D948();
  if (os_log_type_enabled(v49, v50))
  {
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = (void *)swift_slowAlloc();
    v56[0] = v52;
    *(_DWORD *)unint64_t v51 = 136315138;
    swift_getErrorValue();
    uint64_t v53 = sub_250C1DD28();
    sub_250BE1D68(v53, v54, (uint64_t *)v56);
    sub_250C1DA48();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_250BD9000, v49, v50, "[HGAudioPlayer] Unable to start the AudioEngine: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v52, -1, -1);
    MEMORY[0x2533853C0](v51, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_250BF600C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250BF6054()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250BF608C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250BF60CC(uint64_t a1)
{
  return sub_250BF33A0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_250BF60D4()
{
  return sub_250BF3AA0();
}

unint64_t sub_250BF60DC()
{
  unint64_t result = qword_269AF96D0;
  if (!qword_269AF96D0)
  {
    sub_250BE79C8(255, (unint64_t *)&qword_269AF90C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF96D0);
  }
  return result;
}

uint64_t sub_250BF6144()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

id sub_250BF618C(int a1)
{
  return sub_250BF55B4(a1, *(id *)(v1 + 16), *(float *)(v1 + 24), *(void *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_250BF61C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_250BF621C(a1, v4);
  nullsub_1(v4);
  return sub_250BF6BFC((uint64_t)v4, a2, &qword_269AF96E0);
}

void *sub_250BF621C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  long long v6 = *(_OWORD *)(a1 + 80);
  v148[4] = *(_OWORD *)(a1 + 64);
  v148[5] = v6;
  v149[0] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v149 + 9) = *(_OWORD *)(a1 + 105);
  long long v7 = *(_OWORD *)(a1 + 16);
  v148[0] = *(_OWORD *)a1;
  v148[1] = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  v148[2] = *(_OWORD *)(a1 + 32);
  v148[3] = v8;
  double v9 = *(double *)(a1 + 104);
  nullsub_1(v148);
  float32x4_t v142 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 24)), *(float64x2_t *)(a1 + 40));
  uint64_t v10 = (void **)(v2 + 344);
  swift_beginAccess();
  uint64_t v15 = *(void *)(v2 + 344);
  int64_t v16 = *(void *)(v15 + 16);
  id v17 = (float32x4_t *)MEMORY[0x263F8EE78];
  if (v16)
  {
    __src[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_250C04AC4(0, v16, 0);
    id v17 = (float32x4_t *)__src[0];
    unint64_t v18 = *(void *)(__src[0] + 16);
    uint64_t v19 = 48;
    do
    {
      float32x4_t v20 = *(float32x4_t *)(v15 + v19);
      __src[0] = v17;
      unint64_t v21 = v17[1].u64[1];
      if (v18 >= v21 >> 1)
      {
        float32x4_t v138 = v20;
        sub_250C04AC4(v21 > 1, v18 + 1, 1);
        float32x4_t v20 = v138;
        id v17 = (float32x4_t *)__src[0];
      }
      v17[1].i64[0] = v18 + 1;
      v17[v18 + 2] = v20;
      v19 += 32;
      ++v18;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  sub_250C00A9C(v17, v11, v12, v13, v14);
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  char v27 = v26;
  swift_bridgeObjectRelease();
  v28.i32[0] = 0;
  v29.i32[0] = v27 & 1;
  int8x16_t v30 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v29, v28), 0);
  v29.i64[0] = v23;
  v29.i64[1] = v25;
  float32x4_t v31 = vmulq_f32((float32x4_t)vbslq_s8(v30, v29, (int8x16_t)v142), (float32x4_t)xmmword_250C1FB50);
  int32x4_t v32 = (int32x4_t)vnegq_f32(v142);
  int8x16_t v33 = (int8x16_t)vtrn2q_s32((int32x4_t)v142, vtrn1q_s32((int32x4_t)v142, v32));
  float32x4_t v34 = (float32x4_t)vrev64q_s32((int32x4_t)v142);
  v34.i32[0] = v32.i32[1];
  v34.i32[3] = v32.i32[2];
  double v35 = sub_250C00D74(vaddq_f32(vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v142, (int8x16_t)v32, 8uLL), *(float32x2_t *)v31.f32, 1), (float32x4_t)vextq_s8(v33, v33, 8uLL), v31.f32[0]), vmlaq_laneq_f32(vmulq_laneq_f32(v142, v31, 3), v34, v31, 2)));
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  if (*(unsigned char *)(v3 + 368))
  {
    swift_beginAccess();
    uint64_t v40 = *v10;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v10 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v40 = sub_250BF173C(0, v40[2] + 1, 1, v40);
      *uint64_t v10 = v40;
    }
    unint64_t v43 = v40[2];
    unint64_t v42 = v40[3];
    if (v43 >= v42 >> 1)
    {
      uint64_t v40 = sub_250BF173C((void *)(v42 > 1), v43 + 1, 1, v40);
      *uint64_t v10 = v40;
    }
    v40[2] = v43 + 1;
    id v44 = (double *)&v40[4 * v43];
    v44[4] = v9;
    *((float32x4_t *)v44 + 3) = v142;
    id v45 = *v10;
    swift_endAccess();
    uint64_t v46 = v45[2];
    if (v46)
    {
      swift_bridgeObjectRetain();
      id v47 = (double *)(v45 + 6);
      id v48 = (void *)MEMORY[0x263F8EE78];
      do
      {
        double v52 = *(v47 - 2);
        if (v9 + -1.0 <= v52)
        {
          long long v143 = *(_OWORD *)v47;
          __src[0] = v48;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_250C04AA4(0, v48[2] + 1, 1);
            id v48 = (void *)__src[0];
          }
          unint64_t v50 = v48[2];
          unint64_t v49 = v48[3];
          if (v50 >= v49 >> 1)
          {
            sub_250C04AA4(v49 > 1, v50 + 1, 1);
            id v48 = (void *)__src[0];
          }
          v48[2] = v50 + 1;
          unint64_t v51 = (double *)&v48[4 * v50];
          v51[4] = v52;
          *((_OWORD *)v51 + 3) = v143;
        }
        v47 += 4;
        --v46;
      }
      while (v46);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v48 = (void *)MEMORY[0x263F8EE78];
    }
    *uint64_t v10 = v48;
    swift_bridgeObjectRelease();
  }
  uint64_t v53 = *(void *)(a1 + 56);
  uint64_t v54 = *(void *)(a1 + 64);
  uint64_t v55 = *(void *)(a1 + 72);
  uint64_t v57 = *(void *)(a1 + 80);
  uint64_t v56 = *(void *)(a1 + 88);
  os_log_t v58 = (uint64_t *)(v3 + 352);
  uint64_t v59 = *(void *)(a1 + 96);
  swift_beginAccess();
  uint64_t v60 = *(void **)(v3 + 352);
  char v61 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 352) = v60;
  uint64_t v137 = v56;
  uint64_t v135 = v59;
  if ((v61 & 1) == 0)
  {
    uint64_t v60 = sub_250BF162C(0, v60[2] + 1, 1, v60);
    uint64_t *v58 = (uint64_t)v60;
  }
  unint64_t v63 = v60[2];
  unint64_t v62 = v60[3];
  if (v63 >= v62 >> 1)
  {
    uint64_t v60 = sub_250BF162C((void *)(v62 > 1), v63 + 1, 1, v60);
    uint64_t *v58 = (uint64_t)v60;
  }
  v60[2] = v63 + 1;
  uint64_t v64 = (double *)&v60[4 * v63];
  v64[4] = v9;
  *((void *)v64 + 5) = v53;
  *((void *)v64 + 6) = v54;
  *((void *)v64 + 7) = v55;
  uint64_t v136 = v55;
  uint64_t v65 = *v58;
  swift_endAccess();
  uint64_t v66 = *(void *)(v65 + 16);
  if (v66)
  {
    swift_bridgeObjectRetain();
    id v67 = (double *)(v65 + 48);
    uint64_t v68 = MEMORY[0x263F8EE78];
    do
    {
      if (v9 + -0.1 <= *(v67 - 2))
      {
        long long v144 = *((_OWORD *)v67 - 1);
        long long v139 = *(_OWORD *)v67;
        __src[0] = v68;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_250C04A84(0, *(void *)(v68 + 16) + 1, 1);
          uint64_t v68 = __src[0];
        }
        unint64_t v70 = *(void *)(v68 + 16);
        unint64_t v69 = *(void *)(v68 + 24);
        long long v71 = v144;
        if (v70 >= v69 >> 1)
        {
          sub_250C04A84(v69 > 1, v70 + 1, 1);
          long long v71 = v144;
          uint64_t v68 = __src[0];
        }
        *(void *)(v68 + 16) = v70 + 1;
        uint64_t v72 = v68 + 32 * v70;
        *(_OWORD *)(v72 + 32) = v71;
        *(_OWORD *)(v72 + 48) = v139;
      }
      v67 += 4;
      --v66;
    }
    while (v66);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v68 = MEMORY[0x263F8EE78];
  }
  uint64_t *v58 = v68;
  unint64_t result = (void *)swift_bridgeObjectRelease();
  uint64_t v74 = *v58;
  int64_t v75 = *(void *)(*v58 + 16);
  uint64_t v76 = MEMORY[0x263F8EE78];
  if (!v75)
  {
    uint64_t v77 = MEMORY[0x263F8EE78];
    uint64_t v90 = MEMORY[0x263F8EE78];
    goto LABEL_59;
  }
  uint64_t v140 = v57;
  v145 = a2;
  __src[0] = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_250C04A64(0, v75, 0);
  uint64_t v77 = __src[0];
  unint64_t v78 = *(void *)(__src[0] + 16);
  uint64_t v79 = 40;
  do
  {
    uint64_t v80 = *(void *)(v74 + v79);
    __src[0] = v77;
    unint64_t v81 = *(void *)(v77 + 24);
    if (v78 >= v81 >> 1)
    {
      sub_250C04A64(v81 > 1, v78 + 1, 1);
      uint64_t v77 = __src[0];
    }
    *(void *)(v77 + 16) = v78 + 1;
    *(void *)(v77 + 8 * v78 + 32) = v80;
    v79 += 32;
    ++v78;
    --v75;
  }
  while (v75);
  unint64_t result = (void *)swift_bridgeObjectRelease();
  uint64_t v82 = *v58;
  int64_t v83 = *(void *)(*v58 + 16);
  uint64_t v76 = MEMORY[0x263F8EE78];
  if (v83)
  {
    __src[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_250C04A64(0, v83, 0);
    uint64_t v76 = __src[0];
    unint64_t v84 = *(void *)(__src[0] + 16);
    uint64_t v85 = 48;
    do
    {
      uint64_t v86 = *(void *)(v82 + v85);
      __src[0] = v76;
      unint64_t v87 = *(void *)(v76 + 24);
      if (v84 >= v87 >> 1)
      {
        sub_250C04A64(v87 > 1, v84 + 1, 1);
        uint64_t v76 = __src[0];
      }
      *(void *)(v76 + 16) = v84 + 1;
      *(void *)(v76 + 8 * v84 + 32) = v86;
      v85 += 32;
      ++v84;
      --v83;
    }
    while (v83);
    unint64_t result = (void *)swift_bridgeObjectRelease();
    uint64_t v88 = *v58;
    int64_t v89 = *(void *)(v88 + 16);
    uint64_t v90 = MEMORY[0x263F8EE78];
    if (v89)
    {
      __src[0] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_250C04A64(0, v89, 0);
      uint64_t v90 = __src[0];
      unint64_t v91 = *(void *)(__src[0] + 16);
      uint64_t v92 = 56;
      a2 = v145;
      do
      {
        uint64_t v93 = *(void *)(v88 + v92);
        __src[0] = v90;
        unint64_t v94 = *(void *)(v90 + 24);
        if (v91 >= v94 >> 1)
        {
          sub_250C04A64(v94 > 1, v91 + 1, 1);
          uint64_t v90 = __src[0];
        }
        *(void *)(v90 + 16) = v91 + 1;
        *(void *)(v90 + 8 * v91 + 32) = v93;
        v92 += 32;
        ++v91;
        --v89;
      }
      while (v89);
      unint64_t result = (void *)swift_bridgeObjectRelease();
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v90 = MEMORY[0x263F8EE78];
  }
  a2 = v145;
LABEL_58:
  uint64_t v57 = v140;
LABEL_59:
  uint64_t v95 = *(void *)(v77 + 16);
  if (!v95)
  {
    __break(1u);
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
    return result;
  }
  double v96 = *(double *)(v77 + 32);
  double v97 = v96;
  uint64_t v98 = v95 - 1;
  if (v95 != 1)
  {
    uint64_t v99 = (double *)(v77 + 40);
    double v97 = *(double *)(v77 + 32);
    do
    {
      double v100 = *v99++;
      double v101 = v100;
      if (v100 < v97) {
        double v97 = v101;
      }
      --v98;
    }
    while (v98);
  }
  uint64_t v141 = v54;
  uint64_t v146 = v53;
  uint64_t v102 = *(void *)(v76 + 16);
  if (!v102) {
    goto LABEL_96;
  }
  double v103 = *(double *)(v76 + 32);
  double v104 = v103;
  uint64_t v105 = v102 - 1;
  if (v102 != 1)
  {
    uint64_t v106 = (double *)(v76 + 40);
    double v104 = *(double *)(v76 + 32);
    do
    {
      double v107 = *v106++;
      double v108 = v107;
      if (v107 < v104) {
        double v104 = v108;
      }
      --v105;
    }
    while (v105);
  }
  uint64_t v133 = v39;
  uint64_t v134 = v37;
  uint64_t v109 = *(void *)(v90 + 16);
  if (!v109) {
    goto LABEL_97;
  }
  double v110 = *(double *)(v90 + 32);
  double v111 = v110;
  uint64_t v112 = v109 - 1;
  if (v109 != 1)
  {
    uint64_t v113 = (double *)(v90 + 40);
    double v111 = *(double *)(v90 + 32);
    do
    {
      double v114 = *v113++;
      double v115 = v114;
      if (v114 < v111) {
        double v111 = v115;
      }
      --v112;
    }
    while (v112);
  }
  uint64_t v116 = v95 - 1;
  if (v116)
  {
    uint64_t v117 = (double *)(v77 + 40);
    do
    {
      double v118 = *v117++;
      double v119 = v118;
      if (v96 < v118) {
        double v96 = v119;
      }
      --v116;
    }
    while (v116);
  }
  uint64_t v120 = v102 - 1;
  if (v102 != 1)
  {
    uint64_t v121 = (double *)(v76 + 40);
    do
    {
      double v122 = *v121++;
      double v123 = v122;
      if (v103 < v122) {
        double v103 = v123;
      }
      --v120;
    }
    while (v120);
  }
  uint64_t v124 = v109 - 1;
  double v132 = v35;
  if (v109 != 1)
  {
    uint64_t v125 = (double *)(v90 + 40);
    do
    {
      double v126 = *v125++;
      double v127 = v126;
      if (v110 < v126) {
        double v110 = v127;
      }
      --v124;
    }
    while (v124);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_250C13AB0(32, v9);
  swift_endAccess();
  uint64_t v128 = *(void *)(v3 + 360);
  uint64_t v129 = *(void *)(v128 + 16);
  double v130 = 0.0;
  if (v129 == 32) {
    double v130 = 32.0 / (*(double *)(v128 + 280) - *(double *)(v128 + 32));
  }
  BOOL v131 = v129 != 32;
  *(double *)__src = v9;
  LOBYTE(__src[1]) = 0;
  sub_250BF6BFC((uint64_t)v148, (uint64_t)&__src[2], &qword_269AF91C0);
  *(double *)&__src[18] = v132;
  __src[19] = v134;
  __src[20] = v133;
  LOBYTE(__src[21]) = 0;
  __src[22] = v146;
  __src[23] = v141;
  __src[24] = v136;
  LOBYTE(__src[25]) = 0;
  __src[26] = v57;
  __src[27] = v137;
  __src[28] = v135;
  LOBYTE(__src[29]) = 0;
  *(double *)&__src[30] = v97;
  *(double *)&__src[31] = v104;
  *(double *)&__src[32] = v111;
  *(double *)&__src[33] = v96;
  *(double *)&__src[34] = v103;
  *(double *)&__src[35] = v110;
  LOBYTE(__src[36]) = 0;
  *(double *)&__src[37] = v130;
  LOBYTE(__src[38]) = v131;
  memcpy((void *)(v3 + 32), __src, 0x131uLL);
  return memcpy(a2, __src, 0x131uLL);
}

uint64_t sub_250BF6B90()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMotionStateRecognizer()
{
  return self;
}

uint64_t sub_250BF6BFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HGError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HGError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x250BF6DCCLL);
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

uint64_t sub_250BF6DF4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_250BF6DFC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HGError()
{
  return &type metadata for HGError;
}

BOOL sub_250BF6E14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_250BF6E28()
{
  return sub_250C1DD98();
}

uint64_t sub_250BF6E70()
{
  return sub_250C1DD88();
}

uint64_t sub_250BF6E9C()
{
  return sub_250C1DD98();
}

unint64_t sub_250BF6EF4()
{
  unint64_t result = qword_269AF96E8;
  if (!qword_269AF96E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF96E8);
  }
  return result;
}

uint64_t sub_250BF6F48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  *(void *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle) = 0;
  if (a1)
  {
    id v10 = a1;
    uint64_t v11 = sub_250C1D6E8();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *(void **)(v5 + v7);
      *(void *)(v5 + v7) = a1;
      id v16 = v10;

      id v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData);
      *id v17 = v11;
      v17[1] = v13;
      uint64_t v18 = v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding;
      uint64_t v19 = sub_250C1D718();
      uint64_t v20 = *(void *)(v19 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, a4, v19);
      *(void *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_chunkSize) = a5;
      sub_250BF7F60(v11, v13);
      uint64_t v21 = sub_250BF7EC4(a5);
      uint64_t v23 = v22;

      sub_250BEE160(v11, v13);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a4, v19);
      uint64_t v24 = (uint64_t *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer);
      *uint64_t v24 = v21;
      v24[1] = v23;
      *(unsigned char *)(v5 + OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof) = 0;
      return v5;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v14 = sub_250C1D718();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a4, v14);

  type metadata accessor for StreamReader(0);
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_250BF717C()
{
  uint64_t v1 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle), sel_closeFile);
  int v2 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = 0;

  uint64_t v3 = v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding;
  uint64_t v4 = sub_250C1D718();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_250BEE174(*(void *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData), *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_delimData + 8));
  sub_250BEE174(*(void *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer), *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer + 8));
  return swift_deallocClassInstance();
}

uint64_t sub_250BF7278()
{
  return type metadata accessor for StreamReader(0);
}

uint64_t type metadata accessor for StreamReader(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF96F0);
}

uint64_t sub_250BF72A0()
{
  uint64_t result = sub_250C1D718();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_250BF735C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D718();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
  if (!*(void *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle))
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_250C1D3A8();
    __swift_project_value_buffer(v23, (uint64_t)qword_269AFCA38);
    uint64_t v24 = sub_250C1D388();
    os_log_type_t v25 = sub_250C1D948();
    if (os_log_type_enabled(v24, v25))
    {
      char v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v26 = 0;
      _os_log_impl(&dword_250BD9000, v24, v25, "HGFileDataReading error, Attempt to read from closed file", v26, 2u);
      MEMORY[0x2533853C0](v26, -1, -1);
    }

    return 0;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof)) {
    return 0;
  }
  uint64_t v34 = OBJC_IVAR____TtC12HeadGestures12StreamReader_atEof;
  uint64_t v35 = v5;
  uint64_t v36 = v3;
  uint64_t v37 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures12StreamReader_buffer);
  uint64_t v38 = OBJC_IVAR____TtC12HeadGestures12StreamReader_chunkSize;
  swift_beginAccess();
  while (1)
  {
    uint64_t v8 = *v7;
    unint64_t v9 = v7[1];
    sub_250BEE0B4(*v7, v9);
    uint64_t v10 = sub_250C1D218();
    uint64_t v12 = v11;
    char v14 = v13;
    sub_250BEE174(v8, v9);
    if ((v14 & 1) == 0) {
      break;
    }
    uint64_t v15 = *(void **)(v1 + v6);
    if (!v15) {
      goto LABEL_31;
    }
    id v16 = objc_msgSend(v15, sel_readDataOfLength_, *(void *)(v1 + v38));
    uint64_t v17 = sub_250C1D208();
    unint64_t v19 = v18;

    switch(v19 >> 62)
    {
      case 1uLL:
        if ((int)v17 == v17 >> 32) {
          goto LABEL_12;
        }
        goto LABEL_5;
      case 2uLL:
        if (*(void *)(v17 + 16) == *(void *)(v17 + 24)) {
          goto LABEL_12;
        }
        goto LABEL_5;
      case 3uLL:
        goto LABEL_12;
      default:
        if ((v19 & 0xFF000000000000) == 0)
        {
LABEL_12:
          *(unsigned char *)(v1 + v34) = 1;
          uint64_t v20 = *v7;
          unint64_t v21 = v7[1];
          switch(v21 >> 62)
          {
            case 1uLL:
              if ((int)v20 != v20 >> 32) {
                goto LABEL_14;
              }
              goto LABEL_26;
            case 2uLL:
              if (*(void *)(v20 + 16) == *(void *)(v20 + 24)) {
                goto LABEL_26;
              }
              goto LABEL_14;
            case 3uLL:
              goto LABEL_26;
            default:
              if ((v21 & 0xFF000000000000) != 0)
              {
LABEL_14:
                (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v37, v1 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding, v36);
                sub_250BEE0B4(v20, v21);
                uint64_t v22 = sub_250C1D6F8();
                sub_250BEE174(v20, v21);
                swift_beginAccess();
                sub_250C1D1E8();
                swift_endAccess();
                sub_250BEE174(v17, v19);
                return v22;
              }
LABEL_26:
              sub_250BEE174(v17, v19);
              break;
          }
          return 0;
        }
LABEL_5:
        swift_beginAccess();
        sub_250C1D228();
        swift_endAccess();
        sub_250BEE174(v17, v19);
        break;
    }
  }
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v28 = *v7;
  unint64_t v27 = v7[1];
  sub_250BEE0B4(*v7, v27);
  uint64_t v29 = sub_250C1D238();
  unint64_t v31 = v30;
  sub_250BEE174(v28, v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v37, v1 + OBJC_IVAR____TtC12HeadGestures12StreamReader_encoding, v36);
  uint64_t v22 = sub_250C1D6F8();
  sub_250BEE174(v29, v31);
  if (v12 < 0)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    JUMPOUT(0x250BF7810);
  }
  swift_beginAccess();
  sub_250C1D1D8();
  swift_endAccess();
  return v22;
}

uint64_t sub_250BF7830()
{
  uint64_t v1 = sub_250C1D5D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D5F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_250BF7FAC;
  void aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_3;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v0;
  sub_250C1D5E8();
  v13[1] = MEMORY[0x263F8EE78];
  sub_250BF7FCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BF8024();
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v8, v4, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_250BF7A98(uint64_t result)
{
  if (*(void *)(result + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader))
  {
    uint64_t v1 = result;
    swift_retain();
    for (uint64_t i = sub_250BF735C(); v3; uint64_t i = sub_250BF735C())
    {
      sub_250BFB240(i, v3, (uint64_t)v5);
      sub_250BDE95C((uint64_t)v5, (uint64_t)&v6);
      if (sub_250BDE9C4((uint64_t)&v6) != 1)
      {
        sub_250C1D3E8();
        uint64_t v4 = v1 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
        sub_250BDE95C(v1 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v7);
        sub_250BDE95C((uint64_t)v5, v4);
        sub_250BF0468((uint64_t)v7);
      }
    }
    sub_250C1D3D8();
    return swift_release();
  }
  return result;
}

void sub_250BF7BC4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader);
  if (v1)
  {
    uint64_t v2 = OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle;
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures12StreamReader_fileHandle);
    swift_retain();
    objc_msgSend(v3, sel_closeFile);
    id v4 = *(id *)(v1 + v2);
    *(void *)(v1 + v2) = 0;
    swift_release();
  }
}

uint64_t sub_250BF7C60()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D718();
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_fileHandle);
  id v6 = v5;
  sub_250C1D708();
  type metadata accessor for StreamReader(0);
  swift_allocObject();
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures18HGFileDataProvider_streamReader) = sub_250BF6F48(v5, 10, 0xE100000000000000, (uint64_t)v4, 1024);
  return swift_release();
}

uint64_t sub_250BF7D64()
{
  return swift_release();
}

id sub_250BF7DB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGFileDataProvider(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250BF7E48()
{
  return type metadata accessor for HGFileDataProvider(0);
}

uint64_t type metadata accessor for HGFileDataProvider(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9700);
}

uint64_t sub_250BF7E70()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250BF7EC4(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_250C1D108();
      swift_allocObject();
      sub_250C1D0F8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_250C1D1C8();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_250BF7F60(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_250BEE0B4(a1, a2);
  }
  return a1;
}

uint64_t sub_250BF7F74()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250BF7FAC()
{
  return sub_250BF7A98(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_250BF7FCC()
{
  unint64_t result = qword_269AF9050;
  if (!qword_269AF9050)
  {
    sub_250C1D5D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9050);
  }
  return result;
}

unint64_t sub_250BF8024()
{
  unint64_t result = qword_269AF9060;
  if (!qword_269AF9060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269AF9058);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9060);
  }
  return result;
}

uint64_t sub_250BF8080(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9728);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9730);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v21 = v5;
  uint64_t v22 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250C1D2F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  objc_msgSend(v13, sel_setHeadGesture_, 4);
  objc_msgSend(v13, sel_setHeadGesturePart_, 0);
  sub_250C1D2C8();
  char v14 = (void *)sub_250C1D268();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  objc_msgSend(v13, sel_setTimestamp_, v14);

  uint64_t v23 = v20;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9738);
  sub_250BF9A94();
  sub_250BDDD60(&qword_269AF9740, &qword_269AF9738);
  sub_250C1D4A8();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9748);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_250C1FD50;
  *(void *)(v15 + 32) = v13;
  uint64_t v23 = v15;
  sub_250C1D828();
  sub_250BDDD60(&qword_269AF9750, &qword_269AF9728);
  id v16 = v13;
  sub_250C1D588();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_250BDDD60(&qword_269AF9758, &qword_269AF9730);
  uint64_t v17 = v21;
  uint64_t v18 = sub_250C1D498();

  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v17);
  return v18;
}

uint64_t sub_250BF8448(int a1)
{
  uint64_t v2 = v1;
  uint64_t v128 = sub_250C1D348();
  uint64_t v127 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  double v126 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_250C1D3A8();
  uint64_t v131 = *(void *)(v132 - 8);
  MEMORY[0x270FA5388](v132);
  uint64_t v129 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_250C1D2F8();
  uint64_t v6 = *(void *)(v144 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v144);
  uint64_t v140 = (char *)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v141 = (char *)&v126 - v10;
  MEMORY[0x270FA5388](v9);
  v145 = (char *)&v126 - v11;
  sub_250C1D2C8();
  double v12 = 1.0
      / *(double *)(v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_partialGestureCountTarget);
  id v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress);
  swift_beginAccess();
  uint64_t v14 = *v13;
  uint64_t v15 = *(void *)(*v13 + 64);
  uint64_t v146 = *v13 + 64;
  uint64_t v16 = 1 << *(unsigned char *)(v14 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v15;
  uint64_t v19 = v2 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_lastGesturePartRecognizedAt;
  swift_bridgeObjectRetain();
  uint64_t v142 = v19;
  swift_beginAccess();
  int64_t v20 = 0;
  int64_t v147 = (unint64_t)(v16 + 63) >> 6;
  long long v139 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v130 = v6;
  long long v143 = (void (**)(char *, uint64_t, __n128))(v6 + 8);
  int v136 = a1 - 3;
  int v134 = a1;
  unsigned int v135 = (a1 - 1);
  unsigned int v133 = (a1 - 5);
  uint64_t v148 = v2;
  float32x4_t v138 = v13;
  uint64_t v137 = v14;
  uint64_t v21 = (void (**)(char *, uint64_t))(v6 + 8);
  while (1)
  {
    if (v18)
    {
      unint64_t v22 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_26;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      goto LABEL_113;
    }
    if (v24 >= v147) {
      break;
    }
    unint64_t v25 = *(void *)(v146 + 8 * v24);
    ++v20;
    if (!v25)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v147) {
        break;
      }
      unint64_t v25 = *(void *)(v146 + 8 * v20);
      if (!v25)
      {
        int64_t v20 = v24 + 2;
        if (v24 + 2 >= v147) {
          break;
        }
        unint64_t v25 = *(void *)(v146 + 8 * v20);
        if (!v25)
        {
          int64_t v20 = v24 + 3;
          if (v24 + 3 >= v147) {
            break;
          }
          unint64_t v25 = *(void *)(v146 + 8 * v20);
          if (!v25)
          {
            int64_t v20 = v24 + 4;
            if (v24 + 4 >= v147) {
              break;
            }
            unint64_t v25 = *(void *)(v146 + 8 * v20);
            if (!v25)
            {
              int64_t v26 = v24 + 5;
              if (v26 >= v147) {
                break;
              }
              unint64_t v25 = *(void *)(v146 + 8 * v26);
              if (!v25)
              {
                while (1)
                {
                  int64_t v20 = v26 + 1;
                  if (__OFADD__(v26, 1)) {
                    break;
                  }
                  if (v20 >= v147) {
                    goto LABEL_79;
                  }
                  unint64_t v25 = *(void *)(v146 + 8 * v20);
                  ++v26;
                  if (v25) {
                    goto LABEL_25;
                  }
                }
                __break(1u);
LABEL_125:
                uint64_t result = sub_250C1DD18();
                __break(1u);
                return result;
              }
              int64_t v20 = v26;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v18 = (v25 - 1) & v25;
    unint64_t v23 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_26:
    uint64_t v27 = *(unsigned __int8 *)(*(void *)(v14 + 48) + v23);
    int v28 = *(unsigned __int8 *)(v2 + 16);
    if (v28 == 5) {
      goto LABEL_33;
    }
    uint64_t v29 = v141;
    uint64_t v2 = v144;
    (*v139)(v141, v142, v144);
    unint64_t v30 = v18;
    int64_t v31 = v20;
    int32x4_t v32 = v140;
    sub_250C1D298();
    char v33 = sub_250C1D278();
    uint64_t v34 = *v21;
    uint64_t v35 = v32;
    int64_t v20 = v31;
    unint64_t v18 = v30;
    (*v21)(v35, v2);
    uint64_t v36 = v29;
    uint64_t v14 = v137;
    id v13 = v138;
    v34(v36, v2);
    if ((v33 & 1) == 0)
    {
LABEL_33:
      if (v27 == 2)
      {
LABEL_60:
        if (v136 <= 1u) {
          goto LABEL_36;
        }
      }
      else if (v27 == 1)
      {
LABEL_35:
        if (v135 < 2)
        {
LABEL_36:
          swift_beginAccess();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v149 = *v13;
          uint64_t v38 = v149;
          *id v13 = 0x8000000000000000;
          unint64_t v40 = sub_250C1B034(v27);
          uint64_t v41 = *(void *)(v38 + 16);
          BOOL v42 = (v39 & 1) == 0;
          uint64_t v43 = v41 + v42;
          if (__OFADD__(v41, v42)) {
            goto LABEL_115;
          }
          uint64_t v2 = v39;
          if (*(void *)(v38 + 24) >= v43)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v46 = (void *)v149;
              if (v39) {
                goto LABEL_45;
              }
            }
            else
            {
              sub_250C13280();
              uint64_t v46 = (void *)v149;
              if (v2) {
                goto LABEL_45;
              }
            }
          }
          else
          {
            sub_250C12304(v43, isUniquelyReferenced_nonNull_native);
            uint64_t v44 = sub_250C1B034(v27);
            if ((v2 & 1) != (v45 & 1)) {
              goto LABEL_125;
            }
            unint64_t v40 = v44;
            uint64_t v46 = (void *)v149;
            if (v2)
            {
LABEL_45:
              *(double *)(v46[7] + 8 * v40) = v12;
              goto LABEL_5;
            }
          }
          v46[(v40 >> 6) + 8] |= 1 << v40;
          *(unsigned char *)(v46[6] + v40) = v27;
          *(double *)(v46[7] + 8 * v40) = v12;
          uint64_t v47 = v46[2];
          BOOL v48 = __OFADD__(v47, 1);
          uint64_t v49 = v47 + 1;
          if (v48) {
            goto LABEL_116;
          }
          goto LABEL_69;
        }
      }
LABEL_61:
      swift_beginAccess();
      char v65 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v149 = *v13;
      uint64_t v66 = v149;
      *id v13 = 0x8000000000000000;
      unint64_t v68 = sub_250C1B034(v27);
      uint64_t v69 = *(void *)(v66 + 16);
      BOOL v70 = (v67 & 1) == 0;
      uint64_t v71 = v69 + v70;
      if (__OFADD__(v69, v70))
      {
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        __break(1u);
LABEL_116:
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
        goto LABEL_123;
      }
      uint64_t v2 = v67;
      if (*(void *)(v66 + 24) >= v71)
      {
        if (v65)
        {
          uint64_t v46 = (void *)v149;
          if (v67) {
            goto LABEL_4;
          }
        }
        else
        {
          sub_250C13280();
          uint64_t v46 = (void *)v149;
          if (v2) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        sub_250C12304(v71, v65);
        uint64_t v72 = sub_250C1B034(v27);
        if ((v2 & 1) != (v73 & 1)) {
          goto LABEL_125;
        }
        unint64_t v68 = v72;
        uint64_t v46 = (void *)v149;
        if (v2)
        {
LABEL_4:
          *(void *)(v46[7] + 8 * v68) = 0;
          goto LABEL_5;
        }
      }
      v46[(v68 >> 6) + 8] |= 1 << v68;
      *(unsigned char *)(v46[6] + v68) = v27;
      *(void *)(v46[7] + 8 * v68) = 0;
      uint64_t v74 = v46[2];
      BOOL v48 = __OFADD__(v74, 1);
      uint64_t v49 = v74 + 1;
      if (v48) {
        goto LABEL_114;
      }
      goto LABEL_69;
    }
    if (v27 == 2)
    {
      if (v133 < 0xFE || v28 == v134) {
        goto LABEL_60;
      }
    }
    else
    {
      if (v27 != 1) {
        goto LABEL_61;
      }
      if (v136 < 0xFEu || v28 == v134) {
        goto LABEL_35;
      }
    }
    uint64_t v50 = *v13;
    if (!*(void *)(*v13 + 16)) {
      goto LABEL_118;
    }
    uint64_t v51 = sub_250C1B034(v27);
    if ((v52 & 1) == 0) {
      goto LABEL_119;
    }
    uint64_t v53 = *(void *)(v50 + 56);
    if (v12 + *(double *)(v53 + 8 * v51) <= 1.0) {
      double v54 = v12 + *(double *)(v53 + 8 * v51);
    }
    else {
      double v54 = 1.0;
    }
    swift_beginAccess();
    char v55 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v149 = *v13;
    uint64_t v56 = v149;
    *id v13 = 0x8000000000000000;
    unint64_t v58 = sub_250C1B034(v27);
    uint64_t v59 = *(void *)(v56 + 16);
    BOOL v60 = (v57 & 1) == 0;
    uint64_t v61 = v59 + v60;
    if (__OFADD__(v59, v60)) {
      goto LABEL_120;
    }
    uint64_t v2 = v57;
    if (*(void *)(v56 + 24) >= v61)
    {
      if (v55)
      {
        uint64_t v46 = (void *)v149;
        if ((v57 & 1) == 0) {
          goto LABEL_57;
        }
      }
      else
      {
        sub_250C13280();
        uint64_t v46 = (void *)v149;
        if ((v2 & 1) == 0) {
          goto LABEL_57;
        }
      }
    }
    else
    {
      sub_250C12304(v61, v55);
      uint64_t v62 = sub_250C1B034(v27);
      if ((v2 & 1) != (v63 & 1)) {
        goto LABEL_125;
      }
      unint64_t v58 = v62;
      uint64_t v46 = (void *)v149;
      if ((v2 & 1) == 0)
      {
LABEL_57:
        v46[(v58 >> 6) + 8] |= 1 << v58;
        *(unsigned char *)(v46[6] + v58) = v27;
        *(double *)(v46[7] + 8 * v58) = v54;
        uint64_t v64 = v46[2];
        BOOL v48 = __OFADD__(v64, 1);
        uint64_t v49 = v64 + 1;
        if (v48) {
          goto LABEL_121;
        }
LABEL_69:
        v46[2] = v49;
        goto LABEL_5;
      }
    }
    *(double *)(v46[7] + 8 * v58) = v54;
LABEL_5:
    *id v13 = (uint64_t)v46;
    swift_bridgeObjectRelease();
    swift_endAccess();
    uint64_t v2 = v148;
  }
LABEL_79:
  swift_release();
  if (qword_269AF8F80 == -1) {
    goto LABEL_80;
  }
LABEL_123:
  swift_once();
LABEL_80:
  uint64_t v75 = v132;
  uint64_t v76 = __swift_project_value_buffer(v132, (uint64_t)qword_269AFCA38);
  swift_retain_n();
  uint64_t v77 = sub_250C1D388();
  os_log_type_t v78 = sub_250C1D938();
  if (os_log_type_enabled(v77, v78))
  {
    uint64_t v79 = (uint8_t *)swift_slowAlloc();
    v150[0] = swift_slowAlloc();
    uint64_t v80 = v150[0];
    *(_DWORD *)uint64_t v79 = 136315138;
    int64_t v147 = (int64_t)(v79 + 4);
    sub_250BF9A14();
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_250C1D658();
    unint64_t v83 = v82;
    uint64_t v2 = v148;
    swift_bridgeObjectRelease();
    uint64_t v149 = sub_250BE1D68(v81, v83, v150);
    sub_250C1DA48();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v77, v78, "[HE] updated progress: %s", v79, 0xCu);
    swift_arrayDestroy();
    uint64_t v84 = v80;
    uint64_t v75 = v132;
    MEMORY[0x2533853C0](v84, -1, -1);
    MEMORY[0x2533853C0](v79, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v85 = v131;
  *(unsigned char *)(v2 + 16) = v134;
  uint64_t v86 = v142;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v130 + 24))(v86, v145, v144);
  swift_endAccess();
  int64_t v88 = 0;
  uint64_t v89 = *v13;
  uint64_t v90 = *v13 + 64;
  uint64_t v91 = 1 << *(unsigned char *)(*v13 + 32);
  uint64_t v92 = -1;
  if (v91 < 64) {
    uint64_t v92 = ~(-1 << v91);
  }
  unint64_t v93 = v92 & *(void *)(*v13 + 64);
  int64_t v94 = (unint64_t)(v91 + 63) >> 6;
  v87.n128_u64[0] = 0x3FEFAE147AE147AELL;
  do
  {
    if (v93)
    {
      unint64_t v95 = __clz(__rbit64(v93));
      v93 &= v93 - 1;
      unint64_t v96 = v95 | (v88 << 6);
    }
    else
    {
      int64_t v97 = v88 + 1;
      if (__OFADD__(v88, 1)) {
        goto LABEL_117;
      }
      if (v97 >= v94)
      {
LABEL_106:
        id v106 = 0;
        goto LABEL_111;
      }
      unint64_t v98 = *(void *)(v90 + 8 * v97);
      ++v88;
      if (!v98)
      {
        int64_t v88 = v97 + 1;
        if (v97 + 1 >= v94) {
          goto LABEL_106;
        }
        unint64_t v98 = *(void *)(v90 + 8 * v88);
        if (!v98)
        {
          int64_t v88 = v97 + 2;
          if (v97 + 2 >= v94) {
            goto LABEL_106;
          }
          unint64_t v98 = *(void *)(v90 + 8 * v88);
          if (!v98)
          {
            int64_t v99 = v97 + 3;
            if (v99 >= v94) {
              goto LABEL_106;
            }
            unint64_t v98 = *(void *)(v90 + 8 * v99);
            if (!v98)
            {
              while (1)
              {
                int64_t v88 = v99 + 1;
                if (__OFADD__(v99, 1)) {
                  goto LABEL_122;
                }
                if (v88 >= v94) {
                  goto LABEL_106;
                }
                unint64_t v98 = *(void *)(v90 + 8 * v88);
                ++v99;
                if (v98) {
                  goto LABEL_102;
                }
              }
            }
            int64_t v88 = v99;
          }
        }
      }
LABEL_102:
      unint64_t v100 = __clz(__rbit64(v98));
      unint64_t v93 = (v98 - 1) & v98;
      unint64_t v96 = v100 + (v88 << 6);
    }
  }
  while (*(double *)(*(void *)(v89 + 56) + 8 * v96) <= 0.99);
  uint64_t v101 = *(unsigned __int8 *)(*(void *)(v89 + 48) + v96);
  id v102 = objc_allocWithZone((Class)HGHeadGestureResult);
  swift_bridgeObjectRetain();
  id v103 = objc_msgSend(v102, sel_init);
  objc_msgSend(v103, sel_setHeadGesture_, v101);
  objc_msgSend(v103, sel_setHeadGesturePart_, 0);
  double v104 = (void *)sub_250C1D268();
  objc_msgSend(v103, sel_setTimestamp_, v104);

  uint64_t v105 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v129, v76, v75);
  id v106 = v103;
  double v107 = sub_250C1D388();
  int v108 = sub_250C1D938();
  if (os_log_type_enabled(v107, (os_log_type_t)v108))
  {
    uint64_t v109 = swift_slowAlloc();
    uint64_t v146 = swift_slowAlloc();
    v150[0] = v146;
    *(_DWORD *)uint64_t v109 = 136315650;
    unint64_t v110 = (unint64_t)objc_msgSend(v106, sel_headGesture);
    LODWORD(v147) = v108;
    if (v110 > 2)
    {
      unint64_t v113 = 0xE700000000000000;
      uint64_t v112 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v111 = 8 * v110;
      uint64_t v112 = *(void *)&aBackgrounod_3[8 * v110];
      unint64_t v113 = *(void *)&aNd_3[v111];
    }
    uint64_t v149 = sub_250BE1D68(v112, v113, v150);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v109 + 12) = 2080;
    id v114 = objc_msgSend(v106, sel_uuid);
    double v115 = v126;
    sub_250C1D328();

    sub_250BF99BC();
    uint64_t v116 = v128;
    uint64_t v117 = sub_250C1DCE8();
    unint64_t v119 = v118;
    (*(void (**)(char *, uint64_t))(v127 + 8))(v115, v116);
    uint64_t v149 = sub_250BE1D68(v117, v119, v150);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v109 + 22) = 2048;
    id v120 = objc_msgSend(v106, sel_timestamp);
    uint64_t v121 = v141;
    sub_250C1D2B8();

    sub_250C1D2A8();
    uint64_t v123 = v122;
    ((void (*)(char *, uint64_t))*v143)(v121, v144);
    uint64_t v149 = v123;
    sub_250C1DA48();

    _os_log_impl(&dword_250BD9000, v107, (os_log_type_t)v147, "[HE] Heuristic final prediction: %s %s at: %f", (uint8_t *)v109, 0x20u);
    uint64_t v124 = v146;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v124, -1, -1);
    MEMORY[0x2533853C0](v109, -1, -1);

    (*(void (**)(char *, uint64_t))(v131 + 8))(v129, v132);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v85 + 8))(v105, v75);
  }
  sub_250BF9454();
  swift_release();
LABEL_111:
  (*v143)(v145, v144, v87);
  return (uint64_t)v106;
}

uint64_t sub_250BF9454()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v29 = *v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(*v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(*v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v7 << 6);
    }
    else
    {
      int64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_36;
      }
      if (v10 >= v6) {
        return swift_release();
      }
      unint64_t v11 = *(void *)(v29 + 8 * v10);
      ++v7;
      if (!v11)
      {
        int64_t v7 = v10 + 1;
        if (v10 + 1 >= v6) {
          return swift_release();
        }
        unint64_t v11 = *(void *)(v29 + 8 * v7);
        if (!v11)
        {
          int64_t v7 = v10 + 2;
          if (v10 + 2 >= v6) {
            return swift_release();
          }
          unint64_t v11 = *(void *)(v29 + 8 * v7);
          if (!v11)
          {
            int64_t v12 = v10 + 3;
            if (v12 >= v6) {
              return swift_release();
            }
            unint64_t v11 = *(void *)(v29 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                int64_t v7 = v12 + 1;
                if (__OFADD__(v12, 1)) {
                  goto LABEL_37;
                }
                if (v7 >= v6) {
                  return swift_release();
                }
                unint64_t v11 = *(void *)(v29 + 8 * v7);
                ++v12;
                if (v11) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v7 = v12;
          }
        }
      }
LABEL_21:
      unint64_t v5 = (v11 - 1) & v11;
      unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
    }
    uint64_t v13 = *(unsigned __int8 *)(*(void *)(v2 + 48) + v9);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v1;
    unint64_t v30 = (void *)*v1;
    uint64_t *v1 = 0x8000000000000000;
    unint64_t v17 = sub_250C1B034(v13);
    uint64_t v18 = *(void *)(v15 + 16);
    BOOL v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      break;
    }
    char v21 = v16;
    if (*(void *)(v15 + 24) >= v20)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        int64_t v24 = v30;
        if (v16) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_250C13280();
        int64_t v24 = v30;
        if (v21) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_250C12304(v20, isUniquelyReferenced_nonNull_native);
      uint64_t v22 = sub_250C1B034(v13);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_38;
      }
      unint64_t v17 = v22;
      int64_t v24 = v30;
      if (v21)
      {
LABEL_4:
        *(void *)(v24[7] + 8 * v17) = 0;
        goto LABEL_5;
      }
    }
    v24[(v17 >> 6) + 8] |= 1 << v17;
    *(unsigned char *)(v24[6] + v17) = v13;
    *(void *)(v24[7] + 8 * v17) = 0;
    uint64_t v25 = v24[2];
    BOOL v26 = __OFADD__(v25, 1);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_35;
    }
    _OWORD v24[2] = v27;
LABEL_5:
    uint64_t *v1 = (uint64_t)v24;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

uint64_t sub_250BF9704()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_lastGesturePartRecognizedAt;
  uint64_t v2 = sub_250C1D2F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_250BF97B4()
{
  return type metadata accessor for HGHeuristicHeadGestureRecognizer();
}

uint64_t type metadata accessor for HGHeuristicHeadGestureRecognizer()
{
  uint64_t result = qword_269AF9710;
  if (!qword_269AF9710) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250BF9808()
{
  uint64_t result = sub_250C1D2F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_250BF98C0()
{
  *(unsigned char *)(v0 + 16) = 5;
  sub_250C1D248();
  *(void *)(v0 + OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_gestureContinuationTimeout) = 0x3FE999999999999ALL;
  uint64_t v1 = OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_partialGestureCountTarget;
  if (qword_269AF8F78 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v3 = (void *)sub_250C1D6A8();
  objc_msgSend(v2, sel_doubleForKey_, v3);
  uint64_t v5 = v4;

  *(void *)(v0 + v1) = v5;
  uint64_t v6 = OBJC_IVAR____TtC12HeadGestures32HGHeuristicHeadGestureRecognizer_progress;
  *(void *)(v0 + v6) = sub_250C0A9E8((uint64_t)&unk_2701CCFE0);
  return v0;
}

unint64_t sub_250BF99BC()
{
  unint64_t result = qword_269AF9358;
  if (!qword_269AF9358)
  {
    sub_250C1D348();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9358);
  }
  return result;
}

unint64_t sub_250BF9A14()
{
  unint64_t result = qword_269AF9720;
  if (!qword_269AF9720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9720);
  }
  return result;
}

uint64_t sub_250BF9A68@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_250BF8448(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_250BF9A94()
{
  unint64_t result = qword_269AF9370;
  if (!qword_269AF9370)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF9370);
  }
  return result;
}

__n128 __swift_memcpy121_8(uint64_t a1, long long *a2)
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
  *(_OWORD *)(a1 + 105) = *(long long *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGMotionData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 121)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 120);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HGMotionData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 120) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 121) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 121) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 120) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGMotionData()
{
  return &type metadata for HGMotionData;
}

void *sub_250BF9BC8(uint64_t a1, double a2)
{
  double v7 = *(double *)(v2 + 104);
  double v8 = *(double *)(a1 + 104) - v7;
  double v9 = v8 - a2;
  double v10 = round((v8 - a2) / a2);
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    swift_once();
    goto LABEL_7;
  }
  uint64_t v6 = (uint64_t)v10;
  uint64_t v5 = (uint64_t)v10 - 1;
  if ((uint64_t)v10 < 1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (v9 >= 1.0)
  {
    if (qword_269AF8F80 == -1)
    {
LABEL_22:
      uint64_t v30 = sub_250C1D3A8();
      __swift_project_value_buffer(v30, (uint64_t)qword_269AFCA38);
      int64_t v31 = sub_250C1D388();
      os_log_type_t v32 = sub_250C1D948();
      if (os_log_type_enabled(v31, v32))
      {
        char v33 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)char v33 = 134217984;
        sub_250C1DA48();
        _os_log_impl(&dword_250BD9000, v31, v32, "Timestamp gap too large: %f, going to reset the pipeline", v33, 0xCu);
        MEMORY[0x2533853C0](v33, -1, -1);
      }

      sub_250BDE908();
      swift_allocError();
      *uint64_t v34 = 1;
      swift_willThrow();
      return v23;
    }
LABEL_32:
    swift_once();
    goto LABEL_22;
  }
  uint64_t v3 = v2;
  uint64_t v4 = a1;
  if (qword_269AF8F80 != -1) {
    goto LABEL_30;
  }
LABEL_7:
  uint64_t v11 = sub_250C1D3A8();
  __swift_project_value_buffer(v11, (uint64_t)qword_269AFCA38);
  int64_t v12 = sub_250C1D388();
  os_log_type_t v13 = sub_250C1D928();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134217984;
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v12, v13, "Intepolation required, adding %ld data points in between", v14, 0xCu);
    MEMORY[0x2533853C0](v14, -1, -1);
  }

  if (qword_269AF8F70 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_269AFCA00;
  type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
  *(void *)(swift_allocObject()
            + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAInterpolatedDataEvent_intepolationAmount) = v6;
  sub_250C1D2C8();
  swift_beginAccess();
  uint64_t v16 = swift_retain();
  MEMORY[0x253384610](v16);
  if (*(void *)((*(void *)(v15 + 32) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v15 + 32) & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
    sub_250C1D838();
  sub_250C1D858();
  sub_250C1D828();
  swift_endAccess();
  swift_release();
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  double v17 = *(double *)v3;
  double v18 = *(double *)v4 - *(double *)v3;
  float64x2_t v48 = *(float64x2_t *)(v3 + 8);
  float64x2_t v46 = *(float64x2_t *)(v3 + 40);
  float64x2_t v47 = *(float64x2_t *)(v3 + 24);
  float64x2_t v44 = vsubq_f64(v47, v47);
  float64x2_t v45 = vsubq_f64(*(float64x2_t *)(v4 + 8), v48);
  float64x2_t v42 = *(float64x2_t *)(v3 + 56);
  float64x2_t v43 = vsubq_f64(v46, v46);
  float64x2_t v40 = *(float64x2_t *)(v3 + 72);
  float64x2_t v41 = vsubq_f64(*(float64x2_t *)(v4 + 56), v42);
  float64x2_t v38 = vsubq_f64(*(float64x2_t *)(v4 + 72), v40);
  float64x2_t v39 = *(float64x2_t *)(v3 + 88);
  double v19 = *(double *)(v3 + 112);
  double v20 = *(double *)(v4 + 112) - v19;
  float64x2_t v37 = vsubq_f64(*(float64x2_t *)(v4 + 88), v39);
  char v21 = sub_250BF140C(0, 1, 1, MEMORY[0x263F8EE78]);
  double v22 = (double)(v6 + 1);
  char v23 = v21;
  uint64_t v3 = 0;
  uint64_t v4 = v21[2];
  float64x2_t v24 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22, 0);
  for (uint64_t i = (v4 << 7) + 152; ; i += 128)
  {
    unint64_t v26 = v23[3];
    if (v4 + v3 >= v26 >> 1)
    {
      float64x2_t v36 = v24;
      uint64_t v29 = sub_250BF140C((void *)(v26 > 1), v4 + v3 + 1, 1, v23);
      float64x2_t v24 = v36;
      double v22 = (double)(v6 + 1);
      char v23 = v29;
    }
    double v27 = (double)(v3 + 1);
    _OWORD v23[2] = v4 + v3 + 1;
    int v28 = (float64x2_t *)((char *)v23 + i);
    v28[-8].f64[1] = v17 + v18 * v27 / v22;
    v28[-7] = vaddq_f64(v48, vdivq_f64(vmulq_n_f64(v45, v27), v24));
    v28[-6] = vaddq_f64(v47, vdivq_f64(vmulq_n_f64(v44, v27), v24));
    v28[-5] = vaddq_f64(v46, vdivq_f64(vmulq_n_f64(v43, v27), v24));
    v28[-4] = vaddq_f64(v42, vdivq_f64(vmulq_n_f64(v41, v27), v24));
    v28[-3] = vaddq_f64(v40, vdivq_f64(vmulq_n_f64(v38, v27), v24));
    v28[-2] = vaddq_f64(v39, vdivq_f64(vmulq_n_f64(v37, v27), v24));
    v28[-1].f64[0] = v7 + v8 * v27 / v22;
    v28[-1].f64[1] = v19 + v20 * v27 / v22;
    LOBYTE(v28->f64[0]) = 0;
    if (v5 == v3) {
      break;
    }
    if (__OFADD__(v3 + 1, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    ++v3;
  }
  return v23;
}

BOOL sub_250BFA13C(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL sub_250BFA178(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_250BFAE54((double *)v5, (double *)v7);
}

BOOL sub_250BFA1D8(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t sub_250BFA208()
{
  uint64_t v0 = qword_2701CD0B8;
  if (qword_2701CD0B8)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_250C04A24(0, qword_2701CD0B8, 0);
    uint64_t v1 = &byte_2701CD0C8;
    do
    {
      int v2 = *v1++;
      unint64_t v3 = 0x8000000250C21890;
      unint64_t v4 = 0xD000000000000011;
      switch(v2)
      {
        case 1:
          break;
        case 2:
          unint64_t v3 = 0xE400000000000000;
          unint64_t v4 = 1482908481;
          break;
        case 3:
          unint64_t v3 = 0xE400000000000000;
          unint64_t v4 = 1499685697;
          break;
        case 4:
          unint64_t v3 = 0xE400000000000000;
          unint64_t v4 = 1516462913;
          break;
        case 5:
          unint64_t v3 = 0xE500000000000000;
          unint64_t v4 = 0x586F727947;
          break;
        case 6:
          unint64_t v3 = 0xE500000000000000;
          unint64_t v4 = 0x596F727947;
          break;
        case 7:
          unint64_t v3 = 0xE500000000000000;
          unint64_t v4 = 0x5A6F727947;
          break;
        case 8:
          unint64_t v3 = 0xE400000000000000;
          unint64_t v4 = 1819045714;
          break;
        case 9:
          unint64_t v3 = 0xE500000000000000;
          unint64_t v4 = 0x6863746950;
          break;
        case 10:
          unint64_t v3 = 0xE300000000000000;
          unint64_t v4 = 7823705;
          break;
        case 11:
          unint64_t v3 = 0xE200000000000000;
          unint64_t v4 = 30801;
          break;
        case 12:
          unint64_t v3 = 0xE200000000000000;
          unint64_t v4 = 31057;
          break;
        case 13:
          unint64_t v3 = 0xE200000000000000;
          unint64_t v4 = 31313;
          break;
        case 14:
          unint64_t v3 = 0xE200000000000000;
          unint64_t v4 = 30545;
          break;
        case 15:
          unint64_t v3 = 0xEA00000000006C61;
          unint64_t v4 = 0x6E696769724F7369;
          break;
        default:
          unint64_t v3 = 0xEF706D617473656DLL;
          unint64_t v4 = 0x6954726F736E6553;
          break;
      }
      unint64_t v6 = *(void *)(v9 + 16);
      unint64_t v5 = *(void *)(v9 + 24);
      if (v6 >= v5 >> 1) {
        sub_250C04A24(v5 > 1, v6 + 1, 1);
      }
      *(void *)(v9 + 16) = v6 + 1;
      uint64_t v7 = v9 + 16 * v6;
      *(void *)(v7 + 32) = v4;
      *(void *)(v7 + 40) = v3;
      --v0;
    }
    while (v0);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9760);
  sub_250BDDD60(&qword_269AF9768, &qword_269AF9760);
  sub_250C1D688();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  uint64_t result = sub_250C1D768();
  qword_269AFC9A0 = 0;
  *(void *)algn_269AFC9A8 = 0xE000000000000000;
  return result;
}

unint64_t sub_250BFA4FC(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 1482908481;
      break;
    case 3:
      unint64_t result = 1499685697;
      break;
    case 4:
      unint64_t result = 1516462913;
      break;
    case 5:
      unint64_t result = 0x586F727947;
      break;
    case 6:
      unint64_t result = 0x596F727947;
      break;
    case 7:
      unint64_t result = 0x5A6F727947;
      break;
    case 8:
      unint64_t result = 1819045714;
      break;
    case 9:
      unint64_t result = 0x6863746950;
      break;
    case 10:
      unint64_t result = 7823705;
      break;
    case 11:
      unint64_t result = 30801;
      break;
    case 12:
      unint64_t result = 31057;
      break;
    case 13:
      unint64_t result = 31313;
      break;
    case 14:
      unint64_t result = 30545;
      break;
    case 15:
      unint64_t result = 0x6E696769724F7369;
      break;
    default:
      unint64_t result = 0x6954726F736E6553;
      break;
  }
  return result;
}

uint64_t sub_250BFA68C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_250BFA4FC(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_250BFA4FC(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_250C1DCF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_250BFA718()
{
  char v1 = *v0;
  sub_250C1DD78();
  sub_250BFA4FC(v1);
  sub_250C1D748();
  swift_bridgeObjectRelease();
  return sub_250C1DD98();
}

uint64_t sub_250BFA77C()
{
  sub_250BFA4FC(*v0);
  sub_250C1D748();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250BFA7D0()
{
  char v1 = *v0;
  sub_250C1DD78();
  sub_250BFA4FC(v1);
  sub_250C1D748();
  swift_bridgeObjectRelease();
  return sub_250C1DD98();
}

uint64_t sub_250BFA830@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_250BFB1F4();
  *a1 = result;
  return result;
}

unint64_t sub_250BFA860@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_250BFA4FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_250BFA88C(void *a1@<X8>)
{
  *a1 = &unk_2701CD0A8;
}

uint64_t sub_250BFA89C()
{
  return 0;
}

uint64_t sub_250BFAB94()
{
  return 0;
}

BOOL sub_250BFAD6C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  v13[0] = a1[6];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)a1 + 105);
  long long v3 = a1[1];
  v12[0] = *a1;
  v12[1] = v3;
  long long v4 = a1[3];
  void v12[2] = a1[2];
  uint64_t v12[3] = v4;
  long long v5 = *a2;
  long long v6 = a2[1];
  long long v7 = a2[3];
  v14[2] = a2[2];
  v14[3] = v7;
  v14[0] = v5;
  v14[1] = v6;
  long long v8 = a2[4];
  long long v9 = a2[5];
  long long v10 = a2[6];
  *(_OWORD *)&v15[9] = *(long long *)((char *)a2 + 105);
  v14[5] = v9;
  *(_OWORD *)uint64_t v15 = v10;
  v14[4] = v8;
  return sub_250BFAEC4((uint64_t)v12, (uint64_t)v14);
}

uint64_t sub_250BFADF4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

BOOL sub_250BFAE54(double *a1, double *a2)
{
  BOOL result = 0;
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3])
  {
    BOOL v2 = a1[4] == a2[4] && a1[5] == a2[5];
    if (v2 && a1[6] == a2[6]) {
      return 1;
    }
  }
  return result;
}

BOOL sub_250BFAEC4(uint64_t a1, uint64_t a2)
{
  if (*(double *)(a1 + 104) == *(double *)(a2 + 104))
  {
    uint64_t v2 = 0;
    if (*(double *)a1 != *(double *)a2) {
      return v2;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 8), *(float64x2_t *)(a2 + 8)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 24), *(float64x2_t *)(a2 + 24)))), 0xFuLL))) & 1) == 0)return v2; {
    if (*(double *)(a1 + 40) != *(double *)(a2 + 40))
    }
      return v2;
    if (*(double *)(a1 + 48) != *(double *)(a2 + 48)) {
      return v2;
    }
    uint64_t v2 = 0;
    if (*(double *)(a1 + 56) != *(double *)(a2 + 56)
      || *(double *)(a1 + 64) != *(double *)(a2 + 64)
      || *(double *)(a1 + 72) != *(double *)(a2 + 72))
    {
      return v2;
    }
    if (*(double *)(a1 + 80) == *(double *)(a2 + 80) && *(double *)(a1 + 88) == *(double *)(a2 + 88)) {
      return *(double *)(a1 + 96) == *(double *)(a2 + 96);
    }
  }
  return 0;
}

double sub_250BFAFB4@<D0>(void *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  id v5 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v5, sel_roll);
  uint64_t v39 = v6;

  id v7 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v7, sel_pitch);
  uint64_t v38 = v8;

  id v9 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v9, sel_yaw);
  uint64_t v37 = v10;

  id v11 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v11, sel_quaternion);
  uint64_t v36 = v12;

  id v13 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v13, sel_quaternion);
  uint64_t v35 = v14;

  id v15 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v15, sel_quaternion);
  uint64_t v17 = v16;

  id v18 = objc_msgSend(a1, sel_attitude);
  objc_msgSend(v18, sel_quaternion);
  uint64_t v20 = v19;

  objc_msgSend(a1, sel_rotationRate);
  uint64_t v22 = v21;
  objc_msgSend(a1, sel_rotationRate);
  uint64_t v24 = v23;
  objc_msgSend(a1, sel_rotationRate);
  uint64_t v26 = v25;
  objc_msgSend(a1, sel_userAcceleration);
  uint64_t v28 = v27;
  objc_msgSend(a1, sel_userAcceleration);
  uint64_t v30 = v29;
  objc_msgSend(a1, sel_userAcceleration);
  uint64_t v32 = v31;
  objc_msgSend(a1, sel_timestamp);
  *(void *)a2 = v39;
  *(void *)(a2 + 8) = v38;
  *(void *)(a2 + 16) = v37;
  *(void *)(a2 + 24) = v36;
  *(void *)(a2 + 32) = v35;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v20;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v24;
  *(void *)(a2 + 72) = v26;
  *(void *)(a2 + 80) = v28;
  *(void *)(a2 + 88) = v30;
  *(void *)(a2 + 96) = v32;
  *(void *)(a2 + 104) = v33;
  double result = a3;
  *(double *)(a2 + 112) = a3;
  *(unsigned char *)(a2 + 120) = 1;
  return result;
}

uint64_t sub_250BFB1F4()
{
  unint64_t v0 = sub_250C1DC08();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10) {
    return 16;
  }
  else {
    return v0;
  }
}

uint64_t sub_250BFB240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v86 = a3;
  uint64_t v5 = sub_250C1D098();
  unint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = a1;
  uint64_t v112 = a2;
  unint64_t v9 = 0xE200000000000000;
  uint64_t v95 = 8236;
  unint64_t v96 = 0xE200000000000000;
  sub_250BEDD64();
  unint64_t v10 = sub_250C1DA68();
  swift_bridgeObjectRelease();
  if (qword_269AF8F68 != -1) {
    goto LABEL_96;
  }
LABEL_2:
  uint64_t v111 = qword_269AFC9A0;
  uint64_t v112 = *(void *)algn_269AFC9A8;
  id v11 = self;
  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(v11, sel_whitespaceAndNewlineCharacterSet);
  sub_250C1D088();

  uint64_t v13 = sub_250C1DA78();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v113 = v13;
  uint64_t v114 = v15;
  uint64_t v111 = 8236;
  uint64_t v112 = v9;
  uint64_t v16 = sub_250C1DA68();
  swift_bridgeObjectRelease();
  unint64_t v17 = *(void *)(v16 + 16);
  unint64_t v6 = v10;
  if (*(void *)(v10 + 16) < v17)
  {
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  if (!v17)
  {
    int v88 = 0;
    uint64_t v92 = MEMORY[0x263F8EE80];
LABEL_60:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v40 = v92;
    if (*(void *)(v92 + 16))
    {
      unint64_t v41 = sub_250C1B1FC(0);
      if (v42)
      {
        if (*(void *)(v40 + 16))
        {
          uint64_t v43 = *(void *)(*(void *)(v40 + 56) + 8 * v41);
          unint64_t v44 = sub_250C1B1FC(1);
          if (v45)
          {
            if (*(void *)(v40 + 16))
            {
              uint64_t v46 = *(void *)(*(void *)(v40 + 56) + 8 * v44);
              unint64_t v47 = sub_250C1B1FC(2);
              if (v48)
              {
                if (*(void *)(v40 + 16))
                {
                  uint64_t v49 = *(void *)(*(void *)(v40 + 56) + 8 * v47);
                  unint64_t v50 = sub_250C1B1FC(3);
                  if (v51)
                  {
                    if (*(void *)(v40 + 16))
                    {
                      uint64_t v52 = *(void *)(*(void *)(v40 + 56) + 8 * v50);
                      unint64_t v53 = sub_250C1B1FC(4);
                      if (v54)
                      {
                        if (*(void *)(v40 + 16))
                        {
                          uint64_t v55 = *(void *)(*(void *)(v40 + 56) + 8 * v53);
                          unint64_t v56 = sub_250C1B1FC(5);
                          if (v57)
                          {
                            if (*(void *)(v40 + 16))
                            {
                              uint64_t v58 = *(void *)(*(void *)(v40 + 56) + 8 * v56);
                              unint64_t v59 = sub_250C1B1FC(6);
                              if (v60)
                              {
                                if (*(void *)(v40 + 16))
                                {
                                  uint64_t v61 = *(void *)(*(void *)(v40 + 56) + 8 * v59);
                                  unint64_t v62 = sub_250C1B1FC(7);
                                  if (v63)
                                  {
                                    if (*(void *)(v40 + 16))
                                    {
                                      uint64_t v64 = *(void *)(*(void *)(v40 + 56) + 8 * v62);
                                      unint64_t v65 = sub_250C1B1FC(8);
                                      if (v66)
                                      {
                                        if (*(void *)(v40 + 16))
                                        {
                                          unint64_t v93 = *(void *)(*(void *)(v40 + 56) + 8 * v65);
                                          unint64_t v67 = sub_250C1B1FC(9);
                                          if (v68)
                                          {
                                            if (*(void *)(v40 + 16))
                                            {
                                              unint64_t v91 = *(void *)(*(void *)(v40 + 56) + 8 * v67);
                                              unint64_t v69 = sub_250C1B1FC(10);
                                              if (v70)
                                              {
                                                if (*(void *)(v40 + 16))
                                                {
                                                  unint64_t v90 = *(void *)(*(void *)(v40 + 56) + 8 * v69);
                                                  unint64_t v71 = sub_250C1B1FC(11);
                                                  if (v72)
                                                  {
                                                    if (*(void *)(v40 + 16))
                                                    {
                                                      uint64_t v89 = *(void *)(*(void *)(v40 + 56) + 8 * v71);
                                                      unint64_t v73 = sub_250C1B1FC(12);
                                                      if (v74)
                                                      {
                                                        if (*(void *)(v40 + 16))
                                                        {
                                                          unint64_t v87 = *(void *)(*(void *)(v40 + 56) + 8 * v73);
                                                          unint64_t v75 = sub_250C1B1FC(13);
                                                          if (v76)
                                                          {
                                                            if (*(void *)(v40 + 16))
                                                            {
                                                              uint64_t v85 = *(void *)(*(void *)(v40 + 56) + 8 * v75);
                                                              unint64_t v77 = sub_250C1B1FC(14);
                                                              if (v78)
                                                              {
                                                                uint64_t v79 = *(void *)(v40 + 56);
                                                                uint64_t v84 = v46;
                                                                uint64_t v80 = v43;
                                                                uint64_t v81 = *(void *)(v79 + 8 * v77);
                                                                swift_bridgeObjectRelease();
                                                                uint64_t v95 = v93;
                                                                unint64_t v96 = v91;
                                                                unint64_t v97 = v90;
                                                                uint64_t v98 = v89;
                                                                unint64_t v99 = v87;
                                                                uint64_t v100 = v85;
                                                                uint64_t v101 = v81;
                                                                uint64_t v102 = v58;
                                                                uint64_t v103 = v61;
                                                                uint64_t v104 = v64;
                                                                uint64_t v105 = v49;
                                                                uint64_t v106 = v52;
                                                                uint64_t v107 = v55;
                                                                uint64_t v108 = v80;
                                                                uint64_t v109 = v84;
                                                                char v110 = v88 & 1;
                                                                nullsub_1(&v95);
                                                                sub_250BDE95C((uint64_t)&v95, (uint64_t)&v111);
                                                                uint64_t v18 = v86;
                                                                return sub_250BDE95C((uint64_t)&v111, v18);
                                                              }
LABEL_126:
                                                              __break(1u);
                                                              JUMPOUT(0x250BFBC64);
                                                            }
LABEL_125:
                                                            __break(1u);
                                                            goto LABEL_126;
                                                          }
LABEL_124:
                                                          __break(1u);
                                                          goto LABEL_125;
                                                        }
LABEL_123:
                                                        __break(1u);
                                                        goto LABEL_124;
                                                      }
LABEL_122:
                                                      __break(1u);
                                                      goto LABEL_123;
                                                    }
LABEL_121:
                                                    __break(1u);
                                                    goto LABEL_122;
                                                  }
LABEL_120:
                                                  __break(1u);
                                                  goto LABEL_121;
                                                }
LABEL_119:
                                                __break(1u);
                                                goto LABEL_120;
                                              }
LABEL_118:
                                              __break(1u);
                                              goto LABEL_119;
                                            }
LABEL_117:
                                            __break(1u);
                                            goto LABEL_118;
                                          }
LABEL_116:
                                          __break(1u);
                                          goto LABEL_117;
                                        }
LABEL_115:
                                        __break(1u);
                                        goto LABEL_116;
                                      }
LABEL_114:
                                      __break(1u);
                                      goto LABEL_115;
                                    }
LABEL_113:
                                    __break(1u);
                                    goto LABEL_114;
                                  }
LABEL_112:
                                  __break(1u);
                                  goto LABEL_113;
                                }
LABEL_111:
                                __break(1u);
                                goto LABEL_112;
                              }
LABEL_110:
                              __break(1u);
                              goto LABEL_111;
                            }
LABEL_109:
                            __break(1u);
                            goto LABEL_110;
                          }
LABEL_108:
                          __break(1u);
                          goto LABEL_109;
                        }
LABEL_107:
                        __break(1u);
                        goto LABEL_108;
                      }
LABEL_106:
                      __break(1u);
                      goto LABEL_107;
                    }
LABEL_105:
                    __break(1u);
                    goto LABEL_106;
                  }
LABEL_104:
                  __break(1u);
                  goto LABEL_105;
                }
LABEL_103:
                __break(1u);
                goto LABEL_104;
              }
LABEL_102:
              __break(1u);
              goto LABEL_103;
            }
LABEL_101:
            __break(1u);
            goto LABEL_102;
          }
LABEL_100:
          __break(1u);
          goto LABEL_101;
        }
LABEL_99:
        __break(1u);
        goto LABEL_100;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_99;
  }
  uint64_t v19 = 0;
  int v88 = 0;
  unint64_t v10 = 0;
  uint64_t v5 = 0;
  unint64_t v91 = (unint64_t)"nsion";
  uint64_t v92 = MEMORY[0x263F8EE80];
  uint64_t v89 = v16;
  unint64_t v90 = v17;
  unint64_t v87 = v6;
  while (2)
  {
    unint64_t v93 = v10 + 1;
    uint64_t v8 = *(char **)(v16 + v19 + 40);
    swift_bridgeObjectRetain();
    char v21 = sub_250BFB1F4();
    unint64_t v9 = v91 | 0x8000000000000000;
    switch(v21)
    {
      case 1:
        goto LABEL_25;
      case 2:
        unint64_t v9 = 0xE400000000000000;
        goto LABEL_25;
      case 3:
        unint64_t v9 = 0xE400000000000000;
        goto LABEL_25;
      case 4:
        unint64_t v9 = 0xE400000000000000;
        goto LABEL_25;
      case 5:
        unint64_t v9 = 0xE500000000000000;
        goto LABEL_25;
      case 6:
        unint64_t v9 = 0xE500000000000000;
        goto LABEL_25;
      case 7:
        unint64_t v9 = 0xE500000000000000;
        goto LABEL_25;
      case 8:
        unint64_t v9 = 0xE400000000000000;
        goto LABEL_25;
      case 9:
        unint64_t v9 = 0xE500000000000000;
        goto LABEL_25;
      case 10:
        unint64_t v9 = 0xE300000000000000;
        goto LABEL_25;
      case 11:
        unint64_t v9 = 0xE200000000000000;
        goto LABEL_25;
      case 12:
        unint64_t v9 = 0xE200000000000000;
        goto LABEL_25;
      case 13:
        unint64_t v9 = 0xE200000000000000;
        goto LABEL_25;
      case 14:
        unint64_t v9 = 0xE200000000000000;
        goto LABEL_25;
      case 15:
        swift_bridgeObjectRelease();
        goto LABEL_26;
      case 16:
        goto LABEL_92;
      default:
        unint64_t v9 = 0xEF706D617473656DLL;
LABEL_25:
        char v22 = sub_250C1DCF8();
        uint64_t v23 = swift_bridgeObjectRelease();
        if (v22)
        {
LABEL_26:
          if (v10 < *(void *)(v6 + 16))
          {
            uint64_t v24 = *(void *)(v6 + v19 + 32);
            uint64_t v25 = *(void *)(v6 + v19 + 40);
            if (v24 == 1702195828 && v25 == 0xE400000000000000)
            {
              int v88 = 1;
              unint64_t v20 = v90;
            }
            else
            {
              char v27 = sub_250C1DCF8();
              unint64_t v20 = v90;
              if (v27)
              {
                int v28 = 1;
LABEL_50:
                int v88 = v28;
                goto LABEL_8;
              }
              if (v24 != 0x65736C6166 || v25 != 0xE500000000000000)
              {
                if ((sub_250C1DCF8() & 1) == 0) {
                  goto LABEL_92;
                }
                int v28 = 0;
                goto LABEL_50;
              }
              int v88 = 0;
            }
LABEL_8:
            unint64_t v10 = v93;
LABEL_9:
            v19 += 16;
            if (v20 == v10) {
              goto LABEL_60;
            }
            continue;
          }
          __break(1u);
LABEL_95:
          __break(1u);
LABEL_96:
          swift_once();
          goto LABEL_2;
        }
        if (v10 >= *(void *)(v6 + 16)) {
          goto LABEL_95;
        }
        uint64_t v30 = *(void *)(v6 + v19 + 32);
        uint64_t v29 = *(void *)(v6 + v19 + 40);
        uint64_t v95 = 0;
        uint64_t v31 = MEMORY[0x270FA5388](v23);
        *(&v83 - 2) = (uint64_t)&v95;
        if ((v29 & 0x1000000000000000) != 0 || !(v29 & 0x2000000000000000 | v30 & 0x1000000000000000))
        {
          swift_bridgeObjectRetain();
          sub_250C1DAF8();
          swift_bridgeObjectRelease();
          goto LABEL_40;
        }
        MEMORY[0x270FA5388](v31);
        *(&v83 - 2) = (uint64_t)sub_250BFBCA8;
        *(&v83 - 1) = (uint64_t)(&v83 - 4);
        if ((v29 & 0x2000000000000000) != 0)
        {
          uint64_t v111 = v30;
          uint64_t v112 = v29 & 0xFFFFFFFFFFFFFFLL;
          swift_bridgeObjectRetain();
          if v30 < 0x21u && ((0x100003E01uLL >> v30))
          {
            BOOL v35 = 0;
            unint64_t v10 = v93;
          }
          else
          {
            uint64_t v34 = (unsigned char *)_swift_stdlib_strtod_clocale();
            unint64_t v10 = v93;
            if (v34) {
              BOOL v35 = *v34 == 0;
            }
            else {
              BOOL v35 = 0;
            }
          }
          char v94 = v35;
          swift_bridgeObjectRelease();
          unint64_t v6 = v87;
        }
        else
        {
          if ((v30 & 0x1000000000000000) != 0)
          {
            uint64_t v32 = (v29 & 0xFFFFFFFFFFFFFFFLL) + 32;
            uint64_t v33 = v30 & 0xFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v32 = sub_250C1DB58();
            uint64_t v33 = v39;
          }
          swift_bridgeObjectRetain();
          char v94 = sub_250BFADF4(v32, v33, (void (*)(uint64_t *__return_ptr))sub_250BFBD18) & 1;
          swift_bridgeObjectRelease();
          unint64_t v6 = v87;
LABEL_40:
          unint64_t v10 = v93;
        }
        if (v94)
        {
          double v36 = *(double *)&v95;
          uint64_t v37 = v92;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v111 = v37;
          sub_250BE2674(v21, isUniquelyReferenced_nonNull_native, v36);
          uint64_t v16 = v89;
          uint64_t v92 = v111;
          swift_bridgeObjectRelease();
          unint64_t v20 = v90;
          goto LABEL_9;
        }
LABEL_92:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_4:
        swift_bridgeObjectRelease();
        uint64_t v18 = v86;
        sub_250BDE9E0((uint64_t)&v95);
        sub_250BDE95C((uint64_t)&v95, (uint64_t)&v111);
        return sub_250BDE95C((uint64_t)&v111, v18);
    }
  }
}

unsigned char *sub_250BFBCA8@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  v7 = v6 && (double result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_250BFBD18@<X0>(unsigned char *a1@<X8>)
{
  double result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HGMotionData.Property(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF1) {
    goto LABEL_17;
  }
  if (a2 + 15 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 15) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 15;
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
      return (*a1 | (v4 << 8)) - 15;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 15;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x10;
  int v8 = v6 - 16;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HGMotionData.Property(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *double result = a2 + 15;
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
        JUMPOUT(0x250BFBEB8);
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
          *double result = a2 + 15;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGMotionData.Property()
{
  return &type metadata for HGMotionData.Property;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGAcceleration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HGAcceleration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HGAcceleration()
{
  return &type metadata for HGAcceleration;
}

ValueMetadata *type metadata accessor for HGRotationRate()
{
  return &type metadata for HGRotationRate;
}

uint64_t initializeBufferWithCopyOfBuffer for HGAttitude(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for HGAttitude(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HGAttitude(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGAttitude()
{
  return &type metadata for HGAttitude;
}

uint64_t sub_250BFC028()
{
  return sub_250BDDD60(&qword_269AF9770, &qword_269AF9778);
}

unint64_t sub_250BFC068()
{
  unint64_t result = qword_269AF9780;
  if (!qword_269AF9780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9780);
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HGQuaternion(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HGQuaternion(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGQuaternion()
{
  return &type metadata for HGQuaternion;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError()
{
  return &type metadata for CInteropUtils.DomainError;
}

uint64_t sub_250BFC148()
{
  return 0;
}

uint64_t sub_250BFC154@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_250BFC184()
{
  return 0;
}

void sub_250BFC190(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_250BFC19C(uint64_t a1)
{
  unint64_t v2 = sub_250BFCCC0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250BFC1D8(uint64_t a1)
{
  unint64_t v2 = sub_250BFCCC0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250BFC214(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF97C8);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF97D0);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  int v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF97D8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250BFCC6C();
  sub_250C1DDE8();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_250BFCCC0();
    sub_250C1DC88();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_250BFCD14();
    sub_250C1DC88();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

BOOL sub_250BFC4C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_250BFC4E4()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_250BFC520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250BFC6E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_250BFC548(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_250BFC554(uint64_t a1)
{
  unint64_t v2 = sub_250BFCC6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250BFC590(uint64_t a1)
{
  unint64_t v2 = sub_250BFCC6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250BFC5CC(uint64_t a1)
{
  unint64_t v2 = sub_250BFCD14();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250BFC608(uint64_t a1)
{
  unint64_t v2 = sub_250BFCD14();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250BFC644@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_250BFC7D8(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_250BFC674(void *a1)
{
  return sub_250BFC214(a1, *v1);
}

unint64_t sub_250BFC694()
{
  unint64_t result = qword_269AF9788;
  if (!qword_269AF9788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9788);
  }
  return result;
}

uint64_t sub_250BFC6E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000250C23570 || (sub_250C1DCF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000250C23590)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_250C1DCF8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_250BFC7D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9790);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9798);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF97A0);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_250BFCC6C();
  uint64_t v12 = v26;
  sub_250C1DDD8();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_250C1DC68();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_250C1DB48();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF97B0);
    *int v18 = &type metadata for CInteropUtils.DomainError;
    sub_250C1DC28();
    sub_250C1DB38();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_250BFCCC0();
    sub_250C1DC18();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_250BFCD14();
    sub_250C1DC18();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_0(v26);
  return a1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_250BFCC6C()
{
  unint64_t result = qword_269AF97A8;
  if (!qword_269AF97A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97A8);
  }
  return result;
}

unint64_t sub_250BFCCC0()
{
  unint64_t result = qword_269AF97B8;
  if (!qword_269AF97B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97B8);
  }
  return result;
}

unint64_t sub_250BFCD14()
{
  unint64_t result = qword_269AF97C0;
  if (!qword_269AF97C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97C0);
  }
  return result;
}

uint64_t _s12HeadGestures13CInteropUtilsV11DomainErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12HeadGestures13CInteropUtilsV11DomainErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x250BFCEC4);
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

unsigned char *sub_250BFCEEC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.CodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.CodingKeys;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.UnexpectedNullResultCodingKeys;
}

ValueMetadata *type metadata accessor for CInteropUtils()
{
  return &type metadata for CInteropUtils;
}

ValueMetadata *type metadata accessor for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys()
{
  return &type metadata for CInteropUtils.DomainError.BadArrayElementTypeCodingKeys;
}

unint64_t sub_250BFCF3C()
{
  unint64_t result = qword_269AF97E0;
  if (!qword_269AF97E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97E0);
  }
  return result;
}

unint64_t sub_250BFCF94()
{
  unint64_t result = qword_269AF97E8;
  if (!qword_269AF97E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97E8);
  }
  return result;
}

unint64_t sub_250BFCFEC()
{
  unint64_t result = qword_269AF97F0;
  if (!qword_269AF97F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97F0);
  }
  return result;
}

unint64_t sub_250BFD044()
{
  unint64_t result = qword_269AF97F8;
  if (!qword_269AF97F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF97F8);
  }
  return result;
}

unint64_t sub_250BFD09C()
{
  unint64_t result = qword_269AF9800;
  if (!qword_269AF9800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9800);
  }
  return result;
}

unint64_t sub_250BFD0F4()
{
  unint64_t result = qword_269AF9808;
  if (!qword_269AF9808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9808);
  }
  return result;
}

unint64_t sub_250BFD14C()
{
  unint64_t result = qword_269AF9810;
  if (!qword_269AF9810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9810);
  }
  return result;
}

uint64_t sub_250BFD1B4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_250BFD1F8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_250C1D198();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v20[-v11];
  *(void *)(v1 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer) = 0;
  uint64_t v13 = sub_250BDD628(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_250C1D468();
  swift_release();
  swift_release();
  if (v20[32] == 1)
  {
    sub_250C18AE4((uint64_t)v5);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_250BEB0A4((uint64_t)v5, &qword_269AF9300);
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v12, v5, v6);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v10, v12, v6);
      id v14 = objc_allocWithZone(MEMORY[0x263EF93B8]);
      id v15 = sub_250BFF68C((uint64_t)v10);
      uint64_t v16 = (void **)(v13 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
      swift_beginAccess();
      uint64_t v17 = *v16;
      *uint64_t v16 = v15;

      swift_beginAccess();
      int v18 = *v16;
      if (*v16)
      {
        swift_endAccess();
        objc_msgSend(v18, sel_setNumberOfLoops_, -1);
        (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v12, v6);
        swift_endAccess();
      }
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v20[8] = 1;
  swift_retain();
  sub_250C1D478();
  swift_release();

  return v13;
}

void sub_250BFD5E8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_250C1D348();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_250C1D3A8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v79 - v13;
  id v15 = (unsigned char *)(*(void *)(v1 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
  swift_beginAccess();
  if (*v15 != 1) {
    return;
  }
  uint64_t v86 = v7;
  uint64_t v87 = v5;
  uint64_t v88 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9828);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_250C1F740;
  uint64_t v17 = (void *)*MEMORY[0x263EFC100];
  *(void *)(inited + 32) = *MEMORY[0x263EFC100];
  id v18 = v17;
  uint64_t v19 = sub_250C1D868();
  type metadata accessor for CFBoolean(0);
  *(void *)(inited + 64) = v20;
  *(void *)(inited + 40) = v19;
  unint64_t v90 = sub_250C073A4(inited);
  swift_bridgeObjectRetain();
  id v21 = objc_msgSend(a1, sel_headGesture);
  uint64_t v22 = (unsigned __int8 *)(*(void *)(v2 + 16)
                          + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  int v23 = *v22;
  uint64_t v89 = v12;
  if (v21 == (id)2)
  {
    if (v23) {
      int v24 = 1371;
    }
    else {
      int v24 = 1372;
    }
    goto LABEL_10;
  }
  if (v21 == (id)1)
  {
    if (v23) {
      int v24 = 1372;
    }
    else {
      int v24 = 1371;
    }
LABEL_10:
    int v85 = v24;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock) = 0;
    swift_retain();
    sub_250C1D478();
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v8, (uint64_t)qword_269AFCA38);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v25, v8);
    id v26 = a1;
    char v27 = sub_250C1D388();
    int v28 = sub_250C1D938();
    if (os_log_type_enabled(v27, (os_log_type_t)v28))
    {
      int v81 = v28;
      uint64_t v84 = v9;
      uint64_t v29 = swift_slowAlloc();
      uint64_t v80 = swift_slowAlloc();
      *(void *)&long long aBlock = v80;
      *(_DWORD *)uint64_t v29 = 136315650;
      unint64_t v30 = (unint64_t)objc_msgSend(v26, sel_headGesture);
      uint64_t v83 = v8;
      uint64_t v82 = (uint64_t)a1;
      if (v30 > 2)
      {
        uint64_t v32 = 0x6E776F6E6B6E55;
        unint64_t v33 = 0xE700000000000000;
      }
      else
      {
        uint64_t v31 = 8 * v30;
        uint64_t v32 = *(void *)&aBackgrounod_4[8 * v30];
        unint64_t v33 = *(void *)&aNd_4[v31];
      }
      *(void *)&v97[0] = sub_250BE1D68(v32, v33, (uint64_t *)&aBlock);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      id v35 = objc_msgSend(v26, sel_uuid, v29 + 14);
      double v36 = v86;
      sub_250C1D328();

      sub_250BFF804((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
      uint64_t v37 = v88;
      uint64_t v38 = sub_250C1DCE8();
      unint64_t v40 = v39;
      (*(void (**)(char *, uint64_t))(v87 + 8))(v36, v37);
      *(void *)&v97[0] = sub_250BE1D68(v38, v40, (uint64_t *)&aBlock);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 22) = 2080;
      *(void *)&v97[0] = sub_250BE1D68(49, 0xE100000000000000, (uint64_t *)&aBlock);
      sub_250C1DA48();
      _os_log_impl(&dword_250BD9000, v27, (os_log_type_t)v81, "[Audio] Playing Audio feedback %s UUID: %s at volume %s", (uint8_t *)v29, 0x20u);
      uint64_t v41 = v80;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v41, -1, -1);
      MEMORY[0x2533853C0](v29, -1, -1);

      uint64_t v9 = v84;
      uint64_t v8 = v83;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v14, v83);
      a1 = (void *)v82;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    type metadata accessor for CFString(0);
    sub_250BFF804(&qword_269AF9118, type metadata accessor for CFString);
    unint64_t v34 = v90;
    char v42 = (void *)sub_250C1D638();
    swift_bridgeObjectRelease();
    uint64_t v43 = swift_allocObject();
    swift_weakInit();
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v43;
    *(void *)(v44 + 24) = v26;
    char v94 = sub_250BFF8CC;
    uint64_t v95 = v44;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v92 = sub_250BFD1B4;
    unint64_t v93 = &block_descriptor_33_0;
    char v45 = _Block_copy(&aBlock);
    id v46 = v26;
    swift_release();
    AudioServicesPlaySystemSoundWithOptions();
    _Block_release(v45);

    uint64_t v12 = v89;
    goto LABEL_20;
  }
  unint64_t v34 = v90;
  swift_bridgeObjectRelease();
LABEL_20:
  unint64_t v47 = (char *)objc_msgSend(a1, sel_headGesturePart);
  char v48 = (unsigned char *)(*(void *)(v2 + 16)
                + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_invertedConfirmationAudioFeedbackMode);
  swift_beginAccess();
  if ((unint64_t)(v47 - 3) < 2)
  {
    if (*v48) {
      int v49 = 1373;
    }
    else {
      int v49 = 1374;
    }
  }
  else
  {
    if ((unint64_t)(v47 - 1) > 1)
    {
      swift_bridgeObjectRelease();
      return;
    }
    if (*v48) {
      int v49 = 1374;
    }
    else {
      int v49 = 1373;
    }
  }
  int v85 = v49;
  sub_250BDBB0C((uint64_t)objc_msgSend(a1, sel_headGesturePart));
  double v51 = v50;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  float v52 = v51;
  uint64_t v53 = __swift_project_value_buffer(v8, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v53, v8);
  id v54 = a1;
  uint64_t v55 = sub_250C1D388();
  os_log_type_t v56 = sub_250C1D938();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v84 = v9;
    uint64_t v57 = swift_slowAlloc();
    uint64_t v82 = swift_slowAlloc();
    *(void *)&long long aBlock = v82;
    *(_DWORD *)uint64_t v57 = 136315650;
    uint64_t v58 = (char *)objc_msgSend(v54, sel_headGesturePart);
    uint64_t v83 = v8;
    if ((unint64_t)(v58 - 1) > 3)
    {
      uint64_t v60 = 0x6E776F6E6B6E75;
      unint64_t v61 = 0xE700000000000000;
    }
    else
    {
      uint64_t v59 = 8 * (void)(v58 - 1);
      uint64_t v60 = *(void *)&aNodup_3[v59];
      unint64_t v61 = *(void *)&aShakelefshaker_2[v59 + 16];
    }
    *(void *)&v97[0] = sub_250BE1D68(v60, v61, (uint64_t *)&aBlock);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 12) = 2080;
    id v62 = objc_msgSend(v54, sel_uuid);
    char v63 = v86;
    sub_250C1D328();

    sub_250BFF804((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
    uint64_t v64 = v88;
    uint64_t v65 = sub_250C1DCE8();
    unint64_t v67 = v66;
    (*(void (**)(char *, uint64_t))(v87 + 8))(v63, v64);
    *(void *)&v97[0] = sub_250BE1D68(v65, v67, (uint64_t *)&aBlock);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 22) = 2048;
    v97[0] = v52;
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v55, v56, "[Audio] Playing Audio feedback %s UUID: %s at volume %f", (uint8_t *)v57, 0x20u);
    uint64_t v68 = v82;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v68, -1, -1);
    MEMORY[0x2533853C0](v57, -1, -1);

    (*(void (**)(char *, uint64_t))(v84 + 8))(v89, v83);
    unint64_t v34 = v90;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  id v69 = (id)*MEMORY[0x263EFC118];
  uint64_t v70 = sub_250C1D8A8();
  type metadata accessor for CFNumber(0);
  char v72 = v71;
  unint64_t v93 = v71;
  *(void *)&long long aBlock = v70;
  sub_250BE3F48(&aBlock, v97);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v96 = v34;
  sub_250BE23D0(v97, v69, isUniquelyReferenced_nonNull_native);
  unint64_t v74 = v96;

  swift_bridgeObjectRelease();
  if (objc_msgSend(v54, sel_headGesturePart) == (id)3 || objc_msgSend(v54, sel_headGesturePart) == (id)4)
  {
    id v75 = (id)*MEMORY[0x263EFC108];
    uint64_t v76 = sub_250C1D8D8();
    unint64_t v93 = v72;
    *(void *)&long long aBlock = v76;
    sub_250BE3F48(&aBlock, v97);
    char v77 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v96 = v74;
    sub_250BE23D0(v97, v75, v77);

    swift_bridgeObjectRelease();
  }
  type metadata accessor for CFString(0);
  sub_250BFF804(&qword_269AF9118, type metadata accessor for CFString);
  char v78 = (void *)sub_250C1D638();
  swift_bridgeObjectRelease();
  AudioServicesPlaySystemSoundWithOptions();
}

uint64_t sub_250BFE374(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_250C1D348();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D3A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v33) = 1;
    sub_250C1D478();
  }
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  id v12 = a2;
  uint64_t v13 = sub_250C1D388();
  int v14 = sub_250C1D938();
  if (os_log_type_enabled(v13, (os_log_type_t)v14))
  {
    int v29 = v14;
    uint64_t v31 = v4;
    uint64_t v15 = v3;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v33 = v28;
    *(_DWORD *)uint64_t v16 = 136315394;
    unint64_t v17 = (unint64_t)objc_msgSend(v12, sel_headGesture);
    uint64_t v30 = v7;
    if (v17 > 2)
    {
      unint64_t v20 = 0xE700000000000000;
      uint64_t v19 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v18 = 8 * v17;
      uint64_t v19 = *(void *)&aBackgrounod_4[8 * v17];
      unint64_t v20 = *(void *)&aNd_4[v18];
    }
    uint64_t v32 = sub_250BE1D68(v19, v20, &v33);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    id v22 = objc_msgSend(v12, sel_uuid, v16 + 14);
    sub_250C1D328();

    sub_250BFF804((unint64_t *)&qword_269AF9358, MEMORY[0x263F07508]);
    uint64_t v23 = sub_250C1DCE8();
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v15);
    uint64_t v32 = sub_250BE1D68(v23, v25, &v33);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v13, (os_log_type_t)v29, "[Audio] Finished playing Audio feedback %s UUID: %s", (uint8_t *)v16, 0x16u);
    uint64_t v26 = v28;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v26, -1, -1);
    MEMORY[0x2533853C0](v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v30);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

id sub_250BFE7F0()
{
  if (*(void *)(v0 + 32))
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
    *(void *)(v0 + 32) = 0;
    swift_release();
  }
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_stop);
}

uint64_t sub_250BFE870()
{
  uint64_t v1 = sub_250C1D5D8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D5F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = *(void *)(v0 + 24);
  aBlock[4] = sub_250BFF590;
  uint64_t v13 = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_22;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_250C1D5E8();
  v11[1] = MEMORY[0x263F8EE78];
  sub_250BFF804((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v8, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return swift_release();
}

uint64_t sub_250BFEB14(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  objc_msgSend(*v1, sel_play);
  return sub_250BFEE60((uint64_t)nullsub_1, 0, 1.0);
}

uint64_t sub_250BFEB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_250C1D5D8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250C1D5F8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(void *)(v3 + 24);
  int v14 = (void *)swift_allocObject();
  v14[2] = v3;
  v14[3] = a1;
  v14[4] = a2;
  aBlock[4] = sub_250BFF548;
  void aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_4;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_250C1D5E8();
  v17[1] = MEMORY[0x263F8EE78];
  sub_250BFF804((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

uint64_t sub_250BFEE60(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = v3;
  uint64_t v28 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9488);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v3 + 32))
  {
    swift_retain();
    sub_250C1D3C8();
    swift_release();
    *(void *)(v3 + 32) = 0;
    swift_release();
  }
  sub_250BE79C8(0, (unint64_t *)&qword_269AF9678);
  id v17 = objc_msgSend(self, sel_mainRunLoop);
  uint64_t v18 = sub_250C1DA08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
  uint64_t v19 = sub_250C1D9E8();

  sub_250BEB0A4((uint64_t)v12, &qword_269AF9488);
  uint64_t v30 = v19;
  sub_250C1D9D8();
  sub_250BFF804((unint64_t *)&qword_269AF9680, MEMORY[0x263F07CE8]);
  uint64_t v20 = sub_250C1D408();
  swift_release();
  uint64_t v30 = v20;
  id v29 = *(id *)(v4 + 24);
  id v21 = v29;
  uint64_t v22 = sub_250C1D988();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  id v23 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9688);
  sub_250BE79C8(0, (unint64_t *)&qword_269AF90C0);
  sub_250BDDD60(&qword_269AF9690, &qword_269AF9688);
  sub_250BF60DC();
  sub_250C1D598();
  sub_250BEB0A4((uint64_t)v9, &qword_269AF96C0);

  swift_release();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v4;
  *(float *)(v24 + 24) = a3;
  *(void *)(v24 + 32) = v28;
  *(void *)(v24 + 40) = a2;
  sub_250BDDD60(&qword_269AF96D8, &qword_269AF96C8);
  swift_retain();
  swift_retain();
  uint64_t v25 = sub_250C1D5C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *(void *)(v4 + 32) = v25;
  return swift_release();
}

void sub_250BFF2C0(float a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  uint64_t v7 = (id *)(a3 + OBJC_IVAR____TtC12HeadGestures19HGSystemAudioPlayer_waitingTonePlayer);
  swift_beginAccess();
  if (*v7)
  {
    id v8 = *v7;
    id v9 = objc_msgSend(v8, sel_volume);
    if (v10 == a1)
    {
      if (*(void *)(a3 + 32))
      {
        swift_retain();
        sub_250C1D3C8();
        swift_release();
        *(void *)(a3 + 32) = 0;
        id v9 = (id)swift_release();
      }
      a4(v9);
    }
    objc_msgSend(v8, sel_volume);
    float v12 = v11;
    objc_msgSend(v8, sel_volume);
    float v14 = *(float *)&v13 + -0.05;
    if ((float)(*(float *)&v13 + -0.05) <= a1) {
      float v14 = a1;
    }
    *(float *)&double v13 = *(float *)&v13 + 0.05;
    if (*(float *)&v13 > a1) {
      *(float *)&double v13 = a1;
    }
    if (v12 >= a1) {
      *(float *)&double v13 = v14;
    }
    objc_msgSend(v8, sel_setVolume_, v13);
  }
}

void sub_250BFF3EC()
{
}

uint64_t sub_250BFF3FC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_250BFF470()
{
  return type metadata accessor for HGSystemAudioPlayer();
}

uint64_t type metadata accessor for HGSystemAudioPlayer()
{
  uint64_t result = qword_269AF9818;
  if (!qword_269AF9818) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250BFF4C4()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250BFF508()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_250BFF548()
{
  return sub_250BFEE60(*(void *)(v0 + 24), *(void *)(v0 + 32), 0.0);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_250BFF590()
{
  return sub_250BFEB14(v0);
}

uint64_t sub_250BFF598@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_250C1D468();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_250BFF618()
{
  return sub_250C1D478();
}

id sub_250BFF68C(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_250C1D158();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_250C1D198();
    id v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_250C1D128();

    swift_willThrow();
    uint64_t v11 = sub_250C1D198();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

double sub_250BFF7D8(float (*a1)(void))
{
  return a1();
}

uint64_t sub_250BFF804(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250BFF854()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250BFF88C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250BFF8CC()
{
  return sub_250BFE374(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_250BFF8D4()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_250BFF914(uint64_t a1)
{
  sub_250BFF2C0(*(float *)(v1 + 24), a1, *(void *)(v1 + 16), *(void (**)(id))(v1 + 32));
}

uint64_t sub_250BFF93C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[4] = MEMORY[0x263F8EE78];
  v2[5] = v3;
  v2[6] = v3;
  v2[7] = v3;
  v2[8] = v3;
  v2[9] = v3;
  if (a2 < 1)
  {
    uint64_t result = sub_250C1DB88();
    __break(1u);
  }
  else
  {
    v2[2] = a1;
    v2[3] = a2;
    return (uint64_t)v2;
  }
  return result;
}

void *sub_250BFF9C8@<X0>(double *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  double v5 = a1[7];
  double v4 = a1[8];
  double v6 = a1[9];
  double v7 = a1[11];
  double v8 = a1[12];
  float v9 = a1[10];
  unint64_t v10 = *(void *)(a2 + 16);
  unint64_t v11 = *(void *)(a2 + 24);
  swift_beginAccess();
  float v12 = (void *)sub_250C13B74(v10, v11, v9);
  swift_endAccess();
  swift_beginAccess();
  float v13 = v7;
  float v14 = (void *)sub_250C13B74(v10, v11, v13);
  swift_endAccess();
  swift_beginAccess();
  float v15 = v8;
  uint64_t v16 = (void *)sub_250C13B74(v10, v11, v15);
  swift_endAccess();
  swift_beginAccess();
  float v17 = v5;
  uint64_t v18 = (void *)sub_250C13B74(v10, v11, v17);
  swift_endAccess();
  swift_beginAccess();
  float v19 = v4;
  uint64_t v20 = (void *)sub_250C13B74(v10, v11, v19);
  swift_endAccess();
  swift_beginAccess();
  float v21 = v6;
  uint64_t v22 = (void *)sub_250C13B74(v10, v11, v21);
  swift_endAccess();
  if (!v12)
  {

LABEL_12:
LABEL_13:

LABEL_14:
LABEL_15:
    uint64_t result = 0;
    goto LABEL_16;
  }
  if (!v14)
  {

LABEL_11:
    goto LABEL_12;
  }
  if (!v16)
  {

    goto LABEL_11;
  }
  if (!v18)
  {

    goto LABEL_15;
  }
  if (!v20)
  {

    goto LABEL_14;
  }
  if (!v22)
  {

    goto LABEL_13;
  }
  type metadata accessor for HGMLInput();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v18;
  result[3] = v20;
  result[4] = v22;
  result[5] = v12;
  result[6] = v14;
  result[7] = v16;
LABEL_16:
  *a3 = result;
  return result;
}

uint64_t sub_250BFFC34()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGBuffer()
{
  return self;
}

Swift::Bool __swiftcall HGHeadGestureResult.isPartGesture()()
{
  return !objc_msgSend(v0, sel_headGesture) && objc_msgSend(v0, sel_headGesturePart) != 0;
}

Swift::String __swiftcall HGHeadGestureResult.description()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D2F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250C1D348();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  float v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_250C1DB08();
  sub_250C1D768();
  id v10 = objc_msgSend(v0, sel_uuid);
  sub_250C1D328();

  sub_250BF99BC();
  sub_250C1DCE8();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_250C1D768();
  objc_msgSend(v1, sel_headGesture);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v11 = objc_msgSend(v1, sel_avgConfidence);
  id v12 = objc_msgSend(v11, sel_description);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  objc_msgSend(v1, sel_headGesturePart);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  id v13 = objc_msgSend(v1, sel_timestamp);
  sub_250C1D2B8();

  sub_250C1D2A8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_250C1D898();
  uint64_t v14 = v17;
  float v15 = (void *)v18;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

id sub_250C000E8(unsigned __int8 a1)
{
  uint64_t v2 = sub_250C1D2F8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  objc_msgSend(v6, sel_setHeadGesture_, 0);
  objc_msgSend(v6, sel_setHeadGesturePart_, a1);
  sub_250C0092C();
  uint64_t v7 = (void *)sub_250C1D9F8();
  objc_msgSend(v6, sel_setAvgConfidence_, v7);

  sub_250C1D2E8();
  uint64_t v8 = (void *)sub_250C1D268();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v6, sel_setTimestamp_, v8);

  return v6;
}

uint64_t sub_250C0024C(char a1)
{
  return *(void *)&aBackgrouyes[8 * a1];
}

BOOL sub_250C0026C(char a1, BOOL a2)
{
  if (a1 == 1)
  {
    uint64_t v2 = &unk_2701CD278;
    return sub_250C003C8(a2, (uint64_t)v2);
  }
  if (a1 == 2)
  {
    uint64_t v2 = &unk_2701CD2A0;
    return sub_250C003C8(a2, (uint64_t)v2);
  }
  return 0;
}

unint64_t sub_250C002C4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_250C008C8(*a1);
  *a2 = result;
  return result;
}

void sub_250C002F0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_250C002FC()
{
  return sub_250C0024C(*v0);
}

void sub_250C00304(void *a1@<X8>)
{
  *a1 = &unk_2701CD2C8;
}

uint64_t sub_250C00314()
{
  return sub_250C1D7E8();
}

uint64_t sub_250C00374()
{
  return sub_250C1D7D8();
}

BOOL sub_250C003C8(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    unint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_250C00428(void *a1@<X8>)
{
  *a1 = &unk_2701CD2F0;
}

ValueMetadata *type metadata accessor for HGHeadGesturePartInternal()
{
  return &type metadata for HGHeadGesturePartInternal;
}

uint64_t _s12HeadGestures21HGHeadGestureInternalOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s12HeadGestures21HGHeadGestureInternalOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x250C005ACLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGHeadGestureInternal()
{
  return &type metadata for HGHeadGestureInternal;
}

uint64_t sub_250C005E4()
{
  return sub_250C0068C(&qword_269AF9830, &qword_269AF9838);
}

unint64_t sub_250C00610()
{
  unint64_t result = qword_269AF9840;
  if (!qword_269AF9840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9840);
  }
  return result;
}

uint64_t sub_250C00664()
{
  return sub_250C0068C(&qword_269AF9848, &qword_269AF9850);
}

uint64_t sub_250C0068C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_250C006E0()
{
  unint64_t result = qword_269AF9858;
  if (!qword_269AF9858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9858);
  }
  return result;
}

unint64_t sub_250C00734(unint64_t result)
{
  if (result >= 5) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t sub_250C00740(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x756F72676B636142 && a2 == 0xEA0000000000646ELL;
  if (v3 || (sub_250C1DCF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7562585 && a2 == 0xE300000000000000 || (sub_250C1DCF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 28494 && a2 == 0xE200000000000000 || (sub_250C1DCF8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x67695220746C6954 && a2 == 0xEA00000000007468)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_250C1DCF8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

unint64_t sub_250C008C8(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

unint64_t sub_250C008D8()
{
  unint64_t result = qword_269AF9860;
  if (!qword_269AF9860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9860);
  }
  return result;
}

unint64_t sub_250C0092C()
{
  unint64_t result = qword_269AF94E8;
  if (!qword_269AF94E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF94E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Orientation()
{
  return &type metadata for Orientation;
}

void *__swift_memcpy305_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x131uLL);
}

uint64_t getEnumTagSinglePayload for HGMotionState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 305)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 136);
  if (v3 >= 2) {
    int v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v4 = -2;
  }
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HGMotionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 304) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 305) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 305) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 136) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGMotionState()
{
  return &type metadata for HGMotionState;
}

double sub_250C00A9C(float32x4_t *a1, double result, double a3, double a4, float32x4_t a5)
{
  uint64_t v5 = a1[1].i64[0];
  if (v5)
  {
    float32x4_t v6 = a1[2];
    float v7 = 1.0 / (float)v5;
    float32x4_t v8 = vmulq_n_f32(v6, v7);
    uint64_t v9 = v5 - 1;
    if (v5 != 1)
    {
      uint64_t v10 = a1 + 3;
      a5.i64[0] = 0;
      do
      {
        float32x4_t v11 = *v10++;
        float32x4_t v12 = vmulq_f32(v6, v11);
        *(float32x2_t *)v12.f32 = vadd_f32(*(float32x2_t *)v12.f32, (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v12, (int8x16_t)v12, 8uLL));
        v12.f32[0] = vaddv_f32(*(float32x2_t *)v12.f32);
        float32x4_t v8 = vaddq_f32(v8, vmulq_n_f32((float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(a5, v12), 0), (int8x16_t)vsubq_f32((float32x4_t)0, v11), (int8x16_t)v11), v7));
        --v9;
      }
      while (v9);
    }
    int8x16_t v13 = (int8x16_t)vmulq_f32(v8, v8);
    float32x2_t v14 = vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
    if (vaddv_f32(v14) == 0.0)
    {
      return 0.0;
    }
    else
    {
      unsigned __int32 v15 = vadd_f32(v14, (float32x2_t)vdup_lane_s32((int32x2_t)v14, 1)).u32[0];
      float32x2_t v16 = vrsqrte_f32((float32x2_t)v15);
      float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15, vmul_f32(v16, v16)));
      *(void *)&unint64_t result = vmulq_n_f32(v8, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15, vmul_f32(v17, v17))).f32[0]).u64[0];
    }
  }
  return result;
}

uint64_t sub_250C00B70(void *__src, const void *a2)
{
  memcpy(v4, __src, 0x131uLL);
  memcpy(__dst, a2, 0x131uLL);
  return sub_250C00BC8((uint64_t)v4, (uint64_t)__dst) & 1;
}

uint64_t sub_250C00BC8(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)a1 != *(double *)a2) {
      char v3 = 1;
    }
    if (v3) {
      return 0;
    }
  }
  sub_250BDE95C(a1 + 16, (uint64_t)v28);
  sub_250BDE95C(a2 + 16, (uint64_t)v29);
  sub_250BDE95C((uint64_t)v28, (uint64_t)v30);
  if (sub_250BDE9C4((uint64_t)v30) == 1)
  {
    sub_250BDE95C((uint64_t)v29, (uint64_t)v27);
    uint64_t result = sub_250BDE9C4((uint64_t)v27);
    if (result == 1) {
      return result;
    }
  }
  else
  {
    sub_250BDE95C((uint64_t)v29, (uint64_t)v27);
    if (sub_250BDE9C4((uint64_t)v27) != 1)
    {
      sub_250BDE95C((uint64_t)v28, (uint64_t)v5);
      sub_250BDE95C((uint64_t)v29, (uint64_t)v16);
      if (v15 == v26
        && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v5[0], v16[0]), (int32x4_t)vceqq_f64(v5[1], v16[1]))), 0xFuLL))) & 1) != 0&& v6 == v17&& v7 == v18&& v8 == v19&& v9 == v20&& v10 == v21&& v11 == v22&& v12 == v23&& v13 == v24)
      {
        return v14 == v25;
      }
    }
  }
  return 0;
}

double sub_250C00D74(float32x4_t a1)
{
  float v2 = a1.f32[3];
  float v3 = vmuls_lane_f32(a1.f32[0], a1, 3);
  float v4 = a1.f32[2];
  float v5 = vmuls_lane_f32(a1.f32[1], a1, 2);
  float v6 = (float)(v3 + v5) + (float)(v3 + v5);
  float v7 = vmulq_f32(a1, a1).f32[0];
  float v8 = vmuls_lane_f32(a1.f32[1], *(float32x2_t *)a1.f32, 1);
  atan2f(v6, 1.0 - (float)((float)(v7 + v8) + (float)(v7 + v8)));
  float v9 = vmuls_lane_f32(v2, *(float32x2_t *)a1.f32, 1);
  float v10 = vmuls_lane_f32(a1.f32[0], a1, 2);
  float v11 = atan2f(sqrtf((float)((float)(v9 - v10) + (float)(v9 - v10)) + 1.0), sqrtf(1.0 - (float)((float)(v9 - v10) + (float)(v9 - v10))));
  double v12 = v11 + v11 + -1.57079633;
  float v13 = vmuls_lane_f32(v2, a1, 2);
  float v14 = vmuls_lane_f32(a1.f32[0], *(float32x2_t *)a1.f32, 1);
  float v15 = (float)(v13 + v14) + (float)(v13 + v14);
  float v16 = vmuls_lane_f32(v4, a1, 2);
  atan2f(v15, 1.0 - (float)((float)(v8 + v16) + (float)(v8 + v16)));
  return v12;
}

uint64_t sub_250C00E5C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_250C00E70(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_250C00E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_250C00E98(char *a1)
{
  float v2 = v1;
  uint64_t v28 = a1;
  uint64_t v3 = sub_250C1D5D8();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v31 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D998();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  float v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250C1D968();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_250C1D5F8();
  uint64_t v29 = *(void *)(v10 - 8);
  uint64_t v30 = v10;
  MEMORY[0x270FA5388](v10);
  double v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[1] = sub_250BDDCD8();
  sub_250C1D5E8();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_250C01988(&qword_269AF90C8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90D0);
  sub_250BDDD60(&qword_269AF90D8, &qword_269AF90D0);
  float v13 = v28;
  sub_250C1DA88();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F130], v5);
  uint64_t v14 = sub_250C1D9C8();
  v1[2] = v13;
  v1[3] = v14;
  float v15 = (void **)&v13[OBJC_IVAR___HGConfigurationInternal_mlConfig];
  swift_beginAccess();
  float v16 = *v15;
  unint64_t v17 = *(void *)((char *)*v15 + OBJC_IVAR___HGMLConfigurationInternal_modelType);
  if (v17 >= 2)
  {
    if (v17 != 2)
    {
      uint64_t result = sub_250C1DB88();
      __break(1u);
      return result;
    }
    uint64_t v18 = type metadata accessor for HGEspressoV2Model();
    swift_allocObject();
    double v22 = v13;
    uint64_t v20 = (uint64_t)sub_250C07714(v16);
    double v21 = &off_2701CE560;
  }
  else
  {
    uint64_t v18 = type metadata accessor for HGEspressoV1Model();
    swift_allocObject();
    double v19 = v13;
    uint64_t v20 = sub_250BEBE2C(v16);
    double v21 = &off_2701CD7F0;
  }
  v2[7] = v18;
  v2[8] = v21;
  v2[4] = v20;
  aBlock[4] = sub_250C01968;
  void aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_5;
  double v23 = _Block_copy(aBlock);
  swift_retain();
  sub_250C1D5E8();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_250C01988((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  double v24 = v31;
  uint64_t v25 = v33;
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v12, v24, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  swift_release();
  return (uint64_t)v2;
}

uint64_t sub_250C01424(void *a1)
{
  float v2 = a1 + 4;
  uint64_t v3 = a1[7];
  uint64_t v4 = a1[8];
  __swift_project_boxed_opaque_existential_1(a1 + 4, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  uint64_t v6 = a1[7];
  uint64_t v5 = a1[8];
  __swift_project_boxed_opaque_existential_1(v2, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v6, v5);
}

uint64_t sub_250C014B8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9868);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9870);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1;
  id v23 = *(id *)(v2 + 24);
  id v15 = v23;
  uint64_t v16 = sub_250C1D988();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  id v17 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9878);
  sub_250BDDCD8();
  sub_250BDDD60(&qword_269AF9880, &qword_269AF9878);
  sub_250C01988((unint64_t *)&qword_269AF96D0, (void (*)(uint64_t))sub_250BDDCD8);
  sub_250C1D598();
  sub_250C0189C((uint64_t)v6);

  type metadata accessor for HGMLOutput();
  sub_250BDDD60(&qword_269AF9888, &qword_269AF9868);
  swift_retain();
  sub_250C1D4A8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_250BDDD60(&qword_269AF9890, &qword_269AF9870);
  uint64_t v18 = v21;
  uint64_t v19 = sub_250C1D498();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v18);
  return v19;
}

uint64_t sub_250C01830()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLHeadGesturesClassifier()
{
  return self;
}

uint64_t sub_250C0189C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250C018FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = v2[7];
  uint64_t v6 = v2[8];
  __swift_project_boxed_opaque_existential_1(v2 + 4, v5);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v4, v5, v6);
  *a2 = result;
  return result;
}

uint64_t sub_250C01968()
{
  return sub_250C01424(v0);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_250C01988(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250C019D0(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v4 = a1;
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_250C04A24(0, v2, 0);
  uint64_t v3 = v31;
  uint64_t result = sub_250C05A9C(v4);
  uint64_t v6 = result;
  int v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = v4 + 64;
  uint64_t v25 = v4 + 80;
  int64_t v26 = v2;
  int v27 = v7;
  uint64_t v28 = v4;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v4 + 32))
  {
    unint64_t v14 = (unint64_t)v6 >> 6;
    if ((*(void *)(v10 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(v4 + 36) != v8) {
      goto LABEL_26;
    }
    uint64_t result = sub_250C02400(v30);
    if (v1)
    {
      swift_release();
      return v3;
    }
    uint64_t v29 = v9;
    uint64_t v16 = v30[0];
    uint64_t v15 = v30[1];
    uint64_t v31 = v3;
    unint64_t v18 = *(void *)(v3 + 16);
    unint64_t v17 = *(void *)(v3 + 24);
    if (v18 >= v17 >> 1)
    {
      uint64_t result = sub_250C04A24(v17 > 1, v18 + 1, 1);
      uint64_t v3 = v31;
    }
    *(void *)(v3 + 16) = v18 + 1;
    uint64_t v19 = v3 + 16 * v18;
    *(void *)(v19 + 32) = v16;
    *(void *)(v19 + 40) = v15;
    uint64_t v4 = v28;
    int64_t v11 = 1 << *(unsigned char *)(v28 + 32);
    if (v6 >= v11) {
      goto LABEL_27;
    }
    uint64_t v20 = *(void *)(v10 + 8 * v14);
    if ((v20 & (1 << v6)) == 0) {
      goto LABEL_28;
    }
    int v8 = v27;
    if (*(_DWORD *)(v28 + 36) != v27) {
      goto LABEL_29;
    }
    unint64_t v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      int64_t v11 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v12 = v29;
      uint64_t v1 = 0;
      int64_t v13 = v26;
    }
    else
    {
      unint64_t v22 = v14 + 1;
      unint64_t v23 = (unint64_t)(v11 + 63) >> 6;
      uint64_t v12 = v29;
      uint64_t v1 = 0;
      int64_t v13 = v26;
      if (v14 + 1 < v23)
      {
        unint64_t v24 = *(void *)(v10 + 8 * v22);
        if (v24)
        {
LABEL_21:
          int64_t v11 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v14)
          {
            unint64_t v24 = *(void *)(v25 + 8 * v14++);
            if (v24)
            {
              unint64_t v22 = v14 + 1;
              goto LABEL_21;
            }
          }
        }
      }
    }
    uint64_t v9 = v12 + 1;
    uint64_t v6 = v11;
    if (v9 == v13) {
      return v3;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_250C01C1C()
{
  return 0;
}

unint64_t sub_250C01E28(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000019;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_250C01EEC(char a1)
{
  unint64_t result = 0xD00000000000001DLL;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000019;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_250C01FB0(char *a1, char *a2)
{
  return sub_250C0ACDC(*a1, *a2);
}

uint64_t sub_250C01FBC()
{
  return sub_250C0AEA8();
}

uint64_t sub_250C01FC4()
{
  return sub_250C0B07C();
}

uint64_t sub_250C01FCC()
{
  return sub_250C0B174();
}

uint64_t sub_250C01FD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_250C06054();
  *a1 = result;
  return result;
}

unint64_t sub_250C02004@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_250C01E28(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_250C02030()
{
  return sub_250C01EEC(*v0);
}

uint64_t sub_250C02038@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_250C06054();
  *a1 = result;
  return result;
}

void sub_250C02060(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_250C0206C(uint64_t a1)
{
  unint64_t v2 = sub_250C06F7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250C020A8(uint64_t a1)
{
  unint64_t v2 = sub_250C06F7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250C020E4(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9908);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250C06F7C();
  sub_250C1DDE8();
  v8[15] = 0;
  sub_250C1DC98();
  if (!v1)
  {
    v8[14] = 1;
    sub_250C1DC98();
    v8[13] = 2;
    sub_250C1DCA8();
    v8[12] = 3;
    sub_250C1DCA8();
    v8[11] = 4;
    sub_250C1DCA8();
    v8[10] = 5;
    sub_250C1DC98();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_250C022E4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_250C060A0(a1, v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_250C02328(void *a1)
{
  return sub_250C020E4(a1);
}

unint64_t sub_250C02344()
{
  uint64_t v1 = *v0;
  sub_250C04858((uint64_t)v0);
  uint64_t v2 = sub_250C019D0(v1);
  sub_250C04884((uint64_t)v0);
  sub_250C1DB08();
  swift_bridgeObjectRelease();
  MEMORY[0x253384630](v2, MEMORY[0x263F8D310]);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD00000000000001ALL;
}

uint64_t sub_250C02400@<X0>(void *a1@<X8>)
{
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();
  sub_250C01C1C();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  uint64_t result = sub_250C1D768();
  *a1 = 0;
  a1[1] = v3;
  return result;
}

unint64_t sub_250C024C4()
{
  return sub_250C02344();
}

uint64_t sub_250C02508(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  uint64_t v7 = sub_250C1D2F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) = 0;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionList) = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(v3 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool) = sub_250C02BA4(MEMORY[0x263F8EE78]);
  unint64_t v9 = sub_250C0A8D8(v8);
  sub_250C05B24(0, v72);
  uint64_t v10 = v73;
  uint64_t v11 = v74;
  *(void *)(v3 + 16) = v9;
  uint64_t v12 = (void *)(v3 + 16);
  long long v13 = v72[1];
  *(_OWORD *)(v3 + 24) = v72[0];
  *(_OWORD *)(v3 + 40) = v13;
  *(void *)(v3 + 56) = v10;
  *(void *)(v3 + 64) = v11;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v66 = a2;
  uint64_t v67 = v3;
  if (!v14)
  {
    swift_bridgeObjectRelease();
    if (!a2) {
      goto LABEL_36;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = 0;
  uint64_t v3 = 48;
  do
  {
    uint64_t v18 = *(unsigned __int8 *)(a1 + v15 + 32);
    sub_250C05B24(*(unsigned char *)(a1 + v15 + 32), &v75);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = (void *)*v12;
    id v69 = (void *)*v12;
    void *v12 = 0x8000000000000000;
    unint64_t v22 = sub_250C1B034(v18);
    uint64_t v23 = v20[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    char v26 = v21;
    if (v20[3] >= v25)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v29 = v69;
        if (v21) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_250C12F14();
        uint64_t v29 = v69;
        if (v26) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_250C11874(v25, isUniquelyReferenced_nonNull_native);
      uint64_t v27 = sub_250C1B034(v18);
      if ((v26 & 1) != (v28 & 1))
      {
LABEL_46:
        uint64_t result = sub_250C1DD18();
        __break(1u);
        return result;
      }
      unint64_t v22 = v27;
      uint64_t v29 = v69;
      if (v26)
      {
LABEL_3:
        uint64_t v16 = (_OWORD *)(v29[7] + 48 * v22);
        long long v17 = v76;
        *uint64_t v16 = v75;
        v16[1] = v17;
        float64x2_t v16[2] = v77;
        goto LABEL_4;
      }
    }
    v29[(v22 >> 6) + 8] |= 1 << v22;
    *(unsigned char *)(v29[6] + v22) = v18;
    uint64_t v30 = (_OWORD *)(v29[7] + 48 * v22);
    long long v31 = v76;
    *uint64_t v30 = v75;
    v30[1] = v31;
    void v30[2] = v77;
    uint64_t v32 = v29[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_43;
    }
    v29[2] = v34;
LABEL_4:
    ++v15;
    void *v12 = v29;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  while (v14 != v15);
  swift_bridgeObjectRelease_n();
  a2 = v66;
  uint64_t v3 = v67;
  if (v66)
  {
LABEL_19:
    uint64_t v35 = *(void *)(a2 + 16);
    if (!v35)
    {
LABEL_35:
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v3 = a2 + 80;
    while (1)
    {
      uint64_t v68 = v35;
      uint64_t v37 = *(unsigned __int8 *)(v3 - 48);
      uint64_t v39 = *(void *)(v3 - 40);
      uint64_t v38 = *(void *)(v3 - 32);
      uint64_t v40 = *(void *)(v3 - 24);
      uint64_t v41 = *(void *)(v3 - 16);
      uint64_t v42 = *(void *)(v3 - 8);
      uint64_t v43 = *(void *)v3;
      char v44 = swift_isUniquelyReferenced_nonNull_native();
      char v45 = (void *)*v12;
      uint64_t v70 = (void *)*v12;
      void *v12 = 0x8000000000000000;
      unint64_t v47 = sub_250C1B034(v37);
      uint64_t v48 = v45[2];
      BOOL v49 = (v46 & 1) == 0;
      uint64_t v50 = v48 + v49;
      if (__OFADD__(v48, v49)) {
        goto LABEL_42;
      }
      char v51 = v46;
      if (v45[3] >= v50)
      {
        if (v44)
        {
          id v54 = v70;
          if ((v46 & 1) == 0) {
            goto LABEL_30;
          }
        }
        else
        {
          sub_250C12F14();
          id v54 = v70;
          if ((v51 & 1) == 0) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        sub_250C11874(v50, v44);
        uint64_t v52 = sub_250C1B034(v37);
        if ((v51 & 1) != (v53 & 1)) {
          goto LABEL_46;
        }
        unint64_t v47 = v52;
        id v54 = v70;
        if ((v51 & 1) == 0)
        {
LABEL_30:
          v54[(v47 >> 6) + 8] |= 1 << v47;
          *(unsigned char *)(v54[6] + v47) = v37;
          uint64_t v55 = (void *)(v54[7] + 48 * v47);
          *uint64_t v55 = v39;
          v55[1] = v38;
          v55[2] = v40;
          v55[3] = v41;
          v55[4] = v42;
          v55[5] = v43;
          uint64_t v56 = v54[2];
          BOOL v33 = __OFADD__(v56, 1);
          uint64_t v57 = v56 + 1;
          if (v33) {
            goto LABEL_44;
          }
          v54[2] = v57;
          goto LABEL_22;
        }
      }
      double v36 = (void *)(v54[7] + 48 * v47);
      void *v36 = v39;
      v36[1] = v38;
      v36[2] = v40;
      v36[3] = v41;
      v36[4] = v42;
      v36[5] = v43;
LABEL_22:
      v3 += 56;
      void *v12 = v54;
      swift_bridgeObjectRelease();
      uint64_t v35 = v68 - 1;
      if (v68 == 1)
      {
        swift_endAccess();
        swift_bridgeObjectRelease();
        uint64_t v3 = v67;
        goto LABEL_35;
      }
    }
  }
LABEL_36:
  if (qword_269AF8F80 != -1) {
LABEL_45:
  }
    swift_once();
  uint64_t v58 = sub_250C1D3A8();
  __swift_project_value_buffer(v58, (uint64_t)qword_269AFCA38);
  swift_retain_n();
  uint64_t v59 = sub_250C1D388();
  os_log_type_t v60 = sub_250C1D938();
  if (os_log_type_enabled(v59, v60))
  {
    unint64_t v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    uint64_t v71 = v62;
    *(_DWORD *)unint64_t v61 = 136315138;
    swift_beginAccess();
    uint64_t v63 = swift_bridgeObjectRetain();
    uint64_t v64 = sub_250C019D0(v63);
    sub_250C1DB08();
    swift_bridgeObjectRelease();
    MEMORY[0x253384630](v64, MEMORY[0x263F8D310]);
    sub_250C1D768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_250BE1D68(0xD00000000000001ALL, 0x8000000250C23840, &v71);
    uint64_t v3 = v67;
    sub_250C1DA48();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v59, v60, "%s", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v62, -1, -1);
    MEMORY[0x2533853C0](v61, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  return v3;
}

uint64_t sub_250C02BA4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_250C04A44(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = a1 + 40;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98E8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98D8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_250C04A44(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v11;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_250C04A44(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v11;
      }
      *(void *)(v2 + 16) = v6 + 1;
      uint64_t v7 = v2 + 16 * v6;
      *(unsigned char *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      v4 += 16;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_250C02CEC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(*a1 + 16);
  unint64_t v5 = (void *)sub_250C1D6A8();
  id v6 = objc_msgSend(v4, sel_featureValueForName_, v5);

  if (!v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v7 = objc_msgSend(v6, sel_stringValue);

  uint64_t v8 = sub_250C1D6D8();
  uint64_t v10 = v9;

  uint64_t v11 = *(void **)(v3 + 16);
  uint64_t v12 = (void *)sub_250C1D6A8();
  id v13 = objc_msgSend(v11, sel_featureValueForName_, v12);

  if (!v13)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v14 = objc_msgSend(v13, sel_dictionaryValue);

  sub_250C0092C();
  uint64_t v15 = sub_250C1D648();

  uint64_t v16 = sub_250C1A50C(v15);
  swift_bridgeObjectRelease();
  if (!*(void *)(v16 + 16))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v17 = sub_250C1AFBC(v8, v10);
  if ((v18 & 1) == 0)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  double v19 = *(double *)(*(void *)(v16 + 56) + 8 * v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(v3 + 16);
  char v21 = (void *)sub_250C1D6A8();
  id v22 = objc_msgSend(v20, sel_featureValueForName_, v21);

  if (v22)
  {
    id v23 = objc_msgSend(v22, sel_dictionaryValue);

    uint64_t v24 = sub_250C1D648();
    sub_250C1A50C(v24);
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_250C06544(v8, v10, v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v25;
    return;
  }
LABEL_11:
  __break(1u);
}

BOOL sub_250C02F8C(id *a1)
{
  return objc_msgSend(*a1, sel_headGesture) != 0;
}

uint64_t sub_250C02FB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D2F8();
  uint64_t v98 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D348();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v85 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_250C1D3A8();
  uint64_t v99 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  char v94 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v95 = (char *)&v85 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v92 = (uint64_t)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v89 = (char **)((char *)&v85 - v16);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  unint64_t v93 = (char **)((char *)&v85 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v85 - v19;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v8, (uint64_t)qword_269AFCA38);
  swift_retain_n();
  uint64_t v96 = v21;
  id v22 = sub_250C1D388();
  os_log_type_t v23 = sub_250C1D938();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v97 = v8;
  uint64_t v91 = v2;
  uint64_t v88 = v4;
  uint64_t v87 = v5;
  uint64_t v86 = v6;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v90 = swift_slowAlloc();
    v102[0] = v90;
    *(_DWORD *)uint64_t v25 = 134218242;
    char v26 = (uint64_t *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
    swift_beginAccess();
    uint64_t v100 = *(void *)(*v26 + 16);
    sub_250C1DA48();
    *(_WORD *)(v25 + 12) = 2080;
    uint64_t v27 = *v26;
    swift_bridgeObjectRetain();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98D8);
    uint64_t v29 = MEMORY[0x253384630](v27, v28);
    uint64_t v30 = v1;
    unint64_t v32 = v31;
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_250BE1D68(v29, v32, v102);
    uint64_t v33 = v99;
    sub_250C1DA48();
    swift_release_n();
    uint64_t v1 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v22, v23, "[AG]Closing gate and aggregating %ld predictions:\n\t%s", (uint8_t *)v25, 0x16u);
    uint64_t v34 = v90;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v34, -1, -1);
    uint64_t v35 = v25;
    uint64_t v2 = v91;
    uint64_t v8 = v97;
    MEMORY[0x2533853C0](v35, -1, -1);
  }
  else
  {

    swift_release_n();
    uint64_t v33 = v99;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) = 0;
  sub_250C1D2E8();
  uint64_t v36 = v98;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v20, 0, 1, v2);
  uint64_t v37 = (void (*)(void, void, void))v93;
  sub_250BDDBA8((uint64_t)v20, (uint64_t)v93);
  uint64_t v38 = v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  swift_beginAccess();
  sub_250BDDC10((uint64_t)v37, v38);
  swift_endAccess();
  uint64_t v39 = *(char ***)(v33 + 16);
  uint64_t v40 = v95;
  uint64_t v90 = v33 + 16;
  unint64_t v93 = v39;
  ((void (*)(char *, uint64_t, uint64_t))v39)(v95, v96, v8);
  swift_retain();
  uint64_t v41 = sub_250C1D388();
  uint64_t v42 = v2;
  os_log_type_t v43 = sub_250C1D938();
  if (os_log_type_enabled(v41, v43))
  {
    uint64_t v44 = v1;
    char v45 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v45 = 134217984;
    char v46 = (void (*)(void, void))v89;
    sub_250BDDB40(v38, (uint64_t)v89);
    if ((*(unsigned int (**)(void (*)(void, void), uint64_t, uint64_t))(v36 + 48))(v46, 1, v42) == 1)
    {
LABEL_26:
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    sub_250C1D2A8();
    uint64_t v48 = v47;
    (*(void (**)(void, uint64_t))(v36 + 8))(v46, v42);
    v102[0] = v48;
    sub_250C1DA48();
    swift_release();
    _os_log_impl(&dword_250BD9000, v41, v43, "[AG]Closing gate at time: %f", v45, 0xCu);
    BOOL v49 = v45;
    uint64_t v1 = v44;
    MEMORY[0x2533853C0](v49, -1, -1);

    uint64_t v40 = v95;
  }
  else
  {

    swift_release();
  }
  uint64_t v50 = v97;
  uint64_t v95 = *(char **)(v33 + 8);
  uint64_t v51 = v33 + 8;
  ((void (*)(char *, uint64_t))v95)(v40, v97);
  id v52 = objc_msgSend(objc_allocWithZone((Class)HGHeadGestureResult), sel_init);
  uint64_t v53 = v92;
  sub_250BDDB40(v38, v92);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v53, 1, v42) == 1)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v54 = v53;
  uint64_t v55 = (void *)sub_250C1D268();
  uint64_t v56 = v36 + 8;
  uint64_t v57 = *(char ***)(v36 + 8);
  ((void (*)(uint64_t, uint64_t))v57)(v54, v42);
  objc_msgSend(v52, sel_setTimestamp_, v55);

  char v58 = sub_250C041C4();
  uint64_t v98 = v56;
  uint64_t v99 = v51;
  if (v58)
  {
    uint64_t v59 = v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
    swift_beginAccess();
    uint64_t v60 = *(void *)(*(void *)v59 + 16);
    if (!v60)
    {
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      goto LABEL_18;
    }
    uint64_t v61 = *(unsigned __int8 *)(*(void *)v59 + 16 * v60 + 16);
    goto LABEL_16;
  }
  uint64_t v61 = sub_250C03B78();
  if (v61 != 5)
  {
LABEL_16:
    uint64_t v62 = v61;
    goto LABEL_18;
  }
  uint64_t v61 = 0;
  uint64_t v62 = 0;
LABEL_18:
  objc_msgSend(v52, sel_setHeadGesture_, v62);
  sub_250C0092C();
  sub_250C04288(v61);
  uint64_t v63 = (void *)sub_250C1D9F8();
  objc_msgSend(v52, sel_setAvgConfidence_, v63);

  uint64_t v64 = v94;
  ((void (*)(char *, uint64_t, uint64_t))v93)(v94, v96, v50);
  id v65 = v52;
  uint64_t v66 = sub_250C1D388();
  os_log_type_t v67 = sub_250C1D938();
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v96 = v1;
    uint64_t v68 = swift_slowAlloc();
    unint64_t v93 = (char **)swift_slowAlloc();
    v102[0] = (uint64_t)v93;
    *(_DWORD *)uint64_t v68 = 136315650;
    unint64_t v69 = (unint64_t)objc_msgSend(v65, sel_headGesture);
    uint64_t v92 = v61;
    uint64_t v89 = v57;
    if (v69 > 2)
    {
      unint64_t v72 = 0xE700000000000000;
      uint64_t v71 = 0x6E776F6E6B6E55;
    }
    else
    {
      uint64_t v70 = 8 * v69;
      uint64_t v71 = *(void *)&aBackgrounod_6[8 * v69];
      unint64_t v72 = *(void *)&aNd_7[v70];
    }
    uint64_t v101 = sub_250BE1D68(v71, v72, v102);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 12) = 2080;
    id v73 = objc_msgSend(v65, sel_uuid);
    uint64_t v74 = v85;
    sub_250C1D328();

    sub_250BF99BC();
    uint64_t v61 = v87;
    uint64_t v75 = sub_250C1DCE8();
    unint64_t v77 = v76;
    (*(void (**)(char *, uint64_t))(v86 + 8))(v74, v61);
    uint64_t v101 = sub_250BE1D68(v75, v77, v102);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v68 + 22) = 2048;
    id v78 = objc_msgSend(v65, sel_timestamp);
    uint64_t v79 = v88;
    sub_250C1D2B8();

    sub_250C1D2A8();
    uint64_t v81 = v80;
    ((void (*)(char *, uint64_t))v89)(v79, v91);
    uint64_t v101 = v81;
    sub_250C1DA48();

    _os_log_impl(&dword_250BD9000, v66, v67, "[AG] ML final prediction: %s, %s, at %f", (uint8_t *)v68, 0x20u);
    uint64_t v82 = (void (*)(void, void, void))v93;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v82, -1, -1);
    MEMORY[0x2533853C0](v68, -1, -1);

    ((void (*)(char *, uint64_t))v95)(v94, v97);
    uint64_t v1 = v96;
    LOBYTE(v61) = v92;
  }
  else
  {

    ((void (*)(char *, uint64_t))v95)(v64, v50);
  }
  uint64_t v83 = (void *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  void *v83 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed) = v61;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = 0;
  return (uint64_t)v65;
}

uint64_t sub_250C03B78()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (!v3) {
    return 5;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)(v2 + 40);
  uint64_t v5 = MEMORY[0x263F8EE78];
  uint64_t v6 = MEMORY[0x263F8EE78];
  do
  {
    char v10 = *((unsigned char *)v4 - 8);
    if (v10)
    {
      uint64_t v11 = *v4;
      uint64_t v35 = v6;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_250C04A44(0, *(void *)(v6 + 16) + 1, 1);
        uint64_t v6 = v35;
      }
      unint64_t v8 = *(void *)(v6 + 16);
      unint64_t v7 = *(void *)(v6 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_250C04A44(v7 > 1, v8 + 1, 1);
        uint64_t v6 = v35;
      }
      *(void *)(v6 + 16) = v8 + 1;
      uint64_t v9 = v6 + 16 * v8;
      *(unsigned char *)(v9 + 32) = v10;
      *(void *)(v9 + 40) = v11;
    }
    v4 += 2;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  int64_t v12 = *(void *)(v6 + 16);
  if (v12)
  {
    uint64_t v35 = v5;
    sub_250C04B24(0, v12, 0);
    uint64_t v13 = v5;
    unint64_t v14 = *(void *)(v5 + 16);
    uint64_t v15 = 32;
    do
    {
      char v16 = *(unsigned char *)(v6 + v15);
      uint64_t v35 = v13;
      unint64_t v17 = *(void *)(v13 + 24);
      if (v14 >= v17 >> 1)
      {
        sub_250C04B24(v17 > 1, v14 + 1, 1);
        uint64_t v13 = v35;
      }
      *(void *)(v13 + 16) = v14 + 1;
      *(unsigned char *)(v13 + v14 + 32) = v16;
      v15 += 16;
      ++v14;
      --v12;
    }
    while (v12);
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  int64_t v19 = *(void *)(v13 + 16);
  uint64_t v20 = *(void *)(*v1 + 16);
  if (v19)
  {
    uint64_t v34 = *(void *)(*v1 + 16);
    uint64_t v35 = v5;
    sub_250C04B04(0, v19, 0);
    uint64_t v21 = 0;
    uint64_t v22 = v35;
    uint64_t v23 = *(void *)(v35 + 16);
    uint64_t v24 = 16 * v23;
    do
    {
      char v25 = *(unsigned char *)(v13 + v21 + 32);
      uint64_t v35 = v22;
      unint64_t v26 = *(void *)(v22 + 24);
      uint64_t v27 = v23 + v21 + 1;
      if (v23 + v21 >= v26 >> 1)
      {
        sub_250C04B04(v26 > 1, v23 + v21 + 1, 1);
        uint64_t v22 = v35;
      }
      ++v21;
      *(void *)(v22 + 16) = v27;
      uint64_t v28 = v22 + v24;
      *(unsigned char *)(v28 + 32) = v25;
      *(void *)(v28 + 40) = 1;
      v24 += 16;
    }
    while (v19 != v21);
    swift_bridgeObjectRelease();
    uint64_t v20 = v34;
    if (*(void *)(v22 + 16)) {
      goto LABEL_24;
    }
LABEL_26:
    uint64_t v29 = MEMORY[0x263F8EE80];
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
  uint64_t v22 = MEMORY[0x263F8EE78];
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_26;
  }
LABEL_24:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98C0);
  uint64_t v29 = sub_250C1DBC8();
LABEL_27:
  uint64_t v35 = v29;
  sub_250C06308(v22, 1, &v35);
  swift_bridgeObjectRelease();
  unsigned int v30 = sub_250C03EA8(v35);
  uint64_t v32 = v31;
  swift_release();
  if (v32 >= v20 - v19) {
    unsigned int v33 = v30;
  }
  else {
    unsigned int v33 = 0;
  }
  if (v30 == 5) {
    return 0;
  }
  else {
    return v33;
  }
}

uint64_t sub_250C03EA8(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = 1 << v2;
  uint64_t v4 = -1;
  if (1 << v2 < 64) {
    uint64_t v4 = ~(-1 << (1 << v2));
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  if (!v5)
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 > 6)
    {
      int64_t v9 = (unint64_t)(v3 + 63) >> 6;
      unint64_t v22 = *(void *)(a1 + 72);
      if (v22)
      {
        uint64_t v6 = 1;
LABEL_32:
        unint64_t v8 = (v22 - 1) & v22;
        unint64_t v7 = __clz(__rbit64(v22)) + (v6 << 6);
        goto LABEL_5;
      }
      if (v6 >= 8)
      {
        unint64_t v22 = *(void *)(a1 + 80);
        if (v22)
        {
          uint64_t v6 = 2;
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(a1 + 88);
        if (v22)
        {
          uint64_t v6 = 3;
          goto LABEL_32;
        }
LABEL_39:
        if (v6 >= 9)
        {
          unint64_t v22 = *(void *)(a1 + 96);
          if (v22)
          {
            uint64_t v6 = 4;
          }
          else
          {
            unint64_t v22 = *(void *)(a1 + 104);
            if (!v22) {
              goto LABEL_46;
            }
            uint64_t v6 = 5;
          }
          goto LABEL_32;
        }
      }
    }
    return 5;
  }
  uint64_t v6 = 0;
  unint64_t v7 = __clz(__rbit64(v5));
  unint64_t v8 = (v5 - 1) & v5;
  int64_t v9 = (unint64_t)(v3 + 63) >> 6;
LABEL_5:
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unsigned __int8 v12 = *(unsigned char *)(v10 + v7);
  uint64_t v13 = *(void *)(v11 + 8 * v7);
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v6 << 6);
      goto LABEL_7;
    }
    int64_t v18 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v18 >= v9) {
      return v12;
    }
    unint64_t v19 = *(void *)(v1 + 8 * v18);
    ++v6;
    if (!v19)
    {
      uint64_t v6 = v18 + 1;
      if (v18 + 1 >= v9) {
        return v12;
      }
      unint64_t v19 = *(void *)(v1 + 8 * v6);
      if (!v19)
      {
        uint64_t v6 = v18 + 2;
        if (v18 + 2 >= v9) {
          return v12;
        }
        unint64_t v19 = *(void *)(v1 + 8 * v6);
        if (!v19)
        {
          uint64_t v6 = v18 + 3;
          if (v18 + 3 >= v9) {
            return v12;
          }
          unint64_t v19 = *(void *)(v1 + 8 * v6);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v8 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v6 << 6);
LABEL_7:
    unsigned __int8 v16 = *(unsigned char *)(v10 + v15);
    uint64_t v17 = *(void *)(v11 + 8 * v15);
    if (v13 < v17) {
      unsigned __int8 v12 = v16;
    }
    if (v13 <= v17) {
      uint64_t v13 = v17;
    }
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v9) {
    return v12;
  }
  unint64_t v19 = *(void *)(v1 + 8 * v20);
  if (v19)
  {
    uint64_t v6 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    uint64_t v6 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v6 >= v9) {
      return v12;
    }
    unint64_t v19 = *(void *)(v1 + 8 * v6);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_46:
  uint64_t v23 = 0;
  uint64_t v24 = 6;
  if (v9 > 6) {
    uint64_t v24 = v9;
  }
  while (v24 - 6 != v23)
  {
    unint64_t v22 = *(void *)(a1 + 112 + 8 * v23++);
    if (v22)
    {
      uint64_t v6 = v23 + 5;
      goto LABEL_32;
    }
  }
  return 5;
}

uint64_t sub_250C040C8(unsigned __int8 a1, unint64_t a2)
{
  unint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *v5;
  unint64_t v8 = *(void *)(*v5 + 16);
  if ((uint64_t)v8 < (uint64_t)a2) {
    return 0;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_25;
  }
  if (v8 >= a2) {
    unint64_t v9 = v8 - a2;
  }
  else {
    unint64_t v9 = 0;
  }
  if (v9 != v8)
  {
    if (v9 >= v8)
    {
LABEL_26:
      __break(1u);
      return result;
    }
    if (*(unsigned __int8 *)(v7 + 32 + 16 * v9) != a1) {
      return 0;
    }
    if (v9 + 1 == v8) {
      return 1;
    }
    if (v8 >= a2) {
      unint64_t v10 = a2;
    }
    else {
      unint64_t v10 = *(void *)(*v5 + 16);
    }
    uint64_t v11 = -(uint64_t)v10;
    unsigned __int8 v12 = (unsigned __int8 *)(v7 - 16 * v10 + 16 * v8 + 48);
    while (v8 + 1 + v11 < v8)
    {
      int v13 = *v12;
      v12 += 16;
      uint64_t result = v13 == a1;
      if (v13 != a1 || v11++ == -2) {
        return result;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  return 1;
}

uint64_t sub_250C041C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (v3 && (uint64_t v4 = *(void *)v2 + 16 * v3, v5 = *(unsigned __int8 *)(v4 + 16), *(unsigned char *)(v4 + 16)))
  {
    swift_beginAccess();
    uint64_t v6 = *(void *)(v1 + 16);
    unint64_t v7 = *(void *)(v1 + 56);
    if (*(void *)(v6 + 16))
    {
      uint64_t v8 = sub_250C1B034(v5);
      if (v9) {
        unint64_t v7 = *(void *)(*(void *)(v6 + 56) + 48 * v8 + 32);
      }
    }
    char v10 = sub_250C040C8(v5, v7);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_250C04288(unsigned __int8 a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = *(void *)(*v3 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (v5)
  {
    int v7 = a1;
    swift_bridgeObjectRetain();
    uint64_t v8 = (uint64_t *)(v4 + 40);
    uint64_t v9 = MEMORY[0x263F8EE78];
    do
    {
      if (*((unsigned __int8 *)v8 - 8) == v7)
      {
        uint64_t v13 = *v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_250C04A44(0, *(void *)(v9 + 16) + 1, 1);
        }
        unint64_t v11 = *(void *)(v9 + 16);
        unint64_t v10 = *(void *)(v9 + 24);
        if (v11 >= v10 >> 1) {
          sub_250C04A44(v10 > 1, v11 + 1, 1);
        }
        *(void *)(v9 + 16) = v11 + 1;
        uint64_t v12 = v9 + 16 * v11;
        *(unsigned char *)(v12 + 32) = v7;
        *(void *)(v12 + 40) = v13;
      }
      v8 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    int64_t v14 = *(void *)(v9 + 16);
    if (v14)
    {
LABEL_11:
      sub_250C04A64(0, v14, 0);
      uint64_t v15 = v6;
      unint64_t v16 = *(void *)(v6 + 16);
      uint64_t v17 = 40;
      do
      {
        uint64_t v18 = *(void *)(v9 + v17);
        unint64_t v19 = *(void *)(v15 + 24);
        if (v16 >= v19 >> 1) {
          sub_250C04A64(v19 > 1, v16 + 1, 1);
        }
        *(void *)(v15 + 16) = v16 + 1;
        *(void *)(v15 + 8 * v16 + 32) = v18;
        v17 += 16;
        ++v16;
        --v14;
      }
      while (v14);
      swift_release();
      uint64_t v20 = *(void *)(v15 + 16);
      if (!v20) {
        return swift_bridgeObjectRelease();
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    int64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v14) {
      goto LABEL_11;
    }
  }
  swift_release();
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v20 = *(void *)(MEMORY[0x263F8EE78] + 16);
  if (!v20) {
    return swift_bridgeObjectRelease();
  }
LABEL_16:
  if (v20 == 1)
  {
    uint64_t v21 = 0;
    double v22 = 0.0;
LABEL_24:
    uint64_t v25 = v20 - v21;
    unint64_t v26 = (double *)(v15 + 8 * v21 + 32);
    do
    {
      double v27 = *v26++;
      double v22 = v22 + v27;
      --v25;
    }
    while (v25);
    return swift_bridgeObjectRelease();
  }
  uint64_t v21 = v20 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v23 = (double *)(v15 + 40);
  double v22 = 0.0;
  uint64_t v24 = v20 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v22 = v22 + *(v23 - 1) + *v23;
    v23 += 2;
    v24 -= 2;
  }
  while (v24);
  if (v20 != v21) {
    goto LABEL_24;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_250C044F4()
{
  swift_bridgeObjectRelease();
  sub_250BDDC78(v0 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_250C04580()
{
  return type metadata accessor for HGPredictionAggregator();
}

uint64_t type metadata accessor for HGPredictionAggregator()
{
  uint64_t result = qword_269AF98A0;
  if (!qword_269AF98A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_250C045D4()
{
  sub_250BDC0AC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t destroy for HGPredictionAggregator.HGPredictionAggregatorParameters()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HGPredictionAggregator.HGPredictionAggregatorParameters(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t assignWithTake for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HGPredictionAggregator.HGPredictionAggregatorParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGPredictionAggregator.HGPredictionAggregatorParameters()
{
  return &type metadata for HGPredictionAggregator.HGPredictionAggregatorParameters;
}

uint64_t sub_250C04858(uint64_t a1)
{
  return a1;
}

uint64_t sub_250C04884(uint64_t a1)
{
  return a1;
}

void *sub_250C048B0(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_250C1DBD8();
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

uint64_t sub_250C04954(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_250C0497C(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_250C1DA48();
  *a1 = v5;
  return result;
}

uint64_t sub_250C049D4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_250C04A04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C04B44(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04A24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C04C94(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04A44(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C04E00(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04A64(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C04F60(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04A84(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C050C0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04AA4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C05220(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04AC4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C05380(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04AE4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C054E0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04B04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C057E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04B24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_250C05948(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_250C04B44(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98F0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C04C94(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9500);
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C04E00(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9698);
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C04F60(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9630);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
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
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C050C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9650);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C05220(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9648);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    memcpy(v13, v14, 32 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C05380(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98E0);
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C054E0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9640);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
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
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C05640(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98B0);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    id v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98B8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C057E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98C8);
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C05948(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98D0);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C05A9C(uint64_t a1)
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
  int64_t v9 = (unint64_t *)(a1 + 80);
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

void sub_250C05B24(char a1@<W0>, void *a2@<X8>)
{
  if (a1 == 2)
  {
    if (qword_269AF8F78 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    if (qword_269AF8F78 == -1) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (qword_269AF8F78 != -1) {
LABEL_9:
  }
    swift_once();
LABEL_8:
  uint64_t v3 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v4 = (void *)sub_250C1D6A8();
  objc_msgSend(v3, sel_doubleForKey_, v4);
  uint64_t v6 = v5;

  unint64_t v7 = *(void **)(qword_269AFCA30 + 16);
  unint64_t v8 = (void *)sub_250C1D6A8();
  objc_msgSend(v7, sel_doubleForKey_, v8);
  uint64_t v10 = v9;

  size_t v11 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v12 = (void *)sub_250C1D6A8();
  id v13 = objc_msgSend(v11, sel_integerForKey_, v12);

  int64_t v14 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v15 = (void *)sub_250C1D6A8();
  id v16 = objc_msgSend(v14, sel_integerForKey_, v15);

  uint64_t v17 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v18 = (void *)sub_250C1D6A8();
  id v19 = objc_msgSend(v17, sel_integerForKey_, v18);

  uint64_t v20 = *(void **)(qword_269AFCA30 + 16);
  uint64_t v21 = (void *)sub_250C1D6A8();
  objc_msgSend(v20, sel_doubleForKey_, v21);
  uint64_t v23 = v22;

  *a2 = v6;
  a2[1] = v10;
  a2[2] = v13;
  a2[3] = v16;
  a2[4] = v19;
  a2[5] = v23;
}

uint64_t sub_250C06054()
{
  unint64_t v0 = sub_250C1DC08();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_250C060A0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250C06F7C();
  sub_250C1DDD8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v24 = 0;
  sub_250C1DC38();
  uint64_t v10 = v9;
  char v23 = 1;
  sub_250C1DC38();
  uint64_t v12 = v11;
  char v22 = 2;
  uint64_t v13 = sub_250C1DC48();
  char v21 = 3;
  uint64_t v14 = sub_250C1DC48();
  char v20 = 4;
  uint64_t v18 = sub_250C1DC48();
  char v19 = 5;
  sub_250C1DC38();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  a2[3] = v14;
  a2[4] = v18;
  a2[5] = v16;
  return result;
}

uint64_t sub_250C06308(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(unsigned __int8 *)(result + 32);
    uint64_t v8 = *(void *)(result + 40);
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_250C1B034(v7);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (!__OFADD__(v12, v13))
    {
      char v15 = v10;
      if (v9[3] >= v14)
      {
        if (a2)
        {
          uint64_t v18 = (void *)*a3;
          if ((v10 & 1) == 0) {
            goto LABEL_13;
          }
        }
        else
        {
          sub_250C135CC();
          uint64_t v18 = (void *)*a3;
          if ((v15 & 1) == 0) {
            goto LABEL_13;
          }
        }
      }
      else
      {
        sub_250C128E8(v14, a2 & 1);
        uint64_t v16 = sub_250C1B034(v7);
        if ((v15 & 1) != (v17 & 1))
        {
LABEL_29:
          uint64_t result = sub_250C1DD18();
          __break(1u);
          return result;
        }
        unint64_t v11 = v16;
        uint64_t v18 = (void *)*a3;
        if ((v15 & 1) == 0)
        {
LABEL_13:
          v18[(v11 >> 6) + 8] |= 1 << v11;
          *(unsigned char *)(v18[6] + v11) = v7;
          *(void *)(v18[7] + 8 * v11) = v8;
          uint64_t v21 = v18[2];
          char v19 = v18 + 2;
          uint64_t v20 = v21 + 1;
          if (__OFADD__(v21, 1))
          {
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
          goto LABEL_14;
        }
      }
      char v19 = (void *)(v18[7] + 8 * v11);
      uint64_t v20 = *v19 + v8;
      if (!__OFADD__(*v19, v8))
      {
LABEL_14:
        void *v19 = v20;
        uint64_t v22 = v3 - 1;
        if (v3 == 1) {
          return swift_bridgeObjectRelease();
        }
        for (uint64_t i = (uint64_t *)(v6 + 56); ; i += 2)
        {
          uint64_t v27 = *((unsigned __int8 *)i - 8);
          uint64_t v28 = *i;
          uint64_t v29 = (void *)*a3;
          unint64_t v30 = sub_250C1B034(v27);
          uint64_t v32 = v29[2];
          BOOL v33 = (v31 & 1) == 0;
          BOOL v34 = __OFADD__(v32, v33);
          uint64_t v35 = v32 + v33;
          if (v34) {
            break;
          }
          char v36 = v31;
          if (v29[3] < v35)
          {
            sub_250C128E8(v35, 1);
            unint64_t v30 = sub_250C1B034(v27);
            if ((v36 & 1) != (v37 & 1)) {
              goto LABEL_29;
            }
          }
          uint64_t v38 = (void *)*a3;
          if (v36)
          {
            char v24 = (void *)(v38[7] + 8 * v30);
            uint64_t v26 = *v24 + v28;
            if (__OFADD__(*v24, v28)) {
              goto LABEL_26;
            }
          }
          else
          {
            v38[(v30 >> 6) + 8] |= 1 << v30;
            *(unsigned char *)(v38[6] + v30) = v27;
            *(void *)(v38[7] + 8 * v30) = v28;
            uint64_t v25 = v38[2];
            char v24 = v38 + 2;
            uint64_t v26 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_28;
            }
          }
          *char v24 = v26;
          if (!--v22) {
            return swift_bridgeObjectRelease();
          }
        }
        goto LABEL_27;
      }
LABEL_26:
      __break(1u);
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_250C06544(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v75 = sub_250C1D3A8();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90B8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250C1D2F8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  char v17 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  char v19 = (char *)&v73 - v18;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_250C00740(a1, a2);
  unsigned __int8 v79 = v20;
  uint64_t v21 = OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen;
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_isGateOpen) == 1)
  {
    uint64_t v22 = v20;
    swift_beginAccess();
    uint64_t v23 = *(void *)(v4 + 16);
    double v24 = *(double *)(v4 + 32);
    if (*(void *)(v23 + 16))
    {
      uint64_t v25 = sub_250C1B034(v22);
      uint64_t v26 = v75;
      if (v27) {
        double v24 = *(double *)(*(void *)(v23 + 56) + 48 * v25 + 8);
      }
      if (v24 <= a3) {
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v26 = v75;
      if (v24 <= a3)
      {
LABEL_31:
        uint64_t v48 = v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_predictionsInPool;
        swift_beginAccess();
        BOOL v49 = *(void **)v48;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)uint64_t v48 = v49;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          BOOL v49 = sub_250BF1A6C(0, v49[2] + 1, 1, v49);
          *(void *)uint64_t v48 = v49;
        }
        unint64_t v52 = v49[2];
        unint64_t v51 = v49[3];
        if (v52 >= v51 >> 1)
        {
          BOOL v49 = sub_250BF1A6C((void *)(v51 > 1), v52 + 1, 1, v49);
          *(void *)uint64_t v48 = v49;
        }
        v49[2] = v52 + 1;
        uint64_t v53 = &v49[2 * v52];
        *((unsigned char *)v53 + 32) = v22;
        *((double *)v53 + 5) = a3;
        swift_endAccess();
        if (sub_250C041C4())
        {
          if (qword_269AF8F80 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v26, (uint64_t)qword_269AFCA38);
          uint64_t v54 = sub_250C1D388();
          os_log_type_t v55 = sub_250C1D938();
          if (!os_log_type_enabled(v54, v55)) {
            goto LABEL_49;
          }
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v56 = 0;
          uint64_t v57 = "[AG]Closing gate since recent predictions are consistent";
LABEL_48:
          _os_log_impl(&dword_250BD9000, v54, v55, v57, v56, 2u);
          MEMORY[0x2533853C0](v56, -1, -1);
LABEL_49:

          return sub_250C02FB8();
        }
        uint64_t v58 = OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool;
        uint64_t v59 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool);
        swift_beginAccess();
        uint64_t v60 = *(void *)(v4 + 16);
        unint64_t v61 = *(void *)(v4 + 48);
        if (*(void *)(v60 + 16))
        {
          uint64_t v62 = sub_250C1B034(v59);
          if (v63) {
            unint64_t v61 = *(void *)(*(void *)(v60 + 56) + 48 * v62 + 24);
          }
        }
        if (sub_250C040C8(0, v61))
        {
          if (qword_269AF8F80 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v26, (uint64_t)qword_269AFCA38);
          uint64_t v54 = sub_250C1D388();
          os_log_type_t v55 = sub_250C1D938();
          if (!os_log_type_enabled(v54, v55)) {
            goto LABEL_49;
          }
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v56 = 0;
          uint64_t v57 = "[AG]Closing gate since pool has max number of background windows";
          goto LABEL_48;
        }
        uint64_t v65 = *(void *)(*(void *)v48 + 16);
        uint64_t v66 = *(void *)(v4 + 16);
        uint64_t v67 = *(void *)(v4 + 40);
        if (*(void *)(v66 + 16))
        {
          uint64_t v68 = sub_250C1B034(*(unsigned __int8 *)(v4 + v58));
          if (v69) {
            uint64_t v67 = *(void *)(*(void *)(v66 + 56) + 48 * v68 + 16);
          }
        }
        if (v65 == v67)
        {
          if (qword_269AF8F80 != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v26, (uint64_t)qword_269AFCA38);
          swift_retain();
          uint64_t v70 = sub_250C1D388();
          os_log_type_t v71 = sub_250C1D938();
          if (os_log_type_enabled(v70, v71))
          {
            unint64_t v72 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)unint64_t v72 = 134217984;
            uint64_t v76 = *(void *)(*(void *)v48 + 16);
            sub_250C1DA48();
            swift_release();
            _os_log_impl(&dword_250BD9000, v70, v71, "[AG]Closing gate since there are %ld predictions in pool", v72, 0xCu);
            MEMORY[0x2533853C0](v72, -1, -1);
          }
          else
          {

            swift_release();
          }
          return sub_250C02FB8();
        }
        return 0;
      }
    }
    LOBYTE(v22) = 0;
    unsigned __int8 v79 = 0;
    goto LABEL_31;
  }
  uint64_t v28 = v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_timeLastPoolClosed;
  swift_beginAccess();
  sub_250BDDB40(v28, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_250BDDC78((uint64_t)v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    sub_250C1D2E8();
    sub_250C1D258();
    double v30 = v29;
    char v31 = *(void (**)(char *, uint64_t))(v14 + 8);
    v31(v17, v13);
    uint64_t v32 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed);
    if (*(unsigned char *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionLastPoolClosed))
    {
      swift_beginAccess();
      uint64_t v33 = *(void *)(v4 + 16);
      double v34 = *(double *)(v4 + 64);
      if (*(void *)(v33 + 16))
      {
        uint64_t v35 = sub_250C1B034(v32);
        if (v36) {
          double v34 = *(double *)(*(void *)(v33 + 56) + 48 * v35 + 40);
        }
      }
      v31(v19, v13);
      if (v30 < v34) {
        return 0;
      }
    }
    else
    {
      v31(v19, v13);
    }
  }
  uint64_t v37 = v79;
  if (sub_250C003C4(v79, *(void *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_motionList)))
  {
    swift_beginAccess();
    uint64_t v38 = *(void *)(v4 + 16);
    double v39 = *(double *)(v4 + 24);
    if (*(void *)(v38 + 16))
    {
      uint64_t v40 = sub_250C1B034(v37);
      uint64_t v26 = v75;
      uint64_t v41 = v74;
      if (v42) {
        double v39 = *(double *)(*(void *)(v38 + 56) + 48 * v40);
      }
      if (v39 > a3) {
        return 0;
      }
    }
    else
    {
      uint64_t v26 = v75;
      uint64_t v41 = v74;
      if (v39 > a3) {
        return 0;
      }
    }
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v43 = __swift_project_value_buffer(v26, (uint64_t)qword_269AFCA38);
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v9, v43, v26);
    uint64_t v44 = sub_250C1D388();
    os_log_type_t v45 = sub_250C1D938();
    if (os_log_type_enabled(v44, v45))
    {
      char v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v78[0] = v47;
      *(_DWORD *)char v46 = 136315138;
      swift_beginAccess();
      uint64_t v77 = sub_250BE1D68(*(void *)&aBackgrouyes_0[8 * (char)v79], *(void *)&aNd_8[8 * (char)v79], v78);
      uint64_t v26 = v75;
      sub_250C1DA48();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250BD9000, v44, v45, "[AG] Opening gate for '%s' prediction", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v47, -1, -1);
      MEMORY[0x2533853C0](v46, -1, -1);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v9, v26);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v26);
    }
    *(unsigned char *)(v4 + v21) = 1;
    swift_beginAccess();
    LOBYTE(v22) = v79;
    *(unsigned char *)(v4 + OBJC_IVAR____TtC12HeadGestures22HGPredictionAggregator_gestureForThePool) = v79;
    goto LABEL_31;
  }
  return 0;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for HGAggregationParameters(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HGAggregationParameters(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for HGAggregationParameters()
{
  return &type metadata for HGAggregationParameters;
}

unint64_t sub_250C06F7C()
{
  unint64_t result = qword_269AF9900;
  if (!qword_269AF9900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9900);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HGAggregationParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HGAggregationParameters.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x250C0712CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGAggregationParameters.CodingKeys()
{
  return &type metadata for HGAggregationParameters.CodingKeys;
}

unint64_t sub_250C07168()
{
  unint64_t result = qword_269AF9910;
  if (!qword_269AF9910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9910);
  }
  return result;
}

unint64_t sub_250C071C0()
{
  unint64_t result = qword_269AF9918;
  if (!qword_269AF9918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9918);
  }
  return result;
}

unint64_t sub_250C07218()
{
  unint64_t result = qword_269AF9920;
  if (!qword_269AF9920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9920);
  }
  return result;
}

unint64_t sub_250C0726C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9938);
  uint64_t v2 = sub_250C1DBC8();
  int v3 = (void *)v2;
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
    sub_250C0ABF0(v6, (uint64_t)&v15, &qword_269AF9940);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_250C1AFBC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_250BE3F48(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_250C073A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9960);
  uint64_t v2 = sub_250C1DBC8();
  int v3 = (void *)v2;
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
    sub_250C0ABF0(v6, (uint64_t)&v13, &qword_269AF9968);
    uint64_t v7 = v13;
    unint64_t result = sub_250C1B0A0(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_250BE3F48(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_250C074D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9970);
  uint64_t v2 = (void *)sub_250C1DBC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  uint64_t v4 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_250C0ABF0(v4, (uint64_t)v13, &qword_269AF9978);
    unint64_t result = sub_250C1B1B8((uint64_t)v13);
    if (v6) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v7 = v2[6] + 40 * result;
    long long v8 = v13[0];
    long long v9 = v13[1];
    *(void *)(v7 + 32) = v14;
    *(_OWORD *)uint64_t v7 = v8;
    *(_OWORD *)(v7 + 16) = v9;
    *(void *)(v2[7] + 8 * result) = v15;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 48;
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

unint64_t sub_250C07600(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9950);
  uint64_t v2 = (void *)sub_250C1DBC8();
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
    unint64_t result = sub_250C1AFBC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

void *sub_250C07714(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = MEMORY[0x263F8EE80];
  v1[4] = 0;
  v1[5] = v3;
  v1[6] = 0;
  v1[2] = a1;
  v1[3] = 0;
  uint64_t v4 = qword_269AF8F80;
  id v5 = a1;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_250C1D3A8();
  __swift_project_value_buffer(v6, (uint64_t)qword_269AFCA38);
  uint64_t v7 = sub_250C1D388();
  os_log_type_t v8 = sub_250C1D928();
  if (os_log_type_enabled(v7, v8))
  {
    char v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v9 = 0;
    _os_log_impl(&dword_250BD9000, v7, v8, "[HGModel] using v2 model", v9, 2u);
    MEMORY[0x2533853C0](v9, -1, -1);
  }

  return v2;
}

void sub_250C0781C()
{
  unint64_t v1 = v0;
  sub_250BEE1CC();
  if (v2)
  {
    uint64_t v10 = sub_250C18568();
    type metadata accessor for E5RTExecutionStreamOperation();
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    swift_bridgeObjectRelease();
    v1[3] = v11;
    swift_release();
    uint64_t v12 = v1[3];
    if (v12)
    {
      uint64_t v13 = *(void *)(v12 + 16);
      swift_retain();
      if (e5rt_execution_stream_operation_get_num_inputs())
      {
LABEL_19:
        swift_release();
        return;
      }
      uint64_t v14 = sub_250C17E28(0, v13);
      if (e5rt_execution_stream_operation_get_num_outputs())
      {
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      uint64_t v15 = (void *)sub_250C17DFC(0, v13);
      if (!v15[2])
      {
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        return;
      }
      uint64_t v29 = v15[4];
      uint64_t v30 = v15[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v16 = *(void *)(v14 + 16);
      if (v16)
      {
        uint64_t v17 = v14 + 40;
        do
        {
          if (v1[3])
          {
            sub_250C1D738();
            swift_retain_n();
            swift_bridgeObjectRetain();
            int v20 = e5rt_execution_stream_operation_retain_input_port();
            swift_release();
            if (v20)
            {
              sub_250C0AAE0();
              uint64_t v18 = (void *)swift_allocError();
              *(_DWORD *)uint64_t v19 = v20;
              *(unsigned char *)(v19 + 4) = 0;
            }
            else
            {
              sub_250C0AB9C();
              uint64_t v18 = (void *)swift_allocError();
              unsigned char *v21 = 0;
            }
            swift_willThrow();

            swift_bridgeObjectRelease();
            swift_release_n();
          }
          v17 += 16;
          --v16;
        }
        while (v16);
      }
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_250C08160(v29, v30, 0);
      swift_bridgeObjectRelease();
      v1[6] = v22;
      swift_release();
      uint64_t v23 = sub_250C186CC();
      type metadata accessor for E5RTExecutionStream();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v23;
      v1[4] = v24;
      swift_release();
      if (!v1[4]) {
        goto LABEL_19;
      }
      swift_retain();
      int v25 = e5rt_execution_stream_encode_operation();
      if (!v25)
      {
        swift_release();
        goto LABEL_19;
      }
      int v26 = v25;
      sub_250C0AAE0();
      char v27 = (void *)swift_allocError();
      *(_DWORD *)uint64_t v28 = v26;
      *(unsigned char *)(v28 + 4) = 0;
      swift_willThrow();
      swift_release();
      swift_release();
      if (qword_269AF8F80 != -1) {
        swift_once();
      }
      uint64_t v3 = sub_250C1D3A8();
      __swift_project_value_buffer(v3, (uint64_t)qword_269AFCA38);
      uint64_t v4 = sub_250C1D388();
      os_log_type_t v5 = sub_250C1D948();
      if (os_log_type_enabled(v4, v5))
      {
        uint64_t v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_250BD9000, v4, v5, "[HGEspressoV2Model] loadModel Error: Failed to load E5 model", v6, 2u);
        MEMORY[0x2533853C0](v6, -1, -1);
      }
    }
  }
  else
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_250C1D3A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
    oslog = sub_250C1D388();
    os_log_type_t v8 = sub_250C1D948();
    if (os_log_type_enabled(oslog, v8))
    {
      char v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v9 = 0;
      _os_log_impl(&dword_250BD9000, oslog, v8, "[HGEspressoV2Model] loadModel Error: invalid model path.", v9, 2u);
      MEMORY[0x2533853C0](v9, -1, -1);
    }
  }
}

uint64_t sub_250C08160(uint64_t a1, uint64_t a2, char a3)
{
  if (!*(void *)(v3 + 24)) {
    return 0;
  }
  if (a3) {
    uint64_t v6 = sub_250C0AB6C;
  }
  else {
    uint64_t v6 = sub_250C0AB3C;
  }
  swift_retain_n();
  v6(a1, a2);
  sub_250C17C98();
  uint64_t v8 = sub_250C17B2C();
  type metadata accessor for E5RTBufferObject();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  e5rt_io_port_bind_buffer_object();
  swift_release();
  int v10 = e5rt_tensor_desc_release();
  if (!v10)
  {
    swift_release();
    swift_release();
    return v9;
  }
  int v11 = v10;
  sub_250C0AAE0();
  swift_allocError();
  *(_DWORD *)uint64_t v12 = v11;
  *(unsigned char *)(v12 + 4) = 0;
  swift_willThrow();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_250C0838C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void))
{
  uint64_t result = a4(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = result;
  if (!v4)
  {
    type metadata accessor for E5RTIOPort();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v6;
  }
  return result;
}

uint64_t sub_250C083DC()
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  if (!*(void *)(v0 + 32)) {
    return 0;
  }
  swift_retain();
  uint64_t v1 = sub_250BEFFAC();
  uint64_t v73 = v1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(v1 + 56);
  uint64_t v70 = v0;
  uint64_t v72 = v0 + 40;
  swift_beginAccess();
  int64_t v5 = 0;
  int64_t v74 = (unint64_t)(v2 + 63) >> 6;
  uint64_t v71 = v1;
  while (1)
  {
    if (v4)
    {
      unint64_t v6 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v7 = v6 | (v5 << 6);
      goto LABEL_19;
    }
    BOOL v8 = __OFADD__(v5++, 1);
    if (v8)
    {
      __break(1u);
LABEL_47:
      uint64_t v40 = *(void *)(v1 + 16);
      uint64_t v41 = *(void *)(v1 + 24);
      sub_250BEE0B4(v1, v4);
      swift_retain();
      swift_retain();
      char v42 = (char *)sub_250C1D0C8();
      if (v42)
      {
        uint64_t v43 = sub_250C1D0E8();
        if (__OFSUB__(v40, v43))
        {
          __break(1u);
LABEL_87:
          __break(1u);
          goto LABEL_88;
        }
        v42 += v40 - v43;
      }
      BOOL v8 = __OFSUB__(v41, v40);
      uint64_t v44 = v41 - v40;
      if (!v8)
      {
        uint64_t v45 = sub_250C1D0D8();
        if (v42)
        {
          if (v45 >= v44) {
            uint64_t v46 = v44;
          }
          else {
            uint64_t v46 = v45;
          }
          uint64_t v47 = v46 / 4;
        }
        else
        {
          uint64_t v47 = 0;
        }
        uint64_t v48 = sub_250C0961C(v42, v47);
        swift_release();
        swift_release();
        goto LABEL_68;
      }
LABEL_85:
      __break(1u);
    }
    if (v5 >= v74) {
      goto LABEL_30;
    }
    unint64_t v9 = *(void *)(v73 + 8 * v5);
    if (!v9) {
      break;
    }
LABEL_18:
    unint64_t v4 = (v9 - 1) & v9;
    unint64_t v7 = __clz(__rbit64(v9)) + (v5 << 6);
LABEL_19:
    int v11 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v7);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    swift_bridgeObjectRetain();
    id v14 = sub_250BEFBE4(v13, v12);
    if (v14
      && (uint64_t v15 = v14,
          id v16 = objc_msgSend(v14, sel_multiArrayValue),
          v15,
          v16))
    {
      if (*(void *)(*(void *)v72 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_250C1AFBC(v13, v12);
        if (v17)
        {
          swift_retain();
          swift_bridgeObjectRelease();
          uint64_t v18 = swift_bridgeObjectRelease();
          MEMORY[0x270FA5388](v18);
          sub_250C1D8E8();
          swift_bridgeObjectRelease();
          swift_release();

          uint64_t v1 = v71;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  int64_t v10 = v5 + 1;
  if (v5 + 1 >= v74) {
    goto LABEL_30;
  }
  unint64_t v9 = *(void *)(v73 + 8 * v10);
  if (v9) {
    goto LABEL_17;
  }
  int64_t v10 = v5 + 2;
  if (v5 + 2 >= v74) {
    goto LABEL_30;
  }
  unint64_t v9 = *(void *)(v73 + 8 * v10);
  if (v9)
  {
LABEL_17:
    int64_t v5 = v10;
    goto LABEL_18;
  }
  int64_t v10 = v5 + 3;
  if (v5 + 3 < v74)
  {
    unint64_t v9 = *(void *)(v73 + 8 * v10);
    if (!v9)
    {
      while (1)
      {
        int64_t v5 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          break;
        }
        if (v5 >= v74) {
          goto LABEL_30;
        }
        unint64_t v9 = *(void *)(v73 + 8 * v5);
        ++v10;
        if (v9) {
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_64:
      sub_250C1D0D8();
      double v39 = 0;
      uint64_t v38 = 0;
LABEL_65:
      uint64_t v48 = sub_250C0961C(v39, v38);
LABEL_68:
      sub_250BEE174(v1, v4);
LABEL_69:
      if (*(void *)(v48 + 16) == 3)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9930);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_250C1F660;
        *(void *)(inited + 32) = 0x756F72676B636142;
        *(void *)(inited + 40) = 0xEA0000000000646ELL;
        if (*(void *)(v48 + 16))
        {
          uint64_t v56 = inited;
          *(double *)(inited + 48) = *(float *)(v48 + 32);
          *(void *)(inited + 56) = 7562585;
          *(void *)(inited + 64) = 0xE300000000000000;
          if (*(void *)(v48 + 16) < 2uLL)
          {
            __break(1u);
          }
          else
          {
            *(double *)(inited + 72) = *(float *)(v48 + 36);
            *(void *)(inited + 80) = 28494;
            *(void *)(inited + 88) = 0xE200000000000000;
            if (*(void *)(v48 + 16) >= 3uLL)
            {
              float v57 = *(float *)(v48 + 40);
              swift_bridgeObjectRelease();
              *(double *)(v56 + 96) = v57;
              unint64_t v58 = sub_250C07600(v56);
              uint64_t v59 = swift_bridgeObjectRetain();
              uint64_t v60 = sub_250C09524(v59);
              swift_bridgeObjectRelease();
              uint64_t v75 = v60;
              sub_250C09754(&v75);
              if (v75[2])
              {
                swift_bridgeObjectRetain();
                swift_release();
                type metadata accessor for HGMLOutput();
                swift_allocObject();
                uint64_t v32 = sub_250C1A96C(v58);
                swift_release();
                swift_release();
                sub_250BEE174(v1, v4);
                return v32;
              }
LABEL_88:
              swift_release();
              __break(1u);
              swift_release();
              __break(1u);
              JUMPOUT(0x250C09080);
            }
          }
          __break(1u);
LABEL_84:
          __break(1u);
          goto LABEL_85;
        }
        __break(1u);
LABEL_81:
        swift_once();
      }
      else if (qword_269AF8F80 != -1)
      {
        goto LABEL_81;
      }
      uint64_t v61 = sub_250C1D3A8();
      __swift_project_value_buffer(v61, (uint64_t)qword_269AFCA38);
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_250C1D388();
      os_log_type_t v63 = sub_250C1D948();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = (uint8_t *)swift_slowAlloc();
        uint64_t v65 = (void *)swift_slowAlloc();
        uint64_t v75 = v65;
        *(_DWORD *)uint64_t v64 = 136315138;
        uint64_t v66 = swift_bridgeObjectRetain();
        uint64_t v67 = MEMORY[0x253384630](v66, MEMORY[0x263F8D5C8]);
        unint64_t v69 = v68;
        swift_bridgeObjectRelease();
        sub_250BE1D68(v67, v69, (uint64_t *)&v75);
        sub_250C1DA48();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250BD9000, v62, v63, "[HGEspressoV2Model]:prediction Error, invalid output %s", v64, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v65, -1, -1);
        MEMORY[0x2533853C0](v64, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_release();
      swift_release();
      sub_250BEE174(v78, *((unint64_t *)&v78 + 1));
      return 0;
    }
    goto LABEL_17;
  }
LABEL_30:
  swift_release();
  int v19 = e5rt_execution_stream_execute_sync();
  if (v19)
  {
    int v20 = v19;
    sub_250C0AAE0();
    uint64_t v21 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v22 = v20;
    *(unsigned char *)(v22 + 4) = 0;
    swift_willThrow();
  }
  else
  {
    if (!*(void *)(v70 + 48))
    {
      swift_release();
      return 0;
    }
    long long v78 = xmmword_250C20D50;
    swift_retain();
    double v34 = (void *)sub_250C179C8();
    uint64_t v75 = 0;
    int size = e5rt_buffer_object_get_size();
    if (!size)
    {
      sub_250C0A37C(&v78, v34, (uint64_t)v75 + (void)v34);
      unint64_t v4 = *((void *)&v78 + 1);
      uint64_t v1 = v78;
      switch(*((void *)&v78 + 1) >> 62)
      {
        case 1:
          uint64_t v49 = ((uint64_t)v78 >> 32) - (int)v78;
          if ((uint64_t)v78 >> 32 < (int)v78) {
            goto LABEL_84;
          }
          swift_retain();
          uint64_t v50 = sub_250C1D0C8();
          if (!v50) {
            goto LABEL_64;
          }
          uint64_t v51 = v50;
          uint64_t v52 = sub_250C1D0E8();
          uint64_t v53 = (int)v1 - v52;
          if (__OFSUB__((int)v1, v52)) {
            goto LABEL_87;
          }
          uint64_t v54 = sub_250C1D0D8();
          double v39 = (char *)(v51 + v53);
          if (v54 >= v49) {
            uint64_t v54 = (v1 >> 32) - (int)v1;
          }
          uint64_t v38 = v54 / 4;
          break;
        case 2:
          goto LABEL_47;
        case 3:
          sub_250BEE174(v78, *((unint64_t *)&v78 + 1));
          uint64_t v48 = MEMORY[0x263F8EE78];
          goto LABEL_69;
        default:
          uint64_t v75 = (void *)v78;
          int v76 = DWORD2(v78);
          __int16 v77 = WORD6(v78);
          uint64_t v38 = (*((void *)&v78 + 1) >> 50) & 0x3FLL;
          double v39 = (char *)&v75;
          goto LABEL_65;
      }
      goto LABEL_65;
    }
    int v36 = size;
    sub_250C0AAE0();
    uint64_t v21 = (void *)swift_allocError();
    *(_DWORD *)uint64_t v37 = v36;
    *(unsigned char *)(v37 + 4) = 0;
    swift_willThrow();
    swift_release();
    sub_250BEE174(v78, *((unint64_t *)&v78 + 1));
  }
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_250C1D3A8();
  __swift_project_value_buffer(v23, (uint64_t)qword_269AFCA38);
  id v24 = v21;
  id v25 = v21;
  int v26 = sub_250C1D388();
  os_log_type_t v27 = sub_250C1D948();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(void *)&long long v78 = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    swift_getErrorValue();
    uint64_t v30 = sub_250C1DD28();
    uint64_t v75 = (void *)sub_250BE1D68(v30, v31, (uint64_t *)&v78);
    sub_250C1DA48();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_250BD9000, v26, v27, "[HGEspressoV2Model]:prediction Error %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v29, -1, -1);
    MEMORY[0x2533853C0](v28, -1, -1);

    swift_release();
  }
  else
  {
    swift_release();
  }
  return 0;
}

void sub_250C09090(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unsigned char *a6)
{
  uint64_t v12 = sub_250C179C8();
  if (!v6)
  {
    uint64_t v13 = (void *)v12;
    int size = e5rt_buffer_object_get_size();
    if (size)
    {
      int v15 = size;
      sub_250C0AAE0();
      swift_allocError();
      *(_DWORD *)uint64_t v16 = v15;
      *(unsigned char *)(v16 + 4) = 0;
      swift_willThrow();
    }
    else
    {
      sub_250C091A0(v13, (uint64_t)v13, a1, a2, a4, a5, a6);
    }
  }
}

void sub_250C091A0(void *a1, uint64_t a2, void *__src, uint64_t a4, uint64_t a5, unint64_t a6, unsigned char *a7)
{
  if (__src) {
    uint64_t v10 = a4 - (void)__src;
  }
  else {
    uint64_t v10 = 0;
  }
  if (a1)
  {
    if (v10 == a2 - (void)a1)
    {
      if (__src)
      {
        size_t v12 = a4 - (void)__src;
        memmove(a1, __src, v12);
      }
      return;
    }
  }
  else if (!v10)
  {
    return;
  }
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_250C1D3A8();
  __swift_project_value_buffer(v13, (uint64_t)qword_269AFCA38);
  swift_bridgeObjectRetain_n();
  id v14 = sub_250C1D388();
  os_log_type_t v15 = sub_250C1D948();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_250BE1D68(a5, a6, &v18);
    sub_250C1DA48();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_250BD9000, v14, v15, "[HGEspressoV2Model]:loadData Error, source/des buffer size mismatch for %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v17, -1, -1);
    MEMORY[0x2533853C0](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *a7 = 0;
}

void *sub_250C093C4(void *result, uint64_t a2, void *__src, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a4 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!result)
  {
    if (v5 <= 0) {
      return result;
    }
LABEL_12:
    uint64_t result = (void *)sub_250C1DBD8();
    __break(1u);
    return result;
  }
  if (a2 - (uint64_t)result < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    size_t v7 = a4 - (void)__src;
    return memmove(result, __src, v7);
  }
  return result;
}

uint64_t sub_250C09460()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGEspressoV2Model()
{
  return self;
}

void sub_250C094DC()
{
}

uint64_t sub_250C09500()
{
  return sub_250C083DC();
}

void *sub_250C09524(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98B0);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_250C0A6BC((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_250C0AB34();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_250C0961C(char *a1, uint64_t a2)
{
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF96A0);
    uint64_t v4 = 4 * a2;
    uint64_t v5 = (char *)swift_allocObject();
    int64_t v6 = _swift_stdlib_malloc_size(v5);
    uint64_t v7 = v6 - 32;
    if (v6 < 32) {
      uint64_t v7 = v6 - 29;
    }
    *((void *)v5 + 2) = a2;
    *((void *)v5 + 3) = 2 * (v7 >> 2);
    BOOL v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 4 * a2);
      return (uint64_t)v5;
    }
  }
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C09754(void **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (void *)sub_250C0A8C4(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_250C097C0(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_250C097C0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_250C1DCD8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v88 = *a1;
      uint64_t v89 = *a1 + 16;
      uint64_t v90 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v92 = *(double *)(v88 + 24 * i + 16);
        uint64_t v93 = v90;
        uint64_t v94 = v89;
        do
        {
          if (*(double *)v94 >= v92) {
            break;
          }
          if (!v88) {
            goto LABEL_141;
          }
          uint64_t v95 = *(void *)(v94 + 8);
          uint64_t v96 = *(void *)(v94 + 16);
          *(_OWORD *)(v94 + 8) = *(_OWORD *)(v94 - 16);
          *(void *)(v94 + 24) = *(void *)v94;
          *(void *)(v94 - 16) = v95;
          *(void *)(v94 - 8) = v96;
          *(double *)uint64_t v94 = v92;
          v94 -= 24;
        }
        while (!__CFADD__(v93++, 1));
        v89 += 24;
        --v90;
      }
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
    goto LABEL_146;
  }
  uint64_t v6 = result;
  uint64_t v106 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      size_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v98 = v12;
      uint64_t v108 = v9;
      if (v13 >= 2)
      {
        uint64_t v99 = *v106;
        do
        {
          unint64_t v100 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_132;
          }
          if (!v99) {
            goto LABEL_145;
          }
          uint64_t v101 = v98;
          uint64_t v102 = *(void *)&v98[16 * v100 + 32];
          uint64_t v103 = *(void *)&v98[16 * v13 + 24];
          sub_250C09EDC((double *)(v99 + 24 * v102), (double *)(v99 + 24 * *(void *)&v98[16 * v13 + 16]), v99 + 24 * v103, __dst);
          if (v1) {
            break;
          }
          if (v103 < v102) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v101 = sub_250C0A368((uint64_t)v101);
          }
          if (v100 >= *((void *)v101 + 2)) {
            goto LABEL_134;
          }
          uint64_t v104 = &v101[16 * v100 + 32];
          *(void *)uint64_t v104 = v102;
          *((void *)v104 + 1) = v103;
          unint64_t v105 = *((void *)v101 + 2);
          if (v13 > v105) {
            goto LABEL_135;
          }
          memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v105 - v13));
          uint64_t v98 = v101;
          *((void *)v101 + 2) = v105 - 1;
          unint64_t v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v108 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v108 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98B8);
    uint64_t v8 = sub_250C1D848();
    *(void *)(v8 + 16) = v7;
    uint64_t v108 = v8;
    __dst = (double *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 + 64;
  size_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v109 = v6;
  uint64_t v110 = v3;
  uint64_t v111 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      double v15 = *(double *)(v11 + 24 * v10 + 16);
      double v16 = *(double *)(v11 + 24 * v14 + 16);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (double *)(v107 + 24 * v14);
        double v18 = v15;
        while (1)
        {
          double v19 = v18;
          double v18 = *v17;
          if (v16 < v15 == v19 >= *v17) {
            break;
          }
          ++v10;
          v17 += 3;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_138;
        }
        if (v14 < v10)
        {
          uint64_t v20 = 24 * v10;
          uint64_t v21 = 24 * v14;
          uint64_t v22 = v10;
          uint64_t v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_144;
              }
              uint64_t v24 = v11 + v21;
              uint64_t v25 = v11 + v20;
              uint64_t v26 = *(void *)(v11 + v21);
              uint64_t v27 = *(void *)(v11 + v21 + 8);
              uint64_t v28 = *(void *)(v11 + v21 + 16);
              uint64_t v29 = *(void *)(v11 + v20 - 8);
              *(_OWORD *)uint64_t v24 = *(_OWORD *)(v11 + v20 - 24);
              *(void *)(v24 + 16) = v29;
              *(void *)(v25 - 24) = v26;
              *(void *)(v25 - 16) = v27;
              *(void *)(v25 - 8) = v28;
            }
            ++v23;
            v20 -= 24;
            v21 += 24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_136;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v30 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_139;
    }
    if (v30 >= v3) {
      uint64_t v30 = v3;
    }
    if (v30 < v14) {
      break;
    }
    if (v10 != v30)
    {
      unint64_t v31 = (double *)(v11 + 24 * v10);
      do
      {
        double v32 = *(double *)(v11 + 24 * v10 + 16);
        uint64_t v33 = v14;
        double v34 = v31;
        do
        {
          if (*(v34 - 1) >= v32) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          double v35 = *v34;
          uint64_t v36 = *((void *)v34 + 1);
          *(_OWORD *)double v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *((void *)v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      uint64_t v10 = v30;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v12 = sub_250C0A19C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v38 = *((void *)v12 + 2);
    unint64_t v37 = *((void *)v12 + 3);
    unint64_t v13 = v38 + 1;
    uint64_t v11 = v111;
    if (v38 >= v37 >> 1)
    {
      uint64_t v87 = sub_250C0A19C((char *)(v37 > 1), v38 + 1, 1, v12);
      uint64_t v11 = v111;
      size_t v12 = v87;
    }
    *((void *)v12 + 2) = v13;
    double v39 = v12 + 32;
    uint64_t v40 = &v12[16 * v38 + 32];
    *(void *)uint64_t v40 = v14;
    *((void *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        unint64_t v41 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v46 = &v39[16 * v13];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_120;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_121;
          }
          unint64_t v53 = v13 - 2;
          uint64_t v54 = &v39[16 * v13 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_123;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_126;
          }
          if (v58 >= v49)
          {
            int v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_130;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v70 = *((void *)v12 + 4);
            uint64_t v71 = *((void *)v12 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_77;
          }
          uint64_t v43 = *((void *)v12 + 4);
          uint64_t v42 = *((void *)v12 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_122;
        }
        unint64_t v53 = v13 - 2;
        uint64_t v59 = &v39[16 * v13 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_125;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_128;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_129;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_83:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v64) {
          goto LABEL_124;
        }
        uint64_t v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_127;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
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
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
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
          goto LABEL_140;
        }
        if (!v11) {
          goto LABEL_143;
        }
        uint64_t v81 = v12;
        uint64_t v82 = &v39[16 * v80];
        uint64_t v83 = *(void *)v82;
        uint64_t v84 = &v39[16 * v41];
        uint64_t v85 = *((void *)v84 + 1);
        sub_250C09EDC((double *)(v11 + 24 * *(void *)v82), (double *)(v11 + 24 * *(void *)v84), v11 + 24 * v85, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v85 < v83) {
          goto LABEL_117;
        }
        if (v41 > *((void *)v81 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v82 = v83;
        *(void *)&v39[16 * v80 + 8] = v85;
        unint64_t v86 = *((void *)v81 + 2);
        if (v41 >= v86) {
          goto LABEL_119;
        }
        size_t v12 = v81;
        unint64_t v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((void *)v81 + 2) = v86 - 1;
        uint64_t v11 = v111;
        if (v86 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v109;
    uint64_t v3 = v110;
    if (v10 >= v110)
    {
      uint64_t v9 = v108;
      goto LABEL_103;
    }
  }
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
  uint64_t result = sub_250C1DB78();
  __break(1u);
  return result;
}

uint64_t sub_250C09EDC(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = ((char *)a2 - (char *)__src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v26 = __src;
  uint64_t v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[3 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      uint64_t v17 = &v4[3 * v11];
      uint64_t v24 = (char *)v17;
      uint64_t v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v18 = a3 - 24;
        do
        {
          double v19 = (double *)(v18 + 24);
          if (*(v6 - 1) >= *(v17 - 1))
          {
            uint64_t v24 = (char *)(v17 - 3);
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              long long v22 = *(_OWORD *)(v17 - 3);
              *(double *)(v18 + 16) = *(v17 - 1);
              *(_OWORD *)unint64_t v18 = v22;
            }
            uint64_t v20 = v6;
            v17 -= 3;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v20 = v6 - 3;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              long long v21 = *(_OWORD *)v20;
              *(double *)(v18 + 16) = *(v6 - 1);
              *(_OWORD *)unint64_t v18 = v21;
            }
            uint64_t v26 = v6 - 3;
            if (v20 <= v7) {
              break;
            }
          }
          v18 -= 24;
          uint64_t v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_250C0A298((void **)&v26, (const void **)&v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[3 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    size_t v12 = &v4[3 * v9];
    uint64_t v24 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      unint64_t v13 = v4;
      while (1)
      {
        if (v13[2] >= v6[2])
        {
          uint64_t v4 = v13 + 3;
          double v15 = v13;
          uint64_t v14 = v6;
          if (v7 == v13)
          {
            v13 += 3;
            if (v7 < v4) {
              goto LABEL_18;
            }
          }
          else
          {
            v13 += 3;
          }
        }
        else
        {
          uint64_t v14 = v6 + 3;
          double v15 = v6;
          if (v7 == v6 && v7 < v14) {
            goto LABEL_18;
          }
        }
        long long v16 = *(_OWORD *)v15;
        v7[2] = v15[2];
        *(_OWORD *)uint64_t v7 = v16;
LABEL_18:
        v7 += 3;
        if (v13 < v12)
        {
          uint64_t v6 = v14;
          if ((unint64_t)v14 < a3) {
            continue;
          }
        }
        uint64_t v25 = v4;
        uint64_t v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  uint64_t result = sub_250C1DBD8();
  __break(1u);
  return result;
}

char *sub_250C0A19C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9948);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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

char *sub_250C0A298(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_250C1DBD8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_250C0A368(uint64_t a1)
{
  return sub_250C0A19C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_250C0A37C(void *result, void *__src, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = *result;
  unint64_t v3 = result[1];
  uint64_t v5 = a3;
  int64_t v7 = result;
  switch(v3 >> 62)
  {
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      uint64_t v22 = *result;
      uint64_t v23 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_250C1D1A8();
      uint64_t v10 = v23;
      uint64_t v11 = *(void *)(v22 + 16);
      uint64_t v21 = *(void *)(v22 + 24);
      uint64_t v12 = sub_250C1D0C8();
      if (!v12)
      {
        __break(1u);
        JUMPOUT(0x250C0A5F8);
      }
      uint64_t v13 = v12;
      uint64_t v14 = sub_250C1D0E8();
      uint64_t v15 = v11 - v14;
      if (__OFSUB__(v11, v14))
      {
        __break(1u);
LABEL_17:
        __break(1u);
      }
      BOOL v16 = __OFSUB__(v21, v11);
      uint64_t v17 = v21 - v11;
      if (v16) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_250C1D0D8();
      if (v18 >= v17) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v18;
      }
      uint64_t result = sub_250C093C4((void *)(v13 + v15), v13 + v15 + v19, __src, a3);
      *int64_t v7 = v22;
      v7[1] = v10 | 0x8000000000000000;
      return result;
    case 3uLL:
      if (!__src || a3 - (uint64_t)__src < 1) {
        return result;
      }
      sub_250C1DBD8();
      __break(1u);
LABEL_13:
      uint64_t v22 = v4;
      uint64_t v23 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_250C0A608((int *)&v22, __src, v5);
      uint64_t v8 = v22;
      unint64_t v9 = v23 | 0x4000000000000000;
LABEL_14:
      *int64_t v7 = v8;
      v7[1] = v9;
      return result;
    default:
      uint64_t v22 = *result;
      LOWORD(v23) = v3;
      BYTE2(v23) = BYTE2(v3);
      BYTE3(v23) = BYTE3(v3);
      BYTE4(v23) = BYTE4(v3);
      BYTE5(v23) = BYTE5(v3);
      BYTE6(v23) = BYTE6(v3);
      uint64_t result = sub_250C093C4(&v22, (uint64_t)&v22 + BYTE6(v3), __src, a3);
      uint64_t v8 = v22;
      unint64_t v9 = v23 | ((unint64_t)BYTE4(v23) << 32) | ((unint64_t)BYTE5(v23) << 40) | ((unint64_t)BYTE6(v23) << 48);
      goto LABEL_14;
  }
}

char *sub_250C0A608(int *a1, void *a2, uint64_t a3)
{
  uint64_t result = (char *)sub_250C1D1B8();
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  if ((int)v8 < (int)v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = (char *)sub_250C1D0C8();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  unint64_t v9 = result;
  uint64_t result = (char *)sub_250C1D0E8();
  uint64_t v10 = v7 - (void)result;
  if (__OFSUB__(v7, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v11 = v8 - v7;
  uint64_t v12 = sub_250C1D0D8();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  return (char *)sub_250C093C4(&v9[v10], (uint64_t)&v9[v10 + v13], a2, a3);
}

uint64_t sub_250C0A6BC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = *v20;
    v11[1] = v21;
    void v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
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

uint64_t sub_250C0A8C4(void *a1)
{
  return sub_250C05640(0, a1[2], 0, a1);
}

unint64_t sub_250C0A8D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9988);
    unint64_t v3 = (void *)sub_250C1DBC8();
    for (uint64_t i = (void *)(a1 + 80); ; i += 7)
    {
      unsigned __int8 v5 = *((unsigned char *)i - 48);
      long long v14 = *(_OWORD *)(i - 3);
      long long v15 = *(_OWORD *)(i - 5);
      uint64_t v6 = *(i - 1);
      uint64_t v7 = *i;
      unint64_t result = sub_250C1B034(v5);
      if (v9) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      uint64_t v10 = v3[7] + 48 * result;
      *(_OWORD *)uint64_t v10 = v15;
      *(_OWORD *)(v10 + 16) = v14;
      *(void *)(v10 + 32) = v6;
      *(void *)(v10 + 40) = v7;
      uint64_t v11 = v3[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v3[2] = v13;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_250C0A9E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9980);
    unint64_t v3 = (void *)sub_250C1DBC8();
    for (uint64_t i = (void *)(a1 + 40); ; i += 2)
    {
      unsigned __int8 v5 = *((unsigned char *)i - 8);
      uint64_t v6 = *i;
      unint64_t result = sub_250C1B034(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      *(void *)(v3[7] + 8 * result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

void sub_250C0AAC0(void *a1, uint64_t a2)
{
  sub_250C09090(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned char **)(v2 + 40));
}

unint64_t sub_250C0AAE0()
{
  unint64_t result = qword_269AF9928;
  if (!qword_269AF9928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9928);
  }
  return result;
}

uint64_t sub_250C0AB34()
{
  return swift_release();
}

uint64_t sub_250C0AB3C(uint64_t a1, uint64_t a2)
{
  return sub_250C0838C(a1, a2, v2, sub_250C180A0);
}

uint64_t sub_250C0AB6C(uint64_t a1, uint64_t a2)
{
  return sub_250C0838C(a1, a2, v2, sub_250C18100);
}

unint64_t sub_250C0AB9C()
{
  unint64_t result = qword_269AF9958;
  if (!qword_269AF9958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9958);
  }
  return result;
}

uint64_t sub_250C0ABF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_250C0AC54(char a1, char a2)
{
  if (*(void *)&aStopped_1[8 * a1] == *(void *)&aStopped_1[8 * a2] && qword_250C20F48[a1] == qword_250C20F48[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_250C1DCF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_250C0ACDC(char a1, char a2)
{
  unint64_t v3 = 0xD00000000000001DLL;
  unint64_t v4 = 0x8000000250C218F0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD00000000000001CLL;
      uint64_t v5 = "minGestureConfScoreThreshold";
      goto LABEL_7;
    case 2:
      unint64_t v4 = 0x8000000250C21930;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v3 = 0xD00000000000001BLL;
      uint64_t v5 = "maxNumBackgroundPredictions";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xD000000000000019;
      uint64_t v5 = "numConsecutivePredictions";
      goto LABEL_7;
    case 5:
      unint64_t v3 = 0xD000000000000013;
      uint64_t v5 = "minTimeBetweenPools";
LABEL_7:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD00000000000001DLL;
  unint64_t v7 = 0x8000000250C218F0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xD00000000000001CLL;
      char v8 = "minGestureConfScoreThreshold";
      goto LABEL_14;
    case 2:
      unint64_t v7 = 0x8000000250C21930;
      unint64_t v6 = 0xD000000000000010;
      break;
    case 3:
      unint64_t v6 = 0xD00000000000001BLL;
      char v8 = "maxNumBackgroundPredictions";
      goto LABEL_14;
    case 4:
      unint64_t v6 = 0xD000000000000019;
      char v8 = "numConsecutivePredictions";
      goto LABEL_14;
    case 5:
      unint64_t v6 = 0xD000000000000013;
      char v8 = "minTimeBetweenPools";
LABEL_14:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_250C1DCF8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_250C0AEA8()
{
  return sub_250C1DD98();
}

uint64_t sub_250C0AFBC()
{
  return sub_250C1DD98();
}

uint64_t sub_250C0B028()
{
  sub_250C1D748();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250C0B07C()
{
  sub_250C1D748();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250C0B174()
{
  return sub_250C1DD98();
}

uint64_t sub_250C0B284()
{
  return sub_250C1DD98();
}

uint64_t sub_250C0B2EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  uint64_t v4 = sub_250C1D348();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_250C0B374(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_250C1D348();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_250C0B490@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  uint64_t v4 = sub_250C1D348();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_250C0B514(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  uint64_t v4 = sub_250C1D348();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_250C0B5A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250C0B5FC(char a1)
{
  return *(void *)&aStopped_1[8 * a1];
}

uint64_t sub_250C0B61C(char *a1, char *a2)
{
  return sub_250C0AC54(*a1, *a2);
}

uint64_t sub_250C0B628()
{
  return sub_250C0AFBC();
}

uint64_t sub_250C0B630()
{
  return sub_250C0B028();
}

uint64_t sub_250C0B638()
{
  return sub_250C0B284();
}

uint64_t sub_250C0B640@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_250C0F264();
  *a1 = result;
  return result;
}

uint64_t sub_250C0B670@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_250C0B5FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_250C0B6E8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_250C0B7A0(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

void sub_250C0B7F4(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_250C0B858())()
{
  return j__swift_endAccess;
}

id HGManager.__allocating_init(delegate:config:)(uint64_t a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_250C0F2B0(a1, a2);
  swift_unknownObjectRelease();

  return v6;
}

id HGManager.init(delegate:config:)(uint64_t a1, void *a2)
{
  id v3 = sub_250C0F2B0(a1, a2);
  swift_unknownObjectRelease();

  return v3;
}

id sub_250C0B9B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250C1D348();
  uint64_t v30 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D3A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_269AFCA38);
  uint64_t v10 = sub_250C1D388();
  os_log_type_t v11 = sub_250C1D958();
  if (os_log_type_enabled(v10, v11))
  {
    BOOL v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl(&dword_250BD9000, v10, v11, "==========▶️===========", v12, 2u);
    MEMORY[0x2533853C0](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v13 = v1;
  long long v14 = sub_250C1D388();
  os_log_type_t v15 = sub_250C1D958();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)uint64_t v17 = 136315650;
    v26[1] = v17 + 4;
    int v27 = v16;
    unint64_t v18 = &v13[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    uint64_t v19 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v4, v18, v2);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v20 = sub_250C1DCE8();
    uint64_t v28 = v5;
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
    uint64_t v31 = sub_250BE1D68(v20, v22, v32);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v31 = sub_250BE1D68(0x29287472617473, 0xE700000000000000, v32);
    sub_250C1DA48();
    *(_WORD *)(v17 + 22) = 2080;
    uint64_t v31 = sub_250BE1D68(*(void *)&aStopped_1[8 * v13[OBJC_IVAR___HGManagerInternal_status]], qword_250C20F48[v13[OBJC_IVAR___HGManagerInternal_status]], v32);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v14, (os_log_type_t)v27, "[HGManager]%s: %s status: %s", (uint8_t *)v17, 0x20u);
    uint64_t v23 = v29;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v23, -1, -1);
    MEMORY[0x2533853C0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v28);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v24 = *(void **)&v13[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v24, sel_lock);
  sub_250C0BE80(v13);
  return objc_msgSend(v24, sel_unlock);
}

void sub_250C0BE80(unsigned char *a1)
{
  uint64_t v104 = 0x646570706F7453;
  uint64_t v3 = sub_250C1D348();
  uint64_t v4 = *(void **)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (void (**)(char *, uint64_t))((char *)v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v103 = (char *)v91 - v9;
  MEMORY[0x270FA5388](v8);
  unint64_t v105 = (void *)((char *)v91 - v10);
  os_log_type_t v11 = (uint8_t *)sub_250C1D3A8();
  BOOL v12 = (void (**)(char *, uint64_t, uint8_t *))*((void *)v11 - 1);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  MEMORY[0x270FA5388](v13);
  uint64_t v106 = v4;
  uint64_t v107 = (char *)v91 - v15;
  uint64_t v16 = OBJC_IVAR___HGManagerInternal_status;
  if (a1[OBJC_IVAR___HGManagerInternal_status] && a1[OBJC_IVAR___HGManagerInternal_status] != 1)
  {
    uint64_t v17 = (char *)v3;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  unint64_t v100 = v7;
  uint64_t v101 = v14;
  uint64_t v17 = (char *)v3;
  char v18 = sub_250C1DCF8();
  swift_bridgeObjectRelease();
  if (v18)
  {
LABEL_8:
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v21 = __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_269AFCA38);
    unint64_t v22 = v107;
    v12[2](v107, v21, v11);
    uint64_t v23 = a1;
    uint64_t v24 = sub_250C1D388();
    int v25 = sub_250C1D948();
    if (!os_log_type_enabled(v24, (os_log_type_t)v25))
    {

      ((void (*)(char *, uint8_t *))v12[1])(v22, v11);
      return;
    }
    LODWORD(v98) = v25;
    os_log_t v99 = v24;
    unint64_t v100 = (void (**)(char *, uint64_t))v12;
    uint64_t v104 = (uint64_t)v11;
    uint64_t v102 = v1;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    v109[0] = v97;
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v101 = v26 + 4;
    int v27 = &v23[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    uint64_t v29 = v105;
    uint64_t v28 = v106;
    uint64_t v96 = (void **)v106[2];
    ((void (*)(uint64_t *, char *, char *))v96)(v105, v27, v17);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v30 = sub_250C1DCE8();
    unint64_t v32 = v31;
    uint64_t v106 = (void *)v28[1];
    ((void (*)(uint64_t *, char *))v106)(v29, v17);
    uint64_t v110 = sub_250BE1D68(v30, v32, v109);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v33 = *(void *)&v23[OBJC_IVAR___HGManagerInternal_session];
    if (v33)
    {
      double v34 = v103;
      ((void (*)(char *, uint64_t, char *))v96)(v103, v33 + OBJC_IVAR____TtC12HeadGestures9HGSession_id, v17);
      uint64_t v35 = sub_250C1DCE8();
      unint64_t v37 = v36;
      ((void (*)(char *, char *))v106)(v34, v17);
      uint64_t v110 = sub_250BE1D68(v35, v37, v109);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      os_log_t v38 = v99;
      _os_log_impl(&dword_250BD9000, v99, (os_log_type_t)v98, "[HGManager]%s: EXISTING LIVE SESSION %s, ignore command...", (uint8_t *)v26, 0x16u);
      uint64_t v39 = v97;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v39, -1, -1);
      MEMORY[0x2533853C0](v26, -1, -1);

      v100[1](v107, v104);
      return;
    }

    __break(1u);
    goto LABEL_30;
  }
  uint64_t v102 = v1;
  uint64_t v19 = v16;
  int v20 = a1[v16];
  if (!a1[v16] || (uint64_t v104 = 0x676E696E6E7552, v20 != 1))
  {
    char v40 = sub_250C1DCF8();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_15;
    }
    uint64_t v107 = v17;
    uint64_t v55 = (void **)&a1[OBJC_IVAR___HGManagerInternal_configuration];
    swift_beginAccess();
    uint64_t v56 = *v55;
    type metadata accessor for HGSession();
    swift_allocObject();
    id v57 = v56;
    uint64_t v58 = sub_250BEB140(v57);

    uint64_t v59 = OBJC_IVAR___HGManagerInternal_session;
    *(void *)&a1[OBJC_IVAR___HGManagerInternal_session] = v58;
    swift_release();
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v60 = __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_269AFCA38);
    uint64_t v61 = v101;
    v12[2]((char *)v101, v60, v11);
    BOOL v62 = a1;
    uint64_t v63 = sub_250C1D388();
    LODWORD(v99) = sub_250C1D958();
    if (os_log_type_enabled(v63, (os_log_type_t)v99))
    {
      os_log_t v95 = v63;
      uint64_t v96 = v55;
      uint64_t v97 = v19;
      uint64_t v104 = (uint64_t)v11;
      uint64_t v64 = swift_slowAlloc();
      uint64_t v103 = (char *)v59;
      uint64_t v65 = v62;
      uint64_t v66 = v64;
      uint64_t v94 = swift_slowAlloc();
      uint64_t v110 = v94;
      *(_DWORD *)uint64_t v66 = 136315650;
      uint64_t v98 = v66 + 4;
      uint64_t v67 = &v65[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      uint64_t v68 = v105;
      BOOL v69 = v106;
      uint64_t v70 = (void (*)(void (**)(char *, uint64_t), uint64_t, char *))v106[2];
      uint64_t v71 = v107;
      uint64_t v93 = (char *)(v106 + 2);
      double v92 = v70;
      v70((void (**)(char *, uint64_t))v105, (uint64_t)v67, v107);
      v91[1] = sub_250C0F71C((unint64_t *)&qword_269AF9358);
      uint64_t v72 = a1;
      uint64_t v73 = sub_250C1DCE8();
      unint64_t v75 = v74;
      v91[0] = v69[1];
      ((void (*)(uint64_t *, char *))v91[0])(v68, v71);
      uint64_t v76 = v73;
      a1 = v72;
      uint64_t v108 = sub_250BE1D68(v76, v75, &v110);
      unint64_t v105 = v109;
      sub_250C1DA48();

      uint64_t v106 = v65;
      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 12) = 2080;
      uint64_t v77 = *(void *)&v103[(void)v72];
      if (!v77)
      {
LABEL_31:
        id v90 = v106;

        __break(1u);
        return;
      }
      uint64_t v78 = v100;
      v92(v100, v77 + OBJC_IVAR____TtC12HeadGestures9HGSession_id, v71);
      uint64_t v79 = sub_250C1DCE8();
      unint64_t v81 = v80;
      ((void (*)(void, char *))v91[0])(v78, v71);
      uint64_t v108 = sub_250BE1D68(v79, v81, &v110);
      sub_250C1DA48();
      uint64_t v82 = (char *)v106;

      swift_bridgeObjectRelease();
      *(_WORD *)(v66 + 22) = 2080;
      id v83 = *v96;
      uint64_t v84 = sub_250BDF8C8();
      unint64_t v86 = v85;

      uint64_t v108 = sub_250BE1D68(v84, v86, &v110);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      os_log_t v87 = v95;
      _os_log_impl(&dword_250BD9000, v95, (os_log_type_t)v99, "[HGManager]%s: starting new session %s with config: %s", (uint8_t *)v66, 0x20u);
      uint64_t v88 = v94;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v88, -1, -1);
      MEMORY[0x2533853C0](v66, -1, -1);

      ((void (*)(uint64_t, uint64_t))v12[1])(v101, v104);
      uint64_t v19 = v97;
      uint64_t v59 = (uint64_t)v103;
      BOOL v62 = v82;
    }
    else
    {

      ((void (*)(uint64_t, uint8_t *))v12[1])(v61, v11);
    }
    if (*(void *)&a1[v59])
    {
      uint64_t v89 = MEMORY[0x253385440](&v62[OBJC_IVAR___HGManagerInternal_delegate]);
      swift_retain();
      sub_250BE7B88(v89);
      swift_release();
      swift_unknownObjectRelease();
      a1[v19] = 2;
      return;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
LABEL_15:
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_269AFCA38);
  unint64_t v41 = a1;
  uint64_t v42 = sub_250C1D388();
  os_log_type_t v43 = sub_250C1D958();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    uint64_t v46 = v17;
    uint64_t v107 = (char *)v45;
    uint64_t v104 = (uint64_t)v44;
    *(_DWORD *)uint64_t v44 = 136315138;
    v109[0] = v45;
    uint64_t v103 = (char *)(v44 + 4);
    uint64_t v47 = &v41[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    uint64_t v48 = v105;
    uint64_t v49 = v106;
    ((void (*)(uint64_t *, char *, char *))v106[2])(v105, v47, v17);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v50 = sub_250C1DCE8();
    unint64_t v52 = v51;
    ((void (*)(uint64_t *, char *))v49[1])(v48, v46);
    uint64_t v110 = sub_250BE1D68(v50, v52, v109);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    uint64_t v53 = v104;
    _os_log_impl(&dword_250BD9000, v42, v43, "[HGManager]%s: Received impatient start, will restart once HG fully stopped", (uint8_t *)v104, 0xCu);
    uint64_t v54 = v107;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v54, -1, -1);
    MEMORY[0x2533853C0](v53, -1, -1);
  }
  else
  {
  }
  v41[OBJC_IVAR___HGManagerInternal_impatientStart] = 1;
}

void sub_250C0CB90(uint64_t a1, uint64_t a2)
{
  uint64_t v83 = a1;
  uint64_t v84 = a2;
  uint64_t v88 = sub_250C1D348();
  uint64_t v3 = *(void *)(v88 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v88);
  unint64_t v81 = (char *)v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v89 = (char *)v74 - v6;
  uint64_t v7 = sub_250C1D3A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v91 = (char *)v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)v74 - v11;
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
  uint64_t v14 = *(void (**)(char *, void *, uint64_t))(v8 + 16);
  id v90 = (void *)v13;
  os_log_t v87 = v14;
  ((void (*)(char *))v14)(v12);
  uint64_t v15 = v2;
  uint64_t v16 = sub_250C1D388();
  os_log_type_t v17 = sub_250C1D958();
  BOOL v18 = os_log_type_enabled(v16, v17);
  p_inst_props = &OBJC_PROTOCOL___MLFeatureProvider.inst_props;
  uint64_t v82 = v3;
  if (v18)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v86 = v7;
    uint64_t v21 = v20;
    uint64_t v80 = swift_slowAlloc();
    v93[0] = v80;
    *(_DWORD *)uint64_t v21 = 136315650;
    uint64_t v85 = v8;
    uint64_t v79 = (void (*)(char *, uint64_t))(v21 + 4);
    unint64_t v22 = &v15[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    uint64_t v23 = v89;
    uint64_t v24 = v22;
    uint64_t v25 = v88;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v89, v24, v88);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v26 = sub_250C1DCE8();
    uint64_t v27 = v25;
    unint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v23, v27);
    v94[0] = sub_250BE1D68(v26, v29, v93);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    v94[0] = sub_250BE1D68(0x74697728706F7473, 0xEB00000000293A68, v93);
    sub_250C1DA48();
    *(_WORD *)(v21 + 22) = 2080;
    v94[0] = sub_250BE1D68(*(void *)&aStopped_1[8 * v15[OBJC_IVAR___HGManagerInternal_status]], qword_250C20F48[v15[OBJC_IVAR___HGManagerInternal_status]], v93);
    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___MLFeatureProvider + 56);
    uint64_t v8 = v85;
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v16, v17, "[HGManager]%s: %s status: %s", (uint8_t *)v21, 0x20u);
    uint64_t v30 = v80;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v30, -1, -1);
    uint64_t v31 = v21;
    uint64_t v7 = v86;
    MEMORY[0x2533853C0](v31, -1, -1);
  }
  else
  {
  }
  unint64_t v32 = *(void (**)(char *, uint64_t))(v8 + 8);
  v32(v12, v7);
  uint64_t v33 = *(void **)&v15[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v33, sel_lock);
  double v34 = p_inst_props[307];
  uint64_t v35 = v91;
  if (*((unsigned char *)&v34->entrysize + (void)v15) && *((unsigned char *)&v34->entrysize + (void)v15) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    uint64_t v80 = (uint64_t)v34;
    v87(v35, v90, v7);
    unint64_t v51 = v15;
    unint64_t v52 = sub_250C1D388();
    int v53 = sub_250C1D958();
    uint64_t v54 = &unk_269AFC000;
    if (os_log_type_enabled(v52, (os_log_type_t)v53))
    {
      int v77 = v53;
      os_log_t v78 = v52;
      uint64_t v79 = v32;
      id v90 = v33;
      uint64_t v85 = v8;
      uint64_t v86 = v7;
      uint64_t v55 = swift_slowAlloc();
      uint64_t v76 = swift_slowAlloc();
      v94[0] = v76;
      *(_DWORD *)uint64_t v55 = 136315394;
      os_log_t v87 = (void (*)(char *, void *, uint64_t))(v55 + 4);
      uint64_t v56 = &v51[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      uint64_t v57 = v82;
      uint64_t v58 = v88;
      uint64_t v59 = v89;
      unint64_t v75 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
      v75(v89, v56, v88);
      v74[1] = sub_250C0F71C((unint64_t *)&qword_269AF9358);
      uint64_t v60 = sub_250C1DCE8();
      unint64_t v62 = v61;
      uint64_t v89 = *(char **)(v57 + 8);
      ((void (*)(char *, uint64_t))v89)(v59, v58);
      uint64_t v92 = sub_250BE1D68(v60, v62, v94);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2080;
      uint64_t v63 = *(void *)&v51[OBJC_IVAR___HGManagerInternal_session];
      if (!v63)
      {
LABEL_21:

        __break(1u);
        return;
      }
      uint64_t v64 = v81;
      v75(v81, (char *)(v63 + OBJC_IVAR____TtC12HeadGestures9HGSession_id), v58);
      uint64_t v65 = sub_250C1DCE8();
      unint64_t v67 = v66;
      ((void (*)(char *, uint64_t))v89)(v64, v58);
      uint64_t v92 = sub_250BE1D68(v65, v67, v94);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      os_log_t v68 = v78;
      _os_log_impl(&dword_250BD9000, v78, (os_log_type_t)v77, "[HGManager]%s: stopping session %s", (uint8_t *)v55, 0x16u);
      uint64_t v69 = v76;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v69, -1, -1);
      MEMORY[0x2533853C0](v55, -1, -1);

      v79(v91, v86);
      uint64_t v33 = v90;
      uint64_t v54 = (void *)&unk_269AFC000;
    }
    else
    {

      v32(v35, v7);
    }
    v15[v80] = 1;
    objc_msgSend(v33, sel_unlock);
    if (*(void *)&v51[v54[318]])
    {
      uint64_t v70 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v71 = (void *)swift_allocObject();
      uint64_t v73 = v83;
      uint64_t v72 = v84;
      v71[2] = v70;
      v71[3] = v73;
      v71[4] = v72;
      swift_retain();
      swift_retain();
      sub_250BEB02C(v73);
      sub_250BE80B0((uint64_t)sub_250C0F690, (uint64_t)v71);
      swift_release();
      swift_release();
      swift_release();
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  char v36 = sub_250C1DCF8();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_12;
  }
  unint64_t v37 = v15;
  os_log_t v38 = sub_250C1D388();
  os_log_type_t v39 = sub_250C1D948();
  if (os_log_type_enabled(v38, v39))
  {
    char v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)char v40 = 136315138;
    v94[0] = v41;
    id v90 = v33;
    uint64_t v91 = (char *)(v40 + 4);
    uint64_t v42 = &v37[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    uint64_t v43 = v82;
    uint64_t v44 = v89;
    uint64_t v45 = v42;
    uint64_t v46 = v88;
    (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v89, v45, v88);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v47 = sub_250C1DCE8();
    uint64_t v48 = v46;
    unint64_t v50 = v49;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v48);
    uint64_t v92 = sub_250BE1D68(v47, v50, v94);
    sub_250C1DA48();

    uint64_t v33 = v90;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v38, v39, "[HGManager]%s: NO LIVE SESSION, ignore command...", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v41, -1, -1);
    MEMORY[0x2533853C0](v40, -1, -1);
  }
  else
  {
  }
  objc_msgSend(v33, sel_unlock);
}

void sub_250C0D678(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v69 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF99C0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  os_log_t v68 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v63 - v8;
  uint64_t v10 = sub_250C1D348();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v65 = (char *)&v63 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v63 - v18;
  MEMORY[0x270FA5388](v17);
  unint64_t v67 = (char *)&v63 - v20;
  uint64_t v21 = a1 + 16;
  swift_beginAccess();
  uint64_t v22 = MEMORY[0x253385440](a1 + 16);
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    id v24 = *(id *)(v22 + OBJC_IVAR___HGManagerInternal_lock);

    objc_msgSend(v24, sel_lock);
    sub_250C0DFA0(a1);
    objc_msgSend(v24, sel_unlock);
  }
  if (a2)
  {
    unint64_t v66 = v14;
    swift_retain();
    a2();
    swift_beginAccess();
    uint64_t v25 = MEMORY[0x253385440](v21);
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      uint64_t v27 = v25 + OBJC_IVAR___HGManagerInternal_id;
      swift_beginAccess();
      unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v28(v9, v27, v10);

      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      uint64_t v29 = v11;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
      {
        uint64_t v30 = v67;
        (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v67, v9, v10);
        if (qword_269AF8F80 != -1) {
          swift_once();
        }
        uint64_t v31 = sub_250C1D3A8();
        __swift_project_value_buffer(v31, (uint64_t)qword_269AFCA38);
        v28(v19, (uint64_t)v30, v10);
        unint64_t v32 = sub_250C1D388();
        os_log_type_t v33 = sub_250C1D938();
        if (os_log_type_enabled(v32, v33))
        {
          double v34 = (uint8_t *)swift_slowAlloc();
          uint64_t v64 = swift_slowAlloc();
          v72[0] = v64;
          uint64_t v63 = v34;
          *(_DWORD *)double v34 = 136315138;
          sub_250C0F71C((unint64_t *)&qword_269AF9358);
          uint64_t v35 = sub_250C1DCE8();
          v71[6] = sub_250BE1D68(v35, v36, v72);
          sub_250C1DA48();
          swift_bridgeObjectRelease();
          uint64_t v11 = v29;
          unint64_t v37 = *(void (**)(char *, uint64_t))(v29 + 8);
          v37(v19, v10);
          os_log_t v38 = v63;
          _os_log_impl(&dword_250BD9000, v32, v33, "[HGManager]%s: Client provided stop completion handler finish execution.", v63, 0xCu);
          uint64_t v39 = v64;
          swift_arrayDestroy();
          MEMORY[0x2533853C0](v39, -1, -1);
          MEMORY[0x2533853C0](v38, -1, -1);
          sub_250BEB01C((uint64_t)a2);

          v37(v67, v10);
        }
        else
        {
          uint64_t v57 = v30;
          sub_250BEB01C((uint64_t)a2);

          uint64_t v11 = v29;
          uint64_t v58 = *(void (**)(char *, uint64_t))(v29 + 8);
          v58(v19, v10);
          v58(v57, v10);
        }
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v29 = v11;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    }
    sub_250BEB01C((uint64_t)a2);
    sub_250C0FC84((uint64_t)v9);
    uint64_t v11 = v29;
LABEL_12:
    uint64_t v14 = v66;
  }
  swift_beginAccess();
  char v40 = (unsigned __int8 *)MEMORY[0x253385440](v21);
  if (!v40) {
    return;
  }
  int v41 = v40[OBJC_IVAR___HGManagerInternal_impatientStart];

  if (v41 != 1) {
    return;
  }
  swift_beginAccess();
  uint64_t v42 = MEMORY[0x253385440](v21);
  if (v42)
  {
    uint64_t v43 = (void *)v42;
    uint64_t v44 = v42 + OBJC_IVAR___HGManagerInternal_id;
    swift_beginAccess();
    uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v46 = v68;
    v45(v68, v44, v10);

    uint64_t v47 = (uint64_t)v46;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v46, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v46, 1, v10) != 1)
    {
      uint64_t v48 = v65;
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v65, v47, v10);
      if (qword_269AF8F80 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_250C1D3A8();
      __swift_project_value_buffer(v49, (uint64_t)qword_269AFCA38);
      v45(v14, (uint64_t)v48, v10);
      unint64_t v50 = sub_250C1D388();
      os_log_type_t v51 = sub_250C1D958();
      if (os_log_type_enabled(v50, v51))
      {
        unint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v69 = swift_slowAlloc();
        v71[0] = v69;
        *(_DWORD *)unint64_t v52 = 136315138;
        os_log_t v68 = (char *)(v52 + 4);
        sub_250C0F71C((unint64_t *)&qword_269AF9358);
        uint64_t v53 = sub_250C1DCE8();
        uint64_t v70 = sub_250BE1D68(v53, v54, v71);
        sub_250C1DA48();
        swift_bridgeObjectRelease();
        uint64_t v55 = *(void (**)(char *, uint64_t))(v11 + 8);
        v55(v14, v10);
        _os_log_impl(&dword_250BD9000, v50, v51, "[HGManager]%s: Restarting HG due to impatientStart request received.", v52, 0xCu);
        uint64_t v56 = v69;
        swift_arrayDestroy();
        MEMORY[0x2533853C0](v56, -1, -1);
        MEMORY[0x2533853C0](v52, -1, -1);

        v55(v65, v10);
      }
      else
      {

        uint64_t v59 = *(void (**)(char *, uint64_t))(v11 + 8);
        v59(v14, v10);
        v59(v48, v10);
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v47 = (uint64_t)v68;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v68, 1, 1, v10);
  }
  sub_250C0FC84(v47);
LABEL_25:
  swift_beginAccess();
  uint64_t v60 = MEMORY[0x253385440](v21);
  if (v60)
  {
    unint64_t v61 = (void *)v60;
    sub_250C0B9B0();
  }
  swift_beginAccess();
  unint64_t v62 = (unsigned char *)MEMORY[0x253385440](v21);
  if (v62)
  {
    v62[OBJC_IVAR___HGManagerInternal_impatientStart] = 0;
  }
}

void sub_250C0DFA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF99C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250C1D348();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = a1 + 16;
  swift_beginAccess();
  uint64_t v13 = (char *)MEMORY[0x253385440](v12);
  if (v13)
  {
    *(void *)&v13[OBJC_IVAR___HGManagerInternal_session] = 0;

    swift_release();
  }
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x253385440](v12);
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_10;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = v14 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v17(v4, v16, v5);

  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_10:
    sub_250C0FC84((uint64_t)v4);
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_250C1D3A8();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_269AFCA38);
  v17(v9, (uint64_t)v11, v5);
  uint64_t v20 = sub_250C1D388();
  os_log_type_t v21 = sub_250C1D958();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v34 = v19;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v33 = swift_slowAlloc();
    v36[0] = v33;
    *(_DWORD *)uint64_t v23 = 136315138;
    unint64_t v32 = v23 + 4;
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v24 = sub_250C1DCE8();
    uint64_t v35 = sub_250BE1D68(v24, v25, v36);
    sub_250C1DA48();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v9, v5);
    _os_log_impl(&dword_250BD9000, v20, v21, "[HGManager]%s: HG ALL STOPPED", v23, 0xCu);
    uint64_t v27 = v33;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v27, -1, -1);
    MEMORY[0x2533853C0](v23, -1, -1);
  }
  else
  {
    uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
    v26(v9, v5);
  }

  unint64_t v28 = sub_250C1D388();
  os_log_type_t v29 = sub_250C1D958();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_250BD9000, v28, v29, "==========⏹️===========", v30, 2u);
    MEMORY[0x2533853C0](v30, -1, -1);
  }

  v26(v11, v5);
LABEL_15:
  swift_beginAccess();
  uint64_t v31 = (unsigned char *)MEMORY[0x253385440](v12);
  if (v31)
  {
    v31[OBJC_IVAR___HGManagerInternal_status] = 0;
  }
}

id sub_250C0E53C(int a1)
{
  int v31 = a1;
  uint64_t v2 = sub_250C1D348();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250C1D3A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v6, (uint64_t)qword_269AFCA38);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = v1;
  uint64_t v12 = sub_250C1D388();
  os_log_type_t v13 = sub_250C1D958();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v33[0] = v30;
    *(_DWORD *)uint64_t v15 = 136315650;
    v27[1] = v15 + 4;
    int v29 = v14;
    uint64_t v16 = &v11[OBJC_IVAR___HGManagerInternal_id];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v16, v2);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v17 = sub_250C1DCE8();
    os_log_t v28 = v12;
    unint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v32 = sub_250BE1D68(v17, v19, v33);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v32 = sub_250BE1D68(0xD00000000000001BLL, 0x8000000250C23E20, v33);
    sub_250C1DA48();
    *(_WORD *)(v15 + 22) = 2080;
    char v20 = v31;
    if (v31) {
      uint64_t v21 = 1702131021;
    }
    else {
      uint64_t v21 = 0x6574756D6E55;
    }
    if (v31) {
      unint64_t v22 = 0xE400000000000000;
    }
    else {
      unint64_t v22 = 0xE600000000000000;
    }
    uint64_t v32 = sub_250BE1D68(v21, v22, v33);
    sub_250C1DA48();
    swift_bridgeObjectRelease();
    os_log_t v23 = v28;
    _os_log_impl(&dword_250BD9000, v28, (os_log_type_t)v29, "[HGManager]%s: %s trying to %s", (uint8_t *)v15, 0x20u);
    uint64_t v24 = v30;
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v24, -1, -1);
    MEMORY[0x2533853C0](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    char v20 = v31;
  }
  unint64_t v25 = *(void **)&v11[OBJC_IVAR___HGManagerInternal_lock];
  objc_msgSend(v25, sel_lock);
  sub_250C0E9A0(v11, v20 & 1);
  return objc_msgSend(v25, sel_unlock);
}

void sub_250C0E9A0(char *a1, int a2)
{
  LODWORD(v54) = a2;
  uint64_t v53 = sub_250C1D348();
  uint64_t v4 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D3A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)&a1[OBJC_IVAR___HGManagerInternal_session];
  if (v11)
  {
    uint64_t v12 = *(void *)(v11 + OBJC_IVAR____TtC12HeadGestures9HGSession_audioPlayer);
    if (v12)
    {
      os_log_type_t v13 = (BOOL *)(*(void *)(v12 + 16) + OBJC_IVAR___HGAudioFeedbackConfigurationInternal_enableAudioFeedback);
      swift_beginAccess();
      *os_log_type_t v13 = (v54 & 1) == 0;
    }
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
    uint64_t v15 = a1;
    uint64_t v16 = sub_250C1D388();
    os_log_type_t v17 = sub_250C1D958();
    int v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v19 = swift_slowAlloc();
      uint64_t v52 = v2;
      uint64_t v20 = v19;
      os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = v51;
      *(_DWORD *)uint64_t v20 = 136315394;
      v47[1] = v20 + 4;
      os_log_t v49 = v16;
      uint64_t v21 = &v15[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
      int v48 = v18;
      os_log_t v23 = v6;
      uint64_t v24 = v6;
      uint64_t v25 = v53;
      v22(v24, v21, v53);
      sub_250C0F71C((unint64_t *)&qword_269AF9358);
      uint64_t v26 = sub_250C1DCE8();
      unint64_t v50 = (uint8_t *)v8;
      uint64_t v27 = v26;
      unint64_t v29 = v28;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v25);
      uint64_t v56 = sub_250BE1D68(v27, v29, (uint64_t *)&v57);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      if (v54) {
        uint64_t v30 = 0x646574754DLL;
      }
      else {
        uint64_t v30 = 0x646574756D6E55;
      }
      if (v54) {
        unint64_t v31 = 0xE500000000000000;
      }
      else {
        unint64_t v31 = 0xE700000000000000;
      }
      uint64_t v56 = sub_250BE1D68(v30, v31, (uint64_t *)&v57);
      sub_250C1DA48();
      swift_bridgeObjectRelease();
      os_log_t v32 = v49;
      _os_log_impl(&dword_250BD9000, v49, (os_log_type_t)v48, "[HGManager]%s: AudioFeedback %s", (uint8_t *)v20, 0x16u);
      uint64_t v33 = v51;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v33, -1, -1);
      MEMORY[0x2533853C0](v20, -1, -1);

      (*((void (**)(char *, uint64_t))v50 + 1))(v10, v7);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
  else
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
    uint64_t v34 = a1;
    uint64_t v35 = sub_250C1D388();
    os_log_type_t v36 = sub_250C1D948();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      v55[0] = v54;
      os_log_type_t v51 = v37;
      uint64_t v52 = v2;
      *(_DWORD *)unint64_t v37 = 136315138;
      unint64_t v50 = v37 + 4;
      os_log_t v38 = &v34[OBJC_IVAR___HGManagerInternal_id];
      swift_beginAccess();
      uint64_t v39 = v6;
      char v40 = v6;
      uint64_t v41 = v53;
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v40, v38, v53);
      sub_250C0F71C((unint64_t *)&qword_269AF9358);
      uint64_t v42 = sub_250C1DCE8();
      unint64_t v44 = v43;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v39, v41);
      uint64_t v57 = (uint8_t *)sub_250BE1D68(v42, v44, v55);
      sub_250C1DA48();

      swift_bridgeObjectRelease();
      uint64_t v45 = v51;
      _os_log_impl(&dword_250BD9000, v35, v36, "[HGManager]%s: NO LIVE SESSION, ignore command...", v51, 0xCu);
      uint64_t v46 = v54;
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v46, -1, -1);
      MEMORY[0x2533853C0](v45, -1, -1);
    }
    else
    {
    }
  }
}

id HGManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HGManager.init()()
{
}

id HGManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250C0F1DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR___HGManagerInternal_id;
  swift_beginAccess();
  uint64_t v4 = sub_250C1D348();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_250C0F264()
{
  unint64_t v0 = sub_250C1DC08();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

id sub_250C0F2B0(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_250C1D348();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v2[OBJC_IVAR___HGManagerInternal_id];
  uint64_t v9 = v2;
  sub_250C1D338();
  *(void *)&v9[OBJC_IVAR___HGManagerInternal_session] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = OBJC_IVAR___HGManagerInternal_lock;
  unint64_t v11 = 0x265355000uLL;
  *(void *)&v9[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  v9[OBJC_IVAR___HGManagerInternal_impatientStart] = 0;
  v9[OBJC_IVAR___HGManagerInternal_status] = 0;
  *(void *)&v9[OBJC_IVAR___HGManagerInternal_configuration] = a2;
  swift_unknownObjectWeakAssign();
  uint64_t v12 = qword_269AF8F80;
  id v13 = a2;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_250C1D3A8();
  __swift_project_value_buffer(v14, (uint64_t)qword_269AFCA38);
  uint64_t v15 = v9;
  uint64_t v16 = sub_250C1D388();
  os_log_type_t v17 = sub_250C1D958();
  if (os_log_type_enabled(v16, v17))
  {
    int v18 = v7;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v29 = v27;
    *(_DWORD *)uint64_t v19 = 136315138;
    v26[1] = v19 + 4;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v18, v8, v4);
    sub_250C0F71C((unint64_t *)&qword_269AF9358);
    uint64_t v20 = sub_250C1DCE8();
    unint64_t v22 = v21;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v18, v4);
    uint64_t v28 = sub_250BE1D68(v20, v22, &v29);
    sub_250C1DA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, v16, v17, "[HGManager]%s: Initialized manager", v19, 0xCu);
    uint64_t v23 = v27;
    swift_arrayDestroy();
    unint64_t v11 = 0x265355000;
    MEMORY[0x2533853C0](v23, -1, -1);
    MEMORY[0x2533853C0](v19, -1, -1);
  }
  else
  {
  }
  uint64_t v24 = (objc_class *)type metadata accessor for HGManager();
  v30.receiver = v15;
  v30.super_class = v24;
  return objc_msgSendSuper2(&v30, *(SEL *)(v11 + 3808));
}

uint64_t sub_250C0F610()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250C0F648()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_250C0F690()
{
  sub_250C0D678(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t type metadata accessor for HGManager()
{
  uint64_t result = qword_269AF99A8;
  if (!qword_269AF99A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250C0F6E8()
{
  return sub_250C0F71C((unint64_t *)&qword_269AF9388);
}

uint64_t sub_250C0F71C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_250C1D348();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_250C0F768@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___HGManagerInternal_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_250C0F7D0()
{
  return type metadata accessor for HGManager();
}

uint64_t sub_250C0F7D8()
{
  uint64_t result = sub_250C1D348();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HGManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HGManager);
}

uint64_t dispatch thunk of HGManager.id.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of HGManager.id.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of HGManager.id.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of HGManager.configuration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of HGManager.configuration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of HGManager.configuration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of HGManager.__allocating_init(delegate:config:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of HGManager.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HGManager.stop(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of HGManager.muteAudioFeedback(setting:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

unsigned char *storeEnumTagSinglePayload for HGManager.Status(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x250C0FB84);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGManager.Status()
{
  return &type metadata for HGManager.Status;
}

unint64_t sub_250C0FBC0()
{
  unint64_t result = qword_269AF99B8;
  if (!qword_269AF99B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF99B8);
  }
  return result;
}

uint64_t sub_250C0FC14()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250C0FC4C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_250C0FC5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_250C0FC84(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF99C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250C0FCE4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager9HGCAEvent_timestamp;
  uint64_t v2 = sub_250C1D2F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_250C0FD88()
{
  uint64_t v29 = sub_250C1DDC8();
  uint64_t v28 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41[1] = &type metadata for HGCoreAnalyticsManager.HGCAReport;
  int v3 = (_OWORD *)swift_allocObject();
  uint64_t v39 = v3;
  long long v4 = v0[1];
  v3[1] = *v0;
  v3[2] = v4;
  long long v5 = v0[3];
  v3[3] = v0[2];
  v3[4] = v5;
  sub_250C11180((uint64_t)v0);
  sub_250C1DDA8();
  uint64_t v27 = v2;
  sub_250C1DDB8();
  uint64_t v6 = sub_250C1DB68();
  swift_release();
  swift_retain();
  sub_250C1DBE8();
  if (!v42)
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
LABEL_21:
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
    return (uint64_t)v8;
  }
  uint64_t v7 = v41;
  uint64_t v8 = (void *)MEMORY[0x263F8EE80];
  unint64_t v31 = v41;
  uint64_t v32 = v6;
  uint64_t v30 = MEMORY[0x263F8EE58] + 8;
  while (1)
  {
    uint64_t v9 = (uint64_t)v39;
    uint64_t v10 = v40;
    v37[0] = v39;
    v37[1] = v40;
    sub_250BE3F48(v7, v38);
    uint64_t v34 = (void *)v9;
    uint64_t v35 = v10;
    sub_250BE4020((uint64_t)v38, (uint64_t)v36);
    if (v10) {
      break;
    }
    sub_250C111EC((uint64_t)v37);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
LABEL_4:
    sub_250C1DBE8();
    if (!v42) {
      goto LABEL_21;
    }
  }
  swift_bridgeObjectRetain_n();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  uint64_t v34 = (void *)v9;
  uint64_t v35 = v10;
  sub_250BE4020((uint64_t)v38, (uint64_t)v36);
  swift_bridgeObjectRelease();
  sub_250C1124C();
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_250C111EC((uint64_t)v37);
    goto LABEL_4;
  }
  id v11 = v33;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v34 = v8;
  unint64_t v14 = sub_250C1AFBC(v9, v10);
  uint64_t v15 = v8[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (!__OFADD__(v15, v16))
  {
    char v18 = v13;
    if (v8[3] >= v17)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v8 = v34;
        if ((v13 & 1) == 0) {
          goto LABEL_17;
        }
      }
      else
      {
        sub_250C130C0();
        uint64_t v8 = v34;
        if ((v18 & 1) == 0) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      sub_250C11B7C(v17, isUniquelyReferenced_nonNull_native);
      unint64_t v19 = sub_250C1AFBC(v9, v10);
      if ((v18 & 1) != (v20 & 1)) {
        goto LABEL_24;
      }
      unint64_t v14 = v19;
      uint64_t v8 = v34;
      if ((v18 & 1) == 0)
      {
LABEL_17:
        v8[(v14 >> 6) + 8] |= 1 << v14;
        unint64_t v22 = (uint64_t *)(v8[6] + 16 * v14);
        *unint64_t v22 = v9;
        v22[1] = v10;
        *(void *)(v8[7] + 8 * v14) = v11;
        uint64_t v23 = v8[2];
        BOOL v24 = __OFADD__(v23, 1);
        uint64_t v25 = v23 + 1;
        if (v24) {
          goto LABEL_23;
        }
        v8[2] = v25;
        swift_bridgeObjectRetain();
        goto LABEL_19;
      }
    }
    uint64_t v21 = v8[7];

    *(void *)(v21 + 8 * v14) = v11;
LABEL_19:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_250C111EC((uint64_t)v37);
    uint64_t v7 = v31;
    goto LABEL_4;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_250C1DD18();
  __break(1u);
  return result;
}

void sub_250C1014C()
{
  type metadata accessor for HGCoreAnalyticsManager();
  uint64_t v0 = (void *)swift_allocObject();
  id v1 = objc_msgSend(self, sel_processInfo);
  id v2 = objc_msgSend(v1, sel_processName);

  uint64_t v3 = sub_250C1D6D8();
  uint64_t v5 = v4;

  v0[2] = v3;
  v0[3] = v5;
  v0[4] = MEMORY[0x263F8EE78];
  qword_269AFCA00 = (uint64_t)v0;
}

void sub_250C101F0()
{
  if (sub_250C10440())
  {
    id v1 = (void *)sub_250C1D6A8();
    sub_250C1124C();
    id v2 = (void *)sub_250C1D638();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    *(void *)(v0 + 32) = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_250C1D3A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269AFCA38);
    uint64_t v4 = sub_250C1D388();
    os_log_type_t v5 = sub_250C1D958();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_250BD9000, v4, v5, "[CoreAnalytics] CAEvent sent...", v6, 2u);
      MEMORY[0x2533853C0](v6, -1, -1);
    }
  }
  else
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_250C1D3A8();
    __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
    oslog = sub_250C1D388();
    os_log_type_t v8 = sub_250C1D958();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_250BD9000, oslog, v8, "[CoreAnalytics] CAEvent is missing information. skip sending...", v9, 2u);
      MEMORY[0x2533853C0](v9, -1, -1);
    }
  }
}

uint64_t sub_250C10440()
{
  uint64_t v78 = MEMORY[0x263F8EE78];
  unint64_t v79 = MEMORY[0x263F8EE78];
  unint64_t v77 = MEMORY[0x263F8EE78];
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 32);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_250C1DB98();
    if (v5) {
      goto LABEL_3;
    }
LABEL_43:
    swift_bridgeObjectRelease_n();
    goto LABEL_44;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v5) {
    goto LABEL_43;
  }
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_250C1DB98();
    uint64_t v20 = result;
    if (result) {
      goto LABEL_36;
    }
    goto LABEL_49;
  }
  uint64_t v2 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  do
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      uint64_t v3 = (void *)MEMORY[0x253384940](v2, v4);
    }
    else
    {
      uint64_t v3 = *(void **)(v4 + 8 * v2 + 32);
      swift_retain();
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
    uint64_t v11 = swift_dynamicCastClass();
    if (v11)
    {
      uint64_t v10 = v11;
      swift_release();
      uint64_t v9 = v10;
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
    uint64_t v12 = swift_dynamicCastClass();
    if (v12)
    {
      uint64_t v13 = v12;
      swift_release();
      uint64_t v8 = v13;
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
    uint64_t v14 = swift_dynamicCastClass();
    if (v14)
    {
      if (!v7)
      {
        uint64_t v7 = v14;
        goto LABEL_6;
      }
LABEL_18:
      swift_release();
      goto LABEL_6;
    }
    type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
    uint64_t v15 = swift_dynamicCastClass();
    if (v15)
    {
      if (v6) {
        goto LABEL_18;
      }
      uint64_t v6 = v15;
    }
    else
    {
      type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
      if (swift_dynamicCastClass())
      {
        uint64_t v16 = swift_retain();
        MEMORY[0x253384610](v16);
        uint64_t v17 = v79;
      }
      else
      {
        type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
        if (swift_dynamicCastClass())
        {
          uint64_t v18 = swift_retain();
          MEMORY[0x253384610](v18);
          uint64_t v17 = v78;
        }
        else
        {
          type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
          if (!swift_dynamicCastClass()) {
            goto LABEL_18;
          }
          uint64_t v19 = swift_retain();
          MEMORY[0x253384610](v19);
          uint64_t v17 = v77;
        }
      }
      if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_250C1D838();
      }
      sub_250C1D858();
      sub_250C1D828();
      swift_release();
    }
LABEL_6:
    ++v2;
  }
  while (v5 != v2);
  swift_bridgeObjectRelease_n();
  if (!v9 || !v8 || !v6 || !v7)
  {
LABEL_44:
    uint64_t v27 = MEMORY[0x263F8EE80];
    if (!*(void *)(MEMORY[0x263F8EE80] + 16)) {
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_250C1D2D8();
  sub_250C1D2D8();
  unint64_t v75 = (char *)v7;
  sub_250C1D2D8();
  unint64_t v0 = v77;
  id v1 = (void *)(v77 >> 62);
  if (v77 >> 62) {
    goto LABEL_48;
  }
  uint64_t v20 = *(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain_n();
  if (v20)
  {
LABEL_36:
    if (v20 < 1)
    {
      __break(1u);
LABEL_80:
      __break(1u);
      return result;
    }
    uint64_t v22 = 0;
    double v23 = 0.0;
    uint64_t v2 = (uint64_t)&unk_269AFC000;
    do
    {
      while ((v0 & 0xC000000000000001) == 0)
      {
        uint64_t v24 = *(void *)(v0 + 32 + 8 * v22++);
        double v23 = v23
            + *(double *)(v24
                        + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate);
        if (v22 == v20) {
          goto LABEL_49;
        }
      }
      uint64_t v25 = MEMORY[0x253384940](v22++, v0);
      double v26 = *(double *)(v25
                      + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager21HGCASamplingRateEvent_currentSamplingRate);
      swift_unknownObjectRelease();
      double v23 = v23 + v26;
    }
    while (v22 != v20);
  }
LABEL_49:
  swift_bridgeObjectRelease_n();
  if (v1) {
    goto LABEL_64;
  }
  uint64_t v28 = *(void **)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (2)
  {
    uint64_t v29 = (char *)v79;
    if (v79 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_250C1DB98();
      swift_bridgeObjectRelease();
    }
    uint64_t v30 = (void *)v78;
    unint64_t v31 = v75;
    if (!((unint64_t)v78 >> 62))
    {
      uint64_t v32 = *(void *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain_n();
      if (!v32) {
        break;
      }
      goto LABEL_55;
    }
    if (v78 < 0) {
      uint64_t v29 = (char *)v78;
    }
    else {
      uint64_t v29 = (char *)(v78 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain_n();
    unint64_t v31 = v75;
    uint64_t result = sub_250C1DB98();
    uint64_t v32 = result;
    if (result)
    {
LABEL_55:
      if (v32 < 1) {
        goto LABEL_80;
      }
      uint64_t v2 = 0;
      uint64_t v29 = 0;
      id v1 = (void *)(v78 & 0xC000000000000001);
      uint64_t v3 = &unk_269AFC000;
      while (1)
      {
        uint64_t v33 = v1 ? MEMORY[0x253384940](v2, v78) : swift_retain();
        uint64_t v34 = *(void *)(v33
                        + OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAInterpolatedDataEvent_intepolationAmount);
        swift_release();
        BOOL v35 = __OFADD__(v29, v34);
        v29 += v34;
        if (v35) {
          break;
        }
        if (v32 == ++v2)
        {
          swift_bridgeObjectRelease_n();
          unint64_t v31 = v75;
          goto LABEL_70;
        }
      }
      __break(1u);
LABEL_64:
      swift_bridgeObjectRetain();
      uint64_t v28 = (void *)sub_250C1DB98();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease_n();
LABEL_70:
  uint64_t v36 = *(void *)&v31[OBJC_IVAR____TtCC12HeadGestures22HGCoreAnalyticsManager25HGCAGestureDetectionEvent_detectedGesture];
  if (v36 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = (char *)sub_250C1D6A8();
    swift_bridgeObjectRelease();
    uint64_t v28 = (void *)sub_250C1D878();
    uint64_t v30 = (void *)sub_250C1D8D8();
    uint64_t v2 = sub_250C1D878();
    uint64_t v3 = (void *)sub_250C1D878();
    unint64_t v31 = (char *)sub_250C1D8D8();
    id v1 = (void *)sub_250C1D878();
    uint64_t v36 = sub_250C1D878();
    uint64_t v80 = v29;
    unint64_t v81 = v28;
    uint64_t v82 = v30;
    uint64_t v83 = v2;
    uint64_t v84 = v3;
    uint64_t v85 = v31;
    uint64_t v86 = v1;
    uint64_t v87 = v36;
    if (qword_269AF8F80 == -1) {
      goto LABEL_72;
    }
  }
  swift_once();
LABEL_72:
  uint64_t v37 = sub_250C1D3A8();
  __swift_project_value_buffer(v37, (uint64_t)qword_269AFCA38);
  os_log_t v38 = v29;
  id v39 = v28;
  id v40 = v30;
  id v41 = (id)v2;
  id v42 = v3;
  unint64_t v43 = v31;
  id v44 = v1;
  id v45 = (id)v36;
  unint64_t v74 = v38;
  id v46 = v39;
  id v47 = v40;
  id v48 = v41;
  id v49 = v42;
  uint64_t v73 = v43;
  id v50 = v44;
  id v72 = v45;
  os_log_type_t v51 = sub_250C1D388();
  os_log_type_t v52 = sub_250C1D938();
  if (os_log_type_enabled(v51, v52))
  {
    os_log_type_t type = v52;
    uint64_t v53 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    uint64_t v76 = v69;
    buf = v53;
    *(_DWORD *)uint64_t v53 = 136315138;
    unint64_t v67 = v74;
    id v66 = v46;
    id v64 = v47;
    id v63 = v48;
    uint64_t v54 = v50;
    id v55 = v49;
    id v71 = v49;
    uint64_t v56 = v73;
    id v57 = v54;
    log = v51;
    id v58 = v47;
    id v59 = v46;
    id v60 = v72;
    uint64_t v61 = sub_250C1D728();
    sub_250BE1D68(v61, v62, &v76);
    sub_250C1DA48();

    id v46 = v59;
    id v47 = v58;

    id v49 = v71;
    id v50 = v54;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250BD9000, log, type, "[Core Analytics] sending report: %s", buf, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533853C0](v69, -1, -1);
    MEMORY[0x2533853C0](buf, -1, -1);
  }
  else
  {
  }
  uint64_t v27 = sub_250C0FD88();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  if (!*(void *)(v27 + 16))
  {
LABEL_45:
    swift_bridgeObjectRelease();
    uint64_t v27 = 0;
  }
LABEL_46:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v27;
}

uint64_t sub_250C10E54()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGCoreAnalyticsManager()
{
  return self;
}

uint64_t sub_250C10EB8()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF99C8);
}

uint64_t sub_250C10EE0()
{
  uint64_t result = sub_250C1D2F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_250C10F70()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAStartEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF99D8);
}

uint64_t sub_250C10F9C()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAStopEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF99E8);
}

uint64_t sub_250C10FC4()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAMotionDataReceivedEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF99F8);
}

uint64_t sub_250C10FEC()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAPipelineResetEventEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9A08);
}

uint64_t sub_250C11014()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250C1104C()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAGestureDetectionEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9A18);
}

uint64_t sub_250C11074()
{
  return sub_250C110D4();
}

uint64_t sub_250C11084()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCAInterpolatedDataEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9A28);
}

uint64_t sub_250C110AC()
{
  return type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(0);
}

uint64_t type metadata accessor for HGCoreAnalyticsManager.HGCASamplingRateEvent(uint64_t a1)
{
  return sub_250BDC4E0(a1, (uint64_t *)&unk_269AF9A38);
}

uint64_t sub_250C110D4()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250C11110()
{
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_250C11180(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  unint64_t v4 = *(void **)(a1 + 24);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void **)(a1 + 56);
  id v9 = *(id *)a1;
  id v10 = v2;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  return a1;
}

uint64_t sub_250C111EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_250C1124C()
{
  unint64_t result = qword_269AF9A50;
  if (!qword_269AF9A50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF9A50);
  }
  return result;
}

uint64_t sub_250C1128C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9960);
  uint64_t v6 = sub_250C1DBB8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v2;
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
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
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
    uint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    double v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if (a2)
    {
      sub_250BE3F48(v23, v35);
    }
    else
    {
      sub_250BE4020((uint64_t)v23, (uint64_t)v35);
      id v24 = v22;
    }
    sub_250C1DD78();
    type metadata accessor for CFString(0);
    sub_250C1375C();
    sub_250C1D368();
    uint64_t result = sub_250C1DD98();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v7 + 48) + 8 * v15) = v22;
    uint64_t result = (uint64_t)sub_250BE3F48(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  uint64_t v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C11598(uint64_t a1, char a2)
{
  return sub_250C115B0(a1, a2, &qword_269AF9A80);
}

uint64_t sub_250C115A4(uint64_t a1, char a2)
{
  return sub_250C115B0(a1, a2, &qword_269AF9A78);
}

uint64_t sub_250C115B0(uint64_t a1, char a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_250C1DBB8();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    char v31 = a2;
    int64_t v9 = 0;
    uint64_t v32 = (void *)(v6 + 64);
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
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v9 << 6);
      }
      else
      {
        int64_t v18 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v6 + 64;
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v32[v18];
        ++v9;
        if (!v19)
        {
          int64_t v9 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v32[v9];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v4 = v3;
                goto LABEL_38;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v6 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v32 = -1 << v30;
              }
              unint64_t v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v19 = v32[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v9 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v9 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v32[v9];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v9 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }
      char v21 = *(unsigned char *)(*(void *)(v6 + 48) + v17);
      char v22 = *(unsigned char *)(*(void *)(v6 + 56) + v17);
      sub_250C1DD78();
      sub_250C1DD88();
      uint64_t result = sub_250C1DD98();
      uint64_t v23 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(unsigned char *)(*(void *)(v8 + 48) + v15) = v21;
      *(unsigned char *)(*(void *)(v8 + 56) + v15) = v22;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_250C11874(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9988);
  uint64_t result = sub_250C1DBB8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v36 = a2;
    int64_t v8 = 0;
    os_log_t v38 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v37 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v37) {
          goto LABEL_31;
        }
        unint64_t v18 = v38[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v37) {
            goto LABEL_31;
          }
          unint64_t v18 = v38[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v37)
            {
LABEL_31:
              if ((v36 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *os_log_t v38 = -1 << v35;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v38[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v37) {
                  goto LABEL_31;
                }
                unint64_t v18 = v38[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      char v21 = (uint64_t *)(*(void *)(v5 + 56) + 48 * v16);
      uint64_t v22 = v21[5];
      uint64_t v23 = v21[3];
      uint64_t v24 = v21[4];
      uint64_t v25 = v21[2];
      uint64_t v27 = *v21;
      uint64_t v26 = v21[1];
      sub_250C1DD78();
      sub_250C1DD88();
      uint64_t result = sub_250C1DD98();
      uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v13 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(unsigned char *)(*(void *)(v7 + 48) + v13) = v20;
      uint64_t v14 = (void *)(*(void *)(v7 + 56) + 48 * v13);
      void *v14 = v27;
      v14[1] = v26;
      v14[2] = v25;
      v14[3] = v23;
      v14[4] = v24;
      v14[5] = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C11B7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A58);
  char v38 = a2;
  uint64_t v6 = sub_250C1DBB8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_250C1DD78();
    sub_250C1D748();
    uint64_t result = sub_250C1DD98();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C11E8C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A70);
  uint64_t v6 = sub_250C1DBB8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  char v33 = a2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
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
  swift_retain();
  int64_t v13 = 0;
LABEL_9:
  if (v10)
  {
    unint64_t v19 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v20 = v19 | (v13 << 6);
LABEL_31:
    char v29 = *(unsigned char *)(*(void *)(v5 + 48) + v20);
    uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    sub_250C1DD78();
    sub_250C1D748();
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_250C1DD98();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v25 = 0;
    unint64_t v26 = (unint64_t)(63 - v15) >> 6;
    while (++v17 != v26 || (v25 & 1) == 0)
    {
      BOOL v27 = v17 == v26;
      if (v17 == v26) {
        unint64_t v17 = 0;
      }
      v25 |= v27;
      uint64_t v28 = *(void *)(v12 + 8 * v17);
      if (v28 != -1)
      {
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
LABEL_8:
        *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
        *(unsigned char *)(*(void *)(v7 + 48) + v18) = v29;
        *(void *)(*(void *)(v7 + 56) + 8 * v18) = v30;
        ++*(void *)(v7 + 16);
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    JUMPOUT(0x250C122C4);
  }
  int64_t v21 = v13 + 1;
  if (__OFADD__(v13, 1)) {
    goto LABEL_40;
  }
  if (v21 >= v11)
  {
    swift_release();
    uint64_t v22 = (void *)(v5 + 64);
    if (v33)
    {
LABEL_35:
      uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
      if (v31 >= 64) {
        bzero(v22, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        *uint64_t v22 = -1 << v31;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v34 + 8 * v21);
    ++v13;
    if (v23) {
      goto LABEL_30;
    }
    int64_t v13 = v21 + 1;
    if (v21 + 1 >= v11) {
      goto LABEL_32;
    }
    unint64_t v23 = *(void *)(v34 + 8 * v13);
    if (v23)
    {
LABEL_30:
      unint64_t v10 = (v23 - 1) & v23;
      unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
      goto LABEL_31;
    }
    int64_t v24 = v21 + 2;
    if (v24 < v11)
    {
      unint64_t v23 = *(void *)(v34 + 8 * v24);
      if (!v23)
      {
        while (1)
        {
          int64_t v13 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_41;
          }
          if (v13 >= v11) {
            goto LABEL_32;
          }
          unint64_t v23 = *(void *)(v34 + 8 * v13);
          ++v24;
          if (v23) {
            goto LABEL_30;
          }
        }
      }
      int64_t v13 = v24;
      goto LABEL_30;
    }
LABEL_32:
    swift_release();
    if (v33) {
      goto LABEL_35;
    }
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C12304(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9980);
  uint64_t result = sub_250C1DBB8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v31 = a2;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        int64_t v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13) {
          goto LABEL_31;
        }
        unint64_t v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          int64_t v8 = v18 + 1;
          if (v18 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v19 = v9[v8];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v9 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v8 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = v9[v8];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v20;
          }
        }
LABEL_21:
        unint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      char v21 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
      sub_250C1DD78();
      sub_250C1DD88();
      uint64_t result = sub_250C1DD98();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v25 == v27;
          if (v25 == v27) {
            unint64_t v25 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(unsigned char *)(*(void *)(v7 + 48) + v15) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C125D0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A60);
  char v36 = a2;
  uint64_t v6 = sub_250C1DBB8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_250C1DD78();
    sub_250C1D748();
    uint64_t result = sub_250C1DD98();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
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
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_250C128E8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98C0);
  uint64_t result = sub_250C1DBB8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v30 = a2;
    int64_t v8 = 0;
    uint64_t v31 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v12) {
          goto LABEL_31;
        }
        unint64_t v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v18 = v31[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v31 = -1 << v29;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v12) {
                  goto LABEL_31;
                }
                unint64_t v18 = v31[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v16);
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
      sub_250C1DD78();
      sub_250C1DD88();
      uint64_t result = sub_250C1DD98();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v23) & ~*(void *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v7 + 48) + v14) = v20;
      *(void *)(*(void *)(v7 + 56) + 8 * v14) = v21;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

id sub_250C12BB0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9960);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250C1DBA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_250BE4020(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_250BE3F48(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_250C12D78()
{
  return sub_250C12D90(&qword_269AF9A80);
}

void *sub_250C12D84()
{
  return sub_250C12D90(&qword_269AF9A78);
}

void *sub_250C12D90(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_250C1DBA8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = v21 + (v10 << 6);
LABEL_12:
    char v17 = *(unsigned char *)(*(void *)(v3 + 56) + v16);
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    *(unsigned char *)(*(void *)(v5 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_250C12F14()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9988);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250C1DBA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    unint64_t v25 = __clz(__rbit64(v23));
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = v25 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 48 * v15;
    uint64_t v17 = *(void *)(v16 + 32);
    uint64_t v18 = *(void *)(v16 + 40);
    long long v20 = *(_OWORD *)v16;
    long long v19 = *(_OWORD *)(v16 + 16);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v21 = *(void *)(v4 + 56) + 48 * v15;
    *(_OWORD *)uint64_t v21 = v20;
    *(_OWORD *)(v21 + 16) = v19;
    *(void *)(v21 + 32) = v17;
    *(void *)(v21 + 40) = v18;
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

id sub_250C130C0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250C1DBA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    long long v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_250C13274()
{
  return sub_250C1328C(&qword_269AF9A70);
}

void *sub_250C13280()
{
  return sub_250C1328C(&qword_269AF9980);
}

void *sub_250C1328C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_250C1DBA8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
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
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = v21 + (v10 << 6);
LABEL_12:
    uint64_t v17 = *(void *)(*(void *)(v3 + 56) + 8 * v16);
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    *(void *)(*(void *)(v5 + 56) + 8 * v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_250C13414()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250C1DBA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
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

void *sub_250C135CC()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF98C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250C1DBA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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

unint64_t sub_250C1375C()
{
  unint64_t result = qword_269AF9A68;
  if (!qword_269AF9A68)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9A68);
  }
  return result;
}

void destroy for HGCoreAnalyticsManager.HGCAReport(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
}

void *initializeWithCopy for HGCoreAnalyticsManager.HGCAReport(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  unint64_t v7 = *(void **)(a2 + 32);
  unint64_t v8 = *(void **)(a2 + 40);
  a1[4] = v7;
  a1[5] = v8;
  int64_t v9 = *(void **)(a2 + 48);
  uint64_t v10 = *(void **)(a2 + 56);
  a1[6] = v9;
  a1[7] = v10;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  return a1;
}

uint64_t assignWithCopy for HGCoreAnalyticsManager.HGCAReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  unint64_t v7 = *(void **)(a2 + 8);
  unint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  uint64_t v10 = *(void **)(a2 + 16);
  id v11 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  id v12 = v10;

  id v13 = *(void **)(a2 + 24);
  id v14 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v13;
  id v15 = v13;

  id v16 = *(void **)(a2 + 32);
  id v17 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v16;
  id v18 = v16;

  int64_t v19 = *(void **)(a2 + 40);
  unint64_t v20 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v19;
  id v21 = v19;

  int64_t v22 = *(void **)(a2 + 48);
  unint64_t v23 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v22;
  id v24 = v22;

  unint64_t v25 = *(void **)(a2 + 56);
  unint64_t v26 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v25;
  id v27 = v25;

  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for HGCoreAnalyticsManager.HGCAReport(uint64_t a1, _OWORD *a2)
{
  long long v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  id v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = a2[2];

  unint64_t v7 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for HGCoreAnalyticsManager.HGCAReport(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HGCoreAnalyticsManager.HGCAReport(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGCoreAnalyticsManager.HGCAReport()
{
  return &type metadata for HGCoreAnalyticsManager.HGCAReport;
}

uint64_t sub_250C13AB0(uint64_t result, double a2)
{
  long long v4 = *(void **)v2;
  if (*(void *)(*(void *)v2 + 16) == result)
  {
    if (!result)
    {
      __break(1u);
      return result;
    }
    sub_250C13CC8(0, 1);
    long long v4 = *(void **)v2;
  }
  __n128 result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    __n128 result = (uint64_t)sub_250BF151C(0, v4[2] + 1, 1, v4);
    long long v4 = (void *)result;
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 >= v5 >> 1)
  {
    __n128 result = (uint64_t)sub_250BF151C((void *)(v5 > 1), v6 + 1, 1, v4);
    long long v4 = (void *)result;
  }
  v4[2] = v6 + 1;
  *(double *)&v4[v6 + 4] = a2;
  *(void *)uint64_t v2 = v4;
  return result;
}

unint64_t sub_250C13B74(unint64_t result, unint64_t a2, float a3)
{
  unint64_t v4 = result;
  unint64_t v6 = *v3;
  if (*((void *)*v3 + 2) != result || a2 == 0) {
    goto LABEL_8;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (result < a2)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  sub_250C13EC0(0, a2);
  unint64_t v6 = *v3;
LABEL_8:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v6 = sub_250BF184C(0, *((void *)v6 + 2) + 1, 1, v6);
  }
  unint64_t v9 = *((void *)v6 + 2);
  unint64_t v8 = *((void *)v6 + 3);
  unint64_t v10 = v9 + 1;
  if (v9 >= v8 >> 1) {
    unint64_t v6 = sub_250BF184C((char *)(v8 > 1), v9 + 1, 1, v6);
  }
  *((void *)v6 + 2) = v10;
  *(float *)&v6[4 * v9 + 32] = a3;
  *long long v3 = v6;
  if (v10 != v4) {
    return 0;
  }
  sub_250C13E24();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9A90);
  sub_250C13E64();
  return sub_250C1D8F8();
}

char *sub_250C13CC8(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  __n128 result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    __n128 result = (char *)sub_250BF151C(result, v11, 1, v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    __n128 result = &v4[8 * a1 + 32];
    id v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14]) {
      __n128 result = (char *)memmove(result, v15, 8 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  __n128 result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

unint64_t sub_250C13E24()
{
  unint64_t result = qword_269AF9A88;
  if (!qword_269AF9A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF9A88);
  }
  return result;
}

unint64_t sub_250C13E64()
{
  unint64_t result = qword_269AF9A98;
  if (!qword_269AF9A98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269AF9A90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269AF9A98);
  }
  return result;
}

char *sub_250C13EC0(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t result = sub_250BF184C(result, v11, 1, v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    unint64_t result = &v4[4 * a1 + 32];
    id v15 = &v4[4 * a2 + 32];
    if (a1 != a2 || result >= &v15[4 * v14]) {
      unint64_t result = (char *)memmove(result, v15, 4 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  unint64_t result = (char *)sub_250C1DBD8();
  __break(1u);
  return result;
}

uint64_t sub_250C1401C()
{
  uint64_t v1 = sub_250C1D2F8();
  uint64_t v26 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  MEMORY[0x270FA5388](v1);
  unint64_t v25 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_250C1D998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250C1D968();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_250C1D5F8();
  MEMORY[0x270FA5388](v8 - 8);
  *(void *)(v0 + 16) = 0;
  v23[1] = sub_250BDDCD8();
  sub_250C1D5E8();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_250C15400(&qword_269AF90C8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF90D0);
  sub_250BDDD60(&qword_269AF90D8, &qword_269AF90D0);
  sub_250C1DA88();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v3);
  uint64_t v9 = sub_250C1D9C8();
  uint64_t v10 = v24;
  *(void *)(v24 + 40) = v9;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v12 = (void *)sub_250C1D6A8();
  objc_msgSend(v11, sel_setDateFormat_, v12);

  id v13 = objc_msgSend(self, sel_processInfo);
  id v14 = objc_msgSend(v13, sel_processName);

  uint64_t v15 = sub_250C1D6D8();
  uint64_t v17 = v16;

  uint64_t v28 = v15;
  uint64_t v29 = v17;
  sub_250C1D768();
  id v18 = v25;
  sub_250C1D2E8();
  int64_t v19 = (void *)sub_250C1D268();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v18, v27);
  id v20 = objc_msgSend(v11, sel_stringFromDate_, v19);

  sub_250C1D6D8();
  sub_250C1D768();
  swift_bridgeObjectRelease();
  sub_250C1D768();

  uint64_t v21 = v29;
  uint64_t result = v10;
  *(void *)(v10 + 24) = v28;
  *(void *)(v10 + 32) = v21;
  return result;
}

uint64_t sub_250C14454(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9AA0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9AA8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF93F0);
  sub_250BDDD60(&qword_269AF93F8, &qword_269AF93F0);
  sub_250C1D4F8();
  swift_release();
  sub_250BDDD60(&qword_269AF9AB0, &qword_269AF9AA0);
  swift_retain_n();
  sub_250C1D4B8();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_250BDDD60(&qword_269AF9AB8, &qword_269AF9AA8);
  uint64_t v10 = sub_250C1D548();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v14 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9AC0);
  sub_250BDDD60(qword_269AF9AC8, &qword_269AF9AC0);
  uint64_t v11 = sub_250C1D498();
  swift_release();
  return v11;
}

double sub_250C1477C@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = sub_250C1D5D8();
  uint64_t v30 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_250C1D5F8();
  uint64_t v9 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = a1[4];
  long long v13 = a1[6];
  long long v38 = a1[5];
  v39[0] = v13;
  *(_OWORD *)((char *)v39 + 9) = *(long long *)((char *)a1 + 105);
  long long v14 = a1[1];
  long long v33 = *a1;
  long long v34 = v14;
  long long v15 = a1[3];
  long long v35 = a1[2];
  long long v36 = v15;
  long long v37 = v12;
  uint64_t v16 = *(void **)(a2 + 40);
  uint64_t v17 = swift_allocObject();
  long long v18 = a1[5];
  *(_OWORD *)(v17 + 88) = a1[4];
  *(_OWORD *)(v17 + 104) = v18;
  *(_OWORD *)(v17 + 120) = a1[6];
  *(_OWORD *)(v17 + 129) = *(long long *)((char *)a1 + 105);
  long long v19 = a1[1];
  *(_OWORD *)(v17 + 24) = *a1;
  *(_OWORD *)(v17 + 40) = v19;
  long long v20 = a1[3];
  *(_OWORD *)(v17 + 56) = a1[2];
  *(void *)(v17 + 16) = a2;
  *(_OWORD *)(v17 + 72) = v20;
  aBlock[4] = sub_250C153F4;
  void aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_14;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = v16;
  swift_retain();
  sub_250C1D5E8();
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_250C15400((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v11, v8, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v29);
  swift_release();
  long long v23 = v38;
  long long v24 = v39[0];
  a3[4] = v37;
  a3[5] = v23;
  a3[6] = v24;
  *(_OWORD *)((char *)a3 + 105) = *(_OWORD *)((char *)v39 + 9);
  long long v25 = v34;
  *a3 = v33;
  a3[1] = v25;
  double result = *(double *)&v35;
  long long v27 = v36;
  a3[2] = v35;
  a3[3] = v27;
  return result;
}

void sub_250C14AF8(uint64_t a1)
{
  uint64_t v2 = sub_250C1D718();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(a1 + 16);
  if (v6)
  {
    id v7 = v6;
    sub_250BFA89C();
    sub_250C1D708();
    uint64_t v8 = (void *)sub_250C1D6E8();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v10 >> 60 == 15)
    {
    }
    else
    {
      sub_250BF7F60((uint64_t)v8, v10);
      sub_250BEDDB8(v8, v10, v7, 0);

      sub_250BEE160((uint64_t)v8, v10);
      sub_250BEE160((uint64_t)v8, v10);
    }
  }
}

void sub_250C14C60(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_250C1D718();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = HGGetTemporaryRawDataDirectory();
  uint64_t v8 = sub_250C1D6D8();
  unint64_t v10 = v9;

  long long v12 = (void *)a2[3];
  uint64_t v11 = (void *)a2[4];
  uint64_t v13 = qword_269AF8F68;
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  sub_250C1D708();
  uint64_t v14 = sub_250C1D6E8();
  unint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v17 = sub_250BED2B4(v8, v10, v12, v11, v14, v16);
  sub_250BEE160(v14, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v18 = (void *)a2[2];
  a2[2] = v17;
}

uint64_t sub_250C14E08(uint64_t a1)
{
  uint64_t v2 = sub_250C1D5D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = sub_250C1D5F8();
  uint64_t v6 = *(void *)(v13[0] - 8);
  MEMORY[0x270FA5388](v13[0]);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = *(void **)(a1 + 40);
  aBlock[4] = sub_250C1539C;
  void aBlock[5] = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250BFD1B4;
  aBlock[3] = &block_descriptor_6;
  unint64_t v10 = _Block_copy(aBlock);
  id v11 = v9;
  swift_retain();
  sub_250C1D5E8();
  v13[1] = MEMORY[0x263F8EE78];
  sub_250C15400((unint64_t *)&qword_269AF9050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9058);
  sub_250BDDD60((unint64_t *)&qword_269AF9060, &qword_269AF9058);
  sub_250C1DA88();
  MEMORY[0x2533847D0](0, v8, v5, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void))(v6 + 8))(v8, v13[0]);
  return swift_release();
}

void sub_250C150B8(uint64_t a1)
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2)
  {
    uint64_t v3 = 0;
    goto LABEL_5;
  }
  v15[0] = 0;
  if (objc_msgSend(v2, sel_closeAndReturnError_, v15))
  {
    uint64_t v3 = *(NSObject **)(a1 + 16);
    id v4 = v15[0];
LABEL_5:
    *(void *)(a1 + 16) = 0;
LABEL_6:

    return;
  }
  id v5 = v15[0];
  uint64_t v6 = (void *)sub_250C1D128();

  swift_willThrow();
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_250C1D3A8();
  __swift_project_value_buffer(v7, (uint64_t)qword_269AFCA38);
  id v8 = v6;
  id v9 = v6;
  uint64_t v3 = sub_250C1D388();
  os_log_type_t v10 = sub_250C1D948();
  if (!os_log_type_enabled(v3, v10))
  {

    goto LABEL_6;
  }
  id v11 = (uint8_t *)swift_slowAlloc();
  long long v12 = (void *)swift_slowAlloc();
  v15[0] = v12;
  *(_DWORD *)id v11 = 136315138;
  swift_getErrorValue();
  uint64_t v13 = sub_250C1DD28();
  sub_250BE1D68(v13, v14, (uint64_t *)v15);
  sub_250C1DA48();
  swift_bridgeObjectRelease();

  _os_log_impl(&dword_250BD9000, v3, v10, "[HGDataCollector] Failed to close file handle, error %s", v11, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2533853C0](v12, -1, -1);
  MEMORY[0x2533853C0](v11, -1, -1);
}

uint64_t sub_250C15318()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDataCollector()
{
  return self;
}

double sub_250C15384@<D0>(long long *a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_250C1477C(a1, v2, a2);
}

void sub_250C1538C(uint64_t a1)
{
  sub_250C14C60(a1, v1);
}

uint64_t sub_250C15394()
{
  return sub_250C14E08(v0);
}

void sub_250C1539C()
{
  sub_250C150B8(v0);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_250C153BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 145, 7);
}

void sub_250C153F4()
{
  sub_250C14AF8(*(void *)(v0 + 16));
}

uint64_t sub_250C15400(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t RawRepresentableWrapper.rawValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);
  return v4(a1, v1, AssociatedTypeWitness);
}

uint64_t RawRepresentableWrapper.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v9 = (char *)&v15 - v8;
  uint64_t v10 = sub_250C1DA38();
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (char *)&v15 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3, AssociatedTypeWitness);
  sub_250C1D7C8();
  uint64_t v13 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v12, v5);
  }
  __break(1u);
  return result;
}

uint64_t RawRepresentableWrapper.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  id v9 = (char *)&v11 - v8;
  sub_250C1D7B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, AssociatedTypeWitness);
}

uint64_t sub_250C157B4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6156776172 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_250C1DCF8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_250C1583C()
{
  return 1;
}

uint64_t sub_250C15844()
{
  return sub_250C1DD98();
}

uint64_t sub_250C15888()
{
  return sub_250C1DD88();
}

uint64_t sub_250C158B0()
{
  return sub_250C1DD98();
}

uint64_t sub_250C158F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250C157B4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_250C15928@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_250C1583C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_250C15958(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_250C159AC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t static RawRepresentableWrapper<>.== infix(_:_:)()
{
  return sub_250C1D698() & 1;
}

uint64_t sub_250C15A6C()
{
  return static RawRepresentableWrapper<>.== infix(_:_:)();
}

uint64_t RawRepresentableWrapper<>.hash(into:)()
{
  swift_getAssociatedTypeWitness();
  return sub_250C1D678();
}

uint64_t RawRepresentableWrapper<>.hashValue.getter()
{
  return sub_250C1DD98();
}

uint64_t sub_250C15B58()
{
  return RawRepresentableWrapper<>.hashValue.getter();
}

uint64_t sub_250C15B60()
{
  return RawRepresentableWrapper<>.hash(into:)();
}

uint64_t sub_250C15B68()
{
  return sub_250C1DD98();
}

uint64_t RawRepresentableWrapper<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  v9[3] = a3;
  v9[1] = *(void *)(a2 + 16);
  type metadata accessor for RawRepresentableWrapper.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_250C1DCC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250C1DDE8();
  swift_getAssociatedTypeWitness();
  sub_250C1DCB8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t type metadata accessor for RawRepresentableWrapper.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_250C15D64(void *a1, uint64_t a2, uint64_t a3)
{
  return RawRepresentableWrapper<>.encode(to:)(a1, a2, *(void *)(a3 - 8));
}

uint64_t RawRepresentableWrapper<>.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v18 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v24 = (char *)&v17 - v4;
  type metadata accessor for RawRepresentableWrapper.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_250C1DC78();
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = type metadata accessor for RawRepresentableWrapper();
  uint64_t v17 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v11 = v25;
  sub_250C1DDD8();
  if (!v11)
  {
    uint64_t v25 = v8;
    uint64_t v12 = v19;
    uint64_t v13 = v20;
    uint64_t v14 = v21;
    uint64_t v15 = AssociatedTypeWitness;
    sub_250C1DC58();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v10, v24, v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v18, v10, v25);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t type metadata accessor for RawRepresentableWrapper()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_250C16090()
{
  return swift_getWitnessTable();
}

uint64_t sub_250C160D8@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return RawRepresentableWrapper<>.init(from:)(a1, *(void *)(a2 - 8), a3);
}

uint64_t sub_250C160FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_250C16104()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_250C161A4(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7
    && *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_250C16280(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  char v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_250C162FC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_250C16374(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_250C163EC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_250C16464(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_250C164DC(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v7 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v9 = ((a2 - v5 + ~(-1 << v7)) >> v7) + 1;
    if (HIWORD(v9))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 < 2)
    {
LABEL_19:
      if (v5)
      {
        uint64_t v11 = *(uint64_t (**)(unsigned __int16 *))(v4 + 48);
        return v11(a1);
      }
      return 0;
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v10 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v10 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v10) + 1;
}

void sub_250C1668C(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v8)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        return;
      default:
        return;
    }
  }
  switch(v9)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x250C168C8);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v6 + 56);
        v14(a1, a2);
      }
      return;
  }
}

uint64_t sub_250C168F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_250C168FC(unsigned int *a1, int a2)
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

unsigned char *sub_250C1694C(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250C169E8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_250C16A10()
{
  return 0;
}

uint64_t sub_250C16A18()
{
  return swift_getWitnessTable();
}

uint64_t sub_250C16A34()
{
  return swift_getWitnessTable();
}

uint64_t sub_250C16A50()
{
  return swift_getWitnessTable();
}

uint64_t sub_250C16A6C()
{
  return 0x65756C6156776172;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_250C16AB4(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = 1 << v2;
  uint64_t v4 = -1;
  if (1 << v2 < 64) {
    uint64_t v4 = ~(-1 << (1 << v2));
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  if (!v5)
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 > 6)
    {
      int64_t v9 = (unint64_t)(v3 + 63) >> 6;
      unint64_t v20 = *(void *)(a1 + 72);
      if (v20)
      {
        uint64_t v6 = 1;
LABEL_30:
        unint64_t v8 = (v20 - 1) & v20;
        unint64_t v7 = __clz(__rbit64(v20)) + (v6 << 6);
        goto LABEL_5;
      }
      if (v6 >= 8)
      {
        unint64_t v20 = *(void *)(a1 + 80);
        if (v20)
        {
          uint64_t v6 = 2;
          goto LABEL_30;
        }
        unint64_t v20 = *(void *)(a1 + 88);
        if (v20)
        {
          uint64_t v6 = 3;
          goto LABEL_30;
        }
LABEL_37:
        if (v6 >= 9)
        {
          unint64_t v20 = *(void *)(a1 + 96);
          if (v20)
          {
            uint64_t v6 = 4;
          }
          else
          {
            unint64_t v20 = *(void *)(a1 + 104);
            if (!v20) {
              goto LABEL_44;
            }
            uint64_t v6 = 5;
          }
          goto LABEL_30;
        }
      }
    }
    return 5;
  }
  uint64_t v6 = 0;
  unint64_t v7 = __clz(__rbit64(v5));
  unint64_t v8 = (v5 - 1) & v5;
  int64_t v9 = (unint64_t)(v3 + 63) >> 6;
LABEL_5:
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  unsigned __int8 v12 = *(unsigned char *)(v10 + v7);
  double v13 = *(double *)(v11 + 8 * v7);
  while (v8)
  {
    unint64_t v14 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_7:
    if (v13 < *(double *)(v11 + 8 * v15))
    {
      unsigned __int8 v12 = *(unsigned char *)(v10 + v15);
      double v13 = *(double *)(v11 + 8 * v15);
    }
  }
  int64_t v16 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v16 >= v9) {
    return v12;
  }
  unint64_t v17 = *(void *)(v1 + 8 * v16);
  ++v6;
  if (v17) {
    goto LABEL_25;
  }
  uint64_t v6 = v16 + 1;
  if (v16 + 1 >= v9) {
    return v12;
  }
  unint64_t v17 = *(void *)(v1 + 8 * v6);
  if (v17) {
    goto LABEL_25;
  }
  uint64_t v6 = v16 + 2;
  if (v16 + 2 >= v9) {
    return v12;
  }
  unint64_t v17 = *(void *)(v1 + 8 * v6);
  if (v17) {
    goto LABEL_25;
  }
  uint64_t v6 = v16 + 3;
  if (v16 + 3 >= v9) {
    return v12;
  }
  unint64_t v17 = *(void *)(v1 + 8 * v6);
  if (v17)
  {
LABEL_25:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v6 << 6);
    goto LABEL_7;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v9) {
    return v12;
  }
  unint64_t v17 = *(void *)(v1 + 8 * v18);
  if (v17)
  {
    uint64_t v6 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v6 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v6 >= v9) {
      return v12;
    }
    unint64_t v17 = *(void *)(v1 + 8 * v6);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_44:
  uint64_t v21 = 0;
  uint64_t v22 = 6;
  if (v9 > 6) {
    uint64_t v22 = v9;
  }
  while (v22 - 6 != v21)
  {
    unint64_t v20 = *(void *)(a1 + 112 + 8 * v21++);
    if (v20)
    {
      uint64_t v6 = v21 + 5;
      goto LABEL_30;
    }
  }
  return 5;
}

uint64_t sub_250C16CD8(double a1, double a2, double a3)
{
  *(unsigned char *)(v3 + 16) = 1;
  *(void *)(v3 + 24) = sub_250C0A9E8((uint64_t)&unk_2701CD030);
  *(_OWORD *)(v3 + 32) = xmmword_250C21310;
  *(_OWORD *)(v3 + 48) = xmmword_250C21320;
  *(unsigned char *)(v3 + 64) = 5;
  sub_250C1D248();
  *(double *)(v3 + 48) = a1;
  *(double *)(v3 + 56) = a2;
  *(double *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_250C16D58@<X0>(void *__src@<X0>, char *a2@<X8>)
{
  memcpy(__dst, __src, 0x131uLL);
  uint64_t result = sub_250C16DB4((uint64_t)__dst);
  if ((_BYTE)result) {
    char v4 = result;
  }
  else {
    char v4 = 5;
  }
  *a2 = v4;
  return result;
}

uint64_t sub_250C16DB4(uint64_t a1)
{
  uint64_t v3 = sub_250C1D2F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250C1D2C8();
  uint64_t v13 = v1;
  uint64_t v14 = a1;
  unint64_t v15 = v6;
  unint64_t v7 = sub_250C16F38((void (*)(void *__return_ptr, void))sub_250C1782C, (uint64_t)v12, (uint64_t)&unk_2701CD430);
  uint64_t v8 = *((void *)v7 + 2);
  if (!v8)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = v7[32];
  swift_bridgeObjectRelease();
  if (v8 != 1 || (sub_250C17474(v9) & 1) == 0) {
    goto LABEL_6;
  }
  *(unsigned char *)(v1 + 64) = v9;
  uint64_t v10 = v1 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
  swift_beginAccess();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 24))(v10, v6, v3);
  swift_endAccess();
LABEL_7:
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

char *sub_250C16F38(void (*a1)(void *__return_ptr, void), uint64_t a2, uint64_t a3)
{
  void (*v13)(void *__return_ptr, void);
  uint64_t v14;

  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  uint64_t v13 = a1;
  do
  {
    BYTE1(v14) = *(unsigned char *)(a3 + v7 + 32);
    a1(&v14, (char *)&v14 + 1);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    char v9 = v14;
    if (v14 != 5)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_250BF1B7C(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v11 = *((void *)v8 + 2);
      unint64_t v10 = *((void *)v8 + 3);
      if (v11 >= v10 >> 1) {
        uint64_t v8 = sub_250BF1B7C((char *)(v10 > 1), v11 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v11 + 1;
      v8[v11 + 32] = v9;
      a1 = v13;
    }
    ++v7;
  }
  while (v4 != v7);
  swift_bridgeObjectRelease();
  return v8;
}

BOOL sub_250C1708C(BOOL a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_250C1D2F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_250BF6BFC(a2 + 176, (uint64_t)v36, &qword_269AF9BE0);
  sub_250BF6BFC((uint64_t)v36, (uint64_t)v37, &qword_269AF9BE0);
  if (v38) {
    return 0;
  }
  double v11 = *(double *)v37;
  double v12 = *(double *)&v37[2];
  sub_250BF6BFC(a2 + 240, (uint64_t)v35, &qword_269AF9BE8);
  sub_250BF6BFC((uint64_t)v35, (uint64_t)v39, &qword_269AF9BE8);
  if (v40) {
    return 0;
  }
  double v14 = *(double *)v39;
  double v15 = *(double *)&v39[1];
  double v16 = *(double *)&v39[2];
  double v17 = *(double *)&v39[3];
  double v18 = *(double *)&v39[4];
  double v19 = *(double *)&v39[5];
  int v20 = *(unsigned __int8 *)(v3 + 16);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  if (v20 == 1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    char v21 = sub_250C17474(a1);
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
    if ((v21 & 1) == 0) {
      return 0;
    }
  }
  BOOL result = 0;
  switch(a1)
  {
    case 1:
      double v22 = 1.0;
      if (v17 > 0.75)
      {
        double v14 = v17;
        goto LABEL_12;
      }
      BOOL result = 0;
      double v14 = v17;
      goto LABEL_19;
    case 2:
      double v22 = -1.0;
      if (v14 >= -0.75) {
        BOOL result = 0;
      }
      else {
LABEL_12:
      }
        BOOL result = *(double *)(v3 + 56) < v11 * v22;
LABEL_19:
      double v24 = fabs(v14);
      double v25 = 0.75;
      double v26 = fmax(v24 * 0.45, 0.75);
      double v27 = v24 * 0.55;
      if (v27 >= 0.75)
      {
        if (v18 >= v26)
        {
          BOOL v28 = 0;
          int v29 = 0;
          goto LABEL_35;
        }
        double v25 = v27;
LABEL_24:
        BOOL v28 = v15 > -v26;
        if (v19 >= v25) {
          goto LABEL_33;
        }
        double v27 = v25;
        goto LABEL_36;
      }
      if (v18 < v26) {
        goto LABEL_24;
      }
      BOOL v28 = 0;
      int v29 = 0;
      double v27 = 0.75;
LABEL_35:
      if (v19 >= v27) {
        goto LABEL_44;
      }
LABEL_36:
      BOOL v33 = v16 <= -v27;
LABEL_41:
      int v29 = !v33;
LABEL_44:
      if (*(unsigned char *)(v3 + 16) == 1) {
        return v28 & v29 & result;
      }
      return result;
    case 3:
      double v23 = 1.0;
      if (v19 <= 0.75)
      {
        BOOL result = 0;
        double v16 = v19;
      }
      else
      {
        double v16 = v19;
LABEL_16:
        BOOL result = *(double *)(v3 + 48) < v12 * v23;
      }
      goto LABEL_28;
    case 4:
      double v23 = -1.0;
      if (v16 < -0.75) {
        goto LABEL_16;
      }
      BOOL result = 0;
LABEL_28:
      double v30 = fabs(v16);
      double v31 = fmax(v30 * 0.8, 2.1);
      double v32 = v30 * 0.35;
      if (v32 >= 0.95)
      {
        if (v18 < v31)
        {
LABEL_32:
          BOOL v28 = v15 > -v31;
          if (v17 >= v32)
          {
LABEL_33:
            int v29 = 0;
            goto LABEL_44;
          }
          goto LABEL_40;
        }
        BOOL v28 = 0;
        int v29 = 0;
      }
      else
      {
        if (v18 < v31)
        {
          double v32 = 0.95;
          goto LABEL_32;
        }
        BOOL v28 = 0;
        int v29 = 0;
        double v32 = 0.95;
      }
      if (v17 >= v32) {
        goto LABEL_44;
      }
LABEL_40:
      BOOL v33 = v14 <= -v32;
      goto LABEL_41;
    default:
      return result;
  }
}

uint64_t sub_250C17474(BOOL a1)
{
  uint64_t v3 = sub_250C1D2F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v16[-v8];
  uint64_t v10 = swift_bridgeObjectRetain();
  char v11 = sub_250C16AB4(v10);
  uint64_t result = swift_bridgeObjectRelease();
  if (v11 == 5)
  {
    __break(1u);
  }
  else
  {
    sub_250C0026C(v11, a1);
    uint64_t v13 = v1 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
    swift_beginAccess();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16))(v7, v13, v3);
    sub_250C1D288();
    double v14 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
    v14(v7, v3);
    char v15 = sub_250C1D278();
    v14(v9, v3);
    return (v15 & 1) == 0;
  }
  return result;
}

uint64_t sub_250C17668()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12HeadGestures23HGPartGestureRecognizer_lastGesturePartRecognizedAt;
  uint64_t v2 = sub_250C1D2F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_250C17710()
{
  return type metadata accessor for HGPartGestureRecognizer();
}

uint64_t type metadata accessor for HGPartGestureRecognizer()
{
  uint64_t result = qword_269AF9BD0;
  if (!qword_269AF9BD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250C17764()
{
  uint64_t result = sub_250C1D2F8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_250C1782C@<W0>(char *a1@<X0>, char *a2@<X8>)
{
  char v4 = *a1;
  BOOL result = sub_250C1708C(*a1, *(void *)(v2 + 24), *(void *)(v2 + 32));
  if (result) {
    char v6 = v4;
  }
  else {
    char v6 = 5;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_250C17884(uint64_t a1)
{
  *(unsigned char *)(v1 + 16) = 1;
  *(void *)(v1 + 24) = sub_250C0A9E8((uint64_t)&unk_2701CCF90);
  *(_OWORD *)(v1 + 32) = xmmword_250C21310;
  *(_OWORD *)(v1 + 48) = xmmword_250C21320;
  *(unsigned char *)(v1 + 64) = 5;
  sub_250C1D248();
  *(double *)(v1 + 32) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartRepeatTimeout);
  *(double *)(v1 + 48) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableShakeVelocity);
  *(double *)(v1 + 56) = *(float *)(a1 + OBJC_IVAR___HGConfigurationInternal_gesturePartAcceptableNodVelocity);
  return v1;
}

uint64_t sub_250C17934()
{
  uint64_t v0 = (uint64_t (*)(void *))MEMORY[0x263F3B860];
  return sub_250C18360(v0);
}

uint64_t type metadata accessor for E5RTTensorDescriptorDataType()
{
  return self;
}

uint64_t sub_250C179C8()
{
  int data_ptr = e5rt_buffer_object_get_data_ptr();
  if (data_ptr)
  {
    int v1 = data_ptr;
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = v1;
    *(unsigned char *)(v2 + 4) = 0;
  }
  else
  {
    sub_250C0AB9C();
    swift_allocError();
    *char v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_250C17A98()
{
  uint64_t v0 = (uint64_t (*)(void *))MEMORY[0x263F3B798];
  return sub_250C18360(v0);
}

uint64_t type metadata accessor for E5RTBufferObject()
{
  return self;
}

uint64_t sub_250C17B2C()
{
  int v0 = e5rt_tensor_desc_alloc_buffer_object();
  if (v0)
  {
    int v1 = v0;
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = v1;
    *(unsigned char *)(v2 + 4) = 0;
  }
  else
  {
    sub_250C0AB9C();
    swift_allocError();
    *char v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_250C17C04()
{
  int v0 = (uint64_t (*)(void *))MEMORY[0x263F3B868];
  return sub_250C18360(v0);
}

uint64_t type metadata accessor for E5RTTensorDescriptor()
{
  return self;
}

uint64_t sub_250C17C98()
{
  int v0 = e5rt_io_port_retain_tensor_desc();
  if (v0)
  {
    int v1 = v0;
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = v1;
    *(unsigned char *)(v2 + 4) = 0;
  }
  else
  {
    sub_250C0AB9C();
    swift_allocError();
    *char v4 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_250C17D68()
{
  int v0 = (uint64_t (*)(void *))MEMORY[0x263F3B808];
  return sub_250C18360(v0);
}

uint64_t type metadata accessor for E5RTIOPort()
{
  return self;
}

uint64_t sub_250C17DFC(int64_t a1, uint64_t a2)
{
  return sub_250C17E54(a1, a2, MEMORY[0x263F3B7D8]);
}

uint64_t sub_250C17E28(int64_t a1, uint64_t a2)
{
  return sub_250C17E54(a1, a2, MEMORY[0x263F3B7C0]);
}

uint64_t sub_250C17E54(int64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void, void *))
{
  if (a1 < 0)
  {
    __break(1u);
LABEL_23:
    uint64_t v3 = sub_250C18554(v3);
    goto LABEL_10;
  }
  char v4 = a3;
  uint64_t v5 = a2;
  int64_t v7 = a1;
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (a1)
  {
    double v23 = (void *)MEMORY[0x263F8EE78];
    sub_250C04AE4(0, a1, 0);
    uint64_t v3 = v23;
    unint64_t v8 = v23[2];
    do
    {
      unint64_t v9 = v23[3];
      if (v8 >= v9 >> 1) {
        sub_250C04AE4(v9 > 1, v8 + 1, 1);
      }
      void v23[2] = v8 + 1;
      v23[v8++ + 4] = 0;
      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_23;
  }
LABEL_10:
  uint64_t v10 = v4(v5, v3[2], v3 + 4);
  if (v10)
  {
    uint64_t v11 = v10;
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v12 = v11;
    *(unsigned char *)(v12 + 4) = 0;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v14 = v3[2];
    if (v14)
    {
      uint64_t v24 = v6;
      sub_250C04A24(0, v14, 0);
      uint64_t v15 = 0;
      uint64_t v11 = v24;
      while (v3[v15 + 4])
      {
        uint64_t v16 = sub_250C1D778();
        uint64_t v18 = v17;
        uint64_t v24 = v11;
        unint64_t v20 = *(void *)(v11 + 16);
        unint64_t v19 = *(void *)(v11 + 24);
        if (v20 >= v19 >> 1) {
          sub_250C04A24(v19 > 1, v20 + 1, 1);
        }
        ++v15;
        *(void *)(v11 + 16) = v20 + 1;
        unint64_t v21 = v11 + 16 * v20;
        *(void *)(v21 + 32) = v16;
        *(void *)(v21 + 40) = v18;
        if (v14 == v15)
        {
          swift_bridgeObjectRelease();
          return v11;
        }
      }
      sub_250C0AAE0();
      swift_allocError();
      *(_DWORD *)uint64_t v22 = 3;
      *(unsigned char *)(v22 + 4) = 1;
      swift_willThrow();
      uint64_t v11 = v24;
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x263F8EE78];
    }
  }
  return v11;
}

uint64_t sub_250C180A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_250C18160(a1, a2, a3, MEMORY[0x263F3B7F0]);
}

uint64_t sub_250C18100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_250C18160(a1, a2, a3, MEMORY[0x263F3B7E8]);
}

uint64_t sub_250C18160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, void *))
{
  v11[1] = *MEMORY[0x263EF8340];
  v11[0] = 0;
  uint64_t v6 = sub_250C1D738();
  int v7 = a4(a3, v6 + 32, v11);
  swift_release();
  if (v7)
  {
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v8 = v7;
    *(unsigned char *)(v8 + 4) = 0;
    return swift_willThrow();
  }
  uint64_t result = v11[0];
  if (!v11[0])
  {
    sub_250C0AB9C();
    swift_allocError();
    *uint64_t v10 = 0;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_250C1825C()
{
  int v0 = (uint64_t (*)(void *))MEMORY[0x263F3B7E0];
  return sub_250C18360(v0);
}

uint64_t type metadata accessor for E5RTExecutionStreamOperation()
{
  return self;
}

uint64_t sub_250C182F0()
{
  int v0 = (uint64_t (*)(void *))MEMORY[0x263F3B7F8];
  return sub_250C18360(v0);
}

uint64_t sub_250C18360(uint64_t (*a1)(void *))
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = *(void *)(v1 + 16);
  int v2 = a1(v6);
  if (!v2) {
    return swift_deallocClassInstance();
  }
  int v4 = v2;
  sub_250C0AAE0();
  swift_allocError();
  *(_DWORD *)uint64_t v5 = v4;
  *(unsigned char *)(v5 + 4) = 0;
  swift_willThrow();
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for E5RTExecutionStream()
{
  return self;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for UnsafeE5RTExecutionStream()
{
  return &type metadata for UnsafeE5RTExecutionStream;
}

ValueMetadata *type metadata accessor for UnsafeE5RTExecutionStreamOperation()
{
  return &type metadata for UnsafeE5RTExecutionStreamOperation;
}

ValueMetadata *type metadata accessor for UnsafeE5RTIOPort()
{
  return &type metadata for UnsafeE5RTIOPort;
}

ValueMetadata *type metadata accessor for UnsafeE5RTTensorDescriptor()
{
  return &type metadata for UnsafeE5RTTensorDescriptor;
}

ValueMetadata *type metadata accessor for UnsafeE5RTBufferObject()
{
  return &type metadata for UnsafeE5RTBufferObject;
}

uint64_t _s12HeadGestures34UnsafeE5RTExecutionStreamOperationVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t _s12HeadGestures34UnsafeE5RTExecutionStreamOperationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeE5RTTensorDescriptorDataType()
{
  return &type metadata for UnsafeE5RTTensorDescriptorDataType;
}

void *sub_250C18554(void *a1)
{
  return sub_250BF195C(0, a1[2], 0, a1);
}

uint64_t sub_250C18568()
{
  sub_250C1D738();
  sub_250C1D738();
  sub_250C1D738();
  int precompiled_compute_operation = e5rt_execution_stream_operation_create_precompiled_compute_operation();
  swift_release();
  swift_release();
  swift_release();
  if (precompiled_compute_operation)
  {
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v1 = precompiled_compute_operation;
    *(unsigned char *)(v1 + 4) = 0;
  }
  else
  {
    sub_250C0AB9C();
    swift_allocError();
    *int v3 = 0;
  }
  return swift_willThrow();
}

uint64_t sub_250C186CC()
{
  int v0 = e5rt_execution_stream_create();
  if (v0)
  {
    int v1 = v0;
    sub_250C0AAE0();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = v1;
    *(unsigned char *)(v2 + 4) = 0;
  }
  else
  {
    sub_250C0AB9C();
    swift_allocError();
    *int v4 = 0;
  }
  return swift_willThrow();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for E5RTUtils.DomainError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for E5RTUtils.DomainError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_250C187FC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_250C18818(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for E5RTUtils.DomainError()
{
  return &type metadata for E5RTUtils.DomainError;
}

ValueMetadata *type metadata accessor for E5RTErrorCode()
{
  return &type metadata for E5RTErrorCode;
}

void destroy for HGAudioAssetManager(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for HGAudioAssetManager(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  int v7 = *(void **)(a2 + 32);
  a1[4] = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for HGAudioAssetManager(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  int v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v11;
  id v12 = v11;

  uint64_t v13 = *(void **)(a1 + 24);
  int64_t v14 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v14;
  id v15 = v14;

  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v17;
  id v18 = v17;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HGAudioAssetManager(uint64_t a1, uint64_t a2)
{
  int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for HGAudioAssetManager(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
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

uint64_t storeEnumTagSinglePayload for HGAudioAssetManager(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HGAudioAssetManager()
{
  return &type metadata for HGAudioAssetManager;
}

uint64_t sub_250C18AE4@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for HGAudioPlayer(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  int v4 = (void *)sub_250C1D6A8();
  uint64_t v5 = (void *)sub_250C1D6A8();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_250C1D168();

    uint64_t v7 = sub_250C1D198();
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_250C1D198();
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }
  return v8(v10, v11, 1, v9);
}

id sub_250C18C4C(uint64_t a1)
{
  int v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  int v4 = (void *)sub_250C1D158();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initForReading_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_250C1D198();
    id v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_250C1D128();

    swift_willThrow();
    uint64_t v11 = sub_250C1D198();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_250C18D98()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9300);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = &v22[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v3 = sub_250C1D198();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = &v22[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v22[-v11];
  type metadata accessor for HGAudioPlayer(0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id v15 = (void *)sub_250C1D6A8();
  uint64_t v16 = (void *)sub_250C1D6A8();
  id v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (!v17)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  sub_250C1D168();

  id v18 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32);
  v18(v2, v10, v3);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    sub_250BE3F58((uint64_t)v2);
    return 0;
  }
  v18(v12, v2, v3);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v7, v12, v3);
  id v19 = objc_allocWithZone(MEMORY[0x263EF9380]);
  id v20 = sub_250C18C4C((uint64_t)v7);
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v12, v3);
  return v20;
}

uint64_t sub_250C190A8(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_processingFormat);
  unint64_t v3 = (unint64_t)objc_msgSend(v1, sel_length);
  if ((v3 & 0x8000000000000000) != 0 || HIDWORD(v3)) {
    goto LABEL_10;
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93B0]), sel_initWithPCMFormat_frameCapacity_, v2, v3);

  if (!v4)
  {
    __break(1u);
LABEL_10:
    sub_250C1DB78();
    __break(1u);
    goto LABEL_11;
  }
  id v12 = 0;
  unsigned int v5 = objc_msgSend(v1, sel_readIntoBuffer_error_, v4, &v12);
  id v2 = v12;
  if (v5)
  {
    id v6 = v12;

    return (uint64_t)v4;
  }
LABEL_11:
  id v8 = v2;
  uint64_t v9 = sub_250C1D128();

  swift_willThrow();
  uint64_t v15 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF91B0);
  sub_250C19700();
  swift_dynamicCast();
  id v10 = v14;
  id v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_250C1DB08();
  swift_bridgeObjectRelease();
  id v12 = (id)0xD000000000000020;
  unint64_t v13 = 0x8000000250C24540;
  id v11 = objc_msgSend(v10, sel_localizedDescription);
  sub_250C1D6D8();

  sub_250C1D768();
  swift_bridgeObjectRelease();
  uint64_t result = sub_250C1DB88();
  __break(1u);
  return result;
}

id sub_250C1933C(uint64_t a1)
{
  if (qword_269AF8F78 != -1) {
    swift_once();
  }
  id v2 = *(void **)(qword_269AFCA30 + 16);
  unint64_t v3 = (void *)sub_250C1D6A8();
  objc_msgSend(v2, sel_BOOLForKey_, v3);

  if (a1 == 1 || a1 == 2)
  {
    sub_250C1D768();
    id v4 = sub_250C18D98();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

void sub_250C19494(void *a1@<X8>)
{
  if (qword_269AF8F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250C1D3A8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269AFCA38);
  unint64_t v3 = sub_250C1D388();
  os_log_type_t v4 = sub_250C1D938();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned int v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unsigned int v5 = 67109120;
    sub_250C1DA48();
    _os_log_impl(&dword_250BD9000, v3, v4, "[HGAudioAssetManager] using inverted tones: %{BOOL}d", v5, 8u);
    MEMORY[0x2533853C0](v5, -1, -1);
  }

  id v6 = sub_250C18D98();
  uint64_t v7 = (void *)sub_250C190A8(v6);

  id v8 = v7;
  id v9 = sub_250C18D98();
  id v10 = (void *)sub_250C190A8(v9);

  id v11 = v10;
  id v12 = sub_250C1933C(1);
  unint64_t v13 = (void *)sub_250C190A8(v12);

  id v14 = v13;
  id v15 = sub_250C1933C(2);
  uint64_t v16 = (void *)sub_250C190A8(v15);

  id v17 = v16;
  id v18 = sub_250C18D98();
  uint64_t v19 = sub_250C190A8(v18);

  *a1 = v7;
  a1[1] = v10;
  a1[2] = v13;
  a1[3] = v16;
  a1[4] = v19;
}

unint64_t sub_250C19700()
{
  unint64_t result = qword_269AF9BF0;
  if (!qword_269AF9BF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269AF9BF0);
  }
  return result;
}

void sub_250C19740()
{
  type metadata accessor for HGDefaults();
  swift_allocObject();
  sub_250C199FC();
  qword_269AFCA30 = v0;
}

unint64_t sub_250C1977C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 3:
    case 4:
    case 16:
    case 18:
      unint64_t result = 0xD000000000000020;
      break;
    case 5:
      unint64_t result = 0xD000000000000023;
      break;
    case 6:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000023;
      break;
    case 8:
      unint64_t result = 0xD000000000000021;
      break;
    case 9:
      unint64_t result = 0xD000000000000024;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 12:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 13:
      unint64_t result = 0xD000000000000015;
      break;
    case 14:
      unint64_t result = 0xD000000000000027;
      break;
    case 15:
      unint64_t result = 0xD000000000000024;
      break;
    case 17:
      unint64_t result = 0xD000000000000021;
      break;
    case 19:
      unint64_t result = 0xD000000000000018;
      break;
    case 20:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 21:
      unint64_t result = 0xD000000000000027;
      break;
    case 22:
      unint64_t result = 0xD000000000000023;
      break;
    case 23:
      unint64_t result = 0xD000000000000023;
      break;
    case 24:
      unint64_t result = 0xD000000000000022;
      break;
    case 25:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 26:
      unint64_t result = 0xD00000000000002CLL;
      break;
    case 27:
      unint64_t result = 0xD000000000000029;
      break;
    case 28:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      return result;
  }
  return result;
}

void sub_250C199FC()
{
  id v1 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v2 = (void *)sub_250C1D6A8();
  id v3 = objc_msgSend(v1, sel_initWithSuiteName_, v2);

  if (v3)
  {
    *(void *)(v0 + 16) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9BF8);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_250C21680;
    *(void *)(v4 + 32) = 0xD000000000000014;
    *(void *)(v4 + 40) = 0x8000000250C22770;
    uint64_t v5 = MEMORY[0x263F8D538];
    *(void *)(v4 + 48) = 0x3FE6666666666666;
    *(void *)(v4 + 72) = v5;
    *(void *)(v4 + 80) = 0xD000000000000016;
    *(void *)(v4 + 88) = 0x8000000250C22790;
    *(void *)(v4 + 96) = 0x3FF0000000000000;
    *(void *)(v4 + 120) = v5;
    *(void *)(v4 + 128) = 0xD00000000000001ALL;
    *(void *)(v4 + 136) = 0x8000000250C22750;
    *(void *)(v4 + 144) = 0x3FE999999999999ALL;
    *(void *)(v4 + 168) = v5;
    *(void *)(v4 + 176) = 0xD000000000000020;
    *(void *)(v4 + 184) = 0x8000000250C22900;
    *(void *)(v4 + 192) = 0;
    *(void *)(v4 + 216) = v5;
    *(void *)(v4 + 224) = 0xD000000000000020;
    *(void *)(v4 + 232) = 0x8000000250C22930;
    *(void *)(v4 + 240) = 0;
    *(void *)(v4 + 264) = v5;
    *(void *)(v4 + 272) = 0xD00000000000002BLL;
    *(void *)(v4 + 280) = 0x8000000250C23510;
    *(void *)(v4 + 288) = 0x4010000000000000;
    *(void *)(v4 + 312) = v5;
    *(void *)(v4 + 320) = 0xD000000000000023;
    *(void *)(v4 + 328) = 0x8000000250C22960;
    *(void *)(v4 + 336) = 0x3FE999999999999ALL;
    *(void *)(v4 + 360) = v5;
    *(void *)(v4 + 368) = 0xD000000000000023;
    *(void *)(v4 + 376) = 0x8000000250C219C0;
    *(void *)(v4 + 384) = 0x3FD999999999999ALL;
    *(void *)(v4 + 408) = v5;
    *(void *)(v4 + 416) = 0xD000000000000021;
    *(void *)(v4 + 424) = 0x8000000250C219F0;
    *(void *)(v4 + 432) = 0x4008000000000000;
    *(void *)(v4 + 456) = v5;
    *(void *)(v4 + 464) = 0xD000000000000024;
    *(void *)(v4 + 472) = 0x8000000250C244C0;
    uint64_t v6 = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v4 + 480) = 0;
    *(void *)(v4 + 504) = v6;
    *(void *)(v4 + 512) = 0xD000000000000013;
    *(void *)(v4 + 520) = 0x8000000250C227B0;
    *(void *)(v4 + 552) = v6;
    *(unsigned char *)(v4 + 528) = 1;
    *(void *)(v4 + 560) = 0xD00000000000001ELL;
    *(void *)(v4 + 568) = 0x8000000250C239A0;
    *(void *)(v4 + 600) = v5;
    *(void *)(v4 + 576) = 0x3FD999999999999ALL;
    *(void *)(v4 + 608) = 0xD00000000000001DLL;
    *(void *)(v4 + 616) = 0x8000000250C239C0;
    *(void *)(v4 + 648) = v5;
    *(void *)(v4 + 624) = 0x3FD999999999999ALL;
    *(void *)(v4 + 656) = 0xD000000000000015;
    *(void *)(v4 + 664) = 0x8000000250C239E0;
    uint64_t v7 = MEMORY[0x263F8D6C8];
    *(void *)(v4 + 696) = MEMORY[0x263F8D6C8];
    *(void *)(v4 + 672) = 8;
    *(void *)(v4 + 704) = 0xD000000000000027;
    *(void *)(v4 + 712) = 0x8000000250C23A00;
    *(void *)(v4 + 744) = v7;
    *(void *)(v4 + 720) = 4;
    *(void *)(v4 + 752) = 0xD000000000000024;
    *(void *)(v4 + 760) = 0x8000000250C23A30;
    *(void *)(v4 + 792) = v7;
    *(void *)(v4 + 768) = 3;
    *(void *)(v4 + 800) = 0xD000000000000020;
    *(void *)(v4 + 808) = 0x8000000250C23A60;
    *(void *)(v4 + 840) = v5;
    *(void *)(v4 + 816) = 0x3FC999999999999ALL;
    *(void *)(v4 + 848) = 0xD000000000000021;
    *(void *)(v4 + 856) = 0x8000000250C23BA0;
    *(void *)(v4 + 888) = v5;
    *(void *)(v4 + 864) = 0x3FE3333333333333;
    *(void *)(v4 + 896) = 0xD000000000000020;
    *(void *)(v4 + 904) = 0x8000000250C23BD0;
    *(void *)(v4 + 936) = v5;
    *(void *)(v4 + 912) = 0x3FE3333333333333;
    *(void *)(v4 + 944) = 0xD000000000000018;
    *(void *)(v4 + 952) = 0x8000000250C23C00;
    *(void *)(v4 + 984) = v7;
    *(void *)(v4 + 960) = 8;
    *(void *)(v4 + 992) = 0xD00000000000002ALL;
    *(void *)(v4 + 1000) = 0x8000000250C23C20;
    *(void *)(v4 + 1032) = v7;
    *(void *)(v4 + 1008) = 4;
    *(void *)(v4 + 1040) = 0xD000000000000027;
    *(void *)(v4 + 1048) = 0x8000000250C23C50;
    *(void *)(v4 + 1080) = v7;
    *(void *)(v4 + 1056) = 3;
    *(void *)(v4 + 1088) = 0xD000000000000023;
    *(void *)(v4 + 1096) = 0x8000000250C23C80;
    *(void *)(v4 + 1128) = v5;
    *(void *)(v4 + 1104) = 0x4000000000000000;
    *(void *)(v4 + 1136) = 0xD000000000000023;
    *(void *)(v4 + 1144) = 0x8000000250C23A90;
    *(void *)(v4 + 1176) = v5;
    *(void *)(v4 + 1152) = 0x3FE999999999999ALL;
    *(void *)(v4 + 1184) = 0xD000000000000022;
    *(void *)(v4 + 1192) = 0x8000000250C23AC0;
    *(void *)(v4 + 1224) = v5;
    *(void *)(v4 + 1200) = 0x3FE999999999999ALL;
    *(void *)(v4 + 1232) = 0xD00000000000001ALL;
    *(void *)(v4 + 1240) = 0x8000000250C23AF0;
    *(void *)(v4 + 1272) = v7;
    *(void *)(v4 + 1248) = 8;
    *(void *)(v4 + 1280) = 0xD00000000000002CLL;
    *(void *)(v4 + 1288) = 0x8000000250C23B10;
    *(void *)(v4 + 1320) = v7;
    *(void *)(v4 + 1296) = 4;
    *(void *)(v4 + 1328) = 0xD000000000000029;
    *(void *)(v4 + 1336) = 0x8000000250C23B40;
    *(void *)(v4 + 1368) = v7;
    *(void *)(v4 + 1344) = 3;
    *(void *)(v4 + 1376) = 0xD000000000000025;
    *(void *)(v4 + 1384) = 0x8000000250C23B70;
    *(void *)(v4 + 1416) = v5;
    *(void *)(v4 + 1392) = 0x4000000000000000;
    id v8 = v3;
    sub_250C0726C(v4);
    id v9 = (void *)sub_250C1D638();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_registerDefaults_, v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250C19F14()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGDefaults()
{
  return self;
}

uint64_t sub_250C19F70()
{
  uint64_t v0 = sub_250C1D3A8();
  __swift_allocate_value_buffer(v0, qword_269AFCA38);
  __swift_project_value_buffer(v0, (uint64_t)qword_269AFCA38);
  return sub_250C1D398();
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

id sub_250C1A058()
{
  v5[1] = *(id *)MEMORY[0x263EF8340];
  sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
  uint64_t v0 = (void *)sub_250C1D638();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_featureValueWithDictionary_error_, v0, v5);

  if (v1)
  {
    id v2 = v5[0];
  }
  else
  {
    id v3 = v5[0];
    sub_250C1D128();

    swift_willThrow();
  }
  return v1;
}

void sub_250C1A160()
{
  sub_250C1DB08();
  sub_250C1D768();
  id v1 = *(void **)(v0 + 16);
  id v2 = (void *)sub_250C1D6A8();
  id v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_stringValue);

    sub_250C1D6D8();
    sub_250C1D768();
    swift_bridgeObjectRelease();
    sub_250C1D768();
    uint64_t v5 = (void *)sub_250C1D6A8();
    id v6 = objc_msgSend(v1, sel_featureValueForName_, v5);

    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_dictionaryValue);

      sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
      uint64_t v8 = sub_250C1D648();

      sub_250C1A50C(v8);
      swift_bridgeObjectRelease();
      sub_250C1D658();
      sub_250C1D768();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_250C1D768();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250C1A3A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a3 + 16);
  id v6 = (void *)sub_250C1D6A8();
  id v7 = objc_msgSend(v5, sel_featureValueForName_, v6);

  if (v7)
  {
    id v8 = objc_msgSend(v7, sel_dictionaryValue);

    sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
    uint64_t v9 = sub_250C1D648();

    uint64_t v10 = sub_250C1A50C(v9);
    swift_bridgeObjectRelease();
    if (*(void *)(v10 + 16))
    {
      swift_bridgeObjectRetain();
      sub_250C1AFBC(a1, a2);
      if (v11)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250C1A50C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9950);
    uint64_t v2 = sub_250C1DBC8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v12 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5)
  {
    if (v12 > 1)
    {
      unint64_t v8 = *(void *)(a1 + 72);
      uint64_t v9 = 1;
      if (v8) {
        goto LABEL_23;
      }
      uint64_t v9 = 2;
      if (v12 <= 2) {
        goto LABEL_25;
      }
      unint64_t v8 = *(void *)(a1 + 80);
      if (v8) {
        goto LABEL_23;
      }
      uint64_t v9 = 3;
      if (v12 <= 3) {
        goto LABEL_25;
      }
      unint64_t v8 = *(void *)(a1 + 88);
      if (v8) {
        goto LABEL_23;
      }
      uint64_t v9 = 4;
      if (v12 <= 4) {
        goto LABEL_25;
      }
      unint64_t v8 = *(void *)(a1 + 96);
      if (v8)
      {
LABEL_23:
        unint64_t v7 = __clz(__rbit64(v8)) + (v9 << 6);
        goto LABEL_24;
      }
      uint64_t v10 = 5;
      if (v12 > 5)
      {
        unint64_t v8 = *(void *)(a1 + 104);
        if (!v8)
        {
          while (1)
          {
            uint64_t v9 = v10 + 1;
            if (__OFADD__(v10, 1)) {
              break;
            }
            if (v9 >= v12) {
              goto LABEL_25;
            }
            unint64_t v8 = *(void *)(a1 + 64 + 8 * v9);
            ++v10;
            if (v8) {
              goto LABEL_23;
            }
          }
          __break(1u);
          goto LABEL_27;
        }
        uint64_t v9 = 5;
        goto LABEL_23;
      }
    }
LABEL_25:
    sub_250C0AB34();
    return v2;
  }
  unint64_t v7 = __clz(__rbit64(v5));
LABEL_24:
  sub_250C1C014(*(void *)(a1 + 48) + 40 * v7, (uint64_t)&v13);
  id v14 = *(id *)(*(void *)(a1 + 56) + 8 * v7);
  id v11 = v14;
  swift_dynamicCast();
  v11;
  uint64_t result = MEMORY[0x2533846A0]();
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_250C1A96C(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9BF8);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0xD000000000000010;
  *(_OWORD *)(inited + 16) = xmmword_250C1F750;
  *(void *)(inited + 40) = 0x8000000250C22D50;
  uint64_t v5 = sub_250BE79C8(0, &qword_269AF94F8);
  sub_250C1AB30(a1);
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = sub_250C1A058();
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0x62614C7373616C63;
  *(void *)(inited + 88) = 0xEA00000000006C65;
  id v6 = (void *)sub_250C1D6A8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(self, sel_featureValueWithString_, v6);

  *(void *)(inited + 120) = v5;
  *(void *)(inited + 96) = v7;
  sub_250C0726C(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F00D38]);
  *(void *)(v2 + 16) = sub_250C1AED4();
  return v2;
}

uint64_t sub_250C1AB30(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269AF9970);
    uint64_t v2 = sub_250C1DBC8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v3 = a1 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t v17 = sub_250C1D878();
    uint64_t result = sub_250C1DA98();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      unint64_t v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v2 + 48) + 40 * v11;
    *(_OWORD *)uint64_t v12 = v25;
    *(_OWORD *)(v12 + 16) = v26;
    *(void *)(v12 + 32) = v27;
    *(void *)(*(void *)(v2 + 56) + 8 * v11) = v17;
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_250C0AB34();
    return v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_250C1AE48()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HGMLOutput()
{
  return self;
}

void sub_250C1AEA4(uint64_t *a1, uint64_t *a2)
{
}

void sub_250C1AEB0()
{
}

id sub_250C1AED4()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_250C1D638();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_250C1D128();

    swift_willThrow();
  }
  return v2;
}

unint64_t sub_250C1AFBC(uint64_t a1, uint64_t a2)
{
  sub_250C1DD78();
  sub_250C1D748();
  uint64_t v4 = sub_250C1DD98();
  return sub_250C1B284(a1, a2, v4);
}

unint64_t sub_250C1B038(unsigned __int8 a1)
{
  sub_250C1DD78();
  sub_250C1DD88();
  uint64_t v2 = sub_250C1DD98();
  return sub_250C1B368(a1, v2);
}

unint64_t sub_250C1B0A0(uint64_t a1)
{
  sub_250C1DD78();
  type metadata accessor for CFString(0);
  sub_250C1375C();
  sub_250C1D368();
  uint64_t v2 = sub_250C1DD98();
  return sub_250C1B408(a1, v2);
}

unint64_t sub_250C1B124(uint64_t a1)
{
  sub_250C1D6D8();
  sub_250C1DD78();
  sub_250C1D748();
  uint64_t v2 = sub_250C1DD98();
  swift_bridgeObjectRelease();
  return sub_250C1B534(a1, v2);
}

unint64_t sub_250C1B1B8(uint64_t a1)
{
  uint64_t v2 = sub_250C1DA98();
  return sub_250C1B6AC(a1, v2);
}

unint64_t sub_250C1B1FC(char a1)
{
  sub_250C1DD78();
  sub_250BFA4FC(a1);
  sub_250C1D748();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_250C1DD98();
  return sub_250C1B774(a1, v2);
}

unint64_t sub_250C1B284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_250C1DCF8() & 1) == 0)
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
      while (!v14 && (sub_250C1DCF8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_250C1B368(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_250C1B408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_250C1375C();
    id v7 = v6;
    char v8 = sub_250C1D358();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_250C1D358();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_250C1B534(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_250C1D6D8();
    uint64_t v8 = v7;
    if (v6 == sub_250C1D6D8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_250C1DCF8();
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
          uint64_t v13 = sub_250C1D6D8();
          uint64_t v15 = v14;
          if (v13 == sub_250C1D6D8() && v15 == v16) {
            break;
          }
          char v18 = sub_250C1DCF8();
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

unint64_t sub_250C1B6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_250C1C014(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2533848C0](v9, a1);
      sub_250C1C070((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_250C1B774(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000250C21890;
      unint64_t v8 = 0xD000000000000011;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          break;
        case 2:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1482908481;
          break;
        case 3:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1499685697;
          break;
        case 4:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1516462913;
          break;
        case 5:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x586F727947;
          break;
        case 6:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x596F727947;
          break;
        case 7:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x5A6F727947;
          break;
        case 8:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1819045714;
          break;
        case 9:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x6863746950;
          break;
        case 0xA:
          unint64_t v7 = 0xE300000000000000;
          unint64_t v8 = 7823705;
          break;
        case 0xB:
          unint64_t v7 = 0xE200000000000000;
          unint64_t v8 = 30801;
          break;
        case 0xC:
          unint64_t v7 = 0xE200000000000000;
          unint64_t v8 = 31057;
          break;
        case 0xD:
          unint64_t v7 = 0xE200000000000000;
          unint64_t v8 = 31313;
          break;
        case 0xE:
          unint64_t v7 = 0xE200000000000000;
          unint64_t v8 = 30545;
          break;
        case 0xF:
          unint64_t v8 = 0x6E696769724F7369;
          unint64_t v7 = 0xEA00000000006C61;
          break;
        default:
          unint64_t v8 = 0x6954726F736E6553;
          unint64_t v7 = 0xEF706D617473656DLL;
          break;
      }
      unint64_t v9 = 0x8000000250C21890;
      unint64_t v10 = 0xD000000000000011;
      switch(v6)
      {
        case 1:
          goto LABEL_47;
        case 2:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1482908481) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 3:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1499685697) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 4:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1516462913) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 5:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x586F727947) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 6:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x596F727947) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 7:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x5A6F727947) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 8:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1819045714) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 9:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x6863746950) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 10:
          unint64_t v9 = 0xE300000000000000;
          unint64_t v10 = 7823705;
LABEL_47:
          if (v8 == v10) {
            goto LABEL_48;
          }
          goto LABEL_49;
        case 11:
          unint64_t v9 = 0xE200000000000000;
          if (v8 != 30801) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 12:
          unint64_t v9 = 0xE200000000000000;
          if (v8 != 31057) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 13:
          unint64_t v9 = 0xE200000000000000;
          if (v8 != 31313) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 14:
          unint64_t v9 = 0xE200000000000000;
          if (v8 != 30545) {
            goto LABEL_49;
          }
          goto LABEL_48;
        case 15:
          unint64_t v9 = 0xEA00000000006C61;
          if (v8 != 0x6E696769724F7369) {
            goto LABEL_49;
          }
          goto LABEL_48;
        default:
          unint64_t v9 = 0xEF706D617473656DLL;
          if (v8 != 0x6954726F736E6553) {
            goto LABEL_49;
          }
LABEL_48:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_49:
          char v11 = sub_250C1DCF8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_250C1BBD4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v18 >= v8) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v8) {
        goto LABEL_24;
      }
      unint64_t v19 = *(void *)(v4 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v8) {
          goto LABEL_24;
        }
        unint64_t v19 = *(void *)(v4 + 8 * v10);
        if (!v19)
        {
          int64_t v10 = v18 + 3;
          if (v18 + 3 >= v8) {
            goto LABEL_24;
          }
          unint64_t v19 = *(void *)(v4 + 8 * v10);
          if (!v19)
          {
            int64_t v20 = v18 + 4;
            if (v20 >= v8)
            {
LABEL_24:
              uint64_t v21 = 1;
              goto LABEL_25;
            }
            unint64_t v19 = *(void *)(v4 + 8 * v20);
            if (!v19)
            {
              while (1)
              {
                int64_t v10 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_27;
                }
                if (v10 >= v8) {
                  goto LABEL_24;
                }
                unint64_t v19 = *(void *)(v4 + 8 * v10);
                ++v20;
                if (v19) {
                  goto LABEL_22;
                }
              }
            }
            int64_t v10 = v20;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    double v16 = *(double *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    char v17 = a2(v14, v15, v16);
    uint64_t result = swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      uint64_t v21 = 0;
LABEL_25:
      swift_release();
      return v21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_250C1BD90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v4 = (void *)sub_250C1D6A8();
  id v5 = objc_msgSend(v3, sel_featureValueForName_, v4);

  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v6 = objc_msgSend(v5, sel_dictionaryValue);

  sub_250BE79C8(0, (unint64_t *)&qword_269AF94E8);
  uint64_t v7 = sub_250C1D648();

  uint64_t v8 = sub_250C1A50C(v7);
  swift_bridgeObjectRelease();
  sub_250C1BBD4(v8, (uint64_t (*)(uint64_t, uint64_t, double))sub_250C1C00C);
  swift_bridgeObjectRelease();
  unint64_t v9 = (void *)sub_250C1D6A8();
  id v10 = objc_msgSend(v3, sel_featureValueForName_, v9);

  if (!v10)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v11 = objc_msgSend(v10, sel_stringValue);

  uint64_t v12 = sub_250C1D6D8();
  uint64_t v14 = v13;

  uint64_t v15 = *(void **)(a2 + 16);
  double v16 = (void *)sub_250C1D6A8();
  id v17 = objc_msgSend(v15, sel_featureValueForName_, v16);

  if (!v17)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v18 = objc_msgSend(v17, sel_stringValue);

  uint64_t v19 = sub_250C1D6D8();
  uint64_t v21 = v20;

  if (v12 == v19 && v14 == v21)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    sub_250C1DCF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_250C1C00C(uint64_t a1, uint64_t a2)
{
  sub_250C1A3A4(a1, a2, v2);
}

uint64_t sub_250C1C014(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_250C1C070(uint64_t a1)
{
  return a1;
}

void sub_250C1C0C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_250C1C1B8()
{
  sub_250C1DB08();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager), sel_isDeviceMotionActive);
  sub_250C1D768();
  swift_bridgeObjectRelease();
  return 0xD000000000000016;
}

void sub_250C1C268()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager];
  if ((objc_msgSend(v2, sel_isDeviceMotionActive) & 1) == 0)
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_250C1D3A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269AFCA38);
    uint64_t v4 = sub_250C1D388();
    os_log_type_t v5 = sub_250C1D938();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      aBlock[0] = v7;
      *(_DWORD *)id v6 = 136315138;
      sub_250BE1D68(0x29287472617473, 0xE700000000000000, aBlock);
      sub_250C1DA48();
      _os_log_impl(&dword_250BD9000, v4, v5, "HGBuiltinMotionDataProvider:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v7, -1, -1);
      MEMORY[0x2533853C0](v6, -1, -1);
    }

    objc_msgSend(v2, sel_setDeviceMotionUpdateInterval_, 1.0 / *(double *)&v1[OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_samplingRate]);
    uint64_t v8 = *(void *)&v1[OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_operationQueue];
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v1;
    aBlock[4] = (uint64_t)sub_250C1CBFC;
    void aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_250C1C0C4;
    aBlock[3] = (uint64_t)&block_descriptor_7;
    id v10 = _Block_copy(aBlock);
    id v11 = v1;
    swift_release();
    objc_msgSend(v2, sel_startDeviceMotionUpdatesToQueue_withHandler_, v8, v10);
    _Block_release(v10);
  }
}

void sub_250C1C4E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250C1D2F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v10 = a2;
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_250C1D3A8();
    __swift_project_value_buffer(v11, (uint64_t)qword_269AFCA38);
    id v12 = a2;
    id v13 = a2;
    long long v25 = sub_250C1D388();
    os_log_type_t v14 = sub_250C1D948();
    if (os_log_type_enabled(v25, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(void *)&v35[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      swift_getErrorValue();
      uint64_t v17 = sub_250C1DD28();
      *(void *)&long long v28 = sub_250BE1D68(v17, v18, (uint64_t *)v35);
      sub_250C1DA48();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250BD9000, v25, v14, "HGBuiltinMotionDataProviderError: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v16, -1, -1);
      MEMORY[0x2533853C0](v15, -1, -1);
    }
    else
    {

      BOOL v23 = v25;
    }
  }
  else if (a1)
  {
    id v19 = a1;
    sub_250C1D2C8();
    sub_250C1D2A8();
    double v21 = v20;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_250BFAFB4(v19, (uint64_t)&v28, v21);

    v35[4] = v32;
    v35[5] = v33;
    v36[0] = v34[0];
    *(_OWORD *)((char *)v36 + 9) = *(_OWORD *)((char *)v34 + 9);
    v35[0] = v28;
    v35[1] = v29;
    _OWORD v35[2] = v30;
    v35[3] = v31;
    sub_250C1D3E8();
    v26[4] = v32;
    v26[5] = v33;
    v27[0] = v34[0];
    *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v34 + 9);
    v26[0] = v28;
    v26[1] = v29;
    void v26[2] = v30;
    v26[3] = v31;
    nullsub_1(v26);
    uint64_t v22 = a3 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion;
    sub_250BDE95C(a3 + OBJC_IVAR____TtC12HeadGestures20HGMotionDataProvider_lastReceivedCMDeviceMotion, (uint64_t)v35);
    sub_250BDE95C((uint64_t)v26, v22);
    sub_250BF0468((uint64_t)v35);
  }
}

id sub_250C1C888()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12HeadGestures27HGBuiltinMotionDataProvider_cmMotionManager);
  id result = objc_msgSend(v1, sel_isDeviceMotionActive);
  if (result)
  {
    if (qword_269AF8F80 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_250C1D3A8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269AFCA38);
    uint64_t v4 = sub_250C1D388();
    os_log_type_t v5 = sub_250C1D938();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      sub_250BE1D68(0x2928706F7473, 0xE600000000000000, &v8);
      sub_250C1DA48();
      _os_log_impl(&dword_250BD9000, v4, v5, "HGBuiltinMotionDataProviderError:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533853C0](v7, -1, -1);
      MEMORY[0x2533853C0](v6, -1, -1);
    }

    return objc_msgSend(v1, sel_stopDeviceMotionUpdates);
  }
  return result;
}

void sub_250C1CAC4()
{
}

id sub_250C1CAD4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HGBuiltinMotionDataProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250C1CB1C()
{
  return type metadata accessor for HGBuiltinMotionDataProvider();
}

uint64_t type metadata accessor for HGBuiltinMotionDataProvider()
{
  uint64_t result = qword_269AF9C00;
  if (!qword_269AF9C00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250C1CB70()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_250C1CBC4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250C1CBFC(void *a1, void *a2)
{
  sub_250C1C4E4(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t type metadata accessor for MotionTransformerInput()
{
  return self;
}

uint64_t type metadata accessor for MotionTransformerOutput()
{
  return self;
}

uint64_t type metadata accessor for MotionTransformer()
{
  return self;
}

uint64_t sub_250C1CEA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269AF9C10);
    uint64_t v3 = sub_250C1DAE8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_250C1DD78();
      swift_bridgeObjectRetain();
      sub_250C1D748();
      uint64_t result = sub_250C1DD98();
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
        if (v17 || (uint64_t result = sub_250C1DCF8(), (result & 1) != 0))
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
          id v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_250C1DCF8();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      double v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
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
  return MEMORY[0x263F8EE88];
}

void HGSetTemporaryDirectorySuffix_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_250BD9000, log, OS_LOG_TYPE_ERROR, "Failed to set temporary directory suffix", v1, 2u);
}

uint64_t sub_250C1D088()
{
  return MEMORY[0x270EEE1A0]();
}

uint64_t sub_250C1D098()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_250C1D0A8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_250C1D0B8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_250C1D0C8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_250C1D0D8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_250C1D0E8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_250C1D0F8()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_250C1D108()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_250C1D118()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_250C1D128()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_250C1D138()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_250C1D148()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_250C1D158()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_250C1D168()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_250C1D178()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_250C1D188()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_250C1D198()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_250C1D1A8()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_250C1D1B8()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_250C1D1C8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_250C1D1D8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_250C1D1E8()
{
  return MEMORY[0x270EF00A8]();
}

uint64_t sub_250C1D1F8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_250C1D208()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_250C1D218()
{
  return MEMORY[0x270EF01B8]();
}

uint64_t sub_250C1D228()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_250C1D238()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_250C1D248()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_250C1D258()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_250C1D268()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_250C1D278()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_250C1D288()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_250C1D298()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_250C1D2A8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_250C1D2B8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_250C1D2C8()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_250C1D2D8()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_250C1D2E8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_250C1D2F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_250C1D308()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_250C1D318()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_250C1D328()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_250C1D338()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_250C1D348()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_250C1D358()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_250C1D368()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_250C1D378()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_250C1D388()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250C1D398()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_250C1D3A8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250C1D3B8()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_250C1D3C8()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_250C1D3D8()
{
  return MEMORY[0x270EE3C40]();
}

uint64_t sub_250C1D3E8()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_250C1D3F8()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_250C1D408()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_250C1D418()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_250C1D428()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_250C1D438()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_250C1D448()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_250C1D458()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_250C1D468()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_250C1D478()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_250C1D488()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_250C1D498()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_250C1D4A8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_250C1D4B8()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_250C1D4C8()
{
  return MEMORY[0x270EE3E50]();
}

uint64_t sub_250C1D4D8()
{
  return MEMORY[0x270EE3E58]();
}

uint64_t sub_250C1D4E8()
{
  return MEMORY[0x270EE3E68]();
}

uint64_t sub_250C1D4F8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_250C1D508()
{
  return MEMORY[0x270EE3E98]();
}

uint64_t sub_250C1D518()
{
  return MEMORY[0x270EE3EA8]();
}

uint64_t sub_250C1D528()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_250C1D538()
{
  return MEMORY[0x270EE3EC8]();
}

uint64_t sub_250C1D548()
{
  return MEMORY[0x270EE3EF8]();
}

uint64_t sub_250C1D558()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_250C1D568()
{
  return MEMORY[0x270EE3F30]();
}

uint64_t sub_250C1D578()
{
  return MEMORY[0x270EE3F58]();
}

uint64_t sub_250C1D588()
{
  return MEMORY[0x270EE3F68]();
}

uint64_t sub_250C1D598()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_250C1D5A8()
{
  return MEMORY[0x270EE3F98]();
}

uint64_t sub_250C1D5B8()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_250C1D5C8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_250C1D5D8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_250C1D5E8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_250C1D5F8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_250C1D608()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_250C1D618()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_250C1D628()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_250C1D638()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_250C1D648()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_250C1D658()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_250C1D668()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_250C1D678()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_250C1D688()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_250C1D698()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_250C1D6A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250C1D6B8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_250C1D6C8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_250C1D6D8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_250C1D6E8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_250C1D6F8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_250C1D708()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_250C1D718()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_250C1D728()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_250C1D738()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_250C1D748()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_250C1D758()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_250C1D768()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_250C1D778()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_250C1D788()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_250C1D798()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_250C1D7A8()
{
  return MEMORY[0x270EE4040]();
}

uint64_t sub_250C1D7B8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_250C1D7C8()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_250C1D7D8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_250C1D7E8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_250C1D7F8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_250C1D808()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_250C1D818()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_250C1D828()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_250C1D838()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_250C1D848()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_250C1D858()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_250C1D868()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_250C1D878()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_250C1D888()
{
  return MEMORY[0x270EF1C20]();
}

uint64_t sub_250C1D898()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_250C1D8A8()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_250C1D8B8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_250C1D8C8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_250C1D8D8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_250C1D8E8()
{
  return MEMORY[0x270EE78E8]();
}

uint64_t sub_250C1D8F8()
{
  return MEMORY[0x270EE7908]();
}

uint64_t sub_250C1D908()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_250C1D918()
{
  return MEMORY[0x270EF1E60]();
}

uint64_t sub_250C1D928()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_250C1D938()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_250C1D948()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250C1D958()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_250C1D968()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_250C1D978()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_250C1D988()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_250C1D998()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_250C1D9A8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_250C1D9B8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_250C1D9C8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_250C1D9D8()
{
  return MEMORY[0x270EF2150]();
}

uint64_t sub_250C1D9E8()
{
  return MEMORY[0x270EF2160]();
}

uint64_t sub_250C1D9F8()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_250C1DA08()
{
  return MEMORY[0x270EF2310]();
}

uint64_t sub_250C1DA18()
{
  return MEMORY[0x270EF2338]();
}

uint64_t sub_250C1DA28()
{
  return MEMORY[0x270EF2340]();
}

uint64_t sub_250C1DA38()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_250C1DA48()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_250C1DA58()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_250C1DA68()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_250C1DA78()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_250C1DA88()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_250C1DA98()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_250C1DAA8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_250C1DAB8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_250C1DAC8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_250C1DAD8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_250C1DAE8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_250C1DAF8()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_250C1DB08()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_250C1DB18()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_250C1DB28()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_250C1DB38()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_250C1DB48()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_250C1DB58()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_250C1DB68()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_250C1DB78()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250C1DB88()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_250C1DB98()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_250C1DBA8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_250C1DBB8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_250C1DBC8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_250C1DBD8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_250C1DBE8()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_250C1DC08()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_250C1DC18()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_250C1DC28()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_250C1DC38()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_250C1DC48()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_250C1DC58()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_250C1DC68()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_250C1DC78()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_250C1DC88()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_250C1DC98()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_250C1DCA8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_250C1DCB8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_250C1DCC8()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_250C1DCD8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_250C1DCE8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_250C1DCF8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_250C1DD08()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_250C1DD18()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_250C1DD28()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_250C1DD38()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_250C1DD48()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_250C1DD58()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_250C1DD68()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_250C1DD78()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_250C1DD88()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_250C1DD98()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_250C1DDA8()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_250C1DDB8()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_250C1DDC8()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_250C1DDD8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_250C1DDE8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x270F27B00]();
}

uint64_t e5rt_buffer_object_get_size()
{
  return MEMORY[0x270F27B10]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x270F27BC0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x270F27BF0]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x270F27BF8]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x270F27DF8]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}